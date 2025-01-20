@interface MTATimerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldHandleTimerReload;
- (MTATimerRunningDelegate)delegate;
- (MTATimerViewController)initWithDelegate:(id)a3;
- (MTATimerViewController)initWithTimer:(id)a3 timerManager:(id)a4 dataSource:(id)a5 delegate:(id)a6;
- (MTATimerViewController)initWithTimerManager:(id)a3 dataSource:(id)a4 delegate:(id)a5;
- (MTSound)sound;
- (MTTimer)timer;
- (MTTimerDataSource)dataSource;
- (MTTimerManager)timerManager;
- (NSString)timerLabel;
- (id)defaultEditLabel;
- (id)shortcutItemForCurrentState;
- (id)startTimerShortcutItem;
- (id)stopTimerShortcutItem;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)addNewTimerWithDuration:(double)a3 title:(id)a4 sound:(id)a5;
- (void)cancelTimer:(id)a3;
- (void)confirmPickingSound;
- (void)dealloc;
- (void)didUpdateWithLabel:(id)a3 sender:(id)a4;
- (void)dismissSoundPicker;
- (void)handleBecameActive;
- (void)handleContentSizeChange:(id)a3;
- (void)handleResignActive;
- (void)handleStartTimerShortcutAction;
- (void)handleStopTimerShortcutAction;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadView;
- (void)moveViewFrameToVerticalPosition:(float)a3;
- (void)pauseResumeTimer:(id)a3;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)prepareUIForState:(unint64_t)a3;
- (void)prepareUIForState:(unint64_t)a3 forceRefresh:(BOOL)a4;
- (void)reloadState;
- (void)reloadState:(id)a3;
- (void)reloadStateForCurrentTimer:(id)a3;
- (void)reloadStateForMultipleTimers:(id)a3;
- (void)reloadTimerUI;
- (void)reloadTimerUiForceRefresh:(BOOL)a3;
- (void)removeNotificationObserver;
- (void)saveState;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldHandleTimerReload:(BOOL)a3;
- (void)setSound:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3 forceRefresh:(BOOL)a4;
- (void)setTimer:(id)a3;
- (void)setTimerLabel:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setTimerViewStyle;
- (void)setTimerViewStyleForceRefresh:(BOOL)a3;
- (void)setupEdgeAppearance;
- (void)setupLayoutForTimerControlState:(unint64_t)a3;
- (void)setupTimerUI:(id)a3;
- (void)showSoundPicker:(id)a3;
- (void)startTimer:(id)a3;
- (void)startUpdatingTimerUI;
- (void)stopUpdatingTimerUI;
- (void)timerTick:(id)a3;
- (void)timersChanged:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSelectedSoundUI;
- (void)updateShortcutItemForCurrentState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTATimerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateSelectedSoundUI
{
  v3 = [(MTATimerViewController *)self timer];
  v4 = [v3 sound];
  v5 = [v4 toneIdentifier];
  v6 = v5;
  if (v5)
  {
    id v17 = v5;
  }
  else
  {
    v7 = [(MTATimerViewController *)self sound];
    id v17 = [v7 toneIdentifier];
  }
  if ((+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    v8 = [(MTATimerViewController *)self timer];
    v9 = [v8 sound];
    unsigned int v10 = [v9 interruptAudio];

    if (v10)
    {
      timerControlsView = self->_timerControlsView;
      v12 = +[NSBundle mainBundle];
      v13 = [v12 localizedStringForKey:@"STOP_PLAYING" value:&stru_1000A2560 table:0];
      v14 = timerControlsView;
    }
    else
    {
      v12 = +[TLToneManager sharedToneManager];
      if ([v12 toneWithIdentifierIsValid:v17])
      {
        id v15 = v17;
      }
      else
      {
        uint64_t v16 = [v12 defaultToneIdentifierForAlertType:13];

        id v15 = (id)v16;
      }
      id v17 = v15;
      v13 = [v12 nameForToneIdentifier:];
      v14 = self->_timerControlsView;
    }
    [(MTATimerControlsView *)v14 setTimerToneName:v13];
  }
}

- (void)startUpdatingTimerUI
{
  updateTimer = self->_updateTimer;
  v4 = MTLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (updateTimer)
  {
    if (v5)
    {
      int v10 = 138543362;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ NSTimer exists", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      int v10 = 138543362;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating an NSTimer to update the UI", (uint8_t *)&v10, 0xCu);
    }

    id v6 = objc_alloc((Class)NSTimer);
    v7 = +[NSDate date];
    v8 = (NSTimer *)[v6 initWithFireDate:v7 interval:self target:"timerTick:" selector:0 userInfo:1 repeats:0.25];
    v9 = self->_updateTimer;
    self->_updateTimer = v8;

    v4 = +[NSRunLoop currentRunLoop];
    [v4 addTimer:self->_updateTimer forMode:NSDefaultRunLoopMode];
  }
}

