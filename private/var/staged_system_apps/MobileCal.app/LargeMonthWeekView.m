@interface LargeMonthWeekView
+ (double)topInset;
+ (id)_opaqueWeekendBackgroundColor;
+ (id)gridlineColor;
+ (id)weekendColor;
+ (void)clearCachedFonts;
+ (void)initialize;
- (BOOL)_hasPaddingRow;
- (BOOL)containsCalendarDate:(id)a3;
- (BOOL)isBackgroundScene;
- (BOOL)showsTopBorder;
- (BOOL)showsWeekNumber;
- (CGRect)circleFrame;
- (CGRect)frameForDate:(id)a3;
- (CGRect)frameForOccurrence:(id)a3 onDay:(id)a4;
- (CGRect)frameForOccurrenceAfterLastOnDay:(id)a3;
- (CGRect)frameForTodayHighlight;
- (EKCalendarDate)endDate;
- (EKCalendarDate)startDate;
- (EKEvent)selectedOccurrence;
- (LargeMonthWeekView)initWithFrame:(CGRect)a3;
- (LargeMonthWeekViewDataSource)dataSource;
- (LargeMonthWeekViewDelegate)delegate;
- (NSArray)selectedOccurrences;
- (NSString)description;
- (_NSRange)highlightedDayRange;
- (double)monthWeekScale;
- (double)topInset;
- (id)calendarDate;
- (id)dateAtPoint:(CGPoint)a3;
- (id)dateForIndex:(int64_t)a3;
- (id)dayFrames;
- (id)endCalendarDate;
- (id)newFeedbackViewForDraggingOccurrence:(id)a3 atPoint:(CGPoint)a4;
- (id)occurrenceAtPoint:(CGPoint)a3;
- (id)occurrencesView;
- (id)presentationControllerForEditMenu;
- (id)selectedEventsForEditMenu;
- (id)todayCircle;
- (id)weekdayLabels;
- (int64_t)dayCount;
- (int64_t)dayIndexForToday;
- (int64_t)todayDay;
- (void)_rebuildDayNumberLabels;
- (void)_rebuildOverlayLabels;
- (void)_updateBadgeAtIndex:(unint64_t)a3;
- (void)_updateBadgeBackgroundColors;
- (void)_updateBadges;
- (void)_updateDayFrames;
- (void)_updateWeekNumber;
- (void)_updateWeekNumberFont;
- (void)_viewDoubleTapped:(id)a3;
- (void)_viewTapped:(id)a3;
- (void)attemptDisplayReviewPrompt;
- (void)contentSizeCategoryChanged;
- (void)deselectOccurrence:(id)a3;
- (void)didCompleteMonthWeekViewBackgroundRendering;
- (void)layoutSubviews;
- (void)monthWeekOccurrencesView:(id)a3 selectedEvent:(id)a4 userInitiated:(BOOL)a5;
- (void)prepareForReuse;
- (void)reloadData;
- (void)selectOccurrence:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDayCount:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setHighlightedDayRange:(_NSRange)a3;
- (void)setSelectedOccurrence:(id)a3;
- (void)setSelectedOccurrences:(id)a3;
- (void)setShowsFirstDayOfMonthLabel:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsTopBorder:(BOOL)a3;
- (void)setShowsWeekNumber:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStartDate:(id)a3 endDate:(id)a4 dayCount:(int64_t)a5 todayDay:(int64_t)a6 reload:(BOOL)a7;
- (void)setTodayDay:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateToday;
@end

@implementation LargeMonthWeekView

+ (void)initialize
{
  if (qword_1002163B0 != -1) {
    dispatch_once(&qword_1002163B0, &stru_1001D25F8);
  }
}

+ (id)gridlineColor
{
  return (id)qword_1002163B8;
}

+ (id)weekendColor
{
  return (id)qword_1002163C0;
}

+ (void)clearCachedFonts
{
  v2 = (void *)qword_1002163A0;
  qword_1002163A0 = 0;

  v3 = (void *)qword_1002163A8;
  qword_1002163A8 = 0;
}

- (LargeMonthWeekView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)LargeMonthWeekView;
  v3 = -[LargeMonthWeekView initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MonthWeekOccurrencesView);
    occurrencesView = v3->_occurrencesView;
    v3->_occurrencesView = v4;

    [(MonthWeekOccurrencesView *)v3->_occurrencesView setDelegate:v3];
    [(LargeMonthWeekView *)v3 addSubview:v3->_occurrencesView];
    v3->_showsTopBorder = 1;
    v6 = (CALayer *)objc_alloc_init((Class)CALayer);
    topBorderLine = v3->_topBorderLine;
    v3->_topBorderLine = v6;

    -[CALayer setBackgroundColor:](v3->_topBorderLine, "setBackgroundColor:", [(id)qword_1002163B8 CGColor]);
    v8 = [(LargeMonthWeekView *)v3 layer];
    [v8 addSublayer:v3->_topBorderLine];

    v9 = (CALayer *)objc_alloc_init((Class)CALayer);
    paddingRowBorderLine = v3->_paddingRowBorderLine;
    v3->_paddingRowBorderLine = v9;

    -[CALayer setBackgroundColor:](v3->_paddingRowBorderLine, "setBackgroundColor:", [(id)qword_1002163B8 CGColor]);
    v11 = [(LargeMonthWeekView *)v3 layer];
    [v11 addSublayer:v3->_paddingRowBorderLine];

    [(LargeMonthWeekView *)v3 bringSubviewToFront:v3->_occurrencesView];
    id v12 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"_viewTapped:"];
    [(LargeMonthWeekView *)v3 addGestureRecognizer:v12];
    id v13 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"_viewDoubleTapped:"];
    [v13 setNumberOfTapsRequired:2];
    [(LargeMonthWeekView *)v3 addGestureRecognizer:v13];
    objc_initWeak(&location, v3);
    uint64_t v21 = objc_opt_class();
    v14 = +[NSArray arrayWithObjects:&v21 count:1];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100026F60;
    v17[3] = &unk_1001D2620;
    objc_copyWeak(&v18, &location);
    id v15 = [(LargeMonthWeekView *)v3 registerForTraitChanges:v14 withHandler:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LargeMonthWeekView;
  [(LargeMonthWeekView *)&v11 touchesBegan:v6 withEvent:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 largeMonthWeekView:self touchesBegan:v6 withEvent:v7];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LargeMonthWeekView;
  [(LargeMonthWeekView *)&v11 touchesMoved:v6 withEvent:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 largeMonthWeekView:self touchesMoved:v6 withEvent:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LargeMonthWeekView;
  [(LargeMonthWeekView *)&v11 touchesEnded:v6 withEvent:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 largeMonthWeekView:self touchesEnded:v6 withEvent:v7];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LargeMonthWeekView;
  [(LargeMonthWeekView *)&v11 touchesCancelled:v6 withEvent:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 largeMonthWeekView:self touchesCancelled:v6 withEvent:v7];
  }
}

