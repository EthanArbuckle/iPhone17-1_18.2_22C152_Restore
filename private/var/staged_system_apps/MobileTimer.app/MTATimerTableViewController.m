@interface MTATimerTableViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (MTATimerTableViewController)initWithTimerManager:(id)a3 dataSource:(id)a4;
- (MTSound)sound;
- (MTTimer)timerToEdit;
- (MTTimerDataSource)dataSource;
- (MTTimerManager)timerManager;
- (NAFuture)reloadDataFuture;
- (TKTonePickerViewController)tonePickerViewController;
- (_TtC11MobileTimer18SiriTipsController)siriTipsController;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)addViewController;
- (id)currentTone;
- (id)defaultEditLabel;
- (id)noItemsText;
- (id)singleTimerCell;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)timerAddEditController;
- (int64_t)numberOfItems;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_reloadData:(id)a3;
- (void)_reloadDataIfNecessary;
- (void)_removeTimer:(id)a3 withCompletionBlock:(id)a4;
- (void)confirmPickingSound;
- (void)dataSourceDidReload:(id)a3;
- (void)dataSourceDidReloadAllDurations:(id)a3;
- (void)dataSourceDidReloadRecentDurations:(id)a3;
- (void)dealloc;
- (void)didCancelTimerWithSender:(id)a3;
- (void)didReceiveStartTimerShortcutAction;
- (void)didSelectRecentDuration:(id)a3;
- (void)didSendPauseAction:(id)a3;
- (void)didSendResumeAction:(id)a3;
- (void)didStartTimerWithDuration:(double)a3 title:(id)a4 sound:(id)a5 sender:(id)a6;
- (void)dismissAddEditViewController:(id)a3;
- (void)dismissSoundPicker;
- (void)handleStartTimerShortcutAction;
- (void)popTimerViewController;
- (void)reloadSections;
- (void)setDataSource:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setReloadDataFuture:(id)a3;
- (void)setSiriTipsController:(id)a3;
- (void)setSound:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setTimerToEdit:(id)a3;
- (void)setTonePickerViewController:(id)a3;
- (void)showAddView;
- (void)showSoundPicker:(id)a3;
- (void)startTimer:(id)a3;
- (void)startUpdatingTimerUI;
- (void)stopUpdatingTimerUI;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tipViewControllerDidBecomeAvailableWithSiriTipsController:(id)a3 tipView:(id)a4;
- (void)tipViewControllerWasInvalidatedWithSiriTipsController:(id)a3;
- (void)updateAddButton;
- (void)updateSelectedSoundCell:(id)a3;
- (void)updateSelectedSoundUI;
- (void)updateTimerTick:(id)a3;
- (void)updateTimerWithSender:(id)a3 state:(unint64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MTATimerTableViewController

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a4];
  id v6 = [v5 integerValue];

  int64_t result = 1;
  switch((unint64_t)v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      v8 = [(MTATimerTableViewController *)self dataSource];
      id v9 = [v8 numberOfActiveTimers];

      int64_t result = (int64_t)v9;
      break;
    case 2uLL:
      v10 = [(MTATimerTableViewController *)self dataSource];
      v11 = [v10 getRecentDurations];
      id v12 = [v11 count];

      int64_t result = (int64_t)v12;
      break;
    case 3uLL:
      int64_t result = self->_siriTipView != 0;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (void)stopUpdatingTimerUI
{
  v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopUpdatingTimerUI", (uint8_t *)&v5, 0xCu);
  }

  [(NSTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;
}

- (void)updateSelectedSoundUI
{
  if ((+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    uint64_t v3 = [(MTATimerTableViewController *)self singleTimerCell];
    if (v3) {
      [(MTATimerTableViewController *)self updateSelectedSoundCell:v3];
    }
    _objc_release_x1();
  }
}

- (id)singleTimerCell
{
  id v3 = [(NSMutableArray *)self->_sections indexOfObject:&off_1000A4F28];
  v4 = [(MTATimerTableViewController *)self tableView];
  int v5 = +[NSIndexPath indexPathForRow:0 inSection:v3];
  id v6 = [v4 cellForRowAtIndexPath:v5];

  return v6;
}

- (MTATimerTableViewController)initWithTimerManager:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MTATimerTableViewController;
  v8 = [(MTATableViewController *)&v21 initWithTableViewStyle:1];
  if (v8)
  {
    id v9 = +[UIImage systemImageNamed:@"timer"];
    v10 = [(MTATimerTableViewController *)v8 tabBarItem];
    [v10 setImage:v9];

    v11 = +[NSBundle mainBundle];
    id v12 = [v11 localizedStringForKey:@"TIMERS" value:&stru_1000A2560 table:0];
    [(MTATimerTableViewController *)v8 setTitle:v12];

    [(MTATimerTableViewController *)v8 setTimerManager:v6];
    [(MTATimerTableViewController *)v8 setDataSource:v7];
    v13 = [(MTATimerTableViewController *)v8 dataSource];
    [v13 registerObserver:v8];

    v14 = [(MTATimerTableViewController *)v8 title];
    uint64_t v15 = +[NSUserActivity mtUserActivityWithActivityType:@"com.apple.clock.timer" title:v14];
    userActivity = v8->_userActivity;
    v8->_userActivity = (NSUserActivity *)v15;

    uint64_t v17 = objc_opt_new();
    sections = v8->_sections;
    v8->_sections = (NSMutableArray *)v17;

    v19 = v8;
  }

  return v8;
}

- (void)_reloadData:(id)a3
{
  id v4 = a3;
  int v5 = [(MTTimerDataSource *)self->_dataSource reloadTimers];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C704;
  v8[3] = &unk_1000A1A60;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 addCompletionBlock:v8];
  [(MTATimerTableViewController *)self setReloadDataFuture:v5];
  [(MTTimerDataSource *)self->_dataSource reloadTimerDurations];
}

- (void)setReloadDataFuture:(id)a3
{
}

- (void)dataSourceDidReloadAllDurations:(id)a3
{
  [(MTATableViewController *)self _reloadUI:0];
  id v4 = [(MTATimerTableViewController *)self currentTone];
  [(MTATimerTableViewController *)self setSound:v4];

  [(MTATimerTableViewController *)self updateSelectedSoundUI];
}

- (void)setSound:(id)a3
{
}

- (id)currentTone
{
  id v3 = [(MTATimerTableViewController *)self sound];

  if (v3)
  {
    uint64_t v4 = [(MTATimerTableViewController *)self sound];
LABEL_3:
    int v5 = (void *)v4;
    goto LABEL_6;
  }
  id v6 = [(MTTimerDataSource *)self->_dataSource getLatestDuration];
  id v7 = [v6 sound];

  if (!v7)
  {
    uint64_t v4 = +[MTSound defaultSoundForCategory:1];
    goto LABEL_3;
  }
  v8 = [(MTTimerDataSource *)self->_dataSource getLatestDuration];
  int v5 = [v8 sound];

LABEL_6:

  return v5;
}

- (MTSound)sound
{
  return self->_sound;
}

- (void)dataSourceDidReload:(id)a3
{
  [(MTATableViewController *)self _reloadUI:0];
  [(MTATimerTableViewController *)self reloadSections];
  [(MTATimerTableViewController *)self updateAddButton];
  uint64_t v4 = [(MTATimerTableViewController *)self tableView];
  [v4 reloadData];

  if ([(MTTimerDataSource *)self->_dataSource numberOfActiveTimers])
  {
    [(MTATimerTableViewController *)self startUpdatingTimerUI];
  }
  else
  {
    [(MTATimerTableViewController *)self stopUpdatingTimerUI];
  }
}

- (void)updateAddButton
{
  if ([(MTTimerDataSource *)self->_dataSource numberOfActiveTimers])
  {
    id v4 = [(MTATableViewController *)self addButton];
    id v3 = [(MTATimerTableViewController *)self navigationItem];
    [v3 setRightBarButtonItem:v4];
  }
  else
  {
    id v4 = [(MTATimerTableViewController *)self navigationItem];
    [v4 setRightBarButtonItem:0];
  }
}

- (void)reloadSections
{
  [(NSMutableArray *)self->_sections removeAllObjects];
  if (self->_siriTipView) {
    [(NSMutableArray *)self->_sections addObject:&off_1000A4EF8];
  }
  id v3 = [(MTTimerDataSource *)self->_dataSource numberOfActiveTimers];
  sections = self->_sections;
  if (v3)
  {
    [(NSMutableArray *)sections addObject:&off_1000A4F10];
    int v5 = [(MTATableViewController *)self addButton];
    id v6 = [(MTATimerTableViewController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];
  }
  else
  {
    [(NSMutableArray *)sections addObject:&off_1000A4F28];
    int v5 = [(MTATimerTableViewController *)self navigationItem];
    [v5 setRightBarButtonItem:0];
  }

  id v7 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = self->_sections;
    [(NSMutableArray *)v9 addObject:&off_1000A4F40];
  }
}

- (int64_t)numberOfItems
{
  id v3 = [(MTATimerTableViewController *)self dataSource];
  id v4 = (char *)[v3 numberOfActiveTimers];
  int v5 = [(MTATimerTableViewController *)self dataSource];
  id v6 = [v5 getRecentDurations];
  id v7 = &v4[(void)[v6 count]];

  return (int64_t)v7;
}

- (MTTimerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)MTATimerTableViewController;
  [(MTATableViewController *)&v16 viewDidLoad];
  id v3 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v3 configureWithOpaqueBackground];
  [v3 setShadowColor:0];
  id v4 = [(MTATimerTableViewController *)self navigationItem];
  [v4 setScrollEdgeAppearance:v3];

  int v5 = [(MTATimerTableViewController *)self tableView];
  [v5 setAllowsSelectionDuringEditing:1];

  id v6 = [(MTATimerTableViewController *)self tableView];
  [v6 setAllowsSelection:1];

  id v7 = [(MTATimerTableViewController *)self tableView];
  [v7 setLayoutMarginsFollowReadableWidth:1];

  id v8 = [(MTATimerTableViewController *)self tableView];
  [v8 setEstimatedRowHeight:96.0];

  id v9 = [(MTATimerTableViewController *)self tableView];
  [v9 setRowHeight:UITableViewAutomaticDimension];

  v10 = [(MTATimerTableViewController *)self tableView];
  [v10 registerClass:objc_opt_class() forCellReuseIdentifier:@"MTATimerCellReuseIdentifier"];

  v11 = [(MTATimerTableViewController *)self tableView];
  [v11 registerClass:objc_opt_class() forCellReuseIdentifier:@"kMTATimerRecentCelldentifier"];

  id v12 = [(MTATimerTableViewController *)self tableView];
  [v12 registerClass:objc_opt_class() forCellReuseIdentifier:@"kMTASingleTimerCelldentifier"];

  v13 = [(MTATimerTableViewController *)self tableView];
  [v13 registerClass:objc_opt_class() forCellReuseIdentifier:@"kMTATimerTipTableViewCellIdentifier"];

  v14 = [(MTATimerTableViewController *)self tableView];
  [v14 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kMTATimerTableViewHeaderReuseIdentifier"];

  uint64_t v15 = +[NSNotificationCenter defaultCenter];
  [v15 addObserver:self selector:"handleEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

  +[MTAUtilities updateTimerAppShortcuts];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)[(NSMutableArray *)self->_sections count];
}

