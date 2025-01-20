@interface CompactMonthWeekView
+ (BOOL)_useTallCompressedHeight;
+ (BOOL)_viewForCalendarDateContainsFirstDayOfMonth:(id)a3;
+ (BOOL)usesRoundedRectInsteadOfCircle;
+ (CGPoint)_roundedRectOriginForDayLayerFrame:(CGRect)a3 roundedRectSize:(CGSize)a4 withOverlay:(BOOL)a5 compressed:(BOOL)a6;
+ (CGPoint)positionOfCircleInCellWithWidth:(double)a3 circleSize:(CGSize)a4 compressed:(BOOL)a5 containsFirstDayOfMonth:(BOOL)a6;
+ (CGRect)_circleFrameWithDayFrame:(CGRect)a3 numberString:(id)a4 overlayString:(id)a5 compressed:(BOOL)a6 containsFirstDay:(BOOL)a7;
+ (CGRect)_roundedRectFrameWithDayFrame:(CGRect)a3 dayLayerFrame:(CGRect)a4 numberString:(id)a5 overlayString:(id)a6 compressed:(BOOL)a7;
+ (CGRect)dayTypeBadgeFrameFromDayNumberFrame:(CGRect)a3 compressed:(BOOL)a4;
+ (CGRect)frameForCircleWithDayFrame:(CGRect)a3 dayLayerFrame:(CGRect)a4 numberString:(id)a5 overlayString:(id)a6 compressed:(BOOL)a7 containsFirstDay:(BOOL)a8;
+ (CGRect)frameForDayCircleWithSize:(CGSize)a3 dayNumberLayerFrame:(CGRect)a4 dayNumberFrame:(CGRect)a5 withOverlay:(BOOL)a6 compressed:(BOOL)a7 containsFirstDayOfMonth:(BOOL)a8;
+ (double)circleDiameter;
+ (double)circleDiameterCompressed;
+ (double)circleDiameterWithOverlay;
+ (double)circleDiameterWithOverlayLarge;
+ (double)circleYOffsetCompressed:(BOOL)a3 containsFirstDayOfMonth:(BOOL)a4;
+ (double)dayNumberFontSize:(BOOL)a3;
+ (double)dayNumberLayerYOffsetCompressed:(BOOL)a3 containsFirstDayOfMonth:(BOOL)a4;
+ (double)dayNumberOverlayFontSize:(BOOL)a3;
+ (double)dayTypeBadgeDiameter:(BOOL)a3;
+ (double)distanceToBottomOfCircleCompressed:(BOOL)a3 containsFirstDay:(BOOL)a4;
+ (double)eventScale;
+ (double)eventScaleForNumberOfRows:(unint64_t)a3;
+ (double)grayLineHeight;
+ (double)headerHeight;
+ (double)heightForViewThatContainsFirstDayOfMonth:(BOOL)a3 compressed:(BOOL)a4 scale:(double)a5;
+ (double)heightForViewWithCalendarDate:(id)a3 compressed:(BOOL)a4 windowSize:(CGSize)a5 scale:(double)a6;
+ (double)heightOfCircleCompressed:(BOOL)a3;
+ (double)narrowScale;
+ (double)twoDigitWeekNumberWidth;
+ (double)verticalEventPadding:(BOOL)a3;
+ (double)weekNumberDistanceFromGrayLine;
+ (id)cachedCalculatedValues;
+ (id)dayTypeBadgeBackgroundColorForVerticallyCompressedMode:(BOOL)a3;
+ (id)grayLineColor;
+ (id)weekNumberColorForThisWeek:(BOOL)a3;
+ (id)weekNumberFont;
+ (int64_t)_cellToStartDrawingInForViewWithCalendarDate:(id)a3 calendar:(id)a4;
+ (unint64_t)eventRowsForScale:(double)a3;
+ (void)clearCalculatedValues;
- (BOOL)animating;
- (BOOL)compressedHorizontalMode;
- (BOOL)compressedVerticalMode;
- (BOOL)containsFirstDayOfMonth;
- (BOOL)disableTodayPulse;
- (BOOL)drawWithViews;
- (BOOL)enableLayerAnimationsDuringLayout;
- (BOOL)hideDaySummariesWithScale:(double)a3;
- (BOOL)isBackgroundScene;
- (BOOL)isNarrowWithScale:(double)a3;
- (BOOL)isTodayHighlightVisible;
- (BOOL)showWeekNumber;
- (BOOL)temporarilyHideWeekNumber;
- (BOOL)useLayoutMargins;
- (CGRect)frameForCircleWithDayFrame:(CGRect)a3 dayLayerFrame:(CGRect)a4 numberString:(id)a5 overlayString:(id)a6;
- (CGRect)frameForOccurrence:(id)a3 onDay:(id)a4;
- (CGRect)frameForOccurrenceAfterLastOnDay:(id)a3;
- (CGRect)frameForTodayHighlight;
- (CGRect)rectForCells;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CompactMonthWeekView)initWithCalendarDate:(id)a3 calendar:(id)a4 compressed:(BOOL)a5;
- (CompactMonthWeekViewDelegate)weekDelegate;
- (NSArray)eventData;
- (NSString)description;
- (UIColor)dayBadgeColor;
- (UIFont)monthNameFont;
- (double)monthWeekScale;
- (double)topInset;
- (double)usableSpaceForOccurrencesWithHeight:(double)a3;
- (id)calendarDate;
- (id)containerViewForOccurrencePreview;
- (id)dayForPoint:(CGPoint)a3;
- (id)dayNumberCellFrames;
- (id)days;
- (id)endCalendarDate;
- (id)makeDayCircleForDate:(id)a3 isToday:(BOOL)a4;
- (id)monthNameLabel;
- (id)newFeedbackViewForDraggingOccurrence:(id)a3 atPoint:(CGPoint)a4;
- (id)occurrenceAtPoint:(CGPoint)a3;
- (id)occurrencesView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)presentationControllerForEditMenu;
- (id)selectedEventsForEditMenu;
- (id)selectedOccurrence;
- (id)selectedOccurrences;
- (id)visibleDaySummaryViews;
- (int64_t)daysInMonth;
- (int64_t)indexForPoint:(CGPoint)a3;
- (unint64_t)_daysInAWeek;
- (unint64_t)_monthLabelColumnIndex;
- (unint64_t)nearestSnapBoundaryForScale:(double)a3;
- (void)_clearTodayHighlight;
- (void)_forceReloadImagesForDayTypeBadges;
- (void)_initializeBackground;
- (void)_initializeDaySummaries;
- (void)_initializeDays;
- (void)_initializeGrayLine;
- (void)_initializeMonthNameLabel;
- (void)_layoutDayTypeBadgeForDayNumber:(id)a3 yOffset:(double)a4;
- (void)_reloadMonthNameLabel;
- (void)_setUpInteraction;
- (void)_updateDayFrames;
- (void)_updateDayTypeBadgeForDayNumber:(id)a3 withDayType:(int64_t)a4 color:(id)a5 locale:(id)a6 forceImageUpdate:(BOOL)a7;
- (void)_updateDayTypeBadgesWithBackgroundColor;
- (void)_updateEventSummaries;
- (void)_updateSingleDaySummaryForDayIndex:(int64_t)a3 withData:(id)a4 date:(id)a5 calendar:(id)a6;
- (void)_updateWeekNumberAnimated:(BOOL)a3;
- (void)adjustHighlight:(id)a3 forDay:(id)a4;
- (void)animateToScale:(double)a3 fromScale:(double)a4 completionBlock:(id)a5;
- (void)deselectOccurrence:(id)a3;
- (void)finishAnimations;
- (void)haltTodayPulse;
- (void)layoutIfNeeded;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)prepareForReuse;
- (void)pulseTodayCircle;
- (void)resetTimeZone:(id)a3;
- (void)resetTodayBits;
- (void)safeAreaInsetsDidChange;
- (void)selectOccurrence:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setCalendarDate:(id)a3;
- (void)setCompressedHorizontalMode:(BOOL)a3;
- (void)setCompressedVerticalMode:(BOOL)a3;
- (void)setDayBadgeColor:(id)a3;
- (void)setDisableTodayPulse:(BOOL)a3;
- (void)setDrawWithViews:(BOOL)a3;
- (void)setEnableLayerAnimationsDuringLayout:(BOOL)a3;
- (void)setEventData:(id)a3;
- (void)setEventData:(id)a3 animated:(BOOL)a4;
- (void)setFrame:(CGRect)a3;
- (void)setGrayLineAlpha:(double)a3;
- (void)setHighlightedDayRange:(_NSRange)a3;
- (void)setMonthNameFont:(id)a3;
- (void)setMonthWeekScale:(double)a3;
- (void)setOccurrences:(id)a3 animated:(BOOL)a4;
- (void)setSelectedDay:(id)a3 animated:(BOOL)a4;
- (void)setSelectedOccurrence:(id)a3;
- (void)setSelectedOccurrences:(id)a3;
- (void)setShowWeekNumber:(BOOL)a3;
- (void)setTemporarilyHideWeekNumber:(BOOL)a3;
- (void)setUseLayoutMargins:(BOOL)a3;
- (void)setWeekDelegate:(id)a3;
@end

@implementation CompactMonthWeekView

+ (double)dayNumberOverlayFontSize:(BOOL)a3
{
  double v3 = 12.5;
  if (!a3) {
    double v3 = 15.5;
  }
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:10.0 shouldScaleForSmallerSizes:v3];
  return result;
}

+ (double)dayNumberFontSize:(BOOL)a3
{
  v4 = +[NSLocale currentLocale];
  v5 = [v4 objectForKey:NSLocaleLanguageCode];

  v6 = CUIKLocalizedStringForInteger();
  unsigned int v7 = [v6 isEqual:@"൧"];

  if (([v5 isEqual:@"ml"] & v7) != 0) {
    double v8 = 14.0;
  }
  else {
    double v8 = 18.0;
  }
  if (a3)
  {
    v9 = CUIKGetOverlayCalendar();
    double v10 = 28.0;
    if (v9) {
      double v10 = 23.0;
    }
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:v8 shouldScaleForSmallerSizes:v10];
    double v12 = v11;
  }
  else
  {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:v8 shouldScaleForSmallerSizes:28.0];
    double v12 = v13;
  }

  return v12;
}

- (CompactMonthWeekView)initWithCalendarDate:(id)a3 calendar:(id)a4 compressed:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CompactMonthWeekView;
  double v10 = [(CompactMonthWeekView *)&v21 init];
  double v11 = v10;
  if (v10)
  {
    v10->_compressedVerticalMode = a5;
    double v12 = +[UIColor clearColor];
    [(CompactMonthWeekView *)v11 setBackgroundColor:v12];

    objc_storeStrong((id *)&v11->_calendar, a4);
    [(CompactMonthWeekView *)v11 _initializeGrayLine];
    [(CompactMonthWeekView *)v11 _initializeDays];
    [(CompactMonthWeekView *)v11 _initializeDaySummaries];
    [(CompactMonthWeekView *)v11 _initializeBackground];
    [(CompactMonthWeekView *)v11 _setUpInteraction];
    double v13 = objc_alloc_init(MonthWeekOccurrencesView);
    occurrencesView = v11->_occurrencesView;
    v11->_occurrencesView = v13;

    [(MonthWeekOccurrencesView *)v11->_occurrencesView setDelegate:v11];
    [(MonthWeekOccurrencesView *)v11->_occurrencesView setIsCompact:1];
    [(CompactMonthWeekView *)v11 addSubview:v11->_occurrencesView];
    [(CompactMonthWeekView *)v11 bringSubviewToFront:v11->_occurrencesView];
    [(CompactMonthWeekView *)v11 setCalendarDate:v8];
    objc_initWeak(&location, v11);
    uint64_t v22 = objc_opt_class();
    v15 = +[NSArray arrayWithObjects:&v22 count:1];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000C0554;
    v18[3] = &unk_1001D2620;
    objc_copyWeak(&v19, &location);
    id v16 = [(CompactMonthWeekView *)v11 registerForTraitChanges:v15 withHandler:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (BOOL)drawWithViews
{
  return self->_drawsWithViews;
}

- (void)setDrawWithViews:(BOOL)a3
{
  if (self->_drawsWithViews != a3)
  {
    self->_drawsWithViews = a3;
    -[MonthWeekOccurrencesView setDrawWithViews:](self->_occurrencesView, "setDrawWithViews:");
    occurrencesView = self->_occurrencesView;
    [(MonthWeekOccurrencesView *)occurrencesView setNeedsDisplay];
  }
}

+ (id)weekNumberColorForThisWeek:(BOOL)a3
{
  if (qword_1002167A8 == -1)
  {
    if (a3)
    {
LABEL_3:
      CalendarAppTintColor();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&qword_1002167A8, &stru_1001D4920);
    if (a3) {
      goto LABEL_3;
    }
  }
  id v4 = (id)qword_1002167A0;
LABEL_6:

  return v4;
}

- (void)setShowWeekNumber:(BOOL)a3
{
  if (self->_showWeekNumber != a3)
  {
    self->_showWeekNumber = a3;
    if (a3)
    {
      id v4 = (UILabel *)objc_opt_new();
      weekNumberLabel = self->_weekNumberLabel;
      self->_weekNumberLabel = v4;

      v6 = [(id)objc_opt_class() weekNumberFont];
      [(UILabel *)self->_weekNumberLabel setFont:v6];

      [(CompactMonthWeekView *)self addSubview:self->_weekNumberLabel];
      [(CompactMonthWeekView *)self _updateWeekNumberAnimated:0];
    }
    else
    {
      [(UILabel *)self->_weekNumberLabel removeFromSuperview];
      unsigned int v7 = self->_weekNumberLabel;
      self->_weekNumberLabel = 0;
    }
    [(CompactMonthWeekView *)self setNeedsLayout];
  }
}

- (void)setTemporarilyHideWeekNumber:(BOOL)a3
{
  if (self->_temporarilyHideWeekNumber != a3)
  {
    self->_temporarilyHideWeekNumber = a3;
    -[UILabel setHidden:](self->_weekNumberLabel, "setHidden:");
  }
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)CompactMonthWeekView;
  double v3 = [(CompactMonthWeekView *)&v6 description];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@;\n\t_startCalendarDate: [%@]",
    v3,
  id v4 = self->_startCalendarDate);

  return (NSString *)v4;
}

