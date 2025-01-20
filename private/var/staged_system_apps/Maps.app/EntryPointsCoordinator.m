@interface EntryPointsCoordinator
- (BOOL)_debug_shouldSkipSendingMergedRichMapsActivity;
- (BOOL)_isBackgroundNavigationLaunch:(id)a3;
- (BOOL)_sessionShouldParticipateInLifecycle:(id)a3;
- (BOOL)_sessionShouldParticipateInLifecycle:(id)a3 scene:(id)a4;
- (BOOL)_shouldRestoreNavigationSession:(id)a3;
- (BOOL)didLaunchWithExplicitIntent;
- (BOOL)shouldHandleUniversalLinkWithUserActivity:(id)a3;
- (EntryPointsCoordinator)init;
- (EntryPointsCoordinatorDelegate)delegate;
- (LaunchAlertsManager)launchAlertsManager;
- (NSString)launchApplication;
- (void)_addCompletionIfNeeded;
- (void)_addRestoreTaskForSession:(id)a3;
- (void)_addTask:(id)a3;
- (void)_addTask:(id)a3 atFirstIndex:(BOOL)a4;
- (void)_cleanState;
- (void)_configureTips;
- (void)_continueUserActivity:(id)a3 session:(id)a4 windowSize:(CGSize)a5;
- (void)_displayLaunchAlertsIfNecessary;
- (void)_insertTaskAtFirstIndex:(id)a3;
- (void)_lockMergeActivities;
- (void)_mergeTasks;
- (void)_openURL:(id)a3 referringURL:(id)a4 sourceApplication:(id)a5 session:(id)a6 sceneOptions:(id)a7 mkOptions:(id)a8 windowSize:(CGSize)a9;
- (void)_sendMergedRichMapsActivity;
- (void)_sendMergedRichMapsActivityIfPossible;
- (void)_unlockMergeActivities;
- (void)_updateLocaleInformation;
- (void)continueUserActivity:(id)a3 session:(id)a4 windowSize:(CGSize)a5;
- (void)didBecomeActiveWithSession:(id)a3;
- (void)didEnterBackgroundWithSession:(id)a3;
- (void)didFailToContinueUserActivityWithType:(id)a3 error:(id)a4;
- (void)launchAlertsManagerDidFinishProcessingAlert:(id)a3;
- (void)openNotificationData:(id)a3 forType:(id)a4 recordIdentifier:(id)a5;
- (void)openShortcutItem:(id)a3;
- (void)openURL:(id)a3 session:(id)a4 sceneOptions:(id)a5 mkOptions:(id)a6 windowSize:(CGSize)a7;
- (void)prepareBackgroundNavigation;
- (void)receivedDidPresentContaineeNotification:(id)a3;
- (void)receivedFullyDrawnNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLaunchAlertsManager:(id)a3;
- (void)setLaunchApplication:(id)a3;
- (void)willConnectToSession:(id)a3 options:(id)a4 windowSize:(CGSize)a5 scene:(id)a6;
- (void)willContinueUserActivityWithType:(id)a3;
- (void)willEnterForegroundWithSession:(id)a3;
- (void)willResignActiveWithSession:(id)a3;
@end

@implementation EntryPointsCoordinator

- (BOOL)_isBackgroundNavigationLaunch:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 scheme];
    unsigned int v6 = [v5 isEqualToString:@"x-maps-reopen"];

    if (v6)
    {
      v7 = [v4 query];
      if ([v7 length]) {
        LOBYTE(v6) = [v7 hasPrefix:@"backgroundnavigation"];
      }
      else {
        LOBYTE(v6) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)receivedFullyDrawnNotification:(id)a3
{
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:VKMapViewDidBecomeFullyDrawnNotification object:0];

  [(EntryPointsCoordinator *)self _updateLocaleInformation];
}

- (void)willEnterForegroundWithSession:(id)a3
{
  id v4 = a3;
  if ([(EntryPointsCoordinator *)self _sessionShouldParticipateInLifecycle:v4])
  {
    v5 = sub_1000A930C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[EP] willEnterForeground", v6, 2u);
    }

    [(EntryPointsCoordinator *)self _addRestoreTaskForSession:v4];
  }
}

- (void)_lockMergeActivities
{
  id v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (self->_mergeLocked) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    v5 = v4;
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[EP] lockMergeActivities (%@)", (uint8_t *)&v6, 0xCu);
  }
  if (!self->_mergeLocked)
  {
    self->_mergeLocked = 1;
    dispatch_group_enter((dispatch_group_t)self->_tasksGroup);
  }
}

