@interface WeekView
+ (BOOL)showsAllDayDividerLine;
+ (BOOL)usesSmallTextForIsCompact:(BOOL)a3;
+ (double)dayWidthForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4;
+ (double)standardWidthForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4;
+ (double)windowSpaceForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4;
+ (id)weekSeparatorColor;
+ (int64_t)numMultiDays;
+ (unint64_t)displayedDaysForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4;
- (BOOL)containsDate:(id)a3;
- (BOOL)dayViewContentShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4;
- (BOOL)hasAllDayEvents;
- (BOOL)isAnimatingScroll;
- (BOOL)isEventFullyVisible:(id)a3;
- (BOOL)scrollTowardPoint:(CGPoint)a3;
- (BOOL)scrollerIsParentOfView:(id)a3 isAllDay:(BOOL)a4;
- (BOOL)showsTimeMarker;
- (BOOL)weekAllDayViewShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4;
- (CGPoint)pointAtDate:(id)a3 isAllDay:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKDayViewContent)content;
- (NSArray)occurrenceViews;
- (NSCalendar)calendar;
- (NSDate)lastSecondOfWeek;
- (NSDateComponents)highlightedDateComponents;
- (NSDateComponents)lastDateOfWeek;
- (NSDateComponents)weekStartDate;
- (NSTimeZone)timeZone;
- (UIScrollView)scrollView;
- (WeekAllDayView)allDayView;
- (WeekView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 targetWindow:(id)a5 rightClickDelegate:(id)a6;
- (WeekViewDataSource)dataSource;
- (WeekViewDelegate)delegate;
- (double)_positionOfSecond:(int64_t)a3;
- (double)hourHeightScale;
- (double)yPositionPerhapsMatchingAllDayOccurrence:(id)a3 atPoint:(CGPoint)a4;
- (id)_verticalGridExtensionImage;
- (id)dateForXOffset:(double)a3;
- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4;
- (id)presentationControllerForEditMenu;
- (id)selectedEventsForEditMenu;
- (id)weekAllDayViewForTimeframeAfter:(id)a3;
- (id)weekAllDayViewForTimeframeBefore:(id)a3;
- (int)_secondAtPosition:(double)a3;
- (int64_t)daysToDisplay;
- (int64_t)firstVisibleSecond;
- (int64_t)orientation;
- (void)_updateHighlightedDay;
- (void)_updateTimeMarkerTodayDay;
- (void)addViewToScroller:(id)a3 isAllDay:(BOOL)a4;
- (void)adjustForVisibleRect:(CGRect)a3;
- (void)attemptDisplayReviewPrompt;
- (void)dayViewContent:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5 dateSelected:(id)a6;
- (void)dayViewContent:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5;
- (void)dayViewContent:(id)a3 didTapInEmptySpaceOnDay:(double)a4;
- (void)dayViewContent:(id)a3 didTapPinnedOccurrence:(id)a4;
- (void)dayViewContentDidLayout:(id)a3;
- (void)firstVisibleSecondChanged;
- (void)hideNowDot:(BOOL)a3;
- (void)layoutSubviews;
- (void)loadDataAsyncWithCompletion:(id)a3 reverse:(BOOL)a4;
- (void)reloadData;
- (void)scrollToEvent:(id)a3 animateWithDuration:(double)a4 completion:(id)a5;
- (void)scrollToEvent:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)scrollToSecond:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstVisibleSecond:(int64_t)a3;
- (void)setHighlightedDateComponents:(id)a3;
- (void)setHourHeightScale:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setScrollerContentOffset:(CGPoint)a3;
- (void)setShowsTimeMarker:(BOOL)a3;
- (void)setTimeZone:(id)a3;
- (void)setWeekStartDate:(id)a3;
- (void)shouldAnnotateAppEntitiesChanged;
- (void)showOverlayMonthInCellAtOffset:(double)a3 animated:(BOOL)a4;
- (void)updateDayWidth;
- (void)updateMarkerPosition;
- (void)weekAllDayView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5 dateSelected:(id)a6;
- (void)weekAllDayViewDidScroll:(id)a3;
- (void)weekAllDayViewEmptySpaceClick:(id)a3 onDay:(double)a4;
@end

@implementation WeekView

+ (BOOL)usesSmallTextForIsCompact:(BOOL)a3
{
  return a3;
}

+ (BOOL)showsAllDayDividerLine
{
  return 0;
}

+ (double)standardWidthForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  [a1 dayWidthForOrientation:a3 withViewInViewHierarchy:a4];
  return v4 * 7.0;
}

+ (double)windowSpaceForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [v5 window];
  }
  v7 = v6;
  EKUICurrentWindowWidthWithViewHierarchy();
  double v9 = v8;
  if (EKUICurrentHeightSizeClassIsCompact()
    && EKUICurrentWidthSizeClassIsCompactInViewHierarchy())
  {
    EKUICurrentWindowHeightWithViewHierarchy();
    if (v9 < v10) {
      double v9 = v10;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 mainContentSize];
      double v9 = v11;
    }
  }
  int v12 = EKUIIsExtended();
  if ((unint64_t)(a3 - 3) <= 1 && v12)
  {
    int IsLeftToRight = CalTimeDirectionIsLeftToRight();
    [v7 safeAreaInsets];
    if (IsLeftToRight) {
      double v16 = v15;
    }
    else {
      double v16 = v14;
    }
    double v9 = v9 - v16;
  }
  +[WeekTimeView widthForOrientation:a3 inViewHierarchy:v5];
  double v18 = v9 - v17;

  return v18;
}

