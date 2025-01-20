@interface YearViewController
- (BOOL)_containsPreciseTouch:(id)a3;
- (BOOL)_isTodayCircleFrameFullyUnobstructed;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)handlesNotifyOnExtendedLaunchCompletion;
- (BOOL)shouldAnimateScrollToDate:(id)a3 fromClosestDate:(id)a4;
- (BOOL)shouldAnimateTransitionsToMonthView;
- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible;
- (BOOL)shouldUpdatePreferredReloadDates;
- (CGPoint)monthHeaderLocationForCalendarDate:(id)a3;
- (CGRect)frameForTodayHighlight;
- (CGRect)monthFrameForCalendarDate:(id)a3 adjustHeightUp:(BOOL)a4;
- (Class)monthViewControllerClass;
- (Class)multipleMonthViewClass;
- (NextLevelMainViewControllerContainerPushDelegate)pushDelegate;
- (YearViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5;
- (double)heightForSubviewWithCalendarDate:(id)a3;
- (double)topInsetForSubviewWithCalendarDate:(id)a3;
- (id)_flooredCalendarDateForCalendarDate:(id)a3;
- (id)_viewForCalendarDate:(id)a3;
- (id)bestDateForNewEvent;
- (id)calendarDateForSubviewAboveSubviewWithCalendarDate:(id)a3;
- (id)calendarDateForSubviewBelowSubviewWithCalendarDate:(id)a3;
- (id)createInitialViewForDate:(id)a3;
- (id)futureMajorBoundaryCalendarDateForCalendarDate:(id)a3;
- (id)monthViewForCalendarDate:(id)a3;
- (id)newBottomViewBelowViewWithCalendarDate:(id)a3;
- (id)newTopViewAboveViewWithCalendarDate:(id)a3;
- (id)pastMajorBoundaryCalendarDateForCalendarDate:(id)a3;
- (id)pushedMonthViewControllerWithDate:(id)a3 animated:(BOOL)a4;
- (id)sceneTitle;
- (id)testingRotationDidEndNotificationName;
- (id)testingRotationWillStartNotificationName;
- (id)title;
- (int64_t)intendedSizeClass;
- (unint64_t)maximumCachedReusableViews;
- (unint64_t)monthsPerRow;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)_fadePressHighlightViewToAlpha:(double)a3 duration:(double)a4 completion:(id)a5;
- (void)_hidePressHighlightWithFadeDuration:(double)a3;
- (void)_localeChanged:(id)a3;
- (void)_pushMonthViewControllerWithDate:(id)a3 animated:(BOOL)a4;
- (void)_reloadAllViews;
- (void)_reloadAllViewsForContentSizeCategoryChange;
- (void)_reloadAllViewsWithDate:(id)a3;
- (void)_selectedDateChanged;
- (void)_showPressHighlightWithFadeDuration:(double)a3;
- (void)_significantTimeChanged:(id)a3;
- (void)_timeZoneChanged:(id)a3;
- (void)_updateBackButtonToSelectedDate;
- (void)_viewLongPressed:(id)a3;
- (void)_viewTapped:(id)a3;
- (void)didEndScrolling;
- (void)disableGestureRecognizers;
- (void)enableGestureRecognizers;
- (void)invalidateBackButtonDate;
- (void)pushContentViewOfType:(int64_t)a3 date:(id)a4 animated:(BOOL)a5;
- (void)receivedTapAtLocation:(CGPoint)a3 usingDate:(id)a4 precise:(BOOL)a5;
- (void)selectDate:(id)a3 animated:(BOOL)a4;
- (void)setPushDelegate:(id)a3;
- (void)showDate:(id)a3 animated:(BOOL)a4;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)transitionToSizeDidEnd;
- (void)updateBackButtonToDate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4;
@end

@implementation YearViewController

