@interface MTAAppController
- (BOOL)_canShowTextServices;
- (BOOL)_runResizeTest;
- (BOOL)_runRotationTest;
- (BOOL)_runScrollTest:(id)a3;
- (BOOL)_runSelectTest:(id)a3;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (UIViewController)containerViewController;
- (double)visibleViewHeight;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (int64_t)interfaceOrientation;
- (void)_handleAddSpecifierForSection:(int64_t)a3;
- (void)_handleDefaultSpecifierForSection:(int64_t)a3;
- (void)_handleEditSpecifierForSection:(int64_t)a3;
- (void)_selectViewController:(id)a3;
- (void)_spinMainRunLoop;
- (void)_windowDidRotate:(id)a3;
- (void)appIntentsProvider:(id)a3 didSelectTab:(unint64_t)a4;
- (void)applicationWillTerminate:(id)a3;
- (void)applyStyle;
- (void)cancelScheduledUserPreferencesCommit;
- (void)commitUserPreferences;
- (void)dealloc;
- (void)didAddNewWorldClockWithName:(id)a3 provider:(id)a4;
- (void)didRemoveWorldClockWithName:(id)a3 provider:(id)a4;
- (void)finishedTest:(id)a3 extraResults:(id)a4;
- (void)handleFrameworkPreferencesNotification:(id)a3;
- (void)handleUserPreferencesChanged;
- (void)initWindowAndViewControllersWithWindowScene:(id)a3;
- (void)prepareTabBarControllerRestoreIndex:(BOOL)a3;
- (void)reloadTimerState;
- (void)restoreLastSelectedTabIndex;
- (void)saveState;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 openURL:(id)a4 sourceApplication:(id)a5;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)scheduleUserPreferencesCommit;
- (void)startedTest:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)windowSceneWillConnect:(id)a3;
@end

@implementation MTAAppController

- (void)restoreLastSelectedTabIndex
{
  v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 integerForKey:@"LAST_SELECTED_VIEW"];

  if ((uint64_t)v4 <= 0) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = (unint64_t)v4 - 1;
  }
  id v7 = [(MTATabBarController *)self->_tabBarController viewControllers];
  if (v5 >= (unint64_t)[v7 count]) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = v5;
  }
  [(MTATabBarController *)self->_tabBarController setSelectedIndex:v6];
}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MTAAppController;
  [(MTAAppController *)&v6 finishedTest:a3 extraResults:a4];
  currentTestName = self->_currentTestName;
  self->_currentTestName = 0;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  unint64_t v5 = [a4 configuration];
  [v5 setDelegateClass:objc_opt_class()];

  return v5;
}