+ (unint64_t)displayedDaysForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  id v6 = a4;
  if (EKUICurrentHeightSizeClassIsCompact()) {
    int IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy();
  }
  else {
    int IsCompactInViewHierarchy = 0;
  }
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy())
  {
    double v8 = [v6 traitCollection];
    if (EKUIUsesLargeTextLayout())
    {
      double v9 = +[UIDevice currentDevice];
      BOOL v10 = [v9 userInterfaceIdiom] == 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  if ((v10 | IsCompactInViewHierarchy) == 1)
  {
    [a1 windowSpaceForOrientation:a3 withViewInViewHierarchy:v6];
    double v12 = v11;
    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
    [v13 _scaledValueForValue:v12 / 5.0];
    unint64_t v15 = vcvtad_u64_f64(v12 / v14);
    if (v15 >= 5) {
      unint64_t v15 = 5;
    }
    if (v15 <= 2) {
      unint64_t v16 = 2;
    }
    else {
      unint64_t v16 = v15;
    }
  }
  else
  {
    unint64_t v16 = 7;
  }

  return v16;
}

+ (double)dayWidthForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  id v6 = a4;
  EKUICurrentWindowWidthWithViewHierarchy();
  double v8 = v7;
  EKUICurrentWindowHeightWithViewHierarchy();
  double v10 = v8 / v9;
  if (v10 < 1.0)
  {
    EKUICurrentWindowHeightWithViewHierarchy();
    double v12 = v11;
    EKUICurrentWindowWidthWithViewHierarchy();
    double v10 = v12 / v13;
  }
  if (EKUICurrentHeightSizeClassIsCompact()
    && EKUICurrentWidthSizeClassIsCompactInViewHierarchy()
    && v10 < 1.7)
  {
    double v14 = 130.0;
  }
  else
  {
    [a1 windowSpaceForOrientation:a3 withViewInViewHierarchy:v6];
    [a1 displayedDaysForOrientation:a3 withViewInViewHierarchy:v6];
    CalCeilToScreenScale();
    double v14 = v15;
  }

  return v14;
}

+ (id)weekSeparatorColor
{
  return +[UIColor separatorColor];
}

- (WeekView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 targetWindow:(id)a5 rightClickDelegate:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a5;
  id v14 = a6;
  v54.receiver = self;
  v54.super_class = (Class)WeekView;
  double v15 = -[WeekView initWithFrame:](&v54, "initWithFrame:", x, y, width, height);
  if (v15)
  {
    uint64_t v16 = EKUIInterfaceOrientationForViewHierarchy();
    id v17 = [(WeekView *)v15 daysToDisplay];
    BOOL v18 = a4 == 1;
    objc_storeWeak((id *)&v15->_targetWindow, v13);
    [(id)objc_opt_class() dayWidthForOrientation:v16 withViewInViewHierarchy:v13];
    double v20 = v19;
    v15->_daysToDispladouble y = (int64_t)v17;
    v21 = [WeekAllDayView alloc];
    v22 = +[UIColor colorNamed:@"weekHeaderBGColor"];
    double v23 = CGRectZero.origin.y;
    double v24 = CGRectZero.size.width;
    double v25 = CGRectZero.size.height;
    v26 = -[WeekAllDayView initWithFrame:orientation:numberOfDaysToDisplay:opaque:backgroundColor:rightClickDelegate:](v21, "initWithFrame:orientation:numberOfDaysToDisplay:opaque:backgroundColor:rightClickDelegate:", v16, v17, 1, v22, v14, CGRectZero.origin.x, v23, v24, v25);
    allDayView = v15->_allDayView;
    v15->_allDayView = v26;

    [(WeekAllDayView *)v15->_allDayView setFixedDayWidth:v20];
    [(WeekAllDayView *)v15->_allDayView setDelegate:v15];
    [(WeekAllDayView *)v15->_allDayView setOrientation:v16];
    [(WeekAllDayView *)v15->_allDayView setShowsHalfOfScrolledEvents:1];
    -[WeekAllDayView setUsesSmallText:](v15->_allDayView, "setUsesSmallText:", [(id)objc_opt_class() usesSmallTextForIsCompact:v18]);
    [(WeekAllDayView *)v15->_allDayView setShowSeparatorLines:1];
    [(WeekView *)v15 addSubview:v15->_allDayView];
    id v28 = objc_alloc((Class)EKDayViewContent);
    v29 = +[UIColor systemBackgroundColor];
    v30 = [v28 initWithFrame:a4 sizeClass:v16 orientation:v29 backgroundColor:0 opaque:0 isMiniPreviewInEventDetail:v17 numberOfDaysToDisplay:v23 CGRectZero.origin.x:v24 v25];
    content = v15->_content;
    v15->_content = v30;

    v32 = v15->_content;
    id v33 = [objc_alloc((Class)EKUIRightClickEmptySpaceInteraction) initWithDelegate:v14];
    [(EKDayViewContent *)v32 addInteraction:v33];

    [(EKDayViewContent *)v15->_content setEventsFillGrid:1];
    v34 = [(EKDayViewContent *)v15->_content grid];
    [v34 setShowsLeftBorder:0];

    v35 = [(EKDayViewContent *)v15->_content grid];
    [v35 setShowsRightBorder:0];

    v36 = [(EKDayViewContent *)v15->_content grid];
    [v36 setRightBorderInsetsOccurrences:0];

    v37 = [(EKDayViewContent *)v15->_content grid];
    [v37 setEventHorizontalInset:-6.0];

    [(EKDayViewContent *)v15->_content setOrientation:v16];
    [(EKDayViewContent *)v15->_content setFixedDayWidth:v20];
    -[EKDayViewContent setUsesSmallText:](v15->_content, "setUsesSmallText:", [(id)objc_opt_class() usesSmallTextForIsCompact:v18]);
    [(EKDayViewContent *)v15->_content setDelegate:v15];
    [(EKDayViewContent *)v15->_content sizeToFit];
    if (!v18)
    {
      +[EKDayOccurrenceView defaultPadding];
      -[EKDayViewContent setOccurrencePadding:](v15->_content, "setOccurrencePadding:", 0.5, 2.0);
    }
    v38 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
    scrollView = v15->_scrollView;
    v15->_scrollView = v38;

    v40 = +[UIColor systemBackgroundColor];
    [(UIScrollView *)v15->_scrollView setBackgroundColor:v40];

    v41 = v15->_scrollView;
    [(EKDayViewContent *)v15->_content frame];
    -[UIScrollView setContentSize:](v41, "setContentSize:", v42, v43);
    [(UIScrollView *)v15->_scrollView addSubview:v15->_content];
    [(UIScrollView *)v15->_scrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v15->_scrollView setScrollsToTop:0];
    [(UIScrollView *)v15->_scrollView setAutoresizingMask:18];
    [(UIScrollView *)v15->_scrollView setDelegate:v15];
    [(WeekView *)v15 addSubview:v15->_scrollView];
    [(WeekView *)v15 setAutoresizingMask:16];
    v15->_hourHeightScale = 1.0;
    [(WeekView *)v15 bringSubviewToFront:v15->_allDayView];
    v44 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, v23, v24, v25];
    gridExtensionView = v15->_gridExtensionView;
    v15->_gridExtensionView = v44;

    [(UIImageView *)v15->_gridExtensionView setOpaque:0];
    [(UIScrollView *)v15->_scrollView insertSubview:v15->_gridExtensionView atIndex:0];
    v15->_selectedSecond = -1;
    [(WeekView *)v15 setOrientation:v16];
    dispatch_queue_t v46 = dispatch_queue_create("weekReload", 0);
    reloadQueue = v15->_reloadQueue;
    v15->_reloadQueue = (OS_dispatch_queue *)v46;

    objc_initWeak(&location, v15);
    uint64_t v55 = objc_opt_class();
    v48 = +[NSArray arrayWithObjects:&v55 count:1];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10006DCEC;
    v51[3] = &unk_1001D2620;
    objc_copyWeak(&v52, &location);
    id v49 = [(WeekView *)v15 registerForTraitChanges:v48 withHandler:v51];

    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);
  }

  return v15;
}

