@interface Application
+ (double)_resumeToTodayTimeout;
+ (id)_setUpModel;
+ (id)createNewCalendarModel;
+ (void)_setModelDateForLaunch:(id)a3 restoreLastViewedDateFromPreferenceIfNeeded:(BOOL)a4;
- (Application)init;
- (ApplicationTester)tester;
- (BOOL)_showingSplashScreen;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)optionKeyIsDown;
- (MainWindowRootViewController)rootViewController;
- (NSArray)allSceneManagers;
- (RootNavigationController)rootNavigationController;
- (UNUserNotificationCenter)userNotificationCenter;
- (id)_extendLaunchTest;
- (id)_findSomeCalendarModel;
- (id)_rootNavigationControllerForModel:(id)a3;
- (id)_rootViewControllerForModel:(id)a3;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (id)applicationLastActiveTime;
- (id)applicationRequestDelayer;
- (id)eventStore;
- (int64_t)_extractViewTypeFromUserInfo:(id)a3 withKey:(id)a4;
- (void)_collapsedSectionIdentifiersSaveToPreferencesNotificationReceived:(id)a3;
- (void)_displayedOccurrencesChangedForTheFirstTime:(id)a3;
- (void)_extendedLaunchCompletedByView:(int64_t)a3;
- (void)_mobilecalDidBecomeActive;
- (void)_mobilecalDidEnterBackground;
- (void)_mobilecalWillResignActive;
- (void)_persistActiveViewModeSettingToPreferences;
- (void)_refreshAccountListAndViewContentsIfNeededForModel:(id)a3;
- (void)_sceneManagerDidDismissSplashScreen;
- (void)_selectedCalendarSaveToPreferencesNotificationReceived:(id)a3;
- (void)_topMainViewControllerCompletedExtendedLaunch:(id)a3;
- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4;
- (void)applicationWillTerminate;
- (void)buildMenuWithBuilder:(id)a3;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)registerAppIntentsDependencies;
- (void)registerForStateCapture;
- (void)requestContactsAuthorization;
- (void)requestLocationAuthorization;
- (void)requestNotificationAuthorization;
- (void)setApplicationRequestDelayer:(id)a3;
- (void)setUserNotificationCenter:(id)a3;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation Application

- (void)requestNotificationAuthorization
{
  if (!self->_requestedNotificationAuthorization && !self->_notificationAuthorizationGranted)
  {
    self->_requestedNotificationAuthorization = 1;
    v3 = [(Application *)self userNotificationCenter];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100007B08;
    v4[3] = &unk_1001D5A08;
    v4[4] = self;
    [v3 requestAuthorizationWithOptions:7 completionHandler:v4];
  }
}

- (void)_topMainViewControllerCompletedExtendedLaunch:(id)a3
{
  v4 = [a3 userInfo];
  int64_t v5 = [(Application *)self _extractViewTypeFromUserInfo:v4 withKey:@"_MainViewControllerExtendedLaunchDidCompleteNotification_CalendarContentViewType_Key"];

  [(Application *)self _extendedLaunchCompletedByView:v5];
}

- (void)requestLocationAuthorization
{
  v3 = (CLLocationManager *)objc_alloc_init((Class)CLLocationManager);
  locationManager = self->_locationManager;
  self->_locationManager = v3;

  int64_t v5 = self->_locationManager;

  [(CLLocationManager *)v5 setDelegate:self];
}

- (int64_t)_extractViewTypeFromUserInfo:(id)a3 withKey:(id)a4
{
  v4 = [a3 objectForKey:a4];
  int64_t v5 = v4;
  if (v4) {
    int64_t v6 = (int64_t)[v4 integerValue];
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

+ (double)_resumeToTodayTimeout
{
  v2 = +[CUIKPreferences sharedPreferences];
  unsigned int v3 = [v2 isShortResumeToTodayTimeout];

  double result = 480.0;
  if (v3) {
    return 5.0;
  }
  return result;
}

+ (id)createNewCalendarModel
{
  v4 = [a1 _setUpModel];

  return v4;
}

- (Application)init
{
  v8.receiver = self;
  v8.super_class = (Class)Application;
  v2 = [(Application *)&v8 init];
  if (v2)
  {
    CalUILogInitialize();
    EKUILogInitIfNeeded();
    unsigned int v3 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v4 = v3;
      int64_t v5 = +[NSProcessInfo processInfo];
      int64_t v6 = [v5 processName];
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Launching [%@]", buf, 0xCu);
    }
    [(Application *)v2 setDelegate:v2];
  }
  return v2;
}

- (void)_mobilecalDidBecomeActive
{
  unsigned int v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calendar did become active", buf, 2u);
  }
  if (![(Application *)self _showingSplashScreen])
  {
    [(Application *)self requestLocationAuthorization];
    v4 = dispatch_queue_create("com.apple.calendar.defer_contacts_initialization", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100023E60;
    block[3] = &unk_1001D2740;
    block[4] = self;
    dispatch_async(v4, block);
    [(Application *)self requestNotificationAuthorization];
  }
  if (self->_extendedLaunchCompleted && ([UIApp launchedToTest] & 1) == 0)
  {
    int64_t v5 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reloading widget timeline because MobileCal became active", buf, 2u);
    }
    +[CalWidgetUtils refreshEventWidgets];
    +[CalWidgetUtils refreshDateWidgets];
  }
}

- (id)_findSomeCalendarModel
{
  v2 = [(Application *)self allSceneManagers];
  unsigned int v3 = [v2 firstObject];
  v4 = [v3 model];

  return v4;
}

