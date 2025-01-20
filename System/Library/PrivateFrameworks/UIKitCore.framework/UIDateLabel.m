@interface UIDateLabel
+ (id)_dateFormatter;
+ (id)_relativeDateFormatter;
+ (id)_timeOnlyDateFormatter;
+ (id)_weekdayDateFormatter;
+ (id)amString;
+ (id)defaultFont;
+ (id)pmString;
- (BOOL)boldForAllLocales;
- (BOOL)forceTimeOnly;
- (BOOL)shouldRecomputeText;
- (BOOL)timeDesignatorAppearsBeforeTime;
- (BOOL)use24HourTime;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)timeDesignatorSize;
- (NSDate)date;
- (NSString)_dateString;
- (NSString)timeDesignator;
- (UIDateLabel)initWithFrame:(CGRect)a3;
- (double)_noon;
- (double)_today;
- (double)_tomorrow;
- (double)_weekdayFormatCutoff;
- (double)_yesterday;
- (double)paddingFromTimeToDesignator;
- (double)timeInterval;
- (id)_calendar;
- (id)_dateWithDayDiffFromToday:(int64_t)a3;
- (id)_stringDrawingContext;
- (id)_todayDate;
- (id)font;
- (id)text;
- (void)_recomputeTextIfNecessary;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
- (void)invalidate;
- (void)setBoldForAllLocales:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setForceTimeOnly:(BOOL)a3;
- (void)setPaddingFromTimeToDesignator:(double)a3;
- (void)setShouldRecomputeText:(BOOL)a3;
- (void)setTimeInterval:(double)a3;
@end

@implementation UIDateLabel

+ (id)defaultFont
{
  return (id)[off_1E52D39B8 systemFontOfSize:14.0];
}

- (void)drawRect:(CGRect)a3
{
  [(UIView *)self bounds];
  -[UIDateLabel drawTextInRect:](self, "drawTextInRect:");
}

- (UIDateLabel)initWithFrame:(CGRect)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)UIDateLabel;
  v3 = -[UILabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_paddingFromTimeToDesignator = 2.0;
    [(UIDateLabel *)v3 setShouldRecomputeText:1];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel_invalidate name:0x1ED15CFC0 object:UIApp];
    [v5 addObserver:v4 selector:sel_invalidate name:0x1ED15D000 object:UIApp];
    [v5 addObserver:v4 selector:sel_invalidate name:0x1ED15D020 object:UIApp];
    v6 = +[UIColor colorWithRed:0.141176471 green:0.439215686 blue:0.847058824 alpha:1.0];
    [(UILabel *)v4 setTextColor:v6];

    [(UILabel *)v4 setLineBreakMode:2];
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    id v8 = [(UIView *)v4 registerForTraitChanges:v7 withHandler:&__block_literal_global_651];
  }
  return v4;
}

- (void)setTimeInterval:(double)a3
{
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  [(UIDateLabel *)self setDate:v4];
}

- (void)setDate:(id)a3
{
  id v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_date, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_date, a3);
    [(UIDateLabel *)self invalidate];
  }
}

