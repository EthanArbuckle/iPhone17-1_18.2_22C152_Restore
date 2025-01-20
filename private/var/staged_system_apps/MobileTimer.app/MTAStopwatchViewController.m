@interface MTAStopwatchViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldProcessUpdate;
- (BOOL)shouldUseRegularLayout;
- (CGSize)latestLayoutSize;
- (Class)tableCellClass;
- (MTAAnalogStopwatchView)analogStopwatch;
- (MTAStopwatchController)stopwatchController;
- (MTAStopwatchLapTableHeaderView)tableHeaderView;
- (MTAStopwatchLapTableViewController)lapTableController;
- (MTAStopwatchPagingViewController)pagingViewController;
- (MTAStopwatchViewController)init;
- (MTLegacyStopwatchMigrator)migrator;
- (MTStopwatchManager)stopwatchManager;
- (MTStopwatchViewModel)viewModel;
- (MTUITimeView)timeView;
- (NSArray)constraints;
- (NSLayoutConstraint)lapButtonTopConstraint;
- (NSLayoutConstraint)lapButtonWidthConstraint;
- (NSLayoutConstraint)startButtonTopConstraint;
- (NSLayoutConstraint)startButtonWidthConstraint;
- (UIImageView)lapButtonOccludingView;
- (UIImageView)startButtonOccludingView;
- (UIPageControl)pageControl;
- (UIView)analogStopwatchContainer;
- (UIView)digitalStopwatchContainer;
- (double)runningTotalForLap:(int64_t)a3;
- (id)defaultShortcutItem;
- (id)shortcutItemForCurrentState;
- (id)shortcutItemForMode:(unint64_t)a3;
- (id)startStopwatchShortcutItemForMode:(unint64_t)a3;
- (id)stopStopwatchShortcutItem;
- (void)_pageControlValueChanged:(id)a3;
- (void)_restoreIdleTimer;
- (void)dealloc;
- (void)didAddLap:(double)a3;
- (void)didLapLapTimer;
- (void)didPauseLapTimer;
- (void)didPauseStopwatch;
- (void)didResetLapTimer;
- (void)didResumeLapTimer;
- (void)didStartLapTimer;
- (void)didUpdateCurrentInterval:(double)a3 adjustedCurrentInterval:(double)a4 totalInterval:(double)a5 adjustedTotalInterval:(double)a6 isStopwatchRunning:(BOOL)a7 isStopwatchStopped:(BOOL)a8;
- (void)endDisplayUpdates;
- (void)handleContentSizeCategoryChange:(id)a3;
- (void)handleLapStopwatchShortcutAction;
- (void)handleLocaleChange;
- (void)handleResetStopwatchShortcutAction;
- (void)handleStartStopwatchShortcutAction;
- (void)handleStopStopwatchShortcutAction;
- (void)lapLapTimer;
- (void)lapLapTimerUI;
- (void)loadView;
- (void)pauseLapTimer;
- (void)pauseLapTimerUI;
- (void)reloadStopwatchesWithCompletion:(id)a3;
- (void)renderViewModel;
- (void)resetLapTimer;
- (void)resetLapTimerUI;
- (void)resumeLapTimer;
- (void)resumeLapTimerUI;
- (void)saveState;
- (void)setAnalogStopwatch:(id)a3;
- (void)setAnalogStopwatchContainer:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setDigitalStopwatchContainer:(id)a3;
- (void)setLapButtonOccludingView:(id)a3;
- (void)setLapButtonTopConstraint:(id)a3;
- (void)setLapButtonWidthConstraint:(id)a3;
- (void)setLapTableController:(id)a3;
- (void)setLatestLayoutSize:(CGSize)a3;
- (void)setMigrator:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPageControl:(id)a3;
- (void)setPagingViewController:(id)a3;
- (void)setStartButtonOccludingView:(id)a3;
- (void)setStartButtonTopConstraint:(id)a3;
- (void)setStartButtonWidthConstraint:(id)a3;
- (void)setStopwatchController:(id)a3;
- (void)setStopwatchManager:(id)a3;
- (void)setTableHeaderView:(id)a3;
- (void)setTimeView:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setupViewModelWithStopwatch:(id)a3;
- (void)startDisplayUpdates;
- (void)startLapTimer;
- (void)stopwatchPagingViewController:(id)a3 didPage:(unint64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateShortcutItemForCurrentState;
- (void)updateTimeViewFont;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTAStopwatchViewController

- (MTAStopwatchViewController)init
{
  v22.receiver = self;
  v22.super_class = (Class)MTAStopwatchViewController;
  v2 = [(MTAStopwatchViewController *)&v22 init];
  if (v2)
  {
    v3 = MTLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@ initialized", buf, 0xCu);
    }

    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    laps = v2->_laps;
    v2->_laps = v4;

    v6 = +[UIImage systemImageNamed:@"stopwatch.fill"];
    v7 = [(MTAStopwatchViewController *)v2 tabBarItem];
    [v7 setImage:v6];

    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"STOP_WATCH" value:&stru_1000A2560 table:0];
    [(MTAStopwatchViewController *)v2 setTitle:v9];

    [(MTAStopwatchViewController *)v2 setEdgesForExtendedLayout:5];
    v10 = [[MTAStopwatchLapTableViewController alloc] initWithStyle:0];
    [(MTAStopwatchViewController *)v2 setLapTableController:v10];

    v11 = [(MTAStopwatchViewController *)v2 lapTableController];
    [(MTAStopwatchViewController *)v2 addChildViewController:v11];

    v12 = [(MTAStopwatchViewController *)v2 title];
    uint64_t v13 = +[NSUserActivity mtUserActivityWithActivityType:@"com.apple.clock.stopwatch" title:v12];
    userActivity = v2->_userActivity;
    v2->_userActivity = (NSUserActivity *)v13;

    v15 = objc_opt_new();
    [(MTAStopwatchViewController *)v2 setStopwatchManager:v15];

    id v16 = objc_alloc((Class)MTLegacyStopwatchMigrator);
    v17 = +[NSUserDefaults standardUserDefaults];
    v18 = [(MTAStopwatchViewController *)v2 stopwatchManager];
    id v19 = [v16 initWithDefaults:v17 manager:v18];
    [(MTAStopwatchViewController *)v2 setMigrator:v19];

    v20 = v2;
  }

  return v2;
}

- (MTStopwatchManager)stopwatchManager
{
  return self->_stopwatchManager;
}

- (void)setStopwatchManager:(id)a3
{
}

- (void)setMigrator:(id)a3
{
}

- (void)setLapTableController:(id)a3
{
}

- (MTAStopwatchLapTableViewController)lapTableController
{
  return self->_lapTableController;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(NSTimer *)self->_restoreIdleTimerTimer invalidate];
  v4.receiver = self;
  v4.super_class = (Class)MTAStopwatchViewController;
  [(MTAStopwatchViewController *)&v4 dealloc];
}

