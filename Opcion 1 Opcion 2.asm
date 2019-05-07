org 100h ; inicio de programa
include 'emu8086.inc' ;

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS




Menu: 
    mov ah,0 
    mov al,3h ;modo texto 
    int 10h 
    
    mov ax,0600h ;limpiar pantalla 
    mov bh,0fh ;0 color de fondo negro, f color de letra blanco 
    mov cx,0000h 
    mov dx,184Fh 
    int 10h 
    
    mov ah,02h 
    mov bh,00 
    mov dh,00 
    mov dl,00 
    int 10h 
    
    mov dx,mostrarMenu ;nombre del mensaje 
    mov ah,09 
    int 21h 
    
    mov ah,08 ;pausa y captura de datos 
    int 21h 
    
    cmp al,49 ; ascii 49 =1 suma
    je op1 
    
    cmp al,50 ;compara con opcion 2 resta
    je op2 
    
    cmp al,109 ;salir 
    je op3 



mostrarMenu:
         db 'CORPORACION UNIVERSITARIA MINUTO DE DIOS',13,10,10 
         db 'FACULTAD DE INGENIERIA',13,10,10 
         db 'INGENIERIA DE SISTEMAS',13,10,10 
         db 'ARQUITECTURA DE COMPUTADORES',13,10,10 
         db '-.-.MENU.-.-',13,10,13,10 
         db '1. Operacion 1 ',13,10,10 
         db '2. Operacion 2 ',13,10,10 
         db '3. SALIR PRESIONE m ',13,10,10
         db 'SELECCIONAR UNA OPCION $',13,10    
         
         
op1: ;MULTIPLICACION  

    mov dx, offset valorA;-->digite PRIMER NUMERO
    mov ah,09h
    int 21h;
    call SCAN_NUM;------------->llama a la funcion scan_num qtoma el numero del teclado y lo guardaen ax
    mov valor1,cx;------------->carga el numero a la variable;
    
    mov dx, offset valorB;-->digite el SEGUNDO NUMERO
    mov ah,09h
    int 21h;
    call SCAN_NUM
    mov valor2,cx   
    
    mov dx, offset valorC;-->digite el TERCER NUMERO
    mov ah,09h
    int 21h;
    call SCAN_NUM
    mov valor3,cx
    
    mov dx, offset texto_resul
    mov ah,09h
    int 21h
    
    
    mov ax, valor1
    mov bx, valor2
    mov cx, valor3
          
    mul bx     
    mul cx    
    
    
    call PRINT_NUM;------------> imprimiendo en pantalla el resultado
    mov ah,00;----------------->espera por una tecla en pantalla
    int 16h
    mov ah,00h;---------------->limpia la pantalla
    mov al,03h                       
    
    int 10h
    mov dx,offset beta;-------->muestra el mensaje de salida
    mov ah,09
    int 21h
    jmp Menu         
     

op2: ; SUMA

    mov dx, offset valorA;-->digite PRIMER NUMERO
    mov ah,09h
    int 21h;
    call SCAN_NUM;------------->llama a la funcion scan_num qtoma el numero del teclado y lo guardaen ax
    mov valor1,cx;------------->carga el numero a la variable;
    
    mov dx, offset valorB;-->digite el SEGUNDO NUMERO
    mov ah,09h
    int 21h;
    call SCAN_NUM
    mov valor2,cx   
    
    mov dx, offset valorC;-->digite el TERCER NUMERO
    mov ah,09h
    int 21h;
    call SCAN_NUM
    mov valor3,cx
    
    mov dx, offset texto_resul
    mov ah,09h
    int 21h
    
    
    mov ax, valor1
    mov bx, valor2
    mov cx, valor3
    
    mul cx
    mul bx    
    
    
    call PRINT_NUM;------------> imprimiendo en pantalla el resultado
    mov ah,00;----------------->espera por una tecla en pantalla
    int 16h
    mov ah,00h;---------------->limpia la pantalla
    mov al,03h                       
    
    int 10h
    mov dx,offset beta;-------->muestra el mensaje de salida
    mov ah,09
    int 21h
    jmp Menu        


             
op3: ;salida 
Salida:

RET

volver   db ' ',13,10,13,10 
 db 'presione "Esc" para volver a menu$' 


beta db 13,10
valor1 dw ?
valor2 dw ?
valor3 dw ?

 

valorA db 13,13,10,10,'DIGITE EL VALOR DE A  $'
valorB db 13,13,10,10,'DIGITE EL VALOR DE B  $'  
valorC db 13,13,10,10,'DIGITE EL VALOR DE C  $'

texto_resul db 13,13,1,10,10,'EL RESULTADO DE LA OPERACION ES: $'