- (void)stopUpdatingTimerUI
{
  v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidating NSTimer", (uint8_t *)&v5, 0xCu);
  }

  [(NSTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;
}

- (MTATimerViewController)initWithTimer:(id)a3 timerManager:(id)a4 dataSource:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(MTATimerViewController *)self initWithDelegate:a6];
  v14 = v13;
  if (v13)
  {
    [(MTATimerViewController *)v13 setTimer:v10];
    [v10 duration];
    id v15 = +[MTAUtilities durationStringFromInterval:](MTAUtilities, "durationStringFromInterval:");
    [(MTATimerViewController *)v14 setTitle:v15];

    objc_storeStrong((id *)&v14->_timerManager, a4);
    objc_storeStrong((id *)&v14->_dataSource, a5);
    timerControlsView = v14->_timerControlsView;
    if ([v10 isCurrentTimer])
    {
      [(MTATimerControlsView *)timerControlsView setCurrentLabel:0];
    }
    else
    {
      id v17 = [v10 title];
      [(MTATimerControlsView *)timerControlsView setCurrentLabel:v17];
    }
  }

  return v14;
}

- (MTATimerViewController)initWithTimerManager:(id)a3 dataSource:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [(MTATimerViewController *)self initWithDelegate:a5];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timerManager, a3);
    objc_storeStrong((id *)&v12->_dataSource, a4);
  }

  return v12;
}

- (MTATimerViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MTATimerViewController;
  int v5 = [(MTATimerViewController *)&v18 init];
  if (v5)
  {
    id v6 = MTLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v20 = v5;
      __int16 v21 = 2114;
      id v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized with delegate: %{public}@", buf, 0x16u);
    }

    v7 = +[UIImage systemImageNamed:@"timer"];
    v8 = [(MTATimerViewController *)v5 tabBarItem];
    [v8 setImage:v7];

    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"TIMER" value:&stru_1000A2560 table:0];
    [(MTATimerViewController *)v5 setTitle:v10];

    [(MTATimerViewController *)v5 setShouldHandleTimerReload:1];
    [(MTATimerViewController *)v5 setDelegate:v4];
    id v11 = [(MTTimerDataSource *)v5->_dataSource getLatestDuration];
    id v12 = [v11 sound];
    if (v12)
    {
      [(MTATimerViewController *)v5 setSound:v12];
    }
    else
    {
      v13 = +[MTSound defaultSoundForCategory:1];
      [(MTATimerViewController *)v5 setSound:v13];
    }
    [(MTATimerViewController *)v5 setEdgesForExtendedLayout:5];
    v14 = [(MTATimerViewController *)v5 title];
    uint64_t v15 = +[NSUserActivity mtUserActivityWithActivityType:@"com.apple.clock.timer" title:v14];
    userActivity = v5->_userActivity;
    v5->_userActivity = (NSUserActivity *)v15;

    [(MTATimerViewController *)v5 setTimerViewStyle];
  }

  return v5;
}

- (void)dealloc
{
  [(TKTonePickerViewController *)self->_tonePickerViewController setDelegate:0];
  [(NSTimer *)self->_updateTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MTATimerViewController;
  [(MTATimerViewController *)&v3 dealloc];
}

- (void)handleResignActive
{
  id v2 = [(MTATimerViewController *)self view];
  [v2 endEditing:1];
}

- (void)handleBecameActive
{
}

- (void)reloadState:(id)a3
{
}

- (void)reloadStateForCurrentTimer:(id)a3
{
  id v4 = a3;
  int v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reloading timer state", buf, 2u);
  }

  id v6 = [(MTATimerViewController *)self timerManager];
  v7 = [(MTATimerViewController *)self timer];
  v8 = [v7 timerIDString];
  id v9 = [v6 timerWithIdentifier:v8];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100016B8C;
  v17[3] = &unk_1000A15B8;
  v17[4] = self;
  id v10 = [v9 flatMap:v17];
  id v11 = +[NAScheduler mtMainThreadScheduler];
  id v12 = [v10 reschedule:v11];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100016C60;
  v15[3] = &unk_1000A15E0;
  v15[4] = self;
  id v16 = v4;
  id v13 = v4;
  id v14 = [v12 addSuccessBlock:v15];
}

- (void)reloadStateForMultipleTimers:(id)a3
{
  id v4 = a3;
  int v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Reloading timer state", buf, 0xCu);
  }

  id v6 = [(MTATimerViewController *)self timer];

  if (v6)
  {
    v7 = [(MTATimerViewController *)self timerManager];
    v8 = [v7 timers];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001703C;
    v20[3] = &unk_1000A1630;
    v20[4] = self;
    id v9 = [v8 flatMap:v20];
    id v10 = +[NAScheduler mtMainThreadScheduler];
    id v11 = [v9 reschedule:v10];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100017220;
    v18[3] = &unk_1000A15E0;
    v18[4] = self;
    id v12 = v4;
    id v19 = v12;
    id v13 = [v11 addSuccessBlock:v18];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100017318;
    v16[3] = &unk_1000A1658;
    v16[4] = self;
    id v17 = v12;
    id v14 = [v13 addFailureBlock:v16];
  }
  else
  {
    uint64_t v15 = MTLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ new timer ui, not reloading state", buf, 0xCu);
    }
  }
}

