@interface UILabel(PKAppearanceObject)
- (uint64_t)pk_childrenForAppearance;
- (void)pk_applyAppearance:()PKAppearanceObject;
- (void)pk_setAttributedTextRespectingTextAndBackgroundColors:()PKAppearanceObject;
@end

@implementation UILabel(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E4F1CBF0];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  v4 = [a3 textColor];
  [a1 setTextColor:v4];

  v5 = [MEMORY[0x1E4FB1618] clearColor];
  [a1 setBackgroundColor:v5];

  id v6 = [a1 attributedText];
  objc_msgSend(a1, "pk_setAttributedTextRespectingTextAndBackgroundColors:", v6);
}

- (void)pk_setAttributedTextRespectingTextAndBackgroundColors:()PKAppearanceObject
{
  uint64_t v4 = *MEMORY[0x1E4FB0700];
  id v10 = a3;
  v5 = [a1 textColor];
  id v6 = PKAttributedStringSetAttributeForKey(v10, v4, v5);

  uint64_t v7 = *MEMORY[0x1E4FB06C0];
  v8 = [a1 backgroundColor];
  id v9 = PKAttributedStringSetAttributeForKey(v10, v7, v8);

  [a1 setAttributedText:v10];
}

@end