@interface MonthScrollViewController
- (BOOL)_isLastVisibleWeek:(id)a3;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (FitMonthWeekViewDatasource)monthWeekDatasource;
- (MonthScrollViewController)initWithDateCache:(id)a3 workoutsDataProvider:(id)a4 pauseRingsCoordinator:(id)a5;
- (MonthScrollViewDelegate)monthScrollDelegate;
- (NSMutableArray)weekViews;
- (UIScrollView)scrollView;
- (double)_centerXForRingAt:(int64_t)a3 percent:(double)a4;
- (double)_heightOffsetForWeekRow:(int64_t)a3;
- (id)_calculateLastVisibleDate;
- (id)earliestDateToTileForMonth:(id)a3;
- (id)weekWithStartDate:(id)a3;
- (void)_activitySummaryCacheChanged:(id)a3;
- (void)_addAndRearrangeWeekviewsAndGroups;
- (void)_animateRingOnTouch:(BOOL)a3 completion:(id)a4;
- (void)_buildFreshViews;
- (void)_createRingsView;
- (void)_didBecomeActive:(id)a3;
- (void)_findCenteredWeekAndUpdateTitleIfNecessary;
- (void)_loadActivitySummariesForWeek:(id)a3 ringGroupIndex:(unint64_t)a4;
- (void)_loadWorkoutsForWeek:(id)a3;
- (void)_readjustFrom:(unint64_t)a3 to:(unint64_t)a4 fromGroupRange:(_NSRange)a5 toGroupRange:(_NSRange)a6 down:(BOOL)a7;
- (void)_readjustRings;
- (void)_readjustScrollViewToOffset:(double)a3 weekOffset:(double)a4;
- (void)_relayoutRingGroups;
- (void)_reloadAllActivitySummariesFromCache;
- (void)_reloadAllWorkoutsFromCache;
- (void)_timeZoneChanged:(id)a3;
- (void)_workoutsCacheChanged:(id)a3;
- (void)dealloc;
- (void)scrollToDate:(id)a3 windowHeight:(double)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setMonthScrollDelegate:(id)a3;
- (void)setMonthWeekDatasource:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setWeekViews:(id)a3;
- (void)todayChanged;
- (void)viewDidLoad;
- (void)week:(id)a3 cellSelected:(id)a4;
- (void)week:(id)a3 pressedOnDay:(int64_t)a4 down:(BOOL)a5;
@end

@implementation MonthScrollViewController

- (MonthScrollViewController)initWithDateCache:(id)a3 workoutsDataProvider:(id)a4 pauseRingsCoordinator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MonthScrollViewController;
  v12 = [(MonthScrollViewController *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dateCache, a3);
    objc_storeStrong((id *)&v13->_workoutsDataProvider, a4);
    objc_storeStrong((id *)&v13->_pauseRingsCoordinator, a5);
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v13 selector:"_timeZoneChanged:" name:NSSystemTimeZoneDidChangeNotification object:0];
    [v14 addObserver:v13 selector:"_activitySummaryCacheChanged:" name:@"ActivitySummaryCacheChangedNotification" object:0];
    v15 = +[FIPauseRingsCoordinator didUpdatePauseStateNotification];
    [v14 addObserver:v13 selector:"_activitySummaryCacheChanged:" name:v15 object:0];

    [v14 addObserver:v13 selector:"_workoutsCacheChanged:" name:@"FitnessActivityWorkoutsChangedNotification" object:0];
    [v14 addObserver:v13 selector:"_didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
    [v14 addObserver:v13 selector:"todayChanged" name:@"FitnessCurrentDeviceDateChangedNotification" object:0];
    v16 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
    scrollView = v13->_scrollView;
    v13->_scrollView = v16;

    [(UIScrollView *)v13->_scrollView setDelegate:v13];
    -[UIScrollView setContentInset:](v13->_scrollView, "setContentInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    [(UIScrollView *)v13->_scrollView setContentInsetAdjustmentBehavior:2];
    uint64_t v18 = +[ActivitySummaryCache sharedInstance];
    summaryCache = v13->_summaryCache;
    v13->_summaryCache = (ActivitySummaryCache *)v18;

    v20 = [[FitnessWorkoutsCache alloc] initWithDataProvider:v13->_workoutsDataProvider];
    workoutCache = v13->_workoutCache;
    v13->_workoutCache = v20;
  }
  return v13;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MonthScrollViewController;
  [(MonthScrollViewController *)&v4 dealloc];
}

