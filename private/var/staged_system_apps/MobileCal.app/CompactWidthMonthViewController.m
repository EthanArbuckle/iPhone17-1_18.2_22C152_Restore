@interface CompactWidthMonthViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (BOOL)shouldAnimateTransitionToDay;
+ (Class)monthWeekViewClass;
+ (double)monthWeekScale;
+ (double)scaleForSize:(unint64_t)a3;
+ (void)setMonthWeekScaleSize:(unint64_t)a3;
- (BOOL)_isTodayCircleFrameFullyUnobstructed;
- (BOOL)_isTodayHighlightVisible;
- (BOOL)_shouldAnimateDots;
- (BOOL)dividedListMode;
- (BOOL)dragAndDropAllowLongPress;
- (BOOL)eventViewControllerShouldHideInlineEditButton;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isTodayVisible;
- (BOOL)pinchToZoomAllowed;
- (BOOL)scaleForDragging;
- (BOOL)shouldUpdateSelectedDateWithCentralView;
- (BOOL)suspendEventLoading;
- (CGPoint)_originForSelectedMonthViewInScrollViewWithState:(BOOL)a3;
- (CGRect)frameForTodayHighlight;
- (CGRect)frameForWeekContainingDate:(id)a3;
- (CGRect)frameOfListView;
- (CompactWidthMonthViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5;
- (UILongPressGestureRecognizer)dayCellsScrubbingGestureRecognizer;
- (UIPinchGestureRecognizer)pinchRecognizer;
- (UITapGestureRecognizer)dayCellsTapGestureRecognizer;
- (double)_bottomOfCurrentMonth;
- (double)_scrollViewVerticalVelocity;
- (double)_showDateVerticalOffset;
- (double)decelerationDistanceThresholdForDisplayingMonthBanner;
- (double)decelerationDistanceThresholdForPreferringMonthBoundary;
- (double)decelerationDistanceThresholdToStopShowingMonthBanner;
- (double)heightForSubviewWithCalendarDate:(id)a3;
- (double)monthWeekScale;
- (double)showDateVerticalOffsetForDate:(id)a3;
- (id)_dayInMonth:(id)a3 fromGesture:(id)a4;
- (id)_eventInMonthWeekView:(id)a3 fromGesture:(id)a4;
- (id)_loadEventsForStartDate:(id)a3 endDate:(id)a4;
- (id)_monthForLastVisibleMonth;
- (id)_snapshotViewForDividedListTransition:(id)a3 useFastPath:(BOOL)a4;
- (id)_viewFromGesture:(id)a3;
- (id)_weekViewAtScrollPoint:(CGPoint)a3 pointInWeek:(CGPoint *)a4;
- (id)bestDateForNewEvent;
- (id)calendarModel;
- (id)cellFramesForWeekContainingDate:(id)a3;
- (id)createInitialViewForDate:(id)a3;
- (id)dateForCurrentMonthOnScreen;
- (id)dateForTopVisibleMonthOnScreen;
- (id)newBottomViewBelowViewWithCalendarDate:(id)a3;
- (id)newTopViewAboveViewWithCalendarDate:(id)a3;
- (id)occurrenceAtPoint:(CGPoint)a3;
- (id)preferredPreSizeClassTransitionSelectedDate;
- (id)pushedDayViewControllerWithDate:(id)a3 animated:(BOOL)a4;
- (id)pushedListViewControllerWithDate:(id)a3 animated:(BOOL)a4;
- (id)pushedMultiDayViewControllerWithDate:(id)a3 animated:(BOOL)a4;
- (id)sceneTitle;
- (id)targetCalendarDate;
- (id)updateBackButtonWhileTopViewControllerToDate:(id)a3;
- (int)supportedToggleMode;
- (int64_t)eventCountDisplayedForDate:(id)a3;
- (int64_t)intendedSizeClass;
- (unint64_t)_numberOfWeeksInSelectedMonth;
- (unint64_t)_offsetNumberOfWeeksFromSelectedMonthForBottomVisibleMonth;
- (unint64_t)_offsetNumberOfWeeksFromSelectedMonthForTopVisibleMonth;
- (unint64_t)maximumCachedReusableViews;
- (unint64_t)supportedInterfaceOrientations;
- (void)_animateChangeToWeekSize:(unint64_t)a3 divided:(BOOL)a4;
- (void)_cachedOccurrencesChanged:(id)a3;
- (void)_createMonthHighlightForMonthView:(id)a3 day:(id)a4;
- (void)_dayIndexesForRangeStart:(id)a3 rangeEnd:(id)a4 outFirstDayIndex:(int64_t *)a5 outLastDayIndex:(int64_t *)a6;
- (void)_loadEventDataForMonthWeekView:(id)a3;
- (void)_loadEventsForAllSubviews;
- (void)_loadEventsForViewsInRangeStartingAt:(id)a3 endingAt:(id)a4;
- (void)_modelUnlocked;
- (void)_monthScrollerPinched:(id)a3;
- (void)_occurrencesChanged:(id)a3;
- (void)_registerGestureRecognizers;
- (void)_removeMonthHighlight;
- (void)_resetSelectionForDividedListState:(BOOL)a3;
- (void)_scrubGestureCallback:(id)a3;
- (void)_setSelectedDay:(id)a3;
- (void)_setSelectedDay:(id)a3 onMonthWeekView:(id)a4 animated:(BOOL)a5;
- (void)_setupListViewController;
- (void)_showDetailsForEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)_tapGestureCallback:(id)a3;
- (void)_unregisterGestureRecognizers;
- (void)_updateDateForDividedList;
- (void)_updateDividedListTopLineForDividedMode:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateListViewFrame;
- (void)_updateMonthTitleViewFont;
- (void)_updateNavigationControllerBackButton;
- (void)_updateNavigationControllerBackButtonToDate:(id)a3;
- (void)_updateViewsForTimeZoneChange;
- (void)_weekStartChanged:(id)a3;
- (void)animateToMonthWeekSize:(unint64_t)a3 divided:(BOOL)a4;
- (void)applySizeToPinchView:(unint64_t)a3 compressed:(BOOL)a4 snapToBoundary:(BOOL)a5;
- (void)calendarModelTimeZoneChanged;
- (void)compactMonthListViewController:(id)a3 didSelectEvent:(id)a4 showMode:(unint64_t)a5;
- (void)compactMonthListViewController:(id)a3 wantsToCommitViewControllerFromPreview:(id)a4;
- (void)contentSizeCategoryChanged;
- (void)dealloc;
- (void)didEndScrolling;
- (void)didLoadInitialViews;
- (void)didScroll;
- (void)dragAndDropRequestsPresentationOfViewController:(id)a3;
- (void)endAnimationSplitState;
- (void)enterAnimationSplitStateWithCutOutArea:(CGRect)a3 topBoundary:(double)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewController:(id)a3 willDismissEditViewController:(id)a4 deleted:(BOOL)a5;
- (void)eventViewControllerWillDisappear:(id)a3;
- (void)finishChangeScale;
- (void)forceUpdateListView;
- (void)loadView;
- (void)localeChanged;
- (void)monthView:(id)a3 gestureBegan:(id)a4;
- (void)monthView:(id)a3 gestureCancelled:(id)a4;
- (void)monthView:(id)a3 gestureChanged:(id)a4;
- (void)monthView:(id)a3 gestureEnded:(id)a4;
- (void)prepareToChangeScaleFromPinch:(BOOL)a3;
- (void)relayoutPinchView;
- (void)setDayCellsScrubbingGestureRecognizer:(id)a3;
- (void)setDayCellsTapGestureRecognizer:(id)a3;
- (void)setDividedListMode:(BOOL)a3;
- (void)setPinchRecognizer:(id)a3;
- (void)setSplitStateOpen:(BOOL)a3;
- (void)setSuspendEventLoading:(BOOL)a3;
- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)showEditorForNewDraggedEvent:(id)a3 inWeek:(id)a4;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)significantTimeChangeOccurred;
- (void)updatePalette:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4;
@end

@implementation CompactWidthMonthViewController

- (id)pushedDayViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:a3];
  v6 = [DayViewContainerViewController alloc];
  model = self->super.super.super.super._model;
  v8 = [(MainViewController *)self window];
  v9 = [(MainViewControllerContainer *)v6 initWithModel:model window:v8];

  v10 = [(CompactWidthMonthViewController *)self navigationController];
  [v10 pushViewController:v9 animated:v4];

  return v9;
}

- (CompactWidthMonthViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CompactWidthMonthViewController;
  v11 = [(MonthViewController *)&v25 initWithCalendarDate:v8 model:v9 window:v10];
  v12 = v11;
  if (v11)
  {
    v13 = [(MainViewController *)v11 model];
    v12->_dividedListMode = [v13 showMonthAsDivided];

    uint64_t v14 = objc_opt_new();
    pinchScrollView = v12->_pinchScrollView;
    v12->_pinchScrollView = (UIScrollView *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("monthReload", v16);
    reloadQueue = v12->_reloadQueue;
    v12->_reloadQueue = (OS_dispatch_queue *)v17;

    objc_initWeak(&location, v12);
    uint64_t v26 = objc_opt_class();
    v19 = +[NSArray arrayWithObjects:&v26 count:1];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000919F4;
    v22[3] = &unk_1001D2620;
    objc_copyWeak(&v23, &location);
    id v20 = [(CompactWidthMonthViewController *)v12 registerForTraitChanges:v19 withHandler:v22];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (BOOL)dividedListMode
{
  return self->_dividedListMode;
}

- (int)supportedToggleMode
{
  return 2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CUIKPreferencesNotification_EventsInPhoneMonthView object:0];
  [v3 removeObserver:self name:CUIKCalendarModelDisplayedOccurrencesChangedNotification object:self->super.super.super.super._model];
  [v3 removeObserver:self name:CUIKCalendarModelCachedOccurrencesChangedNotification object:self->super.super.super.super._model];
  [v3 removeObserver:self name:CUIKPreferencesNotification_WeekStart object:0];
  [v3 removeObserver:self name:CUIKCalendarModelDidUnlockNotification object:self->super.super.super.super._model];

  v4.receiver = self;
  v4.super_class = (Class)CompactWidthMonthViewController;
  [(MonthViewController *)&v4 dealloc];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)pinchToZoomAllowed
{
  return !self->_dividedListMode;
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)CompactWidthMonthViewController;
  [(MonthViewController *)&v10 loadView];
  [(CompactWidthMonthViewController *)self _updateMonthTitleViewFont];
  id v3 = [objc_alloc((Class)UIPinchGestureRecognizer) initWithTarget:self action:"_monthScrollerPinched:"];
  [(CompactWidthMonthViewController *)self setPinchRecognizer:v3];

  objc_super v4 = [(CompactWidthMonthViewController *)self view];
  v5 = [(CompactWidthMonthViewController *)self pinchRecognizer];
  [v4 addGestureRecognizer:v5];

  BOOL v6 = [(CompactWidthMonthViewController *)self pinchToZoomAllowed];
  v7 = [(CompactWidthMonthViewController *)self pinchRecognizer];
  [v7 setEnabled:v6];

  id v8 = [(CompactWidthMonthViewController *)self pinchRecognizer];
  [v8 setDelegate:self];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"_cachedOccurrencesChanged:" name:CUIKCalendarModelCachedOccurrencesChangedNotification object:self->super.super.super.super._model];
  [v9 addObserver:self selector:"_occurrencesChanged:" name:CUIKCalendarModelDisplayedOccurrencesChangedNotification object:self->super.super.super.super._model];
  [v9 addObserver:self selector:"_weekStartChanged:" name:CUIKPreferencesNotification_WeekStart object:0];
  [v9 addObserver:self selector:"_modelUnlocked" name:CUIKCalendarModelDidUnlockNotification object:self->super.super.super.super._model];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)CompactWidthMonthViewController;
  [(InfiniteScrollViewController *)&v13 viewDidLoad];
  unsigned int v3 = [(CompactWidthMonthViewController *)self dividedListMode];
  objc_super v4 = &UIScrollViewDecelerationRateFast;
  if (!v3) {
    objc_super v4 = &UIScrollViewDecelerationRateNormal;
  }
  double v5 = *v4;
  BOOL v6 = [(InfiniteScrollViewController *)self scrollView];
  [v6 setDecelerationRate:v5];

  v7 = [(CompactWidthMonthViewController *)self traitCollection];
  +[UITraitCollection _setCurrentTraitCollection:v7];

  if ([(CompactWidthMonthViewController *)self dividedListMode])
  {
    [(CompactWidthMonthViewController *)self _setupListViewController];
    [(CompactWidthMonthViewController *)self _updateListViewFrame];
    if ([(CompactWidthMonthViewController *)self dividedListMode])
    {
      id v8 = [(id)objc_opt_class() dividedModeBackgroundColor];
      id v9 = [(InfiniteScrollViewController *)self scrollView];
      [v9 setBackgroundColor:v8];
    }
    objc_super v10 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    v11 = [(MonthViewController *)self adjustSelectedDateForNewMonth:v10];

    [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:v11];
  }
  else
  {
    v11 = +[UIColor systemBackgroundColor];
    v12 = [(InfiniteScrollViewController *)self scrollView];
    [v12 setBackgroundColor:v11];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompactWidthMonthViewController;
  [(MonthViewController *)&v4 viewWillAppear:a3];
  self->_shouldSetSelectedDate = 1;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompactWidthMonthViewController;
  [(CompactMonthViewController *)&v4 viewIsAppearing:a3];
  [(CompactWidthMonthViewController *)self ekui_adjustNavAndToolBarToTranslucentGrayStyles];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CompactWidthMonthViewController;
  -[CompactMonthViewController viewDidAppear:](&v16, "viewDidAppear:");
  if ([(CompactWidthMonthViewController *)self dividedListMode])
  {
    [(CompactWidthMonthViewController *)self _updateDividedListTopLineForDividedMode:[(CompactWidthMonthViewController *)self dividedListMode] animated:v3];
    double v5 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDay];
    BOOL v6 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDay];
    v7 = [(InfiniteScrollViewController *)self subviewForDate:v6];
    [(CompactWidthMonthViewController *)self _setSelectedDay:v5 onMonthWeekView:v7 animated:v3];

    id v8 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    id v9 = [v8 calendarDateForEndOfMonth];

    objc_super v10 = [(InfiniteScrollViewController *)self subviewForDate:v9];
    if (v10)
    {
      v11 = [(CompactWidthMonthViewController *)self view];
      v12 = [v11 window];

      if (v12) {
        goto LABEL_4;
      }
      objc_super v13 = [(CompactWidthMonthViewController *)self navigationController];
      uint64_t v14 = [v13 view];
      v15 = [v14 window];

      if (!v15)
      {
LABEL_4:
        [(CompactWidthMonthViewController *)self _updateListViewFrame];
      }
      else
      {
        EKUIPushFallbackSizingContextWithViewHierarchy();
        [(CompactWidthMonthViewController *)self _updateListViewFrame];
        EKUIPopFallbackSizingContextWithViewHierarchy();
      }
    }
  }
  self->_reloadAfterStoppedScrolling = 0;
  if (self->_needToReloadEventsOnAppear
    || self->_eventLoadingSuspendedForScroll
    || self->_eventLoadingSuspendedForPinching)
  {
    self->_needToReloadEventsOnAppear = 0;
    self->_eventLoadingSuspendedForScroll = 0;
    self->_eventLoadingSuspendedForPinching = 0;
    [(CompactWidthMonthViewController *)self _loadEventsForAllSubviews];
  }
  [(CompactWidthMonthViewController *)self _registerGestureRecognizers];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompactWidthMonthViewController;
  [(MonthViewController *)&v4 viewWillDisappear:a3];
  [(CompactWidthMonthViewController *)self _unregisterGestureRecognizers];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CompactWidthMonthViewController *)self _removeMonthHighlight];
  currentBackButtonDate = self->_currentBackButtonDate;
  self->_currentBackButtonDate = 0;

  v6.receiver = self;
  v6.super_class = (Class)CompactWidthMonthViewController;
  [(CompactWidthMonthViewController *)&v6 viewDidDisappear:v3];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)_setupListViewController
{
  if (!self->_listViewController)
  {
    BOOL v3 = (UIView *)objc_alloc_init((Class)UIView);
    listViewContainer = self->_listViewContainer;
    self->_listViewContainer = v3;

    [(UIView *)self->_listViewContainer setAutoresizingMask:10];
    double v5 = [(CompactWidthMonthViewController *)self view];
    [v5 bounds];
    -[UIView setFrame:](self->_listViewContainer, "setFrame:");

    objc_super v6 = +[UIColor systemBackgroundColor];
    [(UIView *)self->_listViewContainer setBackgroundColor:v6];

    v7 = [(CompactWidthMonthViewController *)self view];
    [v7 addSubview:self->_listViewContainer];

    id v8 = [[CompactMonthListViewController alloc] initWithModel:self->super.super.super.super._model];
    listViewController = self->_listViewController;
    self->_listViewController = v8;

    [(CompactMonthListViewController *)self->_listViewController setCompactMonthListViewDelegate:self];
    [(CompactWidthMonthViewController *)self addChildViewController:self->_listViewController];
    objc_super v10 = [(CompactMonthListViewController *)self->_listViewController view];
    [v10 setAutoresizingMask:18];

    [(UIView *)self->_listViewContainer bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = [(CompactMonthListViewController *)self->_listViewController view];
    [v19 setFrame:v12, v14, v16, v18];

    [(CompactMonthListViewController *)self->_listViewController setDisabled:[(CompactWidthMonthViewController *)self dividedListMode] ^ 1];
    id v20 = self->_listViewContainer;
    v21 = [(CompactMonthListViewController *)self->_listViewController view];
    [(UIView *)v20 addSubview:v21];

    v22 = [(CompactWidthMonthViewController *)self view];
    [v22 frame];
    double v24 = v23;
    double v26 = v25;

    v27 = [(CompactWidthMonthViewController *)self view];
    [v27 bounds];
    double Height = CGRectGetHeight(v36);

    -[UIView setFrame:](self->_listViewContainer, "setFrame:", v24, Height, v26, 320.0);
    [(UIView *)self->_listViewContainer setHidden:[(CompactWidthMonthViewController *)self dividedListMode] ^ 1];
    [(UIView *)self->_listViewContainer setUserInteractionEnabled:[(CompactWidthMonthViewController *)self dividedListMode]];
    v29 = (UIView *)objc_alloc_init((Class)UIView);
    v30 = +[UIColor separatorColor];
    [(UIView *)v29 setBackgroundColor:v30];

    [(UIView *)v29 setAutoresizingMask:34];
    [(UIView *)self->_listViewContainer frame];
    double v32 = v31;
    EKUIScaleFactor();
    CalRoundToScreenScale();
    -[UIView setFrame:](v29, "setFrame:", 0.0, 0.0, v32, v33);
    [(UIView *)self->_listViewContainer addSubview:v29];
    listViewContainerTopLine = self->_listViewContainerTopLine;
    self->_listViewContainerTopLine = v29;
  }
}

- (double)monthWeekScale
{
  if ([(CompactWidthMonthViewController *)self dividedListMode]
    && !self->_dividedListModeAnimationInProgress)
  {
    return 1.0;
  }
  double result = self->_pinchingMonthWeekScale;
  if (result <= 0.0)
  {
    objc_super v4 = objc_opt_class();
    [v4 monthWeekScale];
  }
  return result;
}

+ (double)scaleForSize:(unint64_t)a3
{
  if (a3 == 1) {
    return 1.0;
  }
  if (a3 == 2) {
    +[CompactMonthWeekView narrowScale];
  }
  else {
    +[CompactMonthWeekView eventScaleForNumberOfRows:](CompactMonthWeekView, "eventScaleForNumberOfRows:");
  }
  return result;
}

+ (double)monthWeekScale
{
  BOOL v3 = +[CUIKPreferences sharedPreferences];
  id v4 = [v3 monthViewScaleSize];

  [a1 scaleForSize:v4];
  return result;
}

+ (void)setMonthWeekScaleSize:(unint64_t)a3
{
  id v4 = +[CUIKPreferences sharedPreferences];
  [v4 setMonthViewScaleSize:a3];

  if (a3 >= 3)
  {
    id v5 = +[CUIKPreferences sharedPreferences];
    [v5 setMonthViewEventScaleSize:a3];
  }
}

- (void)relayoutPinchView
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v3 = self->_pinchViews;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    double v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [(UIScrollView *)self->_pinchScrollView bounds];
        [v9 sizeThatFits:v10, v11];
        double v13 = v12;
        [v9 frame];
        [v9 setFrame:];
        double v7 = v7 + v13;
        [v9 layoutSubviews];
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  pinchScrollView = self->_pinchScrollView;
  [(UIScrollView *)pinchScrollView contentSize];
  -[UIScrollView setContentSize:](pinchScrollView, "setContentSize:");
}