- (YearViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)YearViewController;
  v11 = [(InfiniteScrollViewController *)&v21 initWithCalendarDate:v8 model:v9 window:v10];
  if (v11)
  {
    v12 = +[NSNotificationCenter defaultCenter];
    uint64_t v13 = CUIKCalendarModelSignificantTimeChangeNotification;
    v14 = [(MainViewController *)v11 model];
    [v12 addObserver:v11 selector:"_significantTimeChanged:" name:v13 object:v14];

    [v12 addObserver:v11 selector:"_timeZoneChanged:" name:CUIKCalendarModelTimeZoneChangedNotification object:0];
    [v12 addObserver:v11 selector:"_localeChanged:" name:CUIKLocaleChangedNotification object:0];
    [v12 addObserver:v11 selector:"_contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
    [(YearViewController *)v11 updateBackButtonToDate:v8];
    uint64_t v15 = objc_opt_new();
    overlaySignificantDatesProvider = v11->_overlaySignificantDatesProvider;
    v11->_overlaySignificantDatesProvider = (EKUIOverlayCalendarSignificantDatesProvider *)v15;

    objc_initWeak(&location, v11);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000F9D80;
    v18[3] = &unk_1001D5438;
    objc_copyWeak(&v19, &location);
    [(EKUIOverlayCalendarSignificantDatesProvider *)v11->_overlaySignificantDatesProvider setSignificantDatesChangedHandler:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v11;
}

- (void)updateBackButtonToDate:(id)a3
{
  id v4 = a3;
  id v9 = [(YearViewController *)self parentViewController];
  v5 = [v9 navigationItem];
  v6 = [v4 date];
  v7 = CUIKStringForYear();
  [v5 setBackButtonTitle:v7];

  backButtonDate = self->_backButtonDate;
  self->_backButtonDate = (EKCalendarDate *)v4;
}

- (void)setPushDelegate:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)YearViewController;
  -[InfiniteScrollViewController viewWillAppear:](&v7, "viewWillAppear:");
  if (!a3)
  {
    v5 = [(YearViewController *)self view];
    [v5 setHidden:0];
  }
  if (self->_requiresReload) {
    [(YearViewController *)self _reloadAllViewsForContentSizeCategoryChange];
  }
  v6 = [(YearViewController *)self navigationItem];
  [v6 setTitle:&stru_1001D6918];

  [(InfiniteScrollViewController *)self showSelectedDateIfNeeded];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)YearViewController;
  [(InfiniteScrollViewController *)&v6 viewDidAppear:a3];
  id v4 = [(MainViewController *)self model];
  [v4 startNotificationMonitor];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F9FA4;
  block[3] = &unk_1001D2740;
  block[4] = self;
  if (qword_1002169C0 != -1) {
    dispatch_once(&qword_1002169C0, block);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)YearViewController;
  [(InfiniteScrollViewController *)&v4 viewWillDisappear:a3];
  [(YearViewController *)self _hidePressHighlightWithFadeDuration:0.0];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)YearViewController;
  [(InfiniteScrollViewController *)&v9 viewDidLoad];
  v3 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_viewTapped:"];
  tapRecognizer = self->_tapRecognizer;
  self->_tapRecognizer = v3;

  v5 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_viewLongPressed:"];
  longPressRecognizer = self->_longPressRecognizer;
  self->_longPressRecognizer = v5;

  [(UILongPressGestureRecognizer *)self->_longPressRecognizer setMinimumPressDuration:0.1];
  [(UILongPressGestureRecognizer *)self->_longPressRecognizer setAllowableMovement:0.0];
  [(UILongPressGestureRecognizer *)self->_longPressRecognizer setDelegate:self];
  objc_super v7 = [(YearViewController *)self view];
  [v7 addGestureRecognizer:self->_tapRecognizer];

  id v8 = [(YearViewController *)self view];
  [v8 addGestureRecognizer:self->_longPressRecognizer];
}

- (id)title
{
  return &stru_1001D6918;
}

- (unint64_t)maximumCachedReusableViews
{
  return 10;
}

