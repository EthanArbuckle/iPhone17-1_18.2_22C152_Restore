@interface CalendarSceneManager
+ (BOOL)isSceneCalendarAppScene:(id)a3;
+ (id)_applicationLastActiveTime;
+ (id)_encodeIdentifier:(id)a3;
+ (id)_sharedState;
+ (void)setApplicationLastActiveTimeProvider:(id)a3;
- (BOOL)_areMultipleScenesOpen;
- (BOOL)_continueUserActivity:(id)a3 restoreSelectedOccurrence:(BOOL)a4 restoreSelectedDate:(BOOL)a5 restorationHandler:(id)a6;
- (BOOL)_isAnyWindowShowingDelegateCalendar;
- (BOOL)_isUserActivityForStateRestoration:(id)a3;
- (BOOL)_shouldMaintainToday;
- (BOOL)_shouldResumeToTodayOnBecomeActive;
- (BOOL)showingSplashScreen;
- (CUIKCalendarModel)model;
- (CalendarDiagnosticsUIViewController)diagnosticsViewController;
- (MainWindowRootViewController)rootViewController;
- (MobileCalWindow)mobileCalWindow;
- (RootNavigationController)rootNavigationController;
- (double)_resumeToTodayTimeout;
- (id)_eventURLFromLaunchURL:(id)a3 isTravel:(BOOL *)a4;
- (id)_extractNumberFromUserActivity:(id)a3 forKey:(id)a4;
- (id)_setUpModel;
- (id)splashScreenCompletionAction;
- (id)stateRestorationActivityForScene:(id)a3;
- (void)__buildCalendarSyncHashesForCalendars:(id)a3;
- (void)__restoreSelectedCalendarsFromPreferences;
- (void)_addPersistedStateFromCalendarModelToDictionary:(id)a3;
- (void)_collectStats:(id)a3;
- (void)_constructAndPresentSplashScreenFromViewController:(id)a3 window:(id)a4;
- (void)_displayedOccurrencesChangedForTheFirstTime:(id)a3;
- (void)_extendedLaunchDidComplete;
- (void)_mainViewControllerDidRequestSceneTitleUpdate:(id)a3;
- (void)_openURL:(id)a3;
- (void)_receivedSplashScreenCompletedNotification;
- (void)_refreshAccountListAndViewContentsIfNeededForModel:(id)a3;
- (void)_restoreModelPersistedStateFromUserActivity:(id)a3;
- (void)_restoreSelectedCalendarsFromPreferenceIfNeeded;
- (void)_restoreStateFromUserActivity:(id)a3;
- (void)_selectedIdentityDidUpdate:(id)a3;
- (void)_setupDebugMenu:(id)a3;
- (void)_showDate:(id)a3 inView:(unint64_t)a4;
- (void)_showEvent:(id)a3 inView:(unint64_t)a4;
- (void)_splashScreenDidDismissShouldNotify:(BOOL)a3;
- (void)_stateRestoreSelectedCalendarsFromUserActivity:(id)a3;
- (void)_topMainViewControllerCompletedExtendedLaunch:(id)a3;
- (void)_updateSceneActivationConditions;
- (void)_updateSceneTitle;
- (void)diagnosticsViewControllerDidDismiss;
- (void)handleURL:(id)a3 context:(id)a4;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setDiagnosticsViewController:(id)a3;
- (void)setLaunchedFromURLOrActivity;
- (void)setSplashScreenCompletionAction:(id)a3;
- (void)showDebugMenu;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation CalendarSceneManager

- (void)__buildCalendarSyncHashesForCalendars:(id)a3
{
  id v3 = a3;
  id v4 = +[EKPreferences shared];
  [v4 setDeselectedCalendars:v3 reason:@"restoring selected calendars from preferences"];
}

- (void)_setupDebugMenu:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000FE6E0;
  v4[3] = &unk_1001D2740;
  v4[4] = self;
  id v3 = [a3 statusBarManager];
  [v3 setDebugMenuHandler:v4];
}

- (double)_resumeToTodayTimeout
{
  v2 = +[CUIKPreferences sharedPreferences];
  unsigned int v3 = [v2 isShortResumeToTodayTimeout];

  double result = 480.0;
  if (v3) {
    return 5.0;
  }
  return result;
}

- (id)_setUpModel
{
  unsigned int v3 = +[Application createNewCalendarModel];
  id v4 = +[CalendarSceneManager _sharedState];
  unsigned int v5 = [v4 extendedLaunchComplete];

  if (v5)
  {
    [v3 startNotificationMonitor];
    [(CUIKCalendarModel *)self->_model checkLocationAuthorizationAndAllowEventLocationPrediction];
  }

  return v3;
}

- (void)_collectStats:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  CalAnalyticsSendEventLazy();
}

+ (void)setApplicationLastActiveTimeProvider:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedState];
  [v5 setApplicationLastActiveTimeProvider:v4];
}

- (void)_displayedOccurrencesChangedForTheFirstTime:(id)a3
{
  id v4 = [(RootNavigationController *)self->_rootNavigationController topMainViewControllerContainer];
  id v5 = [v4 currentChildViewController];
  if (([v5 handlesNotifyOnExtendedLaunchCompletion] & 1) == 0)
  {
    v6 = +[CalendarSceneManager _sharedState];
    unsigned __int8 v7 = [v6 extendedLaunchComplete];

    if (v7)
    {
      if (!self->_sceneHasCompletedExtendedLaunch) {
        [(CalendarSceneManager *)self _extendedLaunchDidComplete];
      }
    }
    else
    {
      [(CalendarSceneManager *)self _extendedLaunchDidComplete];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000FED70;
      block[3] = &unk_1001D2740;
      block[4] = self;
      if (qword_1002169E8 != -1) {
        dispatch_once(&qword_1002169E8, block);
      }
    }
    v8 = +[CalendarSceneManager _sharedState];
    [v8 setExtendedLaunchComplete:1];
  }
  v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self name:CUIKCalendarModelDisplayedOccurrencesChangedForTheFirstTimeNotification object:0];
}

- (void)_topMainViewControllerCompletedExtendedLaunch:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"MainViewControllerDidCompleteExtendedLaunchNotification" object:0];

  id v5 = +[CalendarSceneManager _sharedState];
  if ([v5 extendedLaunchComplete])
  {
    BOOL sceneHasCompletedExtendedLaunch = self->_sceneHasCompletedExtendedLaunch;

    if (sceneHasCompletedExtendedLaunch) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(CalendarSceneManager *)self _extendedLaunchDidComplete];
LABEL_6:
  id v7 = +[CalendarSceneManager _sharedState];
  [v7 setExtendedLaunchComplete:1];
}

+ (id)_sharedState
{
  if (qword_1002169F8 != -1) {
    dispatch_once(&qword_1002169F8, &stru_1001D55A8);
  }
  v2 = (void *)qword_1002169F0;

  return v2;
}

+ (id)_applicationLastActiveTime
{
  v2 = [a1 _sharedState];
  id v3 = [v2 applicationLastActiveTimeProvider];
  id v4 = [v3 applicationLastActiveTime];

  return v4;
}

- (BOOL)_areMultipleScenesOpen
{
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 openSessions];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) role:(void)v14];
        unsigned int v11 = [v10 isEqualToString:UIWindowSceneSessionRoleApplication];

        v7 += v11;
        if (v7 > 1)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager sceneWillEnterForeground: %@", buf, 0xCu);
  }
  [(MainWindowRootViewController *)self->_rootViewController willEnterForeground];
  [(RootNavigationController *)self->_rootNavigationController willEnterForeground];
  +[EKUIAppReviewUtils applicationDidForeground];
  if ((byte_100216A08 & 1) == 0) {
    byte_100216A08 = 1;
  }
  CUIKITriggerReminderSync();
  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  uint64_t v7 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FF724;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_after(v6, v7, block);
}