- (void)_initializeGrayLine
{
  if (!self->_grayLine)
  {
    double v3 = (UIView *)objc_alloc_init((Class)UIView);
    id v4 = [(id)objc_opt_class() grayLineColor];
    [(UIView *)v3 setBackgroundColor:v4];

    [(CompactMonthWeekView *)self addSubview:v3];
    grayLine = self->_grayLine;
    self->_grayLine = v3;
  }
}

- (void)_initializeDays
{
  if (!self->_days)
  {
    unint64_t v3 = [(CompactMonthWeekView *)self _daysInAWeek];
    for (i = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v3]; v3; --v3)
    {
      v5 = [[CompactMonthWeekDayNumber alloc] initWithWeekView:self andCalendar:self->_calendar];
      [objc_opt_class() dayNumberFontSize:[self compressedVerticalMode]];
      -[CompactMonthWeekDayNumber setFontSize:](v5, "setFontSize:");
      [objc_opt_class() dayNumberOverlayFontSize:[self compressedVerticalMode]];
      -[CompactMonthWeekDayNumber setOverlayFontSize:](v5, "setOverlayFontSize:");
      [(NSArray *)i addObject:v5];
    }
    days = self->_days;
    self->_days = i;
  }

  [(CompactMonthWeekView *)self _updateDayFrames];
}

- (void)_initializeBackground
{
  unint64_t v3 = (UIView *)objc_opt_new();
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  v5 = +[UIColor systemBackgroundColor];
  [(UIView *)self->_backgroundView setBackgroundColor:v5];

  [(CompactMonthWeekView *)self addSubview:self->_backgroundView];
  objc_super v6 = self->_backgroundView;

  [(CompactMonthWeekView *)self sendSubviewToBack:v6];
}

- (void)_initializeDaySummaries
{
  unint64_t v3 = +[NSMutableArray arrayWithCapacity:[(CompactMonthWeekView *)self _daysInAWeek]];
  if ((uint64_t)[(CompactMonthWeekView *)self _daysInAWeek] >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      v5 = objc_alloc_init(SingleDaySummary);
      [(NSArray *)v3 addObject:v5];
      [(CompactMonthWeekView *)self addSubview:v5];

      ++v4;
    }
    while ((uint64_t)[(CompactMonthWeekView *)self _daysInAWeek] > v4);
  }
  daySummaries = self->_daySummaries;
  self->_daySummaries = v3;
}

- (void)_updateDayFrames
{
  [(CompactMonthWeekView *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  if ([(CompactMonthWeekView *)self useLayoutMargins])
  {
    [(CompactMonthWeekView *)self safeAreaInsets];
    double v4 = v4 + v11;
    [(CompactMonthWeekView *)self safeAreaInsets];
    double v8 = v8 - v12;
  }
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  CGRectGetWidth(v21);
  CalRoundToScreenScale();
  double v14 = v13;
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  double Height = CGRectGetHeight(v22);
  if ([(CompactMonthWeekView *)self _daysInAWeek])
  {
    unint64_t v16 = 0;
    uint64_t v17 = -1;
    do
    {
      v18 = (char *)v16;
      if ((CalTimeDirectionIsLeftToRight() & 1) == 0) {
        v18 = (char *)[(CompactMonthWeekView *)self _daysInAWeek] + v17;
      }
      id v19 = [(NSArray *)self->_days objectAtIndexedSubscript:v18];
      [v19 setFrame:v4, 0.0, v14, Height];

      v20 = [(NSArray *)self->_days objectAtIndexedSubscript:v18];
      [v20 updateOverlay];

      double v4 = v14 + v4;
      ++v16;
      --v17;
    }
    while (v16 < [(CompactMonthWeekView *)self _daysInAWeek]);
  }
}

- (void)_initializeMonthNameLabel
{
  if (!self->_monthNameLabel)
  {
    double v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    double v4 = +[CompactMonthViewController monthNameFont];
    [(UILabel *)v3 setFont:v4];

    if ([(CompactMonthWeekView *)self compressedVerticalMode]) {
      +[UIColor clearColor];
    }
    else {
    double v5 = +[UIColor systemBackgroundColor];
    }
    [(UILabel *)v3 setBackgroundColor:v5];

    [(UILabel *)v3 setHidden:1];
    [(UILabel *)v3 setUserInteractionEnabled:0];
    if (self->_weekNumberLabel) {
      -[CompactMonthWeekView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v3);
    }
    else {
      [(CompactMonthWeekView *)self addSubview:v3];
    }
    monthNameLabel = self->_monthNameLabel;
    self->_monthNameLabel = v3;
  }
}

- (double)monthWeekScale
{
  double v3 = [(CompactMonthWeekView *)self weekDelegate];

  if (!v3) {
    return 1.0;
  }
  double v4 = [(CompactMonthWeekView *)self weekDelegate];
  [v4 monthWeekScale];
  double v6 = v5;

  return v6;
}

+ (id)cachedCalculatedValues
{
  if (qword_1002167B0 != -1) {
    dispatch_once(&qword_1002167B0, &stru_1001D4940);
  }
  v2 = (void *)__cachedCalculatedValues;

  return v2;
}

+ (void)clearCalculatedValues
{
  +[EKUILargeTextUtilities clearCache];
  uint64_t v2 = objc_opt_new();
  double v3 = (void *)__cachedCalculatedValues;
  __cachedCalculatedValues = v2;

  +[MonthViewOccurrence clearCachedFonts];

  +[MonthWeekOccurrencesView clearMoreEventAttributes];
}

+ (id)weekNumberFont
{
  uint64_t v2 = [a1 cachedCalculatedValues];
  double v3 = [v2 objectForKeyedSubscript:weekDayFontKey];
  if (!v3)
  {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:11.0 shouldScaleForSmallerSizes:14.0];
    double v3 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
    [v2 setObject:v3 forKeyedSubscript:weekDayFontKey];
  }

  return v3;
}

+ (double)twoDigitWeekNumberWidth
{
  double v3 = [a1 cachedCalculatedValues];
  double v4 = [v3 objectForKeyedSubscript:twoDigitWeekNumberWidthKey];
  if (!v4)
  {
    double v5 = [a1 weekNumberFont];
    double v6 = objc_opt_new();
    [v6 setFont:v5];
    double v7 = CUIKLocalizedStringForInteger();
    [v6 setText:v7];

    [v6 sizeToFit];
    [v6 frame];
    double v4 = +[NSNumber numberWithDouble:CGRectGetWidth(v11)];
    [v3 setObject:v4 forKeyedSubscript:twoDigitWeekNumberWidthKey];
  }
  [v4 doubleValue];
  double v9 = v8;

  return v9;
}

+ (double)weekNumberDistanceFromGrayLine
{
  return 3.0;
}

+ (double)dayNumberLayerYOffsetCompressed:(BOOL)a3 containsFirstDayOfMonth:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = +[NSString stringWithFormat:@"%@ %i %i", dayNumberLayerYOffsetKey, a3, a4];
  double v8 = [a1 cachedCalculatedValues];
  double v9 = [v8 objectForKeyedSubscript:v7];
  if (!v9)
  {
    double v10 = 0.0;
    if (v4)
    {
      +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance];
      double v10 = v11 + 0.0;
    }
    [a1 grayLineHeight];
    double v13 = v10 + v12;
    +[CompactMonthWeekTodayCircle topOffset];
    double v15 = 1.0;
    if (v5) {
      double v15 = 2.0;
    }
    double v16 = v13 + v14 / v15;
    [a1 heightOfCircleCompressed:v5];
    double v18 = v16 + v17 * 0.5;
    [(id)objc_opt_class() dayNumberFontSize:v5];
    +[CompactMonthWeekDayNumber heightOfFrameForFontSize:](CompactMonthWeekDayNumber, "heightOfFrameForFontSize:");
    double v20 = v18 - v19 * 0.5;
    CGRect v21 = CUIKGetOverlayCalendar();

    if (v21)
    {
      +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:6.0 shouldScaleForSmallerSizes:6.0];
      double v20 = v20 - v22;
    }
    double v9 = +[NSNumber numberWithDouble:v20];
    [v8 setObject:v9 forKeyedSubscript:v7];
  }
  [v9 doubleValue];
  double v24 = v23;

  return v24;
}

+ (double)verticalEventPadding:(BOOL)a3
{
  double result = 7.0;
  if (a3) {
    return 3.5;
  }
  return result;
}

+ (double)circleYOffsetCompressed:(BOOL)a3 containsFirstDayOfMonth:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = +[NSString stringWithFormat:@"%@ %i %i", circleYOffsetKey, a3, a4];
  double v8 = [a1 cachedCalculatedValues];
  double v9 = [v8 objectForKeyedSubscript:v7];
  if (!v9)
  {
    double v10 = 0.0;
    if (v4)
    {
      +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance];
      double v10 = v11 + 0.0;
    }
    [a1 grayLineHeight];
    double v13 = v10 + v12;
    +[CompactMonthWeekTodayCircle topOffset];
    double v15 = 1.0;
    if (v5) {
      double v15 = 2.0;
    }
    double v9 = +[NSNumber numberWithDouble:v13 + v14 / v15];
    [v8 setObject:v9 forKeyedSubscript:v7];
  }
  [v9 doubleValue];
  double v17 = v16;

  return v17;
}

+ (double)heightOfCircleCompressed:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = [(id)objc_opt_class() usesRoundedRectInsteadOfCircle];
  BOOL v5 = CUIKGetOverlayCalendar();
  double v6 = v5;
  if (v4)
  {
    double v7 = @"abc";
    if (!v5) {
      double v7 = 0;
    }
    double v8 = v7;

    [(id)objc_opt_class() dayNumberFontSize:v3];
    double v10 = v9;
    [(id)objc_opt_class() dayNumberOverlayFontSize:v3];
    +[CompactMonthWeekTodayCircle roundedRectSizeForNumberString:@"99" overlayString:v8 fontSize:v10 overlayFontSize:v11];
    double v13 = v12;

    return v13;
  }
  else
  {

    if (v6)
    {
      +[CompactMonthWeekTodayCircle circleDiameterWithOverlayLarge];
    }
    else if (v3)
    {
      +[CompactMonthWeekTodayCircle circleDiameterCompressed];
    }
    else
    {
      +[CompactMonthWeekTodayCircle circleDiameter];
    }
  }
  return result;
}

+ (double)distanceToBottomOfCircleCompressed:(BOOL)a3 containsFirstDay:(BOOL)a4
{
  BOOL v4 = a3;
  [a1 circleYOffsetCompressed:a3 containsFirstDayOfMonth:a4];
  double v7 = v6;
  [a1 heightOfCircleCompressed:v4];
  return v7 + v8;
}

+ (double)heightForViewThatContainsFirstDayOfMonth:(BOOL)a3 compressed:(BOOL)a4 scale:(double)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  [a1 grayLineHeight];
  double v10 = v9;
  if (v6) {
    double v11 = 50.0;
  }
  else {
    double v11 = 68.0;
  }
  [a1 distanceToBottomOfCircleCompressed:v6 containsFirstDay:0];
  double v13 = v12 + 6.0;
  [a1 verticalEventPadding:v6];
  double v15 = v13 + v14 * 2.0;
  if (v11 >= v15) {
    double v15 = v11;
  }
  double v16 = (v10 + v15) * a5;
  if (v7)
  {
    +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance];
    return v16 + v17;
  }
  return v16;
}

+ (double)narrowScale
{
  BOOL v3 = [a1 cachedCalculatedValues];
  BOOL v4 = [v3 objectForKeyedSubscript:narrowScaleKey];
  if (!v4)
  {
    [a1 heightForViewThatContainsFirstDayOfMonth:0 compressed:0 scale:1.0];
    double v6 = v5;
    [a1 distanceToBottomOfCircleCompressed:0 containsFirstDay:0];
    double v8 = v7;
    +[MonthWeekOccurrencesView minNarrowOccurrenceHeight];
    double v10 = v8 + v9;
    [a1 verticalEventPadding:0];
    BOOL v4 = +[NSNumber numberWithDouble:(v10 + v11 * 2.0) / v6];
    [v3 setObject:v4 forKeyedSubscript:narrowScaleKey];
  }
  [v4 doubleValue];
  double v13 = v12;

  return v13;
}

+ (double)eventScale
{
  BOOL v3 = [a1 cachedCalculatedValues];
  BOOL v4 = [v3 objectForKeyedSubscript:eventScaleKey];
  if (!v4)
  {
    [a1 heightForViewThatContainsFirstDayOfMonth:0 compressed:0 scale:1.0];
    double v6 = v5;
    [a1 distanceToBottomOfCircleCompressed:0 containsFirstDay:0];
    double v8 = v7;
    +[MonthWeekOccurrencesView maxNarrowOccurrenceHeight];
    double v10 = v8 + v9;
    [a1 verticalEventPadding:0];
    BOOL v4 = +[NSNumber numberWithDouble:(v10 + v11 * 2.0) / v6];
    [v3 setObject:v4 forKeyedSubscript:eventScaleKey];
  }
  [v4 doubleValue];
  double v13 = v12;

  return v13;
}

+ (CGPoint)_roundedRectOriginForDayLayerFrame:(CGRect)a3 roundedRectSize:(CGSize)a4 withOverlay:(BOOL)a5 compressed:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRectGetMidX(a3);
  CalRoundToScreenScale();
  double v14 = v13;
  [a1 dayNumberFontSize:v6];
  double v16 = v15;
  [a1 dayNumberOverlayFontSize:v6];
  double v18 = v17;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGRectGetMinY(v23);
  +[CompactMonthWeekDayNumber baselineOffsetFromTopOfLayerForFontSize:v16];
  +[CompactMonthWeekTodayCircle roundedRectDayNumberBaselineOffsetWithOverlay:v7 fontSize:v16 overlayFontSize:v18];
  CalRoundToScreenScale();
  double v20 = v19;
  double v21 = v14;
  result.CGFloat y = v20;
  result.CGFloat x = v21;
  return result;
}

