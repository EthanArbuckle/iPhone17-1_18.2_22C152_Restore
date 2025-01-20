@interface MultiColumnMonthViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)_allowedToDisplayEventDetailsColumn;
- (BOOL)_listViewShowsSingleDay;
- (BOOL)_monthWeekViewsUseHorizontalCompression;
- (BOOL)_monthWeekViewsUseVerticalCompression;
- (BOOL)_shouldAnimateDots;
- (BOOL)_shouldDisplayThreeColumns;
- (BOOL)_threeColumnsDisplayIsAllowed;
- (BOOL)_viewingEventDetailsColumn;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)eventViewControllerShouldHideInlineEditButton;
- (BOOL)listViewControllerContainerHandlesShowEvent;
- (BOOL)shouldUpdateSelectedDateWithCentralView;
- (BOOL)showsYearInMonthLabel;
- (BOOL)wantsScrollingMessagesOnEveryFrameFromListViewController:(id)a3;
- (CGRect)frameForTodayHighlight;
- (CGRect)frameForWeekContainingDate:(id)a3;
- (CGRect)frameOfListView;
- (MultiColumnMonthViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5;
- (UILongPressGestureRecognizer)dayCellsScrubbingGestureRecognizer;
- (UITapGestureRecognizer)dayCellsTapGestureRecognizer;
- (double)_listviewColumnCollapsedWidth;
- (double)_scrollViewVerticalVelocity;
- (double)_showDateVerticalOffsetWithVerticalCompression:(BOOL)a3;
- (double)decelerationDistanceThresholdForDisplayingMonthBanner;
- (double)decelerationDistanceThresholdForPreferringMonthBoundary;
- (double)decelerationDistanceThresholdToStopShowingMonthBanner;
- (double)detailsLeftInsetAdjustment;
- (double)detailsRightInsetAdjustment;
- (double)heightForSubviewWithCalendarDate:(id)a3;
- (double)monthWeekScale;
- (double)palleteViewXOffset;
- (double)rightSplitViewSideInset;
- (double)showDateVerticalOffset;
- (double)showDateVerticalOffsetForDate:(id)a3;
- (double)topInsetForSubviewWithCalendarDate:(id)a3;
- (id)_dayInMonth:(id)a3 fromGesture:(id)a4;
- (id)_loadEventsForStartDate:(id)a3 endDate:(id)a4;
- (id)_viewFromGesture:(id)a3;
- (id)bestDateForNewEvent;
- (id)createInitialViewForDate:(id)a3;
- (id)newBottomViewBelowViewWithCalendarDate:(id)a3;
- (id)newTopViewAboveViewWithCalendarDate:(id)a3;
- (id)nextLevelWeekViewControllerWithDate:(id)a3;
- (id)preferredPreSizeClassTransitionSelectedDate;
- (id)pushedWeekViewControllerWithDate:(id)a3 animated:(BOOL)a4;
- (int)supportedToggleMode;
- (int64_t)eventCountDisplayedForDate:(id)a3;
- (int64_t)intendedSizeClass;
- (int64_t)presentationStyleOverrideForChildViewControllers;
- (unint64_t)edgesForExtendedLayout;
- (unint64_t)maximumCachedReusableViews;
- (void)_autoSelectEvent;
- (void)_cachedOccurrencesChanged:(id)a3;
- (void)_cancelEventDetailViewModeButtonPressed:(id)a3;
- (void)_createEventDetailsColumn;
- (void)_createMonthHighlightForMonthView:(id)a3 day:(id)a4;
- (void)_invalidateUpdateTimer;
- (void)_loadEventsForAllSubviews;
- (void)_loadEventsForViewsInRangeStartingAt:(id)a3 endingAt:(id)a4;
- (void)_occurrencesChanged:(id)a3;
- (void)_refreshListView;
- (void)_removeMonthHighlight;
- (void)_resetPaletteState;
- (void)_scrollListToNewSelectedDateAnimated:(BOOL)a3;
- (void)_scrubGestureCallback:(id)a3;
- (void)_setPaletteDisplaced;
- (void)_setSelectedDay:(id)a3;
- (void)_setSelectedDay:(id)a3 onMonthWeekView:(id)a4 animated:(BOOL)a5;
- (void)_setupListViewController;
- (void)_showDetailsForEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)_slideToAnimatePalleteShowingBackButton:(BOOL)a3 animated:(BOOL)a4;
- (void)_slideToHideEventDetailsAnimated:(BOOL)a3;
- (void)_slideToShowEventDetails:(id)a3 animated:(BOOL)a4;
- (void)_startUpdateTimer;
- (void)_tapGestureCallback:(id)a3;
- (void)_updateEventDetailsColumnViewFrame;
- (void)_updateInfiniteScrollViewFrame;
- (void)_updateListViewFrame;
- (void)_updateListViewModeForCurrentTraits;
- (void)compactMonthListViewController:(id)a3 didSelectEvent:(id)a4 showMode:(unint64_t)a5;
- (void)compactMonthListViewController:(id)a3 wantsToCommitViewControllerFromPreview:(id)a4;
- (void)dealloc;
- (void)didEndScrolling;
- (void)didScroll;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewController:(id)a3 requestsDismissalOfEditViewController:(id)a4;
- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4;
- (void)eventViewControllerNextButtonWasTapped:(id)a3;
- (void)eventViewControllerPreviousButtonWasTapped:(id)a3;
- (void)eventViewControllerWillDisappear:(id)a3;
- (void)eventViewControllerWillFinishEditingEvent:(id)a3 deleted:(BOOL)a4;
- (void)infiniteScrollViewSafeAreasDidChange;
- (void)listViewController:(id)a3 didScrollToDate:(id)a4;
- (void)loadView;
- (void)monthView:(id)a3 gestureBegan:(id)a4;
- (void)monthView:(id)a3 gestureCancelled:(id)a4;
- (void)monthView:(id)a3 gestureChanged:(id)a4;
- (void)monthView:(id)a3 gestureEnded:(id)a4;
- (void)navigateToEventDetails:(id)a3 fromController:(id)a4;
- (void)setDayCellsScrubbingGestureRecognizer:(id)a3;
- (void)setDayCellsTapGestureRecognizer:(id)a3;
- (void)setupUIForTraitCollection:(id)a3;
- (void)showDate:(id)a3 animated:(BOOL)a4;
- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)updateNavigationBarDisplayedDateString;
- (void)updatePalette:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4;
@end

@implementation MultiColumnMonthViewController

- (MultiColumnMonthViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MultiColumnMonthViewController;
  v11 = [(MonthViewController *)&v18 initWithCalendarDate:v8 model:v9 window:v10];
  if (v11)
  {
    objc_initWeak(&location, v11);
    uint64_t v19 = objc_opt_class();
    v12 = +[NSArray arrayWithObjects:&v19 count:1];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10010850C;
    v15[3] = &unk_1001D2620;
    objc_copyWeak(&v16, &location);
    id v13 = [(MultiColumnMonthViewController *)v11 registerForTraitChanges:v12 withHandler:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CUIKCalendarModelDisplayedOccurrencesChangedNotification object:self->super.super.super.super._model];
  [v3 removeObserver:self name:CUIKCalendarModelCachedOccurrencesChangedNotification object:self->super.super.super.super._model];

  v4.receiver = self;
  v4.super_class = (Class)MultiColumnMonthViewController;
  [(MonthViewController *)&v4 dealloc];
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)MultiColumnMonthViewController;
  [(MonthViewController *)&v12 loadView];
  [(MultiColumnMonthViewController *)self _setupListViewController];
  v3 = (UIView *)objc_alloc_init((Class)UIView);
  dividerLineBetweenListAndMonth = self->_dividerLineBetweenListAndMonth;
  self->_dividerLineBetweenListAndMonth = v3;

  v5 = +[UIColor colorWithWhite:0.8 alpha:1.0];
  [(UIView *)self->_dividerLineBetweenListAndMonth setBackgroundColor:v5];

  v6 = [(MultiColumnMonthViewController *)self view];
  [v6 addSubview:self->_dividerLineBetweenListAndMonth];

  v7 = (UIView *)objc_alloc_init((Class)UIView);
  dividerLineBetweenListAndEventDetails = self->_dividerLineBetweenListAndEventDetails;
  self->_dividerLineBetweenListAndEventDetails = v7;

  id v9 = +[UIColor colorWithWhite:0.8 alpha:1.0];
  [(UIView *)self->_dividerLineBetweenListAndEventDetails setBackgroundColor:v9];

  id v10 = [(MultiColumnMonthViewController *)self view];
  [v10 addSubview:self->_dividerLineBetweenListAndEventDetails];

  [(MonthViewController *)self setShouldShowMonthTitleHUDWhenScrolling:0];
  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"_cachedOccurrencesChanged:" name:CUIKCalendarModelCachedOccurrencesChangedNotification object:self->super.super.super.super._model];
  [v11 addObserver:self selector:"_occurrencesChanged:" name:CUIKCalendarModelDisplayedOccurrencesChangedNotification object:self->super.super.super.super._model];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MultiColumnMonthViewController;
  [(InfiniteScrollViewController *)&v7 viewDidLoad];
  v3 = [(InfiniteScrollViewController *)self scrollView];
  [v3 setDecelerationRate:UIScrollViewDecelerationRateFast];

  objc_super v4 = [(MultiColumnMonthViewController *)self traitCollection];
  +[UITraitCollection _setCurrentTraitCollection:v4];

  v5 = [(id)objc_opt_class() dividedModeBackgroundColor];
  v6 = [(InfiniteScrollViewController *)self scrollView];
  [v6 setBackgroundColor:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MultiColumnMonthViewController;
  -[MonthViewController viewWillAppear:](&v24, "viewWillAppear:");
  if (!self->_hasSetInitialSelectedDate)
  {
    v5 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    v6 = [(MonthViewController *)self adjustSelectedDateForNewMonth:v5];

    [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:v6];
    self->_hasSetInitialSelectedDate = 1;
  }
  self->_shouldSetSelectedDate = 1;
  navigationBarDisplayedDate = self->_navigationBarDisplayedDate;
  self->_navigationBarDisplayedDate = 0;

  id v8 = objc_alloc_init((Class)UITapGestureRecognizer);
  [(MultiColumnMonthViewController *)self setDayCellsTapGestureRecognizer:v8];

  id v9 = [(MultiColumnMonthViewController *)self dayCellsTapGestureRecognizer];
  [v9 addTarget:self action:"_tapGestureCallback:"];

  id v10 = [(InfiniteScrollViewController *)self scrollView];
  v11 = [(MultiColumnMonthViewController *)self dayCellsTapGestureRecognizer];
  [v10 addGestureRecognizer:v11];

  id v12 = objc_alloc_init((Class)UILongPressGestureRecognizer);
  [(MultiColumnMonthViewController *)self setDayCellsScrubbingGestureRecognizer:v12];

  [(id)objc_opt_class() scrubbingMinimumPressDuration];
  double v14 = v13;
  v15 = [(MultiColumnMonthViewController *)self dayCellsScrubbingGestureRecognizer];
  [v15 setMinimumPressDuration:v14];

  id v16 = [(MultiColumnMonthViewController *)self dayCellsScrubbingGestureRecognizer];
  [v16 addTarget:self action:"_scrubGestureCallback:"];

  v17 = [(InfiniteScrollViewController *)self scrollView];
  objc_super v18 = [(MultiColumnMonthViewController *)self dayCellsScrubbingGestureRecognizer];
  [v17 addGestureRecognizer:v18];

  uint64_t v19 = [(MultiColumnMonthViewController *)self view];
  LODWORD(v18) = EKUICurrentHeightSizeClassIsRegular();

  if (v18)
  {
    if ([(MultiColumnMonthViewController *)self _shouldDisplayThreeColumns]
      && !self->_isRotating)
    {
      v20 = +[CUIKPreferences sharedPreferences];
      [v20 setLargeListViewDisclosingEventDetails:1];
    }
    v21 = +[CUIKPreferences sharedPreferences];
    if ([v21 largeListViewDisclosingEventDetails])
    {
      unsigned __int8 v22 = [(MultiColumnMonthViewController *)self _viewingEventDetailsColumn];

      if ((v22 & 1) == 0)
      {
        [(MultiColumnMonthViewController *)self _autoSelectEvent];
        return;
      }
    }
    else
    {
    }
    v23 = +[CUIKPreferences sharedPreferences];
    [v23 setLargeListViewDisclosingEventDetails:0];

    if ([(MultiColumnMonthViewController *)self _viewingEventDetailsColumn]) {
      [(MultiColumnMonthViewController *)self _slideToHideEventDetailsAnimated:v3];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MultiColumnMonthViewController;
  [(CompactMonthViewController *)&v7 viewDidAppear:a3];
  objc_super v4 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDay];
  v5 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDay];
  v6 = [(InfiniteScrollViewController *)self subviewForDate:v5];
  [(MultiColumnMonthViewController *)self _setSelectedDay:v4 onMonthWeekView:v6 animated:1];

  self->_currentlyVisible = 1;
  self->_reloadAfterStoppedScrolling = 0;
  if (*(_WORD *)&self->_needToReloadEventsOnAppear)
  {
    self->_needToReloadEventsOnAppear = 0;
    self->_eventLoadingSuspendedForScroll = 0;
    [(MultiColumnMonthViewController *)self _loadEventsForAllSubviews];
  }
  [(MultiColumnMonthViewController *)self _refreshListView];
  [(MultiColumnMonthViewController *)self _startUpdateTimer];
  [(MultiColumnMonthViewController *)self updatePalette:self->_palette];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MultiColumnMonthViewController *)self _resetPaletteState];
  [(MultiColumnMonthViewController *)self _invalidateUpdateTimer];
  [(UIButton *)self->_cancelEventDetailViewModeButton removeFromSuperview];
  cancelEventDetailViewModeButton = self->_cancelEventDetailViewModeButton;
  self->_cancelEventDetailViewModeButton = 0;

  v6 = [(InfiniteScrollViewController *)self scrollView];
  objc_super v7 = [(MultiColumnMonthViewController *)self dayCellsTapGestureRecognizer];
  [v6 removeGestureRecognizer:v7];

  id v8 = [(InfiniteScrollViewController *)self scrollView];
  id v9 = [(MultiColumnMonthViewController *)self dayCellsScrubbingGestureRecognizer];
  [v8 removeGestureRecognizer:v9];

  v10.receiver = self;
  v10.super_class = (Class)MultiColumnMonthViewController;
  [(MonthViewController *)&v10 viewWillDisappear:v3];
}

