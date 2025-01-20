@interface PaletteScrollViewController
- (ActivitySummaryProviding)activitySummaryProvider;
- (BOOL)isUserInteractionEnabled;
- (BOOL)scrollOrRelayoutWeekIfNeededToDate:(id)a3;
- (CGPoint)_centerForRingAtIndex:(unint64_t)a3;
- (FIPauseRingsCoordinator)pauseRingsCoordinator;
- (PaletteScrollViewController)initWithPauseRingsCoordinator:(id)a3;
- (PaletteScrollViewDelegate)delegate;
- (id)_currentWeekStartDate;
- (id)_getDayWithTouches:(id)a3;
- (id)startOfFitnessWeekAfterWeekStarting:(id)a3;
- (id)startOfFitnessWeekBeforeWeekStarting:(id)a3;
- (void)_add:(BOOL)a3;
- (void)_createRingsView;
- (void)_paletteActivitySummaryCacheChanged:(id)a3;
- (void)_prepareForScrollAnimationStart;
- (void)_readjustOffsetIfNecessary;
- (void)_rearrangeWeeks:(BOOL)a3;
- (void)_reloadActivitySummariesFromCache;
- (void)_scrollAnimationFinished;
- (void)_setDataForGroups:(id)a3 withStartingDate:(id)a4;
- (void)dealloc;
- (void)reloadViewDataAtDate:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)setActivitySummaryProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsUserInteractionEnabled:(BOOL)a3;
- (void)setPauseRingsCoordinator:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateScrollviewOnTodayChanged;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PaletteScrollViewController

