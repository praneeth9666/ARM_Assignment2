    PRESERVE8 
    THUMB 
    AREA    |.text|,CODE,READONLY 
    EXPORT __main 
    ENTRY 
__main    FUNCTION 
;SINE	
		VLDR.F32 S13,=3.14592 ;Storing Pi value
		VLDR.F32 S14,=180 ; Storing 180 degress
		MOV R4,#30;Angle in degrees
		VMOV.F32 S0,R4; 
        VCVT.F32.U32 S0, S0;
		VMUL.F32 S0,S0, S13
		VDIV.F32 S0,S0, S14 ;Converted angle into radians
		MOV R1,#10;Number of iterations or number of elements in the series
		MOV R2,#0;Counter	
		VLDR.F32 S7,=1.0; counter in float
		VMOV.F32 S1,S0; temp variables
		VMOV.F32 S10,S0; First element of sinx is x
		VMOV.F32 S6,#-1.0;constants
		VLDR.F32 S8,=2.0;
		VLDR.F32 S9,=1.0;
		
		
loop1	VMUL.F32 S3,S1,S6; multiplying x with -1
		VMUL.F32 S3,S3,S0;	multiplying with x^2
		VMUL.F32 S3,S3,S0;
		VMUL.F32 S4,S7,S8; taking only odd multiple of counter
		VADD.F32 S5,S4,S9;
		VMUL.F32 S4,S4,S5;	
		VDIV.F32 S1,S3,S4;	Each elelement of the series
		VADD.F32 S10,S10,S1;	Sum of the whole series iterating
		VADD.F32 S7,S7,S9; Updating the counter
		ADD R2,R2,#1;
		CMP R1,R2;
		BNE loop1 
		
		
;COSINE

		MOV R2,#0;Counter
		VLDR.F32 S7,=1.0;temp variables and constants
		VMOV.F32 S1,S7;
		VMOV.F32 S11,S7;
		
		
		
loop2	VMUL.F32 S3,S1,S6; multiplying x with -1
		VMUL.F32 S3,S3,S0;	multiplying with x^2
		VMUL.F32 S3,S3,S0;
		VMUL.F32 S4,S7,S8; taking only odd multiple of counter
		VSUB.F32 S5,S4,S9;
		VMUL.F32 S4,S4,S5;
		VDIV.F32 S1,S3,S4; Each elelement of the series
		VADD.F32 S11,S11,S1; Sum of the whole series iterating
		VADD.F32 S7,S7,S9; Updating the counter
		ADD R2,R2,#1;
		CMP R1,R2;
		BNE loop2
		
		VDIV.F32 S0,S10,S11; Final value of tan 
		
Stop B Stop ; Stop program
     ENDFUNC
	 END