- (void)setTimerManager:(id)a3
{
}

- (void)setSiriTipsController:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (id)noItemsText
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTATimerTableViewController;
  [(MTATableViewController *)&v7 viewWillAppear:a3];
  [(MTATimerTableViewController *)self startUpdatingTimerUI];
  id v4 = [(MTATimerTableViewController *)self timerToEdit];

  if (v4) {
    [(MTATimerTableViewController *)self setTimerToEdit:0];
  }
  int v5 = [(MTATimerTableViewController *)self siriTipsController];
  [v5 setDelegate:self];

  id v6 = [(MTATimerTableViewController *)self siriTipsController];
  [v6 checkForSiriTips];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MTATableViewController *)self saveState];
  [(MTATimerTableViewController *)self stopUpdatingTimerUI];
  [(NSUserActivity *)self->_userActivity resignCurrent];
  int v5 = [(MTATimerTableViewController *)self siriTipsController];
  [v5 setDelegate:0];

  id v6 = [(MTATimerTableViewController *)self siriTipsController];
  [v6 cancel];

  siriTipView = self->_siriTipView;
  self->_siriTipView = 0;

  v8.receiver = self;
  v8.super_class = (Class)MTATimerTableViewController;
  [(MTATimerTableViewController *)&v8 viewWillDisappear:v3];
}

