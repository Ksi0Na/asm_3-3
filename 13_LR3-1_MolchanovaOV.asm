use16
org 0x100

mov di, 25
mov si, 10
mov dh, 0xA1
mov dl, 0x4B

call printer

int 20h

poz:
	mov bx, di
	mov ax, 80
	mul bl
	mov di, ax

	add di, si

	mov bx, di
	mov ax, 2
	mul bl
	mov di, ax
	
	ret
	
printer:
	mov ax, 0xb800
	mov ds, ax

	call poz
	
	mov word[ds:di], dx
	
	ret
