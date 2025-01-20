@interface MonthViewController
- (BOOL)_isTodayCircleFrameFullyUnobstructed;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)dragAndDropAllowLongPress;
- (BOOL)dragAndDropIsCurrentlyScrubbing;
- (BOOL)eventGestureControllerShouldAllowLongPress:(id)a3;
- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons;
- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4;
- (BOOL)scaleForDragging;
- (BOOL)shouldAnimateScrollToDate:(id)a3 fromClosestDate:(id)a4;
- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible;
- (BOOL)shouldShowMonthTitleHUDWhenScrolling;
- (CGPoint)nearestMajorBoundaryForPoint:(CGPoint)a3;
- (CGRect)_mainFrameForEvent:(id)a3 atLastPosition:(BOOL)a4 atPoint:(CGPoint)a5;
- (CGRect)_startingFrameForEvent:(id)a3 atPoint:(CGPoint)a4;
- (CGRect)eventGestureController:(id)a3 finalFrameAfterCommitAtPoint:(CGPoint)a4;
- (CGRect)frameForTodayHighlight;
- (CGRect)frameForWeekContainingDate:(id)a3;
- (MonthViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5;
- (MonthViewOccurrence)draggedOccurrenceView;
- (UIFont)headerFont;
- (double)decelerationDistanceThresholdForDisplayingMonthBanner;
- (double)decelerationDistanceThresholdForPreferringMonthBoundary;
- (double)decelerationDistanceThresholdToStopShowingMonthBanner;
- (id)_slowComputeCalendarDateForWeekFromStartDate:(id)a3 weekOffset:(int64_t)a4;
- (id)adjustSelectedDateForNewMonth:(id)a3;
- (id)bestDateForNewEvent;
- (id)calendarDateForSubviewAboveSubviewWithCalendarDate:(id)a3;
- (id)calendarDateForSubviewBelowSubviewWithCalendarDate:(id)a3;
- (id)cellFramesForWeekContainingDate:(id)a3;
- (id)dateAtPoint:(CGPoint)a3;
- (id)eventGestureController:(id)a3 eventToStartInteractionWithAtPoint:(CGPoint)a4;
- (id)eventGestureController:(id)a3 setUpAtPoint:(CGPoint)a4 withOccurrence:(id)a5 forceNewEvent:(BOOL)a6;
- (id)eventGestureControllerGetCurrentDraggingView:(id)a3;
- (id)futureMajorBoundaryCalendarDateForCalendarDate:(id)a3;
- (id)monthTitleView;
- (id)monthWeekSubviewForScrollPoint:(CGPoint)a3 pointInWeek:(CGPoint *)a4;
- (id)occurrenceAtPoint:(CGPoint)a3;
- (id)pastMajorBoundaryCalendarDateForCalendarDate:(id)a3;
- (id)pasteboardManager;
- (id)sceneTitle;
- (id)testingRotationDidEndNotificationName;
- (id)testingRotationWillStartNotificationName;
- (int64_t)intendedSizeClass;
- (void)_animateDraggingOccurrenceToDate:(id)a3 atLastPosition:(BOOL)a4 dropPoint:(CGPoint)a5 completion:(id)a6;
- (void)_calendarModelTimeZoneChanged:(id)a3;
- (void)_displayDongleForDraggedOccurrence;
- (void)_reloadAllViews;
- (void)_saveDraggedEventWithSpan:(int64_t)a3;
- (void)_selectedDateChanged:(id)a3;
- (void)_updateBackButtonOnBackViewControllerToDate:(id)a3;
- (void)_updateDraggingOffsetTimesForPoint:(CGPoint)a3;
- (void)_updateMonthTitle;
- (void)_updateWeekHighlightsForDragPoint:(CGPoint)a3;
- (void)contentSizeCategoryChanged;
- (void)dealloc;
- (void)didEndScrolling;
- (void)didScroll;
- (void)eventGestureController:(id)a3 commitToPoint:(CGPoint)a4;
- (void)eventGestureController:(id)a3 requestedCancellationAnimationAtPoint:(CGPoint)a4 withOccurrence:(id)a5;
- (void)eventGestureController:(id)a3 requestsPresentationOfViewController:(id)a4;
- (void)eventGestureController:(id)a3 requestsShowEvent:(id)a4;
- (void)eventGestureController:(id)a3 setDraggingViewHidden:(BOOL)a4;
- (void)eventGestureController:(id)a3 updateToPoint:(CGPoint)a4;
- (void)eventGestureControllerCancelled:(id)a3;
- (void)eventGestureControllerRequestsUpdateOfDraggingView:(id)a3;
- (void)eventGestureControllerScrollTimerFired:(id)a3;
- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4;
- (void)eventViewControllerNextButtonWasTapped:(id)a3;
- (void)eventViewControllerPreviousButtonWasTapped:(id)a3;
- (void)eventViewDelegateShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4;
- (void)loadView;
- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4;
- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5;
- (void)pasteboardManager:(id)a3 presentAlert:(id)a4;
- (void)removeAllWeekHighlights;
- (void)removeDraggingOccurrenceAnimated:(BOOL)a3;
- (void)selectDate:(id)a3 animated:(BOOL)a4;
- (void)setShouldShowMonthTitleHUDWhenScrolling:(BOOL)a3;
- (void)showDate:(id)a3 animated:(BOOL)a4;
- (void)showDate:(id)a3 animated:(BOOL)a4 toMonthStart:(BOOL)a5;
- (void)updateBackButtonToDate:(id)a3;
- (void)updateDraggedOccurrenceView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBeginDragging;
- (void)willEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4;
@end

@implementation MonthViewController

- (MonthViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MonthViewController;
  v10 = [(InfiniteScrollViewController *)&v14 initWithCalendarDate:a3 model:v9 window:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->super.super._model, a4);
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v11 selector:"_significantTimeChangeOccurred:" name:CUIKCalendarModelSignificantTimeChangeNotification object:v9];
    [v12 addObserver:v11 selector:"_localeChanged:" name:CUIKLocaleChangedNotification object:0];
    [v12 addObserver:v11 selector:"_calendarModelTimeZoneChanged:" name:CUIKCalendarModelTimeZoneChangedNotification object:0];
    [v12 addObserver:v11 selector:"weekNumbersPrefChanged" name:CUIKPreferencesNotification_ShowWeekNumbers object:0];
    [v12 addObserver:v11 selector:"contentSizeCategoryChanged" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v11;
}

- (void)updateBackButtonToDate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 year];
  v6 = CUIKTodayComponents();
  id v7 = [v6 year];

  if (v5 == v7)
  {
    [v4 month];
    v8 = CUIKStringForMonthNumber();
  }
  else
  {
    id v9 = [v4 date];
    v8 = CUIKShortStringForMonthYear();
  }
  v10 = +[NSLocale currentLocale];
  v11 = [v8 capitalizedStringWithLocale:v10];

  v12 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Setting back button title for Month view to: [%@]", (uint8_t *)&v16, 0xCu);
  }
  v13 = [(MonthViewController *)self parentViewController];
  objc_super v14 = [v13 navigationItem];
  [v14 setBackButtonTitle:v11];
  backButtonDate = self->_backButtonDate;
  self->_backButtonDate = (EKCalendarDate *)v4;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 1;
}

