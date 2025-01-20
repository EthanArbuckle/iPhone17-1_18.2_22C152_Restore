@interface LargeWeekDayInitialsHeaderView
+ (id)dayInitialFont;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)bottomPadding;
- (double)dayFrameRightInset;
- (int64_t)dayInitialTextAlignment;
@end

@implementation LargeWeekDayInitialsHeaderView

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = [(id)objc_opt_class() dayInitialFont];
  [v5 lineHeight];
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:7.5 shouldScaleForSmallerSizes:9.0];
  [(LargeWeekDayInitialsHeaderView *)self bottomPadding];
  CalRoundToScreenScale();
  double v7 = v6;

  double v8 = width;
  double v9 = v7;
  result.height = v9;
  result.CGFloat width = v8;
  return result;
}

+ (id)dayInitialFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:17.0 shouldScaleForSmallerSizes:23.0];

  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (int64_t)dayInitialTextAlignment
{
  v2 = [(LargeWeekDayInitialsHeaderView *)self traitCollection];
  int v3 = EKUIUsesLargeTextLayout();

  if (v3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (double)dayFrameRightInset
{
  v2 = [(LargeWeekDayInitialsHeaderView *)self traitCollection];
  int v3 = EKUIUsesLargeTextLayout();

  double result = 10.0;
  if (v3) {
    return 0.0;
  }
  return result;
}

- (double)bottomPadding
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:11.0 shouldScaleForSmallerSizes:12.5];
  return result;
}

- (void).cxx_destruct
{
}

@end