+ (double)topInset
{
  return 0.0;
}

- (void)reloadData
{
  if (!self->_occurrencesHidden && self->_startDate && self->_endDate)
  {
    v3 = [(LargeMonthWeekView *)self dataSource];
    v4 = [(EKCalendarDate *)self->_startDate date];
    v5 = [(EKCalendarDate *)self->_endDate date];
    id v12 = [v3 occurrencesForStartDate:v4 endDate:v5 waitForLoad:0];

    [(MonthWeekOccurrencesView *)self->_occurrencesView setOccurrences:v12];
    id v6 = [(MonthWeekOccurrencesView *)self->_occurrencesView dayTypesFromOccurrences];
    specialDayTypes = self->_specialDayTypes;
    self->_specialDayTypes = v6;

    v8 = [(MonthWeekOccurrencesView *)self->_occurrencesView dayBadgeColorsFromOccurrences];
    dayBadgeColors = self->_dayBadgeColors;
    self->_dayBadgeColors = v8;

    id v10 = [(MonthWeekOccurrencesView *)self->_occurrencesView dayBadgeLocalesFromOccurrences];
    dayBadgeLocales = self->_dayBadgeLocales;
    self->_dayBadgeLocales = v10;

    [(LargeMonthWeekView *)self _updateBadges];
  }
}

- (void)contentSizeCategoryChanged
{
  [(LargeMonthWeekView *)self _rebuildDayNumberLabels];
  [(LargeMonthWeekView *)self _rebuildOverlayLabels];
  [(LargeMonthWeekView *)self _updateWeekNumberFont];
  [(LargeMonthWeekView *)self reloadData];

  [(LargeMonthWeekView *)self setNeedsLayout];
}

- (void)updateToday
{
  v3 = CUIKTodayDate();
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  [(EKCalendarDate *)self->_startDate absoluteTime];
  if (v5 >= v6 && ([(EKCalendarDate *)self->_endDate absoluteTime], v5 <= v7))
  {
    char v9 = CUIKTodayComponents();
    id v8 = [v9 day];
  }
  else
  {
    id v8 = 0;
  }
  if (v8 != self->_todayDay)
  {
    self->_todayDay = (int64_t)v8;
    [(LargeMonthWeekView *)self _rebuildDayNumberLabels];
    [(LargeMonthWeekView *)self setNeedsDisplay];
    [(LargeMonthWeekView *)self setNeedsLayout];
  }
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)LargeMonthWeekView;
  v3 = [(LargeMonthWeekView *)&v9 description];
  double v4 = [(LargeMonthWeekView *)self calendarDate];
  double v5 = [v4 date];
  double v6 = CUIKStringForDate();
  double v7 = +[NSString stringWithFormat:@"%@; Week Represented: %@", v3, v6];

  return (NSString *)v7;
}

- (id)dateForIndex:(int64_t)a3
{
  return [(EKCalendarDate *)self->_startDate calendarDateByAddingDays:a3];
}

- (id)occurrenceAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(LargeMonthWeekView *)self layoutIfNeeded];
  [(MonthWeekOccurrencesView *)self->_occurrencesView frame];
  v10.double x = x;
  v10.double y = y;
  if (CGRectContainsPoint(v11, v10))
  {
    occurrencesView = self->_occurrencesView;
    -[MonthWeekOccurrencesView convertPoint:fromView:](occurrencesView, "convertPoint:fromView:", self, x, y);
    double v7 = -[MonthWeekOccurrencesView occurrenceAtPoint:](occurrencesView, "occurrenceAtPoint:");
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (CGRect)frameForTodayHighlight
{
  [(_CircleView *)self->_todayCircle frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)frameForDate:(id)a3
{
  int64_t v4 = (int64_t)[a3 differenceInDays:self->_startDate];
  if (v4 < 0 || v4 >= self->_dayCount) {
    double v5 = &CGRectNull;
  }
  else {
    double v5 = &self->_dayFrames[self->_firstDayIndex + v4];
  }
  double width = v5->size.width;
  double height = v5->size.height;
  double x = v5->origin.x;
  double y = v5->origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSelectedOccurrence:(id)a3
{
}

- (EKEvent)selectedOccurrence
{
  return [(MonthWeekOccurrencesView *)self->_occurrencesView selectedOccurrence];
}

- (void)setSelectedOccurrences:(id)a3
{
}

- (NSArray)selectedOccurrences
{
  return [(MonthWeekOccurrencesView *)self->_occurrencesView selectedOccurrences];
}

- (void)selectOccurrence:(id)a3
{
}

- (void)deselectOccurrence:(id)a3
{
}

- (void)setShowsTopBorder:(BOOL)a3
{
  if (self->_showsTopBorder != a3)
  {
    self->_showsTopBorder = a3;
    topBorderLine = self->_topBorderLine;
    if (a3)
    {
      [(CALayer *)topBorderLine setHidden:0];
      [(LargeMonthWeekView *)self setNeedsLayout];
    }
    else
    {
      [(CALayer *)topBorderLine setHidden:1];
    }
  }
}

- (void)setShowsWeekNumber:(BOOL)a3
{
  if (self->_showsWeekNumber != a3)
  {
    self->_showsWeekNumber = a3;
    if (a3)
    {
      int64_t v4 = (UILabel *)objc_opt_new();
      weekNumberLabel = self->_weekNumberLabel;
      self->_weekNumberLabel = v4;

      [(LargeMonthWeekView *)self _updateWeekNumberFont];
      [(LargeMonthWeekView *)self addSubview:self->_weekNumberLabel];
      [(LargeMonthWeekView *)self _updateWeekNumber];
    }
    else
    {
      [(UILabel *)self->_weekNumberLabel removeFromSuperview];
      double v6 = self->_weekNumberLabel;
      self->_weekNumberLabel = 0;
    }
  }
}

- (void)_updateWeekNumberFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:13.0];
  +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_weekNumberLabel setFont:v3];
}

