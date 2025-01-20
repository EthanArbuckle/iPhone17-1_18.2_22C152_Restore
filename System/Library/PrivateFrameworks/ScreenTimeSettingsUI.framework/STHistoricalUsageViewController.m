@interface STHistoricalUsageViewController
+ (id)historicalUsageViewControllerOfType:(unint64_t)a3 graphHeight:(double)a4;
- (NSLayoutConstraint)dayGraphContainerHeightConstraint;
- (NSLayoutConstraint)weekGraphContainerHeightConstraint;
- (STUsageDetailsViewModelCoordinator)coordinator;
- (STUsageGraphViewController)selectedDayGraphViewController;
- (STUsageGraphViewController)selectedWeekGraphViewController;
- (STUsageSummaryTitleView)titleView;
- (UIPageViewController)dayGraphPageViewController;
- (UIPageViewController)weekGraphPageViewController;
- (UIView)dayGraphContainerView;
- (UIView)weekGraphContainerView;
- (double)graphHeight;
- (double)maximumYAxisLabelWidth;
- (id)_dataSetFromUsageReport:(id)a3;
- (id)_dayGraphViewControllerForDay:(unint64_t)a3 week:(unint64_t)a4 usageReport:(id)a5;
- (id)_nextGraphViewControllerForPageViewController:(id)a3 currentGraphViewController:(id)a4 direction:(int64_t)a5;
- (id)_weekGraphViewControllerForWeek:(unint64_t)a3 usageReport:(id)a4;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (int64_t)currentViewMode;
- (unint64_t)type;
- (void)_selectedBarViewDidChangeFrom:(id)a3 to:(id)a4;
- (void)_selectedDayUsageReportDidChangeFrom:(id)a3 to:(id)a4;
- (void)_selectedWeekUsageReportDidChange:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)setCoordinator:(id)a3;
- (void)setCurrentViewMode:(int64_t)a3;
- (void)setDayGraphContainerHeightConstraint:(id)a3;
- (void)setDayGraphContainerView:(id)a3;
- (void)setDayGraphPageViewController:(id)a3;
- (void)setMaximumYAxisLabelWidth:(double)a3;
- (void)setSelectedDayGraphViewController:(id)a3;
- (void)setSelectedWeekGraphViewController:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setWeekGraphContainerHeightConstraint:(id)a3;
- (void)setWeekGraphContainerView:(id)a3;
- (void)setWeekGraphPageViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation STHistoricalUsageViewController

+ (id)historicalUsageViewControllerOfType:(unint64_t)a3 graphHeight:(double)a4
{
  v6 = (void *)MEMORY[0x263F82C28];
  v7 = +[STScreenTimeSettingsUIBundle bundle];
  v8 = [v6 storyboardWithName:@"HistoricalUsage" bundle:v7];

  uint64_t v9 = [v8 instantiateInitialViewController];
  *(void *)(v9 + 1000) = a3;
  *(double *)(v9 + 1008) = a4;

  return (id)v9;
}