- (void)dealloc
{
  [(NSTimer *)self->_updateTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MTATimerTableViewController;
  [(MTATableViewController *)&v3 dealloc];
}

- (void)_reloadDataIfNecessary
{
  objc_super v3 = [(MTATimerTableViewController *)self reloadDataFuture];

  if (!v3)
  {
    [(MTATimerTableViewController *)self _reloadData:0];
  }
}

- (void)dataSourceDidReloadRecentDurations:(id)a3
{
  [(MTATableViewController *)self _reloadUI:0];
  [(MTATimerTableViewController *)self reloadSections];
  id v4 = [(MTATimerTableViewController *)self tableView];
  [v4 reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTATimerTableViewController;
  [(MTATableViewController *)&v4 viewDidAppear:a3];
  [(NSUserActivity *)self->_userActivity becomeCurrent];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_viewVisible = 0;
  [(NSUserActivity *)self->_userActivity resignCurrent];
  v5.receiver = self;
  v5.super_class = (Class)MTATimerTableViewController;
  [(MTATableViewController *)&v5 viewDidDisappear:v3];
}

- (void)startUpdatingTimerUI
{
  updateTimer = self->_updateTimer;
  objc_super v4 = MTLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (updateTimer)
  {
    if (v5)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NSTimer exists", v10, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating an NSTimer to update the UI", buf, 2u);
    }

    id v6 = objc_alloc((Class)NSTimer);
    objc_super v7 = +[NSDate date];
    objc_super v8 = (NSTimer *)[v6 initWithFireDate:v7 interval:self target:"updateTimerTick:" selector:0 userInfo:1 repeats:0.25];
    id v9 = self->_updateTimer;
    self->_updateTimer = v8;

    objc_super v4 = +[NSRunLoop currentRunLoop];
    [v4 addTimer:self->_updateTimer forMode:NSDefaultRunLoopMode];
  }
}