- (void)startedTest:(id)a3
{
  objc_storeStrong((id *)&self->_currentTestName, a3);
  id v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTAAppController;
  [(MTAAppController *)&v6 startedTest:v5];
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ application willFinishLaunchingWithOptions", (uint8_t *)&v8, 0xCu);
  }

  objc_super v6 = dispatch_get_global_queue(0, 0);
  dispatch_async(v6, &stru_1000A18A8);

  return 1;
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ sceneDidBecomeActive", buf, 0xCu);
  }

  if (+[UIApplication shouldMakeUIForDefaultPNG])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v5 = [(MTATabBarController *)self->_tabBarController viewControllers];
    id v6 = [v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v9) topViewController];
          [v10 setTitle:&stru_1000A2560];
          v11 = [v10 navigationItem];
          [v11 setLeftBarButtonItem:0];

          v12 = [v10 navigationItem];
          [v12 setRightBarButtonItem:0];

          v13 = [v10 view];
          [v13 setHidden:1];

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v7);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v14 = [(MTATabBarController *)self->_tabBarController view];
    v15 = [v14 subviews];
    v16 = [v15 objectAtIndex:1];
    v17 = [v16 subviews];

    id v18 = [v17 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        v21 = 0;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v21);
          if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
          {
            [v22 _setSelected:0];
            [v22 _showSelectedIndicator:0 changeSelection:0];
          }
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v19);
    }
  }
  v23 = MTLogForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    sessionManager = self->_sessionManager;
    *(_DWORD *)buf = 138543618;
    v34 = self;
    __int16 v35 = 2114;
    v36 = sessionManager;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ ending session with manager: %{public}@", buf, 0x16u);
  }

  [(MTSessionManager *)self->_sessionManager endAlertingSession];
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ sceneWillEnterForeground", (uint8_t *)&v11, 0xCu);
  }

  [(MTAAppController *)self prepareTabBarControllerRestoreIndex:1];
  [(MTAAppController *)self reloadTimerState];
  id v5 = [(MTATabBarController *)self->_tabBarController stopwatchViewController];
  unsigned int v6 = [v5 isViewLoaded];

  if (v6)
  {
    id v7 = [(MTATabBarController *)self->_tabBarController stopwatchViewController];
    [v7 reloadState];
  }
  uint64_t v8 = +[UIApplication sharedApplication];
  v9 = [v8 shortcutItems];
  id v10 = [v9 count];

  if (!v10) {
    [(MTATabBarController *)self->_tabBarController populateShortcutItems];
  }
  [(MTATabBarController *)self->_tabBarController restoreState];
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138543362;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ application didFinishLaunchingWithOptions", (uint8_t *)&v22, 0xCu);
  }

  unsigned int v6 = (MTAlarmManager *)objc_opt_new();
  alarmManager = self->_alarmManager;
  self->_alarmManager = v6;

  uint64_t v8 = (MTAlarmDataSource *)[objc_alloc((Class)MTAlarmDataSource) initWithAlarmManager:self->_alarmManager];
  alarmDataSource = self->_alarmDataSource;
  self->_alarmDataSource = v8;

  id v10 = (MTTimerManager *)objc_opt_new();
  timerManager = self->_timerManager;
  self->_timerManager = v10;

  v12 = (MTSessionManager *)objc_opt_new();
  sessionManager = self->_sessionManager;
  self->_sessionManager = v12;

  v14 = (MTTimerDataSource *)[objc_alloc((Class)MTTimerDataSource) initWithTimerManager:self->_timerManager];
  timerDataSource = self->_timerDataSource;
  self->_timerDataSource = v14;

  v16 = (MTUserNotificationAppDelegate *)objc_opt_new();
  notificationDelegate = self->_notificationDelegate;
  self->_notificationDelegate = v16;

  +[UIView _naui_beginDebuggingAutolayout];
  +[ClockManager loadUserPreferences];
  id v18 = +[MTAppIntentsProvider sharedInstance];
  [v18 setDelegate:self];

  id v19 = +[UIApplication sharedApplication];
  uint64_t v20 = [v19 keyWindow];
  [v20 _accessibilitySetInterfaceStyleIntent:2];

  return 1;
}

- (void)applyStyle
{
  v2 = +[UINavigationBar appearance];
  [v2 setBarStyle:1];

  v3 = +[UINavigationBar appearance];
  [v3 setTranslucent:1];

  id v4 = +[UINavigationBar appearance];
  id v5 = +[UIColor mtui_tintColor];
  [v4 setTintColor:v5];

  unsigned int v6 = +[UITabBar appearance];
  [v6 setBarStyle:1];

  id v7 = +[UITabBar appearance];
  [v7 setTranslucent:1];

  uint64_t v8 = +[UITabBar appearance];
  v9 = +[UIColor mtui_tintColor];
  [v8 setTintColor:v9];

  id v31 = (id)objc_opt_new();
  id v10 = +[UIColor mtui_backgroundColor];
  [v31 setBackgroundColor:v10];

  int v11 = +[UITabBar appearance];
  [v11 setScrollEdgeAppearance:v31];

  v12 = +[UIToolbar appearance];
  [v12 setBarStyle:1];

  v13 = +[UIToolbar appearance];
  [v13 setTranslucent:1];

  v14 = +[UIToolbar appearance];
  v15 = +[UIColor mtui_tintColor];
  [v14 setTintColor:v15];

  v16 = +[UITableView appearance];
  v17 = +[UIColor mtui_backgroundColor];
  [v16 setBackgroundColor:v17];

  id v18 = +[UITableView appearance];
  id v19 = +[UIColor mtui_cellSeparatorColor];
  [v18 setSeparatorColor:v19];

  uint64_t v20 = +[UITableView appearance];
  [v20 setIndicatorStyle:2];

  v21 = +[UITableView appearance];
  int v22 = +[UIColor mtui_tintColor];
  [v21 setSectionIndexColor:v22];

  v23 = +[UITableView appearance];
  v24 = +[UIColor mtui_backgroundColor];
  [v23 setSectionIndexBackgroundColor:v24];

  long long v25 = +[UITableView appearance];
  long long v26 = +[UIColor mtui_tintColor];
  [v25 setTintColor:v26];

  long long v27 = +[UITableViewCell appearance];
  long long v28 = +[UIColor mtui_backgroundColor];
  [v27 setBackgroundColor:v28];

  long long v29 = +[UIButton appearance];
  long long v30 = +[UIColor mtui_tintColor];
  [v29 setTintColor:v30];
}

