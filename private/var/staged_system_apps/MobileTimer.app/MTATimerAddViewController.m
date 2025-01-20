@interface MTATimerAddViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (MTATimerAddEditDelegate)delegate;
- (MTATimerAddViewController)initWithDataSource:(id)a3 timerManager:(id)a4 delegate:(id)a5;
- (MTSound)sound;
- (MTTimerDataSource)dataSource;
- (MTTimerManager)timerManager;
- (TKTonePickerViewController)tonePickerViewController;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)currentSoundToneName;
- (id)defaultEditLabel;
- (id)startButtonItem;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)timerControlCell;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)_cancelButtonClicked:(id)a3;
- (void)_startButtonClicked:(id)a3;
- (void)dataSourceDidReloadRecentDurations:(id)a3;
- (void)dealloc;
- (void)didSelectPresetWithDuration:(double)a3;
- (void)didSelectRecentDuration:(id)a3;
- (void)localSetup;
- (void)reloadSections;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSound:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setTonePickerViewController:(id)a3;
- (void)setupNavigationButtons;
- (void)showSoundPicker:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)timePickerDidSelectDuration:(double)a3;
- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4;
@end

@implementation MTATimerAddViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTATimerAddViewController)initWithDataSource:(id)a3 timerManager:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MTATimerAddViewController;
  v11 = [(MTATableViewController *)&v16 initWithTableViewStyle:1];
  v12 = v11;
  if (v11)
  {
    [(MTATimerAddViewController *)v11 setDelegate:v10];
    [(MTATimerAddViewController *)v12 setDataSource:v8];
    v13 = [(MTATimerAddViewController *)v12 dataSource];
    [v13 registerObserver:v12];

    [(MTATimerAddViewController *)v12 setTimerManager:v9];
    [(MTATimerAddViewController *)v12 localSetup];
    v14 = v12;
  }

  return v12;
}

- (void)localSetup
{
  v3 = +[UIImage systemImageNamed:@"timer"];
  v4 = [(MTATimerAddViewController *)self tabBarItem];
  [v4 setImage:v3];

  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"TIMER" value:&stru_1000A2560 table:0];
  [(MTATimerAddViewController *)self setTitle:v6];

  v7 = (NSMutableArray *)objc_opt_new();
  sections = self->_sections;
  self->_sections = v7;

  [(MTATimerAddViewController *)self reloadSections];
  [(MTATimerAddViewController *)self setupNavigationButtons];
  id v9 = [(MTTimerDataSource *)self->_dataSource getLatestDuration];
  id v10 = [v9 sound];
  if (v10)
  {
    [(MTATimerAddViewController *)self setSound:v10];
  }
  else
  {
    v11 = +[MTSound defaultSoundForCategory:1];
    [(MTATimerAddViewController *)self setSound:v11];
  }
  v12 = [(MTATimerAddViewController *)self tableView];
  [v12 registerClass:objc_opt_class() forCellReuseIdentifier:@"kMTATimerControlsCelldentifier"];

  v13 = [(MTATimerAddViewController *)self tableView];
  [v13 registerClass:objc_opt_class() forCellReuseIdentifier:@"kMTATimerPresetsCelldentifier"];

  v14 = [(MTATimerAddViewController *)self tableView];
  [v14 registerClass:objc_opt_class() forCellReuseIdentifier:@"kMTATimerRecentCelldentifier"];

  id v15 = [(MTATimerAddViewController *)self tableView];
  [v15 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kMTATimerAddTableViewHeaderReuseIdentifier"];
}

- (void)dealloc
{
  v3 = [(MTATimerAddViewController *)self tonePickerViewController];
  [v3 setDelegate:0];

  v4 = [(MTATimerAddViewController *)self dataSource];
  [v4 unregisterObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)MTATimerAddViewController;
  [(MTATableViewController *)&v5 dealloc];
}

- (void)reloadSections
{
  [(NSMutableArray *)self->_sections removeAllObjects];
  [(NSMutableArray *)self->_sections addObject:&off_1000A4DC0];
  [(NSMutableArray *)self->_sections addObject:&off_1000A4DD8];
  v3 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
  id v4 = [v3 count];

  if (v4)
  {
    sections = self->_sections;
    [(NSMutableArray *)sections addObject:&off_1000A4DF0];
  }
}

- (void)setupNavigationButtons
{
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonClicked:"];
  id v4 = [(MTATimerAddViewController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];

  objc_super v5 = [(MTATimerAddViewController *)self navigationItem];
  v6 = [v5 leftBarButtonItem];
  [v6 setTag:@"CancelButton"];

  id v8 = [(MTATimerAddViewController *)self startButtonItem];
  v7 = [(MTATimerAddViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v8];
}

- (id)startButtonItem
{
  id v3 = objc_alloc((Class)UIBarButtonItem);
  id v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"Start" value:&stru_1000A2560 table:0];
  id v6 = [v3 initWithTitle:v5 style:0 target:self action:"_startButtonClicked:"];

  [v6 setTag:@"AddButton"];

  return v6;
}

- (void)_cancelButtonClicked:(id)a3
{
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ cancel button clicked timer add sheet", (uint8_t *)&v6, 0xCu);
  }

  objc_super v5 = [(MTATimerAddViewController *)self delegate];
  [v5 timerAddEditControllerDidCancel:self reload:0];
}

