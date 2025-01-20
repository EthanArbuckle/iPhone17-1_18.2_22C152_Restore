@interface STUIStatusBarVisualProvider_Split828
+ (BOOL)shrinksSingleCharacterTypes;
+ (CGSize)notchSize;
+ (double)LTEAPlusFontSize;
+ (double)additionalBottomLeadingMargin;
+ (double)baseFontSize;
+ (double)height;
+ (double)leadingCenteringOffset;
+ (double)leadingSmallPillSpacing;
+ (double)nativeDisplayWidth;
+ (double)pillCenteringOffset;
- (CGSize)expandedPillSize;
- (CGSize)pillSize;
- (CGSize)smallPillSize;
- (double)baselineBottomInset;
- (double)bottomLeadingTopOffset;
- (double)condensedPointSizeForCellularType:(int64_t)a3 defaultPointSize:(double)a4 baselineOffset:(double *)a5;
- (double)expandedIconScale;
- (double)grabberHeight;
- (double)itemSpacing;
- (double)leadingItemSpacing;
- (double)lowerExpandedBaselineOffset;
- (double)normalIconScale;
- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4;
@end

@implementation STUIStatusBarVisualProvider_Split828

+ (double)height
{
  return 48.0;
}

+ (double)nativeDisplayWidth
{
  return 828.0;
}

+ (CGSize)notchSize
{
  double v2 = 227.0;
  double v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)itemSpacing
{
  return 4.5;
}

- (double)leadingItemSpacing
{
  return 3.0;
}

+ (double)leadingSmallPillSpacing
{
  return 5.0;
}

+ (double)leadingCenteringOffset
{
  return -1.5;
}

+ (double)pillCenteringOffset
{
  return 2.0;
}

- (CGSize)pillSize
{
  double v2 = 61.0;
  double v3 = 22.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)smallPillSize
{
  double v2 = 20.5;
  double v3 = 20.5;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)grabberHeight
{
  return 2.5;
}

- (CGSize)expandedPillSize
{
  double v2 = 47.0;
  double v3 = 17.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)baseFontSize
{
  return 14.0;
}

- (double)baselineBottomInset
{
  return 1.5;
}

- (double)lowerExpandedBaselineOffset
{
  return 23.0;
}

+ (double)additionalBottomLeadingMargin
{
  return -1.0;
}

- (double)bottomLeadingTopOffset
{
  return 7.0;
}

- (double)normalIconScale
{
  return 1.07;
}

- (double)expandedIconScale
{
  return 1.2412;
}

- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4
{
  v4 = @"􀛵";
  if (a3 != 9) {
    v4 = 0;
  }
  if (a3 == 8) {
    v4 = @"􀛴";
  }
  if (a4) {
    return v4;
  }
  else {
    return 0;
  }
}

+ (double)LTEAPlusFontSize
{
  return 12.0;
}

+ (BOOL)shrinksSingleCharacterTypes
{
  return 1;
}

- (double)condensedPointSizeForCellularType:(int64_t)a3 defaultPointSize:(double)a4 baselineOffset:(double *)a5
{
  if ((unint64_t)(a3 - 8) < 2)
  {
    *a5 = 1.5;
    v9 = objc_opt_class();
    [v9 LTEAPlusFontSize];
  }
  else if ((unint64_t)(a3 - 2) > 1)
  {
    *a5 = 1.0;
    return a4 + -2.0;
  }
  else
  {
    int v6 = [(id)objc_opt_class() shrinksSingleCharacterTypes];
    double v7 = 0.0;
    if (v6) {
      double v7 = 1.0;
    }
    return a4 - v7;
  }
  return result;
}

@end