- (void)handleLocaleChange
{
  v3 = [(MTAStopwatchViewController *)self timeView];
  [v3 handleLocaleChange];

  objc_super v4 = [(MTAStopwatchViewController *)self analogStopwatch];
  [v4 handleLocaleChange];

  [(objc_class *)[(MTAStopwatchViewController *)self tableCellClass] handleLocaleChange];
  id v6 = [(MTAStopwatchViewController *)self lapTableController];
  v5 = [v6 tableView];
  [v5 reloadData];
}

- (Class)tableCellClass
{
  return (Class)objc_opt_class();
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    v5 = [(MTAStopwatchViewController *)self stopwatchController];
    [v5 setMode:a3];

    [(MTAStopwatchViewController *)self updateShortcutItemForCurrentState];
  }
}

- (void)updateTimeViewFont
{
  v3 = [(MTAStopwatchViewController *)self traitCollection];
  id v4 = [v3 horizontalSizeClass];

  if (MTUIShouldUseLargePadLayout())
  {
    v5 = &qword_100082B08;
  }
  else
  {
    v5 = (uint64_t *)&unk_100082B00;
    if (v4 != (id)2) {
      v5 = &qword_100082AF8;
    }
  }
  id v8 = +[UIFont systemFontOfSize:*(double *)v5 weight:UIFontWeightThin];
  id v6 = [v8 mtui_fontByAddingTimeFontAttributes];
  v7 = [(MTAStopwatchViewController *)self timeView];
  [v7 setFont:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [(MTAStopwatchViewController *)self lapTableController];
  v3 = [v4 tableView];
  [v3 reloadData];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = a3.width / a3.height;
  id v8 = a4;
  v9 = [(MTAStopwatchViewController *)self pagingViewController];
  v10 = v9;
  if (v7 <= 0.9)
  {
    v12 = [v9 scrollView];
    uint64_t v13 = v12;
    uint64_t v14 = 1;
  }
  else
  {
    [v9 setCurrentPage:0];

    v11 = [(MTAStopwatchViewController *)self pageControl];
    [v11 setCurrentPage:0];

    v10 = [(MTAStopwatchViewController *)self pagingViewController];
    v12 = [v10 scrollView];
    uint64_t v13 = v12;
    uint64_t v14 = 0;
  }
  [v12 setScrollEnabled:v14];

  v17.receiver = self;
  v17.super_class = (Class)MTAStopwatchViewController;
  -[MTAStopwatchViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000351B4;
  v15[3] = &unk_1000A1D68;
  v15[4] = self;
  BOOL v16 = v7 > 0.9;
  [v8 animateAlongsideTransition:v15 completion:0];
}

- (void)loadView
{
  v94.receiver = self;
  v94.super_class = (Class)MTAStopwatchViewController;
  [(MTAStopwatchViewController *)&v94 loadView];
  [(MTAStopwatchViewController *)self setAutomaticallyAdjustsScrollViewInsets:0];
  v3 = [[MTAStopwatchController alloc] initWithTarget:self];
  [(MTAStopwatchViewController *)self setStopwatchController:v3];

  [(MTAStopwatchViewController *)self setMode:1];
  id v4 = objc_alloc((Class)UIImageView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(MTAStopwatchViewController *)self setLapButtonOccludingView:v8];

  v9 = +[UIColor clearColor];
  v10 = [(MTAStopwatchViewController *)self lapButtonOccludingView];
  [v10 setBackgroundColor:v9];

  v11 = [(MTAStopwatchViewController *)self lapButtonOccludingView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(MTAStopwatchViewController *)self view];
  uint64_t v13 = [(MTAStopwatchViewController *)self lapButtonOccludingView];
  [v12 addSubview:v13];

  id v14 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(MTAStopwatchViewController *)self setStartButtonOccludingView:v14];

  v15 = +[UIColor clearColor];
  BOOL v16 = [(MTAStopwatchViewController *)self startButtonOccludingView];
  [v16 setBackgroundColor:v15];

  objc_super v17 = [(MTAStopwatchViewController *)self startButtonOccludingView];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = [(MTAStopwatchViewController *)self view];
  id v19 = [(MTAStopwatchViewController *)self startButtonOccludingView];
  [v18 addSubview:v19];

  v20 = [(MTAStopwatchViewController *)self view];
  v21 = [(MTAStopwatchViewController *)self stopwatchController];
  objc_super v22 = [v21 startStopButton];
  [v20 addSubview:v22];

  v23 = [(MTAStopwatchViewController *)self view];
  v24 = [(MTAStopwatchViewController *)self stopwatchController];
  v25 = [v24 lapControlButton];
  [v23 addSubview:v25];

  v26 = [(MTAStopwatchViewController *)self stopwatchController];
  v27 = [v26 startStopButton];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  v28 = [(MTAStopwatchViewController *)self stopwatchController];
  v29 = [v28 lapControlButton];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  LODWORD(v28) = [(MTAStopwatchViewController *)self shouldUseRegularLayout];
  v30 = [(MTAStopwatchViewController *)self stopwatchController];
  [v30 setButtonSize:v28];

  v31 = [(MTAStopwatchViewController *)self view];
  v32 = [(MTAStopwatchViewController *)self lapTableController];
  v33 = [v32 view];
  [v31 addSubview:v33];

  v34 = [(MTAStopwatchViewController *)self lapTableController];
  [v34 didMoveToParentViewController:self];

  v35 = [(MTAStopwatchViewController *)self lapTableController];
  v36 = [v35 view];
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];

  v37 = -[MTAStopwatchLapTableHeaderView initWithFrame:]([MTAStopwatchLapTableHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(MTAStopwatchViewController *)self setTableHeaderView:v37];

  v38 = [(MTAStopwatchViewController *)self tableHeaderView];
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

  v39 = [(MTAStopwatchViewController *)self tableHeaderView];
  [v39 setHidden:1];

  v40 = [(MTAStopwatchViewController *)self view];
  v41 = [(MTAStopwatchViewController *)self tableHeaderView];
  [v40 addSubview:v41];

  v42 = objc_alloc_init(MTAStopwatchPagingViewController);
  [(MTAStopwatchViewController *)self setPagingViewController:v42];

  v43 = [(MTAStopwatchViewController *)self pagingViewController];
  [(MTAStopwatchViewController *)self addChildViewController:v43];

  v44 = [(MTAStopwatchViewController *)self pagingViewController];
  v45 = [v44 view];
  [v45 setTranslatesAutoresizingMaskIntoConstraints:0];

  v46 = [(MTAStopwatchViewController *)self pagingViewController];
  [v46 setDelegate:self];

  v47 = [(MTAStopwatchViewController *)self view];
  v48 = [(MTAStopwatchViewController *)self pagingViewController];
  v49 = [v48 view];
  [v47 insertSubview:v49 atIndex:0];

  v50 = [(MTAStopwatchViewController *)self pagingViewController];
  [v50 didMoveToParentViewController:self];

  id v51 = [objc_alloc((Class)UIPageControl) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(MTAStopwatchViewController *)self setPageControl:v51];

  v52 = [(MTAStopwatchViewController *)self pageControl];
  [v52 addTarget:self action:"_pageControlValueChanged:" forControlEvents:4096];

  v53 = [(MTAStopwatchViewController *)self pageControl];
  [v53 setNumberOfPages:2];

  v54 = [(MTAStopwatchViewController *)self pageControl];
  [v54 setTranslatesAutoresizingMaskIntoConstraints:0];

  v55 = [(MTAStopwatchViewController *)self view];
  v56 = [(MTAStopwatchViewController *)self pageControl];
  [v55 addSubview:v56];

  id v57 = objc_alloc_init((Class)MTUITimeView);
  [(MTAStopwatchViewController *)self setTimeView:v57];

  v58 = +[UIFont systemFontOfSize:88.0 weight:UIFontWeightThin];
  v59 = [v58 mtui_fontByAddingTimeFontAttributes];
  v60 = [(MTAStopwatchViewController *)self timeView];
  [v60 setFont:v59];

  v61 = +[UIColor mtui_primaryTextColor];
  v62 = [(MTAStopwatchViewController *)self timeView];
  [v62 setTextColor:v61];

  v63 = [(MTAStopwatchViewController *)self timeView];
  [v63 setTextAlignment:1];

  v64 = [(MTAStopwatchViewController *)self timeView];
  [v64 setAdjustsFontSizeToFitWidth:1];

  v65 = +[UIColor clearColor];
  v66 = [(MTAStopwatchViewController *)self timeView];
  [v66 setBackgroundColor:v65];

  v67 = [(MTAStopwatchViewController *)self timeView];
  [v67 setTranslatesAutoresizingMaskIntoConstraints:0];

  v68 = [(MTAStopwatchViewController *)self timeView];
  [v68 setAccessibilityIdentifier:@"stopwatch-time"];

  v69 = objc_opt_new();
  [(MTAStopwatchViewController *)self setDigitalStopwatchContainer:v69];

  v70 = [(MTAStopwatchViewController *)self digitalStopwatchContainer];
  v71 = [(MTAStopwatchViewController *)self timeView];
  [v70 addSubview:v71];

  v72 = objc_alloc_init(MTAAnalogStopwatchView);
  [(MTAStopwatchViewController *)self setAnalogStopwatch:v72];

  v73 = +[UIColor clearColor];
  v74 = [(MTAStopwatchViewController *)self analogStopwatch];
  [v74 setBackgroundColor:v73];

  v75 = [(MTAStopwatchViewController *)self analogStopwatch];
  [v75 setTranslatesAutoresizingMaskIntoConstraints:0];

  v76 = objc_opt_new();
  [(MTAStopwatchViewController *)self setAnalogStopwatchContainer:v76];

  v77 = [(MTAStopwatchViewController *)self analogStopwatchContainer];
  v78 = [(MTAStopwatchViewController *)self analogStopwatch];
  [v77 addSubview:v78];

  v79 = [(MTAStopwatchViewController *)self digitalStopwatchContainer];
  v97[0] = v79;
  v80 = [(MTAStopwatchViewController *)self analogStopwatchContainer];
  v97[1] = v80;
  v81 = +[NSArray arrayWithObjects:v97 count:2];
  v82 = [(MTAStopwatchViewController *)self pagingViewController];
  [v82 setPages:v81];

  if ((+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    v83 = +[NSNotificationCenter defaultCenter];
    [v83 addObserver:self selector:"handleLocaleChange" name:NSCurrentLocaleDidChangeNotification object:0];

    [(MTAStopwatchViewController *)self updateShortcutItemForCurrentState];
    v84 = [(MTAStopwatchViewController *)self migrator];
    unsigned int v85 = [v84 needsMigration];

    v86 = MTLogForCategory();
    BOOL v87 = os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT);
    if (v85)
    {
      if (v87)
      {
        *(_DWORD *)buf = 138543362;
        v96 = self;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%{public}@ stopwatch need migration", buf, 0xCu);
      }

      v88 = [(MTAStopwatchViewController *)self migrator];
      v89 = [v88 migrateLegacyStopwatch];
      v90 = +[NAScheduler mainThreadScheduler];
      v91 = [v89 reschedule:v90];
      v93[0] = _NSConcreteStackBlock;
      v93[1] = 3221225472;
      v93[2] = sub_100035D6C;
      v93[3] = &unk_1000A1D90;
      v93[4] = self;
      id v92 = [v91 addCompletionBlock:v93];
    }
    else
    {
      if (v87)
      {
        *(_DWORD *)buf = 138543362;
        v96 = self;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%{public}@ migration not needed, proceeding to load stopwatch", buf, 0xCu);
      }

      [(MTAStopwatchViewController *)self reloadStopwatchesWithCompletion:0];
    }
  }
}

- (void)reloadStopwatchesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MTAStopwatchViewController *)self stopwatchManager];
  id v6 = [v5 getStopwatches];
  double v7 = +[NAScheduler mainThreadScheduler];
  id v8 = [v6 reschedule:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100035F7C;
  v11[3] = &unk_1000A1DB8;
  v11[4] = self;
  id v12 = v4;
  id v9 = v4;
  id v10 = [v8 addCompletionBlock:v11];
}

