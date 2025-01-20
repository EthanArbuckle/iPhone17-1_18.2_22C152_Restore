@interface _UIStatusBarVisualProvider_Split1170_Wide
+ (CGSize)notchSize;
+ (double)additionalBottomLeadingMargin;
+ (double)expandedFontSize;
+ (double)leadingCenteringOffset;
+ (double)nativeDisplayWidth;
+ (double)pillCenteringOffset;
+ (double)trailingEdgeInsetLeadingAdjustment;
- (CGSize)expandedPillSize;
- (CGSize)pillSize;
- (double)bottomLeadingTopOffset;
- (double)expandedIconScale;
- (double)itemSpacing;
- (double)lowerExpandedBaselineOffset;
@end

@implementation _UIStatusBarVisualProvider_Split1170_Wide

+ (double)nativeDisplayWidth
{
  return 1170.0;
}

+ (CGSize)notchSize
{
  double v2 = 161.333333;
  double v3 = 33.6666667;
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
  return -0.666666667;
}

+ (double)pillCenteringOffset
{
  return 2.33333333;
}

- (CGSize)pillSize
{
  double v2 = 66.6666667;
  double v3 = 23.0;
  result.height = v3;
  result.width = v2;
  return result;
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

- (double)lowerExpandedBaselineOffset
{
  return 22.0;
}

+ (double)additionalBottomLeadingMargin
{
  return 3.33333333;
}

- (double)bottomLeadingTopOffset
{
  return 8.0;
}

+ (double)trailingEdgeInsetLeadingAdjustment
{
  return 2.0;
}

- (double)expandedIconScale
{
  return 1.16;
}

@end