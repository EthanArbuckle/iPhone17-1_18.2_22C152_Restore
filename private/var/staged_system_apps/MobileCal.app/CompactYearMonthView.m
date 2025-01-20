@interface CompactYearMonthView
+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5;
- (BOOL)shouldAddPreciseInteractivity;
- (BOOL)showWeekDayInitials;
- (CGRect)frameForGridOfDays:(BOOL)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CompactYearMonthView)initWithCalendarDate:(id)a3 calendar:(id)a4;
- (double)_gridOfDaysHeightAdjustment;
- (double)_gridOfDaysYAdjustment;
- (double)circleFrameYAdjustment;
- (double)circleSize;
- (double)circleSizeForDoubleDigit;
- (double)dayNumberKerning;
- (double)dayTextSize;
- (double)daysXAdjustLeft;
- (double)daysYAdjustTop;
- (double)headerFontKerning;
- (double)headerFontMaxSize;
- (double)headerFontMinSize;
- (double)headerXAdjust;
- (double)todayNumberKerning;
- (double)todayTextSize;
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
- (void)_localeChanged:(id)a3;
@end

@implementation CompactYearMonthView

- (CompactYearMonthView)initWithCalendarDate:(id)a3 calendar:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CompactYearMonthView;
  v4 = [(CompactYearMonthView *)&v8 init];
  if (v4)
  {
    v5 = +[UIColor systemBackgroundColor];
    [(CompactYearMonthView *)v4 setBackgroundColor:v5];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v4 selector:"_localeChanged:" name:NSCurrentLocaleDidChangeNotification object:0];
  }
  return v4;
}

- (void)_localeChanged:(id)a3
{
  v3 = (void *)qword_1002168A8;
  qword_1002168A8 = 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (qword_1002168B8 != -1) {
    dispatch_once(&qword_1002168B8, &stru_1001D4F60);
  }
  v3 = (void *)qword_1002168B0;
  EKUICurrentWindowSize();
  [v3 valueForSize:];
  uint64_t v5 = v4;
  EKUICurrentWindowSize();
  uint64_t v6 = EKUIWindowSizeParadigmForWindowSize();
  if (v6 == 0x400000)
  {
    *(double *)&uint64_t v5 = 110.0;
  }
  else if (v6 == 0x1000000)
  {
    *(double *)&uint64_t v5 = 122.0;
  }
  uint64_t v7 = EKUIInterfaceOrientationForViewHierarchy();
  objc_super v8 = objc_opt_class();
  EKUICurrentWindowSize();
  [v8 heightForInterfaceOrientation:v7 windowSize:EKUIHeightSizeClassForViewHierarchy() heightSizeClass:v9 v10];
  double v12 = v11;
  double v13 = *(double *)&v5;
  result.height = v12;
  result.width = v13;
  return result;
}

+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  double width = a4.width;
  if (qword_1002168C8 != -1) {
    dispatch_once(&qword_1002168C8, &stru_1001D4F80);
  }
  uint64_t v6 = EKUIWindowSizeParadigmForWindowSize();
  if (v6 > 0xFFFFFF)
  {
    switch(v6)
    {
      case 0x1000000:
        return 161.0;
      case 0x4000000:
        return 150.0;
      case 0x10000000:
        return 165.0;
    }
  }
  else
  {
    switch(v6)
    {
      case 0x20000:
        return 138.0;
      case 0x40000:
        return 147.0;
      case 0x400000:
        return 148.0;
    }
  }
  objc_super v8 = (void *)qword_1002168C0;

  [v8 valueForSize:width];
  return result;
}

