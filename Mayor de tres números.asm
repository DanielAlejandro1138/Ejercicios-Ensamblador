;LENGUAJES AUTOMATAS II
;--MAYOR DE TRES NUMEROS--
;ALUMNO: Daniel Alejandro Poot Tun
.model small
.stack 64
.data
include 'emu8086.inc'

msj1 db 0ah,0dh, 'Ingrese sus tres numeros : ', '$'
msj2 db 0ah,0dh, 'Primero numero: ', '$'
msj3 db 0ah,0dh, 'Segundo numero: ', '$'
msj4 db 0ah,0dh, 'Tercer numero: ', '$'
Mayor db 0ah,0dh, 'El numero MAYOR es: ', '$'

Digito1 db 100 dup('$')
Digito2 db 100 dup('$')
Digito3 db 100 dup('$')

salto db 13,10,'',13,10,'$'
.code
inicio: 
mov bh,06
mov si,0
mov ax,@data
mov ds,ax
mov ah,09
mov dx,offset msj1
int 21h

call saltodelinea

call pedircaracter

mov Digito1,al

call saltodelinea

call pedircaracter

mov Digito2,al

call saltodelinea

call pedircaracter

mov Digito3,al

call saltodelinea

;COMPARACION DE NUMEROS 
 
  
mov ah,digito1
mov al,digito2
cmp ah,al 
ja compara-1-3 
jmp compara-2-3 
compara-1-3:
mov al,digito3 
cmp ah,al 
ja mayor1

compara-2-3:
mov ah,digito2
mov al,digito3
cmp ah,al 
ja mayor2 
jmp mayor3

 
mayor1:

call MensajeMayor 

mov dx, offset Digito1
mov ah, 9
int 21h
jmp exit

mayor2:
call MensajeMayor

mov dx, offset Digito2
mov ah, 9
int 21h
jmp exit

mayor3:
call MensajeMayor

mov dx, offset Digito3 
mov ah, 9
int 21h
jmp exit

;METODOS

MensajeMayor:
mov dx, offset Mayor
mov ah, 9
int 21h

ret
pedircaracter:
mov ah,01h
int 21h
ret

saltodelinea:
mov dx, offset salto
mov ah, 9
int 21h
ret

exit:
mov ax, 4c00h
int 21h
ends

