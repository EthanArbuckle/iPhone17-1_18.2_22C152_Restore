@interface MTAAlarmEditSettingViewController
- (BOOL)_canShowWhileLocked;
- (MTAAlarmEditSettingViewController)initWithAlarm:(id)a3 setting:(int64_t)a4 delegate:(id)a5;
- (MTAAlarmEditSettingViewController)initWithSetting:(int64_t)a3 editController:(id)a4;
- (MTAlarmEditSettingViewControllerDelegate)delegate;
- (MTMutableAlarm)alarm;
- (double)rowHeightWithCurrentAccessibilityConfiguration;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)repeatSchedule;
- (unsigned)maskForRow:(int64_t)a3;
- (void)_commonInitialization;
- (void)_dismiss;
- (void)addDefaultSongsIfNeeded;
- (void)dealloc;
- (void)loadView;
- (void)setAlarm:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRepeatSchedule:(unint64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textValueChanged:(id)a3;
- (void)tonePickerViewController:(id)a3 didDismissVibrationPickerViewController:(id)a4;
- (void)tonePickerViewController:(id)a3 selectedMediaItemWithIdentifier:(id)a4;
- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4;
- (void)tonePickerViewController:(id)a3 willPresentVibrationPickerViewController:(id)a4;
- (void)updateTableViewRowHeight;
- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTAAlarmEditSettingViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTAAlarmEditSettingViewController)initWithSetting:(int64_t)a3 editController:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MTAAlarmEditSettingViewController;
  v5 = [(MTAAlarmEditSettingViewController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_setting = a3;
    [(MTAAlarmEditSettingViewController *)v5 _commonInitialization];
    v7 = v6;
  }

  return v6;
}

- (MTAAlarmEditSettingViewController)initWithAlarm:(id)a3 setting:(int64_t)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MTAAlarmEditSettingViewController;
  v10 = [(MTAAlarmEditSettingViewController *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_setting = a4;
    objc_storeWeak((id *)&v10->_delegate, v9);
    v12 = (MTMutableAlarm *)[v8 mutableCopy];
    alarm = v11->_alarm;
    v11->_alarm = v12;

    [(MTAAlarmEditSettingViewController *)v11 _commonInitialization];
  }

  return v11;
}

- (void)_commonInitialization
{
  int64_t setting = self->_setting;
  if (setting == 2)
  {
    v5 = +[NSBundle mainBundle];
    id v21 = [v5 localizedStringForKey:@"EDIT_SOUND" value:&stru_1000A2560 table:0];

    uint64_t v6 = MTShouldAllowToneStore();
    v7 = (TKTonePickerViewController *)[objc_alloc((Class)TKTonePickerViewController) _initWithAlertType:13 tableViewStyle:2];
    tonePickerViewController = self->_tonePickerViewController;
    self->_tonePickerViewController = v7;

    id v9 = +[TLToneManager sharedToneManager];
    v10 = [v9 defaultToneIdentifierForAlertType:13];
    [(TKTonePickerViewController *)self->_tonePickerViewController setDefaultToneIdentifier:v10];

    [(TKTonePickerViewController *)self->_tonePickerViewController setMediaAtTop:1];
    [(TKTonePickerViewController *)self->_tonePickerViewController setShowsNone:1];
    [(TKTonePickerViewController *)self->_tonePickerViewController setShowsMedia:v6];
    [(TKTonePickerViewController *)self->_tonePickerViewController setShowsToneStore:v6];
    [(TKTonePickerViewController *)self->_tonePickerViewController setShowsVibrations:1];
    v11 = objc_opt_new();
    [(TKTonePickerViewController *)self->_tonePickerViewController setStyleProvider:v11];

    v12 = +[UIColor mtui_backgroundColor];
    v13 = [(TKTonePickerViewController *)self->_tonePickerViewController tableView];
    [v13 setBackgroundColor:v12];

    [(MTAAlarmEditSettingViewController *)self addDefaultSongsIfNeeded];
    v14 = [(MTAAlarmEditSettingViewController *)self alarm];
    v4 = [v14 sound];

    id v15 = [v4 soundType];
    if (v15 == (id)3)
    {
      id v17 = objc_alloc((Class)MPMediaItem);
      v18 = [v4 mediaItemIdentifier];
      id v16 = [v17 initWithPersistentID:[v18 longLongValue]];

      if (v16)
      {
        v19 = [v16 valueForProperty:MPMediaItemPropertyPersistentID];
        [(TKTonePickerViewController *)self->_tonePickerViewController setSelectedMediaIdentifier:v19];
      }
    }
    else
    {
      if (v15 != (id)2)
      {
LABEL_11:
        v20 = [v4 vibrationIdentifier];
        [(TKTonePickerViewController *)self->_tonePickerViewController setSelectedVibrationIdentifier:v20];

        [(TKTonePickerViewController *)self->_tonePickerViewController setDelegate:self];
        [(MTAAlarmEditSettingViewController *)self addChildViewController:self->_tonePickerViewController];
        [(TKTonePickerViewController *)self->_tonePickerViewController didMoveToParentViewController:self];
        goto LABEL_12;
      }
      id v16 = [v4 toneIdentifier];
      [(TKTonePickerViewController *)self->_tonePickerViewController setSelectedToneIdentifier:v16];
    }

    goto LABEL_11;
  }
  if (setting)
  {
    id v21 = 0;
    [(MTAAlarmEditSettingViewController *)self setTitle:0];
    goto LABEL_13;
  }
  v4 = +[NSBundle mainBundle];
  id v21 = [v4 localizedStringForKey:@"EDIT_REPEAT" value:&stru_1000A2560 table:0];
LABEL_12:

  [(MTAAlarmEditSettingViewController *)self setTitle:v21];
LABEL_13:
}