- (void)dealloc
{
  [(STUsageDetailsViewModelCoordinator *)self->_coordinator removeObserver:self forKeyPath:@"viewModel.selectedWeekUsageReport" context:"KVOContextHistoricalUsageViewController"];
  [(STUsageDetailsViewModelCoordinator *)self->_coordinator removeObserver:self forKeyPath:@"viewModel.selectedDayUsageReport" context:"KVOContextHistoricalUsageViewController"];
  [(STUsageDetailsViewModelCoordinator *)self->_coordinator removeObserver:self forKeyPath:@"viewModel.selectedCoreDuetIdentifier" context:"KVOContextHistoricalUsageViewController"];
  [(STUsageGraphViewController *)self->_selectedWeekGraphViewController removeObserver:self forKeyPath:@"selectedBarView" context:"KVOContextHistoricalUsageViewController"];
  v3.receiver = self;
  v3.super_class = (Class)STHistoricalUsageViewController;
  [(STHistoricalUsageViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)STHistoricalUsageViewController;
  [(STHistoricalUsageViewController *)&v10 viewDidLoad];
  unint64_t v3 = [(STHistoricalUsageViewController *)self type];
  v4 = [(STHistoricalUsageViewController *)self titleView];
  [v4 setUsageItemType:v3];

  v5 = [(STHistoricalUsageViewController *)self coordinator];
  v6 = [v5 viewModel];

  if (v6)
  {
    v7 = [v6 selectedWeekUsageReport];
    [(STHistoricalUsageViewController *)self _selectedWeekUsageReportDidChange:v7];

    v8 = [v6 selectedDayUsageReport];
    [(STHistoricalUsageViewController *)self _selectedDayUsageReportDidChangeFrom:0 to:v8];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STHistoricalUsageViewController.viewDidLoad", v9, 2u);
  }
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v7 = a3;
  v5 = [v7 identifier];
  if ([v5 isEqualToString:@"WeekGraph"])
  {
    v6 = [v7 destinationViewController];
    [v6 setDataSource:self];
    [v6 setDelegate:self];
    [(STHistoricalUsageViewController *)self setWeekGraphPageViewController:v6];
  }
  else
  {
    if (![v5 isEqualToString:@"DayGraph"]) {
      goto LABEL_6;
    }
    v6 = [v7 destinationViewController];
    [v6 setDataSource:self];
    [v6 setDelegate:self];
    [(STHistoricalUsageViewController *)self setDayGraphPageViewController:v6];
  }

LABEL_6:
}

- (void)setCoordinator:(id)a3
{
  v5 = (STUsageDetailsViewModelCoordinator *)a3;
  p_coordinator = &self->_coordinator;
  coordinator = self->_coordinator;
  if (coordinator != v5)
  {
    v12 = v5;
    coordinator = (STUsageDetailsViewModelCoordinator *)[(STUsageDetailsViewModelCoordinator *)coordinator isEqual:v5];
    v5 = v12;
    if ((coordinator & 1) == 0)
    {
      [(STUsageDetailsViewModelCoordinator *)*p_coordinator removeObserver:self forKeyPath:@"viewModel.selectedWeekUsageReport" context:"KVOContextHistoricalUsageViewController"];
      [(STUsageDetailsViewModelCoordinator *)*p_coordinator removeObserver:self forKeyPath:@"viewModel.selectedDayUsageReport" context:"KVOContextHistoricalUsageViewController"];
      [(STUsageDetailsViewModelCoordinator *)*p_coordinator removeObserver:self forKeyPath:@"viewModel.selectedCoreDuetIdentifier" context:"KVOContextHistoricalUsageViewController"];
      v8 = [(STUsageDetailsViewModelCoordinator *)*p_coordinator viewModel];
      uint64_t v9 = [v8 selectedDayUsageReport];

      objc_storeStrong((id *)&self->_coordinator, a3);
      objc_super v10 = [(STUsageDetailsViewModelCoordinator *)v12 viewModel];
      v11 = [v10 selectedDayUsageReport];

      [(STUsageDetailsViewModelCoordinator *)v12 addObserver:self forKeyPath:@"viewModel.selectedWeekUsageReport" options:5 context:"KVOContextHistoricalUsageViewController"];
      [(STHistoricalUsageViewController *)self _selectedDayUsageReportDidChangeFrom:v9 to:v11];
      [(STUsageDetailsViewModelCoordinator *)v12 addObserver:self forKeyPath:@"viewModel.selectedDayUsageReport" options:3 context:"KVOContextHistoricalUsageViewController"];
      [(STUsageDetailsViewModelCoordinator *)v12 addObserver:self forKeyPath:@"viewModel.selectedCoreDuetIdentifier" options:3 context:"KVOContextHistoricalUsageViewController"];

      v5 = v12;
    }
  }

  MEMORY[0x270F9A758](coordinator, v5);
}

- (void)setSelectedWeekGraphViewController:(id)a3
{
  v4 = (STUsageGraphViewController *)a3;
  [(STUsageGraphViewController *)self->_selectedWeekGraphViewController removeObserver:self forKeyPath:@"selectedBarView" context:"KVOContextHistoricalUsageViewController"];
  selectedWeekGraphViewController = self->_selectedWeekGraphViewController;
  self->_selectedWeekGraphViewController = v4;
  v6 = v4;

  [(STUsageGraphViewController *)v6 addObserver:self forKeyPath:@"selectedBarView" options:3 context:"KVOContextHistoricalUsageViewController"];
}

- (void)setMaximumYAxisLabelWidth:(double)a3
{
  self->_maximumYAxisLabelWidth = a3;
  v5 = [(STHistoricalUsageViewController *)self selectedWeekGraphViewController];
  [v5 setYAxisLabelSectionWidth:a3];

  id v6 = [(STHistoricalUsageViewController *)self selectedDayGraphViewController];
  [v6 setYAxisLabelSectionWidth:a3];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextHistoricalUsageViewController")
  {
    [(STHistoricalUsageViewController *)self coordinator];

    if ([v10 isEqualToString:@"viewModel.selectedCoreDuetIdentifier"])
    {
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v14 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v14)
      {

        v12 = 0;
      }
      v15 = [MEMORY[0x263EFF9D0] null];

      if (v13 == v15)
      {

        v13 = 0;
      }
      if (v12 != v13 && ([v12 isEqual:v13] & 1) == 0)
      {
        [(STHistoricalUsageViewController *)self setSelectedWeekGraphViewController:0];
        [(STHistoricalUsageViewController *)self setSelectedDayGraphViewController:0];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v23 = v12;
          __int16 v24 = 2114;
          v25 = v13;
          _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STHistoricalUsageViewController selectedCoreDuetIdentifier change %{public}@ %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      [(STHistoricalUsageViewController *)self coordinator];

      if ([v10 isEqualToString:@"viewModel.selectedWeekUsageReport"])
      {
        v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        v16 = [MEMORY[0x263EFF9D0] null];

        if (v12 == v16)
        {

          v12 = 0;
        }
        [(STHistoricalUsageViewController *)self _selectedWeekUsageReportDidChange:v12];
        goto LABEL_29;
      }
      [(STHistoricalUsageViewController *)self coordinator];

      if ([v10 isEqualToString:@"viewModel.selectedDayUsageReport"])
      {
        v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        v17 = [MEMORY[0x263EFF9D0] null];

        if (v12 == v17)
        {

          v12 = 0;
        }
        v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        v18 = [MEMORY[0x263EFF9D0] null];

        if (v13 == v18)
        {

          v13 = 0;
        }
        [(STHistoricalUsageViewController *)self _selectedDayUsageReportDidChangeFrom:v12 to:v13];
      }
      else
      {
        if (![v10 isEqualToString:@"selectedBarView"]) {
          goto LABEL_30;
        }
        v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        v19 = [MEMORY[0x263EFF9D0] null];

        if (v12 == v19)
        {

          v12 = 0;
        }
        v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        v20 = [MEMORY[0x263EFF9D0] null];

        if (v13 == v20)
        {

          v13 = 0;
        }
        [(STHistoricalUsageViewController *)self _selectedBarViewDidChangeFrom:v12 to:v13];
      }
    }

LABEL_29:
    goto LABEL_30;
  }
  v21.receiver = self;
  v21.super_class = (Class)STHistoricalUsageViewController;
  [(STHistoricalUsageViewController *)&v21 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_30:
}

- (void)_selectedWeekUsageReportDidChange:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(STHistoricalUsageViewController *)self isViewLoaded];
  if (v4 && v5)
  {
    id v6 = [(STHistoricalUsageViewController *)self selectedWeekGraphViewController];
    id v7 = v6;
    if (v6) {
      unint64_t v8 = [v6 week];
    }
    else {
      unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v9 = [(STHistoricalUsageViewController *)self coordinator];
    id v10 = [v9 viewModel];

    if ([v10 selectedDay] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = [(STHistoricalUsageViewController *)self titleView];
      [v11 setUsageReport:v4];
    }
    unint64_t v12 = [v10 selectedWeek];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 != v12)
    {
      BOOL v15 = v12 > v8;
      v14 = [(STHistoricalUsageViewController *)self _weekGraphViewControllerForWeek:v12 usageReport:v4];

      [(STHistoricalUsageViewController *)self setSelectedWeekGraphViewController:v14];
      v16 = [(STHistoricalUsageViewController *)self weekGraphPageViewController];
      v19[0] = v14;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
      [v16 setViewControllers:v17 direction:v15 animated:v8 != 0x7FFFFFFFFFFFFFFFLL completion:0];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        v18[0] = 67109120;
        v18[1] = v8 == 0x7FFFFFFFFFFFFFFFLL;
        _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STHistoricalUsageViewController _selectedWeekUsageReportDidChange setViewControllers, isInitialLoad : %d", (uint8_t *)v18, 8u);
      }
    }
    else
    {
      v13 = [(STHistoricalUsageViewController *)self _dataSetFromUsageReport:v4];
      [v7 setDataSet:v13 animated:1];

      v14 = v7;
    }
    objc_msgSend(v14, "setSelectedWeekday:", objc_msgSend(v10, "selectedDay"));
  }
}