- (BOOL)_showingSplashScreen
{
  [(Application *)self allSceneManagers];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "showingSplashScreen", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)registerForStateCapture
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.calendar.calendarmodel.stateCaptureQ", v3);

  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  CalAddStateCaptureBlock();
  CalAddStateCaptureBlock();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (id)_setUpModel
{
  id v2 = +[NSProcessInfo processInfo];
  id v3 = [v2 environment];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:@"MobileCalEventStoreDataPath"];

  +[EKEventStore setPredicatePropertyLoadMode:2];
  uint64_t v5 = qword_100216A58;
  if (qword_100216A58)
  {
    id v6 = objc_alloc((Class)CUIKCalendarModel);
    id v7 = [v6 initWithEventStore:qword_100216A58 pasteboardManager:0];
  }
  else
  {
    id v8 = objc_alloc((Class)CUIKCalendarModel);
    if (v4) {
      id v9 = [v8 initWithDataPath:v4 pasteboardManager:0];
    }
    else {
      id v9 = [v8 initWithPasteboardManager:0];
    }
    id v7 = v9;
    uint64_t v10 = [v9 eventStore];
    v11 = (void *)qword_100216A58;
    qword_100216A58 = v10;
  }
  [v7 setAutoStartNotificationMonitor:0];
  [v7 setAllowEventLocationPrediction:0];
  [v7 setMaxCachedDays:300];
  [(id)objc_opt_class() _setModelDateForLaunch:v7 restoreLastViewedDateFromPreferenceIfNeeded:v5 == 0];

  return v7;
}

- (void)_collapsedSectionIdentifiersSaveToPreferencesNotificationReceived:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(Application *)self allSceneManagers];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v7);
          }
          v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) model];
          v14 = [v13 collapsedSectionIdentifiers];
          v15 = v14;
          if (v10) {
            [v10 intersectSet:v14];
          }
          else {
            id v10 = [v14 mutableCopy];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v16 = [v10 allObjects];
    v17 = (void *)v16;
    if (v16) {
      v18 = (void *)v16;
    }
    else {
      v18 = &__NSArray0__struct;
    }
    v19 = +[EKPreferences shared];
    [v19 setCollapsedSectionIdentifiers:v18];
  }
}

+ (void)_setModelDateForLaunch:(id)a3 restoreLastViewedDateFromPreferenceIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v31 = a3;
  id v6 = [v31 eventStore];
  id v7 = [v6 timeZone];

  id v8 = +[CUIKPreferences sharedPreferences];
  id v9 = [v8 lastSuspendTime];

  id v10 = CUIKNowDate();
  [a1 _resumeToTodayTimeout];
  double v12 = v11;
  [v10 timeIntervalSinceReferenceDate];
  double v14 = v13;
  [v9 doubleValue];
  if (!v4) {
    goto LABEL_7;
  }
  if (!v9) {
    goto LABEL_7;
  }
  if (v14 - v15 > v12) {
    goto LABEL_7;
  }
  if ([UIApp launchedToTest]) {
    goto LABEL_7;
  }
  uint64_t v16 = +[CUIKPreferences sharedPreferences];
  v17 = [v16 lastViewedDate];

  if (!v17) {
    goto LABEL_7;
  }
  [v17 doubleValue];
  double v19 = v18;
  id v20 = [objc_alloc((Class)NSTimeZone) initWithName:@"GMT"];
  id v21 = [objc_alloc((Class)EKCalendarDate) initWithAbsoluteTime:v20 timeZone:v19];
  id v22 = [v21 calendarDateInTimeZone:v7];

  if (!v22)
  {
LABEL_7:
    long long v23 = CUIKNowComponents();
    id v22 = [objc_alloc((Class)EKCalendarDate) initWithDateComponents:v23 timeZone:v7];
  }
  v24 = +[NSProcessInfo processInfo];
  v25 = [v24 environment];
  v26 = [v25 objectForKeyedSubscript:@"SelectedDateName"];

  if (v26)
  {
    [v26 doubleValue];
    double v28 = -v27;
    if (v27 >= 0.0) {
      double v28 = v27;
    }
    if (v28 > 0.00001)
    {
      v29 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      id v30 = [objc_alloc((Class)EKCalendarDate) initWithDate:v29 timeZone:v7];

      id v22 = v30;
    }
  }
  [v31 setSelectedDate:v22];
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  +[CalMCSignpost beginLaunch:0];
  id v6 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138412290;
    id v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calendar Finished Launching [%@]", (uint8_t *)&v38, 0xCu);
  }
  id v7 = +[UIScreen mainScreen];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  uint64_t v16 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v17 = v16;
    v40.origin.x = v9;
    v40.origin.y = v11;
    v40.size.width = v13;
    v40.size.height = v15;
    double v18 = NSStringFromCGRect(v40);
    int v38 = 138412290;
    id v39 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Main screen bounds [%@]", (uint8_t *)&v38, 0xCu);
  }
  +[UIWindow _setTransformLayerRotationsAreEnabled:1];
  double v19 = +[NSUserDefaults standardUserDefaults];
  id v20 = [v19 stringForKey:@"UITestingLastConfirmedSplashScreenVersionViewed"];
  id v21 = v20;
  if (v20)
  {
    id v22 = [v20 integerValue];
    long long v23 = +[EKPreferences shared];
    [v23 setLastConfirmedSplashScreenVersion:v22];
  }
  v24 = [v19 stringForKey:@"UITestingShowListView"];
  v25 = v24;
  if (v24)
  {
    id v26 = [v24 BOOLValue];
    double v27 = +[CUIKPreferences sharedPreferences];
    [v27 setShowListView:v26];
  }
  double v28 = +[NSProcessInfo processInfo];
  v29 = [v28 environment];
  id v30 = [v29 objectForKeyedSubscript:@"StartingViewOverride"];

  if (v30)
  {
    if ([v30 isEqual:@"day"])
    {
      id v31 = +[CUIKPreferences sharedPreferences];
      v32 = v31;
      v33 = &off_1001DC6E0;
    }
    else if ([v30 isEqual:@"week"])
    {
      id v31 = +[CUIKPreferences sharedPreferences];
      v32 = v31;
      v33 = &off_1001DC6F8;
    }
    else if ([v30 isEqual:@"month"])
    {
      id v31 = +[CUIKPreferences sharedPreferences];
      v32 = v31;
      v33 = &off_1001DC710;
    }
    else if ([v30 isEqual:@"year"])
    {
      id v31 = +[CUIKPreferences sharedPreferences];
      v32 = v31;
      v33 = &off_1001DC728;
    }
    else
    {
      if (![v30 isEqual:@"list"]) {
        goto LABEL_21;
      }
      id v31 = +[CUIKPreferences sharedPreferences];
      v32 = v31;
      v33 = &off_1001DC740;
    }
    [v31 setLastViewMode:v33];
  }