- (void)_didBecomeActive:(id)a3
{
  id v3 = +[ActivitySummaryCache sharedInstance];
  [v3 loadDataIfNeeded];
}

- (void)_workoutsCacheChanged:(id)a3
{
  _HKInitializeLogging();
  objc_super v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MSVC] Workouts cache changed, reloading.", v5, 2u);
  }
  [(MonthScrollViewController *)self _reloadAllWorkoutsFromCache];
}

- (void)_activitySummaryCacheChanged:(id)a3
{
  objc_super v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"range"];

  v6 = [(NSMutableArray *)self->_weekViews firstObject];
  v7 = [v6 summaryIndexes];
  v8 = [v7 firstObject];
  [v8 doubleValue];
  uint64_t v10 = (uint64_t)v9;

  id v11 = [(NSMutableArray *)self->_weekViews lastObject];
  v12 = [v11 summaryIndexes];
  v13 = [v12 lastObject];
  [v13 doubleValue];
  uint64_t v15 = (uint64_t)v14;

  if (sub_10012E418(v5, v10, v15, @"MSVC") || !v5)
  {
    _HKInitializeLogging();
    v16 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MSVC] Activity summaries changed, reloading.", v17, 2u);
    }
    [(MonthScrollViewController *)self _reloadAllActivitySummariesFromCache];
  }
}

- (void)_timeZoneChanged:(id)a3
{
  _HKInitializeLogging();
  objc_super v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MSVC] Time zone changed, build fresh views.", v5, 2u);
  }
  [(MonthScrollViewController *)self _buildFreshViews];
  [(MonthScrollViewController *)self _relayoutRingGroups];
  self->_scrollViewAdjustedToBottom = 0;
  [(MonthScrollViewController *)self _reloadAllWorkoutsFromCache];
  [(MonthScrollViewController *)self _reloadAllActivitySummariesFromCache];
}

- (void)_buildFreshViews
{
  id v3 = [(MonthScrollViewController *)self view];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  v12 = +[NSDate date];
  v13 = [(MonthScrollViewController *)self earliestDateToTileForMonth:v12];

  double v14 = [(MonthScrollViewController *)self _calculateLastVisibleDate];
  lastVisibleWeekDate = self->_lastVisibleWeekDate;
  self->_lastVisibleWeekDate = v14;

  weekViews = self->_weekViews;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10012EC84;
  v18[3] = &unk_1008ACF60;
  uint64_t v21 = v5;
  uint64_t v22 = v7;
  uint64_t v23 = v9;
  uint64_t v24 = v11;
  id v19 = v13;
  v20 = self;
  id v17 = v13;
  [(NSMutableArray *)weekViews enumerateObjectsUsingBlock:v18];
  self->_incrementAmount = 0.0;
}

