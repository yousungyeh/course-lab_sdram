	.file	"matmul.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/course-lab_sdram/testbench/counter_la" "matmul.c"
	.globl	__mulsi3
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	matmul
	.type	matmul, @function
matmul:
.LFB0:
	.file 1 "matmul.c"
	.loc 1 4 1
	.cfi_startproc
	.loc 1 5 2
.LBB2:
	.loc 1 5 7
.LVL0:
	.loc 1 5 20
.LBE2:
	.loc 1 4 1 is_stmt 0
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	lui	a5,%hi(.LANCHOR0)
	sw	s11,12(sp)
	.cfi_offset 27, -52
	lui	s11,%hi(.LANCHOR1)
	sw	s0,56(sp)
	sw	s4,40(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	ra,60(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s5,36(sp)
	sw	s8,24(sp)
	sw	s9,20(sp)
	sw	s10,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 20, -24
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 21, -28
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	addi	s7,a5,%lo(.LANCHOR0)
	addi	s4,s11,%lo(.LANCHOR1)
.LBB12:
.LBB3:
	.loc 1 7 12
	li	s6,0
	addi	s0,a5,%lo(.LANCHOR0)
.LVL1:
.L2:
	.loc 1 7 21 is_stmt 1
	addi	s5,s0,64
.LBB4:
	.loc 1 9 8 is_stmt 0
	mv	s3,s4
.LBE4:
	.loc 1 7 12
	li	s2,0
	j	.L6
.LVL2:
.L3:
.LBB8:
.LBB5:
	.loc 1 12 5 is_stmt 1 discriminator 3
	.loc 1 12 27 is_stmt 0 discriminator 3
	lw	a1,0(s10)
	lw	a0,0(s9)
	.loc 1 10 28 discriminator 3
	addi	s1,s1,1
.LVL3:
	.loc 1 10 22 discriminator 3
	addi	s9,s9,4
	.loc 1 12 27 discriminator 3
	call	__mulsi3
.LVL4:
	.loc 1 10 22 discriminator 3
	li	a5,4
	.loc 1 12 9 discriminator 3
	add	s8,s8,a0
.LVL5:
	.loc 1 10 28 is_stmt 1 discriminator 3
	.loc 1 10 22 discriminator 3
	addi	s10,s10,16
	li	a4,16
	bne	s1,a5,.L3
.LBE5:
	.loc 1 14 4 discriminator 2
	.loc 1 14 24 is_stmt 0 discriminator 2
	sw	s8,0(s3)
.LBE8:
	.loc 1 7 27 is_stmt 1 discriminator 2
	addi	s2,s2,1
.LVL6:
	.loc 1 7 21 discriminator 2
	addi	s3,s3,4
	addi	s5,s5,4
	beq	s2,s1,.L4
.LVL7:
.L6:
.LBB9:
.LBB6:
	.loc 1 10 22
.LBE6:
.LBE9:
.LBE3:
.LBE12:
	.loc 1 4 1 is_stmt 0
	mv	s10,s5
	mv	s9,s7
.LBB13:
.LBB11:
.LBB10:
.LBB7:
	.loc 1 10 13
	li	s1,0
.LBE7:
	.loc 1 9 8
	li	s8,0
	j	.L3
.LVL8:
.L4:
.LBE10:
.LBE11:
	.loc 1 5 26 is_stmt 1 discriminator 2
	.loc 1 5 20 discriminator 2
	addi	s6,s6,4
	addi	s7,s7,16
	addi	s4,s4,16
	bne	s6,a4,.L2
.LBE13:
	.loc 1 17 2
	.loc 1 18 1 is_stmt 0
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	lw	s1,52(sp)
	.cfi_restore 9
.LVL9:
	lw	s2,48(sp)
	.cfi_restore 18
.LVL10:
	lw	s3,44(sp)
	.cfi_restore 19
	lw	s4,40(sp)
	.cfi_restore 20
	lw	s5,36(sp)
	.cfi_restore 21
	lw	s6,32(sp)
	.cfi_restore 22
	lw	s7,28(sp)
	.cfi_restore 23
	lw	s8,24(sp)
	.cfi_restore 24
.LVL11:
	lw	s9,20(sp)
	.cfi_restore 25
	lw	s10,16(sp)
	.cfi_restore 26
	addi	a0,s11,%lo(.LANCHOR1)
	lw	s11,12(sp)
	.cfi_restore 27
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	matmul, .-matmul
	.globl	result
	.globl	B
	.globl	A
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	A, @object
	.size	A, 64
A:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.type	B, @object
	.size	B, 64
B:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	result, @object
	.size	result, 64
result:
	.zero	64
	.text
.Letext0:
	.file 2 "matmul.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xf0
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.4byte	.LASF4
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL8
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x5
	.4byte	0x3d
	.4byte	0x36
	.byte	0x6
	.4byte	0x36
	.byte	0xf
	.byte	0
	.byte	0x7
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.string	"A"
	.byte	0x5
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0x3
	.string	"B"
	.byte	0xa
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	B
	.byte	0x9
	.4byte	.LASF3
	.byte	0x2
	.byte	0xf
	.byte	0x6
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	result
	.byte	0xa
	.4byte	.LASF5
	.byte	0x1
	.byte	0x3
	.byte	0x2b
	.4byte	0xe4
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xe4
	.byte	0x1
	.4byte	.LLRL0
	.byte	0x2
	.string	"i"
	.byte	0x5
	.byte	0xb
	.4byte	0x3d
	.4byte	.LLST1
	.byte	0x1
	.4byte	.LLRL2
	.byte	0x2
	.string	"j"
	.byte	0x7
	.byte	0xc
	.4byte	0x3d
	.4byte	.LLST3
	.byte	0x1
	.4byte	.LLRL4
	.byte	0x2
	.string	"sum"
	.byte	0x9
	.byte	0x8
	.4byte	0x3d
	.4byte	.LLST5
	.byte	0x1
	.4byte	.LLRL6
	.byte	0x2
	.string	"k"
	.byte	0xa
	.byte	0xd
	.4byte	0x3d
	.4byte	.LLST7
	.byte	0xb
	.4byte	.LVL4
	.4byte	0xea
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x4
	.4byte	0x3d
	.byte	0xd
	.4byte	.LASF6
	.4byte	.LASF6
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST1:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL10
	.byte	0x1
	.byte	0x62
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL7
	.byte	0x1
	.byte	0x68
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL8
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LVL11
	.byte	0x1
	.byte	0x68
	.byte	0
.LLST7:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL5
	.byte	0x3
	.byte	0x79
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL7
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL8
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LVL9
	.byte	0x1
	.byte	0x59
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL0:
	.byte	0x6
	.4byte	.LBB2
	.4byte	.LBE2
	.byte	0x6
	.4byte	.LBB12
	.4byte	.LBE12
	.byte	0x6
	.4byte	.LBB13
	.4byte	.LBE13
	.byte	0
.LLRL2:
	.byte	0x6
	.4byte	.LBB3
	.4byte	.LBE3
	.byte	0x6
	.4byte	.LBB11
	.4byte	.LBE11
	.byte	0
.LLRL4:
	.byte	0x6
	.4byte	.LBB4
	.4byte	.LBE4
	.byte	0x6
	.4byte	.LBB8
	.4byte	.LBE8
	.byte	0x6
	.4byte	.LBB9
	.4byte	.LBE9
	.byte	0x6
	.4byte	.LBB10
	.4byte	.LBE10
	.byte	0
.LLRL6:
	.byte	0x6
	.4byte	.LBB5
	.4byte	.LBE5
	.byte	0x6
	.4byte	.LBB6
	.4byte	.LBE6
	.byte	0x6
	.4byte	.LBB7
	.4byte	.LBE7
	.byte	0
.LLRL8:
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"unsigned int"
.LASF4:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -Os -ffreestanding"
.LASF6:
	.string	"__mulsi3"
.LASF3:
	.string	"result"
.LASF5:
	.string	"matmul"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"matmul.c"
.LASF1:
	.string	"/home/ubuntu/course-lab_sdram/testbench/counter_la"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