LABEL_21:
  v34 = +[UNUserNotificationCenter currentNotificationCenter];
  [(Application *)self setUserNotificationCenter:v34];

  v35 = [(Application *)self userNotificationCenter];
  [v35 setDelegate:self];

  v36 = +[NSNotificationCenter defaultCenter];
  [v36 addObserver:self selector:"_mobilecalDidEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];
  [v36 addObserver:self selector:"_mobilecalWillResignActive" name:UIApplicationWillResignActiveNotification object:0];
  [v36 addObserver:self selector:"_mobilecalDidBecomeActive" name:UIApplicationDidBecomeActiveNotification object:0];
  [v36 addObserver:self selector:"_selectedCalendarSaveToPreferencesNotificationReceived:" name:CUIKCalendarModelVisibleCalendarPreferenceRequiresSavingNotification object:0];
  [v36 addObserver:self selector:"_collapsedSectionIdentifiersSaveToPreferencesNotificationReceived:" name:CUIKCalendarModelCollapsedSectionIdentifiersPreferenceRequiresSavingNotification object:0];
  [v36 addObserver:self selector:"_displayedOccurrencesChangedForTheFirstTime:" name:@"_CalendarSceneManagerDidChangeDisplayedOccurrencesForTheFirstTimeNotification" object:0];
  [v36 addObserver:self selector:"_topMainViewControllerCompletedExtendedLaunch:" name:@"MainViewControllerDidCompleteExtendedLaunchNotification" object:0];
  if (+[EKFeatureSet mustDisplaySplashScreenToUser](EKFeatureSet, "mustDisplaySplashScreenToUser"))[v36 addObserver:self selector:"_sceneManagerDidDismissSplashScreen" name:@"_CalendarSceneManagerDidCompleteSplashScreenNotification" object:0]; {
  +[CalendarSceneManager setApplicationLastActiveTimeProvider:self];
  }
  [(Application *)self registerForStateCapture];
  [(Application *)self registerAppIntentsDependencies];

  return 1;
}

- (void)_extendedLaunchCompletedByView:(int64_t)a3
{
  id v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Calendar extended launch completed", buf, 2u);
  }
  if ([UIApp shouldRecordExtendedLaunchTime])
  {
    id v6 = (void *)UIApp;
    id v7 = [UIApp _launchTestName];
    [v6 finishedTest:v7 extraResults:0];
  }
  +[CalMCSignpost endLaunchToView:a3 extended:1];
  double v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self name:@"_CalendarSceneManagerDidChangeDisplayedOccurrencesForTheFirstTimeNotification" object:0];

  CGFloat v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self name:@"MainViewControllerDidCompleteExtendedLaunchNotification" object:0];

  self->_extendedLaunchCompleted = 1;
  if (([UIApp launchedToTest] & 1) == 0)
  {
    double v10 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGFloat v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Reloading widget timeline because MobileCal finished launching", v13, 2u);
    }
    +[CalWidgetUtils refreshEventWidgets];
    +[CalWidgetUtils refreshDateWidgets];
    CGFloat v11 = [(Application *)self _findSomeCalendarModel];
    double v12 = [v11 eventStore];
    +[EKUIDiscoverabilityUtilities scanEventsForDiscoveredConferencesIfNeeded:v12];
  }
}

- (NSArray)allSceneManagers
{
  id v2 = +[UIApplication sharedApplication];
  id v3 = [v2 connectedScenes];
  BOOL v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = +[UIApplication sharedApplication];
  id v6 = [v5 connectedScenes];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        CGFloat v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v12 = [v11 delegate];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          double v14 = [v11 delegate];
          [v4 addObject:v14];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return (NSArray *)v4;
}

- (id)_extendLaunchTest
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = +[UIApplication sharedApplication];
  BOOL v4 = [v3 connectedScenes];

  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    uint64_t v8 = _UIWindowSceneSessionRoleCarPlay;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) session];
        CGFloat v11 = [v10 configuration];

        double v12 = [v11 role];
        unsigned int v13 = [v12 isEqualToString:v8];

        if (!v13)
        {

          CGFloat v15 = [(Application *)self tester];
          double v14 = [v15 extendedLaunchTestName];

          long long v16 = kCalUILogTestHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            long long v23 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Extended launch test name: [%@]", buf, 0xCu);
          }
          goto LABEL_12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  double v14 = 0;
