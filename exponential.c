#include <stdio.h>

float exponential(int n, float x) 
{ 
    float sum = 1.0f; // initialize sum of series 
  
    for (int i = n - 1; i > 0; --i ) 
        sum = 1 + x * sum / i; 
  
    return sum; 
} 
  
int main() 
{ 
    	int n ;
	printf("Enter the value of N:");
	scanf("%d",&n);
	printf("N=%d\n",n);
	printf("Enter the value of x:");	 
    	float x ;
    	scanf("%f",&x);
	printf("x=%f\n",x);			 
    	printf("e^x = %f", exponential(n, x)); 
    	return 0; 
} 