+ (int64_t)numMultiDays
{
  return 7;
}

- (int64_t)daysToDisplay
{
  v2 = objc_opt_class();

  return (int64_t)[v2 numMultiDays];
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
  id v5 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindow);
  [v5 dayWidthForOrientation:a3 withViewInViewHierarchy:WeakRetained];
  double v8 = v7;

  verticalGridExtensionImage = self->_verticalGridExtensionImage;
  self->_verticalGridExtensionImage = 0;

  [(EKDayViewContent *)self->_content setOrientation:a3];
  [(EKDayViewContent *)self->_content setFixedDayWidth:v8];
  [(EKDayViewContent *)self->_content sizeToFit];
  double v10 = [(EKDayViewContent *)self->_content grid];
  [v10 updateMarkerPosition];

  scrollView = self->_scrollView;
  [(EKDayViewContent *)self->_content frame];
  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v12, v13);
  [(WeekAllDayView *)self->_allDayView setFixedDayWidth:v8];

  [(WeekView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)WeekView;
  [(WeekView *)&v25 layoutSubviews];
  [(WeekView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[WeekAllDayView sizeThatFits:](self->_allDayView, "sizeThatFits:", v7, v9);
  double v12 = v11;
  [(WeekView *)self bounds];
  -[WeekAllDayView setFrame:](self->_allDayView, "setFrame:", 0.0, 0.0);
  [(WeekView *)self bounds];
  double v14 = v13;
  [(WeekView *)self bounds];
  double v16 = v15 - v12;
  [(UIScrollView *)self->_scrollView frame];
  v27.origin.double x = v17;
  v27.origin.double y = v18;
  v27.size.double width = v19;
  v27.size.double height = v20;
  v26.origin.double x = 0.0;
  v26.origin.double y = v12;
  v26.size.double width = v14;
  v26.size.double height = v16;
  if (!CGRectEqualToRect(v26, v27)) {
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", 0.0, v12, v14, v16);
  }
  int64_t selectedSecond = self->_selectedSecond;
  if (selectedSecond != -1) {
    [(WeekView *)self scrollToSecond:selectedSecond animated:0 completion:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
    [v24 weekViewDidLayout:self];
  }
  -[WeekView adjustForVisibleRect:](self, "adjustForVisibleRect:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(WeekView *)self updateDayWidth];
  -[WeekAllDayView sizeThatFits:](self->_allDayView, "sizeThatFits:", width, height);
  double v7 = height;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)updateDayWidth
{
  double v3 = objc_opt_class();
  int64_t orientation = self->_orientation;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindow);
  [v3 dayWidthForOrientation:orientation withViewInViewHierarchy:WeakRetained];
  double v7 = v6;

  [(EKDayViewContent *)self->_content fixedDayWidth];
  if (v7 != v8)
  {
    [(EKDayViewContent *)self->_content setFixedDayWidth:v7];
    [(EKDayViewContent *)self->_content sizeToFit];
    scrollView = self->_scrollView;
    [(EKDayViewContent *)self->_content frame];
    -[UIScrollView setContentSize:](scrollView, "setContentSize:", v10, v11);
    [(WeekAllDayView *)self->_allDayView setFixedDayWidth:v7];
    [(WeekView *)self setNeedsLayout];
  }
}

- (void)hideNowDot:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(EKDayViewContent *)self->_content grid];
  [v4 hideNowDot:v3];
}

- (void)setWeekStartDate:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_weekStartDate] & 1) == 0)
  {
    id v4 = [v6 dateComponentsForDateOnly];
    weekStartDate = self->_weekStartDate;
    self->_weekStartDate = v4;

    [(WeekAllDayView *)self->_allDayView setStartDate:self->_weekStartDate];
    [(EKDayViewContent *)self->_content setStartDateWithDateComponents:self->_weekStartDate];
    [(WeekView *)self _updateTimeMarkerTodayDay];
  }
}

