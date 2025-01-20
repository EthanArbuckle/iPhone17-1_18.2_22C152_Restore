@interface UIKeyboardEmoji
+ (BOOL)shouldHighlightEmoji:(id)a3;
+ (id)emojiWithString:(id)a3 withVariantMask:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromEmojiSearch;
- (BOOL)isFromRecentsCategory;
- (BOOL)supportsSkinToneVariants;
- (NSString)emojiString;
- (UIKeyboardEmoji)initWithString:(id)a3 withVariantMask:(unint64_t)a4;
- (unint64_t)variantMask;
- (void)setEmojiString:(id)a3;
- (void)setIsFromEmojiSearch:(BOOL)a3;
- (void)setIsFromRecentsCategory:(BOOL)a3;
- (void)setVariantMask:(unint64_t)a3;
@end

@implementation UIKeyboardEmoji

- (UIKeyboardEmoji)initWithString:(id)a3 withVariantMask:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardEmoji;
  v8 = [(UIKeyboardEmoji *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_emojiString, a3);
    v9->_variantMask = a4;
  }

  return v9;
}

+ (id)emojiWithString:(id)a3 withVariantMask:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[UIKeyboardEmoji alloc] initWithString:v5 withVariantMask:a4];

  return v6;
}

+ (BOOL)shouldHighlightEmoji:(id)a3
{
  id v3 = a3;
  v4 = [getEMFEmojiTokenClass() emojiTokenWithString:v3 localeData:0];

  LOBYTE(v3) = [v4 _shouldHighlightEmoji];
  return (char)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = [a3 key];
  id v5 = [(UIKeyboardEmoji *)self key];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)supportsSkinToneVariants
{
  v2 = [getEMFEmojiTokenClass() emojiTokenWithString:self->_emojiString localeData:0];
  char v3 = [v2 supportsSkinToneVariants];

  return v3;
}

- (NSString)emojiString
{
  return self->_emojiString;
}

- (void)setEmojiString:(id)a3
{
}

- (unint64_t)variantMask
{
  return self->_variantMask;
}

- (void)setVariantMask:(unint64_t)a3
{
  self->_variantMask = a3;
}

- (BOOL)isFromRecentsCategory
{
  return self->_isFromRecentsCategory;
}

- (void)setIsFromRecentsCategory:(BOOL)a3
{
  self->_isFromRecentsCategory = a3;
}

- (BOOL)isFromEmojiSearch
{
  return self->_isFromEmojiSearch;
}

- (void)setIsFromEmojiSearch:(BOOL)a3
{
  self->_isFromEmojiSearch = a3;
}

- (void).cxx_destruct
{
}

@end