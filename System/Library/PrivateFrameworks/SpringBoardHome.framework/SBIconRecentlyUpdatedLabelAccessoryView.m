@interface SBIconRecentlyUpdatedLabelAccessoryView
+ (CAColorMatrix)_vibrantColorMatrixInput;
+ (id)_cachedDotImage;
+ (id)_dotColor;
+ (void)_setCachedDotImage:(id)a3;
@end

@implementation SBIconRecentlyUpdatedLabelAccessoryView

+ (id)_dotColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

+ (CAColorMatrix)_vibrantColorMatrixInput
{
  *retstr = *(CAColorMatrix *)byte_1D81E8040;
  return result;
}

+ (id)_cachedDotImage
{
  return (id)cachedRecentlyUpdatedDotImage;
}

+ (void)_setCachedDotImage:(id)a3
{
}

@end