- (void)dealloc
{
  [(EKEventGestureController *)self->_gestureController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MonthViewController;
  [(MainViewController *)&v3 dealloc];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)MonthViewController;
  [(InfiniteScrollViewController *)&v5 loadView];
  objc_super v3 = objc_alloc_init(MonthTitleView);
  monthTitleView = self->_monthTitleView;
  self->_monthTitleView = v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_selectedDateChanged:" name:CUIKCalendarModelSelectedDateChangedNotification object:self->super.super._model];
  v6.receiver = self;
  v6.super_class = (Class)MonthViewController;
  [(InfiniteScrollViewController *)&v6 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MonthViewController;
  [(InfiniteScrollViewController *)&v14 viewDidAppear:a3];
  id v4 = [(MonthViewController *)self view];
  objc_super v5 = [v4 window];
  if (v5)
  {
  }
  else
  {
    char v6 = EKUIHasFallbackSizingContext();

    if ((v6 & 1) == 0)
    {
      id v7 = [(MonthViewController *)self navigationController];
      v8 = [v7 view];
      id v9 = [v8 window];

      if (v9)
      {
        EKUIPushFallbackSizingContextWithViewHierarchy();
        [(InfiniteScrollViewController *)self showSelectedDateIfNeeded];
        EKUIPopFallbackSizingContextWithViewHierarchy();

        goto LABEL_7;
      }
    }
  }
  [(InfiniteScrollViewController *)self showSelectedDateIfNeeded];
LABEL_7:
  [(CUIKCalendarModel *)self->super.super._model setDesiredPaddingDays:14];
  [(CUIKCalendarModel *)self->super.super._model setComponentForExpandingPadding:4096];
  if (!self->_gestureController)
  {
    id v10 = objc_alloc((Class)EKEventGestureController);
    v11 = [(MonthViewController *)self view];
    v12 = (EKEventGestureController *)[v10 initWithView:v11];
    gestureController = self->_gestureController;
    self->_gestureController = v12;

    [(EKEventGestureController *)self->_gestureController setUntimedDelegate:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MonthViewController;
  [(InfiniteScrollViewController *)&v5 viewWillDisappear:a3];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:CUIKCalendarModelSelectedDateChangedNotification object:self->super.super._model];
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
  return v5 < 5;
}

- (id)pastMajorBoundaryCalendarDateForCalendarDate:(id)a3
{
  return [a3 calendarDateForMonth];
}

- (id)futureMajorBoundaryCalendarDateForCalendarDate:(id)a3
{
  BOOL v3 = [(MonthViewController *)self pastMajorBoundaryCalendarDateForCalendarDate:a3];
  uint64_t v4 = [v3 calendarDateByAddingMonths:1];

  return v4;
}

- (id)calendarDateForSubviewAboveSubviewWithCalendarDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 calendarDateByAddingWeeks:-1];
  id v6 = [v5 month];
  if (v6 != [v4 month])
  {
    id v7 = [v4 dayOfWeek];
    if (v7 == (id)CUIKOneIndexedWeekStart())
    {
      if ((uint64_t)[v4 day] < 2) {
        goto LABEL_9;
      }
      uint64_t v8 = [v4 calendarDateForMonth];
    }
    else
    {
      id v9 = [v4 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];

      [v9 absoluteTime];
      double v11 = v10;
      [v4 absoluteTime];
      if (v11 < v12)
      {
        unint64_t v5 = v9;
        goto LABEL_9;
      }
      uint64_t v8 = [(MonthViewController *)self _slowComputeCalendarDateForWeekFromStartDate:v4 weekOffset:-1];
      unint64_t v5 = v9;
    }

    unint64_t v5 = (void *)v8;
  }
LABEL_9:

  return v5;
}

- (id)calendarDateForSubviewBelowSubviewWithCalendarDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 calendarDateByAddingWeeks:1];
  id v6 = [v5 month];
  if (v6 == [v4 month])
  {
    id v7 = [v5 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];

    [v7 absoluteTime];
    double v9 = v8;
    double v10 = [v4 calendarDateForEndOfWeekWithWeekStart:CUIKOneIndexedWeekStart()];
    [v10 absoluteTime];
    double v12 = v11;

    if (v9 > v12) {
      goto LABEL_6;
    }
    uint64_t v13 = [(MonthViewController *)self _slowComputeCalendarDateForWeekFromStartDate:v4 weekOffset:1];
    unint64_t v5 = v7;
  }
  else
  {
    uint64_t v13 = [v5 calendarDateForMonth];
  }

  id v7 = (void *)v13;
LABEL_6:

  return v7;
}

- (id)_slowComputeCalendarDateForWeekFromStartDate:(id)a3 weekOffset:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(MainViewController *)self model];
  double v8 = [v7 calendar];
  id v9 = [v8 copy];

  [v9 setFirstWeekday:CUIKOneIndexedWeekStart()];
  double v10 = [v6 date];

  double v11 = [v9 dateByAddingUnit:4096 value:a4 toDate:v10 options:0];

  double v12 = [v9 components:8206 fromDate:v11];
  [v12 setWeekday:[v9 firstWeekday]];
  uint64_t v13 = [v9 dateFromComponents:v12];
  id v14 = objc_alloc((Class)EKCalendarDate);
  v15 = [(MainViewController *)self model];
  int v16 = [v15 calendar];
  v17 = [v16 timeZone];
  id v18 = [v14 initWithDate:v13 timeZone:v17];

  return v18;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 1;
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MainViewController *)self model];
  [v7 setSelectedDate:v6];

  id v8 = [v6 date];

  [(MonthViewController *)self showDate:v8 animated:v4 toMonthStart:1];
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  v2 = [(MainViewController *)self model];
  char v3 = [v2 showMonthAsDivided] ^ 1;

  return v3;
}

- (BOOL)_isTodayCircleFrameFullyUnobstructed
{
  [(InfiniteScrollViewController *)self unobstructedScrollViewHeight];
  uint64_t v4 = v3;
  unint64_t v5 = [(InfiniteScrollViewController *)self scrollView];
  [v5 contentInset];
  uint64_t v7 = v6;
  id v8 = [(InfiniteScrollViewController *)self scrollView];
  [v8 bounds];
  CGFloat Width = CGRectGetWidth(v24);

  [(MonthViewController *)self frameForTodayHighlight];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v18 = 0;
  uint64_t v19 = v7;
  CGFloat v20 = Width;
  uint64_t v21 = v4;

  return CGRectContainsRect(*(CGRect *)&v18, *(CGRect *)&v11);
}

- (void)showDate:(id)a3 animated:(BOOL)a4
{
}

- (void)showDate:(id)a3 animated:(BOOL)a4 toMonthStart:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  if (v5)
  {
    id v9 = [(CUIKCalendarModel *)self->super.super._model calendar];
    uint64_t v10 = [v9 timeZone];

    v37 = (void *)v10;
    uint64_t v11 = +[EKCalendarDate calendarDateWithDate:v8 timeZone:v10];
    uint64_t v12 = [(MonthViewController *)self pastMajorBoundaryCalendarDateForCalendarDate:v11];
    [(InfiniteScrollViewController *)self unobstructedScrollViewHeight];
    double v14 = v13;
    id v15 = v12;
    uint64_t v16 = objc_opt_new();
    [v15 absoluteTime];
    double v18 = v17;
    [v11 absoluteTime];
    id v19 = v15;
    if (v18 <= v20)
    {
      uint64_t v21 = v15;
      do
      {
        [v16 addObject:v21];
        id v19 = [(MonthViewController *)self calendarDateForSubviewBelowSubviewWithCalendarDate:v21];

        [v19 absoluteTime];
        double v23 = v22;
        [v11 absoluteTime];
        uint64_t v21 = v19;
      }
      while (v23 <= v24);
    }
    v38 = v8;
    unsigned int v39 = v6;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v25 = [v16 reverseObjectEnumerator];
    id v26 = [v25 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v26)
    {
      id v27 = v26;
      id v28 = 0;
      uint64_t v29 = *(void *)v42;
      double v30 = -10.0;
LABEL_7:
      v31 = 0;
      while (1)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v25);
        }
        id v32 = *(id *)(*((void *)&v41 + 1) + 8 * (void)v31);

        [(InfiniteScrollViewController *)self heightForSubviewWithCalendarDate:v32];
        double v30 = v30 + v33;
        if (v30 > v14) {
          break;
        }
        id v19 = v32;

        v31 = (char *)v31 + 1;
        id v28 = v19;
        if (v27 == v31)
        {
          id v27 = [v25 countByEnumeratingWithState:&v41 objects:v47 count:16];
          id v28 = v19;
          if (v27) {
            goto LABEL_7;
          }
          goto LABEL_15;
        }
      }
    }
    else
    {
      id v28 = 0;
LABEL_15:

      id v32 = 0;
    }

    if (!v28)
    {
      v34 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v38;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "failed to find best week for showing date: %@", buf, 0xCu);
      }
      id v28 = v36;
    }
    uint64_t v35 = [v28 date];

    id v8 = (id)v35;
    uint64_t v6 = v39;
  }
  v40.receiver = self;
  v40.super_class = (Class)MonthViewController;
  [(InfiniteScrollViewController *)&v40 showDate:v8 animated:v6];
}

