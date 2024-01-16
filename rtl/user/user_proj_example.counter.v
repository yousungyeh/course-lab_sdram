// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32,
    parameter DELAYS=10
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);
    wire clk;
    wire rst, rst_n;

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    wire valid;

    wire sdram_cle;
    wire sdram_cs;
    wire sdram_cas;
    wire sdram_ras;
    wire sdram_we;
    wire sdram_dqm;
    wire [1:0] sdram_ba;
    wire [12:0] sdram_a;
    wire [31:0] d2c_data;
    wire [31:0] c2d_data;
    wire [3:0]  bram_mask;

    wire [22:0] ctrl_addr;
    wire ctrl_busy;
    wire ctrl_in_valid, ctrl_out_valid;

    reg ctrl_in_valid_q;
    
    reg [22:0] next_addr, saved_addr;
    wire [22:0] user_addr;
    reg next;
    wire successive;
    
    // WB MI A
    
    assign valid = wbs_stb_i && wbs_cyc_i;
    //assign ctrl_in_valid = wbs_we_i ? valid : ~ctrl_in_valid_q && valid;
    assign ctrl_in_valid = wbs_we_i ? valid : ~ctrl_in_valid_q && valid && !ctrl_busy;
    //assign wbs_ack_o = (wbs_we_i) ? ~ctrl_busy && valid : ctrl_out_valid;
    assign wbs_ack_o = (wbs_we_i) ? ~ctrl_busy && valid : ctrl_out_valid && valid && successive;
    assign bram_mask = wbs_sel_i & {4{wbs_we_i}};
    assign ctrl_addr = wbs_adr_i[22:0];

    // IO
    assign io_out = d2c_data;
    assign io_oeb = {(`MPRJ_IO_PADS-1){rst}};

    // IRQ
    assign irq = 3'b000;	// Unused

    // LA
    assign la_data_out = {{(127-BITS){1'b0}}, d2c_data};
    // Assuming LA probes [65:64] are for controlling the count clk & reset  
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
    assign rst_n = ~rst;

    always @(posedge clk) begin
        if (rst) begin
            ctrl_in_valid_q <= 1'b0;
        end
        else begin
            if (~wbs_we_i && valid && ~ctrl_busy && ctrl_in_valid_q == 1'b0)
                ctrl_in_valid_q <= 1'b1;
            else if (ctrl_out_valid || ~ctrl_busy)
                ctrl_in_valid_q <= 1'b0;
        end
    end

/*  Prefetch Address */
/*
    wire [22:0] user_addr;
	assign successive = ((last_in_addr - ctrl_addr)==4)? 1 : 0;
	assign user_addr = (next_in && valid && !wbs_we_i )? next_addr : ctrl_addr;
	
	always@(posedge clk)begin
		if(rst) begin
			next_addr <= 0;
			next_in <= 0;
			last_in_addr <= 0;
		end else begin
			next_addr <= (ctrl_in_valid && !wbs_we_i)? user_addr + 4 : next_addr;
			next_in <= (ctrl_in_valid_q)? 1 : 0;
			last_in_addr <= (ctrl_in_valid) ? user_addr : last_in_addr;
		end
	end
	*/
	
	// next pull high when controller is in IDLE(6), and able to get next address.
	assign user_addr = (next && valid && !wbs_we_i )? next_addr : ctrl_addr;
	assign successive = ((saved_addr - ctrl_addr) == 4)? 1 : 0;
	
	always@(posedge clk)begin
		if(rst) begin
			next_addr <= 0;
			next <= 0;
			saved_addr <= 0;
		end else begin
			next_addr <= (ctrl_in_valid)? user_addr + 4 : next_addr;
			next <= (ctrl_in_valid_q)? 1 : 0;
			saved_addr <= (ctrl_in_valid) ? user_addr : saved_addr;
		end
	end
		
/*  Prefetch Cache Test */
/*	reg [31:0] cache_dat_o;
	wire [31:0] sdram_dat_o;
	reg [31:0] data_cache [7:0];
	reg [22:0] saved_in_addr [7:0];
	reg [22:0] user_addr;
	wire cache_hit;
	wire out_valid, cache_out_valid;
	
	assign wbs_dat_o = (cache_hit)? cache_dat_o : sdram_dat_o;
	assign out_valid = (cache_hit)? cache_out_valid : ctrl_out_valid;
	assign user_addr = ctrl_addr;
	
	// cache hit or not
	always@(*)begin
		case (ctrl_addr)
			saved_in_addr[0]: begin
				cache_hit = 1;
				cache_dat_o = data_cache[0];
				end
			saved_in_addr[1]: begin
				cache_hit = 1;
				cache_dat_o = data_cache[1];
				end
			saved_in_addr[2]: begin
				cache_hit = 1;
				cache_dat_o = data_cache[2];
				end
			saved_in_addr[3]: begin
				cache_hit = 1;
				cache_dat_o = data_cache[3];
				end
			saved_in_addr[4]: begin
				cache_hit = 1;
				cache_dat_o = data_cache[4];
				end
			saved_in_addr[5]: begin
				cache_hit = 1;
				cache_dat_o = data_cache[5];
				end
			saved_in_addr[6]: begin
				cache_hit = 1;
				cache_dat_o = data_cache[6];
				end
			saved_in_addr[7]: begin
				cache_hit = 1;
				cache_dat_o = data_cache[7];
				end
			default: begin
				cache_hit = 0;
				end
		endcase
	end
	
	always@(posedge clk)begin
		if(rst)
			cache_out_valid <= 0;
		else begin
			cache_out_valid <= (cache_hit)? 1:0;
		end	
	end
*/

    sdram_controller user_sdram_controller (
        .clk(clk),
        .rst(rst),
        
        .sdram_cle(sdram_cle),
        .sdram_cs(sdram_cs),
        .sdram_cas(sdram_cas),
        .sdram_ras(sdram_ras),
        .sdram_we(sdram_we),
        .sdram_dqm(sdram_dqm),
        .sdram_ba(sdram_ba),
        .sdram_a(sdram_a),
        .sdram_dqi(d2c_data),
        .sdram_dqo(c2d_data),

        .user_addr(user_addr),
        .rw(wbs_we_i),
        .data_in(wbs_dat_i),
        .data_out(wbs_dat_o),
        //.data_out(sdram_dat_o),
        .busy(ctrl_busy),
        .in_valid(ctrl_in_valid),
        .out_valid(ctrl_out_valid)
    );

    sdr user_bram (
        .Rst_n(rst_n),
        .Clk(clk),
        .Cke(sdram_cle),
        .Cs_n(sdram_cs),
        .Ras_n(sdram_ras),
        .Cas_n(sdram_cas),
        .We_n(sdram_we),
        .Addr(sdram_a),
        .Ba(sdram_ba),
        .Dqm(bram_mask),
        .Dqi(c2d_data),
        .Dqo(d2c_data)
    );


endmodule

`default_nettype wire