- (void)_updateWeekNumber
{
  if (self->_showsWeekNumber)
  {
    id v3 = CUIKCalendar();
    int64_t v4 = [(LargeMonthWeekView *)self calendarDate];
    double v5 = [v4 date];
    [v3 component:0x2000 fromDate:v5];
    double v6 = CUIKLocalizedStringForInteger();
    [(UILabel *)self->_weekNumberLabel setText:v6];

    if (self->_todayDay < 1) {
      +[UIColor secondaryLabelColor];
    }
    else {
    double v7 = CalendarAppTintColor();
    }
    [(UILabel *)self->_weekNumberLabel setTextColor:v7];

    [(LargeMonthWeekView *)self setNeedsLayout];
  }
}

- (void)setStartDate:(id)a3
{
}

- (EKCalendarDate)startDate
{
  return self->_startDate;
}

- (void)setEndDate:(id)a3
{
}

- (EKCalendarDate)endDate
{
  return self->_endDate;
}

- (void)setDayCount:(int64_t)a3
{
}

- (int64_t)dayCount
{
  return self->_dayCount;
}

- (void)setStartDate:(id)a3 endDate:(id)a4 dayCount:(int64_t)a5 todayDay:(int64_t)a6 reload:(BOOL)a7
{
  BOOL v7 = a7;
  id v21 = a3;
  id v12 = a4;
  if (![v21 isEqual:self->_startDate]
    || ![v12 isEqual:self->_endDate]
    || self->_dayCount != a5)
  {
    [(LargeMonthWeekView *)self setShowsFirstDayOfMonthLabel:0 animated:0];
    id v13 = (EKCalendarDate *)[v21 copy];
    startDate = self->_startDate;
    self->_startDate = v13;

    id v15 = (EKCalendarDate *)[v12 copy];
    endDate = self->_endDate;
    self->_endDate = v15;

    self->_dayCount = a5;
    self->_todayDadouble y = a6;
    id v17 = [v21 day];
    int64_t v18 = 7 - a5;
    if (v17 != (id)1) {
      int64_t v18 = 0;
    }
    self->_firstDayIndedouble x = v18;
    id v19 = [v12 month];
    objc_super v20 = [v12 calendarDateByAddingDays:1];
    self->_isLastWeekOfMonth = v19 != [v20 month];

    [(MonthWeekOccurrencesView *)self->_occurrencesView setStartDate:self->_startDate endDate:self->_endDate dayCount:self->_dayCount];
    if (v7) {
      [(LargeMonthWeekView *)self reloadData];
    }
    [(LargeMonthWeekView *)self _rebuildDayNumberLabels];
    [(LargeMonthWeekView *)self _rebuildOverlayLabels];
    [(LargeMonthWeekView *)self _updateWeekNumber];
    [(LargeMonthWeekView *)self setNeedsLayout];
    [(LargeMonthWeekView *)self setNeedsDisplay];
  }
}

- (void)_rebuildOverlayLabels
{
  id v3 = CUIKGetOverlayCalendar();
  overlayLabels = self->_overlayLabels;
  if (v3)
  {
    if (!overlayLabels)
    {
      uint64_t v5 = 7;
      double v6 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:7];
      do
      {
        BOOL v7 = objc_opt_new();
        [(LargeMonthWeekView *)self addSubview:v7];
        [(NSArray *)v6 addObject:v7];

        --v5;
      }
      while (v5);
      id v8 = self->_overlayLabels;
      self->_overlayLabels = v6;
    }
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:12.0];
    objc_super v9 = +[UIFont _thinSystemFontOfSize:](UIFont, "_thinSystemFontOfSize:");
    id v10 = [(EKCalendarDate *)self->_startDate dayOfWeek];
    uint64_t v11 = (uint64_t)v10 - CUIKZeroIndexedWeekStart() + 6;
    int64_t dayCount = self->_dayCount;
    self->_isFirstOfOverlayYear = 0;
    self->_firstOfOverlayMonthIndedouble x = -1;
    id v13 = self->_overlayLabels;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100028040;
    v21[3] = &unk_1001D2688;
    uint64_t v25 = v11 % 7;
    uint64_t v26 = v11 % 7 + dayCount;
    id v22 = v3;
    v23 = self;
    id v14 = v9;
    id v24 = v14;
    [(NSArray *)v13 enumerateObjectsUsingBlock:v21];
    overlayUnderline = self->_overlayUnderline;
    if (self->_firstOfOverlayMonthIndex < 0)
    {
      if (overlayUnderline)
      {
        [(UIView *)overlayUnderline removeFromSuperview];
        objc_super v20 = self->_overlayUnderline;
        self->_overlayUnderline = 0;
      }
    }
    else if (!overlayUnderline)
    {
      v16 = (UIView *)objc_opt_new();
      id v17 = self->_overlayUnderline;
      self->_overlayUnderline = v16;

      int64_t v18 = CalendarAppTintColor();
      [(UIView *)self->_overlayUnderline setBackgroundColor:v18];

      [(LargeMonthWeekView *)self addSubview:self->_overlayUnderline];
    }
  }
  else
  {
    [(NSArray *)overlayLabels enumerateObjectsUsingBlock:&stru_1001D2660];
    id v19 = self->_overlayLabels;
    self->_overlayLabels = 0;
  }
}

