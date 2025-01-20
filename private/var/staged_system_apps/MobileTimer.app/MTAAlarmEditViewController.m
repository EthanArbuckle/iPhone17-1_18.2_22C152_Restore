@interface MTAAlarmEditViewController
+ (CGSize)desiredContentSize;
- (BOOL)_canShowWhileLocked;
- (BOOL)isEdited;
- (BOOL)isNewAlarm;
- (MTAAlarmEditViewController)initWithAlarm:(id)a3 isNewAlarm:(BOOL)a4;
- (MTAAlarmEditViewControllerDelegate)delegate;
- (MTAlarm)originalAlarm;
- (MTMutableAlarm)editedAlarm;
- (UIDatePicker)timePicker;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)defaultEditLabel;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)timePickerCellForTableView:(id)a3;
- (id)tonePickerCellForTableView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelButtonClicked:(id)a3;
- (void)_doneButtonClicked:(id)a3;
- (void)_snoozeControlChanged:(id)a3;
- (void)alarmEditSettingController:(id)a3 didEditAlarm:(id)a4;
- (void)contentSizeCategoryDidChange;
- (void)didUpdateWithLabel:(id)a3 sender:(id)a4;
- (void)handleSuspend;
- (void)saveAlarmOnlyIfEdited:(BOOL)a3;
- (void)saveAlarmOnlyIfEdited:(BOOL)a3 saveNew:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setEditedAlarm:(id)a3;
- (void)setOriginalAlarm:(id)a3;
- (void)setTimePicker:(id)a3;
- (void)startEditingSetting:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTAAlarmEditViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (CGSize)desiredContentSize
{
  double v2 = 320.0;
  double v3 = 430.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (MTAAlarmEditViewController)initWithAlarm:(id)a3 isNewAlarm:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (_os_feature_enabled_impl()) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  v33.receiver = self;
  v33.super_class = (Class)MTAAlarmEditViewController;
  v9 = [(MTAAlarmEditViewController *)&v33 initWithStyle:v8];
  v10 = v9;
  if (!v9) {
    goto LABEL_15;
  }
  p_originalAlarm = (void **)&v9->_originalAlarm;
  objc_storeStrong((id *)&v9->_originalAlarm, a3);
  if (v7)
  {
    if (!v4)
    {
      v18 = (MTMutableAlarm *)[v7 mutableCopy];
      editedAlarm = v10->_editedAlarm;
      v10->_editedAlarm = v18;

      v15 = +[NSBundle mainBundle];
      v16 = v15;
      CFStringRef v17 = @"ALARM_EDIT";
      goto LABEL_11;
    }
    v12 = *p_originalAlarm;
    *p_originalAlarm = 0;

    v13 = (MTMutableAlarm *)[v7 mutableCopy];
  }
  else
  {
    v13 = +[MTMutableAlarm alarm];
  }
  v14 = v10->_editedAlarm;
  v10->_editedAlarm = v13;

  v15 = +[NSBundle mainBundle];
  v16 = v15;
  CFStringRef v17 = @"CREATE_NEW_ALARM";
LABEL_11:
  v20 = [v15 localizedStringForKey:v17 value:&stru_1000A2560 table:0];

  v10->_editingAlarmSetting = -1;
  [(MTAAlarmEditViewController *)v10 setTitle:v20];
  v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"BACK" value:&stru_1000A2560 table:0];
  v23 = [(MTAAlarmEditViewController *)v10 navigationItem];
  [v23 setBackButtonTitle:v22];

  [(MTAAlarmEditViewController *)v10 setEdgesForExtendedLayout:0];
  id v24 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v10 action:"_cancelButtonClicked:"];
  v25 = [(MTAAlarmEditViewController *)v10 navigationItem];
  [v25 setLeftBarButtonItem:v24];

  id v26 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:3 target:v10 action:"_doneButtonClicked:"];
  v27 = [(MTAAlarmEditViewController *)v10 navigationItem];
  [v27 setRightBarButtonItem:v26];

  v28 = [(MTAAlarmEditViewController *)v10 navigationItem];
  v29 = [v28 rightBarButtonItem];
  [v29 setStyle:2];

  if (MTUIIsPhoneIdiom())
  {
    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:v10 selector:"handleSuspend" name:UIApplicationSuspendedNotification object:0];
  }
  else
  {
    [(id)objc_opt_class() desiredContentSize];
    -[MTAAlarmEditViewController setPreferredContentSize:](v10, "setPreferredContentSize:");
  }
  v31 = +[NSNotificationCenter defaultCenter];
  [v31 addObserver:v10 selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

LABEL_15:
  return v10;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTAAlarmEditViewController;
  [(MTAAlarmEditViewController *)&v9 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  id v7 = [(MTAAlarmEditViewController *)self traitCollection];
  if ([v7 horizontalSizeClass] == (id)1 && objc_msgSend(v6, "horizontalSizeClass") == (id)2)
  {
    id v8 = [v6 verticalSizeClass];

    if (v8 == (id)2) {
      [(MTAAlarmEditViewController *)self saveAlarmOnlyIfEdited:1];
    }
  }
  else
  {
  }
}

- (BOOL)isNewAlarm
{
  double v2 = [(MTAAlarmEditViewController *)self originalAlarm];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)isEdited
{
  if ([(MTAAlarmEditViewController *)self isNewAlarm])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v4 = [(MTAAlarmEditViewController *)self originalAlarm];
    v5 = [(MTAAlarmEditViewController *)self editedAlarm];
    unsigned int v3 = [v4 isEqual:v5] ^ 1;
  }
  return v3;
}

