@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

uint64_t __78__NSMutableAttributedString_UIKitAdditions___ui_restoreOriginalFontAttributes__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(void *)off_1E52D2040, a2, a3, a4);
  }
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)off_1E52D21A0;
  return objc_msgSend(v7, "removeAttribute:range:", v8, a3, a4);
}

@end