- (void)invalidate
{
  calendar = self->_calendar;
  self->_calendar = 0;

  yesterday = self->_yesterday;
  self->_yesterday = 0;

  today = self->_today;
  self->_today = 0;

  noon = self->_noon;
  self->_noon = 0;

  tomorrow = self->_tomorrow;
  self->_tomorrow = 0;

  weekdayFormatCutoff = self->_weekdayFormatCutoff;
  self->_weekdayFormatCutoff = 0;

  [(UIDateLabel *)self setShouldRecomputeText:1];
  [(UILabel *)self setNeedsDisplay];
  [(UILabel *)self invalidateIntrinsicContentSize];
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v57[3] = *MEMORY[0x1E4F143B8];
  [(UIDateLabel *)self _recomputeTextIfNecessary];
  id v8 = [(UIDateLabel *)self timeDesignator];
  int v9 = [(UIDateLabel *)self timeDesignatorAppearsBeforeTime];
  uint64_t v10 = [v8 length];
  if (v10) {
    v9 ^= [v8 _isNaturallyRTL];
  }
  v11 = [(UIDateLabel *)self timeDesignatorFont];
  [(UILabel *)self textSize];
  if (v10)
  {
    double v13 = v12;
    [(UIDateLabel *)self timeDesignatorSize];
    double paddingFromTimeToDesignator = self->_paddingFromTimeToDesignator;
    double v15 = width - v13 - paddingFromTimeToDesignator;
    double v17 = v16 + paddingFromTimeToDesignator;
    if (v15 >= v17) {
      double v18 = v17;
    }
    else {
      double v18 = width - v13 - paddingFromTimeToDesignator;
    }
    double v19 = x + v13 + paddingFromTimeToDesignator;
    double v20 = v18 - paddingFromTimeToDesignator;
    if (v17 >= v15) {
      double v20 = v18;
    }
    double v21 = x + v18;
    double v22 = paddingFromTimeToDesignator + v21;
    if (v15 >= v17)
    {
      double v23 = v21;
    }
    else
    {
      double v17 = v15;
      double v23 = v22;
    }
    if (v9) {
      double v24 = v17;
    }
    else {
      double v24 = v20;
    }
    if (v9) {
      double v25 = x;
    }
    else {
      double v25 = v19;
    }
    if (v9) {
      double v26 = v23;
    }
    else {
      double v26 = x;
    }
    [(UIView *)self _currentScreenScale];
    double v28 = UIRectRoundToScale(v25, y, v24, height, v27);
    double v30 = v29;
    [(UIView *)self _currentScreenScale];
    double v32 = UIRectRoundToScale(v26, y, v13, height, v31);
  }
  else
  {
    double v30 = width;
    double v28 = x;
    double v35 = height;
    double v34 = width;
    double v33 = y;
    double v32 = x;
  }
  v53.receiver = self;
  v53.super_class = (Class)UIDateLabel;
  -[UILabel drawTextInRect:](&v53, sel_drawTextInRect_, v32, v33, v34, v35);
  if (v10)
  {
    -[UILabel _drawingRectForBounds:](self, "_drawingRectForBounds:", x, y, width, height);
    double v37 = v36;
    double v39 = v38;
    v52 = [(UIDateLabel *)self _stringDrawingContext];
    id v40 = objc_alloc_init((Class)off_1E52D2D48);
    [v40 setLineBreakMode:2];
    v41 = [(UILabel *)self shadowColor];
    if ([(UIView *)self isUserInteractionEnabled] && v41)
    {
      [(UILabel *)self shadowOffset];
      uint64_t v43 = *(void *)off_1E52D2040;
      uint64_t v44 = *(void *)off_1E52D2048;
      uint64_t v45 = *(void *)off_1E52D21B8;
      if (v46 == 0.0 && v42 == 0.0)
      {
        v47 = v11;
      }
      else
      {
        v56[0] = *(void *)off_1E52D2040;
        v56[1] = v44;
        v47 = v11;
        v57[0] = v11;
        v57[1] = v41;
        v56[2] = v45;
        v57[2] = v40;
        v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
        objc_msgSend(v8, "drawWithRect:options:attributes:context:", 65, v48, v52, v28, v37, v30, v39);
      }
    }
    else
    {
      v47 = v11;
      uint64_t v43 = *(void *)off_1E52D2040;
      uint64_t v44 = *(void *)off_1E52D2048;
      uint64_t v45 = *(void *)off_1E52D21B8;
    }
    v49 = [(UILabel *)self currentTextColor];
    [v49 set];

    v55[0] = v47;
    v54[0] = v43;
    v54[1] = v44;
    v50 = [(UILabel *)self currentTextColor];
    v54[2] = v45;
    v55[1] = v50;
    v55[2] = v40;
    v11 = v47;
    v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];

    objc_msgSend(v8, "drawWithRect:options:attributes:context:", 65, v51, v52, v28, v37, v30, v39);
  }
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIDateLabel *)self _recomputeTextIfNecessary];
  v14.receiver = self;
  v14.super_class = (Class)UIDateLabel;
  -[UILabel _intrinsicSizeWithinSize:](&v14, sel__intrinsicSizeWithinSize_, width, height);
  double v7 = v6;
  double v9 = v8;
  [(UIDateLabel *)self timeDesignatorSize];
  if (v10 != 0.0) {
    double v7 = v7 + v10 + self->_paddingFromTimeToDesignator;
  }
  double v12 = ceil(v7);
  if (v9 >= v11) {
    double v11 = v9;
  }
  double v13 = ceil(v11);
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (id)text
{
  [(UIDateLabel *)self _recomputeTextIfNecessary];
  v5.receiver = self;
  v5.super_class = (Class)UIDateLabel;
  v3 = [(UILabel *)&v5 text];
  return v3;
}