- (void)reloadTimerState
{
  v3 = [(MTATabBarController *)self->_tabBarController timerViewController];
  unsigned int v4 = [v3 isViewLoaded];

  if (v4)
  {
    id v5 = [(MTATabBarController *)self->_tabBarController timerViewController];
    [v5 reloadState];
  }
}

- (void)initWindowAndViewControllersWithWindowScene:(id)a3
{
  id v4 = a3;
  id v5 = [[MTASecureWindow alloc] initWithWindowScene:v4];

  window = self->_window;
  self->_window = v5;

  id v7 = self->_window;
  uint64_t v8 = +[UIColor mtui_tintColor];
  [(MTASecureWindow *)v7 setTintColor:v8];

  v9 = self->_window;
  id v10 = +[UIColor mtui_backgroundColor];
  [(MTASecureWindow *)v9 setBackgroundColor:v10];

  [(MTASecureWindow *)self->_window makeKeyAndVisible];
  [(MTAAppController *)self applyStyle];
  int v11 = [[MTATabBarController alloc] initWithAlarmManager:self->_alarmManager alarmDataSource:self->_alarmDataSource timerManager:self->_timerManager timerDataSource:self->_timerDataSource];
  tabBarController = self->_tabBarController;
  self->_tabBarController = v11;

  id v14 = +[NSNotificationCenter defaultCenter];
  [v14 addObserver:self selector:"scheduleUserPreferencesCommit" name:@"com.apple.mobiletimer.user-preferences-dirty" object:0];
  [v14 addObserver:self selector:"handleFrameworkPreferencesNotification:" name:MobileTimerFrameworkPreferencesChanged object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10001D9D8, @"com.apple.mobiletimer.user-preferences-changed", 0, (CFNotificationSuspensionBehavior)0);
}

- (void)windowSceneWillConnect:(id)a3
{
}

- (void)prepareTabBarControllerRestoreIndex:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000055E0;
  v3[3] = &unk_1000A18F8;
  v3[4] = self;
  BOOL v4 = a3;
  if (qword_1000C7B98 != -1) {
    dispatch_once(&qword_1000C7B98, v3);
  }
}

- (BOOL)_canShowTextServices
{
  return 0;
}

- (UIViewController)containerViewController
{
  return (UIViewController *)self->_tabBarController;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)MTAAppController;
  [(MTAAppController *)&v4 dealloc];
}