- (void)prepareToChangeScaleFromPinch:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(InfiniteScrollViewController *)self scrollView];
  [v5 setHidden:1];

  [(InfiniteScrollViewController *)self setSuppressViewAdjustments:1];
  uint64_t v6 = [(CompactWidthMonthViewController *)self view];
  [v6 addSubview:self->_pinchScrollView];

  double v7 = [(CompactWidthMonthViewController *)self view];
  [v7 frame];
  -[UIScrollView setFrame:](self->_pinchScrollView, "setFrame:");

  pinchViews = self->_pinchViews;
  if (!pinchViews)
  {
    id v9 = (NSMutableArray *)objc_opt_new();
    double v10 = self->_pinchViews;
    self->_pinchViews = v9;

    pinchViews = self->_pinchViews;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  double v11 = pinchViews;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v63;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v63 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v62 + 1) + 8 * i) removeFromSuperview];
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v13);
  }

  [(NSMutableArray *)self->_pinchViews removeAllObjects];
  long long v16 = [(InfiniteScrollViewController *)self allViews];
  long long v17 = [v16 firstObject];

  long long v18 = [(CompactWidthMonthViewController *)self view];
  [v17 frame];
  double v20 = v19;
  double v22 = v21;
  double v23 = [(InfiniteScrollViewController *)self scrollView];
  [v18 convertPoint:v23 fromView:v20];
  double v25 = v24;
  double v27 = v26;

  double v28 = -v27;
  v57 = v17;
  v29 = [v17 calendarDate];
  v30 = [(InfiniteScrollViewController *)self allViews];
  double v31 = [v30 lastObject];
  double v32 = [v31 calendarDate];

  double v33 = [(InfiniteScrollViewController *)self allViews];
  v34 = +[NSMutableArray arrayWithArray:v33];

  [(CompactWidthMonthViewController *)self setSuspendEventLoading:1];
  if (v3)
  {
    uint64_t v35 = 0;
  }
  else
  {
    uint64_t v35 = (uint64_t)[v34 count];
    if (v35 > 8)
    {
      v49 = v32;
      goto LABEL_20;
    }
  }
  uint64_t v36 = v35 - 9;
  do
  {
    if (v3)
    {
      id v37 = [(CompactWidthMonthViewController *)self newTopViewAboveViewWithCalendarDate:v29];
      [v34 insertObject:v37 atIndex:0];
      uint64_t v38 = [v37 calendarDate];

      [(UIScrollView *)self->_pinchScrollView bounds];
      [v37 sizeThatFits:v39, v40];
      double v42 = v41;
      [v37 setFrame:0.0, 0.0, v43, v41];
      double v28 = v28 + v42;

      v29 = (void *)v38;
    }
    id v44 = [(CompactWidthMonthViewController *)self newBottomViewBelowViewWithCalendarDate:v32];
    [v34 addObject:v44];
    [(UIScrollView *)self->_pinchScrollView bounds];
    [v44 sizeThatFits:v45, v46];
    [v44 setFrame:0.0, 0.0, v47, v48];
    v49 = [v44 calendarDate];

    double v32 = v49;
  }
  while (!__CFADD__(v36++, 1));
LABEL_20:
  [(CompactWidthMonthViewController *)self setSuspendEventLoading:0];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v51 = v34;
  id v52 = [v51 countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v52)
  {
    id v53 = v52;
    uint64_t v54 = *(void *)v59;
    do
    {
      for (j = 0; j != v53; j = (char *)j + 1)
      {
        if (*(void *)v59 != v54) {
          objc_enumerationMutation(v51);
        }
        v56 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
        [v56 setDrawWithViews:1];
        [(UIScrollView *)self->_pinchScrollView addSubview:v56];
        [(NSMutableArray *)self->_pinchViews addObject:v56];
        [v56 setHidden:0];
      }
      id v53 = [v51 countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v53);
  }

  [(CompactWidthMonthViewController *)self relayoutPinchView];
  -[UIScrollView setContentOffset:](self->_pinchScrollView, "setContentOffset:", v25, v28);
}

- (void)applySizeToPinchView:(unint64_t)a3 compressed:(BOOL)a4 snapToBoundary:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = [(InfiniteScrollViewController *)self scrollView];
  [v9 adjustedContentInset];
  double v11 = v10;

  [(UIScrollView *)self->_pinchScrollView contentOffset];
  double v13 = v12;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v14 = self->_pinchViews;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v15)
  {
    unint64_t v43 = a3;
    BOOL v16 = v5;
    double v17 = v11 + v13;
    uint64_t v18 = *(void *)v49;
    double v19 = 0.0;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v14);
        }
        double v21 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        [v21 frame];
        double v19 = v19 + v22;
        if (v19 > v17)
        {
          id v15 = v21;
          [v15 frame];
          double v25 = v17 - (v19 - v24);
          [v15 frame];
          double v23 = v25 / v26;
          goto LABEL_11;
        }
      }
      id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    double v23 = 0.0;
LABEL_11:
    BOOL v5 = v16;
    a3 = v43;
  }
  else
  {
    double v23 = 0.0;
  }

  [(id)objc_opt_class() setMonthWeekScaleSize:a3];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  double v27 = self->_pinchViews;
  id v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v45;
    double v31 = 0.0;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(v27);
        }
        double v33 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
        [v33 setCompressedVerticalMode:v6];
        [(UIScrollView *)self->_pinchScrollView bounds];
        [v33 sizeThatFits:v34, v35];
        double v37 = v36;
        [v33 frame];
        [v33 setFrame:];
        double v31 = v31 + v37;
      }
      id v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v29);
  }

  pinchScrollView = self->_pinchScrollView;
  [(UIScrollView *)pinchScrollView contentSize];
  -[UIScrollView setContentSize:](pinchScrollView, "setContentSize:");
  if (v5)
  {
    double v39 = 0.0;
    if ([v15 containsFirstDayOfMonth])
    {
      +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance];
      double v39 = v40;
    }
  }
  else
  {
    [v15 frame];
    double v39 = v23 * v41;
  }
  [v15 frame];
  -[UIScrollView setContentOffset:animated:](self->_pinchScrollView, "setContentOffset:animated:", 0, 0.0, v39 + v42 - v11);
}

- (void)finishChangeScale
{
  p_pinchScrollView = &self->_pinchScrollView;
  id v4 = [(UIScrollView *)self->_pinchScrollView subviews];
  BOOL v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  BOOL v6 = [(UIScrollView *)*p_pinchScrollView subviews];
  double v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);

  self->_pinchingMonthWeekScale = 0.0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = self->_pinchViews;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        double v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v12 frame];
        uint64_t v14 = +[NSNumber numberWithDouble:v13];
        [v7 addObject:v14];

        id v15 = [v12 calendarDate];
        [v5 addObject:v15];

        [v12 layoutSubviews];
        [v12 setDrawWithViews:0];
        [(CompactWidthMonthViewController *)self _loadEventDataForMonthWeekView:v12];
      }
      id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  [(InfiniteScrollViewController *)self insertViews:self->_pinchViews];
  BOOL v16 = [(InfiniteScrollViewController *)self scrollView];
  [v16 setHidden:0];

  [(InfiniteScrollViewController *)self resizeAllViews];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100093358;
  v18[3] = &unk_1001D3A68;
  v18[4] = self;
  id v17 = v7;
  id v19 = v17;
  double v20 = v21;
  [v5 enumerateObjectsUsingBlock:v18];
  [(InfiniteScrollViewController *)self setSuppressViewAdjustments:0];
  [(UIScrollView *)self->_pinchScrollView removeFromSuperview];
  [(InfiniteScrollViewController *)self adjustLoadedViewRange];
  [(CompactWidthMonthViewController *)self _resetSelectionForDividedListState:[(CompactWidthMonthViewController *)self dividedListMode]];

  _Block_object_dispose(v21, 8);
}

- (void)_animateChangeToWeekSize:(unint64_t)a3 divided:(BOOL)a4
{
  BOOL v33 = a4;
  +[CompactWidthMonthViewController scaleForSize:](CompactWidthMonthViewController, "scaleForSize:");
  double v6 = v5;
  double v7 = +[CUIKPreferences sharedPreferences];
  +[CompactWidthMonthViewController scaleForSize:](CompactWidthMonthViewController, "scaleForSize:", [v7 monthViewScaleSize]);
  double v9 = v8;

  [(CompactWidthMonthViewController *)self prepareToChangeScaleFromPinch:0];
  uint64_t v10 = [(CompactWidthMonthViewController *)self pinchRecognizer];
  [v10 setEnabled:0];

  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  char v58 = 0;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100093A98;
  v53[3] = &unk_1001D3A90;
  v56 = v57;
  id v11 = (id)objc_opt_new();
  id v54 = v11;
  v55 = self;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100093B64;
  v51[3] = &unk_1001D3AB8;
  v51[4] = self;
  v51[5] = a3;
  BOOL v52 = v33;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100093B78;
  v48[3] = &unk_1001D3AE0;
  long long v50 = v57;
  double v12 = objc_retainBlock(v53);
  id v49 = v12;
  +[UIView animateWithSpringDuration:65540 bounce:v51 initialSpringVelocity:v48 delay:0.25 options:0.0 animations:0.0 completion:0.0];
  if (v6 != v9)
  {
    [v11 addObjectsFromArray:self->_pinchViews];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    double v13 = self->_pinchViews;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v44 objects:v59 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v45;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v45 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100093B98;
          v40[3] = &unk_1001D3388;
          id v41 = v11;
          double v42 = v17;
          unint64_t v43 = v12;
          [v17 animateToScale:v40 fromScale:v6 completionBlock:v9];
        }
        id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v44 objects:v59 count:16];
      }
      while (v14);
    }
  }
  if ([(CompactWidthMonthViewController *)self dividedListMode] != v33)
  {
    uint64_t v18 = [(CompactWidthMonthViewController *)self view];
    [v18 bringSubviewToFront:self->_listViewContainer];

    if (v33)
    {
      [(UIView *)self->_listViewContainer setHidden:0];
      [(CompactMonthListViewController *)self->_listViewController setDisabled:0];
      id v19 = [(CompactMonthListViewController *)self->_listViewController view];
      [v19 setAlpha:1.0];

      [(UIView *)self->_listViewContainerTopLine setAlpha:1.0];
      [(UIView *)self->_listViewContainer frame];
      double v21 = v20;
      double v23 = v22;
      long long v24 = [(CompactWidthMonthViewController *)self view];
      [v24 frame];
      double v26 = v25;

      -[UIView setFrame:](self->_listViewContainer, "setFrame:", 0.0, v26, v21, v23);
    }
    else
    {
      [(CompactWidthMonthViewController *)self _resetSelectionForDividedListState:0];
    }
    [(CompactWidthMonthViewController *)self _updateDividedListTopLineForDividedMode:v33 animated:0];
    double v27 = [(InfiniteScrollViewController *)self scrollView];
    id v28 = v27;
    double v29 = UIScrollViewDecelerationRateFast;
    if (!v33) {
      double v29 = UIScrollViewDecelerationRateNormal;
    }
    [v27 setDecelerationRate:v29];

    uint64_t v30 = [(MainViewController *)self model];
    [v30 setShowMonthAsDivided:v33];

    [(CompactWidthMonthViewController *)self setDividedListMode:v33];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100093BE0;
    v38[3] = &unk_1001D2718;
    BOOL v39 = v33;
    v38[4] = self;
    double v31 = objc_retainBlock(v38);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100093CF4;
    v35[3] = &unk_1001D3688;
    v35[4] = self;
    BOOL v37 = v33;
    double v36 = v12;
    double v32 = objc_retainBlock(v35);
    +[UIView _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:v31 options:v32 animations:0.0 completion:0.0];
  }
  _Block_object_dispose(v57, 8);
}

- (void)animateToMonthWeekSize:(unint64_t)a3 divided:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = +[CUIKPreferences sharedPreferences];
  id v8 = [v7 monthViewScaleSize];

  if (v8 != (id)a3 || [(CompactWidthMonthViewController *)self dividedListMode] != v4)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    double v9 = self->_pinchViews;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v41;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v40 + 1) + 8 * v13) animating]) {
          break;
        }
        if (v11 == (id)++v13)
        {
          id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v11) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
LABEL_24:

      return;
    }
