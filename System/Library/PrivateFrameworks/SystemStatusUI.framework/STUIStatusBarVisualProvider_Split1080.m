@interface STUIStatusBarVisualProvider_Split1080
+ (CGSize)notchSize;
+ (double)height;
+ (double)leadingCenteringOffset;
+ (double)nativeDisplayWidth;
+ (double)pillCenteringOffset;
+ (double)referenceScreenScale;
- (CGSize)pillSize;
- (CGSize)smallPillSize;
- (double)baselineBottomInset;
- (double)itemSpacing;
- (double)leadingSmallPillSpacing;
- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4;
- (int64_t)normalIconSize;
@end

@implementation STUIStatusBarVisualProvider_Split1080

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
  double v2 = 226.0;
  double v3 = 34.3333333;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)itemSpacing
{
  return 5.33333333;
}

- (double)leadingSmallPillSpacing
{
  return 3.33333333;
}

+ (double)leadingCenteringOffset
{
  return 1.33333333;
}

+ (double)pillCenteringOffset
{
  return 0.666666667;
}

- (CGSize)pillSize
{
  double v2 = 53.6666667;
  double v3 = 21.3333333;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)smallPillSize
{
  double v2 = 18.0;
  double v3 = 18.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)baselineBottomInset
{
  return 0.333333333;
}

- (int64_t)normalIconSize
{
  return 3;
}

- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4
{
  v4 = @"􀛳";
  if (a3 != 9) {
    v4 = 0;
  }
  if (a3 == 8) {
    v4 = @"􀛲";
  }
  if (a4) {
    return v4;
  }
  else {
    return 0;
  }
}

@end