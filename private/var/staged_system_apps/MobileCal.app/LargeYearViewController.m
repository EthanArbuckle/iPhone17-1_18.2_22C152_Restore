@interface LargeYearViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (unint64_t)_monthsPerRowForWindowSize:(CGSize)a3;
+ (unint64_t)defaultMonthsPerRowForWindowSize:(CGSize)a3;
- (BOOL)_usePortraitLayoutForSize:(CGSize)a3;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)shouldAnimateScrollToDate:(id)a3 fromClosestDate:(id)a4;
- (BOOL)shouldAnimateTransitionsToMonthView;
- (Class)multipleMonthViewClass;
- (double)leftBarButtonBlankFixedSpaceWidth;
- (double)showDateVerticalOffsetForDate:(id)a3;
- (id)_currentlyViewingCalendarDate;
- (id)sceneTitle;
- (int64_t)_currentOrientation;
- (int64_t)_orientationForSize:(CGSize)a3;
- (int64_t)intendedSizeClass;
- (unint64_t)monthsPerRow;
- (unint64_t)supportedInterfaceOrientations;
- (void)_queueForcedUpdateToYearNumbers;
- (void)_showNextDateComponentUnitInForwardDirection:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateYearNumbersAnimated:(BOOL)a3 withForce:(BOOL)a4;
- (void)didEndScrolling;
- (void)didScroll;
- (void)localeDidChange;
- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3;
- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3;
- (void)receivedTapAtLocation:(CGPoint)a3 usingDate:(id)a4 precise:(BOOL)a5;
- (void)reinitializeAllViewsWithCalendarDate:(id)a3;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)timeZoneDidChange;
- (void)updateNavigationBarDisplayedDateString;
- (void)updatePalette:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation LargeYearViewController

- (BOOL)_usePortraitLayoutForSize:(CGSize)a3
{
  return a3.width <= a3.height;
}

- (int64_t)_orientationForSize:(CGSize)a3
{
  if (-[LargeYearViewController _usePortraitLayoutForSize:](self, "_usePortraitLayoutForSize:", a3.width, a3.height)) {
    return 1;
  }
  else {
    return 4;
  }
}

- (int64_t)_currentOrientation
{
  v3 = [(LargeYearViewController *)self view];
  [v3 frame];
  int64_t v6 = -[LargeYearViewController _orientationForSize:](self, "_orientationForSize:", v4, v5);

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_viewHasAppearedBefore
    || (orientationForCurrentViewLayout = (void *)self->_orientationForCurrentViewLayout,
        orientationForCurrentViewLayout != (void *)[(LargeYearViewController *)self _currentOrientation])|| !self->_viewHasAppearedBefore)
  {
    int64_t v6 = [(MainViewController *)self model];
    v7 = [v6 selectedDate];

    [(LargeYearViewController *)self reinitializeAllViewsWithCalendarDate:v7];
    self->_viewHasAppearedBefore = 1;
    self->_orientationForCurrentViewLayout = [(LargeYearViewController *)self _currentOrientation];
  }
  v8 = [(LargeYearViewController *)self view];
  [v8 setNeedsLayout];

  v9.receiver = self;
  v9.super_class = (Class)LargeYearViewController;
  [(YearViewController *)&v9 viewWillAppear:v3];
}