LABEL_11:

    id v14 = [(InfiniteScrollViewController *)self scrollView];
    if (([v14 isScrollAnimating] & 1) == 0)
    {
      uint64_t v15 = [(InfiniteScrollViewController *)self scrollView];
      if (![v15 isDecelerating])
      {
        double v31 = [(InfiniteScrollViewController *)self scrollView];
        unsigned __int8 v32 = [v31 isDragging];

        if ((v32 & 1) == 0) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
LABEL_15:
    BOOL v16 = [(InfiniteScrollViewController *)self scrollView];
    [v16 contentOffset];
    double v18 = v17;
    double v20 = v19;

    double v21 = [(InfiniteScrollViewController *)self scrollView];
    [v21 stopScrollingAndZooming];

    double v22 = [(InfiniteScrollViewController *)self scrollView];
    [v22 setContentOffset:0 animated:v18];

LABEL_16:
    if ([(CompactWidthMonthViewController *)self dividedListMode] == v4)
    {
      [(CompactWidthMonthViewController *)self _animateChangeToWeekSize:a3 divided:v4];
      return;
    }
    self->_dividedListModeAnimationInProgress = 1;
    [(CompactWidthMonthViewController *)self _setupListViewController];
    double v23 = CUIKTodayDate();
    long long v24 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    double v25 = [v24 timeZone];
    double v9 = +[EKCalendarDate calendarDateWithDate:v23 timeZone:v25];

    double v26 = [(InfiniteScrollViewController *)self subviewForDate:v9];
    [v26 setDisableTodayPulse:1];
    if (v4)
    {
      double v27 = [(CompactWidthMonthViewController *)self dateForTopVisibleMonthOnScreen];
      id v28 = [v27 calendarDateForMonth];
      double v29 = [v28 date];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000941AC;
      v33[3] = &unk_1001D3B08;
      id v34 = v26;
      id v35 = v27;
      double v36 = self;
      BOOL v37 = v9;
      unint64_t v38 = a3;
      BOOL v39 = v4;
      id v30 = v27;
      [(CompactWidthMonthViewController *)self showDate:v29 animated:1 completionBlock:v33];
    }
    else
    {
      [v26 setDisableTodayPulse:0];
      [(CompactWidthMonthViewController *)self _animateChangeToWeekSize:a3 divided:0];
    }

    goto LABEL_24;
  }
}

- (void)_monthScrollerPinched:(id)a3
{
  id v4 = a3;
  double v5 = (char *)[v4 state];
  if ((unint64_t)(v5 - 3) <= 2)
  {
    self->_eventLoadingSuspendedForPinching = 0;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    double v6 = self->_pinchViews;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v117 objects:v123 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v118;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v118 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v117 + 1) + 8 * i) finishAnimations];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v117 objects:v123 count:16];
      }
      while (v8);
    }

    id v11 = [(NSMutableArray *)self->_pinchViews firstObject];
    [(CompactWidthMonthViewController *)self monthWeekScale];
    id v12 = [v11 nearestSnapBoundaryForScale:];
    self->_double pinchingMonthWeekScale = 0.0;
    uint64_t v13 = [(CompactWidthMonthViewController *)self pinchRecognizer];
    [v13 setEnabled:0];

    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472;
    v116[2] = sub_100094B7C;
    v116[3] = &unk_1001D2A40;
    v116[4] = self;
    v116[5] = v12;
    v115[0] = _NSConcreteStackBlock;
    v115[1] = 3221225472;
    v115[2] = sub_100094B90;
    v115[3] = &unk_1001D27D8;
    v115[4] = self;
    +[UIView animateWithSpringDuration:65540 bounce:v116 initialSpringVelocity:v115 delay:0.25 options:0.0 animations:0.0 completion:0.0];
  }
  unint64_t v14 = (unint64_t)[v4 numberOfTouches];
  if ((v14 | 2) == 2)
  {
    unint64_t v15 = v14;
    p_lastPinchPoint = &self->_lastPinchPoint;
    double x = self->_lastPinchPoint.x;
    double y = self->_lastPinchPoint.y;
    if (v14)
    {
      double v19 = [(CompactWidthMonthViewController *)self view];
      [v4 locationOfTouch:0 inView:v19];
      double v21 = v20;

      double v22 = [(CompactWidthMonthViewController *)self view];
      [v4 locationOfTouch:1 inView:v22];
      double v24 = v23;

      double v25 = [(InfiniteScrollViewController *)self scrollView];
      [v25 safeAreaInsets];
      p_lastPinchPoint->double x = 0.0;
      self->_lastPinchPoint.double y = (v21 + v24) * 0.5 - v26;
    }
    if (v5 != (char *)2)
    {
      if (v5 == (char *)1)
      {
        self->_eventLoadingSuspendedForPinching = 1;
        double v27 = [(InfiniteScrollViewController *)self scrollView];
        id v28 = [v27 panGestureRecognizer];
        [v28 setEnabled:0];

        double v29 = [(InfiniteScrollViewController *)self scrollView];
        id v30 = [v29 panGestureRecognizer];
        [v30 setEnabled:1];

        if (v15)
        {
          double v31 = [(CompactWidthMonthViewController *)self view];
          pinchDistanceForGestureRecognizer();
          self->_lastPinchDistance.double x = v32;
          self->_lastPinchDistance.double y = v33;
        }
        [(CompactWidthMonthViewController *)self prepareToChangeScaleFromPinch:1];
        self->_originalPinchDistance = self->_lastPinchDistance.y;
        [(CompactWidthMonthViewController *)self monthWeekScale];
        self->_double originalPinchScale = v34;
        self->_double pinchingMonthWeekScale = v34;
      }
      goto LABEL_74;
    }
    uint64_t v35 = 456;
    double pinchingMonthWeekScale = self->_pinchingMonthWeekScale;
    if (v15)
    {
      BOOL v37 = [(CompactWidthMonthViewController *)self view];
      pinchDistanceForGestureRecognizer();
      double v39 = v38;

      double v40 = self->_originalPinchScale * (v39 / self->_originalPinchDistance);
    }
    else
    {
      double originalPinchScale = self->_originalPinchScale;
      [v4 scale];
      double v40 = originalPinchScale * v42;
    }
    +[CompactMonthViewController minimumWeekScale];
    if (v40 < v43)
    {
      +[CompactMonthViewController minimumWeekScale];
      double v40 = v44;
    }
    +[CompactMonthViewController maximumWeekScale];
    if (v40 > v45)
    {
      +[CompactMonthViewController maximumWeekScale];
      double v40 = v46;
    }
    double v47 = v40 / pinchingMonthWeekScale;
    if (v40 / pinchingMonthWeekScale == 1.0)
    {
      +[CompactMonthViewController minimumWeekScale];
      +[CompactMonthViewController maximumWeekScale];
      double v47 = 1.0;
    }
    long long v48 = self->_pinchScrollView;
    if (v15)
    {
      id v49 = [(CompactWidthMonthViewController *)self view];
      -[UIScrollView convertPoint:fromView:](v48, "convertPoint:fromView:", v49, x, y);
      double v51 = v50;
      double v53 = v52;
    }
    else
    {
      [v4 locationInView:v48];
      double v51 = v54;
      double v53 = v55;
    }
    v106 = v48;
    if (v40 / pinchingMonthWeekScale == 1.0) {
      goto LABEL_59;
    }
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    v56 = self->_pinchViews;
    id v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v111 objects:v122 count:16];
    if (v57)
    {
      id v58 = v57;
      uint64_t v101 = 456;
      unint64_t v102 = v15;
      id v104 = v4;
      v105 = &self->_lastPinchPoint;
      v103 = self;
      int v59 = 0;
      int v60 = 0;
      uint64_t v61 = *(void *)v112;
      do
      {
        for (j = 0; j != v58; j = (char *)j + 1)
        {
          if (*(void *)v112 != v61) {
            objc_enumerationMutation(v56);
          }
          long long v63 = *(void **)(*((void *)&v111 + 1) + 8 * (void)j);
          unsigned __int8 v64 = [v63 hideDaySummariesWithScale:pinchingMonthWeekScale v101, v102, v103, v104];
          unsigned int v65 = [v63 hideDaySummariesWithScale:v40];
          if (v64) {
            v59 |= v65 ^ 1;
          }
          else {
            v59 |= v65;
          }
          if (v64) {
            v60 |= v65 ^ 1;
          }
          else {
            v60 |= v65;
          }
          unsigned int v66 = [v63 isNarrowWithScale:pinchingMonthWeekScale];
          unsigned int v67 = [v63 isNarrowWithScale:v40];
          if (!(v66 | v67 ^ 1)) {
            v60 |= v65;
          }
          if (v66 && (v67 & 1) == 0 && ((v65 ^ 1) & 1) == 0)
          {
            [v63 finishAnimations];
            int v60 = 1;
          }
          if (([v63 animating] | v59)) {
            [v63 animateToScale:0 fromScale:v40 completionBlock:pinchingMonthWeekScale];
          }
          id v68 = [v63 nearestSnapBoundaryForScale:v40];
        }
        unint64_t v69 = (unint64_t)v68;
        id v58 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v111 objects:v122 count:16];
      }
      while (v58);

      p_lastPinchPoint = v105;
      if (v60)
      {
        v70 = +[CUIKPreferences sharedPreferences];
        [v70 setMonthViewScaleSize:v69];

        v71 = objc_opt_new();
        [v71 impactOccurredWithIntensity:2.0];
        self = v103;
        id v4 = v104;
        uint64_t v35 = v101;
        unint64_t v15 = v102;
LABEL_58:
        self->_lastSnapScale = v69;
        *(double *)((char *)&self->super.super.super.super.super.super.super.isa + v35) = v40;

LABEL_59:
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        v73 = self->_pinchViews;
        id v74 = [(NSMutableArray *)v73 countByEnumeratingWithState:&v107 objects:v121 count:16];
        if (v74)
        {
          id v75 = v74;
          uint64_t v76 = *(void *)v108;
          double v77 = 0.0;
          do
          {
            for (k = 0; k != v75; k = (char *)k + 1)
            {
              if (*(void *)v108 != v76) {
                objc_enumerationMutation(v73);
              }
              v79 = *(void **)(*((void *)&v107 + 1) + 8 * (void)k);
              [(UIScrollView *)self->_pinchScrollView bounds];
              [v79 sizeThatFits:v80, v81];
              double v83 = v82;
              [v79 frame];
              [v79 setFrame:];
              double v77 = v77 + v83;
              [v79 layoutSubviews];
            }
            id v75 = [(NSMutableArray *)v73 countByEnumeratingWithState:&v107 objects:v121 count:16];
          }
          while (v75);
        }

        pinchScrollView = self->_pinchScrollView;
        [(UIScrollView *)pinchScrollView contentSize];
        -[UIScrollView setContentSize:](pinchScrollView, "setContentSize:");
        [(UIScrollView *)self->_pinchScrollView contentOffset];
        double v86 = v85;
        double v88 = v87;
        double v89 = v47 * v53;
        if (v15)
        {
          v90 = [(CompactWidthMonthViewController *)self view];
          v91 = v106;
          [v90 convertPoint:v106 fromView:v51];
          double v93 = v92;

          double v94 = v93 - p_lastPinchPoint->y;
        }
        else
        {
          v91 = v106;
          [v4 locationInView:v106];
          double v94 = v89 - v95;
        }
        double v96 = v88 + v94;
        [(UIScrollView *)self->_pinchScrollView contentSize];
        double v98 = v97;
        [(UIScrollView *)self->_pinchScrollView frame];
        double v100 = 0.0;
        if (v96 >= 0.0) {
          double v100 = v96;
        }
        if (v100 >= v98 - v99) {
          double v100 = v98 - v99;
        }
        -[UIScrollView setContentOffset:animated:](self->_pinchScrollView, "setContentOffset:animated:", 0, v86, v100);

        goto LABEL_74;
      }
      self = v103;
      id v4 = v104;
      uint64_t v35 = v101;
      unint64_t v15 = v102;
    }
    else
    {

      unint64_t v69 = 0;
    }
    v72 = objc_opt_new();
    v71 = v72;
    if (v69 != self->_lastSnapScale) {
      [v72 impactOccurredWithIntensity:0.0];
    }
    goto LABEL_58;
  }
LABEL_74:
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CompactWidthMonthViewController;
  id v7 = a4;
  -[InfiniteScrollViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100094CC8;
  v8[3] = &unk_1001D2E40;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (unint64_t)maximumCachedReusableViews
{
  return 18;
}

- (id)createInitialViewForDate:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if ([v4 day] != (id)1)
  {
    double v5 = [v4 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];
  }
  double v6 = [(InfiniteScrollViewController *)self dequeueReusableView];
  if (v6)
  {
    id v7 = v6;
    [v6 setCompressedVerticalMode:[self dividedListMode]];
    [v7 setCalendarDate:v5];
  }
  else
  {
    id v8 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    id v7 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "monthWeekViewClass")), "initWithCalendarDate:calendar:compressed:", v5, v8, -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"));
  }
  [v7 setWeekDelegate:self];
  if ([(CompactWidthMonthViewController *)self dividedListMode] && !self->_selectedMonthWeekView)
  {
    objc_super v9 = [v7 calendarDate];
    [v9 absoluteTime];
    double v11 = v10;
    id v12 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    [v12 absoluteTime];
    if (v11 <= v13)
    {
      unint64_t v14 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      [v14 absoluteTime];
      double v16 = v15;
      double v17 = [v7 endCalendarDate];
      [v17 absoluteTime];
      double v19 = v18;

      if (v16 > v19) {
        goto LABEL_13;
      }
      objc_super v9 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      [(CompactWidthMonthViewController *)self _setSelectedDay:v9 onMonthWeekView:v7 animated:0];
    }
    else
    {
    }
  }
LABEL_13:
  [(CompactWidthMonthViewController *)self _loadEventDataForMonthWeekView:v7];
  double v20 = +[CUIKPreferences sharedPreferences];
  [v7 setShowWeekNumber:[v20 showWeekNumbers]];

  return v7;
}

- (id)newTopViewAboveViewWithCalendarDate:(id)a3
{
  id v4 = [(MonthViewController *)self calendarDateForSubviewAboveSubviewWithCalendarDate:a3];
  double v5 = [(InfiniteScrollViewController *)self dequeueReusableView];
  if (v5)
  {
    id v6 = v5;
    [v5 setCompressedVerticalMode:[self dividedListMode]];
    [v6 setCalendarDate:v4];
  }
  else
  {
    id v7 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    id v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "monthWeekViewClass")), "initWithCalendarDate:calendar:compressed:", v4, v7, -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"));
  }
  [v6 setWeekDelegate:self];
  if (![(CompactWidthMonthViewController *)self suspendEventLoading]) {
    [(CompactWidthMonthViewController *)self _loadEventDataForMonthWeekView:v6];
  }
  if ([(CompactWidthMonthViewController *)self dividedListMode] && !self->_selectedMonthWeekView)
  {
    id v8 = [v6 calendarDate];
    [v8 absoluteTime];
    double v10 = v9;
    double v11 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    [v11 absoluteTime];
    if (v10 > v12)
    {

LABEL_12:
      goto LABEL_13;
    }
    double v13 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    [v13 absoluteTime];
    double v15 = v14;
    double v16 = [v6 endCalendarDate];
    [v16 absoluteTime];
    double v18 = v17;

    if (v15 <= v18)
    {
      id v8 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      [(CompactWidthMonthViewController *)self _setSelectedDay:v8 onMonthWeekView:v6 animated:0];
      goto LABEL_12;
    }
  }
LABEL_13:
  double v19 = +[CUIKPreferences sharedPreferences];
  [v6 setShowWeekNumber:[v19 showWeekNumbers]];

  return v6;
}

- (id)newBottomViewBelowViewWithCalendarDate:(id)a3
{
  id v4 = [(MonthViewController *)self calendarDateForSubviewBelowSubviewWithCalendarDate:a3];
  double v5 = [(InfiniteScrollViewController *)self dequeueReusableView];
  if (v5)
  {
    id v6 = v5;
    [v5 setCompressedVerticalMode:[self dividedListMode]];
    [v6 setCalendarDate:v4];
  }
  else
  {
    id v7 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    id v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "monthWeekViewClass")), "initWithCalendarDate:calendar:compressed:", v4, v7, -[CompactWidthMonthViewController dividedListMode](self, "dividedListMode"));
  }
  [v6 setWeekDelegate:self];
  if (![(CompactWidthMonthViewController *)self suspendEventLoading]) {
    [(CompactWidthMonthViewController *)self _loadEventDataForMonthWeekView:v6];
  }
  if ([(CompactWidthMonthViewController *)self dividedListMode] && !self->_selectedMonthWeekView)
  {
    id v8 = [v6 calendarDate];
    [v8 absoluteTime];
    double v10 = v9;
    double v11 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    [v11 absoluteTime];
    if (v10 < v12)
    {

LABEL_12:
      goto LABEL_13;
    }
    double v13 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    [v13 absoluteTime];
    double v15 = v14;
    double v16 = [v6 endCalendarDate];
    [v16 absoluteTime];
    double v18 = v17;

    if (v15 <= v18)
    {
      id v8 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      [(CompactWidthMonthViewController *)self _setSelectedDay:v8 onMonthWeekView:v6 animated:0];
      goto LABEL_12;
    }
  }
LABEL_13:
  double v19 = +[CUIKPreferences sharedPreferences];
  [v6 setShowWeekNumber:[v19 showWeekNumbers]];

  return v6;
}

