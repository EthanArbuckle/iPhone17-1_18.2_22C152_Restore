@interface MTAAlarmTableViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isAlarmsSection:(int64_t)a3;
- (BOOL)_isWakeAlarmSection:(int64_t)a3;
- (BOOL)isRunningPPTTest;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (MTAAlarmEditViewController)alarmEditViewController;
- (MTAAlarmTableViewController)initWithAlarmManager:(id)a3 dataSource:(id)a4;
- (MTASleepCoordinator)sleepCoordinator;
- (MTAlarm)alarmToEdit;
- (MTAlarmDataSource)dataSource;
- (MTAlarmManager)alarmManager;
- (NAFuture)reloadDataFuture;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)addViewController;
- (id)alarmsLoadedAction;
- (id)bypassReloadAlarm:(id)a3;
- (id)noItemsText;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsIncludingSleep;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addAlarm:(id)a3 withCompletionBlock:(id)a4;
- (void)_reloadData:(id)a3;
- (void)_reloadDataIfNecessary;
- (void)_removeAlarm:(id)a3 withCompletionBlock:(id)a4;
- (void)_scrollToAlarm:(id)a3;
- (void)_updateAlarm:(id)a3 withCompletionBlock:(id)a4;
- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4;
- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4;
- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4;
- (void)changeButtonPressed;
- (void)dataSourceDidReload:(id)a3;
- (void)didDismissViewController;
- (void)dismissAddViewController:(id)a3;
- (void)finishAddViewControllerDismissal:(BOOL)a3;
- (void)handleContentSizeTransitionFrom:(id)a3;
- (void)healthAppInstallationDidChange;
- (void)presentSleepAlert:(id)a3;
- (void)reloadSections;
- (void)reloadSleepSection;
- (void)reloadWidgetTimeline;
- (void)saveScrollPoint;
- (void)saveState;
- (void)scrollToSavedPoint;
- (void)setAlarmEditViewController:(id)a3;
- (void)setAlarmEnabled:(BOOL)a3 forCell:(id)a4;
- (void)setAlarmManager:(id)a3;
- (void)setAlarmToEdit:(id)a3;
- (void)setAlarmsLoadedAction:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIsRunningPPTTest:(BOOL)a3;
- (void)setReloadDataFuture:(id)a3;
- (void)setSleepCoordinator:(id)a3;
- (void)setupButtonPressed;
- (void)setupForTest:(id)a3 options:(id)a4;
- (void)showAddView;
- (void)showAddViewForAlarm:(id)a3;
- (void)showAddViewForAlarmWithID:(id)a3;
- (void)showEditViewForRow:(int64_t)a3;
- (void)showSleepView:(BOOL)a3;
- (void)sleepScheduleModelDidChange;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTAAlarmTableViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmTableViewController;
  [(MTATableViewController *)&v4 viewDidAppear:a3];
  [(NSUserActivity *)self->_userActivity becomeCurrent];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(MTAAlarmTableViewController *)self _isWakeAlarmSection:a4]) {
    return 1;
  }

  return [(MTAAlarmTableViewController *)self numberOfItems];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(MTAAlarmTableViewController *)self numberOfItems] <= 0
    && [(MTAAlarmTableViewController *)self _isAlarmsSection:a4])
  {
    double v7 = 2.22507386e-308;
  }
  else
  {
    [v6 sectionHeaderHeight];
    double v7 = v8;
  }

  return v7;
}

- (MTAAlarmTableViewController)initWithAlarmManager:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MTAAlarmTableViewController;
  double v8 = [(MTATableViewController *)&v23 initWithTableViewStyle:1];
  if (v8)
  {
    v9 = +[UIImage systemImageNamed:@"alarm.fill"];
    v10 = [(MTAAlarmTableViewController *)v8 tabBarItem];
    [v10 setImage:v9];

    v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"ALARMS_LIST" value:&stru_1000A2560 table:0];
    [(MTAAlarmTableViewController *)v8 setTitle:v12];

    [(MTAAlarmTableViewController *)v8 setAlarmManager:v6];
    [(MTAAlarmTableViewController *)v8 setDataSource:v7];
    v13 = [(MTAAlarmTableViewController *)v8 dataSource];
    [v13 registerObserver:v8];

    v14 = [(MTAAlarmTableViewController *)v8 title];
    uint64_t v15 = +[NSUserActivity mtUserActivityWithActivityType:@"com.apple.clock.alarm" title:v14];
    userActivity = v8->_userActivity;
    v8->_userActivity = (NSUserActivity *)v15;

    uint64_t v17 = objc_opt_new();
    sections = v8->_sections;
    v8->_sections = (NSMutableArray *)v17;

    v19 = objc_opt_new();
    [(MTAAlarmTableViewController *)v8 setSleepCoordinator:v19];

    v20 = [(MTAAlarmTableViewController *)v8 sleepCoordinator];
    [v20 setDelegate:v8];

    v21 = v8;
  }

  return v8;
}