- (PaletteScrollViewController)initWithPauseRingsCoordinator:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PaletteScrollViewController;
  v5 = [(PaletteScrollViewController *)&v11 init];
  if (v5)
  {
    v6 = +[ActivitySummaryCache sharedInstance];
    objc_storeWeak((id *)&v5->_activitySummaryProvider, v6);

    objc_storeWeak((id *)&v5->_pauseRingsCoordinator, v4);
    v7 = +[NSNotificationCenter defaultCenter];
    v8 = +[FIPauseRingsCoordinator didUpdatePauseStateNotification];
    [v7 addObserver:v5 selector:"_paletteActivitySummaryCacheChanged:" name:v8 object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v5 selector:"_paletteActivitySummaryCacheChanged:" name:@"ActivitySummaryCacheChangedNotification" object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PaletteScrollViewController;
  [(PaletteScrollViewController *)&v4 dealloc];
}

- (void)updateScrollviewOnTodayChanged
{
  id v15 = +[NSDate date];
  v3 = [(PaletteScrollViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  double v6 = v5 + self->_panAmount.x;
  [(UIScrollView *)self->_scrollView contentSize];
  if (v6 == v7)
  {
    v8 = [(NSMutableArray *)self->_weekStartingDates lastObject];
    v9 = [(PaletteScrollViewController *)self startOfFitnessWeekAfterWeekStarting:v8];

    [v15 timeIntervalSinceReferenceDate];
    double v11 = v10;
    [v9 timeIntervalSinceReferenceDate];
    if (v11 >= v12)
    {
      [(PaletteScrollViewController *)self _rearrangeWeeks:0];
      [(PaletteScrollViewController *)self _add:0];
      -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v5, 0.0);
      [(UIScrollView *)self->_scrollView contentOffset];
      self->_panAmount.x = v13;
      self->_panAmount.y = v14;
      self->_previousContentOffsetX = v13;
    }
  }
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)PaletteScrollViewController;
  [(PaletteScrollViewController *)&v12 viewDidLoad];
  v3 = [(PaletteScrollViewController *)self view];
  [v3 bounds];
  self->_panAmount.x = v4 + v4;
  self->_panAmount.y = 0.0;

  [(PaletteScrollViewController *)self _createRingsView];
  double v5 = [(PaletteScrollViewController *)self view];
  [v5 addSubview:self->_ringsView];

  [(ARUIRingsView *)self->_ringsView setOpaque:0];
  ringsView = self->_ringsView;
  double v7 = +[UIColor clearColor];
  [(ARUIRingsView *)ringsView setBackgroundColor:v7];

  v8 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v8;

  [(UIScrollView *)self->_scrollView setHidden:1];
  [(UIScrollView *)self->_scrollView setDelegate:self];
  [(UIScrollView *)self->_scrollView setPagingEnabled:1];
  [(UIScrollView *)self->_scrollView setDirectionalLockEnabled:1];
  [(ARUIRingsView *)self->_ringsView addSubview:self->_scrollView];
  double v10 = [(UIScrollView *)self->_scrollView panGestureRecognizer];
  [(ARUIRingsView *)self->_ringsView addGestureRecognizer:v10];
  self->_wasTouched = 0;
  double v11 = +[NSDate date];
  [(PaletteScrollViewController *)self reloadViewDataAtDate:v11];
}

- (void)_createRingsView
{
  v3 = +[NSMutableArray arrayWithCapacity:21];
  for (int i = 0; i != 21; ++i)
  {
    double v5 = +[ARUIRingGroup activityRingGroupForRingType:3];
    *(float *)&double v6 = 40.0;
    [v5 setGroupDiameter:v6];
    *(float *)&double v7 = 1.5;
    [v5 setInterspacing:v7];
    [v5 groupDiameter];
    double v9 = floor(v8 * 0.1);
    *(float *)&double v9 = v9;
    [v5 setThickness:v9];
    double v10 = [v5 rings];
    id v11 = [v10 count];

    if (v11)
    {
      unint64_t v13 = 0;
      do
      {
        LODWORD(v12) = ARUIRingPercentageValueNoRing;
        [v5 setPercentage:v13++ ofRingAtIndex:0 animated:v12];
        CGFloat v14 = [v5 rings];
        id v15 = [v14 count];
      }
      while (v13 < (unint64_t)v15);
    }
    [(NSMutableArray *)v3 addObject:v5];
  }
  ringGroups = self->_ringGroups;
  self->_ringGroups = v3;
  v19 = v3;

  v17 = (ARUIRingsView *)[objc_alloc((Class)ARUIRingsView) initWithRingGroups:v19];
  ringsView = self->_ringsView;
  self->_ringsView = v17;

  [(ARUIRingsView *)self->_ringsView setDiscardBackBuffers:0];
  [(ARUIRingsView *)self->_ringsView setContentMode:6];
  [(ARUIRingsView *)self->_ringsView setAutoresizingMask:0];
}

- (void)_paletteActivitySummaryCacheChanged:(id)a3
{
  weekStartingDates = self->_weekStartingDates;
  id v5 = a3;
  id v12 = [(NSMutableArray *)weekStartingDates firstObject];
  double v6 = [(NSMutableArray *)self->_weekStartingDates lastObject];
  double v7 = [(PaletteScrollViewController *)self startOfFitnessWeekAfterWeekStarting:v6];

  uint64_t v8 = sub_10012E390(v12);
  uint64_t v9 = sub_10012E390(v7);
  double v10 = [v5 userInfo];

  id v11 = [v10 objectForKeyedSubscript:@"range"];

  if (sub_10012E418(v11, v8, v9, @"Palette") || !v11) {
    [(PaletteScrollViewController *)self _reloadActivitySummariesFromCache];
  }
}

- (void)setActivitySummaryProvider:(id)a3
{
  objc_storeWeak((id *)&self->_activitySummaryProvider, a3);
  id v4 = +[NSDate date];
  [(PaletteScrollViewController *)self reloadViewDataAtDate:v4];
}

- (void)setIsUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isUserInteractionEnabled = a3;
  id v4 = [(PaletteScrollViewController *)self view];
  [v4 setUserInteractionEnabled:v3];
}

- (void)_reloadActivitySummariesFromCache
{
  BOOL v3 = [(NSMutableArray *)self->_weekStartingDates firstObject];
  id v4 = +[NSCalendar currentCalendar];
  ringGroups = self->_ringGroups;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100145AF4;
  v8[3] = &unk_1008AD5F8;
  id v9 = v4;
  id v10 = v3;
  id v11 = self;
  id v6 = v3;
  id v7 = v4;
  [(NSMutableArray *)ringGroups enumerateObjectsUsingBlock:v8];
}

- (id)startOfFitnessWeekBeforeWeekStarting:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  id v5 = [v4 dateByAddingUnit:0x2000 value:-1 toDate:v3 options:0];

  return v5;
}

- (id)startOfFitnessWeekAfterWeekStarting:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  id v5 = [v4 dateByAddingUnit:0x2000 value:1 toDate:v3 options:0];

  return v5;
}