+ (CGPoint)positionOfCircleInCellWithWidth:(double)a3 circleSize:(CGSize)a4 compressed:(BOOL)a5 containsFirstDayOfMonth:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  CalRoundToScreenScale();
  double v10 = v9;
  [a1 circleYOffsetCompressed:v7 containsFirstDayOfMonth:v6];
  double v12 = v11;
  double v13 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v13;
  return result;
}

+ (CGRect)frameForDayCircleWithSize:(CGSize)a3 dayNumberLayerFrame:(CGRect)a4 dayNumberFrame:(CGRect)a5 withOverlay:(BOOL)a6 compressed:(BOOL)a7 containsFirstDayOfMonth:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v15 = a3.height;
  double v16 = a3.width;
  if ([(id)objc_opt_class() usesRoundedRectInsteadOfCircle])
  {
    [a1 _roundedRectOriginForDayLayerFrame:v10 roundedRectSize:v9 withOverlay:x compressed:y width:width height:height v16 v15];
  }
  else
  {
    [a1 positionOfCircleInCellWithWidth:v9, circleSize:v8, compressed:CGRectGetWidth(a5), containsFirstDayOfMonth:v16, v15];
    double v18 = a5.origin.x + v20;
  }
  double v21 = v16;
  double v22 = v15;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

+ (CGRect)_circleFrameWithDayFrame:(CGRect)a3 numberString:(id)a4 overlayString:(id)a5 compressed:(BOOL)a6 containsFirstDay:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v11 = a4;
  id v12 = a5;
  +[CompactMonthWeekTodayCircle circleDiameter];
  if (v12)
  {
    if ((unint64_t)[v11 length] <= 1 && (unint64_t)objc_msgSend(v12, "length") < 3) {
      +[CompactMonthWeekTodayCircle circleDiameterWithOverlay];
    }
    else {
      +[CompactMonthWeekTodayCircle circleDiameterWithOverlayLarge];
    }
    goto LABEL_8;
  }
  double v15 = v13;
  if (v8)
  {
    +[CompactMonthWeekTodayCircle circleDiameterCompressed];
LABEL_8:
    double v15 = v14;
  }
  CalRoundToScreenScale();
  double v17 = v16;
  [a1 circleYOffsetCompressed:v8 containsFirstDayOfMonth:v7];
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  double v22 = v15;
  double v23 = v15;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

+ (CGRect)_roundedRectFrameWithDayFrame:(CGRect)a3 dayLayerFrame:(CGRect)a4 numberString:(id)a5 overlayString:(id)a6 compressed:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a6;
  id v15 = a5;
  [(id)objc_opt_class() dayNumberFontSize:v7];
  double v17 = v16;
  [(id)objc_opt_class() dayNumberOverlayFontSize:v7];
  +[CompactMonthWeekTodayCircle roundedRectSizeForNumberString:v15 overlayString:v14 fontSize:v17 overlayFontSize:v18];
  double v20 = v19;
  double v22 = v21;

  [a1 _roundedRectOriginForDayLayerFrame:v14 != 0 roundedRectSize:v7 x:x y:y width:width height:height withOverlay:v20 compressed:v22];
  double v25 = v20;
  double v26 = v22;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

+ (CGRect)frameForCircleWithDayFrame:(CGRect)a3 dayLayerFrame:(CGRect)a4 numberString:(id)a5 overlayString:(id)a6 compressed:(BOOL)a7 containsFirstDay:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v15 = a3.size.height;
  double v16 = a3.size.width;
  double v17 = a3.origin.y;
  double v18 = a3.origin.x;
  id v20 = a6;
  id v21 = a5;
  if ([a1 usesRoundedRectInsteadOfCircle]) {
    [a1 _roundedRectFrameWithDayFrame:v21 dayLayerFrame:v20 numberString:v9 overlayString:v18 compressed:v17 x:x y:y width:width height:height];
  }
  else {
    [a1 _circleFrameWithDayFrame:v21 numberString:v20 overlayString:v9 compressed:v8 containsFirstDay:v18 v17 v16 v15];
  }
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;

  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

+ (double)heightForViewWithCalendarDate:(id)a3 compressed:(BOOL)a4 windowSize:(CGSize)a5 scale:(double)a6
{
  BOOL v7 = a4;
  id v8 = a3;
  id v9 = [(id)objc_opt_class() _viewForCalendarDateContainsFirstDayOfMonth:v8];

  BOOL v10 = objc_opt_class();

  [v10 heightForViewThatContainsFirstDayOfMonth:v9 compressed:v7 scale:a6];
  return result;
}

+ (double)circleDiameter
{
  +[CompactMonthWeekTodayCircle circleDiameter];
  return result;
}

+ (double)circleDiameterCompressed
{
  +[CompactMonthWeekTodayCircle circleDiameterCompressed];
  return result;
}

+ (double)circleDiameterWithOverlay
{
  +[CompactMonthWeekTodayCircle circleDiameterWithOverlay];
  return result;
}

+ (double)circleDiameterWithOverlayLarge
{
  +[CompactMonthWeekTodayCircle circleDiameterWithOverlayLarge];
  return result;
}

+ (double)headerHeight
{
  +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance];
  return result;
}

+ (double)dayTypeBadgeDiameter:(BOOL)a3
{
  double result = 14.0;
  if (a3) {
    return 12.0;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v5 = objc_opt_class();
  BOOL containsFirstDayOfMonth = self->_containsFirstDayOfMonth;
  BOOL v7 = [(CompactMonthWeekView *)self compressedVerticalMode];
  [(CompactMonthWeekView *)self monthWeekScale];
  [v5 heightForViewThatContainsFirstDayOfMonth:containsFirstDayOfMonth compressed:v7];
  double v9 = v8;
  double v10 = width;
  result.double height = v9;
  result.CGFloat width = v10;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CompactMonthWeekView *)self frame];
  if (vabdd_f64(width, v8) >= 2.22044605e-16) {
    self->_needToForceLayout = 1;
  }
  v9.receiver = self;
  v9.super_class = (Class)CompactMonthWeekView;
  -[CompactMonthWeekView setFrame:](&v9, "setFrame:", x, y, width, height);
}

- (void)layoutIfNeeded
{
  if (self->_needToForceLayout)
  {
    [(CompactMonthWeekView *)self layoutSubviews];
  }
  else
  {
    v2.receiver = self;
    v2.super_class = (Class)CompactMonthWeekView;
    [(CompactMonthWeekView *)&v2 layoutIfNeeded];
  }
}

- (double)usableSpaceForOccurrencesWithHeight:(double)a3
{
  [objc_opt_class() distanceToBottomOfCircleCompressed:[self compressedVerticalMode] containsFirstDayOfMonth:[self containsFirstDayOfMonth]];
  double v6 = a3 - v5;
  +[CompactMonthWeekView verticalEventPadding:[(CompactMonthWeekView *)self compressedVerticalMode]];
  return v6 + v7 * -2.0;
}

- (BOOL)hideDaySummariesWithScale:(double)a3
{
  +[CompactMonthWeekView narrowScale];
  return v4 <= a3;
}

+ (unint64_t)eventRowsForScale:(double)a3
{
  [a1 eventScale];
  double v6 = v5;
  [a1 heightForViewThatContainsFirstDayOfMonth:0 compressed:0 scale:1.0];
  double v8 = v7;
  +[MonthViewOccurrence compactOccurrenceHeight];
  double v10 = v9;
  +[MonthViewOccurrence verticalSpaceBetweenOccurrences];
  unint64_t result = 2;
  double v13 = (v10 + v11) / v8;
  do
  {
    double v6 = v13 + v6;
    ++result;
  }
  while (v6 < a3);
  return result;
}

+ (double)eventScaleForNumberOfRows:(unint64_t)a3
{
  [a1 eventScale];
  double v6 = result;
  if (a3 >= 4)
  {
    [a1 heightForViewThatContainsFirstDayOfMonth:0 compressed:0 scale:1.0];
    double v8 = v7;
    +[MonthViewOccurrence compactOccurrenceHeight];
    double v10 = v9;
    +[MonthViewOccurrence verticalSpaceBetweenOccurrences];
    return v6 + (double)(a3 - 3) * ((v10 + v11) / v8);
  }
  return result;
}

- (unint64_t)nearestSnapBoundaryForScale:(double)a3
{
  if (!-[CompactMonthWeekView hideDaySummariesWithScale:](self, "hideDaySummariesWithScale:")) {
    return 1;
  }
  if ([(CompactMonthWeekView *)self isNarrowWithScale:a3]) {
    return 2;
  }
  double v6 = objc_opt_class();

  return (unint64_t)_[v6 eventRowsForScale:a3];
}

- (void)layoutSubviews
{
  v87.receiver = self;
  v87.super_class = (Class)CompactMonthWeekView;
  [(CompactMonthWeekView *)&v87 layoutSubviews];
  self->_needToForceLayout = 0;
  [(CompactMonthWeekView *)self _updateDayFrames];
  +[CATransaction begin];
  if (![(CompactMonthWeekView *)self enableLayerAnimationsDuringLayout]) {
    +[CATransaction setDisableActions:1];
  }
  uint64_t v83 = 0;
  v84 = (double *)&v83;
  uint64_t v85 = 0x2020000000;
  uint64_t v86 = 0;
  uint64_t v79 = 0;
  v80 = (double *)&v79;
  uint64_t v81 = 0x2020000000;
  uint64_t v82 = 0x47EFFFFFE0000000;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  v78[3] = 0;
  uint64_t v76 = 0;
  v77[0] = &v76;
  v77[1] = 0x2020000000;
  v77[2] = -1;
  uint64_t v74 = 0;
  v75[0] = &v74;
  v75[1] = 0x2020000000;
  v75[2] = -1;
  [objc_opt_class() dayNumberLayerYOffsetCompressed:[self compressedVerticalMode] containsFirstDayOfMonth:self->_containsFirstDayOfMonth];
  uint64_t v4 = v3;
  if (self->_containsFirstDayOfMonth)
  {
    +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance];
    double v6 = v5 + 0.0;
  }
  else
  {
    double v6 = 0.0;
  }
  [(CompactMonthWeekView *)self monthWeekScale];
  self->_hideDaySummaries = -[CompactMonthWeekView hideDaySummariesWithScale:](self, "hideDaySummariesWithScale:");
  [(CompactMonthWeekView *)self frame];
  [(CompactMonthWeekView *)self usableSpaceForOccurrencesWithHeight:v7];
  double v9 = v8;
  days = self->_days;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1000C2AAC;
  v73[3] = &unk_1001D4968;
  v73[4] = self;
  v73[5] = &v76;
  v73[6] = &v74;
  v73[7] = &v79;
  v73[8] = v78;
  v73[9] = &v83;
  v73[10] = v4;
  *(double *)&v73[11] = v6;
  *(double *)&v73[12] = v8;
  [(NSArray *)days enumerateObjectsUsingBlock:v73];
  +[CATransaction commit];
  if (self->_containsFirstDayOfMonth)
  {
    double height = self->_monthNameLabelFittingSize.height;
    id v12 = [(NSArray *)self->_days objectAtIndexedSubscript:*(void *)(v77[0] + 24)];
    [v12 frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    v90.origin.double x = v14;
    v90.origin.double y = v16;
    v90.size.double width = v18;
    v90.size.double height = v20;
    CGRectGetMinX(v90);
    v91.origin.double x = v14;
    v91.origin.double y = v16;
    v91.size.double width = v18;
    v91.size.double height = v20;
    CGRectGetWidth(v91);
    CalRoundToScreenScale();
    double x = v92.origin.x;
    double width = self->_monthNameLabelFittingSize.width;
    v92.origin.double y = 0.0;
    v92.size.double width = width;
    v92.size.double height = height;
    double MinX = CGRectGetMinX(v92);
    [(CompactMonthWeekView *)self layoutMargins];
    if (MinX >= v24)
    {
      v93.origin.double y = 0.0;
      v93.origin.double x = x;
      v93.size.double width = width;
      v93.size.double height = height;
      double MaxX = CGRectGetMaxX(v93);
      [(CompactMonthWeekView *)self bounds];
      double v27 = CGRectGetMaxX(v94);
      [(CompactMonthWeekView *)self layoutMargins];
      if (MaxX > v27 - v28)
      {
        [(CompactMonthWeekView *)self bounds];
        double v29 = CGRectGetMaxX(v95);
        [(CompactMonthWeekView *)self layoutMargins];
        double v31 = v30;
        v96.origin.double y = 0.0;
        v96.origin.double x = x;
        v96.size.double width = width;
        v96.size.double height = height;
        double x = v29 - v31 - CGRectGetWidth(v96);
      }
    }
    else
    {
      [(CompactMonthWeekView *)self layoutMargins];
      double x = v25;
    }
    -[UILabel setFrame:](self->_monthNameLabel, "setFrame:", x, 0.0, width, height);
  }
  double v32 = v80[3];
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  if (IsLeftToRight) {
    v34 = &v76;
  }
  else {
    v34 = &v74;
  }
  uint64_t v35 = *(void *)(v34[1] + 24);
  int v36 = CalTimeDirectionIsLeftToRight();
  if (IsLeftToRight) {
    uint64_t v37 = 0;
  }
  else {
    uint64_t v37 = 6;
  }
  v38 = v77;
  if (v36) {
    v38 = v75;
  }
  uint64_t v39 = *v38;
  if (v36) {
    uint64_t v40 = 6;
  }
  else {
    uint64_t v40 = 0;
  }
  uint64_t v41 = *(void *)(v39 + 24);
  if (v35 == v37)
  {
    if (self->_showWeekNumber && CalTimeDirectionIsLeftToRight())
    {
      [(CompactMonthWeekView *)self safeAreaInsets];
      double v43 = v42;
      [(id)objc_opt_class() twoDigitWeekNumberWidth];
      double v45 = v43 + 6.0 + v44;
      v84[3] = v84[3] - (v45 - v32);
      double v32 = v45;
    }
    else
    {
      v84[3] = v80[3] + v84[3];
      double v32 = 0.0;
    }
  }
  if (v41 == v40)
  {
    [(CompactMonthWeekView *)self bounds];
    v84[3] = CGRectGetMaxX(v97) - v32;
    if (self->_showWeekNumber && (CalTimeDirectionIsLeftToRight() & 1) == 0)
    {
      [(CompactMonthWeekView *)self safeAreaInsets];
      double v47 = v46;
      [(id)objc_opt_class() twoDigitWeekNumberWidth];
      v84[3] = v84[3] - (v47 + 6.0 + v48);
    }
  }
  [(id)objc_opt_class() grayLineHeight];
  CalRoundRectToScreenScale();
  -[UIView setFrame:](self->_grayLine, "setFrame:");
  [(CompactMonthWeekView *)self frame];
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v32, v6, v84[3], v49 - v6);
  if (self->_showWeekNumber)
  {
    [(UILabel *)self->_weekNumberLabel sizeToFit];
    [(UILabel *)self->_weekNumberLabel frame];
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    double v55 = v54;
    double v57 = v56;
    if (CalTimeDirectionIsLeftToRight())
    {
      v98.origin.double x = v51;
      v98.origin.double y = v53;
      v98.size.double width = v55;
      v98.size.double height = v57;
      CGRectGetWidth(v98);
      CalRoundToScreenScale();
      double v59 = fmax(v58, 0.0);
    }
    else
    {
      [(UIView *)self->_grayLine frame];
      CGRectGetMaxX(v99);
      CalRoundToScreenScale();
      double v59 = v60;
    }
    v100.origin.double x = v59;
    v100.origin.double y = v53;
    v100.size.double width = v55;
    v100.size.double height = v57;
    CGRectGetHeight(v100);
    CalRoundToScreenScale();
    -[UILabel setFrame:](self->_weekNumberLabel, "setFrame:", v59, v6 - v61, v55, v57);
  }
  [(CompactMonthWeekView *)self frame];
  double v63 = v62;
  +[CompactMonthWeekView verticalEventPadding:0];
  double v65 = v64;
  [(CompactMonthWeekView *)self frame];
  -[MonthWeekOccurrencesView setFrame:](self->_occurrencesView, "setFrame:", 0.0, v63 - v9 - v65);
  uint64_t v66 = 0;
  v67 = &v89;
  do
  {
    v68 = [(NSArray *)self->_days objectAtIndexedSubscript:v66];
    [v68 frame];
    -[CompactMonthWeekView convertRect:toView:](self, "convertRect:toView:", self->_occurrencesView);
    *(v67 - 2) = v69;
    *(v67 - 1) = v70;
    uint64_t *v67 = v71;
    v67[1] = v72;

    ++v66;
    v67 += 4;
  }
  while (v66 != 7);
  [(MonthWeekOccurrencesView *)self->_occurrencesView setDayFrames:v88];
  if (!self->_animating) {
    [(MonthWeekOccurrencesView *)self->_occurrencesView setHidden:!self->_hideDaySummaries];
  }
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(v78, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
}