- (void)setupUIForTraitCollection:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MultiColumnMonthViewController;
  id v4 = a3;
  [(MainViewController *)&v8 setupUIForTraitCollection:v4];
  id v5 = [v4 verticalSizeClass];

  if (v5 == (id)1) {
    [(id)objc_opt_class() dividedModeBackgroundColor];
  }
  else {
  v6 = +[UIColor whiteColor];
  }
  objc_super v7 = [(InfiniteScrollViewController *)self scrollView];
  [v7 setBackgroundColor:v6];
}

- (void)viewWillLayoutSubviews
{
  BOOL v3 = [(MultiColumnMonthViewController *)self view];
  [v3 bounds];
  BOOL IsEmpty = CGRectIsEmpty(v6);

  if (!IsEmpty)
  {
    [(MultiColumnMonthViewController *)self _updateListViewFrame];
    [(MultiColumnMonthViewController *)self _updateInfiniteScrollViewFrame];
    [(MultiColumnMonthViewController *)self _updateEventDetailsColumnViewFrame];
    v5.receiver = self;
    v5.super_class = (Class)MultiColumnMonthViewController;
    [(InfiniteScrollViewController *)&v5 viewWillLayoutSubviews];
  }
}

- (unint64_t)edgesForExtendedLayout
{
  return 0;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if ([(MultiColumnMonthViewController *)self isViewLoaded])
  {
    objc_super v8 = [(MultiColumnMonthViewController *)self view];
    id v9 = [v8 window];

    if (v9)
    {
      [(MainViewController *)self transitionToSizeWillStart];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1001090A4;
      v13[3] = &unk_1001D2E40;
      v13[4] = self;
      [v7 animateAlongsideTransition:0 completion:v13];
      self->_isRotating = 1;
      if ([(MultiColumnMonthViewController *)self _threeColumnsDisplayIsAllowed]
        && (EKUIWidthForWindowSizeParadigm(), width > v10))
      {
        if ([(MultiColumnMonthViewController *)self _viewingEventDetailsColumn]) {
          [(MultiColumnMonthViewController *)self _slideToAnimatePalleteShowingBackButton:0 animated:1];
        }
        v11 = +[CUIKPreferences sharedPreferences];
        [v11 setLargeListViewDisclosingEventDetails:1];
      }
      else
      {
        EKUIHeightForWindowSizeParadigm();
        if (height > v12) {
          [(MultiColumnMonthViewController *)self _slideToAnimatePalleteShowingBackButton:[(MultiColumnMonthViewController *)self _viewingEventDetailsColumn] animated:1];
        }
      }
      [(MultiColumnMonthViewController *)self viewWillAppear:1];
      self->_isRotating = 0;
    }
  }
}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  return 1;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    if (a5) {
      [(MultiColumnMonthViewController *)self _showDetailsForEvent:v10 animated:v8 showMode:a5 context:v11];
    }
  }
  else
  {
    double v12 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "No event given.  Will not show event through Month View.", v13, 2u);
    }
  }
}

- (double)palleteViewXOffset
{
  if (CalInterfaceIsLeftToRight()) {
    return 0.0;
  }
  id v4 = [(MultiColumnMonthViewController *)self view];
  [v4 bounds];
  double MidX = CGRectGetMidX(v6);

  return MidX;
}

- (void)updatePalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
  id v5 = a3;
  [v5 setWeekdayHeaderFillsHalfWidth:1];
  [v5 setNeedsLayout];
  v10.receiver = self;
  v10.super_class = (Class)MultiColumnMonthViewController;
  [(CompactMonthViewController *)&v10 updatePalette:v5];
  [v5 setTodayButtonVisible:1];
  [v5 setDateStringVisible:1];
  [v5 setFocusBannerPlacement:2];
  [v5 setOpaqueBackground:0];
  CGRect v6 = +[UIColor clearColor];
  [v5 setBackgroundColor:v6];

  [v5 sizeToFit];
  [v5 frame];
  double v8 = v7;
  id v9 = [v5 containingPalette];

  [v9 setPreferredHeight:v8];
}

- (id)bestDateForNewEvent
{
  return [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
}

- (int)supportedToggleMode
{
  return 0;
}

- (void)updateNavigationBarDisplayedDateString
{
  BOOL v3 = [(MainViewController *)self model];
  id v4 = [v3 selectedDate];

  if (v4)
  {
    if (!self->_navigationBarDisplayedDate
      || (id v5 = [v4 month], v5 != -[EKCalendarDate month](self->_navigationBarDisplayedDate, "month"))
      || (id v6 = [v4 year], v6 != -[EKCalendarDate year](self->_navigationBarDisplayedDate, "year")))
    {
      double v7 = [(MultiColumnMonthViewController *)self navigationController];
      double v8 = [v7 topMainViewControllerContainer];
      id v9 = [v8 currentChildViewController];

      if (v9 == self)
      {
        objc_super v10 = [(MultiColumnMonthViewController *)self navigationController];
        [v10 setNavBarStringFromDate:v4 includeMonth:1 includeYear:1];
      }
    }
  }
  navigationBarDisplayedDate = self->_navigationBarDisplayedDate;
  self->_navigationBarDisplayedDate = (EKCalendarDate *)v4;
}

- (int64_t)intendedSizeClass
{
  return 2;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (id)preferredPreSizeClassTransitionSelectedDate
{
  BOOL v3 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];

  if (v3)
  {
    id v4 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MultiColumnMonthViewController;
    id v4 = [(MonthViewController *)&v6 preferredPreSizeClassTransitionSelectedDate];
  }

  return v4;
}

- (BOOL)_monthWeekViewsUseVerticalCompression
{
  v2 = [(MultiColumnMonthViewController *)self ekui_futureTraitCollection];
  BOOL v3 = [v2 verticalSizeClass] == (id)1;

  return v3;
}

- (BOOL)_monthWeekViewsUseHorizontalCompression
{
  return 1;
}

- (unint64_t)maximumCachedReusableViews
{
  return 18;
}

- (id)createInitialViewForDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ([v4 day] != (id)1)
  {
    id v5 = [v4 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];
  }
  objc_super v6 = [(InfiniteScrollViewController *)self dequeueReusableView];
  if (v6)
  {
    double v7 = v6;
    [(CompactMonthWeekView *)v6 setCompressedVerticalMode:[(MultiColumnMonthViewController *)self _monthWeekViewsUseVerticalCompression]];
    [(CompactMonthWeekView *)v7 setCalendarDate:v5];
  }
  else
  {
    double v8 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    double v7 = [[CompactMonthWeekView alloc] initWithCalendarDate:v5 calendar:v8 compressed:[(MultiColumnMonthViewController *)self _monthWeekViewsUseVerticalCompression]];
  }
  [(CompactMonthWeekView *)v7 setUseLayoutMargins:1];
  if (!self->_selectedMonthWeekView)
  {
    id v9 = [(CompactMonthWeekView *)v7 calendarDate];
    [v9 absoluteTime];
    double v11 = v10;
    double v12 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    [v12 absoluteTime];
    if (v11 <= v13)
    {
      double v14 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      [v14 absoluteTime];
      double v16 = v15;
      v17 = [(CompactMonthWeekView *)v7 endCalendarDate];
      [v17 absoluteTime];
      double v19 = v18;

      if (v16 > v19) {
        goto LABEL_12;
      }
      id v9 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      [(MultiColumnMonthViewController *)self _setSelectedDay:v9 onMonthWeekView:v7 animated:0];
    }
    else
    {
    }
  }
LABEL_12:
  v20 = [(CompactMonthWeekView *)v7 calendarDate];
  v21 = [(CompactMonthWeekView *)v7 endCalendarDate];
  unsigned __int8 v22 = [(MultiColumnMonthViewController *)self _loadEventsForStartDate:v20 endDate:v21];
  [(CompactMonthWeekView *)v7 setEventData:v22];

  v23 = +[CUIKPreferences sharedPreferences];
  -[CompactMonthWeekView setShowWeekNumber:](v7, "setShowWeekNumber:", [v23 showWeekNumbers]);

  return v7;
}

