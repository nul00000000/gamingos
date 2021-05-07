.global _start
_start:
    ljmp 0x07C0, $_start1

_start1:
    movw %cs, %ax
    movw %ax, %es
    movw %ax, %ds
    movw %ax, %es
    movw %ax, %ss
    movw $STACK /*TODO*/, %sp

    /*TODO save drive no?*/

print:
    xorb %bh, %bh

    movb $0x0E, %ah
    lodsb

    /*NULL check*/
    cmpb $0, %al
    je 1f

    /* print %al to screen */
    int $0x10
    jmp print

1: ret

hello:
    .asciz "fucking hell at&t\n"