- (BOOL)_shouldResumeToTodayOnBecomeActive
{
  id v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Determining whether to show today on resume.", (uint8_t *)&v18, 2u);
  }
  if (self->_launchedFromURLOrActivity)
  {
    id v4 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_launchedFromURLOrActivity is YES, not showing today on resume.", (uint8_t *)&v18, 2u);
    }
    LOBYTE(v5) = 0;
  }
  else
  {
    dispatch_time_t v6 = CUIKNowDate();
    [(CalendarSceneManager *)self _resumeToTodayTimeout];
    double v8 = v7;
    v9 = +[CalendarSceneManager _applicationLastActiveTime];
    if (v9)
    {
      [v6 timeIntervalSinceDate:v9];
      double v11 = v10;
    }
    else
    {
      double v11 = v8 + 1.0;
    }
    BOOL v5 = v11 > v8;
    BOOL v12 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      int v18 = 67109634;
      BOOL v19 = v11 > v8;
      __int16 v20 = 2112;
      v21 = v9;
      __int16 v22 = 2112;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Resume to today timeout expired: %d (Application last active time = %@ | now = %@", (uint8_t *)&v18, 0x1Cu);
    }
    if ([(CalendarSceneManager *)self _areMultipleScenesOpen])
    {
      v13 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      {
        BOOL maintainToday = self->_maintainToday;
        int v18 = 67109120;
        BOOL v19 = maintainToday;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Multiple scenes present, _BOOL maintainToday = %d", (uint8_t *)&v18, 8u);
      }
      BOOL v5 = v11 > v8 && self->_maintainToday;
    }
    long long v16 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      int v18 = 67109120;
      BOOL v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Should show today on resume double result = %d", (uint8_t *)&v18, 8u);
    }
  }
  return v5;
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  BOOL v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager sceneDidBecomeActive: %@", buf, 0xCu);
  }
  unsigned int v6 = [(CalendarSceneManager *)self _shouldResumeToTodayOnBecomeActive];
  double v7 = [(RootNavigationController *)self->_rootNavigationController view];
  double v8 = [v7 window];
  EKUIPushFallbackSizingContextWithViewHierarchy();

  if (v6) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  [(RootNavigationController *)self->_rootNavigationController selectTodayWithTrigger:v9 animated:0];
  self->_launchedFromURLOrActivity = 0;
  double v10 = [(RootNavigationController *)self->_rootNavigationController view];
  double v11 = [v10 window];
  EKUIPopFallbackSizingContextWithViewHierarchy();

  [(RootNavigationController *)self->_rootNavigationController didBecomeActive];
  BOOL v12 = +[CUIKPreferences sharedPreferences];
  LODWORD(v11) = [v12 requestSyncOnApplicationLaunch];

  if (v11)
  {
    v13 = [(RootNavigationController *)self->_rootNavigationController model];
    [(CalendarSceneManager *)self performSelector:"_refreshAccountListAndViewContentsIfNeededForModel:" withObject:v13 afterDelay:2.0];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v14 = self->_userActivitiesToContinueAfterConnection;
  id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        -[CalendarSceneManager _continueUserActivity:restoreSelectedOccurrence:restoreSelectedDate:restorationHandler:](self, "_continueUserActivity:restoreSelectedOccurrence:restoreSelectedDate:restorationHandler:", *(void *)(*((void *)&v27 + 1) + 8 * i), 1, 1, 0, (void)v27);
      }
      id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }

  userActivitiesToContinueAfterConnection = self->_userActivitiesToContinueAfterConnection;
  self->_userActivitiesToContinueAfterConnection = 0;

  selectedOccurrenceToRestoreAfterConnection = self->_selectedOccurrenceToRestoreAfterConnection;
  if (selectedOccurrenceToRestoreAfterConnection)
  {
    [(MainWindowRootViewController *)self->_rootViewController showEventAndCloseSidebarIfNeeded:selectedOccurrenceToRestoreAfterConnection animated:0 showMode:1];
    v21 = self->_selectedOccurrenceToRestoreAfterConnection;
    self->_selectedOccurrenceToRestoreAfterConnection = 0;
  }
  if (self->_sceneNeedsToCallExtendedLaunchCompletionSPI)
  {
    self->_sceneNeedsToCallExtendedLaunchCompletionSPI = 0;
    __int16 v22 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v4;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager: calling _completeStateRestoration (sceneDidBecomeActive) for scene: %@", buf, 0xCu);
    }
    [v4 _completeStateRestoration:v27];
  }
  if (self->_shortcutItemToRunAfterConnection)
  {
    v23 = [(RootNavigationController *)self->_rootNavigationController view];
    v24 = [v23 window];
    v25 = [v24 windowScene];
    [(CalendarSceneManager *)self windowScene:v25 performActionForShortcutItem:self->_shortcutItemToRunAfterConnection completionHandler:0];

    shortcutItemToRunAfterConnection = self->_shortcutItemToRunAfterConnection;
    self->_shortcutItemToRunAfterConnection = 0;
  }
  -[CalendarSceneManager _collectStats:](self, "_collectStats:", self->_rootNavigationController, (void)v27);
}

- (void)_updateSceneActivationConditions
{
  v2 = self;
  id v3 = [(CalendarSceneManager *)self model];
  id v4 = [v3 sourceForSelectedIdentity];

  BOOL v5 = &objc_retain_x2_ptr;
  if (v4)
  {
    unsigned int v6 = [(CalendarSceneManager *)v2 model];
    double v7 = [v6 sourceForSelectedIdentity];
    double v8 = [v7 sourceIdentifier];

    uint64_t v9 = +[CalendarSceneManager _encodeIdentifier:v8];

    double v10 = +[NSString stringWithFormat:@"x-apple-calevent://%@/", v9];
    double v11 = +[NSPredicate predicateWithFormat:@"self CONTAINS %@", v10];

    goto LABEL_17;
  }
  uint64_t v9 = +[NSMutableArray array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v31 = v2;
  BOOL v12 = [(CalendarSceneManager *)v2 model];
  v13 = [v12 eventStore];
  long long v14 = [v13 delegateSources];

  id obj = v14;
  id v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      int v18 = 0;
      do
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(obj);
        }
        BOOL v19 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)v18) sourceIdentifier];
        __int16 v20 = +[CalendarSceneManager _encodeIdentifier:v19];

        v21 = +[NSString stringWithFormat:@"x-apple-calevent://%@/", v20];
        [v5[433] predicateWithFormat:@"self CONTAINS %@", v21];
        v23 = __int16 v22 = v5;
        v24 = +[NSCompoundPredicate notPredicateWithSubpredicate:v23];

        BOOL v5 = v22;
        [v9 addObject:v24];

        int v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v16);
  }

  if ([v9 count] == (id)1)
  {
    uint64_t v25 = [v9 firstObject];
  }
  else
  {
    if ((unint64_t)[v9 count] < 2)
    {
      double v11 = 0;
      goto LABEL_16;
    }
    uint64_t v25 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];
  }
  double v11 = (void *)v25;
LABEL_16:
  v2 = v31;
LABEL_17:

  id v26 = objc_alloc_init((Class)UISceneActivationConditions);
  long long v27 = [v5[433] predicateWithValue:1];
  [v26 setCanActivateForTargetContentIdentifierPredicate:v27];

  if (v11)
  {
    [v26 setPrefersToActivateForTargetContentIdentifierPredicate:v11];
  }
  else
  {
    long long v28 = [v5[433] predicateWithValue:0];
    [v26 setPrefersToActivateForTargetContentIdentifierPredicate:v28];
  }
  long long v29 = [(CalendarSceneManager *)v2 mobileCalWindow];
  long long v30 = [v29 windowScene];
  [v30 setActivationConditions:v26];
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)__restoreSelectedCalendarsFromPreferences
{
  id v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    model = self->_model;
    BOOL v5 = v3;
    unsigned int v6 = [(CUIKCalendarModel *)model eventStore];
    double v7 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];
    *(_DWORD *)buf = 138412802;
    v44 = model;
    __int16 v45 = 2112;
    v46 = v6;
    __int16 v47 = 2112;
    v48 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CalendarSceneManager Setting up selected calendars for model from preference %@ (%@ %@)", buf, 0x20u);
  }
  id v8 = objc_alloc((Class)EKCalendarVisibilityManager);
  uint64_t v9 = [(CUIKCalendarModel *)self->_model eventStore];
  double v10 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];
  id v11 = [v8 initWithEventStore:v9 limitedToSource:v10 visibilityChangedCallback:0 queue:0];

  id v12 = [v11 invisibleCalendarsForAllIdentities];
  if ([UIApp launchedToTest])
  {
    long long v34 = v12;
    id v35 = v11;
    v13 = [(CUIKCalendarModel *)self->_model eventStore];
    long long v14 = [v13 calendarsForEntityType:0];

    id v12 = [v14 mutableCopy];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v39;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v15);
          }
          __int16 v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v21 = [v20 title];
          unsigned __int8 v22 = [v21 containsString:@"Legacy"];

          if ((v22 & 1) == 0) {
            [v12 removeObject:v20];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v17);
    }

    id v11 = v35;
  }
  v23 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    uint64_t v25 = (CUIKCalendarModel *)[v12 count];
    *(_DWORD *)buf = 134217984;
    v44 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "CalendarSceneManager Invisible calendars: (%tu)", buf, 0xCu);
  }
  id v26 = [objc_alloc((Class)NSSet) initWithArray:v12];
  [(CUIKCalendarModel *)self->_model setUnselectedCalendars:v26];
  [(CUIKCalendarModel *)self->_model setMaxCachedDays:300];
  long long v27 = +[EKPreferences shared];
  long long v28 = [v27 collapsedSectionIdentifiers];
  long long v29 = +[NSSet setWithArray:v28];
  [(CUIKCalendarModel *)self->_model setCollapsedSectionIdentifiers:v29];

  long long v30 = +[EKCalendarVisibilityManager unselectedCalendarIdentifiersForFocusMode];
  BOOL v31 = v30 != 0;

  [(CUIKCalendarModel *)self->_model setFocusFilterMode:v31];
  v32 = dispatch_get_global_queue(-2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000063D0;
  block[3] = &unk_1001D28A8;
  block[4] = self;
  id v37 = v11;
  id v33 = v11;
  dispatch_async(v32, block);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v94 = (uint64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager scene:willConnectToSession:options: %@", buf, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v84 = v8;
    id v12 = [v84 windows];
    v13 = (char *)[v12 countByEnumeratingWithState:&v89 objects:v97 count:16];
    if (v13)
    {
      long long v14 = v13;
      uint64_t v15 = *(void *)v90;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(void *)v90 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v23 = kCalUILogHandle;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager Scene window already set up, no further work needed", buf, 2u);
            }

            goto LABEL_70;
          }
        }
        long long v14 = (char *)[v12 countByEnumeratingWithState:&v89 objects:v97 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v17 = [(CalendarSceneManager *)self _setUpModel];
    model = self->_model;
    self->_model = v17;

    BOOL v19 = [v84 _sceneIdentifier];
    [(CUIKCalendarModel *)self->_model setSceneIdentifier:v19];

    [(CalendarSceneManager *)self _setupDebugMenu:v84];
    if ([UIApp launchedToTest])
    {
      uint64_t v20 = 0;
      char v21 = 1;
    }
    else
    {
      uint64_t v20 = [v9 stateRestorationActivity];
      if (v20)
      {
        v24 = kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v94 = v20;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "CalendarSceneManager _stateRestoreSelectedCalendarsFromUserActivity. %@", buf, 0xCu);
        }
        [(CalendarSceneManager *)self _stateRestoreSelectedCalendarsFromUserActivity:v20];
        char v21 = 0;
        if (self->_finishedSetup) {
          goto LABEL_28;
        }
      }
      else
      {
        char v21 = 1;
      }
    }
    uint64_t v25 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "CalendarSceneManager _restoreSelectedCalendarsFromPreferenceIfNeeded", buf, 2u);
    }
    [(CalendarSceneManager *)self _restoreSelectedCalendarsFromPreferenceIfNeeded];