- (id)newTopViewAboveViewWithCalendarDate:(id)a3
{
  id v4 = [(MonthViewController *)self calendarDateForSubviewAboveSubviewWithCalendarDate:a3];
  id v5 = [(InfiniteScrollViewController *)self dequeueReusableView];
  if (v5)
  {
    objc_super v6 = v5;
    [(CompactMonthWeekView *)v5 setCompressedVerticalMode:[(MultiColumnMonthViewController *)self _monthWeekViewsUseVerticalCompression]];
    [(CompactMonthWeekView *)v6 setCalendarDate:v4];
  }
  else
  {
    double v7 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    objc_super v6 = [[CompactMonthWeekView alloc] initWithCalendarDate:v4 calendar:v7 compressed:[(MultiColumnMonthViewController *)self _monthWeekViewsUseVerticalCompression]];
  }
  [(CompactMonthWeekView *)v6 setUseLayoutMargins:1];
  double v8 = [(CompactMonthWeekView *)v6 calendarDate];
  id v9 = [(CompactMonthWeekView *)v6 endCalendarDate];
  double v10 = [(MultiColumnMonthViewController *)self _loadEventsForStartDate:v8 endDate:v9];
  [(CompactMonthWeekView *)v6 setEventData:v10 animated:[(MultiColumnMonthViewController *)self _shouldAnimateDots]];

  if (!self->_selectedMonthWeekView)
  {
    double v11 = [(CompactMonthWeekView *)v6 calendarDate];
    [v11 absoluteTime];
    double v13 = v12;
    double v14 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    [v14 absoluteTime];
    if (v13 > v15)
    {

LABEL_9:
      goto LABEL_10;
    }
    double v16 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    [v16 absoluteTime];
    double v18 = v17;
    double v19 = [(CompactMonthWeekView *)v6 endCalendarDate];
    [v19 absoluteTime];
    double v21 = v20;

    if (v18 <= v21)
    {
      double v11 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      [(MultiColumnMonthViewController *)self _setSelectedDay:v11 onMonthWeekView:v6 animated:0];
      goto LABEL_9;
    }
  }
LABEL_10:
  unsigned __int8 v22 = +[CUIKPreferences sharedPreferences];
  -[CompactMonthWeekView setShowWeekNumber:](v6, "setShowWeekNumber:", [v22 showWeekNumbers]);

  return v6;
}

- (id)newBottomViewBelowViewWithCalendarDate:(id)a3
{
  id v4 = [(MonthViewController *)self calendarDateForSubviewBelowSubviewWithCalendarDate:a3];
  id v5 = [(InfiniteScrollViewController *)self dequeueReusableView];
  if (v5)
  {
    objc_super v6 = v5;
    [(CompactMonthWeekView *)v5 setCompressedVerticalMode:[(MultiColumnMonthViewController *)self _monthWeekViewsUseVerticalCompression]];
    [(CompactMonthWeekView *)v6 setCalendarDate:v4];
  }
  else
  {
    double v7 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    objc_super v6 = [[CompactMonthWeekView alloc] initWithCalendarDate:v4 calendar:v7 compressed:[(MultiColumnMonthViewController *)self _monthWeekViewsUseVerticalCompression]];
  }
  [(CompactMonthWeekView *)v6 setUseLayoutMargins:1];
  double v8 = [(CompactMonthWeekView *)v6 calendarDate];
  id v9 = [(CompactMonthWeekView *)v6 endCalendarDate];
  double v10 = [(MultiColumnMonthViewController *)self _loadEventsForStartDate:v8 endDate:v9];
  [(CompactMonthWeekView *)v6 setEventData:v10 animated:[(MultiColumnMonthViewController *)self _shouldAnimateDots]];

  if (!self->_selectedMonthWeekView)
  {
    double v11 = [(CompactMonthWeekView *)v6 calendarDate];
    [v11 absoluteTime];
    double v13 = v12;
    double v14 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    [v14 absoluteTime];
    if (v13 < v15)
    {

LABEL_9:
      goto LABEL_10;
    }
    double v16 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    [v16 absoluteTime];
    double v18 = v17;
    double v19 = [(CompactMonthWeekView *)v6 endCalendarDate];
    [v19 absoluteTime];
    double v21 = v20;

    if (v18 <= v21)
    {
      double v11 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      [(MultiColumnMonthViewController *)self _setSelectedDay:v11 onMonthWeekView:v6 animated:0];
      goto LABEL_9;
    }
  }
LABEL_10:
  unsigned __int8 v22 = +[CUIKPreferences sharedPreferences];
  -[CompactMonthWeekView setShowWeekNumber:](v6, "setShowWeekNumber:", [v22 showWeekNumbers]);

  return v6;
}

- (BOOL)shouldUpdateSelectedDateWithCentralView
{
  return 0;
}

- (void)didEndScrolling
{
  v8.receiver = self;
  v8.super_class = (Class)MultiColumnMonthViewController;
  [(MonthViewController *)&v8 didEndScrolling];
  if (self->_eventLoadingSuspendedForScroll && !self->_reloadAfterStoppedScrolling)
  {
    self->_eventLoadingSuspendedForScroll = 0;
    self->_reloadAfterStoppedScrolling = 1;
    dispatch_time_t v3 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100109D50;
    block[3] = &unk_1001D2740;
    block[4] = self;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  if (self->_currentlyVisible)
  {
    id v4 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    id v5 = [(InfiniteScrollViewController *)self subviewForDate:v4];

    if (v5 != self->_selectedMonthWeekView)
    {
      objc_super v6 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
      [(MultiColumnMonthViewController *)self _setSelectedDay:v6 onMonthWeekView:v5 animated:1];
    }
    [(MultiColumnMonthViewController *)self updateNavigationBarDisplayedDateString];
  }
}

- (void)willEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  double y = a3.y;
  v70.receiver = self;
  v70.super_class = (Class)MultiColumnMonthViewController;
  -[MonthViewController willEndDraggingWithVelocity:targetContentOffset:](&v70, "willEndDraggingWithVelocity:targetContentOffset:", a3.x);
  double v7 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  double v8 = -y;
  if (y >= 0.0) {
    double v8 = y;
  }
  if (v8 <= 0.3)
  {
    v33 = [(InfiniteScrollViewController *)self scrollView];
    [v33 contentOffset];
    double v35 = v34;
    double v37 = v36;

    v38 = [(InfiniteScrollViewController *)self scrollView];
    [v38 frame];
    double v40 = v39;

    v41 = [(InfiniteScrollViewController *)self scrollView];
    [v41 safeAreaInsets];
    double v43 = v42;
    v44 = [(InfiniteScrollViewController *)self scrollView];
    [v44 safeAreaInsets];
    double v46 = v40 - (v43 + v45);

    id v68 = 0;
    -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](self, "nearestMajorBoundaryForPoint:date:", &v68, v35, v37 + v46 * 0.5);
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    id v32 = v68;
    a4->x = v48;
    a4->double y = v50;
    id v9 = v7;
  }
  else
  {
    id v9 = self->_selectedMonthWeekView;
    if (!v9)
    {
      id v9 = [(InfiniteScrollViewController *)self firstView];
    }
    double v10 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    double v11 = v10;
    if (y > 0.0) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = -1;
    }
    double v13 = [v10 calendarDateByAddingMonths:v12];
    double v14 = [v13 calendarDateForMonth];

    double v15 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    double v16 = [(CompactMonthWeekView *)v9 calendarDate];
    double v17 = [v16 date];
    double v18 = [v14 date];
    double v19 = [v15 components:0x2000 fromDate:v17 toDate:v18 options:0];

    [(CompactMonthWeekView *)v9 frame];
    double v21 = v20;
    [(CompactMonthWeekView *)v9 frame];
    double v23 = v22;
    BOOL v24 = y <= 0.0;
    double v26 = v25 + (double)(uint64_t)[v19 weekOfYear] * v21;
    if (v24)
    {
      +[CompactMonthWeekView headerHeight];
      double v26 = v26 - v27;
    }
    id v69 = v14;
    -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](self, "nearestMajorBoundaryForPoint:date:", &v69, v23, v26);
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    id v32 = v69;

    a4->x = v29;
    a4->double y = v31;
  }
  v51 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  id v52 = [v51 month];
  if (v52 == [v32 month])
  {
    v53 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    id v54 = [v53 year];
    id v55 = [v32 year];

    if (v54 == v55)
    {
      v56 = v32;
      goto LABEL_25;
    }
  }
  else
  {
  }
  v57 = CUIKTodayDate();
  v58 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
  v59 = [v58 timeZone];
  v60 = +[EKCalendarDate calendarDateWithDate:v57 timeZone:v59];

  id v61 = [v60 month];
  if (v61 == [v32 month] && (id v62 = objc_msgSend(v60, "year"), v62 == objc_msgSend(v32, "year")))
  {
    id v63 = v60;
  }
  else
  {
    id v63 = [v32 calendarDateForMonth];
  }
  v56 = v63;

  self->_listViewContainerDidScrollMessagesSuppressed = 1;
  v64 = [(MainViewController *)self model];
  [v64 setSelectedDate:v56];

  self->_listViewContainerDidScrollMessagesSuppressed = 0;
  if (self->_currentlyVisible)
  {
    v65 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    v66 = [(InfiniteScrollViewController *)self subviewForDate:v65];

    v67 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
    [(MultiColumnMonthViewController *)self _setSelectedDay:v67 onMonthWeekView:v66 animated:1];

    [(MultiColumnMonthViewController *)self updateNavigationBarDisplayedDateString];
  }

LABEL_25:
  [(MultiColumnMonthViewController *)self _scrollListToNewSelectedDateAnimated:1];
}

- (BOOL)showsYearInMonthLabel
{
  return 1;
}

- (void)didScroll
{
  v3.receiver = self;
  v3.super_class = (Class)MultiColumnMonthViewController;
  [(CompactMonthViewController *)&v3 didScroll];
  self->_reloadAfterStoppedScrolling = 0;
}

- (void)showDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(MultiColumnMonthViewController *)self showDate:a3 animated:a4 completionBlock:0];

  [(MultiColumnMonthViewController *)self _scrollListToNewSelectedDateAnimated:v4];
}

- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  double v10 = [(MainViewController *)self model];
  double v11 = [v10 calendar];
  uint64_t v12 = [v11 timeZone];
  double v13 = +[EKCalendarDate calendarDateWithDate:v9 timeZone:v12];

  double v14 = [v13 calendarDateForMonth];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10010A408;
  v19[3] = &unk_1001D2F08;
  v19[4] = self;
  id v20 = v8;
  id v15 = v8;
  double v16 = objc_retainBlock(v19);
  double v17 = [v14 date];
  v18.receiver = self;
  v18.super_class = (Class)MultiColumnMonthViewController;
  [(InfiniteScrollViewController *)&v18 showDate:v17 animated:v5 completionBlock:v16];
}

- (void)infiniteScrollViewSafeAreasDidChange
{
  objc_super v3 = [(InfiniteScrollViewController *)self scrollView];
  BOOL v4 = [(InfiniteScrollViewController *)self scrollView];
  BOOL v5 = [v4 layer];
  [v3 layoutSublayersOfLayer:v5];

  id v6 = [(MultiColumnMonthViewController *)self view];
  [v6 setNeedsLayout];
}

- (void)_tapGestureCallback:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = sub_10010A6E0;
  objc_super v18 = sub_10010A6F0;
  id v19 = 0;
  BOOL v5 = [v4 view];
  id v6 = [v5 subviews];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  double v10 = sub_10010A6F8;
  double v11 = &unk_1001D3B50;
  id v7 = v4;
  id v12 = v7;
  double v13 = &v14;
  [v6 enumerateObjectsUsingBlock:&v8];

  -[MultiColumnMonthViewController monthView:gestureBegan:](self, "monthView:gestureBegan:", v15[5], v7, v8, v9, v10, v11);
  [(MultiColumnMonthViewController *)self monthView:v15[5] gestureEnded:v7];

  _Block_object_dispose(&v14, 8);
}

- (void)_scrubGestureCallback:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = sub_10010A6E0;
  objc_super v18 = sub_10010A6F0;
  id v19 = 0;
  BOOL v5 = [v4 view];
  id v6 = [v5 subviews];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  double v10 = sub_10010A994;
  double v11 = &unk_1001D3B50;
  id v7 = v4;
  id v12 = v7;
  double v13 = &v14;
  [v6 enumerateObjectsUsingBlock:&v8];

  switch((unint64_t)objc_msgSend(v7, "state", v8, v9, v10, v11))
  {
    case 1uLL:
      [(MultiColumnMonthViewController *)self monthView:v15[5] gestureBegan:v7];
      break;
    case 2uLL:
      [(MultiColumnMonthViewController *)self monthView:v15[5] gestureChanged:v7];
      break;
    case 3uLL:
      [(MultiColumnMonthViewController *)self monthView:v15[5] gestureEnded:v7];
      break;
    case 4uLL:
    case 5uLL:
      [(MultiColumnMonthViewController *)self monthView:v15[5] gestureCancelled:v7];
      break;
    default:
      break;
  }

  _Block_object_dispose(&v14, 8);
}

- (void)_scrollListToNewSelectedDateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  self->_listViewContainerDidScrollMessagesSuppressed = 1;
  multiDayListViewController = self->_multiDayListViewController;
  id v6 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  id v7 = [v6 date];
  [multiDayListViewController scrollToDate:v7 animated:v3];

  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010AB54;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_viewFromGesture:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10010A6E0;
  double v17 = sub_10010A6F0;
  id v18 = 0;
  BOOL v5 = [(InfiniteScrollViewController *)self scrollView];
  [v4 locationInView:v5];
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10010ACBC;
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
  uint64_t v7 = [(InfiniteScrollViewController *)self scrollView];
  unsigned __int8 v8 = [v7 isDecelerating];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [(MultiColumnMonthViewController *)self _dayInMonth:v16 fromGesture:v6];
    if (v9)
    {
      if (self->_pressedMonthView != v16 || [v9 compare:self->_pressedDay])
      {
        [(MultiColumnMonthViewController *)self _createMonthHighlightForMonthView:v16 day:v9];
        [(TappableDayNumber *)self->_pressHighlight setPressed:1];
      }
      id v10 = [(InfiniteScrollViewController *)self scrollView];
      [v10 setScrollEnabled:0];

      [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:v9];
      [(MultiColumnMonthViewController *)self _scrollListToNewSelectedDateAnimated:0];
      double v11 = CUIKTodayDate();
      id v12 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
      uint64_t v13 = [v12 timeZone];
      uint64_t v14 = +[EKCalendarDate calendarDateWithDate:v11 timeZone:v13];
      uint64_t v15 = [(InfiniteScrollViewController *)self subviewForDate:v14];

      if (v15) {
        [v15 haltTodayPulse];
      }
    }
  }
}

- (void)monthView:(id)a3 gestureChanged:(id)a4
{
  id v6 = (CompactMonthWeekView *)a3;
  id v7 = a4;
  unsigned __int8 v8 = [(InfiniteScrollViewController *)self scrollView];
  unsigned __int8 v9 = [v8 isDecelerating];

  if (v9)
  {
    uint64_t v13 = v6;
  }
  else
  {
    uint64_t v13 = [(MultiColumnMonthViewController *)self _viewFromGesture:v7];

    id v10 = [(MultiColumnMonthViewController *)self _dayInMonth:v13 fromGesture:v7];
    BOOL v11 = v13 == self->_pressedMonthView && [(EKCalendarDate *)self->_pressedDay compare:v10] == 0;
    if (v11 != [(TappableDayNumber *)self->_pressHighlight isSelected]) {
      [(TappableDayNumber *)self->_pressHighlight setPressed:v11];
    }
    if (v10) {
      char v12 = v11;
    }
    else {
      char v12 = 1;
    }
    if ((v12 & 1) == 0)
    {
      [(MultiColumnMonthViewController *)self _removeMonthHighlight];
      [(MultiColumnMonthViewController *)self _createMonthHighlightForMonthView:v13 day:v10];
      [(TappableDayNumber *)self->_pressHighlight setPressed:1];
      [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:v10];
      [(MultiColumnMonthViewController *)self _scrollListToNewSelectedDateAnimated:0];
    }
  }
}

- (void)monthView:(id)a3 gestureEnded:(id)a4
{
  id v6 = (CompactMonthWeekView *)a3;
  id v7 = a4;
  unsigned __int8 v8 = [(InfiniteScrollViewController *)self scrollView];
  unsigned __int8 v9 = [v8 isDecelerating];

  if ((v9 & 1) == 0)
  {
    id v10 = [(MultiColumnMonthViewController *)self _viewFromGesture:v7];

    BOOL v11 = [(MultiColumnMonthViewController *)self _dayInMonth:v10 fromGesture:v7];
    char v12 = v11;
    if (v10 != self->_pressedMonthView || v11 == 0)
    {
      uint64_t v14 = [(InfiniteScrollViewController *)self scrollView];
      [v14 setScrollEnabled:1];
    }
    else
    {
      id v15 = [v11 compare:self->_pressedDay];
      uint64_t v16 = [(InfiniteScrollViewController *)self scrollView];
      [v16 setScrollEnabled:1];

      if (!v15)
      {
        [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:v12];
        [(MultiColumnMonthViewController *)self _removeMonthHighlight];
        [(MultiColumnMonthViewController *)self _setSelectedDay:v12 onMonthWeekView:v10 animated:0];
        [(MultiColumnMonthViewController *)self _scrollListToNewSelectedDateAnimated:1];
        goto LABEL_12;
      }
    }
    [(TappableDayNumber *)self->_pressHighlight setPressed:0];
    dispatch_time_t v17 = dispatch_time(0, 300000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010B314;
    block[3] = &unk_1001D2740;
    block[4] = self;
    dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
LABEL_12:

    goto LABEL_13;
  }
  id v10 = v6;
LABEL_13:
}

- (void)monthView:(id)a3 gestureCancelled:(id)a4
{
  BOOL v5 = [(InfiniteScrollViewController *)self scrollView];
  [v5 setScrollEnabled:1];

  [(MultiColumnMonthViewController *)self _removeMonthHighlight];
}

- (id)_dayInMonth:(id)a3 fromGesture:(id)a4
{
  id v5 = a3;
  [a4 locationInView:v5];
  id v6 = [v5 dayForPoint:];

  return v6;
}

- (void)_createMonthHighlightForMonthView:(id)a3 day:(id)a4
{
  id v6 = (CompactMonthWeekView *)a3;
  id v7 = (EKCalendarDate *)a4;
  [(MultiColumnMonthViewController *)self _removeMonthHighlight];
  pressedDadouble y = self->_pressedDay;
  self->_pressedDadouble y = v7;
  BOOL v11 = v7;

  pressedMonthView = self->_pressedMonthView;
  self->_pressedMonthView = v6;
  id v10 = v6;

  [(MultiColumnMonthViewController *)self _setSelectedDay:v11 onMonthWeekView:v10 animated:0];
}

- (void)_removeMonthHighlight
{
  [(MultiColumnMonthViewController *)self _setSelectedDay:0 onMonthWeekView:self->_selectedMonthWeekView animated:0];
  BOOL v3 = self->_pressHighlight;
  pressHighlight = self->_pressHighlight;
  self->_pressHighlight = 0;

  pressedDadouble y = self->_pressedDay;
  self->_pressedDadouble y = 0;

  pressedMonthView = self->_pressedMonthView;
  self->_pressedMonthView = 0;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10010B5D4;
  v10[3] = &unk_1001D2740;
  BOOL v11 = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10010B5E0;
  v8[3] = &unk_1001D27D8;
  unsigned __int8 v9 = v11;
  id v7 = v11;
  +[UIView animateWithDuration:v10 animations:v8 completion:0.2];
}

- (void)_setSelectedDay:(id)a3
{
  id v4 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  id v6 = [(InfiniteScrollViewController *)self subviewForDate:v4];

  id v5 = [(CUIKCalendarModel *)self->super.super.super.super._model selectedDate];
  [(MultiColumnMonthViewController *)self _setSelectedDay:v5 onMonthWeekView:v6 animated:0];
}

- (void)_setSelectedDay:(id)a3 onMonthWeekView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  unsigned __int8 v8 = (CompactMonthWeekView *)a4;
  p_selectedMonthWeekView = &self->_selectedMonthWeekView;
  if (*p_selectedMonthWeekView != v8)
  {
    [(CompactMonthWeekView *)*p_selectedMonthWeekView setSelectedDay:0 animated:0];
    id v10 = *p_selectedMonthWeekView;
    *p_selectedMonthWeekView = 0;
  }
  if (v11 && v8)
  {
    [(CompactMonthWeekView *)v8 setSelectedDay:v11 animated:v5];
    objc_storeStrong((id *)p_selectedMonthWeekView, a4);
  }
}

