@interface LargeYearMonthView
+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5;
- (BOOL)_useNewPhonePlusMetricsForSizeParadigm:(unint64_t)a3;
- (BOOL)shouldAddPreciseInteractivity;
- (BOOL)showWeekDayInitials;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)circleFrameYAdjustment;
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
- (double)todayTextSize;
- (double)todayTextYAdjustment;
- (double)viewWidthForSizing;
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

@implementation LargeYearMonthView

- (double)viewWidthForSizing
{
  double v3 = AnchoredValueCurrentWindowWidth(self);
  v4 = [(LargeYearMonthView *)self window];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(LargeYearMonthView *)self window];
    [v6 mainContentSize];
    double v3 = v7;
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(LargeYearMonthView *)self xSpacing];
  double v5 = v4 * (double)(uint64_t)[(LargeYearMonthView *)self daysInWeek] + 2.0;
  uint64_t v6 = EKUIInterfaceOrientationForViewHierarchy();
  double v7 = objc_opt_class();
  EKUICurrentWindowSize();
  [v7 heightForInterfaceOrientation:v6 windowSize:EKUIHeightSizeClassForViewHierarchy() heightSizeClass:v8 v9];
  double v11 = v10;
  double v12 = v5;
  result.height = v11;
  result.width = v12;
  return result;
}

+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  double width = a4.width;
  uint64_t v6 = EKUIWindowSizeParadigmForWindowSize();
  uint64_t v7 = v6;
  if (v6 > 0x1FFFFFF)
  {
    if (v6 == 0x2000000 || v6 == 0x20000000)
    {
LABEL_9:
      CalRoundToScreenScale();
      return result;
    }
  }
  else if (v6 == 0x80000 || v6 == 0x800000)
  {
    goto LABEL_9;
  }
  if (EKUIWindowInterfaceParadigmForWindowSize() == 8) {
    goto LABEL_9;
  }
  if (v7 == 0x2000) {
    return 300.0;
  }
  if (qword_100216BD0 != -1) {
    dispatch_once(&qword_100216BD0, &stru_1001D5E70);
  }
  double v9 = (void *)qword_100216BC8;

  [v9 valueForSize:width];
  return result;
}

- (double)xInset
{
  return 1.0;
}

- (double)yInset
{
  return 0.0;
}

- (double)headerXAdjust
{
  if (EKUICurrentWindowInterfaceParadigm() == 8)
  {
    CalRoundToScreenScale();
  }
  else
  {
    if (qword_100216BE0 != -1) {
      dispatch_once(&qword_100216BE0, &stru_1001D5E90);
    }
    double v4 = (void *)qword_100216BD8;
    double v5 = AnchoredValueCurrentWindowWidth(self);
    [v4 valueForSize:v5];
  }
  return result;
}

- (double)headerFontMaxSize
{
  char v2 = EKUICurrentWindowInterfaceParadigm();
  double v3 = 16.0;
  if ((v2 & 0xC) != 0) {
    return v3;
  }
  char v4 = EKUICurrentWindowSizeParadigmForViewHierarchy();
  double v3 = 17.0;
  if ((v4 & 6) != 0) {
    return v3;
  }
  uint64_t v5 = EKUICurrentWindowSizeParadigmForViewHierarchy();
  double v3 = 20.0;
  double result = 30.0;
  if (v5 != 0x2000) {
    return v3;
  }
  return result;
}

- (double)headerFontMinSize
{
  return 17.0;
}

- (id)headerFont
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100127458;
  block[3] = &unk_1001D2740;
  block[4] = self;
  if (qword_100216BF0 != -1) {
    dispatch_once(&qword_100216BF0, block);
  }
  return (id)qword_100216BE8;
}

- (double)headerFontKerning
{
  return 0.0;
}

- (id)dayNumberFont
{
  if (!qword_100216BF8) {
    goto LABEL_5;
  }
  [(LargeYearMonthView *)self dayTextSize];
  double v4 = v3 - *(double *)&qword_100215C38;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  if (v4 > 0.0001)
  {
LABEL_5:
    [(LargeYearMonthView *)self dayTextSize];
    qword_100215C38 = v5;
    [(LargeYearMonthView *)self dayTextSize];
    uint64_t v6 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    uint64_t v7 = (void *)qword_100216BF8;
    qword_100216BF8 = v6;
  }
  double v8 = (void *)qword_100216BF8;

  return v8;
}