LABEL_28:
    char v26 = EKUIShouldSaveStateInPreferences();
    if ((v21 & 1) == 0 && (v26 & 1) == 0)
    {
      long long v27 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "CalendarSceneManager _restoreModelPersistedStateFromUserActivity", buf, 2u);
      }
      [(CalendarSceneManager *)self _restoreModelPersistedStateFromUserActivity:v20];
    }
    id v82 = v9;
    v83 = (void *)v20;
    long long v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:self selector:"_displayedOccurrencesChangedForTheFirstTime:" name:CUIKCalendarModelDisplayedOccurrencesChangedForTheFirstTimeNotification object:0];

    long long v29 = +[NSNotificationCenter defaultCenter];
    [v29 addObserver:self selector:"_topMainViewControllerCompletedExtendedLaunch:" name:@"MainViewControllerDidCompleteExtendedLaunchNotification" object:0];

    BOOL v31 = objc_alloc_init(MobileCalWindow);
    v32 = CalendarAppTintColor();
    [(MobileCalWindow *)v31 setTintColor:v32];

    [(MobileCalWindow *)v31 setWindowScene:v84];
    id v33 = [[RootNavigationController alloc] initWithModel:self->_model targetWindow:v31];
    EKUIPushFallbackSizingContextWithViewHierarchy();
    id v35 = [[MainWindowRootViewController alloc] initWithRootNavigationController:v33];
    rootViewController = self->_rootViewController;
    self->_rootViewController = v35;

    [(MobileCalWindow *)v31 setRootViewController:self->_rootViewController];
    [(MobileCalWindow *)v31 makeKeyAndVisible];
    EKUIPopFallbackSizingContextWithViewHierarchy();
    objc_storeStrong((id *)&self->_mobileCalWindow, v31);
    v79 = v33;
    objc_storeStrong((id *)&self->_rootNavigationController, v33);
    long long v38 = +[NSUserDefaults standardUserDefaults];
    if ([v38 BOOLForKey:@"UITestingFastAnimations"])
    {
      long long v39 = [(MobileCalWindow *)v31 layer];
      LODWORD(v40) = 1120403456;
      [v39 setSpeed:v40];
    }
    v81 = v38;
    if (+[EKFeatureSet mustDisplaySplashScreenToUser](EKFeatureSet, "mustDisplaySplashScreenToUser")&& (+[UMUserManager sharedManager](UMUserManager, "sharedManager"), long long v41 = objc_claimAutoreleasedReturnValue(), v42 = [v41 isMultiUser], v41, (v42 & 1) == 0))
    {
      if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy())
      {
        v44 = +[CUIKPreferences sharedPreferences];
        __int16 v45 = [v44 lastViewMode];
        id v46 = [v45 integerValue];

        if (v46 == (id)3)
        {
          __int16 v47 = (void *)kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            log = v47;
            v77 = +[NSNumber numberWithInteger:3];
            v48 = +[NSNumber numberWithInteger:2];
            *(_DWORD *)buf = 138412546;
            uint64_t v94 = (uint64_t)v77;
            __int16 v95 = 2112;
            v96 = v48;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Overriding 'last view mode' preference.  Previous: [%@]  New: [%@].", buf, 0x16u);
          }
          v49 = +[NSNumber numberWithInteger:2];
          [v44 setLastViewMode:v49];
        }
      }
      int v43 = 1;
    }
    else
    {
      int v43 = 0;
    }
    v50 = +[NSNotificationCenter defaultCenter];
    [v50 addObserver:self selector:"_selectedIdentityDidUpdate:" name:CUIKCalendarModelIdentityChangedNotification object:0];

    v51 = +[NSNotificationCenter defaultCenter];
    [v51 addObserver:self selector:"_selectedIdentityDidUpdate:" name:CUIKCalendarModelDelegatesChangedNotification object:0];

    [(CalendarSceneManager *)self _updateSceneActivationConditions];
    v52 = +[CUIKPreferences sharedPreferences];
    v53 = [v52 lastSidebarMode];
    id v54 = [v53 unsignedIntegerValue];

    [(MainWindowRootViewController *)self->_rootViewController setCurrentSidebarState:v54];
    v55 = objc_alloc_init(EKReminderEditViewControllerCreator);
    +[EKEventEditViewController registerIntegrationEditViewControllerCreator:v55];

    if ((v21 & 1) == 0)
    {
      [(CalendarSceneManager *)self _restoreStateFromUserActivity:v83];
      if (self->_selectedOccurrenceToRestoreAfterConnection)
      {
        if (!self->_sceneNeedsToCallExtendedLaunchCompletionSPI)
        {
          self->_sceneNeedsToCallExtendedLaunchCompletionSPI = 1;
          v56 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v94 = (uint64_t)v84;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager calling _extendStateRestoration for scene: %@", buf, 0xCu);
          }
          [v84 _extendStateRestoration];
          dispatch_time_t v57 = dispatch_time(0, 5000000000);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000FF0CC;
          block[3] = &unk_1001D28A8;
          block[4] = self;
          id v88 = v84;
          dispatch_after(v57, (dispatch_queue_t)&_dispatch_main_q, block);
        }
      }
    }
    v58 = kCalUILogHandle;
    BOOL v59 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO);
    if (v43)
    {
      if (v59)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "CalendarSceneManager Presenting splash screen to the user.", buf, 2u);
      }
      [(CalendarSceneManager *)self _constructAndPresentSplashScreenFromViewController:self->_rootViewController window:v31];
    }
    else if (v59)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "CalendarSceneManager Will not present the splash screen to the user.", buf, 2u);
    }
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_100023D88;
    v85[3] = &unk_1001D2740;
    v60 = v79;
    v86 = v60;
    if (qword_100216A00 != -1) {
      dispatch_once(&qword_100216A00, v85);
    }
    v61 = [v10 shortcutItem];
    shortcutItemToRunAfterConnection = self->_shortcutItemToRunAfterConnection;
    self->_shortcutItemToRunAfterConnection = v61;

    v63 = [v10 userActivities];
    v64 = [v63 allObjects];
    userActivitiesToContinueAfterConnection = self->_userActivitiesToContinueAfterConnection;
    self->_userActivitiesToContinueAfterConnection = v64;

    v66 = [v10 URLContexts];
    if (v66)
    {
      [(CalendarSceneManager *)self scene:v84 openURLContexts:v66];
    }
    else
    {
      v67 = [v10 notificationResponse];

      if (v67)
      {
        id v80 = v10;
        v68 = [v10 notificationResponse];
        v69 = [v68 notification];
        v70 = [v69 request];
        v71 = [v70 content];
        uint64_t v72 = [v71 defaultActionURL];

        v73 = (void *)v72;
        v74 = kCalUILogHandle;
        BOOL v75 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO);
        if (v72)
        {
          if (v75)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "Opening URL from dragged notification banner", buf, 2u);
          }
          [(CalendarSceneManager *)self _openURL:v72];
          id v10 = v80;
        }
        else
        {
          id v10 = v80;
          if (v75)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "Unable to find URL for dragged notification banner", buf, 2u);
          }
        }
      }
    }
    v76 = +[NSNotificationCenter defaultCenter];
    [v76 addObserver:self selector:"_mainViewControllerDidRequestSceneTitleUpdate:" name:@"_CalendarWindowSceneTitleRequiresUpdateNotification" object:v84];

    [(CalendarSceneManager *)self _updateSceneTitle];
    id v9 = v82;
    goto LABEL_70;
  }
  unsigned __int8 v22 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "CalendarSceneManager Scene connected, but it's not a window scene.", buf, 2u);
  }
LABEL_70:
}

- (BOOL)showingSplashScreen
{
  return self->_showingSplashScreen;
}

- (MobileCalWindow)mobileCalWindow
{
  return self->_mobileCalWindow;
}

- (void)_updateSceneTitle
{
  if (EKUIDeviceCanTransform())
  {
    id v3 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];

    if (v3)
    {
      id v4 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];
      uint64_t v5 = CUIKDisplayedTitleForSource();
    }
    else
    {
      if ([(CalendarSceneManager *)self _isAnyWindowShowingDelegateCalendar])
      {
        id v4 = +[NSBundle bundleForClass:objc_opt_class()];
        [v4 localizedStringForKey:@"My Calendar" value:&stru_1001D6918 table:0];
      }
      else
      {
        id v4 = [(RootNavigationController *)self->_rootNavigationController topMainViewControllerContainer];
        [v4 sceneTitle];
      uint64_t v5 = };
    }
    id v8 = (id)v5;

    unsigned int v6 = [(CalendarSceneManager *)self mobileCalWindow];
    double v7 = [v6 windowScene];
    [v7 setTitle:v8];
  }
}