LABEL_12:

  return v14;
}

- (ApplicationTester)tester
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BC0C;
  block[3] = &unk_1001D2740;
  block[4] = self;
  if (qword_100216A60 != -1) {
    dispatch_once(&qword_100216A60, block);
  }
  return self->_tester;
}

- (void)registerAppIntentsDependencies
{
  id v2 = self;
  Application.registerAppIntentsDependencies()();
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (void)requestContactsAuthorization
{
  id v2 = +[CalContactsProvider defaultProvider];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  unsigned int v4 = [a3 authorizationStatus];
  locationManager = self->_locationManager;
  if (v4)
  {
    [(CLLocationManager *)locationManager setDelegate:0];
    id v6 = self->_locationManager;
    self->_locationManager = 0;
  }
  else
  {
    [(CLLocationManager *)locationManager requestWhenInUseAuthorization];
  }
}

- (id)applicationLastActiveTime
{
  return self->_applicationLastActiveTime;
}

- (RootNavigationController)rootNavigationController
{
  id v3 = [(Application *)self tester];
  unsigned int v4 = [v3 model];
  id v5 = [(Application *)self _rootNavigationControllerForModel:v4];

  return (RootNavigationController *)v5;
}

- (id)_rootNavigationControllerForModel:(id)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unsigned int v4 = +[UIApplication sharedApplication];
  id v5 = [v4 connectedScenes];

  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        CGFloat v11 = [v10 delegate];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          unsigned int v13 = [v10 delegate];
          double v14 = [v13 model];
          CGFloat v15 = [(Application *)self tester];
          long long v16 = [v15 model];

          if (v14 == v16)
          {
            long long v17 = [v13 rootNavigationController];

            goto LABEL_13;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  long long v17 = 0;
LABEL_13:

  return v17;
}

- (MainWindowRootViewController)rootViewController
{
  id v3 = [(Application *)self tester];
  unsigned int v4 = [v3 model];
  id v5 = [(Application *)self _rootViewControllerForModel:v4];

  return (MainWindowRootViewController *)v5;
}

- (id)_rootViewControllerForModel:(id)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unsigned int v4 = +[UIApplication sharedApplication];
  id v5 = [v4 connectedScenes];

  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        CGFloat v11 = [v10 delegate];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          unsigned int v13 = [v10 delegate];
          double v14 = [v13 model];
          CGFloat v15 = [(Application *)self tester];
          long long v16 = [v15 model];

          if (v14 == v16)
          {
            long long v18 = [v13 mobileCalWindow];
            long long v17 = [v18 rootViewController];

            goto LABEL_13;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  long long v17 = 0;
LABEL_13:

  return v17;
}

- (void)_displayedOccurrencesChangedForTheFirstTime:(id)a3
{
  unsigned int v4 = [a3 userInfo];
  int64_t v5 = [(Application *)self _extractViewTypeFromUserInfo:v4 withKey:@"_CalendarSceneManagerDidChangeDisplayedOccurrencesForTheFirstTimeNotification_CalendarContentViewType_Key"];

  [(Application *)self _extendedLaunchCompletedByView:v5];
}

- (void)_mobilecalDidEnterBackground
{
  id v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calendar did enter background", (uint8_t *)&v11, 2u);
  }
  self->_requestedNotificationAuthorization = 0;
  if (EKUIShouldSaveStateInPreferences()) {
    [(Application *)self _persistActiveViewModeSettingToPreferences];
  }
  unsigned int v4 = CUIKNowDate();
  [v4 timeIntervalSinceReferenceDate];
  id v6 = [objc_alloc((Class)NSNumber) initWithDouble:v5];
  id v7 = +[CUIKPreferences sharedPreferences];
  [v7 setLastSuspendTime:v6];

  p_applicationLastActiveTime = &self->_applicationLastActiveTime;
  objc_storeStrong((id *)&self->_applicationLastActiveTime, v4);
  uint64_t v9 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    double v10 = *p_applicationLastActiveTime;
    int v11 = 138412290;
    double v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "35182919: didEnterBackground: lastActiveTime = %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)_mobilecalWillResignActive
{
  id v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calendar will resign active", (uint8_t *)&v8, 2u);
  }
  unsigned int v4 = CUIKNowDate();
  p_applicationLastActiveTime = &self->_applicationLastActiveTime;
  objc_storeStrong((id *)&self->_applicationLastActiveTime, v4);
  id v6 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    id v7 = *p_applicationLastActiveTime;
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "35182919: willResignActive: lastActiveTime = %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_persistActiveViewModeSettingToPreferences
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v2 = +[UIApplication sharedApplication];
  id v3 = [v2 connectedScenes];

  id v4 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v29;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v29 != v6) {
        objc_enumerationMutation(v3);
      }
      int v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
      uint64_t v9 = [v8 delegate];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    int v11 = [v8 delegate];

    if (!v11) {
      return;
    }
    double v12 = [v11 rootNavigationController];
    unsigned int v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 currentViewType]);
    double v14 = +[CUIKPreferences sharedPreferences];
    [v14 setLastViewMode:v13];

    id v15 = [objc_alloc((Class)NSTimeZone) initWithName:@"GMT"];
    long long v16 = [v12 model];
    long long v17 = [v16 selectedDate];
    long long v18 = [v17 calendarDateInTimeZone:v15];

    [v18 absoluteTime];
    id v20 = [objc_alloc((Class)NSNumber) initWithDouble:v19];
    long long v21 = +[CUIKPreferences sharedPreferences];
    [v21 setLastViewedDate:v20];

    if ([v12 shouldSaveSelectedEvent])
    {
      long long v22 = [v11 model];
      long long v23 = [v22 selectedOccurrence];
    }
    else
    {
      long long v23 = 0;
    }
    v24 = +[CUIKPreferences sharedPreferences];
    v25 = [v23 uniqueID];
    [v24 setLastViewedOccurrenceUID:v25];

    id v26 = +[CUIKPreferences sharedPreferences];
    double v27 = [v23 startDate];
    [v26 setLastViewedOccurrenceDate:v27];
  }
  else
  {
LABEL_9:
    int v11 = v3;
  }
}