- (id)todayNumberFont
{
  if (!qword_100216C00) {
    goto LABEL_5;
  }
  [(LargeYearMonthView *)self todayTextSize];
  double v4 = v3 - *(double *)&qword_100215C40;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  if (v4 > 0.0001)
  {
LABEL_5:
    [(LargeYearMonthView *)self todayTextSize];
    qword_100215C40 = v5;
    [(LargeYearMonthView *)self todayTextSize];
    uint64_t v6 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
    uint64_t v7 = (void *)qword_100216C00;
    qword_100216C00 = v6;
  }
  double v8 = (void *)qword_100216C00;

  return v8;
}

- (BOOL)_useNewPhonePlusMetricsForSizeParadigm:(unint64_t)a3
{
  int64x2_t v3 = vdupq_n_s64(a3);
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_1001C1890), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_1001C18A0)))) & 1 | (a3 == 0x20000000);
}

- (double)dayTextSize
{
  uint64_t v3 = EKUICurrentWindowSizeParadigmForViewHierarchy();
  unsigned __int8 v4 = [(LargeYearMonthView *)self _useNewPhonePlusMetricsForSizeParadigm:v3];
  double result = 9.0;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = EKUICurrentWindowInterfaceParadigm();
    double result = 8.0;
    if (v6 != 8)
    {
      double result = 17.0;
      if (v3 != 0x2000)
      {
        if (qword_100216C10 != -1) {
          dispatch_once(&qword_100216C10, &stru_1001D5EB0);
        }
        uint64_t v7 = (void *)qword_100216C08;
        [(LargeYearMonthView *)self viewWidthForSizing];
        [v7 valueForSize:];
        return fmin(v8, 19.5);
      }
    }
  }
  return result;
}

- (double)todayTextSize
{
  uint64_t v3 = EKUICurrentWindowSizeParadigmForViewHierarchy();
  unsigned __int8 v4 = [(LargeYearMonthView *)self _useNewPhonePlusMetricsForSizeParadigm:v3];
  double result = 9.0;
  if ((v4 & 1) == 0)
  {
    if (EKUICurrentWindowInterfaceParadigm() == 8)
    {
      CalRoundToScreenScale();
    }
    else
    {
      double result = 17.0;
      if (v3 != 0x2000)
      {
        if (qword_100216C20 != -1) {
          dispatch_once(&qword_100216C20, &stru_1001D5ED0);
        }
        uint64_t v6 = (void *)qword_100216C18;
        [(LargeYearMonthView *)self viewWidthForSizing];
        [v6 valueForSize:];
        return fmin(v7, 19.5);
      }
    }
  }
  return result;
}

- (double)todayNumberKerning
{
  return 0.0;
}

- (double)circleSize
{
  if (EKUICurrentWindowInterfaceParadigm() == 8)
  {
    CalRoundToScreenScale();
  }
  else
  {
    uint64_t v4 = EKUICurrentWindowSizeParadigmForViewHierarchy();
    double result = 28.0;
    if (v4 != 0x2000)
    {
      if (qword_100216C30 != -1) {
        dispatch_once(&qword_100216C30, &stru_1001D5EF0);
      }
      uint64_t v5 = (void *)qword_100216C28;
      [(LargeYearMonthView *)self viewWidthForSizing];
      [v5 valueForSize:];
      return fmin(v6, 34.5);
    }
  }
  return result;
}

- (double)todayTextYAdjustment
{
  if (EKUICurrentWindowInterfaceParadigm() == 8)
  {
    CalRoundToScreenScale();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)LargeYearMonthView;
    [(LargeYearMonthView *)&v4 todayTextYAdjustment];
  }
  return result;
}

- (double)circleFrameYAdjustment
{
  uint64_t v3 = EKUICurrentWindowSizeParadigmForViewHierarchy();
  if ([(LargeYearMonthView *)self _useNewPhonePlusMetricsForSizeParadigm:v3])
  {
    return 3.0;
  }
  if (EKUICurrentWindowInterfaceParadigm() == 8 || v3 == 0x2000)
  {
    CalRoundToScreenScale();
  }
  else
  {
    if (qword_100216C40 != -1) {
      dispatch_once(&qword_100216C40, &stru_1001D5F10);
    }
    uint64_t v5 = (void *)qword_100216C38;
    [(LargeYearMonthView *)self viewWidthForSizing];
    [v5 valueForSize:];
  }
  return result;
}