- (void)_restoreSelectedCalendarsFromPreferenceIfNeeded
{
  if (!self->_finishedSetup)
  {
    [(CalendarSceneManager *)self __restoreSelectedCalendarsFromPreferences];
    self->_finishedSetup = 1;
  }
}

- (void)_extendedLaunchDidComplete
{
  +[CalMCSignpost endLaunchToView:[(RootNavigationController *)self->_rootNavigationController currentViewType] extended:1];
  self->_BOOL sceneHasCompletedExtendedLaunch = 1;
  [(CUIKCalendarModel *)self->_model startNotificationMonitor];
  model = self->_model;

  [(CUIKCalendarModel *)model checkLocationAuthorizationAndAllowEventLocationPrediction];
}

+ (BOOL)isSceneCalendarAppScene:(id)a3
{
  id v3 = [a3 delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (RootNavigationController)rootNavigationController
{
  return self->_rootNavigationController;
}

- (void)handleURL:(id)a3 context:(id)a4
{
  self->_launchedFromURLOrActivity = 1;
  [(MainWindowRootViewController *)self->_rootViewController handleURL:a3 context:a4];
}

- (void)setLaunchedFromURLOrActivity
{
  self->_launchedFromURLOrActivity = 1;
}

- (void)_showDate:(id)a3 inView:(unint64_t)a4
{
  id v6 = a3;
  double v7 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543362;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager showDate inView with date %{public}@", (uint8_t *)&v19, 0xCu);
  }
  id v8 = [(CUIKCalendarModel *)self->_model calendar];
  id v9 = [v8 timeZone];
  id v10 = +[EKCalendarDate calendarDateWithDate:v6 timeZone:v9];

  switch(a4)
  {
    case 1uLL:
      int v11 = 0;
      char v12 = 0;
      uint64_t v13 = 3;
      break;
    case 2uLL:
      char v12 = 0;
      int v11 = 1;
      uint64_t v13 = 2;
      break;
    case 3uLL:
    case 6uLL:
      int v11 = 0;
      char v12 = 0;
      uint64_t v13 = 1;
      break;
    case 4uLL:
      int v11 = 0;
      char v12 = 0;
      uint64_t v13 = 0;
      break;
    case 5uLL:
      int v11 = 0;
      char v12 = 0;
      uint64_t v13 = 4;
      break;
    default:
      int v11 = 0;
      uint64_t v13 = -1;
      char v12 = 1;
      break;
  }
  long long v14 = [(RootNavigationController *)self->_rootNavigationController traitCollection];
  uint64_t v15 = v14;
  if (v11)
  {
    if ([v14 horizontalSizeClass] == (id)1 && objc_msgSend(v15, "verticalSizeClass") == (id)2)
    {
      id v16 = [(CalendarSceneManager *)self model];
      id v17 = [v16 numDaysToShow];

      if (v17 == (id)1) {
        uint64_t v13 = 3;
      }
      else {
        uint64_t v13 = 2;
      }
    }
    else
    {
      uint64_t v13 = 2;
    }
    goto LABEL_19;
  }
  if ((v12 & 1) == 0)
  {
LABEL_19:
    id v18 = [(RootNavigationController *)self->_rootNavigationController pushCalendarViewControllerWithViewType:v13 andDate:v10];
    goto LABEL_20;
  }
  [(RootNavigationController *)self->_rootNavigationController showDate:v10 animated:1];
LABEL_20:
}

- (void)_showEvent:(id)a3 inView:(unint64_t)a4
{
}

- (void)diagnosticsViewControllerDidDismiss
{
  id v3 = [(CalendarSceneManager *)self diagnosticsViewController];
  [v3 setDelegate:0];

  [(CalendarSceneManager *)self setDiagnosticsViewController:0];
}

- (void)showDebugMenu
{
  id v3 = [(CalendarSceneManager *)self diagnosticsViewController];

  if (!v3 && objc_opt_class())
  {
    id v4 = objc_alloc_init((Class)CalendarDiagnosticsUIViewController);
    [(CalendarSceneManager *)self setDiagnosticsViewController:v4];

    uint64_t v5 = [(CalendarSceneManager *)self diagnosticsViewController];
    [v5 setDelegate:self];

    id v7 = [(CalendarSceneManager *)self rootNavigationController];
    id v6 = [(CalendarSceneManager *)self diagnosticsViewController];
    [v7 presentViewController:v6 animated:1 completion:0];
  }
}

- (void)_stateRestoreSelectedCalendarsFromUserActivity:(id)a3
{
  id v4 = a3;
  if ([(CalendarSceneManager *)self _isUserActivityForStateRestoration:v4])
  {
    if (([UIApp launchedToTest] & 1) == 0)
    {
      uint64_t v5 = +[NSMutableSet set];
      id v6 = [v4 userInfo];
      id v7 = [v6 objectForKeyedSubscript:@"_UserActivityStateRestore_InvisibleCalendars"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v9 = [v8 countByEnumeratingWithState:&v61 objects:v71 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v62;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v62 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v61 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v5 addObject:v13];
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v61 objects:v71 count:16];
          }
          while (v10);
        }
      }
      v51 = v7;
      v52 = self;
      long long v14 = [(CUIKCalendarModel *)self->_model eventStore];
      uint64_t v15 = [v14 calendarsForEntityType:0];

      id v16 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v5 count]);
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v17 = v15;
      id v18 = [v17 countByEnumeratingWithState:&v57 objects:v70 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v58;
        do
        {
          for (j = 0; j != v19; j = (char *)j + 1)
          {
            if (*(void *)v58 != v20) {
              objc_enumerationMutation(v17);
            }
            unsigned __int8 v22 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
            v23 = [v22 calendarIdentifier];
            unsigned int v24 = [v5 containsObject:v23];

            if (v24) {
              [v16 addObject:v22];
            }
          }
          id v19 = [v17 countByEnumeratingWithState:&v57 objects:v70 count:16];
        }
        while (v19);
      }

      id v25 = [v5 count];
      if (v25 != [v16 count])
      {
        char v26 = (void *)kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
        {
          long long v27 = v26;
          id v28 = [v5 count];
          id v29 = [v16 count];
          *(_DWORD *)buf = 134218240;
          id v67 = v28;
          __int16 v68 = 2048;
          id v69 = v29;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Calendar state restoration: tried to restore %lu invisible calendars, but only found %lu.", buf, 0x16u);
        }
      }
      long long v30 = (void *)kCalUILogHandle;
      BOOL v31 = v52;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      {
        v32 = v30;
        id v33 = [v16 count];
        *(_DWORD *)buf = 134217984;
        id v67 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Calendar state restoration: restoring unselected calendars: %tu", buf, 0xCu);
      }
      [(CUIKCalendarModel *)v52->_model setUnselectedCalendars:v16];
      long long v34 = +[NSMutableSet set];
      id v35 = [v4 userInfo];
      long long v36 = [v35 objectForKeyedSubscript:@"_UserActivityStateRestore_CollapsedSectionIdentifiers"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v49 = v36;
        id v50 = v4;
        id v37 = v36;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v38 = [v37 countByEnumeratingWithState:&v53 objects:v65 count:16];
        if (v38)
        {
          id v39 = v38;
          uint64_t v40 = *(void *)v54;
          do
          {
            for (k = 0; k != v39; k = (char *)k + 1)
            {
              if (*(void *)v54 != v40) {
                objc_enumerationMutation(v37);
              }
              uint64_t v42 = *(void *)(*((void *)&v53 + 1) + 8 * (void)k);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v34 addObject:v42];
              }
            }
            id v39 = [v37 countByEnumeratingWithState:&v53 objects:v65 count:16];
          }
          while (v39);
        }

        long long v36 = v49;
        id v4 = v50;
        BOOL v31 = v52;
      }
      -[CUIKCalendarModel setCollapsedSectionIdentifiers:](v31->_model, "setCollapsedSectionIdentifiers:", v34, v49, v50);
      int v43 = +[EKCalendarVisibilityManager unselectedCalendarIdentifiersForFocusMode];

      if (v43)
      {
        v44 = [v4 userInfo];
        __int16 v45 = [v44 objectForKeyedSubscript:@"_UserActivityStateRestore_FocusFilterMode"];

        id v46 = [v45 integerValue];
        if ((unint64_t)v46 <= 1) {
          uint64_t v47 = 1;
        }
        else {
          uint64_t v47 = (uint64_t)v46;
        }
        [(CUIKCalendarModel *)v31->_model setFocusFilterMode:v47];
      }
      v31->_finishedSetup = 1;
    }
  }
  else
  {
    v48 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Calendar state restoration (selected calendars): currently ignoring user activity that does not have a state restoration flag.", buf, 2u);
    }
  }
}

