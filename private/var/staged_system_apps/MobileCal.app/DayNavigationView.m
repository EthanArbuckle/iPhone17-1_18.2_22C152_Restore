@interface DayNavigationView
+ (id)_weekNumberFont;
- (BOOL)canAnimateToDate:(id)a3;
- (BOOL)dayNavigationWeekScrollViewAllowedToChangeSelectedDate;
- (BOOL)dayNavigationWeekScrollViewIsLoadingSpecialDayData:(id)a3;
- (BOOL)showWeekNumber;
- (BOOL)showsMultiDay;
- (CGSize)sizeThatFits:(CGSize)a3;
- (DayNavigationView)initWithCalendar:(id)a3 selectedDate:(id)a4 cellFactory:(id)a5 eventSpringLoadingEnabled:(BOOL)a6;
- (DayNavigationViewDelegate)delegate;
- (DayNavigationWeekScrollView)weekScrollView;
- (UIEdgeInsets)paletteSafeAreaInsets;
- (id)dayNavigationWeekScrollView:(id)a3 dayDataForDate:(id)a4;
- (void)_stopPulsingToday;
- (void)_updateFontSizes;
- (void)_updateWeekNumberLabel;
- (void)contentSizeCategoryChanged;
- (void)dayNavigationWeekScrollView:(id)a3 didChangeCellWidth:(double)a4;
- (void)dayNavigationWeekScrollView:(id)a3 selectedDateChanged:(id)a4;
- (void)dayNavigationWeekScrollViewFailedToSelectDate:(id)a3;
- (void)dealloc;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)pulseToday;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPaletteSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setSelectedDate:(id)a3 animated:(BOOL)a4;
- (void)setShowWeekNumber:(BOOL)a3;
- (void)setShowsMultiDay:(BOOL)a3;
- (void)significantTimeChangeOccurred;
- (void)updateShowWeekNumber;
- (void)willTransitionToSize;
@end

@implementation DayNavigationView

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DayNavigationView;
  [(DayNavigationView *)&v6 setBackgroundColor:v4];
  [(DayNavigationWeekScrollView *)self->_weekScrollView setBackgroundColor:v4];
  if ([(DayNavigationView *)self showWeekNumber])
  {
    [(UILabel *)self->_weekNumberLabel setBackgroundColor:v4];
    weekNumberLabelBackgroundView = self->_weekNumberLabelBackgroundView;
    if (weekNumberLabelBackgroundView) {
      [(UIView *)weekNumberLabelBackgroundView setBackgroundColor:v4];
    }
  }
}

- (void)setSelectedDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v7)
  {
    selectedDate = self->_selectedDate;
    if (!selectedDate || ![(NSDate *)selectedDate isEqualToDate:v7])
    {
      objc_storeStrong((id *)&self->_selectedDate, a3);
      [(DayNavigationWeekScrollView *)self->_weekScrollView cancelScrollingAnimation];
      [(DayNavigationWeekScrollView *)self->_weekScrollView setSelectedDate:v7 animated:v4];
      [(DayNavigationView *)self _updateWeekNumberLabel];
    }
  }
  else
  {
    v9 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      int v13 = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "nil selected date provided.  Will not update [%@]", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)dayNavigationWeekScrollView:(id)a3 didChangeCellWidth:(double)a4
{
  objc_super v6 = [(DayNavigationView *)self delegate];

  if (v6)
  {
    id v7 = [(DayNavigationView *)self delegate];
    [v7 dayNavigationView:self didChangeCellWidth:a4];
  }
}