- (void)applicationWillTerminate
{
  id v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calendar will terminate", v5, 2u);
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)Application;
  [(Application *)&v94 buildMenuWithBuilder:v4];
  id v5 = v4;
  uint64_t v6 = [v4 system];
  uint64_t v7 = +[UIMenuSystem mainSystem];

  if (v6 == v7)
  {
    int v8 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"New Event" value:&stru_1001D6918 table:0];
    double v10 = +[UIKeyCommand commandWithTitle:v9 image:0 action:"routeNewEventKeyCommand" input:@"n" modifierFlags:0x100000 propertyList:0];
    v98[0] = v10;
    int v11 = +[NSBundle bundleForClass:objc_opt_class()];
    double v12 = [v11 localizedStringForKey:@"Save Event" value:&stru_1001D6918 table:0];
    unsigned int v13 = +[UIKeyCommand commandWithTitle:v12 image:0 action:"handleSaveKeyCommand" input:@"s" modifierFlags:0x100000 propertyList:0];
    v98[1] = v13;
    double v14 = +[NSArray arrayWithObjects:v98 count:2];
    uint64_t v15 = +[UIMenu menuWithChildren:v14];

    v91 = (void *)v15;
    [v5 insertChildMenu:v15 atStartOfMenuForIdentifier:];
    long long v16 = +[UIKeyCommand commandWithTitle:&stru_1001D6918 image:0 action:"handleCloseKeyCommand" input:UIKeyInputEscape modifierFlags:0 propertyList:0];
    [v16 setAttributes:4];
    long long v17 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v18 = [v17 localizedStringForKey:@"Edit Event" value:&stru_1001D6918 table:0];
    v93 = +[UIKeyCommand commandWithTitle:v18 image:0 action:"_performEditKeyCommand" input:@"e" modifierFlags:0x100000 propertyList:0];

    double v19 = +[NSBundle bundleForClass:objc_opt_class()];
    id v20 = [v19 localizedStringForKey:@"Delete - keyboard shortcut" value:@"Delete" table:0];
    uint64_t v21 = +[UIKeyCommand commandWithTitle:v20 image:0 action:"handleDeleteKeyCommand" input:UIKeyInputDelete modifierFlags:0 propertyList:0];

    long long v22 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v23 = [v22 localizedStringForKey:@"Duplicate - keyboard shortcut" value:@"Duplicate" table:0];
    uint64_t v24 = +[UIKeyCommand commandWithTitle:v23 image:0 action:"handleDuplicateKeyCommand" input:@"d" modifierFlags:0x100000 propertyList:0];

    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    id v26 = [v25 localizedStringForKey:@"Keyboard shortcut - search" value:@"Search" table:0];
    uint64_t v27 = +[UIKeyCommand commandWithTitle:v26 image:0 action:"routeSearchKeyCommand" input:@"f" modifierFlags:0x100000 propertyList:0];

    v92 = v5;
    [v5 replaceChildrenOfMenuForIdentifier:UIMenuEdit fromChildrenBlock:&stru_1001D58B0];
    v87 = (void *)v27;
    v88 = (void *)v24;
    v97[0] = v27;
    v97[1] = v93;
    v89 = (void *)v21;
    v90 = v16;
    v97[2] = v16;
    v97[3] = v21;
    v97[4] = v24;
    long long v28 = +[NSArray arrayWithObjects:v97 count:5];
    uint64_t v29 = +[UIMenu menuWithChildren:v28];

    v86 = (void *)v29;
    [v5 insertChildMenu:v29 atStartOfMenuForIdentifier:UIMenuEdit];
    v85 = +[NSBundle bundleForClass:objc_opt_class()];
    v84 = [v85 localizedStringForKey:@"Show Today" value:&stru_1001D6918 table:0];
    v83 = +[UIKeyCommand commandWithTitle:v84 image:0 action:"handleTodayKeyCommand" input:@"t" modifierFlags:0x100000 propertyList:0];
    v96[0] = v83;
    v82 = +[NSBundle bundleForClass:objc_opt_class()];
    v81 = [v82 localizedStringForKey:@"Refresh Calendars" value:&stru_1001D6918 table:0];
    v80 = +[UIKeyCommand commandWithTitle:v81 image:0 action:"handleRefreshKeyCommand" input:@"r" modifierFlags:0x100000 propertyList:0];
    v96[1] = v80;
    v79 = +[NSBundle bundleForClass:objc_opt_class()];
    v78 = [v79 localizedStringForKey:@"Go to the Next Day, Week, Month or Year", &stru_1001D6918, 0 value table];
    v77 = +[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v78, 0, "handleGoToNextDateComponentUnitCommand");
    v96[2] = v77;
    v76 = +[NSBundle bundleForClass:objc_opt_class()];
    v75 = [v76 localizedStringForKey:@"Go to the Previous Day, Week, Month or Year", &stru_1001D6918, 0 value table];
    v74 = +[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v75, 0, "handleGoToPreviousDateComponentUnitCommand");
    v96[3] = v74;
    v73 = +[NSBundle bundleForClass:objc_opt_class()];
    v72 = [v73 localizedStringForKey:@"Go to Day View" value:&stru_1001D6918 table:0];
    v71 = +[UIKeyCommand commandWithTitle:v72 image:0 action:"handleDayKeyCommand" input:@"1" modifierFlags:0x100000 propertyList:0];
    v96[4] = v71;
    v70 = +[NSBundle bundleForClass:objc_opt_class()];
    v69 = [v70 localizedStringForKey:@"Go to Week View" value:&stru_1001D6918 table:0];
    v68 = +[UIKeyCommand commandWithTitle:v69 image:0 action:"handleWeekKeyCommand" input:@"2" modifierFlags:0x100000 propertyList:0];
    v96[5] = v68;
    v67 = +[NSBundle bundleForClass:objc_opt_class()];
    v66 = [v67 localizedStringForKey:@"Go to Month View" value:&stru_1001D6918 table:0];
    v65 = +[UIKeyCommand commandWithTitle:v66 image:0 action:"handleMonthKeyCommand" input:@"3" modifierFlags:0x100000 propertyList:0];
    v96[6] = v65;
    v64 = +[NSBundle bundleForClass:objc_opt_class()];
    v63 = [v64 localizedStringForKey:@"Go to Year View" value:&stru_1001D6918 table:0];
    v62 = +[UIKeyCommand commandWithTitle:v63 image:0 action:"handleYearKeyCommand" input:@"4" modifierFlags:0x100000 propertyList:0];
    v96[7] = v62;
    v61 = +[NSBundle bundleForClass:objc_opt_class()];
    v60 = [v61 localizedStringForKey:@"Select the Next Event" value:&stru_1001D6918 table:0];
    v59 = +[UIKeyCommand commandWithTitle:v60 image:0 action:"handleSelectNextEventCommand" input:@"\t" modifierFlags:0x80000 propertyList:@"tab"];
    v96[8] = v59;
    v58 = +[NSBundle bundleForClass:objc_opt_class()];
    v57 = [v58 localizedStringForKey:@"Select the Previous Event" value:&stru_1001D6918 table:0];
    v56 = +[UIKeyCommand commandWithTitle:v57 image:0 action:"handleSelectPreviousEventCommand" input:@"\t" modifierFlags:655360 propertyList:@"shift tab"];
    v96[9] = v56;
    v55 = +[NSBundle bundleForClass:objc_opt_class()];
    v54 = [v55 localizedStringForKey:@"Select the Next Event" value:&stru_1001D6918 table:0];
    v53 = +[UIKeyCommand commandWithTitle:v54 image:0 action:"handleSelectNextEventCommand" input:UIKeyInputRightArrow modifierFlags:0x80000 propertyList:@"right arrow"];
    v96[10] = v53;
    v52 = +[NSBundle bundleForClass:objc_opt_class()];
    v50 = [v52 localizedStringForKey:@"Select the Previous Event" value:&stru_1001D6918 table:0];
    v51 = +[UIKeyCommand commandWithTitle:v50 image:0 action:"handleSelectPreviousEventCommand" input:UIKeyInputLeftArrow modifierFlags:0x80000 propertyList:@"left arrow"];
    v96[11] = v51;
    v49 = +[NSBundle bundleForClass:objc_opt_class()];
    v48 = [v49 localizedStringForKey:@"Select the Next Event" value:&stru_1001D6918 table:0];
    v47 = +[UIKeyCommand commandWithTitle:v48 image:0 action:"handleSelectNextEventCommand" input:UIKeyInputDownArrow modifierFlags:0x80000 propertyList:@"down arrow"];
    v96[12] = v47;
    v46 = +[NSBundle bundleForClass:objc_opt_class()];
    v45 = [v46 localizedStringForKey:@"Select the Previous Event" value:&stru_1001D6918 table:0];
    v44 = +[UIKeyCommand commandWithTitle:v45 image:0 action:"handleSelectPreviousEventCommand" input:UIKeyInputUpArrow modifierFlags:0x80000 propertyList:@"up arrow"];
    v96[13] = v44;
    v43 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v30 = [v43 localizedStringForKey:@"Select the Next Occurrence" value:&stru_1001D6918 table:0];
    long long v31 = +[UIKeyCommand commandWithTitle:v30 image:0 action:"handleSelectNextOccurrenceCommand" input:@"]" modifierFlags:0x100000 propertyList:0];
    v96[14] = v31;
    v32 = +[NSBundle bundleForClass:objc_opt_class()];
    v33 = [v32 localizedStringForKey:@"Select the Previous Occurrence" value:&stru_1001D6918 table:0];
    v34 = +[UIKeyCommand commandWithTitle:v33 image:0 action:"handleSelectPreviousOccurrenceCommand" input:@"[" modifierFlags:0x100000 propertyList:0];
    v96[15] = v34;
    v35 = +[NSBundle bundleForClass:objc_opt_class()];
    v36 = [v35 localizedStringForKey:@"View Availability…" value:&stru_1001D6918 table:0];
    v37 = +[UIKeyCommand commandWithTitle:v36 image:0 action:"handleViewAvailabilityCommand" input:@"a" modifierFlags:1179648 propertyList:0];
    v96[16] = v37;
    int v38 = +[NSArray arrayWithObjects:v96 count:17];
    id v39 = +[UIMenu menuWithChildren:v38];

    id v5 = v92;
    [v92 insertChildMenu:v39 atStartOfMenuForIdentifier:UIMenuView];
    if (+[EKFeatureSet mustDisplaySplashScreenToUser])
    {
      CGRect v40 = +[UIKeyCommand commandWithTitle:&stru_1001D6918 image:0 action:"handleDismissSplashScreenKeyCommand" input:@"\r" modifierFlags:0 propertyList:0];
      [v40 setAttributes:4];
      v95 = v40;
      v41 = +[NSArray arrayWithObjects:&v95 count:1];
      v42 = +[UIMenu menuWithChildren:v41];

      [v92 insertChildMenu:v42 atStartOfMenuForIdentifier:UIMenuApplication];
    }
  }
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5 = [a4 configuration:a3];
  id v6 = [v5 copy];
  uint64_t v7 = [v5 role];
  unsigned __int8 v8 = [v7 isEqualToString:_UIWindowSceneSessionRoleCarPlay];

  if ((v8 & 1) != 0
    || ([v5 role],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 isEqualToString:UIWindowSceneSessionRoleApplication],
        v9,
        v10))
  {
    [v6 setDelegateClass:objc_opt_class()];
  }

  return v6;
}

