 stseg segment
	db 32 dup(?)
stseg ends
;----------------
dtseg segment
org 0020h
data_in db 10h,20h,15h,25h,30h
org 0030h
data_in2 db 11h,12h,17h,18h,19h
dtseg ends
;----------------
cdseg segment
main proc far
assume cs:cdseg, ds:dtseg, ss:stseg
	mov ax,dtseg
	mov ds,ax
	mov si,offset data_in
	mov di,offset data_in2
	mov cx,06

mov_loop:       mov al,[si]
		mov bl,[di]
		mov [si],bl
		mov [di],al
		inc si
		inc di
		dec cx
		jnz mov_loop
		mov ah,4ch
		int 21h
main endp
cdseg ends
end main