- (void)_reloadData:(id)a3
{
  id v4 = a3;
  v5 = [(MTAlarmDataSource *)self->_dataSource reloadAlarms];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C71C;
  v8[3] = &unk_1000A1A60;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 addCompletionBlock:v8];
  [(MTAAlarmTableViewController *)self setReloadDataFuture:v5];
}

- (void)setReloadDataFuture:(id)a3
{
}

- (void)dataSourceDidReload:(id)a3
{
  [(MTAAlarmTableViewController *)self reloadSections];
  [(MTATableViewController *)self _reloadUI:0];
  id v4 = [(MTAAlarmTableViewController *)self tableView];
  [v4 reloadData];

  [(MTAAlarmTableViewController *)self scrollToSavedPoint];
  alarmsLoadedAction = (void (**)(void))self->_alarmsLoadedAction;
  if (alarmsLoadedAction)
  {
    alarmsLoadedAction[2]();
    id v6 = self->_alarmsLoadedAction;
    self->_alarmsLoadedAction = 0;
  }
}

- (void)scrollToSavedPoint
{
  id v12 = +[NSUserDefaults standardUserDefaults];
  v3 = [v12 objectForKey:@"AlarmTableScrollPoint"];
  id v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    if (v5 >= 0.0)
    {
      double v6 = v5;
      id v7 = [(MTAAlarmTableViewController *)self tableView];
      [v7 contentSize];
      double v9 = v8;

      if (v9 > v6)
      {
        v10 = [(MTAAlarmTableViewController *)self tableView];
        [v10 setContentOffset:0.0, v6];
      }
    }
    [v12 removeObjectForKey:@"AlarmTableScrollPoint"];
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 postNotificationName:@"com.apple.mobiletimer.user-preferences-dirty" object:0];
  }
}

- (void)reloadSections
{
  [(NSMutableArray *)self->_sections removeAllObjects];
  v3 = [(MTAAlarmTableViewController *)self dataSource];
  id v4 = [v3 sleepAlarm];

  if (v4 || MTShouldHandleForEucalyptus() && (MTIdiomIpad() & 1) == 0) {
    [(NSMutableArray *)self->_sections addObject:&off_1000A4E80];
  }
  sections = self->_sections;

  [(NSMutableArray *)sections addObject:&off_1000A4E98];
}

- (int64_t)numberOfItems
{
  if ([(MTAAlarmTableViewController *)self isRunningPPTTest]) {
    return 20;
  }
  if (+[UIApplication shouldMakeUIForDefaultPNG])return 0; {
  id v4 = [(MTAAlarmTableViewController *)self dataSource];
  }
  id v5 = [v4 numberOfAlarms];

  return (int64_t)v5;
}

- (int64_t)numberOfItemsIncludingSleep
{
  if ([(MTAAlarmTableViewController *)self isRunningPPTTest]) {
    return 20;
  }
  if (+[UIApplication shouldMakeUIForDefaultPNG])return 0; {
  id v4 = [(MTAAlarmTableViewController *)self dataSource];
  }
  id v5 = [v4 numberOfAlarms];

  double v6 = [(MTAAlarmTableViewController *)self dataSource];
  id v7 = [v6 sleepAlarm];

  if (v7) {
    return (int64_t)v5 + 1;
  }
  else {
    return (int64_t)v5;
  }
}