- (DayNavigationView)initWithCalendar:(id)a3 selectedDate:(id)a4 cellFactory:(id)a5 eventSpringLoadingEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v30.receiver = self;
  v30.super_class = (Class)DayNavigationView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v17 = -[DayNavigationView initWithFrame:](&v30, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_calendar, a3);
    uint64_t v19 = [v11 timeZone];
    timeZone = v18->_timeZone;
    v18->_timeZone = (NSTimeZone *)v19;

    v21 = -[DayNavigationWeekScrollView initWithFrame:calendar:selectedDate:cellFactory:eventSpringLoadingEnabled:]([DayNavigationWeekScrollView alloc], "initWithFrame:calendar:selectedDate:cellFactory:eventSpringLoadingEnabled:", v11, v12, v13, v6, CGRectZero.origin.x, y, width, height);
    weekScrollView = v18->_weekScrollView;
    v18->_weekScrollView = v21;

    [(DayNavigationWeekScrollView *)v18->_weekScrollView setDelegate:v18];
    [(DayNavigationWeekScrollView *)v18->_weekScrollView setNavDelegate:v18];
    [(DayNavigationView *)v18 addSubview:v18->_weekScrollView];
    v23 = (ScrollSpringFactory *)objc_alloc_init((Class)ScrollSpringFactory);
    springFactordouble y = v18->_springFactory;
    v18->_springFactordouble y = v23;

    v25 = +[UIColor clearColor];
    [(DayNavigationView *)v18 setBackgroundColor:v25];

    [(DayNavigationView *)v18 setSelectedDate:v12 animated:0];
    [(DayNavigationView *)v18 updateShowWeekNumber];
    uint64_t v31 = objc_opt_class();
    v26 = +[NSArray arrayWithObjects:&v31 count:1];
    id v27 = [(DayNavigationView *)v18 registerForTraitChanges:v26 withAction:"updateShowWeekNumber"];

    v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:v18 selector:"_dayTimeViewHourWidthChanged" name:EKDayTimeViewHourWidthChangedNotification object:0];
  }
  return v18;
}

- (id)dayNavigationWeekScrollView:(id)a3 dayDataForDate:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(DayNavigationView *)self delegate];

  if (v6)
  {
    id v7 = [(DayNavigationView *)self delegate];
    v8 = [v7 dayNavigationView:self dayDataForDate:v5];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)dayNavigationWeekScrollViewIsLoadingSpecialDayData:(id)a3
{
  BOOL v4 = [(DayNavigationView *)self delegate];

  if (v4)
  {
    id v5 = [(DayNavigationView *)self delegate];
    [v5 dayNavigationViewIsLoadingSpecialDayData:self];
  }
  return 0;
}

- (DayNavigationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DayNavigationViewDelegate *)WeakRetained;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  IsCompactInViewHierarchdouble y = EKUICurrentWidthSizeClassIsCompactInViewHierarchy();
  id v7 = [(DayNavigationView *)self traitCollection];
  int v8 = EKUIUsesRoundedRectsInsteadOfCircles();

  if (IsCompactInViewHierarchy)
  {
    if (v8)
    {
      -[DayNavigationWeekScrollView sizeThatFits:](self->_weekScrollView, "sizeThatFits:", width, height);
      double v10 = v9 + 10.0;
    }
    else
    {
      double v10 = 50.0;
    }
  }
  else
  {
    weekScrollView = self->_weekScrollView;
    if (v8)
    {
      -[DayNavigationWeekScrollView sizeThatFits:](weekScrollView, "sizeThatFits:", width, height);
    }
    else
    {
      id v12 = [(DayNavigationWeekScrollView *)weekScrollView cellFactory];
      objc_msgSend(objc_msgSend(v12, "cellClass"), "circleDiameter");
      double v14 = v13 + 4.0;

      double v15 = fmax(v14, 41.0);
      v16 = CUIKGetOverlayCalendar();

      if (v16) {
        double v10 = v15 + 17.0;
      }
      else {
        double v10 = v15;
      }
    }
  }
  double v17 = width;
  result.double height = v10;
  result.double width = v17;
  return result;
}