- (void)_refreshAccountListAndViewContentsIfNeededForModel:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FEEDC;
  block[3] = &unk_1001D2740;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (BOOL)_shouldMaintainToday
{
  id v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Determining whether to maintain today on next resume (assuming timeout is expired).", (uint8_t *)&v13, 2u);
  }
  id v4 = CUIKNowDate();
  if ([(CalendarSceneManager *)self _areMultipleScenesOpen])
  {
    BOOL v5 = [(RootNavigationController *)self->_rootNavigationController isDateVisible:v4];
    uint64_t v6 = kCalUILogHandle;
    if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    int v13 = 67109120;
    BOOL v14 = v5;
    id v7 = "Multiple scenes present, today visible = %d.";
    id v8 = v6;
    uint32_t v9 = 8;
  }
  else
  {
    uint64_t v10 = kCalUILogHandle;
    BOOL v5 = 1;
    if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    LOWORD(v13) = 0;
    id v7 = "Single scene, should always maintain today. Not bothering to check if today is visible.";
    id v8 = v10;
    uint32_t v9 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v13, v9);
LABEL_9:
  uint64_t v11 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    int v13 = 67109120;
    BOOL v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "should maintain today double result = %d", (uint8_t *)&v13, 8u);
  }

  return v5;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  BOOL v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager sceneDidDisconnect: %@", buf, 0xCu);
  }
  long long v34 = v4;
  [(MobileCalWindow *)self->_mobileCalWindow setHidden:1];
  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:CUIKCalendarModelIdentityChangedNotification object:self->_model];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:CUIKCalendarModelDelegatesChangedNotification object:self->_model];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = +[UIApplication sharedApplication];
  uint32_t v9 = [v8 connectedScenes];

  id v10 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([(id)objc_opt_class() isSceneCalendarAppScene:v14])
        {
          uint64_t v15 = [v14 _sceneIdentifier];
          id v16 = [(CalendarSceneManager *)self mobileCalWindow];
          id v17 = [v16 windowScene];
          id v18 = [v17 _sceneIdentifier];
          unsigned int v19 = [v15 isEqualToString:v18];

          if (!v19)
          {

            BOOL v31 = (void *)kCalUILogHandle;
            v23 = v34;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
            {
              v32 = v31;
              id v33 = [v34 _sceneIdentifier];
              *(_DWORD *)buf = 138412290;
              id v40 = v33;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "CalendarSceneManager Scene %@ disconnected", buf, 0xCu);
            }
            goto LABEL_17;
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v20 = [(CalendarSceneManager *)self rootNavigationController];
  id v21 = [v20 currentViewType];

  unsigned __int8 v22 = (void *)kCalUILogHandle;
  v23 = v34;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    unsigned int v24 = v22;
    id v25 = [v34 _sceneIdentifier];
    *(_DWORD *)buf = 138412546;
    id v40 = v25;
    __int16 v41 = 1024;
    int v42 = (int)v21;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "CalendarSceneManager Scene %@ disconnected, writing out last view mode: %d", buf, 0x12u);
  }
  char v26 = +[CUIKPreferences sharedPreferences];
  long long v27 = +[NSNumber numberWithInteger:v21];
  [v26 setLastViewMode:v27];

  unint64_t v28 = [(MainWindowRootViewController *)self->_rootViewController currentSidebarState];
  id v29 = +[CUIKPreferences sharedPreferences];
  long long v30 = +[NSNumber numberWithUnsignedInteger:v28];
  [v29 setLastSidebarMode:v30];

LABEL_17:
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  BOOL v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager sceneWillResignActive: %@", (uint8_t *)&v6, 0xCu);
  }
  self->_launchedFromURLOrActivity = 0;
  self->_BOOL maintainToday = [(CalendarSceneManager *)self _shouldMaintainToday];
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  BOOL v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager sceneDidEnterBackground: %@", (uint8_t *)&v6, 0xCu);
  }
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"_refreshAccountListAndViewContentsIfNeededForModel:" object:self->_model];
  [(RootNavigationController *)self->_rootNavigationController didEnterBackground];
  CUIKITriggerReminderSync();
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4 = a3;
  BOOL v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager stateRestorationActivityForScene: %@", buf, 0xCu);
  }
  if (self->_finishedSetup)
  {
    unint64_t v6 = [(RootNavigationController *)self->_rootNavigationController currentViewType];
    if (v6 > 4) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = qword_1001C1758[v6];
    }
    id v10 = [(CUIKCalendarModel *)self->_model selectedDate];
    id v11 = [v10 date];

    id v9 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.calendar.continuity.date_selection"];
    id v12 = objc_alloc((Class)CUIKUserActivityCalendarDate);
    int v13 = [(CUIKCalendarModel *)self->_model calendar];
    id v14 = [v12 initWithDate:v11 view:v7 calendar:v13];

    [v14 updateActivity:v9];
    uint64_t v15 = +[NSMutableDictionary dictionary];
    id v16 = +[NSNumber numberWithBool:1];
    [v15 setObject:v16 forKey:@"_UserActivityStateRestore_Flag"];

    id v17 = [(CUIKCalendarModel *)self->_model unselectedCalendarsIgnoringFocus];
    id v18 = [v17 valueForKey:@"calendarIdentifier"];

    [v15 setObject:v18 forKey:@"_UserActivityStateRestore_InvisibleCalendars"];
    unsigned int v19 = [(CUIKCalendarModel *)self->_model collapsedSectionIdentifiers];
    [v15 setObject:v19 forKey:@"_UserActivityStateRestore_CollapsedSectionIdentifiers"];

    uint64_t v20 = +[NSNumber numberWithUnsignedInteger:[(CUIKCalendarModel *)self->_model focusFilterMode]];
    [v15 setObject:v20 forKey:@"_UserActivityStateRestore_FocusFilterMode"];

    id v21 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];

    if (v21)
    {
      unsigned __int8 v22 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];
      v23 = [v22 sourceIdentifier];
      [v15 setObject:v23 forKey:@"_UserActivityStateRestore_SelectedSource"];
    }
    [(CalendarSceneManager *)self _addPersistedStateFromCalendarModelToDictionary:v15];
    unsigned int v24 = +[NSNumber numberWithBool:[(CalendarSceneManager *)self _shouldMaintainToday]];
    [v15 setObject:v24 forKey:@"_UserActivityStateRestore_MaintainToday_Key"];

    uint64_t v25 = [(CUIKCalendarModel *)self->_model selectedOccurrence];
    if (!v25) {
      goto LABEL_18;
    }
    char v26 = (void *)v25;
    id v39 = v18;
    id v27 = v14;
    id v28 = v4;
    id v29 = v11;
    long long v30 = [(CUIKCalendarModel *)self->_model selectedOccurrence];
    uint64_t v31 = [v30 uniqueID];
    if (v31)
    {
      v32 = (void *)v31;
      unsigned int v33 = [(RootNavigationController *)self->_rootNavigationController shouldSaveSelectedEvent];

      id v11 = v29;
      id v4 = v28;
      id v14 = v27;
      id v18 = v39;
      if (!v33)
      {
LABEL_18:
        long long v36 = CUIKNowDate();
        [v15 setObject:v36 forKey:@"_UserActivityStateRestore_Timestamp"];

        long long v37 = +[NSNumber numberWithUnsignedInteger:[(MainWindowRootViewController *)self->_rootViewController currentSidebarState]];
        [v15 setObject:v37 forKey:@"_UserActivityStateRestore_LastSidebarMode_Key"];

        [v9 addUserInfoEntriesFromDictionary:v15];
        goto LABEL_19;
      }
      long long v34 = [(CUIKCalendarModel *)self->_model selectedOccurrence];
      long long v35 = [v34 uniqueID];
      [v15 setObject:v35 forKey:@"_UserActivityStateRestore_SelectedOccurrenceUID_Key"];

      char v26 = [(CUIKCalendarModel *)self->_model selectedOccurrence];
      long long v30 = [v26 startDate];
      [v15 setObject:v30 forKey:@"_UserActivityStateRestore_SelectedOccurrenceDate_Key"];
    }
    else
    {
      id v4 = v28;
      id v14 = v27;
      id v18 = v39;
    }

    goto LABEL_18;
  }
  id v8 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager Don't attempt to save state. because setup is not finished yet. During stateRestorationActivityForScene %@", buf, 0xCu);
  }
  id v9 = 0;
LABEL_19:

  return v9;
}

- (void)_addPersistedStateFromCalendarModelToDictionary:(id)a3
{
  id v13 = a3;
  id v4 = [(CUIKCalendarModel *)self->_model persistedSceneState];
  BOOL v5 = v4;
  if (v4)
  {
    [v4 dayViewHourScale];
    if (v6 > 0.0)
    {
      [v5 dayViewHourScale];
      uint64_t v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v13 setObject:v7 forKey:@"_UserActivityStateRestore_DayHourScale_Key"];
    }
    [v5 weekViewHourScale];
    if (v8 > 0.0)
    {
      [v5 weekViewHourScale];
      id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v13 setObject:v9 forKey:@"_UserActivityStateRestore_WeekHourScale_Key"];
    }
    if (([v5 dayViewFirstVisibleSecond] & 0x80000000) == 0)
    {
      id v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 dayViewFirstVisibleSecond]);
      [v13 setObject:v10 forKey:@"_UserActivityStateRestore_DayViewFirstVisibleSecond_Key"];
    }
    id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 showDayAsList]);
    [v13 setObject:v11 forKey:@"_UserActivityStateRestore_ShowDayAsList_Key"];

    id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 showMonthAsDivided]);
    [v13 setObject:v12 forKey:@"_UserActivityStateRestore_ShowMonthAsDivided_Key"];
  }
}

- (BOOL)_isUserActivityForStateRestoration:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"_UserActivityStateRestore_Flag"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)_extractNumberFromUserActivity:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v7 = [v5 userInfo];
  double v8 = [v7 objectForKey:v6];

  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_5:
    double v8 = 0;
  }

  return v8;
}