- (id)bestDateForNewEvent
{
  uint64_t v3 = CUIKTodayDate();
  [(MonthViewController *)self frameForTodayHighlight];
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  v26.origin.CGFloat x = CGRectZero.origin.x;
  v26.origin.CGFloat y = CGRectZero.origin.y;
  v26.size.CGFloat width = CGRectZero.size.width;
  v26.size.CGFloat height = CGRectZero.size.height;
  BOOL v8 = CGRectEqualToRect(v22, v26);
  id v9 = [(InfiniteScrollViewController *)self scrollView];
  [v9 contentInset];
  double v11 = v10;

  uint64_t v12 = [(MonthViewController *)self view];
  [v12 bounds];
  double v13 = CGRectGetHeight(v23);
  double v14 = [(InfiniteScrollViewController *)self scrollView];
  [v14 contentInset];
  double v16 = v15;

  if (v8) {
    goto LABEL_4;
  }
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  if (CGRectGetMinY(v24) > v13 - v16
    || (v25.origin.CGFloat x = x, v25.origin.y = y, v25.size.width = width, v25.size.height = height, CGRectGetMaxY(v25) < v11))
  {
LABEL_4:
    double v17 = [(InfiniteScrollViewController *)self dateOfCenterViewInBuffer];
  }
  else
  {
    id v19 = [(CUIKCalendarModel *)self->super.super._model eventStore];
    double v20 = [v19 timeZone];

    double v17 = +[EKCalendarDate calendarDateWithDate:v3 timeZone:v20];
  }

  return v17;
}

- (id)testingRotationWillStartNotificationName
{
  return @"MonthViewController_RotationAnimationStartedNotification";
}

- (id)testingRotationDidEndNotificationName
{
  return @"MonthViewController_RotationAnimationCompletedNotification";
}

- (id)sceneTitle
{
  uint64_t v3 = [(MonthViewController *)self bestDateForNewEvent];
  uint64_t v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 date];
    if (v5)
    {
LABEL_3:
      uint64_t v6 = CUIKStringForMonthYear();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = [(CUIKCalendarModel *)self->super.super._model selectedDay];
    BOOL v5 = [v7 date];

    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
LABEL_6:

  return v6;
}

- (void)willBeginDragging
{
  v3.receiver = self;
  v3.super_class = (Class)MonthViewController;
  [(InfiniteScrollViewController *)&v3 willBeginDragging];
  [(MonthViewController *)self _updateMonthTitle];
}

- (double)decelerationDistanceThresholdForPreferringMonthBoundary
{
  return 1.79769313e308;
}

- (double)decelerationDistanceThresholdForDisplayingMonthBanner
{
  return 1.79769313e308;
}

- (double)decelerationDistanceThresholdToStopShowingMonthBanner
{
  return 0.0;
}

- (void)willEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  uint64_t v6 = [(InfiniteScrollViewController *)self scrollView];
  [v6 contentOffset];
  double v8 = v7;

  double y = a4->y;
  double v10 = vabdd_f64(y, v8);
  [(MonthViewController *)self decelerationDistanceThresholdForPreferringMonthBoundary];
  if (v10 > v11)
  {
    -[MonthViewController nearestMajorBoundaryForPoint:](self, "nearestMajorBoundaryForPoint:", a4->x, a4->y);
    CGFloat x = v13;
    double v15 = v12;
    if (y <= v8)
    {
      if (v12 <= v8)
      {
        double v16 = (void *)kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          double v17 = v16;
          double v18 = (objc_class *)objc_opt_class();
          id v19 = NSStringFromClass(v18);
          double v20 = NSStringFromPoint(*a4);
          int v35 = 138412546;
          v36 = v19;
          __int16 v37 = 2112;
          v38 = v20;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Major boundary settling triggered in [%@].  Will settle on offset: [%@]", (uint8_t *)&v35, 0x16u);
        }
        goto LABEL_9;
      }
    }
    else if (v12 >= v8)
    {
      goto LABEL_9;
    }
    CGFloat x = a4->x;
    double v15 = a4->y;
LABEL_9:
    a4->CGFloat x = x;
    a4->double y = v15;
    uint64_t v21 = [(InfiniteScrollViewController *)self scrollView];
    [v21 contentOffset];
    double v10 = vabdd_f64(v15, v22);
  }
  if (self->_shouldShowMonthTitleHUDWhenScrolling)
  {
    [(MonthViewController *)self decelerationDistanceThresholdForDisplayingMonthBanner];
    if (v10 > v23)
    {
      self->_monthTitleViewIsVisible = 1;
      CGRect v24 = [(MonthTitleView *)self->_monthTitleView superview];

      if (!v24)
      {
        [(MonthTitleView *)self->_monthTitleView frame];
        double v26 = v25;
        double v28 = v27;
        uint64_t v29 = [(InfiniteScrollViewController *)self scrollView];
        [v29 safeAreaInsets];
        double v31 = v30;

        id v32 = [(MonthViewController *)self view];
        [v32 bounds];
        double Width = CGRectGetWidth(v39);

        -[MonthTitleView setFrame:](self->_monthTitleView, "setFrame:", v26, v31, Width, v28);
        v34 = [(MonthViewController *)self view];
        [v34 addSubview:self->_monthTitleView];
      }
      [(MonthTitleView *)self->_monthTitleView animateVisible:1 duration:0 completion:0.25];
    }
  }
}

- (void)didScroll
{
  v3.receiver = self;
  v3.super_class = (Class)MonthViewController;
  [(InfiniteScrollViewController *)&v3 didScroll];
  [(MonthViewController *)self _updateMonthTitle];
}

- (void)didEndScrolling
{
  v4.receiver = self;
  v4.super_class = (Class)MonthViewController;
  [(InfiniteScrollViewController *)&v4 didEndScrolling];
  [(MonthViewController *)self _updateMonthTitle];
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"MonthViewController_ScrollDidEndAnimationNotification" object:self userInfo:0];
}

- (void)_selectedDateChanged:(id)a3
{
  objc_super v4 = [(MainViewController *)self model];
  BOOL v5 = [v4 selectedDate];
  [(MonthViewController *)self _updateBackButtonOnBackViewControllerToDate:v5];

  [(MainViewController *)self setSceneTitleNeedsUpdate];
}

- (void)_calendarModelTimeZoneChanged:(id)a3
{
}

- (void)contentSizeCategoryChanged
{
  +[EKUILargeTextUtilities clearCache];

  [(MonthViewController *)self _reloadAllViews];
}

- (void)_reloadAllViews
{
  objc_super v3 = [(InfiniteScrollViewController *)self dateOfCenterViewInBuffer];
  objc_super v4 = [(MainViewController *)self model];
  BOOL v5 = [v4 calendar];
  uint64_t v6 = [v5 timeZone];
  id v9 = [v3 calendarDateInTimeZone:v6];

  [(InfiniteScrollViewController *)self reinitializeAllViewsWithCalendarDate:v9];
  double v7 = [(MainViewController *)self model];
  double v8 = [v7 selectedDate];

  [(MonthViewController *)self updateBackButtonToDate:v8];
}

- (void)_updateBackButtonOnBackViewControllerToDate:(id)a3
{
  id v5 = a3;
  objc_super v4 = [(MonthViewController *)self navigationController];
  if (objc_opt_respondsToSelector()) {
    [v4 updateBackButtonToDate:v5];
  }
}

- (id)monthTitleView
{
  return self->_monthTitleView;
}

- (CGPoint)nearestMajorBoundaryForPoint:(CGPoint)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MonthViewController;
  id obj = 0;
  -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](&v11, "nearestMajorBoundaryForPoint:date:", &obj, a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  id v8 = obj;
  self->_decelerationTargetY = v6;
  objc_storeStrong((id *)&self->_decelerationTargetDate, v8);
  double v9 = v5;
  double v10 = v7;
  result.double y = v10;
  result.CGFloat x = v9;
  return result;
}

