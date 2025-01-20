@interface LargeTextLargeYearMonthView
+ (BOOL)_showWeekDayInitialsForHeightSizeClass:(int64_t)a3;
+ (double)_dayTextSizeForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4;
+ (double)_dayTextSizeForWindowSize:(CGSize)a3;
+ (double)_daysYAdjustTopForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5;
+ (double)_daysYAdjustTopForWindowSize:(CGSize)a3 heightSizeClass:(int64_t)a4;
+ (double)_headerFontSizeForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4;
+ (double)_headerFontSizeForWindowSize:(CGSize)a3;
+ (double)_heightForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5;
+ (double)_xSpacingForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4;
+ (double)_xSpacingForWindowSize:(CGSize)a3;
+ (double)_ySpacingForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4;
+ (double)_ySpacingForWindowSize:(CGSize)a3;
+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5;
+ (double)leftMarginForWindowSize:(CGSize)a3;
+ (double)rightMarginForWindowSize:(CGSize)a3;
+ (id)_dayNumberFontForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4;
+ (id)_dayNumberFontForWindowSize:(CGSize)a3;
+ (id)_headerFontForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4;
+ (id)_headerFontForWindowSize:(CGSize)a3;
+ (id)_weekDayInitialsFontForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4;
+ (id)_weekDayInitialsFontForWindowSize:(CGSize)a3;
+ (unint64_t)numberOfMonthsPerRowForWindowSize:(CGSize)a3;
- (BOOL)computeCircleFrameWithoutAdjustments;
- (BOOL)shouldAddPreciseInteractivity;
- (BOOL)showWeekDayInitials;
- (CGSize)_availableSpace;
- (CGSize)roundedRectSizeForDayNumberString:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)circleSize;
- (double)circleSizeForDoubleDigit;
- (double)dayTextSize;
- (double)daysXAdjustLeft;
- (double)daysYAdjustTop;
- (double)headerFontKerning;
- (double)headerFontMaxSize;
- (double)headerFontMinSize;
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
- (id)todayNumberFont;
- (id)weekDayInitialsFont;
@end

@implementation LargeTextLargeYearMonthView

+ (unint64_t)numberOfMonthsPerRowForWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = EKUIWindowInterfaceParadigmForWindowSize();
  if (vabdd_f64(*(double *)&qword_100216C98, width) >= 2.22044605e-16 || qword_100215C48 != v6)
  {
    uint64_t v8 = v6;
    if (v6 == 8) {
      unint64_t v9 = 3;
    }
    else {
      unint64_t v9 = 2;
    }
    qword_100216CA0 = v9;
    unint64_t v10 = +[LargeYearViewController defaultMonthsPerRowForWindowSize:](LargeYearViewController, "defaultMonthsPerRowForWindowSize:", width, height);
    if (v10 > v9)
    {
      uint64_t v11 = v10;
      while (1)
      {
        [a1 _headerFontSizeForNumberOfMonthsPerRow:v11 windowSize:CGSizeMake(width, height)];
        double v13 = v12;
        v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
        [v14 pointSize];
        double v16 = v15;

        if (v13 >= v16) {
          break;
        }
        if (--v11 <= v9) {
          goto LABEL_14;
        }
      }
      qword_100216CA0 = v11;
    }
LABEL_14:
    qword_100216C98 = *(void *)&width;
    qword_100215C48 = v8;
  }
  return qword_100216CA0;
}

+ (double)leftMarginForWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [a1 numberOfMonthsPerRowForWindowSize];

  [_a1 _leftMarginForNumberOfMonthsPerRow:v6 windowSize:width, height];
  return result;
}

+ (double)rightMarginForWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [a1 numberOfMonthsPerRowForWindowSize:];

  [_a1 _rightMarginForNumberOfMonthsPerRow:v6 windowSize:width, height];
  return result;
}