- (void)_selectedCalendarSaveToPreferencesNotificationReceived:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(Application *)self allSceneManagers];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v41;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = [*(id *)(*((void *)&v40 + 1) + 8 * i) model];
          unsigned int v13 = [v12 sourceForSelectedIdentity];

          if (!v13)
          {
            char v14 = 0;
            goto LABEL_12;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    char v14 = 1;
LABEL_12:

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v15 = v7;
    id v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v16)
    {
      id v17 = v16;
      id v18 = 0;
      uint64_t v19 = *(void *)v37;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
          if ((v14 & 1) == 0)
          {
            long long v22 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)j) model];
            long long v23 = [v22 sourceForSelectedIdentity];

            if (v23) {
              continue;
            }
          }
          uint64_t v24 = [v21 model];
          v25 = [v24 unselectedCalendarsIgnoringFocus];
          id v26 = v25;
          if (v18) {
            [v18 intersectSet:v25];
          }
          else {
            id v18 = [v25 mutableCopy];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v17);
    }
    else
    {
      id v18 = 0;
    }

    uint64_t v27 = [v4 userInfo];
    long long v28 = [v27 objectForKeyedSubscript:CUIKCalendarModelVisibleCalendarPreferenceRequiresSavingNotificationReasonKey];

    uint64_t v29 = +[EKPreferences shared];
    uint64_t v30 = [v18 allObjects];
    long long v31 = (void *)v30;
    if (v30) {
      v32 = (void *)v30;
    }
    else {
      v32 = &__NSArray0__struct;
    }
    [v29 setDeselectedCalendars:v32 reason:v28];

    if (([UIApp launchedToTest] & 1) == 0)
    {
      v33 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Reloading widget timeline because of selectedCalendar change notification", v35, 2u);
      }
      +[CalWidgetUtils refreshEventWidgets];
      v34 = +[CalendarLinkAppEntityNotifier sharedNotifier];
      [v34 notifyObservers];
    }
  }
}

