   AREA RESET, DATA, READONLY
   DCD          0    ;initial_sp
   DCD          Example;reset_vector
   AREA SA,DATA,READWRITE
SS SPACE 0x18           ; 6 word az stack ro baramun reserve mikone

   AREA program,CODE,READONLY
Example
	  LDR R5, =SS
      ADD R5, R5,#0x00000018  ; baraye handel krdn decending
      MOV SP, R5		; adress aval stack
      MOV R0,#0x12      ; input , dec:18 , bin:00010010
      MOV R3,#1         ; counter for 
	  
FOR1  CMP R3,#32        ; 32 bar tekrar baraye 32 bit input
	  BGT ENDFOR1       ; bastn for agar R3>32 
	  MOVS R0,R0,LSR #1 ; logical shift right va set kardan carry(S)
      ADDCS R1,R1,#1    ; R1++ agar carry=1 (CS) , R1 tedad 1 
      ADDCC R2,R2,#1    ; R2++ agar carry=0 (CC) , R2 tedad 0
      ADD R3,R3,#1      ; R3++  
      B FOR1
ENDFOR1
	  BL MYFUNC	  
	  
finish
	  B finish  
	  
MYFUNC
	  ;PUSH {R1,R2,LR}   ; push to stack
	  STR R1, [SP]
	  STR R2, [SP, #-4]
	  STR LR, [SP, #-8]
	  MOV R4,#3         ; R4=3
	  MUL R2,R1,R4      ; R2=R1*R4
	  MOV R4,#100		; R4=100
	  SUB R3,R4,R2		; R3=R4-R2
	  ;POP {R1,R2,PC}	; pop az stack
	  LDR R1, [SP]
	  LDR R2, [SP, #-4]
	  LDR PC, [SP, #-8]
      END