- (void)setupTimerUI:(id)a3
{
  timerControlsView = self->_timerControlsView;
  [a3 duration];
  -[MTATimerControlsView setCountDownDuration:](timerControlsView, "setCountDownDuration:");
  [(MTATimerViewController *)self reloadTimerUI];

  [(MTATimerViewController *)self updateSelectedSoundUI];
}

- (void)reloadState
{
}

- (void)saveState
{
  objc_super v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Saving timer state", buf, 0xCu);
  }

  id v4 = [(MTATimerViewController *)self timerManager];
  int v5 = [(MTATimerViewController *)self timer];
  id v6 = [v5 timerIDString];
  v7 = [v4 timerWithIdentifier:v6];
  v8 = +[NAScheduler mtMainThreadScheduler];
  id v9 = [v7 reschedule:v8];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100017590;
  v11[3] = &unk_1000A16A8;
  v11[4] = self;
  id v10 = [v9 addSuccessBlock:v11];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTATimerViewController;
  [(MTATimerViewController *)&v11 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  v7 = [(MTATimerViewController *)self traitCollection];
  id v8 = [v7 horizontalSizeClass];
  if (v8 == [v6 horizontalSizeClass])
  {
  }
  else
  {
    id v9 = [v6 verticalSizeClass];

    if (v9 == (id)2)
    {
      id v10 = [(TKTonePickerViewController *)self->_tonePickerViewController presentingViewController];

      if (v10) {
        [(MTATimerViewController *)self dismissSoundPicker];
      }
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  self->_layoutForTraitChange = 1;
  [(MTATimerViewController *)self setTimerViewStyleForceRefresh:1];
  id v4 = [(MTATimerViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)setStyle:(unint64_t)a3
{
}

- (void)setStyle:(unint64_t)a3 forceRefresh:(BOOL)a4
{
  if (self->_style != a3 || a4)
  {
    self->_style = a3;
    -[MTATimerControlsView setStyle:forceRefresh:](self->_timerControlsView, "setStyle:forceRefresh:");
    timerControlsView = self->_timerControlsView;
    [(MTATimerControlsView *)timerControlsView resetLayout];
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)MTATimerViewController;
  [(MTATimerViewController *)&v5 viewDidLayoutSubviews];
  [(MTATimerViewController *)self setTimerViewStyle];
  timerControlsView = self->_timerControlsView;
  id v4 = [(MTATimerViewController *)self view];
  [v4 bounds];
  -[MTATimerControlsView setFrame:](timerControlsView, "setFrame:");

  self->_layoutForTraitChange = 0;
}

- (void)setTimerViewStyle
{
}

- (void)setTimerViewStyleForceRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[UIApplication sharedApplication];
  id v6 = [v5 windows];
  id v12 = [v6 firstObject];

  v7 = [(MTATimerViewController *)self traitCollection];
  id v8 = [v7 horizontalSizeClass];
  [v12 frame];
  LODWORD(v5) = +[MTAUtilities shouldUseCompactLayoutForSizeClass:v8 windowWidth:v9];

  if (v5)
  {
    if (MTIdiomIpad())
    {
      id v10 = [(MTATimerViewController *)self timer];
      if ([v10 state] == (id)1) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 5;
      }
    }
    else
    {
      uint64_t v11 = 1;
    }
  }
  else
  {
    uint64_t v11 = 3;
  }
  [(MTATimerViewController *)self setStyle:v11 forceRefresh:v3];
}

- (void)loadView
{
  v19.receiver = self;
  v19.super_class = (Class)MTATimerViewController;
  [(MTATimerViewController *)&v19 loadView];
  BOOL v3 = [(MTATimerViewController *)self timer];
  if ([v3 state] == (id)3)
  {
    BOOL v4 = 1;
  }
  else
  {
    objc_super v5 = [(MTATimerViewController *)self timer];
    BOOL v4 = [v5 state] == (id)2 || self->_style == 3;
  }
  id v6 = [[MTATimerControlsView alloc] initWithDelegate:self style:self->_style timerControlState:v4];
  timerControlsView = self->_timerControlsView;
  self->_timerControlsView = v6;

  id v8 = [(MTATimerViewController *)self view];
  [v8 addSubview:self->_timerControlsView];

  double v9 = [(MTATimerViewController *)self timer];
  if (v9 || MTIdiomIpad())
  {

    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"handleEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

    uint64_t v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"handleBecameActive" name:UIApplicationDidBecomeActiveNotification object:0];

    id v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:self selector:"handleResignActive" name:UIApplicationWillResignActiveNotification object:0];

    id v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:self selector:"timersChanged:" name:MTTimerManagerTimersChanged object:self->_timerManager];

    id v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:self selector:"timersChanged:" name:MTTimerManagerFiringTimerChanged object:self->_timerManager];

    uint64_t v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:self selector:"timersChanged:" name:MTTimerManagerPreferencesChanged object:self->_timerManager];

    id v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:self selector:"timersChanged:" name:MTTimerManagerStateReset object:self->_timerManager];

    id v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:self selector:"handleContentSizeChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  [(MTATimerViewController *)self setupLayoutForTimerControlState:v4];
  [(MTATimerViewController *)self reloadState];
  objc_super v18 = [(MTATimerViewController *)self navigationItem];
  [v18 setLargeTitleDisplayMode:2];

  [(MTATimerViewController *)self setupEdgeAppearance];
}