- (DayNavigationWeekScrollView)weekScrollView
{
  return self->_weekScrollView;
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)DayNavigationView;
  [(DayNavigationView *)&v54 layoutSubviews];
  [(DayNavigationView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();
  double v12 = 0.0;
  double v13 = 0.0;
  if (IsRegularInViewHierarchy)
  {
    [(DayNavigationWeekScrollView *)self->_weekScrollView cellsDisplayed];
    CalFloorToScreenScale();
    double v12 = -6.0;
  }
  double v14 = v4 + v12 + v13;
  -[DayNavigationWeekScrollView sizeThatFits:](self->_weekScrollView, "sizeThatFits:", v8 + v13 * -2.0, v10);
  double Width = v15;
  double v18 = v17 + 4.0;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  if (![(DayNavigationView *)self showWeekNumber]) {
    goto LABEL_21;
  }
  v20 = [(DayNavigationView *)self traitCollection];
  int v21 = EKUIPrefersLargerTextThanDefault();

  if (v21)
  {
    [(DayNavigationView *)self layoutMargins];
    if (IsLeftToRight) {
      double v24 = v22;
    }
    else {
      double v24 = v23;
    }
    [(UILabel *)self->_weekNumberLabel frame];
    double v25 = v24 + CGRectGetWidth(v55);
    v56.origin.x = v14;
    v56.origin.double y = v6;
    v56.size.double width = Width;
    v56.size.double height = v18;
    double Width = CGRectGetWidth(v56);
    v57.origin.x = v4;
    v57.origin.double y = v6;
    v57.size.double width = v8;
    v57.size.double height = v10;
    double v26 = CGRectGetWidth(v57) - v25;
    if (Width >= v26) {
      double Width = v26;
    }
    if (IsLeftToRight)
    {
      v58.origin.x = v14;
      v58.origin.double y = v6;
      v58.size.double width = Width;
      v58.size.double height = v18;
      if (CGRectGetMinX(v58) < v25) {
        goto LABEL_22;
      }
    }
    else
    {
      v59.origin.x = v4;
      v59.origin.double y = v6;
      v59.size.double width = v8;
      v59.size.double height = v10;
      double v40 = CGRectGetMaxX(v59) - v25;
      v60.origin.x = v14;
      v60.origin.double y = v6;
      v60.size.double width = Width;
      v60.size.double height = v18;
      if (CGRectGetMaxX(v60) > v40)
      {
        v61.origin.x = v14;
        v61.origin.double y = v6;
        v61.size.double width = Width;
        v61.size.double height = v18;
        double v25 = v40 - CGRectGetWidth(v61);
        goto LABEL_22;
      }
    }
LABEL_21:
    double v25 = v14;
    goto LABEL_22;
  }
  if (EKUIIsExtended())
  {
    UIRectInsetEdges();
    double v28 = v27;
    double v6 = v29;
    double v31 = v30;
    double v18 = v32;
    [(DayNavigationView *)self layoutMargins];
    double v34 = v33;
    double v36 = v35;
    [(DayNavigationView *)self layoutMargins];
    if (!IsLeftToRight) {
      double v37 = v38;
    }
    double v39 = -(v36 + 9.0);
    if (IsLeftToRight) {
      double v39 = v34 + 9.0;
    }
    double v25 = v28 + v39;
    double Width = v31 - v37;
  }
  else
  {
    UIRectInsetEdges();
    double v25 = v48;
    double v6 = v49;
    double Width = v50;
    double v18 = v51;
  }
LABEL_22:
  -[DayNavigationWeekScrollView setFrame:](self->_weekScrollView, "setFrame:", v25, v6, Width, v18);
  if ([(DayNavigationView *)self showWeekNumber])
  {
    +[EKDayTimeView timeWidthForOrientation:EKUIInterfaceOrientationForViewHierarchy() inViewHierarchy:self];
    [(DayNavigationView *)self bounds];
    CGRectGetMinX(v62);
    [(DayNavigationView *)self bounds];
    CGRectGetMaxY(v63);
    CalRoundRectToScreenScale();
    if ((IsLeftToRight & 1) == 0)
    {
      [(DayNavigationView *)self bounds];
      CGRectGetWidth(v64);
      CalRoundToScreenScale();
    }
    -[UIView setFrame:](self->_weekNumberLabelBackgroundView, "setFrame:");
    [(UIView *)self->_weekNumberLabelBackgroundView frame];
    +[WeekAllDayView baselineForWeekdayLabelsWithSizeClass:EKUIWidthSizeClassForViewHierarchy()];
    [(UILabel *)self->_weekNumberLabel _firstLineBaselineOffsetFromBoundsTop];
    CalRoundToScreenScale();
    double v42 = v41;
    v43 = [(DayNavigationView *)self traitCollection];
    int v44 = EKUIPrefersLargerTextThanDefault();

    if (v44)
    {
      double MaxX = 2.0;
      if ((IsLeftToRight & 1) == 0)
      {
        v65.origin.x = v25;
        v65.origin.double y = v6;
        v65.size.double width = Width;
        v65.size.double height = v18;
        double MaxX = CGRectGetMaxX(v65);
      }
    }
    else
    {
      [(DayNavigationView *)self paletteSafeAreaInsets];
      if (IsLeftToRight) {
        double MaxX = v46 + 20.0;
      }
      else {
        double MaxX = v47 + 16.0;
      }
    }
    -[UILabel sizeThatFits:](self->_weekNumberLabel, "sizeThatFits:", 10.0, 10.0);
    -[UILabel setFrame:](self->_weekNumberLabel, "setFrame:", MaxX, v42, v52, v53);
  }
}

- (BOOL)showWeekNumber
{
  return self->_showWeekNumber;
}

- (void)updateShowWeekNumber
{
  id v4 = +[CUIKPreferences sharedPreferences];
  if ([v4 showWeekNumbers])
  {
    double v3 = [(DayNavigationView *)self traitCollection];
    -[DayNavigationView setShowWeekNumber:](self, "setShowWeekNumber:", [v3 horizontalSizeClass] == (id)2);
  }
  else
  {
    [(DayNavigationView *)self setShowWeekNumber:0];
  }
}

- (void)setShowsMultiDay:(BOOL)a3
{
}

- (void)setShowWeekNumber:(BOOL)a3
{
  if (self->_showWeekNumber != a3)
  {
    self->_showWeekNumber = a3;
    if (a3)
    {
      if (qword_1002169B8 != -1) {
        dispatch_once(&qword_1002169B8, &stru_1001D53B0);
      }
      id v4 = (UIView *)objc_opt_new();
      weekNumberLabelBackgroundView = self->_weekNumberLabelBackgroundView;
      self->_weekNumberLabelBackgroundView = v4;

      double v6 = +[UIColor clearColor];
      [(UIView *)self->_weekNumberLabelBackgroundView setBackgroundColor:v6];

      [(DayNavigationView *)self addSubview:self->_weekNumberLabelBackgroundView];
      double v7 = (UILabel *)objc_opt_new();
      weekNumberLabel = self->_weekNumberLabel;
      self->_weekNumberLabel = v7;

      double v9 = [(id)objc_opt_class() _weekNumberFont];
      [(UILabel *)self->_weekNumberLabel setFont:v9];

      [(UILabel *)self->_weekNumberLabel setTextColor:qword_1002169B0];
      double v10 = +[UIColor clearColor];
      [(UILabel *)self->_weekNumberLabel setBackgroundColor:v10];

      [(DayNavigationView *)self addSubview:self->_weekNumberLabel];
      [(DayNavigationView *)self _updateWeekNumberLabel];
    }
    else
    {
      [(UILabel *)self->_weekNumberLabel removeFromSuperview];
      id v11 = self->_weekNumberLabel;
      self->_weekNumberLabel = 0;
    }
    [(DayNavigationView *)self setNeedsLayout];
    [(DayNavigationView *)self _updateFontSizes];
  }
}

- (void)setPaletteSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_paletteSafeAreaInsets = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
  [(DayNavigationView *)self _stopPulsingToday];
  weekScrollView = self->_weekScrollView;

  [(DayNavigationWeekScrollView *)weekScrollView didScroll];
}