- (void)todayChanged
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = self->_weekViews;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) reloadCells:v19];
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  uint64_t v8 = self->_lastVisibleWeekDate;
  uint64_t v9 = [(MonthScrollViewController *)self _calculateLastVisibleDate];
  lastVisibleWeekDate = self->_lastVisibleWeekDate;
  self->_lastVisibleWeekDate = v9;

  [(NSDate *)self->_lastVisibleWeekDate timeIntervalSinceReferenceDate];
  double v12 = v11;
  [(NSDate *)v8 timeIntervalSinceReferenceDate];
  if (v12 >= v13)
  {
    if (self->_scrollViewAdjustedToBottom)
    {
      self->_scrollViewAdjustedToBottom = 0;
      [(MonthScrollViewController *)self _readjustScrollViewToOffset:64.0 weekOffset:-64.0];
      [(MonthScrollViewController *)self _readjustRings];
    }
  }
  else
  {
    self->_scrollViewAdjustedToBottom = 0;
    double v14 = +[NSDate date];
    uint64_t v15 = [(MonthScrollViewController *)self view];
    [v15 bounds];
    [(MonthScrollViewController *)self scrollToDate:v14 windowHeight:v16];
  }
  -[MonthScrollViewController weekWithStartDate:](self, "weekWithStartDate:", self->_lastVisibleWeekDate, (void)v19);
  id v17 = (MonthWeekView *)objc_claimAutoreleasedReturnValue();
  lastVisibleWeek = self->_lastVisibleWeek;
  self->_lastVisibleWeek = v17;
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)MonthScrollViewController;
  [(MonthScrollViewController *)&v22 viewDidLoad];
  id v3 = [(MonthScrollViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(MonthScrollViewController *)self _createRingsView];
  ringsView = self->_ringsView;
  double v13 = +[UIColor systemBackgroundColor];
  [(ARUIRingsView *)ringsView setBackgroundColor:v13];

  -[ARUIRingsView setFrame:](self->_ringsView, "setFrame:", v5, v7, v9, v11);
  double v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  weekViews = self->_weekViews;
  self->_weekViews = v14;

  int v16 = 11;
  do
  {
    id v17 = [MonthWeekView alloc];
    uint64_t v18 = [(ActivityDateCache *)self->_dateCache dateCache];
    long long v19 = [(MonthWeekView *)v17 initWithDateCache:v18];

    [(MonthWeekView *)v19 setDelegate:self];
    [(UIScrollView *)self->_scrollView addSubview:v19];
    [(NSMutableArray *)self->_weekViews addObject:v19];

    --v16;
  }
  while (v16);
  [(MonthScrollViewController *)self _buildFreshViews];
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v9, v11 + 128.0);
  [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v5, v7, v9, v11);
  long long v20 = [(MonthScrollViewController *)self view];
  [v20 addSubview:self->_ringsView];

  long long v21 = [(MonthScrollViewController *)self view];
  [v21 addSubview:self->_scrollView];

  [(MonthScrollViewController *)self _relayoutRingGroups];
  [(MonthScrollViewController *)self _reloadAllActivitySummariesFromCache];
}

- (id)_calculateLastVisibleDate
{
  id v3 = [(ActivityDateCache *)self->_dateCache calendar];
  double v4 = +[NSDate date];
  double v5 = [v3 components:14 fromDate:v4];

  [v5 setMonth:[v5 month] + 1];
  [v5 setDay:0];
  double v6 = [(ActivityDateCache *)self->_dateCache calendar];
  double v7 = [v6 dateFromComponents:v5];

  double v8 = [(ActivityDateCache *)self->_dateCache calendar];
  double v9 = [v8 hk_startOfFitnessWeekBeforeDate:v7];

  return v9;
}

- (BOOL)_isLastVisibleWeek:(id)a3
{
  id v4 = a3;
  if (!self->_lastVisibleWeekDate)
  {
    double v5 = [(MonthScrollViewController *)self _calculateLastVisibleDate];
    lastVisibleWeekDate = self->_lastVisibleWeekDate;
    self->_lastVisibleWeekDate = v5;
  }
  double v7 = [v4 currentWeekStartDate];
  unsigned __int8 v8 = [v7 isEqualToDate:self->_lastVisibleWeekDate];

  return v8;
}