- (void)updateTimerTick:(id)a3
{
  if ([(MTATimerTableViewController *)self isViewLoaded])
  {
    objc_super v4 = [(MTATimerTableViewController *)self tableView];
    BOOL v5 = [v4 indexPathsForVisibleRows];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v9);
          v11 = [(MTATimerTableViewController *)self tableView];
          id v12 = [v11 cellForRowAtIndexPath:v10];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = [v10 row];
            v14 = [(MTATimerTableViewController *)self dataSource];
            id v15 = [v14 numberOfActiveTimers];

            if (v13 < v15)
            {
              objc_super v16 = [(MTATimerTableViewController *)self dataSource];
              uint64_t v17 = [v16 activeTimerAtRow:[v10 row]];

              if ([v17 state] == (id)3) {
                [v12 tickWithTimer:v17];
              }
            }
          }

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
  }
}

- (void)showAddView
{
  [(MTATimerTableViewController *)self dismissAddEditViewController:self];
  [(MTATimerTableViewController *)self setTimerToEdit:0];
  v3.receiver = self;
  v3.super_class = (Class)MTATimerTableViewController;
  [(MTATableViewController *)&v3 showAddView];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v5 section]);
  id v7 = [v6 integerValue];

  switch((unint64_t)v7)
  {
    case 0uLL:
      +[MTATimerControlsView estimatedViewHeight];
      double v9 = v8 + 32.0;
      goto LABEL_15;
    case 1uLL:
      id v10 = [v5 row];
      v11 = [(MTATimerTableViewController *)self dataSource];
      id v12 = [v11 numberOfActiveTimers];

      if (v10 >= v12) {
        goto LABEL_14;
      }
      id v13 = [(MTATimerTableViewController *)self dataSource];
      v14 = [v13 activeTimerAtRow:[v5 row]];

      id v15 = [v14 title];
      +[MTATimerTableViewCell estimatedCellHeightForTimerWithTitle:v15];
      double v9 = v16;

      goto LABEL_15;
    case 2uLL:
      uint64_t v17 = [(MTATimerTableViewController *)self dataSource];
      v18 = [v17 getRecentDurations];
      id v19 = [v18 count];

      if ([v5 row] >= v19)
      {
        v28 = MTLogForCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_10006CF40();
        }
        goto LABEL_13;
      }
      long long v20 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
      long long v21 = [v20 objectAtIndexedSubscript:[v5 row]];

      if (!v21)
      {
        v28 = MTLogForCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_10006CEB8();
        }
LABEL_13:

        goto LABEL_14;
      }
      long long v22 = [v21 title];
      +[MTATimerRecentCell estimatedCellHeightForTimerWithTitle:v22];
      double v9 = v23;

LABEL_15:
      return v9;
    case 3uLL:
      v24 = [(MTATimerTableViewController *)self tableView];
      [v24 bounds];
      +[MTATimerTipTableViewCell sizeThatFits:siriTipView:](MTATimerTipTableViewCell, "sizeThatFits:siriTipView:", self->_siriTipView, v25, v26);
      double v9 = v27;

      goto LABEL_15;
    default:
LABEL_14:
      double v9 = 110.0;
      goto LABEL_15;
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4 == 1 && v9)
  {
    id v11 = [v9 row];
    id v12 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v10 section]);
    id v13 = [v12 integerValue];

    if (v13 == (id)2)
    {
      double v16 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
      id v15 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));

      if (v15)
      {
        uint64_t v17 = [(MTATimerTableViewController *)self timerManager];
        v18 = [v17 removeRecentDuration:v15];

        id v19 = +[NAScheduler mainThreadScheduler];
        long long v20 = [v18 reschedule:v19];
        id v21 = [v20 addCompletionBlock:&stru_1000A1E58];
      }
    }
    else
    {
      if (v13 != (id)1)
      {
LABEL_9:
        v22.receiver = self;
        v22.super_class = (Class)MTATimerTableViewController;
        [(MTATableViewController *)&v22 tableView:v8 commitEditingStyle:1 forRowAtIndexPath:v10];
        goto LABEL_10;
      }
      v14 = [(MTATimerTableViewController *)self dataSource];
      id v15 = [v14 activeTimerAtRow:v11];

      [(MTATimerTableViewController *)self _removeTimer:v15 withCompletionBlock:&stru_1000A1E38];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v7 section]);
  id v9 = [v8 integerValue];

  switch((unint64_t)v9)
  {
    case 0uLL:
      id v10 = [v6 dequeueReusableCellWithIdentifier:@"kMTASingleTimerCelldentifier" forIndexPath:v7];
      [v10 updateDelegate:self];
      id v11 = [(MTTimerDataSource *)self->_dataSource getLatestDuration];
      [v10 updateWithLatestDuration:v11];

      id v12 = [v10 controlsView];
      [v12 setCurrentLabel:0];

      [(MTATimerTableViewController *)self updateSelectedSoundCell:v10];
      goto LABEL_14;
    case 1uLL:
      id v10 = [v6 dequeueReusableCellWithIdentifier:@"MTATimerCellReuseIdentifier" forIndexPath:v7];
      id v13 = [(MTATimerTableViewController *)self dataSource];
      id v14 = [v13 numberOfActiveTimers];

      if ((uint64_t)[v7 row] >= (uint64_t)v14)
      {
        double v27 = MTLogForCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10006D034();
        }
      }
      else
      {
        id v15 = [(MTATimerTableViewController *)self dataSource];
        double v16 = [v15 activeTimerAtRow:[v7 row]];

        if (v16)
        {
          uint64_t v17 = [v16 timerIDString];
          [v10 setAccessibilityIdentifier:v17];

          [v10 setUserInteractionEnabled:1];
          [v10 setDelegate:self];
          [v16 remainingTime];
          double v19 = v18;
          [v16 duration];
          double v21 = v20;
          id v22 = [v16 state];
          if ([v16 hasDefaultTitle])
          {
            [v10 setRemainingTime:v22 duration:0 state:1 title:v19 forceRefresh:v21];
          }
          else
          {
            v29 = [v16 displayTitle];
            [v10 setRemainingTime:v22 duration:v29 state:1 title:v19 forceRefresh:v21];
          }
          goto LABEL_20;
        }
      }
      double v16 = MTLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10006CFB8(v7);
      }
LABEL_20:

LABEL_21:
      return v10;
    case 2uLL:
      double v16 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
      id v23 = [v7 row];
      if (v23 >= [v16 count])
      {
        v24 = MTLogForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_10006D0AC(v7);
        }
      }
      id v10 = [v6 dequeueReusableCellWithIdentifier:@"kMTATimerRecentCelldentifier" forIndexPath:v7];
      double v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"recent-timer-%ld", [v7 row]);
      [v10 setAccessibilityIdentifier:v25];

      double v26 = -[NSObject objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", [v7 row]);
      [v10 setDelegate:self duration:v26];

      [v10 setSelectionStyle:0];
      goto LABEL_20;
    case 3uLL:
      id v10 = [v6 dequeueReusableCellWithIdentifier:@"kMTATimerTipTableViewCellIdentifier" forIndexPath:v7];
      [v10 setSiriTipView:self->_siriTipView];
LABEL_14:
      [v10 setSelectionStyle:0];
      goto LABEL_21;
    default:
      id v10 = 0;
      goto LABEL_21;
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v22 = a4;
  id v7 = a5;
  id v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v7 section]);
  id v9 = [v8 integerValue];

  if (v9 == (id)1)
  {
    id v10 = [v7 row];
    id v11 = [(MTATimerTableViewController *)self dataSource];
    id v12 = [v11 numberOfActiveTimers];

    if (v10 < v12)
    {
      id v13 = [(MTATimerTableViewController *)self dataSource];
      id v14 = [v13 activeTimerAtRow:[v7 row]];

      id v15 = v22;
      [v14 remainingTime];
      double v17 = v16;
      [v14 duration];
      double v19 = v18;
      id v20 = [v14 state];
      if ([v14 isCurrentTimer])
      {
        [v15 setRemainingTime:v20 duration:0 state:1 title:v17 forceRefresh:v19];
      }
      else
      {
        double v21 = [v14 title];
        [v15 setRemainingTime:v20 duration:v21 state:1 title:v17 forceRefresh:v19];
      }
    }
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = [a3 dequeueReusableHeaderFooterViewWithIdentifier:@"kMTATimerTableViewHeaderReuseIdentifier"];
  id v7 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a4];
  id v8 = [v7 integerValue];

  if (v8 == (id)2)
  {
    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"TIMER_ADD_SHEET_RECENTS" value:&stru_1000A2560 table:0];
    id v11 = [(MTATimerTableViewController *)self view];
    id v12 = [MTAUtilities sectionHeaderConfigurationWithTitle:v10 isRTL:[v11 mtui_isRTL]];

    [v6 setContentConfiguration:v12];
    id v13 = v6;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  objc_super v4 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a4];
  id v5 = [v4 integerValue];

  double result = UITableViewAutomaticDimension;
  if (v5 == (id)1) {
    return 0.0;
  }
  return result;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  objc_super v4 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a4];
  id v5 = [v4 integerValue];

  if (v5) {
    BOOL v6 = v5 == (id)3;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  objc_super v4 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a4];
  id v5 = [v4 integerValue];

  if (v5) {
    BOOL v6 = v5 == (id)3;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a4;
  id v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v11 section]);
  id v6 = [v5 integerValue];

  if (v6 == (id)1)
  {
    id v7 = [(MTATimerTableViewController *)self dataSource];
    id v8 = [v7 activeTimerAtRow:[v11 row]];
    [(MTATimerTableViewController *)self setTimerToEdit:v8];

    id v9 = [(MTATimerTableViewController *)self navigationController];
    id v10 = [(MTATimerTableViewController *)self timerAddEditController];
    [v9 pushViewController:v10 animated:1];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  objc_super v4 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [a4 section:a3]);
  id v5 = (char *)[v4 integerValue];

  return (unint64_t)(v5 - 1) < 2;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)MTATimerTableViewController;
  [(MTATimerTableViewController *)&v4 setEditing:a3 animated:a4];
}