- (CGSize)_availableSpace
{
  v3 = [(LargeTextLargeYearMonthView *)self window];

  if (v3)
  {
    v4 = [(LargeTextLargeYearMonthView *)self window];
    [v4 mainContentSize];
    double v6 = v5;
    double v8 = v7;

    double v9 = v6;
    double v10 = v8;
  }
  else
  {
    EKUICurrentWindowSize();
  }
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(LargeTextLargeYearMonthView *)self xSpacing];
  double v5 = v4 * 7.0;
  uint64_t v6 = EKUIInterfaceOrientationForViewHierarchy();
  double v7 = objc_opt_class();
  [(LargeTextLargeYearMonthView *)self _availableSpace];
  [v7 heightForInterfaceOrientation:v6 windowSize:EKUIHeightSizeClassForViewHierarchy() heightSizeClass:v8 v9];
  double v11 = v10;
  double v12 = v5;
  result.double height = v11;
  result.double width = v12;
  return result;
}

+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  CGFloat width = a4.width;
  if (vabdd_f64(*(double *)&qword_100216CA8, a4.width) < 2.22044605e-16) {
    return *(double *)&qword_100216CB0;
  }
  [a1 _heightForNumberOfMonthsPerRow:[a1 numberOfMonthsPerRowForWindowSize:a3, a4.width, a4.height] windowSize:a5, a4.width, a4.height];
  qword_100216CB0 = *(void *)&result;
  qword_100216CA8 = *(void *)&width;
  return result;
}

+ (double)_heightForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  [a1 _daysYAdjustTopForNumberOfMonthsPerRow:a3 windowSize:a5];
  double v10 = v9;
  [a1 _ySpacingForNumberOfMonthsPerRow:a3 windowSize:CGSizeMake(width, height)];
  return v10 + v11 * 6.0;
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

+ (double)_headerFontSizeForWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [a1 numberOfMonthsPerRowForWindowSize:];

  [a1 _headerFontSizeForNumberOfMonthsPerRow:v6 windowSize:CGSizeMake(width, height)];
  return result;
}

+ (double)_headerFontSizeForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  [a1 _dayTextSizeForNumberOfMonthsPerRow:a3 windowSize:a4.width, a4.height];
  return round(28.0 / 13.0 * v4);
}

- (double)headerFontMaxSize
{
  v3 = objc_opt_class();
  [(LargeTextLargeYearMonthView *)self _availableSpace];

  [v3 _headerFontSizeForWindowSize:];
  return result;
}

- (double)headerFontMinSize
{
  v3 = objc_opt_class();
  [(LargeTextLargeYearMonthView *)self _availableSpace];

  [v3 _headerFontSizeForWindowSize:];
  return result;
}

- (id)headerFont
{
  v3 = objc_opt_class();
  [(LargeTextLargeYearMonthView *)self _availableSpace];

  return [v3 _headerFontForWindowSize:];
}

+ (id)_headerFontForWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [a1 numberOfMonthsPerRowForWindowSize:];

  return [a1 _headerFontForNumberOfMonthsPerRow:v6 windowSize:width, height];
}

+ (id)_headerFontForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  [a1 _headerFontSizeForNumberOfMonthsPerRow:a3 windowSize:a4.width, a4.height];
  double v5 = (void *)qword_100216CB8;
  if (!qword_100216CB8 || vabdd_f64(v4, *(double *)&qword_100215C50) >= 2.22044605e-16)
  {
    qword_100215C50 = *(void *)&v4;
    uint64_t v6 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    double v7 = (void *)qword_100216CB8;
    qword_100216CB8 = v6;

    double v5 = (void *)qword_100216CB8;
  }

  return v5;
}

- (double)headerFontKerning
{
  return 0.0;
}

- (id)dayNumberFont
{
  v3 = objc_opt_class();
  [(LargeTextLargeYearMonthView *)self _availableSpace];

  return _objc_msgSend(v3, "_dayNumberFontForWindowSize:");
}

+ (id)_dayNumberFontForWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [a1 numberOfMonthsPerRowForWindowSize:];

  return _objc_msgSend(a1, "_dayNumberFontForNumberOfMonthsPerRow:windowSize:", v6, width, height);
}