- (void)saveAlarmOnlyIfEdited:(BOOL)a3
{
}

- (void)saveAlarmOnlyIfEdited:(BOOL)a3 saveNew:(BOOL)a4
{
  BOOL v4 = a3;
  if ([(MTAAlarmEditViewController *)self isEdited] && a4 || !v4)
  {
    id v6 = MTLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(MTMutableAlarm *)self->_editedAlarm alarmID];
      int v19 = 138543618;
      v20 = self;
      __int16 v21 = 2114;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ saving edited alarm: %{public}@", (uint8_t *)&v19, 0x16u);
    }
    id v8 = [(UIDatePicker *)self->_timePicker calendar];
    objc_super v9 = [(UIDatePicker *)self->_timePicker _dateUnderSelectionBar];
    v10 = [v8 components:96 fromDate:v9];

    id v11 = [v10 hour];
    v12 = [(MTAAlarmEditViewController *)self editedAlarm];
    [v12 setHour:v11];

    id v13 = [v10 minute];
    v14 = [(MTAAlarmEditViewController *)self editedAlarm];
    [v14 setMinute:v13];

    if ([(MTAAlarmEditViewController *)self isEdited])
    {
      v15 = [(MTAAlarmEditViewController *)self editedAlarm];
      [v15 setEnabled:1];
    }
    unsigned int v16 = [(MTAAlarmEditViewController *)self isNewAlarm];
    CFStringRef v17 = [(MTAAlarmEditViewController *)self delegate];
    v18 = [(MTAAlarmEditViewController *)self editedAlarm];
    if (v16) {
      [v17 alarmEditController:self didAddAlarm:v18];
    }
    else {
      [v17 alarmEditController:self didEditAlarm:v18];
    }
  }
}

- (void)_cancelButtonClicked:(id)a3
{
  BOOL v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(MTMutableAlarm *)self->_editedAlarm alarmID];
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ cancel button clicked for alarm: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [(MTAAlarmEditViewController *)self delegate];
  [v6 alarmEditControllerDidCancel:self];
}

- (void)_doneButtonClicked:(id)a3
{
  BOOL v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(MTMutableAlarm *)self->_editedAlarm alarmID];
    int v6 = 138543618;
    int v7 = self;
    __int16 v8 = 2114;
    __int16 v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ done button clicked for alarm: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(MTAAlarmEditViewController *)self saveAlarmOnlyIfEdited:0];
}