- (void)reinitializeAllViewsWithCalendarDate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LargeYearViewController;
  [(InfiniteScrollViewController *)&v4 reinitializeAllViewsWithCalendarDate:a3];
  self->_orientationForCurrentViewLayout = [(LargeYearViewController *)self _currentOrientation];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    int64_t v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    objc_super v9 = [(MainViewController *)self model];
    v10 = [v9 selectedDate];
    v11 = [v10 date];
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);
  }
  self->_viewIsVisible = 1;
  currentYearNumber = self->_currentYearNumber;
  self->_currentYearNumber = 0;

  [(LargeYearViewController *)self _updateYearNumbersAnimated:1 withForce:1];
  v13.receiver = self;
  v13.super_class = (Class)LargeYearViewController;
  [(YearViewController *)&v13 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LargeYearViewController;
  [(YearViewController *)&v5 viewWillDisappear:a3];
  self->_viewIsVisible = 0;
  currentYearNumber = self->_currentYearNumber;
  self->_currentYearNumber = 0;
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
  v17.receiver = self;
  v17.super_class = (Class)LargeYearViewController;
  -[InfiniteScrollViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = [(LargeYearViewController *)self view];
  objc_super v9 = [v8 window];
  v10 = [v9 windowScene];
  id v11 = [v10 activationState];

  if (v11 != (id)2)
  {
    self->_orientationForCurrentViewLayout = -[LargeYearViewController _orientationForSize:](self, "_orientationForSize:", width, height);
    v12 = [(InfiniteScrollViewController *)self dateOfCenterViewInBuffer];
    activeDateDuringRotation = self->_activeDateDuringRotation;
    self->_activeDateDuringRotation = v12;

    self->_isRotating = 1;
    self->_targetSizeAfterTransition.double width = width;
    self->_targetSizeAfterTransition.double height = height;
    v14 = [(LargeYearViewController *)self view];
    [v14 setNeedsLayout];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100104184;
    v16[3] = &unk_1001D2E40;
    v16[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100104280;
    v15[3] = &unk_1001D5720;
    v15[4] = self;
    [v7 animateAlongsideTransition:v16 completion:v15];
  }
}

- (void)viewWillLayoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)LargeYearViewController;
  [(InfiniteScrollViewController *)&v31 viewWillLayoutSubviews];
  unsigned int v3 = [(LargeYearViewController *)self isViewLoaded];
  activeDateDuringRotation = self->_activeDateDuringRotation;
  if (v3)
  {
    objc_super v5 = activeDateDuringRotation;
    if (self->_isRotating || activeDateDuringRotation != 0)
    {
      if (!activeDateDuringRotation)
      {
        id v7 = 0;
        goto LABEL_21;
      }
      id v7 = v5;
      int v8 = 1;
      goto LABEL_16;
    }
    objc_super v9 = 0;
  }
  else
  {
    objc_super v9 = activeDateDuringRotation;
    id v7 = v9;
    if (self->_isRotating) {
      goto LABEL_21;
    }
  }
  v10 = [(LargeYearViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double width = self->_previousViewSize.width;
  double height = self->_previousViewSize.height;

  objc_super v17 = [(MainViewController *)self model];
  v18 = [v17 selectedDate];
  id v7 = [v18 calendarDateForEndOfMonth];

  v19 = [(LargeYearViewController *)self view];
  [v19 bounds];
  self->_previousViewSize.double width = v20;
  self->_previousViewSize.double height = v21;

  if (width != v12 || height != v14)
  {
    int v8 = 0;
LABEL_16:
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = sub_1001044D8;
    v28 = &unk_1001D28A8;
    v29 = self;
    id v7 = v7;
    id v30 = v7;
    v23 = objc_retainBlock(&v25);
    v24 = v23;
    if (v8) {
      ((void (*)(void ***))v23[2])(v23);
    }
    else {
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23, v25, v26, v27, v28, v29);
    }
  }
LABEL_21:
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)shouldAnimateScrollToDate:(id)a3 fromClosestDate:(id)a4
{
  if (self->_activeDateDuringRotation) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)LargeYearViewController;
  return [(YearViewController *)&v5 shouldAnimateScrollToDate:a3 fromClosestDate:a4];
}