- (void)_restoreModelPersistedStateFromUserActivity:(id)a3
{
  id v16 = a3;
  if ((EKUIShouldSaveStateInPreferences() & 1) == 0)
  {
    id v4 = [(CUIKCalendarModel *)self->_model persistedSceneState];
    id v5 = [(CalendarSceneManager *)self _extractNumberFromUserActivity:v16 forKey:@"_UserActivityStateRestore_ShowDayAsList_Key"];
    id v6 = [(CalendarSceneManager *)self _extractNumberFromUserActivity:v16 forKey:@"_UserActivityStateRestore_ShowMonthAsDivided_Key"];
    if (v5) {
      id v7 = [v5 BOOLValue];
    }
    else {
      id v7 = 0;
    }
    [v4 setShowDayAsList:v7];
    if (v6) {
      id v8 = [v6 BOOLValue];
    }
    else {
      id v8 = 0;
    }
    [v4 setShowMonthAsDivided:v8];
    id v9 = [(CalendarSceneManager *)self _extractNumberFromUserActivity:v16 forKey:@"_UserActivityStateRestore_DayHourScale_Key"];
    id v10 = [(CalendarSceneManager *)self _extractNumberFromUserActivity:v16 forKey:@"_UserActivityStateRestore_WeekHourScale_Key"];
    id v11 = [(CalendarSceneManager *)self _extractNumberFromUserActivity:v16 forKey:@"_UserActivityStateRestore_DayViewFirstVisibleSecond_Key"];
    double v12 = -1.0;
    double v13 = -1.0;
    if (v9) {
      [v9 doubleValue];
    }
    [v4 setDayViewHourScale:v13];
    if (v10)
    {
      [v10 doubleValue];
      double v12 = v14;
    }
    [v4 setWeekViewHourScale:v12];
    if (v11) {
      uint64_t v15 = (uint64_t)[v11 intValue];
    }
    else {
      uint64_t v15 = 0xFFFFFFFFLL;
    }
    [v4 setDayViewFirstVisibleSecond:v15];
  }
}

- (void)_restoreStateFromUserActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CalendarSceneManager *)self _isUserActivityForStateRestoration:v4];
  id v6 = kCalUILogHandle;
  BOOL v7 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calendar state restoration: currently ignoring user activity that does not have a state restoration flag.", buf, 2u);
    }
    goto LABEL_62;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calendar state restoration: starting restoration from user activity....", buf, 2u);
  }
  id v8 = +[CalendarSceneManager _applicationLastActiveTime];

  if (!v8)
  {
    id v21 = [v4 userInfo];
    id v17 = [v21 objectForKeyedSubscript:@"_UserActivityStateRestore_Timestamp"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v16 = 0;
      goto LABEL_18;
    }
    id v18 = v17;
    unsigned __int8 v22 = +[NSDate date];
    [v22 timeIntervalSinceDate:v18];
    double v24 = v23;
    [(CalendarSceneManager *)self _resumeToTodayTimeout];
    double v26 = v25;

    BOOL v16 = v24 > v26;
    if (v24 <= v26
      || (id v27 = (void *)kCalUILogHandle, !os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO)))
    {
LABEL_15:

LABEL_18:
      goto LABEL_19;
    }
    unsigned int v19 = v27;
    id v28 = +[NSDate date];
    [(CalendarSceneManager *)self _resumeToTodayTimeout];
    *(_DWORD *)buf = 138412802;
    *(void *)__int16 v68 = v18;
    *(_WORD *)&v68[8] = 2112;
    id v69 = v28;
    __int16 v70 = 1024;
    int v71 = (int)v29;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Calendar state restoration: user activity timestamp is outside the resume to today timeout. Last active time = %@, Now = %@, timeout = %d", buf, 0x1Cu);

LABEL_14:
    goto LABEL_15;
  }
  id v9 = +[NSDate date];
  id v10 = +[CalendarSceneManager _applicationLastActiveTime];
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;
  [(CalendarSceneManager *)self _resumeToTodayTimeout];
  double v14 = v13;

  if (v12 <= v14)
  {
    BOOL v16 = 0;
  }
  else
  {
    uint64_t v15 = (void *)kCalUILogHandle;
    BOOL v16 = 1;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      id v17 = v15;
      id v18 = +[CalendarSceneManager _applicationLastActiveTime];
      unsigned int v19 = +[NSDate date];
      [(CalendarSceneManager *)self _resumeToTodayTimeout];
      *(_DWORD *)buf = 138412802;
      *(void *)__int16 v68 = v18;
      *(_WORD *)&v68[8] = 2112;
      id v69 = v19;
      __int16 v70 = 1024;
      int v71 = (int)v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Calendar state restoration: last active time is outside the resume to today timeout. Last active time = %@, Now = %@, timeout = %d", buf, 0x1Cu);
      goto LABEL_14;
    }
  }
LABEL_19:
  if (![(CalendarSceneManager *)self _areMultipleScenesOpen]) {
    goto LABEL_24;
  }
  long long v30 = [v4 userInfo];
  uint64_t v31 = [v30 objectForKeyedSubscript:@"_UserActivityStateRestore_MaintainToday_Key"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_24;
  }
  unsigned int v32 = [v31 BOOLValue];
  self->_BOOL maintainToday = v32;

  if (v32)
  {
LABEL_24:
    uint64_t v34 = !v16;
    int v33 = 1;
    goto LABEL_25;
  }
  int v33 = 0;
  uint64_t v34 = 1;
LABEL_25:
  long long v35 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)__int16 v68 = v34;
    *(_WORD *)&v68[4] = 1024;
    *(_DWORD *)&v68[6] = v16;
    LOWORD(v69) = 1024;
    *(_DWORD *)((char *)&v69 + 2) = v33;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Calendar state restoration: restore selected date = %d (resumeTimeoutExpired = %d, BOOL maintainToday = %d)", buf, 0x14u);
  }
  [(CalendarSceneManager *)self _continueUserActivity:v4 restoreSelectedOccurrence:0 restoreSelectedDate:v34 restorationHandler:0];
  long long v36 = [v4 userInfo];
  long long v37 = [v36 objectForKeyedSubscript:@"_UserActivityStateRestore_SelectedSource"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_47;
  }
  id v38 = v37;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v39 = [(CUIKCalendarModel *)self->_model eventStore];
  id v40 = [v39 sources];

  id v41 = [v40 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (!v41)
  {
    id v48 = v40;
    goto LABEL_45;
  }
  id v42 = v41;
  long long v61 = v37;
  uint64_t v43 = *(void *)v63;
LABEL_30:
  uint64_t v44 = 0;
  while (1)
  {
    if (*(void *)v63 != v43) {
      objc_enumerationMutation(v40);
    }
    __int16 v45 = *(void **)(*((void *)&v62 + 1) + 8 * v44);
    id v46 = [v45 sourceIdentifier];
    if (![v46 isEqualToString:v38])
    {

      goto LABEL_37;
    }
    unsigned __int8 v47 = [v45 isEnabled];

    if (v47) {
      break;
    }
LABEL_37:
    if (v42 == (id)++v44)
    {
      id v42 = [v40 countByEnumeratingWithState:&v62 objects:v66 count:16];
      if (v42) {
        goto LABEL_30;
      }
      id v48 = v40;
      long long v37 = v61;
      goto LABEL_45;
    }
  }
  id v48 = v45;

  long long v37 = v61;
  if (!v48) {
    goto LABEL_46;
  }
  v49 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)__int16 v68 = v48;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Calendar state restoration: restoring selected identity: %@", buf, 0xCu);
  }
  [(CUIKCalendarModel *)self->_model updateSourceForSelectedIdentity:v48 selectedCalendars:0];
LABEL_45:

LABEL_46:
LABEL_47:
  if ((EKUIShouldSaveStateInPreferences() & 1) == 0)
  {
    id v50 = [v4 userInfo];
    v51 = [v50 objectForKeyedSubscript:@"_UserActivityStateRestore_SelectedOccurrenceUID_Key"];

    v52 = [v4 userInfo];
    long long v53 = [v52 objectForKeyedSubscript:@"_UserActivityStateRestore_SelectedOccurrenceDate_Key"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v54 = [(CUIKCalendarModel *)self->_model eventStore];
        long long v55 = [v54 allEventsWithUniqueId:v51 occurrenceDate:v53];

        if ([v55 count] == (id)1)
        {
          long long v56 = [v55 firstObject];
          selectedOccurrenceToRestoreAfterConnection = self->_selectedOccurrenceToRestoreAfterConnection;
          self->_selectedOccurrenceToRestoreAfterConnection = v56;
        }
        else
        {
          selectedOccurrenceToRestoreAfterConnection = self->_selectedOccurrenceToRestoreAfterConnection;
          self->_selectedOccurrenceToRestoreAfterConnection = 0;
        }
      }
    }
  }
  long long v58 = [v4 userInfo];
  long long v59 = [v58 objectForKeyedSubscript:@"_UserActivityStateRestore_LastSidebarMode_Key"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[MainWindowRootViewController setCurrentSidebarState:](self->_rootViewController, "setCurrentSidebarState:", [v59 unsignedIntegerValue]);
  }
  if (([UIApp launchedToTest] & 1) == 0) {
    self->_finishedSetup = 1;
  }
  long long v60 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Calendar state restoration: completed", buf, 2u);
  }

LABEL_62:
}