- (MTAlarmDataSource)dataSource
{
  return self->_dataSource;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MTAAlarmTableViewController *)self isRunningPPTTest])
  {
    if (qword_1000C7CF0 != -1) {
      dispatch_once(&qword_1000C7CF0, &stru_1000A1AD0);
    }
    id v8 = (id)qword_1000C7CF8;
    goto LABEL_10;
  }
  unsigned int v9 = -[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", [v7 section]);
  v10 = [(MTAAlarmTableViewController *)self dataSource];
  v11 = v10;
  if (!v9)
  {
    [v10 alarmAtRow:[v7 row]];
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  id v8 = [v10 sleepAlarm];

  if (!MTShouldHandleForEucalyptus())
  {
LABEL_10:
    v13 = [v6 dequeueReusableCellWithIdentifier:off_1000C6F98 forIndexPath:v7];
    [v13 refreshUI:v8 animated:0];
    goto LABEL_11;
  }
  id v12 = [(MTAAlarmTableViewController *)self sleepCoordinator];
  if ([v12 didCompleteSleepOnboarding])
  {
  }
  else
  {
    uint64_t v15 = [(MTAAlarmTableViewController *)self dataSource];
    v16 = [v15 sleepAlarm];

    if (!v16)
    {
      v13 = [v6 dequeueReusableCellWithIdentifier:off_1000C7008 forIndexPath:v7];
      uint64_t v17 = +[NSBundle bundleWithIdentifier:@"com.apple.MobileTimerUI"];
      v18 = [v17 localizedStringForKey:@"SLEEP_ALARM_SETUP" value:&stru_1000A2560 table:@"MobileTimerUI_Burrito"];
      [v13 configureSetupButtonWithTitle:v18 action:"setupButtonPressed"];
      goto LABEL_16;
    }
  }
  v13 = [v6 dequeueReusableCellWithIdentifier:off_1000C7000 forIndexPath:v7];
  uint64_t v17 = [(MTAAlarmTableViewController *)self sleepCoordinator];
  v18 = [v17 sleepMetadata];
  [v13 refreshWithSleepMetadata:v18];
LABEL_16:

LABEL_11:
  [v13 setDelegate:self];

  return v13;
}

- (BOOL)isRunningPPTTest
{
  return self->_isRunningPPTTest;
}

- (BOOL)_isWakeAlarmSection:(int64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_sections count] <= a3)
  {
    unsigned int v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MTAAlarmTableViewController.m" lineNumber:404 description:@"Unexpected number of sections wake"];
  }
  id v6 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a3];
  BOOL v7 = [v6 integerValue] == (id)1;

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = [a3 dequeueReusableHeaderFooterViewWithIdentifier:@"kMTAAlarmTableViewHeaderReuseIdentifier"];
  BOOL v7 = +[UIListContentConfiguration _interactiveInsetGroupedHeaderConfiguration];
  id v8 = [v7 textProperties];
  unsigned int v9 = [v8 font];

  v10 = [v7 textProperties];
  v11 = [v10 color];

  id v12 = objc_alloc_init((Class)NSMutableParagraphStyle);
  v13 = [(MTAAlarmTableViewController *)self view];
  if (objc_msgSend(v13, "mtui_isRTL")) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 0;
  }
  [v12 setAlignment:v14];

  [v12 setLineBreakMode:0];
  uint64_t v15 = +[UIListContentConfiguration groupedHeaderConfiguration];
  if ([(MTAAlarmTableViewController *)self _isWakeAlarmSection:a4])
  {
    v16 = +[UIColor mtui_primaryColor];
    id v17 = +[UIImage mtui_imageWithSymbolName:@"bed.double.fill" scale:1 textStyle:UIFontTextStyleTitle3 andTintColor:v16];

    id v18 = objc_alloc_init((Class)NSTextAttachment);
    [v18 setImage:v17];
    +[NSBundle bundleWithIdentifier:@"com.apple.MobileTimerUI"];
    v36 = v7;
    v19 = v11;
    v21 = v20 = v6;
    v22 = [v21 localizedStringForKey:@"SLEEP_HEADER_TITLE" value:&stru_1000A2560 table:@"MobileTimerUI_Burrito"];
    objc_super v23 = +[NSString stringWithFormat:@" %@", v22];

    id v24 = objc_alloc((Class)NSMutableAttributedString);
    v40[0] = NSFontAttributeName;
    v40[1] = NSForegroundColorAttributeName;
    v37 = v9;
    v41[0] = v9;
    v41[1] = v19;
    v25 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
    id v26 = [v24 initWithString:v23 attributes:v25];

    v27 = +[NSAttributedString attributedStringWithAttachment:v18];
    id v28 = [v27 mutableCopy];

    [v28 appendAttributedString:v26];
    [v28 addAttribute:NSParagraphStyleAttributeName value:v12 range:0, [v28 length]];
    [v15 setAttributedText:v28];
    [v20 setContentConfiguration:v15];

    id v6 = v20;
    v11 = v19;
    BOOL v7 = v36;
  }
  else
  {
    if ([(MTAAlarmTableViewController *)self numberOfItems] < 1) {
      goto LABEL_9;
    }
    id v29 = objc_alloc((Class)NSAttributedString);
    v30 = +[NSBundle mainBundle];
    uint64_t v31 = [v30 localizedStringForKey:@"REGULAR_ALARMS_SECTION_HEADER_TITLE" value:&stru_1000A2560 table:0];
    v32 = v9;
    v33 = (void *)v31;
    v38[0] = NSFontAttributeName;
    v38[1] = NSForegroundColorAttributeName;
    v37 = v32;
    v39[0] = v32;
    v39[1] = v11;
    v38[2] = NSParagraphStyleAttributeName;
    v39[2] = v12;
    v34 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
    id v17 = [v29 initWithString:v33 attributes:v34];

    [v15 setAttributedText:v17];
    [v6 setContentConfiguration:v15];
  }

  unsigned int v9 = v37;