- (void)_rebuildDayNumberLabels
{
  if (!self->_dayNumberLabels)
  {
    uint64_t v3 = 7;
    int64_t v4 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:7];
    do
    {
      id v5 = objc_alloc_init((Class)UILabel);
      [(LargeMonthWeekView *)self addSubview:v5];
      [(NSArray *)v4 addObject:v5];

      --v3;
    }
    while (v3);
    dayNumberLabels = self->_dayNumberLabels;
    self->_dayNumberLabels = v4;
    BOOL v7 = v4;

    id v8 = (UILabel *)objc_opt_new();
    firstOfMonthLabel = self->_firstOfMonthLabel;
    self->_firstOfMonthLabel = v8;

    [(UILabel *)self->_firstOfMonthLabel setAlpha:0.0];
    [(LargeMonthWeekView *)self addSubview:self->_firstOfMonthLabel];
  }
  if (!self->_dayBadgeViews)
  {
    uint64_t v10 = 7;
    uint64_t v11 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:7];
    do
    {
      id v12 = objc_alloc_init((Class)UIImageView);
      [v12 setHidden:1];
      [(LargeMonthWeekView *)self addSubview:v12];
      [(NSArray *)v11 addObject:v12];

      --v10;
    }
    while (v10);
    dayBadgeViews = self->_dayBadgeViews;
    self->_dayBadgeViews = v11;
  }
  if (!self->_dayBadgeViewBesideFirstOfMonthLabel)
  {
    id v14 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    dayBadgeViewBesideFirstOfMonthLabel = self->_dayBadgeViewBesideFirstOfMonthLabel;
    self->_dayBadgeViewBesideFirstOfMonthLabel = v14;

    [(LargeMonthWeekView *)self addSubview:self->_dayBadgeViewBesideFirstOfMonthLabel];
  }
  if (self->_todayDay && !self->_firstOfMonthNoDayLabel)
  {
    v16 = (UILabel *)objc_opt_new();
    firstOfMonthNoDayLabel = self->_firstOfMonthNoDayLabel;
    self->_firstOfMonthNoDayLabel = v16;

    [(UILabel *)self->_firstOfMonthNoDayLabel setAlpha:0.0];
    [(LargeMonthWeekView *)self addSubview:self->_firstOfMonthNoDayLabel];
  }
  id v18 = [(EKCalendarDate *)self->_startDate dayOfWeek];
  id v19 = [(EKCalendarDate *)self->_startDate daysInMonth];
  if (!qword_1002163A0)
  {
    objc_super v20 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0 options:3];
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:17.0];
    uint64_t v21 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v20);
    id v22 = (void *)qword_1002163A0;
    qword_1002163A0 = v21;

    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:17.0];
    uint64_t v23 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
    id v24 = (void *)qword_1002163A8;
    qword_1002163A8 = v23;
  }
  uint64_t v25 = (uint64_t)v18 - CUIKZeroIndexedWeekStart() + 6;
  int64_t dayCount = self->_dayCount;
  self->_firstOfMonthIndedouble x = -1;
  v27 = self->_dayNumberLabels;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000286BC;
  v34[3] = &unk_1001D26B0;
  v34[4] = self;
  v34[5] = v25 % 7;
  v34[6] = v25 % 7 + dayCount;
  v34[7] = v19;
  [(NSArray *)v27 enumerateObjectsUsingBlock:v34];
  [(NSArray *)self->_dayBadgeViews enumerateObjectsUsingBlock:&stru_1001D26F0];
  unint64_t v28 = (unint64_t)self->_firstOfMonthIndex >> 63;
  [(UILabel *)self->_firstOfMonthLabel setHidden:v28];
  [(UILabel *)self->_firstOfMonthNoDayLabel setHidden:v28];
  [(UIImageView *)self->_dayBadgeViewBesideFirstOfMonthLabel setHidden:v28];
  [(UIImageView *)self->_dayBadgeViewBesideFirstOfMonthLabel setAlpha:0.0];
  todayDadouble y = self->_todayDay;
  if (todayDay >= 1)
  {
    if (!self->_todayCircle)
    {
      v30 = objc_alloc_init(_CircleView);
      todayCircle = self->_todayCircle;
      self->_todayCircle = v30;

      v32 = +[UIColor clearColor];
      [(_CircleView *)self->_todayCircle setBackgroundColor:v32];

      [(LargeMonthWeekView *)self insertSubview:self->_todayCircle belowSubview:self->_occurrencesView];
    }
    v33 = [(LargeMonthWeekView *)self traitCollection];
    [(_CircleView *)self->_todayCircle setUsesRoundedRectInsteadOfCircle:EKUIUsesRoundedRectsInsteadOfCircles()];
  }
  [(_CircleView *)self->_todayCircle setHidden:todayDay < 1];
  [(LargeMonthWeekView *)self _updateBadgeBackgroundColors];
  if (self->_specialDayTypes)
  {
    if (self->_dayBadgeColors) {
      [(LargeMonthWeekView *)self _updateBadges];
    }
  }
}

- (void)setShowsFirstDayOfMonthLabel:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showingFirstDayOfMonthLabel != a3 && (self->_firstOfMonthIndex & 0x8000000000000000) == 0)
  {
    BOOL v5 = a4;
    self->_showingFirstDayOfMonthLabel = a3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100028ADC;
    v8[3] = &unk_1001D2718;
    v8[4] = self;
    BOOL v9 = a3;
    double v6 = objc_retainBlock(v8);
    BOOL v7 = v6;
    if (v5) {
      +[UIView animateWithDuration:v6 animations:0.5];
    }
    else {
      ((void (*)(void *))v6[2])(v6);
    }
    [(LargeMonthWeekView *)self setNeedsLayout];
  }
}

- (void)_updateBadges
{
  if ([(NSArray *)self->_dayBadgeViews count])
  {
    unint64_t v3 = 0;
    do
      [(LargeMonthWeekView *)self _updateBadgeAtIndex:v3++];
    while (v3 < [(NSArray *)self->_dayBadgeViews count]);
  }
}

- (void)_updateBadgeAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_dayBadgeViews count] <= a3) {
    return;
  }
  id v15 = [(NSArray *)self->_dayBadgeViews objectAtIndex:a3];
  if ([(NSArray *)self->_specialDayTypes count] > a3
    && [(NSArray *)self->_dayBadgeColors count] > a3
    && [(NSArray *)self->_dayBadgeLocales count] > a3)
  {
    BOOL v5 = [(NSArray *)self->_specialDayTypes objectAtIndex:a3];
    id v6 = [v5 integerValue];

    BOOL v7 = [(NSArray *)self->_dayBadgeColors objectAtIndex:a3];
    id v8 = [(NSArray *)self->_dayBadgeLocales objectAtIndex:a3];
    if ([v8 isEqual:&stru_1001D6918])
    {

      id v8 = 0;
    }
    BOOL v9 = [(LargeMonthWeekView *)self traitCollection];
    [v9 userInterfaceStyle];

    if (v6 == (id)3)
    {
      uint64_t v11 = BadgeImageForAlternateWorkday();
    }
    else
    {
      uint64_t v10 = v15;
      if (v6 != (id)1) {
        goto LABEL_19;
      }
      uint64_t v11 = BadgeImageForHoliday();
    }
    id v12 = (void *)v11;
    uint64_t v10 = v15;
    if (v12)
    {
      [v15 setImage:v12];
      [v15 setHidden:0];
      if (self->_firstDayIndex != a3)
      {
LABEL_23:

        goto LABEL_12;
      }
      p_dayBadgeViewBesideFirstOfMonthLabel = &self->_dayBadgeViewBesideFirstOfMonthLabel;
      [(UIImageView *)*p_dayBadgeViewBesideFirstOfMonthLabel setImage:v12];
      uint64_t v14 = 0;
LABEL_21:
      [(UIImageView *)*p_dayBadgeViewBesideFirstOfMonthLabel setHidden:v14];
      goto LABEL_23;
    }
LABEL_19:
    [v10 setHidden:1];
    if (self->_firstDayIndex != a3)
    {
      id v12 = 0;
      goto LABEL_23;
    }
    id v12 = 0;
    p_dayBadgeViewBesideFirstOfMonthLabel = &self->_dayBadgeViewBesideFirstOfMonthLabel;
    uint64_t v14 = 1;
    goto LABEL_21;
  }
  [v15 setHidden:1];
