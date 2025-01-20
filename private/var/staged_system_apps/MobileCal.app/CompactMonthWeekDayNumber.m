@interface CompactMonthWeekDayNumber
+ (double)baselineOffsetFromTopOfLayerForFontSize:(double)a3;
+ (double)heightOfFrameForFontSize:(double)a3;
+ (id)_generateImageWithString:(id)a3 color:(id)a4 fontSize:(double)a5;
+ (id)_standardLabelForFontSize:(double)a3;
+ (id)dayNumberFontForSize:(double)a3;
- (BOOL)_calendarDateIsOnWeekend;
- (BOOL)representsActualDate;
- (CALayer)dayTypeBadge;
- (CALayer)layer;
- (CGRect)frame;
- (CompactMonthWeekDayNumber)init;
- (CompactMonthWeekDayNumber)initWithWeekView:(id)a3 andCalendar:(id)a4;
- (CompactMonthWeekDayOverlay)overlay;
- (CompactMonthWeekTodayCircle)attachedTodayCircle;
- (EKCalendarDate)calendarDate;
- (NSCalendar)calendar;
- (NSString)dayBadgeLocale;
- (UIColor)dayBadgeColor;
- (double)fontSize;
- (double)offsetX;
- (double)overlayFontSize;
- (id)_weekdayImageForDayNumberString:(id)a3;
- (id)_weekendImageForDayNumberString:(id)a3;
- (id)description;
- (int64_t)dayBadgeType;
- (void)hideOverlayAndNumber:(BOOL)a3;
- (void)setAttachedTodayCircle:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setCalendarDate:(id)a3;
- (void)setDayBadgeColor:(id)a3;
- (void)setDayBadgeLocale:(id)a3;
- (void)setDayBadgeType:(int64_t)a3;
- (void)setDayTypeBadge:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setOverlay:(id)a3;
- (void)setOverlayFontSize:(double)a3;
- (void)updateDayNumber;
- (void)updateOverlay;
@end

@implementation CompactMonthWeekDayNumber

- (CompactMonthWeekDayNumber)initWithWeekView:(id)a3 andCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CompactMonthWeekDayNumber;
  v8 = [(CompactMonthWeekDayNumber *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_weekView, v6);
    v10 = (CALayer *)objc_alloc_init((Class)CALayer);
    layer = v9->_layer;
    v9->_layer = v10;

    id v12 = +[UIColor clearColor];
    -[CALayer setBackgroundColor:](v9->_layer, "setBackgroundColor:", [v12 CGColor]);

    v13 = [v6 layer];
    [v13 addSublayer:v9->_layer];

    objc_storeStrong((id *)&v9->_calendar, a4);
    uint64_t v14 = objc_opt_new();
    dayTypeBadge = v9->_dayTypeBadge;
    v9->_dayTypeBadge = (CALayer *)v14;

    [objc_opt_class() dayTypeBadgeDiameter:[v6 compressedVerticalMode]];
    [(CALayer *)v9->_dayTypeBadge setCornerRadius:v16 * 0.5];
    *(_OWORD *)&v9->_fontSize = xmmword_1001C1590;
  }

  return v9;
}

- (CompactMonthWeekDayNumber)init
{
  v7.receiver = self;
  v7.super_class = (Class)CompactMonthWeekDayNumber;
  v2 = [(CompactMonthWeekDayNumber *)&v7 init];
  if (v2)
  {
    v3 = (CALayer *)objc_alloc_init((Class)CALayer);
    layer = v2->_layer;
    v2->_layer = v3;

    id v5 = +[UIColor clearColor];
    -[CALayer setBackgroundColor:](v2->_layer, "setBackgroundColor:", [v5 CGColor]);
  }
  return v2;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)CompactMonthWeekDayNumber;
  v3 = [(CompactMonthWeekDayNumber *)&v13 description];
  v4 = [(CompactMonthWeekDayNumber *)self calendarDate];
  layer = self->_layer;
  id v6 = [(CompactMonthWeekDayNumber *)self layer];
  unsigned int v7 = [v6 isHidden];
  [(CALayer *)self->_layer frame];
  v8 = NSStringFromCGRect(v15);
  double offsetX = self->_offsetX;
  v10 = [(CompactMonthWeekDayNumber *)self overlay];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@;\n\tcalendarDate: [%@]\n\tlayer: [%@]\n\tlayerHidden: [%d]\n\tlayer.frame: [%@]\n\toffsetX: [%f]\n\toverlayHidden: [%d]",
    v3,
    v4,
    layer,
    v7,
    v8,
    *(void *)&offsetX,
  v11 = [v10 isHidden]);

  return v11;
}