- (void)setCalendar:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_calendar] & 1) == 0)
  {
    id v4 = (NSCalendar *)[v6 copy];
    calendar = self->_calendar;
    self->_calendar = v4;

    [(EKDayViewContent *)self->_content setCalendar:v6];
    [(WeekAllDayView *)self->_allDayView setCalendar:v6];
    [(WeekView *)self _updateTimeMarkerTodayDay];
  }
}

- (void)setTimeZone:(id)a3
{
  id v7 = a3;
  id v4 = [(NSCalendar *)self->_calendar timeZone];
  if (([v7 isEqualToTimeZone:v4] & 1) == 0)
  {

    goto LABEL_5;
  }
  double v5 = [(EKDayViewContent *)self->_content timeZone];
  unsigned __int8 v6 = [v7 isEqualToTimeZone:v5];

  if ((v6 & 1) == 0)
  {
LABEL_5:
    [(NSCalendar *)self->_calendar setTimeZone:v7];
    [(EKDayViewContent *)self->_content setTimeZone:v7];
    [(WeekAllDayView *)self->_allDayView setTimeZone:v7];
  }
}

- (NSTimeZone)timeZone
{
  return [(NSCalendar *)self->_calendar timeZone];
}

- (void)setHighlightedDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedDateComponents, a3);

  [(WeekView *)self _updateHighlightedDay];
}

- (NSDateComponents)highlightedDateComponents
{
  return self->_highlightedDateComponents;
}

- (NSDateComponents)lastDateOfWeek
{
  return (NSDateComponents *)[(NSDateComponents *)self->_weekStartDate dateComponents:30 byAddingDays:6 calendar:self->_calendar];
}

- (NSDate)lastSecondOfWeek
{
  v2 = [(EKDayViewContent *)self->_content lastDisplayedSecond];
  BOOL v3 = [v2 date];

  return (NSDate *)v3;
}

- (void)adjustForVisibleRect:(CGRect)a3
{
  double width = a3.size.width;
  [(WeekView *)self frame];
  if (v5 != 0.0)
  {
    [(UIScrollView *)self->_scrollView frame];
    if (v6 != 0.0)
    {
      [(WeekAllDayView *)self->_allDayView bounds];
      -[WeekAllDayView rectBecameVisible:](self->_allDayView, "rectBecameVisible:", 0.0, 0.0, width, CGRectGetHeight(v15));
      [(WeekAllDayView *)self->_allDayView frame];
      double MaxY = CGRectGetMaxY(v16);
      [(UIScrollView *)self->_scrollView frame];
      double v8 = MaxY - CGRectGetMinY(v17);
      [(UIScrollView *)self->_scrollView contentOffset];
      double v10 = v8 + v9;
      [(UIScrollView *)self->_scrollView frame];
      content = self->_content;
      double v13 = v12 - v8;
      -[EKDayViewContent rectBecameVisible:](content, "rectBecameVisible:", 0.0, v10, width, v13);
    }
  }
}

- (id)dateForXOffset:(double)a3
{
  [(id)objc_opt_class() dayWidthForOrientation:self->_orientation withViewInViewHierarchy:self];
  uint64_t v6 = (uint64_t)(a3 / v5);
  if ((CalTimeDirectionIsLeftToRight() & 1) == 0)
  {
    unint64_t v7 = +[WeekView displayedDaysForOrientation:self->_orientation withViewInViewHierarchy:self];
    daysToDispladouble y = self->_daysToDisplay;
    if (v7 == 7) {
      uint64_t v6 = ~v6 + (int)daysToDisplay;
    }
    else {
      uint64_t v6 = ~v6
    }
         + (int)(daysToDisplay
               - +[WeekView displayedDaysForOrientation:self->_orientation withViewInViewHierarchy:self]);
  }
  double v9 = [(EKDayViewContent *)self->_content startDate];
  double v10 = [v9 calendarDateByAddingDays:v6];
  double v11 = [v10 allComponents];

  return v11;
}

- (void)setShowsTimeMarker:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(EKDayViewContent *)self->_content grid];
  [v5 setShowsTimeLine:v3];

  [(WeekView *)self _updateTimeMarkerTodayDay];
}

- (void)_updateTimeMarkerTodayDay
{
  BOOL v3 = [(EKDayViewContent *)self->_content grid];
  unsigned int v4 = [v3 showsTimeLine];

  if (v4)
  {
    double v5 = [(WeekView *)self weekStartDate];

    if (v5)
    {
      CUIKTodayDate();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      calendar = self->_calendar;
      unint64_t v7 = [(WeekView *)self weekStartDate];
      double v8 = [(NSCalendar *)calendar dateFromComponents:v7];

      double v9 = [(NSCalendar *)self->_calendar components:16 fromDate:v8 toDate:v15 options:0];
      id v10 = [(id)objc_opt_class() numMultiDays];
      if (-[WeekView containsDate:](self, "containsDate:", v15) && (uint64_t)[v9 day] <= (uint64_t)v10)
      {
        double v14 = (char *)[v9 day] + 1;
        double v11 = [(EKDayViewContent *)self->_content grid];
        double v12 = v11;
        uint64_t v13 = (uint64_t)v14;
      }
      else
      {
        double v11 = [(EKDayViewContent *)self->_content grid];
        double v12 = v11;
        uint64_t v13 = -1;
      }
      [v11 setTimeMarkerTodayDay:v13];
    }
    else
    {
      id v15 = [(EKDayViewContent *)self->_content grid];
      [v15 setTimeMarkerTodayDay:-1];
    }
  }
}