- (void)setupEdgeAppearance
{
  id v4 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v4 configureWithOpaqueBackground];
  [v4 setShadowColor:0];
  BOOL v3 = [(MTATimerViewController *)self navigationItem];
  [v3 setScrollEdgeAppearance:v4];
}

- (void)setupLayoutForTimerControlState:(unint64_t)a3
{
  if (a3 == 1
    && ([(MTATimerViewController *)self timer],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_super v5 = [(MTATimerViewController *)self timer];
    [(MTATimerViewController *)self setupTimerUI:v5];
  }
  else
  {
    [(MTATimerViewController *)self reloadState];
    timerControlsView = self->_timerControlsView;
    objc_super v5 = [(MTATimerViewController *)self dataSource];
    v7 = [v5 getLatestDuration];
    [v7 duration];
    -[MTATimerControlsView setCountDownDuration:](timerControlsView, "setCountDownDuration:");
  }

  [(MTATimerViewController *)self setTimerViewStyle];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTATimerViewController;
  [(MTATimerViewController *)&v6 viewWillAppear:a3];
  [(MTATimerViewController *)self reloadTimerUI];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];

  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];
}

- (void)reloadTimerUI
{
}

- (void)reloadTimerUiForceRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    double v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Reloading UI, force refresh: %i", (uint8_t *)&v8, 0x12u);
  }

  objc_super v6 = [(MTATimerViewController *)self timer];
  if (v6)
  {
    v7 = [(MTATimerViewController *)self timer];
    -[MTATimerViewController prepareUIForState:forceRefresh:](self, "prepareUIForState:forceRefresh:", [v7 state], v3);
  }
  else
  {
    [(MTATimerViewController *)self prepareUIForState:1 forceRefresh:v3];
  }
}

- (void)prepareUIForState:(unint64_t)a3
{
}

- (void)prepareUIForState:(unint64_t)a3 forceRefresh:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = MTLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    objc_super v19 = self;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Preparing UI for state %lu", buf, 0x16u);
  }

  timerControlsView = self->_timerControlsView;
  double v9 = [(MTATimerViewController *)self timer];
  [v9 remainingTime];
  double v11 = v10;
  id v12 = [(MTATimerViewController *)self timer];
  [v12 duration];
  double v14 = v13;
  uint64_t v15 = [(MTATimerViewController *)self timer];
  if ([v15 isCurrentTimer])
  {
    [(MTATimerControlsView *)timerControlsView setRemainingTime:a3 duration:0 state:v4 title:v11 forceRefresh:v14];
  }
  else
  {
    id v16 = [(MTATimerViewController *)self timer];
    id v17 = [v16 title];
    [(MTATimerControlsView *)timerControlsView setRemainingTime:a3 duration:v17 state:v4 title:v11 forceRefresh:v14];
  }
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
      NSLog(@"Unexpected timer state %ld", a3);
      break;
    case 1uLL:
      [(MTATimerViewController *)self stopUpdatingTimerUI];
      break;
    case 2uLL:
      [(MTATimerViewController *)self stopUpdatingTimerUI];
      [(MTATimerViewController *)self timerTick:0];
      break;
    case 3uLL:
      [(MTATimerViewController *)self timerTick:0];
      [(MTATimerViewController *)self startUpdatingTimerUI];
      break;
    default:
      return;
  }
}

- (void)timerTick:(id)a3
{
  BOOL v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ timerTick", buf, 0xCu);
  }

  objc_super v5 = [(MTATimerViewController *)self timer];
  [v5 remainingTime];
  double v7 = v6;
  switch((unint64_t)[v5 state])
  {
    case 0uLL:
    case 4uLL:
      NSLog(@"Unexpected timer state %ld", [v5 state]);
      break;
    case 1uLL:
      [(MTATimerViewController *)self prepareUIForState:1];
      timerControlsView = self->_timerControlsView;
      double v10 = 0.0;
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
      int v8 = MTLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v12 = self;
        __int16 v13 = 2048;
        double v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ remainingTime: %f", buf, 0x16u);
      }

      timerControlsView = self->_timerControlsView;
      double v10 = v7;