- (void)_sceneManagerDidDismissSplashScreen
{
  id v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Calendar - a sceneManager dismissed a splash screen.", buf, 2u);
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"_CalendarSceneManagerDidCompleteSplashScreenNotification" object:0];

  id v5 = [(Application *)self applicationRequestDelayer];

  if (v5)
  {
    id v6 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Executing delayed application request.", v9, 2u);
    }
    id v7 = [(Application *)self applicationRequestDelayer];
    v7[2]();

    [(Application *)self setApplicationRequestDelayer:0];
  }
  [(Application *)self requestLocationAuthorization];
  [(Application *)self requestContactsAuthorization];
  id v8 = +[UIMenuSystem mainSystem];
  [v8 setNeedsRebuild];
}

- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4
{
  id v27 = a3;
  id v28 = a4;
  id v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[Application application:performFetchWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Calendar %s", (uint8_t *)&buf, 0xCu);
  }
  group = dispatch_group_create();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v55[3] = 1;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v6 = +[UIApplication sharedApplication];
  id obj = [v6 connectedScenes];

  id v7 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v52;
    uint64_t v29 = CUIKCalendarModelDisplayedOccurrencesChangedNotification;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        int v11 = [v10 delegate];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          unsigned int v13 = [v10 delegate];
          if ([v10 activationState])
          {
            v49[0] = 0;
            v49[1] = v49;
            v49[2] = 0x2020000000;
            char v50 = 0;
            v47[0] = 0;
            v47[1] = v47;
            v47[2] = 0x2020000000;
            char v48 = 0;
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v57 = 0x3032000000;
            v58 = sub_100116478;
            v59 = sub_100116488;
            id v60 = 0;
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            v43[2] = sub_100116490;
            v43[3] = &unk_1001D5968;
            v43[4] = v10;
            p_long long buf = &buf;
            v46 = v55;
            char v14 = group;
            v44 = v14;
            id v15 = objc_retainBlock(v43);
            dispatch_group_enter(v14);
            id v16 = +[NSNotificationCenter defaultCenter];
            id v17 = [v13 model];
            id v18 = +[NSOperationQueue mainQueue];
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v39[2] = sub_1001165B4;
            v39[3] = &unk_1001D5990;
            long long v41 = v47;
            v39[4] = v10;
            long long v42 = v49;
            uint64_t v19 = v15;
            id v40 = v19;
            uint64_t v20 = [v16 addObserverForName:v29 object:v17 queue:v18 usingBlock:v39];
            uint64_t v21 = *(void **)(*((void *)&buf + 1) + 40);
            *(void *)(*((void *)&buf + 1) + 40) = v20;

            dispatch_time_t v22 = dispatch_time(0, 8000000000);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1001166A4;
            block[3] = &unk_1001D59B8;
            long long v37 = v49;
            block[4] = v10;
            long long v38 = v47;
            long long v23 = v19;
            id v36 = v23;
            dispatch_after(v22, (dispatch_queue_t)&_dispatch_main_q, block);
            uint64_t v24 = [v13 model];
            [v24 updateAfterAppResume];

            _Block_object_dispose(&buf, 8);
            _Block_object_dispose(v47, 8);
            _Block_object_dispose(v49, 8);
          }
          else
          {
            v25 = kCalUILogHandle;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v10;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Not updating scene snapshot because it's already active: %@", (uint8_t *)&buf, 0xCu);
            }
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v7);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100116780;
  v32[3] = &unk_1001D59E0;
  id v33 = v28;
  v34 = v55;
  id v26 = v28;
  dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, v32);

  _Block_object_dispose(v55, 8);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [(Application *)self tester];
  double v12 = [v11 model];

  if (!v12)
  {
    unsigned int v13 = [(Application *)self _findSomeCalendarModel];
    char v14 = [(Application *)self tester];
    [v14 setModel:v13];
  }
  id v15 = [(Application *)self tester];
  unsigned __int8 v16 = [v15 application:v10 runTest:v9 options:v8];

  return v16;
}