- (void)_selectedDayUsageReportDidChangeFrom:(id)a3 to:(id)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(STHistoricalUsageViewController *)self isViewLoaded]
    && ([v6 isEqual:v7] & 1) == 0)
  {
    unint64_t v8 = [(STHistoricalUsageViewController *)self selectedDayGraphViewController];
    if (!v7)
    {
LABEL_14:
      v27 = [(STHistoricalUsageViewController *)self dayGraphContainerView];
      [v27 setHidden:v7 == 0];

      [(STHistoricalUsageViewController *)self setCurrentViewMode:v7 != 0];
      [(STHistoricalUsageViewController *)self setSelectedDayGraphViewController:v8];

      goto LABEL_15;
    }
    uint64_t v9 = [(STHistoricalUsageViewController *)self titleView];
    [v9 setUsageReport:v7];

    id v10 = [(STHistoricalUsageViewController *)self coordinator];
    id v11 = [v10 viewModel];

    uint64_t v12 = [v11 selectedDay];
    unint64_t v13 = [v11 selectedWeek];
    if (v8)
    {
      uint64_t v14 = [v8 day];
      uint64_t v15 = [v8 week];
      if (v15 == v13)
      {
        [v8 setWeek:v13];
        [v8 setDay:v12];
        v16 = [(STHistoricalUsageViewController *)self _dataSetFromUsageReport:v7];
        [v8 setDataSet:v16 animated:1];
        [(STHistoricalUsageViewController *)self maximumYAxisLabelWidth];
        double v18 = v17;
        [v8 maximumYAxisLabelWidth];
        if (v18 >= v19) {
          double v19 = v18;
        }
        [(STHistoricalUsageViewController *)self setMaximumYAxisLabelWidth:v19];

        if (v14 == v12) {
          goto LABEL_13;
        }
        uint64_t v20 = 0;
        unint64_t v21 = v13;
      }
      else
      {
        unint64_t v21 = v15;
        uint64_t v22 = [(STHistoricalUsageViewController *)self _dayGraphViewControllerForDay:v12 week:v13 usageReport:v7];

        uint64_t v20 = 1;
        unint64_t v8 = (void *)v22;
      }
    }
    else
    {
      unint64_t v8 = [(STHistoricalUsageViewController *)self _dayGraphViewControllerForDay:v12 week:v13 usageReport:v7];
      unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v20 = 1;
    }
    BOOL v23 = v13 > v21;
    __int16 v24 = [(STHistoricalUsageViewController *)self dayGraphPageViewController];
    v28[0] = v8;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    [v24 setViewControllers:v25 direction:v23 animated:v20 completion:0];

LABEL_13:
    uint64_t v26 = [(STHistoricalUsageViewController *)self selectedWeekGraphViewController];
    [v26 setSelectedWeekday:v12];

    goto LABEL_14;
  }