- (void)_createRingsView
{
  id v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  if (HKDaysInAWeek)
  {
    uint64_t v4 = 0;
    if ((unint64_t)(11 * HKDaysInAWeek) <= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 11 * HKDaysInAWeek;
    }
    do
    {
      double v6 = +[MonthRingGroup activityRingGroupForRingType:3];
      *(float *)&double v7 = 40.0;
      [v6 setGroupDiameter:v7];
      *(float *)&double v8 = 1.5;
      [v6 setInterspacing:v8];
      [v6 groupDiameter];
      double v10 = floor(v9 * 0.1);
      *(float *)&double v10 = v10;
      [v6 setThickness:v10];
      double v11 = [v6 rings];
      id v12 = [v11 count];

      if (v12)
      {
        unint64_t v14 = 0;
        do
        {
          LODWORD(v13) = ARUIRingPercentageValueNoRing;
          [v6 setPercentage:v14++ ofRingAtIndex:0 animated:v13];
          uint64_t v15 = [v6 rings];
          id v16 = [v15 count];
        }
        while (v14 < (unint64_t)v16);
      }
      [(NSMutableArray *)v3 addObject:v6];
      [v6 setBackingOriginOffset:0.0];

      ++v4;
    }
    while (v4 != v5);
  }
  ringGroups = self->_ringGroups;
  self->_ringGroups = v3;
  long long v20 = v3;

  uint64_t v18 = (ARUIRingsView *)[objc_alloc((Class)ARUIRingsView) initWithRingGroups:v20];
  ringsView = self->_ringsView;
  self->_ringsView = v18;

  [(ARUIRingsView *)self->_ringsView setDiscardBackBuffers:0];
  [(ARUIRingsView *)self->_ringsView setSynchronizesWithCA:1];
}

- (id)earliestDateToTileForMonth:(id)a3
{
  dateCache = self->_dateCache;
  id v4 = a3;
  uint64_t v5 = [(ActivityDateCache *)dateCache calendar];
  double v6 = [v5 components:14 fromDate:v4];

  [v6 setDay:1];
  double v7 = [v5 dateFromComponents:v6];
  double v8 = [v5 hk_startOfFitnessWeekBeforeDate:v7];
  float v9 = [v5 dateByAddingUnit:0x2000 value:-1 toDate:v8 options:0];

  return v9;
}

- (void)scrollToDate:(id)a3 windowHeight:(double)a4
{
  id v25 = a3;
  double v6 = [(ActivityDateCache *)self->_dateCache calendar];
  double v7 = [v6 components:14 fromDate:v25];
  [v7 setDay:1];
  double v8 = [v6 dateFromComponents:v7];
  float v9 = [v6 hk_startOfFitnessWeekBeforeDate:v8];

  double v10 = [(MonthScrollViewController *)self weekWithStartDate:v9];
  double v11 = [(MonthScrollViewController *)self view];
  [v11 frame];
  double v13 = v12;

  unint64_t v14 = [v6 hk_startOfFitnessWeekBeforeDate:v25];
  uint64_t v15 = [v6 components:0x2000 fromDate:v9 toDate:v14 options:0];
  double v16 = (double)((uint64_t)[v15 weekOfYear] + 1) * 65.0 + 50.0;
  if (v10)
  {
    id v17 = [(MonthScrollViewController *)self view];
    [v17 scaledValueForSmallWidth:10.0 bigWidth:30.0];
    double v19 = v18;

    [v10 frame];
    double v21 = v20 - v19;
    double v22 = v13 * 0.5 - v19;
    if (v16 <= a4) {
      double v22 = -0.0;
    }
    -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1, 0.0, v22 + v21);
  }
  else
  {
    [(MonthScrollViewController *)self _buildFreshViews];
    [(MonthScrollViewController *)self _relayoutRingGroups];
    [(MonthScrollViewController *)self _reloadAllActivitySummariesFromCache];
    [(MonthScrollViewController *)self _reloadAllWorkoutsFromCache];
    if (v16 > a4)
    {
      [(UIScrollView *)self->_scrollView contentOffset];
      -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:");
      [(UIScrollView *)self->_scrollView contentOffset];
      self->_panAmount.y = v23;
    }
    uint64_t v24 = [(MonthScrollViewController *)self monthScrollDelegate];
    [v24 scrolledPastMonthWithDate:v25];
  }
}