- (void)_recomputeTextIfNecessary
{
  if ([(UIDateLabel *)self shouldRecomputeText])
  {
    v3 = [(UIDateLabel *)self _dateString];
    [(UILabel *)self setText:v3];
    BOOL v4 = [(UIDateLabel *)self boldForAllLocales];
    v9.receiver = self;
    v9.super_class = (Class)UIDateLabel;
    objc_super v5 = [(UILabel *)&v9 font];
    if (((v4 ^ (([v5 traits] & 2) == 0)) & 1) == 0)
    {
      double v6 = [v5 familyName];
      if (v4) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 0;
      }
      [v5 pointSize];
      double v8 = objc_msgSend(off_1E52D39B8, "fontWithFamilyName:traits:size:", v6, v7);

      [(UILabel *)self setFont:v8];
    }
    [(UIDateLabel *)self setShouldRecomputeText:0];
    [(UIDateLabel *)self _didUpdateDate];
  }
}

- (BOOL)shouldRecomputeText
{
  return self->_shouldRecomputeText;
}

- (void)setShouldRecomputeText:(BOOL)a3
{
  self->_shouldRecomputeText = a3;
}

- (CGSize)timeDesignatorSize
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [(UIDateLabel *)self timeDesignator];
  if ([v3 length])
  {
    BOOL v4 = [(id)objc_opt_class() pmString];

    objc_super v5 = [(UIDateLabel *)self timeDesignatorFont];
    uint64_t v16 = *(void *)off_1E52D2040;
    v17[0] = v5;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v7 = objc_opt_class();
    if (v3 == v4) {
      [v7 pmString];
    }
    else {
    double v10 = [v7 amString];
    }
    double v11 = [(UIDateLabel *)self _stringDrawingContext];
    objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 65, v6, v11, 3.40282347e38, 3.40282347e38);
    double v8 = v12;
    double v9 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v14 = v8;
  double v15 = v9;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (BOOL)boldForAllLocales
{
  return self->_boldForAllLocales;
}

- (id)font
{
  id v3 = [(UIDateLabel *)self text];
  v6.receiver = self;
  v6.super_class = (Class)UIDateLabel;
  BOOL v4 = [(UILabel *)&v6 font];
  return v4;
}

- (id)_stringDrawingContext
{
  v4.receiver = self;
  v4.super_class = (Class)UIDateLabel;
  v2 = [(UILabel *)&v4 _stringDrawingContext];
  [v2 setCachesLayout:0];
  return v2;
}

- (BOOL)timeDesignatorAppearsBeforeTime
{
  if (qword_1EB25D738 != -1) {
    dispatch_once(&qword_1EB25D738, &__block_literal_global_116_0);
  }
  return byte_1EB25D701;
}