LABEL_9:
      [(MTATimerControlsView *)timerControlsView setTime:v10];
      break;
    default:
      break;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTATimerViewController;
  [(MTATimerViewController *)&v4 viewDidAppear:a3];
  [(NSUserActivity *)self->_userActivity becomeCurrent];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MTATimerViewController *)self saveState];
  [(MTATimerViewController *)self stopUpdatingTimerUI];
  [(NSUserActivity *)self->_userActivity resignCurrent];
  v10.receiver = self;
  v10.super_class = (Class)MTATimerViewController;
  [(MTATimerViewController *)&v10 viewWillDisappear:v3];
  if ([(MTATimerViewController *)self isMovingFromParentViewController])
  {
    objc_super v5 = MTLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = [(MTATimerViewController *)self timer];
      *(_DWORD *)buf = 138543618;
      id v12 = self;
      __int16 v13 = 2114;
      double v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ popping MTATimerViewController with timer: %{public}@", buf, 0x16u);
    }
    double v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self];
  }
  int v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self name:UIKeyboardWillShowNotification object:0];

  double v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self name:UIKeyboardWillHideNotification object:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTATimerViewController;
  id v7 = a4;
  -[MTATimerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100018770;
  v8[3] = &unk_1000A1400;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (BOOL)prefersStatusBarHidden
{
  id v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 0;
  }
  objc_super v5 = +[UIApplication sharedApplication];
  double v6 = [v5 delegate];

  BOOL v4 = (char *)[v6 interfaceOrientation] - 3 < (char *)2;
  return v4;
}

- (void)handleContentSizeChange:(id)a3
{
  [(MTATimerControlsView *)self->_timerControlsView handleContentSizeChange];
  id v4 = [(MTATimerViewController *)self view];
  [v4 setNeedsDisplay];
}

- (void)keyboardWillShow:(id)a3
{
  id v27 = a3;
  id v4 = [(MTATimerControlsView *)self->_timerControlsView editLabelCell];
  objc_super v5 = v4;
  if (v4)
  {
    [v4 frame];
    double v7 = v6;
    double v9 = v8;
    objc_super v10 = [(MTATimerViewController *)self view];
    [v5 convertPoint:v10 toView:v7];
    double v12 = v11;

    __int16 v13 = [(MTATimerViewController *)self navigationController];
    double v14 = [v13 navigationBar];
    [v14 frame];
    double v16 = v12 + v15;
    [v5 frame];
    double v18 = v16 + v17 * 2.0;

    objc_super v19 = [v27 userInfo];
    __int16 v20 = [v19 objectForKey:UIKeyboardFrameEndUserInfoKey];
    [v20 CGRectValue];
    double v22 = v21;

    v23 = [(MTATimerViewController *)self view];
    [v23 frame];
    double v25 = v24 - v22;

    double v26 = v18 - v25;
    if (v18 - v25 > 0.0)
    {
      *(float *)&double v26 = v26;
      *(float *)&double v26 = -*(float *)&v26;
      [(MTATimerViewController *)self moveViewFrameToVerticalPosition:v26];
    }
  }
}

- (void)keyboardWillHide:(id)a3
{
}

- (void)moveViewFrameToVerticalPosition:(float)a3
{
  objc_super v5 = [(MTATimerViewController *)self view];
  [v5 frame];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100018A94;
  v12[3] = &unk_1000A16D0;
  v12[4] = self;
  v12[5] = v7;
  *(double *)&v12[6] = a3;
  v12[7] = v9;
  v12[8] = v11;
  +[UIView animateWithDuration:v12 animations:0.3];
}

- (void)updateShortcutItemForCurrentState
{
  unint64_t v3 = +[UIApplication sharedApplication];
  id v4 = [v3 shortcutItems];
  id v8 = [v4 mutableCopy];

  id v5 = [v8 indexOfObjectPassingTest:&stru_1000A1710];
  uint64_t v6 = [(MTATimerViewController *)self shortcutItemForCurrentState];
  if (v6)
  {
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
      [v8 addObject:v6];
    }
    else {
      [v8 replaceObjectAtIndex:v5 withObject:v6];
    }
    uint64_t v7 = +[UIApplication sharedApplication];
    [v7 setShortcutItems:v8];
  }
}

- (id)shortcutItemForCurrentState
{
  unint64_t v3 = [(MTATimerViewController *)self timer];

  if (!v3)
  {
    id v5 = 0;
    goto LABEL_8;
  }
  id v4 = [(MTATimerViewController *)self timer];
  if ([v4 state] == (id)1)
  {

LABEL_6:
    id v5 = [(MTATimerViewController *)self startTimerShortcutItem];
    goto LABEL_8;
  }
  uint64_t v6 = [(MTATimerViewController *)self timer];
  id v7 = [v6 state];

  if (v7 == (id)2) {
    goto LABEL_6;
  }
  id v5 = [(MTATimerViewController *)self stopTimerShortcutItem];
LABEL_8:

  return v5;
}