- (void)_updateLocaleInformation
{
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 textInputMode];
  id v4 = [v3 primaryLanguage];

  v5 = +[MapsAnalyticStateProvider serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001087F8;
  block[3] = &unk_1012E5D08;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (BOOL)_sessionShouldParticipateInLifecycle:(id)a3
{
  id v4 = a3;
  v5 = [v4 scene];
  LOBYTE(self) = [(EntryPointsCoordinator *)self _sessionShouldParticipateInLifecycle:v4 scene:v5];

  return (char)self;
}

- (BOOL)_sessionShouldParticipateInLifecycle:(id)a3 scene:(id)a4
{
  id v5 = a4;
  id v6 = [a3 role];
  unsigned __int8 v7 = [v6 isEqualToString:UIWindowSceneSessionRoleApplication];

  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = +[UIApplication _maps_isCarPlayApplicationScene:v5];
  }

  return v8;
}

- (EntryPointsCoordinator)init
{
  v19.receiver = self;
  v19.super_class = (Class)EntryPointsCoordinator;
  v2 = [(EntryPointsCoordinator *)&v19 init];
  id v3 = v2;
  if (v2)
  {
    v2->_firstWidget = 1;
    v2->_coldLaunch = 1;
    id v4 = +[UIScreen mainScreen];
    uint64_t v5 = sub_1000BBB44(v4);

    if (v5 != 5)
    {
      v3->_shouldWaitForFirstContainee = 1;
      id v6 = +[NSNotificationCenter defaultCenter];
      [v6 addObserver:v3 selector:"receivedDidPresentContaineeNotification:" name:@"ContainerDidPresentContaineeNotification" object:0];
    }
    uint64_t v7 = +[NSMutableArray array];
    tasks = v3->_tasks;
    v3->_tasks = (NSMutableArray *)v7;

    uint64_t v9 = +[NSMutableArray array];
    tasksToPerform = v3->_tasksToPerform;
    v3->_tasksToPerform = (NSMutableArray *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MapsEntryPoint", v12);
    tasksQueue = v3->_tasksQueue;
    v3->_tasksQueue = (OS_dispatch_queue *)v13;

    dispatch_group_t v15 = dispatch_group_create();
    tasksGroup = v3->_tasksGroup;
    v3->_tasksGroup = (OS_dispatch_group *)v15;

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v3 selector:"receivedFullyDrawnNotification:" name:VKMapViewDidBecomeFullyDrawnNotification object:0];
  }
  return v3;
}

- (void)didBecomeActiveWithSession:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(EntryPointsCoordinator *)self _sessionShouldParticipateInLifecycle:v4];
  id v6 = sub_1000A930C();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[EP] didBecomeActive", buf, 2u);
    }

    objc_initWeak(&location, self);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10090B9DC;
    v41[3] = &unk_1012E6708;
    objc_copyWeak(&v42, &location);
    BOOL v8 = objc_retainBlock(v41);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10090BA88;
    v37[3] = &unk_1012EC8B8;
    objc_copyWeak(&v40, &location);
    v37[4] = self;
    uint64_t v9 = v8;
    id v39 = v9;
    id v10 = v4;
    id v38 = v10;
    v11 = objc_retainBlock(v37);
    v12 = [v10 role];
    if ([v12 isEqual:_UIWindowSceneSessionRoleCarPlay])
    {
    }
    else
    {
      BOOL shouldWaitForFirstContainee = self->_shouldWaitForFirstContainee;

      if (shouldWaitForFirstContainee)
      {
        v20 = sub_1000A930C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[EP] waiting for first containee", buf, 2u);
        }

        *(_WORD *)&self->_BOOL shouldWaitForFirstContainee = 256;
        *(void *)buf = 0;
        v32 = buf;
        uint64_t v33 = 0x3032000000;
        v34 = sub_100104124;
        v35 = sub_100104910;
        id v36 = 0;
        v21 = +[NSNotificationCenter defaultCenter];
        v22 = +[NSOperationQueue mainQueue];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10090BC18;
        v28[3] = &unk_1012EDE88;
        v30 = buf;
        v29 = v11;
        uint64_t v23 = [v21 addObserverForName:@"ContainerDidPresentContaineeNotification" object:0 queue:v22 usingBlock:v28];
        v24 = (void *)*((void *)v32 + 5);
        *((void *)v32 + 5) = v23;

        _Block_object_dispose(buf, 8);
        goto LABEL_20;
      }
    }
    if (!self->_waitingForFirstContainee) {
      ((void (*)(void *))v11[2])(v11);
    }
