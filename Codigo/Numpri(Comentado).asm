.MODEL small           ; Define un modelo de memoria peque?o (c?digo y datos <64 KB)
.STACK 100h            ; Reserva 256 bytes para la pila
.DATA
    num     DW 17        ; N?mero a verificar (17)
    i       DW 2         ; Divisor inicial para la prueba de primos
    msgPrimo    DB "El numero es primo.$"      ; Mensaje para n?mero primo
    msgNoPrimo  DB "El numero NO es primo.$"   ; Mensaje para n?mero no primo

.CODE
main PROC
    mov ax, @data       ; Cargar direcci?n del segmento de datos en AX
    mov ds, ax          ; Inicializar DS para acceder a variables en .DATA

    mov ax, num         ; Poner el n?mero a verificar (17) en AX
    mov bx, i           ; Poner el divisor inicial (2) en BX

check_loop:
    cmp bx, ax          ; Comparar el divisor actual (BX) con el n?mero (AX)
    jge es_primo        ; Si BX >= AX, llegamos al final sin divisores ? es primo

    mov dx, 0           ; Limpiar DX antes de la divisi?n (necesario para div)
    mov cx, bx          ; Poner el divisor en CX
    div cx              ; AX / CX ? cociente en AX, resto en DX

    cmp dx, 0           ; Verificar si el resto es 0
    je no_primo         ; Si resto = 0, encontramos un divisor ? no es primo

    inc bx              ; Incrementar el divisor para la siguiente prueba
    mov ax, num         ; Restaurar AX con el n?mero original (div lo modifica)
    jmp check_loop      ; Volver al inicio del bucle para seguir probando

es_primo:
    mov ah, 09h         ; Funci?n de DOS para imprimir cadena terminada en '$'
    mov dx, OFFSET msgPrimo  ; Puntero al mensaje "El numero es primo"
    int 21h             ; Llamar a DOS para imprimir el mensaje
    jmp salir           ; Saltar a salida del programa

no_primo:
    mov ah, 09h
    mov dx, OFFSET msgNoPrimo  ; Puntero al mensaje "El numero NO es primo"
    int 21h             ; Llamar a DOS para imprimir el mensaje

salir:
    mov ah, 4Ch         ; Funci?n de DOS para terminar el programa
    int 21h

main ENDP
END main