- (CGPoint)_centerForRingAtIndex:(unint64_t)a3
{
  unint64_t v4 = a3 % 7;
  double v5 = (double)(a3 / 7);
  id v6 = [(PaletteScrollViewController *)self view];
  [v6 frame];
  double v8 = (40.0 - v7) * 0.5;

  id v9 = [(PaletteScrollViewController *)self view];
  [v9 frame];
  double v11 = v8 + v5 * v10;
  id v12 = [(PaletteScrollViewController *)self view];
  [v12 centerXForElementAt:v4 width:40.0 percent:0.0];
  double v14 = v11 + v13 - self->_panAmount.x;

  double v15 = 10.0;
  double v16 = v14;
  result.y = v15;
  result.x = v16;
  return result;
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PaletteScrollViewController;
  [(PaletteScrollViewController *)&v17 viewWillLayoutSubviews];
  id v3 = [(PaletteScrollViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(ARUIRingsView *)self->_ringsView frame];
  if (v11 >= v12) {
    -[ARUIRingsView setFrame:](self->_ringsView, "setFrame:", v5, v7, v9, v11);
  }
  [(ARUIRingsView *)self->_ringsView bounds];
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
  [(ARUIRingsView *)self->_ringsView frame];
  double v14 = v13 * 3.0;
  double v15 = [(PaletteScrollViewController *)self view];
  [v15 frame];
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v14, v16);

  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", self->_panAmount.x, self->_panAmount.y);
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  self->_wasTouched = 1;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->_wasTouched = 0;
}

- (void)_prepareForScrollAnimationStart
{
  id v2 = [(PaletteScrollViewController *)self view];
  [v2 setUserInteractionEnabled:1];
}

- (void)_scrollAnimationFinished
{
  [(PaletteScrollViewController *)self _readjustOffsetIfNecessary];
  _HKInitializeLogging();
  id v3 = HKLogActivity;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NSMutableArray *)self->_weekStartingDates count];
    if ((unint64_t)v4 < 2)
    {
      double v5 = 0;
    }
    else
    {
      double v5 = [(NSMutableArray *)self->_weekStartingDates objectAtIndexedSubscript:1];
    }
    int v7 = 138412290;
    double v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Palette] Palette was scrolled to date: %@", (uint8_t *)&v7, 0xCu);
    if ((unint64_t)v4 >= 2) {
  }
    }
  double v6 = [(PaletteScrollViewController *)self view];
  [v6 setUserInteractionEnabled:1];
}

- (void)_readjustOffsetIfNecessary
{
  [(UIScrollView *)self->_scrollView contentOffset];
  double v4 = v3;
  double v5 = [(PaletteScrollViewController *)self view];
  [v5 bounds];
  double v7 = v6;

  double previousContentOffsetX = self->_previousContentOffsetX;
  if (v4 != previousContentOffsetX)
  {
    double v9 = [(NSMutableArray *)self->_weekStartingDates lastObject];
    id v20 = [(PaletteScrollViewController *)self startOfFitnessWeekAfterWeekStarting:v9];

    [v20 timeIntervalSinceReferenceDate];
    double v11 = v10;
    double v12 = +[NSDate date];
    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;

    BOOL v15 = v11 < v14 || v4 < previousContentOffsetX;
    if (v4 != v7 && v15)
    {
      [(PaletteScrollViewController *)self _rearrangeWeeks:v4 < previousContentOffsetX];
      [(PaletteScrollViewController *)self _add:v4 < previousContentOffsetX];
      -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v7, 0.0);
    }
    if (self->_wasTouched)
    {
      objc_super v17 = [(PaletteScrollViewController *)self delegate];
      [v17 paletteScrolledInDirection:v4 < previousContentOffsetX];
    }
    [(UIScrollView *)self->_scrollView contentOffset];
    self->_panAmount.x = v18;
    self->_panAmount.y = v19;
    self->_double previousContentOffsetX = v18;
  }
}

- (id)_currentWeekStartDate
{
  double previousContentOffsetX = self->_previousContentOffsetX;
  double v4 = [(PaletteScrollViewController *)self view];
  [v4 bounds];
  uint64_t v6 = (uint64_t)(previousContentOffsetX / v5);

  weekStartingDates = self->_weekStartingDates;

  return [(NSMutableArray *)weekStartingDates objectAtIndexedSubscript:v6];
}