+ (id)_dayNumberFontForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  [a1 _dayTextSizeForNumberOfMonthsPerRow:a3 windowSize:a4.width, a4.height];
  double v5 = (void *)qword_100216CC0;
  if (!qword_100216CC0) {
    goto LABEL_5;
  }
  double v6 = v4 - *(double *)&qword_100215C58;
  if (v4 - *(double *)&qword_100215C58 < 0.0) {
    double v6 = -v6;
  }
  if (v6 > 0.0001)
  {
LABEL_5:
    qword_100215C58 = *(void *)&v4;
    uint64_t v7 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    double v8 = (void *)qword_100216CC0;
    qword_100216CC0 = v7;

    double v5 = (void *)qword_100216CC0;
  }

  return v5;
}

- (id)todayNumberFont
{
  if (!qword_100216CC8) {
    goto LABEL_5;
  }
  [(LargeTextLargeYearMonthView *)self todayTextSize];
  double v4 = v3 - *(double *)&qword_100215C60;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  if (v4 > 0.0001)
  {
LABEL_5:
    [(LargeTextLargeYearMonthView *)self todayTextSize];
    qword_100215C60 = v5;
    [(LargeTextLargeYearMonthView *)self todayTextSize];
    uint64_t v6 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
    uint64_t v7 = (void *)qword_100216CC8;
    qword_100216CC8 = v6;
  }
  double v8 = (void *)qword_100216CC8;

  return v8;
}

- (double)dayTextSize
{
  double v3 = objc_opt_class();
  [(LargeTextLargeYearMonthView *)self _availableSpace];

  [v3 _dayTextSizeForWindowSize:];
  return result;
}

+ (double)_dayTextSizeForWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [a1 numberOfMonthsPerRowForWindowSize:];

  [a1 _dayTextSizeForNumberOfMonthsPerRow:v6 windowSize:CGSizeMake(width, height)];
  return result;
}

+ (double)_dayTextSizeForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  [a1 _ySpacingForNumberOfMonthsPerRow:a3 windowSize:a4.width, a4.height];
  return round(13.0 / 21.0 * v4);
}

- (double)todayNumberKerning
{
  return 0.0;
}

- (double)circleSize
{
  double v3 = objc_opt_class();
  [(LargeTextLargeYearMonthView *)self _availableSpace];
  [v3 _dayTextSizeForWindowSize:];

  CalRoundToScreenScale();
  return result;
}

- (double)circleSizeForDoubleDigit
{
  [(LargeTextLargeYearMonthView *)self circleSize];
  return result;
}

- (BOOL)computeCircleFrameWithoutAdjustments
{
  return 1;
}

- (double)daysXAdjustLeft
{
  return 0.0;
}

- (double)daysYAdjustTop
{
  [(LargeTextLargeYearMonthView *)self _availableSpace];
  double v3 = v2;
  double v5 = v4;
  uint64_t v6 = EKUIHeightSizeClassForViewHierarchy();
  if (CUIKCurrentLocaleRequiresIndianLanguageAdjustments()) {
    double v7 = 10.0;
  }
  else {
    double v7 = 3.0;
  }
  [objc_opt_class() _daysYAdjustTopForWindowSize:v6 heightSizeClass:v3];
  return v7 + v8;
}

+ (double)_daysYAdjustTopForWindowSize:(CGSize)a3 heightSizeClass:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  id v8 = [a1 numberOfMonthsPerRowForWindowSize:];

  [a1 _daysYAdjustTopForNumberOfMonthsPerRow:v8 windowSize:a4 heightSizeClass:width height:height];
  return result;
}

+ (double)_daysYAdjustTopForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  double v10 = [a1 _headerFontForNumberOfMonthsPerRow:windowSize:];
  [v10 _bodyLeading];

  if ([a1 _showWeekDayInitialsForHeightSizeClass:a5])
  {
    double v11 = [a1 _weekDayInitialsFontForNumberOfMonthsPerRow:a3 windowSize:width, height];
    [v11 _bodyLeading];
  }

  CalRoundToScreenScale();
  return result;
}