- (double)_listviewColumnCollapsedWidth
{
  v2 = [(MultiColumnMonthViewController *)self view];
  [v2 bounds];
  CGRectGetWidth(v6);
  EKUIGoldenRatioColumnWidthMinor();
  double v4 = v3;

  return v4;
}

- (void)_cachedOccurrencesChanged:(id)a3
{
  if (self->_currentlyVisible) {
    [(MultiColumnMonthViewController *)self _loadEventsForAllSubviews];
  }
  else {
    self->_needToReloadEventsOnAppear = 1;
  }
}

- (void)_occurrencesChanged:(id)a3
{
  if (self->_currentlyVisible)
  {
    id v4 = a3;
    BOOL v5 = [v4 userInfo];
    id v8 = [v5 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedRangeStartKey];

    CGRect v6 = [v4 userInfo];

    id v7 = [v6 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedRangeEndKey];

    [(MultiColumnMonthViewController *)self _loadEventsForViewsInRangeStartingAt:v8 endingAt:v7];
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
  if (!self->_eventLoadingSuspendedForScroll)
  {
    [(MultiColumnMonthViewController *)self _scrollViewVerticalVelocity];
    if (v8 < 0.0) {
      double v8 = -v8;
    }
    if (v8 >= 1.0)
    {
      self->_eventLoadingSuspendedForScroll = 1;
    }
    else
    {
      [v6 timeIntervalSinceReferenceDate];
      uint64_t v10 = v9;
      [v7 timeIntervalSinceReferenceDate];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10010B99C;
      v12[3] = &unk_1001D3B78;
      v12[5] = v11;
      v12[6] = v10;
      v12[4] = self;
      [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v12];
    }
  }
}

- (void)_loadEventsForAllSubviews
{
  if (self->_currentlyVisible)
  {
    [(MultiColumnMonthViewController *)self _scrollViewVerticalVelocity];
    if (v3 < 0.0) {
      double v3 = -v3;
    }
    uint64_t v4 = 350;
    if (v3 < 0.4)
    {
      self->_eventLoadingSuspendedForScroll = 0;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10010BB9C;
      v6[3] = &unk_1001D29A0;
      v6[4] = self;
      [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v6];
      [(MultiColumnMonthViewController *)self _refreshListView];
      BOOL v5 = [(MainViewController *)self model];
      [v5 startNotificationMonitor];

      return;
    }
  }
  else
  {
    uint64_t v4 = 349;
  }
  *((unsigned char *)&self->super.super.super.super.super.super.super.isa + v4) = 1;
}

- (id)_loadEventsForStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_eventLoadingSuspendedForScroll)
  {
    [(MultiColumnMonthViewController *)self _scrollViewVerticalVelocity];
    if (v9 < 0.0) {
      double v9 = -v9;
    }
    if (v9 >= 1.0)
    {
      id v8 = 0;
      self->_eventLoadingSuspendedForScroll = 1;
      goto LABEL_43;
    }
    uint64_t v10 = [v6 calendarDateForDay];

    uint64_t v11 = [v7 calendarDateForEndOfDay];

    v96 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    char v12 = [v96 timeZone];
    [v10 absoluteTime];
    double v14 = v13;
    [v11 absoluteTime];
    double v16 = v15;
    dispatch_time_t v17 = [v10 date];
    id v18 = [v11 date];
    v102 = 0;
    v103 = 0;
    CalEventOccurrenceCacheCopyBoundsForTimeZone();
    if (v12) {
      CFRelease(v12);
    }
    id v19 = v103;
    v92 = v102;
    unint64_t v20 = (unint64_t)[v11 differenceInDays:v10];
    double v21 = (char *)(v20 + 1);
    double v22 = +[NSMutableArray arrayWithCapacity:v20 + 1];
    if ((v20 & 0x8000000000000000) == 0)
    {
      do
      {
        double v23 = +[CompactMonthWeekDayData dayDataWithEventCount:0 dayType:0];
        [v22 addObject:v23];

        --v21;
      }
      while (v21);
    }
    v89 = v11;
    if ([v17 compare:v103] == (id)1 && objc_msgSend(v18, "compare:", v102) == (id)-1)
    {
      if (([(CUIKCalendarModel *)self->super.super.super.super._model cachedOccurrencesAreLoaded] & 1) == 0)
      {
        if (!self->_loadingOccurrenceCache)
        {
          self->_loadingOccurrenceCache = 1;
          v59 = dispatch_get_global_queue(0, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10010C4E0;
          block[3] = &unk_1001D2740;
          block[4] = self;
          dispatch_async(v59, block);
        }
        id v8 = 0;
        goto LABEL_41;
      }
      id v52 = (char *)[(CUIKCalendarModel *)self->super.super.super.super._model sectionForCachedOccurrencesOnDate:v17];
      v87 = (char *)[(CUIKCalendarModel *)self->super.super.super.super._model sectionForCachedOccurrencesOnDate:v18];
      v53 = [(CUIKCalendarModel *)self->super.super.super.super._model dateForCachedOccurrencesInSection:v52];
      [v53 timeIntervalSinceReferenceDate];
      double v55 = v54;

      v56 = [(CUIKCalendarModel *)self->super.super.super.super._model dateForCachedOccurrencesInSection:v87];
      [v56 timeIntervalSinceReferenceDate];
      double v58 = v57;

      if (v55 >= v14)
      {
        if (v58 > v16) {
          --v87;
        }
      }
      else
      {
        ++v52;
      }
      if ((uint64_t)v52 <= (uint64_t)v87)
      {
        v94 = v17;
        v84 = v103;
        v86 = v18;
        do
        {
          uint64_t v60 = (uint64_t)[(CUIKCalendarModel *)self->super.super.super.super._model numberOfCachedOccurrencesInSection:v52];
          if (v60 >= 1)
          {
            uint64_t v61 = v60;
            id v62 = v18;
            v90 = [(CUIKCalendarModel *)self->super.super.super.super._model cachedSpecialDayDataForSection:v52];
            v91 = v52;
            v88 = [(CUIKCalendarModel *)self->super.super.super.super._model dateForCachedOccurrencesInSection:v52];
            id v63 = [v96 components:30];
            id v64 = [v63 month];
            if (v64 == [v10 month])
            {
              v65 = [v63 day];
              uint64_t v66 = v65 - (unsigned char *)[v10 day];
              if (v66 >= 0 && v66 < (uint64_t)[v22 count])
              {
                uint64_t v82 = v66;
                v83 = v63;
                if (v90)
                {
                  v67 = v90;
                  id v68 = [v90 dayType];
                  id v69 = v91;
                }
                else
                {
                  id v68 = 0;
                  id v69 = v91;
                  v67 = 0;
                }
                objc_super v70 = +[CompactMonthWeekDayData dayDataWithEventCount:v61 dayType:v68];
                v71 = [v67 color];
                [v70 setDayTypeBadgeColor:v71];

                v72 = [v67 locale];
                v81 = v70;
                [v70 setDayTypeBadgeLocale:v72];

                v73 = [(CUIKCalendarModel *)self->super.super.super.super._model cachedOccurrencesForSection:v69];
                v74 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v73 count]);
                long long v97 = 0u;
                long long v98 = 0u;
                long long v99 = 0u;
                long long v100 = 0u;
                id v75 = v73;
                id v76 = [v75 countByEnumeratingWithState:&v97 objects:v104 count:16];
                if (v76)
                {
                  id v77 = v76;
                  uint64_t v78 = *(void *)v98;
                  do
                  {
                    for (i = 0; i != v77; i = (char *)i + 1)
                    {
                      if (*(void *)v98 != v78) {
                        objc_enumerationMutation(v75);
                      }
                      v80 = +[EventSummaryData eventSummaryDataFromEKEvent:*(void *)(*((void *)&v97 + 1) + 8 * i)];
                      [v74 addObject:v80];
                    }
                    id v77 = [v75 countByEnumeratingWithState:&v97 objects:v104 count:16];
                  }
                  while (v77);
                }

                [v81 setEventSummaryData:v74];
                [v22 setObject:v81 atIndexedSubscript:v82];

                id v19 = v84;
                id v62 = v86;
                id v63 = v83;
              }
            }

            id v52 = v91;
            id v18 = v62;
            dispatch_time_t v17 = v94;
          }
          BOOL v39 = v52++ == v87;
        }
        while (!v39);
      }
    }
    else
    {
      v85 = v18;
      v93 = v17;
      BOOL v24 = [(CUIKCalendarModel *)self->super.super.super.super._model occurrencesForStartDate:v17 endDate:v18 preSorted:1 waitForLoad:0];
      double v25 = [v24 occurrences];

      uint64_t v26 = (uint64_t)[v25 count];
      if (v26 >= 1)
      {
        uint64_t v27 = v26;
        uint64_t v28 = 0;
        v95 = v25;
        do
        {
          CGFloat v29 = [v25 objectAtIndex:v28];
          double v30 = [v29 startDate];
          [v30 timeIntervalSinceReferenceDate];
          double v32 = v31;

          v33 = [v29 endDate];
          [v33 timeIntervalSinceReferenceDate];
          double v35 = v34;

          double v36 = [v29 endCalendarDate];
          double v37 = [v36 allComponents];

          if (![v37 hour] && !objc_msgSend(v37, "minute"))
          {
            id v38 = [v37 second];
            BOOL v39 = v32 != v35 && v38 == 0;
            if (v39) {
              double v35 = v35 + -1.0;
            }
          }
          if (v32 > v16 || v35 < v14)
          {
            double v46 = v37;
          }
          else
          {
            uint64_t v40 = v27;
            if (v32 >= v14) {
              double v41 = v32;
            }
            else {
              double v41 = v14;
            }
            if (v35 <= v16) {
              double v42 = v35;
            }
            else {
              double v42 = v16;
            }
            double v43 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v41];
            v44 = [v96 components:30 fromDate:v43];

            double v45 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v42];
            double v46 = [v96 components:30 fromDate:v45];

            double v47 = (char *)[v44 day];
            if ((uint64_t)v47 <= (uint64_t)[v46 day])
            {
              do
              {
                uint64_t v48 = v47 - (unsigned char *)[v10 day];
                if (v48 >= 0 && v48 < (uint64_t)[v22 count])
                {
                  double v49 = [v22 objectAtIndex:v48];
                  [v49 setEventCount:[v49 eventCount] + 1];
                  [v49 setDayType:0];
                  [v49 setDayTypeBadgeColor:0];
                  [v49 setDayTypeBadgeLocale:0];
                  if (v48 < (uint64_t)[v22 count]) {
                    [v22 setObject:v49 atIndexedSubscript:v48];
                  }
                }
              }
              while ((uint64_t)v47++ < (uint64_t)[v46 day]);
            }

            uint64_t v27 = v40;
            double v25 = v95;
          }

          ++v28;
        }
        while (v28 != v27);
      }

      dispatch_time_t v17 = v93;
      id v19 = v103;
      id v18 = v85;
    }
    id v8 = v22;
    uint64_t v11 = v89;