- (void)setupViewModelWithStopwatch:(id)a3
{
  id v6 = a3;
  double v7 = MTLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v6 identifier];
    int v31 = 138543618;
    v32 = self;
    __int16 v33 = 2114;
    v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@ setting up view model with stopwatch: %{public}@", (uint8_t *)&v31, 0x16u);
  }
  id v9 = [(MTAStopwatchViewController *)self viewModel];

  id v10 = MTLogForCategory();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      id v12 = [v6 identifier];
      int v31 = 138543618;
      v32 = self;
      __int16 v33 = 2114;
      v34 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@ view model already exists, updating with stopwatch: %{public}@", (uint8_t *)&v31, 0x16u);
    }
    id v13 = [(MTAStopwatchViewController *)self viewModel];
    id v14 = [v6 mutableCopy];
    [v13 updateStopwatch:v14];
  }
  else
  {
    if (v11)
    {
      v15 = [v6 identifier];
      int v31 = 138543618;
      v32 = self;
      __int16 v33 = 2114;
      v34 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@ view model does not exist, creating new one with stopwatch: %{public}@", (uint8_t *)&v31, 0x16u);
    }
    id v16 = objc_alloc((Class)MTStopwatchViewModel);
    id v13 = [v6 mutableCopy];
    id v14 = [(MTAStopwatchViewController *)self stopwatchManager];
    v3 = objc_opt_new();
    id v17 = [v16 initWithStopwatch:v13 manager:v14 delegate:self dateProvider:v3 registerForNotifications:1 broadcastUpdates:0];
    [(MTAStopwatchViewController *)self setViewModel:v17];
  }
  if ([v6 state] == (id)2)
  {
    v18 = [(MTAStopwatchViewController *)self viewModel];
    [v18 updateWithDisplayLink];

    uint64_t v19 = 2;
  }
  else if ([v6 state] == (id)1)
  {
    uint64_t v19 = 3;
  }
  else
  {
    uint64_t v19 = 1;
  }
  [(MTAStopwatchViewController *)self setMode:v19];
  v20 = [(MTAStopwatchViewController *)self viewModel];
  [v20 updateTime];

  v21 = [(MTAStopwatchViewController *)self viewModel];
  objc_super v22 = [v21 getStopwatch];
  id v23 = [v22 state];
  if (v23 == (id)2)
  {
    BOOL v24 = 1;
  }
  else
  {
    v3 = [(MTAStopwatchViewController *)self viewModel];
    id v4 = [v3 getStopwatch];
    [v4 currentInterval];
    BOOL v24 = v25 > 0.0;
  }
  v26 = [(MTAStopwatchViewController *)self lapTableController];
  [v26 setShowsCurrentLap:v24];

  if (v23 != (id)2)
  {
  }
  v27 = [(MTAStopwatchViewController *)self lapTableController];
  v28 = [(MTAStopwatchViewController *)self viewModel];
  v29 = [v28 getStopwatch];
  v30 = [v29 laps];
  [v27 setLaps:v30];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)MTAStopwatchViewController;
  [(MTAStopwatchViewController *)&v14 viewDidLoad];
  [(MTAStopwatchViewController *)self updateTimeViewFont];
  v3 = [(MTAStopwatchViewController *)self lapTableController];
  id v4 = [v3 tableView];

  [(MTAStopwatchViewController *)self _setObservableScrollView:v4 forEdges:4];
  v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 objectForKey:@"STOPWATCH_INDEX"];

  if (v6) {
    double v7 = v6;
  }
  else {
    double v7 = &off_1000A4EB0;
  }
  id v8 = [v7 integerValue];
  id v9 = [(MTAStopwatchViewController *)self pagingViewController];
  [v9 setCurrentPage:v8];

  id v10 = [(MTAStopwatchViewController *)self pageControl];
  [v10 setCurrentPage:v8];

  BOOL v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"handleContentSizeCategoryChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  id v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"handleEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"handleEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)handleContentSizeCategoryChange:(id)a3
{
  id v4 = [(MTAStopwatchViewController *)self view];
  [v4 bounds];
  double v6 = v5;

  double v7 = [(MTAStopwatchViewController *)self stopwatchController];
  id v24 = [v7 startStopButton];

  MTUIShouldUseLargePadLayout();
  unsigned int v8 = [(MTAStopwatchViewController *)self shouldUseRegularLayout];
  id v9 = [(MTAStopwatchViewController *)self view];
  [v9 bounds];

  id v10 = +[UIScreen mainScreen];
  [v10 bounds];
  double Height = CGRectGetHeight(v26);

  if (v8)
  {
    +[MTACircleButton buttonWidthForSize:1];
    if (v12 >= 120.0) {
      double v13 = 120.0;
    }
    else {
      double v13 = v12;
    }
  }
  else
  {
    objc_super v14 = [(MTAStopwatchViewController *)self view];
    [v14 bounds];
    fmin(Height * 0.542, CGRectGetWidth(v27));

    v15 = [(MTAStopwatchViewController *)self view];
    [v15 safeAreaInsets];

    +[MTACircleButton buttonWidthForSize:0];
    double v13 = (v6 + 16.0 * -2.0) * 0.25;
    +[MTACircleButton buttonWidthForSize:](MTACircleButton, "buttonWidthForSize:", [v24 buttonCircleSize]);
    if (v16 < v13) {
      double v13 = v16;
    }
  }
  id v17 = [(MTAStopwatchViewController *)self view];
  UIRoundToViewScale();
  double v19 = v18;

  v20 = [(MTAStopwatchViewController *)self startButtonTopConstraint];
  [v20 setConstant:v19];

  v21 = [(MTAStopwatchViewController *)self lapButtonTopConstraint];
  [v21 setConstant:v19];

  objc_super v22 = [(MTAStopwatchViewController *)self startButtonWidthConstraint];
  [v22 setConstant:v13];

  id v23 = [(MTAStopwatchViewController *)self lapButtonWidthConstraint];
  [v23 setConstant:v13];
}