- (void)_updateMonthTitle
{
  if (!self->_shouldShowMonthTitleHUDWhenScrolling) {
    return;
  }
  double decelerationTargetY = self->_decelerationTargetY;
  double v4 = [(InfiniteScrollViewController *)self scrollView];
  [v4 contentOffset];
  double v6 = v5;

  double v7 = [(InfiniteScrollViewController *)self scrollView];
  if ([v7 isDragging])
  {
    unsigned __int8 v8 = [(InfiniteScrollViewController *)self isUserFingerDown];

    if ((v8 & 1) == 0 && self->_monthTitleViewIsVisible)
    {
      [(MonthViewController *)self decelerationDistanceThresholdToStopShowingMonthBanner];
      if (vabdd_f64(decelerationTargetY, v6) > v9)
      {
        double v10 = [(InfiniteScrollViewController *)self scrollView];
        [v10 contentInset];
        double v12 = v11;

        double v13 = -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", 0.0, v12);
        if (!v13)
        {
LABEL_23:

          return;
        }
        double v14 = decelerationTargetY - v6;
        id v33 = v13;
        double v15 = [(MonthViewController *)self view];
        [v33 convertPoint:v15 fromView:0.0, v12];
        double v17 = v16;

        double v18 = [v33 calendarDate];
        [(InfiniteScrollViewController *)self showDateVerticalOffsetForDate:v18];
        double v20 = v19;

        uint64_t v21 = [v33 calendarDate];
        double v22 = v21;
        if (v14 <= 0.0)
        {
          uint64_t v28 = (uint64_t)[v21 day];
          id v29 = [v22 month];
          BOOL v30 = v29 == [(EKCalendarDate *)self->_decelerationTargetDate month];
          double v25 = v33;
          if (!v30 && (v28 < 8 || (unint64_t)(v28 - 8) <= 6 && v17 - v20 < 44.0))
          {
            uint64_t v26 = -1;
            goto LABEL_21;
          }
        }
        else
        {
          double v23 = [v21 daysInMonth];
          BOOL v24 = (unint64_t)(v23 - (unsigned char *)[v22 day]) >= 0xF;
          double v25 = v33;
          if (!v24)
          {
            uint64_t v26 = 1;
LABEL_21:
            id v32 = [v25 calendarDate];
            double v31 = [v32 calendarDateByAddingMonths:v26];

            goto LABEL_22;
          }
        }
        double v31 = [v25 calendarDate];
LABEL_22:
        [(MonthTitleView *)self->_monthTitleView setCalendarDate:v31];

        double v13 = v33;
        goto LABEL_23;
      }
    }
  }
  else
  {
  }
  if (self->_monthTitleViewIsVisible)
  {
    self->_monthTitleViewIsVisible = 0;
    monthTitleView = self->_monthTitleView;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100033D08;
    v34[3] = &unk_1001D27D8;
    v34[4] = self;
    [(MonthTitleView *)monthTitleView animateVisible:0 duration:v34 completion:0.75];
  }
}

- (id)adjustSelectedDateForNewMonth:(id)a3
{
  id v4 = a3;
  double v5 = CUIKTodayDate();
  double v6 = [(CUIKCalendarModel *)self->super.super._model calendar];
  double v7 = [v6 timeZone];
  unsigned __int8 v8 = +[EKCalendarDate calendarDateWithDate:v5 timeZone:v7];

  id v9 = [v8 month];
  if (v9 == [v4 month] && (id v10 = objc_msgSend(v8, "year"), v10 == objc_msgSend(v4, "year")))
  {
    id v11 = v8;
  }
  else
  {
    id v11 = [v4 calendarDateForMonth];
  }
  double v12 = v11;

  return v12;
}

- (id)dateAtPoint:(CGPoint)a3
{
  uint64_t v7 = 0;
  unsigned __int8 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100033F38;
  id v11 = sub_100033F48;
  id v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100033F50;
  v5[3] = &unk_1001D2938;
  CGPoint v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v5];
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (void)updateDraggedOccurrenceView
{
  if (self->_draggedOccurrenceView)
  {
    id v3 = [(EKEvent *)self->_draggedOccurrence startCalendarDate];
    id v23 = [(InfiniteScrollViewController *)self subviewForDate:v3];

    if ([v23 conformsToProtocol:&OBJC_PROTOCOL___InfiniteScrollViewSubview])
    {
      draggedOccurrence = self->_draggedOccurrence;
      double v5 = [(EKEvent *)draggedOccurrence startCalendarDate];
      [v23 frameForOccurrence:draggedOccurrence onDay:v5];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;

      double v14 = [(MonthViewController *)self view];
      [v14 convertRect:v23 fromView:v7];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;

      -[MonthViewOccurrence setFrame:](self->_draggedOccurrenceView, "setFrame:", v16, v18, v20, v22);
      [(MonthViewOccurrence *)self->_draggedOccurrenceView setNeedsDisplay];
    }
  }
}

- (void)removeDraggingOccurrenceAnimated:(BOOL)a3
{
  if (a3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100034294;
    v7[3] = &unk_1001D2740;
    v7[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000342AC;
    v6[3] = &unk_1001D27D8;
    v6[4] = self;
    +[UIView animateWithDuration:v7 animations:v6 completion:0.4];
  }
  else
  {
    [(MonthViewOccurrence *)self->_draggedOccurrenceView removeFromSuperview];
    draggedOccurrenceView = self->_draggedOccurrenceView;
    self->_draggedOccurrenceView = 0;

    draggedOccurrence = self->_draggedOccurrence;
    self->_draggedOccurrence = 0;
  }
  [(EKEventGestureController *)self->_gestureController endForcedStart:0];
}

- (id)pasteboardManager
{
  v2 = [(MainViewController *)self model];
  id v3 = [v2 pasteboardManager];

  return v3;
}

- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  if (a4) {
    [a3 nextOccurrence];
  }
  else {
  id v4 = [a3 previousOccurrence];
  }
  id v5 = [v4 reminderOccurrenceType];
  if (v4) {
    BOOL v6 = v5 == (id)1;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;

  return v7;
}

- (void)eventViewDelegateShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v10 = v6;
  if (v4) {
    [v6 nextOccurrence];
  }
  else {
  BOOL v7 = [v6 previousOccurrence];
  }
  double v8 = v7;
  if (v7)
  {
    double v9 = [v7 startCalendarDate];
    [(MonthViewController *)self selectDate:v9 animated:1];

    [(MainViewController *)self showEvent:v8 animated:1 showMode:0 context:0];
  }
}

- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons
{
  return 1;
}

- (void)eventViewControllerNextButtonWasTapped:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 event];
  id v5 = [v4 nextOccurrence];

  if (v5)
  {
    [(MonthViewController *)self eventViewController:v7 didCompleteWithAction:0];
    id v6 = [v7 context];
    [(MainViewController *)self showEvent:v5 animated:1 showMode:1 context:v6];
  }
}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 event];
  id v5 = [v4 previousOccurrence];

  if (v5)
  {
    [(MonthViewController *)self eventViewController:v7 didCompleteWithAction:0];
    id v6 = [v7 context];
    [(MainViewController *)self showEvent:v5 animated:1 showMode:1 context:v6];
  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MonthViewController *)self eventViewController:v7 didCompleteWithAction:0];
  id v8 = [v7 context];

  [(MainViewController *)self showEvent:v6 animated:1 showMode:1 context:v8];
}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4 && !a5) {
    [(MainViewController *)self attemptDisplayReviewPrompt];
  }
}

- (MonthViewOccurrence)draggedOccurrenceView
{
  return self->_draggedOccurrenceView;
}

- (BOOL)dragAndDropAllowLongPress
{
  return 0;
}

- (id)occurrenceAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)dragAndDropIsCurrentlyScrubbing
{
  return 0;
}

- (id)monthWeekSubviewForScrollPoint:(CGPoint)a3 pointInWeek:(CGPoint *)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:");
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___MonthInfiniteScrollSubview])
  {
    if (a4)
    {
      double v9 = [(InfiniteScrollViewController *)self scrollView];
      [v9 convertPoint:v8 toView:x, y];
      a4->double x = v10;
      a4->double y = v11;
    }
    id v12 = v8;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)scaleForDragging
{
  return 0;
}

- (CGRect)_startingFrameForEvent:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = -[MonthViewController monthWeekSubviewForScrollPoint:pointInWeek:](self, "monthWeekSubviewForScrollPoint:pointInWeek:", 0, x, y);
  double v9 = [v7 startCalendarDate];
  CGFloat v10 = [v9 calendarDateForDay];

  [(EKCalendarDate *)self->_draggedStartDate absoluteTime];
  double v12 = v11;
  double v13 = [v8 calendarDate];
  [v13 absoluteTime];
  double v15 = v14;

  if (v12 < v15)
  {
    uint64_t v16 = [v8 calendarDate];

    CGFloat v10 = (void *)v16;
  }
  [v8 frameForOccurrence:v7 onDay:v10];
  double v17 = v40.origin.x;
  double v18 = v40.origin.y;
  double width = v40.size.width;
  double height = v40.size.height;
  if (CGRectIsNull(v40))
  {
    double v21 = [v7 startCalendarDate];
    double v22 = [(InfiniteScrollViewController *)self subviewForDate:v21];

    if ([v22 conformsToProtocol:&OBJC_PROTOCOL___MonthInfiniteScrollSubview])
    {
      [v22 frameForOccurrence:v7 onDay:v10];
      double v17 = v23;
      double v18 = v24;
      double width = v25;
      double height = v26;
    }
  }
  double v27 = [(InfiniteScrollViewController *)self scrollView];
  [v27 convertRect:v8 fromView:v17 width:width height:height];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  double v36 = v29;
  double v37 = v31;
  double v38 = v33;
  double v39 = v35;
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.double y = v37;
  result.origin.double x = v36;
  return result;
}