- (void)dealloc
{
  [(TKTonePickerViewController *)self->_tonePickerViewController willMoveToParentViewController:0];
  if ([(TKTonePickerViewController *)self->_tonePickerViewController isViewLoaded])
  {
    v3 = [(TKTonePickerViewController *)self->_tonePickerViewController view];
    [v3 removeFromSuperview];
  }
  [(TKTonePickerViewController *)self->_tonePickerViewController removeFromParentViewController];
  [(TKTonePickerViewController *)self->_tonePickerViewController setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmEditSettingViewController;
  [(MTAAlarmEditSettingViewController *)&v4 dealloc];
}

- (void)addDefaultSongsIfNeeded
{
  v3 = +[MPMediaQuery songsQuery];
  v15[0] = MPMediaItemPropertyPlayCount;
  v15[1] = MPMediaItemPropertyTitle;
  objc_super v4 = +[NSArray arrayWithObjects:v15 count:2];
  [v3 _setOrderingProperties:v4];

  v13 = MPMediaItemPropertyPlayCount;
  v14 = &off_1000A4E68;
  v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [v3 _setOrderingDirectionMappings:v5];

  +[NSMutableArray arrayWithCapacity:2];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100020520;
  v11 = &unk_1000A1968;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v6;
  [v3 _enumerateItemsUsingBlock:&v8];
  if (objc_msgSend(v6, "count", v8, v9, v10, v11))
  {
    [(TKTonePickerViewController *)self->_tonePickerViewController addMediaItems:v6];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"com.apple.mobiletimer.user-preferences-dirty" object:0 userInfo:0];
  }
}

- (void)loadView
{
  id v10 = objc_alloc_init((Class)UIView);
  [v10 setAutoresizingMask:18];
  if (self->_setting)
  {
    v3 = [(TKTonePickerViewController *)self->_tonePickerViewController view];
    [v10 bounds];
    [v3 setFrame:];
    [v3 setAutoresizingMask:18];
    [v10 addSubview:v3];
  }
  else
  {
    objc_super v4 = [(MTAAlarmEditSettingViewController *)self alarm];
    self->_repeatSchedule = (unint64_t)[v4 repeatSchedule];

    LODWORD(v4) = _os_feature_enabled_impl();
    id v5 = objc_alloc((Class)UITableView);
    if (v4) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    v7 = [v5 initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    tableView = self->_tableView;
    self->_tableView = v7;

    [(UITableView *)self->_tableView setEstimatedRowHeight:UITableViewDefaultRowHeight];
    [(UITableView *)self->_tableView setRowHeight:UITableViewAutomaticDimension];
    [(UITableView *)self->_tableView setAutoresizingMask:18];
    [(UITableView *)self->_tableView setDataSource:self];
    [(UITableView *)self->_tableView setDelegate:self];
    [v10 addSubview:self->_tableView];
  }
  [(MTAAlarmEditSettingViewController *)self setView:v10];
  uint64_t v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"updateTableViewRowHeight" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTAAlarmEditSettingViewController;
  [(MTAAlarmEditSettingViewController *)&v6 viewWillAppear:a3];
  if (!self->_setting)
  {
    id v4 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    id v5 = +[NSLocale currentLocale];
    [v4 setLocale:v5];

    self->_firstWeekday = (unint64_t)[v4 firstWeekday];
  }
}

- (void)viewDidUnload
{
  tableView = self->_tableView;
  self->_tableView = 0;

  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmEditSettingViewController;
  [(MTAAlarmEditSettingViewController *)&v4 viewDidUnload];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MTAAlarmEditSettingViewController;
  -[MTAAlarmEditSettingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  if ((MTUIIsPadIdiom() & 1) == 0)
  {
    id v5 = [(MTAAlarmEditableTextCell *)self->_editingCell textField];
    [v5 becomeFirstResponder];
  }
}

- (double)rowHeightWithCurrentAccessibilityConfiguration
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v2 _scaledValueForValue:UITableViewDefaultRowHeight];
  double v4 = v3;

  return v4;
}

