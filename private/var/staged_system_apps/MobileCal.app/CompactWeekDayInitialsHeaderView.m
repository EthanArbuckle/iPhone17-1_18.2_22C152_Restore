@interface CompactWeekDayInitialsHeaderView
+ (double)_bottomPadding;
+ (double)standardHeight;
+ (id)dayInitialFont;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)bottomPadding;
@end

@implementation CompactWeekDayInitialsHeaderView

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(id)objc_opt_class() standardHeight];
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

+ (double)standardHeight
{
  v3 = [a1 dayInitialFont];
  [v3 capHeight];
  [a1 _bottomPadding];
  CalRoundToScreenScale();
  double v5 = v4;

  return v5;
}

+ (double)_bottomPadding
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:5.5 shouldScaleForSmallerSizes:9.9];
  return result;
}

+ (id)dayInitialFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:10.0 shouldScaleForSmallerSizes:18.0];

  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
}

- (double)bottomPadding
{
  v2 = objc_opt_class();

  [v2 _bottomPadding];
  return result;
}

@end