LABEL_20:

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
    goto LABEL_26;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[EP] _sessionShouldParticipateInLifecycle == NO", buf, 2u);
  }

  if ([(EntryPointsCoordinator *)self _shouldRestoreNavigationSession:v4])
  {
    self->_firstWidget = 0;
    dispatch_queue_t v13 = +[NSUserDefaults standardUserDefaults];
    v14 = [v13 objectForKey:@"NavigationRestorationAttempts"];

    if (v14)
    {
      dispatch_group_t v15 = (char *)[v14 unsignedIntegerValue];
      if ((unint64_t)v15 > 2)
      {
        v16 = sub_1000A930C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[EP] discard Navigation defaults, too many attempts", buf, 2u);
        }

        v17 = +[NSUserDefaults standardUserDefaults];
        [v17 removeObjectForKey:@"NavigationUserActivityDefault"];

        v18 = +[NSUserDefaults standardUserDefaults];
        [v18 removeObjectForKey:@"NavigationRestorationAttempts"];

LABEL_25:
        goto LABEL_26;
      }
    }
    else
    {
      dispatch_group_t v15 = 0;
    }
    v25 = sub_1000A930C();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[EP] needs to launch main CarPlay", buf, 2u);
    }

    self->_waitingForCarplayAppScene = 1;
    v26 = +[NSUserDefaults standardUserDefaults];
    v27 = +[NSNumber numberWithUnsignedInteger:v15 + 1];
    [v26 setObject:v27 forKey:@"NavigationRestorationAttempts"];

    +[MapsCarPlayServicesShim openMapsCarPlayApplicationSuspended];
    goto LABEL_25;
  }
LABEL_26:
}

- (void)willConnectToSession:(id)a3 options:(id)a4 windowSize:(CGSize)a5 scene:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  unsigned __int8 v13 = [(EntryPointsCoordinator *)self _sessionShouldParticipateInLifecycle:v11 scene:a6];
  v14 = sub_1000A930C();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if ((v13 & 1) == 0)
  {
    if (v15)
    {
      LOWORD(v44) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[EP] willConnectToSession scene not participating", (uint8_t *)&v44, 2u);
    }
    goto LABEL_38;
  }
  if (v15)
  {
    int v44 = 138412546;
    v45 = v11;
    __int16 v46 = 2112;
    v47 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[EP] willConnectToSession: %@ options: %@", (uint8_t *)&v44, 0x16u);
  }

  uint64_t v16 = [(__CFString *)v12 shortcutItem];

  v17 = [(__CFString *)v12 URLContexts];
  if ([v17 count])
  {
    self->_launchedWithExternalInput = 1;
  }
  else
  {
    v18 = [(__CFString *)v12 handoffUserActivityType];
    if (v18)
    {
      self->_launchedWithExternalInput = 1;
    }
    else
    {
      objc_super v19 = [(__CFString *)v12 userActivities];
      self->_launchedWithExternalInput = ((unint64_t)[v19 count] | v16) != 0;
    }
  }

  v20 = [(__CFString *)v12 URLContexts];
  v21 = [v20 anyObject];
  v22 = [v21 URL];
  unsigned int v23 = [(EntryPointsCoordinator *)self _isBackgroundNavigationLaunch:v22];

  v24 = sub_1000A930C();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    if (self->_launchedWithExternalInput) {
      v25 = @"YES";
    }
    else {
      v25 = @"NO";
    }
    v26 = v25;
    if (self->_launchedInBackground) {
      v27 = @"YES";
    }
    else {
      v27 = @"NO";
    }
    v28 = v27;
    if (v23) {
      v29 = @"YES";
    }
    else {
      v29 = @"NO";
    }
    v30 = v29;
    int v44 = 138412802;
    v45 = v26;
    __int16 v46 = 2112;
    v47 = v28;
    __int16 v48 = 2112;
    v49 = v30;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[EP] launchedWithExternalInput: %@, launchedInBackground: %@, isBackgroundNavigationLaunch: %@", (uint8_t *)&v44, 0x20u);
  }
  v31 = [(__CFString *)v12 sourceApplication];
  [(EntryPointsCoordinator *)self setLaunchApplication:v31];

  if (self->_launchedWithExternalInput)
  {
    unsigned int v32 = self->_launchedInBackground ? 0 : v23;
    if (v32 == 1) {
      [(EntryPointsCoordinator *)self prepareBackgroundNavigation];
    }
  }
  if (!self->_waitingForCarplayAppScene
    && !+[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground])
  {
    [(EntryPointsCoordinator *)self _lockMergeActivities];
  }
  self->_waitingForCarplayAppScene = 0;
  [(EntryPointsCoordinator *)self _addRestoreTaskForSession:v11];
  self->_launchedInBackground = 0;
  uint64_t v33 = [(__CFString *)v12 URLContexts];
  id v34 = [v33 count];

  if (v34)
  {
    v35 = [(__CFString *)v12 URLContexts];
    id v36 = [v35 anyObject];

    v37 = [v36 URL];
    id v38 = [v36 options];
    -[EntryPointsCoordinator openURL:session:sceneOptions:mkOptions:windowSize:](self, "openURL:session:sceneOptions:mkOptions:windowSize:", v37, v11, v38, 0, width, height);
  }
  id v39 = [(__CFString *)v12 userActivities];
  id v40 = [v39 count];

  if (v40)
  {
    v41 = [(__CFString *)v12 userActivities];
    id v42 = [v41 anyObject];

    -[EntryPointsCoordinator continueUserActivity:session:windowSize:](self, "continueUserActivity:session:windowSize:", v42, v11, width, height);
  }
  v43 = [(__CFString *)v12 shortcutItem];

  if (v43)
  {
    v14 = [(__CFString *)v12 shortcutItem];
    [(EntryPointsCoordinator *)self openShortcutItem:v14];
LABEL_38:
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)_addRestoreTaskForSession:(id)a3
{
  id v4 = a3;
  if (self->_launchedInBackground)
  {
    unsigned int v5 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned int v5 = [WeakRetained isNavigationTurnByTurnOrStepping] ^ 1;
  }
  BOOL v7 = +[UIApplication sharedApplication];
  BOOL v8 = v7;
  if (!v5
    || ([v7 shouldLaunchSafe] & 1) != 0
    || [v8 launchedToTest])
  {
    uint64_t v9 = sub_1000A930C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = @"NO";
      if (v5) {
        id v10 = @"YES";
      }
      v11 = v10;
      int v15 = 138412290;
      uint64_t v16 = (NSMutableArray *)v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[EP] _addRestoreTaskForSession should restore %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (self->_restoreTaskAdded)
    {
      v12 = sub_1000A930C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        tasks = self->_tasks;
        int v15 = 138412290;
        uint64_t v16 = tasks;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[EP] we are trying to add another restoration task in %@", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      v12 = +[SceneSessionRestorationArbiter activityForSceneSession:v4];
      v14 = +[UserActivityHandlingTask taskForUserActivity:v12 atColdLaunch:self->_coldLaunch];
      if (v14)
      {
        self->_restoreTaskAdded = 1;
        [(EntryPointsCoordinator *)self _insertTaskAtFirstIndex:v14];
      }
    }
  }
}