- (double)showDateVerticalOffsetForDate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(LargeYearViewController *)self view];
  uint64_t v6 = EKUICurrentWindowSizeParadigmForViewHierarchy();

  double v7 = 32.0;
  if (v6 >= 0x800000)
  {
    if (v6 > 0x7FFFFFF)
    {
      if (v6 == 0x8000000) {
        goto LABEL_15;
      }
      uint64_t v8 = 0x20000000;
    }
    else
    {
      if (v6 == 0x800000) {
        goto LABEL_15;
      }
      uint64_t v8 = 0x2000000;
    }
    if (v6 != v8) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v6 <= 4095)
  {
    if (v6 == 512)
    {
      double v7 = 10.0;
      goto LABEL_16;
    }
    if (v6 != 1024) {
      goto LABEL_16;
    }
LABEL_15:
    double v7 = 0.0;
    goto LABEL_16;
  }
  if (v6 == 4096)
  {
    double v7 = 18.0;
    goto LABEL_16;
  }
  if (v6 == 0x80000) {
    goto LABEL_15;
  }
LABEL_16:
  objc_super v9 = [(LargeYearViewController *)self traitCollection];
  if (EKUIUsesLargeTextYearView())
  {
    id v10 = [v4 month];
    unint64_t v11 = [(LargeYearViewController *)self monthsPerRow];

    double v12 = 0.0;
    if ((unint64_t)v10 > v11) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  *((void *)&v14 + 1) = v6;
  *(void *)&long long v14 = v6 - 512;
  unint64_t v13 = v14 >> 9;
  if (v13 <= 7 && ((1 << v13) & 0x83) != 0) {
    double v15 = 63.0;
  }
  else {
    double v15 = 43.0;
  }
  double v12 = v7 + v15;
LABEL_25:

  return v12;
}

- (void)didScroll
{
  if (self->_viewIsVisible) {
    [(LargeYearViewController *)self _updateYearNumbersAnimated:1 withForce:0];
  }
}

- (void)didEndScrolling
{
  v5.receiver = self;
  v5.super_class = (Class)LargeYearViewController;
  [(YearViewController *)&v5 didEndScrolling];
  if (self->_viewIsVisible)
  {
    unsigned int v3 = [(LargeYearViewController *)self _currentlyViewingCalendarDate];
    id v4 = [(MainViewController *)self model];
    [v4 setSelectedDate:v3];
  }
  [(LargeYearViewController *)self _updateYearNumbersAnimated:1 withForce:1];
}

- (Class)multipleMonthViewClass
{
  v2 = [(LargeYearViewController *)self traitCollection];
  EKUIUsesLargeTextYearView();

  unsigned int v3 = objc_opt_class();

  return (Class)v3;
}

- (unint64_t)monthsPerRow
{
  unsigned int v3 = [(MainViewController *)self window];
  EKUICurrentWindowSize();
  if (self->_isRotating)
  {
    double width = self->_targetSizeAfterTransition.width;
    double height = self->_targetSizeAfterTransition.height;
  }
  else
  {
    double width = v4;
    double height = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 mainContentSize];
      double width = v8;
    }
  }
  id v9 = [objc_opt_class() _monthsPerRowForWindowSize:width, height];

  return (unint64_t)v9;
}

+ (unint64_t)_monthsPerRowForWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (EKUIUsesLargeTextYearView())
  {
    return +[LargeTextLargeYearMultipleMonthView numberOfMonthsPerRowForWindowSize:](LargeTextLargeYearMultipleMonthView, "numberOfMonthsPerRowForWindowSize:", width, height);
  }
  else
  {
    return (unint64_t)[a1 defaultMonthsPerRowForWindowSize:width, height];
  }
}