- (BOOL)shouldUseRegularLayout
{
  char v3 = MTUIShouldUseLargePadLayout();
  id v4 = [(MTAStopwatchViewController *)self traitCollection];
  id v5 = [v4 horizontalSizeClass];

  if (v5 == (id)2) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)updateViewConstraints
{
  char v3 = [(MTAStopwatchViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(MTAStopwatchViewController *)self latestLayoutSize];
  if (v9 == v5 && v8 == v7)
  {
    v185.receiver = self;
    v185.super_class = (Class)MTAStopwatchViewController;
    [(MTAStopwatchViewController *)&v185 updateViewConstraints];
  }
  else
  {
    BOOL v11 = [(MTAStopwatchViewController *)self lapTableController];
    double v12 = [v11 tableView];

    uint64_t v13 = [(MTAStopwatchViewController *)self tableHeaderView];
    objc_super v14 = [(MTAStopwatchViewController *)self pagingViewController];
    uint64_t v15 = [v14 view];

    double v16 = +[NSMutableArray array];
    id v17 = [(MTAStopwatchViewController *)self stopwatchController];
    double v18 = [v17 startStopButton];

    double v19 = [(MTAStopwatchViewController *)self stopwatchController];
    uint64_t v20 = [v19 lapControlButton];

    long long v183 = 0u;
    long long v184 = 0u;
    v21 = [(MTAStopwatchViewController *)self view];
    v181 = v18;
    +[MTAUtilities controlButtonAttributesForView:buttonCircleSize:](MTAUtilities, "controlButtonAttributesForView:buttonCircleSize:", v21, [v18 buttonCircleSize]);

    v180 = (void *)v13;
    v179 = (void *)v15;
    objc_super v22 = v18;
    id v23 = (void *)v20;
    id v24 = [v181 topAnchor];
    double v25 = [(MTAStopwatchViewController *)self view];
    CGRect v26 = [v25 safeAreaLayoutGuide];
    CGRect v27 = [v26 topAnchor];
    v28 = [v24 constraintEqualToAnchor:v27 constant:0.0];
    [(MTAStopwatchViewController *)self setStartButtonTopConstraint:v28];

    v29 = [v23 topAnchor];
    v30 = [(MTAStopwatchViewController *)self view];
    int v31 = [v30 safeAreaLayoutGuide];
    v32 = [v31 topAnchor];
    __int16 v33 = [v29 constraintEqualToAnchor:v32 constant:0.0];
    [(MTAStopwatchViewController *)self setLapButtonTopConstraint:v33];

    v34 = [(MTAStopwatchViewController *)self lapButtonTopConstraint];
    [v16 addObject:v34];

    v35 = [(MTAStopwatchViewController *)self startButtonTopConstraint];
    [v16 addObject:v35];

    v36 = [v23 leadingAnchor];
    v37 = [(MTAStopwatchViewController *)self view];
    v38 = [v37 leadingAnchor];
    v39 = [v36 constraintEqualToAnchor:v38 constant:16.0];
    [v16 addObject:v39];

    v40 = [v23 widthAnchor];
    v41 = [v40 constraintEqualToConstant:0.0];
    [(MTAStopwatchViewController *)self setLapButtonWidthConstraint:v41];

    v42 = [(MTAStopwatchViewController *)self lapButtonWidthConstraint];
    [v16 addObject:v42];

    v43 = [v23 heightAnchor];
    v44 = [v23 widthAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    [v16 addObject:v45];

    v46 = [v22 trailingAnchor];
    v47 = [(MTAStopwatchViewController *)self view];
    v48 = [v47 trailingAnchor];
    v49 = [v46 constraintEqualToAnchor:v48 constant:-16.0];
    [v16 addObject:v49];

    v50 = [v22 widthAnchor];
    id v51 = [v50 constraintEqualToConstant:0.0];
    [(MTAStopwatchViewController *)self setStartButtonWidthConstraint:v51];

    v52 = [(MTAStopwatchViewController *)self startButtonWidthConstraint];
    [v16 addObject:v52];

    v53 = [v22 heightAnchor];
    v54 = [v22 widthAnchor];
    v55 = [v53 constraintEqualToAnchor:v54];
    [v16 addObject:v55];

    v56 = [(MTAStopwatchViewController *)self lapButtonOccludingView];
    id v57 = [v56 centerXAnchor];
    v58 = [v23 centerXAnchor];
    v59 = [v57 constraintEqualToAnchor:v58];
    [v16 addObject:v59];

    v60 = [(MTAStopwatchViewController *)self lapButtonOccludingView];
    v61 = [v60 centerYAnchor];
    v62 = [v23 centerYAnchor];
    v63 = [v61 constraintEqualToAnchor:v62];
    [v16 addObject:v63];

    v64 = [(MTAStopwatchViewController *)self lapButtonOccludingView];
    v65 = [v64 widthAnchor];
    v66 = [v23 widthAnchor];
    v67 = [v65 constraintEqualToAnchor:v66 multiplier:1.0 constant:2.0];
    [v16 addObject:v67];

    v68 = [(MTAStopwatchViewController *)self lapButtonOccludingView];
    v69 = [v68 heightAnchor];
    v70 = [v23 heightAnchor];
    v71 = [v69 constraintEqualToAnchor:v70 multiplier:1.0 constant:2.0];
    [v16 addObject:v71];

    v72 = [(MTAStopwatchViewController *)self startButtonOccludingView];
    v73 = [v72 centerXAnchor];
    v74 = [v22 centerXAnchor];
    v75 = [v73 constraintEqualToAnchor:v74];
    [v16 addObject:v75];

    v76 = [(MTAStopwatchViewController *)self startButtonOccludingView];
    v77 = [v76 centerYAnchor];
    v78 = [v22 centerYAnchor];
    v79 = [v77 constraintEqualToAnchor:v78];
    [v16 addObject:v79];

    v80 = [(MTAStopwatchViewController *)self startButtonOccludingView];
    v81 = [v80 widthAnchor];
    v82 = [v22 widthAnchor];
    v83 = [v81 constraintEqualToAnchor:v82 multiplier:1.0 constant:2.0];
    [v16 addObject:v83];

    v84 = [(MTAStopwatchViewController *)self startButtonOccludingView];
    unsigned int v85 = [v84 heightAnchor];
    v86 = [v22 heightAnchor];
    BOOL v87 = [v85 constraintEqualToAnchor:v86 multiplier:1.0 constant:2.0];
    [v16 addObject:v87];

    uint64_t v88 = sub_100034CC8(0.0 + 2.0);
    v89 = [(MTAStopwatchViewController *)self lapButtonOccludingView];
    [v89 setImage:v88];

    v90 = [(MTAStopwatchViewController *)self startButtonOccludingView];
    [v90 setImage:v88];

    v177 = v23;
    v178 = (void *)v88;
    v91 = [v12 topAnchor];
    id v92 = [v23 bottomAnchor];
    v93 = [v91 constraintEqualToAnchor:v92 constant:16.0];
    objc_super v94 = v23;
    [v16 addObject:v93];

    v95 = [v12 leadingAnchor];
    v96 = [(MTAStopwatchViewController *)self view];
    v97 = [v96 leadingAnchor];
    v98 = [v95 constraintEqualToAnchor:v97];
    [v16 addObject:v98];

    v99 = [v12 trailingAnchor];
    v100 = [(MTAStopwatchViewController *)self view];
    v101 = [v100 trailingAnchor];
    v102 = [v99 constraintEqualToAnchor:v101];
    [v16 addObject:v102];

    v103 = [(MTAStopwatchViewController *)self pageControl];
    v104 = [v103 centerXAnchor];
    v105 = [(MTAStopwatchViewController *)self view];
    v106 = [v105 centerXAnchor];
    v107 = [v104 constraintEqualToAnchor:v106];
    [v16 addObject:v107];

    v108 = [(MTAStopwatchViewController *)self pageControl];
    v109 = [v108 centerYAnchor];
    v110 = [v94 centerYAnchor];
    v111 = [v109 constraintEqualToAnchor:v110];
    [v16 addObject:v111];

    v112 = [v12 bottomAnchor];
    v113 = [(MTAStopwatchViewController *)self view];
    v114 = [v113 bottomAnchor];
    v115 = [v112 constraintEqualToAnchor:v114];
    [v16 addObject:v115];

    v116 = [(MTAStopwatchViewController *)self lapTableController];
    [v116 setCellStyle:1];

    v117 = [(MTAStopwatchViewController *)self tableHeaderView];
    [v117 setHidden:1];

    v118 = [v179 leadingAnchor];
    v119 = [(MTAStopwatchViewController *)self view];
    v120 = [v119 leadingAnchor];
    v121 = [v118 constraintEqualToAnchor:v120];
    [v16 addObject:v121];

    v122 = [v179 trailingAnchor];
    v123 = [(MTAStopwatchViewController *)self view];
    v124 = [v123 trailingAnchor];
    v125 = [v122 constraintEqualToAnchor:v124];
    [v16 addObject:v125];

    v126 = [v179 topAnchor];
    v127 = [(MTAStopwatchViewController *)self view];
    v128 = [v127 safeAreaLayoutGuide];
    v129 = [v128 topAnchor];
    v130 = [v126 constraintEqualToAnchor:v129];
    [v16 addObject:v130];

    v131 = [v179 bottomAnchor];
    v132 = [(MTAStopwatchViewController *)self pageControl];
    v133 = [v132 topAnchor];
    v134 = [v131 constraintEqualToAnchor:v133 constant:15.0];
    [v16 addObject:v134];

    v135 = (double *)&unk_100082AA8;
    if (!BYTE10(v184)) {
      v135 = (double *)&qword_100082A60;
    }
    double v136 = 0.0 * 0.5 + 0.0;
    double v137 = v136 + *v135 * -2.0;
    double v138 = v136 - (v5 + *v135 * -2.0);
    if (v137 <= v5) {
      double v139 = *v135;
    }
    else {
      double v139 = v138 * 0.5;
    }
    v140 = [(MTAStopwatchViewController *)self analogStopwatch];
    v141 = [v140 centerXAnchor];
    v142 = [(MTAStopwatchViewController *)self analogStopwatchContainer];
    v143 = [v142 centerXAnchor];
    v144 = [v141 constraintEqualToAnchor:v143];
    [v16 addObject:v144];

    v145 = [(MTAStopwatchViewController *)self analogStopwatch];
    v146 = [v145 topAnchor];
    v147 = [(MTAStopwatchViewController *)self analogStopwatchContainer];
    v148 = [v147 topAnchor];
    v149 = [v146 constraintEqualToAnchor:v148 constant:v139];
    [v16 addObject:v149];

    v150 = [(MTAStopwatchViewController *)self analogStopwatch];
    v151 = [v150 bottomAnchor];
    v152 = [(MTAStopwatchViewController *)self analogStopwatchContainer];
    v153 = [v152 bottomAnchor];
    v154 = [v151 constraintEqualToAnchor:v153 constant:-v139];

    LODWORD(v155) = 1148829696;
    [v154 setPriority:v155];
    [v16 addObject:v154];
    v156 = [(MTAStopwatchViewController *)self analogStopwatch];
    v157 = [v156 widthAnchor];
    v158 = [(MTAStopwatchViewController *)self analogStopwatch];
    v159 = [v158 heightAnchor];
    v160 = [v157 constraintEqualToAnchor:v159];
    [v16 addObject:v160];

    v161 = [(MTAStopwatchViewController *)self timeView];
    v162 = [v161 leadingAnchor];
    v163 = [(MTAStopwatchViewController *)self digitalStopwatchContainer];
    v164 = [v163 leadingAnchor];
    v165 = [v162 constraintEqualToAnchor:v164];
    [v16 addObject:v165];

    v166 = [(MTAStopwatchViewController *)self timeView];
    v167 = [v166 trailingAnchor];
    v168 = [(MTAStopwatchViewController *)self digitalStopwatchContainer];
    v169 = [v168 trailingAnchor];
    v170 = [v167 constraintEqualToAnchor:v169];
    [v16 addObject:v170];

    v171 = [(MTAStopwatchViewController *)self timeView];
    v172 = [v171 centerYAnchor];
    v173 = [(MTAStopwatchViewController *)self digitalStopwatchContainer];
    v174 = [v173 centerYAnchor];
    v175 = [v172 constraintEqualToAnchor:v174];
    [v16 addObject:v175];

    v176 = [(MTAStopwatchViewController *)self constraints];
    +[NSLayoutConstraint deactivateConstraints:v176];

    +[NSLayoutConstraint activateConstraints:v16];
    [(MTAStopwatchViewController *)self setConstraints:v16];
    -[MTAStopwatchViewController setLatestLayoutSize:](self, "setLatestLayoutSize:", v5, v7);
    v182.receiver = self;
    v182.super_class = (Class)MTAStopwatchViewController;
    [(MTAStopwatchViewController *)&v182 updateViewConstraints];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTAStopwatchViewController;
  [(MTAStopwatchViewController *)&v5 viewWillAppear:a3];
  double v4 = [(MTAStopwatchViewController *)self view];
  [v4 setNeedsUpdateConstraints];

  [(MTAStopwatchViewController *)self renderViewModel];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTAStopwatchViewController;
  [(MTAStopwatchViewController *)&v4 viewDidAppear:a3];
  [(NSUserActivity *)self->_userActivity becomeCurrent];
}

- (void)renderViewModel
{
  char v3 = [(MTAStopwatchViewController *)self viewModel];
  objc_super v4 = [v3 getStopwatch];
  id v5 = [v4 state];

  if (v5 == (id)2)
  {
    [(MTAStopwatchViewController *)self startDisplayUpdates];
    uint64_t v6 = 2;
  }
  else
  {
    double v7 = [(MTAStopwatchViewController *)self viewModel];
    double v8 = [v7 getStopwatch];
    [v8 currentInterval];
    double v10 = v9;

    if (v10 <= 0.0) {
      goto LABEL_6;
    }
    uint64_t v6 = 3;
  }
  [(MTAStopwatchViewController *)self setMode:v6];
LABEL_6:
  BOOL v11 = [(MTAStopwatchViewController *)self viewModel];
  double v12 = [v11 getStopwatch];
  [v12 currentInterval];
  double v14 = v13;

  if (v14 > 0.0)
  {
    id v15 = [(MTAStopwatchViewController *)self viewModel];
    [v15 updateTime];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSUserActivity *)self->_userActivity resignCurrent];
  v5.receiver = self;
  v5.super_class = (Class)MTAStopwatchViewController;
  [(MTAStopwatchViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTAStopwatchViewController;
  [(MTAStopwatchViewController *)&v4 viewDidDisappear:a3];
  [(MTAStopwatchViewController *)self endDisplayUpdates];
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)MTAStopwatchViewController;
  [(MTAStopwatchViewController *)&v15 viewDidLayoutSubviews];
  BOOL v3 = [(MTAStopwatchViewController *)self view];
  [v3 bounds];
  double v6 = v4 / v5;

  double v7 = [(MTAStopwatchViewController *)self pagingViewController];
  double v8 = v7;
  if (v6 <= 0.9)
  {
    double v14 = [v7 scrollView];
    [v14 setScrollEnabled:1];

    BOOL v11 = [(MTAStopwatchViewController *)self pageControl];
    double v12 = v11;
    double v13 = 1.0;
  }
  else
  {
    [v7 setCurrentPage:0];

    double v9 = [(MTAStopwatchViewController *)self pagingViewController];
    double v10 = [v9 scrollView];
    [v10 setScrollEnabled:0];

    BOOL v11 = [(MTAStopwatchViewController *)self pageControl];
    double v12 = v11;
    double v13 = 0.0;
  }
  [v11 setAlpha:v13];
}

- (BOOL)prefersStatusBarHidden
{
  v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 0;
  }
  double v5 = +[UIApplication sharedApplication];
  double v6 = [v5 delegate];

  BOOL v4 = (char *)[v6 interfaceOrientation] - 3 < (char *)2;
  return v4;
}

- (void)stopwatchPagingViewController:(id)a3 didPage:(unint64_t)a4
{
  id v5 = [(MTAStopwatchViewController *)self pageControl];
  [v5 setCurrentPage:a4];
}

- (void)saveState
{
  id v5 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [(MTAStopwatchViewController *)self pagingViewController];
  BOOL v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 currentPage]);
  [v5 setObject:v4 forKey:@"STOPWATCH_INDEX"];
}