- (void)didEndScrolling
{
  v9.receiver = self;
  v9.super_class = (Class)CompactWidthMonthViewController;
  [(MonthViewController *)&v9 didEndScrolling];
  if (self->_eventLoadingSuspendedForScroll && !self->_reloadAfterStoppedScrolling)
  {
    self->_reloadAfterStoppedScrolling = 1;
    dispatch_time_t v3 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100095590;
    block[3] = &unk_1001D2740;
    block[4] = self;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  if ([(CompactWidthMonthViewController *)self dividedListMode]
    && [(InfiniteScrollViewController *)self viewIsVisible])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000955C4;
    v7[3] = &unk_1001D2740;
    v7[4] = self;
    +[UIView _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:v7 options:0 animations:0.0 completion:0.0];
    id v4 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    double v5 = [(InfiniteScrollViewController *)self subviewForDate:v4];

    if (v5 != self->_selectedMonthWeekView)
    {
      id v6 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      [(CompactWidthMonthViewController *)self _setSelectedDay:v6 onMonthWeekView:v5 animated:1];
    }
  }
  else if ([(CompactWidthMonthViewController *)self dividedListMode] {
         && ![(InfiniteScrollViewController *)self viewIsVisible])
  }
  {
    self->_listFrameNeedsUpdate = 1;
  }
}

- (void)willEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  double y = a3.y;
  double x = a3.x;
  if (![(CompactWidthMonthViewController *)self dividedListMode])
  {
    v81.receiver = self;
    v81.super_class = (Class)CompactWidthMonthViewController;
    -[MonthViewController willEndDraggingWithVelocity:targetContentOffset:](&v81, "willEndDraggingWithVelocity:targetContentOffset:", a4, x, y);
    return;
  }
  id v8 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  double v9 = -y;
  if (y >= 0.0) {
    double v9 = y;
  }
  if (v9 <= 0.3)
  {
    CGFloat v33 = [(InfiniteScrollViewController *)self scrollView];
    [v33 contentOffset];
    double v35 = v34;
    double v37 = v36;

    double v38 = [(InfiniteScrollViewController *)self scrollView];
    [v38 frame];
    double v40 = v39;

    long long v41 = [(InfiniteScrollViewController *)self scrollView];
    [v41 safeAreaInsets];
    double v43 = v42;
    double v44 = [(InfiniteScrollViewController *)self scrollView];
    [v44 safeAreaInsets];
    double v46 = v40 - (v43 + v45);

    [(UIView *)self->_listViewContainer bounds];
    id v79 = 0;
    -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](self, "nearestMajorBoundaryForPoint:date:", &v79, v35, v37 + (v46 - CGRectGetHeight(v82)) * 0.5);
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    id v32 = v79;
    a4->double x = v48;
    a4->double y = v50;
    double v10 = v8;
  }
  else
  {
    double v10 = self->_selectedMonthWeekView;
    if (!v10)
    {
      double v10 = [(InfiniteScrollViewController *)self firstView];
    }
    double v11 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    double v12 = v11;
    if (y > 0.0) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = -1;
    }
    double v14 = [v11 calendarDateByAddingMonths:v13];
    double v15 = [v14 calendarDateForMonth];

    double v16 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    double v17 = [(CompactMonthWeekView *)v10 calendarDate];
    double v18 = [v17 date];
    double v19 = [v15 date];
    double v20 = [v16 components:0x2000 fromDate:v18 toDate:v19 options:0];

    [(CompactMonthWeekView *)v10 frame];
    double v22 = v21;
    [(CompactMonthWeekView *)v10 frame];
    double v24 = v23;
    double v26 = v25 + (double)(uint64_t)[v20 weekOfYear] * v22;
    if (y <= 0.0)
    {
      objc_msgSend(objc_msgSend((id)objc_opt_class(), "monthWeekViewClass"), "headerHeight");
      double v26 = v26 - v27;
    }
    id v80 = v15;
    -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](self, "nearestMajorBoundaryForPoint:date:", &v80, v24, v26);
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    id v32 = v80;

    a4->double x = v29;
    a4->double y = v31;
  }
  double v51 = [(InfiniteScrollViewController *)self scrollView];
  [v51 contentOffset];
  CalRoundPointToScreenScale();
  double v53 = v52;
  double v55 = v54;

  v56 = [(InfiniteScrollViewController *)self scrollView];
  [v56 stopScrollingAndZooming];

  id v57 = [(InfiniteScrollViewController *)self scrollView];
  [v57 setContentOffset:0 animated:v53];

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100095C18;
  v78[3] = &unk_1001D2A40;
  v78[4] = self;
  v78[5] = a4;
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_100095C74;
  v77[3] = &unk_1001D27D8;
  v77[4] = self;
  +[UIView _animateUsingDefaultDampedSpringWithDelay:393222 initialSpringVelocity:v78 options:v77 animations:0.0 completion:y];
  id v58 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  id v59 = [v58 month];
  if (v59 != [v32 month])
  {

LABEL_19:
    long long v63 = [(MonthViewController *)self adjustSelectedDateForNewMonth:v32];

    unsigned __int8 v64 = [(MainViewController *)self model];
    [v64 setSelectedDate:v63];

    if ([(InfiniteScrollViewController *)self viewIsVisible])
    {
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_100095C7C;
      v76[3] = &unk_1001D2740;
      v76[4] = self;
      +[UIView _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:v76 options:0 animations:0.0 completion:0.0];
      unsigned int v65 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      unsigned int v66 = [(InfiniteScrollViewController *)self subviewForDate:v65];

      unsigned int v67 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      [(CompactWidthMonthViewController *)self _setSelectedDay:v67 onMonthWeekView:v66 animated:1];
    }
    goto LABEL_21;
  }
  int v60 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  id v61 = [v60 year];
  id v62 = [v32 year];

  if (v61 != v62) {
    goto LABEL_19;
  }
  long long v63 = v32;
LABEL_21:
  id v68 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  unint64_t v69 = [v68 calendarDateForMonth];
  v70 = [(InfiniteScrollViewController *)self subviewForDate:v69];

  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_100095C84;
  v74[3] = &unk_1001D2740;
  id v75 = v70;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100095C90;
  v72[3] = &unk_1001D27D8;
  id v73 = v75;
  id v71 = v75;
  +[UIView _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:v74 options:v72 animations:0.0 completion:0.0];
}

- (void)didScroll
{
  v9.receiver = self;
  v9.super_class = (Class)CompactWidthMonthViewController;
  [(CompactMonthViewController *)&v9 didScroll];
  dispatch_time_t v3 = [(MainViewController *)self model];
  id v4 = [v3 selectedOccurrence];
  double v5 = [v4 startCalendarDate];

  uint64_t v6 = [(CompactWidthMonthViewController *)self targetCalendarDate];
  id v7 = (void *)v6;
  id v8 = v5;
  if (v5 || (id v8 = (void *)v6) != 0) {
    [(CompactWidthMonthViewController *)self _updateNavigationControllerBackButtonToDate:v8];
  }
  self->_reloadAfterStoppedScrolling = 0;
}

- (id)targetCalendarDate
{
  dispatch_time_t v3 = [(InfiniteScrollViewController *)self scrollView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(InfiniteScrollViewController *)self scrollView];
  [v8 frame];
  double v10 = v9;

  double v11 = [(InfiniteScrollViewController *)self scrollView];
  [v11 safeAreaInsets];
  double v13 = v12;
  double v14 = [(InfiniteScrollViewController *)self scrollView];
  [v14 safeAreaInsets];
  double v16 = v10 - (v13 + v15);

  if ([(CompactWidthMonthViewController *)self dividedListMode]
    && !self->_dividedListModeAnimationInProgress)
  {
    [(UIView *)self->_listViewContainer frame];
    if (v17 >= v16) {
      [(CompactWidthMonthViewController *)self _updateListViewFrame];
    }
  }
  [(UIView *)self->_listViewContainer bounds];
  double Height = CGRectGetHeight(v23);
  if ([(InfiniteScrollViewController *)self subviewCount] < 1)
  {
    id v19 = 0;
  }
  else
  {
    id v21 = 0;
    -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](self, "nearestMajorBoundaryForPoint:date:", &v21, v5, v7 + (v16 - Height) * 0.5);
    id v19 = v21;
  }

  return v19;
}

- (void)didLoadInitialViews
{
  if ([(CompactWidthMonthViewController *)self dividedListMode])
  {
    [(CompactWidthMonthViewController *)self _updateListViewFrame];
  }
}

- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CompactWidthMonthViewController;
  [(InfiniteScrollViewController *)&v10 showDate:a3 animated:a4 completionBlock:a5];
  if ([(CompactWidthMonthViewController *)self dividedListMode])
  {
    double v7 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    id v8 = [(InfiniteScrollViewController *)self subviewForDate:v7];

    double v9 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    [(CompactWidthMonthViewController *)self _setSelectedDay:v9 onMonthWeekView:v8 animated:v5];
  }
}

- (BOOL)shouldUpdateSelectedDateWithCentralView
{
  return ![(CompactWidthMonthViewController *)self dividedListMode];
}

- (id)cellFramesForWeekContainingDate:(id)a3
{
  model = self->super.super.super.super._model;
  id v5 = a3;
  double v6 = [(CUIKCalendarModel *)model calendar];
  double v7 = [v6 timeZone];
  id v8 = +[EKCalendarDate calendarDateWithDate:v5 timeZone:v7];

  double v9 = [(InfiniteScrollViewController *)self subviewForDate:v8];
  objc_super v10 = [v9 dayNumberCellFrames];

  return v10;
}

- (void)contentSizeCategoryChanged
{
  v3.receiver = self;
  v3.super_class = (Class)CompactWidthMonthViewController;
  [(CompactMonthViewController *)&v3 contentSizeCategoryChanged];
  [(CompactWidthMonthViewController *)self _updateMonthTitleViewFont];
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    unsigned int v12 = [(CompactWidthMonthViewController *)self dividedListMode];
    double v13 = [v10 startCalendarDate];
    [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:v13];

    if (!v12 || a5) {
      [(CompactWidthMonthViewController *)self _showDetailsForEvent:v10 animated:v8 showMode:a5 context:v11];
    }
  }
  else
  {
    double v14 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No event given.  Will not show event through Month View.", v15, 2u);
    }
  }
}

- (void)updatePalette:(id)a3
{
  id v4 = a3;
  [v4 setWeekdayHeaderFillsHalfWidth:0];
  v5.receiver = self;
  v5.super_class = (Class)CompactWidthMonthViewController;
  [(CompactMonthViewController *)&v5 updatePalette:v4];
}

- (void)_updateNavigationControllerBackButtonToDate:(id)a3
{
  id v5 = a3;
  id v4 = [(CompactWidthMonthViewController *)self navigationController];
  if (objc_opt_respondsToSelector()) {
    [v4 updateBackButtonToDate:v5];
  }
}

- (void)_updateNavigationControllerBackButton
{
  id v3 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  [(CompactWidthMonthViewController *)self _updateNavigationControllerBackButtonToDate:v3];
}

- (id)updateBackButtonWhileTopViewControllerToDate:(id)a3
{
  id v5 = a3;
  double v6 = v5;
  p_currentBackButtonDate = &self->_currentBackButtonDate;
  if (*p_currentBackButtonDate
    && (id v8 = [v5 month], v8 == -[EKCalendarDate month](*p_currentBackButtonDate, "month"))
    && (id v9 = [v6 year], v9 == -[EKCalendarDate year](*p_currentBackButtonDate, "year"))
    && (id v10 = [v6 day], v10 == -[EKCalendarDate day](*p_currentBackButtonDate, "day")))
  {
    id v11 = 0;
  }
  else
  {
    objc_storeStrong((id *)p_currentBackButtonDate, a3);
    unsigned int v12 = [v6 date];
    id v11 = CUIKStringForYear();
  }

  return v11;
}

- (id)bestDateForNewEvent
{
  if ([(CompactWidthMonthViewController *)self dividedListMode]
    && ([(CUIKCalendarModel *)self->super.super.super.super._model selectedDate],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CompactWidthMonthViewController;
    id v4 = [(MonthViewController *)&v6 bestDateForNewEvent];
  }

  return v4;
}

- (int64_t)intendedSizeClass
{
  return 1;
}

- (id)preferredPreSizeClassTransitionSelectedDate
{
  if ([(CompactWidthMonthViewController *)self isTodayVisible]
    && ![(CompactWidthMonthViewController *)self dividedListMode])
  {
    CUIKTodayDate();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v6 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    double v7 = [v6 timeZone];
    id v4 = +[EKCalendarDate calendarDateWithDate:v3 timeZone:v7];
  }
  else
  {
    id v3 = [(CompactWidthMonthViewController *)self bestDateForNewEvent];
    if ([(CompactWidthMonthViewController *)self dividedListMode])
    {
      id v3 = v3;
      id v4 = v3;
    }
    else
    {
      id v5 = [v3 calendarDateForMonth];
      id v4 = [v5 calendarDateByAddingDays:2];
    }
  }

  return v4;
}

- (id)sceneTitle
{
  if ([(CompactWidthMonthViewController *)self dividedListMode]
    && ([(CUIKCalendarModel *)self->super.super.super.super._model selectedDay],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDay];
    id v5 = [v4 date];
    objc_super v6 = CUIKStringForMonthYear();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CompactWidthMonthViewController;
    objc_super v6 = [(MonthViewController *)&v8 sceneTitle];
  }

  return v6;
}

- (CGRect)frameForWeekContainingDate:(id)a3
{
  model = self->super.super.super.super._model;
  id v5 = a3;
  objc_super v6 = [(CUIKCalendarModel *)model calendar];
  double v7 = [v6 timeZone];
  objc_super v8 = +[EKCalendarDate calendarDateWithDate:v5 timeZone:v7];

  id v9 = [(InfiniteScrollViewController *)self subviewForDate:v8];
  id v10 = v9;
  if (v9)
  {
    [v9 rectForCells];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    id v19 = [(CompactWidthMonthViewController *)self view];
    [v19 convertRect:v10 fromView:v12];
    CGFloat x = v20;
    CGFloat y = v22;
    CGFloat width = v24;
    CGFloat height = v26;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (CGRect)frameForTodayHighlight
{
  id v3 = CUIKTodayDate();
  id v4 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
  id v5 = [v4 timeZone];
  objc_super v6 = +[EKCalendarDate calendarDateWithDate:v3 timeZone:v5];

  double v7 = [(CompactWidthMonthViewController *)self monthWeekViewForCalendarDate:v6];
  objc_super v8 = v7;
  if (v7)
  {
    [v7 frameForTodayHighlight];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = [(CompactWidthMonthViewController *)self view];
    [v17 convertRect:v8 fromView:v10 toView:v12];
    CGFloat x = v18;
    CGFloat y = v20;
    CGFloat width = v22;
    CGFloat height = v24;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
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

- (BOOL)_isTodayHighlightVisible
{
  id v3 = CUIKTodayDate();
  id v4 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
  id v5 = [v4 timeZone];
  objc_super v6 = +[EKCalendarDate calendarDateWithDate:v3 timeZone:v5];

  double v7 = [(CompactWidthMonthViewController *)self monthWeekViewForCalendarDate:v6];
  objc_super v8 = v7;
  if (v7) {
    unsigned __int8 v9 = [v7 isTodayHighlightVisible];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)isTodayVisible
{
  BOOL v3 = [(CompactWidthMonthViewController *)self _isTodayCircleFrameFullyUnobstructed];
  if (v3)
  {
    LOBYTE(v3) = [(CompactWidthMonthViewController *)self _isTodayHighlightVisible];
  }
  return v3;
}

- (BOOL)_isTodayCircleFrameFullyUnobstructed
{
  [(InfiniteScrollViewController *)self unobstructedScrollViewHeight];
  double v4 = v3;
  if ([(CompactWidthMonthViewController *)self dividedListMode])
  {
    [(CompactWidthMonthViewController *)self frameOfListView];
    double v6 = v4 - v5;
    double v7 = [(InfiniteScrollViewController *)self scrollView];
    [v7 safeAreaInsets];
    double v4 = v6 + v8;
  }
  unsigned __int8 v9 = [(InfiniteScrollViewController *)self scrollView];
  [v9 safeAreaInsets];
  uint64_t v11 = v10;
  double v12 = [(InfiniteScrollViewController *)self scrollView];
  [v12 bounds];
  CGFloat Width = CGRectGetWidth(v28);

  [(CompactWidthMonthViewController *)self frameForTodayHighlight];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v22 = 0;
  uint64_t v23 = v11;
  CGFloat v24 = Width;
  double v25 = v4;

  return CGRectContainsRect(*(CGRect *)&v22, *(CGRect *)&v15);
}

- (double)heightForSubviewWithCalendarDate:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() monthWeekViewClass];
  BOOL v6 = [(CompactWidthMonthViewController *)self dividedListMode];
  double v7 = [(CompactWidthMonthViewController *)self view];
  EKUICurrentWindowSize();
  double v9 = v8;
  double v11 = v10;
  [(CompactWidthMonthViewController *)self monthWeekScale];
  [v5 heightForViewWithCalendarDate:v4 compressed:v6 windowSize:v9 scale:v11];
  double v14 = v13;

  return v14;
}

- (double)decelerationDistanceThresholdForPreferringMonthBoundary
{
  BOOL v3 = [(CompactWidthMonthViewController *)self dividedListMode];
  [(CompactWidthMonthViewController *)self monthWeekScale];
  +[CompactMonthWeekView heightForViewThatContainsFirstDayOfMonth:compressed:scale:](CompactMonthWeekView, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, v3);
  return v4 * 3.5;
}

- (double)decelerationDistanceThresholdForDisplayingMonthBanner
{
  BOOL v3 = [(CompactWidthMonthViewController *)self dividedListMode];
  [(CompactWidthMonthViewController *)self monthWeekScale];
  +[CompactMonthWeekView heightForViewThatContainsFirstDayOfMonth:compressed:scale:](CompactMonthWeekView, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, v3);
  return v4 * 5.5;
}

- (double)decelerationDistanceThresholdToStopShowingMonthBanner
{
  BOOL v3 = [(CompactWidthMonthViewController *)self dividedListMode];
  [(CompactWidthMonthViewController *)self monthWeekScale];
  +[CompactMonthWeekView heightForViewThatContainsFirstDayOfMonth:compressed:scale:](CompactMonthWeekView, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, v3);
  return v4 * 1.1;
}

- (double)showDateVerticalOffsetForDate:(id)a3
{
  if ([a3 weekOfMonth] != (id)1) {
    return 0.0;
  }

  [(CompactWidthMonthViewController *)self _showDateVerticalOffset];
  return result;
}

- (double)_showDateVerticalOffset
{
  id v2 = [(id)objc_opt_class() monthWeekViewClass];
  [v2 headerHeight];
  double v4 = v3;
  [v2 grayLineHeight];
  return v4 + v5 + -0.5;
}

- (id)pushedMultiDayViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:a3];
  BOOL v6 = [MultiDayWeekViewContainerViewController alloc];
  model = self->super.super.super.super._model;
  double v8 = [(MainViewController *)self window];
  double v9 = [(MainViewControllerContainer *)v6 initWithModel:model window:v8];

  double v10 = [(CompactWidthMonthViewController *)self navigationController];
  [v10 pushViewController:v9 animated:v4];

  return v9;
}

- (id)pushedListViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:a3];
  BOOL v6 = [ListViewContainerViewController alloc];
  model = self->super.super.super.super._model;
  double v8 = [(MainViewController *)self window];
  double v9 = [(MainViewControllerContainer *)v6 initWithModel:model window:v8];

  double v10 = [(CompactWidthMonthViewController *)self navigationController];
  [v10 pushViewController:v9 animated:v4];

  return v9;
}