- (void)_snoozeControlChanged:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v4 isOn];
    int v7 = [(MTMutableAlarm *)self->_editedAlarm alarmID];
    int v10 = 138543874;
    id v11 = self;
    __int16 v12 = 1026;
    unsigned int v13 = v6;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ snooze control changed to: %{public}i  for alarm: %{public}@", (uint8_t *)&v10, 0x1Cu);
  }
  id v8 = [v4 isOn];
  __int16 v9 = [(MTAAlarmEditViewController *)self editedAlarm];
  [v9 setAllowsSnooze:v8];
}

- (void)startEditingSetting:(int64_t)a3
{
  [(UIDatePicker *)self->_timePicker resignFirstResponder];
  self->_editingAlarmSetting = a3;
  v5 = [MTAAlarmEditSettingViewController alloc];
  unsigned int v6 = [(MTAAlarmEditViewController *)self editedAlarm];
  id v8 = [(MTAAlarmEditSettingViewController *)v5 initWithAlarm:v6 setting:a3 delegate:self];

  [(MTAAlarmEditViewController *)self preferredContentSize];
  -[MTAAlarmEditSettingViewController setPreferredContentSize:](v8, "setPreferredContentSize:");
  int v7 = [(MTAAlarmEditViewController *)self navigationController];
  [v7 pushViewController:v8 animated:1];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  unsigned int v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    unsigned int v6 = obj;
  }
}

- (void)handleSuspend
{
}

- (void)contentSizeCategoryDidChange
{
  id v8 = [(MTAAlarmEditViewController *)self tableView];
  [v8 contentOffset];
  double v4 = v3;
  double v6 = v5;
  int v7 = [(MTAAlarmEditViewController *)self tableView];
  [v7 reloadData];

  [v8 setContentOffset:0 animated:v4];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (MTUIIsVeryWidePhoneSize()) {
    return 30;
  }
  if (MTUIIsPadIdiom()) {
    return 30;
  }
  return 2;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)MTAAlarmEditViewController;
  [(MTAAlarmEditViewController *)&v13 viewDidLoad];
  double v3 = [(MTAAlarmEditViewController *)self tableView];
  [v3 setAlwaysBounceVertical:0];
  [v3 setRowHeight:UITableViewAutomaticDimension];
  [v3 _setDisplaysCellContentStringsOnTapAndHold:1];
  [v3 setEstimatedRowHeight:UITableViewDefaultRowHeight];
  [v3 setKeyboardDismissMode:2];
  id v4 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 2.22507386e-308];
  [v3 setTableHeaderView:v4];

  [v3 setAutoresizingMask:18];
  if (MTUIIsPadIdiom()) {
    [v3 setAutoresizingMask:18];
  }
  double v5 = [objc_alloc((Class)UIDatePicker) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  timePicker = self->_timePicker;
  self->_timePicker = v5;

  [(UIDatePicker *)self->_timePicker setAutoresizingMask:2];
  [(UIDatePicker *)self->_timePicker setPreferredDatePickerStyle:1];
  [(UIDatePicker *)self->_timePicker setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIDatePicker *)self->_timePicker setDatePickerMode:0];
  [(UIDatePicker *)self->_timePicker _setSelectionBarIgnoresInset:1];
  id v7 = objc_alloc_init((Class)NSDateComponents);
  id v8 = [(MTAAlarmEditViewController *)self editedAlarm];
  [v7 setHour:[v8 hour]];

  __int16 v9 = [(MTAAlarmEditViewController *)self editedAlarm];
  [v7 setMinute:[v9 minute]];

  int v10 = self->_timePicker;
  id v11 = [(UIDatePicker *)v10 calendar];
  __int16 v12 = [v11 dateFromComponents:v7];
  [(UIDatePicker *)v10 setDate:v12];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_editingAlarmSetting = -1;
  double v5 = [(MTAAlarmEditViewController *)self tableView];
  [v5 reloadData];

  double v6 = [(MTAAlarmEditViewController *)self tableView];
  id v7 = [(MTAAlarmEditViewController *)self tableView];
  id v8 = [v7 indexPathForSelectedRow];
  [v6 deselectRowAtIndexPath:v8 animated:1];

  __int16 v9 = [(MTAAlarmEditViewController *)self view];
  [v9 endEditing:0];

  v10.receiver = self;
  v10.super_class = (Class)MTAAlarmEditViewController;
  [(MTAAlarmEditViewController *)&v10 viewWillAppear:v3];
}