- (BOOL)isNarrowWithScale:(double)a3
{
  +[CompactMonthWeekView narrowScale];
  if (v4 > a3) {
    return 0;
  }
  +[CompactMonthWeekView eventScale];
  return v6 > a3;
}

- (void)animateToScale:(double)a3 fromScale:(double)a4 completionBlock:(id)a5
{
  double v8 = (void (**)(void))a5;
  unsigned int v52 = [(CompactMonthWeekView *)self hideDaySummariesWithScale:a4];
  unsigned int v9 = [(CompactMonthWeekView *)self hideDaySummariesWithScale:a3];
  char v10 = v9 ^ 1;
  if ((v52 ^ 1) & 1) != 0 || ((v9 ^ 1))
  {
    unint64_t v11 = self->_animationCounter + 1;
    self->_animationCounter = v11;
    [(CompactMonthWeekView *)self setEnableLayerAnimationsDuringLayout:1];
    if (self->_animating)
    {
      if (v52 != v9)
      {
        animationInfos = self->_animationInfos;
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_1000C3CD0;
        v62[3] = &unk_1001D4A08;
        char v63 = v9 ^ 1;
        v62[4] = self;
        [(NSMutableDictionary *)animationInfos enumerateKeysAndObjectsUsingBlock:v62];
      }
    }
    else
    {
      char v49 = v9;
      unint64_t v50 = v11;
      self->_animating = 1;
      [(CompactMonthWeekView *)self layoutSubviews];
      [(MonthWeekOccurrencesView *)self->_occurrencesView layoutSubviews];
      double v13 = objc_opt_new();
      days = self->_days;
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_1000C3720;
      void v75[3] = &unk_1001D4990;
      v75[4] = self;
      id v15 = v13;
      id v76 = v15;
      [(NSArray *)days enumerateObjectsUsingBlock:v75];
      CGFloat v16 = (NSMutableDictionary *)objc_opt_new();
      double v17 = self->_animationInfos;
      self->_animationInfos = v16;

      CGFloat v18 = (NSMutableArray *)objc_opt_new();
      fadingInfos = self->_fadingInfos;
      self->_fadingInfos = v18;

      CGFloat v20 = [(MonthWeekOccurrencesView *)self->_occurrencesView occurrenceContainer];
      [v20 setHidden:1];

      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_1000C38B0;
      v74[3] = &unk_1001D49B8;
      v74[4] = self;
      id v21 = objc_retainBlock(v74);
      double v22 = [(MonthWeekOccurrencesView *)self->_occurrencesView firstOccurrencesForEachDay];
      firstOccurrenceDict = self->_firstOccurrenceDict;
      self->_firstOccurrenceDict = v22;

      double v24 = self->_firstOccurrenceDict;
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_1000C39D8;
      v68[3] = &unk_1001D49E0;
      id v47 = v15;
      id v69 = v47;
      char v48 = v9 ^ 1;
      char v72 = v9 ^ 1;
      double v25 = v21;
      uint64_t v70 = self;
      id v71 = v25;
      char v73 = v52 ^ 1;
      [(NSDictionary *)v24 enumerateKeysAndObjectsUsingBlock:v68];
      double v26 = [(MonthWeekOccurrencesView *)self->_occurrencesView secondAndThirdOccurrencesForEachDay];
      secondOccurrences = self->_secondOccurrences;
      self->_secondOccurrences = v26;

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      double v28 = self;
      obj = self->_secondOccurrences;
      id v29 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v77 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v65;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v65 != v31) {
              objc_enumerationMutation(obj);
            }
            uint64_t v33 = *(void *)(*((void *)&v64 + 1) + 8 * i);
            v34 = ((void (*)(void *, uint64_t))v25[2])(v25, v33);
            uint64_t v35 = objc_opt_new();
            [v35 setView:v34];
            [v35 setOccurrenceView:v33];
            if ((v52 & 1) == 0)
            {
              [v34 frame];
              double v37 = v36;
              [v34 frame];
              double v39 = v37 + v38 * 0.5;
              [v34 frame];
              double v41 = v40;
              [v34 frame];
              [v34 setFrame:v39, v41 + v42 * -2.0, 0.5, 0.5];
              [v34 setAlpha:0.0];
            }
            [(NSMutableArray *)v28->_fadingInfos addObject:v35];
          }
          id v30 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v77 count:16];
        }
        while (v30);
      }

      self = v28;
      unint64_t v11 = v50;
      char v10 = v48;
      LOBYTE(v9) = v49;
    }
    self->_animating = 1;
    [(MonthWeekOccurrencesView *)self->_occurrencesView setAnimating:1];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_1000C3E74;
    v60[3] = &unk_1001D2718;
    v60[4] = self;
    char v61 = v10;
    +[UIView animateWithSpringDuration:131078 bounce:v60 initialSpringVelocity:0 delay:0.25 options:0.0 animations:0.0 completion:0.0];
    if (v9)
    {
      if (!self->_startedStage2Animation)
      {
        self->_startedStage2Animation = 1;
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_1000C44C8;
        v57[3] = &unk_1001D2740;
        v57[4] = self;
        +[UIView animateWithSpringDuration:196612 bounce:v57 initialSpringVelocity:0 delay:0.25 options:0.0 animations:0.0 completion:0.0];
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_1000C4658;
        v56[3] = &unk_1001D2A40;
        v56[4] = self;
        v56[5] = v11;
        double v45 = 0.150000006;
        double v43 = 0.25;
        double v44 = v56;
        goto LABEL_23;
      }
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_1000C4334;
      v58[3] = &unk_1001D2740;
      v58[4] = self;
      double v43 = 0.25;
      double v44 = v58;
    }
    else
    {
      self->_startedStage2Animation = 0;
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1000C4190;
      v59[3] = &unk_1001D2740;
      v59[4] = self;
      double v43 = 0.25;
      double v44 = v59;
    }
    double v45 = 0.0;
LABEL_23:
    +[UIView animateWithSpringDuration:131078 bounce:v44 initialSpringVelocity:0 delay:v43 options:0.0 animations:0.0 completion:v45];
    dispatch_time_t v46 = dispatch_time(0, 450000005);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C47D4;
    block[3] = &unk_1001D4A80;
    unint64_t v55 = v11;
    block[4] = self;
    double v54 = v8;
    dispatch_after(v46, (dispatch_queue_t)&_dispatch_main_q, block);

    goto LABEL_24;
  }
  if (v8) {
    v8[2](v8);
  }
LABEL_24:
}

- (void)finishAnimations
{
  self->_animating = 0;
  [(MonthWeekOccurrencesView *)self->_occurrencesView setAnimating:0];
  [(CompactMonthWeekView *)self setEnableLayerAnimationsDuringLayout:0];
  self->_startedStage2Animation = 0;
  uint64_t v3 = [(MonthWeekOccurrencesView *)self->_occurrencesView occurrenceContainer];
  [v3 setHidden:0];

  [(CompactMonthWeekView *)self monthWeekScale];
  unsigned int v4 = -[CompactMonthWeekView hideDaySummariesWithScale:](self, "hideDaySummariesWithScale:");
  double v5 = 0.0;
  if (v4) {
    double v5 = 1.0;
  }
  [(MonthWeekOccurrencesView *)self->_occurrencesView setAlpha:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v6 = self->_fadingInfos;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      char v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) view:(void)v13];
        [v11 removeFromSuperview];

        char v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(NSMutableArray *)self->_fadingInfos removeAllObjects];
  [(MonthWeekOccurrencesView *)self->_occurrencesView layoutSubviews];
  [(NSMutableDictionary *)self->_animationInfos enumerateKeysAndObjectsUsingBlock:&stru_1001D4AC0];
  animationInfos = self->_animationInfos;
  self->_animationInfos = 0;

  [(CompactMonthWeekView *)self layoutSubviews];
}

- (void)safeAreaInsetsDidChange
{
  self->_needToForceLayout = 1;
}

- (id)calendarDate
{
  return self->_startCalendarDate;
}

- (id)endCalendarDate
{
  return self->_endCalendarDate;
}

- (double)topInset
{
  return 0.0;
}

- (void)pulseTodayCircle
{
  if (self->_today && ![(CompactMonthWeekView *)self disableTodayPulse])
  {
    if (self->_todayPulse) {
      [(CompactMonthWeekView *)self haltTodayPulse];
    }
    uint64_t v3 = [(CompactMonthWeekDayNumber *)self->_today attachedTodayCircle];
    [v3 frame];
    id v8 = [objc_alloc((Class)EKUITodayCirclePulseView) initWithFrame:v4, v5, v6, v7];
    todayPulse = self->_todayPulse;
    self->_todayPulse = v8;

    char v10 = [v3 dayNumberString];
    [(EKUITodayCirclePulseView *)self->_todayPulse setString:v10];

    [objc_opt_class() dayNumberFontSize:[self compressedVerticalMode]];
    unint64_t v11 = +[CompactMonthWeekTodayCircle dayNumberFontForSize:](CompactMonthWeekTodayCircle, "dayNumberFontForSize:");
    [(EKUITodayCirclePulseView *)self->_todayPulse setFont:v11];

    -[EKUITodayCirclePulseView setTextOffsetFromCircle:](self->_todayPulse, "setTextOffsetFromCircle:", 0.0, -0.5);
    id v12 = [(CompactMonthWeekDayNumber *)self->_today layer];
    [v12 frame];
    CalRoundToScreenScale();
    -[EKUITodayCirclePulseView setTextYOffset:](self->_todayPulse, "setTextYOffset:");

    [(EKUITodayCirclePulseView *)self->_todayPulse setCircleShouldFillFrame:1];
    -[EKUITodayCirclePulseView setUsesRoundedRectInsteadOfCircle:](self->_todayPulse, "setUsesRoundedRectInsteadOfCircle:", [(id)objc_opt_class() usesRoundedRectInsteadOfCircle]);
    long long v13 = CUIKGetOverlayCalendar();

    if (v13)
    {
      long long v14 = [v3 overlayString];
      [(EKUITodayCirclePulseView *)self->_todayPulse setOverlayString:v14];

      [objc_opt_class() dayNumberOverlayFontSize:[self compressedVerticalMode]];
      long long v15 = +[CompactMonthWeekTodayCircle dayOverlayFontForSize:](CompactMonthWeekTodayCircle, "dayOverlayFontForSize:");
      [(EKUITodayCirclePulseView *)self->_todayPulse setOverlayFont:v15];
    }
    [(EKUITodayCirclePulseView *)self->_todayPulse layoutIfNeeded];
    [(CompactMonthWeekView *)self addSubview:self->_todayPulse];
    [v3 setHidden:1];
    long long v16 = self->_todayPulse;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000C4D60;
    v18[3] = &unk_1001D28A8;
    id v19 = v3;
    CGFloat v20 = self;
    id v17 = v3;
    [(EKUITodayCirclePulseView *)v16 pulse:v18];
  }
}

- (void)haltTodayPulse
{
  [(EKUITodayCirclePulseView *)self->_todayPulse removeFromSuperview];
  todayPulse = self->_todayPulse;
  self->_todayPulse = 0;
}

- (void)prepareForReuse
{
  if (!self->_animating)
  {
    [(CompactMonthWeekView *)self _clearTodayHighlight];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = self->_daySummaries;
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) setData:0 date:0 calendar:0 delegate:0 v9];
        }
        id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    todadouble y = self->_today;
    self->_todadouble y = 0;

    [(MonthWeekOccurrencesView *)self->_occurrencesView setHasDrawnBefore:0];
  }
}