- (void)scene:(id)a3 openURL:(id)a4 sourceApplication:(id)a5
{
  id v6 = a4;
  id v7 = [v6 resourceSpecifier];
  id v8 = [v6 mtClockAppSection];

  if (v8 != (id)-1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001DB18;
    block[3] = &unk_1000A18D0;
    block[4] = self;
    id v10 = v7;
    id v11 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_handleDefaultSpecifierForSection:(int64_t)a3
{
  unint64_t v4 = [(MTATabBarController *)self->_tabBarController tabIndexForAppSection:a3];
  [(MTATabBarController *)self->_tabBarController setSelectedIndex:v4];
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v5 = +[NSNumber numberWithUnsignedInteger:v4 + 1];
  [v6 setObject:v5 forKey:@"LAST_SELECTED_VIEW"];
}

- (void)_handleEditSpecifierForSection:(int64_t)a3
{
  if (a3 == 2)
  {
    -[MTAAppController _handleDefaultSpecifierForSection:](self, "_handleDefaultSpecifierForSection:");
    tabBarController = self->_tabBarController;
    [(MTATabBarController *)tabBarController showSleepView];
  }
}

- (void)_handleAddSpecifierForSection:(int64_t)a3
{
  if (a3 == 4)
  {
    -[MTAAppController _handleDefaultSpecifierForSection:](self, "_handleDefaultSpecifierForSection:");
    tabBarController = self->_tabBarController;
    [(MTATabBarController *)tabBarController showAddView];
  }
}

- (int64_t)interfaceOrientation
{
  v2 = [(MTASecureWindow *)self->_window windowScene];
  id v3 = [v2 interfaceOrientation];

  return (int64_t)v3;
}

- (void)saveState
{
  id v3 = +[NSNumber numberWithUnsignedInteger:(char *)[(MTATabBarController *)self->_tabBarController selectedIndex] + 1];
  CFPreferencesSetAppValue(@"LAST_SELECTED_VIEW", v3, @"com.apple.mobiletimer");

  unint64_t v4 = [(MTATabBarController *)self->_tabBarController worldClockViewController];
  [v4 saveState];

  id v5 = [(MTATabBarController *)self->_tabBarController alarmViewController];
  [v5 saveState];

  id v6 = [(MTATabBarController *)self->_tabBarController stopwatchViewController];
  [v6 saveState];

  id v7 = [(MTATabBarController *)self->_tabBarController timerViewController];
  [v7 saveState];

  [(MTAAppController *)self commitUserPreferences];

  _CPLoggingFlush(-1);
}

- (void)cancelScheduledUserPreferencesCommit
{
  [(NSTimer *)self->_userPreferencesCommitTimer invalidate];
  userPreferencesCommitTimer = self->_userPreferencesCommitTimer;
  self->_userPreferencesCommitTimer = 0;
}

- (void)scheduleUserPreferencesCommit
{
  [(MTAAppController *)self cancelScheduledUserPreferencesCommit];
  self->_userPreferencesCommitTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"commitUserPreferences" selector:0 userInfo:0 repeats:3.0];

  _objc_release_x1();
}

- (void)commitUserPreferences
{
  [(MTAAppController *)self cancelScheduledUserPreferencesCommit];

  CFPreferencesAppSynchronize(@"com.apple.mobiletimer");
}

- (void)handleFrameworkPreferencesNotification:(id)a3
{
}

- (void)handleUserPreferencesChanged
{
  id v3 = [(MTATabBarController *)self->_tabBarController worldClockViewController];
  unsigned int v4 = [v3 isViewLoaded];

  if (!self->_userPreferencesCommitTimer)
  {
    +[ClockManager loadUserPreferences];
    if (v4)
    {
      id v6 = +[WorldClockManager sharedManager];
      if ([v6 checkIfCitiesModified])
      {
        id v5 = [(MTATabBarController *)self->_tabBarController worldClockViewController];
        [v5 reloadState];
      }
    }
  }
}

- (void)applicationWillTerminate:(id)a3
{
}

- (BOOL)_runSelectTest:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self->_currentTestName isEqualToString:@"SelectAlarm"])
  {
    uint64_t v5 = [(MTATabBarController *)self->_tabBarController alarmViewController];
  }
  else if ([(NSString *)self->_currentTestName isEqualToString:@"SelectWorldClock"])
  {
    uint64_t v5 = [(MTATabBarController *)self->_tabBarController worldClockViewController];
  }
  else if ([(NSString *)self->_currentTestName isEqualToString:@"SelectStopwatch"])
  {
    uint64_t v5 = [(MTATabBarController *)self->_tabBarController stopwatchViewController];
  }
  else
  {
    if (![(NSString *)self->_currentTestName isEqualToString:@"SelectTimer"]) {
      goto LABEL_13;
    }
    uint64_t v5 = [(MTATabBarController *)self->_tabBarController timerViewController];
  }
  id v6 = (void *)v5;
  if (v5)
  {
    if (objc_opt_respondsToSelector()) {
      [v6 setupForTest:self->_currentTestName options:v4];
    }
    [(MTAAppController *)self startedTest:self->_currentTestName];
    [(MTAAppController *)self _selectViewController:v6];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E248;
    block[3] = &unk_1000A1920;
    block[4] = self;
    id v10 = v6;
    id v11 = v4;
    id v7 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
LABEL_13:

  return 1;
}