- (void)updateShortcutItemForCurrentState
{
  unint64_t v3 = +[UIApplication sharedApplication];
  BOOL v4 = [v3 shortcutItems];
  id v8 = [v4 mutableCopy];

  id v5 = [v8 indexOfObjectPassingTest:&stru_1000A1DD8];
  double v6 = [(MTAStopwatchViewController *)self shortcutItemForCurrentState];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    [v8 insertObject:v6 atIndex:0];
  }
  else {
    [v8 replaceObjectAtIndex:v5 withObject:v6];
  }
  double v7 = +[UIApplication sharedApplication];
  [v7 setShortcutItems:v8];
}

- (id)shortcutItemForCurrentState
{
  return [(MTAStopwatchViewController *)self shortcutItemForMode:self->_mode];
}

- (id)shortcutItemForMode:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    -[MTAStopwatchViewController startStopwatchShortcutItemForMode:](self, "startStopwatchShortcutItemForMode:");
  }
  else {
  unint64_t v3 = [(MTAStopwatchViewController *)self stopStopwatchShortcutItem];
  }

  return v3;
}

- (id)startStopwatchShortcutItemForMode:(unint64_t)a3
{
  BOOL v4 = +[UIApplicationShortcutIcon iconWithSystemImageName:@"stopwatch"];
  id v5 = +[NSBundle mainBundle];
  double v6 = v5;
  if (a3 == 1) {
    CFStringRef v7 = @"START_STOPWATCH_QUICK_ACTION_TITLE";
  }
  else {
    CFStringRef v7 = @"RESUME_STOPWATCH_QUICK_ACTION_TITLE";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_1000A2560 table:@"Localizable-OrbHW"];

  id v9 = [objc_alloc((Class)UIApplicationShortcutItem) initWithType:@"com.apple.mobiletimer.start-stopwatch" localizedTitle:v8 localizedSubtitle:0 icon:v4 userInfo:0];

  return v9;
}