- (void)setCompressedVerticalMode:(BOOL)a3
{
  if (self->_compressedVerticalMode == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_compressedVerticalMode = a3;
  [(CompactMonthWeekView *)self setNeedsLayout];
  [(CompactMonthWeekView *)self setNeedsDisplay];
  todadouble y = self->_today;
  if (!today)
  {
    p_monthNameLabel = &self->_monthNameLabel;
    if (!self->_monthNameLabel) {
      goto LABEL_12;
    }
    if (v3) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v9 = +[UIColor systemBackgroundColor];
    goto LABEL_11;
  }
  if (!v3)
  {
    long long v10 = +[UIColor systemBackgroundColor];
    long long v11 = [(CompactMonthWeekDayNumber *)self->_today attachedTodayCircle];
    [v11 setBackgroundColor:v10];

    p_monthNameLabel = &self->_monthNameLabel;
    if (!self->_monthNameLabel) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_selected, today);
  uint64_t v6 = +[UIColor clearColor];
  double v7 = [(CompactMonthWeekDayNumber *)self->_today attachedTodayCircle];
  [v7 setBackgroundColor:v6];

  p_monthNameLabel = &self->_monthNameLabel;
  if (self->_monthNameLabel)
  {
LABEL_8:
    uint64_t v9 = +[UIColor clearColor];
LABEL_11:
    long long v12 = (void *)v9;
    [(UILabel *)*p_monthNameLabel setBackgroundColor:v9];
  }
LABEL_12:
  [(CompactMonthWeekView *)self _updateDayTypeBadgesWithBackgroundColor];
  [(id)objc_opt_class() dayNumberFontSize:v3];
  double v14 = v13;
  [(id)objc_opt_class() dayNumberOverlayFontSize:v3];
  double v16 = v15;
  uint64_t v17 = v3 ^ 1;
  [(id)objc_opt_class() dayNumberFontSize:v17];
  if (v14 != v18 || ([(id)objc_opt_class() dayNumberOverlayFontSize:v17], v16 != v19))
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    CGFloat v20 = self->_days;
    id v21 = [(NSArray *)v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          double v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [v25 setFontSize:v14];
          [v25 setOverlayFontSize:v16];
          [v25 updateDayNumber];
          [v25 updateOverlay];
        }
        id v22 = [(NSArray *)v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v22);
    }

    [(CompactMonthWeekDayNumber *)self->_today hideOverlayAndNumber:1];
    double v26 = [(CompactMonthWeekDayNumber *)self->_today attachedTodayCircle];
    [v26 setFontSize:v14];

    double v27 = [(CompactMonthWeekDayNumber *)self->_today attachedTodayCircle];
    [v27 setOverlayFontSize:v16];

    double v28 = [(CompactMonthWeekDayNumber *)self->_selected attachedTodayCircle];
    [v28 setFontSize:v14];

    id v29 = [(CompactMonthWeekDayNumber *)self->_selected attachedTodayCircle];
    [v29 setOverlayFontSize:v16];

    [(CompactMonthWeekView *)self setNeedsLayout];
  }
  [(CompactMonthWeekView *)self _forceReloadImagesForDayTypeBadges];
  if (self->_containsFirstDayOfMonth) {
    [(CompactMonthWeekView *)self _updateWeekNumberAnimated:1];
  }
}

- (BOOL)containsFirstDayOfMonth
{
  return self->_containsFirstDayOfMonth;
}

- (int64_t)daysInMonth
{
  return (int64_t)[(EKCalendarDate *)self->_startCalendarDate daysInMonth];
}

- (CGRect)rectForCells
{
  [(CompactMonthWeekView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (self->_containsFirstDayOfMonth)
  {
    +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance];
    double v6 = v6 + v11;
    double v10 = v10 - v11;
  }
  double v12 = v4;
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)isTodayHighlightVisible
{
  objc_super v2 = [(CompactMonthWeekDayNumber *)self->_today attachedTodayCircle];
  unsigned __int8 v3 = [v2 drawCircle];

  return v3;
}

- (CGRect)frameForTodayHighlight
{
  todaCGFloat y = self->_today;
  if (today)
  {
    unsigned __int8 v3 = [(CompactMonthWeekDayNumber *)today attachedTodayCircle];
    [v3 frame];
    CGFloat x = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (id)dayNumberCellFrames
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  days = self->_days;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C54B8;
  v7[3] = &unk_1001D4AE8;
  id v5 = v3;
  id v8 = v5;
  [(NSArray *)days enumerateObjectsUsingBlock:v7];

  return v5;
}

- (id)days
{
  return self->_days;
}

- (id)dayForPoint:(CGPoint)a3
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3032000000;
  double v11 = sub_1000C5640;
  days = self->_days;
  double v12 = sub_1000C5650;
  id v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C5658;
  v6[3] = &unk_1001D4B10;
  CGPoint v7 = a3;
  v6[4] = &v8;
  [(NSArray *)days enumerateObjectsUsingBlock:v6];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (int64_t)indexForPoint:(CGPoint)a3
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  days = self->_days;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C57B4;
  v6[3] = &unk_1001D4B10;
  CGPoint v7 = a3;
  v6[4] = &v8;
  [(NSArray *)days enumerateObjectsUsingBlock:v6];
  int64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void)adjustHighlight:(id)a3 forDay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  todaCGFloat y = self->_today;
  if (!today)
  {
    [v6 setIsToday:0];
    goto LABEL_5;
  }
  double v9 = [(CompactMonthWeekDayNumber *)today calendarDate];
  id v10 = [v9 compare:v7];

  [v6 setIsToday:v10 == 0];
  if (v10)
  {
LABEL_5:
    calendar = self->_calendar;
    double v12 = [v7 date];
    [v6 setIsWeekend:[calendar isDateInWeekend:v12]];
  }
  [v7 day];
  id v13 = CUIKLocalizedStringForInteger();
  [v6 setText:v13];
  double v14 = CUIKGetOverlayCalendar();
  double v15 = [v7 date];
  if (v14)
  {
    double v16 = +[CUIKDateStrings overlayShortStringForDate:v15 inCalendar:v14];
    uint64_t v17 = [v14 components:24 fromDate:v15];
    double v18 = 0.0;
    if ([v17 day] != (id)1
      || (double v18 = 1.0, [v17 month] != (id)1)
      || (double v19 = 1.5, [v17 isLeapMonth]))
    {
      double v19 = v18;
    }
    CGFloat v20 = [(CompactMonthWeekView *)self traitCollection];
    int v21 = EKUIUsesLargeTextLayout();

    if (v21) {
      double v19 = v19 + v19;
    }
  }
  else
  {
    double v16 = 0;
    double v19 = 0.0;
  }
  [v6 setOverlayText:v16];
  [v6 setUnderlineThickness:v19];
  uint64_t v38 = 0;
  double v39 = (double *)&v38;
  uint64_t v40 = 0x4010000000;
  double v41 = &unk_1001B5939;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v43 = size;
  uint64_t v32 = 0;
  long long v33 = (double *)&v32;
  uint64_t v34 = 0x4010000000;
  uint64_t v35 = &unk_1001B5939;
  CGPoint v36 = origin;
  CGSize v37 = size;
  days = self->_days;
  double v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  double v27 = sub_1000C5BDC;
  double v28 = &unk_1001D4B38;
  id v24 = v7;
  id v29 = v24;
  long long v30 = &v38;
  long long v31 = &v32;
  [(NSArray *)days enumerateObjectsUsingBlock:&v25];
  [objc_opt_class() dayNumberFontSize:[self compressedVerticalMode:v25, v26, v27, v28]];
  [v6 setFontSize:];
  [objc_opt_class() dayNumberOverlayFontSize:[self compressedVerticalMode]];
  [v6 setOverlayFontSize:];
  [v6 setUsesRoundedRectInsteadOfCircle:[objc_opt_class() usesRoundedRectInsteadOfCircle]];
  -[CompactMonthWeekView frameForCircleWithDayFrame:dayLayerFrame:numberString:overlayString:](self, "frameForCircleWithDayFrame:dayLayerFrame:numberString:overlayString:", v13, v16, v39[4], v39[5], v39[6], v39[7], v33[4], v33[5], v33[6], v33[7]);
  [v6 setFrame:];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
}

- (void)setCalendarDate:(id)a3
{
  id v5 = (EKCalendarDate *)a3;
  p_startCalendarDate = &self->_startCalendarDate;
  if (self->_startCalendarDate != v5)
  {
    objc_storeStrong((id *)&self->_startCalendarDate, a3);
    self->_cellToStartDrawingIn = (int64_t)[(id)objc_opt_class() _cellToStartDrawingInForViewWithCalendarDate:*p_startCalendarDate calendar:self->_calendar];
    self->_BOOL containsFirstDayOfMonth = [(id)objc_opt_class() _viewForCalendarDateContainsFirstDayOfMonth:*p_startCalendarDate];
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    char v30 = 1;
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = sub_1000C5640;
    double v27 = sub_1000C5650;
    double v28 = *p_startCalendarDate;
    uint64_t v17 = 0;
    double v18 = &v17;
    uint64_t v19 = 0x3032000000;
    CGFloat v20 = sub_1000C5640;
    int v21 = sub_1000C5650;
    id v22 = (id)v24[5];
    uint64_t v13 = 0;
    double v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    id v7 = [(id)v24[5] month];
    NSUInteger v8 = [(NSArray *)self->_days count];
    days = self->_days;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000C5F88;
    v12[3] = &unk_1001D4B60;
    v12[4] = self;
    v12[5] = v29;
    v12[6] = &v23;
    v12[7] = &v17;
    v12[8] = &v13;
    v12[9] = v7;
    v12[10] = v8;
    [(NSArray *)days enumerateObjectsUsingBlock:v12];
    id v10 = [(id)v18[5] calendarDateForEndOfDay];
    endCalendarDate = self->_endCalendarDate;
    self->_endCalendarDate = v10;

    [(CompactMonthWeekView *)self resetTodayBits];
    [(CompactMonthWeekView *)self setEventData:0 animated:0];
    [(CompactMonthWeekView *)self _updateWeekNumberAnimated:0];
    [(MonthWeekOccurrencesView *)self->_occurrencesView setStartDate:*p_startCalendarDate endDate:self->_endCalendarDate dayCount:v14[3]];
    [(CompactMonthWeekView *)self setNeedsLayout];
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(v29, 8);
  }
}

- (void)_updateWeekNumberAnimated:(BOOL)a3
{
  if (self->_weekNumberLabel)
  {
    BOOL v3 = a3;
    id v5 = CUIKCalendar();
    id v6 = [(EKCalendarDate *)self->_startCalendarDate date];
    [v5 component:0x2000 fromDate:v6];

    id v7 = CUIKLocalizedStringForInteger();
    [(UILabel *)self->_weekNumberLabel setText:v7];

    NSUInteger v8 = [(id)objc_opt_class() weekNumberColorForThisWeek:self->_containsToday];
    [(UILabel *)self->_weekNumberLabel setTextColor:v8];

    if (self->_compressedVerticalMode) {
      double v9 = self->_containsFirstDayOfMonth ? 0.0 : 1.0;
    }
    else {
      double v9 = 1.0;
    }
    [(UILabel *)self->_weekNumberLabel alpha];
    if (v9 != v10)
    {
      if (v3)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1000C627C;
        v12[3] = &unk_1001D2A40;
        v12[4] = self;
        *(double *)&v12[5] = v9;
        +[UIView animateWithDuration:v12 animations:0.3];
      }
      else
      {
        weekNumberLabel = self->_weekNumberLabel;
        [(UILabel *)weekNumberLabel setAlpha:v9];
      }
    }
  }
}

- (void)resetTimeZone:(id)a3
{
  id v4 = a3;
  id v5 = [(EKCalendarDate *)self->_startCalendarDate date];
  id v6 = +[EKCalendarDate calendarDateWithDate:v5 timeZone:v4];
  startCalendarDate = self->_startCalendarDate;
  self->_startCalendarDate = v6;

  NSUInteger v8 = [(EKCalendarDate *)self->_endCalendarDate date];
  double v9 = +[EKCalendarDate calendarDateWithDate:v8 timeZone:v4];
  endCalendarDate = self->_endCalendarDate;
  self->_endCalendarDate = v9;

  days = self->_days;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C63CC;
  v13[3] = &unk_1001D4AE8;
  id v14 = v4;
  id v12 = v4;
  [(NSArray *)days enumerateObjectsUsingBlock:v13];
}

- (id)makeDayCircleForDate:(id)a3 isToday:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [[CompactMonthWeekTodayCircle alloc] initWithCalendarDate:v6];

  [(CompactMonthWeekTodayCircle *)v7 setUseTodayColors:v4];
  if ([(CompactMonthWeekView *)self compressedVerticalMode]) {
    +[UIColor clearColor];
  }
  else {
  NSUInteger v8 = +[UIColor systemBackgroundColor];
  }
  [(CompactMonthWeekTodayCircle *)v7 setBackgroundColor:v8];

  [(CompactMonthWeekTodayCircle *)v7 setCompressed:[(CompactMonthWeekView *)self compressedVerticalMode]];
  double v9 = CUIKGetOverlayCalendar();
  [(CompactMonthWeekTodayCircle *)v7 setShowOverlay:v9 != 0];

  [objc_opt_class() dayNumberFontSize:[self compressedVerticalMode]];
  -[CompactMonthWeekTodayCircle setFontSize:](v7, "setFontSize:");
  [objc_opt_class() dayNumberOverlayFontSize:[self compressedVerticalMode]];
  -[CompactMonthWeekTodayCircle setOverlayFontSize:](v7, "setOverlayFontSize:");
  -[CompactMonthWeekTodayCircle setUsesRoundedRectInsteadOfCircle:](v7, "setUsesRoundedRectInsteadOfCircle:", [(id)objc_opt_class() usesRoundedRectInsteadOfCircle]);
  [(CompactMonthWeekTodayCircle *)v7 sizeToFit];

  return v7;
}