- (void)_updateHighlightedDay
{
  if (self->_highlightedDateComponents)
  {
    -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v3 = [(WeekView *)self weekStartDate];

    if (v3)
    {
      calendar = self->_calendar;
      double v5 = [(WeekView *)self weekStartDate];
      uint64_t v6 = [(NSCalendar *)calendar dateFromComponents:v5];

      unint64_t v7 = [(NSCalendar *)self->_calendar components:16 fromDate:v6 toDate:v16 options:0];
      [(NSCalendar *)self->_calendar rangeOfUnit:512 inUnit:0x2000 forDate:v6];
      uint64_t v9 = v8;
      if ([(WeekView *)self containsDate:v16]
        && ((unint64_t)[v7 day] & 0x8000000000000000) == 0
        && (uint64_t)[v7 day] <= v9)
      {
        int IsLeftToRight = CalTimeDirectionIsLeftToRight();
        double v14 = (char *)[v7 day];
        if (IsLeftToRight) {
          id v15 = v14 + 1;
        }
        else {
          id v15 = (char *)(v9 - (void)v14);
        }
        id v10 = [(EKDayViewContent *)self->_content grid];
        double v11 = v10;
        uint64_t v12 = (uint64_t)v15;
      }
      else
      {
        id v10 = [(EKDayViewContent *)self->_content grid];
        double v11 = v10;
        uint64_t v12 = -1;
      }
      [v10 setHighlightedDayIndex:v12];
    }
    else
    {
      uint64_t v6 = [(EKDayViewContent *)self->_content grid];
      [v6 setHighlightedDayIndex:-1];
    }
  }
  else
  {
    id v16 = [(EKDayViewContent *)self->_content grid];
    [v16 setHighlightedDayIndex:-1];
  }
}

- (BOOL)showsTimeMarker
{
  v2 = [(EKDayViewContent *)self->_content grid];
  unsigned __int8 v3 = [v2 showsTimeLine];

  return v3;
}

- (BOOL)hasAllDayEvents
{
  return [(WeekAllDayView *)self->_allDayView hasOccurrences];
}

- (void)loadDataAsyncWithCompletion:(id)a3 reverse:(BOOL)a4
{
  id v6 = a3;
  [(EKDayViewContent *)self->_content prepareForReuseIsReload:0];
  [(WeekAllDayView *)self->_allDayView prepareForReuse];
  reloadQueue = self->_reloadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006ED48;
  block[3] = &unk_1001D3518;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(reloadQueue, block);
}

- (void)reloadData
{
  id v12 = [(NSCalendar *)self->_calendar dateFromComponents:self->_weekStartDate];
  unsigned __int8 v3 = [(WeekView *)self lastSecondOfWeek];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  double v5 = [WeakRetained weekView:self allEventsForStartDate:v12 endDate:v3];

  if (v5)
  {
    id v6 = (CUIKOccurrencesCollection *)[v5 copy];
    events = self->_events;
    self->_events = v6;

    content = self->_content;
    uint64_t v9 = [v5 timedOccurrences];
    [(EKDayViewContent *)content setOccurrences:v9];

    [(WeekAllDayView *)self->_allDayView saveTemporaryViews];
    [(WeekAllDayView *)self->_allDayView prepareForReuse];
    allDayView = self->_allDayView;
    BOOL v11 = [v5 allDayOccurrences];
    [(WeekAllDayView *)allDayView setOccurrences:v11 animated:0];

    [(WeekAllDayView *)self->_allDayView clearTemporaryViews];
    [(WeekView *)self setNeedsLayout];
  }
}

- (double)_positionOfSecond:(int64_t)a3
{
  unsigned int v4 = [(EKDayViewContent *)self->_content grid];
  [v4 positionOfSecond:a3];
  double v6 = v5;

  return v6;
}

- (int)_secondAtPosition:(double)a3
{
  unsigned int v4 = [(EKDayViewContent *)self->_content grid];
  int v5 = [v4 secondAtPosition:a3];

  return v5;
}

- (int64_t)firstVisibleSecond
{
  [(UIScrollView *)self->_scrollView contentOffset];
  return [(WeekView *)self _secondAtPosition:v3];
}

- (void)setFirstVisibleSecond:(int64_t)a3
{
  if ([(WeekView *)self firstVisibleSecond] != a3)
  {
    [(WeekView *)self _positionOfSecond:a3];
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", 0.0, v5);
    [(WeekView *)self firstVisibleSecondChanged];
  }
  self->_int64_t selectedSecond = -1;
}

- (void)scrollToSecond:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  self->_int64_t selectedSecond = a3;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10006F458;
  v22[3] = &unk_1001D2F08;
  v22[4] = self;
  id v9 = v8;
  id v23 = v9;
  id v10 = objc_retainBlock(v22);
  [(WeekView *)self _positionOfSecond:a3];
  double v12 = v11;
  [(UIScrollView *)self->_scrollView bounds];
  double v14 = v13;
  [(EKDayViewContent *)self->_content bounds];
  double v16 = v15;
  [(UIScrollView *)self->_scrollView contentOffset];
  if (v12 > v17 + 20.0)
  {
    [(UIScrollView *)self->_scrollView contentOffset];
    if (v12 < v14 + v18 + -20.0) {
      goto LABEL_8;
    }
  }
  double v19 = fmax(v12 + v14 * -0.25, 0.0);
  double v20 = v16 - v14;
  if (v16 - v14 >= v19) {
    double v20 = v19;
  }
  if (!v5)
  {
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", 0.0, v20);
LABEL_8:
    ((void (*)(void *, uint64_t))v10[2])(v10, 1);
    goto LABEL_9;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10006F4C8;
  v21[3] = &unk_1001D2A18;
  v21[4] = self;
  v21[5] = 0;
  *(double *)&v21[6] = v20;
  +[UIView animateWithDuration:v21 animations:v10 completion:0.4];
LABEL_9:
}

