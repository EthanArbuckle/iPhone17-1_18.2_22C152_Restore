@interface UILabelAttributedStringContent
@end

@implementation UILabelAttributedStringContent

void __59___UILabelAttributedStringContent_labelViewTextAttachments__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __69___UILabelAttributedStringContent_intelligenceLightAttributedStrings__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)off_1E52D2048;
  if (a2) {
    id v3 = *(void **)(a1 + 32);
  }
  else {
    id v3 = *(void **)(a1 + 40);
  }
  id v4 = +[UIColor clearColor];
  objc_msgSend(v3, "addAttribute:value:range:", v2);
}

@end