- (void)resetTodayBits
{
  self->_containsTodaCGFloat y = 0;
  BOOL v3 = CUIKTodayDate();
  BOOL v4 = [(EKCalendarDate *)self->_startCalendarDate date];
  id v5 = [(EKCalendarDate *)self->_endCalendarDate date];
  if ([v4 compare:v3] == (id)1)
  {
    if (self->_containsToday) {
      goto LABEL_3;
    }
LABEL_8:
    [(CompactMonthWeekView *)self _clearTodayHighlight];
    goto LABEL_9;
  }
  BOOL v9 = [v5 compare:v3] != (id)-1;
  self->_containsTodaCGFloat y = v9;
  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  days = self->_days;
  double v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_1000C675C;
  uint64_t v13 = &unk_1001D4990;
  id v14 = v3;
  uint64_t v15 = self;
  [(NSArray *)days enumerateObjectsUsingBlock:&v10];
  [(CompactMonthWeekView *)self setNeedsLayout];
  if ([(CompactMonthWeekView *)self compressedVerticalMode])
  {
    todaCGFloat y = self->_today;
    if (self->_selected != today)
    {
      NSUInteger v8 = [(CompactMonthWeekDayNumber *)today attachedTodayCircle];
      [v8 setDrawCircle:0];

      [(CompactMonthWeekDayNumber *)self->_today hideOverlayAndNumber:1];
    }
  }

LABEL_9:
  [(CompactMonthWeekView *)self _reloadMonthNameLabel];
}

- (void)_clearTodayHighlight
{
  todaCGFloat y = self->_today;
  if (today)
  {
    [(CompactMonthWeekDayNumber *)today hideOverlayAndNumber:0];
    BOOL v4 = [(CompactMonthWeekDayNumber *)self->_today attachedTodayCircle];
    [v4 removeFromSuperview];

    [(CompactMonthWeekDayNumber *)self->_today setAttachedTodayCircle:0];
    id v5 = [(CompactMonthWeekDayNumber *)self->_today overlay];
    [v5 setHidden:0];

    id v6 = self->_today;
    self->_todaCGFloat y = 0;

    [(CompactMonthWeekView *)self setNeedsLayout];
  }
}

- (void)setEventData:(id)a3
{
}

- (void)setEventData:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_eventData, a3);
  +[CATransaction begin];
  if (!a4) {
    +[CATransaction setDisableActions:1];
  }
  [(CompactMonthWeekView *)self _updateEventSummaries];
  +[CATransaction commit];
}

- (void)setOccurrences:(id)a3 animated:(BOOL)a4
{
}

- (id)occurrenceAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CompactMonthWeekView *)self layoutIfNeeded];
  [(MonthWeekOccurrencesView *)self->_occurrencesView frame];
  v10.double x = x;
  v10.double y = y;
  if (CGRectContainsPoint(v11, v10))
  {
    occurrencesView = self->_occurrencesView;
    -[MonthWeekOccurrencesView convertPoint:fromView:](occurrencesView, "convertPoint:fromView:", self, x, y);
    id v7 = -[MonthWeekOccurrencesView occurrenceAtPoint:](occurrencesView, "occurrenceAtPoint:");
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setSelectedOccurrence:(id)a3
{
}

- (id)selectedOccurrence
{
  return [(MonthWeekOccurrencesView *)self->_occurrencesView selectedOccurrence];
}

- (void)setSelectedOccurrences:(id)a3
{
}

- (id)selectedOccurrences
{
  return [(MonthWeekOccurrencesView *)self->_occurrencesView selectedOccurrences];
}

- (void)selectOccurrence:(id)a3
{
}

- (void)deselectOccurrence:(id)a3
{
}

- (void)_updateEventSummaries
{
  if (!self->_animating)
  {
    BOOL v3 = [(CompactMonthWeekView *)self traitCollection];
    +[UITraitCollection _setCurrentTraitCollection:v3];

    if (self->_eventData)
    {
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x2020000000;
      v26[3] = 0;
      days = self->_days;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000C6F04;
      v25[3] = &unk_1001D4B88;
      v25[4] = v26;
      [(NSArray *)days enumerateObjectsUsingBlock:v25];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v5 = self->_daySummaries;
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v28 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v22;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v22 != v7) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v21 + 1) + 8 * i) setData:0 date:0 calendar:0 delegate:0];
          }
          id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v28 count:16];
        }
        while (v6);
      }

      eventData = self->_eventData;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000C6F60;
      v20[3] = &unk_1001D4BB0;
      v20[4] = self;
      v20[5] = v26;
      [(NSArray *)eventData enumerateObjectsUsingBlock:v20];
      _Block_object_dispose(v26, 8);
    }
    else
    {
      CGPoint v10 = self->_days;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000C70C0;
      v19[3] = &unk_1001D4AE8;
      v19[4] = self;
      [(NSArray *)v10 enumerateObjectsUsingBlock:v19];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      CGRect v11 = self->_daySummaries;
      id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v15 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v16;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) setAlpha:0.0];
          }
          id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v15 objects:v27 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)setSelectedDay:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  p_selected = &self->_selected;
  selected = self->_selected;
  if (selected)
  {
    uint64_t v9 = [(CompactMonthWeekDayNumber *)selected calendarDate];
    CGPoint v10 = (void *)v9;
    if (v6 && v9)
    {
      CGRect v11 = [(CompactMonthWeekDayNumber *)*p_selected calendarDate];
      id v12 = [v11 year];
      if (v12 == [v6 year])
      {
        uint64_t v13 = [(CompactMonthWeekDayNumber *)*p_selected calendarDate];
        id v14 = [v13 month];
        if (v14 == [v6 month])
        {
          long long v15 = [(CompactMonthWeekDayNumber *)self->_selected calendarDate];
          id v16 = [v15 day];
          id v17 = [v6 day];

          p_selected = &self->_selected;
          if (v16 == v17) {
            goto LABEL_45;
          }
          goto LABEL_11;
        }

        p_selected = &self->_selected;
      }
    }
LABEL_11:
    todadouble y = *p_selected;
    if (*p_selected != self->_today)
    {
      uint64_t v19 = [(CompactMonthWeekDayNumber *)today attachedTodayCircle];
      [v19 removeFromSuperview];

      [(CompactMonthWeekDayNumber *)*p_selected setAttachedTodayCircle:0];
      [(CompactMonthWeekDayNumber *)*p_selected hideOverlayAndNumber:0];
      todadouble y = self->_today;
    }
    if (today)
    {
      CGFloat v20 = [(CompactMonthWeekDayNumber *)today attachedTodayCircle];
      [v20 setDrawCircle:0];

      [(CompactMonthWeekDayNumber *)self->_today hideOverlayAndNumber:1];
    }
    long long v21 = *p_selected;
    *p_selected = 0;
  }
  if (v6)
  {
    [v6 absoluteTime];
    double v23 = v22;
    long long v24 = [(CompactMonthWeekView *)self calendarDate];
    [(CompactMonthWeekDayNumber *)v24 absoluteTime];
    if (v23 < v25) {
      goto LABEL_44;
    }
    [v6 absoluteTime];
    double v27 = v26;
    double v28 = [(CompactMonthWeekView *)self endCalendarDate];
    [v28 absoluteTime];
    double v30 = v29;

    if (v27 <= v30)
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      obj = self->_days;
      long long v24 = (CompactMonthWeekDayNumber *)[(NSArray *)obj countByEnumeratingWithState:&v60 objects:v64 count:16];
      if (!v24) {
        goto LABEL_43;
      }
      id location = (id *)p_selected;
      double v56 = self;
      BOOL v55 = v4;
      uint64_t v31 = *(void *)v61;
      while (2)
      {
        for (i = 0; i != v24; i = (CompactMonthWeekDayNumber *)((char *)i + 1))
        {
          if (*(void *)v61 != v31) {
            objc_enumerationMutation(obj);
          }
          long long v33 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          uint64_t v34 = [v33 calendarDate];
          if (v34)
          {
            uint64_t v35 = (void *)v34;
            CGPoint v36 = [v33 calendarDate];
            id v37 = [v36 month];
            if (v37 == [v6 month])
            {
              uint64_t v38 = [v33 calendarDate];
              id v39 = [v38 day];
              id v40 = v6;
              id v41 = [v6 day];

              BOOL v42 = v39 == v41;
              id v6 = v40;
              if (v42)
              {
                long long v24 = v33;

                if (!v24) {
                  goto LABEL_44;
                }
                if (v24 == v56->_today)
                {
                  unsigned int v52 = [(CompactMonthWeekDayNumber *)v24 attachedTodayCircle];
                  [v52 setDrawCircle:1];

                  objc_storeStrong(location, v56->_today);
                  [(CompactMonthWeekDayNumber *)v56->_today hideOverlayAndNumber:1];
                  if (!v55) {
                    goto LABEL_44;
                  }
                }
                else
                {
                  CGSize v43 = [(CompactMonthWeekView *)v56 makeDayCircleForDate:v40 isToday:0];
                  [(CompactMonthWeekView *)v56 addSubview:v43];
                  [(CompactMonthWeekDayNumber *)v24 setAttachedTodayCircle:v43];
                  objc_storeStrong(location, v33);
                  double v44 = [(CompactMonthWeekDayNumber *)v24 overlay];

                  if (v44)
                  {
                    double v45 = [(CompactMonthWeekDayNumber *)v24 overlay];
                    [v45 setHidden:1];
                  }
                  dispatch_time_t v46 = [(CompactMonthWeekDayNumber *)v24 dayTypeBadge];
                  id v47 = [v46 superlayer];

                  if (v47)
                  {
                    char v48 = [(CompactMonthWeekDayNumber *)v24 dayTypeBadge];
                    char v49 = [v48 superlayer];

                    unint64_t v50 = [(CompactMonthWeekDayNumber *)v24 dayTypeBadge];
                    [v50 removeFromSuperlayer];

                    CGFloat v51 = [(CompactMonthWeekDayNumber *)v24 dayTypeBadge];
                    [v49 addSublayer:v51];
                  }
                  id v6 = v40;
                  if (!v55) {
                    goto LABEL_44;
                  }
                }
                CGFloat v53 = [(CompactMonthWeekDayNumber *)v24 attachedTodayCircle];
                [v53 setAlpha:0.0];

                v58[0] = _NSConcreteStackBlock;
                v58[1] = 3221225472;
                v58[2] = sub_1000C7644;
                v58[3] = &unk_1001D2740;
                long long v24 = v24;
                double v59 = (NSArray *)v24;
                +[UIView animateWithDuration:v58 animations:0.2];
                obj = v59;
                goto LABEL_43;
              }
            }
            else
            {
            }
          }
        }
        long long v24 = (CompactMonthWeekDayNumber *)[(NSArray *)obj countByEnumeratingWithState:&v60 objects:v64 count:16];
        if (v24) {
          continue;
        }
        break;
      }
LABEL_43:

LABEL_44:
    }
  }
LABEL_45:
}

- (void)setGrayLineAlpha:(double)a3
{
}

- (id)occurrencesView
{
  return self->_occurrencesView;
}

- (id)visibleDaySummaryViews
{
  if (self->_hideDaySummaries)
  {
    objc_super v2 = 0;
  }
  else
  {
    objc_super v2 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_daySummaries count]];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v4 = self->_daySummaries;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isHidden", (void)v13) & 1) == 0)
          {
            [v9 alpha];
            if (v10 > 0.01)
            {
              CGRect v11 = [v9 superview];

              if (v11) {
                [v2 addObject:v9];
              }
            }
          }
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }

  return v2;
}

+ (BOOL)usesRoundedRectInsteadOfCircle
{
  return EKUIUsesRoundedRectsInsteadOfCircles();
}

+ (double)grayLineHeight
{
  return 1.0;
}

+ (id)grayLineColor
{
  return +[UIColor systemGray5Color];
}

- (void)_updateSingleDaySummaryForDayIndex:(int64_t)a3 withData:(id)a4 date:(id)a5 calendar:(id)a6
{
  id v15 = a4;
  id v10 = a5;
  id v11 = a6;
  if ((a3 & 0x8000000000000000) == 0
    && !self->_animating
    && (uint64_t)[(NSArray *)self->_daySummaries count] > a3)
  {
    id v12 = [(NSArray *)self->_daySummaries objectAtIndex:a3];
    long long v13 = [(CompactMonthWeekView *)self weekDelegate];
    [v12 setData:v15 date:v10 calendar:v11 delegate:v13];

    if ([v15 count])
    {
      double v14 = 0.0;
      if (!self->_hideDaySummaries) {
        double v14 = 1.0;
      }
    }
    else
    {
      double v14 = 0.0;
    }
    [v12 setAlpha:v14];
  }
}

+ (id)dayTypeBadgeBackgroundColorForVerticallyCompressedMode:(BOOL)a3
{
  if (a3)
  {
    BOOL v3 = +[UIColor quaternarySystemFillColor];
    BOOL v4 = +[UIColor systemBackgroundColor];
    double v14 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v11 = 0.0;
    [v3 getRed:&v14 green:&v13 blue:&v12 alpha:&v11];
    double v9 = 0.0;
    double v10 = 0.0;
    uint64_t v7 = 0;
    double v8 = 0.0;
    [v4 getRed:&v10 green:&v9 blue:&v8 alpha:&v7];
    id v5 = +[UIColor colorWithRed:v10 * (1.0 - v11) + v14 * v11 green:(1.0 - v11) * v9 + v13 * v11 blue:(1.0 - v11) * v8 + v12 * v11 alpha:1.0];
  }
  else
  {
    id v5 = +[UIColor systemBackgroundColor];
  }

  return v5;
}