- (void)_updateDraggingOffsetTimesForPoint:(CGPoint)a3
{
  BOOL v4 = -[MonthViewController dateAtPoint:](self, "dateAtPoint:", a3.x, a3.y);
  id v13 = v4;
  if (self->_draggingExistingEvent)
  {
    id v5 = [v4 differenceInDays:self->_initialDragDate];
    id v6 = [(EKEvent *)self->_draggedOccurrence startCalendarDate];
    id v7 = [v6 calendarDateByAddingDays:v5];
    draggedStartDate = self->_draggedStartDate;
    self->_draggedStartDate = v7;

    double v9 = [(EKEvent *)self->_draggedOccurrence endCalendarDate];
    CGFloat v10 = [v9 calendarDateByAddingDays:v5];
    draggedEndDate = self->_draggedEndDate;
    self->_draggedEndDate = v10;
  }
  else
  {
    objc_storeStrong((id *)&self->_draggedStartDate, v4);
    double v12 = [v13 calendarDateForEndOfDay];
    double v9 = self->_draggedEndDate;
    self->_draggedEndDate = v12;
  }
}

- (void)removeAllWeekHighlights
{
}

- (void)_updateWeekHighlightsForDragPoint:(CGPoint)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100034B2C;
  v3[3] = &unk_1001D29A0;
  v3[4] = self;
  [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v3];
}

- (void)_animateDraggingOccurrenceToDate:(id)a3 atLastPosition:(BOOL)a4 dropPoint:(CGPoint)a5 completion:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  BOOL v8 = a4;
  CGFloat v10 = (void (**)(void))a6;
  -[MonthViewController _mainFrameForEvent:atLastPosition:atPoint:](self, "_mainFrameForEvent:atLastPosition:atPoint:", self->_draggedOccurrence, v8, x, y);
  double v11 = v34.origin.x;
  double v12 = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  if (CGRectIsNull(v34)
    || (v35.origin.double x = v11, v35.origin.y = v12, v35.size.width = width, v35.size.height = height, CGRectIsEmpty(v35)))
  {
    if (v10) {
      v10[2](v10);
    }
  }
  else
  {
    double v15 = [(InfiniteScrollViewController *)self scrollView];
    [(MonthViewOccurrence *)self->_draggedOccurrenceView frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v24 = [(MonthViewController *)self view];
    [v15 convertRect:v24 fromView:v17, v19, v21, v23];
    double v26 = v25;
    double v28 = v27;

    float v29 = (v12 - v28) * (v12 - v28) + (v11 - v26) * (v11 - v26);
    double v30 = dbl_1001C1220[sqrtf(v29) < 50.0];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100034EA4;
    v33[3] = &unk_1001D29C8;
    v33[4] = self;
    *(double *)&v33[5] = v11;
    *(double *)&v33[6] = v12;
    *(CGFloat *)&v33[7] = width;
    *(CGFloat *)&v33[8] = height;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100034F80;
    v31[3] = &unk_1001D29F0;
    double v32 = v10;
    +[UIView animateWithDuration:131076 delay:v33 options:v31 animations:v30 completion:0.0];
  }
}

- (CGRect)_mainFrameForEvent:(id)a3 atLastPosition:(BOOL)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  BOOL v7 = a4;
  id v9 = a3;
  CGFloat v10 = CGRectZero.origin.x;
  CGFloat v11 = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  CGPoint v34 = CGPointZero;
  double v14 = -[MonthViewController monthWeekSubviewForScrollPoint:pointInWeek:](self, "monthWeekSubviewForScrollPoint:pointInWeek:", &v34, x, y);
  double v15 = v14;
  if (v14)
  {
    double v16 = [v14 dateAtPoint:v34];
    if (v16)
    {
      if (v7) {
        [v15 frameForOccurrenceAfterLastOnDay:v16];
      }
      else {
        [v15 frameForOccurrence:v9 onDay:v16];
      }
      double v21 = v17;
      double v22 = v18;
      double v23 = v19;
      double v24 = v20;
      double v25 = [(InfiniteScrollViewController *)self scrollView];
      [v25 convertRect:v15 fromView:v21, v22, v23, v24];
      CGFloat v10 = v26;
      CGFloat v11 = v27;
      CGFloat width = v28;
      CGFloat height = v29;
    }
  }

  double v30 = v10;
  double v31 = v11;
  double v32 = width;
  double v33 = height;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (void)_saveDraggedEventWithSpan:(int64_t)a3
{
  if (([(EKEvent *)self->_draggedOccurrence isNew] & 1) == 0)
  {
    if (a3
      && [(EKEvent *)self->_draggedOccurrence isOrWasPartOfRecurringSeries])
    {
      if ([(EKEvent *)self->_draggedOccurrence isOrWasPartOfRecurringSeries])
      {
        id v5 = [(EKEvent *)self->_draggedOccurrence singleRecurrenceRule];
      }
      else
      {
        id v5 = 0;
      }
      id v6 = [v5 recurrenceEnd];
      BOOL v7 = [v6 endDate];

      if (v7)
      {
        BOOL v8 = [(EKEvent *)self->_draggedOccurrence committedValueForKey:@"startDate"];
        [v8 timeIntervalSinceReferenceDate];
        double v10 = v9;

        CGFloat v11 = [(EKEvent *)self->_draggedOccurrence startDate];
        [v11 timeIntervalSinceReferenceDate];
        double v13 = v12;

        double v14 = [v7 dateByAddingTimeInterval:v13 - v10];
        double v15 = +[EKRecurrenceEnd recurrenceEndWithEndDate:v14];
        [v5 setRecurrenceEnd:v15];
      }
    }
    double v16 = [(MonthViewController *)self EKUI_editor];
    draggedOccurrence = self->_draggedOccurrence;
    id v21 = 0;
    unsigned __int8 v18 = [v16 saveEvent:draggedOccurrence span:a3 error:&v21];
    id v19 = v21;

    if ((v18 & 1) == 0)
    {
      double v20 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error moving event: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_displayDongleForDraggedOccurrence
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, 400.0, 50.0];
  BOOL v4 = [(MonthViewController *)self traitCollection];
  id v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v4];

  id v6 = [v5 fontDescriptorWithSymbolicTraits:2];

  id v7 = +[UIFont fontWithDescriptor:v6 size:0.0];
  if ([(EKEvent *)self->_draggedOccurrence isNew])
  {
    BOOL v8 = +[NSBundle bundleForClass:objc_opt_class()];
    double v9 = [v8 localizedStringForKey:@"New Event" value:&stru_1001D6918 table:0];
    [v3 setText:v9];
  }
  else
  {
    BOOL v8 = [(EKEvent *)self->_draggedOccurrence title];
    [v3 setText:v8];
  }

  double v10 = +[UIColor whiteColor];
  [v3 setTextColor:v10];

  CGFloat v11 = +[UIFont fontWithDescriptor:v6 size:0.0];
  [v3 setFont:v11];

  [v3 setTextAlignment:1];
  double v12 = +[UIColor blackColor];
  [v3 setShadowColor:v12];

  [v3 setShadowOffset:CGSizeZero.width, CGSizeZero.height];
  [v3 setShadowBlur:2.0];
  [v3 sizeToFit];
  [v3 frame];
  double v14 = v13;
  CGFloat v16 = v15;
  [(MonthViewOccurrence *)self->_draggedOccurrenceView frame];
  v37.origin.double x = (v17 - v14) * 0.5;
  v37.origin.CGFloat y = -50.0;
  v37.size.CGFloat width = v14;
  v37.size.CGFloat height = v16;
  CGRect v38 = CGRectInset(v37, -8.0, -8.0);
  double x = v38.origin.x;
  CGFloat y = v38.origin.y;
  CGFloat width = v38.size.width;
  CGFloat height = v38.size.height;
  [(MonthViewOccurrence *)self->_draggedOccurrenceView bounds];
  [v3 setFrame:x];
  double v22 = [v3 layer];
  [v22 setCornerRadius:8.0];

  id v23 = [v3 layer];
  [v23 setMaskedCorners:15];

  [v3 setClipsToBounds:1];
  double v24 = [(EKEvent *)self->_draggedOccurrence eventStore];
  double v25 = [(EKEvent *)self->_draggedOccurrence calendar];
  double v26 = [v24 colorForCalendar:v25];

  double v27 = CUIKColorLightenedToPercentageWithFinalAlpha();
  [v3 setBackgroundColor:v27];

  [(MonthViewOccurrence *)self->_draggedOccurrenceView addSubview:v3];
  [(MonthViewOccurrence *)self->_draggedOccurrenceView setClipsToBounds:0];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100035708;
  v31[3] = &unk_1001D29C8;
  id v32 = v3;
  double v33 = x;
  CGFloat v34 = y;
  CGFloat v35 = width;
  CGFloat v36 = height;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100035718;
  v29[3] = &unk_1001D27D8;
  id v30 = v32;
  id v28 = v32;
  +[UIView animateWithDuration:v31 animations:v29 completion:0.2];
}