- (int64_t)eventCountDisplayedForDate:(id)a3
{
  id v4 = a3;
  double v5 = [(InfiniteScrollViewController *)self subviewForDate:v4];
  BOOL v6 = [v4 day];

  double v7 = [v5 calendarDate];
  double v8 = [v7 day];

  if (!v5) {
    goto LABEL_7;
  }
  double v9 = [v5 eventData];
  id v10 = 0;
  if (!v9) {
    goto LABEL_6;
  }
  int64_t v11 = v6 - v8;
  if (v11 < 0) {
    goto LABEL_6;
  }
  double v12 = [v5 eventData];
  id v13 = [v12 count];

  if (v11 >= (uint64_t)v13)
  {
LABEL_7:
    id v10 = 0;
    goto LABEL_8;
  }
  double v14 = [v5 eventData];
  double v9 = [v14 objectAtIndex:v11];

  id v10 = [v9 eventCount];
LABEL_6:

LABEL_8:
  return (int64_t)v10;
}

- (CGRect)frameOfListView
{
  listViewContainer = self->_listViewContainer;
  if (listViewContainer)
  {
    if (self->_listFrameNeedsUpdate)
    {
      [(CompactWidthMonthViewController *)self _updateListViewFrame];
      listViewContainer = self->_listViewContainer;
    }
    [(UIView *)listViewContainer frame];
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

- (id)dateForTopVisibleMonthOnScreen
{
  double v3 = [(InfiniteScrollViewController *)self firstViewOnScreen];
  id v4 = v3;
  if (v3 && ([v3 calendarDate], double v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = [v4 calendarDate];
  }
  else
  {
    uint64_t v6 = [(InfiniteScrollViewController *)self dateOfCenterViewOnScreen];
  }
  double v7 = (void *)v6;

  return v7;
}

- (id)dateForCurrentMonthOnScreen
{
  if ([(CompactWidthMonthViewController *)self dividedListMode]) {
    [(CompactWidthMonthViewController *)self dateForTopVisibleMonthOnScreen];
  }
  else {
  double v3 = [(InfiniteScrollViewController *)self dateOfCenterViewOnScreen];
  }

  return v3;
}

- (void)forceUpdateListView
{
  if ([(CompactWidthMonthViewController *)self dividedListMode])
  {
    listViewController = self->_listViewController;
    [(CompactMonthListViewController *)listViewController forceUpdate];
  }
}

- (void)_updateMonthTitleViewFont
{
  id v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle3 addingSymbolicTraits:32770 options:2];
  double v3 = [(MonthViewController *)self monthTitleView];
  id v4 = +[UIFont fontWithDescriptor:v5 size:0.0];
  [v3 setFont:v4];
}

- (void)_updateDateForDividedList
{
  if ([(CompactWidthMonthViewController *)self dividedListMode])
  {
    double v3 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    id v4 = [v3 calendarDateByAddingDays:1];
    id v16 = [v4 calendarDateForDay];

    id v5 = [v16 date];
    uint64_t v6 = CUIKTodayDate();
    id v7 = [v5 compare:v6];

    if (!v7)
    {
      double v8 = CUIKTodayDate();
      double v9 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
      id v10 = [v9 timeZone];
      int64_t v11 = +[EKCalendarDate calendarDateWithDate:v8 timeZone:v10];
      [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:v11];
    }
    double v12 = [(CompactWidthMonthViewController *)self view];
    id v13 = [v12 window];

    if (v13)
    {
      double v14 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      uint64_t v15 = [v14 date];
      [(MonthViewController *)self showDate:v15 animated:0];

      [(CompactWidthMonthViewController *)self _updateListViewFrame];
    }
  }
}

- (void)significantTimeChangeOccurred
{
  [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:&stru_1001D3B28];
  weekCalculationCalendar = self->_weekCalculationCalendar;
  self->_weekCalculationCalendar = 0;

  if ([(CUIKCalendarModel *)self->super.super.super.super._model currentlyLocked])
  {
    self->_needsUpdateOnModelUnlock = 1;
  }
  else
  {
    [(CompactWidthMonthViewController *)self _updateDateForDividedList];
  }
}

- (void)_modelUnlocked
{
  if (self->_needsUpdateOnModelUnlock)
  {
    self->_needsUpdateOnModelUnlock = 0;
    [(CompactWidthMonthViewController *)self _updateDateForDividedList];
  }
}

- (void)localeChanged
{
  v3.receiver = self;
  v3.super_class = (Class)CompactWidthMonthViewController;
  [(MonthViewController *)&v3 localeChanged];
  [(CompactWidthMonthViewController *)self _updateViewsForTimeZoneChange];
}

- (void)calendarModelTimeZoneChanged
{
  [(CUIKCalendarModel *)self->super.super.super.super._model updateSelectedDateTimeZone];
  v3.receiver = self;
  v3.super_class = (Class)CompactWidthMonthViewController;
  [(MonthViewController *)&v3 calendarModelTimeZoneChanged];
  [(CompactWidthMonthViewController *)self _updateViewsForTimeZoneChange];
}

- (void)_weekStartChanged:(id)a3
{
  weekCalculationCalendar = self->_weekCalculationCalendar;
  self->_weekCalculationCalendar = 0;

  id v5 = [(MainViewController *)self model];
  uint64_t v6 = [v5 selectedDate];
  [(InfiniteScrollViewController *)self reinitializeAllViewsWithCalendarDate:v6];

  if ([(CompactWidthMonthViewController *)self dividedListMode])
  {
    [(CompactWidthMonthViewController *)self _updateListViewFrame];
  }
}

- (void)_updateViewsForTimeZoneChange
{
  objc_super v3 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
  id v4 = [v3 timeZone];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100097690;
  v7[3] = &unk_1001D29A0;
  id v5 = v4;
  id v8 = v5;
  [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v7];
  weekCalculationCalendar = self->_weekCalculationCalendar;
  self->_weekCalculationCalendar = 0;

  if ([(CompactWidthMonthViewController *)self dividedListMode]) {
    [(CompactWidthMonthViewController *)self _updateListViewFrame];
  }
}

+ (Class)monthWeekViewClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)shouldAnimateTransitionToDay
{
  return 1;
}

- (void)_registerGestureRecognizers
{
  id v3 = objc_alloc_init((Class)UITapGestureRecognizer);
  [(CompactWidthMonthViewController *)self setDayCellsTapGestureRecognizer:v3];

  id v4 = [(CompactWidthMonthViewController *)self dayCellsTapGestureRecognizer];
  [v4 addTarget:self action:"_tapGestureCallback:"];

  id v5 = [(InfiniteScrollViewController *)self scrollView];
  uint64_t v6 = [(CompactWidthMonthViewController *)self dayCellsTapGestureRecognizer];
  [v5 addGestureRecognizer:v6];

  id v7 = objc_alloc_init((Class)UILongPressGestureRecognizer);
  [(CompactWidthMonthViewController *)self setDayCellsScrubbingGestureRecognizer:v7];

  id v8 = [(CompactWidthMonthViewController *)self dayCellsScrubbingGestureRecognizer];
  [v8 addTarget:self action:"_scrubGestureCallback:"];

  double v9 = [(CompactWidthMonthViewController *)self dayCellsScrubbingGestureRecognizer];
  [v9 setDelegate:self];

  id v10 = [(InfiniteScrollViewController *)self scrollView];
  int64_t v11 = [(CompactWidthMonthViewController *)self dayCellsScrubbingGestureRecognizer];
  [v10 addGestureRecognizer:v11];

  [(id)objc_opt_class() scrubbingMinimumPressDuration];
  double v13 = v12;
  double v14 = [(CompactWidthMonthViewController *)self dayCellsScrubbingGestureRecognizer];
  [v14 setMinimumPressDuration:v13];

  id v17 = [(InfiniteScrollViewController *)self scrollView];
  uint64_t v15 = [v17 panGestureRecognizer];
  id v16 = [(CompactWidthMonthViewController *)self dayCellsScrubbingGestureRecognizer];
  [v15 requireGestureRecognizerToFail:v16];
}

- (void)_unregisterGestureRecognizers
{
  id v3 = [(InfiniteScrollViewController *)self scrollView];
  id v4 = [(CompactWidthMonthViewController *)self dayCellsTapGestureRecognizer];
  [v3 removeGestureRecognizer:v4];

  id v5 = [(InfiniteScrollViewController *)self scrollView];
  uint64_t v6 = [(CompactWidthMonthViewController *)self dayCellsScrubbingGestureRecognizer];
  [v5 removeGestureRecognizer:v6];

  [(CompactWidthMonthViewController *)self setDayCellsTapGestureRecognizer:0];

  [(CompactWidthMonthViewController *)self setDayCellsScrubbingGestureRecognizer:0];
}

- (void)_tapGestureCallback:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100097AC4;
  uint64_t v18 = sub_100097AD4;
  id v19 = 0;
  id v5 = [(InfiniteScrollViewController *)self scrollView];
  uint64_t v6 = [v5 subviews];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100097ADC;
  int64_t v11 = &unk_1001D3B50;
  id v7 = v4;
  id v12 = v7;
  double v13 = &v14;
  [v6 enumerateObjectsUsingBlock:&v8];

  -[CompactWidthMonthViewController monthView:gestureBegan:](self, "monthView:gestureBegan:", v15[5], v7, v8, v9, v10, v11);
  [(CompactWidthMonthViewController *)self monthView:v15[5] gestureEnded:v7];

  _Block_object_dispose(&v14, 8);
}

- (void)_scrubGestureCallback:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100097AC4;
  uint64_t v18 = sub_100097AD4;
  id v19 = 0;
  id v5 = [(InfiniteScrollViewController *)self scrollView];
  uint64_t v6 = [v5 subviews];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100097D7C;
  int64_t v11 = &unk_1001D3B50;
  id v7 = v4;
  id v12 = v7;
  double v13 = &v14;
  [v6 enumerateObjectsUsingBlock:&v8];

  switch((unint64_t)objc_msgSend(v7, "state", v8, v9, v10, v11))
  {
    case 1uLL:
      [(CompactWidthMonthViewController *)self monthView:v15[5] gestureBegan:v7];
      break;
    case 2uLL:
      [(CompactWidthMonthViewController *)self monthView:v15[5] gestureChanged:v7];
      break;
    case 3uLL:
      [(CompactWidthMonthViewController *)self monthView:v15[5] gestureEnded:v7];
      break;
    case 4uLL:
    case 5uLL:
      [(CompactWidthMonthViewController *)self monthView:v15[5] gestureCancelled:v7];
      break;
    default:
      break;
  }

  _Block_object_dispose(&v14, 8);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return self->_pinchRecognizer == a4;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(CompactWidthMonthViewController *)self dayCellsScrubbingGestureRecognizer];
  if (v5 == v4)
  {
    unsigned __int8 v6 = [(CompactWidthMonthViewController *)self dividedListMode];

    if ((v6 & 1) == 0)
    {
      BOOL v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  BOOL v7 = 1;
LABEL_6:

  return v7;
}

- (void)compactMonthListViewController:(id)a3 wantsToCommitViewControllerFromPreview:(id)a4
{
}

- (void)compactMonthListViewController:(id)a3 didSelectEvent:(id)a4 showMode:(unint64_t)a5
{
}

- (id)_viewFromGesture:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_100097AC4;
  id v17 = sub_100097AD4;
  id v18 = 0;
  id v5 = [(InfiniteScrollViewController *)self scrollView];
  [v4 locationInView:v5];
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10009804C;
  v12[3] = &unk_1001D2938;
  v12[6] = v7;
  v12[7] = v9;
  v12[4] = self;
  v12[5] = &v13;
  [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v12];
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (void)monthView:(id)a3 gestureBegan:(id)a4
{
  uint64_t v16 = (CompactMonthWeekView *)a3;
  id v6 = a4;
  if (![(CompactWidthMonthViewController *)self dividedListMode]
    || ([(InfiniteScrollViewController *)self scrollView],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 isDecelerating],
        v7,
        (v8 & 1) == 0))
  {
    uint64_t v9 = [(CompactWidthMonthViewController *)self _dayInMonth:v16 fromGesture:v6];
    if (v9)
    {
      if (self->_pressedMonthView != v16 || [v9 compare:self->_pressedDay])
      {
        [(CompactWidthMonthViewController *)self _createMonthHighlightForMonthView:v16 day:v9];
        [(TappableDayNumber *)self->_pressHighlight setPressed:1];
      }
      if ([(CompactWidthMonthViewController *)self dividedListMode])
      {
        id v10 = [(InfiniteScrollViewController *)self scrollView];
        [v10 setScrollEnabled:0];

        [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:v9];
        int64_t v11 = CUIKTodayDate();
        id v12 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
        uint64_t v13 = [v12 timeZone];
        uint64_t v14 = +[EKCalendarDate calendarDateWithDate:v11 timeZone:v13];
        uint64_t v15 = [(InfiniteScrollViewController *)self subviewForDate:v14];

        if (v15) {
          [v15 haltTodayPulse];
        }
      }
      else
      {
        self->_shouldSetSelectedDate = 1;
      }
    }
  }
}

- (void)monthView:(id)a3 gestureChanged:(id)a4
{
  uint64_t v14 = (CompactMonthWeekView *)a3;
  id v6 = a4;
  if (![(CompactWidthMonthViewController *)self dividedListMode]
    || ([(InfiniteScrollViewController *)self scrollView],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 isDecelerating],
        v7,
        (v8 & 1) == 0))
  {
    if ([(CompactWidthMonthViewController *)self dividedListMode])
    {
      uint64_t v9 = [(CompactWidthMonthViewController *)self _viewFromGesture:v6];

      id v10 = (CompactMonthWeekView *)v9;
    }
    else
    {
      id v10 = v14;
    }
    uint64_t v14 = v10;
    int64_t v11 = [(CompactWidthMonthViewController *)self _dayInMonth:v10 fromGesture:v6];
    BOOL v12 = v14 == self->_pressedMonthView && [(EKCalendarDate *)self->_pressedDay compare:v11] == 0;
    if (v12 != [(TappableDayNumber *)self->_pressHighlight isSelected]) {
      [(TappableDayNumber *)self->_pressHighlight setPressed:v12];
    }
    unsigned int v13 = ![(CompactWidthMonthViewController *)self dividedListMode];
    if (!v11) {
      unsigned int v13 = 1;
    }
    if (!(v12 | v13))
    {
      [(CompactWidthMonthViewController *)self _removeMonthHighlight];
      [(CompactWidthMonthViewController *)self _createMonthHighlightForMonthView:v14 day:v11];
      [(TappableDayNumber *)self->_pressHighlight setPressed:1];
      [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:v11];
    }
  }
}

