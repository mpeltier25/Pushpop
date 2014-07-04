org 100h
jmp START

myStack db 8 dup (?)	
_myStackSize equ 8		

START:
mov si, _myStackSize	;si holds size of myStack

mov dh, '1'				;move '1' (which is ascii 31) to dh
mov cx,5				;Wish to execute loop body 5 times (must use cx with loop command)
PUSH_LOOP:
	
    ;push myStack
	dec myStack[0];change si so myStack[si] is the new top of myStack
    mov myStack[0],dh   ;mov dh to the new top of myStack
	inc dh				
	loop PUSH_LOOP		;dec cx		jnz PUSH_LOOP

mov cx,5          
POP_LOOP:				;Wish to execute loop body 5 times (must use cx with loop command)
	
	;pop myStack
	mov dl,myStack[0]	;mov (ie copy) the top element of myStack to dl
    dec myStack[0];change si so myStack[si] is the new top of myStack
	mov ah, 02h			;Send rv
	int 21h				;to screen
	
	;Advance screen to new print line
	mov ah, 02h
	mov dl,0Dh
	int 21h
	mov dl,0Ah
	int 21h 
	loop POP_LOOP    ;dec cx		jnz PUSH_LOOP      

ret                                 