- (void)_removeTimer:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 timerID];
    *(_DWORD *)buf = 138543362;
    double v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing timer %{public}@", buf, 0xCu);
  }
  id v10 = [(MTATimerTableViewController *)self dataSource];
  id v11 = [v10 removeTimer:v6];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100046DF0;
  v14[3] = &unk_1000A1E80;
  id v15 = v7;
  id v12 = v7;
  id v13 = [v11 addSuccessBlock:v14];
}

- (id)addViewController
{
  objc_super v3 = [MTAAddSheetNavigationController alloc];
  objc_super v4 = [(MTATimerTableViewController *)self timerAddEditController];
  id v5 = [(MTAAddSheetNavigationController *)v3 initWithRootViewController:v4];

  id v6 = +[UIColor mtui_backgroundColor];
  id v7 = [(MTAAddSheetNavigationController *)v5 view];
  [v7 setBackgroundColor:v6];

  return v5;
}

- (id)timerAddEditController
{
  objc_super v3 = [(MTATimerTableViewController *)self timerToEdit];

  if (v3)
  {
    objc_super v4 = [MTATimerViewController alloc];
    id v5 = [(MTATimerTableViewController *)self timerToEdit];
    id v6 = [(MTATimerViewController *)v4 initWithTimer:v5 timerManager:self->_timerManager dataSource:self->_dataSource delegate:self];
  }
  else
  {
    id v6 = [[MTATimerAddViewController alloc] initWithDataSource:self->_dataSource timerManager:self->_timerManager delegate:self];
  }

  return v6;
}

- (void)didCancelTimerWithSender:(id)a3
{
  [(MTATimerTableViewController *)self dismissAddEditViewController:a3];

  [(MTATimerTableViewController *)self _reloadData:0];
}

- (void)didReceiveStartTimerShortcutAction
{
}

- (void)dismissAddEditViewController:(id)a3
{
  id v5 = a3;
  objc_super v4 = [(MTATimerTableViewController *)self timerToEdit];

  if (v4) {
    [(MTATimerTableViewController *)self popTimerViewController];
  }
  else {
    [(MTATableViewController *)self dismissAddViewController:v5];
  }
}

- (void)popTimerViewController
{
  objc_super v3 = +[UIApplication sharedApplication];
  uint64_t v4 = [v3 isSuspended] ^ 1;

  [(MTATableViewController *)self finishAddViewControllerDismissal:v4];
  id v6 = [(MTATimerTableViewController *)self navigationController];
  id v5 = [v6 popViewControllerAnimated:v4];
}

- (void)didSendPauseAction:(id)a3
{
}

- (void)didSendResumeAction:(id)a3
{
}

- (void)updateTimerWithSender:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(MTATimerTableViewController *)self tableView];
  id v8 = [v7 indexPathForCell:v6];

  id v9 = [(MTATimerTableViewController *)self dataSource];
  id v10 = [v9 activeTimerAtRow:[v8 row]];

  id v11 = MTLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 timerID];
    *(_DWORD *)buf = 138543874;
    v24 = self;
    __int16 v25 = 2114;
    double v26 = v12;
    __int16 v27 = 2048;
    unint64_t v28 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ updating timer:%{public}@ with state: %li", buf, 0x20u);
  }
  id v13 = [v10 timerByUpdatingWithState:a4];
  id v14 = [(MTTimerDataSource *)self->_dataSource updateTimer:v13 reload:1];
  id v15 = +[NAScheduler mtMainThreadScheduler];
  double v16 = [v14 reschedule:v15];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100047314;
  v20[3] = &unk_1000A1EA8;
  v20[4] = self;
  id v21 = v6;
  id v22 = v13;
  id v17 = v13;
  id v18 = v6;
  id v19 = [v16 addSuccessBlock:v20];
}

