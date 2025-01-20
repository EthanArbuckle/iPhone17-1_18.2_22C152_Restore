@interface CompactMonthViewController
+ (double)maximumWeekScale;
+ (double)minimumWeekScale;
+ (double)scrubbingMinimumPressDuration;
+ (double)topOfMonthNameLabelToGrayLineDistance;
+ (id)dividedModeBackgroundColor;
+ (id)monthNameFont;
- (BOOL)pinchToZoomAllowed;
- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible;
- (BOOL)showsYearInMonthLabel;
- (double)monthWeekScale;
- (double)palleteViewXOffset;
- (double)topInsetForSubviewWithCalendarDate:(id)a3;
- (id)dayHeaderFrames;
- (void)_updateDayHeaderFrames;
- (void)contentSizeCategoryChanged;
- (void)didScroll;
- (void)setShouldRespondToApplicationDidBecomeActiveStateChange:(BOOL)a3;
- (void)updatePalette:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewIsAppearing:(BOOL)a3;
- (void)weekNumbersPrefChanged;
@end

@implementation CompactMonthViewController

+ (double)scrubbingMinimumPressDuration
{
  return 0.1;
}

+ (id)dividedModeBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompactMonthViewController;
  [(CompactMonthViewController *)&v4 viewIsAppearing:a3];
  [(CompactMonthViewController *)self ekui_adjustNavAndToolBarToTranslucentGrayStyles];
}

- (void)weekNumbersPrefChanged
{
  v3 = +[CUIKPreferences sharedPreferences];
  unsigned __int8 v4 = [v3 showWeekNumbers];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100107920;
  v5[3] = &unk_1001D3420;
  unsigned __int8 v6 = v4;
  [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v5];
}

- (void)updatePalette:(id)a3
{
  id v4 = a3;
  [v4 setTodayButtonVisible:0];
  [v4 setDateStringVisible:1];
  [v4 setWeekdayHeaderVisible:1];
  [v4 setDividerLineVisible:1];
  [v4 setDayScrubberController:0];
  [v4 setFocusBannerPlacement:1];
  [v4 sizeToFit];
  [v4 frame];
  double v6 = v5;
  v7 = [v4 containingPalette];

  [v7 setPreferredHeight:v6];
  self->_previousViewWidth = 0.0;
  id v8 = [(CompactMonthViewController *)self view];
  [v8 setNeedsLayout];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CompactMonthViewController;
  [(MonthViewController *)&v10 viewDidAppear:a3];
  id v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    double v5 = v4;
    double v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = [(CUIKCalendarModel *)self->super.super.super._model selectedDate];
    v9 = [v8 date];
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);
  }
  [(CUIKCalendarModel *)self->super.super.super._model simulateFirstLoadFinished];
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CompactMonthViewController;
  [(InfiniteScrollViewController *)&v9 viewDidLayoutSubviews];
  double previousViewWidth = self->_previousViewWidth;
  id v4 = [(CompactMonthViewController *)self view];
  [v4 bounds];
  double v6 = vabdd_f64(previousViewWidth, v5);

  if (v6 >= 2.22044605e-16)
  {
    [(CompactMonthViewController *)self _updateDayHeaderFrames];
    v7 = [(CompactMonthViewController *)self view];
    [v7 bounds];
    self->_double previousViewWidth = v8;
  }
}

- (double)palleteViewXOffset
{
  return 0.0;
}

- (BOOL)pinchToZoomAllowed
{
  return 0;
}

- (BOOL)showsYearInMonthLabel
{
  return 0;
}

- (void)didScroll
{
  v3 = [(InfiniteScrollViewController *)self firstViewOnScreen];
  id v7 = [v3 calendarDate];

  id v4 = [v7 weekOfMonth];
  if (v4 == [v7 weeksInMonth])
  {
    uint64_t v5 = [v7 calendarDateByAddingWeeks:1];

    id v7 = (id)v5;
  }
  double v6 = [(CompactMonthViewController *)self navigationController];
  [v6 setNavBarStringFromDate:v7 includeMonth:1 includeYear:[self showsYearInMonthLabel]];
}