- (void)_updateDayTypeBadgeForDayNumber:(id)a3 withDayType:(int64_t)a4 color:(id)a5 locale:(id)a6 forceImageUpdate:(BOOL)a7
{
  id v26 = a3;
  id v12 = a5;
  id v13 = a6;
  double v14 = [v26 dayTypeBadge];
  if (v12 && (a4 | 2) == 3)
  {
    if ([v26 dayBadgeType] == (id)a4 && !a7)
    {
      id v15 = [v26 dayBadgeColor];
      if ([v12 isEqual:v15])
      {
        long long v16 = [v26 dayBadgeLocale];
        unsigned __int8 v17 = [v13 isEqual:v16];

        if (v17) {
          goto LABEL_20;
        }
      }
      else
      {
      }
    }
    [v26 setDayBadgeType:a4];
    [v26 setDayBadgeColor:v12];
    [v26 setDayBadgeLocale:v13];
    [objc_opt_class() dayTypeBadgeDiameter:[self compressedVerticalMode]];
    uint64_t v19 = [(CompactMonthWeekView *)self traitCollection];
    [v19 userInterfaceStyle];

    if (a4 == 3)
    {
      uint64_t v20 = BadgeImageForAlternateWorkday();
    }
    else
    {
      if (a4 != 1)
      {
        long long v21 = 0;
        goto LABEL_17;
      }
      uint64_t v20 = BadgeImageForHoliday();
    }
    long long v21 = (void *)v20;
LABEL_17:
    double v22 = [objc_opt_class() dayTypeBadgeBackgroundColorForVerticallyCompressedMode:[self compressedVerticalMode]];
    [v14 setBackgroundColor:[v22 cgColor]];

    id v23 = v21;
    [v14 setContents:[v23 CGImage]];
    long long v24 = [v14 superlayer];

    if (!v24)
    {
      double v25 = [(CompactMonthWeekView *)self layer];
      [v25 addSublayer:v14];
    }
    goto LABEL_20;
  }
  [v26 setDayBadgeType:a4];
  [v26 setDayBadgeColor:0];
  long long v18 = [v14 superlayer];

  if (v18) {
    [v14 removeFromSuperlayer];
  }
LABEL_20:
}

- (void)_forceReloadImagesForDayTypeBadges
{
  if (self->_eventData)
  {
    BOOL v3 = [(CompactMonthWeekView *)self traitCollection];
    +[UITraitCollection _setCurrentTraitCollection:v3];

    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    v8[3] = 0;
    days = self->_days;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000C7E74;
    v7[3] = &unk_1001D4B88;
    void v7[4] = v8;
    [(NSArray *)days enumerateObjectsUsingBlock:v7];
    eventData = self->_eventData;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000C7ED0;
    v6[3] = &unk_1001D4BB0;
    v6[4] = self;
    void v6[5] = v8;
    [(NSArray *)eventData enumerateObjectsUsingBlock:v6];
    _Block_object_dispose(v8, 8);
  }
}

- (void)_updateDayTypeBadgesWithBackgroundColor
{
  if (self->_eventData)
  {
    BOOL v3 = [objc_opt_class() dayTypeBadgeBackgroundColorForVerticallyCompressedMode:[self compressedVerticalMode]];
    days = self->_days;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000C808C;
    v6[3] = &unk_1001D4AE8;
    id v7 = v3;
    id v5 = v3;
    [(NSArray *)days enumerateObjectsUsingBlock:v6];
  }
}

- (void)_layoutDayTypeBadgeForDayNumber:(id)a3 yOffset:(double)a4
{
  id v5 = a3;
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [v5 layer];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  [(CompactMonthWeekView *)self frameForCircleWithDayFrame:@"99", 0, v7, v9, v11, v13, v16, v18, v20, v22 dayLayerFrame numberString overlayString];
  [objc_opt_class() dayTypeBadgeFrameFromDayNumberFrame:compressed:v23, v24, v25, v26];
  double v28 = v27;
  CalRoundRectToScreenScale();
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  id v37 = [v5 dayTypeBadge];
  [v37 setFrame:v30, v32, v34, v36];

  id v38 = [v5 dayTypeBadge];

  [v38 setCornerRadius:v28 * 0.5];
}

+ (CGRect)dayTypeBadgeFrameFromDayNumberFrame:(CGRect)a3 compressed:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(id)objc_opt_class() dayTypeBadgeDiameter:a4];
  double v9 = v8;
  int IsRightToLeft = CUIKLocaleIsRightToLeft();
  CGFloat v11 = x;
  CGFloat v12 = y;
  CGFloat v13 = width;
  CGFloat v14 = height;
  if (IsRightToLeft) {
    double MinX = CGRectGetMinX(*(CGRect *)&v11);
  }
  else {
    double MinX = CGRectGetMaxX(*(CGRect *)&v11);
  }
  double v16 = MinX + v9 * -0.5;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v17 = CGRectGetMinY(v21) + -1.0;
  double v18 = v16;
  double v19 = v9;
  double v20 = v9;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)frameForCircleWithDayFrame:(CGRect)a3 dayLayerFrame:(CGRect)a4 numberString:(id)a5 overlayString:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v11 = a3.size.height;
  double v12 = a3.size.width;
  double v13 = a3.origin.y;
  double v14 = a3.origin.x;
  id v16 = a6;
  id v17 = a5;
  [objc_opt_class() frameForCircleWithDayFrame:v17 dayLayerFrame:v16 numberString:-[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode") containsFirstDay:-[CompactMonthWeekView containsFirstDayOfMonth](self, "containsFirstDayOfMonth") compressed:v14 containsFirstDay:v13 compressed:v12 compressed:v11 compressed:x compressed:y compressed:width compressed:height];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (void)_setUpInteraction
{
  id v3 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:self];
  [(CompactMonthWeekView *)self addInteraction:v3];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  double v7 = self->_days;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([(CompactMonthWeekView *)self compressedVerticalMode])
        {
          double v13 = [v12 attachedTodayCircle];
          unsigned int v14 = [v13 drawCircle];
        }
        else
        {
          unsigned int v14 = 0;
        }
        if ([v12 representsActualDate])
        {
          double v15 = [v12 calendarDate];
          id v16 = v15;
          if (v15) {
            int v17 = v14;
          }
          else {
            int v17 = 1;
          }
          if (v17 == 1)
          {
          }
          else
          {
            [v12 frame];
            CGFloat v19 = v18;
            CGFloat v21 = v20;
            CGFloat v23 = v22;
            CGFloat v25 = v24;
            [v6 location];
            v37.double x = v26;
            v37.double y = v27;
            v38.origin.double x = v19;
            v38.origin.double y = v21;
            v38.size.double width = v23;
            v38.size.double height = v25;
            BOOL v28 = CGRectContainsPoint(v38, v37);

            if (v28)
            {
              if (self->_containsFirstDayOfMonth)
              {
                +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance];
                [(id)objc_opt_class() grayLineHeight];
              }
              [v12 frame];
              double v29 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0);
              goto LABEL_22;
            }
          }
        }
      }
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  double v29 = 0;
LABEL_22:

  return v29;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v85 = a3;
  id v6 = a4;
  [v6 rect];
  CGFloat MidX = CGRectGetMidX(v93);
  v84 = v6;
  [v6 rect];
  CGFloat MidY = CGRectGetMidY(v94);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v82 = self;
  id v9 = self->_days;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v10)
  {
    id v11 = v10;
    double v12 = 0;
    char v13 = 0;
    unsigned int v14 = 0;
    uint64_t v15 = *(void *)v87;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v87 != v15) {
          objc_enumerationMutation(v9);
        }
        int v17 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        if ([v17 representsActualDate])
        {
          uint64_t v18 = [v17 calendarDate];
          if (v18)
          {
            CGFloat v19 = (void *)v18;
            [v17 frame];
            v92.double x = MidX;
            v92.double y = MidY;
            BOOL v20 = CGRectContainsPoint(v95, v92);

            if (v20)
            {
              id v21 = v17;

              double v22 = [v21 attachedTodayCircle];

              if (v22)
              {
                CGFloat v23 = [v21 attachedTodayCircle];

                double v24 = +[UIColor clearColor];
                [v23 setBackgroundColor:v24];

                char v13 = 1;
                double v12 = v21;
                unsigned int v14 = v23;
              }
              else
              {
                double v12 = v21;
              }
            }
          }
        }
      }
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v86 objects:v90 count:16];
    }
    while (v11);
  }
  else
  {
    double v12 = 0;
    char v13 = 0;
    unsigned int v14 = 0;
  }

  CGFloat v25 = [v12 calendarDate];
  [v25 day];

  uint64_t v26 = CUIKLocalizedStringForInteger();
  CGFloat v27 = CUIKGetOverlayCalendar();
  if (v27)
  {
    BOOL v28 = [v12 calendarDate];
    double v29 = [v28 date];
    uint64_t v30 = +[CUIKDateStrings overlayShortStringForDate:v29 inCalendar:v27];
  }
  else
  {
    uint64_t v30 = 0;
  }
  long long v31 = v82;
  [v12 frame];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  id v40 = [v12 layer];
  [v40 frame];
  -[CompactMonthWeekView frameForCircleWithDayFrame:dayLayerFrame:numberString:overlayString:](v82, "frameForCircleWithDayFrame:dayLayerFrame:numberString:overlayString:", v26, v30, v33, v35, v37, v39, v41, v42, v43, v44);
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;

  v96.origin.double x = v46;
  v96.origin.double y = v48;
  v96.size.double width = v50;
  v96.size.double height = v52;
  double v53 = CGRectGetMidX(v96);
  v97.origin.double x = v46;
  v97.origin.double y = v48;
  v97.size.double width = v50;
  v97.size.double height = v52;
  double v54 = CGRectGetMidY(v97);
  uint64_t v80 = v26;
  uint64_t v83 = (void *)v30;
  if ((v13 & 1) == 0)
  {
    BOOL v55 = [v12 layer:v26];
    id v56 = [v55 isHidden];

    double v57 = [v12 overlay];
    double v58 = [v57 layer];
    id v59 = [v58 isHidden];

    long long v60 = [v12 layer];
    [v60 setHidden:0];

    long long v61 = [v12 overlay];
    long long v62 = [v61 layer];
    [v62 setHidden:0];

    long long v63 = createImageViewFromView();

    long long v64 = [v12 layer];
    [v64 setHidden:v56];

    long long v65 = [v12 overlay];
    long long v66 = [v65 layer];
    [v66 setHidden:v59];

    long long v67 = +[UIColor clearColor];
    [v63 setBackgroundColor:v67];

    [v63 setFrame:v46, v48, v50, v52];
    unsigned int v14 = v63;
  }
  id v68 = objc_alloc_init((Class)UIPreviewParameters);
  id v69 = [objc_alloc((Class)UIPreviewTarget) initWithContainer:v31 center:v53];
  id v70 = [objc_alloc((Class)UITargetedPreview) initWithView:v14 parameters:v68 target:v69];
  id v71 = +[UIPointerHighlightEffect effectWithPreview:v70];
  if (+[CompactMonthWeekView usesRoundedRectInsteadOfCircle])
  {
    double v72 = EKUILargeTextRoundedRectCornerRadius;
  }
  else
  {
    double v72 = v50 * 0.5;
  }
  if (+[CompactMonthWeekView usesRoundedRectInsteadOfCircle])
  {
    double v73 = v52;
  }
  else
  {
    double v73 = v52 + 1.0;
  }
  uint64_t v74 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v46, v48, v50, v73, v72);
  v75 = [v12 attachedTodayCircle];
  unsigned int v76 = [v75 drawCircle];

  if (v76)
  {
    uint64_t v77 = +[UIPointerLiftEffect effectWithPreview:v70];

    uint64_t v74 = 0;
    id v71 = (void *)v77;
  }
  v78 = +[UIPointerStyle styleWithEffect:v71 shape:v74];

  return v78;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6 = a4;
  [v6 rect];
  CGFloat MidX = CGRectGetMidX(v25);
  [v6 rect];
  CGFloat MidY = CGRectGetMidY(v26);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = self->_days;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v9);
      }
      unsigned int v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
      [v14 frame:v19];
      v24.double x = MidX;
      v24.double y = MidY;
      if (CGRectContainsPoint(v27, v24)) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    uint64_t v15 = v14;

    if (!v15) {
      goto LABEL_13;
    }
    id v16 = [(NSArray *)v15 layer];
    [v16 setHidden:1];

    int v17 = [(NSArray *)v15 overlay];
    uint64_t v18 = [v17 layer];
    [v18 setHidden:1];

    id v9 = v15;
  }
LABEL_12:

LABEL_13:
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [v7 rect];
  CGFloat MidX = CGRectGetMidX(v30);
  [v7 rect];
  CGFloat MidY = CGRectGetMidY(v31);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = self->_days;
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    id v21 = v8;
    uint64_t v14 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(CompactMonthWeekDayNumber **)(*((void *)&v24 + 1) + 8 * i);
        [(CompactMonthWeekDayNumber *)v16 frame];
        v29.double x = MidX;
        v29.double y = MidY;
        if (CGRectContainsPoint(v32, v29) && v16 != self->_today)
        {
          int v17 = [(CompactMonthWeekDayNumber *)v16 attachedTodayCircle];
          unsigned __int8 v18 = [v17 drawCircle];

          if ((v18 & 1) == 0)
          {
            long long v19 = v16;
            goto LABEL_13;
          }
        }
      }
      id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    long long v19 = 0;
LABEL_13:
    id v8 = v21;
  }
  else
  {
    long long v19 = 0;
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000C90AC;
  v22[3] = &unk_1001D27D8;
  CGFloat v23 = v19;
  long long v20 = v19;
  [v8 addCompletion:v22];
}

+ (int64_t)_cellToStartDrawingInForViewWithCalendarDate:(id)a3 calendar:(id)a4
{
  id v5 = a4;
  id v6 = [a3 date];
  [v5 rangeOfUnit:512 inUnit:4096 forDate:v6];
  uint64_t v8 = v7;
  id v9 = [v5 components:528 fromDate:v6];

  unint64_t v10 = CUIKOneIndexedWeekStart();
  id v11 = (char *)[v9 weekday];
  id v12 = &v11[v8 - v10];
  if ((unint64_t)v11 > v10) {
    id v12 = &v11[-v10];
  }
  if (v11 == (char *)v10) {
    int64_t v13 = 0;
  }
  else {
    int64_t v13 = (int64_t)v12;
  }

  return v13;
}

+ (BOOL)_viewForCalendarDateContainsFirstDayOfMonth:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 calendarDateForMonth];
  id v5 = [v4 month];
  if (v5 == [v3 month])
  {
    id v6 = [v4 day];
    BOOL v7 = v6 == [v3 day];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)_useTallCompressedHeight
{
  return _EKUIIsCompactThickWidthRegularTallHeight(a1, a2);
}