- (void)setLaunchApplication:(id)a3
{
}

- (LaunchAlertsManager)launchAlertsManager
{
  launchAlertsManager = self->_launchAlertsManager;
  if (!launchAlertsManager)
  {
    id v4 = objc_alloc_init(LaunchAlertsManager);
    unsigned int v5 = self->_launchAlertsManager;
    self->_launchAlertsManager = v4;

    [(LaunchAlertsManager *)self->_launchAlertsManager setDelegate:self];
    id v6 = sub_1000A930C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = self->_launchAlertsManager;
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[EP] created %@", (uint8_t *)&v9, 0xCu);
    }

    launchAlertsManager = self->_launchAlertsManager;
  }

  return launchAlertsManager;
}

- (void)_cleanState
{
  id v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[EP] cleanState", v5, 2u);
  }

  mergedRichMapsActivity = self->_mergedRichMapsActivity;
  self->_mergedRichMapsActivity = 0;

  self->_tasksDone = 0;
  self->_restoreTaskAdded = 0;
  [(NSMutableArray *)self->_tasks removeAllObjects];
  [(NSMutableArray *)self->_tasksToPerform removeAllObjects];
  *(_WORD *)&self->_launchedWithExternalInput = 0;
}

- (void)_addCompletionIfNeeded
{
  if ([(NSMutableArray *)self->_tasksToPerform count] == (id)1)
  {
    objc_initWeak(&location, self);
    tasksGroup = self->_tasksGroup;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10090A674;
    v4[3] = &unk_1012E6708;
    objc_copyWeak(&v5, &location);
    dispatch_group_notify(tasksGroup, (dispatch_queue_t)&_dispatch_main_q, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_addTask:(id)a3
{
}

- (void)_insertTaskAtFirstIndex:(id)a3
{
}

- (void)_addTask:(id)a3 atFirstIndex:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (NSMutableArray *)a3;
  BOOL v7 = sub_1000A930C();
  BOOL v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v9)
      {
        tasks = self->_tasks;
        *(_DWORD *)buf = 138412290;
        objc_super v19 = tasks;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[EP] insert in %@", buf, 0xCu);
      }

      [(NSMutableArray *)self->_tasks insertObject:v6 atIndex:0];
      [(NSMutableArray *)self->_tasksToPerform insertObject:v6 atIndex:0];
    }
    else
    {
      if (v9)
      {
        v11 = self->_tasks;
        *(_DWORD *)buf = 138412290;
        objc_super v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[EP] addTask in %@", buf, 0xCu);
      }

      [(NSMutableArray *)self->_tasks addObject:v6];
      [(NSMutableArray *)self->_tasksToPerform addObject:v6];
    }
    dispatch_group_enter((dispatch_group_t)self->_tasksGroup);
    v12 = sub_1000A930C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[EP] addTask dispatch_group_enter task: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    tasksQueue = self->_tasksQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10090A99C;
    block[3] = &unk_1012E9258;
    int v15 = v6;
    objc_copyWeak(&v17, (id *)buf);
    uint64_t v16 = self;
    dispatch_async(tasksQueue, block);
    [(EntryPointsCoordinator *)self _addCompletionIfNeeded];
    objc_destroyWeak(&v17);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[EP] addTask not on the main thread", buf, 2u);
    }
  }
}