+ (unint64_t)defaultMonthsPerRowForWindowSize:(CGSize)a3
{
  double width = a3.width;
  uint64_t v4 = EKUIWindowSizeParadigmForWindowSize();
  if ((EKUIUsesLargeTextYearView() & 1) == 0)
  {
    unint64_t result = 6;
    if (v4 <= 0x1FFFFFF)
    {
      if (v4 == 0x80000 || v4 == 0x800000) {
        return result;
      }
    }
    else if (v4 == 0x2000000 || v4 == 0x8000000 || v4 == 0x20000000)
    {
      return result;
    }
  }
  if (EKUIWindowInterfaceParadigmForWindowSize() == 8) {
    return 4;
  }
  if (EKUIWindowSizeParadigmForWindowSize() == 0x2000) {
    return 3;
  }
  if (qword_100216A38 != -1) {
    dispatch_once(&qword_100216A38, &stru_1001D5740);
  }
  [(id)qword_100216A30 valueForSize:width];
  return (unint64_t)v6;
}

- (BOOL)shouldAnimateTransitionsToMonthView
{
  return 0;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    double v12 = [(MainViewController *)self model];
    [v12 setSelectedOccurrence:v10];

    unint64_t v13 = [v10 startCalendarDate];
    long long v14 = [(YearViewController *)self pushedMonthViewControllerWithDate:v13 animated:0];
    double v15 = [v14 currentChildViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v15 setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:1];
    }
    [v15 showEvent:v10 animated:v8 showMode:a5 context:v11];
  }
  else
  {
    __int16 v16 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No event given.  Will not show event through Year View.", v17, 2u);
    }
  }
}

- (void)receivedTapAtLocation:(CGPoint)a3 usingDate:(id)a4 precise:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", x, y);
  if (!v5) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id v11 = v10;
  double v12 = [(LargeYearViewController *)self view];
  [v11 convertPoint:v12 fromView:x, y];
  double v14 = v13;
  double v16 = v15;

  objc_super v17 = [v11 startOfMonthForPoint:v14, v16];
  uint64_t v18 = [v11 monthViewForCalendarDate:v17];
  if (!v18)
  {
LABEL_7:

LABEL_8:
    v29.receiver = self;
    v29.super_class = (Class)LargeYearViewController;
    -[YearViewController receivedTapAtLocation:usingDate:precise:](&v29, "receivedTapAtLocation:usingDate:precise:", v9, v5, x, y);
    goto LABEL_9;
  }
  v19 = (void *)v18;
  CGFloat v20 = [(LargeYearViewController *)self view];
  [v19 convertPoint:v20 fromView:x, y];
  double v22 = v21;
  double v24 = v23;

  uint64_t v25 = [v19 calendarDateForPoint:v22, v24];
  if (!v25)
  {

    goto LABEL_7;
  }
  uint64_t v26 = (void *)v25;
  v27 = [(MainViewController *)self model];
  v28 = [v27 persistedSceneState];
  -[YearViewController pushContentViewOfType:date:animated:](self, "pushContentViewOfType:date:animated:", [v28 lastUsedNonYearView], v26, 0);

LABEL_9:
}

- (double)leftBarButtonBlankFixedSpaceWidth
{
  unsigned int v3 = [(LargeYearViewController *)self view];
  uint64_t v4 = EKUICurrentWindowSizeParadigmForViewHierarchy();

  if (v4 <= 0x1FFFFFF)
  {
    if (v4 != 0x80000 && v4 != 0x800000) {
      goto LABEL_10;
    }
LABEL_8:
    BOOL v5 = [(LargeYearViewController *)self view];
    [v5 bounds];
    double v6 = [(LargeYearViewController *)self view];
    EKUILayoutMarginsForFullscreenLayoutRectWithSize();
    double v8 = v7;

    return -v8;
  }
  if (v4 == 0x2000000 || v4 == 0x20000000 || v4 == 0x8000000) {
    goto LABEL_8;
  }
LABEL_10:
  id v10 = [(LargeYearViewController *)self view];
  if (EKUICurrentWindowSizeParadigmForViewHierarchy() == 0x100000)
  {
LABEL_13:

    return -11.0;
  }
  id v11 = [(LargeYearViewController *)self view];
  uint64_t v12 = EKUICurrentWindowSizeParadigmForViewHierarchy();

  double result = -11.0;
  if (v12 != 0x200000)
  {
    id v10 = [(LargeYearViewController *)self view];
    if (EKUICurrentWindowSizeParadigmForViewHierarchy() == 0x4000) {
      goto LABEL_13;
    }
    double v13 = [(LargeYearViewController *)self view];
    uint64_t v14 = EKUICurrentWindowSizeParadigmForViewHierarchy();

    double result = -15.0;
    if (v14 == 0x2000) {
      return -11.0;
    }
  }
  return result;
}