- (CGRect)frameForGridOfDays:(BOOL)a3
{
  BOOL v3 = a3;
  [(CompactYearMonthView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CompactYearMonthView *)self daysYAdjustTop];
  double v12 = v11;
  [(CompactYearMonthView *)self yInset];
  double v14 = v8 + v12 + v13 + -1.5;
  v15 = [(CompactYearMonthView *)self calendar];
  id v16 = [v15 copy];

  [v16 setFirstWeekday:CUIKOneIndexedWeekStart()];
  v17 = [(CompactYearMonthView *)self calendarDate];
  v18 = [v17 date];
  [v16 rangeOfUnit:4096 inUnit:8 forDate:v18];
  unint64_t v20 = v19;

  [(CompactYearMonthView *)self ySpacing];
  double v22 = v21 * (double)v20;
  if (v3)
  {
    [(CompactYearMonthView *)self _gridOfDaysYAdjustment];
    double v14 = v14 + v23;
    [(CompactYearMonthView *)self _gridOfDaysHeightAdjustment];
    double v22 = v22 + v24;
  }

  double v25 = v6;
  double v26 = v14;
  double v27 = v10;
  double v28 = v22;
  result.size.height = v28;
  result.size.double width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (double)_gridOfDaysYAdjustment
{
  if (qword_1002168D8 != -1) {
    dispatch_once(&qword_1002168D8, &stru_1001D4FA0);
  }
  BOOL v3 = (void *)qword_1002168D0;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)_gridOfDaysHeightAdjustment
{
  if (qword_1002168E8 != -1) {
    dispatch_once(&qword_1002168E8, &stru_1001D4FC0);
  }
  BOOL v3 = (void *)qword_1002168E0;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)xInset
{
  if (qword_1002168F8 != -1) {
    dispatch_once(&qword_1002168F8, &stru_1001D4FE0);
  }
  BOOL v3 = (void *)qword_1002168F0;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)yInset
{
  return 0.0;
}

- (double)headerXAdjust
{
  return -3.0;
}

- (double)headerFontMaxSize
{
  char v2 = EKUICurrentWindowSizeParadigmForViewHierarchy();
  double result = 17.0;
  if ((v2 & 6) == 0) {
    return 20.0;
  }
  return result;
}

- (double)headerFontMinSize
{
  return 11.0;
}

- (id)headerFont
{
  BOOL v3 = (void *)qword_100216900;
  if (!qword_100216900)
  {
    uint64_t v4 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle3 addingSymbolicTraits:32770 options:0];
    [(CompactYearMonthView *)self headerFontMaxSize];
    uint64_t v5 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4);
    double v6 = (void *)qword_100216900;
    qword_100216900 = v5;

    BOOL v3 = (void *)qword_100216900;
  }

  return v3;
}

- (double)headerFontKerning
{
  return 0.0;
}

- (id)dayNumberFont
{
  if (!qword_100216908) {
    goto LABEL_5;
  }
  [(CompactYearMonthView *)self dayTextSize];
  double v4 = v3 - *(double *)&qword_1002151A0;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  if (v4 > 0.0001)
  {
LABEL_5:
    [(CompactYearMonthView *)self dayTextSize];
    qword_1002151A0 = v5;
    [(CompactYearMonthView *)self dayTextSize];
    uint64_t v6 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    double v7 = (void *)qword_100216908;
    qword_100216908 = v6;
  }
  double v8 = (void *)qword_100216908;

  return v8;
}

- (id)todayNumberFont
{
  if (!qword_100216910) {
    goto LABEL_5;
  }
  [(CompactYearMonthView *)self todayTextSize];
  double v4 = v3 - *(double *)&qword_1002151A8;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  if (v4 > 0.0001)
  {
LABEL_5:
    [(CompactYearMonthView *)self todayTextSize];
    qword_1002151A8 = v5;
    [(CompactYearMonthView *)self todayTextSize];
    uint64_t v6 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
    double v7 = (void *)qword_100216910;
    qword_100216910 = v6;
  }
  double v8 = (void *)qword_100216910;

  return v8;
}