- (void)didStartTimerWithDuration:(double)a3 title:(id)a4 sound:(id)a5 sender:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)MTMutableTimer) initWithState:3 duration:a3];
  id v14 = v13;
  if (v10) {
    [v13 setTitle:v10];
  }
  if (v11) {
    [v14 setSound:v11];
  }
  id v15 = MTLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    double v16 = [v14 timerID];
    *(_DWORD *)buf = 138543618;
    unint64_t v28 = self;
    __int16 v29 = 2114;
    v30 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@ starting new timer: %{public}@ and dismissing add controller", buf, 0x16u);
  }
  id v17 = [(MTATimerTableViewController *)self dataSource];
  id v18 = [v17 addTimer:v14];
  id v19 = +[NAScheduler mtMainThreadScheduler];
  id v20 = [v18 reschedule:v19];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004768C;
  v24[3] = &unk_1000A1ED0;
  v24[4] = self;
  id v25 = v14;
  id v26 = v12;
  id v21 = v12;
  id v22 = v14;
  id v23 = [v20 addCompletionBlock:v24];
}

- (void)handleStartTimerShortcutAction
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000477B0;
  v2[3] = &unk_1000A1428;
  v2[4] = self;
  [(MTATableViewController *)self reloadState:v2];
}

- (void)didSelectRecentDuration:(id)a3
{
  id v4 = a3;
  [v4 duration];
  double v6 = v5;
  id v8 = [v4 title];
  id v7 = [v4 sound];

  [(MTATimerTableViewController *)self didStartTimerWithDuration:v8 title:v7 sound:0 sender:v6];
}

- (void)showSoundPicker:(id)a3
{
  if (!self->_tonePickerViewController)
  {
    id v4 = (TKTonePickerViewController *)[objc_alloc((Class)TKTonePickerViewController) _initWithAlertType:13 tableViewStyle:2];
    tonePickerViewController = self->_tonePickerViewController;
    self->_tonePickerViewController = v4;

    double v6 = +[TLToneManager sharedToneManager];
    id v7 = [v6 defaultToneIdentifierForAlertType:14];
    [(TKTonePickerViewController *)self->_tonePickerViewController setDefaultToneIdentifier:v7];

    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"STOP_PLAYING" value:&stru_1000A2560 table:0];
    [(TKTonePickerViewController *)self->_tonePickerViewController setNoneString:v9];

    [(TKTonePickerViewController *)self->_tonePickerViewController setShowsNone:1];
    [(TKTonePickerViewController *)self->_tonePickerViewController setDelegate:self];
    id v10 = objc_opt_new();
    [(TKTonePickerViewController *)self->_tonePickerViewController setStyleProvider:v10];

    id v11 = [(TKTonePickerViewController *)self->_tonePickerViewController navigationItem];
    id v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"WHEN_TIMER_ENDS" value:&stru_1000A2560 table:0];
    [v11 setTitle:v13];

    id v14 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"dismissSoundPicker"];
    [v11 setLeftBarButtonItem:v14];

    id v15 = objc_alloc((Class)UIBarButtonItem);
    double v16 = +[NSBundle mainBundle];
    id v17 = [v16 localizedStringForKey:@"SET" value:&stru_1000A2560 table:0];
    id v18 = [v15 initWithTitle:v17 style:2 target:self action:"confirmPickingSound"];
    [v11 setRightBarButtonItem:v18];
  }
  id v19 = [(MTATimerTableViewController *)self currentTone];
  id v20 = [v19 toneIdentifier];
  [(TKTonePickerViewController *)self->_tonePickerViewController setSelectedToneIdentifier:v20];

  [(TKTonePickerViewController *)self->_tonePickerViewController setShowsToneStore:MTShouldAllowToneStore()];
  id v21 = +[NSNotificationCenter defaultCenter];
  [v21 addObserver:self selector:"confirmPickingSound" name:UIApplicationSuspendedNotification object:0];

  id v22 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_tonePickerViewController];
  [v22 setDelegate:self];
  [(MTATimerTableViewController *)self presentViewController:v22 animated:1 completion:0];
}

- (void)confirmPickingSound
{
  uint64_t v3 = [(TKTonePickerViewController *)self->_tonePickerViewController selectedToneIdentifier];
  if (!v3)
  {
    uint64_t v3 = [(TKTonePickerViewController *)self->_tonePickerViewController defaultToneIdentifier];
  }
  id v9 = (id)v3;
  id v4 = [(MTATimerTableViewController *)self sound];
  double v5 = [v4 vibrationIdentifier];
  double v6 = [(MTATimerTableViewController *)self sound];
  id v7 = [v6 soundVolume];
  id v8 = +[MTSound toneSoundWithIdentifier:v9 vibrationIdentifer:v5 volume:v7];
  [(MTATimerTableViewController *)self setSound:v8];

  [(MTATimerTableViewController *)self updateSelectedSoundUI];
  [(MTATimerTableViewController *)self dismissSoundPicker];
}

