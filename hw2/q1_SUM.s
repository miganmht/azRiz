  AREA RESET, DATA, READONLY
  DCD          0    ;initial_sp
  DCD          Example;reset_vector

  AREA    MyCode, CODE, READONLY  
Example PROC
  MOV R0,#8 ; COUNT=8
  MOV R1,#0 ; SUM=0  
FOR
  ADD R1,R1,R0
  SUB R0,R0,#1
  CMP R0,#0
  BNE FOR
  BEQ ENDL

ENDL
  B ENDL

  END