LABEL_12:
}

- (void)_updateBadgeBackgroundColors
{
  CUIKGetWeekendDays();
  uint64_t v3 = CUIKZeroIndexedWeekStart();
  uint64_t v4 = CUIKZeroIndexedWeekStart();
  BOOL v5 = +[UIColor systemBackgroundColor];
  id v6 = [(id)objc_opt_class() _opaqueWeekendBackgroundColor];
  if ((uint64_t)[(NSArray *)self->_dayBadgeViews count] >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = (7 - v3) % 7;
    uint64_t v9 = (7 - v4) % 7;
    do
    {
      if (v9 == v7 || v8 == v7) {
        uint64_t v11 = v6;
      }
      else {
        uint64_t v11 = v5;
      }
      id v12 = v11;
      id v13 = [(NSArray *)self->_dayBadgeViews objectAtIndex:v7];
      [v13 setBackgroundColor:v12];
      if (v7 == self->_firstOfMonthIndex) {
        [(UIImageView *)self->_dayBadgeViewBesideFirstOfMonthLabel setBackgroundColor:v12];
      }

      ++v7;
    }
    while (v7 < (uint64_t)[(NSArray *)self->_dayBadgeViews count]);
  }
}

+ (id)_opaqueWeekendBackgroundColor
{
  double v2 = [a1 weekendColor];
  uint64_t v3 = +[UIColor systemBackgroundColor];
  double v13 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  double v10 = 0.0;
  [v2 getRed:&v13 green:&v12 blue:&v11 alpha:&v10];
  double v8 = 0.0;
  double v9 = 0.0;
  uint64_t v6 = 0;
  double v7 = 0.0;
  [v3 getRed:&v9 green:&v8 blue:&v7 alpha:&v6];
  uint64_t v4 = +[UIColor colorWithRed:v9 * (1.0 - v10) + v13 * v10 green:(1.0 - v10) * v8 + v12 * v10 blue:(1.0 - v10) * v7 + v11 * v10 alpha:1.0];

  return v4;
}

- (void)_viewTapped:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  -[LargeMonthWeekView dateAtPoint:](self, "dateAtPoint:");
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  -[MonthWeekOccurrencesView frameForLastOccurrenceOnDay:](self->_occurrencesView, "frameForLastOccurrenceOnDay:");
  -[LargeMonthWeekView convertRect:fromView:](self, "convertRect:fromView:", self->_occurrencesView);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [(MonthWeekOccurrencesView *)self->_occurrencesView frame];
  if (v8 >= CGRectGetMinY(v29))
  {
    v30.origin.double x = v10;
    v30.origin.double y = v12;
    v30.size.double width = v14;
    v30.size.double height = v16;
    if (v8 <= CGRectGetMaxY(v30)) {
      goto LABEL_6;
    }
    double v17 = -8.0;
  }
  else
  {
    double v17 = 8.0;
  }
  double v8 = v8 + v17;