LABEL_41:

    goto LABEL_44;
  }
  id v8 = 0;
LABEL_43:
  uint64_t v11 = v7;
  uint64_t v10 = v6;
LABEL_44:

  return v8;
}

- (BOOL)_shouldAnimateDots
{
  [(MultiColumnMonthViewController *)self _scrollViewVerticalVelocity];
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
  uint64_t v10 = [(InfiniteScrollViewController *)self scrollView];
  unsigned __int8 v11 = [v10 isScrollAnimating];

  if (v11) {
    goto LABEL_7;
  }
  return 0.0;
}

- (BOOL)_allowedToDisplayEventDetailsColumn
{
  double v2 = [(MultiColumnMonthViewController *)self view];
  if (EKUICurrentHeightSizeClassIsRegular())
  {
    double v3 = +[CUIKPreferences sharedPreferences];
    unsigned __int8 v4 = [v3 showExperimentalUI];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_viewingEventDetailsColumn
{
  if (self->_viewingEventDetailsColumn) {
    return [(MultiColumnMonthViewController *)self _allowedToDisplayEventDetailsColumn];
  }
  else {
    return 0;
  }
}

- (void)_createEventDetailsColumn
{
  double v3 = [(LargeDayNavigationWrapperView *)self->_navigationWrapperView superview];

  if (!v3)
  {
    unsigned __int8 v4 = (UINavigationController *)objc_alloc_init((Class)UINavigationController);
    eventDetailsColumnNavigationController = self->_eventDetailsColumnNavigationController;
    self->_eventDetailsColumnNavigationController = v4;

    id v6 = [(UINavigationController *)self->_eventDetailsColumnNavigationController view];
    [v6 setClipsToBounds:1];

    double v7 = [LargeDayNavigationWrapperView alloc];
    double v8 = [(UINavigationController *)self->_eventDetailsColumnNavigationController view];
    double v9 = [(LargeDayNavigationWrapperView *)v7 initWithNavigationView:v8];
    navigationWrapperView = self->_navigationWrapperView;
    self->_navigationWrapperView = v9;

    [(LargeDayNavigationWrapperView *)self->_navigationWrapperView setClipsToBounds:1];
    [(MultiColumnMonthViewController *)self addChildViewController:self->_eventDetailsColumnNavigationController];
    [(UINavigationController *)self->_eventDetailsColumnNavigationController didMoveToParentViewController:self];
    unsigned __int8 v11 = [(MultiColumnMonthViewController *)self view];
    [v11 addSubview:self->_navigationWrapperView];

    char v12 = [(MultiColumnMonthViewController *)self view];
    [v12 sendSubviewToBack:self->_navigationWrapperView];

    [(MultiColumnMonthViewController *)self _updateEventDetailsColumnViewFrame];
  }
}

- (void)_updateEventDetailsColumnViewFrame
{
  double v3 = [(MultiColumnMonthViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;

  v19.origin.x = v5;
  v19.origin.double y = v7;
  v19.size.double width = v9;
  v19.size.double height = v11;
  if (!CGRectIsEmpty(v19))
  {
    if ([(MultiColumnMonthViewController *)self _shouldDisplayThreeColumns]
      || (+[CUIKPreferences sharedPreferences],
          char v12 = objc_claimAutoreleasedReturnValue(),
          unsigned int v13 = [v12 largeListViewDisclosingEventDetails],
          v12,
          v13))
    {
      [(UIView *)self->_dividerLineBetweenListAndEventDetails frame];
      double MaxX = CGRectGetMaxX(v20);
      v21.origin.x = v5;
      v21.origin.double y = v7;
      v21.size.double width = v9;
      v21.size.double height = v11;
      double v15 = CGRectGetMaxX(v21);
      [(UIView *)self->_dividerLineBetweenListAndEventDetails frame];
      double MidX = v15 - CGRectGetMaxX(v22);
    }
    else
    {
      v23.origin.x = v5;
      v23.origin.double y = v7;
      v23.size.double width = v9;
      v23.size.double height = v11;
      double MaxX = CGRectGetMaxX(v23);
      v24.origin.x = v5;
      v24.origin.double y = v7;
      v24.size.double width = v9;
      v24.size.double height = v11;
      double MidX = CGRectGetMidX(v24);
    }
    navigationWrapperView = self->_navigationWrapperView;
    -[LargeDayNavigationWrapperView setFrame:](navigationWrapperView, "setFrame:", MaxX, v7, MidX, v11);
  }
}

- (void)_slideToShowEventDetails:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([(MultiColumnMonthViewController *)self _allowedToDisplayEventDetailsColumn])
  {
    [(MultiColumnMonthViewController *)self _createEventDetailsColumn];
    p_currentDetailsView = &self->_currentDetailsView;
    objc_storeStrong((id *)&self->_currentDetailsView, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGFloat v9 = *p_currentDetailsView;
      [(UIViewController *)v9 setAllowsCalendarPreview:1];
      [(UIViewController *)v9 setCalendarPreviewIsInlineDayView:1];
      [(UIViewController *)v9 setShowsDoneButton:0];
      [(UIViewController *)v9 setEditorShowTransition:6];
      dispatch_time_t v10 = dispatch_time(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10010CD7C;
      block[3] = &unk_1001D5800;
      block[4] = self;
      double v35 = v9;
      BOOL v36 = v4;
      double v11 = v9;
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    char v12 = [(UINavigationController *)self->_eventDetailsColumnNavigationController presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [(UINavigationController *)self->_eventDetailsColumnNavigationController dismissViewControllerWithTransition:0 completion:0];
    }
    id v14 = [(UINavigationController *)self->_eventDetailsColumnNavigationController popToRootViewControllerAnimated:0];
    [(UINavigationController *)self->_eventDetailsColumnNavigationController pushViewController:*p_currentDetailsView animated:0];
    double v15 = [(UIViewController *)*p_currentDetailsView navigationItem];
    [v15 setHidesBackButton:1];

    [(UINavigationController *)self->_eventDetailsColumnNavigationController setNavigationBarHidden:0];
    [(MultiColumnMonthViewController *)self viewWillLayoutSubviews];
    double v16 = [(UIViewController *)*p_currentDetailsView view];
    [v16 layoutMargins];
    double v18 = v17;
    double v20 = v19;

    [(MultiColumnMonthViewController *)self detailsRightInsetAdjustment];
    double v22 = v21;
    [(MultiColumnMonthViewController *)self rightSplitViewSideInset];
    double v24 = v22 + v23;
    [(MultiColumnMonthViewController *)self detailsLeftInsetAdjustment];
    double v26 = v25;
    [(MultiColumnMonthViewController *)self rightSplitViewSideInset];
    double v28 = v26 + v27;
    CGFloat v29 = [(UIViewController *)*p_currentDetailsView view];
    [v29 setLayoutMargins:v18, v28, v20, v24];

    if (![(MultiColumnMonthViewController *)self _viewingEventDetailsColumn])
    {
      double v30 = +[CUIKPreferences sharedPreferences];
      [v30 setLargeListViewDisclosingEventDetails:1];

      self->_viewingEventDetailsColumn = 1;
      if (![(MultiColumnMonthViewController *)self _shouldDisplayThreeColumns]) {
        [(MultiColumnMonthViewController *)self _slideToAnimatePalleteShowingBackButton:1 animated:v4];
      }
      double v31 = 0.0;
      if (v4) {
        double v31 = 0.5;
      }
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10010CDE4;
      v33[3] = &unk_1001D2740;
      v33[4] = self;
      +[UIView animateWithDuration:0 delay:v33 usingSpringWithDamping:&stru_1001D5820 initialSpringVelocity:v31 options:0.0 animations:2.0 completion:0.0];
    }
  }
  else
  {
    double v32 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "MultiColumnMonthViewController tried to slide panels without preference enabled.", buf, 2u);
    }
  }
}

- (void)_slideToAnimatePalleteShowingBackButton:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIButton *)self->_cancelEventDetailViewModeButton setHidden:0];
  [(UIButton *)self->_cancelEventDetailViewModeButton setAlpha:0.0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10010CFAC;
  v11[3] = &unk_1001D2718;
  BOOL v12 = a3;
  v11[4] = self;
  id v7 = objc_retainBlock(v11);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10010D00C;
  v9[3] = &unk_1001D39E8;
  BOOL v10 = a3;
  v9[4] = self;
  double v8 = objc_retainBlock(v9);
  if (v4)
  {
    +[UIView animateWithDuration:0 delay:v7 usingSpringWithDamping:v8 initialSpringVelocity:0.5 options:0.0 animations:2.0 completion:0.0];
  }
  else
  {
    ((void (*)(void *))v7[2])(v7);
    ((void (*)(void *, uint64_t))v8[2])(v8, 1);
  }
}

- (void)_slideToHideEventDetailsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MultiColumnMonthViewController *)self _allowedToDisplayEventDetailsColumn])
  {
    CGFloat v5 = [self->_multiDayListViewController tableView];
    double v6 = [self->_multiDayListViewController tableView];
    id v7 = [v6 indexPathForSelectedRow];
    [v5 deselectRowAtIndexPath:v7 animated:v3];

    double v8 = +[CUIKPreferences sharedPreferences];
    [v8 setLargeListViewDisclosingEventDetails:0];

    self->_viewingEventDetailsColumn = 0;
    [(MultiColumnMonthViewController *)self _slideToAnimatePalleteShowingBackButton:0 animated:v3];
    double v9 = 0.0;
    if (v3) {
      double v9 = 0.5;
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10010D204;
    v12[3] = &unk_1001D2740;
    v12[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10010D20C;
    v11[3] = &unk_1001D27D8;
    v11[4] = self;
    +[UIView animateWithDuration:0 delay:v12 usingSpringWithDamping:v11 initialSpringVelocity:v9 options:0.0 animations:2.0 completion:0.0];
  }
  else
  {
    BOOL v10 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MultiColumnMonthViewController tried to slide panels without preference enabled.", buf, 2u);
    }
  }
}

- (void)_setPaletteDisplaced
{
  [(PaletteView *)self->_palette setWeekdayHeaderMovedBeyondLeftEdge:1];
  palette = self->_palette;

  [(PaletteView *)palette setNeedsLayout];
}

- (void)_resetPaletteState
{
  [(PaletteView *)self->_palette setWeekdayHeaderMovedBeyondLeftEdge:0];
  palette = self->_palette;

  [(PaletteView *)palette setNeedsLayout];
}

- (double)rightSplitViewSideInset
{
  double v2 = [(MainViewController *)self EKUI_viewHierarchy];
  [v2 ekui_interfaceOrientation];

  return 23.0;
}

- (double)detailsLeftInsetAdjustment
{
  return 0.0;
}

- (double)detailsRightInsetAdjustment
{
  return 0.0;
}

- (double)monthWeekScale
{
  return 1.0;
}

