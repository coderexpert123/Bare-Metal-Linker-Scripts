ENTRY(reset_handler)
MEMORY
{
    FLASH(rx) : ORIGIN = 0x08000000, LENGTH = 1024K
    SRAM(rw) : ORIGIN = 0x20000000, LENGTH = 128K
}

ENTRY(reset_handler)

SECTIONS
{
    .isr_vector :
    {
        *(.isr_vector)
    } > FLASH

    .text :
    {
        *(.text)
        *(.rodata)
        _etext = .;
    } > FLASH

    .data :
    {
        _sdata = .;
        *(.data)
        _edata = .;
    } > SRAM AT > FLASH

    .bss :
    {
        _sbss = .;
        *(.bss)
        _ebss = .;
    } > SRAM
}