- (void)_updateWeekNumberLabel
{
  if (self->_showWeekNumber)
  {
    calendar = self->_calendar;
    id v4 = [(DayNavigationWeekScrollView *)self->_weekScrollView startDateOfSelectedWeek];
    id v5 = [(NSCalendar *)calendar component:0x2000 fromDate:v4];

    double v6 = self->_calendar;
    double v7 = objc_opt_new();
    id v8 = [(NSCalendar *)v6 component:0x2000 fromDate:v7];

    if (v5 == v8) {
      CalendarAppTintColor();
    }
    else {
    double v9 = WeekendTextColor();
    }
    [(UILabel *)self->_weekNumberLabel setTextColor:v9];

    double v10 = +[NSBundle bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"W%@" value:&stru_1001D6918 table:0];
    double v12 = CUIKLocalizedStringForInteger();
    double v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v12);
    [(UILabel *)self->_weekNumberLabel setText:v13];

    [(UILabel *)self->_weekNumberLabel sizeToFit];
  }

  [(DayNavigationView *)self setNeedsLayout];
}

- (void)_stopPulsingToday
{
}

- (void)dealloc
{
  double v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:EKDayTimeViewHourWidthChangedNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)DayNavigationView;
  [(DayNavigationView *)&v4 dealloc];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)DayNavigationView;
  [(DayNavigationView *)&v3 layoutMarginsDidChange];
  [(DayNavigationView *)self setNeedsLayout];
}