LABEL_6:
  [(MonthWeekOccurrencesView *)self->_occurrencesView frame];
  v28.double x = v6;
  v28.double y = v8;
  if (CGRectContainsPoint(v31, v28))
  {
    -[MonthWeekOccurrencesView convertPoint:fromView:](self->_occurrencesView, "convertPoint:fromView:", self, v6, v8);
    double v19 = v18;
    double v21 = v20;
    id v22 = -[MonthWeekOccurrencesView occurrenceAtPoint:](self->_occurrencesView, "occurrenceAtPoint:");
    if (v22) {
      BOOL v23 = -[MonthWeekOccurrencesView occurrence:hasSymbolAtPoint:](self->_occurrencesView, "occurrence:hasSymbolAtPoint:", v22, v19, v21);
    }
    else {
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
    id v22 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v25 = [v4 modifierFlags];

  [WeakRetained largeMonthWeekView:self didTapOccurrence:v22 onDay:v26 extendSelection:(*(void *)&v25 & 0x120000) != 0 userInitiated:1 tappedSymbol:v23];
}

- (void)_viewDoubleTapped:(id)a3
{
  [a3 locationInView:self];
  id v4 = -[LargeMonthWeekView dateAtPoint:](self, "dateAtPoint:");
  if (v4)
  {
    id v5 = objc_alloc((Class)UIView);
    [(LargeMonthWeekView *)self frameForDate:v4];
    id v6 = [v5 initWithFrame:];
    double v7 = +[UIColor blackColor];
    [v6 setBackgroundColor:v7];

    [v6 setAlpha:0.0];
    [(LargeMonthWeekView *)self addSubview:v6];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100029644;
    v13[3] = &unk_1001D2740;
    id v14 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100029654;
    v9[3] = &unk_1001D2768;
    id v10 = v14;
    double v11 = self;
    id v12 = v4;
    id v8 = v14;
    +[UIView animateWithDuration:v13 animations:v9 completion:0.3];
  }
}

- (void)prepareForReuse
{
}

- (id)calendarDate
{
  return self->_startDate;
}

- (id)endCalendarDate
{
  return self->_endDate;
}

- (double)topInset
{
  double v2 = objc_opt_class();

  [v2 topInset];
  return result;
}

- (BOOL)_hasPaddingRow
{
  return self->_isLastWeekOfMonth && self->_dayCount == 7;
}

- (void)_updateDayFrames
{
  uint64_t v3 = [(LargeMonthWeekView *)self window];
  id v4 = [v3 screen];
  [v4 scale];
  double v6 = v5;

  double v7 = [(LargeMonthWeekView *)self window];
  id v8 = (char *)[v7 interfaceOrientation] - 1;

  if (v6 <= 1.0)
  {
    self->_double gridlineThickness = 1.0;
    BOOL v9 = (unint64_t)v8 >= 2;
    if ((unint64_t)v8 >= 2) {
      id v10 = qword_100216438;
    }
    else {
      id v10 = qword_100216470;
    }
    double v11 = qword_1001C1120;
    id v12 = qword_1001C1158;
  }
  else
  {
    self->_double gridlineThickness = 0.5;
    BOOL v9 = (unint64_t)v8 >= 2;
    if ((unint64_t)v8 >= 2) {
      id v10 = qword_1002163C8;
    }
    else {
      id v10 = qword_100216400;
    }
    double v11 = qword_1001C10B0;
    id v12 = qword_1001C10E8;
  }
  if (v9) {
    double v13 = v11;
  }
  else {
    double v13 = v12;
  }
  [(LargeMonthWeekView *)self bounds];
  double v15 = v14;
  double v17 = v16;
  if ([(LargeMonthWeekView *)self _hasPaddingRow])
  {
    CalRoundToScreenScale();
    double v17 = v18;
  }
  uint64_t v19 = 0;
  double gridlineThickness = self->_gridlineThickness;
  double v21 = v17 - gridlineThickness;
  double v22 = v15 + gridlineThickness;
  if ((unint64_t)v8 >= 2) {
    double v23 = 1024.0;
  }
  else {
    double v23 = 768.0;
  }
  uint64_t v24 = 6;
  unsigned int v25 = self;
  do
  {
    if (CalTimeDirectionIsLeftToRight()) {
      uint64_t v26 = v19;
    }
    else {
      uint64_t v26 = v24;
    }
    [(LargeMonthWeekView *)self bounds];
    if (v27 == 0.0)
    {
      EKUICurrentWindowWidthWithViewHierarchy();
      double v27 = v28;
    }
    CGFloat v29 = v27 * *(double *)&v13[v26] / v23;
    v25->_dayFrames[0].origin.double x = v27 * *(double *)&v10[v26] / v23;
    v25->_dayFrames[0].origin.double y = v22;
    v25->_dayFrames[0].size.double width = v29;
    v25->_dayFrames[0].size.double height = v21;
    ++v19;
    unsigned int v25 = (LargeMonthWeekView *)((char *)v25 + 32);
    --v24;
  }
  while (v19 != 7);
}

- (void)layoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)LargeMonthWeekView;
  [(LargeMonthWeekView *)&v51 layoutSubviews];
  [(LargeMonthWeekView *)self _updateDayFrames];
  uint64_t v3 = &self->_dayFrames[(13 - CUIKZeroIndexedWeekStart()) % 7];
  CGFloat x = v3->origin.x;
  CGFloat y = v3->origin.y;
  CGFloat width = v3->size.width;
  CGFloat height = v3->size.height;
  unsigned int v8 = [(LargeMonthWeekView *)self _hasPaddingRow];
  if (v8)
  {
    [(LargeMonthWeekView *)self bounds];
    v53.origin.CGFloat x = x;
    v53.origin.CGFloat y = y;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = height;
    CGRectGetMaxY(v53);
    CalRoundRectToScreenScale();
    p_paddingRowBorderLine = &self->_paddingRowBorderLine;
    -[CALayer setFrame:](self->_paddingRowBorderLine, "setFrame:");
  }
  else
  {
    p_paddingRowBorderLine = &self->_paddingRowBorderLine;
  }
  [(CALayer *)*p_paddingRowBorderLine setHidden:v8 ^ 1];
  [(LargeMonthWeekView *)self bounds];
  CGFloat v11 = v10;
  double v13 = v12 + 0.0;
  double gridlineThickness = self->_gridlineThickness;
  -[CALayer setFrame:](self->_topBorderLine, "setFrame:", v10, v12 + 0.0);
  double v15 = v13 + gridlineThickness + 7.0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3010000000;
  v50[3] = &unk_1001B5939;
  *(CGFloat *)&v50[4] = v11;
  *(double *)&v50[5] = v15;
  int64_t v16 = [(LargeMonthWeekView *)self dayIndexForToday];
  id v17 = [(EKCalendarDate *)self->_startDate dayOfWeek];
  uint64_t v18 = ((uint64_t)v17 - CUIKZeroIndexedWeekStart() + 6) % 7;
  weekNumberLabel = self->_weekNumberLabel;
  if (weekNumberLabel)
  {
    [(UILabel *)weekNumberLabel sizeToFit];
    [(UILabel *)self->_weekNumberLabel frame];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    [(CALayer *)self->_topBorderLine frame];
    CGRectGetMaxY(v54);
    [(UILabel *)self->_weekNumberLabel _firstLineBaselineOffsetFromBoundsTop];
    CalRoundToScreenScale();
    double v27 = v26;
    int IsLeftToRight = CalTimeDirectionIsLeftToRight();
    double v29 = v27 + 21.0;
    CGRect v30 = &self->_dayFrames[v18];
    CGFloat v31 = v30->origin.x;
    CGFloat v32 = v30->origin.y;
    CGFloat v33 = v30->size.width;
    CGFloat v34 = v30->size.height;
    if (IsLeftToRight)
    {
      CGRectGetMinX(*(CGRect *)&v31);
    }
    else
    {
      CGRectGetMaxX(*(CGRect *)&v31);
      v55.origin.CGFloat x = v21;
      v55.origin.CGFloat y = v29;
      v55.size.CGFloat width = v23;
      v55.size.CGFloat height = v25;
      CGRectGetWidth(v55);
    }
    CalRoundToScreenScale();
    -[UILabel setFrame:](self->_weekNumberLabel, "setFrame:");
  }
  dayNumberLabels = self->_dayNumberLabels;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100029E9C;
  v49[3] = &unk_1001D2790;
  v49[4] = self;
  v49[5] = v50;
  v49[6] = v18;
  [(NSArray *)dayNumberLabels enumerateObjectsUsingBlock:v49];
  if (v16 < 0 || v16 >= self->_firstDayIndex + self->_dayCount)
  {
    [(_CircleView *)self->_todayCircle setHidden:1];
  }
  else
  {
    v36 = [(NSArray *)self->_dayNumberLabels objectAtIndexedSubscript:v16];
    [v36 frame];
    double v37 = CGRectGetWidth(v56);
    unsigned __int8 v38 = [(_CircleView *)self->_todayCircle usesRoundedRectInsteadOfCircle];
    double v39 = v37 + 10.0;
    if ((v38 & (v37 + 10.0 > 26.0)) != 0) {
      double v40 = v37 + 10.0;
    }
    else {
      double v40 = 26.0;
    }
    [v36 frame:v39];
    CGRectGetMidX(v57);
    v58.size.CGFloat height = 26.0;
    v58.origin.CGFloat x = v11;
    v58.origin.CGFloat y = v15;
    v58.size.CGFloat width = v40;
    CGRectGetWidth(v58);
    CalRoundToScreenScale();
    CGFloat v42 = v41;
    [v36 frame];
    CGRectGetMidY(v59);
    v60.size.CGFloat height = 26.0;
    v60.origin.CGFloat x = v42;
    v60.origin.CGFloat y = v15;
    v60.size.CGFloat width = v40;
    CGRectGetHeight(v60);
    CalRoundToScreenScale();
    CalRoundRectToScreenScale();
    -[_CircleView setFrame:](self->_todayCircle, "setFrame:");
    [(_CircleView *)self->_todayCircle setHidden:0];
  }
  CalRoundToScreenScale();
  [(LargeMonthWeekView *)self bounds];
  CGRectGetWidth(v61);
  [(LargeMonthWeekView *)self bounds];
  if ([(LargeMonthWeekView *)self _hasPaddingRow])
  {
    [(LargeMonthWeekView *)self bounds];
    CalRoundToScreenScale();
  }
  CalRoundRectToScreenScale();
  -[MonthWeekOccurrencesView setFrame:](self->_occurrencesView, "setFrame:");
  for (uint64_t i = 0; i != 7; ++i)
  {
    -[LargeMonthWeekView convertRect:toView:](self, "convertRect:toView:", self->_occurrencesView, self->_dayFrames[i].origin.x, self->_dayFrames[i].origin.y, self->_dayFrames[i].size.width, self->_dayFrames[i].size.height);
    v44 = &v52[i * 32];
    void *v44 = v45;
    v44[1] = v46;
    v44[2] = v47;
    v44[3] = v48;
  }
  [(MonthWeekOccurrencesView *)self->_occurrencesView setDayFrames:v52];
  _Block_object_dispose(v50, 8);
}