LABEL_9:

  return v6;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)MTAAlarmTableViewController;
  [(MTATableViewController *)&v14 viewDidLoad];
  [(MTATableViewController *)self reloadState];
  id v3 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v3 configureWithOpaqueBackground];
  [v3 setShadowColor:0];
  id v4 = [(MTAAlarmTableViewController *)self navigationItem];
  [v4 setScrollEdgeAppearance:v3];

  id v5 = [(MTAAlarmTableViewController *)self tableView];
  [v5 setAllowsSelectionDuringEditing:1];

  id v6 = [(MTAAlarmTableViewController *)self tableView];
  [v6 setAllowsSelection:1];

  BOOL v7 = [(MTAAlarmTableViewController *)self tableView];
  [v7 setLayoutMarginsFollowReadableWidth:1];

  id v8 = [(MTAAlarmTableViewController *)self tableView];
  [v8 setEstimatedRowHeight:96.0];

  unsigned int v9 = [(MTAAlarmTableViewController *)self tableView];
  [v9 setRowHeight:UITableViewAutomaticDimension];

  v10 = [(MTAAlarmTableViewController *)self tableView];
  [v10 registerClass:objc_opt_class() forCellReuseIdentifier:off_1000C6F98];

  v11 = [(MTAAlarmTableViewController *)self tableView];
  [v11 registerClass:objc_opt_class() forCellReuseIdentifier:off_1000C7000];

  id v12 = [(MTAAlarmTableViewController *)self tableView];
  [v12 registerClass:objc_opt_class() forCellReuseIdentifier:off_1000C7008];

  v13 = [(MTAAlarmTableViewController *)self tableView];
  [v13 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kMTAAlarmTableViewHeaderReuseIdentifier"];
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  [a3 sectionFooterHeight];
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)[(NSMutableArray *)self->_sections count];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmTableViewController;
  [(MTATableViewController *)&v4 viewWillAppear:a3];
  self->_viewVisible = 1;
}

- (MTASleepCoordinator)sleepCoordinator
{
  return self->_sleepCoordinator;
}

