@interface LargeTextLargeMonthWeekView
+ (BOOL)usesRoundedRectInsteadOfCircle;
+ (CGPoint)positionOfCircleInCellWithWidth:(double)a3 circleSize:(CGSize)a4 compressed:(BOOL)a5 containsFirstDayOfMonth:(BOOL)a6;
+ (CGRect)frameForCircleWithDayFrame:(CGRect)a3 dayLayerFrame:(CGRect)a4 numberString:(id)a5 overlayString:(id)a6 compressed:(BOOL)a7 containsFirstDay:(BOOL)a8;
+ (double)_yOffsetForRoundedRect:(BOOL)a3;
+ (double)dayNumberFontSize:(BOOL)a3;
+ (double)dayNumberOverlayFontSize:(BOOL)a3;
+ (double)grayLineHeight;
+ (double)spaceBelowGrayLineHeight:(BOOL)a3;
+ (id)weekNumberFont;
@end

@implementation LargeTextLargeMonthWeekView

+ (double)dayNumberFontSize:(BOOL)a3
{
  return 36.0;
}

+ (double)dayNumberOverlayFontSize:(BOOL)a3
{
  return 20.0;
}

+ (id)weekNumberFont
{
  return +[UIFont boldSystemFontOfSize:22.0];
}

+ (double)spaceBelowGrayLineHeight:(BOOL)a3
{
  return 110.0;
}

+ (double)grayLineHeight
{
  return 1.0;
}

+ (BOOL)usesRoundedRectInsteadOfCircle
{
  return 1;
}

+ (double)_yOffsetForRoundedRect:(BOOL)a3
{
  double result = 5.0;
  if (a3)
  {
    [a1 headerHeight:5.0];
    return v4 + 5.0;
  }
  return result;
}

+ (CGRect)frameForCircleWithDayFrame:(CGRect)a3 dayLayerFrame:(CGRect)a4 numberString:(id)a5 overlayString:(id)a6 compressed:(BOOL)a7 containsFirstDay:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v16 = a6;
  id v17 = a5;
  [(id)objc_opt_class() dayNumberFontSize:v9];
  double v19 = v18;
  [(id)objc_opt_class() dayNumberOverlayFontSize:v9];
  +[CompactMonthWeekTodayCircle roundedRectSizeForNumberString:v17 overlayString:v16 fontSize:v19 overlayFontSize:v20];
  double v22 = v21;
  double v24 = v23;

  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGRectGetMidX(v32);
  CalRoundToScreenScale();
  double v26 = v25;
  [a1 _yOffsetForRoundedRect:v8];
  double v28 = v27;
  double v29 = v26;
  double v30 = v22;
  double v31 = v24;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v29;
  return result;
}

+ (CGPoint)positionOfCircleInCellWithWidth:(double)a3 circleSize:(CGSize)a4 compressed:(BOOL)a5 containsFirstDayOfMonth:(BOOL)a6
{
  BOOL v6 = a6;
  CalRoundToScreenScale();
  double v9 = v8;
  [a1 _yOffsetForRoundedRect:v6];
  double v11 = v10;
  double v12 = v9;
  result.CGFloat y = v11;
  result.CGFloat x = v12;
  return result;
}

@end