- (id)dayFrames
{
  [(LargeMonthWeekView *)self _updateDayFrames];
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:7];
  dayFrames = self->_dayFrames;
  for (uint64_t i = 24; i != 248; i += 32)
  {
    double v6 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", *(double *)((char *)dayFrames + i - 24), *(double *)((char *)dayFrames + i - 16), *(double *)((char *)dayFrames + i - 8), *(double *)((char *)&dayFrames->origin.x + i));
    [v3 addObject:v6];
  }

  return v3;
}

- (BOOL)containsCalendarDate:(id)a3
{
  id v4 = a3;
  double v5 = [(LargeMonthWeekView *)self calendarDate];
  id v6 = [v5 compare:v4];

  if (v6 == (id)1)
  {
    BOOL v7 = 0;
  }
  else
  {
    unsigned int v8 = [(LargeMonthWeekView *)self endCalendarDate];
    BOOL v7 = [v8 compare:v4] != (id)-1;
  }
  return v7;
}

- (id)dateAtPoint:(CGPoint)a3
{
  if (self->_dayCount < 1)
  {
LABEL_5:
    BOOL v9 = 0;
  }
  else
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    uint64_t v6 = 0;
    dayFrames = self->_dayFrames;
    while (1)
    {
      p_CGFloat x = &dayFrames[v6 + self->_firstDayIndex].origin.x;
      v13.origin.CGFloat x = *p_x;
      v13.origin.CGFloat y = p_x[1];
      v13.size.CGFloat height = p_x[3];
      v13.size.CGFloat width = p_x[2] + self->_gridlineThickness;
      v12.CGFloat x = x;
      v12.CGFloat y = y;
      if (CGRectContainsPoint(v13, v12)) {
        break;
      }
      if (++v6 >= self->_dayCount) {
        goto LABEL_5;
      }
    }
    BOOL v9 = [(LargeMonthWeekView *)self dateForIndex:v6];
  }

  return v9;
}

- (CGRect)frameForOccurrence:(id)a3 onDay:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(LargeMonthWeekView *)self layoutIfNeeded];
  [(MonthWeekOccurrencesView *)self->_occurrencesView frameForOccurrence:v7 onDay:v6];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v20.origin.double x = v9;
  v20.origin.double y = v11;
  v20.size.double width = v13;
  v20.size.double height = v15;
  if (CGRectIsNull(v20))
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  else
  {
    -[LargeMonthWeekView convertRect:fromView:](self, "convertRect:fromView:", self->_occurrencesView, v9, v11, v13, v15);
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)frameForOccurrenceAfterLastOnDay:(id)a3
{
  id v4 = a3;
  [(LargeMonthWeekView *)self layoutIfNeeded];
  [(MonthWeekOccurrencesView *)self->_occurrencesView frameForOccurrenceAfterLastOnDay:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[LargeMonthWeekView convertRect:fromView:](self, "convertRect:fromView:", self->_occurrencesView, v6, v8, v10, v12);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  [(LargeMonthWeekView *)self bounds];
  double v22 = v21;
  if ([(LargeMonthWeekView *)self _hasPaddingRow])
  {
    CalRoundToScreenScale();
    double v22 = v23;
  }
  v29.origin.double x = v14;
  v29.origin.double y = v16;
  v29.size.double width = v18;
  v29.size.double height = v20;
  CGFloat MaxY = CGRectGetMaxY(v29);
  double v25 = v22 - v20;
  if (MaxY <= v22) {
    double v25 = v16;
  }
  double v26 = v14;
  double v27 = v18;
  double v28 = v20;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v25;
  result.origin.double x = v26;
  return result;
}

- (void)setHighlightedDayRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t dayCount = self->_dayCount;
    if (a3.location + a3.length > dayCount) {
      NSUInteger length = dayCount - a3.location;
    }
  }
  if (a3.location != self->_highlightedDayRange.location || length != self->_highlightedDayRange.length)
  {
    self->_highlightedDayRange.NSUInteger location = a3.location;
    self->_highlightedDayRange.NSUInteger length = length;
    highlightedDays = self->_highlightedDays;
    if (!highlightedDays)
    {
      double v9 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:7];
      double v10 = self->_highlightedDays;
      self->_highlightedDays = v9;

      highlightedDays = self->_highlightedDays;
    }
    id v26 = [(NSMutableDictionary *)highlightedDays mutableCopy];
    if (length && location < length + location)
    {
      NSUInteger v11 = location;
      do
      {
        double v12 = +[NSNumber numberWithUnsignedInteger:v11];
        uint64_t v13 = [(NSMutableDictionary *)self->_highlightedDays objectForKey:v12];
        if (v13)
        {
          id v14 = (id)v13;
          [v26 removeObjectForKey:v12];
        }
        else
        {
          if (qword_1002164B0 != -1) {
            dispatch_once(&qword_1002164B0, &stru_1001D27B0);
          }
          id v15 = objc_alloc((Class)UIView);
          CalRoundRectToScreenScale();
          id v16 = [v15 initWithFrame:];
          [v16 setBackgroundColor:qword_1002164A8];
          [v16 setAlpha:0.0];
          [(LargeMonthWeekView *)self addSubview:v16];
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_10002AE9C;
          v35[3] = &unk_1001D2740;
          id v14 = v16;
          id v36 = v14;
          +[UIView animateWithDuration:2 delay:v35 options:0 animations:0.2 completion:0.0];
          [(NSMutableDictionary *)self->_highlightedDays setObject:v14 forKey:v12];
        }
        ++v11;
        --length;
      }
      while (length);
    }
    double v17 = self;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [v26 allKeys];
    id v18 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v19; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          double v23 = [v26 objectForKey:v22];
          [(NSMutableDictionary *)v17->_highlightedDays removeObjectForKey:v22];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_10002AEA8;
          v29[3] = &unk_1001D2740;
          id v30 = v23;
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10002AEB4;
          v27[3] = &unk_1001D27D8;
          id v28 = v30;
          id v24 = v30;
          +[UIView animateWithDuration:6 delay:v29 options:v27 animations:0.2 completion:0.0];
        }
        id v19 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v19);
    }
  }
}