- (void)dismissSoundPicker
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationSuspendedNotification object:0];

  id v4 = [(MTATimerTableViewController *)self presentedViewController];
  double v5 = [v4 popoverPresentationController];

  if (v5)
  {
    double v6 = [(MTATimerTableViewController *)self navigationItem];
    id v7 = [v6 leftBarButtonItem];
    [v7 setEnabled:1];
  }
  id v8 = +[UIApplication sharedApplication];
  -[MTATimerTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", [v8 isSuspended] ^ 1, 0);
}

- (void)updateSelectedSoundCell:(id)a3
{
  id v13 = a3;
  id v4 = [(MTATimerTableViewController *)self currentTone];
  double v5 = [v4 toneIdentifier];

  double v6 = [(MTATimerTableViewController *)self sound];
  LODWORD(v4) = [v6 interruptAudio];

  if (v4)
  {
    id v7 = [v13 controlsView];
    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"STOP_PLAYING" value:&stru_1000A2560 table:0];
    id v10 = v7;
    id v11 = v9;
  }
  else
  {
    id v7 = +[TLToneManager sharedToneManager];
    if (([v7 toneWithIdentifierIsValid:v5] & 1) == 0)
    {
      uint64_t v12 = [v7 defaultToneIdentifierForAlertType:13];

      double v5 = (void *)v12;
    }
    id v8 = [v7 nameForToneIdentifier:v5];
    id v10 = [v13 controlsView];
    id v9 = v10;
    id v11 = v8;
  }
  [v10 setTimerToneName:v11];
}

- (void)startTimer:(id)a3
{
  id v4 = [(MTATimerTableViewController *)self singleTimerCell];
  if (v4)
  {
    id v11 = v4;
    double v5 = [v4 controlsView];
    [v5 countDownDuration];
    double v7 = v6;
    id v8 = [v11 controlsView];
    id v9 = [v8 getCurrentLabel];
    id v10 = [(MTATimerTableViewController *)self currentTone];
    [(MTATimerTableViewController *)self didStartTimerWithDuration:v9 title:v10 sound:0 sender:v7];

    id v4 = v11;
  }
}

- (id)defaultEditLabel
{
  v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Timer" value:&stru_1000A2560 table:0];

  return v3;
}

- (void)tipViewControllerDidBecomeAvailableWithSiriTipsController:(id)a3 tipView:(id)a4
{
  double v7 = (_TtC11MobileTimer18SiriTipsController *)a3;
  id v8 = a4;
  if (self->_siriTipsController != v7)
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MTATimerTableViewController.m" lineNumber:836 description:@"Unexpected Siri tips controller instance"];
  }
  id v9 = MTLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Siri tip became available", v13, 2u);
  }

  objc_storeStrong((id *)&self->_siriTipView, a4);
  if (([(NSMutableArray *)self->_sections containsObject:&off_1000A4EF8] & 1) == 0)
  {
    [(NSMutableArray *)self->_sections insertObject:&off_1000A4EF8 atIndex:0];
    id v10 = [(MTATimerTableViewController *)self tableView];
    id v11 = +[NSIndexSet indexSetWithIndex:0];
    [v10 insertSections:v11 withRowAnimation:3];
  }
}

- (void)tipViewControllerWasInvalidatedWithSiriTipsController:(id)a3
{
  double v5 = (_TtC11MobileTimer18SiriTipsController *)a3;
  if (self->_siriTipsController != v5)
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MTATimerTableViewController.m" lineNumber:853 description:@"Unexpected Siri tips controller instance"];
  }
  if (self->_siriTipView)
  {
    double v6 = MTLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dismissing Siri tip section", v13, 2u);
    }

    siriTipView = self->_siriTipView;
    self->_siriTipView = 0;

    id v8 = [(NSMutableArray *)self->_sections indexOfObject:&off_1000A4EF8];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = v8;
      [(NSMutableArray *)self->_sections removeObjectAtIndex:v8];
      id v10 = [(MTATimerTableViewController *)self tableView];
      id v11 = +[NSIndexSet indexSetWithIndex:v9];
      [v10 deleteSections:v11 withRowAnimation:3];
    }
  }
}

- (_TtC11MobileTimer18SiriTipsController)siriTipsController
{
  return self->_siriTipsController;
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (NAFuture)reloadDataFuture
{
  return self->_reloadDataFuture;
}

- (MTTimer)timerToEdit
{
  return self->_timerToEdit;
}

- (void)setTimerToEdit:(id)a3
{
}

- (TKTonePickerViewController)tonePickerViewController
{
  return self->_tonePickerViewController;
}

- (void)setTonePickerViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tonePickerViewController, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_timerToEdit, 0);
  objc_storeStrong((id *)&self->_reloadDataFuture, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_siriTipsController, 0);
  objc_storeStrong((id *)&self->_siriTipView, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end