- (BOOL)eventGestureControllerShouldAllowLongPress:(id)a3
{
  id v4 = a3;
  if ([(MonthViewController *)self dragAndDropAllowLongPress])
  {
    id v5 = [(CUIKCalendarModel *)self->super.super._model defaultCalendarForNewEvents];
    if (v5) {
      unsigned int v6 = [v4 dragGestureInProgress] ^ 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)eventGestureController:(id)a3 eventToStartInteractionWithAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if ([(MonthViewController *)self dragAndDropIsCurrentlyScrubbing])
  {
    id v7 = 0;
  }
  else
  {
    id v7 = -[MonthViewController occurrenceAtPoint:](self, "occurrenceAtPoint:", x, y);
    if (!v7)
    {
      BOOL v8 = [(CUIKCalendarModel *)self->super.super._model eventStore];
      id v7 = +[EKEvent eventWithEventStore:v8];

      double v9 = [(CUIKCalendarModel *)self->super.super._model defaultCalendarForNewEvents];
      [v7 setCalendar:v9];

      double v10 = -[MonthViewController dateAtPoint:](self, "dateAtPoint:", x, y);
      CGFloat v11 = [v10 date];
      if (v11)
      {
        [v7 setStartDate:v11];
      }
      else
      {
        double v12 = +[NSDate date];
        [v7 setStartDate:v12];
      }
      double v13 = [v7 startDate];
      double v14 = [v13 dateByAddingTimeInterval:1.0];
      [v7 setEndDate:v14];

      [v7 setAllDay:1];
    }
  }

  return v7;
}

- (id)eventGestureController:(id)a3 setUpAtPoint:(CGPoint)a4 withOccurrence:(id)a5 forceNewEvent:(BOOL)a6
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a5;
  if ([(MonthViewController *)self dragAndDropIsCurrentlyScrubbing])
  {
    -[MonthViewController dragAndDropScrubAtPoint:](self, "dragAndDropScrubAtPoint:", x, y);
    id v11 = 0;
    double v12 = v10;
    goto LABEL_33;
  }
  if (v10)
  {
    double v13 = [v10 startCalendarDate];
    double v14 = [v13 calendarDateForDay];
    initialDragDate = self->_initialDragDate;
    self->_initialDragDate = v14;

    double v12 = v10;
  }
  else
  {
    -[MonthViewController dateAtPoint:](self, "dateAtPoint:", x, y);
    CGFloat v16 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue();
    double v17 = self->_initialDragDate;
    self->_initialDragDate = v16;

    if (a6)
    {
      double v12 = 0;
    }
    else
    {
      double v12 = -[MonthViewController occurrenceAtPoint:](self, "occurrenceAtPoint:", x, y);
    }
  }
  CGPoint v61 = CGPointZero;
  unsigned __int8 v18 = -[MonthViewController monthWeekSubviewForScrollPoint:pointInWeek:](self, "monthWeekSubviewForScrollPoint:pointInWeek:", &v61, x, y);
  if (v12)
  {
    unsigned int v19 = [v12 isNew];
    p_draggingExistingEvent = &self->_draggingExistingEvent;
    self->_draggingExistingEvent = v19 ^ 1;
    if ((v19 ^ 1)) {
      goto LABEL_16;
    }
  }
  else
  {
    p_draggingExistingEvent = &self->_draggingExistingEvent;
    self->_draggingExistingEvent = 0;
    id v21 = [(CUIKCalendarModel *)self->super.super._model eventStore];
    double v12 = +[EKEvent eventWithEventStore:v21];
  }
  double v22 = [(CUIKCalendarModel *)self->super.super._model defaultCalendarForNewEvents];
  [v12 setCalendar:v22];

  id v23 = [(EKCalendarDate *)self->_initialDragDate date];
  if (v23)
  {
    [v12 setStartDate:v23];
  }
  else
  {
    double v24 = +[NSDate date];
    [v12 setStartDate:v24];
  }
  double v25 = [v12 startDate];
  double v26 = [v25 dateByAddingTimeInterval:1.0];
  [v12 setEndDate:v26];

  [v12 setAllDay:1];
  [v12 setTitle:&stru_1001D6918];
LABEL_16:
  p_draggedOccurrence = &self->_draggedOccurrence;
  objc_storeStrong((id *)&self->_draggedOccurrence, v12);
  id v28 = (MonthViewOccurrence *)[v18 newFeedbackViewForDraggingOccurrence:v12 atPoint:v61];
  draggedOccurrenceView = self->_draggedOccurrenceView;
  self->_draggedOccurrenceView = v28;

  if (self->_draggedOccurrenceView)
  {
    id v30 = [(MonthViewController *)self view];
    [v30 addSubview:self->_draggedOccurrenceView];

    if (!*p_draggingExistingEvent)
    {
      [(MonthViewOccurrence *)self->_draggedOccurrenceView frame];
      CGFloat v44 = CGRectGetWidth(v64) * -0.5;
      [(MonthViewOccurrence *)self->_draggedOccurrenceView frame];
      CGFloat Height = CGRectGetHeight(v65);
      self->_dragOffset.double x = v44;
      self->_dragOffset.double y = Height * -0.5;
      [(MonthViewOccurrence *)self->_draggedOccurrenceView frame];
      double v47 = v46;
      double v49 = v48;
      double v50 = x + self->_dragOffset.x;
      double v51 = y + self->_dragOffset.y;
      v52 = [(MonthViewController *)self view];
      v53 = [(InfiniteScrollViewController *)self scrollView];
      [v52 convertRect:v53 fromView:v50 toView:v51];
      -[MonthViewOccurrence setFrame:](self->_draggedOccurrenceView, "setFrame:");

LABEL_27:
      -[MonthViewController _updateDraggingOffsetTimesForPoint:](self, "_updateDraggingOffsetTimesForPoint:", x, y);
      -[MonthViewController _updateWeekHighlightsForDragPoint:](self, "_updateWeekHighlightsForDragPoint:", x, y);
      if (v10) {
        CalPopViewIn();
      }
      id v11 = v12;
      goto LABEL_32;
    }
    -[MonthViewController _startingFrameForEvent:atPoint:](self, "_startingFrameForEvent:atPoint:", v12, x, y);
    double v35 = v31;
    double v36 = v32;
    double v37 = v33;
    double v38 = v34;
    p_dragOffset = &self->_dragOffset;
    if (v10)
    {
      CGFloat v40 = CGRectGetWidth(*(CGRect *)&v31) * -0.5;
      v63.origin.double x = v35;
      v63.origin.double y = v36;
      v63.size.CGFloat width = v37;
      v63.size.CGFloat height = v38;
      CGFloat v41 = CGRectGetHeight(v63) * -0.5;
      p_dragOffset->double x = v40;
      self->_dragOffset.double y = v41;
      double v35 = x + v40;
      double v36 = y + v41;
    }
    else
    {
      CGFloat v54 = CGRectGetMinX(*(CGRect *)&v31) - x;
      v66.origin.double x = v35;
      v66.origin.double y = v36;
      v66.size.CGFloat width = v37;
      v66.size.CGFloat height = v38;
      CGFloat MinY = CGRectGetMinY(v66);
      p_dragOffset->double x = v54;
      self->_dragOffset.double y = MinY - y;
    }
    v56 = [(MonthViewController *)self view];
    v57 = [(InfiniteScrollViewController *)self scrollView];
    [v56 convertRect:v57 fromView:v35];
    -[MonthViewOccurrence setFrame:](self->_draggedOccurrenceView, "setFrame:");

    if ([(MonthViewController *)self scaleForDragging])
    {
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_10003602C;
      v60[3] = &unk_1001D2740;
      v60[4] = self;
      v58 = objc_retainBlock(v60);
      +[UIView animateWithDuration:4 delay:v58 options:0 animations:0.2 completion:0.0];
    }
    else
    {
      [(MonthViewOccurrence *)self->_draggedOccurrenceView setAlpha:0.8];
    }
    if ([v12 isEditable]) {
      goto LABEL_27;
    }
    CalPlopViewWithScaleFactorAndCompletion();
    -[MonthViewController selectOccurrence:inWeek:](self, "selectOccurrence:inWeek:", 0, 0, _NSConcreteStackBlock, 3221225472, sub_1000361AC, &unk_1001D2A18, self, *(void *)&x, *(void *)&y);
  }
  else
  {
    long long v42 = self->_initialDragDate;
    self->_initialDragDate = 0;

    long long v43 = *p_draggedOccurrence;
    *p_draggedOccurrence = 0;
  }
  id v11 = 0;
LABEL_32:

LABEL_33:

  return v11;
}