- (void)_startButtonClicked:(id)a3
{
  id v4 = [(MTATimerAddViewController *)self timerControlCell];
  if (v4)
  {
    id v10 = v4;
    [v4 getCurrentDuration];
    double v6 = v5;
    v7 = [v10 getCurrentLabel];
    id v8 = [(MTATimerAddViewController *)self delegate];
    id v9 = [(MTATimerAddViewController *)self sound];
    [v8 didStartTimerWithDuration:v7 title:v9 sound:self sender:v6];

    id v4 = v10;
  }
}

- (id)timerControlCell
{
  id v3 = [(MTATimerAddViewController *)self tableView];
  id v4 = +[NSIndexPath indexPathForRow:0 inSection:[(NSMutableArray *)self->_sections indexOfObject:&off_1000A4DC0]];
  double v5 = [v3 cellForRowAtIndexPath:v4];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)[(NSMutableArray *)self->_sections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v5 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a4];
  id v6 = [v5 integerValue];

  if (v6 != (id)2) {
    return 1;
  }
  v7 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v7 section]);
  id v9 = [v8 integerValue];

  if (v9 == (id)2)
  {
    id v8 = [v6 dequeueReusableCellWithIdentifier:@"kMTATimerRecentCelldentifier" forIndexPath:v7];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"recent-timer-%ld", [v7 row]);
    [v8 setAccessibilityIdentifier:v12];

    v13 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
    v14 = [v13 objectAtIndexedSubscript:[v7 row]];
    [v8 setDelegate:self duration:v14];

LABEL_7:
    [v8 setSelectionStyle:0];
    goto LABEL_8;
  }
  if (v9 == (id)1)
  {
    id v8 = [v6 dequeueReusableCellWithIdentifier:@"kMTATimerPresetsCelldentifier" forIndexPath:v7];
    id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"preset-timers-%ld", [v7 row]);
    [v8 setAccessibilityIdentifier:v15];

    [v8 setDelegate:self];
    goto LABEL_7;
  }
  if (!v9)
  {
    id v8 = [v6 dequeueReusableCellWithIdentifier:@"kMTATimerControlsCelldentifier" forIndexPath:v7];
    [v8 setDelegate:self];
    id v10 = [(MTTimerDataSource *)self->_dataSource getLatestDuration];
    [v10 duration];
    [v8 setDuration:];

    v11 = [(MTATimerAddViewController *)self currentSoundToneName];
    [v8 setTimerToneName:v11];
  }
LABEL_8:

  return v8;
}

- (id)currentSoundToneName
{
  id v3 = [(MTATimerAddViewController *)self sound];
  unsigned int v4 = [v3 interruptAudio];

  if (v4)
  {
    double v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"STOP_PLAYING" value:&stru_1000A2560 table:0];
  }
  else
  {
    id v7 = [(MTATimerAddViewController *)self sound];
    double v5 = [v7 toneIdentifier];

    id v8 = +[TLToneManager sharedToneManager];
    if (([v8 toneWithIdentifierIsValid:v5] & 1) == 0)
    {
      uint64_t v9 = [v8 defaultToneIdentifierForAlertType:13];

      double v5 = (void *)v9;
    }
    id v6 = [v8 nameForToneIdentifier:v5];
  }

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  unsigned int v4 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(a4, "section", a3));
  id v5 = [v4 integerValue];

  return v5 == (id)2;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4 == 1)
  {
    if (v9)
    {
      v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v9 section]);
      id v12 = [v11 integerValue];

      if (v12 == (id)2)
      {
        v13 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
        v14 = [v13 objectAtIndexedSubscript:[v10 row]];

        if (v14)
        {
          id v15 = [(MTATimerAddViewController *)self timerManager];
          objc_super v16 = [v15 removeRecentDuration:v14];

          v17 = +[NAScheduler mainThreadScheduler];
          v18 = [v16 reschedule:v17];
          id v19 = [v18 addCompletionBlock:&stru_1000A1470];
        }
        v20 = MTLogForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138543618;
          v22 = self;
          __int16 v23 = 2114;
          v24 = v14;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ deleting recent %{public}@", (uint8_t *)&v21, 0x16u);
        }
      }
    }
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v5 section]);
  id v7 = [v6 integerValue];

  if (v7 == (id)2)
  {
    id v12 = [(MTTimerDataSource *)self->_dataSource getRecentDurations];
    v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

    if (v13)
    {
      v14 = [v13 title];
      +[MTATimerRecentCell estimatedCellHeightForTimerWithTitle:v14];
      double v11 = v15;
    }
    else
    {
      double v11 = 110.0;
    }
  }
  else if (v7)
  {
    double v11 = 90.0;
  }
  else
  {
    +[MTATimerControlsView estimatedTimePickerHeight];
    double v9 = v8;
    +[MTATimerControlsView estimatedTonePickerHeight];
    double v11 = v9 + v10;
  }

  return v11;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = [a3 dequeueReusableHeaderFooterViewWithIdentifier:@"kMTATimerAddTableViewHeaderReuseIdentifier"];
  id v7 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a4];
  id v8 = [v7 integerValue];

  if (v8)
  {
    if (v8 == (id)2)
    {
      double v9 = +[NSBundle mainBundle];
      double v10 = v9;
      CFStringRef v11 = @"TIMER_ADD_SHEET_RECENTS";
    }
    else
    {
      if (v8 != (id)1)
      {
LABEL_7:
        id v8 = v6;
        goto LABEL_8;
      }
      double v9 = +[NSBundle mainBundle];
      double v10 = v9;
      CFStringRef v11 = @"TIMER_ADD_SHEET_PRESETS";
    }
    id v12 = [v9 localizedStringForKey:v11 value:&stru_1000A2560 table:0];
    v13 = [(MTATimerAddViewController *)self view];
    v14 = [MTAUtilities sectionHeaderConfigurationWithTitle:v12 isRTL:[v13 mtui_isRTL]];

    [v6 setContentConfiguration:v14];
    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 10.0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  unsigned int v4 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a4];
  id v5 = [v4 integerValue];

  return v5 == (id)2;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  unsigned int v4 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a4];
  id v5 = [v4 integerValue];

  return v5 == (id)2;
}