LABEL_15:
}

- (void)_selectedBarViewDidChangeFrom:(id)a3 to:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14 != v6 && ([v14 isEqual:v6] & 1) == 0)
  {
    id v7 = [(STHistoricalUsageViewController *)self coordinator];
    unint64_t v8 = v7;
    if (v6)
    {
      uint64_t v9 = [MEMORY[0x263EFF8F0] currentCalendar];
      id v10 = [v6 dataPoint];
      id v11 = [v10 date];
      uint64_t v12 = [v9 component:512 fromDate:v11];
      unint64_t v13 = [v8 viewModel];
      [v13 setSelectedDay:v12];
    }
    else
    {
      uint64_t v9 = [v7 viewModel];
      [v9 setSelectedDay:0x7FFFFFFFFFFFFFFFLL];
    }
  }
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"STHistoricalUsageViewController.m", 305, @"Invalid parameter not satisfying: %@", @"[viewController isKindOfClass:[STUsageGraphViewController class]]" object file lineNumber description];
  }
  uint64_t v9 = [(STHistoricalUsageViewController *)self _nextGraphViewControllerForPageViewController:v7 currentGraphViewController:v8 direction:1];

  return v9;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"STHistoricalUsageViewController.m", 310, @"Invalid parameter not satisfying: %@", @"[viewController isKindOfClass:[STUsageGraphViewController class]]" object file lineNumber description];
  }
  uint64_t v9 = [(STHistoricalUsageViewController *)self _nextGraphViewControllerForPageViewController:v7 currentGraphViewController:v8 direction:0];

  return v9;
}

