org 0x7c00
bits 16

; clear screen
mov ax, 0x3  ; set video mode ah=0 al=3
int 0x10     ; call bios

; print
xor ax, ax
mov es, ax
xor dx, dx
mov bp, msg
mov ax, 0x1301
mov bp, msg
mov bx, 0x000A
mov cx, [len]
int 0x10 ; call bios
hlt     ; halt

msg db 'Ola Mundo!'
len dw $-msg
times 510 - ($-$$) db 0
dw 0xAA55 ; boot sector magic number
