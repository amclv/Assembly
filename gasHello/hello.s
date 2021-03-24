.section  __DATA,__data
str:
  .asciz  "Hello world!\n"

.section  __TEXT,__text

.globl  start

start:
  movl  $0x02000004,%eax
  movl  $1,%edi
  movq  str@GOTPCREL(%rip),%rsi
  movq  $100,%rdx
  syscall

  movl $0,%ebx
  movl $0x02000001,%eax
  syscall
