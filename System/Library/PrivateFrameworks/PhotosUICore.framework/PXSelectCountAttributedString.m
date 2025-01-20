@interface PXSelectCountAttributedString
@end

@implementation PXSelectCountAttributedString

void ___PXSelectCountAttributedString_block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  uint64_t v1 = [v0 mutableCopy];
  v2 = (void *)_PXSelectCountAttributedString_paragraphStyle;
  _PXSelectCountAttributedString_paragraphStyle = v1;

  v7[0] = *MEMORY[0x1E4FB06F8];
  v3 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:13.0];
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E4FB0700];
  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  v7[2] = *MEMORY[0x1E4FB0738];
  v8[1] = v4;
  v8[2] = _PXSelectCountAttributedString_paragraphStyle;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  v6 = (void *)_PXSelectCountAttributedString_attributes;
  _PXSelectCountAttributedString_attributes = v5;
}

@end