- (BOOL)shouldAnimateScrollToDate:(id)a3 fromClosestDate:(id)a4
{
  uint64_t v4 = (uint64_t)[a3 differenceInMonths:a4];
  if (v4 >= 0) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = -v4;
  }
  return v5 < 0x31;
}

- (id)createInitialViewForDate:(id)a3
{
  uint64_t v4 = [(YearViewController *)self _flooredCalendarDateForCalendarDate:a3];
  unint64_t v5 = [(YearViewController *)self _viewForCalendarDate:v4];

  return v5;
}

- (id)newTopViewAboveViewWithCalendarDate:(id)a3
{
  uint64_t v4 = [(YearViewController *)self calendarDateForSubviewAboveSubviewWithCalendarDate:a3];
  unint64_t v5 = [(YearViewController *)self _viewForCalendarDate:v4];

  return v5;
}

- (id)newBottomViewBelowViewWithCalendarDate:(id)a3
{
  uint64_t v4 = [(YearViewController *)self calendarDateForSubviewBelowSubviewWithCalendarDate:a3];
  unint64_t v5 = [(YearViewController *)self _viewForCalendarDate:v4];

  return v5;
}

- (id)calendarDateForSubviewAboveSubviewWithCalendarDate:(id)a3
{
  uint64_t v4 = [(YearViewController *)self _flooredCalendarDateForCalendarDate:a3];
  unint64_t v5 = [v4 calendarDateByAddingMonths:-[YearViewController monthsPerRow](self, "monthsPerRow")];

  return v5;
}

- (id)calendarDateForSubviewBelowSubviewWithCalendarDate:(id)a3
{
  uint64_t v4 = [(YearViewController *)self _flooredCalendarDateForCalendarDate:a3];
  unint64_t v5 = [v4 calendarDateByAddingMonths:-[YearViewController monthsPerRow](self, "monthsPerRow")];

  return v5;
}

- (double)heightForSubviewWithCalendarDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MainViewController *)self window];
  if (v5)
  {
    objc_super v6 = [(MainViewController *)self window];
    [v6 mainContentSize];
  }
  else
  {
    objc_super v6 = [(YearViewController *)self view];
    EKUICurrentWindowSize();
  }
  double v9 = v7;
  double v10 = v8;

  v11 = [(YearViewController *)self multipleMonthViewClass];
  v12 = [(YearViewController *)self view];
  uint64_t v13 = EKUIHeightSizeClassForViewHierarchy();
  v14 = [(YearViewController *)self view];
  -[objc_class heightForViewWithCalendarDate:windowSize:heightSizeClass:orientation:](v11, "heightForViewWithCalendarDate:windowSize:heightSizeClass:orientation:", v4, v13, EKUIInterfaceOrientationForViewHierarchy(), v9, v10);
  double v16 = v15;

  return v16;
}

- (double)topInsetForSubviewWithCalendarDate:(id)a3
{
  v3 = [(YearViewController *)self multipleMonthViewClass];

  [(objc_class *)v3 topInset];
  return result;
}

- (void)showDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(MainViewController *)self model];
  double v8 = [v7 calendar];
  double v9 = [v8 timeZone];
  double v10 = +[EKCalendarDate calendarDateWithDate:v6 timeZone:v9];

  v11 = [v10 calendarDateForYear];
  v12 = [(YearViewController *)self traitCollection];
  LODWORD(v8) = EKUIUsesLargeTextYearView();

  if (v8)
  {
    id v13 = v10;

    v11 = v13;
  }
  [(YearViewController *)self _hidePressHighlightWithFadeDuration:0.0];
  v14 = [v11 date];
  v15.receiver = self;
  v15.super_class = (Class)YearViewController;
  [(InfiniteScrollViewController *)&v15 showDate:v14 animated:v4];
}