- (id)eventGestureControllerGetCurrentDraggingView:(id)a3
{
  return self->_draggedOccurrenceView;
}

- (void)eventGestureControllerRequestsUpdateOfDraggingView:(id)a3
{
}

- (void)eventGestureController:(id)a3 updateToPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if ([(MonthViewController *)self dragAndDropIsCurrentlyScrubbing])
  {
    -[MonthViewController dragAndDropScrubAtPoint:](self, "dragAndDropScrubAtPoint:", x, y);
  }
  else
  {
    if ([(MonthViewController *)self scaleForDragging])
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10003644C;
      v27[3] = &unk_1001D2A18;
      v27[4] = self;
      *(double *)&v27[5] = x;
      *(double *)&v27[6] = y;
      +[UIView animateWithDuration:4 delay:v27 options:0 animations:0.2 completion:0.0];
    }
    else
    {
      id v7 = [(InfiniteScrollViewController *)self scrollView];
      [(MonthViewOccurrence *)self->_draggedOccurrenceView frame];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      CGFloat v16 = [(MonthViewController *)self view];
      [v7 convertRect:v16 fromView:v9];

      double v17 = [(MonthViewController *)self view];
      CalRoundRectToScreenScale();
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v26 = [(InfiniteScrollViewController *)self scrollView];
      [v17 convertRect:v26 fromView:v19 toView:v21];
      -[MonthViewOccurrence setFrame:](self->_draggedOccurrenceView, "setFrame:");
    }
    -[MonthViewController _updateDraggingOffsetTimesForPoint:](self, "_updateDraggingOffsetTimesForPoint:", x, y);
    -[MonthViewController _updateWeekHighlightsForDragPoint:](self, "_updateWeekHighlightsForDragPoint:", x, y);
  }
}

- (void)eventGestureController:(id)a3 commitToPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = [(MainViewController *)self shownEventEditViewController];

  if (!v8)
  {
    CGPoint v76 = CGPointZero;
    double v9 = -[MonthViewController monthWeekSubviewForScrollPoint:pointInWeek:](self, "monthWeekSubviewForScrollPoint:pointInWeek:", &v76, x, y);
    if ([(MonthViewController *)self dragAndDropIsCurrentlyScrubbing])
    {
      -[MonthViewController dragAndDropScrubAtPoint:](self, "dragAndDropScrubAtPoint:", x, y);
      double v10 = [(MainViewController *)self model];
      double v11 = [v10 selectedOccurrence];

      if (!v11)
      {
        [(MonthViewController *)self dismissDraggedOccurrencePresentationAnimated:1];
        goto LABEL_18;
      }
      double v12 = [(MainViewController *)self model];
      double v13 = [v12 selectedOccurrence];
      double v14 = -[MonthViewController dateAtPoint:](self, "dateAtPoint:", x, y);
      [(MonthViewController *)self showDetailsForDraggedOccurrence:v13 inWeekView:v9 onDay:v14 creationMethod:1];

      goto LABEL_5;
    }
    double v15 = [v9 dateAtPoint:v76];
    if (v15 && self->_draggedStartDate)
    {
      draggedEndDate = self->_draggedEndDate;

      if (draggedEndDate)
      {
        -[MonthViewController _updateDraggingOffsetTimesForPoint:](self, "_updateDraggingOffsetTimesForPoint:", x, y);
        double v17 = [(EKCalendarDate *)self->_draggedStartDate date];
        [(EKEvent *)self->_draggedOccurrence setStartDate:v17];

        double v18 = [(EKCalendarDate *)self->_draggedEndDate date];
        [(EKEvent *)self->_draggedOccurrence setEndDate:v18];

        double v12 = +[UIApplication sharedApplication];
        if ([v12 optionKeyIsDown])
        {
          draggedOccurrence = self->_draggedOccurrence;
          double v19 = +[NSArray arrayWithObjects:&draggedOccurrence count:1];
          unsigned int v20 = +[CUIKPasteboardUtilities allEventsValidForAction:2 fromEvents:v19];

          if (v20)
          {
            double v21 = kCalUILogHandle;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "duplicating event(s) in large month view because option key is down", buf, 2u);
            }
            double v22 = [(MainViewController *)self model];
            double v23 = [v22 pasteboardManager];
            double v24 = [(EKEvent *)self->_draggedOccurrence startDate];
            [v23 setDateForPaste:v24];

            double v25 = [(MainViewController *)self model];
            double v26 = [v25 pasteboardManager];
            [v26 setCalendarForPaste:0];

            double v27 = [(MainViewController *)self model];
            id v28 = [v27 pasteboardManager];
            double v29 = +[NSSet setWithObject:self->_draggedOccurrence];
            [v28 duplicateEvents:v29 withDateMode:2 delegate:self];

            [(MonthViewController *)self removeDraggingOccurrenceAnimated:0];
            [(MonthViewController *)self removeAllWeekHighlights];
            [(MonthViewController *)self selectOccurrence:0 inWeek:0];
            goto LABEL_6;
          }
        }
        if ([(EKEvent *)self->_draggedOccurrence hasChanges])
        {
          [(EKEvent *)self->_draggedOccurrence isNew];
          CalAnalyticsSendEvent();
          if (self->_draggingExistingEvent
            && [(EKEvent *)self->_draggedOccurrence isOrWasPartOfRecurringSeries])
          {
            id v30 = self->_draggedOccurrence;
            v69[0] = _NSConcreteStackBlock;
            v69[1] = 3221225472;
            v69[2] = sub_100036E38;
            v69[3] = &unk_1001D2A68;
            v69[4] = self;
            double v71 = x;
            double v72 = y;
            id v70 = v9;
            CGPoint v73 = v76;
            [v7 promptUserForRecurrenceActionOnOccurrence:v30 whenFinished:v69];

            goto LABEL_6;
          }
          [(MonthViewController *)self _saveDraggedEventWithSpan:0];
          unsigned int v35 = [(EKEvent *)self->_draggedOccurrence isNew];
          double v13 = [v9 dateAtPoint:v76];
          if (v35)
          {
            [v9 frameForOccurrenceAfterLastOnDay:v13];
            double v37 = v36;
            double v39 = v38;
            double v41 = v40;
            double v43 = v42;
            CGFloat v44 = [(MonthViewController *)self view];
            [v44 convertRect:v9 fromView:v37];
            double v46 = v45;
            double v48 = v47;
            double v50 = v49;
            double v52 = v51;

            [(MonthViewOccurrence *)self->_draggedOccurrenceView frame];
            double v54 = v53;
            double v56 = v55;
            double v58 = v57;
            double v60 = v59;
            -[MonthViewOccurrence setFrame:](self->_draggedOccurrenceView, "setFrame:", v46, v48, v50, v52);
            [(MonthViewOccurrence *)self->_draggedOccurrenceView setNeedsDisplay];
            CGPoint v61 = [(MonthViewOccurrence *)self->_draggedOccurrenceView layer];
            [v61 displayIfNeeded];

            [(MonthViewOccurrence *)self->_draggedOccurrenceView setClipsToBounds:1];
            [(MonthViewOccurrence *)self->_draggedOccurrenceView setContentMode:0];
            -[MonthViewOccurrence setFrame:](self->_draggedOccurrenceView, "setFrame:", v54, v56, v58, v60);
            v68[0] = _NSConcreteStackBlock;
            v68[1] = 3221225472;
            v68[2] = sub_100036FB0;
            v68[3] = &unk_1001D29C8;
            v68[4] = self;
            *(double *)&v68[5] = v46;
            *(double *)&v68[6] = v48;
            *(double *)&v68[7] = v50;
            *(double *)&v68[8] = v52;
            v67[0] = _NSConcreteStackBlock;
            v67[1] = 3221225472;
            v67[2] = sub_100036FD0;
            v67[3] = &unk_1001D27D8;
            v67[4] = self;
            +[UIView animateWithDuration:4 delay:v68 options:v67 animations:0.4 completion:0.0];
            [(MonthViewController *)self showEditorForNewDraggedEvent:self->_draggedOccurrence inWeek:v9];
LABEL_5:

LABEL_6:
LABEL_18:

            goto LABEL_19;
          }
          v62 = _NSConcreteStackBlock;
          uint64_t v63 = 3221225472;
          CGRect v64 = sub_100037020;
          CGRect v65 = &unk_1001D2740;
          CGRect v66 = self;
          double v31 = &v62;
          double v32 = self;
          double v33 = v13;
          uint64_t v34 = 1;
        }
        else
        {
          double v13 = [v9 dateAtPoint:v76];
          v74[0] = _NSConcreteStackBlock;
          v74[1] = 3221225472;
          v74[2] = sub_100036DE8;
          v74[3] = &unk_1001D2740;
          v74[4] = self;
          double v31 = (void ***)v74;
          double v32 = self;
          double v33 = v13;
          uint64_t v34 = 0;
        }
        -[MonthViewController _animateDraggingOccurrenceToDate:atLastPosition:dropPoint:completion:](v32, "_animateDraggingOccurrenceToDate:atLastPosition:dropPoint:completion:", v33, v34, v31, x, y, v62, v63, v64, v65, v66);
        goto LABEL_5;
      }
    }
    else
    {
    }
    -[MonthViewController draggedOccurrenceWasCancelled:atPoint:](self, "draggedOccurrenceWasCancelled:atPoint:", self->_draggedOccurrence, x, y);
    [(MonthViewController *)self removeDraggingOccurrenceAnimated:1];
    [(MonthViewController *)self removeAllWeekHighlights];
    goto LABEL_18;
  }