- (BOOL)_runScrollTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"natural"];
  if ([v5 BOOLValue]) {
    unsigned int v6 = +[RPTTestRunner isRecapAvailable];
  }
  else {
    unsigned int v6 = 0;
  }

  if ([(NSString *)self->_currentTestName containsString:@"ScrollAlarm"])
  {
    id v7 = [(MTATabBarController *)self->_tabBarController alarmViewController];
    int v8 = 0;
    if (!v7) {
      goto LABEL_22;
    }
  }
  else
  {
    if (![(NSString *)self->_currentTestName containsString:@"ScrollWorldClock"]) {
      goto LABEL_22;
    }
    id v7 = [(MTATabBarController *)self->_tabBarController worldClockViewController];
    if ([(NSString *)self->_currentTestName containsString:@"Edit"])
    {
      v9 = [(MTATabBarController *)self->_tabBarController worldClockViewController];
      int v8 = 1;
      [v9 setEditing:1 animated:1];

      if (!v7) {
        goto LABEL_22;
      }
    }
    else
    {
      int v8 = 0;
      if (!v7) {
        goto LABEL_22;
      }
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v7 setupForTest:self->_currentTestName options:v4];
  }
  [(MTAAppController *)self _selectViewController:v7];
  [(MTAAppController *)self _spinMainRunLoop];
  id v10 = [v7 contentScrollView];
  if (v6)
  {
    id v11 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:self->_currentTestName scrollView:v10 completionHandler:0];
    +[RPTTestRunner runTestWithParameters:v11];
  }
  else
  {
    currentTestName = self->_currentTestName;
    id v11 = [v4 objectForKeyedSubscript:@"iterations"];
    id v13 = [v11 intValue];
    id v14 = [v4 objectForKey:@"offset"];
    [v10 _performScrollTest:currentTestName iterations:v13 delta:[v14 intValue]];
  }
  if (v8)
  {
    v15 = [(MTATabBarController *)self->_tabBarController worldClockViewController];
    [v15 setEditing:0 animated:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v7 teardownForTest:self->_currentTestName options:v4];
  }

LABEL_22:
  return 1;
}

- (void)_spinMainRunLoop
{
  id v3 = +[NSRunLoop mainRunLoop];
  v2 = +[NSDate dateWithTimeIntervalSinceNow:2.0];
  [v3 runUntilDate:v2];
}

- (void)_selectViewController:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v14 = self;
  uint64_t v5 = [(MTATabBarController *)self->_tabBarController viewControllers];
  unsigned int v6 = (char *)[v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      id v10 = 0;
      v15 = &v7[(void)v8];
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(id *)(*((void *)&v16 + 1) + 8 * (void)v10);
        if (v11 == v4
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && ([v11 viewControllers],
              v12 = objc_claimAutoreleasedReturnValue(),
              [v12 objectAtIndexedSubscript:0],
              id v13 = (id)objc_claimAutoreleasedReturnValue(),
              v13,
              v12,
              v13 == v4))
        {

          if (&v10[(void)v8] != (char *)-1) {
            -[MTATabBarController setSelectedIndex:](v14->_tabBarController, "setSelectedIndex:");
          }
          goto LABEL_14;
        }
        ++v10;
      }
      while (v7 != v10);
      id v7 = (char *)[v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      int v8 = v15;
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_14:
}

- (BOOL)_runRotationTest
{
  id v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = UIWindowDidRotateNotification;
  uint64_t v5 = +[UIWindow keyWindow];
  [v3 addObserver:self selector:"_windowDidRotate:" name:v4 object:v5];

  [(MTAAppController *)self rotateIfNeeded:1];
  [(MTAAppController *)self _spinMainRunLoop];
  [(MTAAppController *)self startedTest:self->_currentTestName];
  [(MTAAppController *)self rotateIfNeeded:3];
  return 1;
}

- (BOOL)_runResizeTest
{
  id v3 = objc_alloc((Class)RPTResizeTestParameters);
  currentTestName = self->_currentTestName;
  uint64_t v5 = +[UIWindow keyWindow];
  id v6 = [v3 initWithTestName:currentTestName window:v5 completionHandler:0];

  +[RPTTestRunner runTestWithParameters:v6];
  return 1;
}