- (void)updateNavigationBarDisplayedDateString
{
}

- (void)updatePalette:(id)a3
{
  id v4 = a3;
  [v4 setWeekdayHeaderVisible:0];
  [v4 setDayScrubberController:0];
  [v4 setWeekdayHeaderFillsHalfWidth:0];
  [v4 setTodayButtonVisible:1];
  [v4 setDateStringVisible:1];
  [v4 setDividerLineVisible:0];
  [v4 setFocusBannerPlacement:2];
  [v4 sizeToFit];
  [v4 frame];
  double v6 = v5;
  double v7 = [v4 containingPalette];
  [v7 setPreferredHeight:v6];

  id v9 = [v4 containingPalette];

  double v8 = [(LargeYearViewController *)self navigationItem];
  [v8 _setBottomPalette:v9];
}

- (int64_t)intendedSizeClass
{
  return 2;
}

- (id)sceneTitle
{
  unsigned int v3 = [(LargeYearViewController *)self _currentlyViewingCalendarDate];
  id v4 = v3;
  if (v3)
  {
    double v5 = [v3 date];
    if (v5)
    {
LABEL_3:
      double v6 = CUIKStringForYear();
      goto LABEL_6;
    }
  }
  else
  {
    double v7 = [(MainViewController *)self model];
    double v8 = [v7 selectedDay];
    double v5 = [v8 date];

    if (v5) {
      goto LABEL_3;
    }
  }
  double v6 = 0;
LABEL_6:

  return v6;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3
{
}

- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3
{
}

- (void)_showNextDateComponentUnitInForwardDirection:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(MainViewController *)self model];
  id v10 = [v7 selectedDate];

  if (v5) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }
  id v9 = [v10 calendarDateByAddingYears:v8];
  [(YearViewController *)self selectDate:v9 animated:v4];
}

- (void)timeZoneDidChange
{
}

- (void)localeDidChange
{
}

- (void)_queueForcedUpdateToYearNumbers
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100105290;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_currentlyViewingCalendarDate
{
  unsigned int v3 = [(InfiniteScrollViewController *)self scrollView];
  [v3 contentInset];
  double v5 = v4;

  double v6 = -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", 0.0, v5 + 72.0);
  double v7 = [v6 calendarDate];

  return v7;
}

- (void)_updateYearNumbersAnimated:(BOOL)a3 withForce:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(LargeYearViewController *)self _currentlyViewingCalendarDate];
  uint64_t v8 = (void *)v7;
  if (v4
    || v7
    && ((currentYearNumber = self->_currentYearNumber) == 0
     || [(EKCalendarDate *)currentYearNumber compare:v8]))
  {
    objc_storeStrong((id *)&self->_currentYearNumber, v8);
    id v9 = [(LargeYearViewController *)self navigationController];
    id v10 = [v9 topMainViewControllerContainer];
    id v11 = [v10 currentChildViewController];

    if (v11 == self)
    {
      uint64_t v12 = [(LargeYearViewController *)self navigationController];
      [v12 setNavBarStringFromDate:v8 includeMonth:0 includeYear:1];
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001054AC;
    v14[3] = &unk_1001D5768;
    v14[4] = self;
    BOOL v15 = a3;
    [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v14];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentYearNumber, 0);

  objc_storeStrong((id *)&self->_activeDateDuringRotation, 0);
}

@end