- (BOOL)scrollOrRelayoutWeekIfNeededToDate:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMutableArray *)self->_weekStartingDates firstObject];
  uint64_t v6 = [(NSMutableArray *)self->_weekStartingDates lastObject];
  double v7 = [(PaletteScrollViewController *)self startOfFitnessWeekAfterWeekStarting:v6];

  [v4 timeIntervalSinceReferenceDate];
  double v9 = v8;
  double v10 = [(PaletteScrollViewController *)self _currentWeekStartDate];
  double v11 = [(PaletteScrollViewController *)self startOfFitnessWeekAfterWeekStarting:v10];
  [v5 timeIntervalSinceReferenceDate];
  if (v9 < v12 || ([v7 timeIntervalSinceReferenceDate], v9 >= v13))
  {
    [(PaletteScrollViewController *)self reloadViewDataAtDate:v4];
    BOOL v16 = 1;
  }
  else
  {
    [v10 timeIntervalSinceReferenceDate];
    if (v9 < v14 || ([v11 timeIntervalSinceReferenceDate], v9 >= v15))
    {
      [v10 timeIntervalSinceReferenceDate];
      double v18 = v17;
      CGFloat v19 = [(PaletteScrollViewController *)self view];
      [v19 bounds];
      double v21 = v20;

      double v22 = 1.0;
      if (v9 < v18) {
        double v22 = -1.0;
      }
      BOOL v16 = 1;
      -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1, self->_previousContentOffsetX + v22 * v21, 0.0);
      [(PaletteScrollViewController *)self _prepareForScrollAnimationStart];
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (void)_rearrangeWeeks:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(NSMutableArray *)self->_weekStartingDates firstObject];
  double v5 = [(NSMutableArray *)self->_weekStartingDates lastObject];
  if (v3)
  {
    [(NSMutableArray *)self->_weekStartingDates removeLastObject];
    uint64_t v6 = [(PaletteScrollViewController *)self startOfFitnessWeekBeforeWeekStarting:v7];
    [(NSMutableArray *)self->_weekStartingDates insertObject:v6 atIndex:0];
  }
  else
  {
    uint64_t v6 = [(PaletteScrollViewController *)self startOfFitnessWeekAfterWeekStarting:v5];
    [(NSMutableArray *)self->_weekStartingDates removeObjectAtIndex:0];
    [(NSMutableArray *)self->_weekStartingDates addObject:v6];
  }
}

- (void)_add:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (char *)[(NSMutableArray *)self->_ringGroups count];
  uint64_t v6 = HKDaysInAWeek;
  id v7 = &v5[-HKDaysInAWeek];
  ringGroups = self->_ringGroups;
  if (v3)
  {
    double v9 = -[NSMutableArray subarrayWithRange:](ringGroups, "subarrayWithRange:", v7, HKDaysInAWeek);
    -[NSMutableArray removeObjectsInRange:](self->_ringGroups, "removeObjectsInRange:", v7, v6);
    double v10 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v6);
    [(NSMutableArray *)self->_ringGroups insertObjects:v9 atIndexes:v10];
    double v11 = self->_ringGroups;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10014684C;
    v16[3] = &unk_1008AD620;
    v16[4] = self;
    [(NSMutableArray *)v11 enumerateObjectsUsingBlock:v16];
    uint64_t v12 = [(NSMutableArray *)self->_weekStartingDates firstObject];
  }
  else
  {
    double v9 = -[NSMutableArray subarrayWithRange:](ringGroups, "subarrayWithRange:", 0, HKDaysInAWeek);
    -[NSMutableArray removeObjectsInRange:](self->_ringGroups, "removeObjectsInRange:", 0, v6);
    double v10 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v7, v6);
    [(NSMutableArray *)self->_ringGroups insertObjects:v9 atIndexes:v10];
    double v13 = self->_ringGroups;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001468A8;
    v15[3] = &unk_1008AD620;
    v15[4] = self;
    [(NSMutableArray *)v13 enumerateObjectsUsingBlock:v15];
    uint64_t v12 = [(NSMutableArray *)self->_weekStartingDates lastObject];
  }
  double v14 = (void *)v12;
  [(PaletteScrollViewController *)self _setDataForGroups:v9 withStartingDate:v12];
}

- (void)_setDataForGroups:(id)a3 withStartingDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[NSCalendar currentCalendar];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001469E4;
  v10[3] = &unk_1008AD5F8;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v6;
  double v13 = self;
  id v8 = v6;
  id v9 = v11;
  [v7 enumerateObjectsUsingBlock:v10];
}