- (NSString)_dateString
{
  if (self->_forceTimeOnly
    || ([(UIDateLabel *)self timeInterval], double v6 = v5, [(UIDateLabel *)self _today], v6 >= v7)
    && ([(UIDateLabel *)self timeInterval], double v9 = v8,
                                                           [(UIDateLabel *)self _tomorrow],
                                                           v9 < v10))
  {
    uint64_t v3 = [(id)objc_opt_class() _timeOnlyDateFormatter];
    goto LABEL_3;
  }
  [(UIDateLabel *)self timeInterval];
  double v12 = v11;
  [(UIDateLabel *)self _tomorrow];
  if (v12 < v13)
  {
    [(UIDateLabel *)self timeInterval];
    double v15 = v14;
    [(UIDateLabel *)self _yesterday];
    if (v15 >= v16)
    {
      uint64_t v3 = [(id)objc_opt_class() _relativeDateFormatter];
    }
    else
    {
      [(UIDateLabel *)self timeInterval];
      double v18 = v17;
      [(UIDateLabel *)self _weekdayFormatCutoff];
      if (v18 < v19) {
        goto LABEL_10;
      }
      uint64_t v3 = [(id)objc_opt_class() _weekdayDateFormatter];
    }
LABEL_3:
    objc_super v4 = (void *)v3;
    if (v3) {
      goto LABEL_11;
    }
  }
LABEL_10:
  objc_super v4 = [(id)objc_opt_class() _dateFormatter];
LABEL_11:
  double v20 = [v4 stringFromDate:self->_date];

  return (NSString *)v20;
}

- (NSString)timeDesignator
{
  if ([(UIDateLabel *)self use24HourTime]) {
    goto LABEL_2;
  }
  if (self->_forceTimeOnly)
  {
    objc_super v4 = [(UIDateLabel *)self _calendar];
    double v5 = [v4 components:32 fromDate:self->_date];

    uint64_t v6 = [v5 hour];
    double v7 = objc_opt_class();
    if (v6 < 12) {
      [v7 amString];
    }
    else {
    uint64_t v3 = [v7 pmString];
    }

    goto LABEL_12;
  }
  [(UIDateLabel *)self timeInterval];
  double v9 = v8;
  [(UIDateLabel *)self _tomorrow];
  if (v9 >= v10) {
    goto LABEL_2;
  }
  [(UIDateLabel *)self timeInterval];
  double v12 = v11;
  [(UIDateLabel *)self _noon];
  if (v12 >= v13)
  {
    uint64_t v17 = [(id)objc_opt_class() pmString];
    goto LABEL_16;
  }
  [(UIDateLabel *)self timeInterval];
  double v15 = v14;
  [(UIDateLabel *)self _today];
  if (v15 < v16)
  {
LABEL_2:
    uint64_t v3 = &stru_1ED0E84C0;
    goto LABEL_12;
  }
  uint64_t v17 = [(id)objc_opt_class() amString];
LABEL_16:
  uint64_t v3 = (__CFString *)v17;
LABEL_12:
  return (NSString *)v3;
}

- (double)timeInterval
{
  v2 = [(UIDateLabel *)self date];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (NSDate)date
{
  return self->_date;
}

- (double)_tomorrow
{
  tomorrow = self->_tomorrow;
  if (!tomorrow)
  {
    double v4 = [(UIDateLabel *)self _dateWithDayDiffFromToday:1];
    double v5 = self->_tomorrow;
    self->_tomorrow = v4;

    tomorrow = self->_tomorrow;
  }
  [(NSDate *)tomorrow timeIntervalSinceReferenceDate];
  return result;
}

- (BOOL)use24HourTime
{
  if (qword_1EB25D738 != -1) {
    dispatch_once(&qword_1EB25D738, &__block_literal_global_116_0);
  }
  return _MergedGlobals_7_14;
}

- (double)_noon
{
  noon = self->_noon;
  if (!noon)
  {
    double v4 = [MEMORY[0x1E4F1C9C8] date];
    double v5 = [(UIDateLabel *)self _calendar];
    uint64_t v6 = [v5 components:30 fromDate:v4];

    [v6 setHour:12];
    double v7 = [(UIDateLabel *)self _calendar];
    double v8 = [v7 dateFromComponents:v6];
    double v9 = self->_noon;
    self->_noon = v8;

    noon = self->_noon;
  }
  [(NSDate *)noon timeIntervalSinceReferenceDate];
  return result;
}

- (id)_dateWithDayDiffFromToday:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v5 setDay:a3];
  uint64_t v6 = [(UIDateLabel *)self _calendar];
  double v7 = [(UIDateLabel *)self _todayDate];
  double v8 = [v6 dateByAddingComponents:v5 toDate:v7 options:0];

  return v8;
}