- (void)monthView:(id)a3 gestureEnded:(id)a4
{
  id v6 = (CompactMonthWeekView *)a3;
  id v7 = a4;
  if (![(CompactWidthMonthViewController *)self dividedListMode]
    || ([(InfiniteScrollViewController *)self scrollView],
        unsigned __int8 v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v8 isDecelerating],
        v8,
        (v9 & 1) == 0))
  {
    if ([(CompactWidthMonthViewController *)self dividedListMode])
    {
      uint64_t v10 = [(CompactWidthMonthViewController *)self _viewFromGesture:v7];

      id v6 = (CompactMonthWeekView *)v10;
    }
    int64_t v11 = [(CompactWidthMonthViewController *)self _dayInMonth:v6 fromGesture:v7];
    BOOL v12 = v11;
    BOOL v13 = v6 != self->_pressedMonthView || v11 == 0;
    if (v13 || [v11 compare:self->_pressedDay])
    {
      BOOL v14 = 0;
    }
    else
    {
      id v18 = [(CompactWidthMonthViewController *)self presentedViewController];
      BOOL v14 = v18 == 0;
    }
    if ([(CompactWidthMonthViewController *)self dividedListMode])
    {
      uint64_t v15 = [(InfiniteScrollViewController *)self scrollView];
      [v15 setScrollEnabled:1];
    }
    [(TappableDayNumber *)self->_pressHighlight setPressed:0];
    [(TappableDayNumber *)self->_pressHighlight setHidden:1];
    if (v14)
    {
      uint64_t v16 = [(CompactWidthMonthViewController *)self _eventInMonthWeekView:v6 fromGesture:v7];
      if (v16)
      {
        [(CompactWidthMonthViewController *)self _showDetailsForEvent:v16 animated:1 showMode:1 context:0];
      }
      else if ([(CompactWidthMonthViewController *)self dividedListMode])
      {
        [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:v12];
        [(CompactWidthMonthViewController *)self _removeMonthHighlight];
        [(CompactWidthMonthViewController *)self _setSelectedDay:v12 onMonthWeekView:v6 animated:0];
      }
      else if (self->_shouldSetSelectedDate)
      {
        self->_shouldSetSelectedDate = 0;
        [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:v12];
        id v19 = [(id)objc_opt_class() shouldAnimateTransitionToDay];
        if ([(CUIKCalendarModel *)self->super.super.super.super._model showDayAsList])
        {
          id v20 = [(CompactWidthMonthViewController *)self pushedListViewControllerWithDate:v12 animated:v19];
        }
        else
        {
          BOOL v21 = (_os_feature_enabled_impl() & 1) == 0 && !_os_feature_enabled_impl();
          id v22 = [(CUIKCalendarModel *)self->super.super.super.super._model numDaysToShow];
          if (v21 || v22 != (id)2) {
            id v24 = [(CompactWidthMonthViewController *)self pushedDayViewControllerWithDate:v12 animated:v19];
          }
          else {
            id v23 = [(CompactWidthMonthViewController *)self pushedMultiDayViewControllerWithDate:v12 animated:v19];
          }
        }
      }
    }
    else
    {
      dispatch_time_t v17 = dispatch_time(0, 300000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100098844;
      block[3] = &unk_1001D2740;
      block[4] = self;
      dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)monthView:(id)a3 gestureCancelled:(id)a4
{
  if ([(CompactWidthMonthViewController *)self dividedListMode])
  {
    id v5 = [(InfiniteScrollViewController *)self scrollView];
    [v5 setScrollEnabled:1];
  }

  [(CompactWidthMonthViewController *)self _removeMonthHighlight];
}

- (id)_dayInMonth:(id)a3 fromGesture:(id)a4
{
  id v5 = a3;
  [a4 locationInView:v5];
  id v6 = [v5 dayForPoint:];

  return v6;
}

- (id)_eventInMonthWeekView:(id)a3 fromGesture:(id)a4
{
  id v5 = a3;
  [a4 locationInView:v5];
  id v6 = [v5 occurrenceAtPoint:];

  return v6;
}

- (void)_createMonthHighlightForMonthView:(id)a3 day:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  [(CompactWidthMonthViewController *)self _removeMonthHighlight];
  objc_storeStrong((id *)&self->_pressedDay, a4);
  objc_storeStrong((id *)&self->_pressedMonthView, a3);
  if ([(CompactWidthMonthViewController *)self dividedListMode])
  {
    [(CompactWidthMonthViewController *)self _setSelectedDay:v7 onMonthWeekView:v13 animated:0];
  }
  else
  {
    unsigned __int8 v8 = [[TappableDayNumber alloc] initWithSizeClass:1];
    pressHighlight = self->_pressHighlight;
    self->_pressHighlight = v8;

    uint64_t v10 = +[UIColor systemBackgroundColor];
    [(TappableDayNumber *)self->_pressHighlight setBackgroundColor:v10];

    [(TappableDayNumber *)self->_pressHighlight setUserInteractionEnabled:0];
    [v13 adjustHighlight:self->_pressHighlight forDay:v7];
    int64_t v11 = [(InfiniteScrollViewController *)self scrollView];
    [(TappableDayNumber *)self->_pressHighlight frame];
    [v11 convertRect:v13 fromView:];
    -[TappableDayNumber setFrame:](self->_pressHighlight, "setFrame:");

    BOOL v12 = [(InfiniteScrollViewController *)self scrollView];
    [v12 addSubview:self->_pressHighlight];

    [(TappableDayNumber *)self->_pressHighlight layoutSubviews];
  }
}

- (void)_removeMonthHighlight
{
  if ([(CompactWidthMonthViewController *)self dividedListMode])
  {
    [(CompactWidthMonthViewController *)self _setSelectedDay:0 onMonthWeekView:self->_selectedMonthWeekView animated:0];
    pressHighlight = self->_pressHighlight;
  }
  else
  {
    pressHighlight = self->_pressHighlight;
    if (!pressHighlight) {
      return;
    }
  }
  id v4 = pressHighlight;
  id v5 = self->_pressHighlight;
  self->_pressHighlight = 0;

  pressedDadouble y = self->_pressedDay;
  self->_pressedDadouble y = 0;

  pressedMonthView = self->_pressedMonthView;
  self->_pressedMonthView = 0;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100098C4C;
  v11[3] = &unk_1001D2740;
  BOOL v12 = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100098C58;
  v9[3] = &unk_1001D27D8;
  uint64_t v10 = v12;
  unsigned __int8 v8 = v12;
  +[UIView animateWithDuration:v11 animations:v9 completion:0.2];
}

- (void)_setSelectedDay:(id)a3
{
  id v4 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  id v6 = [(InfiniteScrollViewController *)self subviewForDate:v4];

  id v5 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  [(CompactWidthMonthViewController *)self _setSelectedDay:v5 onMonthWeekView:v6 animated:0];
}

- (void)_setSelectedDay:(id)a3 onMonthWeekView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  unsigned __int8 v8 = (CompactMonthWeekView *)a4;
  p_selectedMonthWeekView = &self->_selectedMonthWeekView;
  selectedMonthWeekView = self->_selectedMonthWeekView;
  if (selectedMonthWeekView != v8)
  {
    [(CompactMonthWeekView *)selectedMonthWeekView setSelectedDay:0 animated:0];
    int64_t v11 = *p_selectedMonthWeekView;
    *p_selectedMonthWeekView = 0;
  }
  if (v12)
  {
    if (v8)
    {
      [(CompactMonthWeekView *)v8 setSelectedDay:v12 animated:v5];
      objc_storeStrong((id *)&self->_selectedMonthWeekView, a4);
    }
    [(CompactWidthMonthViewController *)self _updateNavigationControllerBackButtonToDate:v12];
  }
}

- (void)_resetSelectionForDividedListState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(InfiniteScrollViewController *)self subviewCount])
  {
    BOOL v5 = CUIKTodayDate();
    id v6 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    id v7 = [v6 timeZone];
    id v20 = +[EKCalendarDate calendarDateWithDate:v5 timeZone:v7];

    unsigned __int8 v8 = [(InfiniteScrollViewController *)self subviewForDate:v20];
    if (v3)
    {
      unsigned __int8 v9 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDay];
      id v10 = [(InfiniteScrollViewController *)self subviewForDate:v9];
      p_selectedMonthWeekView = (id *)&self->_selectedMonthWeekView;
      id v12 = *p_selectedMonthWeekView;
      if (*p_selectedMonthWeekView) {
        BOOL v13 = v12 == v10;
      }
      else {
        BOOL v13 = 1;
      }
      if (!v13)
      {
        [v12 setSelectedDay:0 animated:0];
        id v14 = *p_selectedMonthWeekView;
        id *p_selectedMonthWeekView = 0;
      }
      id v15 = [v20 month];
      if (v15 != [v9 month]
        || ((v16 = [v20 year], v16 == objc_msgSend(v9, "year")) ? (BOOL v17 = v8 == 0) : (BOOL v17 = 1), v17))
      {
        [v8 setSelectedDay:0 animated:0];
        [v10 setSelectedDay:v9 animated:1];
        objc_storeStrong(p_selectedMonthWeekView, v10);
      }
      else
      {
        objc_storeStrong(p_selectedMonthWeekView, v8);
        [v8 setSelectedDay:v20 animated:1];
      }
    }
    else
    {
      selectedMonthWeekView = self->_selectedMonthWeekView;
      if (selectedMonthWeekView)
      {
        [(CompactMonthWeekView *)selectedMonthWeekView setSelectedDay:0 animated:0];
        id v19 = self->_selectedMonthWeekView;
        self->_selectedMonthWeekView = 0;
      }
      if (v8) {
        [v8 setSelectedDay:v20 animated:0];
      }
      unsigned __int8 v9 = self->_selectedMonthWeekView;
      self->_selectedMonthWeekView = 0;
    }
  }
}

- (void)_cachedOccurrencesChanged:(id)a3
{
  if ([(InfiniteScrollViewController *)self viewIsVisible])
  {
    [(CompactWidthMonthViewController *)self _loadEventsForAllSubviews];
  }
  else
  {
    self->_needToReloadEventsOnAppear = 1;
  }
}

- (void)_occurrencesChanged:(id)a3
{
  id v8 = a3;
  if ([(InfiniteScrollViewController *)self viewIsVisible])
  {
    id v4 = [v8 userInfo];
    BOOL v5 = [v4 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedRangeStartKey];

    id v6 = [v8 userInfo];
    id v7 = [v6 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedRangeEndKey];

    [(CompactWidthMonthViewController *)self _loadEventsForViewsInRangeStartingAt:v5 endingAt:v7];
  }
  else
  {
    self->_needToReloadEventsOnAppear = 1;
  }
}

- (void)_loadEventsForViewsInRangeStartingAt:(id)a3 endingAt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_eventLoadingSuspendedForScroll)
  {
    if (![(CompactWidthMonthViewController *)self dividedListMode])
    {
      [(CompactWidthMonthViewController *)self _scrollViewVerticalVelocity];
      if (v8 < 0.0) {
        double v8 = -v8;
      }
      if (v8 < 0.4)
      {
        self->_eventLoadingSuspendedForScroll = 0;
        [(CompactWidthMonthViewController *)self _loadEventsForAllSubviews];
      }
    }
  }
  else
  {
    [(CompactWidthMonthViewController *)self _scrollViewVerticalVelocity];
    if (v9 < 0.0) {
      double v9 = -v9;
    }
    if (v9 >= 1.0)
    {
      self->_eventLoadingSuspendedForScroll = 1;
    }
    else if (!self->_eventLoadingSuspendedForPinching)
    {
      [v6 timeIntervalSinceReferenceDate];
      uint64_t v11 = v10;
      [v7 timeIntervalSinceReferenceDate];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100099274;
      v13[3] = &unk_1001D3B78;
      v13[5] = v12;
      v13[6] = v11;
      v13[4] = self;
      [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v13];
    }
  }
}

- (void)_loadEventDataForMonthWeekView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 calendarDate];
  id v6 = [v4 endCalendarDate];
  reloadQueue = self->_reloadQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100099420;
  v11[3] = &unk_1001D2E90;
  void v11[4] = self;
  id v12 = v5;
  id v13 = v6;
  id v14 = v4;
  id v8 = v4;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(reloadQueue, v11);
}

- (void)_loadEventsForAllSubviews
{
  if ([(InfiniteScrollViewController *)self viewIsVisible])
  {
    if (self->_loadingOccurrenceCache) {
      return;
    }
    [(CompactWidthMonthViewController *)self _scrollViewVerticalVelocity];
    if (v3 < 0.0) {
      double v3 = -v3;
    }
    uint64_t v4 = 330;
    if (v3 < 0.4)
    {
      self->_eventLoadingSuspendedForScroll = 0;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10009978C;
      v6[3] = &unk_1001D29A0;
      v6[4] = self;
      [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v6];
      BOOL v5 = [(MainViewController *)self model];
      [v5 startNotificationMonitor];

      return;
    }
  }
  else
  {
    uint64_t v4 = 329;
  }
  *((unsigned char *)&self->super.super.super.super.super.super.super.isa + v4) = 1;
}

- (void)_dayIndexesForRangeStart:(id)a3 rangeEnd:(id)a4 outFirstDayIndex:(int64_t *)a5 outLastDayIndex:(int64_t *)a6
{
  id v23 = a4;
  model = self->super.super.super.super._model;
  id v11 = a3;
  id v12 = (char *)[(CUIKCalendarModel *)model sectionForCachedOccurrencesOnDate:v11];
  id v13 = (char *)[(CUIKCalendarModel *)self->super.super.super.super._model sectionForCachedOccurrencesOnDate:v23];
  id v14 = [(CUIKCalendarModel *)self->super.super.super.super._model dateForCachedOccurrencesInSection:v12];
  [v14 timeIntervalSinceReferenceDate];
  double v16 = v15;

  BOOL v17 = [(CUIKCalendarModel *)self->super.super.super.super._model dateForCachedOccurrencesInSection:v13];
  [v17 timeIntervalSinceReferenceDate];
  double v19 = v18;

  [v11 timeIntervalSinceReferenceDate];
  double v21 = v20;

  if (v16 < v21)
  {
    ++v12;
    if (!a5) {
      goto LABEL_8;
    }
LABEL_7:
    *a5 = (int64_t)v12;
    goto LABEL_8;
  }
  [v23 timeIntervalSinceReferenceDate];
  if (v19 > v22) {
    --v13;
  }
  if (a5) {
    goto LABEL_7;
  }
LABEL_8:
  if (a6) {
    *a6 = (int64_t)v13;
  }
}

