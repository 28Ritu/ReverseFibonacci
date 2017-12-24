#include<stdio.h>
int Fibonnaci(int);

int main()
{
  int N;
  scanf("%d", &N);
  int fib=Fibonacci(N);
  //printf("%d", fib);
  int reverse=0, digit;
  while (fib!=0)                // reverses the fibonacci number recieved
  {
    digit=fib%10;
    reverse=reverse*10+digit;
    fib=fib/10;
  }
  printf("%d\n", reverse);
  return 0;
}

int Fibonacci(int N)           // function to calculate Nth fibonacci number
{
  if (N==0 || N==1)
     return 0;
  else if (N==2)
     return 1;
  else
     return Fibonacci(N-1)+Fibonacci(N-2);
}