- (BOOL)_continueUserActivity:(id)a3 restoreSelectedOccurrence:(BOOL)a4 restoreSelectedDate:(BOOL)a5 restorationHandler:(id)a6
{
  BOOL v98 = a5;
  BOOL v99 = a4;
  id v8 = (char *)a3;
  id v103 = a6;
  id v9 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v112 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CalendarSceneManager was requested to continue the following user activity: [%@]", buf, 0xCu);
  }
  v101 = EKWeakLinkStringConstant();
  v100 = EKWeakLinkStringConstant();
  v102 = [v8 activityType];
  if (self->_showingSplashScreen)
  {
    id v10 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v112 = "-[CalendarSceneManager _continueUserActivity:restoreSelectedOccurrence:restoreSelectedDate:restorationHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "The splash screen is currently being shown.  Will delay execution of [%s] until the splash screen is dismissed.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    +[NSDate date];
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_10010153C;
    v104[3] = &unk_1001D55D0;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v105 = v11;
    objc_copyWeak(&v108, (id *)buf);
    v106 = v8;
    BOOL v109 = v99;
    BOOL v110 = v98;
    id v107 = v103;
    [(CalendarSceneManager *)self setSplashScreenCompletionAction:v104];

    objc_destroyWeak(&v108);
    objc_destroyWeak((id *)buf);
    BOOL v12 = 1;
    goto LABEL_73;
  }
  if ([v102 isEqualToString:v101])
  {
    double v13 = [v8 userInfo];
    double v14 = EKWeakLinkStringConstant();
    uint64_t v15 = [v13 objectForKey:v14];

    if (v15)
    {
      v96 = [v15 componentsSeparatedByString:@"."];
      BOOL v16 = [v96 firstObject];
      id v17 = [v16 stringByAppendingString:@"."];
      id v18 = [v15 stringByReplacingOccurrencesOfString:v17 withString:&stru_1001D6918];

      unsigned int v19 = [(CUIKCalendarModel *)self->_model eventStore];
      double v20 = [v19 calendarItemWithIdentifier:v16];

      id v21 = [(CUIKCalendarModel *)self->_model eventStore];
      unsigned __int8 v22 = [v20 objectID];
      [v18 doubleValue];
      double v23 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      double v24 = [v21 eventForObjectID:v22 occurrenceDate:v23];

      if (v24)
      {
        model = self->_model;
        double v26 = [v24 calendar];
        id v27 = [v26 source];
        [(CUIKCalendarModel *)model updateSourceForSelectedIdentity:v27 selectedCalendars:0];

        [(MainWindowRootViewController *)self->_rootViewController showEventAndCloseSidebarIfNeeded:v24 animated:0 showMode:1];
        int v28 = 1;
      }
      else
      {
        int v28 = 0;
      }
    }
    else
    {
      int v28 = 0;
    }

    BOOL v12 = v28 != 0;
LABEL_70:
    if (v99 || v98) {
      self->_launchedFromURLOrActivity = v12;
    }
    goto LABEL_73;
  }
  if ([v102 isEqualToString:v100])
  {
    double v29 = [v8 userInfo];
    long long v30 = EKWeakLinkStringConstant();
    uint64_t v31 = [v29 objectForKey:v30];

    [(MainWindowRootViewController *)self->_rootViewController continueSearchWithTerm:v31];
LABEL_56:
    BOOL v12 = 1;
    goto LABEL_70;
  }
  unsigned int v32 = [v8 interaction];
  BOOL v33 = v32 == 0;

  if (v33)
  {
    unsigned __int8 v47 = +[CUIKUserActivity activityForActivity:v8];
    id v48 = [v47 type];
    if (v48)
    {
      if (v48 == (id)4098)
      {
        id v58 = v47;
        long long v59 = self->_model;
        if (v99)
        {
          long long v60 = [(CUIKCalendarModel *)v59 eventStore];
          long long v61 = [v58 eventFromStore:v60];

          if (v61)
          {
            long long v62 = (void *)kCalUILogHandle;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
            {
              long long v63 = v62;
              long long v64 = [v61 calendar];
              long long v65 = [v64 source];
              unsigned int v66 = [v58 view];
              *(_DWORD *)buf = 138412802;
              v112 = (const char *)v61;
              __int16 v113 = 2112;
              v114 = v65;
              __int16 v115 = 1024;
              unsigned int v116 = v66;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "Calendar state restoration: restoring selected event (%@), event identity (%@) and view (%d)", buf, 0x1Cu);
            }
            id v67 = self->_model;
            __int16 v68 = [v61 calendar];
            id v69 = [v68 source];
            [(CUIKCalendarModel *)v67 updateSourceForSelectedIdentity:v69 selectedCalendars:0];

            -[CalendarSceneManager _showEvent:inView:](self, "_showEvent:inView:", v61, [v58 view]);
          }
        }
        else
        {
          id v88 = [(CUIKCalendarModel *)v59 selectedDate];
          long long v61 = [v88 date];

          long long v89 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEBUG, "Calendar state restoration: requested to not restore selected event, restoring to model selected date instead", buf, 2u);
          }
          long long v90 = (void *)kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            long long v91 = v90;
            unsigned int v92 = [v58 view];
            *(_DWORD *)buf = 138412546;
            v112 = (const char *)v61;
            __int16 v113 = 1024;
            LODWORD(v114) = v92;
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEBUG, "Calendar state restoration: restoring date (%@) and view (%d)", buf, 0x12u);
          }
          -[CalendarSceneManager _showDate:inView:](self, "_showDate:inView:", v61, [v58 view]);
        }
      }
      else
      {
        if (v48 != (id)4097)
        {
          BOOL v12 = 0;
LABEL_69:

          goto LABEL_70;
        }
        id v49 = v47;
        id v50 = [v49 view];
        if (v98)
        {
          v51 = [v49 date];
          if ([v49 isTomorrow])
          {
            v52 = +[NSCalendar currentCalendar];
            id v53 = objc_alloc_init((Class)NSDateComponents);
            [v53 setDay:1];
            long long v54 = CUIKTodayDate();
            uint64_t v55 = [v52 dateByAddingComponents:v53 toDate:v54 options:0];

            id v50 = 0;
            v51 = (void *)v55;
          }
          long long v56 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v112 = (const char *)v51;
            __int16 v113 = 1024;
            LODWORD(v114) = v50;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "Calendar state restoration: restoring date (%@) and view (%d)", buf, 0x12u);
          }
        }
        else
        {
          v85 = [(CUIKCalendarModel *)self->_model selectedDate];
          v51 = [v85 date];

          v86 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEBUG, "Calendar state restoration: requested to not restore date, restoring to model selected date instead", buf, 2u);
          }
          v87 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v112 = (const char *)v51;
            __int16 v113 = 1024;
            LODWORD(v114) = v50;
            _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "Calendar state restoration: restoring date (%@) and view (%d)", buf, 0x12u);
          }
        }
        [(CalendarSceneManager *)self _showDate:v51 inView:v50];
      }
    }
    BOOL v12 = 1;
    goto LABEL_69;
  }
  uint64_t v34 = [v8 interaction];
  long long v35 = [v34 intent];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v36 = v35;
    long long v37 = [v36 startDate];
    v97 = [v36 endDate];
    id v38 = [v36 allDay];
    unsigned int v94 = [v38 BOOLValue];

    if (v37)
    {
      id v39 = [v37 identifier];
      id v40 = [v39 componentsSeparatedByString:@"#"];

      unint64_t v41 = (unint64_t)[v40 count];
      if ((v41 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        id v42 = [v40 firstObject];
        [v42 doubleValue];
        uint64_t v43 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

        uint64_t v44 = [v40 objectAtIndexedSubscript:1];
        __int16 v45 = +[NSTimeZone timeZoneWithName:v44];

        __int16 v95 = +[EKCalendarDate calendarDateWithDate:v43 timeZone:v45];
        if (v41 == 3)
        {
          id v46 = [v40 lastObject];
        }
        else
        {
          id v46 = 0;
        }
      }
      else
      {
        id v46 = 0;
        __int16 v95 = 0;
      }
    }
    else
    {
      id v46 = 0;
      __int16 v95 = 0;
    }
    if (v97)
    {
      __int16 v70 = [v97 identifier];
      int v71 = [v70 componentsSeparatedByString:@"#"];

      if ([v71 count] == (id)2)
      {
        uint64_t v72 = [v71 firstObject];
        [v72 doubleValue];
        v73 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

        v74 = [v71 lastObject];
        BOOL v75 = +[NSTimeZone timeZoneWithName:v74];

        v76 = +[EKCalendarDate calendarDateWithDate:v73 timeZone:v75];
      }
      else
      {
        v76 = 0;
      }
    }
    else
    {
      v76 = 0;
    }
    v77 = [v36 locationName];

    if (v77)
    {
      v78 = [v36 locationName];
      v79 = +[EKStructuredLocation locationWithTitle:v78];

      id v80 = [v36 geolocation];
      v81 = [v80 location];
      [v79 setGeoLocation:v81];

      id v82 = [v36 locationAddress];
      [v79 setAddress:v82];
    }
    else
    {
      v79 = 0;
    }
    rootViewController = self->_rootViewController;
    id v84 = [v36 title];
    [(MainWindowRootViewController *)rootViewController showAddEventWithTitle:v84 startDate:v95 endDate:v76 location:v79 suggestionsKey:v46 allDay:v94];

    goto LABEL_56;
  }
  long long v57 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v112 = (const char *)v35;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Asked to continue unrecognized intent type: %@", buf, 0xCu);
  }

  BOOL v12 = 0;