- (void)_startUpdateTimer
{
  if (!self->_refreshTimer)
  {
    CUIKCalendar();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v3 = CUIKCalendar();
    BOOL v4 = +[NSDate date];
    CGFloat v5 = [v3 components:126 fromDate:v4];

    double v6 = [v12 dateFromComponents:v5];
    id v7 = objc_alloc_init((Class)NSDateComponents);
    [v7 setMinute:1];
    double v8 = [v12 dateByAddingComponents:v7 toDate:v6 options:0];
    double v9 = (NSTimer *)[objc_alloc((Class)NSTimer) initWithFireDate:v8 interval:self target:"_updateTimerFired" selector:0 userInfo:1 repeats:60.0];
    refreshTimer = self->_refreshTimer;
    self->_refreshTimer = v9;

    double v11 = +[NSRunLoop currentRunLoop];
    [v11 addTimer:self->_refreshTimer forMode:NSDefaultRunLoopMode];
  }
}

- (void)_invalidateUpdateTimer
{
  [(NSTimer *)self->_refreshTimer invalidate];
  refreshTimer = self->_refreshTimer;
  self->_refreshTimer = 0;
}

- (void)_refreshListView
{
}

- (id)pushedWeekViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [(MultiColumnMonthViewController *)self nextLevelWeekViewControllerWithDate:a3];
  id v7 = [(MultiColumnMonthViewController *)self navigationController];
  [v7 pushViewController:v6 animated:v4];

  return v6;
}

- (id)nextLevelWeekViewControllerWithDate:(id)a3
{
  [(CUIKCalendarModel *)self->super.super.super.super._model setSelectedDate:a3];
  BOOL v4 = [WeekViewContainerViewController alloc];
  model = self->super.super.super.super._model;
  double v6 = [(MainViewController *)self window];
  id v7 = [(MainViewControllerContainer *)v4 initWithModel:model window:v6];

  return v7;
}

- (CGRect)frameForWeekContainingDate:(id)a3
{
  model = self->super.super.super.super._model;
  id v5 = a3;
  double v6 = [(CUIKCalendarModel *)model calendar];
  id v7 = [v6 timeZone];
  double v8 = +[EKCalendarDate calendarDateWithDate:v5 timeZone:v7];

  double v9 = [(InfiniteScrollViewController *)self subviewForDate:v8];
  BOOL v10 = v9;
  if (v9)
  {
    [v9 rectForCells];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = [(MultiColumnMonthViewController *)self view];
    [v19 convertRect:v10 fromView:v12, v14, v16, v18];
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
  BOOL v3 = CUIKTodayDate();
  BOOL v4 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
  id v5 = [v4 timeZone];
  double v6 = +[EKCalendarDate calendarDateWithDate:v3 timeZone:v5];

  id v7 = [(InfiniteScrollViewController *)self subviewForDate:v6];
  double v8 = v7;
  if (v7)
  {
    [v7 frameForTodayHighlight];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = [(MultiColumnMonthViewController *)self view];
    [v17 convertRect:v8 fromView:v10];
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

- (double)heightForSubviewWithCalendarDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MultiColumnMonthViewController *)self _monthWeekViewsUseVerticalCompression];
  double v6 = [(MultiColumnMonthViewController *)self view];
  EKUICurrentWindowSize();
  +[CompactMonthWeekView heightForViewWithCalendarDate:compressed:windowSize:scale:](CompactMonthWeekView, "heightForViewWithCalendarDate:compressed:windowSize:scale:", v4, v5);
  double v8 = v7;

  return v8;
}

- (double)topInsetForSubviewWithCalendarDate:(id)a3
{
  return 0.0;
}

- (double)showDateVerticalOffsetForDate:(id)a3
{
  +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance];
  return result;
}

- (double)decelerationDistanceThresholdForPreferringMonthBoundary
{
  +[CompactMonthWeekView heightForViewThatContainsFirstDayOfMonth:0 compressed:[(MultiColumnMonthViewController *)self _monthWeekViewsUseVerticalCompression] scale:1.0];
  return v2 * 3.5;
}

- (double)decelerationDistanceThresholdForDisplayingMonthBanner
{
  +[CompactMonthWeekView heightForViewThatContainsFirstDayOfMonth:0 compressed:[(MultiColumnMonthViewController *)self _monthWeekViewsUseVerticalCompression] scale:1.0];
  return v2 * 5.5;
}

- (double)decelerationDistanceThresholdToStopShowingMonthBanner
{
  +[CompactMonthWeekView heightForViewThatContainsFirstDayOfMonth:0 compressed:[(MultiColumnMonthViewController *)self _monthWeekViewsUseVerticalCompression] scale:1.0];
  return v2 * 1.1;
}

- (double)showDateVerticalOffset
{
  BOOL v3 = [(MultiColumnMonthViewController *)self _monthWeekViewsUseVerticalCompression];

  [(MultiColumnMonthViewController *)self _showDateVerticalOffsetWithVerticalCompression:v3];
  return result;
}

- (double)_showDateVerticalOffsetWithVerticalCompression:(BOOL)a3
{
  double v4 = -12.0;
  if (a3)
  {
    +[CompactMonthWeekView headerHeight];
    double v4 = v5;
  }
  EKUIScaleFactor();
  double v7 = v4 + 2.0 / v6;
  double v8 = [(MultiColumnMonthViewController *)self traitCollection];
  int v9 = EKUIUsesLargeTextLayout();

  if (v9)
  {
    EKUIScaleFactor();
    return v7 + 1.0 / v10;
  }
  return v7;
}

- (int64_t)eventCountDisplayedForDate:(id)a3
{
  id v4 = a3;
  double v5 = [(InfiniteScrollViewController *)self subviewForDate:v4];
  double v6 = [v4 day];

  double v7 = [v5 calendarDate];
  double v8 = [v7 day];

  if (!v5) {
    goto LABEL_7;
  }
  int v9 = [v5 eventData];
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
  int v9 = [v14 objectAtIndex:v11];

  id v10 = [v9 eventCount];
LABEL_6:

LABEL_8:
  return (int64_t)v10;
}

