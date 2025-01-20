@interface _UIStatusBarVisualProvider_Split1284
+ (CGSize)notchSize;
+ (double)nativeDisplayWidth;
+ (double)pillCenteringOffset;
+ (double)trailingEdgeInsetLeadingAdjustment;
- (double)bottomLeadingTopOffset;
@end

@implementation _UIStatusBarVisualProvider_Split1284

+ (double)nativeDisplayWidth
{
  return 1284.0;
}

+ (CGSize)notchSize
{
  double v2 = 209.333333;
  double v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)pillCenteringOffset
{
  return 3.33333333;
}

- (double)bottomLeadingTopOffset
{
  return 6.66666667;
}

+ (double)trailingEdgeInsetLeadingAdjustment
{
  return 4.0;
}

@end