- (id)_nextGraphViewControllerForPageViewController:(id)a3 currentGraphViewController:(id)a4 direction:(int64_t)a5
{
  id v7 = a3;
  id v8 = [(STHistoricalUsageViewController *)self weekGraphPageViewController];
  int v9 = [v7 isEqual:v8];

  if (!v9)
  {
    double v19 = [(STHistoricalUsageViewController *)self dayGraphPageViewController];
    int v20 = [v7 isEqual:v19];

    if (!v20)
    {
      double v18 = 0;
      goto LABEL_40;
    }
    v16 = [(STHistoricalUsageViewController *)self selectedDayGraphViewController];
    uint64_t v21 = [v16 week];
    uint64_t v22 = [v16 day];
    double v17 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v23 = [v17 maximumRangeOfUnit:512];
    uint64_t v25 = v24 + v23 - 1;
    uint64_t v26 = [v17 firstWeekday];
    uint64_t v27 = v26 - 1;
    if (v26 == v23) {
      uint64_t v27 = v25;
    }
    if (v22 == v25) {
      uint64_t v28 = v23;
    }
    else {
      uint64_t v28 = v22 + 1;
    }
    uint64_t v29 = v21 - (v22 == v27);
    uint64_t v30 = v22 - 1;
    if (v22 == v23) {
      uint64_t v30 = v25;
    }
    if (v22 == v26) {
      uint64_t v31 = v21 + 1;
    }
    else {
      uint64_t v31 = v21;
    }
    if (a5 != 1)
    {
      uint64_t v30 = 0;
      uint64_t v31 = 0;
    }
    if (a5) {
      uint64_t v32 = v30;
    }
    else {
      uint64_t v32 = v28;
    }
    if (a5) {
      unint64_t v33 = v31;
    }
    else {
      unint64_t v33 = v29;
    }
    v34 = [(STHistoricalUsageViewController *)self coordinator];
    v35 = [v34 viewModel];

    v36 = [v35 weekUsageReports];
    unint64_t v37 = [v36 count];

    if (v33 >= v37)
    {
      double v18 = 0;
    }
    else
    {
      v42 = [v35 dayUsageReportByWeekdays];
      v38 = [v42 objectAtIndexedSubscript:v33];
      v39 = [NSNumber numberWithUnsignedInteger:v32];
      v40 = [v38 objectForKeyedSubscript:v39];

      if (v40)
      {
        double v18 = [(STHistoricalUsageViewController *)self _dayGraphViewControllerForDay:v32 week:v33 usageReport:v40];
      }
      else
      {
        double v18 = 0;
      }
    }
    goto LABEL_38;
  }
  id v10 = [(STHistoricalUsageViewController *)self selectedWeekGraphViewController];
  uint64_t v11 = [v10 week];

  if (a5 == 1) {
    unint64_t v12 = v11 + 1;
  }
  else {
    unint64_t v12 = 0;
  }
  if (a5) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v11 - 1;
  }
  id v14 = [(STHistoricalUsageViewController *)self coordinator];
  uint64_t v15 = [v14 viewModel];
  v16 = [v15 weekUsageReports];

  if (v13 < [v16 count])
  {
    double v17 = [v16 objectAtIndexedSubscript:v13];
    double v18 = [(STHistoricalUsageViewController *)self _weekGraphViewControllerForWeek:v13 usageReport:v17];
LABEL_38:

    goto LABEL_39;
  }
  double v18 = 0;
LABEL_39:

LABEL_40:

  return v18;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  id v8 = [v7 objectAtIndexedSubscript:0];
  uint64_t v9 = [v7 count];

  if (v9 != 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"STHistoricalUsageViewController.m", 374, @"Invalid parameter not satisfying: %@", @"(pendingViewControllers.count == 1) && [pendingGraphViewController isKindOfClass:[STUsageGraphViewController class]]" object file lineNumber description];
  }
  id v10 = [(STHistoricalUsageViewController *)self weekGraphPageViewController];
  int v11 = [v15 isEqual:v10];

  if (v11)
  {
    [(STHistoricalUsageViewController *)self setSelectedWeekGraphViewController:v8];
  }
  else
  {
    unint64_t v12 = [(STHistoricalUsageViewController *)self dayGraphPageViewController];
    int v13 = [v15 isEqual:v12];

    if (v13) {
      [(STHistoricalUsageViewController *)self setSelectedDayGraphViewController:v8];
    }
  }
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  BOOL v6 = a6;
  id v23 = a3;
  id v10 = a5;
  int v11 = [v10 firstObject];
  uint64_t v12 = [v10 count];

  if (v12 != 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"STHistoricalUsageViewController.m", 384, @"Invalid parameter not satisfying: %@", @"(previousViewControllers.count == 1) && [previousGraphViewController isKindOfClass:[STUsageGraphViewController class]]" object file lineNumber description];
  }
  int v13 = [(STHistoricalUsageViewController *)self weekGraphPageViewController];
  int v14 = [v23 isEqual:v13];

  if (v14)
  {
    if (v6)
    {
      id v15 = [(STHistoricalUsageViewController *)self selectedWeekGraphViewController];
      uint64_t v16 = [v15 week];
      double v17 = [(STHistoricalUsageViewController *)self coordinator];
      double v18 = [v17 viewModel];
      [v18 setSelectedWeek:v16];

LABEL_9:
      goto LABEL_12;
    }
    [(STHistoricalUsageViewController *)self setSelectedWeekGraphViewController:v11];
  }
  else
  {
    double v19 = [(STHistoricalUsageViewController *)self dayGraphPageViewController];
    int v20 = [v23 isEqual:v19];

    if (!v20) {
      goto LABEL_12;
    }
    if (v6)
    {
      id v15 = [(STHistoricalUsageViewController *)self selectedDayGraphViewController];
      double v17 = [(STHistoricalUsageViewController *)self coordinator];
      uint64_t v21 = [v17 viewModel];
      objc_msgSend(v21, "setSelectedWeek:selectedDay:", objc_msgSend(v15, "week"), objc_msgSend(v15, "day"));

      goto LABEL_9;
    }
    [(STHistoricalUsageViewController *)self setSelectedDayGraphViewController:v11];
  }
LABEL_12:
}

- (id)_weekGraphViewControllerForWeek:(unint64_t)a3 usageReport:(id)a4
{
  id v6 = a4;
  id v7 = [STUsageGraphViewController alloc];
  [(STHistoricalUsageViewController *)self graphHeight];
  id v8 = -[STUsageGraphViewController initWithTitleView:graphHeight:includePaddle:useVibrancy:](v7, "initWithTitleView:graphHeight:includePaddle:useVibrancy:", 0, 0, 0);
  [(STUsageGraphViewController *)v8 setWeek:a3];
  uint64_t v9 = [(STHistoricalUsageViewController *)self _dataSetFromUsageReport:v6];

  [(STUsageGraphViewController *)v8 setDataSet:v9 animated:0];
  id v10 = [(STHistoricalUsageViewController *)self coordinator];
  int v11 = [v10 viewModel];
  -[STUsageGraphViewController setSelectedWeekday:](v8, "setSelectedWeekday:", [v11 selectedDay]);

  uint64_t v12 = [(STHistoricalUsageViewController *)self weekGraphContainerHeightConstraint];
  if (!v12)
  {
    int v13 = [(STUsageGraphViewController *)v8 view];
    objc_msgSend(v13, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
    double v15 = v14;

    uint64_t v16 = [(STHistoricalUsageViewController *)self weekGraphContainerView];
    double v17 = [v16 heightAnchor];
    uint64_t v12 = [v17 constraintEqualToConstant:v15];

    [v12 setActive:1];
    [(STHistoricalUsageViewController *)self setWeekGraphContainerHeightConstraint:v12];
  }
  [(STHistoricalUsageViewController *)self maximumYAxisLabelWidth];
  double v19 = v18;
  [(STUsageGraphViewController *)v8 maximumYAxisLabelWidth];
  if (v19 < v20) {
    double v19 = v20;
  }
  [(STHistoricalUsageViewController *)self setMaximumYAxisLabelWidth:v19];
  [(STUsageGraphViewController *)v8 setYAxisLabelSectionWidth:v19];

  return v8;
}

- (id)_dayGraphViewControllerForDay:(unint64_t)a3 week:(unint64_t)a4 usageReport:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [STUsageGraphViewController alloc];
  [(STHistoricalUsageViewController *)self graphHeight];
  id v10 = -[STUsageGraphViewController initWithTitleView:graphHeight:includePaddle:useVibrancy:](v9, "initWithTitleView:graphHeight:includePaddle:useVibrancy:", 0, 0, 0);
  [(STUsageGraphViewController *)v10 setWeek:a4];
  [(STUsageGraphViewController *)v10 setDay:a3];
  int v11 = [(STHistoricalUsageViewController *)self _dataSetFromUsageReport:v8];

  [(STUsageGraphViewController *)v10 setDataSet:v11 animated:0];
  uint64_t v12 = [(STHistoricalUsageViewController *)self dayGraphContainerHeightConstraint];
  if (!v12)
  {
    int v13 = [(STUsageGraphViewController *)v10 view];
    objc_msgSend(v13, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
    double v15 = v14;

    uint64_t v16 = [(STHistoricalUsageViewController *)self dayGraphContainerView];
    double v17 = [v16 heightAnchor];
    uint64_t v12 = [v17 constraintEqualToConstant:v15];

    [v12 setActive:1];
    [(STHistoricalUsageViewController *)self setDayGraphContainerHeightConstraint:v12];
  }
  [(STHistoricalUsageViewController *)self maximumYAxisLabelWidth];
  double v19 = v18;
  [(STUsageGraphViewController *)v10 maximumYAxisLabelWidth];
  if (v19 < v20) {
    double v19 = v20;
  }
  [(STHistoricalUsageViewController *)self setMaximumYAxisLabelWidth:v19];
  [(STUsageGraphViewController *)v10 setYAxisLabelSectionWidth:v19];

  return v10;
}

- (id)_dataSetFromUsageReport:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(STHistoricalUsageViewController *)self type];
  switch(v6)
  {
    case 1uLL:
      uint64_t v10 = [v5 categoryUsageDataSet];
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      unint64_t v7 = v6;
      id v8 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STHistoricalUsageViewController.m", 468, @"Unexpected type: %lu", v7);

      goto LABEL_3;
    case 5uLL:
      uint64_t v10 = [v5 notificationsDataSet];
      goto LABEL_7;
    case 6uLL:
      uint64_t v10 = [v5 pickupsDataSet];
LABEL_7:
      uint64_t v9 = (void *)v10;
      break;
    default:
LABEL_3:
      uint64_t v9 = 0;
      break;
  }

  return v9;
}

