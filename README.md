# Actividad de Programación en Assembly

## Información del Proyecto

**Materia:** Arquitectura de Computadoras / Programación en Assembly  
**Fecha:** 08-10-2025  
**Integrantes:** Lautaro, Noel

---

## Descripción

Este repositorio contiene la implementación de diversos ejercicios de programación en lenguaje ensamblador, desarrollados en múltiples plataformas (DOS x86, Linux x86_64) y comparados con sus equivalentes en C. El proyecto incluye análisis comparativo, diagramas de flujo y documentación detallada del código.

**Chat de referencia:** [DeepSeek Conversation](https://chat.deepseek.com/share/0vrg05pxsbx4cz62eh)

---

## Estructura del Repositorio

```
Actividad/
├── Codigo/
│   ├── Ejercicio_X/
│   │   ├── dos_version.asm          # Versión DOS 16-bit
│   │   ├── linux_version.asm        # Versión Linux 64-bit
│   │   └── version_c.c              # Versión en C
├── Colab/
│   ├── Ejercicio_X_Nombre.ipynb     # Notebooks de Google Colab
│   └── ...
├── Diagramas/
│   └── ejercicio_X_flujo.png        # Diagramas de flujo
└── README.md
```

---

## Metodología de Trabajo

Para cada ejercicio desarrollado, se siguió el siguiente proceso:

### 1. Diagrama de Flujo
Representación gráfica del algoritmo usando:
- **Herramientas:** Dia, Draw.io, Lucidchart, o versiones online
- **Elementos:** Inicio/Fin, Decisiones, Procesos, E/S

### 2. Comentar el Código
- Explicación línea por línea de instrucciones sin comentarios
- Descripción de registros utilizados
- Justificación de decisiones de implementación

### 3. Implementación en Turbo Assembler (DOS)
```bash
# Compilación en DOS/DOSBox
tasm programa.asm
tlink programa.obj
programa.exe
```

### 4. Implementación en Linux
```bash
# Instalación de herramientas
sudo apt update
sudo apt install nasm

# Compilación para x86_64
nasm -f elf64 programa.asm -o programa.o
ld programa.o -o programa
./programa
```

### 5. Comandos de Compilación
Documentación completa de:
- Flags del compilador
- Proceso de ensamblado
- Proceso de enlazado (linking)
- Ejecución

### 6. Entrada por Teclado
Implementación de lectura de datos desde stdin:
- **DOS:** Interrupciones 21h (funciones 01h, 0Ah)
- **Linux:** Syscalls (sys_read)
- Conversión ASCII ↔ Numérico

### 7. Versión en C
Mismo algoritmo implementado en lenguaje C para comparación

### 8. Generación de Assembly desde C
```bash
# Generar código assembly con sintaxis Intel
gcc -S -masm=intel programa.c -o programa.s

# Con optimizaciones
gcc -S -masm=intel -O2 programa.c -o programa_opt.s
```

### 9. Comparación de Versiones
Análisis comparativo entre:
- Assembly manual (DOS)
- Assembly manual (Linux)
- Assembly generado por GCC
- Diferencias de eficiencia y legibilidad

### 10. Resolución de Problemas
Identificación y documentación de:
- Errores comunes
- Limitaciones de arquitectura
- Casos especiales (edge cases)
- Soluciones implementadas

---

## Ejercicios Incluidos

### Ejercicio 1: [Nombre del Ejercicio]
**Descripción breve**

**Archivos:**
- `Codigo/Ejercicio_1/`
- `Colab/Ejercicio_1_Nombre.ipynb`

---

### Ejercicio 2: [Nombre del Ejercicio]
**Descripción breve**

**Archivos:**
- `Codigo/Ejercicio_2/`
- `Colab/Ejercicio_2_Nombre.ipynb`

---

### Ejercicio 4: Verificación de Números Primos
**Descripción:** Algoritmo que determina si un número dado es primo.

**Archivos:**
- `Codigo/Numpri(Comentado).asm` - Versión DOS comentada
- `Codigo/primoc.asm` - Assembly generado desde C
- `Colab/Ejercicio_4_Verificar_Número Primo(Asembler_Linux).ipynb`
- `Colab/Ejercicio_4_Verificar_Número Primo(C_Asembler).ipynb`

**Algoritmo:**
```
Para cada divisor i desde 2 hasta n-1:
    Si n % i == 0:
        No es primo
    Fin Si
Fin Para
Es primo
```

---

## Conceptos Clave por Arquitectura

### DOS (x86 - 16 bits)

| Concepto | Detalle |
|----------|---------|
| **Modelo de memoria** | Small, Medium, Large, Huge |
| **Registros principales** | AX, BX, CX, DX (16-bit) |
| **Segmentos** | CS, DS, SS, ES |
| **Interrupciones** | INT 21h (DOS), INT 10h (BIOS) |
| **Pila** | .STACK directiva |

**Ejemplo típico:**
```assembly
.MODEL small
.STACK 100h
.DATA
    variable DW 0
.CODE
main PROC
    mov ax, @data
    mov ds, ax
    ; código
    mov ah, 4Ch
    int 21h
main ENDP
END main
```

---

### Linux (x86_64 - 64 bits)

| Concepto | Detalle |
|----------|---------|
| **Registros principales** | RAX, RBX, RCX, RDX (64-bit) |
| **Convención de llamada** | System V AMD64 ABI |
| **Syscalls** | Número en RAX, parámetros en RDI, RSI, RDX... |
| **Formato objeto** | ELF64 |

**Syscalls comunes:**
```assembly
; sys_write (1)
mov rax, 1
mov rdi, 1          ; stdout
lea rsi, [mensaje]
mov rdx, longitud
syscall

; sys_read (0)
mov rax, 0
mov rdi, 0          ; stdin
lea rsi, [buffer]
mov rdx, tamaño
syscall

; sys_exit (60)
mov rax, 60
xor rdi, rdi
syscall
```

---

## Comparación de Arquitecturas

### Diferencias Principales

| Aspecto | DOS (16-bit) | Linux (64-bit) |
|---------|--------------|----------------|
| **Tamaño de registro** | 16 bits (AX) | 64 bits (RAX) |
| **Direccionamiento** | Segmentado | Plano (flat) |
| **Llamadas al sistema** | Interrupciones (INT) | Syscalls |
| **Sintaxis NASM** | Compatible | Nativa |
| **Paso de parámetros** | Registros/Pila | Registros (RDI, RSI...) |

### Tabla de Correspondencia de Registros

| 8-bit | 16-bit | 32-bit | 64-bit |
|-------|--------|--------|--------|
| AL | AX | EAX | RAX |
| BL | BX | EBX | RBX |
| CL | CX | ECX | RCX |
| DL | DX | EDX | RDX |

---

## Problemas Comunes y Soluciones

### 1. División en Assembly

**Problema:** La instrucción `div` modifica múltiples registros.

```assembly
; DOS (16-bit)
mov dx, 0           ; Limpiar parte alta antes de dividir
mov ax, dividendo
div divisor         ; AX = cociente, DX = resto

; Linux (64-bit)
xor rdx, rdx        ; Limpiar resto
mov rax, dividendo
div divisor         ; RAX = cociente, RDX = resto
```

---

### 2. Conversión ASCII ↔ Numérico

**ASCII a número:**
```assembly
; Un dígito: '5' (ASCII 53) → 5
sub al, '0'         ; o sub al, 48

; Múltiples dígitos: "123"
; resultado = resultado * 10 + dígito
```

**Número a ASCII:**
```assembly
; 5 → '5'
add al, '0'         ; o add al, 48
```

---

### 3. Entrada/Salida por Teclado

**DOS:**
```assembly
; Leer un carácter
mov ah, 01h
int 21h             ; carácter en AL

; Leer string
mov ah, 0Ah
lea dx, buffer
int 21h
```

**Linux:**
```assembly
; Leer de stdin
mov rax, 0          ; sys_read
mov rdi, 0          ; stdin
lea rsi, [buffer]
mov rdx, 100        ; bytes a leer
syscall
```

---

### 4. Manejo de Casos Especiales

```assembly
; Ejemplo: verificar divisor por cero
cmp divisor, 0
je error_division

; Ejemplo: validar rango
cmp num, limite_inferior
jl fuera_rango
cmp num, limite_superior
jg fuera_rango
```

---

## Herramientas y Recursos

### Software Necesario

| Herramienta | Propósito | Instalación |
|-------------|-----------|-------------|
| **NASM** | Ensamblador moderno | `sudo apt install nasm` |
| **TASM** | Turbo Assembler (DOS) | Borland Turbo Assembler |
| **DOSBox** | Emulador DOS | `sudo apt install dosbox` |
| **GCC** | Compilador C | `sudo apt install gcc` |
| **GDB** | Depurador | `sudo apt install gdb` |

### Recursos Online

- **Dia/Draw.io:** Creación de diagramas de flujo
- **Google Colab:** Ejecución de código en la nube
- **OnlineGDB:** Compilador y depurador online
- **Godbolt Compiler Explorer:** Comparación de código generado

---

## Flujo de Trabajo con Git

### Configuración Inicial

```bash
# Clonar el repositorio
git clone https://github.com/Vyldrix/Actividad.git
cd Actividad

# Configurar usuario (si es necesario)
git config user.name "Tu Nombre"
git config user.email "tu@email.com"
```

### Trabajo Colaborativo

```bash
# SIEMPRE antes de empezar a trabajar
git pull origin main

# Crear nueva rama para tu ejercicio (opcional pero recomendado)
git checkout -b ejercicio-5-factorial

# Hacer cambios y guardar
git add Codigo/Ejercicio_5/
git commit -m "Agrega ejercicio 5: Cálculo de factorial"

# Subir cambios
git push origin ejercicio-5-factorial
# O directamente a main:
git push origin main
```

### Resolución de Conflictos

```bash
# Si hay conflictos al hacer pull
git pull origin main
# Editar archivos en conflicto
git add archivo_resuelto.asm
git commit -m "Resuelve conflicto en ejercicio X"
git push origin main
```

---

### Por Ejercicio

Cada ejercicio debe incluir:
- [ ] Código DOS comentado
- [ ] Código Linux funcional
- [ ] Versión en C
- [ ] Notebook de Colab
- [ ] Diagrama de flujo
- [ ] Documentación en README
- [ ] Casos de prueba

---

## Compilación Rápida

### DOS (DOSBox)
```bash
tasm programa.asm
tlink programa.obj
programa.exe
```

### Linux
```bash
nasm -f elf64 programa.asm -o programa.o
ld programa.o -o programa
./programa
```

### C
```bash
# Compilar y ejecutar
gcc programa.c -o programa
./programa

# Generar assembly
gcc -S -masm=intel programa.c -o programa.s
```

---

## Plantillas de Código

### Plantilla DOS
```assembly
.MODEL small
.STACK 100h
.DATA
    ; Variables aquí
    
.CODE
main PROC
    mov ax, @data
    mov ds, ax
    
    ; Código principal aquí
    
    mov ah, 4Ch
    int 21h
main ENDP
END main
```

### Plantilla Linux
```assembly
section .data
    ; Constantes y datos inicializados
    
section .bss
    ; Variables no inicializadas
    
section .text
global _start

_start:
    ; Código principal
    
    ; Salir
    mov rax, 60
    xor rdi, rdi
    syscall
```

---

## Conclusiones

Este proyecto demuestra:

1. **Evolución de arquitecturas:** De 16 bits segmentados a 64 bits con direccionamiento plano
2. **Diferencias entre ensambladores:** Manual vs generado por compilador
3. **Importancia del bajo nivel:** Gestión directa de registros y memoria
4. **Metodología sistemática:** Proceso estructurado para resolver problemas
5. **Trabajo colaborativo:** Uso de control de versiones y distribución de tareas

---

## Licencia

Proyecto educativo - Uso académico exclusivo

---

## Contacto y Contribuciones

Para dudas o sugerencias:
- Abrir un **Issue** en GitHub
- Crear un **Pull Request** con mejoras
- Contactar a los integrantes del equipo
