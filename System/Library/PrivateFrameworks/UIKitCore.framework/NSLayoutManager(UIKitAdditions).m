@interface NSLayoutManager(UIKitAdditions)
- (void)ui_enumerateTextBlocksInGlyphRange:()UIKitAdditions usingBlock:;
@end

@implementation NSLayoutManager(UIKitAdditions)

- (void)ui_enumerateTextBlocksInGlyphRange:()UIKitAdditions usingBlock:
{
  id v8 = a5;
  v9 = [a1 textStorage];
  uint64_t v10 = *(void *)off_1E52D21B8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__NSLayoutManager_UIKitAdditions__ui_enumerateTextBlocksInGlyphRange_usingBlock___block_invoke;
  v12[3] = &unk_1E52FE598;
  id v13 = v8;
  id v11 = v8;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, a3, a4, 0, v12);
}

@end