LABEL_19:
}

- (CGRect)eventGestureController:(id)a3 finalFrameAfterCommitAtPoint:(CGPoint)a4
{
  -[MonthViewController _mainFrameForEvent:atLastPosition:atPoint:](self, "_mainFrameForEvent:atLastPosition:atPoint:", self->_draggedOccurrence, 0, a4.x, a4.y);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)eventGestureControllerCancelled:(id)a3
{
  [(MonthViewController *)self removeDraggingOccurrenceAnimated:1];

  [(MonthViewController *)self removeAllWeekHighlights];
}

- (void)eventGestureControllerScrollTimerFired:(id)a3
{
  if (!self->_draggedOccurrence) {
    return;
  }
  id v30 = [(MainViewController *)self existingPalette];
  double v4 = [v30 superview];
  [v30 frame];
  double MaxY = CGRectGetMaxY(v32);
  double v6 = [(MonthViewController *)self view];
  [v4 convertPoint:v6 toView:0.0, MaxY];
  double v8 = v7;

  double v9 = [(MonthViewController *)self navigationController];
  double v10 = [v9 toolbar];
  double v11 = [v10 superview];
  double v12 = [(MonthViewController *)self navigationController];
  double v13 = [v12 toolbar];
  [v13 frame];
  double MinY = CGRectGetMinY(v33);
  double v15 = [(MonthViewController *)self view];
  [v11 convertPoint:v15 toView:0.0, MinY];
  double v17 = v16;

  [(MonthViewOccurrence *)self->_draggedOccurrenceView frame];
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  if (CGRectGetMinY(v34) < v8 + 15.0)
  {
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    double v22 = CGRectGetMinY(v35) - v8 + -15.0;
LABEL_7:
    if (v22 != 0.0 && CGFloatIsValid())
    {
      double v23 = v22 * 0.25;
      double v24 = [(InfiniteScrollViewController *)self scrollView];
      [v24 contentOffset];
      double v26 = v25;
      double v28 = v27;

      double v29 = [(InfiniteScrollViewController *)self scrollView];
      [v29 setContentOffset:v26, v23 + v28];
    }
    goto LABEL_10;
  }
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  if (CGRectGetMaxY(v36) > v17 + -15.0)
  {
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double v22 = CGRectGetMaxY(v37) - (v17 + -15.0);
    goto LABEL_7;
  }
LABEL_10:
}

- (void)eventGestureController:(id)a3 setDraggingViewHidden:(BOOL)a4
{
  BOOL v4 = a4;
  [(MonthViewOccurrence *)self->_draggedOccurrenceView setHidden:a4];
  if (v4)
  {
    [(MonthViewController *)self removeAllWeekHighlights];
  }
}

- (void)eventGestureController:(id)a3 requestsPresentationOfViewController:(id)a4
{
}

- (void)eventGestureController:(id)a3 requestsShowEvent:(id)a4
{
  id v5 = a4;
  [(MonthViewController *)self removeDraggingOccurrenceAnimated:0];
  [(MainViewController *)self showEvent:v5 animated:1 showMode:1 context:0];
}

- (void)eventGestureController:(id)a3 requestedCancellationAnimationAtPoint:(CGPoint)a4 withOccurrence:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  double v9 = [(MainViewController *)self shownEventViewController];

  if (!v9)
  {
    if (!v8)
    {
      -[MonthViewController occurrenceAtPoint:](self, "occurrenceAtPoint:", x, y);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    CGPoint v24 = CGPointZero;
    double v10 = -[MonthViewController monthWeekSubviewForScrollPoint:pointInWeek:](self, "monthWeekSubviewForScrollPoint:pointInWeek:", &v24, x, y);
    id v11 = [v10 newFeedbackViewForDraggingOccurrence:v8 atPoint:v24];
    if (v11)
    {
      double v12 = [(MonthViewController *)self view];
      [v12 addSubview:v11];

      -[MonthViewController _startingFrameForEvent:atPoint:](self, "_startingFrameForEvent:atPoint:", v8, x, y);
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v21 = [(MonthViewController *)self view];
      double v22 = [(InfiniteScrollViewController *)self scrollView];
      [v21 convertRect:v22 fromView:v14, v16, v18, v20];
      [v11 setFrame:];

      [v11 setAlpha:0.8];
      id v23 = v11;
      CalPlopViewWithScaleFactorAndCompletion();
      -[MonthViewController selectOccurrence:inWeek:](self, "selectOccurrence:inWeek:", 0, 0, _NSConcreteStackBlock, 3221225472, sub_1000375FC, &unk_1001D28A8, self);
    }
  }
}

- (UIFont)headerFont
{
  return self->_headerFont;
}

- (BOOL)shouldShowMonthTitleHUDWhenScrolling
{
  return self->_shouldShowMonthTitleHUDWhenScrolling;
}

- (void)setShouldShowMonthTitleHUDWhenScrolling:(BOOL)a3
{
  self->_shouldShowMonthTitleHUDWhenScrolling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFont, 0);
  objc_storeStrong((id *)&self->_draggedOccurrenceView, 0);
  objc_storeStrong((id *)&self->_draggedOccurrence, 0);
  objc_storeStrong((id *)&self->_draggedEndDate, 0);
  objc_storeStrong((id *)&self->_draggedStartDate, 0);
  objc_storeStrong((id *)&self->_initialDragDate, 0);
  objc_storeStrong((id *)&self->_gestureController, 0);
  objc_storeStrong((id *)&self->_monthTitleView, 0);
  objc_storeStrong((id *)&self->_decelerationTargetDate, 0);

  objc_storeStrong((id *)&self->_backButtonDate, 0);
}

- (int64_t)intendedSizeClass
{
  return 0;
}

- (CGRect)frameForWeekContainingDate:(id)a3
{
  sub_100037858();
  sub_10003783C();
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)frameForTodayHighlight
{
  sub_100037858();
  sub_10003783C();
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)cellFramesForWeekContainingDate:(id)a3
{
  return 0;
}

@end