- (void)dataSourceDidReloadRecentDurations:(id)a3
{
  unsigned int v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ dataSourceDidReloadRecentDurations reloading table", (uint8_t *)&v6, 0xCu);
  }

  [(MTATimerAddViewController *)self reloadSections];
  id v5 = [(MTATimerAddViewController *)self tableView];
  [v5 reloadData];
}

- (id)defaultEditLabel
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Timer" value:&stru_1000A2560 table:0];

  return v3;
}

- (void)didSelectPresetWithDuration:(double)a3
{
  id v6 = [(MTATimerAddViewController *)self delegate];
  id v5 = [(MTATimerAddViewController *)self sound];
  [v6 didStartTimerWithDuration:0 title:v5 sound:self sender:a3];
}

- (void)didSelectRecentDuration:(id)a3
{
  id v4 = a3;
  id v9 = [(MTATimerAddViewController *)self delegate];
  [v4 duration];
  double v6 = v5;
  id v7 = [v4 title];
  id v8 = [v4 sound];

  [v9 didStartTimerWithDuration:v7 title:v8 sound:self sender:v6];
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
    double v10 = objc_opt_new();
    [(TKTonePickerViewController *)self->_tonePickerViewController setStyleProvider:v10];

    CFStringRef v11 = [(TKTonePickerViewController *)self->_tonePickerViewController navigationItem];
    id v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"WHEN_TIMER_ENDS" value:&stru_1000A2560 table:0];
    [v11 setTitle:v13];
  }
  v14 = [(MTATimerAddViewController *)self sound];
  double v15 = [v14 toneIdentifier];
  [(TKTonePickerViewController *)self->_tonePickerViewController setSelectedToneIdentifier:v15];

  [(TKTonePickerViewController *)self->_tonePickerViewController setShowsToneStore:MTShouldAllowToneStore()];
  id v16 = [(MTATimerAddViewController *)self navigationController];
  [v16 pushViewController:self->_tonePickerViewController animated:1];
}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
{
  uint64_t v5 = [(TKTonePickerViewController *)self->_tonePickerViewController selectedToneIdentifier];
  if (!v5)
  {
    uint64_t v5 = [(TKTonePickerViewController *)self->_tonePickerViewController defaultToneIdentifier];
  }
  id v13 = (id)v5;
  double v6 = [(MTATimerAddViewController *)self sound];
  id v7 = [v6 vibrationIdentifier];
  id v8 = [(MTATimerAddViewController *)self sound];
  id v9 = [v8 soundVolume];
  double v10 = +[MTSound toneSoundWithIdentifier:v13 vibrationIdentifer:v7 volume:v9];
  [(MTATimerAddViewController *)self setSound:v10];

  CFStringRef v11 = [(MTATimerAddViewController *)self timerControlCell];
  id v12 = [(MTATimerAddViewController *)self currentSoundToneName];
  [v11 setTimerToneName:v12];
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

- (void)timePickerDidSelectDuration:(double)a3
{
  BOOL v3 = a3 != 0.0;
  id v5 = [(MTATimerAddViewController *)self navigationItem];
  id v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (MTATimerAddEditDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTATimerAddEditDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTTimerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (TKTonePickerViewController)tonePickerViewController
{
  return self->_tonePickerViewController;
}

- (void)setTonePickerViewController:(id)a3
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
  objc_storeStrong((id *)&self->_tonePickerViewController, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_sections, 0);
}

@end