- (void)_relayoutRingGroups
{
  if ([(NSMutableArray *)self->_ringGroups count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = [(NSMutableArray *)self->_ringGroups objectAtIndexedSubscript:v3];
      double v5 = (double)(v3 / 7);
      [(MonthScrollViewController *)self _heightOffsetForWeekRow:(uint64_t)v5];
      double v7 = v6;
      double v8 = +[UIScreen mainScreen];
      [v8 bounds];
      [v4 setBackingOriginOffset:v7 + (40.0 - v9) * 0.5];

      double v10 = [(NSMutableArray *)self->_weekViews objectAtIndex:(unint64_t)v5];
      [v10 heightForCellAtIndex:v3 % 7 oneTime:1];
      [v4 setAdditionalSpacing:];
      [v4 backingOriginOffset];
      [v4 additionalSpacing];
      [(MonthScrollViewController *)self _centerXForRingAt:v3 % 7 percent:0.0];
      [v4 setCenter:];

      ++v3;
    }
    while (v3 < (unint64_t)[(NSMutableArray *)self->_ringGroups count]);
  }
  ringsView = self->_ringsView;

  [(ARUIRingsView *)ringsView setNeedsDisplay];
}

- (void)_readjustRings
{
  ringGroups = self->_ringGroups;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10012FADC;
  v3[3] = &unk_1008ACF88;
  v3[4] = self;
  [(NSMutableArray *)ringGroups enumerateObjectsUsingBlock:v3];
}

- (void)_readjustScrollViewToOffset:(double)a3 weekOffset:(double)a4
{
  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", 0.0, a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v6 = self->_weekViews;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v11 frame:v12];
        [v11 setFrame:];
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  self->_incrementAmount = self->_incrementAmount + a4;
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  self->_scrollViewAdjustedToBottom = 0;
  id v4 = +[NSDate date];
  double v5 = [(MonthScrollViewController *)self view];
  [v5 bounds];
  [(MonthScrollViewController *)self scrollToDate:v4 windowHeight:v6];

  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  p_panAmount = &self->_panAmount;
  [(UIScrollView *)self->_scrollView contentOffset];
  p_panAmount->x = v5;
  p_panAmount->y = v6;
  [(UIScrollView *)self->_scrollView contentOffset];
  double v8 = v7;
  uint64_t v9 = [(MonthScrollViewController *)self view];
  [v9 bounds];
  double v11 = v10;

  long long v12 = [(MonthScrollViewController *)self view];
  long long v13 = [v12 safeAreaLayoutGuide];
  [v13 layoutFrame];
  double MaxY = CGRectGetMaxY(v36);

  double v15 = v11 - MaxY;
  [(MonthWeekView *)self->_lastVisibleWeek frame];
  double v16 = CGRectGetMaxY(v37) - p_panAmount->y;
  double v17 = v11 - v15;
  if (self->_lastVisibleWeek) {
    BOOL v18 = v16 < v17;
  }
  else {
    BOOL v18 = 0;
  }
  if (v18 && !self->_scrollViewAdjustedToBottom)
  {
    self->_scrollViewAdjustedToBottom = 1;
    [(UIScrollView *)self->_scrollView contentSize];
    double v20 = v19 + -128.0;
    [(MonthWeekView *)self->_lastVisibleWeek frame];
    double v22 = v20 - v21;
    [(MonthWeekView *)self->_lastVisibleWeek frame];
    [(MonthScrollViewController *)self _readjustScrollViewToOffset:128.0 weekOffset:v22 - v23 - v15];
  }
  if (fabs(v8 + -64.0) > 32.0 && (!self->_lastVisibleWeek || v16 > v17 || !self->_scrollViewAdjustedToBottom))
  {
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", 0.0, 64.0);
    self->_scrollViewAdjustedToBottom = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v24 = self->_weekViews;
    id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v32;
      double v28 = 64.0 - fabs(v8);
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          v30 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          [v30 frame:v31];
          [v30 setFrame:];
        }
        id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v26);
    }
    else
    {
      double v28 = 64.0 - fabs(v8);
    }

    self->_incrementAmount = v28 + self->_incrementAmount;
    [(MonthScrollViewController *)self _addAndRearrangeWeekviewsAndGroups];
  }
  [(MonthScrollViewController *)self _findCenteredWeekAndUpdateTitleIfNecessary];
  [(MonthScrollViewController *)self _readjustRings];
}