- (void)_updateInfiniteScrollViewFrame
{
  BOOL v3 = [(MultiColumnMonthViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;

  v25.origin.CGFloat x = v5;
  v25.origin.CGFloat y = v7;
  v25.size.CGFloat width = v9;
  v25.size.CGFloat height = v11;
  if (!CGRectIsEmpty(v25))
  {
    if ([(MultiColumnMonthViewController *)self _shouldDisplayThreeColumns])
    {
      v26.origin.CGFloat x = v5;
      v26.origin.CGFloat y = v7;
      v26.size.CGFloat width = v9;
      v26.size.CGFloat height = v11;
      double MinX = CGRectGetMinX(v26);
      [(MultiColumnMonthViewController *)self _listviewColumnCollapsedWidth];
      double MidX = v13;
    }
    else
    {
      v27.origin.CGFloat x = v5;
      v27.origin.CGFloat y = v7;
      v27.size.CGFloat width = v9;
      v27.size.CGFloat height = v11;
      double MidX = CGRectGetMidX(v27);
      double v15 = +[CUIKPreferences sharedPreferences];
      unsigned int v16 = [v15 largeListViewDisclosingEventDetails];

      if (v16)
      {
        v28.origin.CGFloat x = v5;
        v28.origin.CGFloat y = v7;
        v28.size.CGFloat width = v9;
        v28.size.CGFloat height = v11;
        double MinX = -CGRectGetMidX(v28);
      }
      else
      {
        int IsLeftToRight = CalInterfaceIsLeftToRight();
        CGFloat v18 = v5;
        double v19 = v7;
        CGFloat v20 = v9;
        double v21 = v11;
        if (IsLeftToRight) {
          double v22 = CGRectGetMinX(*(CGRect *)&v18);
        }
        else {
          double v22 = CGRectGetMidX(*(CGRect *)&v18);
        }
        double MinX = v22;
      }
    }
    id v23 = [(InfiniteScrollViewController *)self scrollView];
    [v23 setFrame:MinX, v7, MidX, v11];
  }
}

- (void)_setupListViewController
{
  if (!self->_listViewContainer)
  {
    BOOL v3 = (UIView *)objc_alloc_init((Class)UIView);
    listViewContainer = self->_listViewContainer;
    self->_listViewContainer = v3;

    [(UIView *)self->_listViewContainer setAutoresizingMask:18];
    CGFloat v5 = +[UIColor whiteColor];
    [(UIView *)self->_listViewContainer setBackgroundColor:v5];

    double v6 = [(MultiColumnMonthViewController *)self view];
    [v6 addSubview:self->_listViewContainer];

    double v7 = [[CompactMonthListViewController alloc] initWithModel:self->super.super.super.super._model];
    singleDayListViewController = self->_singleDayListViewController;
    self->_singleDayListViewController = v7;

    [(CompactMonthListViewController *)self->_singleDayListViewController setCompactMonthListViewDelegate:self];
    CGFloat v9 = [(CompactMonthListViewController *)self->_singleDayListViewController view];
    [v9 setAutoresizingMask:18];

    [(UIView *)self->_listViewContainer bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    CGFloat v18 = [(CompactMonthListViewController *)self->_singleDayListViewController view];
    [v18 setFrame:v11, v13, v15, v17];

    double v19 = [ListViewController alloc];
    model = self->super.super.super.super._model;
    double v21 = [(MainViewController *)self window];
    double v22 = [(ListViewController *)v19 initWithModel:model window:v21];
    multiDayListViewController = self->_multiDayListViewController;
    self->_multiDayListViewController = v22;

    [self->_multiDayListViewController setAllowExtendedHeightCells:1];
    double v24 = [self->_multiDayListViewController view];
    [v24 setAutoresizingMask:18];

    [(UIView *)self->_listViewContainer bounds];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    v33 = [self->_multiDayListViewController view];
    [v33 setFrame:v26, v28, v30, v32];

    [self->_multiDayListViewController setDelegate:self];
    [(MultiColumnMonthViewController *)self _updateListViewModeForCurrentTraits];
  }
}

- (void)_updateListViewModeForCurrentTraits
{
  if ([(MultiColumnMonthViewController *)self _listViewShowsSingleDay])
  {
    [self->_multiDayListViewController removeFromParentViewController];
    BOOL v3 = [self->_multiDayListViewController view];
    [v3 removeFromSuperview];

    uint64_t v4 = 304;
  }
  else
  {
    [(CompactMonthListViewController *)self->_singleDayListViewController removeFromParentViewController];
    CGFloat v5 = [(CompactMonthListViewController *)self->_singleDayListViewController view];
    [v5 removeFromSuperview];

    uint64_t v4 = 312;
  }
  double v6 = (id *)((char *)&self->super.super.super.super.super.super.super.isa + v4);
  [(MultiColumnMonthViewController *)self addChildViewController:*(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v4)];
  listViewContainer = self->_listViewContainer;
  double v8 = [*v6 view];
  [(UIView *)listViewContainer addSubview:v8];

  id v9 = *v6;

  [v9 didMoveToParentViewController:self];
}

- (BOOL)_listViewShowsSingleDay
{
  BOOL v3 = [(MultiColumnMonthViewController *)self ekui_futureTraitCollection];
  if ([v3 verticalSizeClass] == (id)1) {
    LOBYTE(v4) = 1;
  }
  else {
    unsigned int v4 = ![(MultiColumnMonthViewController *)self _allowedToDisplayEventDetailsColumn];
  }

  return v4;
}

- (CGRect)frameOfListView
{
  [(UIView *)self->_listViewContainer frame];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)_updateListViewFrame
{
  double v3 = [(MultiColumnMonthViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;

  v26.origin.CGFloat x = v5;
  v26.origin.CGFloat y = v7;
  v26.size.CGFloat width = v9;
  v26.size.CGFloat height = v11;
  if (CGRectIsEmpty(v26)) {
    return;
  }
  if (![(MultiColumnMonthViewController *)self _shouldDisplayThreeColumns])
  {
    double v15 = +[CUIKPreferences sharedPreferences];
    unsigned int v16 = [v15 largeListViewDisclosingEventDetails];

    if (v16)
    {
      [(MultiColumnMonthViewController *)self _listviewColumnCollapsedWidth];
      double MidX = v17;
    }
    else
    {
      v27.origin.CGFloat x = v5;
      v27.origin.CGFloat y = v7;
      v27.size.CGFloat width = v9;
      v27.size.CGFloat height = v11;
      double MidX = CGRectGetMidX(v27);
      if (CalInterfaceIsLeftToRight())
      {
        v28.origin.CGFloat x = v5;
        v28.origin.CGFloat y = v7;
        v28.size.CGFloat width = v9;
        v28.size.CGFloat height = v11;
        double MinX = CGRectGetMidX(v28);
        goto LABEL_9;
      }
    }
    v29.origin.CGFloat x = v5;
    v29.origin.CGFloat y = v7;
    v29.size.CGFloat width = v9;
    v29.size.CGFloat height = v11;
    double MinX = CGRectGetMinX(v29);
    goto LABEL_9;
  }
  [(MultiColumnMonthViewController *)self _listviewColumnCollapsedWidth];
  double MidX = v12;
  [(MultiColumnMonthViewController *)self _listviewColumnCollapsedWidth];
LABEL_9:
  CGFloat v18 = MinX;
  -[UIView setFrame:](self->_listViewContainer, "setFrame:", MinX, v7, MidX, v11);
  EKUIScaleFactor();
  double v20 = 1.0 / v19;
  char IsLeftToRight = CalInterfaceIsLeftToRight();
  double MaxX = v18;
  if ((IsLeftToRight & 1) == 0)
  {
    v30.origin.CGFloat x = v18;
    v30.origin.CGFloat y = v7;
    v30.size.CGFloat width = MidX;
    v30.size.CGFloat height = v11;
    double MaxX = CGRectGetMaxX(v30);
  }
  -[UIView setFrame:](self->_dividerLineBetweenListAndMonth, "setFrame:", MaxX, v7, v20, v11);
  v31.origin.CGFloat x = v18;
  v31.origin.CGFloat y = v7;
  v31.size.CGFloat width = MidX;
  v31.size.CGFloat height = v11;
  double v23 = CGRectGetMaxX(v31);
  dividerLineBetweenListAndEventDetails = self->_dividerLineBetweenListAndEventDetails;

  -[UIView setFrame:](dividerLineBetweenListAndEventDetails, "setFrame:", v23, v7, v20, v11);
}

- (void)_cancelEventDetailViewModeButtonPressed:(id)a3
{
}

- (BOOL)_threeColumnsDisplayIsAllowed
{
  return 0;
}

- (BOOL)_shouldDisplayThreeColumns
{
  return 0;
}

- (void)_autoSelectEvent
{
  dispatch_time_t v3 = dispatch_time(0, 1000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010E3A4;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)navigateToEventDetails:(id)a3 fromController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = CUIKTodayDate();
  CGFloat v9 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
  double v10 = [v9 timeZone];
  double v11 = +[EKCalendarDate calendarDateWithDate:v8 timeZone:v10];

  double v12 = [(InfiniteScrollViewController *)self subviewForDate:v11];
  [v12 setDisableTodayPulse:1];
  [(CompactMonthListViewController *)self->_singleDayListViewController deselectAllRowsAnimated:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10010E604;
  v16[3] = &unk_1001D2E90;
  v16[4] = self;
  id v17 = v7;
  id v18 = v6;
  id v19 = v12;
  id v13 = v12;
  id v14 = v6;
  id v15 = v7;
  [(MultiColumnMonthViewController *)self dismissViewControllerAnimated:1 completion:v16];
}

- (void)eventViewControllerNextButtonWasTapped:(id)a3
{
  id v6 = a3;
  double v4 = [v6 event];
  CGFloat v5 = [v4 nextOccurrence];

  if (v5) {
    [(MultiColumnMonthViewController *)self navigateToEventDetails:v5 fromController:v6];
  }
}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  id v6 = a3;
  double v4 = [v6 event];
  CGFloat v5 = [v4 previousOccurrence];

  if (v5) {
    [(MultiColumnMonthViewController *)self navigateToEventDetails:v5 fromController:v6];
  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
}

- (void)_showDetailsForEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  double v11 = [(MainViewController *)self augmentEventDetailsContext:a6];
  double v12 = +[EKEventViewController eventDetailViewControllerWithEvent:v10 delegate:self context:v11];
  id v13 = [(MainViewController *)self model];
  [v13 setSelectedOccurrence:v10];

  id v14 = [(MultiColumnMonthViewController *)self view];
  LODWORD(v13) = EKUICurrentHeightSizeClassIsRegular();

  if (v13)
  {
    [(MultiColumnMonthViewController *)self _slideToShowEventDetails:v12 animated:v8];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10010EA04;
    v15[3] = &unk_1001D5870;
    id v17 = self;
    unint64_t v18 = a5;
    id v16 = v12;
    [(MainViewController *)self showViewController:v16 sender:self animated:v8 completion:v15];
  }
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v5 = a3;
  [(CompactMonthListViewController *)self->_singleDayListViewController deselectAllRowsAnimated:1];
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  CGFloat v9 = sub_10010EC0C;
  id v10 = &unk_1001D28A8;
  double v11 = self;
  id v12 = v5;
  id v6 = v5;
  [(MultiColumnMonthViewController *)self dismissViewControllerAnimated:1 completion:&v7];
  if ([(MultiColumnMonthViewController *)self _viewingEventDetailsColumn])
  {
    [(MultiColumnMonthViewController *)self _autoSelectEvent];
  }
}

- (void)eventViewControllerWillDisappear:(id)a3
{
}

- (void)eventViewController:(id)a3 requestsDismissalOfEditViewController:(id)a4
{
  id v5 = a4;
  [v5 setModalTransitionStyle:2];
  if (*(_WORD *)&self->_editorDismissedFromDelete)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10010ED5C;
    v6[3] = &unk_1001D2740;
    v6[4] = self;
    [(MultiColumnMonthViewController *)self dismissViewControllerAnimated:1 completion:v6];
    self->_editorDismissedFromDelete = 0;
    self->_editorPresentedProgramaticallCGFloat y = 0;
  }
  else
  {
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)eventViewControllerWillFinishEditingEvent:(id)a3 deleted:(BOOL)a4
{
  self->_editorDismissedFromDelete = a4;
}

- (void)compactMonthListViewController:(id)a3 wantsToCommitViewControllerFromPreview:(id)a4
{
  [a4 event:a3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(MultiColumnMonthViewController *)self _showDetailsForEvent:v5 animated:1 showMode:1 context:0];
}

- (void)compactMonthListViewController:(id)a3 didSelectEvent:(id)a4 showMode:(unint64_t)a5
{
}

- (BOOL)wantsScrollingMessagesOnEveryFrameFromListViewController:(id)a3
{
  return !self->_listViewContainerDidScrollMessagesSuppressed;
}

- (void)listViewController:(id)a3 didScrollToDate:(id)a4
{
  id v5 = a4;
  if (!self->_listViewContainerDidScrollMessagesSuppressed
    && (![(MultiColumnMonthViewController *)self _viewingEventDetailsColumn]
     || [(MultiColumnMonthViewController *)self _shouldDisplayThreeColumns]))
  {
    id v6 = CUIKTodayDate();
    id v7 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    uint64_t v8 = [v7 timeZone];
    CGFloat v9 = +[EKCalendarDate calendarDateWithDate:v6 timeZone:v8];

    id v10 = [(CUIKCalendarModel *)self->super.super.super.super._model calendar];
    double v11 = [v10 timeZone];
    id v12 = +[EKCalendarDate calendarDateWithDate:v5 timeZone:v11];

    id v13 = [(InfiniteScrollViewController *)self subviewForDate:v9];
    [v13 setDisableTodayPulse:1];
    if ((byte_100216A50 & 1) == 0)
    {
      byte_100216A50 = 1;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10010EFC8;
      v14[3] = &unk_1001D2768;
      id v15 = v13;
      id v16 = self;
      id v17 = v12;
      [(MultiColumnMonthViewController *)self showDate:v5 animated:1 completionBlock:v14];
    }
  }
}

- (BOOL)listViewControllerContainerHandlesShowEvent
{
  return 1;
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (UITapGestureRecognizer)dayCellsTapGestureRecognizer
{
  return self->_dayCellsTapGestureRecognizer;
}

- (void)setDayCellsTapGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)dayCellsScrubbingGestureRecognizer
{
  return self->_dayCellsScrubbingGestureRecognizer;
}

- (void)setDayCellsScrubbingGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayCellsScrubbingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dayCellsTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_currentDetailsView, 0);
  objc_storeStrong((id *)&self->_navigationWrapperView, 0);
  objc_storeStrong((id *)&self->_blankViewController, 0);
  objc_storeStrong((id *)&self->_eventDetailsColumnNavigationController, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_cancelEventDetailViewModeButton, 0);
  objc_storeStrong((id *)&self->_navigationBarDisplayedDate, 0);
  objc_storeStrong((id *)&self->_dividerLineBetweenListAndEventDetails, 0);
  objc_storeStrong((id *)&self->_dividerLineBetweenListAndMonth, 0);
  objc_storeStrong((id *)&self->_weekCalculationCalendar, 0);
  objc_storeStrong((id *)&self->_multiDayListViewController, 0);
  objc_storeStrong((id *)&self->_singleDayListViewController, 0);
  objc_storeStrong((id *)&self->_listViewContainer, 0);
  objc_storeStrong((id *)&self->_selectedMonthWeekView, 0);
  objc_storeStrong((id *)&self->_pressedMonthView, 0);
  objc_storeStrong((id *)&self->_pressHighlight, 0);

  objc_storeStrong((id *)&self->_pressedDay, 0);
}

@end