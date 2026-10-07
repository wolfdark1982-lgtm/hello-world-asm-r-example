bits 64
default rel
extern InitWindow, BeginDrawing, ClearBackground, DrawText, EndDrawing, WaitTime, CloseWindow, ExitProcess
section .text
global WinMain
WinMain:
    sub rsp,40
    mov ecx, 1300
    mov edx, 1000
    lea r8,[rel .title]
    call InitWindow
    call BeginDrawing
    mov ecx,0xFFF5F5F5
    call ClearBackground
    lea rcx, [rel .msg]
    mov edx,500
    mov r8d,450
    mov r9d,50
    mov dword [rsp + 32],0xFF000000
    call DrawText
    call EndDrawing
    movsd xmm0, [rel .delay]
    call WaitTime
    call CloseWindow
    xor ecx, ecx
    add rsp,40
    call ExitProcess
section .rodata
    .title db "HelloAsm",0
    .msg   db "Hello Asm",0
    .delay dq 5.0