- (void)reloadViewDataAtDate:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  double v5 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PaletteScrollView] Reloading data from cache at date: %@", buf, 0xCu);
  }
  id v6 = +[NSCalendar currentCalendar];
  id v7 = [v6 hk_startOfFitnessWeekBeforeDate:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySummaryProvider);
  id v9 = [v6 hk_dateByAddingDays:-[WeakRetained fitnessStartOfWeekOffset] toDate:v7];

  double v10 = [(PaletteScrollViewController *)self startOfFitnessWeekBeforeWeekStarting:v9];
  id v11 = [(PaletteScrollViewController *)self startOfFitnessWeekAfterWeekStarting:v9];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;
  double v14 = +[NSDate date];
  [v14 timeIntervalSinceReferenceDate];
  double v16 = v15;

  if (v13 >= v16)
  {
    v24 = [(PaletteScrollViewController *)self startOfFitnessWeekBeforeWeekStarting:v10];
    id v25 = objc_alloc((Class)NSMutableArray);
    v33[0] = v24;
    v33[1] = v10;
    v33[2] = v9;
    v26 = +[NSArray arrayWithObjects:v33 count:3];
    v27 = (NSMutableArray *)[v25 initWithArray:v26];
    weekStartingDates = self->_weekStartingDates;
    self->_weekStartingDates = v27;

    [(PaletteScrollViewController *)self _reloadActivitySummariesFromCache];
    p_panAmount = &self->_panAmount;
    double v22 = [(PaletteScrollViewController *)self view];
    [v22 bounds];
    self->_panAmount.x = v29 + v29;
  }
  else
  {
    id v17 = objc_alloc((Class)NSMutableArray);
    v32[0] = v10;
    v32[1] = v9;
    v32[2] = v11;
    double v18 = +[NSArray arrayWithObjects:v32 count:3];
    CGFloat v19 = (NSMutableArray *)[v17 initWithArray:v18];
    double v20 = self->_weekStartingDates;
    self->_weekStartingDates = v19;

    [(PaletteScrollViewController *)self _reloadActivitySummariesFromCache];
    p_panAmount = &self->_panAmount;
    double v22 = [(PaletteScrollViewController *)self view];
    [v22 bounds];
    self->_panAmount.x = v23;
  }
  p_panAmount->y = 0.0;

  self->_double previousContentOffsetX = p_panAmount->x;
  [(UIScrollView *)self->_scrollView contentSize];
  if (v31 != CGSizeZero.width || v30 != CGSizeZero.height) {
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", p_panAmount->x, p_panAmount->y);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  p_panAmount = &self->_panAmount;
  [(UIScrollView *)self->_scrollView contentOffset];
  p_panAmount->x = v5;
  p_panAmount->y = v6;
  if ([(NSMutableArray *)self->_ringGroups count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [(NSMutableArray *)self->_ringGroups objectAtIndexedSubscript:v7];
      [(PaletteScrollViewController *)self _centerForRingAtIndex:v7];
      [v8 setCenter:];

      ++v7;
    }
    while (v7 < (unint64_t)[(NSMutableArray *)self->_ringGroups count]);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[PaletteScrollViewController _getDayWithTouches:](self, "_getDayWithTouches:", a3, a4);
  CGFloat v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateTouched = self->_dateTouched;
  self->_dateTouched = v5;

  _objc_release_x1(v5, dateTouched);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  dateTouched = self->_dateTouched;
  if (dateTouched)
  {
    [(NSDate *)dateTouched timeIntervalSinceReferenceDate];
    double v9 = v8;
    double v10 = +[NSDate date];
    [v10 timeIntervalSinceReferenceDate];
    double v12 = v11;

    if (v9 <= v12)
    {
      double v13 = [(PaletteScrollViewController *)self delegate];
      [v13 paletteDateSelected:self->_dateTouched];
    }
  }
}

- (id)_getDayWithTouches:(id)a3
{
  id v4 = [a3 anyObject];
  CGFloat v5 = [(PaletteScrollViewController *)self view];
  [v4 locationInView:v5];
  double v7 = v6;

  double v8 = [(PaletteScrollViewController *)self view];
  [v8 bounds];
  double v10 = v9 / 7.0;

  double v11 = [(PaletteScrollViewController *)self _currentWeekStartDate];
  double v12 = +[NSCalendar currentCalendar];
  double v13 = [v12 dateByAddingUnit:16 value:vcvtmd_s64_f64(v7 / v10) toDate:v11 options:0];

  return v13;
}

- (FIPauseRingsCoordinator)pauseRingsCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pauseRingsCoordinator);

  return (FIPauseRingsCoordinator *)WeakRetained;
}

- (void)setPauseRingsCoordinator:(id)a3
{
}

- (ActivitySummaryProviding)activitySummaryProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySummaryProvider);

  return (ActivitySummaryProviding *)WeakRetained;
}

- (PaletteScrollViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PaletteScrollViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isUserInteractionEnabled
{
  return self->_isUserInteractionEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_activitySummaryProvider);
  objc_destroyWeak((id *)&self->_pauseRingsCoordinator);
  objc_storeStrong((id *)&self->_dateTouched, 0);
  objc_storeStrong((id *)&self->_weekStartingDates, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_ringGroups, 0);
}

@end