- (void)viewDidUnload
{
  [(MTAAlarmEditViewController *)self setTableView:0];
  v3.receiver = self;
  v3.super_class = (Class)MTAAlarmEditViewController;
  [(MTAAlarmEditViewController *)&v3 viewDidUnload];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(MTAAlarmEditViewController *)self view];
  [v5 endEditing:1];

  v6.receiver = self;
  v6.super_class = (Class)MTAAlarmEditViewController;
  [(MTAAlarmEditViewController *)&v6 viewWillDisappear:v3];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (MTUIIsPadIdiom()) {
    return 2;
  }
  if ([(MTAAlarmEditViewController *)self isNewAlarm]) {
    return 2;
  }
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1) {
    return 4;
  }
  else {
    return 1;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 row];
  id v9 = [v7 section];
  if (v9 == (id)2)
  {
    id v11 = (MTALabelEditCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"MTDTVC"];
    __int16 v12 = +[NSBundle mainBundle];
    objc_super v13 = [v12 localizedStringForKey:@"EDIT_DELETE" value:&stru_1000A2560 table:0];
    __int16 v14 = [(MTALabelEditCell *)v11 textLabel];
    [v14 setText:v13];

    v15 = [(MTALabelEditCell *)v11 textLabel];
    [v15 setTextAlignment:1];

    unsigned int v16 = +[UIColor systemRedColor];
    CFStringRef v17 = [(MTALabelEditCell *)v11 textLabel];
    [v17 setTextColor:v16];

    v18 = +[UIColor mtui_foregroundColor];
    [(MTALabelEditCell *)v11 setBackgroundColor:v18];

    int v19 = +[UIColor mtui_cellHighlightColor];
    [(MTALabelEditCell *)v11 setSelectedBackgroundColor:v19];

    goto LABEL_23;
  }
  if (v9 == (id)1)
  {
    if ([v7 row] == (id)2)
    {
      uint64_t v10 = [(MTAAlarmEditViewController *)self tonePickerCellForTableView:v6];
      goto LABEL_8;
    }
    if (v8 == (id)3)
    {
      id v11 = (MTALabelEditCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:0];
    }
    else if (v8 == (id)1)
    {
      id v11 = [v6 dequeueReusableCellWithIdentifier:off_1000C6688];
      if (!v11)
      {
        v20 = [MTALabelEditCell alloc];
        __int16 v21 = [(MTAAlarmEditViewController *)self editedAlarm];
        v22 = [v21 displayTitle];
        v23 = [(MTAAlarmEditViewController *)self editedAlarm];
        id v24 = [v23 title];
        id v11 = -[MTALabelEditCell initWithDelegate:currentTitle:isEmpty:](v20, "initWithDelegate:currentTitle:isEmpty:", self, v22, [v24 length] == 0);
      }
    }
    else
    {
      id v11 = [v6 dequeueReusableCellWithIdentifier:@"UITVC"];
      if (!v11) {
        id v11 = (MTALabelEditCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:@"UITVC"];
      }
      v25 = [(MTALabelEditCell *)v11 detailTextLabel];
      [v25 setAdjustsFontSizeToFitWidth:0];

      [(MTALabelEditCell *)v11 setAccessoryType:1];
    }
    id v26 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v27 = [(MTALabelEditCell *)v11 textLabel];
    [v27 setFont:v26];

    v28 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v29 = [(MTALabelEditCell *)v11 detailTextLabel];
    [v29 setFont:v28];

    v30 = [(MTALabelEditCell *)v11 textLabel];
    [v30 setAdjustsFontForContentSizeCategory:1];

    v31 = [(MTALabelEditCell *)v11 detailTextLabel];
    [v31 setAdjustsFontForContentSizeCategory:1];

    [(MTALabelEditCell *)v11 setSelectionStyle:v8 != (id)3];
    v32 = +[UIColor mtui_foregroundColor];
    [(MTALabelEditCell *)v11 setBackgroundColor:v32];

    objc_super v33 = +[UIColor mtui_primaryTextColor];
    v34 = [(MTALabelEditCell *)v11 textLabel];
    [v34 setTextColor:v33];

    v35 = +[UIColor mtui_cellHighlightColor];
    [(MTALabelEditCell *)v11 setSelectedBackgroundColor:v35];

    if (v8 == (id)3)
    {
      v44 = +[NSBundle mainBundle];
      v45 = [v44 localizedStringForKey:@"EDIT_SNOOZE" value:&stru_1000A2560 table:0];
      v46 = [(MTALabelEditCell *)v11 textLabel];
      [v46 setText:v45];

      v47 = [(MTALabelEditCell *)v11 detailTextLabel];
      [v47 setText:0];

      id v41 = objc_alloc_init((Class)UISwitch);
      [v41 setOnTintColor:0];
      v48 = +[UIColor mtui_switchTintColor];
      [v41 setTintColor:v48];

      v49 = [(MTAAlarmEditViewController *)self editedAlarm];
      [v41 setOn:[v49 allowsSnooze] animated:0];

      [v41 addTarget:self action:"_snoozeControlChanged:" forControlEvents:4096];
      [(MTALabelEditCell *)v11 setAccessoryView:v41];
    }
    else
    {
      if (v8) {
        goto LABEL_23;
      }
      v36 = +[NSBundle mainBundle];
      v37 = [v36 localizedStringForKey:@"EDIT_REPEAT" value:&stru_1000A2560 table:0];
      v38 = [(MTALabelEditCell *)v11 textLabel];
      [v38 setText:v37];

      v39 = [(MTALabelEditCell *)v11 detailTextLabel];
      [v39 setAdjustsFontSizeToFitWidth:1];

      v40 = [(MTALabelEditCell *)v11 detailTextLabel];
      [v40 setMinimumScaleFactor:0.705882353];

      id v41 = [(MTAAlarmEditViewController *)self editedAlarm];
      [v41 repeatSchedule];
      v42 = DateMaskToString();
      v43 = [(MTALabelEditCell *)v11 detailTextLabel];
      [v43 setText:v42];
    }
  }
  else
  {
    if (!v9)
    {
      uint64_t v10 = [(MTAAlarmEditViewController *)self timePickerCellForTableView:v6];
LABEL_8:
      id v11 = (MTALabelEditCell *)v10;
      goto LABEL_23;
    }
    id v11 = 0;
  }