- (void)setSleepCoordinator:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (void)setAlarmManager:(id)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_reloadDataIfNecessary
{
  id v3 = [(MTAAlarmTableViewController *)self reloadDataFuture];

  if (!v3)
  {
    [(MTAAlarmTableViewController *)self _reloadData:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_viewVisible = 0;
  [(NSUserActivity *)self->_userActivity resignCurrent];
  v5.receiver = self;
  v5.super_class = (Class)MTAAlarmTableViewController;
  [(MTATableViewController *)&v5 viewDidDisappear:v3];
}

- (void)saveState
{
}

- (void)setupForTest:(id)a3 options:(id)a4
{
  -[MTAAlarmTableViewController setIsRunningPPTTest:](self, "setIsRunningPPTTest:", 1, a4);

  [(MTATableViewController *)self reloadState];
}

- (id)noItemsText
{
  return 0;
}

- (void)saveScrollPoint
{
  if ([(MTAAlarmTableViewController *)self isViewLoaded])
  {
    BOOL v3 = [(MTAAlarmTableViewController *)self tableView];
    [v3 contentOffset];
    *(float *)&double v5 = v4;
    id v7 = +[NSNumber numberWithFloat:v5];

    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setObject:v7 forKey:@"AlarmTableScrollPoint"];
  }
}

- (id)addViewController
{
  if (self->_alarmToEdit)
  {
    BOOL v3 = [(MTAAlarmTableViewController *)self dataSource];
    BOOL v4 = [v3 rowForAlarm:self->_alarmToEdit] == (id)0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v4 = 1;
  }
  double v5 = [[MTAAlarmEditViewController alloc] initWithAlarm:self->_alarmToEdit isNewAlarm:v4];
  [(MTAAlarmTableViewController *)self setAlarmEditViewController:v5];

  id v6 = [(MTAAlarmTableViewController *)self alarmEditViewController];
  [v6 setDelegate:self];

  id v7 = [MTAAddSheetNavigationController alloc];
  id v8 = [(MTAAlarmTableViewController *)self alarmEditViewController];
  unsigned int v9 = [(MTAAddSheetNavigationController *)v7 initWithRootViewController:v8];

  v10 = +[UIColor mtui_backgroundColor];
  v11 = [(MTAAddSheetNavigationController *)v9 view];
  [v11 setBackgroundColor:v10];

  return v9;
}

- (void)showAddView
{
}

- (void)showAddViewForAlarm:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_alarmToEdit, a3);
  id v6 = [(MTAAlarmTableViewController *)self tableView];
  [v6 setUserInteractionEnabled:0];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100028E48;
  v9[3] = &unk_1000A1428;
  id v10 = v5;
  v8.receiver = self;
  v8.super_class = (Class)MTAAlarmTableViewController;
  id v7 = v5;
  [(MTATableViewController *)&v8 showAddViewWithCompletion:v9];
}

- (void)showAddViewForAlarmWithID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [(MTAAlarmTableViewController *)self _reloadDataIfNecessary];
  id v5 = [(MTAAlarmTableViewController *)self reloadDataFuture];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100029024;
  v8[3] = &unk_1000A1A88;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  id v9 = v6;
  id v7 = [v5 addCompletionBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)dismissAddViewController:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000291B8;
  v6[3] = &unk_1000A1428;
  v6[4] = self;
  id v4 = a3;
  [(MTATableViewController *)self reloadState:v6];
  v5.receiver = self;
  v5.super_class = (Class)MTAAlarmTableViewController;
  [(MTATableViewController *)&v5 dismissAddViewController:v4];

  [(MTAAlarmTableViewController *)self setAlarmEditViewController:0];
}

- (void)finishAddViewControllerDismissal:(BOOL)a3
{
  BOOL v3 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000292E8;
  v8[3] = &unk_1000A1428;
  void v8[4] = self;
  [(MTATableViewController *)self reloadState:v8];
  v7.receiver = self;
  v7.super_class = (Class)MTAAlarmTableViewController;
  [(MTATableViewController *)&v7 finishAddViewControllerDismissal:v3];
  [(MTAAlarmTableViewController *)self setAlarmEditViewController:0];
  objc_super v5 = +[MTAStateStore shared];
  id v6 = +[MTAStateStoreEvent eventWithType:6];
  [v5 pushEvent:v6];
}

- (void)_addAlarm:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 alarmID];
    *(_DWORD *)buf = 138543362;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding alarm %{public}@", buf, 0xCu);
  }
  id v10 = [(MTAAlarmTableViewController *)self dataSource];
  v11 = [(MTAAlarmTableViewController *)self bypassReloadAlarm:v6];
  id v12 = [v10 addAlarm:v11];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000294C8;
  v15[3] = &unk_1000A1AB0;
  v15[4] = self;
  id v16 = v7;
  id v13 = v7;
  id v14 = [v12 addSuccessBlock:v15];
}

- (void)_updateAlarm:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 alarmID];
    *(_DWORD *)buf = 138543362;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating alarm %{public}@", buf, 0xCu);
  }
  id v10 = [(MTAAlarmTableViewController *)self dataSource];
  v11 = [(MTAAlarmTableViewController *)self bypassReloadAlarm:v6];
  id v12 = [v10 updateAlarm:v11];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000296A0;
  v15[3] = &unk_1000A1AB0;
  v15[4] = self;
  id v16 = v7;
  id v13 = v7;
  id v14 = [v12 addSuccessBlock:v15];
}