- (id)_loadEventsForStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_eventLoadingSuspendedForScroll)
  {
    if (![(CompactWidthMonthViewController *)self dividedListMode])
    {
      [(CompactWidthMonthViewController *)self _scrollViewVerticalVelocity];
      if (v8 < 0.0) {
        double v8 = -v8;
      }
      if (v8 < 0.4)
      {
        self->_eventLoadingSuspendedForScroll = 0;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10009A290;
        block[3] = &unk_1001D2740;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
    goto LABEL_11;
  }
  [(CompactWidthMonthViewController *)self _scrollViewVerticalVelocity];
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  if (v9 >= 1.0)
  {
    id v10 = 0;
    self->_eventLoadingSuspendedForScroll = 1;
    goto LABEL_13;
  }
  if (self->_eventLoadingSuspendedForPinching)
  {
LABEL_11:
    id v10 = 0;
LABEL_13:
    id v11 = v7;
    id v12 = v6;
    goto LABEL_14;
  }
  id v12 = [v6 calendarDateForDay];

  id v11 = [v7 calendarDateForEndOfDay];

  v84 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
  id v14 = [v84 timeZone];
  double v88 = [v12 date];
  double v85 = [v11 date];
  double v97 = 0;
  double v98 = 0;
  CalEventOccurrenceCacheCopyBoundsForTimeZone();
  if (v14) {
    CFRelease(v14);
  }
  double v16 = v97;
  double v15 = v98;
  unint64_t v17 = (unint64_t)[v11 differenceInDays:v12];
  if ((v17 & 0x8000000000000000) != 0)
  {
    double v51 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v12;
      __int16 v102 = 2112;
      v103 = v11;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Loading events for week failed, End Date is before Start Date %@ %@", buf, 0x16u);
    }
    id v10 = 0;
    double v22 = v85;
    goto LABEL_55;
  }
  double v18 = (char *)(v17 + 1);
  double v19 = +[NSMutableArray arrayWithCapacity:v17 + 1];
  do
  {
    double v20 = +[CompactMonthWeekDayData dayDataWithEventCount:0 dayType:0];
    [v19 addObject:v20];

    --v18;
  }
  while (v18);
  if ([v88 compare:v98] == (id)1 && objc_msgSend(v85, "compare:", v97) == (id)-1)
  {
    if ([(CUIKCalendarModel *)self->super.super.super.super._model cachedOccurrencesAreLoaded])
    {
      if (!self->_loadingOccurrenceCache)
      {
        *(void *)buf = 0;
        uint64_t v93 = 0;
        [(CompactWidthMonthViewController *)self _dayIndexesForRangeStart:v88 rangeEnd:v85 outFirstDayIndex:buf outLastDayIndex:&v93];
        uint64_t v52 = *(void *)buf;
        if (*(uint64_t *)buf <= v93)
        {
          id v79 = v15;
          objc_super v81 = v11;
          v78 = v16;
          do
          {
            uint64_t v53 = (uint64_t)[(CUIKCalendarModel *)self->super.super.super.super._model numberOfCachedOccurrencesInSection:v52];
            if (v53 >= 1)
            {
              uint64_t v75 = v53;
              double v87 = [(CUIKCalendarModel *)self->super.super.super.super._model cachedSpecialDayDataForSection:v52];
              uint64_t v83 = v52;
              double v77 = [(CUIKCalendarModel *)self->super.super.super.super._model dateForCachedOccurrencesInSection:v52];
              double v54 = [v84 components:30];
              id v55 = [v54 month];
              if (v55 == [v12 month])
              {
                v56 = [v54 day];
                uint64_t v57 = v56 - (unsigned char *)[v12 day];
                if (v57 >= 0 && v57 < (uint64_t)[v19 count])
                {
                  uint64_t v73 = v57;
                  id v74 = v54;
                  if (v87)
                  {
                    id v58 = v87;
                    id v59 = [v87 dayType];
                    uint64_t v60 = v83;
                  }
                  else
                  {
                    id v59 = 0;
                    uint64_t v60 = v83;
                    id v58 = 0;
                  }
                  id v61 = +[CompactMonthWeekDayData dayDataWithEventCount:v75 dayType:v59];
                  id v62 = [v58 color];
                  [v61 setDayTypeBadgeColor:v62];

                  long long v63 = [v58 locale];
                  uint64_t v76 = v61;
                  [v61 setDayTypeBadgeLocale:v63];

                  unsigned __int8 v64 = [(CUIKCalendarModel *)self->super.super.super.super._model cachedOccurrencesForSection:v60];
                  unsigned int v65 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v64 count]);
                  long long v89 = 0u;
                  long long v90 = 0u;
                  long long v91 = 0u;
                  long long v92 = 0u;
                  id v66 = v64;
                  id v67 = [v66 countByEnumeratingWithState:&v89 objects:v100 count:16];
                  if (v67)
                  {
                    id v68 = v67;
                    uint64_t v69 = *(void *)v90;
                    do
                    {
                      for (i = 0; i != v68; i = (char *)i + 1)
                      {
                        if (*(void *)v90 != v69) {
                          objc_enumerationMutation(v66);
                        }
                        id v71 = +[EventSummaryData eventSummaryDataFromEKEvent:*(void *)(*((void *)&v89 + 1) + 8 * i)];
                        [v65 addObject:v71];
                      }
                      id v68 = [v66 countByEnumeratingWithState:&v89 objects:v100 count:16];
                    }
                    while (v68);
                  }

                  [v76 setEventSummaryData:v65];
                  [v19 setObject:v76 atIndexedSubscript:v73];

                  double v15 = v79;
                  id v11 = v81;
                  double v16 = v78;
                  double v54 = v74;
                }
              }

              uint64_t v52 = v83;
            }
            BOOL v50 = v52++ < v93;
          }
          while (v50);
        }
        double v22 = v85;
        goto LABEL_50;
      }
    }
    else if (!self->_loadingOccurrenceCache)
    {
      self->_loadingOccurrenceCache = 1;
      v72 = dispatch_get_global_queue(2, 0);
      v94[0] = _NSConcreteStackBlock;
      v94[1] = 3221225472;
      v94[2] = sub_10009A298;
      v94[3] = &unk_1001D2EE0;
      v94[4] = self;
      id v95 = v88;
      double v22 = v85;
      id v96 = v85;
      dispatch_async(v72, v94);

      id v10 = 0;
      goto LABEL_51;
    }
    id v10 = 0;
    double v22 = v85;
    goto LABEL_51;
  }
  id v80 = v11;
  model = self->super.super.super.super._model;
  double v22 = v85;
  id v23 = [(CUIKCalendarModel *)model occurrencesForStartDate:v88 endDate:v85 preSorted:1 waitForLoad:0];
  id v24 = [v23 occurrences];

  uint64_t v86 = (uint64_t)[v24 count];
  if (v86 >= 1)
  {
    uint64_t v25 = 0;
    CGRect v82 = v24;
    do
    {
      double v26 = [v24 objectAtIndex:v25];
      double v27 = [v26 startDate];
      [v27 timeIntervalSinceReferenceDate];
      double v29 = v28;

      double v30 = [v26 endDate];
      [v30 timeIntervalSinceReferenceDate];
      double v32 = v31;

      [v88 timeIntervalSinceReferenceDate];
      double v34 = v33;
      [v22 timeIntervalSinceReferenceDate];
      double v36 = v35;
      double v37 = [v26 endCalendarDate];
      double v38 = [v37 allComponents];

      if (![v38 hour] && !objc_msgSend(v38, "minute"))
      {
        id v39 = [v38 second];
        if (v29 != v32 && v39 == 0) {
          double v32 = v32 + -1.0;
        }
      }
      if (v29 > v36 || v32 < v34)
      {
        double v45 = v38;
      }
      else
      {
        if (v29 < v34) {
          double v29 = v34;
        }
        if (v32 > v36) {
          double v32 = v36;
        }
        long long v41 = +[EventSummaryData eventSummaryDataFromEKEvent:v26];
        double v42 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v29];
        double v43 = [v84 components:30 fromDate:v42];

        double v44 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v32];
        double v45 = [v84 components:30 fromDate:v44];

        double v46 = (char *)[v43 day];
        if ((uint64_t)v46 <= (uint64_t)[v45 day])
        {
          do
          {
            uint64_t v47 = v46 - (unsigned char *)[v12 day];
            if (v47 >= 0 && v47 < (uint64_t)[v19 count])
            {
              CGFloat v48 = [v19 objectAtIndex:v47];
              [v48 setEventCount:[v48 eventCount] + 1];
              [v48 setDayType:0];
              [v48 setDayTypeBadgeColor:0];
              [v48 setDayTypeBadgeLocale:0];
              double v49 = [v48 eventSummaryData];
              if (!v49)
              {
                double v49 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v19 count]);
                [v48 setEventSummaryData:v49];
              }
              [v49 addObject:v41];
            }
            BOOL v50 = (uint64_t)v46++ < (uint64_t)[v45 day];
          }
          while (v50);
        }

        double v22 = v85;
        id v24 = v82;
      }

      ++v25;
    }
    while (v25 != v86);
  }

  double v15 = v98;
  id v11 = v80;
  double v16 = v97;
LABEL_50:
  id v10 = v19;
LABEL_51:

LABEL_55:
LABEL_14:

  return v10;
}

- (BOOL)_shouldAnimateDots
{
  [(CompactWidthMonthViewController *)self _scrollViewVerticalVelocity];
  if (v2 < 0.0) {
    double v2 = -v2;
  }
  return v2 < 0.05;
}

- (double)_scrollViewVerticalVelocity
{
  double v3 = [(InfiniteScrollViewController *)self scrollView];
  if ([v3 isDragging]) {
    goto LABEL_6;
  }
  uint64_t v4 = [(InfiniteScrollViewController *)self scrollView];
  if ([v4 isTracking])
  {
LABEL_5:

LABEL_6:
LABEL_7:
    id v6 = [(InfiniteScrollViewController *)self scrollView];
    [v6 _verticalVelocity];
    double v8 = v7;

    return v8;
  }
  BOOL v5 = [(InfiniteScrollViewController *)self scrollView];
  if ([v5 isDecelerating])
  {

    goto LABEL_5;
  }
  id v10 = [(InfiniteScrollViewController *)self scrollView];
  unsigned __int8 v11 = [v10 isScrollAnimating];

  if (v11) {
    goto LABEL_7;
  }
  return 0.0;
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (void)enterAnimationSplitStateWithCutOutArea:(CGRect)a3 topBoundary:(double)a4
{
  if (!self->_inAnimationSplitState)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    [(InfiniteScrollViewController *)self setSuppressViewAdjustments:1];
    self->_inAnimationSplitState = 1;
    self->_splitCutOutRect.origin.double x = x;
    self->_splitCutOutRect.origin.double y = y;
    self->_splitCutOutRect.size.double width = width;
    self->_splitCutOutRect.size.double height = height;
    self->_topBoundaryY = a4;
    id v10 = [(InfiniteScrollViewController *)self scrollView];
    unsigned __int8 v11 = [(CompactWidthMonthViewController *)self view];
    [v10 convertRect:v11 fromView:x, y, width, height];
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;

    double v20 = +[NSMutableArray arrayWithCapacity:[(InfiniteScrollViewController *)self subviewCount]];
    double v21 = +[NSMutableArray array];
    double v22 = +[NSMutableArray arrayWithCapacity:[(InfiniteScrollViewController *)self subviewCount]];
    id v23 = [(CompactWidthMonthViewController *)self view];
    id v24 = [v23 backgroundColor];
    originalBackgroundColor = self->_originalBackgroundColor;
    self->_originalBackgroundColor = v24;

    double v26 = [(InfiniteScrollViewController *)self scrollView];
    double v27 = [v26 backgroundColor];
    originalScrollViewBackgroundColor = self->_originalScrollViewBackgroundColor;
    self->_originalScrollViewBackgroundColor = v27;

    double v29 = +[UIColor clearColor];
    double v30 = [(CompactWidthMonthViewController *)self view];
    [v30 setBackgroundColor:v29];

    double v31 = +[UIColor clearColor];
    double v32 = [(InfiniteScrollViewController *)self scrollView];
    [v32 setBackgroundColor:v31];

    double v43 = _NSConcreteStackBlock;
    uint64_t v44 = 3221225472;
    double v45 = sub_10009A7F8;
    double v46 = &unk_1001D3BC8;
    uint64_t v47 = self;
    double v33 = v20;
    CGFloat v48 = v33;
    uint64_t v51 = v13;
    uint64_t v52 = v15;
    uint64_t v53 = v17;
    uint64_t v54 = v19;
    double v34 = v21;
    double v49 = v34;
    double v35 = v22;
    BOOL v50 = v35;
    [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:&v43];
    pressHighlight = self->_pressHighlight;
    if (pressHighlight) {
      -[TappableDayNumber setHidden:](pressHighlight, "setHidden:", 1, v43, v44, v45, v46, v47, v48, v49);
    }
    originalSubviewYs = self->_originalSubviewYs;
    self->_originalSubviewYs = v33;
    double v38 = v33;

    clipViews = self->_clipViews;
    self->_clipViews = v34;
    double v40 = v34;

    viewsToMove = self->_viewsToMove;
    self->_viewsToMove = v35;
    double v42 = v35;

    self->_splitOpen = 0;
  }
}

- (void)endAnimationSplitState
{
  if (self->_inAnimationSplitState)
  {
    originalBackgroundColor = self->_originalBackgroundColor;
    uint64_t v4 = [(CompactWidthMonthViewController *)self view];
    [v4 setBackgroundColor:originalBackgroundColor];

    originalScrollViewBackgroundColor = self->_originalScrollViewBackgroundColor;
    id v6 = [(InfiniteScrollViewController *)self scrollView];
    [v6 setBackgroundColor:originalScrollViewBackgroundColor];

    if ([(NSArray *)self->_originalSubviewYs count])
    {
      unint64_t v7 = 0;
      do
      {
        double v8 = [(NSArray *)self->_viewsToMove objectAtIndexedSubscript:v7];
        double v9 = [(NSArray *)self->_originalSubviewYs objectAtIndexedSubscript:v7];
        [v8 frame];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        [v9 doubleValue];
        [v8 setFrame:v11, v16, v13, v15];

        ++v7;
      }
      while (v7 < [(NSArray *)self->_originalSubviewYs count]);
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v17 = self->_clipViews;
    id v18 = [(NSArray *)v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          double v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v23 = [v22 superview];
          [v23 setTemporarilyHideWeekNumber:0];
          [v22 removeFromSuperview];
        }
        id v19 = [(NSArray *)v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v19);
    }

    [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:&stru_1001D3BE8];
    originalSubviewYs = self->_originalSubviewYs;
    self->_originalSubviewYs = 0;

    clipViews = self->_clipViews;
    self->_clipViews = 0;

    viewsToMove = self->_viewsToMove;
    self->_viewsToMove = 0;

    double v27 = self->_originalBackgroundColor;
    self->_originalBackgroundColor = 0;

    double v28 = self->_originalScrollViewBackgroundColor;
    self->_originalScrollViewBackgroundColor = 0;

    [(InfiniteScrollViewController *)self setSuppressViewAdjustments:0];
    self->_inAnimationSplitState = 0;
  }
}

- (void)setSplitStateOpen:(BOOL)a3
{
  if (self->_inAnimationSplitState && self->_splitOpen != a3)
  {
    self->_BOOL splitOpen = a3;
    p_splitCutOutRect = &self->_splitCutOutRect;
    double y = self->_splitCutOutRect.origin.y;
    double topBoundaryY = self->_topBoundaryY;
    double v8 = [(CompactWidthMonthViewController *)self view];
    [v8 frame];
    double v10 = v9 - (self->_splitCutOutRect.origin.y + self->_splitCutOutRect.size.height);

    double v11 = [(InfiniteScrollViewController *)self scrollView];
    double v12 = [(CompactWidthMonthViewController *)self view];
    [v11 convertRect:v12 fromView:p_splitCutOutRect->origin.x, self->_splitCutOutRect.origin.y, self->_splitCutOutRect.size.width, self->_splitCutOutRect.size.height];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    v54.origin.double x = v14;
    v54.origin.double y = v16;
    v54.size.double width = v18;
    v54.size.double height = v20;
    double MaxY = CGRectGetMaxY(v54);
    BOOL splitOpen = self->_splitOpen;
    if (!self->_splitOpen) {
      double v10 = -v10;
    }
    if (a3)
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v23 = self->_viewsToMove;
      id v24 = [(NSArray *)v23 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v50;
        if (splitOpen) {
          double v27 = -(y - topBoundaryY);
        }
        else {
          double v27 = y - topBoundaryY;
        }
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v50 != v26) {
              objc_enumerationMutation(v23);
            }
            long long v29 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            [v29 frame:v49];
            double v31 = v30;
            double v33 = v32;
            double v35 = v34;
            double v37 = v36;
            [v29 frame];
            if (CGRectGetMinY(v55) >= MaxY) {
              double v38 = v10;
            }
            else {
              double v38 = v27;
            }
            [v29 setFrame:v31, v33 + v38, v35, v37];
          }
          id v25 = [(NSArray *)v23 countByEnumeratingWithState:&v49 objects:v53 count:16];
        }
        while (v25);
      }
    }
    else if ([(NSArray *)self->_originalSubviewYs count])
    {
      unint64_t v39 = 0;
      do
      {
        double v40 = [(NSArray *)self->_viewsToMove objectAtIndexedSubscript:v39];
        long long v41 = [(NSArray *)self->_originalSubviewYs objectAtIndexedSubscript:v39];
        [v40 frame];
        double v43 = v42;
        double v45 = v44;
        double v47 = v46;
        [v41 doubleValue];
        [v40 setFrame:v43, v48, v45, v47];

        ++v39;
      }
      while (v39 < [(NSArray *)self->_originalSubviewYs count]);
    }
  }
}

- (void)_updateDividedListTopLineForDividedMode:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!self->_topLineView)
  {
    id v7 = objc_alloc((Class)UIView);
    double v8 = [(InfiniteScrollViewController *)self scrollView];
    [v8 safeAreaInsets];
    double v10 = v9;
    double v11 = [(CompactWidthMonthViewController *)self view];
    [v11 bounds];
    double Width = CGRectGetWidth(v29);
    EKUIScaleFactor();
    CalRoundToScreenScale();
    CGFloat v14 = [v7 initWithFrame:0.0, v10, Width, v13];
    topLineView = self->_topLineView;
    self->_topLineView = v14;

    [(UIView *)self->_topLineView setAutoresizingMask:34];
    CGFloat v16 = +[UIColor separatorColor];
    [(UIView *)self->_topLineView setBackgroundColor:v16];

    double v17 = [(CompactWidthMonthViewController *)self view];
    [v17 addSubview:self->_topLineView];
  }
  CGFloat v18 = [(InfiniteScrollViewController *)self scrollView];
  [v18 safeAreaInsets];
  double v20 = v19;
  double v21 = [(CompactWidthMonthViewController *)self view];
  [v21 bounds];
  double v22 = CGRectGetWidth(v30);
  EKUIScaleFactor();
  CalRoundToScreenScale();
  -[UIView setFrame:](self->_topLineView, "setFrame:", 0.0, v20, v22, v23);

  id v24 = self->_topLineView;
  if (v4)
  {
    if (v5) {
      double v25 = 0.0;
    }
    else {
      double v25 = 1.0;
    }
    [(UIView *)v24 setAlpha:v25];
    [(UIView *)self->_topLineView setHidden:0];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10009B2DC;
    v26[3] = &unk_1001D2718;
    v26[4] = self;
    BOOL v27 = v5;
    +[UIView animateWithDuration:v26 animations:0.2];
  }
  else
  {
    [(UIView *)v24 setHidden:!v5];
  }
}

