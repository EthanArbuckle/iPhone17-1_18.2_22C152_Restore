@interface UIFont(TelephonyUI)
+ (id)telephonyUIBodyShortEmphasizedFont;
+ (id)telephonyUIBodyShortFont;
+ (id)telephonyUIBodyShortItalicFont;
+ (id)telephonyUIFontWithDescriptor:()TelephonyUI;
+ (id)telephonyUIFootnoteShortFont;
+ (id)telephonyUISubheadlineShortEmphasizedFont;
+ (id)telephonyUISubheadlineShortFont;
+ (id)telephonyUISubheadlineShortSemiboldFont;
- (id)withCaseSensitiveAttribute;
@end

@implementation UIFont(TelephonyUI)

+ (id)telephonyUISubheadlineShortEmphasizedFont
{
  v0 = (void *)MEMORY[0x1E4FB08E0];
  v1 = [MEMORY[0x1E4FB08E8] telephonyUISubheadlineShortEmphasizedFontDescriptor];
  v2 = [v0 telephonyUIFontWithDescriptor:v1];

  return v2;
}

+ (id)telephonyUISubheadlineShortSemiboldFont
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB08E0];
  v1 = [MEMORY[0x1E4FB08E8] telephonyUISubheadlineShortSemiboldFontDescriptor];
  uint64_t v7 = *MEMORY[0x1E4FB09F0];
  v2 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09E0]];
  v8[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v4 = [v1 fontDescriptorByAddingAttributes:v3];
  v5 = [v0 telephonyUIFontWithDescriptor:v4];

  return v5;
}

+ (id)telephonyUIBodyShortEmphasizedFont
{
  v0 = (void *)MEMORY[0x1E4FB08E0];
  v1 = [MEMORY[0x1E4FB08E8] telephonyUIBodyShortEmphasizedFontDescriptor];
  v2 = [v0 telephonyUIFontWithDescriptor:v1];

  return v2;
}

+ (id)telephonyUISubheadlineShortFont
{
  v0 = (void *)MEMORY[0x1E4FB08E0];
  v1 = [MEMORY[0x1E4FB08E8] telephonyUISubheadlineShortFontDescriptor];
  v2 = [v0 telephonyUIFontWithDescriptor:v1];

  return v2;
}

+ (id)telephonyUIBodyShortFont
{
  v2 = [MEMORY[0x1E4FB08E8] telephonyUIBodyShortFontDescriptor];
  v3 = [a1 telephonyUIFontWithDescriptor:v2];

  return v3;
}

+ (id)telephonyUIFontWithDescriptor:()TelephonyUI
{
  v1 = objc_msgSend(a1, "fontWithDescriptor:size:", 0.0);
  v2 = [v1 withCaseSensitiveAttribute];

  return v2;
}

+ (id)telephonyUIBodyShortItalicFont
{
  v0 = (void *)MEMORY[0x1E4FB08E0];
  v1 = [MEMORY[0x1E4FB08E8] telephonyUIBodyShortItalicFontDescriptor];
  v2 = [v0 telephonyUIFontWithDescriptor:v1];

  return v2;
}

+ (id)telephonyUIFootnoteShortFont
{
  v0 = (void *)MEMORY[0x1E4FB08E0];
  v1 = [MEMORY[0x1E4FB08E8] telephonyUIFootnoteShortFontDescriptor];
  v2 = [v0 telephonyUIFontWithDescriptor:v1];

  return v2;
}

- (id)withCaseSensitiveAttribute
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4FB0910];
  uint64_t v2 = *MEMORY[0x1E4FB0960];
  v10[0] = *MEMORY[0x1E4FB0968];
  v10[1] = v2;
  v11[0] = &unk_1F1E89948;
  v11[1] = &unk_1F1E89960;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v12 = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v14[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v6 = [a1 fontDescriptor];
  uint64_t v7 = [v6 fontDescriptorByAddingAttributes:v5];

  v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:0.0];

  return v8;
}

@end