- (id)stopStopwatchShortcutItem
{
  v2 = +[UIApplicationShortcutIcon iconWithSystemImageName:@"stopwatch"];
  unint64_t v3 = +[NSBundle mainBundle];
  BOOL v4 = [v3 localizedStringForKey:@"STOP_STOPWATCH_QUICK_ACTION_TITLE" value:&stru_1000A2560 table:@"Localizable-OrbHW"];

  id v5 = [objc_alloc((Class)UIApplicationShortcutItem) initWithType:@"com.apple.mobiletimer.stop-stopwatch" localizedTitle:v4 localizedSubtitle:0 icon:v2 userInfo:0];

  return v5;
}

- (id)defaultShortcutItem
{
  if (self->_isTimerRunning) {
    return [(MTAStopwatchViewController *)self shortcutItemForMode:2];
  }
  if (self->_currentInterval <= 0.0) {
    return [(MTAStopwatchViewController *)self shortcutItemForMode:1];
  }
  return [(MTAStopwatchViewController *)self shortcutItemForMode:3];
}

- (void)handleStartStopwatchShortcutAction
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100038B50;
  v2[3] = &unk_1000A1428;
  v2[4] = self;
  [(MTAStopwatchViewController *)self reloadStopwatchesWithCompletion:v2];
}

