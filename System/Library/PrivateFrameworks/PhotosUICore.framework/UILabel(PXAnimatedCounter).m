@interface UILabel(PXAnimatedCounter)
- (double)boundingRectForCharacterRange:()PXAnimatedCounter;
@end

@implementation UILabel(PXAnimatedCounter)

- (double)boundingRectForCharacterRange:()PXAnimatedCounter
{
  id v7 = objc_alloc(MEMORY[0x1E4FB08B8]);
  v8 = [a1 attributedText];
  v9 = (void *)[v7 initWithAttributedString:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4FB0840]);
  [v9 addLayoutManager:v10];
  id v11 = objc_alloc(MEMORY[0x1E4FB0880]);
  [a1 bounds];
  v14 = objc_msgSend(v11, "initWithSize:", v12, v13);
  [v14 setLineFragmentPadding:0.0];
  [v10 addTextContainer:v14];
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  objc_msgSend(v10, "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, &v18);
  objc_msgSend(v10, "boundingRectForGlyphRange:inTextContainer:", v18, v19, v14);
  double v16 = v15;

  return v16;
}

@end