- (id)dayHeaderFrames
{
  v3 = [(CompactMonthViewController *)self navigationController];
  id v4 = [v3 paletteView];

  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v5 = [(InfiniteScrollViewController *)self firstView];
  if (v5) {
    goto LABEL_4;
  }
  double v6 = [CompactMonthWeekView alloc];
  id v7 = +[NSDate date];
  double v8 = +[NSTimeZone localTimeZone];
  objc_super v9 = +[EKCalendarDate calendarDateWithDate:v7 timeZone:v8];
  objc_super v10 = +[NSCalendar currentCalendar];
  uint64_t v5 = [(CompactMonthWeekView *)v6 initWithCalendarDate:v9 calendar:v10 compressed:0];

  [(CompactMonthWeekView *)v5 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(CompactMonthViewController *)self view];
  [v17 frame];
  double v19 = v18;

  -[CompactMonthWeekView setFrame:](v5, "setFrame:", v12, v14, v19, v16);
  if (v5)
  {
LABEL_4:
    [(CompactMonthWeekView *)v5 layoutIfNeeded];
    v20 = [(CompactMonthWeekView *)v5 dayNumberCellFrames];
    id v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v20, "count"));
    if ([v20 count])
    {
      unint64_t v22 = 0;
      do
      {
        v23 = [v20 objectAtIndexedSubscript:v22];
        [v23 CGRectValue];
        double v25 = v24;
        double v27 = v26;

        [(CompactMonthViewController *)self palleteViewXOffset];
        double v29 = v25 + v28;
        [v4 bounds];
        double v31 = v30;
        [v4 bounds];
        v32 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v29, v31, v27);
        [v21 addObject:v32];

        ++v22;
      }
      while (v22 < (unint64_t)[v20 count]);
    }
  }
  else
  {
LABEL_8:
    id v21 = 0;
  }

  return v21;
}

- (void)_updateDayHeaderFrames
{
  v3 = [(CompactMonthViewController *)self navigationController];
  id v8 = [v3 paletteView];

  id v4 = v8;
  if (v8)
  {
    uint64_t v5 = [(CompactMonthViewController *)self dayHeaderFrames];
    [v8 setDayHeaderFrames:v5];

    double v6 = [(CompactMonthViewController *)self view];
    id v7 = [v6 window];

    if (v7)
    {
      EKUIPushFallbackSizingContextWithViewHierarchy();
      EKUIPopFallbackSizingContextWithViewHierarchy();
    }

    id v4 = v8;
  }
}

- (void)setShouldRespondToApplicationDidBecomeActiveStateChange:(BOOL)a3
{
  self->_applicationResuming = a3;
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  return !self->_applicationResuming;
}

- (void)contentSizeCategoryChanged
{
  v3 = (void *)qword_100216A40;
  qword_100216A40 = 0;

  qword_100216A48 = 0;
  +[CompactMonthWeekView clearCalculatedValues];
  v4.receiver = self;
  v4.super_class = (Class)CompactMonthViewController;
  [(MonthViewController *)&v4 contentSizeCategoryChanged];
}

+ (id)monthNameFont
{
  v2 = (void *)qword_100216A40;
  if (!qword_100216A40)
  {
    v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle3 addingSymbolicTraits:32770 options:0];
    uint64_t v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
    uint64_t v5 = (void *)qword_100216A40;
    qword_100216A40 = v4;

    double v6 = (void *)qword_100216A40;
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:20.0 shouldScaleForSmallerSizes:35.0];
    uint64_t v7 = [v6 fontWithSize:];
    id v8 = (void *)qword_100216A40;
    qword_100216A40 = v7;

    v2 = (void *)qword_100216A40;
  }

  return v2;
}

- (double)topInsetForSubviewWithCalendarDate:(id)a3
{
  return 0.0;
}

+ (double)topOfMonthNameLabelToGrayLineDistance
{
  v2 = [a1 monthNameFont];
  double v3 = *(double *)&qword_100216A48;
  if (*(double *)&qword_100216A48 == 0.0)
  {
    id v4 = objc_alloc_init((Class)UILabel);
    [v4 setText:@"0"];
    [v4 setFont:v2];
    [v4 sizeToFit];
    [v4 _firstLineBaselineOffsetFromBoundsTop];
    double v6 = v5;
    uint64_t v7 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleTitle3];
    [v7 scaledValueForValue:6.5];
    double v9 = v8;

    *(double *)&qword_100216A48 = v6 + v9;
    double v3 = *(double *)&qword_100216A48;
  }

  return v3;
}

+ (double)minimumWeekScale
{
  return 1.0;
}

+ (double)maximumWeekScale
{
  return 5.0;
}

- (double)monthWeekScale
{
  return 1.0;
}

@end