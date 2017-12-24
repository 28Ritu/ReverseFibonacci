@Open The Input File

ldr r0,=InFileName
mov r1, #0
swi 0x66
ldr r1,=InFileHandle
str r0, [r1]

@ Read size from the file

ldr r0,=InFileHandle
ldr r0, [r0]
swi 0x6c
mov r6, r0     @ nth number
mov r7, r6
sub r7, r7, #2

mov r2, #0     @ fib(1)=0
mov r3, #1     @ fib(2)=1
mov r4, #0     @ nth fibonacci number
b test1

FIB: cmp r7, #0
     ble end3
     add r4, r3, r2
     mov r2, r3
     mov r3, r4     
     sub r7, r7, #1
     b FIB

test1: cmp r6, #1
       beq end1
       bne test2

test2: cmp r6, #2
       beq end2
       bne FIB

end1: mov r0, #1
      mov r1, r2
      swi 0x6b
      swi 0x11

end2: mov r0, #1
      mov r1, r3
      swi 0x6b
      swi 0x11

end3: mov r2, #0             @ digit
      mov r3, #0             @ reverse
      mov r5, #0x19000000
      orr r5, r5, #0x00990000
      orr r5, r5, #0x00009900
      orr r5, r5, #0x0000009A
      mov r6, #10 
      b loop1

loop1: cmp r4, #0
       beq exit
       umull r2, r7, r4, r5  @ r2 contains 1's digit in fractional form after performing r4*r5, r7 is the quotient
       umull r9 ,r8, r2, r6  @ r8 contains 1's digit
       mov r0, #1
       mov r1, r8
       swi 0x6b
       mov r4, r7
       b loop1

exit: swi 0x11

.data
InFileName: .asciz "Input.txt"  @ input file name
InFileHandle: .word 0
