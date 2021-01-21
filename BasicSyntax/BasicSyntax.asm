; --------------------------------------------------------------------------
; Section Notes
; 
; Data section is used for declaring initalize data or constants. this data does change at runtime. You can declare various constant values, file names, or buffersize.
;
; section.data:
;
; -------------------------------------------------------------------------- 
;
; Bss section is used for declaring variables.
;
; section.bss:
;
; --------------------------------------------------------------------------
;
; Text section is used for keeping actual code. This section must begin with the declaration global_start, which tells the kernel where the program execution begins.
;
; section.text:
;	global _start
; _start:
;
; --------------------------------------------------------------------------
;
; Assembly langauge states are entered one statement per line. Each statements follows the following format - 
; [label] mnemonic [operands] [;comment]
; Fields in the square bracket are optional.
;
; Following are some examples of typical assembly language statements -
;
; INC COUNT ; Incrememt the memory variable COUNT
; MOV TOTAL, 48 ; Transfer the value 48 in the memory variable TOTAL
; ADD AH, BH ; Add the content of the BH register into the AH register
; AND MASK1, 128 ; Perform AND operation on the variable MASK1 and 128
; ADD MARKS, 10 ; Add 10 to the variable MARKS
; MOV AL, 10 ; Transfer the value 10 to the AL register
;
; --------------------------------------------------------------------------

	global start 	;must be declared for linker (ld)

section .text

start:			;tells linker entry point
	mov edx,len	;message length
	mov ecx,message	;message to write
	mov ebx,1	;file descriptor (stdout)
	mov eax,4	;system call number (sys_write)
	int 0x80	;call kernal

	mov eax,1	;system call number (sys_exit)
	int 0x80	;call kernal

section .data
	message db 'Hello, world!', 0xa 	;string to be printed
	len equ $ - message 			;length of the string