- (id)_calendar
{
  if (!self->_calendar) {
    goto LABEL_3;
  }
  double v3 = [MEMORY[0x1E4F1CA20] systemLocale];
  double v4 = [v3 localeIdentifier];
  id v5 = [(NSCalendar *)self->_calendar calendarIdentifier];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
LABEL_3:
    double v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = self->_calendar;
    self->_calendar = v7;
  }
  double v9 = self->_calendar;
  return v9;
}

- (double)_today
{
  v2 = [(UIDateLabel *)self _todayDate];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (id)_todayDate
{
  todadouble y = self->_today;
  if (!today)
  {
    double v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = [(UIDateLabel *)self _calendar];
    char v6 = [v5 components:30 fromDate:v4];

    double v7 = [(UIDateLabel *)self _calendar];
    double v8 = [v7 dateFromComponents:v6];
    double v9 = self->_today;
    self->_todadouble y = v8;

    todadouble y = self->_today;
  }
  return today;
}

+ (id)_dateFormatter
{
  if (qword_1EB25D738 != -1) {
    dispatch_once(&qword_1EB25D738, &__block_literal_global_116_0);
  }
  v2 = (void *)qword_1EB25D708;
  if (!qword_1EB25D708)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    double v4 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v3 setLocale:v4];

    [v3 setDateStyle:1];
    [v3 setTimeStyle:0];
    id v5 = (void *)qword_1EB25D708;
    qword_1EB25D708 = (uint64_t)v3;

    v2 = (void *)qword_1EB25D708;
  }
  return v2;
}

- (double)_yesterday
{
  yesterdadouble y = self->_yesterday;
  if (!yesterday)
  {
    double v4 = [(UIDateLabel *)self _dateWithDayDiffFromToday:-1];
    id v5 = self->_yesterday;
    self->_yesterdadouble y = v4;

    yesterdadouble y = self->_yesterday;
  }
  [(NSDate *)yesterday timeIntervalSinceReferenceDate];
  return result;
}

- (double)_weekdayFormatCutoff
{
  weekdayFormatCutoff = self->_weekdayFormatCutoff;
  if (!weekdayFormatCutoff)
  {
    double v4 = [(UIDateLabel *)self _dateWithDayDiffFromToday:-6];
    id v5 = self->_weekdayFormatCutoff;
    self->_weekdayFormatCutoff = v4;

    weekdayFormatCutoff = self->_weekdayFormatCutoff;
  }
  [(NSDate *)weekdayFormatCutoff timeIntervalSinceReferenceDate];
  return result;
}

+ (id)pmString
{
  if (qword_1EB25D738 != -1) {
    dispatch_once(&qword_1EB25D738, &__block_literal_global_116_0);
  }
  id v3 = (void *)qword_1EB25D730;
  if (!qword_1EB25D730)
  {
    double v4 = [a1 _dateFormatter];
    uint64_t v5 = [v4 PMSymbol];
    char v6 = (void *)qword_1EB25D730;
    qword_1EB25D730 = v5;

    id v3 = (void *)qword_1EB25D730;
  }
  return v3;
}