- (BOOL)scrollTowardPoint:(CGPoint)a3
{
  double y = a3.y;
  self->_int64_t selectedSecond = -1;
  [(WeekAllDayView *)self->_allDayView frame];
  double v5 = CGRectGetMaxY(v28) + 5.0;
  [(UIScrollView *)self->_scrollView frame];
  double MaxY = CGRectGetMaxY(v29);
  [(UIScrollView *)self->_scrollView contentInset];
  if (y >= v5)
  {
    double v12 = MaxY - v7 + -50.0;
    if (y > v12)
    {
      [(UIScrollView *)self->_scrollView contentOffset];
      double v10 = v13;
      double v15 = v14;
      [(UIScrollView *)self->_scrollView bounds];
      double v17 = v15 + v16;
      [(UIScrollView *)self->_scrollView contentInset];
      double v19 = v17 - v18;
      [(UIScrollView *)self->_scrollView contentSize];
      if (v19 < v20)
      {
        double v21 = (y - v12) * 0.4 + v15;
        [(UIScrollView *)self->_scrollView contentSize];
        double v23 = v22;
        [(UIScrollView *)self->_scrollView contentInset];
        double v25 = v23 + v24;
        [(UIScrollView *)self->_scrollView bounds];
        double v11 = fmin(v21, v25 - v26);
        goto LABEL_7;
      }
    }
  }
  else
  {
    [(UIScrollView *)self->_scrollView contentOffset];
    if (v9 > 0.0)
    {
      double v10 = v8;
      double v11 = fmax(v9 + (v5 - y) * -0.4, 0.0);
LABEL_7:
      -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v10, v11);
      return 1;
    }
  }
  return 0;
}

- (BOOL)isEventFullyVisible:(id)a3
{
  id v4 = a3;
  double v5 = [(WeekView *)self occurrenceViewForEvent:v4 occurrenceDate:0];
  double v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  [v5 frame];
  double v8 = v7;
  if (![v4 isAllDay])
  {
    scrollView = self->_scrollView;
    [v6 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v18 = [v6 superview];
    -[UIScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", v18, v11, v13, v15, v17);

    [(UIScrollView *)self->_scrollView frame];
    double v19 = [v4 startDate];
    double v20 = [(WeekView *)self timeZone];
    double v21 = +[EKCalendarDate calendarDateWithDate:v19 timeZone:v20];

    -[WeekView _positionOfSecond:](self, "_positionOfSecond:", 3600 * [v21 hour]+ 60 * [v21 minute]+ [v21 second]);
    double v8 = v22;
  }
  [(UIScrollView *)self->_scrollView contentOffset];
  CGFloat v24 = v23;
  [(UIScrollView *)self->_scrollView bounds];
  CGFloat v26 = v25;
  [(UIScrollView *)self->_scrollView bounds];
  CGFloat height = v30.size.height;
  v30.origin.double x = 0.0;
  v30.origin.double y = v24;
  v30.size.double width = v26;
  if (v8 < CGRectGetMinY(v30)) {
    goto LABEL_7;
  }
  v31.origin.double x = 0.0;
  v31.origin.double y = v24;
  v31.size.double width = v26;
  v31.size.CGFloat height = height;
  if (v8 < CGRectGetMaxY(v31)) {
    BOOL v28 = 1;
  }
  else {
LABEL_7:
  }
    BOOL v28 = 0;

  return v28;
}

- (void)scrollToEvent:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)scrollToEvent:(id)a3 animateWithDuration:(double)a4 completion:(id)a5
{
  id v8 = a3;
  double v9 = (void (**)(id, uint64_t))a5;
  double v10 = [(WeekView *)self occurrenceViewForEvent:v8 occurrenceDate:0];
  double v11 = v10;
  if (v10)
  {
    [v10 frame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    if (([v8 isAllDay] & 1) == 0)
    {
      scrollView = self->_scrollView;
      [v11 frame];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      CGRect v29 = [v11 superview];
      -[UIScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", v29, v22, v24, v26, v28);
      double v13 = v30;
      double v17 = v31;
      double v19 = v32;

      [(UIScrollView *)self->_scrollView frame];
      if (v19 >= v33) {
        double v19 = v33;
      }
      v34 = [v8 startDate];
      v35 = [(WeekView *)self timeZone];
      v36 = +[EKCalendarDate calendarDateWithDate:v34 timeZone:v35];

      -[WeekView _positionOfSecond:](self, "_positionOfSecond:", 3600 * [v36 hour]+ 60 * [v36 minute]+ [v36 second]);
      double v15 = v37;
    }
    if (a4 <= 0.0)
    {
      -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 0, v13, v15, v17, v19);
      if (v9) {
        v9[2](v9, 1);
      }
    }
    else
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10006FAAC;
      v38[3] = &unk_1001D29C8;
      v38[4] = self;
      *(double *)&v38[5] = v13;
      *(double *)&v38[6] = v15;
      *(double *)&v38[7] = v17;
      *(double *)&v38[8] = v19;
      +[UIView animateWithDuration:v38 animations:v9 completion:a4];
    }
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }
  [(WeekView *)self firstVisibleSecondChanged];
}

- (void)setHourHeightScale:(double)a3
{
  if (self->_hourHeightScale != a3)
  {
    self->_hourHeightScale = a3;
    double v5 = [(EKDayViewContent *)self->_content grid];
    [v5 setGridHeightScale:a3];

    content = self->_content;
    [(EKDayViewContent *)content setNeedsLayout];
  }
}

- (NSArray)occurrenceViews
{
  v2 = [(WeekView *)self content];
  double v3 = [v2 occurrenceViews];

  return (NSArray *)v3;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_int64_t selectedSecond = -1;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 weekViewDidBeginDragging:self];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v23 = a3;
  [v23 contentOffset];
  double v5 = v4;
  if (v4 < 0.0)
  {
    char v6 = [(WeekView *)self _verticalGridExtensionImage];
    [(UIImageView *)self->_gridExtensionView setImage:v6];
    [(EKDayViewContent *)self->_content frame];
    double v8 = v7;
    [v6 size];
    -[UIImageView setFrame:](self->_gridExtensionView, "setFrame:", v8, v5, v9, -v5);
  }
  [v23 contentSize];
  double v11 = v10;
  [v23 bounds];
  double v13 = v5 - (v11 - v12);
  if (v13 > 0.0)
  {
    double v14 = [(WeekView *)self _verticalGridExtensionImage];
    [(UIImageView *)self->_gridExtensionView setImage:v14];
    [(EKDayViewContent *)self->_content frame];
    double v16 = v15;
    [v23 contentSize];
    double v18 = v17;
    [v14 size];
    -[UIImageView setFrame:](self->_gridExtensionView, "setFrame:", v16, v18, v19, v13);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    [v22 weekViewDidScroll:self];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  [(WeekView *)self firstVisibleSecondChanged];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 weekViewDidEndDragging:self willDecelerate:v4];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(WeekView *)self firstVisibleSecondChanged];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 weekViewDidEndDecelerating:self];
  }
}