- (void)handleStopStopwatchShortcutAction
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100038C20;
  v2[3] = &unk_1000A1428;
  v2[4] = self;
  [(MTAStopwatchViewController *)self reloadStopwatchesWithCompletion:v2];
}

- (void)handleLapStopwatchShortcutAction
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100038CAC;
  v2[3] = &unk_1000A1428;
  v2[4] = self;
  [(MTAStopwatchViewController *)self reloadStopwatchesWithCompletion:v2];
}

- (void)handleResetStopwatchShortcutAction
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100038D38;
  v2[3] = &unk_1000A1428;
  v2[4] = self;
  [(MTAStopwatchViewController *)self reloadStopwatchesWithCompletion:v2];
}

- (void)_pageControlValueChanged:(id)a3
{
  id v4 = a3;
  id v6 = [(MTAStopwatchViewController *)self pagingViewController];
  id v5 = [v4 currentPage];

  [v6 setCurrentPage:v5 animated:1];
}

- (void)startDisplayUpdates
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    double v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ startDisplayUpdates", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [(MTAStopwatchViewController *)self viewModel];
  [v4 invalidateDisplayLink];

  id v5 = [(MTAStopwatchViewController *)self viewModel];
  [v5 updateWithDisplayLink];

  [(NSTimer *)self->_restoreIdleTimerTimer invalidate];
  id v6 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_restoreIdleTimer" selector:0 userInfo:0 repeats:300.0];
  restoreIdleTimerTimer = self->_restoreIdleTimerTimer;
  self->_restoreIdleTimerTimer = v6;

  id v8 = +[UIApplication sharedApplication];
  [v8 setIdleTimerDisabled:1];
}

- (void)endDisplayUpdates
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ endDisplayUpdates", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(MTAStopwatchViewController *)self viewModel];
  [v4 invalidateDisplayLink];

  [(MTAStopwatchViewController *)self _restoreIdleTimer];
}

- (void)_restoreIdleTimer
{
  [(NSTimer *)self->_restoreIdleTimerTimer invalidate];
  restoreIdleTimerTimer = self->_restoreIdleTimerTimer;
  self->_restoreIdleTimerTimer = 0;

  id v4 = +[UIApplication sharedApplication];
  [v4 setIdleTimerDisabled:0];
}

- (double)runningTotalForLap:(int64_t)a3
{
  id v4 = [(MTAStopwatchViewController *)self viewModel];
  [v4 runningTotalForLap:a3];
  double v6 = v5;

  return v6;
}

- (void)startLapTimer
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    double v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting lap timer", (uint8_t *)&v11, 0xCu);
  }

  id v4 = [(MTAStopwatchViewController *)self viewModel];
  double v5 = [v4 getStopwatch];
  double v6 = [v5 laps];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = [(MTAStopwatchViewController *)self viewModel];
    [v8 clearAllLaps];
  }
  int v9 = [(MTAStopwatchViewController *)self viewModel];
  [v9 startLapTimer];

  [(MTAStopwatchViewController *)self startDisplayUpdates];
  [(MTAStopwatchViewController *)self setMode:2];
  double v10 = [(MTAStopwatchViewController *)self lapTableController];
  [v10 setShowsCurrentLap:1];

  +[MTAnalytics incrementEventCount:kMTCAStopwatchStarts];
}

- (void)pauseLapTimer
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    double v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ pausing lap timer", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(MTAStopwatchViewController *)self viewModel];
  [v4 pauseLapTimer];

  [(MTAStopwatchViewController *)self pauseLapTimerUI];
}

- (void)pauseLapTimerUI
{
  [(MTAStopwatchViewController *)self endDisplayUpdates];
  unint64_t v3 = [(MTAStopwatchViewController *)self viewModel];
  [v3 updateTime];

  [(MTAStopwatchViewController *)self setMode:3];
  uint64_t v4 = kMTCAStopwatchPauses;

  +[MTAnalytics incrementEventCount:v4];
}

- (void)lapLapTimer
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    double v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ lapping lap timer", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [(MTAStopwatchViewController *)self viewModel];
  [v4 lapLapTimer];

  [(MTAStopwatchViewController *)self lapLapTimerUI];
}

- (void)lapLapTimerUI
{
  unint64_t v3 = [(MTAStopwatchViewController *)self viewModel];
  uint64_t v4 = [v3 getStopwatch];
  int v5 = [v4 laps];
  double v6 = [v5 lastObject];
  [v6 doubleValue];
  double v8 = v7;

  int v9 = [(MTAStopwatchViewController *)self lapTableController];
  [v9 addLap:v8];

  uint64_t v10 = kMTCAStopwatchLaps;

  +[MTAnalytics incrementEventCount:v10];
}