- (void)_windowDidRotate:(id)a3
{
  id v4 = a3;
  if (self->_currentTestName)
  {
    id v12 = v4;
    if (self->_iterations)
    {
      uint64_t v5 = +[UIWindow keyWindow];
      id v6 = [v5 interfaceOrientation];

      if (v6 == (id)3)
      {
        --self->_iterations;
        id v7 = self;
        uint64_t v8 = 1;
      }
      else
      {
        id v7 = self;
        uint64_t v8 = 3;
      }
      [(MTAAppController *)v7 rotateIfNeeded:v8];
    }
    else
    {
      -[MTAAppController finishedTest:extraResults:](self, "finishedTest:extraResults:");
      uint64_t v9 = +[NSNotificationCenter defaultCenter];
      uint64_t v10 = UIWindowDidRotateNotification;
      id v11 = +[UIWindow keyWindow];
      [v9 removeObserver:self name:v10 object:v11];
    }
    id v4 = v12;
  }
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5 = a4;
  id v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will Continue with Activity Type:%@", (uint8_t *)&v9, 0xCu);
  }

  [(MTAAppController *)self prepareTabBarControllerRestoreIndex:0];
  if (qword_1000C7BA0 != -1) {
    dispatch_once(&qword_1000C7BA0, &stru_1000A1940);
  }
  if ([v5 isEqualToString:@"com.apple.clock.worldclock"])
  {
    uint64_t v7 = [(MTATabBarController *)self->_tabBarController worldClockViewController];
  }
  else if (([v5 isEqualToString:@"com.apple.clock.alarm"] & 1) != 0 {
         || ([v5 isEqualToString:@"com.apple.clock.wakealarm"] & 1) != 0
  }
         || [v5 isEqualToString:@"com.apple.clock.bedtime"])
  {
    uint64_t v7 = [(MTATabBarController *)self->_tabBarController alarmViewController];
  }
  else if ([v5 isEqualToString:@"com.apple.clock.stopwatch"])
  {
    uint64_t v7 = [(MTATabBarController *)self->_tabBarController stopwatchViewController];
  }
  else
  {
    if (![v5 isEqualToString:@"com.apple.clock.timer"]) {
      goto LABEL_12;
    }
    uint64_t v7 = [(MTATabBarController *)self->_tabBarController timerViewController];
  }
  uint64_t v8 = (void *)v7;
  [(MTAAppController *)self _selectViewController:v7];

LABEL_12:
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v10 = a4;
  id v5 = [v10 interaction];
  id v6 = [v5 intent];

  if (v6)
  {
    [(MTATabBarController *)self->_tabBarController performActionForIntent:v6];
  }
  else
  {
    uint64_t v7 = [v10 activityType];
    unsigned int v8 = [v7 isEqualToString:@"com.apple.clock.worldclock"];

    if (v8)
    {
      int v9 = [(MTATabBarController *)self->_tabBarController worldClockViewController];
      if (objc_opt_respondsToSelector()) {
        [v9 restoreWithUserActivity:v10];
      }
    }
  }
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v6 = a5;
  uint64_t v7 = MTLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10006CB78((uint64_t)self, (uint64_t)v6, v7);
  }
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v6 = +[MTAStateStore shared];
  [v6 bypass];

  [(MTAAppController *)self prepareTabBarControllerRestoreIndex:0];
  [(MTATabBarController *)self->_tabBarController performActionForShortcutItem:v7];
}

- (void)appIntentsProvider:(id)a3 didSelectTab:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
      id v7 = MTLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        id v14 = "-[MTAAppController appIntentsProvider:didSelectTab:]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Handling AppIntents action for MTProviderTabClock", (uint8_t *)&v13, 0xCu);
      }

      uint64_t v8 = [(MTATabBarController *)self->_tabBarController worldClockViewController];
      goto LABEL_14;
    case 1uLL:
      int v9 = MTLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        id v14 = "-[MTAAppController appIntentsProvider:didSelectTab:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Handling AppIntents action for MTProviderTabAlarm", (uint8_t *)&v13, 0xCu);
      }

      uint64_t v8 = [(MTATabBarController *)self->_tabBarController alarmViewController];
      goto LABEL_14;
    case 2uLL:
      id v10 = MTLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        id v14 = "-[MTAAppController appIntentsProvider:didSelectTab:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Handling AppIntents action for MTProviderTabStopwatch", (uint8_t *)&v13, 0xCu);
      }

      uint64_t v8 = [(MTATabBarController *)self->_tabBarController stopwatchViewController];
      goto LABEL_14;
    case 3uLL:
      id v11 = MTLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        id v14 = "-[MTAAppController appIntentsProvider:didSelectTab:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Handling AppIntents action for MTProviderTabTimer", (uint8_t *)&v13, 0xCu);
      }

      uint64_t v8 = [(MTATabBarController *)self->_tabBarController timerViewController];
LABEL_14:
      id v12 = (void *)v8;
      [(MTAAppController *)self _selectViewController:v8];

      break;
    default:
      break;
  }
}

