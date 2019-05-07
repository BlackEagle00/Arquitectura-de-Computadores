include 'emu8086.inc';

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

mov dx, offset valorX
mov ah,09h
int 21h;
call SCAN_NUM;------------->llama a la función scan_num toma el número del teclado
mov valor1,cx;------------->carga el numero a la etiqueta;

mov dx, offset valorY
mov ah,09h
int 21h;
call SCAN_NUM
mov valor2,cx


mov dx, offset texto_resul
mov ah,09h
int 21h

MOV AX,valor1
MOV BX,valor2

ADD AX,BX 

call PRINT_NUM;------------> imprimiendo en pantalla el resultado
mov ah,00;----------------->espera por una tecla en pantalla
int 16h

mov ah,00h;---------------->limpia la pantalla
mov al,03h                       
int 10h

mov dx,offset beta;-------->muestra el mensaje de salida
mov ah,09
int 21h


beta db 13,10
VALOR1 dw ?
VALOR2 dw ?;------------------------>


valorX db 13,10,13,10,10,' DIGITE EL VALOR DE X  $'
valorY db 13,10,13,10,10,' DIGITE EL VALOR DE Y  $'

texto_resul db 13,13,10,10,10,'EL RESULTADO DE LA SUMA ES: $'