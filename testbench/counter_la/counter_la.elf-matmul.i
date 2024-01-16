# 0 "matmul.c"
# 1 "/home/ubuntu/course-lab_sdram/testbench/counter_la//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "matmul.c"
# 1 "matmul.h" 1




 int A[4*4] = {0, 1, 2, 3,
   0, 1, 2, 3,
   0, 1, 2, 3,
   0, 1, 2, 3,
 };
 int B[4*4] = {1, 2, 3, 4,
  5, 6, 7, 8,
  9, 10, 11, 12,
  13, 14, 15, 16,
 };
 int result[4*4];
# 2 "matmul.c" 2

int *__attribute__((section(".mprjram"))) matmul()
{
 for (int i = 0; i < 4; i++)
 {
  for (int j = 0; j < 4; j++)
  {
   int sum = 0;
   for (int k = 0; k < 4; k++)
   {
    sum += A[(i * 4) + k] * B[(k * 4) + j];
   }
   result[(i * 4) + j] = sum;
  }
 }
 return result;
}
