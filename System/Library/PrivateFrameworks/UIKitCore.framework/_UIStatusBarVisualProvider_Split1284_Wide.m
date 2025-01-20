@interface _UIStatusBarVisualProvider_Split1284_Wide
+ (CGSize)notchSize;
+ (double)additionalBottomLeadingMargin;
+ (double)baseFontSize;
+ (double)expandedFontSize;
+ (double)leadingCenteringOffset;
+ (double)nativeDisplayWidth;
+ (double)pillCenteringOffset;
+ (double)trailingEdgeInsetLeadingAdjustment;
- (CGSize)pillSize;
- (double)bottomLeadingTopOffset;
- (double)itemSpacing;
- (double)normalIconScale;
@end

@implementation _UIStatusBarVisualProvider_Split1284_Wide

+ (double)nativeDisplayWidth
{
  return 1284.0;
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
  return 1.33333333;
}

- (CGSize)pillSize
{
  double v2 = 68.0;
  double v3 = 23.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)baseFontSize
{
  return 16.0;
}

+ (double)expandedFontSize
{
  return 17.0;
}

- (double)normalIconScale
{
  return 1.26;
}

+ (double)additionalBottomLeadingMargin
{
  return 2.33333333;
}

- (double)bottomLeadingTopOffset
{
  return 7.66666667;
}

+ (double)trailingEdgeInsetLeadingAdjustment
{
  return 2.0;
}

@end