- (void)updateOverlay
{
  uint64_t v3 = CUIKGetOverlayCalendar();
  overlay = self->_overlay;
  if (overlay) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  id v20 = (id)v3;
  if (v5)
  {
    if (overlay) {
      BOOL v6 = v3 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (!v6)
    {
      [(CompactMonthWeekDayNumber *)self overlayFontSize];
      -[CompactMonthWeekDayOverlay setFontSize:](self->_overlay, "setFontSize:");
      [(CompactMonthWeekDayOverlay *)self->_overlay update];
      unsigned int v7 = [(CompactMonthWeekDayNumber *)self attachedTodayCircle];
      [v7 updateOverlay];
      goto LABEL_17;
    }
    [(CompactMonthWeekDayOverlay *)overlay removeFromSuperview];
    objc_super v18 = self->_overlay;
    self->_overlay = 0;

    p_weekView = &self->_weekView;
  }
  else
  {
    v8 = (CompactMonthWeekDayOverlay *)objc_opt_new();
    v9 = self->_overlay;
    self->_overlay = v8;

    [(CompactMonthWeekDayNumber *)self overlayFontSize];
    -[CompactMonthWeekDayOverlay setFontSize:](self->_overlay, "setFontSize:");
    v10 = [(CompactMonthWeekDayNumber *)self calendarDate];
    v11 = [v10 date];
    [(CompactMonthWeekDayOverlay *)self->_overlay setDate:v11];

    id v12 = [(CompactMonthWeekDayNumber *)self attachedTodayCircle];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_weekView);
    uint64_t v14 = WeakRetained;
    CGRect v15 = self->_overlay;
    if (v12)
    {
      double v16 = [(CompactMonthWeekDayNumber *)self attachedTodayCircle];
      [v14 insertSubview:v15 belowSubview:v16];

      v17 = [(CompactMonthWeekDayNumber *)self attachedTodayCircle];
      [v17 setShowOverlay:1];

      [(CompactMonthWeekDayOverlay *)self->_overlay setHidden:1];
    }
    else
    {
      [WeakRetained addSubview:self->_overlay];
    }
    p_weekView = &self->_weekView;
  }
  unsigned int v7 = objc_loadWeakRetained((id *)p_weekView);
  [v7 setNeedsLayout];
LABEL_17:
}

- (void)hideOverlayAndNumber:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CompactMonthWeekDayNumber *)self overlay];
  [v5 setHidden:v3];

  id v6 = [(CompactMonthWeekDayNumber *)self layer];
  [v6 setHidden:v3];
}

- (CALayer)layer
{
  return self->_layer;
}

- (double)offsetX
{
  return self->_offsetX;
}

+ (double)baselineOffsetFromTopOfLayerForFontSize:(double)a3
{
  double result = *(double *)&qword_1002167D0;
  if (*(double *)&qword_1002167D0 == 0.0 || vabdd_f64(*(double *)&qword_1002167D8, a3) >= 2.22044605e-16)
  {
    BOOL v5 = [(id)objc_opt_class() _standardLabelForFontSize:a3];
    [v5 sizeToFit];
    [v5 _firstLineBaselineOffsetFromBoundsTop];
    qword_1002167D0 = v6;
    qword_1002167D8 = *(void *)&a3;

    return *(double *)&qword_1002167D0;
  }
  return result;
}