- (void)firstVisibleSecondChanged
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    char v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 weekViewFirstVisibleSecondChanged:[self firstVisibleSecond]];
    }
  }
}

- (id)_verticalGridExtensionImage
{
  verticalGridExtensionImage = self->_verticalGridExtensionImage;
  if (!verticalGridExtensionImage)
  {
    BOOL v4 = +[UITraitCollection _currentTraitCollection];
    char v5 = [(WeekView *)self traitCollection];
    +[UITraitCollection _setCurrentTraitCollection:v5];

    daysToDispladouble y = (double)self->_daysToDisplay;
    [(id)objc_opt_class() dayWidthForOrientation:self->_orientation withViewInViewHierarchy:self];
    double v8 = v7 * daysToDisplay;
    id v9 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v8];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100070194;
    v14[3] = &unk_1001D3540;
    *(double *)&v14[5] = v8;
    v14[6] = 0x3FF0000000000000;
    v14[4] = self;
    double v10 = [v9 imageWithActions:v14];
    double v11 = self->_verticalGridExtensionImage;
    self->_verticalGridExtensionImage = v10;
    double v12 = v10;

    +[UITraitCollection _setCurrentTraitCollection:v4];
    verticalGridExtensionImage = self->_verticalGridExtensionImage;
  }

  return verticalGridExtensionImage;
}

- (void)updateMarkerPosition
{
  id v2 = [(EKDayViewContent *)self->_content grid];
  [v2 updateMarkerPosition];
}

- (void)dayViewContent:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5 dateSelected:(id)a6
{
  BOOL v7 = a5;
  id v13 = a4;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 weekView:self didSelectEvent:v13 userInitiated:v7 dateSelected:v9];
  }
}

- (void)dayViewContent:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 weekView:self didSelectEvents:v10 userInitiated:v5];
  }
}

- (void)dayViewContentDidLayout:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 weekViewOccurrenceLayoutDidChange:self];
  }
}

- (BOOL)dayViewContentShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v9 = [v8 weekViewShouldAnnotateAppEntities:self onDayStarting:v5];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)presentationControllerForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v3 = [WeakRetained presentationControllerForEditMenu];

  return v3;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v3 = [WeakRetained selectedEventsForEditMenu];

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

- (void)weekAllDayView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5 dateSelected:(id)a6
{
  BOOL v7 = a5;
  id v13 = a4;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 weekView:self didSelectEvent:v13 userInitiated:v7 dateSelected:v9];
  }
}

- (void)weekAllDayViewEmptySpaceClick:(id)a3 onDay:(double)a4
{
  -[WeekView dayViewContent:didTapInEmptySpaceOnDay:](self, "dayViewContent:didTapInEmptySpaceOnDay:", 0);
  char v6 = [(WeekView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(NSCalendar *)self->_calendar timeZone];
    id v10 = +[EKCalendarDate calendarDateWithAbsoluteTime:v8 timeZone:a4];

    id v9 = [(WeekView *)self delegate];
    [v9 weekView:self receivedTapInAllDayAreaOnDate:v10];
  }
}

- (void)weekAllDayViewDidScroll:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 weekViewAllDaySectionDidScroll:self];
  }
}

- (id)weekAllDayViewForTimeframeBefore:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  char v6 = WeakRetained;
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0) {
    goto LABEL_5;
  }
  id v9 = objc_loadWeakRetained((id *)p_delegate);
  id v10 = [v9 weekViewForWeekBefore:self];

  if (v10)
  {
    char v11 = [v10 allDayView];
  }
  else
  {
LABEL_5:
    char v11 = 0;
  }

  return v11;
}

- (id)weekAllDayViewForTimeframeAfter:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  char v6 = WeakRetained;
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0) {
    goto LABEL_5;
  }
  id v9 = objc_loadWeakRetained((id *)p_delegate);
  id v10 = [v9 weekViewForWeekAfter:self];

  if (v10)
  {
    char v11 = [v10 allDayView];
  }
  else
  {
LABEL_5:
    char v11 = 0;
  }

  return v11;
}

- (void)shouldAnnotateAppEntitiesChanged
{
  [(WeekAllDayView *)self->_allDayView shouldAnnotateAppEntitiesChanged];
  content = self->_content;

  [(EKDayViewContent *)content shouldAnnotateAppEntitiesChanged];
}

- (BOOL)weekAllDayViewShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v9 = [v8 weekViewShouldAnnotateAppEntities:self onDayStarting:v5];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)showOverlayMonthInCellAtOffset:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(WeekAllDayView *)self->_allDayView frame];
  double v7 = a3 - CGRectGetMinX(v10);
  allDayView = self->_allDayView;

  [(WeekAllDayView *)allDayView showOverlayMonthInCellAtOffset:v4 animated:v7];
}

