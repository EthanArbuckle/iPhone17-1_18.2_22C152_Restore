@interface NSMutableAttributedString(UIKitAdditions)
- (uint64_t)_ui_restoreOriginalFontAttributes;
@end

@implementation NSMutableAttributedString(UIKitAdditions)

- (uint64_t)_ui_restoreOriginalFontAttributes
{
  uint64_t v2 = *(void *)off_1E52D21A0;
  uint64_t v3 = [a1 length];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__NSMutableAttributedString_UIKitAdditions___ui_restoreOriginalFontAttributes__block_invoke;
  v5[3] = &unk_1E52D9A30;
  v5[4] = a1;
  return objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v2, 0, v3, 0x100000, v5);
}

@end