- (void)_removeAlarm:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 alarmID];
    *(_DWORD *)buf = 138543362;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing alarm %{public}@", buf, 0xCu);
  }
  id v10 = [(MTAAlarmTableViewController *)self dataSource];
  v11 = [(MTAAlarmTableViewController *)self bypassReloadAlarm:v6];
  id v12 = [v10 removeAlarm:v11];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100029878;
  v15[3] = &unk_1000A1AB0;
  v15[4] = self;
  id v16 = v7;
  id v13 = v7;
  id v14 = [v12 addSuccessBlock:v15];
}

- (id)bypassReloadAlarm:(id)a3
{
  id v3 = [a3 mutableCopy];
  id v4 = +[NSDate date];
  [v3 setBypassReloadDate:v4];

  id v5 = [v3 copy];

  return v5;
}

- (void)reloadWidgetTimeline
{
  id v3 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000299B8;
  block[3] = &unk_1000A1428;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)showEditViewForRow:(int64_t)a3
{
  id v6 = [(MTAAlarmTableViewController *)self dataSource];
  id v5 = [v6 alarmAtRow:a3];
  [(MTAAlarmTableViewController *)self showAddViewForAlarm:v5];
}

- (BOOL)_isAlarmsSection:(int64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_sections count] <= a3)
  {
    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MTAAlarmTableViewController.m" lineNumber:409 description:@"Unexpected number of sections regular"];
  }
  id v6 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a3];
  BOOL v7 = [v6 integerValue] == (id)3;

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    if (a5)
    {
      uint64_t v16 = v5;
      uint64_t v17 = v6;
      id v9 = a5;
      id v10 = a3;
      id v11 = [v9 row];
      id v12 = [(MTAAlarmTableViewController *)self dataSource];
      id v13 = [v12 alarmAtRow:v11];

      [v10 beginUpdates];
      [(MTAAlarmTableViewController *)self _removeAlarm:v13 withCompletionBlock:0];
      id v14 = +[NSArray arrayWithObject:v9];
      [v10 deleteRowsAtIndexPaths:v14 withRowAnimation:2];

      v15.receiver = self;
      v15.super_class = (Class)MTAAlarmTableViewController;
      [(MTATableViewController *)&v15 tableView:v10 commitEditingStyle:1 forRowAtIndexPath:v9];

      [v10 endUpdates];
    }
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return -[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", objc_msgSend(a4, "section", a3)) ^ 1;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return ![self _isWakeAlarmSection:[a4 section]];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  if (!-[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", [a4 section]))return 1; {

  }
  return MTShouldHandleForBedtime();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if (-[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", [v6 section]))
  {
    MTShouldHandleForBedtime();
  }
  else
  {
    uint64_t v5 = v6;
    if (!v6) {
      goto LABEL_6;
    }
    -[MTAAlarmTableViewController showEditViewForRow:](self, "showEditViewForRow:", [v6 row]);
  }
  uint64_t v5 = v6;
LABEL_6:
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTAAlarmTableViewController;
  [(MTAAlarmTableViewController *)&v8 setEditing:a3 animated:a4];
  uint64_t v5 = +[MTAStateStore shared];
  if (v4) {
    uint64_t v6 = 7;
  }
  else {
    uint64_t v6 = 6;
  }
  BOOL v7 = +[MTAStateStoreEvent eventWithType:v6];
  [v5 pushEvent:v7];
}

- (void)changeButtonPressed
{
}

- (void)setupButtonPressed
{
}

- (void)showSleepView:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MTAAlarmTableViewController *)self sleepCoordinator];
  unsigned int v6 = [v5 isHealthAppNotInstalled];

  if (v6)
  {
    if (v3)
    {
      +[MTUIUtility openSleepInHealthApp];
    }
  }
  else
  {
    BOOL v7 = [(MTAAlarmTableViewController *)self sleepCoordinator];
    id v9 = [v7 sleepEditController];

    objc_super v8 = v9;
    if (v9)
    {
      [(MTAAlarmTableViewController *)self presentViewController:v9 animated:1 completion:&stru_1000A1AF0];
      objc_super v8 = v9;
    }
  }
}

- (void)presentSleepAlert:(id)a3
{
}