- (void)_mergeTasks
{
  if ([(NSMutableArray *)self->_tasksToPerform count])
  {
    id v3 = sub_1000A930C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      tasksToPerform = self->_tasksToPerform;
      *(_DWORD *)buf = 138412290;
      v24 = tasksToPerform;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "[EP] mergeTasks we should not have any more tasks to perform %@", buf, 0xCu);
    }
  }
  else
  {
    if ([(NSMutableArray *)self->_tasks count] == (id)1 && self->_launchedWithExternalInput)
    {
      id v5 = sub_1000A930C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[EP] mergeTasks we should have 2 tasks to merge", buf, 2u);
      }
    }
    id v3 = objc_alloc_init((Class)NSMutableArray);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_tasks;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v12 = [v11 computedRichMapsActivity];

          if (v12)
          {
            unsigned __int8 v13 = [v11 computedRichMapsActivity];
            [v3 addObject:v13];
          }
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    if ([v3 count])
    {
      v14 = objc_alloc_init(MapsActivityMergeController);
      int v15 = [(MapsActivityMergeController *)v14 mergeActivities:v3];
      [(RichMapsActivity *)v15 setColdLaunch:self->_coldLaunch];
      self->_didLaunchWithExplicitIntent = [(RichMapsActivity *)v15 didLaunchWithExplicitIntent];
      mergedRichMapsActivity = self->_mergedRichMapsActivity;
      self->_mergedRichMapsActivity = v15;

      [(EntryPointsCoordinator *)self _sendMergedRichMapsActivityIfPossible];
    }
    else
    {
      id v17 = sub_1000A930C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[EP] nothing to Merge", buf, 2u);
      }

      [(EntryPointsCoordinator *)self _cleanState];
    }
  }
}

- (void)_sendMergedRichMapsActivityIfPossible
{
  id v3 = [(EntryPointsCoordinator *)self launchAlertsManager];
  unsigned int v4 = [v3 currentlyShowingAlert];

  if (v4)
  {
    self->_waitingForAlerts = 1;
    id v5 = sub_1000A930C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[EP] Wait for Alerts to process", v7, 2u);
    }

    if (self->_didLaunchWithExplicitIntent)
    {
      id v6 = [(EntryPointsCoordinator *)self launchAlertsManager];
      [v6 cancelVisibleAlertIfNecessary];
    }
  }
  else if (![(EntryPointsCoordinator *)self _debug_shouldSkipSendingMergedRichMapsActivity])
  {
    [(EntryPointsCoordinator *)self _sendMergedRichMapsActivity];
  }
}

- (BOOL)_debug_shouldSkipSendingMergedRichMapsActivity
{
  if ((_GEOConfigHasValue() & 1) != 0 || _GEOConfigHasValue())
  {
    id v3 = [self->_mergedRichMapsActivity action];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_sendMergedRichMapsActivity
{
  if (self->_mergedRichMapsActivity)
  {
    id v3 = +[NSUUID UUID];
    unsigned int v4 = [v3 UUIDString];

    id v5 = sub_1000A930C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[EP] sendMergedRichMapsActivity (tag %@)", buf, 0xCu);
    }

    id v6 = self->_mergedRichMapsActivity;
    id v7 = dispatch_get_global_queue(-2, 0);
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    unsigned __int8 v13 = sub_10090B1C4;
    v14 = &unk_1012E5D58;
    id v15 = v4;
    uint64_t v16 = v6;
    id v8 = v6;
    id v9 = v4;
    dispatch_async(v7, &v11);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained entryPointsCoordinator:self didMergedRichMapsActivity:self->_mergedRichMapsActivity v11, v12, v13, v14];
  }
  [(EntryPointsCoordinator *)self _cleanState];
}

- (void)_unlockMergeActivities
{
  id v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (self->_mergeLocked) {
      unsigned int v4 = @"YES";
    }
    else {
      unsigned int v4 = @"NO";
    }
    id v5 = v4;
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[EP] unlockMergeActivities (%@)", (uint8_t *)&v6, 0xCu);
  }
  if (self->_mergeLocked) {
    dispatch_group_leave((dispatch_group_t)self->_tasksGroup);
  }
  self->_mergeLocked = 0;
}