- (id)startTimerShortcutItem
{
  unint64_t v3 = +[UIApplicationShortcutIcon iconWithSystemImageName:@"timer"];
  id v4 = [(MTATimerViewController *)self timer];
  id v5 = [v4 state];

  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v5 == (id)1) {
    CFStringRef v8 = @"START_TIMER_QUICK_ACTION_TITLE";
  }
  else {
    CFStringRef v8 = @"RESUME_TIMER_QUICK_ACTION_TITLE";
  }
  uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_1000A2560 table:@"Localizable-OrbHW"];

  id v10 = objc_alloc((Class)UIApplicationShortcutItem);
  id v11 = [v10 initWithType:kStartTimerActionID localizedTitle:v9 localizedSubtitle:0 icon:v3 userInfo:0];

  return v11;
}

- (id)stopTimerShortcutItem
{
  id v2 = +[UIApplicationShortcutIcon iconWithSystemImageName:@"timer"];
  unint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"STOP_TIMER_QUICK_ACTION_TITLE" value:&stru_1000A2560 table:@"Localizable-OrbHW"];

  id v5 = objc_alloc((Class)UIApplicationShortcutItem);
  id v6 = [v5 initWithType:kStopTimerActionID localizedTitle:v4 localizedSubtitle:0 icon:v2 userInfo:0];

  return v6;
}

- (void)handleStartTimerShortcutAction
{
  id v2 = [(MTATimerViewController *)self delegate];
  [v2 didReceiveStartTimerShortcutAction];
}

- (void)handleStopTimerShortcutAction
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100018FF0;
  v2[3] = &unk_1000A1428;
  v2[4] = self;
  [(MTATimerViewController *)self reloadState:v2];
}

- (void)startTimer:(id)a3
{
  id v4 = a3;
  [(MTATimerControlsView *)self->_timerControlsView countDownDuration];
  if (v5 > 0.0)
  {
    id v6 = [(MTATimerViewController *)self timer];

    if (v6)
    {
      id v7 = [(MTATimerViewController *)self timer];
      id v8 = [v7 mutableCopy];

      uint64_t v9 = MTLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v8 timerID];
        *(_DWORD *)buf = 138543618;
        id v27 = self;
        __int16 v28 = 2114;
        v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting a timer: %{public}@", buf, 0x16u);
      }
      [(MTATimerControlsView *)self->_timerControlsView countDownDuration];
      double v12 = v11;
      [v8 setDuration:];
      [v8 setState:3];
      +[MTTimerManager setDefaultDuration:v12];
      objc_initWeak((id *)buf, self);
      __int16 v13 = [(MTATimerViewController *)self timerManager];
      double v14 = [v13 updateTimer:v8];
      double v15 = +[NAScheduler mtMainThreadScheduler];
      double v16 = [v14 reschedule:v15];

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000192DC;
      v23[3] = &unk_1000A1738;
      objc_copyWeak(&v25, (id *)buf);
      v23[4] = self;
      id v17 = v8;
      id v24 = v17;
      id v18 = [v16 addSuccessBlock:v23];

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(MTATimerControlsView *)self->_timerControlsView countDownDuration];
      double v20 = v19;
      double v21 = [(MTATimerControlsView *)self->_timerControlsView getCurrentLabel];
      double v22 = [(MTATimerViewController *)self sound];
      [(MTATimerViewController *)self addNewTimerWithDuration:v21 title:v22 sound:v20];
    }
  }
}