- (void)_findCenteredWeekAndUpdateTitleIfNecessary
{
  unint64_t v3 = [(MonthScrollViewController *)self monthScrollDelegate];

  if (v3)
  {
    id v4 = [(MonthScrollViewController *)self view];
    [v4 frame];
    double v6 = v5;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    double v7 = self->_weekViews;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v8)
    {
      id v9 = v8;
      double v10 = v6 * 0.5;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v7);
          }
          long long v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          scrollView = self->_scrollView;
          [v13 frame:v34];
          double v16 = v15;
          double v18 = v17;
          double v20 = v19;
          double v22 = v21;
          double v23 = [(MonthScrollViewController *)self view];
          -[UIScrollView convertRect:toView:](scrollView, "convertRect:toView:", v23, v16, v18, v20, v22);
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          CGFloat v29 = v28;
          CGFloat v31 = v30;

          v39.origin.x = v25;
          v39.origin.y = v27;
          v39.size.width = v29;
          v39.size.height = v31;
          if (CGRectGetMinY(v39) < v10)
          {
            v40.origin.x = v25;
            v40.origin.y = v27;
            v40.size.width = v29;
            v40.size.height = v31;
            if (CGRectGetMaxY(v40) > v10)
            {
              long long v32 = [(MonthScrollViewController *)self monthScrollDelegate];
              long long v33 = [v13 currentWeekStartDate];
              [v32 scrolledPastMonthWithDate:v33];
            }
          }
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v9);
    }
  }
}

