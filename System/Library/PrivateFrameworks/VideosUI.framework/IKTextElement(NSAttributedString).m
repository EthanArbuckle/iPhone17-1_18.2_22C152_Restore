@interface IKTextElement(NSAttributedString)
- (id)textAttributes;
@end

@implementation IKTextElement(NSAttributedString)

- (id)textAttributes
{
  if (textAttributes_onceToken != -1) {
    dispatch_once(&textAttributes_onceToken, &__block_literal_global_39);
  }
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v3 = [a1 attributedStringWithFont:v2];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = [v3 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__IKTextElement_NSAttributedString__textAttributes__block_invoke_2;
  v8[3] = &unk_1E6DF61A8;
  id v6 = v4;
  id v9 = v6;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0x100000, v8);

  return v6;
}

@end