- (void)addNewTimerWithDuration:(double)a3 title:(id)a4 sound:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)MTMutableTimer) initWithState:3 duration:a3];
  double v11 = v10;
  if (v8) {
    [v10 setTitle:v8];
  }
  if (v9) {
    [v11 setSound:v9];
  }
  objc_initWeak(&location, self);
  double v12 = MTLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = [v11 timerID];
    *(_DWORD *)buf = 138543618;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@ starting new timer: %{public}@ and dismissing add controller", buf, 0x16u);
  }
  double v14 = [(MTATimerViewController *)self dataSource];
  double v15 = [v14 addTimer:v11];
  double v16 = +[NAScheduler mtMainThreadScheduler];
  id v17 = [v15 reschedule:v16];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100019640;
  v20[3] = &unk_1000A1760;
  objc_copyWeak(&v22, &location);
  v20[4] = self;
  id v18 = v11;
  id v21 = v18;
  id v19 = [v17 addCompletionBlock:v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)cancelTimer:(id)a3
{
  id v4 = a3;
  double v5 = [(MTATimerViewController *)self timer];
  id v6 = [v5 timerByUpdatingWithState:1];

  id v7 = MTLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 timerID];
    *(_DWORD *)buf = 138543618;
    id v19 = self;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping a timer: %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v9 = [(MTATimerViewController *)self timerManager];
  id v10 = [v9 updateTimer:v6];
  double v11 = +[NAScheduler mtMainThreadScheduler];
  double v12 = [v10 reschedule:v11];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100019930;
  v15[3] = &unk_1000A1738;
  objc_copyWeak(&v17, (id *)buf);
  v15[4] = self;
  id v13 = v6;
  id v16 = v13;
  id v14 = [v12 addSuccessBlock:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)pauseResumeTimer:(id)a3
{
  id v4 = a3;
  double v5 = [(MTATimerViewController *)self timer];
  id v6 = [v5 state];

  if (v6 == (id)3) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 3;
  }
  id v8 = [(MTATimerViewController *)self timer];
  id v9 = [v8 timerByUpdatingWithState:v7];

  id v10 = MTLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = [v9 timerID];
    *(_DWORD *)buf = 138543618;
    id v24 = self;
    __int16 v25 = 2114;
    __int16 v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Pausing a timer: %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  double v12 = [(MTATimerViewController *)self timerManager];
  id v13 = [v12 updateTimer:v9];
  id v14 = +[NAScheduler mtMainThreadScheduler];
  double v15 = [v13 reschedule:v14];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100019D9C;
  v20[3] = &unk_1000A1788;
  objc_copyWeak(v22, (id *)buf);
  v20[4] = self;
  id v16 = v9;
  id v21 = v16;
  v22[1] = (id)v7;
  id v17 = [v15 addSuccessBlock:v20];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100019EB0;
  v19[3] = &unk_1000A17B0;
  v19[4] = self;
  id v18 = [v15 addFailureBlock:v19];

  objc_destroyWeak(v22);
  objc_destroyWeak((id *)buf);
}

- (void)timersChanged:(id)a3
{
  id v4 = a3;
  double v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Received timer notification: %{public}@.  Reloading", (uint8_t *)&v7, 0x16u);
  }
  [(MTATimerViewController *)self reloadState];
}

- (void)showSoundPicker:(id)a3
{
  id v35 = a3;
  if (!self->_tonePickerViewController)
  {
    id v4 = (TKTonePickerViewController *)[objc_alloc((Class)TKTonePickerViewController) _initWithAlertType:13 tableViewStyle:2];
    tonePickerViewController = self->_tonePickerViewController;
    self->_tonePickerViewController = v4;

    id v6 = +[TLToneManager sharedToneManager];
    int v7 = [v6 defaultToneIdentifierForAlertType:14];
    [(TKTonePickerViewController *)self->_tonePickerViewController setDefaultToneIdentifier:v7];

    id v8 = +[NSBundle mainBundle];
    __int16 v9 = [v8 localizedStringForKey:@"STOP_PLAYING" value:&stru_1000A2560 table:0];
    [(TKTonePickerViewController *)self->_tonePickerViewController setNoneString:v9];

    [(TKTonePickerViewController *)self->_tonePickerViewController setShowsNone:1];
    [(TKTonePickerViewController *)self->_tonePickerViewController setDelegate:self];
    id v10 = objc_opt_new();
    [(TKTonePickerViewController *)self->_tonePickerViewController setStyleProvider:v10];

    double v11 = [(TKTonePickerViewController *)self->_tonePickerViewController navigationItem];
    double v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"WHEN_TIMER_ENDS" value:&stru_1000A2560 table:0];
    [v11 setTitle:v13];

    id v14 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"dismissSoundPicker"];
    [v11 setLeftBarButtonItem:v14];

    id v15 = objc_alloc((Class)UIBarButtonItem);
    id v16 = +[NSBundle mainBundle];
    id v17 = [v16 localizedStringForKey:@"SET" value:&stru_1000A2560 table:0];
    id v18 = [v15 initWithTitle:v17 style:2 target:self action:"confirmPickingSound"];
    [v11 setRightBarButtonItem:v18];
  }
  id v19 = [(MTATimerViewController *)self timer];
  __int16 v20 = [v19 sound];
  id v21 = [v20 toneIdentifier];
  [(TKTonePickerViewController *)self->_tonePickerViewController setSelectedToneIdentifier:v21];

  [(TKTonePickerViewController *)self->_tonePickerViewController setShowsToneStore:MTShouldAllowToneStore()];
  id v22 = +[NSNotificationCenter defaultCenter];
  [v22 addObserver:self selector:"confirmPickingSound" name:UIApplicationSuspendedNotification object:0];

  id v23 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_tonePickerViewController];
  [v23 setDelegate:self];
  if (self->_style == 3)
  {
    [v23 setModalPresentationStyle:2];
    id v24 = [v23 popoverPresentationController];
    [v24 setDelegate:self];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v35;
      [v25 bounds];
      double x = v26;
      double y = v28;
      double width = v30;
      double height = v32;
    }
    else
    {
      id v25 = 0;
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
    }
    [v24 setSourceView:v25];
    [v24 setSourceRect:x, y, width, height];
    v34 = +[UIColor mtui_backgroundColor];
    [v24 setBackgroundColor:v34];
  }
  [(MTATimerViewController *)self presentViewController:v23 animated:1 completion:0];
}