- (double)_heightOffsetForWeekRow:(int64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_weekViews;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    double v9 = 0.0;
LABEL_3:
    uint64_t v10 = 0;
    if (v7 <= a3) {
      int64_t v11 = a3;
    }
    else {
      int64_t v11 = v7;
    }
    int64_t v12 = v7 - v11;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v4);
      }
      if (!(v12 + v10)) {
        break;
      }
      [*(id *)(*((void *)&v15 + 1) + 8 * v10) preferredHeight:v15];
      double v9 = v9 + v13;
      if (v6 == (id)++v10)
      {
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v7 += v10;
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (void)_addAndRearrangeWeekviewsAndGroups
{
  id v22 = [(NSMutableArray *)self->_weekViews firstObject];
  unint64_t v3 = [(NSMutableArray *)self->_weekViews lastObject];
  id v4 = (char *)[(NSMutableArray *)self->_ringGroups count];
  uint64_t v5 = HKDaysInAWeek;
  id v6 = &v4[-HKDaysInAWeek];
  [v22 frame];
  if (v7 <= 0.0)
  {
    [v3 frame];
    double v15 = v14;
    long long v16 = [(MonthScrollViewController *)self view];
    [v16 frame];
    double v18 = v17;
    [v3 frame];
    double v20 = v18 + v19;

    if (v15 >= v20) {
      goto LABEL_6;
    }
    uint64_t v10 = (char *)[(NSMutableArray *)self->_weekViews count] - 1;
    LOBYTE(v21) = 1;
    double v9 = self;
    uint64_t v8 = 0;
    int64_t v11 = 0;
    uint64_t v12 = v5;
    double v13 = v6;
  }
  else
  {
    uint64_t v8 = (char *)[(NSMutableArray *)self->_weekViews count] - 1;
    LOBYTE(v21) = 0;
    double v9 = self;
    uint64_t v10 = 0;
    int64_t v11 = v6;
    uint64_t v12 = v5;
    double v13 = 0;
  }
  -[MonthScrollViewController _readjustFrom:to:fromGroupRange:toGroupRange:down:](v9, "_readjustFrom:to:fromGroupRange:toGroupRange:down:", v10, v8, v11, v12, v13, v5, v21);
LABEL_6:
}

- (void)_readjustFrom:(unint64_t)a3 to:(unint64_t)a4 fromGroupRange:(_NSRange)a5 toGroupRange:(_NSRange)a6 down:(BOOL)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v46 = [(NSMutableArray *)self->_weekViews lastObject];
  uint64_t v12 = [(NSMutableArray *)self->_weekViews objectAtIndexedSubscript:a3];
  double v13 = [(NSMutableArray *)self->_weekViews objectAtIndexedSubscript:a4];
  ringGroups = self->_ringGroups;
  unint64_t v43 = a3;
  NSUInteger v44 = length;
  if (a7)
  {
    double v15 = [(NSMutableArray *)ringGroups lastObject];
    [v15 backingOriginOffset];
    double v17 = v16;

    [(NSMutableArray *)self->_weekViews removeObjectAtIndex:a4];
    double v18 = v12;
    double v19 = [v12 nextWeekStartDate];
    -[MonthWeekView setMonthWeekStart:](v13, "setMonthWeekStart:");
    if (self->_lastVisibleWeek || ![(MonthScrollViewController *)self _isLastVisibleWeek:v13]) {
      goto LABEL_8;
    }
    double v20 = v13;
    lastVisibleWeek = self->_lastVisibleWeek;
    self->_lastVisibleWeek = v20;
  }
  else
  {
    id v22 = [(NSMutableArray *)ringGroups firstObject];
    [v22 backingOriginOffset];
    double v17 = v23;

    [(NSMutableArray *)self->_weekViews removeObjectAtIndex:a4];
    double v18 = v12;
    double v19 = [v12 previousWeekStartDate];
    -[MonthWeekView setMonthWeekStart:](v13, "setMonthWeekStart:");
    if (v13 != self->_lastVisibleWeek) {
      goto LABEL_8;
    }
    self->_lastVisibleWeek = 0;
    lastVisibleWeek = v13;
  }

LABEL_8:
  double v24 = v18;
  [v18 frame];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  [(MonthWeekView *)v13 preferredHeight];
  double v32 = v31;
  if (a7)
  {
    [v18 frame];
  }
  else
  {
    [(MonthWeekView *)v13 preferredHeight];
    double v33 = -v34;
  }
  -[MonthWeekView setFrame:](v13, "setFrame:", v26, v28 + v33, v30, v32);
  [(NSMutableArray *)self->_weekViews insertObject:v13 atIndex:v43];
  if (a7)
  {
    [v46 frame];
  }
  else
  {
    [v46 preferredHeight];
    double v35 = -v36;
  }
  double v37 = v17 + v35;
  v38 = -[NSMutableArray subarrayWithRange:](self->_ringGroups, "subarrayWithRange:", a5.location, a5.length);
  -[NSMutableArray removeObjectsInRange:](self->_ringGroups, "removeObjectsInRange:", a5.location, a5.length);
  CGRect v39 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", location, v44);
  [(NSMutableArray *)self->_ringGroups insertObjects:v38 atIndexes:v39];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10013080C;
  v47[3] = &unk_1008ACFB0;
  BOOL v50 = a7;
  v47[4] = self;
  double v49 = v37;
  CGRect v40 = v13;
  v48 = v40;
  [v38 enumerateObjectsUsingBlock:v47];
  [(MonthScrollViewController *)self _loadWorkoutsForWeek:v40];
  if (a7)
  {
    uint64_t v41 = HKDaysInAWeek;
    uint64_t v42 = ((uint64_t)[(NSMutableArray *)self->_weekViews count] - 1) * v41;
  }
  else
  {
    uint64_t v42 = 0;
  }
  [(MonthScrollViewController *)self _loadActivitySummariesForWeek:v40 ringGroupIndex:v42];
}