- (void)resetLapTimer
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    double v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting lap timer", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = [(MTAStopwatchViewController *)self viewModel];
  [v4 resetLapTimer];

  [(MTAStopwatchViewController *)self resetLapTimerUI];
  int v5 = [(MTAStopwatchViewController *)self viewModel];
  [v5 updateTime];
}

- (void)resetLapTimerUI
{
  [(MTAStopwatchViewController *)self endDisplayUpdates];
  [(MTAStopwatchViewController *)self setMode:1];
  unint64_t v3 = [(MTAStopwatchViewController *)self lapTableController];
  [v3 setShowsCurrentLap:0];

  uint64_t v4 = [(MTAStopwatchViewController *)self lapTableController];
  [v4 clearAllLaps];

  uint64_t v5 = kMTCAStopwatchResets;

  +[MTAnalytics incrementEventCount:v5];
}

- (void)resumeLapTimer
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming lap timer", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [(MTAStopwatchViewController *)self viewModel];
  [v4 resumeLapTimer];

  [(MTAStopwatchViewController *)self resumeLapTimerUI];
}

- (void)resumeLapTimerUI
{
  [(MTAStopwatchViewController *)self startDisplayUpdates];

  [(MTAStopwatchViewController *)self setMode:2];
}

- (void)didAddLap:(double)a3
{
  uint64_t v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@ didAddLap", (uint8_t *)&v5, 0xCu);
  }

  [(MTAStopwatchViewController *)self lapLapTimerUI];
}

- (void)didLapLapTimer
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@ didLapLapTimer", (uint8_t *)&v4, 0xCu);
  }

  [(MTAStopwatchViewController *)self lapLapTimerUI];
}

- (void)didPauseLapTimer
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@ didPauseLapTimer", (uint8_t *)&v4, 0xCu);
  }

  [(MTAStopwatchViewController *)self pauseLapTimerUI];
}

- (void)didPauseStopwatch
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@ didPauseStopwatch", (uint8_t *)&v4, 0xCu);
  }

  [(MTAStopwatchViewController *)self endDisplayUpdates];
  [(MTAStopwatchViewController *)self setMode:3];
}

- (void)didResetLapTimer
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@ didResetLapTimer", (uint8_t *)&v5, 0xCu);
  }

  [(MTAStopwatchViewController *)self resetLapTimerUI];
  int v4 = [(MTAStopwatchViewController *)self viewModel];
  [v4 updateTime];
}

- (void)didResumeLapTimer
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@ didResumeLapTimer", (uint8_t *)&v4, 0xCu);
  }

  [(MTAStopwatchViewController *)self resumeLapTimerUI];
}

- (void)didStartLapTimer
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@ didStartLapTimer", (uint8_t *)&v4, 0xCu);
  }

  [(MTAStopwatchViewController *)self startLapTimer];
}

- (void)didUpdateCurrentInterval:(double)a3 adjustedCurrentInterval:(double)a4 totalInterval:(double)a5 adjustedTotalInterval:(double)a6 isStopwatchRunning:(BOOL)a7 isStopwatchStopped:(BOOL)a8
{
  BOOL v8 = a7;
  if ([(MTAStopwatchViewController *)self shouldProcessUpdate])
  {
    double v14 = [(MTAStopwatchViewController *)self timeView];
    objc_super v15 = v14;
    if (v8)
    {
      [v14 setTime:a6];

      double v16 = [(MTAStopwatchViewController *)self analogStopwatch];
      [v16 setDisplayAdjustedElapsedTime:a6];

      id v17 = [(MTAStopwatchViewController *)self lapTableController];
      double v18 = v17;
      double v19 = a4;
    }
    else
    {
      [v14 setTime:a5];

      uint64_t v20 = [(MTAStopwatchViewController *)self analogStopwatch];
      [v20 setDisplayAdjustedElapsedTime:a5];

      id v17 = [(MTAStopwatchViewController *)self lapTableController];
      double v18 = v17;
      double v19 = a3;
    }
    [v17 setCurrentInterval:v19];

    v21 = [(MTAStopwatchViewController *)self analogStopwatch];
    [v21 setElapsedTime:a5];

    id v22 = [(MTAStopwatchViewController *)self analogStopwatch];
    [v22 setCurrentLapTime:a3];
  }
}

- (BOOL)shouldProcessUpdate
{
  return 1;
}

- (MTAStopwatchController)stopwatchController
{
  return self->_stopwatchController;
}

- (void)setStopwatchController:(id)a3
{
}

- (MTAStopwatchLapTableHeaderView)tableHeaderView
{
  return self->_tableHeaderView;
}

- (void)setTableHeaderView:(id)a3
{
}

- (UIImageView)lapButtonOccludingView
{
  return self->_lapButtonOccludingView;
}

- (void)setLapButtonOccludingView:(id)a3
{
}

- (UIImageView)startButtonOccludingView
{
  return self->_startButtonOccludingView;
}

- (void)setStartButtonOccludingView:(id)a3
{
}

- (MTAStopwatchPagingViewController)pagingViewController
{
  return self->_pagingViewController;
}

- (void)setPagingViewController:(id)a3
{
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (UIView)analogStopwatchContainer
{
  return self->_analogStopwatchContainer;
}

- (void)setAnalogStopwatchContainer:(id)a3
{
}

- (MTAAnalogStopwatchView)analogStopwatch
{
  return self->_analogStopwatch;
}

- (void)setAnalogStopwatch:(id)a3
{
}

- (UIView)digitalStopwatchContainer
{
  return self->_digitalStopwatchContainer;
}

- (void)setDigitalStopwatchContainer:(id)a3
{
}

- (MTUITimeView)timeView
{
  return self->_timeView;
}

- (void)setTimeView:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (CGSize)latestLayoutSize
{
  double width = self->_latestLayoutSize.width;
  double height = self->_latestLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLatestLayoutSize:(CGSize)a3
{
  self->_latestLayoutSize = a3;
}

- (NSLayoutConstraint)startButtonTopConstraint
{
  return self->_startButtonTopConstraint;
}

- (void)setStartButtonTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)lapButtonTopConstraint
{
  return self->_lapButtonTopConstraint;
}

- (void)setLapButtonTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)startButtonWidthConstraint
{
  return self->_startButtonWidthConstraint;
}

- (void)setStartButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)lapButtonWidthConstraint
{
  return self->_lapButtonWidthConstraint;
}

- (void)setLapButtonWidthConstraint:(id)a3
{
}

- (MTStopwatchViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (MTLegacyStopwatchMigrator)migrator
{
  return self->_migrator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_stopwatchManager, 0);
  objc_storeStrong((id *)&self->_lapButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_startButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_lapButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_startButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_digitalStopwatchContainer, 0);
  objc_storeStrong((id *)&self->_analogStopwatch, 0);
  objc_storeStrong((id *)&self->_analogStopwatchContainer, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_pagingViewController, 0);
  objc_storeStrong((id *)&self->_startButtonOccludingView, 0);
  objc_storeStrong((id *)&self->_lapButtonOccludingView, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_lapTableController, 0);
  objc_storeStrong((id *)&self->_stopwatchController, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_restoreIdleTimerTimer, 0);
  objc_storeStrong((id *)&self->_laps, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end