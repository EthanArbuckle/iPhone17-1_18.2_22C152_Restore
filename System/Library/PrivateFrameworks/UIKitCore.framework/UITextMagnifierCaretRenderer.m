@interface UITextMagnifierCaretRenderer
- (id)visualsForMagnifier;
@end

@implementation UITextMagnifierCaretRenderer

- (id)visualsForMagnifier
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"UITextMagnifierHorizontalHi";
  v14[1] = @"UITextMagnifierHorizontalMask";
  v14[2] = @"UITextMagnifierHorizontalLo";
  v11[0] = 0x1ED1748E0;
  v11[1] = 0x1ED174900;
  v12[0] = @"kb-loupe-hi.png";
  v2 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 4.0, 0.0);
  v12[1] = v2;
  v13[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v9 = 0x1ED1748E0;
  v10 = @"kb-loupe-mask.png";
  v13[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  uint64_t v7 = 0x1ED1748E0;
  v8 = @"kb-loupe-lo.png";
  v13[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v14 count:2];
  for (uint64_t i = 2; i != -1; --i)

  for (uint64_t j = 2; j != -1; --j)
  return v3;
}

@end