@interface UIAdaptLocalizedStringForView
@end

@implementation UIAdaptLocalizedStringForView

void ___UIAdaptLocalizedStringForView_block_invoke()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v0 = [off_1E52D39B8 defaultFontForTextStyle:@"UICTFontTextStyleBody"];
  id v1 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v6 = *(void *)off_1E52D2040;
  v7[0] = v0;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  CFAttributedStringRef v3 = (const __CFAttributedString *)[v1 initWithString:@"M" attributes:v2];

  v4 = CTLineCreateWithAttributedString(v3);
  if (v4)
  {
    v5 = v4;
    qword_1EB25B870 = CTLineGetTypographicBounds(v4, 0, 0, 0);
    CFRelease(v5);
  }
}

@end