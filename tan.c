#include <stdio.h>
#include <math.h>
#define PI 3.14159265


float sine(int n,float x)
{
	// x=x*PI/180;
    float t=x;
    float sum=x;
	for(int i=1;i<=n;i++)
    {
        t=(t*(-1)*x*x)/(2*i*(2*i+1));
        sum=sum+t;
    }
    return sum;
}

float cosine(int n,float x)
{
	float  sum=1, t=1;
     
    // x=x*PI/180;
     
    /* Loop to calculate the value of Cosine */
    for(int i=1;i<=n;i++)
    {
        t=t*(-1)*x*x/(2*i*(2*i-1));
        sum=sum+t;
    }
    return sum;
}

float tang(int n,float x)
{
	return (sine(n,x)/cosine(n,x));
}

int main()
{
	int n;
	float x;
	printf(" Enter x value: ");
    scanf("%f",&x);
     
    printf(" Enter n value : ");
    scanf("%d",&n);
	printf("tan(x)= %f",tang(n,x));
	return 0;
}