- (void)willTransitionToSize
{
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4 = a3;
  [(DayNavigationWeekScrollView *)self->_weekScrollView _pageDecelerationTarget];
  double v6 = v5;
  uint64_t v8 = v7;
  double v9 = -[DayNavigationWeekScrollView selectedDateAfterScrollingToPoint:](self->_weekScrollView, "selectedDateAfterScrollingToPoint:");
  objc_storeStrong((id *)&self->_selectedDate, v9);
  [(DayNavigationWeekScrollView *)self->_weekScrollView setSelectedDateWithoutScrolling:v9];
  [(DayNavigationView *)self _updateWeekNumberLabel];
  double v10 = [(DayNavigationView *)self delegate];

  if (v10)
  {
    CalAnalyticsSendEventLazy();
    id v11 = [(DayNavigationView *)self delegate];
    [v11 dayNavigationView:self selectedDateChanged:v9];
  }
  [v4 contentOffset];
  double v13 = v12;
  double v15 = v14;
  [v4 _horizontalVelocity];
  if (v16 < 0.0) {
    double v16 = -v16;
  }
  double v17 = v13 - v6;
  if (v13 - v6 < 0.0) {
    double v17 = -(v13 - v6);
  }
  double v18 = v16 / v17;
  EKUIScaleFactor();
  [(ScrollSpringFactory *)self->_springFactory setInitialVelocity:v19 * v18 * 1000.0];
  [v4 stopScrollingAndZooming];
  [v4 setContentOffset:0 animated:v13];
  springAnimationDuration();
  double v21 = v20;
  springFactordouble y = self->_springFactory;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000F889C;
  v26[3] = &unk_1001D2A18;
  v26[4] = self;
  *(double *)&v26[5] = v6;
  v26[6] = v8;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000F88B8;
  v24[3] = &unk_1001D3188;
  v24[4] = self;
  id v25 = v4;
  id v23 = v4;
  +[UIView _animateWithDuration:393222 delay:springFactory options:v26 factory:v24 animations:v21 completion:0.0];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(DayNavigationWeekScrollView *)self->_weekScrollView setNeedsLayout];
  [(DayNavigationWeekScrollView *)self->_weekScrollView didFinishScrolling];
  weekScrollView = self->_weekScrollView;

  [(DayNavigationWeekScrollView *)weekScrollView updateHighlightIfNeeded];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  [(DayNavigationWeekScrollView *)self->_weekScrollView setNeedsLayout];
  [(DayNavigationWeekScrollView *)self->_weekScrollView didFinishScrolling];
  weekScrollView = self->_weekScrollView;

  [(DayNavigationWeekScrollView *)weekScrollView updateHighlightIfNeeded];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(DayNavigationWeekScrollView *)self->_weekScrollView cancelScrollingAnimation];
  weekScrollView = self->_weekScrollView;

  [(DayNavigationWeekScrollView *)weekScrollView willBeginDragging];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
}