- (void)willEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  id v6 = [(InfiniteScrollViewController *)self scrollView];
  [v6 contentOffset];
  double v8 = v7;

  double y = a4->y;
  double v10 = [(YearViewController *)self view];
  [v10 bounds];
  CGFloat v11 = CGRectGetHeight(v25) * 0.7;

  if (vabdd_f64(y, v8) > v11)
  {
    -[InfiniteScrollViewController nearestMajorBoundaryForPoint:](self, "nearestMajorBoundaryForPoint:", a4->x, a4->y);
    CGFloat x = v13;
    CGFloat v15 = v12;
    if (y <= v8)
    {
      if (v12 <= v8)
      {
        double v16 = (void *)kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          v17 = v16;
          v18 = (objc_class *)objc_opt_class();
          id v19 = NSStringFromClass(v18);
          v20 = NSStringFromCGPoint(*a4);
          int v21 = 138412546;
          v22 = v19;
          __int16 v23 = 2112;
          v24 = v20;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Major boundary settling triggered in [%@].  Will settle on offset: [%@]", (uint8_t *)&v21, 0x16u);
        }
        goto LABEL_9;
      }
    }
    else if (v12 >= v8)
    {
      goto LABEL_9;
    }
    CGFloat x = a4->x;
    CGFloat v15 = a4->y;
LABEL_9:
    a4->CGFloat x = x;
    a4->double y = v15;
  }
}

- (id)pastMajorBoundaryCalendarDateForCalendarDate:(id)a3
{
  return [a3 calendarDateForYear];
}

- (id)futureMajorBoundaryCalendarDateForCalendarDate:(id)a3
{
  v3 = [(YearViewController *)self pastMajorBoundaryCalendarDateForCalendarDate:a3];
  BOOL v4 = [v3 calendarDateByAddingYears:1];

  return v4;
}

- (void)didEndScrolling
{
  v3.receiver = self;
  v3.super_class = (Class)YearViewController;
  [(InfiniteScrollViewController *)&v3 didEndScrolling];
  [(MainViewController *)self setSceneTitleNeedsUpdate];
}

- (BOOL)shouldUpdatePreferredReloadDates
{
  return 0;
}

- (void)enableGestureRecognizers
{
  objc_super v3 = [(YearViewController *)self view];
  [v3 addGestureRecognizer:self->_tapRecognizer];

  id v4 = [(YearViewController *)self view];
  [v4 addGestureRecognizer:self->_longPressRecognizer];
}

- (void)disableGestureRecognizers
{
  objc_super v3 = [(YearViewController *)self view];
  [v3 removeGestureRecognizer:self->_tapRecognizer];

  id v4 = [(YearViewController *)self view];
  [v4 removeGestureRecognizer:self->_longPressRecognizer];
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 1;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 1;
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(MainViewController *)self model];
  [v7 setSelectedDate:v6];

  id v8 = [v6 date];

  [(YearViewController *)self showDate:v8 animated:v4];
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  return 1;
}

- (BOOL)_isTodayCircleFrameFullyUnobstructed
{
  [(InfiniteScrollViewController *)self unobstructedScrollViewHeight];
  uint64_t v4 = v3;
  unint64_t v5 = [(InfiniteScrollViewController *)self scrollView];
  [v5 safeAreaInsets];
  uint64_t v7 = v6;
  id v8 = [(InfiniteScrollViewController *)self scrollView];
  [v8 bounds];
  CGFloat Width = CGRectGetWidth(v24);

  [(YearViewController *)self frameForTodayHighlight];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat v12 = v25.size.width;
  CGFloat height = v25.size.height;
  if (CGRectIsNull(v25)) {
    return 0;
  }
  uint64_t v15 = 0;
  uint64_t v16 = v7;
  CGFloat v17 = Width;
  uint64_t v18 = v4;
  CGFloat v19 = x;
  CGFloat v20 = y;
  CGFloat v21 = v12;
  CGFloat v22 = height;

  return CGRectContainsRect(*(CGRect *)&v15, *(CGRect *)&v19);
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    CGFloat v12 = [v10 startCalendarDate];
    double v13 = [(YearViewController *)self pushedMonthViewControllerWithDate:v12 animated:0];

    [v13 showEvent:v10 animated:v8 showMode:a5 context:v11];
  }
  else
  {
    v14 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No event given.  Will not show event through Year View.", v15, 2u);
    }
  }
}