- (void)sleepScheduleModelDidChange
{
  BOOL v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unsigned int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading sleep section", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A180;
  block[3] = &unk_1000A1428;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)reloadSleepSection
{
  id v3 = [(NSMutableArray *)self->_sections indexOfObject:&off_1000A4E80];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = v3;
    id v6 = [(MTAAlarmTableViewController *)self tableView];
    uint64_t v5 = +[NSIndexSet indexSetWithIndex:v4];
    [v6 reloadSections:v5 withRowAnimation:100];
  }
}

- (void)healthAppInstallationDidChange
{
  id v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Health app installation changed", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A338;
  block[3] = &unk_1000A1428;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didDismissViewController
{
  id v3 = +[MTAStateStore shared];
  v2 = +[MTAStateStoreEvent eventWithType:6];
  [v3 pushEvent:v2];
}

- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002A4C4;
  v9[3] = &unk_1000A1B38;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  [(MTAAlarmTableViewController *)self _addAlarm:v8 withCompletionBlock:v9];
  [(MTAAlarmTableViewController *)self dismissAddViewController:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002A638;
  v9[3] = &unk_1000A1B38;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  [(MTAAlarmTableViewController *)self _updateAlarm:v8 withCompletionBlock:v9];
  [(MTAAlarmTableViewController *)self dismissAddViewController:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_scrollToAlarm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTAAlarmTableViewController *)self dataSource];
  id v6 = [v5 rowForAlarm:v4];

  id v7 = [(NSMutableArray *)self->_sections indexOfObject:&off_1000A4E98];
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = v7;
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = [(MTAAlarmTableViewController *)self tableView];
      id v9 = +[NSIndexPath indexPathForRow:v6 inSection:v8];
      [v10 scrollToRowAtIndexPath:v9 atScrollPosition:0 animated:0];
    }
  }
}

- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4
{
  id v6 = a3;
  [(MTAAlarmTableViewController *)self _removeAlarm:a4 withCompletionBlock:0];
  [(MTAAlarmTableViewController *)self dismissAddViewController:v6];
}

- (void)handleContentSizeTransitionFrom:(id)a3
{
  id v4 = [a3 currentAlarmEditController];
  [(MTAAlarmTableViewController *)self setAlarmEditViewController:v4];

  id v5 = [(MTAAlarmTableViewController *)self alarmEditViewController];
  [v5 setDelegate:self];
}

- (void)setAlarmEnabled:(BOOL)a3 forCell:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MTAAlarmTableViewController *)self tableView];
  id v8 = [v7 indexPathForCell:v6];

  LODWORD(v6) = -[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", [v8 section]);
  id v9 = [(MTAAlarmTableViewController *)self dataSource];
  id v10 = v9;
  if (v6)
  {
    id v11 = [v9 sleepAlarm];
    id v12 = [v11 mutableCopy];

    [v12 setSleepSchedule:v4];
  }
  else
  {
    id v13 = [v9 alarmAtRow:[v8 row]];
    id v12 = [v13 mutableCopy];
  }
  [v12 setEnabled:v4];
  id v14 = MTLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v15 = [v12 alarmID];
    *(_DWORD *)buf = 138543618;
    v22 = v15;
    __int16 v23 = 1024;
    BOOL v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Setting alarm %{public}@ to enabled: %d", buf, 0x12u);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002AA70;
  v17[3] = &unk_1000A1B60;
  id v18 = v12;
  v19 = self;
  BOOL v20 = v4;
  id v16 = v12;
  [(MTAAlarmTableViewController *)self _updateAlarm:v16 withCompletionBlock:v17];
}

- (id)alarmsLoadedAction
{
  return self->_alarmsLoadedAction;
}

- (void)setAlarmsLoadedAction:(id)a3
{
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (NAFuture)reloadDataFuture
{
  return self->_reloadDataFuture;
}

- (MTAlarm)alarmToEdit
{
  return self->_alarmToEdit;
}

- (void)setAlarmToEdit:(id)a3
{
}

- (void)setIsRunningPPTTest:(BOOL)a3
{
  self->_isRunningPPTTest = a3;
}

- (MTAAlarmEditViewController)alarmEditViewController
{
  return self->_alarmEditViewController;
}

- (void)setAlarmEditViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepCoordinator, 0);
  objc_storeStrong((id *)&self->_alarmEditViewController, 0);
  objc_storeStrong((id *)&self->_alarmToEdit, 0);
  objc_storeStrong((id *)&self->_reloadDataFuture, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong(&self->_alarmsLoadedAction, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end