LABEL_23:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v6 row];
  if ([v6 section] == (id)1)
  {
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL && v7 != (id)3)
    {
      if (v7 == (id)1)
      {
        id v8 = [v11 cellForRowAtIndexPath:v6];
        [v8 activate];
        [v11 deselectRowAtIndexPath:v6 animated:1];
      }
      else
      {
        [(MTAAlarmEditViewController *)self startEditingSetting:v7];
      }
    }
  }
  else if ([v6 section] == (id)2)
  {
    id v9 = [(MTAAlarmEditViewController *)self delegate];
    uint64_t v10 = [(MTAAlarmEditViewController *)self originalAlarm];
    [v9 alarmEditController:self didDeleteAlarm:v10];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a3;
  if ([a4 section])
  {
    [v5 rowHeight];
  }
  else
  {
    v9.size.width = 320.0;
    v9.size.height = 216.0;
    v9.origin.x = 0.0;
    v9.origin.y = 0.0;
    double Height = CGRectGetHeight(v9);
  }
  double v7 = Height;

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 < 2) {
    return 2.22507386e-308;
  }
  [a3 sectionHeaderHeight];
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  if (!a4) {
    return 2.22507386e-308;
  }
  [a3 sectionFooterHeight];
  return result;
}

- (void)alarmEditSettingController:(id)a3 didEditAlarm:(id)a4
{
  id v5 = [a4 mutableCopy];
  [(MTAAlarmEditViewController *)self setEditedAlarm:v5];

  id v6 = [(MTAAlarmEditViewController *)self tableView];
  [v6 reloadData];
}