- (id)weekWithStartDate:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_weekViews;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 currentWeekStartDate];
        unsigned __int8 v11 = [v10 isEqualToDate:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (double)_centerXForRingAt:(int64_t)a3 percent:(double)a4
{
  uint64_t v7 = [(MonthScrollViewController *)self view];
  [v7 frame];
  double v9 = (40.0 - v8) * 0.5;

  uint64_t v10 = [(MonthScrollViewController *)self view];
  [v10 centerXForElementAt:a3 % 7 width:40.0 percent:a4];
  double v12 = v11;

  return v9 + v12 + 40.0 * -0.5 * a4;
}

- (void)week:(id)a3 pressedOnDay:(int64_t)a4 down:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = [(NSMutableArray *)self->_weekViews indexOfObject:a3];
  unint64_t v9 = a4 + HKDaysInAWeek * (void)v8;
  if ((v9 & 0x8000000000000000) == 0 && v9 < (unint64_t)[(NSMutableArray *)self->_ringGroups count])
  {
    uint64_t v10 = [(NSMutableArray *)self->_ringGroups objectAtIndexedSubscript:v9];
    pressedRingGroup = self->_pressedRingGroup;
    self->_pressedRingGroup = v10;

    [(MonthScrollViewController *)self _animateRingOnTouch:v5 completion:0];
  }
}

- (void)_animateRingOnTouch:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  LODWORD(v8) = 1064178811;
  if (!v4) {
    *(float *)&double v8 = 1.0;
  }
  unint64_t v9 = +[ARUIFloatPropertyAnimation animationWithEndingFloatValue:v7 duration:v6 timingFunction:v8 completion:0.2];

  uint64_t v10 = [v9 _endValue];
  [v10 floatValue];
  int v12 = v11;

  [v9 duration];
  double v14 = v13;
  LODWORD(v17) = v12;
  long long v15 = [v9 completionHandler:_NSConcreteStackBlock, 3221225472, sub_100130D60, &unk_1008ACFD8, self, v17];
  +[ARUIRingGroup animateWithDuration:&v16 animations:0 curve:v15 completion:v14];
}

- (void)week:(id)a3 cellSelected:(id)a4
{
  BOOL v5 = [a4 date];
  _HKInitializeLogging();
  id v6 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MSVC] Cell selected: %@", buf, 0xCu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100130EA8;
  v8[3] = &unk_1008ABB38;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(MonthScrollViewController *)self _animateRingOnTouch:0 completion:v8];
}

- (void)_reloadAllWorkoutsFromCache
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v3 = self->_weekViews;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[MonthScrollViewController _loadWorkoutsForWeek:](self, "_loadWorkoutsForWeek:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_reloadAllActivitySummariesFromCache
{
  weekViews = self->_weekViews;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10013109C;
  v3[3] = &unk_1008AD000;
  v3[4] = self;
  [(NSMutableArray *)weekViews enumerateObjectsUsingBlock:v3];
}

- (void)_loadActivitySummariesForWeek:(id)a3 ringGroupIndex:(unint64_t)a4
{
  uint64_t v6 = [a3 summaryIndexes];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100131150;
  v7[3] = &unk_1008AD028;
  v7[4] = self;
  v7[5] = a4;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (void)_loadWorkoutsForWeek:(id)a3
{
  id v4 = a3;
  id v5 = [v4 summaryIndexes];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001312F8;
  v7[3] = &unk_1008AD050;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (FitMonthWeekViewDatasource)monthWeekDatasource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_monthWeekDatasource);

  return (FitMonthWeekViewDatasource *)WeakRetained;
}

- (void)setMonthWeekDatasource:(id)a3
{
}

- (MonthScrollViewDelegate)monthScrollDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_monthScrollDelegate);

  return (MonthScrollViewDelegate *)WeakRetained;
}

- (void)setMonthScrollDelegate:(id)a3
{
}

- (NSMutableArray)weekViews
{
  return self->_weekViews;
}

- (void)setWeekViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekViews, 0);
  objc_destroyWeak((id *)&self->_monthScrollDelegate);
  objc_destroyWeak((id *)&self->_monthWeekDatasource);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_storeStrong((id *)&self->_workoutsDataProvider, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_summaryCache, 0);
  objc_storeStrong((id *)&self->_workoutCache, 0);
  objc_storeStrong((id *)&self->_lastVisibleWeekDate, 0);
  objc_storeStrong((id *)&self->_lastVisibleWeek, 0);
  objc_storeStrong((id *)&self->_pressedRingGroup, 0);
  objc_storeStrong((id *)&self->_ringGroups, 0);

  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end