- (void)_displayLaunchAlertsIfNecessary
{
  id v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[EP] displayLaunchAlertsIfNecessary", v22, 2u);
  }

  unsigned int v4 = [(EntryPointsCoordinator *)self launchAlertsManager];
  [v4 cancelVisibleAlertIfNecessary];

  id v5 = +[UIApplication sharedMapsDelegate];
  [v5 dismissCurrentInterruption];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v7 = [WeakRetained isCarPlayOnlyContext];

  if ((v7 & 1) == 0)
  {
    id v8 = [(EntryPointsCoordinator *)self launchAlertsManager];
    [v8 enqueueAlert:5];
  }
  id v9 = [(EntryPointsCoordinator *)self launchAlertsManager];
  [v9 enqueueAlert:0];

  id v10 = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v11 = [v10 isCarPlayOnlyContext];

  if (v11)
  {
    uint64_t v12 = [(EntryPointsCoordinator *)self launchAlertsManager];
    [v12 enqueueAlert:1];
  }
  id v13 = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v14 = [v13 isCarPlayOnlyContext];

  if ((v14 & 1) == 0)
  {
    id v15 = [(EntryPointsCoordinator *)self launchAlertsManager];
    [v15 enqueueAlert:2];

    uint64_t v16 = [(EntryPointsCoordinator *)self launchAlertsManager];
    [v16 enqueueAlert:3];
  }
  if (GEOConfigGetInteger() == 1)
  {
    id v17 = [(EntryPointsCoordinator *)self launchAlertsManager];
    [v17 enqueueAlert:4];
  }
  long long v18 = objc_loadWeakRetained((id *)&self->_delegate);
  if ([v18 isCarPlayOnlyContext]) {
    goto LABEL_14;
  }
  id v19 = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v20 = [v19 isNavigationTurnByTurnOrStepping];

  if ((v20 & 1) == 0)
  {
    long long v18 = [(EntryPointsCoordinator *)self launchAlertsManager];
    [v18 enqueueAlert:6];
LABEL_14:
  }
  long long v21 = [(EntryPointsCoordinator *)self launchAlertsManager];
  [v21 executeAlertsIfNecessary];
}

- (void)_configureTips
{
}

- (void)launchAlertsManagerDidFinishProcessingAlert:(id)a3
{
  unsigned int v4 = sub_1000A930C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[EP] launchAlertsManagerDidFinishProcessingAlert", v5, 2u);
  }

  if (self->_waitingForAlerts)
  {
    self->_waitingForAlerts = 0;
    [(EntryPointsCoordinator *)self _mergeTasks];
  }
}

- (BOOL)_shouldRestoreNavigationSession:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneConnected];
  int v6 = [v4 scene];

  unsigned int v7 = +[UIApplication _maps_isCarPlayWidgetScene:v6];
  id v8 = +[NSUserDefaults standardUserDefaults];
  unsigned int v9 = [v8 BOOLForKey:@"NavigationUserActivityPendingDeletion"];

  id v10 = +[NSUserDefaults standardUserDefaults];
  unsigned int v11 = [v10 objectForKey:@"NavigationUserActivityDefault"];

  uint64_t v12 = sub_1000A930C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if (v5) {
      id v13 = @"YES";
    }
    else {
      id v13 = @"NO";
    }
    unsigned __int8 v14 = v13;
    if (v7) {
      id v15 = @"YES";
    }
    else {
      id v15 = @"NO";
    }
    uint64_t v16 = v15;
    if (v11) {
      id v17 = @"YES";
    }
    else {
      id v17 = @"NO";
    }
    long long v18 = v17;
    int v21 = 138412802;
    v22 = v14;
    __int16 v23 = 2112;
    v24 = v16;
    __int16 v25 = 2112;
    v26 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[EP] _shouldRestoreNavigationSession main %@ widget %@ data %@", (uint8_t *)&v21, 0x20u);
  }
  int v19 = v5 | v7 ^ 1;
  if (!v11) {
    int v19 = 1;
  }
  return ((v19 | v9) & 1) == 0 && self->_firstWidget;
}

- (void)prepareBackgroundNavigation
{
  id v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[EP] prepareBackgroundNavigation", v4, 2u);
  }

  self->_launchedInBackground = 1;
  if (self->_mergeLocked) {
    [(EntryPointsCoordinator *)self _unlockMergeActivities];
  }
}

- (void)willResignActiveWithSession:(id)a3
{
  if ([(EntryPointsCoordinator *)self _sessionShouldParticipateInLifecycle:a3])
  {
    id v3 = sub_1000A930C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[EP] willResignActive", v4, 2u);
    }
  }
}

