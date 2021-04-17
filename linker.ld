/* bootloader will look here and start exec. */
ENTRY(_start)

/* tell where sections of object files are, will be put in final kernel image */
SECTIONS
{
    /* begin sections at 1M */
    . = 1M;

    /* put the multiboot header, it will be required to be put very, very early in the image */
    .text BLOCK(4K) : ALIGN(4K)
    {
        *(.multiboot)
        *(.text)
    }

    /* read-only data */
    .rodata BLOCK(4K) : ALIGN(4K)
    {
        *(.rodata)
    }

    /* read-write data */
    .data BLOCK(4K) : ALIGN(4K)
    {
        *(.data)
    }

    /* read-write data (un init.) and stack */
    .bss BLOCK(4K) : ALIGN(4K)
    {
        *(COMMON)
        *(.bss)
    }

    /* compiler may produce other sections, by def. they will be put into a
     segment with the same name */
}