+ (id)_timeOnlyDateFormatter
{
  if (qword_1EB25D738 != -1) {
    dispatch_once(&qword_1EB25D738, &__block_literal_global_116_0);
  }
  v2 = (void *)qword_1EB25D710;
  if (!qword_1EB25D710)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v3 setLocalizedDateFormatFromTemplate:@"Jmm"];
    double v4 = (void *)qword_1EB25D710;
    qword_1EB25D710 = (uint64_t)v3;

    v2 = (void *)qword_1EB25D710;
  }
  return v2;
}

uint64_t __29__UIDateLabel_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShouldRecomputeText:1];
}

- (void)dealloc
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = 0x1ED15CFC0;
  v6[1] = 0x1ED15D000;
  v6[2] = 0x1ED15D020;
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIDateLabel;
  [(UILabel *)&v5 dealloc];
}

- (void)setForceTimeOnly:(BOOL)a3
{
  if (self->_forceTimeOnly != a3)
  {
    self->_forceTimeOnldouble y = a3;
    [(UIDateLabel *)self setShouldRecomputeText:1];
    [(UILabel *)self setNeedsDisplay];
  }
}

- (void)setBoldForAllLocales:(BOOL)a3
{
  if (self->_boldForAllLocales != a3)
  {
    self->_boldForAllLocales = a3;
    [(UIDateLabel *)self setShouldRecomputeText:1];
    [(UILabel *)self setNeedsDisplay];
  }
}

+ (id)_relativeDateFormatter
{
  if (qword_1EB25D738 != -1) {
    dispatch_once(&qword_1EB25D738, &__block_literal_global_116_0);
  }
  v2 = (void *)qword_1EB25D718;
  if (!qword_1EB25D718)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    double v4 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v3 setLocale:v4];

    [v3 setDateStyle:1];
    [v3 setTimeStyle:0];
    [v3 setDoesRelativeDateFormatting:1];
    objc_super v5 = (void *)qword_1EB25D718;
    qword_1EB25D718 = (uint64_t)v3;

    v2 = (void *)qword_1EB25D718;
  }
  return v2;
}

+ (id)_weekdayDateFormatter
{
  if (qword_1EB25D738 != -1) {
    dispatch_once(&qword_1EB25D738, &__block_literal_global_116_0);
  }
  v2 = (void *)qword_1EB25D720;
  if (!qword_1EB25D720)
  {
    id v3 = (void *)MEMORY[0x1E4F28C10];
    double v4 = [MEMORY[0x1E4F1CA20] currentLocale];
    objc_super v5 = [v3 dateFormatFromTemplate:@"cccc" options:0 locale:v4];

    id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v6 setDateFormat:v5];
    double v7 = (void *)qword_1EB25D720;
    qword_1EB25D720 = (uint64_t)v6;

    v2 = (void *)qword_1EB25D720;
  }
  return v2;
}

+ (id)amString
{
  if (qword_1EB25D738 != -1) {
    dispatch_once(&qword_1EB25D738, &__block_literal_global_116_0);
  }
  id v3 = (void *)qword_1EB25D728;
  if (!qword_1EB25D728)
  {
    double v4 = [a1 _dateFormatter];
    uint64_t v5 = [v4 AMSymbol];
    id v6 = (void *)qword_1EB25D728;
    qword_1EB25D728 = v5;

    id v3 = (void *)qword_1EB25D728;
  }
  return v3;
}

- (BOOL)forceTimeOnly
{
  return self->_forceTimeOnly;
}

- (double)paddingFromTimeToDesignator
{
  return self->_paddingFromTimeToDesignator;
}

- (void)setPaddingFromTimeToDesignator:(double)a3
{
  self->_double paddingFromTimeToDesignator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_weekdayFormatCutoff, 0);
  objc_storeStrong((id *)&self->_tomorrow, 0);
  objc_storeStrong((id *)&self->_noon, 0);
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_yesterday, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end