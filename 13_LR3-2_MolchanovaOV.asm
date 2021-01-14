use16
org 0x100

Value dw 0

mov [Value], ax
push ax
push dx
mov ah, 0x09
mov dx, str_ax
int 21h
pop ax
pop dx
call print

mov [Value], bx
push ax
push dx
mov ah, 0x09
mov dx, str_bx
int 21h
pop ax
pop dx
call print

mov [Value], cx
push ax
push dx
mov ah, 0x09
mov dx, str_cx
int 21h
pop ax
pop dx
call print

mov [Value], dx
push ax
push dx
mov ah, 0x09
mov dx, str_dx
int 21h
pop ax
pop dx
call print


mov [Value], cs
push ax
push dx
mov ah, 0x09
mov dx, str_cs
int 21h
pop ax
pop dx
call print

mov [Value], ss
push ax
push dx
mov ah, 0x09
mov dx, str_ss
int 21h
pop ax
pop dx
call print

mov [Value], ds
push ax
push dx
mov ah, 0x09
mov dx, str_ds
int 21h
pop ax
pop dx
call print

mov [Value], es
push ax
push dx
mov ah, 0x09
mov dx, str_es
int 21h
pop ax
pop dx
call print


mov [Value], si
push ax
push dx
mov ah, 0x09
mov dx, str_si
int 21h
pop ax
pop dx
call print

mov [Value], di
push ax
push dx
mov ah, 0x09
mov dx, str_di
int 21h
pop ax
pop dx
call print


mov [Value], sp
push ax
push dx
mov ah, 0x09
mov dx, str_sp
int 21h
pop ax
pop dx
call print

mov [Value], bp
push ax
push dx
mov ah, 0x09
mov dx, str_bp
int 21h
pop ax
pop dx
call print


pushf
pop ax
mov [Value], ax
push ax
push dx
mov ah, 0x09
mov dx, str_flags
int 21h
pop ax
pop dx
call print
mov ah, 0
int 16h
int 20h

print:
	push ax
	push cx
	push dx
	mov cl, 4

print_value:
	mov ax, [Value]
	and ax, 0xf000
	shr ax, 12
	mov dl, al
	cmp dl, 0x09
	ja m1
	add  dl, 0x30
	jmp m2
m1:
    add dl, 0x37

m2:
	mov ah, 0x2
	int 0x21
	xor dx, dx
	
	mov ax, [Value]
	shl ax, 4
	mov [Value], ax
	
loop print_value

pop ax
pop cx
pop dx

ret

str_ax: 
    db 'AX=0x', '$'
str_bx: 
    db 0xA, 0xD, 'BX=0x', '$'
str_cx: 
    db 0xA, 0xD, 'CX=0x', '$'
str_dx: 
   db 0xA, 0xD, 'DX=0x', '$'
    
str_cs: 
    db 0xA, 0xD, 'CS=0x', '$'
str_ss: 
    db 0xA, 0xD, 'SS=0x', '$'
str_ds: 
    db 0xA, 0xD, 'DS=0x', '$'
str_es: 
    db 0xA, 0xD, 'ES=0x', '$'
   
str_si: 
    db 0xA, 0xD, 'SI=0x', '$'
str_di: 
    db 0xA, 0xD, 'DI=0x', '$'
    
str_sp: 
    db 0xA, 0xD, 'SP=0x', '$'
str_bp: 
    db 0xA, 0xD, 'BP=0x', '$'
    
str_flags: 
    db 0xA, 0xD, 'FLAGS=0x', '$'