- (BOOL)containsDate:(id)a3
{
  id v4 = a3;
  id v5 = [(EKDayViewContent *)self->_content startDate];
  [v5 absoluteTime];
  double v7 = v6;

  id v8 = [(EKDayViewContent *)self->_content lastDisplayedSecond];
  [v8 absoluteTime];
  double v10 = v9;

  [v4 timeIntervalSinceReferenceDate];
  if (v11 >= v7)
  {
    [v4 timeIntervalSinceReferenceDate];
    BOOL v12 = v13 <= v10;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (CGPoint)pointAtDate:(id)a3 isAllDay:(BOOL)a4
{
  BOOL v4 = a4;
  calendar = self->_calendar;
  id v7 = a3;
  id v8 = [(NSCalendar *)calendar timeZone];
  double v9 = +[EKCalendarDate calendarDateWithDate:v7 timeZone:v8];

  weekStartDate = self->_weekStartDate;
  double v11 = [(NSCalendar *)self->_calendar timeZone];
  BOOL v12 = +[EKCalendarDate calendarDateWithDateComponents:weekStartDate timeZone:v11];

  double v13 = [v9 day];
  uint64_t v14 = v13 - (unsigned char *)[v12 day];
  [v9 absoluteTime];
  double v16 = v15;
  [v12 absoluteTime];
  if (v16 > v17 && v14 < 0) {
    v14 += (uint64_t)[v12 daysInMonth];
  }
  [(id)objc_opt_class() dayWidthForOrientation:self->_orientation withViewInViewHierarchy:self];
  double v19 = v18;
  if (CalTimeDirectionIsLeftToRight())
  {
    double v20 = v19 * (double)v14;
  }
  else
  {
    double v21 = (double)(self->_daysToDisplay + ~v14);
    [(id)objc_opt_class() dayWidthForOrientation:self->_orientation withViewInViewHierarchy:self];
    double v20 = v22 * v21;
  }
  CalTimeDirectionIsLeftToRight();
  if (v4)
  {
    id v23 = [(WeekView *)self allDayView];
    [v23 firstEventYOffset];
    double v25 = v24;
  }
  else
  {
    [(UIScrollView *)self->_scrollView frame];
    double v27 = v26;
    [(UIScrollView *)self->_scrollView contentOffset];
    double v29 = v27 - v28;
    -[WeekView _positionOfSecond:](self, "_positionOfSecond:", 3600 * [v9 hour]+ 60 * [v9 minute]+ [v9 second]);
    double v25 = v29 + v30;
  }

  double v31 = v20 + 2.0;
  double v32 = v25;
  result.double y = v32;
  result.double x = v31;
  return result;
}

- (BOOL)isAnimatingScroll
{
  return self->_selectedSecond != -1;
}

- (void)addViewToScroller:(id)a3 isAllDay:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  double v6 = [v17 superview];
  scrollView = self->_scrollView;

  if (v6 != scrollView)
  {
    if (v4)
    {
      [(WeekAllDayView *)self->_allDayView addViewToScroller:v17];
    }
    else
    {
      id v8 = [v17 superview];
      [v17 frame];
      [v8 convertRect:self->_scrollView toView:];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;

      [(UIScrollView *)self->_scrollView addSubview:v17];
      [v17 setFrame:v10, v12, v14, v16];
    }
  }
}

- (BOOL)scrollerIsParentOfView:(id)a3 isAllDay:(BOOL)a4
{
  if (a4)
  {
    allDayView = self->_allDayView;
    return [(WeekAllDayView *)allDayView scrollerIsParentOfView:a3];
  }
  else
  {
    scrollView = self->_scrollView;
    double v6 = [a3 superview];
    LOBYTE(scrollView) = scrollView == v6;

    return (char)scrollView;
  }
}

- (void)setScrollerContentOffset:(CGPoint)a3
{
  self->_int64_t selectedSecond = -1;
  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", a3.x, a3.y);
}

- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EKDayViewContent *)self->_content occurrenceViewForEvent:v6];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(WeekAllDayView *)self->_allDayView occurrenceViewForEvent:v6 occurrenceDate:v7];
  }
  double v11 = v10;

  return v11;
}

- (double)yPositionPerhapsMatchingAllDayOccurrence:(id)a3 atPoint:(CGPoint)a4
{
  double x = a4.x;
  id v6 = a3;
  id v7 = [(WeekView *)self dateForXOffset:x];
  id v8 = [v6 timeZone];
  double v9 = +[EKCalendarDate calendarDateWithDateComponents:v7 timeZone:v8];

  id v10 = [(WeekAllDayView *)self->_allDayView occurrenceViewForEvent:v6 occurrenceDate:v9];

  if (v10)
  {
    [(WeekAllDayView *)v10 bounds];
    double v13 = self;
    allDayView = v10;
  }
  else
  {
    [(WeekAllDayView *)self->_allDayView nextAvailableOccurrenceViewYOriginForDay:v9];
    double v12 = v15;
    allDayView = self->_allDayView;
    double v11 = 0.0;
    double v13 = self;
  }
  -[WeekView convertPoint:fromView:](v13, "convertPoint:fromView:", allDayView, v11, v12);
  double v17 = v16;

  return v17;
}

- (void)dayViewContent:(id)a3 didTapInEmptySpaceOnDay:(double)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(NSCalendar *)self->_calendar timeZone];
    id v11 = +[EKCalendarDate calendarDateWithAbsoluteTime:v9 timeZone:a4];

    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 emptySpaceClickedOnDate:v11];
  }
}

- (void)dayViewContent:(id)a3 didTapPinnedOccurrence:(id)a4
{
  id v5 = a4;
  id v6 = [v5 startCalendarDate];
  [v6 absoluteTime];
  double v8 = v7;
  double v9 = [v5 startCalendarDate];

  id v10 = [v9 calendarDateForDay];
  [v10 absoluteTime];
  int v12 = (int)(v8 - v11);

  [(WeekView *)self scrollToSecond:v12 animated:1 completion:0];
}

- (WeekViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (WeekViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (WeekViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WeekViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDateComponents)weekStartDate
{
  return self->_weekStartDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)hourHeightScale
{
  return self->_hourHeightScale;
}

- (WeekAllDayView)allDayView
{
  return self->_allDayView;
}

- (EKDayViewContent)content
{
  return self->_content;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_weekStartDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_highlightedDateComponents, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_verticalGridExtensionImage, 0);
  objc_storeStrong((id *)&self->_gridExtensionView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_allDayView, 0);

  objc_destroyWeak((id *)&self->_targetWindow);
}

@end