- (void)_reloadMonthNameLabel
{
  BOOL containsFirstDayOfMonth = self->_containsFirstDayOfMonth;
  monthNameLabel = self->_monthNameLabel;
  if (containsFirstDayOfMonth)
  {
    if (!monthNameLabel)
    {
      [(CompactMonthWeekView *)self _initializeMonthNameLabel];
      monthNameLabel = self->_monthNameLabel;
    }
    [(UILabel *)monthNameLabel setHidden:0];
    id v5 = CUIKTodayDate();
    id v6 = [(EKCalendarDate *)self->_startCalendarDate date];
    BOOL v7 = [(EKCalendarDate *)self->_startCalendarDate calendarDateForEndOfMonth];
    uint64_t v8 = [v7 date];

    BOOL v9 = 0;
    if ([v6 compare:v5] != (id)1) {
      BOOL v9 = [v8 compare:v5] != (id)-1;
    }
    unint64_t v10 = [(EKCalendarDate *)self->_startCalendarDate date];
    id v11 = CUIKStringForMonth();

    id v12 = +[CompactMonthViewController monthNameFont];
    [(UILabel *)self->_monthNameLabel setFont:v12];

    LODWORD(v12) = CUIKCurrentLocaleRequiresIndianLanguageAdjustments();
    int v13 = CUIKCurrentLocaleRequiresUnabbrevatedMonthNames();
    if (v12)
    {
      uint64_t v14 = [(EKCalendarDate *)self->_startCalendarDate date];
      CUIKLongStringForMonth();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v13) {
        goto LABEL_15;
      }
      long long v26 = v8;
      unint64_t v25 = [(CompactMonthWeekView *)self _monthLabelColumnIndex];
      int v17 = (char *)[(CompactMonthWeekView *)self _daysInAWeek] - 1;
      unint64_t v18 = [(CompactMonthWeekView *)self _monthLabelColumnIndex];
      long long v19 = [(EKCalendarDate *)self->_startCalendarDate date];
      id v16 = CUIKLongStringForMonth();

      if ((char *)v25 == v17 || !v18)
      {
        uint64_t v8 = v26;
        goto LABEL_9;
      }
      id v15 = v16;
      uint64_t v14 = v11;
      id v11 = v15;
      uint64_t v8 = v26;
    }

    id v16 = v11;
    id v11 = v15;
LABEL_9:

LABEL_15:
    long long v20 = +[NSLocale currentLocale];
    id v21 = [v11 capitalizedStringWithLocale:v20];

    [(UILabel *)self->_monthNameLabel setText:v21];
    if (v9) {
      CalendarAppTintColor();
    }
    else {
    long long v22 = +[UIColor labelColor];
    }
    [(UILabel *)self->_monthNameLabel setTextColor:v22];

    [(UILabel *)self->_monthNameLabel sizeToFit];
    [(UILabel *)self->_monthNameLabel bounds];
    self->_monthNameLabelFittingSize.double width = v23;
    self->_monthNameLabelFittingSize.double height = v24;

    goto LABEL_19;
  }
  [(UILabel *)monthNameLabel setText:0];
  [(UILabel *)self->_monthNameLabel setHidden:1];
LABEL_19:

  [(CompactMonthWeekView *)self setNeedsLayout];
}

- (unint64_t)_daysInAWeek
{
  return 7;
}

- (id)monthNameLabel
{
  monthNameLabel = self->_monthNameLabel;
  if (!monthNameLabel)
  {
    [(CompactMonthWeekView *)self _initializeMonthNameLabel];
    monthNameLabel = self->_monthNameLabel;
  }

  return monthNameLabel;
}

- (unint64_t)_monthLabelColumnIndex
{
  if (!self->_containsFirstDayOfMonth) {
    return 0;
  }
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FFFFFFFLL;
  days = self->_days;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C9660;
  v5[3] = &unk_1001D4B88;
  v5[4] = &v6;
  [(NSArray *)days enumerateObjectsUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBackgroundScene
{
  objc_super v2 = [(CompactMonthWeekView *)self window];
  unint64_t v3 = [v2 windowScene];
  BOOL v4 = [v3 activationState] == (id)2;

  return v4;
}

- (id)containerViewForOccurrencePreview
{
  return 0;
}

- (id)selectedEventsForEditMenu
{
  return 0;
}

- (id)presentationControllerForEditMenu
{
  return 0;
}

- (CGRect)frameForOccurrence:(id)a3 onDay:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CompactMonthWeekView *)self layoutIfNeeded];
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
    -[CompactMonthWeekView convertRect:fromView:](self, "convertRect:fromView:", self->_occurrencesView, v9, v11, v13, v15);
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
  [(CompactMonthWeekView *)self layoutIfNeeded];
  [(MonthWeekOccurrencesView *)self->_occurrencesView frameForOccurrenceAfterLastOnDay:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[CompactMonthWeekView convertRect:fromView:](self, "convertRect:fromView:", self->_occurrencesView, v6, v8, v10, v12);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  [(CompactMonthWeekView *)self bounds];
  double v22 = v21;
  v28.origin.double x = v14;
  v28.origin.double y = v16;
  v28.size.double width = v18;
  v28.size.double height = v20;
  CGFloat MaxY = CGRectGetMaxY(v28);
  double v24 = v22 - v20;
  if (MaxY <= v22) {
    double v24 = v16;
  }
  double v25 = v14;
  double v26 = v18;
  double v27 = v20;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v24;
  result.origin.double x = v25;
  return result;
}

- (void)setHighlightedDayRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (qword_1002167C8 != -1) {
    dispatch_once(&qword_1002167C8, &stru_1001D4BD0);
  }
  double v6 = [(CompactMonthWeekView *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];
  double v8 = &qword_1002167C0;
  if (v7 != (id)2) {
    double v8 = &qword_1002167B8;
  }
  id v9 = (id)*v8;

  unint64_t v10 = [(MonthWeekOccurrencesView *)self->_occurrencesView dayCount];
  if (location + length <= v10) {
    unint64_t v11 = length;
  }
  else {
    unint64_t v11 = v10 - location;
  }
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v12 = length;
  }
  else {
    NSUInteger v12 = v11;
  }
  if (location != self->_highlightedDayRange.location || v12 != self->_highlightedDayRange.length)
  {
    self->_highlightedDayRange.NSUInteger location = location;
    self->_highlightedDayRange.NSUInteger length = v12;
    if (!self->_highlightedDays)
    {
      CGFloat v14 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:7];
      highlightedDays = self->_highlightedDays;
      self->_highlightedDays = v14;
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v51 = v9;
    CGFloat v16 = self->_days;
    double v17 = (char *)[(NSArray *)v16 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v17)
    {
      CGFloat v18 = v17;
      double v19 = 0;
      uint64_t v20 = *(void *)v65;
      while (2)
      {
        double v21 = 0;
        double v22 = &v18[(void)v19];
        do
        {
          if (*(void *)v65 != v20) {
            objc_enumerationMutation(v16);
          }
          CGFloat v23 = [*(id *)(*((void *)&v64 + 1) + 8 * (void)v21) calendarDate];

          if (v23)
          {
            double v22 = &v21[(void)v19];
            goto LABEL_28;
          }
          ++v21;
        }
        while (v18 != v21);
        CGFloat v18 = (char *)[(NSArray *)v16 countByEnumeratingWithState:&v64 objects:v69 count:16];
        double v19 = v22;
        if (v18) {
          continue;
        }
        break;
      }
    }
    else
    {
      double v22 = 0;
    }
LABEL_28:

    [(CompactMonthWeekView *)self rectForCells];
    double v25 = v24;
    double v27 = v26;
    id v53 = [(NSMutableDictionary *)self->_highlightedDays mutableCopy];
    if (v12 && location < v12 + location)
    {
      do
      {
        CGRect v28 = +[NSNumber numberWithUnsignedInteger:location];
        uint64_t v29 = [(NSMutableDictionary *)self->_highlightedDays objectForKey:v28];
        if (v29)
        {
          id v30 = (id)v29;
          [v53 removeObjectForKey:v28];
        }
        else
        {
          CGRect v31 = [(NSArray *)self->_days objectAtIndexedSubscript:&v22[location]];
          [v31 frame];
          double v33 = v32;
          double v35 = v34;

          [(id)objc_opt_class() grayLineHeight];
          double v37 = v36;
          [(id)objc_opt_class() grayLineHeight];
          double v39 = v38;
          if (&v22[location + 1] < (char *)[(NSArray *)self->_days count])
          {
            id v40 = [(NSArray *)self->_days objectAtIndexedSubscript:&v22[location + 1]];
            [v40 frame];
            double v42 = v41;

            double v35 = v42 - v33;
          }
          id v43 = [objc_alloc((Class)UIView) initWithFrame:v33, v25 + v37, v35, v27 - v39];
          [v43 setBackgroundColor:v51];
          [v43 setAlpha:0.0];
          [(CompactMonthWeekView *)self addSubview:v43];
          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472;
          v62[2] = sub_1000C9F44;
          v62[3] = &unk_1001D2740;
          id v30 = v43;
          id v63 = v30;
          +[UIView animateWithDuration:2 delay:v62 options:0 animations:0.2 completion:0.0];
          [(NSMutableDictionary *)self->_highlightedDays setObject:v30 forKey:v28];
        }
        ++location;
        --v12;
      }
      while (v12);
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = [v53 allKeys];
    id v44 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v59;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v59 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v48 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          double v49 = [v53 objectForKey:v48];
          [(NSMutableDictionary *)self->_highlightedDays removeObjectForKey:v48];
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472;
          v56[2] = sub_1000C9F50;
          v56[3] = &unk_1001D2740;
          id v57 = v49;
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_1000C9F5C;
          v54[3] = &unk_1001D27D8;
          id v55 = v57;
          id v50 = v57;
          +[UIView animateWithDuration:6 delay:v56 options:v54 animations:0.2 completion:0.0];
        }
        id v45 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
      }
      while (v45);
    }

    id v9 = v51;
  }
}

- (id)newFeedbackViewForDraggingOccurrence:(id)a3 atPoint:(CGPoint)a4
{
  double x = a4.x;
  id v6 = a3;
  if (x < 0.0) {
    double x = 0.0;
  }
  [(CompactMonthWeekView *)self frame];
  double MaxX = CGRectGetMaxX(v29);
  if (x > MaxX)
  {
    [(CompactMonthWeekView *)self frame];
    double MaxX = CGRectGetMaxX(v30);
  }
  double v8 = [v6 startCalendarDate:MaxX];
  [v8 absoluteTime];
  double v10 = v9;
  [(EKCalendarDate *)self->_startCalendarDate absoluteTime];
  double v12 = v11;

  if (v10 >= v12)
  {
    double v13 = [v6 startCalendarDate];
  }
  else
  {
    double v13 = self->_startCalendarDate;
  }
  CGFloat v14 = v13;
  double v15 = [(MonthWeekOccurrencesView *)self->_occurrencesView occurrenceViewForOccurrence:v6 onDay:v13];
  [v15 setSelected:1];
  float v16 = kDraggedEventShadowOpacity;
  double v17 = [v15 layer];
  *(float *)&double v18 = v16;
  [v17 setShadowOpacity:v18];

  DraggedEventShadowOffset();
  double v20 = v19;
  double v22 = v21;
  CGFloat v23 = [v15 layer];
  [v23 setShadowOffset:v20, v22];

  double v24 = kDraggedEventShadowRadius;
  double v25 = [v15 layer];
  [v25 setShadowRadius:v24];

  uint64_t v26 = DraggedEventShadowColor();
  double v27 = [v15 layer];
  [v27 setShadowColor:v26];

  return v15;
}

- (NSArray)eventData
{
  return self->_eventData;
}

- (BOOL)compressedVerticalMode
{
  return self->_compressedVerticalMode;
}

- (BOOL)compressedHorizontalMode
{
  return self->_compressedHorizontalMode;
}

- (void)setCompressedHorizontalMode:(BOOL)a3
{
  self->_compressedHorizontalMode = a3;
}

- (BOOL)enableLayerAnimationsDuringLayout
{
  return self->_enableLayerAnimationsDuringLayout;
}

- (void)setEnableLayerAnimationsDuringLayout:(BOOL)a3
{
  self->_enableLayerAnimationsDuringLayout = a3;
}

- (BOOL)disableTodayPulse
{
  return self->_disableTodayPulse;
}

- (void)setDisableTodayPulse:(BOOL)a3
{
  self->_disableTodayPulse = a3;
}

- (BOOL)showWeekNumber
{
  return self->_showWeekNumber;
}

- (BOOL)temporarilyHideWeekNumber
{
  return self->_temporarilyHideWeekNumber;
}

- (UIFont)monthNameFont
{
  return self->_monthNameFont;
}

- (void)setMonthNameFont:(id)a3
{
}

- (BOOL)useLayoutMargins
{
  return self->_useLayoutMargins;
}

- (void)setUseLayoutMargins:(BOOL)a3
{
  self->_useLayoutMargins = a3;
}

- (UIColor)dayBadgeColor
{
  return self->_dayBadgeColor;
}

- (void)setDayBadgeColor:(id)a3
{
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void)setMonthWeekScale:(double)a3
{
  self->_monthWeekScale = a3;
}

- (CompactMonthWeekViewDelegate)weekDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weekDelegate);

  return (CompactMonthWeekViewDelegate *)WeakRetained;
}

- (void)setWeekDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weekDelegate);
  objc_storeStrong((id *)&self->_dayBadgeColor, 0);
  objc_storeStrong((id *)&self->_monthNameFont, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_highlightedDays, 0);
  objc_storeStrong((id *)&self->_secondOccurrences, 0);
  objc_storeStrong((id *)&self->_firstOccurrenceDict, 0);
  objc_storeStrong((id *)&self->_fadingInfos, 0);
  objc_storeStrong((id *)&self->_animationInfos, 0);
  objc_storeStrong((id *)&self->_occurrencesView, 0);
  objc_storeStrong((id *)&self->_selected, 0);
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_daySummaries, 0);
  objc_storeStrong((id *)&self->_days, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_todayPulse, 0);
  objc_storeStrong((id *)&self->_monthNameLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_grayLine, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_endCalendarDate, 0);

  objc_storeStrong((id *)&self->_startCalendarDate, 0);
}

@end