- (id)bestDateForNewEvent
{
  uint64_t v3 = CUIKTodayDate();
  uint64_t v4 = [(MainViewController *)self model];
  unint64_t v5 = [v4 eventStore];
  uint64_t v6 = [v5 timeZone];
  uint64_t v7 = +[EKCalendarDate calendarDateWithDate:v3 timeZone:v6];

  [(YearViewController *)self frameForTodayHighlight];
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  LOBYTE(v3) = CGRectIsNull(v24);
  CGFloat v12 = [(InfiniteScrollViewController *)self scrollView];
  [v12 contentInset];
  double v14 = v13;

  uint64_t v15 = [(YearViewController *)self view];
  [v15 bounds];
  double v16 = CGRectGetHeight(v25);
  CGFloat v17 = [(InfiniteScrollViewController *)self scrollView];
  [v17 contentInset];
  double v19 = v18;

  if (v3) {
    goto LABEL_4;
  }
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  if (CGRectGetMinY(v26) > v16 - v19
    || (v27.origin.x = x, v27.origin.CGFloat y = y, v27.size.width = width, v27.size.height = height, CGRectGetMaxY(v27) < v14))
  {
LABEL_4:
    CGFloat v20 = [(InfiniteScrollViewController *)self dateOfCenterViewInBuffer];
    id v21 = [v20 calendarDateForYear];
  }
  else
  {
    id v21 = v7;
  }

  return v21;
}

- (BOOL)handlesNotifyOnExtendedLaunchCompletion
{
  return 1;
}

- (id)testingRotationWillStartNotificationName
{
  return @"YearViewController_RotationAnimationStartedNotification";
}

- (id)testingRotationDidEndNotificationName
{
  return @"YearViewController_RotationAnimationCompletedNotification";
}

