    PRESERVE8 
    THUMB 
    AREA    |.text|,CODE,READONLY 
    EXPORT __main 
    ENTRY 
__main    FUNCTION 
		MOV R0,#10;Number of terms in the seires
        MOV R1,#1;counter 
        VLDR.F32 S0,=1;Value of e in every iteration 
        VLDR.F32 S1,=1;temp variable 
        VLDR.F32 S2,=3;value of x 
LOOP1   CMP R1,R0;Compare counter and N  
        BLE LOOP;if the neg flag is set then loop
        B stop;else stop 
LOOP    VMUL.F32 S1,S1, S2; t = t*x 
        VMOV.F32 S5,R1; 
        VCVT.F32.U32 S5, S5;
        VDIV.F32 S1,S1,S5; 
        VADD.F32 S0,S0,S1;
        ADD R1,R1,#1;
        B LOOP1; 
stop    B stop 
        ENDFUNC 
        END		