- (void)confirmPickingSound
{
  unint64_t v3 = [(TKTonePickerViewController *)self->_tonePickerViewController selectedToneIdentifier];
  if (!v3)
  {
    unint64_t v3 = [(TKTonePickerViewController *)self->_tonePickerViewController defaultToneIdentifier];
  }
  id v4 = [(MTATimerViewController *)self timer];

  if (v4)
  {
    double v5 = [(MTATimerViewController *)self timer];
    id v6 = [v5 sound];

    int v7 = [v6 vibrationIdentifier];
    id v8 = [v6 soundVolume];
    __int16 v9 = +[MTSound toneSoundWithIdentifier:v3 vibrationIdentifer:v7 volume:v8];

    id v10 = [(MTATimerViewController *)self timer];
    id v11 = [v10 mutableCopy];

    [v11 setSound:v9];
    double v12 = [(MTATimerViewController *)self timerManager];
    id v13 = [v12 updateTimer:v11];
    id v14 = +[NAScheduler mtMainThreadScheduler];
    id v15 = [v13 reschedule:v14];

    id v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    id v25 = sub_10001A6E0;
    double v26 = &unk_1000A1680;
    id v27 = self;
    id v28 = v11;
    id v16 = v11;
    id v17 = [v15 addSuccessBlock:&v23];
  }
  else
  {
    id v18 = [(MTATimerViewController *)self sound];
    id v19 = [v18 vibrationIdentifier];
    __int16 v20 = [(MTATimerViewController *)self sound];
    id v21 = [v20 soundVolume];
    id v22 = +[MTSound toneSoundWithIdentifier:v3 vibrationIdentifer:v19 volume:v21];
    [(MTATimerViewController *)self setSound:v22];

    [(MTATimerViewController *)self updateSelectedSoundUI];
  }
  [(MTATimerViewController *)self dismissSoundPicker];
}

- (void)dismissSoundPicker
{
  unint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationSuspendedNotification object:0];

  id v4 = [(MTATimerViewController *)self presentedViewController];
  double v5 = [v4 popoverPresentationController];

  if (v5)
  {
    id v6 = [(MTATimerViewController *)self navigationItem];
    int v7 = [v6 leftBarButtonItem];
    [v7 setEnabled:1];
  }
  id v8 = +[UIApplication sharedApplication];
  -[MTATimerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", [v8 isSuspended] ^ 1, 0);
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  if (MTUIIsPadIdiom()) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  [(MTATimerViewController *)self confirmPickingSound];
  id v5 = [(MTATimerViewController *)self navigationItem];
  id v4 = [v5 leftBarButtonItem];
  [v4 setEnabled:1];
}

- (void)didUpdateWithLabel:(id)a3 sender:(id)a4
{
  -[MTATimerViewController setTimerLabel:](self, "setTimerLabel:", a3, a4);
  id v5 = [(MTATimerViewController *)self timer];

  if (v5)
  {
    id v6 = [(MTATimerViewController *)self timer];
    id v7 = [v6 mutableCopy];

    id v8 = [(MTATimerViewController *)self timerLabel];
    [v7 setTitle:v8];

    __int16 v9 = [(MTATimerViewController *)self timerManager];
    id v10 = [v9 updateTimer:v7];
    id v11 = +[NAScheduler mtMainThreadScheduler];
    double v12 = [v10 reschedule:v11];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001A9F4;
    v15[3] = &unk_1000A1680;
    v15[4] = self;
    id v16 = v7;
    id v13 = v7;
    id v14 = [v12 addSuccessBlock:v15];
  }
}

- (id)defaultEditLabel
{
  id v2 = +[NSBundle mainBundle];
  unint64_t v3 = [v2 localizedStringForKey:@"Timer" value:&stru_1000A2560 table:0];

  return v3;
}

- (void)removeNotificationObserver
{
  unint64_t v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification observer", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (BOOL)shouldHandleTimerReload
{
  return self->_shouldHandleTimerReload;
}

- (void)setShouldHandleTimerReload:(BOOL)a3
{
  self->_shouldHandleTimerReload = a3;
}

- (MTTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (MTTimerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (MTATimerRunningDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTATimerRunningDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)timerLabel
{
  return self->_timerLabel;
}

- (void)setTimerLabel:(id)a3
{
}

- (MTSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_timerLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_tonePickerViewController, 0);

  objc_storeStrong((id *)&self->_timerControlsView, 0);
}

@end