- (id)newFeedbackViewForDraggingOccurrence:(id)a3 atPoint:(CGPoint)a4
{
  double x = a4.x;
  id v6 = a3;
  if (x < 0.0) {
    double x = 0.0;
  }
  [(LargeMonthWeekView *)self frame];
  double MaxX = CGRectGetMaxX(v29);
  if (x > MaxX)
  {
    [(LargeMonthWeekView *)self frame];
    double MaxX = CGRectGetMaxX(v30);
  }
  double v8 = [v6 startCalendarDate:MaxX];
  [v8 absoluteTime];
  double v10 = v9;
  [(EKCalendarDate *)self->_startDate absoluteTime];
  double v12 = v11;

  if (v10 >= v12)
  {
    uint64_t v13 = [v6 startCalendarDate];
  }
  else
  {
    uint64_t v13 = self->_startDate;
  }
  id v14 = v13;
  id v15 = [(MonthWeekOccurrencesView *)self->_occurrencesView occurrenceViewForOccurrence:v6 onDay:v13];
  [v15 setSelected:1];
  float v16 = kDraggedEventShadowOpacity;
  double v17 = [v15 layer];
  *(float *)&double v18 = v16;
  [v17 setShadowOpacity:v18];

  DraggedEventShadowOffset();
  double v20 = v19;
  double v22 = v21;
  double v23 = [v15 layer];
  [v23 setShadowOffset:v20, v22];

  double v24 = kDraggedEventShadowRadius;
  double v25 = [v15 layer];
  [v25 setShadowRadius:v24];

  uint64_t v26 = DraggedEventShadowColor();
  double v27 = [v15 layer];
  [v27 setShadowColor:v26];

  return v15;
}

- (void)didCompleteMonthWeekViewBackgroundRendering
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 didCompleteBackgroundOccurrenceRenderingForLargeMonthWeekView:self];
  }
}

- (BOOL)isBackgroundScene
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_delegate);
  unsigned __int8 v6 = [v5 isBackgroundScene];

  return v6;
}

- (void)monthWeekOccurrencesView:(id)a3 selectedEvent:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained largeMonthWeekView:self didTapOccurrence:v8 onDay:0 extendSelection:0 userInitiated:v5 tappedSymbol:0];
}

- (id)presentationControllerForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v3 = [WeakRetained presentationControllerForEditMenu];

  return v3;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v3 = [WeakRetained selectedEventsForEditMenu];

  return v3;
}

- (void)attemptDisplayReviewPrompt
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 attemptDisplayReviewPrompt];
  }
}

- (double)monthWeekScale
{
  return 1.0;
}

- (id)weekdayLabels
{
  return self->_dayNumberLabels;
}

- (id)todayCircle
{
  return self->_todayCircle;
}

- (CGRect)circleFrame
{
  todayCircle = self->_todayCircle;
  if (todayCircle)
  {
    [(_CircleView *)todayCircle frame];
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)occurrencesView
{
  return self->_occurrencesView;
}

- (int64_t)dayIndexForToday
{
  todayDadouble y = self->_todayDay;
  if (todayDay) {
    return todayDay - (void)[(EKCalendarDate *)self->_startDate day] + self->_firstDayIndex;
  }
  else {
    return -1;
  }
}

- (int64_t)todayDay
{
  return self->_todayDay;
}

- (void)setTodayDay:(int64_t)a3
{
  self->_todayDadouble y = a3;
}

- (BOOL)showsTopBorder
{
  return self->_showsTopBorder;
}

- (BOOL)showsWeekNumber
{
  return self->_showsWeekNumber;
}

- (_NSRange)highlightedDayRange
{
  p_highlightedDayRange = &self->_highlightedDayRange;
  NSUInteger location = self->_highlightedDayRange.location;
  NSUInteger length = p_highlightedDayRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (LargeMonthWeekViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (LargeMonthWeekViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (LargeMonthWeekViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LargeMonthWeekViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_occurrencesView, 0);
  objc_storeStrong((id *)&self->_dayBadgeLocales, 0);
  objc_storeStrong((id *)&self->_dayBadgeColors, 0);
  objc_storeStrong((id *)&self->_specialDayTypes, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_firstOfMonthNoDayLabel, 0);
  objc_storeStrong((id *)&self->_firstOfMonthLabel, 0);
  objc_storeStrong((id *)&self->_occurrencesScrollView, 0);
  objc_storeStrong((id *)&self->_highlightedDays, 0);
  objc_storeStrong((id *)&self->_overlayUnderline, 0);
  objc_storeStrong((id *)&self->_dayBadgeViewBesideFirstOfMonthLabel, 0);
  objc_storeStrong((id *)&self->_dayBadgeViews, 0);
  objc_storeStrong((id *)&self->_overlayLabels, 0);
  objc_storeStrong((id *)&self->_dayNumberLabels, 0);
  objc_storeStrong((id *)&self->_todayCircle, 0);
  objc_storeStrong((id *)&self->_paddingRowBorderLine, 0);

  objc_storeStrong((id *)&self->_topBorderLine, 0);
}

@end