- (double)circleSizeForDoubleDigit
{
  [(LargeYearMonthView *)self circleSize];
  return result;
}

- (double)daysXAdjustLeft
{
  return 0.0;
}

- (double)daysYAdjustTop
{
  uint64_t v3 = EKUICurrentWindowSizeParadigmForViewHierarchy();
  if ([(LargeYearMonthView *)self _useNewPhonePlusMetricsForSizeParadigm:v3]|| EKUICurrentWindowInterfaceParadigm() == 8)
  {
    CalRoundToScreenScale();
  }
  else if (v3 == 0x2000)
  {
    return 75.0;
  }
  else
  {
    if (qword_100216C50 != -1) {
      dispatch_once(&qword_100216C50, &stru_1001D5F30);
    }
    uint64_t v5 = (void *)qword_100216C48;
    [(LargeYearMonthView *)self viewWidthForSizing];
    [v5 valueForSize:];
  }
  return result;
}

- (double)xSpacing
{
  uint64_t v3 = EKUICurrentWindowSizeParadigmForViewHierarchy();
  if ([(LargeYearMonthView *)self _useNewPhonePlusMetricsForSizeParadigm:v3]|| EKUICurrentWindowInterfaceParadigm() == 8)
  {
    CalRoundToScreenScale();
  }
  else
  {
    double result = 31.0;
    if (v3 != 0x2000)
    {
      if (qword_100216C60 != -1) {
        dispatch_once(&qword_100216C60, &stru_1001D5F50);
      }
      uint64_t v5 = (void *)qword_100216C58;
      [(LargeYearMonthView *)self viewWidthForSizing];
      [v5 valueForSize:];
      return fmin(v6, 31.0);
    }
  }
  return result;
}

- (double)ySpacing
{
  if (EKUICurrentWindowInterfaceParadigm() == 8)
  {
    CalRoundToScreenScale();
  }
  else if (EKUICurrentWindowSizeParadigmForViewHierarchy() == 0x2000)
  {
    return 30.0;
  }
  else
  {
    if (qword_100216C70 != -1) {
      dispatch_once(&qword_100216C70, &stru_1001D5F70);
    }
    objc_super v4 = (void *)qword_100216C68;
    [(LargeYearMonthView *)self viewWidthForSizing];
    [v4 valueForSize:];
  }
  return result;
}

- (BOOL)showWeekDayInitials
{
  char v2 = +[NSLocale currentLocale];
  uint64_t v3 = [v2 localeIdentifier];
  unsigned __int8 v4 = [v3 hasPrefix:@"ar"];

  if (v4) {
    return 0;
  }

  return EKUICurrentHeightSizeClassIsRegular();
}

- (id)weekDayInitialsFont
{
  if (qword_100216C80 != -1) {
    dispatch_once(&qword_100216C80, &stru_1001D5F90);
  }
  uint64_t v3 = (void *)qword_100216C78;
  [(LargeYearMonthView *)self viewWidthForSizing];
  [v3 valueForSize:];

  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (double)weekDayInitialsAdjustLeft
{
  [(LargeYearMonthView *)self daysXAdjustLeft];
  return result;
}

- (double)weekDayInitialsAdjustTop
{
  if (EKUICurrentWindowInterfaceParadigm() == 8)
  {
    CalRoundToScreenScale();
  }
  else if (EKUICurrentWindowSizeParadigmForViewHierarchy() == 0x2000)
  {
    return 50.0;
  }
  else
  {
    if (qword_100216C90 != -1) {
      dispatch_once(&qword_100216C90, &stru_1001D5FB0);
    }
    unsigned __int8 v4 = (void *)qword_100216C88;
    [(LargeYearMonthView *)self viewWidthForSizing];
    [v4 valueForSize:];
  }
  return result;
}

- (BOOL)shouldAddPreciseInteractivity
{
  return 0;
}

@end