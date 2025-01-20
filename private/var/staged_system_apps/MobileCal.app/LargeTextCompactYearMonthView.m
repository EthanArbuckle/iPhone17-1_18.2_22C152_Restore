@interface LargeTextCompactYearMonthView
+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5;
+ (double)leftMarginForWindowSize:(CGSize)a3;
- (BOOL)computeCircleFrameWithoutAdjustments;
- (BOOL)showWeekDayInitials;
- (CGRect)frameForGridOfDays:(BOOL)a3;
- (CGSize)roundedRectSizeForDayNumberString:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)circleSize;
- (double)circleSizeForDoubleDigit;
- (double)dayNumberKerning;
- (double)dayTextSize;
- (double)daysXAdjustLeft;
- (double)daysYAdjustTop;
- (double)headerFontKerning;
- (double)headerFontMaxSize;
- (double)headerXAdjust;
- (double)todayNumberKerning;
- (double)weekDayInitialsAdjustLeft;
- (double)weekDayInitialsAdjustTop;
- (double)xInset;
- (double)xSpacing;
- (double)yInset;
- (double)ySpacing;
- (id)dayNumberFont;
- (id)headerFont;
- (id)weekDayInitialsFont;
@end

@implementation LargeTextCompactYearMonthView

+ (double)leftMarginForWindowSize:(CGSize)a3
{
  double width = a3.width;
  if (qword_1002164C0 != -1) {
    dispatch_once(&qword_1002164C0, &stru_1001D2A88);
  }
  v4 = (void *)qword_1002164B8;

  [v4 valueForSize:width];
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (qword_1002164D0 != -1) {
    dispatch_once(&qword_1002164D0, &stru_1001D2AA8);
  }
  v4 = (void *)qword_1002164C8;
  AnchoredValueCurrentWindowWidth(self);
  [v4 valueForSize:];
  double v6 = v5;
  uint64_t v7 = EKUIInterfaceOrientationForViewHierarchy();
  v8 = objc_opt_class();
  EKUICurrentWindowSize();
  [v8 heightForInterfaceOrientation:v7 windowSize:EKUIHeightSizeClassForViewHierarchy() heightSizeClass:v9 v10];
  double v12 = v11;
  double v13 = v6;
  result.height = v12;
  result.double width = v13;
  return result;
}

+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  double width = a4.width;
  if (qword_1002164E0 != -1) {
    dispatch_once(&qword_1002164E0, &stru_1001D2AC8);
  }
  double v6 = (void *)qword_1002164D8;

  [v6 valueForSize:width];
  return result;
}

- (double)xInset
{
  return 0.0;
}

- (double)yInset
{
  return 0.0;
}

- (double)headerXAdjust
{
  return 0.0;
}

- (double)headerFontMaxSize
{
  v2 = [(LargeTextCompactYearMonthView *)self headerFont];
  [v2 pointSize];
  double v4 = v3;

  return v4;
}

- (id)headerFont
{
  if (qword_1002164F0 != -1) {
    dispatch_once(&qword_1002164F0, &stru_1001D2AE8);
  }
  double v3 = (void *)qword_1002164E8;
  AnchoredValueCurrentWindowWidth(self);
  [v3 valueForSize:];

  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
}

- (double)headerFontKerning
{
  return 0.0;
}

- (id)dayNumberFont
{
  [(LargeTextCompactYearMonthView *)self dayTextSize];

  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (double)dayNumberKerning
{
  return 0.0;
}

- (double)todayNumberKerning
{
  return 0.0;
}

- (double)dayTextSize
{
  if (qword_100216500 != -1) {
    dispatch_once(&qword_100216500, &stru_1001D2B08);
  }
  double v3 = (void *)qword_1002164F8;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)circleSize
{
  if (qword_100216510 != -1) {
    dispatch_once(&qword_100216510, &stru_1001D2B28);
  }
  double v3 = (void *)qword_100216508;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)circleSizeForDoubleDigit
{
  [(LargeTextCompactYearMonthView *)self circleSize];
  return result;
}

- (double)daysXAdjustLeft
{
  return 0.0;
}

- (double)daysYAdjustTop
{
  if (qword_100216520 != -1) {
    dispatch_once(&qword_100216520, &stru_1001D2B48);
  }
  double v3 = (void *)qword_100216518;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)xSpacing
{
  if (qword_100216530 != -1) {
    dispatch_once(&qword_100216530, &stru_1001D2B68);
  }
  double v3 = (void *)qword_100216528;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)ySpacing
{
  if (qword_100216540 != -1) {
    dispatch_once(&qword_100216540, &stru_1001D2B88);
  }
  double v3 = (void *)qword_100216538;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (BOOL)showWeekDayInitials
{
  return 0;
}

- (double)weekDayInitialsAdjustLeft
{
  return 0.0;
}

- (double)weekDayInitialsAdjustTop
{
  return 0.0;
}

- (id)weekDayInitialsFont
{
  return 0;
}

- (BOOL)computeCircleFrameWithoutAdjustments
{
  return 1;
}

- (CGSize)roundedRectSizeForDayNumberString:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)LargeTextCompactYearMonthView;
  id v4 = a3;
  [(LargeTextCompactYearMonthView *)&v16 roundedRectSizeForDayNumberString:v4];
  double v6 = v5;
  double v8 = v7;
  NSAttributedStringKey v17 = NSFontAttributeName;
  double v9 = [(LargeTextCompactYearMonthView *)self dayNumberFont];
  v18 = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v4 sizeWithAttributes:v10];
  double v12 = v11;

  double v13 = v12 + 4.0;
  if (v6 >= v13) {
    double v14 = v6;
  }
  else {
    double v14 = v13;
  }
  double v15 = v8;
  result.height = v15;
  result.double width = v14;
  return result;
}

- (CGRect)frameForGridOfDays:(BOOL)a3
{
  [(LargeTextCompactYearMonthView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [(LargeTextCompactYearMonthView *)self daysYAdjustTop];
  double v11 = v10;
  [(LargeTextCompactYearMonthView *)self yInset];
  double v13 = v7 + v11 + v12;
  double v14 = [(LargeTextCompactYearMonthView *)self calendar];
  id v15 = [v14 copy];

  [v15 setFirstWeekday:CUIKOneIndexedWeekStart()];
  objc_super v16 = [(LargeTextCompactYearMonthView *)self calendarDate];
  NSAttributedStringKey v17 = [v16 date];
  [v15 rangeOfUnit:4096 inUnit:8 forDate:v17];
  unint64_t v19 = v18;

  [(LargeTextCompactYearMonthView *)self ySpacing];
  double v21 = v20 * (double)v19;

  double v22 = v5;
  double v23 = v13;
  double v24 = v9;
  double v25 = v21;
  result.size.height = v25;
  result.size.double width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

@end