- (id)tonePickerCellForTableView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 dequeueReusableCellWithIdentifier:@"tonePicker"];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  double v7 = v6;

  if (!v7) {
    id v5 = [[MTATonePickerCell alloc] initWithStyle:1 reuseIdentifier:@"tonePicker"];
  }
  id v8 = +[NSBundle mainBundle];
  CGRect v9 = [v8 localizedStringForKey:@"EDIT_SOUND" value:&stru_1000A2560 table:0];
  [(MTATonePickerCell *)v5 setTitle:v9];

  uint64_t v10 = +[UIColor mtui_primaryColor];
  id v11 = [(MTATonePickerCell *)v5 textLabel];
  [v11 setTextColor:v10];

  __int16 v12 = [(MTAAlarmEditViewController *)self editedAlarm];
  [(MTATonePickerCell *)v5 setAlarm:v12];

  objc_super v13 = +[UIColor mtui_foregroundColor];
  [(MTATonePickerCell *)v5 setBackgroundColor:v13];

  return v5;
}

- (id)timePickerCellForTableView:(id)a3
{
  id v4 = [a3 dequeueReusableCellWithIdentifier:@"timePicker"];
  if (!v4)
  {
    id v4 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"timePicker"];
    [v4 setClipsToBounds:1];
    [v4 setSelectionStyle:0];
    id v5 = [v4 contentView];
    [v5 addSubview:self->_timePicker];

    id v6 = objc_opt_new();
    double v7 = [(UIDatePicker *)self->_timePicker leadingAnchor];
    id v8 = [v4 contentView];
    CGRect v9 = [v8 leadingAnchor];
    uint64_t v10 = [v7 constraintEqualToAnchor:v9];
    [v6 addObject:v10];

    id v11 = [(UIDatePicker *)self->_timePicker centerYAnchor];
    __int16 v12 = [v4 contentView];
    objc_super v13 = [v12 centerYAnchor];
    __int16 v14 = [v11 constraintEqualToAnchor:v13];
    [v6 addObject:v14];

    v15 = [(UIDatePicker *)self->_timePicker trailingAnchor];
    unsigned int v16 = [v4 contentView];
    CFStringRef v17 = [v16 trailingAnchor];
    v18 = [v15 constraintEqualToAnchor:v17];
    [v6 addObject:v18];

    +[NSLayoutConstraint activateConstraints:v6];
  }

  return v4;
}

- (void)didUpdateWithLabel:(id)a3 sender:(id)a4
{
  id v5 = a3;
  id v6 = [(MTAAlarmEditViewController *)self editedAlarm];
  [v6 setTitle:v5];
}

- (id)defaultEditLabel
{
  double v2 = [(MTAAlarmEditViewController *)self editedAlarm];
  BOOL v3 = [v2 displayTitle];

  return v3;
}

- (MTAAlarmEditViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTAAlarmEditViewControllerDelegate *)WeakRetained;
}

- (MTAlarm)originalAlarm
{
  return self->_originalAlarm;
}

- (void)setOriginalAlarm:(id)a3
{
}

- (UIDatePicker)timePicker
{
  return self->_timePicker;
}

- (void)setTimePicker:(id)a3
{
}

- (MTMutableAlarm)editedAlarm
{
  return self->_editedAlarm;
}

- (void)setEditedAlarm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editedAlarm, 0);
  objc_storeStrong((id *)&self->_timePicker, 0);
  objc_storeStrong((id *)&self->_originalAlarm, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end