LABEL_73:

  return v12;
}

- (BOOL)_isAnyWindowShowingDelegateCalendar
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 connectedScenes];

  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v8 = [v7 delegate];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v10 = [v7 delegate];
          id v11 = [v10 model];
          BOOL v12 = [v11 sourceForSelectedIdentity];

          if (v12)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v4;
}

- (void)_mainViewControllerDidRequestSceneTitleUpdate:(id)a3
{
  id v4 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];

  if (!v4)
  {
    [(CalendarSceneManager *)self _updateSceneTitle];
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5 = a4;
  if ((unint64_t)[v5 count] >= 2)
  {
    unsigned __int8 v22 = self;
    id v6 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Multiple URLs requested, only one will be opened. URLs:", buf, 2u);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          BOOL v12 = (void *)kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            double v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            long long v14 = v12;
            long long v15 = [v13 URL];
            *(_DWORD *)buf = 138412290;
            int v28 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "    %@", buf, 0xCu);
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v9);
    }

    self = v22;
  }
  long long v16 = [v5 anyObject];
  long long v17 = [v16 URL];
  id v18 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v19 = v18;
    double v20 = [(CalendarSceneManager *)self mobileCalWindow];
    id v21 = [v20 windowScene];
    *(_DWORD *)buf = 138412546;
    int v28 = v21;
    __int16 v29 = 2112;
    long long v30 = self;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Open URL requested. Scene: %@   SceneManager: %@", buf, 0x16u);
  }
  [(CalendarSceneManager *)self _openURL:v17];
}

- (void)_openURL:(id)a3
{
  id v4 = a3;
  id v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Opening URL %@", buf, 0xCu);
  }
  if (self->_showingSplashScreen)
  {
    id v6 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CalendarSceneManager _openURL:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "The splash screen is currently being shown.  Will delay execution of [%s] with URL [%@] until the splash screen is dismissed.", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    id v7 = +[NSDate date];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100101EC4;
    v28[3] = &unk_1001D55F8;
    id v8 = v4;
    id v29 = v8;
    id v9 = v7;
    id v30 = v9;
    objc_copyWeak(&v31, (id *)buf);
    [(CalendarSceneManager *)self setSplashScreenCompletionAction:v28];
    objc_destroyWeak(&v31);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    unsigned __int8 v27 = 0;
    id v8 = [(CalendarSceneManager *)self _eventURLFromLaunchURL:v4 isTravel:&v27];

    unsigned int v10 = +[CLLocationManager authorizationStatusForBundleIdentifier:0];
    if (!v27 || v10 - 1 >= 2)
    {
      id v11 = [(CalendarSceneManager *)self model];
      unsigned int v12 = [v11 currentlyLocked];

      if (v12)
      {
        objc_initWeak(&location, self);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        long long v35 = sub_100101FA0;
        id v36 = sub_100101FB0;
        id v37 = 0;
        double v13 = +[NSNotificationCenter defaultCenter];
        long long v14 = [(CalendarSceneManager *)self model];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100101FB8;
        v21[3] = &unk_1001D5620;
        objc_copyWeak(&v24, &location);
        uint64_t v15 = CUIKCalendarModelDidUnlockNotification;
        id v16 = v8;
        unsigned __int8 v25 = v27;
        id v22 = v16;
        long long v23 = buf;
        uint64_t v17 = [v13 addObserverForName:v15 object:v14 queue:0 usingBlock:v21];
        id v18 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v17;

        _Block_object_dispose(buf, 8);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
      else
      {
        uint64_t v32 = EKUIEventDetailsFromTravelAdvisoryContextKey;
        unsigned int v19 = +[NSNumber numberWithBool:v27];
        BOOL v33 = v19;
        double v20 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        [(CalendarSceneManager *)self handleURL:v8 context:v20];
      }
    }
  }
}

- (id)_eventURLFromLaunchURL:(id)a3 isTravel:(BOOL *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4) {
    *a4 = 0;
  }
  if (v5)
  {
    id v7 = [v5 query];
    if (v7)
    {
      id v17 = v7;
      id v8 = [v7 componentsSeparatedByString:@"?"];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            if ([*(id *)(*((void *)&v18 + 1) + 8 * i) isEqualToString:@"travel=true"])
            {
              if (a4) {
                *a4 = 1;
              }
              double v13 = [v6 absoluteString];
              long long v14 = [v13 stringByReplacingOccurrencesOfString:@"?travel=true" withString:&stru_1001D6918];

              uint64_t v15 = +[NSURL URLWithString:v14];

              id v6 = (void *)v15;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }

      id v7 = v17;
    }
  }

  return v6;
}

+ (id)_encodeIdentifier:(id)a3
{
  uint64_t v3 = qword_100216A18;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100216A18, &stru_1001D5640);
  }
  id v5 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:qword_100216A10];

  return v5;
}

- (void)_selectedIdentityDidUpdate:(id)a3
{
  id v4 = [a3 object];
  model = self->_model;

  if (v4 == model) {
    [(CalendarSceneManager *)self _updateSceneActivationConditions];
  }

  [(CalendarSceneManager *)self _updateSceneTitle];
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Scene failed to continue user activity with type: \"%@\", error: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  int v9 = (char *)a4;
  id v10 = a5;
  __int16 v11 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    unsigned __int8 v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "The application was requested to perform an action for the following shortcut item: [%@]", buf, 0xCu);
  }
  if (self->_showingSplashScreen)
  {
    id v12 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v25 = "-[CalendarSceneManager windowScene:performActionForShortcutItem:completionHandler:]";
      __int16 v26 = 2112;
      unsigned __int8 v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "The splash screen is currently being shown.  Will delay execution of [%s] with shortcut item [%@] until the splash screen is dismissed.", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    double v13 = +[NSDate date];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001027E8;
    v18[3] = &unk_1001D5668;
    long long v19 = v9;
    id v14 = v13;
    id v20 = v14;
    objc_copyWeak(&v23, (id *)buf);
    id v21 = v8;
    id v22 = v10;
    [(CalendarSceneManager *)self setSplashScreenCompletionAction:v18];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v15 = [v9 type];
    id v16 = [v15 isEqualToString:@"com.apple.mobilecal.addevent"];

    id v17 = kCalUILogHandle;
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        unsigned __int8 v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Received Add Event Springboard Quick Action '%@'.", buf, 0xCu);
      }
      [(MainWindowRootViewController *)self->_rootViewController showAddEvent];
    }
    else if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unrecognized Springboard Quick Action '%@'.", buf, 0xCu);
    }
    if (v10) {
      (*((void (**)(id, id))v10 + 2))(v10, v16);
    }
  }
}

- (void)_constructAndPresentSplashScreenFromViewController:(id)a3 window:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_receivedSplashScreenCompletedNotification" name:@"_CalendarSceneManagerDidCompleteSplashScreenNotification" object:0];

  int v9 = objc_alloc_init(SplashScreenViewController);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v9);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100102B68;
  v15[3] = &unk_1001D5690;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  v15[4] = self;
  [(SplashScreenViewController *)v9 setDoneBlock:v15];
  self->_showingSplashScreen = 1;
  id v10 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Presenting splash screen view controller: [%@]", buf, 0xCu);
  }
  EKUIPushFallbackSizingContextWithViewHierarchy();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100102E08;
  v12[3] = &unk_1001D4280;
  objc_copyWeak(&v14, &from);
  id v11 = v7;
  id v13 = v11;
  [v6 presentViewController:v9 animated:1 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_splashScreenDidDismissShouldNotify:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showingSplashScreen = 0;
  id v5 = [(CalendarSceneManager *)self splashScreenCompletionAction];

  if (v5)
  {
    id v6 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Executing delayed application request.", v9, 2u);
    }
    id v7 = [(CalendarSceneManager *)self splashScreenCompletionAction];
    v7[2]();

    [(CalendarSceneManager *)self setSplashScreenCompletionAction:0];
  }
  if (v3)
  {
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"_CalendarSceneManagerDidCompleteSplashScreenNotification" object:self];
  }
}

- (void)_receivedSplashScreenCompletedNotification
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"_CalendarSceneManagerDidCompleteSplashScreenNotification" object:0];

  if (self->_showingSplashScreen)
  {
    id v4 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Received notification that splash screen view controller completed, dismissing.", buf, 2u);
    }
    rootNavigationController = self->_rootNavigationController;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001030BC;
    v6[3] = &unk_1001D2740;
    v6[4] = self;
    [(RootNavigationController *)rootNavigationController dismissViewControllerAnimated:1 completion:v6];
  }
}

- (MainWindowRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (id)splashScreenCompletionAction
{
  return self->_splashScreenCompletionAction;
}

- (void)setSplashScreenCompletionAction:(id)a3
{
}

- (CalendarDiagnosticsUIViewController)diagnosticsViewController
{
  return self->_diagnosticsViewController;
}

- (void)setDiagnosticsViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsViewController, 0);
  objc_storeStrong(&self->_splashScreenCompletionAction, 0);
  objc_storeStrong((id *)&self->_selectedOccurrenceToRestoreAfterConnection, 0);
  objc_storeStrong((id *)&self->_shortcutItemToRunAfterConnection, 0);
  objc_storeStrong((id *)&self->_userActivitiesToContinueAfterConnection, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_rootNavigationController, 0);
  objc_storeStrong((id *)&self->_mobileCalWindow, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end