@interface STUIStatusBarVisualProvider_Split1080_Wide
+ (CGSize)notchSize;
+ (double)additionalBottomLeadingMargin;
+ (double)expandedEdgeInset;
+ (double)expandedFontSize;
+ (double)height;
+ (double)leadingCenteringOffset;
+ (double)nativeDisplayWidth;
+ (double)referenceScreenScale;
- (CGSize)expandedPillSize;
- (double)baselineBottomInset;
- (double)bottomLeadingTopOffset;
- (double)expandedIconScale;
- (double)itemSpacing;
- (double)lowerExpandedBaselineOffset;
@end

@implementation STUIStatusBarVisualProvider_Split1080_Wide

+ (double)referenceScreenScale
{
  return 2.88;
}

+ (double)height
{
  return 50.0;
}

+ (double)nativeDisplayWidth
{
  return 1080.0;
}

+ (CGSize)notchSize
{
  double v2 = 174.0;
  double v3 = 37.3333333;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)itemSpacing
{
  return 6.33333333;
}

+ (double)leadingCenteringOffset
{
  return 1.33333333;
}

- (CGSize)expandedPillSize
{
  double v2 = 44.0;
  double v3 = 16.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)expandedFontSize
{
  return 15.0;
}

- (double)baselineBottomInset
{
  return 0.333333333;
}

- (double)lowerExpandedBaselineOffset
{
  return 22.0;
}

+ (double)additionalBottomLeadingMargin
{
  return 0.5;
}

- (double)bottomLeadingTopOffset
{
  return 9.0;
}

+ (double)expandedEdgeInset
{
  return 5.0;
}

- (double)expandedIconScale
{
  return 1.16;
}

@end