- (void)didEnterBackgroundWithSession:(id)a3
{
  if ([(EntryPointsCoordinator *)self _sessionShouldParticipateInLifecycle:a3])
  {
    unsigned int v4 = +[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground];
    unsigned int v5 = sub_1000A930C();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[EP] ignoring didEnterBackground since another application scene is foreground, not locking merge activities", buf, 2u);
      }
    }
    else
    {
      if (v6)
      {
        *(_WORD *)unsigned int v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[EP] didEnterBackground", v7, 2u);
      }

      [(EntryPointsCoordinator *)self _cleanState];
      [(EntryPointsCoordinator *)self _lockMergeActivities];
      +[MapsAnalyticStateProvider clearSharedState];
    }
  }
}

- (void)openURL:(id)a3 session:(id)a4 sceneOptions:(id)a5 mkOptions:(id)a6 windowSize:(CGSize)a7
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = sub_1000A930C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    id v30 = v13;
    __int16 v31 = 2112;
    id v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[EP] openURL: %{private}@ sceneOptions: %@", buf, 0x16u);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10090BE98;
  v22[3] = &unk_101300830;
  v22[4] = self;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  id v26 = v16;
  CGFloat v27 = width;
  CGFloat v28 = height;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  +[UIApplication _mapsCarPlay_connectApplicationSceneIfNeededForSession:v20 completion:v22];
}

- (void)_openURL:(id)a3 referringURL:(id)a4 sourceApplication:(id)a5 session:(id)a6 sceneOptions:(id)a7 mkOptions:(id)a8 windowSize:(CGSize)a9
{
  double height = a9.height;
  double width = a9.width;
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  id v19 = a5;
  id v20 = a4;
  id v21 = sub_1000A930C();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v23 = 138478083;
    id v24 = v16;
    __int16 v25 = 2112;
    id v26 = v17;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[EP] _openURL: %{private}@ sceneOptions: %@", (uint8_t *)&v23, 0x16u);
  }

  v22 = +[URLHandlingTask taskForURL:referringURL:sourceApplication:sceneOptions:mkOptions:windowSize:](URLHandlingTask, "taskForURL:referringURL:sourceApplication:sceneOptions:mkOptions:windowSize:", v16, v20, v19, v17, v18, width, height);

  if (v22) {
    [(EntryPointsCoordinator *)self _addTask:v22];
  }
}

- (void)willContinueUserActivityWithType:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[LoadingIndicatorController sharedController];
  BOOL v6 = [v5 beginShowingLoadingIndicator];
  continuityLoadingToken = self->_continuityLoadingToken;
  self->_continuityLoadingToken = v6;

  id v8 = sub_1000A930C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[EP] willContinueUserActivityWithType %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)didFailToContinueUserActivityWithType:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  continuityLoadingToken = self->_continuityLoadingToken;
  self->_continuityLoadingToken = 0;

  int v9 = sub_1000A930C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[EP] didFailToContinueUserActivityWithType %@ %@", buf, 0x16u);
  }

  self->_launchedWithExternalInput = 0;
  unsigned int v10 = [v6 isEqual:CSSearchableItemActionType];
  unsigned int v11 = +[NSBundle mainBundle];
  uint64_t v12 = v11;
  if (v10)
  {
    id v13 = [v11 localizedStringForKey:@"Failed to continue activity [Spotlight opening error alert]" value:@"localized string not found" table:0];

    id v14 = +[NSBundle mainBundle];
    id v15 = v14;
    CFStringRef v16 = @"The Spotlight selection could not be opened. [Spotlight opening error alert]";
  }
  else
  {
    id v13 = [v11 localizedStringForKey:@"Failed to continue activity [Continuation error alert]" value:@"localized string not found" table:0];

    id v14 = +[NSBundle mainBundle];
    id v15 = v14;
    CFStringRef v16 = @"The connection to your other device may have been interrupted. Please try again. [Continuation error alert]";
  }
  id v17 = [v14 localizedStringForKey:v16 value:@"localized string not found" table:0];

  id v18 = [ErrorActionOption alloc];
  id v19 = +[NSBundle mainBundle];
  id v20 = [v19 localizedStringForKey:@"OK [Continuation error alert]" value:@"localized string not found" table:0];
  id v21 = [(ErrorActionOption *)v18 initWithTitle:v20 cancels:1 handler:0];
  __int16 v25 = v21;
  v22 = +[NSArray arrayWithObjects:&v25 count:1];

  int v23 = [[ErrorAction alloc] initWithTitle:v13 message:v17 options:v22];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained entryPointsCoordinator:self performErrorAction:v23];
}

