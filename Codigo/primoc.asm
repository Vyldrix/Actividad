.file   "primo.c"
    .text
    .section    .rodata
.LC0:
    .string "El numero NO es primo"
.LC1:
    .string "El numero es primo"
    .text
    .globl  main
    .type   main, @function
main:
.LFB0:
    .cfi_startproc
    endbr64
    pushq   %rbp
    .cfi_def_cfa_offset 16
    .cfi_offset 6, -16
    movq    %rsp, %rbp
    .cfi_def_cfa_register 6
    subq    $16, %rsp
    movq    $17, -8(%rbp)
    movq    $2, -16(%rbp)
    cmpq    $1, -8(%rbp)
    jg  .L4
    leaq    .LC0(%rip), %rax
    movq    %rax, %rdi
    call    puts@PLT
    movl    $0, %eax
    jmp .L3
.L6:
    movq    -8(%rbp), %rax
    cqto
    idivq   -16(%rbp)
    movq    %rdx, %rax
    testq   %rax, %rax
    jne .L5
    leaq    .LC0(%rip), %rax
    movq    %rax, %rdi
    call    puts@PLT
    movl    $0, %eax
    jmp .L3
.L5:
    addq    $1, -16(%rbp)
.L4:
    movq    -16(%rbp), %rax
    cmpq    -8(%rbp), %rax
    jl  .L6
    leaq    .LC1(%rip), %rax
    movq    %rax, %rdi
    call    puts@PLT
    movl    $0, %eax
.L3:
    leave
    .cfi_def_cfa 7, 8
    ret
    .cfi_endproc
.LFE0:
    .size   main, .-main
    .ident  "GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0"
    .section    .note.GNU-stack,"",@progbits
    .section    .note.gnu.property,"a"
    .align 8
    .long   1f - 0f
    .long   4f - 1f
    .long   5
0:
    .string "GNU"
1:
    .align 8
    .long   0xc0000002
    .long   3f - 2f
2:
    .long   0x3
3:
    .align 8
4: