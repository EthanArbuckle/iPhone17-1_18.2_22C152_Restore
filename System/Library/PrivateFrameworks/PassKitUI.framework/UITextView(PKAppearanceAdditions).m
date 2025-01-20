@interface UITextView(PKAppearanceAdditions)
- (id)pk_childrenForAppearance;
- (void)pk_applyAppearance:()PKAppearanceAdditions;
- (void)pk_setAttributedTextRespectingTextAndBackgroundColors:()PKAppearanceAdditions;
@end

@implementation UITextView(PKAppearanceAdditions)

- (id)pk_childrenForAppearance
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = [a1 inputView];

  if (v3)
  {
    v4 = [a1 inputView];
    [v2 addObject:v4];
  }
  v5 = [a1 inputAccessoryView];

  if (v5)
  {
    v6 = [a1 inputAccessoryView];
    [v2 addObject:v6];
  }
  v7 = (void *)[v2 copy];

  return v7;
}

- (void)pk_applyAppearance:()PKAppearanceAdditions
{
  id v9 = a3;
  uint64_t v4 = [a1 keyboardAppearance];
  if ([v9 hasDarkAppearance])
  {
    uint64_t v5 = 1;
LABEL_5:
    [a1 setKeyboardAppearance:v5];
    goto LABEL_6;
  }
  if (v4 == 1)
  {
    uint64_t v5 = 0;
    goto LABEL_5;
  }
LABEL_6:
  if (v4 != [a1 keyboardAppearance] && objc_msgSend(a1, "isFirstResponder")) {
    [a1 reloadInputViews];
  }
  v6 = [v9 textColor];
  [a1 setTextColor:v6];

  v7 = [MEMORY[0x1E4FB1618] clearColor];
  [a1 setBackgroundColor:v7];

  v8 = [a1 attributedText];
  objc_msgSend(a1, "pk_setAttributedTextRespectingTextAndBackgroundColors:", v8);
}

- (void)pk_setAttributedTextRespectingTextAndBackgroundColors:()PKAppearanceAdditions
{
  uint64_t v4 = *MEMORY[0x1E4FB0700];
  id v10 = a3;
  uint64_t v5 = [a1 textColor];
  id v6 = PKAttributedStringSetAttributeForKey(v10, v4, v5);

  uint64_t v7 = *MEMORY[0x1E4FB06C0];
  v8 = [a1 backgroundColor];
  id v9 = PKAttributedStringSetAttributeForKey(v10, v7, v8);

  [a1 setAttributedText:v10];
}

@end