- (STUsageDetailsViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (STUsageSummaryTitleView)titleView
{
  return (STUsageSummaryTitleView *)objc_getProperty(self, a2, 984, 1);
}

- (void)setTitleView:(id)a3
{
}

- (int64_t)currentViewMode
{
  return self->_currentViewMode;
}

- (void)setCurrentViewMode:(int64_t)a3
{
  self->_currentViewMode = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)graphHeight
{
  return self->_graphHeight;
}

- (STUsageGraphViewController)selectedWeekGraphViewController
{
  return self->_selectedWeekGraphViewController;
}

- (STUsageGraphViewController)selectedDayGraphViewController
{
  return (STUsageGraphViewController *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setSelectedDayGraphViewController:(id)a3
{
}

- (UIPageViewController)weekGraphPageViewController
{
  return (UIPageViewController *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setWeekGraphPageViewController:(id)a3
{
}

- (UIPageViewController)dayGraphPageViewController
{
  return (UIPageViewController *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setDayGraphPageViewController:(id)a3
{
}

- (UIView)weekGraphContainerView
{
  return (UIView *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setWeekGraphContainerView:(id)a3
{
}

- (UIView)dayGraphContainerView
{
  return (UIView *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setDayGraphContainerView:(id)a3
{
}

- (NSLayoutConstraint)weekGraphContainerHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setWeekGraphContainerHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)dayGraphContainerHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setDayGraphContainerHeightConstraint:(id)a3
{
}

- (double)maximumYAxisLabelWidth
{
  return self->_maximumYAxisLabelWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayGraphContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_weekGraphContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_dayGraphContainerView, 0);
  objc_storeStrong((id *)&self->_weekGraphContainerView, 0);
  objc_storeStrong((id *)&self->_dayGraphPageViewController, 0);
  objc_storeStrong((id *)&self->_weekGraphPageViewController, 0);
  objc_storeStrong((id *)&self->_selectedDayGraphViewController, 0);
  objc_storeStrong((id *)&self->_selectedWeekGraphViewController, 0);
  objc_storeStrong((id *)&self->_titleView, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end