- (BOOL)dayNavigationWeekScrollViewAllowedToChangeSelectedDate
{
  objc_super v3 = [(DayNavigationView *)self delegate];

  if (!v3) {
    return 1;
  }
  id v4 = [(DayNavigationView *)self delegate];
  unsigned __int8 v5 = [v4 dayNavigationViewAllowedToChangeSelectedDate];

  return v5;
}

- (void)dayNavigationWeekScrollViewFailedToSelectDate:(id)a3
{
  id v6 = a3;
  id v4 = [(DayNavigationView *)self delegate];

  if (v4)
  {
    unsigned __int8 v5 = [(DayNavigationView *)self delegate];
    [v5 dayNavigationViewFailedToSelectDate:v6];
  }
}

- (void)dayNavigationWeekScrollView:(id)a3 selectedDateChanged:(id)a4
{
  id v7 = a4;
  -[DayNavigationView setSelectedDate:animated:](self, "setSelectedDate:animated:");
  unsigned __int8 v5 = [(DayNavigationView *)self delegate];

  if (v5)
  {
    id v6 = [(DayNavigationView *)self delegate];
    [v6 dayNavigationView:self selectedDateChanged:v7];
  }
}

- (void)_updateFontSizes
{
  objc_super v3 = [(id)objc_opt_class() _weekNumberFont];
  [(UILabel *)self->_weekNumberLabel setFont:v3];

  [(DayNavigationView *)self setNeedsLayout];
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
  id v7 = a3;
  [(DayNavigationWeekScrollView *)self->_weekScrollView setSelectedDate:self->_selectedDate animated:0];
  [(DayNavigationWeekScrollView *)self->_weekScrollView setCalendar:v7];
  unsigned __int8 v5 = [v7 timeZone];
  timeZone = self->_timeZone;
  self->_timeZone = v5;
}

- (void)significantTimeChangeOccurred
{
}

- (void)contentSizeCategoryChanged
{
  [(DayNavigationWeekScrollView *)self->_weekScrollView contentSizeCategoryChanged];

  [(DayNavigationView *)self _updateFontSizes];
}

- (BOOL)canAnimateToDate:(id)a3
{
  return [(DayNavigationWeekScrollView *)self->_weekScrollView canAnimateToDate:a3];
}

- (void)pulseToday
{
}

- (BOOL)showsMultiDay
{
  return [(DayNavigationWeekScrollView *)self->_weekScrollView showsMultiDay];
}

+ (id)_weekNumberFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:16.0 shouldScaleForSmallerSizes:23.0];

  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (UIEdgeInsets)paletteSafeAreaInsets
{
  double top = self->_paletteSafeAreaInsets.top;
  double left = self->_paletteSafeAreaInsets.left;
  double bottom = self->_paletteSafeAreaInsets.bottom;
  double right = self->_paletteSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_weekNumberLabelBackgroundView, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_weekScrollView, 0);
  objc_storeStrong((id *)&self->_springFactory, 0);
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end