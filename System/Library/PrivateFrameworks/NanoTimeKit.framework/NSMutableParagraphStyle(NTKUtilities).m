@interface NSMutableParagraphStyle(NTKUtilities)
+ (id)NTKHyphenationParagraphStyleWithFactor:()NTKUtilities;
+ (uint64_t)NTKHyphenationParagraphStyle;
@end

@implementation NSMutableParagraphStyle(NTKUtilities)

+ (uint64_t)NTKHyphenationParagraphStyle
{
  LODWORD(a3) = NTKHyphenationDefaultFactor;
  return [a1 NTKHyphenationParagraphStyleWithFactor:a3];
}

+ (id)NTKHyphenationParagraphStyleWithFactor:()NTKUtilities
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  v3 = v2;
  double v4 = a1;
  if (a1 < 0.0) {
    double v4 = 0.0;
  }
  double v5 = fmin(v4, 1.0);
  *(float *)&double v5 = v5;
  [v2 setHyphenationFactor:v5];
  [v3 setAllowsDefaultTighteningForTruncation:1];
  [v3 setLineBreakStrategy:0xFFFFLL];
  return v3;
}

@end