- (void)continueUserActivity:(id)a3 session:(id)a4 windowSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v9 = a3;
  id v10 = a4;
  continuityLoadingToken = self->_continuityLoadingToken;
  self->_continuityLoadingToken = 0;

  uint64_t v12 = sub_1000A930C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[EP] continueUserActivity %@", buf, 0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10090C510;
  v15[3] = &unk_101300858;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  CGFloat v18 = width;
  CGFloat v19 = height;
  id v13 = v10;
  id v14 = v9;
  +[UIApplication _mapsCarPlay_connectApplicationSceneIfNeededForSession:v13 completion:v15];
}

- (void)_continueUserActivity:(id)a3 session:(id)a4 windowSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  id v10 = a4;
  unsigned int v11 = sub_1000A930C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[EP] _continueUserActivity %@", buf, 0xCu);
  }

  if ([(EntryPointsCoordinator *)self shouldHandleUniversalLinkWithUserActivity:v9])
  {
    uint64_t v12 = [v9 webpageURL];
    id v13 = [v9 referrerURL];
    id v14 = [v9 _sourceApplication];
    -[EntryPointsCoordinator _openURL:referringURL:sourceApplication:session:sceneOptions:mkOptions:windowSize:](self, "_openURL:referringURL:sourceApplication:session:sceneOptions:mkOptions:windowSize:", v12, v13, v14, v10, 0, 0, width, height);
    goto LABEL_9;
  }
  uint64_t v12 = [v9 userInfo];
  id v13 = [v9 activityType];
  if (![v13 isEqual:@"com.apple.Maps"])
  {
LABEL_8:
    id v14 = +[UserActivityHandlingTask taskForUserActivity:v9 atColdLaunch:self->_coldLaunch];
    [(EntryPointsCoordinator *)self _addTask:v14];
    goto LABEL_9;
  }
  id v15 = [v12 objectForKeyedSubscript:@"bs"];
  if (v15)
  {

    goto LABEL_8;
  }
  id v16 = [v12 objectForKeyedSubscript:@"MapsActionKey"];

  if (!v16) {
    goto LABEL_8;
  }
  id v14 = [v12 objectForKeyedSubscript:@"MapsActionLaunchURLKey"];
  id v17 = sub_1000A930C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    CGFloat v18 = [v9 title];
    *(_DWORD *)buf = 138412546;
    id v26 = v18;
    __int16 v27 = 2112;
    __int16 v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[EP] LAUNCHING Siri Action '%@' from URL %@", buf, 0x16u);
  }
  uint64_t v23 = _UISceneConnectionOptionsSourceApplicationKey;
  CFStringRef v24 = @"SiriActions";
  CGFloat v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v20 = +[UISceneOpenURLOptions _optionsFromDictionary:v19];

  id v21 = [v9 _sourceApplication];
  v22 = +[URLHandlingTask taskForURL:referringURL:sourceApplication:sceneOptions:mkOptions:windowSize:](URLHandlingTask, "taskForURL:referringURL:sourceApplication:sceneOptions:mkOptions:windowSize:", v14, 0, v21, v20, 0, width, height);

  if (v22) {
    [(EntryPointsCoordinator *)self _addTask:v22];
  }

LABEL_9:
}

- (BOOL)shouldHandleUniversalLinkWithUserActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 activityType];
  unsigned int v5 = [v4 isEqual:NSUserActivityTypeBrowsingWeb];

  if (v5)
  {
    id v6 = [v3 webpageURL];
    if (v6) {
      LOBYTE(v5) = +[_MKURLParser isValidMapURL:v6];
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)openShortcutItem:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000A930C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[EP] openShortcutItem %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[ShortcutHandlingTask taskForShortcutItem:v4];
  [(EntryPointsCoordinator *)self _addTask:v6];
}

- (void)openNotificationData:(id)a3 forType:(id)a4 recordIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  unsigned int v11 = sub_1000A930C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[EP] openNotificationData %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v12 = +[NotificationHandlingTask taskForData:v10 type:v8 recordIdentifier:v9];

  [(EntryPointsCoordinator *)self _addTask:v12];
}

- (void)receivedDidPresentContaineeNotification:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"ContainerDidPresentContaineeNotification" object:0];

  *(_WORD *)&self->_BOOL shouldWaitForFirstContainee = 0;
}

- (EntryPointsCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EntryPointsCoordinatorDelegate *)WeakRetained;
}

- (BOOL)didLaunchWithExplicitIntent
{
  return self->_didLaunchWithExplicitIntent;
}

- (void)setLaunchAlertsManager:(id)a3
{
}

- (NSString)launchApplication
{
  return self->_launchApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchApplication, 0);
  objc_storeStrong((id *)&self->_launchAlertsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mergedRichMapsActivity, 0);
  objc_storeStrong((id *)&self->_continuityLoadingToken, 0);
  objc_storeStrong((id *)&self->_tasksToPerform, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_tasksGroup, 0);

  objc_storeStrong((id *)&self->_tasksQueue, 0);
}

@end