- (double)dayTextSize
{
  double v3 = (void *)qword_1002168A8;
  if (!qword_1002168A8)
  {
    double v4 = objc_opt_new();
    objc_storeStrong((id *)&qword_1002168A8, v4);
    uint64_t v5 = +[NSLocale currentLocale];
    uint64_t v6 = [v5 objectForKey:NSLocaleLanguageCode];

    double v7 = CUIKLocalizedStringForInteger();
    unsigned int v8 = [v7 isEqual:@"൧"];

    unsigned int v9 = [v6 isEqual:@"ml"];
    double v10 = 5.0;
    if ((v9 & v8) != 0)
    {
      double v11 = 6.0;
    }
    else
    {
      double v10 = 8.0;
      double v11 = 9.0;
    }
    if ((v9 & v8) != 0) {
      double v12 = 7.666;
    }
    else {
      double v12 = 10.6666667;
    }
    if ((v9 & v8) != 0) {
      double v13 = 7.0;
    }
    else {
      double v13 = 10.0;
    }
    if ((v9 & v8) != 0) {
      double v14 = 8.0;
    }
    else {
      double v14 = 11.0;
    }
    [v4 addAnchoredValue:2 forWindowSizeWidth:v10];
    [v4 addAnchoredValue:16 forWindowSizeWidth:v11];
    [v4 addAnchoredValue:32 forWindowSizeWidth:v12];
    [v4 addAnchoredValue:0x400000 forWindowSizeWidth:v13];
    [v4 addAnchoredValue:0x1000000 forWindowSizeWidth:v14];
    [v4 addAnchoredValue:128 forWindowSizeWidth:v14];

    double v3 = (void *)qword_1002168A8;
  }
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)todayTextSize
{
  if (qword_100216920 != -1) {
    dispatch_once(&qword_100216920, &stru_1001D5000);
  }
  double v3 = (void *)qword_100216918;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)circleSize
{
  if (qword_100216930 != -1) {
    dispatch_once(&qword_100216930, &stru_1001D5020);
  }
  double v3 = (void *)qword_100216928;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)circleSizeForDoubleDigit
{
  [(CompactYearMonthView *)self circleSize];
  return result;
}

- (double)daysXAdjustLeft
{
  return -5.0;
}

- (double)daysYAdjustTop
{
  if (qword_100216940 != -1) {
    dispatch_once(&qword_100216940, &stru_1001D5040);
  }
  if (EKUICurrentWindowSizeParadigmForViewHierarchy() == 0x20000) {
    return 32.0;
  }
  int v4 = CUIKCurrentLocaleRequiresIndianLanguageAdjustments();
  uint64_t v5 = (void *)qword_100216938;
  AnchoredValueCurrentWindowWidth(self);
  [v5 valueForSize:];
  double v7 = 3.0;
  if (v4) {
    double v7 = 10.0;
  }
  return v7 + v6;
}

- (double)xSpacing
{
  if (qword_100216950 != -1) {
    dispatch_once(&qword_100216950, &stru_1001D5060);
  }
  double v3 = (void *)qword_100216948;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)ySpacing
{
  if (qword_100216960 != -1) {
    dispatch_once(&qword_100216960, &stru_1001D5080);
  }
  double v3 = (void *)qword_100216958;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)dayNumberKerning
{
  if (qword_100216970 != -1) {
    dispatch_once(&qword_100216970, &stru_1001D50A0);
  }
  double v3 = (void *)qword_100216968;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)todayNumberKerning
{
  if (qword_100216980 != -1) {
    dispatch_once(&qword_100216980, &stru_1001D50C0);
  }
  double v3 = (void *)qword_100216978;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (BOOL)showWeekDayInitials
{
  return 0;
}

- (id)weekDayInitialsFont
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

- (double)circleFrameYAdjustment
{
  if (qword_100216990 != -1) {
    dispatch_once(&qword_100216990, &stru_1001D50E0);
  }
  double v3 = (void *)qword_100216988;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (BOOL)shouldAddPreciseInteractivity
{
  return 0;
}

@end