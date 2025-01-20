@interface SBIconBetaLabelAccessoryView
+ (CAColorMatrix)_vibrantColorMatrixInput;
+ (id)_cachedDotImage;
+ (id)_dotColor;
+ (void)_setCachedDotImage:(id)a3;
@end

@implementation SBIconBetaLabelAccessoryView

+ (id)_dotColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

+ (CAColorMatrix)_vibrantColorMatrixInput
{
  *(_OWORD *)&retstr->var0 = xmmword_1D81E8090;
  *(_OWORD *)&retstr->var4 = xmmword_1D81E80A0;
  *(_OWORD *)&retstr->var8 = xmmword_1D81E80B0;
  *(_OWORD *)&retstr->var12 = xmmword_1D81E80C0;
  *(_OWORD *)&retstr->var16 = *(_OWORD *)&byte_1D81E8040[64];
  return result;
}

+ (id)_cachedDotImage
{
  return (id)cachedBetaDotImage;
}

+ (void)_setCachedDotImage:(id)a3
{
}

@end