+ (double)heightOfFrameForFontSize:(double)a3
{
  double result = *(double *)&qword_1002167E0;
  if (*(double *)&qword_1002167E0 == 0.0 || vabdd_f64(*(double *)&qword_1002167E8, a3) >= 2.22044605e-16)
  {
    BOOL v5 = [(id)objc_opt_class() _standardLabelForFontSize:a3];
    [v5 sizeToFit];
    [v5 frame];
    qword_1002167E0 = v6;
    qword_1002167E8 = *(void *)&a3;

    return *(double *)&qword_1002167E0;
  }
  return result;
}

- (void)setCalendarDate:(id)a3
{
  uint64_t v6 = (EKCalendarDate *)a3;
  if (self->_calendarDate != v6)
  {
    objc_storeStrong((id *)&self->_calendarDate, a3);
    BOOL v5 = [(EKCalendarDate *)v6 date];
    [(CompactMonthWeekDayOverlay *)self->_overlay setDate:v5];

    [(CompactMonthWeekDayNumber *)self updateDayNumber];
  }
}

- (void)updateDayNumber
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(CALayer *)self->_layer setHidden:self->_calendarDate == 0];
  calendarDate = self->_calendarDate;
  if (calendarDate)
  {
    [(EKCalendarDate *)calendarDate day];
    v4 = CUIKLocalizedStringForInteger();
    if ([(CompactMonthWeekDayNumber *)self _calendarDateIsOnWeekend]) {
      [(CompactMonthWeekDayNumber *)self _weekendImageForDayNumberString:v4];
    }
    else {
    id v5 = [(CompactMonthWeekDayNumber *)self _weekdayImageForDayNumberString:v4];
    }
    -[CALayer setContents:](self->_layer, "setContents:", [v5 CGImage]);
    [(CALayer *)self->_layer frame];
    double v7 = v6;
    double v9 = v8;
    [v5 size];
    -[CALayer setFrame:](self->_layer, "setFrame:", v7, v9, v10, v11);
    id v12 = objc_opt_class();
    [(CompactMonthWeekDayNumber *)self fontSize];
    objc_super v13 = [v12 dayNumberFontForSize:];
    CalOffsetToCenterNumberWithFont();
    self->_double offsetX = v14;
  }

  +[CATransaction commit];
}

- (BOOL)representsActualDate
{
  v2 = [(CompactMonthWeekDayNumber *)self calendarDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_calendarDateIsOnWeekend
{
  BOOL v3 = +[CUIKPreferences sharedPreferences];
  unsigned int v4 = [v3 overrideLocaleWeekends];

  if (v4)
  {
    id v5 = [(EKCalendarDate *)self->_calendarDate dayOfWeek];
    return v5 == (id)7 || v5 == (id)1;
  }
  else
  {
    calendar = self->_calendar;
    double v9 = [(EKCalendarDate *)self->_calendarDate date];
    LOBYTE(calendar) = [(NSCalendar *)calendar isDateInWeekend:v9];

    return (char)calendar;
  }
}

+ (id)_standardLabelForFontSize:(double)a3
{
  id v4 = objc_alloc_init((Class)UILabel);
  id v5 = [(id)objc_opt_class() dayNumberFontForSize:a3];
  [v4 setFont:v5];

  [v4 setText:@"0"];

  return v4;
}

+ (id)_generateImageWithString:(id)a3 color:(id)a4 fontSize:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  double v10 = [a1 dayNumberFontForSize:a5];
  v17[0] = NSFontAttributeName;
  v17[1] = NSForegroundColorAttributeName;
  v18[0] = v10;
  v18[1] = v8;
  double v11 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  [v9 boundingRectWithSize:0 options:v11 attributes:0 context:CGSizeZero.width, CGSizeZero.height];
  double v13 = v12;
  CalCeilToScreenScale();
  double width = v20.width;
  v20.height = v13;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  [v9 drawInRect:v11 withAttributes:0.0, 0.0, width, v13];

  CGRect v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)_weekdayImageForDayNumberString:(id)a3
{
  id v4 = a3;
  if (qword_1002167F8 != -1) {
    dispatch_once(&qword_1002167F8, &stru_1001D4C50);
  }
  [(CompactMonthWeekDayNumber *)self fontSize];
  uint64_t v6 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weekView);
  id v8 = [WeakRetained traitCollection];
  id v9 = [v4 stringByAppendingFormat:@"-%.2f:%tu", v6, [v8 userInterfaceStyle]];

  double v10 = [(id)qword_1002167F0 objectForKey:v9];
  if (!v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_weekView);
    double v12 = [v11 traitCollection];
    +[UITraitCollection _setCurrentTraitCollection:v12];

    double v13 = +[UIColor labelColor];
    double v14 = objc_opt_class();
    [(CompactMonthWeekDayNumber *)self fontSize];
    double v10 = [v14 _generateImageWithString:v4 color:v13 fontSize:];
    [(id)qword_1002167F0 setObject:v10 forKey:v9];
  }

  return v10;
}

