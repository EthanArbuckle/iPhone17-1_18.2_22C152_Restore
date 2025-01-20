@interface UIKeyboardEmojiKeyView
- (UIKeyboardEmojiCategoryUpdateDelegate)emojiKeyManager;
- (int64_t)updateToCategoryWithOffsetPercentage:(double)a3;
- (void)setEmojiKeyManager:(id)a3;
@end

@implementation UIKeyboardEmojiKeyView

- (int64_t)updateToCategoryWithOffsetPercentage:(double)a3
{
  return 0;
}

- (UIKeyboardEmojiCategoryUpdateDelegate)emojiKeyManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->emojiKeyManager);
  return (UIKeyboardEmojiCategoryUpdateDelegate *)WeakRetained;
}

- (void)setEmojiKeyManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end