- (double)xSpacing
{
  double v3 = objc_opt_class();
  [(LargeTextLargeYearMonthView *)self _availableSpace];

  [v3 _xSpacingForWindowSize:];
  return result;
}

+ (double)_xSpacingForWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [a1 numberOfMonthsPerRowForWindowSize:];

  [a1 _xSpacingForNumberOfMonthsPerRow:v6 windowSize:CGSizeMake(width, height)];
  return result;
}

+ (double)_xSpacingForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  if (EKUIWindowInterfaceParadigmForWindowSize() == 8) {
    EKUIWidthForWindowSizeParadigm();
  }

  CalFloorToScreenScale();
  return result;
}

- (double)ySpacing
{
  double v3 = objc_opt_class();
  [(LargeTextLargeYearMonthView *)self _availableSpace];

  [v3 _ySpacingForWindowSize:];
  return result;
}

+ (double)_ySpacingForWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [a1 numberOfMonthsPerRowForWindowSize];

  [a1 _ySpacingForNumberOfMonthsPerRow:v6 windowSize:CGSizeMake(width, height)];
  return result;
}

+ (double)_ySpacingForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  [a1 _xSpacingForNumberOfMonthsPerRow:a3 windowSize:CGSizeMake(a4.width, a4.height)];
  return v4 + 1.0;
}

- (BOOL)showWeekDayInitials
{
  double v2 = objc_opt_class();
  uint64_t v3 = EKUIHeightSizeClassForViewHierarchy();

  return [v2 _showWeekDayInitialsForHeightSizeClass:v3];
}

+ (BOOL)_showWeekDayInitialsForHeightSizeClass:(int64_t)a3
{
  double v4 = +[NSLocale currentLocale];
  double v5 = [v4 localeIdentifier];
  unsigned __int8 v6 = [v5 hasPrefix:@"ar"];

  if (v6) {
    return 0;
  }
  EKUIMultiwindowAssert();
  return a3 == 2;
}

- (id)weekDayInitialsFont
{
  uint64_t v3 = objc_opt_class();
  [(LargeTextLargeYearMonthView *)self _availableSpace];

  return [v3 _weekDayInitialsFontForWindowSize:];
}

+ (id)_weekDayInitialsFontForWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [a1 numberOfMonthsPerRowForWindowSize:];

  return [a1 _weekDayInitialsFontForNumberOfMonthsPerRow:v6 windowSize:CGSizeMake(width, height)];
}

+ (id)_weekDayInitialsFontForNumberOfMonthsPerRow:(unint64_t)a3 windowSize:(CGSize)a4
{
  return _objc_msgSend(a1, "_dayNumberFontForNumberOfMonthsPerRow:windowSize:", a3, a4.width, a4.height);
}

- (double)weekDayInitialsAdjustLeft
{
  return 0.0;
}

- (double)weekDayInitialsAdjustTop
{
  if (CUIKCurrentLocaleRequiresIndianLanguageAdjustments()) {
    double v3 = 10.0;
  }
  else {
    double v3 = 3.0;
  }
  double v4 = [(LargeTextLargeYearMonthView *)self headerFont];
  [v4 _bodyLeading];
  CalRoundToScreenScale();
  double v6 = v3 + v5;

  return v6;
}

- (CGSize)roundedRectSizeForDayNumberString:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)LargeTextLargeYearMonthView;
  id v4 = a3;
  [(LargeTextLargeYearMonthView *)&v15 roundedRectSizeForDayNumberString:v4];
  double v6 = v5;
  double v8 = v7;
  NSAttributedStringKey v16 = NSFontAttributeName;
  double v9 = [(LargeTextLargeYearMonthView *)self dayNumberFont];
  v17 = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [v4 sizeWithAttributes:v10];

  [(LargeTextLargeYearMonthView *)self dayTextSize];
  CalRoundToScreenScale();
  double v12 = v11;

  if (v6 >= v12) {
    double v13 = v6;
  }
  else {
    double v13 = v12;
  }
  double v14 = v8;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (BOOL)shouldAddPreciseInteractivity
{
  return 0;
}

@end