- (void)_updateListViewFrame
{
  [(UIView *)self->_listViewContainer frame];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(CompactWidthMonthViewController *)self view];
  [v7 frame];
  double v9 = v8;

  [(CompactWidthMonthViewController *)self _bottomOfCurrentMonth];
  -[UIView setFrame:](self->_listViewContainer, "setFrame:", v4, v10, v6, v9 - v10);
  listViewController = self->_listViewController;
  if (listViewController)
  {
    double v12 = [(CompactMonthListViewController *)listViewController tableView];
    [v12 safeAreaInsets];
    double left = v13;
    double right = v15;
  }
  else
  {
    double left = UIEdgeInsetsZero.left;
    double right = UIEdgeInsetsZero.right;
  }
  EKUIScaleFactor();
  CalRoundToScreenScale();
  double v18 = v17;
  double v19 = [(CompactMonthListViewController *)self->_listViewController tableView];
  [v19 setContentInset:v18 left:0.0 right:right];

  self->_listFrameNeedsUpdate = 0;
}

- (id)_monthForLastVisibleMonth
{
  double v3 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  double v4 = [v3 calendarDateForEndOfMonth];
  double v5 = [v4 calendarDateByAddingWeeks:1 + [self _offsetNumberOfWeeksFromSelectedMonthForBottomVisibleMonth]];
  double v6 = [v5 calendarDateForMonth];

  return v6;
}

- (unint64_t)_offsetNumberOfWeeksFromSelectedMonthForBottomVisibleMonth
{
  double v3 = [(CompactWidthMonthViewController *)self view];
  EKUICurrentWindowHeightWithViewHierarchy();
  double v5 = v4;
  EKUIHeightForWindowSizeParadigm();
  double v7 = v6;

  double v8 = [(CompactWidthMonthViewController *)self view];
  EKUICurrentWindowHeightWithViewHierarchy();
  double v10 = v9;
  EKUIHeightForWindowSizeParadigm();
  double v12 = v11;

  unint64_t v13 = [(CompactWidthMonthViewController *)self _numberOfWeeksInSelectedMonth];
  unint64_t v14 = [(CompactWidthMonthViewController *)self _offsetNumberOfWeeksFromSelectedMonthForTopVisibleMonth];
  unint64_t v15 = 8 - (v13 + v14);
  if (v5 < v7) {
    unint64_t v15 = 0;
  }
  if (v10 >= v12) {
    return 11 - (v13 + v14);
  }
  else {
    return v15;
  }
}

- (unint64_t)_numberOfWeeksInSelectedMonth
{
  double v3 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDay];
  double v4 = [v3 date];

  if (v4)
  {
    weekCalculationCalendar = self->_weekCalculationCalendar;
    if (!weekCalculationCalendar)
    {
      double v6 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
      double v7 = (NSCalendar *)[v6 copy];
      double v8 = self->_weekCalculationCalendar;
      self->_weekCalculationCalendar = v7;

      [(NSCalendar *)self->_weekCalculationCalendar setFirstWeekday:CUIKOneIndexedWeekStart()];
      weekCalculationCalendar = self->_weekCalculationCalendar;
    }
    double v9 = [v3 date];
    [(NSCalendar *)weekCalculationCalendar rangeOfUnit:4096 inUnit:8 forDate:v9];
    unint64_t v11 = v10;
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (unint64_t)_offsetNumberOfWeeksFromSelectedMonthForTopVisibleMonth
{
  double v3 = [(CompactWidthMonthViewController *)self view];
  EKUICurrentWindowHeightWithViewHierarchy();
  double v5 = v4;
  EKUIHeightForWindowSizeParadigm();
  double v7 = v6;

  double v8 = [(CompactWidthMonthViewController *)self view];
  EKUICurrentWindowHeightWithViewHierarchy();
  double v10 = v9;
  EKUIHeightForWindowSizeParadigm();
  double v12 = v11;

  if (v10 >= v12) {
    return 2;
  }
  else {
    return v5 >= v7;
  }
}

- (double)_bottomOfCurrentMonth
{
  [(CUIKCalendarModel *)self->super.super.super.super._model selectedDay];
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x3032000000;
  CGRect v55 = sub_100097AC4;
  v56 = sub_100097AD4;
  id v57 = 0;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10009B9C8;
  v49[3] = &unk_1001D3A90;
  long long v51 = &v52;
  v49[4] = self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v50 = v3;
  +[UIView performWithoutAnimation:v49];
  double v4 = (void *)v53[5];
  if (v4)
  {
    double v5 = [v4 superview];
    [(id)v53[5] frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    unint64_t v14 = [(CompactWidthMonthViewController *)self view];
    [v5 convertRect:v14 toView:v7];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v58.origin.double x = v16;
    v58.origin.double y = v18;
    v58.size.double width = v20;
    v58.size.double height = v22;
    double MaxY = CGRectGetMaxY(v58);
  }
  else
  {
    id v24 = [v3 calendarDateForMonth];
    double v25 = [(InfiniteScrollViewController *)self subviewForDate:v24];

    uint64_t v26 = [v25 superview];
    [v25 frame];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v35 = [(CompactWidthMonthViewController *)self view];
    [v26 convertRect:v35 toView:v28];
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;

    unint64_t v44 = [(CompactWidthMonthViewController *)self _numberOfWeeksInSelectedMonth];
    id v45 = [(id)objc_opt_class() monthWeekViewClass];
    [(CompactWidthMonthViewController *)self monthWeekScale];
    [v45 heightForViewThatContainsFirstDayOfMonth:0 compressed:1 scale:];
    double v47 = v46;
    v59.origin.double x = v37;
    v59.origin.double y = v39;
    v59.size.double width = v41;
    v59.size.double height = v43;
    double MaxY = v47 * (double)(v44 - 1) + CGRectGetMaxY(v59);
  }
  _Block_object_dispose(&v52, 8);

  return MaxY;
}

- (CGPoint)_originForSelectedMonthViewInScrollViewWithState:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDay];
  id v6 = [(id)objc_opt_class() monthWeekViewClass];
  [(CompactWidthMonthViewController *)self monthWeekScale];
  [v6 heightForViewThatContainsFirstDayOfMonth:0 compressed:v3];
  double v8 = v7;
  double v9 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
  double v10 = [v5 calendarDateForMonth];
  double v11 = [v10 date];
  double v12 = [v5 calendarDateForEndOfWeekWithWeekStart:CUIKOneIndexedWeekStart()];
  double v13 = [v12 date];
  unint64_t v14 = [v9 components:4096 fromDate:v11 toDate:v13 options:0];

  double v15 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  CGFloat v16 = [(InfiniteScrollViewController *)self subviewForDate:v15];

  [v16 frame];
  double v18 = v17 - (double)(uint64_t)[v14 weekOfMonth] * v8;
  if (([v16 containsFirstDayOfMonth] & 1) == 0)
  {
    [v6 headerHeight];
    double v18 = v18 - v19;
  }

  double v20 = 0.0;
  double v21 = v18;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (id)_snapshotViewForDividedListTransition:(id)a3 useFastPath:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [v6 calendarDateForMonth];
  [v7 absoluteTime];
  uint64_t v9 = v8;

  double v10 = [v6 calendarDateForEndOfMonth];
  [v10 absoluteTime];
  uint64_t v12 = v11;

  uint64_t v43 = 0;
  unint64_t v44 = (double *)&v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  double v13 = [(InfiniteScrollViewController *)self scrollView];
  [v13 contentSize];
  uint64_t v15 = v14;

  uint64_t v46 = v15;
  uint64_t v39 = 0;
  double v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10009BEC4;
  v38[3] = &unk_1001D3C10;
  v38[6] = v9;
  v38[7] = v12;
  v38[4] = &v43;
  void v38[5] = &v39;
  [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v38];
  if (!*((unsigned char *)v40 + 24)) {
    goto LABEL_4;
  }
  double v16 = v44[3] + -4.0;
  v44[3] = v16;
  double v17 = [(CompactWidthMonthViewController *)self view];
  double v18 = [(InfiniteScrollViewController *)self scrollView];
  [v17 convertPoint:v18 fromView:0.0, v16];
  double v20 = v19;

  double v21 = [(CompactWidthMonthViewController *)self view];
  [v21 frame];
  double v23 = v22;

  if (v20 < v23)
  {
    id v24 = [(CompactWidthMonthViewController *)self view];
    [v24 bounds];
    double Width = CGRectGetWidth(v48);

    uint64_t v26 = [(CompactWidthMonthViewController *)self view];
    [v26 bounds];
    double Height = CGRectGetHeight(v49);

    double v28 = [(InfiniteScrollViewController *)self scrollView];
    double v29 = [(CompactWidthMonthViewController *)self view];
    [v28 convertPoint:v29 fromView:0.0, v20];
    double v31 = v30;
    double v33 = v32;

    double v34 = Height - v20;
    id v35 = [objc_alloc((Class)UISnapshotView) initWithFrame:0.0, v20, Width, v34];
    double v36 = [(InfiniteScrollViewController *)self scrollView];
    [v35 captureSnapshotRect:v36 fromView:v4 withSnapshotType:Width v34];
  }
  else
  {
LABEL_4:
    id v35 = 0;
  }
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  return v35;
}

- (void)_showDetailsForEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = [(MainViewController *)self model];
  [v12 setSelectedOccurrence:v11];

  double v13 = [(MainViewController *)self augmentEventDetailsContext:v10];

  uint64_t v14 = +[EKEventViewController eventDetailViewControllerWithEvent:v11 delegate:self context:v13];

  [(CompactWidthMonthViewController *)self ekui_adjustNavAndToolBarToTransparentStyles];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009C0E0;
  v16[3] = &unk_1001D2A40;
  id v17 = v14;
  unint64_t v18 = a5;
  id v15 = v14;
  [(MainViewController *)self showViewController:v15 sender:self animated:v7 completion:v16];
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v5 = a3;
  [v5 setDelegate:0];
  [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedOccurrence:0];
  id v6 = [(CompactWidthMonthViewController *)self navigationController];
  [v6 popViewControllersAfterAndIncluding:v5 animated:!self->_editorDismissedFromDelete];

  self->_editorDismissedFromDelete = 0;
}

- (void)eventViewController:(id)a3 willDismissEditViewController:(id)a4 deleted:(BOOL)a5
{
  self->_editorDismissedFromDelete = a5;
}

- (void)eventViewControllerWillDisappear:(id)a3
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (a4 == 1)
  {
    uint64_t v9 = [a3 calendarToMakeVisibleOnSave];
    id v10 = [v9 objectID];
    if (v10) {
      [(CUIKCalendarModel *)self->super.super.super.super._model ensureCalendarVisibleWithId:v10];
    }
  }
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_10009C334;
  id v15 = &unk_1001D2808;
  double v16 = self;
  id v17 = v8;
  id v11 = v8;
  [(CompactWidthMonthViewController *)self dismissViewControllerAnimated:1 completion:&v12];
  -[MonthViewController removeDraggingOccurrenceAnimated:](self, "removeDraggingOccurrenceAnimated:", 1, v12, v13, v14, v15, v16);
  [(MonthViewController *)self removeAllWeekHighlights];
}

- (id)calendarModel
{
  return self->super.super.super.super._model;
}

- (id)_weekViewAtScrollPoint:(CGPoint)a3 pointInWeek:(CGPoint *)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v33 = 0;
  double v34 = &v33;
  uint64_t v35 = 0x3032000000;
  double v36 = sub_100097AC4;
  CGFloat v37 = sub_100097AD4;
  id v38 = 0;
  id v8 = [(InfiniteScrollViewController *)self scrollView];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;

  id v15 = [(InfiniteScrollViewController *)self scrollView];
  [v15 contentOffset];
  double v17 = v16;
  unint64_t v18 = [(InfiniteScrollViewController *)self scrollView];
  [v18 safeAreaInsets];
  double v20 = v19;

  double v21 = [(InfiniteScrollViewController *)self scrollView];
  [v21 safeAreaInsets];
  double v23 = v22;

  [(UIView *)self->_listViewContainer frame];
  if (v24 <= 0.01)
  {
    double v29 = v14 - v23;
  }
  else
  {
    [(UIView *)self->_listViewContainer frame];
    double v26 = v25;
    double v27 = [(InfiniteScrollViewController *)self scrollView];
    [v27 safeAreaInsets];
    double v29 = v26 - v28;
  }
  v41.origin.CGFloat y = v17 + v20;
  v41.origin.CGFloat x = v10;
  v41.size.double width = v12;
  v41.size.double height = v29;
  v40.CGFloat x = x;
  v40.CGFloat y = y;
  if (CGRectContainsPoint(v41, v40))
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10009C59C;
    v32[3] = &unk_1001D3C38;
    *(CGFloat *)&v32[6] = x;
    *(CGFloat *)&v32[7] = y;
    v32[8] = a4;
    v32[4] = self;
    v32[5] = &v33;
    [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v32];
    id v30 = (id)v34[5];
  }
  else
  {
    id v30 = 0;
  }
  _Block_object_dispose(&v33, 8);

  return v30;
}

- (BOOL)dragAndDropAllowLongPress
{
  if (self->_dividedListMode) {
    return 0;
  }
  [(CompactWidthMonthViewController *)self monthWeekScale];
  double v4 = v3;
  +[CompactMonthWeekView eventScale];
  return v4 >= v5;
}

- (id)occurrenceAtPoint:(CGPoint)a3
{
  CGPoint v6 = CGPointZero;
  double v3 = -[CompactWidthMonthViewController _weekViewAtScrollPoint:pointInWeek:](self, "_weekViewAtScrollPoint:pointInWeek:", &v6, a3.x, a3.y);
  double v4 = [v3 occurrenceAtPoint:v6];

  return v4;
}

- (void)showEditorForNewDraggedEvent:(id)a3 inWeek:(id)a4
{
  id v5 = a3;
  CGPoint v6 = [(MainViewController *)self model];
  id v7 = +[AddEventViewController editOrAddViewControllerForEventOrIntegrationWithEvent:v5 model:v6 creationMethod:1 eventEditViewDelegate:self];

  [(CompactWidthMonthViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)dragAndDropRequestsPresentationOfViewController:(id)a3
{
  id v4 = a3;
  id v5 = [[UnadaptableNavigationController alloc] initWithRootViewController:v4];

  [(UnadaptableNavigationController *)v5 setModalPresentationStyle:2];
  [(CompactWidthMonthViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (BOOL)scaleForDragging
{
  return 1;
}

- (BOOL)suspendEventLoading
{
  return self->_suspendEventLoading;
}

- (void)setSuspendEventLoading:(BOOL)a3
{
  self->_suspendEventLoading = a3;
}

- (void)setDividedListMode:(BOOL)a3
{
  self->_dividedListMode = a3;
}

- (UILongPressGestureRecognizer)dayCellsScrubbingGestureRecognizer
{
  return self->_dayCellsScrubbingGestureRecognizer;
}

- (void)setDayCellsScrubbingGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)dayCellsTapGestureRecognizer
{
  return self->_dayCellsTapGestureRecognizer;
}

- (void)setDayCellsTapGestureRecognizer:(id)a3
{
}

- (UIPinchGestureRecognizer)pinchRecognizer
{
  return self->_pinchRecognizer;
}

- (void)setPinchRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinchRecognizer, 0);
  objc_storeStrong((id *)&self->_dayCellsTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dayCellsScrubbingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_pinchViews, 0);
  objc_storeStrong((id *)&self->_pinchScrollView, 0);
  objc_storeStrong((id *)&self->_viewsToMove, 0);
  objc_storeStrong((id *)&self->_originalSubviewYs, 0);
  objc_storeStrong((id *)&self->_clipViews, 0);
  objc_storeStrong((id *)&self->_originalScrollViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_originalBackgroundColor, 0);
  objc_storeStrong((id *)&self->_weekCalculationCalendar, 0);
  objc_storeStrong((id *)&self->_topLineView, 0);
  objc_storeStrong((id *)&self->_currentBackButtonDate, 0);
  objc_storeStrong((id *)&self->_selectedMonthWeekView, 0);
  objc_storeStrong((id *)&self->_listViewContainerTopLine, 0);
  objc_storeStrong((id *)&self->_listViewContainer, 0);
  objc_storeStrong((id *)&self->_listViewController, 0);
  objc_storeStrong((id *)&self->_pressedMonthView, 0);
  objc_storeStrong((id *)&self->_pressHighlight, 0);

  objc_storeStrong((id *)&self->_pressedDay, 0);
}

@end