- (id)_weekendImageForDayNumberString:(id)a3
{
  id v4 = a3;
  if (qword_100216808 != -1) {
    dispatch_once(&qword_100216808, &stru_1001D4C70);
  }
  [(CompactMonthWeekDayNumber *)self fontSize];
  uint64_t v6 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weekView);
  id v8 = [WeakRetained traitCollection];
  id v9 = [v4 stringByAppendingFormat:@"-%.2f:%tu", v6, [v8 userInterfaceStyle]];

  double v10 = [(id)qword_100216800 objectForKey:v9];
  if (!v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_weekView);
    double v12 = [v11 traitCollection];
    +[UITraitCollection _setCurrentTraitCollection:v12];

    double v13 = WeekendTextColor();
    double v14 = objc_opt_class();
    [(CompactMonthWeekDayNumber *)self fontSize];
    double v10 = [v14 _generateImageWithString:v4 color:v13 fontSize:];
    [(id)qword_100216800 setObject:v10 forKey:v9];
  }

  return v10;
}

+ (id)dayNumberFontForSize:(double)a3
{
  id v4 = (void *)qword_100216818;
  if (!qword_100216818 || vabdd_f64(*(double *)&qword_100216810, a3) >= 2.22044605e-16)
  {
    uint64_t v5 = +[UIFont systemFontOfSize:a3 weight:UIFontWeightSemibold];
    uint64_t v6 = (void *)qword_100216818;
    qword_100216818 = v5;

    qword_100216810 = *(void *)&a3;
    id v4 = (void *)qword_100216818;
  }

  return v4;
}

- (EKCalendarDate)calendarDate
{
  return self->_calendarDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (CompactMonthWeekTodayCircle)attachedTodayCircle
{
  return self->_attachedTodayCircle;
}

- (void)setAttachedTodayCircle:(id)a3
{
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CompactMonthWeekDayOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
}

- (CALayer)dayTypeBadge
{
  return self->_dayTypeBadge;
}

- (void)setDayTypeBadge:(id)a3
{
}

- (int64_t)dayBadgeType
{
  return self->_dayBadgeType;
}

- (void)setDayBadgeType:(int64_t)a3
{
  self->_dayBadgeType = a3;
}

- (UIColor)dayBadgeColor
{
  return self->_dayBadgeColor;
}

- (void)setDayBadgeColor:(id)a3
{
}

- (NSString)dayBadgeLocale
{
  return self->_dayBadgeLocale;
}

- (void)setDayBadgeLocale:(id)a3
{
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)overlayFontSize
{
  return self->_overlayFontSize;
}

- (void)setOverlayFontSize:(double)a3
{
  self->_overlayFontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayBadgeLocale, 0);
  objc_storeStrong((id *)&self->_dayBadgeColor, 0);
  objc_storeStrong((id *)&self->_dayTypeBadge, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_attachedTodayCircle, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_calendarDate, 0);
  objc_destroyWeak((id *)&self->_weekView);

  objc_storeStrong((id *)&self->_layer, 0);
}

@end