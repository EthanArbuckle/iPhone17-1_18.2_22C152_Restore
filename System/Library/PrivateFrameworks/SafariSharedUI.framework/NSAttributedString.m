@interface NSAttributedString
@end

@implementation NSAttributedString

uint64_t __107__NSAttributedString_SafariSharedUIExtras__safari_attributedStringByReplacingAttributeName_withAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *(void *)(a1 + 40), a3, a4);
  if (a2)
  {
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 48);
    return objc_msgSend(v9, "addAttributes:range:", v10, a3, a4);
  }
  return result;
}

@end