- (void)_dismiss
{
  double v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = [(MTAAlarmEditSettingViewController *)self alarm];
    id v5 = [v4 alarmID];
    int v8 = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing with alarm: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  objc_super v6 = [(MTAAlarmEditSettingViewController *)self navigationController];
  id v7 = [v6 popViewControllerAnimated:1];
}

- (void)updateTableViewRowHeight
{
  [(MTAAlarmEditSettingViewController *)self rowHeightWithCurrentAccessibilityConfiguration];
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:");
  double v3 = [(UITableView *)self->_tableView visibleCells];
  id v4 = [v3 count];

  tableView = self->_tableView;
  if (v4)
  {
    objc_super v6 = [(UITableView *)self->_tableView visibleCells];
    id v7 = [v6 firstObject];
    id v9 = [(UITableView *)tableView indexPathForCell:v7];

    [(UITableView *)self->_tableView reloadData];
    if (v9)
    {
      [(UITableView *)self->_tableView scrollToRowAtIndexPath:v9 atScrollPosition:1 animated:0];
    }
  }
  else
  {
    int v8 = self->_tableView;
    [(UITableView *)v8 reloadData];
  }
}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
{
  id v6 = a4;
  id v17 = v6;
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [a3 defaultToneIdentifier];
  }
  int v8 = v7;
  id v9 = [(MTAAlarmEditSettingViewController *)self alarm];
  __int16 v10 = [v9 sound];

  v11 = [v10 vibrationIdentifier];
  id v12 = [v10 soundVolume];
  v13 = +[MTSound toneSoundWithIdentifier:v8 vibrationIdentifer:v11 volume:v12];

  v14 = [(MTAAlarmEditSettingViewController *)self alarm];
  [v14 setSound:v13];

  id v15 = [(MTAAlarmEditSettingViewController *)self delegate];
  id v16 = [(MTAAlarmEditSettingViewController *)self alarm];
  [v15 alarmEditSettingController:self didEditAlarm:v16];

  +[MTSound setDefaultSound:v13 forCategory:0];
}

- (void)tonePickerViewController:(id)a3 selectedMediaItemWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(MTAAlarmEditSettingViewController *)self alarm];
  id v13 = [v6 sound];

  id v7 = [v13 vibrationIdentifier];
  int v8 = [v13 soundVolume];
  id v9 = +[MTSound songSoundWithIdentifier:v5 vibrationIdentifier:v7 volume:v8];

  __int16 v10 = [(MTAAlarmEditSettingViewController *)self alarm];
  [v10 setSound:v9];

  v11 = [(MTAAlarmEditSettingViewController *)self delegate];
  id v12 = [(MTAAlarmEditSettingViewController *)self alarm];
  [v11 alarmEditSettingController:self didEditAlarm:v12];

  +[MTSound setDefaultSound:v9 forCategory:0];
}

- (void)tonePickerViewController:(id)a3 willPresentVibrationPickerViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 setShowsEditButtonInNavigationBar:1];
  int v8 = +[TLVibrationManager sharedVibrationManager];
  id v9 = [v7 alertType];
  __int16 v10 = [v7 topic];

  v11 = [v8 defaultVibrationIdentifierForAlertType:v9 topic:v10];
  [v6 setDefaultVibrationIdentifier:v11];

  [v6 setDelegate:self];
  id v12 = (id)objc_opt_new();
  [v6 setStyleProvider:v12];
}

