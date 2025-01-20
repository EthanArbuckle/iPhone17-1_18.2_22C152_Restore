@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

uint64_t __91__NSMutableAttributedString_IC_UI__ic_addForegroundColorInRangesWhereNoColorAlreadyExists___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return objc_msgSend(*(id *)(result + 32), "addIndexesInRange:");
  }
  return result;
}

uint64_t __91__NSMutableAttributedString_IC_UI__ic_addForegroundColorInRangesWhereNoColorAlreadyExists___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E4FB0700], *(void *)(a1 + 40), a2, a3);
}

uint64_t __85__NSMutableAttributedString_ICTableAdditions__ic_convertParagraphStyleToBodyInRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t isKindOfClass = a2;
  if (isKindOfClass)
  {
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      v8 = (void *)MEMORY[0x1E4F83220];
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4F83220], a3, a4);
      uint64_t isKindOfClass = objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *v8, *(void *)(a1 + 40), a3, a4);
    }
  }
  return MEMORY[0x1F41817F8](isKindOfClass);
}

@end