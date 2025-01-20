@interface PXCTStringIsSuitableForVerticalLayout
@end

@implementation PXCTStringIsSuitableForVerticalLayout

void ___PXCTStringIsSuitableForVerticalLayout_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  v9 = objc_msgSend((id)_PXCTStringIsSuitableForVerticalLayout_forbiddenCharactersRegex, "firstMatchInString:options:range:", *(void *)(a1 + 32), 0, a3, a4);

  if (v9)
  {
    *a7 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void ___PXCTStringIsSuitableForVerticalLayout_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"[  \\p{Hang}]+" options:2 error:0];
  v1 = (void *)_PXCTStringIsSuitableForVerticalLayout_forbiddenCharactersRegex;
  _PXCTStringIsSuitableForVerticalLayout_forbiddenCharactersRegex = v0;
}

@end