- (void)didAddNewWorldClockWithName:(id)a3 provider:(id)a4
{
  id v5 = a3;
  id v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didAddNewWordClockWithName: %{public}@", buf, 0x16u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F234;
  v8[3] = &unk_1000A14C0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)didRemoveWorldClockWithName:(id)a3 provider:(id)a4
{
  id v5 = a3;
  id v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didRemoveWorldClockWithName: %{public}@", buf, 0x16u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F584;
  v8[3] = &unk_1000A14C0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 objectForKey:@"iterations"];
  self->_iterations = (int64_t)[v9 integerValue];

  objc_storeStrong((id *)&self->_currentTestName, a3);
  if ([v7 rangeOfString:@"Scroll"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v13 = [(MTAAppController *)self _runScrollTest:v8];
LABEL_23:
    BOOL v16 = v13;
    goto LABEL_24;
  }
  if ([v7 rangeOfString:@"Select"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v13 = [(MTAAppController *)self _runSelectTest:v8];
    goto LABEL_23;
  }
  if (([v7 hasPrefix:@"Rotate"] & 1) == 0
    && ![v7 hasPrefix:@"Resize"])
  {
    goto LABEL_22;
  }
  if ((MTUIIsPadIdiom() & 1) == 0)
  {
    id v10 = +[UIDevice currentDevice];
    id v11 = [v10 userInterfaceIdiom];

    if (v11 != (id)5) {
      goto LABEL_22;
    }
  }
  if ([v7 hasSuffix:@"WorldClock"])
  {
    uint64_t v12 = [(MTATabBarController *)self->_tabBarController worldClockViewController];
  }
  else if ([v7 hasSuffix:@"Alarm"])
  {
    uint64_t v12 = [(MTATabBarController *)self->_tabBarController alarmViewController];
  }
  else if ([v7 hasSuffix:@"Stopwatch"])
  {
    uint64_t v12 = [(MTATabBarController *)self->_tabBarController stopwatchViewController];
  }
  else
  {
    if (![v7 hasSuffix:@"Timer"])
    {
LABEL_22:
      v18.receiver = self;
      v18.super_class = (Class)MTAAppController;
      unsigned __int8 v13 = [(MTAAppController *)&v18 runTest:v7 options:v8];
      goto LABEL_23;
    }
    uint64_t v12 = [(MTATabBarController *)self->_tabBarController timerViewController];
  }
  id v14 = (void *)v12;
  if (!v12) {
    goto LABEL_22;
  }
  if (objc_opt_respondsToSelector()) {
    [v14 setupForTest:v7 options:v8];
  }
  [(MTAAppController *)self _selectViewController:v14];
  if ([v7 hasPrefix:@"Rotate"])
  {
    unsigned __int8 v15 = [(MTAAppController *)self _runRotationTest];
  }
  else
  {
    if (![v7 hasPrefix:@"Resize"])
    {
      BOOL v16 = 0;
      goto LABEL_29;
    }
    unsigned __int8 v15 = [(MTAAppController *)self _runResizeTest];
  }
  BOOL v16 = v15;
LABEL_29:
  if (objc_opt_respondsToSelector()) {
    [v14 teardownForTest:v7 options:v8];
  }

LABEL_24:
  return v16;
}

- (double)visibleViewHeight
{
  v2 = [(MTATabBarController *)self->_tabBarController viewControllers];
  id v3 = [v2 firstObject];

  id v4 = [v3 topViewController];
  if (v4)
  {
    unsigned int v5 = +[MTAUtilities isLandscape];
    id v6 = [v4 view];
    [v6 frame];
    double v8 = v7;

    id v9 = [v4 view];
    [v9 frame];
    double v11 = v10;

    if (v8 >= v11) {
      double v12 = v11;
    }
    else {
      double v12 = v8;
    }
    if (v8 >= v11) {
      double v13 = v8;
    }
    else {
      double v13 = v11;
    }
    if (v5) {
      double v14 = v12;
    }
    else {
      double v14 = v13;
    }
    unsigned __int8 v15 = [v4 tabBarController];
    BOOL v16 = [v15 tabBar];
    [v16 frame];
    double v18 = v17;

    long long v19 = [v4 navigationController];
    uint64_t v20 = [v19 navigationBar];
    [v20 frame];
    double v22 = v21;

    double v23 = v14 - v18 - v22;
  }
  else
  {
    double v23 = 0.0;
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTestName, 0);
  objc_storeStrong((id *)&self->_timerDataSource, 0);
  objc_storeStrong((id *)&self->_alarmDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_notificationDelegate, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_userPreferencesCommitTimer, 0);
}

@end