- (id)sceneTitle
{
  v2 = [(MainViewController *)self model];
  uint64_t v3 = [v2 selectedDay];
  uint64_t v4 = [v3 date];

  if (v4)
  {
    unint64_t v5 = CUIKStringForYear();
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)transitionToSizeDidEnd
{
  v8.receiver = self;
  v8.super_class = (Class)YearViewController;
  [(MainViewController *)&v8 transitionToSizeDidEnd];
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000FAE60;
  v3[3] = &unk_1001D5460;
  v3[4] = &v4;
  v3[5] = [(YearViewController *)self monthsPerRow];
  [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v3];
  if (*((unsigned char *)v5 + 24)) {
    [(YearViewController *)self _reloadAllViews];
  }
  _Block_object_dispose(&v4, 8);
}

- (void)_selectedDateChanged
{
  uint64_t v3 = [(YearViewController *)self navigationController];
  id v9 = [v3 viewControllers];

  uint64_t v4 = (char *)[v9 count];
  BOOL v5 = (unint64_t)v4 >= 2;
  uint64_t v6 = v4 - 2;
  char v7 = v9;
  if (v5)
  {
    objc_super v8 = [v9 objectAtIndex:v6];
    if (v8 == self) {
      [(YearViewController *)self _updateBackButtonToSelectedDate];
    }

    char v7 = v9;
  }
}

- (void)_significantTimeChanged:(id)a3
{
}

- (void)_timeZoneChanged:(id)a3
{
  id v4 = [(MainViewController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();
  [(YearViewController *)self _reloadAllViews];
  [(YearViewController *)self timeZoneDidChange];
  [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:&stru_1001D54A0];
  EKUIPopFallbackSizingContextWithViewHierarchy();
}

- (void)_localeChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FB03C;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  +[EKUILargeTextUtilities clearCache];
  id v7 = [(MainViewController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();
  id v4 = [(YearViewController *)self view];
  BOOL v5 = [v4 window];
  if (v5)
  {

LABEL_4:
    [(YearViewController *)self _reloadAllViewsForContentSizeCategoryChange];
    goto LABEL_6;
  }
  char v6 = EKUIHasFallbackSizingContext();

  if (v6) {
    goto LABEL_4;
  }
  self->_requiresReload = 1;
LABEL_6:
  EKUIPopFallbackSizingContextWithViewHierarchy();
}

- (void)_reloadAllViewsForContentSizeCategoryChange
{
  uint64_t v3 = [(InfiniteScrollViewController *)self firstViewOnScreen];
  id v4 = [v3 calendarDate];

  if (v4) {
    [(YearViewController *)self _reloadAllViewsWithDate:v4];
  }
  else {
    [(YearViewController *)self _reloadAllViews];
  }
}

- (void)_reloadAllViews
{
  id v3 = [(InfiniteScrollViewController *)self dateOfCenterViewInBuffer];
  [(YearViewController *)self _reloadAllViewsWithDate:v3];
}

- (void)_reloadAllViewsWithDate:(id)a3
{
  id v4 = a3;
  [(YearViewController *)self _updateBackButtonToSelectedDate];
  BOOL v5 = [(MainViewController *)self model];
  char v6 = [v5 calendar];
  id v7 = [v6 timeZone];
  id v8 = [v4 calendarDateInTimeZone:v7];

  [(InfiniteScrollViewController *)self reinitializeAllViewsWithCalendarDate:v8];
}

- (void)_viewTapped:(id)a3
{
  id v19 = a3;
  id v4 = [(YearViewController *)self view];
  [v19 locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  id v9 = -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", v6, v8);
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      id v11 = [(YearViewController *)self view];
      [v10 convertPoint:v11 fromView:v6];
      double v13 = v12;
      double v15 = v14;

      double v16 = [v10 startOfMonthForPoint:v13, v15];
      if (v16)
      {
        CGFloat v17 = [v19 touches];
        BOOL v18 = [(YearViewController *)self _containsPreciseTouch:v17];

        -[YearViewController receivedTapAtLocation:usingDate:precise:](self, "receivedTapAtLocation:usingDate:precise:", v16, v18, v6, v8);
      }
    }
  }
}

- (BOOL)_containsPreciseTouch:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "type", (void)v8) == (id)1)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (void)receivedTapAtLocation:(CGPoint)a3 usingDate:(id)a4 precise:(BOOL)a5
{
  id v6 = a4;
  [(YearViewController *)self _pushMonthViewControllerWithDate:v6 animated:[(YearViewController *)self shouldAnimateTransitionsToMonthView]];
}

- (void)_pushMonthViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [(YearViewController *)self _updateBackButtonToSelectedDate];
  id v6 = [(YearViewController *)self pushedMonthViewControllerWithDate:v7 animated:v4];
}

- (void)_fadePressHighlightViewToAlpha:(double)a3 duration:(double)a4 completion:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000FB6B8;
  v5[3] = &unk_1001D2A40;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  +[UIView animateWithDuration:327684 delay:v5 options:a5 animations:a4 completion:0.0];
}

- (void)_showPressHighlightWithFadeDuration:(double)a3
{
}

- (void)_hidePressHighlightWithFadeDuration:(double)a3
{
}

- (BOOL)shouldAnimateTransitionsToMonthView
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = (UILongPressGestureRecognizer *)a3;
  id v7 = a4;
  long long v8 = v7;
  BOOL v9 = self->_longPressRecognizer != v6 || [v7 type] != (id)1;

  return v9;
}