- (void)_refreshAccountListAndViewContentsIfNeededForModel:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100116934;
  block[3] = &unk_1001D2740;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, uint64_t))a5;
  id v8 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = +[NSNumber numberWithUnsignedInteger:26];
    int v11 = [v6 request];
    double v12 = [v11 identifier];
    int v13 = 138543874;
    char v14 = v10;
    __int16 v15 = 2114;
    unsigned __int8 v16 = v12;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Will present notification with options = %{public}@, notification identifier = %{public}@, notification = %@", (uint8_t *)&v13, 0x20u);
  }
  v7[2](v7, 26);
}

- (BOOL)optionKeyIsDown
{
  id v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    unint64_t optionKeyDown = self->_optionKeyDown;
    int v6 = 134217984;
    unint64_t v7 = optionKeyDown;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "optionKeyIsDown: %lu", (uint8_t *)&v6, 0xCu);
  }
  return self->_optionKeyDown != 0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v12 = [v11 key];
        int v13 = [v12 characters];
        if ([v13 length])
        {
        }
        else
        {
          char v14 = [v11 key];
          unsigned int v15 = [v14 modifierFlags];

          if ((v15 & 0x80000) != 0)
          {
            ++self->_optionKeyDown;
            unsigned __int8 v16 = kCalUILogHandle;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
            {
              unint64_t optionKeyDown = self->_optionKeyDown;
              *(_DWORD *)long long buf = 134217984;
              unint64_t v25 = optionKeyDown;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "optionKeyPress: %lu", buf, 0xCu);
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }
  v19.receiver = self;
  v19.super_class = (Class)Application;
  [(Application *)&v19 pressesBegan:v6 withEvent:v18];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  if (self->_optionKeyDown)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          double v12 = [v11 key];
          int v13 = [v12 characters];
          if ([v13 length])
          {
          }
          else
          {
            char v14 = [v11 key];
            unsigned int v15 = [v14 modifierFlags];

            if ((v15 & 0x80000) != 0)
            {
              --self->_optionKeyDown;
              unsigned __int8 v16 = kCalUILogHandle;
              if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
              {
                unint64_t optionKeyDown = self->_optionKeyDown;
                *(_DWORD *)long long buf = 134217984;
                unint64_t v25 = optionKeyDown;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "optionKeyRelease: %lu", buf, 0xCu);
              }
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v8);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)Application;
  [(Application *)&v19 pressesEnded:v6 withEvent:v18];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  if (self->_optionKeyDown)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          double v12 = [v11 key];
          int v13 = [v12 characters];
          if ([v13 length])
          {
          }
          else
          {
            char v14 = [v11 key];
            unsigned int v15 = [v14 modifierFlags];

            if ((v15 & 0x80000) != 0)
            {
              --self->_optionKeyDown;
              unsigned __int8 v16 = kCalUILogHandle;
              if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
              {
                unint64_t optionKeyDown = self->_optionKeyDown;
                *(_DWORD *)long long buf = 134217984;
                unint64_t v25 = optionKeyDown;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "optionKeyCancel: %lu", buf, 0xCu);
              }
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v8);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)Application;
  [(Application *)&v19 pressesCancelled:v6 withEvent:v18];
}

- (id)applicationRequestDelayer
{
  return self->_applicationRequestDelayer;
}

- (void)setApplicationRequestDelayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong(&self->_applicationRequestDelayer, 0);
  objc_storeStrong((id *)&self->_applicationLastActiveTime, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_tester, 0);
}

- (id)eventStore
{
  id v2 = self;
  id v3 = (void *)Application.eventStore()();

  return v3;
}

@end