- (void)tonePickerViewController:(id)a3 didDismissVibrationPickerViewController:(id)a4
{
}

- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(MTAAlarmEditSettingViewController *)self alarm];
  id v7 = [v6 sound];
  int v8 = [v7 soundByUpdatingVibrationIdentifier:v5];

  id v9 = [(MTAAlarmEditSettingViewController *)self alarm];
  [v9 setSound:v8];

  __int16 v10 = [(MTAAlarmEditSettingViewController *)self delegate];
  v11 = [(MTAAlarmEditSettingViewController *)self alarm];
  [v10 alarmEditSettingController:self didEditAlarm:v11];

  id v13 = [(MTAAlarmEditSettingViewController *)self alarm];
  id v12 = [v13 sound];
  +[MTSound setDefaultSound:v12 forCategory:0];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_setting) {
    return 1;
  }
  else {
    return 7;
  }
}

- (unsigned)maskForRow:(int64_t)a3
{
  return 1 << ((a3 + self->_firstWeekday + 5) % 7);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  if (self->_setting)
  {
    id v4 = 0;
  }
  else
  {
    id v7 = a3;
    unsigned int v8 = -[MTAAlarmEditSettingViewController maskForRow:](self, "maskForRow:", [a4 row]);
    id v4 = [v7 dequeueReusableCellWithIdentifier:@"UITVC"];

    if (!v4)
    {
      id v4 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"UITVC"];
      id v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      __int16 v10 = [v4 textLabel];
      [v10 setFont:v9];

      v11 = [v4 textLabel];
      [v11 setAdjustsFontForContentSizeCategory:1];
    }
    id v12 = DateMaskToString();
    id v13 = [v4 textLabel];
    [v13 setText:v12];

    v14 = [(MTAAlarmEditSettingViewController *)self alarm];
    if (([v14 repeatSchedule] & v8) != 0) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 0;
    }
    [v4 setAccessoryType:v15];
  }
  id v16 = +[UIColor mtui_foregroundColor];
  [v4 setBackgroundColor:v16];

  id v17 = +[UIColor mtui_primaryTextColor];
  v18 = [v4 textLabel];
  [v18 setTextColor:v17];

  v19 = +[UIColor mtui_cellHighlightColor];
  [v4 setSelectedBackgroundColor:v19];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (v6 && !self->_setting)
  {
    id v7 = [v15 cellForRowAtIndexPath:v6];
    if ([v7 accessoryType] == (id)3) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 3;
    }
    [v7 setAccessoryType:v8];
    [v15 deselectRowAtIndexPath:v6 animated:1];
    unsigned int v9 = -[MTAAlarmEditSettingViewController maskForRow:](self, "maskForRow:", [v6 row]);
    if ([v7 accessoryType] == (id)3) {
      unint64_t v10 = [(MTAAlarmEditSettingViewController *)self repeatSchedule] | v9;
    }
    else {
      unint64_t v10 = [(MTAAlarmEditSettingViewController *)self repeatSchedule] & ~v9;
    }
    [(MTAAlarmEditSettingViewController *)self setRepeatSchedule:v10];
    unint64_t v11 = [(MTAAlarmEditSettingViewController *)self repeatSchedule];
    id v12 = [(MTAAlarmEditSettingViewController *)self alarm];
    [v12 setRepeatSchedule:v11];

    id v13 = [(MTAAlarmEditSettingViewController *)self delegate];
    v14 = [(MTAAlarmEditSettingViewController *)self alarm];
    [v13 alarmEditSettingController:self didEditAlarm:v14];
  }
}

- (void)textValueChanged:(id)a3
{
  id v8 = [a3 object];
  id v4 = [v8 text];
  id v5 = [(MTAAlarmEditSettingViewController *)self alarm];
  [v5 setTitle:v4];

  id v6 = [(MTAAlarmEditSettingViewController *)self delegate];
  id v7 = [(MTAAlarmEditSettingViewController *)self alarm];
  [v6 alarmEditSettingController:self didEditAlarm:v7];
}

- (MTAlarmEditSettingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTAlarmEditSettingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTMutableAlarm)alarm
{
  return self->_alarm;
}

- (void)setAlarm:(id)a3
{
}

- (unint64_t)repeatSchedule
{
  return self->_repeatSchedule;
}

- (void)setRepeatSchedule:(unint64_t)a3
{
  self->_repeatSchedule = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarm, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tonePickerViewController, 0);
  objc_storeStrong((id *)&self->_editingCell, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end