- (void)_viewLongPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(YearViewController *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  long long v10 = -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", v7, v9);
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      double v12 = [(YearViewController *)self view];
      [v11 convertPoint:v12 fromView:v7];
      double v14 = v13;
      double v16 = v15;

      CGFloat v17 = [v11 startOfMonthForPoint:v14, v16];
      if (!v17)
      {
        [(YearViewController *)self _hidePressHighlightWithFadeDuration:0.2];
LABEL_18:

        goto LABEL_19;
      }
      BOOL v18 = [v11 monthViewForCalendarDate:v17];
      if (!self->_pressHighlight)
      {
        id v19 = (UIView *)objc_opt_new();
        pressHighlight = self->_pressHighlight;
        self->_pressHighlight = v19;

        [(UIView *)self->_pressHighlight setAlpha:0.0];
        [(UIView *)self->_pressHighlight setUserInteractionEnabled:0];
        id v21 = [(YearViewController *)self view];
        [v21 addSubview:self->_pressHighlight];

        CGFloat v22 = [(YearViewController *)self view];
        [v22 bringSubviewToFront:self->_pressHighlight];
      }
      __int16 v23 = [v11 traitCollection];
      +[UITraitCollection _setCurrentTraitCollection:v23];

      CGRect v24 = +[UIColor systemBackgroundColor];
      CGRect v25 = [v24 colorWithAlphaComponent:0.8];
      [(UIView *)self->_pressHighlight setBackgroundColor:v25];

      id v26 = [v4 state];
      if (v26 == (id)3)
      {
        v32 = [(YearViewController *)self view];
        [v18 bounds];
        [v32 convertRect:v18 fromView:];
        [(UIView *)self->_pressHighlight frame];
        int IsRectEffectivelyEqualToRect = CalIsRectEffectivelyEqualToRect();

        if (IsRectEffectivelyEqualToRect)
        {
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_1000FBBC8;
          v34[3] = &unk_1001D3188;
          v34[4] = self;
          id v35 = v17;
          [(YearViewController *)self _fadePressHighlightViewToAlpha:v34 duration:0.0 completion:0.1];
        }
        goto LABEL_17;
      }
      if (v26 == (id)2)
      {
        v28 = [(YearViewController *)self view];
        [v18 bounds];
        [v28 convertRect:v18 fromView:];
        [(UIView *)self->_pressHighlight frame];
        char v29 = CalIsRectEffectivelyEqualToRect();

        if ((v29 & 1) == 0)
        {
          [(YearViewController *)self _hidePressHighlightWithFadeDuration:0.2];
          goto LABEL_17;
        }
        v30 = [(YearViewController *)self view];
        [v18 bounds];
        [v30 convertRect:v18 fromView:];
        [(UIView *)self->_pressHighlight frame];
        int v31 = CalIsRectEffectivelyEqualToRect();

        if (v31) {
          goto LABEL_13;
        }
      }
      else if (v26 == (id)1)
      {
        CGRect v27 = [(YearViewController *)self view];
        [v18 bounds];
        [v27 convertRect:v18 fromView:];
        -[UIView setFrame:](self->_pressHighlight, "setFrame:");

LABEL_13:
        [(YearViewController *)self _showPressHighlightWithFadeDuration:0.2];
      }
LABEL_17:

      goto LABEL_18;
    }
  }
LABEL_19:
}

- (id)pushedMonthViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_pushDelegate = &self->_pushDelegate;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushDelegate);
  double v8 = [WeakRetained pushNextLevelMainViewControllerContainerWithDate:v6 animated:v4];

  return v8;
}

- (void)pushContentViewOfType:(int64_t)a3 date:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  p_pushDelegate = &self->_pushDelegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushDelegate);
  [WeakRetained pushContentViewOfType:a3 date:v8 animated:v5];
}

- (CGRect)frameForTodayHighlight
{
  id v3 = CUIKTodayDate();
  BOOL v4 = [(MainViewController *)self model];
  BOOL v5 = [v4 eventStore];
  id v6 = [v5 timeZone];
  double v7 = +[EKCalendarDate calendarDateWithDate:v3 timeZone:v6];
  id v8 = [(YearViewController *)self monthViewForCalendarDate:v7];

  if (v8)
  {
    [v8 frameForTodayHighlight];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    CGFloat v17 = [(YearViewController *)self view];
    [v17 convertRect:v8 fromView:v10];
    CGFloat x = v18;
    CGFloat y = v20;
    CGFloat width = v22;
    CGFloat height = v24;
  }
  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }

  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (CGRect)monthFrameForCalendarDate:(id)a3 adjustHeightUp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(YearViewController *)self monthViewForCalendarDate:a3];
  [v6 frameForGridOfDays:v4];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(YearViewController *)self view];
  [v15 convertRect:v6 fromView:v8 toView:v10];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (CGPoint)monthHeaderLocationForCalendarDate:(id)a3
{
  BOOL v4 = [(YearViewController *)self monthViewForCalendarDate:a3];
  [v4 headerOrigin];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(YearViewController *)self view];
  [v9 convertPoint:v4 fromView:v6];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.CGFloat y = v15;
  result.CGFloat x = v14;
  return result;
}

- (id)monthViewForCalendarDate:(id)a3
{
  id v4 = a3;
  double v5 = [(InfiniteScrollViewController *)self subviewForDate:v4];
  [v5 layoutIfNeeded];
  double v6 = [v5 monthViewForCalendarDate:v4];

  return v6;
}

- (void)_updateBackButtonToSelectedDate
{
  id v3 = [(MainViewController *)self model];
  id v4 = [v3 selectedDate];

  if (v4)
  {
    [(YearViewController *)self updateBackButtonToDate:v4];
  }
  else
  {
    double v5 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "No selected date.  Will not update back back title.", v6, 2u);
    }
  }
}

- (void)invalidateBackButtonDate
{
  self->_backButtonDate = 0;
  _objc_release_x1();
}

- (id)_flooredCalendarDateForCalendarDate:(id)a3
{
  id v4 = [a3 calendarDateForMonth];
  double v5 = [v4 date];
  double v6 = [(MainViewController *)self model];
  double v7 = [v6 calendar];
  id v8 = [v7 ordinalityOfUnit:8 inUnit:4 forDate:v5];

  unint64_t v9 = [(YearViewController *)self monthsPerRow];
  double v10 = [v4 calendarDateByAddingMonths:(int)(1 - (v8 + v9) + ((unint64_t)v8 + v9 - 1) / v9 * v9)];

  return v10;
}

- (id)_viewForCalendarDate:(id)a3
{
  id v4 = a3;
  double v5 = [(MainViewController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();
  double v6 = [(InfiniteScrollViewController *)self dequeueReusableView];
  if (v6)
  {
    id v7 = v6;
    [v6 setCalendarDate:v4];
  }
  else
  {
    id v8 = [(MainViewController *)self model];
    unint64_t v9 = [v8 calendar];

    id v7 = [objc_alloc([self multipleMonthViewClass]) initWithCalendarDate:v4 calendar:v9 maximumNumberOfMonths:[self monthsPerRow]];
    [v7 setOverlaySignificantDatesProvider:self->_overlaySignificantDatesProvider];
  }
  EKUIPopFallbackSizingContextWithViewHierarchy();

  return v7;
}

- (NextLevelMainViewControllerContainerPushDelegate)pushDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pushDelegate);

  return (NextLevelMainViewControllerContainerPushDelegate *)WeakRetained;
}

- (Class)monthViewControllerClass
{
  return self->_monthViewControllerClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthViewControllerClass, 0);
  objc_destroyWeak((id *)&self->_pushDelegate);
  objc_storeStrong((id *)&self->_overlaySignificantDatesProvider, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_backButtonDate, 0);

  objc_storeStrong((id *)&self->_pressHighlight, 0);
}

- (int64_t)intendedSizeClass
{
  return 0;
}

- (Class)multipleMonthViewClass
{
  return 0;
}

- (unint64_t)monthsPerRow
{
  return 1;
}

@end