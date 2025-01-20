@interface FRAppDelegate
+ (BOOL)shouldHideHeadline:(id)a3;
+ (id)sharedDelegate;
+ (id)stateRestorationURL;
+ (void)registerDefaults;
- (BOOL)appOpenedByUserActivity;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)inPreviewMode;
- (BOOL)isDeviceLocked;
- (BOOL)safeIsAppRunningInBackground;
- (FCAMSPushHandler)amsPushHandler;
- (FCAccountActionQueue)accountActionQueue;
- (FCCloudContext)cloudContext;
- (FCNetworkBehaviorMonitor)networkBehaviorMonitor;
- (FCOfflineModeMonitor)offlineModeMonitor;
- (FRAppActivityMonitor)activityMonitor;
- (FRAppDelegate)init;
- (FRApplicationUpdateNotifier)applicationUpdateNotifier;
- (FRBackgroundFetchManager)backgroundFetchManager;
- (FRFeldsparContext)feldsparContext;
- (FRFlintDataProviderFactory)dataProviderFactory;
- (FRFlintEmbedConfigurationManager)embedConfigurationManager;
- (FRNotificationManager)notificationManager;
- (FRPrivateDataUpdateCoordinator)privateDataUpdateCoordinator;
- (FRTodayAgent)todayAgent;
- (FRURLRouterManagerType)urlRouterManager;
- (NSArray)assemblies;
- (NSArray)bundleAssemblies;
- (NSTimer)handoffStreamsTimer;
- (TFBridgedContainer)bridgedContainer;
- (TFDiagnosticFileCollector)diagnosticFileCollector;
- (TFResolver)resolver;
- (TSAppDelegate)bridgedAppDelegate;
- (TSBackgroundFetchScheduler)backgroundFetchScheduler;
- (TSLocalDraftsDeviceManager)deviceManager;
- (TUKeyboardInputMonitor)keyboardInputMonitor;
- (UIAlertController)pinAlertController;
- (double)_timeSinceLastActivation;
- (id)_extractWidgetEngagementFromReferralURL:(id)a3;
- (id)createCarPlaySceneContainer;
- (id)createSceneContainer;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)gizmoSyncManager:(id)a3 fetchOperationForArticleIDs:(id)a4;
- (id)setupAnalyticsReferralWithOptions:(id)a3;
- (id)setupDestructiveDataAction;
- (int)fcDigestModeFromScheduledDeliverySetting:(int64_t)a3;
- (void)_application:(id)a3 openURL:(id)a4 options:(id)a5 animated:(BOOL)a6;
- (void)_configureBackgroundFetch;
- (void)_didCommitFirstFrame;
- (void)_didResumeLowPriorityTasks;
- (void)_updateBackgroundFetchSettingsWithAppConfiguration:(id)a3;
- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4;
- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5;
- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4;
- (void)application:(id)a3 didSendEvent:(id)a4;
- (void)application:(id)a3 handleIntent:(id)a4 completionHandler:(id)a5;
- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4;
- (void)buildMenuWithBuilder:(id)a3;
- (void)clearOldCacheItemsWithFeldsparContext:(id)a3;
- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4;
- (void)dealloc;
- (void)hideAlert:(id)a3;
- (void)localDraftsDeviceOnPreview:(id)a3 articleIdentifier:(id)a4 channelIdentifier:(id)a5;
- (void)prepareAppCacheSnapShot;
- (void)registerForDeviceLockNotifications;
- (void)resolveAppSingletons;
- (void)sceneDidBecomeActive;
- (void)sceneDidEnterBackground;
- (void)sceneWillEnterForeground;
- (void)scheduleTasksWithOptions:(id)a3;
- (void)setAccountActionQueue:(id)a3;
- (void)setActivityMonitor:(id)a3;
- (void)setAmsPushHandler:(id)a3;
- (void)setAppOpenedByUserActivity:(BOOL)a3;
- (void)setApplicationUpdateNotifier:(id)a3;
- (void)setAssemblies:(id)a3;
- (void)setBackgroundFetchManager:(id)a3;
- (void)setBackgroundFetchScheduler:(id)a3;
- (void)setBridgedAppDelegate:(id)a3;
- (void)setBridgedContainer:(id)a3;
- (void)setBundleAssemblies:(id)a3;
- (void)setCloudContext:(id)a3;
- (void)setDataProviderFactory:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setDiagnosticFileCollector:(id)a3;
- (void)setEmbedConfigurationManager:(id)a3;
- (void)setFeldsparContext:(id)a3;
- (void)setHandoffStreamsTimer:(id)a3;
- (void)setInPreviewMode:(BOOL)a3;
- (void)setIsDeviceLocked:(BOOL)a3;
- (void)setKeyboardInputMonitor:(id)a3;
- (void)setNetworkBehaviorMonitor:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setOfflineModeMonitor:(id)a3;
- (void)setPinAlertController:(id)a3;
- (void)setPrivateDataUpdateCoordinator:(id)a3;
- (void)setResolver:(id)a3;
- (void)setRunningPPTWithApplication:(id)a3;
- (void)setTodayAgent:(id)a3;
- (void)setUrlRouterManager:(id)a3;
- (void)setupAnalyticsControllerWithFeldsparContext:(id *)a3 versionHelpers:(id)a4 referral:(id)a5;
- (void)setupCloudContextWithAppActivityMonitor:(id)a3 dataActionProvider:(id)a4 versionHelpers:(id)a5 configurationManager:(id)a6 networkBehaviorMonitor:(id)a7 networkReachability:(id)a8;
- (void)setupCloudContextWithFavoritesPersonalizer:(id)a3 state:(int64_t)a4 launchOptions:(id)a5 versionHelpers:(id)a6 referral:(id)a7;
- (void)setupLanguages;
- (void)setupNotificationManagerWithFeldsparContext:(id *)a3;
- (void)setupUserDefaultsForPPT;
- (void)showAlertWithPin:(id)a3 pin:(id)a4;
- (void)showAppUnsupportedAlert;
- (void)unregisterForDeviceLockNotifications;
- (void)validateCommand:(id)a3;
@end

@implementation FRAppDelegate

- (FRAppDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)FRAppDelegate;
  v2 = [(FRAppDelegate *)&v6 init];
  if (v2)
  {
    v3 = (TSAppDelegate *)objc_alloc_init((Class)TSAppDelegate);
    bridgedAppDelegate = v2->_bridgedAppDelegate;
    v2->_bridgedAppDelegate = v3;
  }
  return v2;
}

- (void)_updateBackgroundFetchSettingsWithAppConfiguration:(id)a3
{
  id v9 = [a3 prefetchConfig];
  if ([v9 isBackgroundFetchEnabled])
  {
    [v9 minimumBackgroundFetchInterval];
    double v5 = v4;
    objc_super v6 = [(FRAppDelegate *)self backgroundFetchScheduler];
    if (v5 <= 0.0) {
      double v7 = UIApplicationBackgroundFetchIntervalMinimum;
    }
    else {
      [v9 minimumBackgroundFetchInterval];
    }
    v8 = v6;
  }
  else
  {
    v8 = [(FRAppDelegate *)self backgroundFetchScheduler];
    objc_super v6 = v8;
    double v7 = UIApplicationBackgroundFetchIntervalNever;
  }
  [v8 setMinimumBackgroundFetchInterval:v7];
}

- (id)createSceneContainer
{
  v2 = [(FRAppDelegate *)self bridgedAppDelegate];
  v3 = [v2 createSceneContainer];

  return v3;
}

+ (id)stateRestorationURL
{
  v2 = FCURLForContainerizedUserAccountHomeDirectory();
  v3 = [v2 URLByAppendingPathComponent:@"Saved Application State/com.apple.news.savedState/data.data"];

  return v3;
}

- (void)scheduleTasksWithOptions:(id)a3
{
  id v3 = a3;
  +[FCTaskScheduler pushHighPriorityTaskInFlight];
  +[FCTaskScheduler pushHighPriorityTaskInFlight];
  double v4 = [v3 objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];

  if (v4)
  {
    +[FCTaskScheduler disableOptionalPrefetching];
  }
}

- (void)clearOldCacheItemsWithFeldsparContext:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003BE0C;
  v4[3] = &unk_1000C5680;
  id v5 = a3;
  id v3 = v5;
  +[FCTaskScheduler scheduleLowPriorityBlock:v4];
}

- (void)sceneWillEnterForeground
{
  id v3 = [(FRAppDelegate *)self resolver];
  double v4 = [v3 resolveProtocol:&OBJC_PROTOCOL___AAViewingSessionManagerType name:@"Issue"];

  [v4 endActiveViewingSession];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018854;
  block[3] = &unk_1000C5680;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)registerForDeviceLockNotifications
{
  v2 = self;
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000517F8;
  handler[3] = &unk_1000C8E08;
  objc_copyWeak(&v6, &location);
  handler[4] = v2;
  LODWORD(v2) = notify_register_dispatch("com.apple.springboard.lockstate", &v2->lockStateToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  if (v2)
  {
    double v4 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
      sub_1000779D4(v4);
    }
  }
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (double)_timeSinceLastActivation
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"lastActivationDate"];

  if (v3)
  {
    double v4 = +[NSDate date];
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.79769313e308;
  }

  return v6;
}

+ (void)registerDefaults
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v8[0] = @"reset_identifier";
  v8[1] = FCWhitetailOnboardingNeededKey;
  v9[0] = &__kCFBooleanFalse;
  v9[1] = &__kCFBooleanTrue;
  v8[2] = @"use-label-cells";
  v8[3] = FCEnableSolitaireGrouping;
  v9[2] = &__kCFBooleanTrue;
  v9[3] = &__kCFBooleanTrue;
  id v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];
  [v2 registerDefaults:v3];

  double v4 = NewsCoreUserDefaults();
  uint64_t v6 = FCAudioConfigEnabledSharedPreferenceKey;
  double v7 = &__kCFBooleanTrue;
  double v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v4 registerDefaults:v5];
}

- (void)setupNotificationManagerWithFeldsparContext:(id *)a3
{
  id v4 = *a3;
  id v5 = objc_alloc_init((Class)FCAMSPushHandler);
  [(FRAppDelegate *)self setAmsPushHandler:v5];

  uint64_t v6 = [[FRNotificationManager alloc] initWithFeldsparContext:v4];
  [(FRAppDelegate *)self setNotificationManager:v6];

  id v7 = [(FRAppDelegate *)self notificationManager];
  [v4 setNotificationManager:v7];
}

- (void)setupLanguages
{
  v2 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting up languages", buf, 2u);
  }
  id v3 = +[NSLocale _globalPreferredLanguages];
  id v4 = +[NSBundle preferredLocalizationsFromArray:&off_1000CFA08 forPreferences:v3];
  id v5 = [v4 firstObject];

  uint64_t v6 = @"en-US";
  if (v5) {
    uint64_t v6 = v5;
  }
  id v7 = v6;
  v8 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found preferred language: %{public}@, setting language as %{public}@", buf, 0x16u);
  }
  id v9 = +[NSUserDefaults standardUserDefaults];
  v11 = v7;
  v10 = +[NSArray arrayWithObjects:&v11 count:1];
  [v9 setObject:v10 forKey:@"AppleLanguages"];
}

- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4
{
  id v5 = (unsigned int *)[a4 bytes];
  uint64_t v6 = +[NSString stringWithFormat:@"%08X%08X%08X%08X%08X%08X%08X%08X", bswap32(*v5), bswap32(v5[1]), bswap32(v5[2]), bswap32(v5[3]), bswap32(v5[4]), bswap32(v5[5]), bswap32(v5[6]), bswap32(v5[7])];
  id v7 = FCPushNotificationsLog;
  if (os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Successfully registered for remote notifications with deviceToken: %@", buf, 0xCu);
  }
  objc_opt_class();
  v8 = [(FRAppDelegate *)self feldsparContext];
  id v9 = FCDynamicCast();

  v10 = +[UNUserNotificationCenter currentNotificationCenter];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A188;
  v13[3] = &unk_1000C8E30;
  v13[4] = self;
  id v14 = v9;
  id v15 = v6;
  id v11 = v6;
  id v12 = v9;
  [v10 getNotificationSettingsWithCompletionHandler:v13];
}

- (void)_didCommitFirstFrame
{
  id v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000079A8;
  block[3] = &unk_1000C5680;
  block[4] = self;
  dispatch_async(v3, block);

  +[NSURLRequest setupFeldsparUserAgent];
  id v4 = [(FRAppDelegate *)self feldsparContext];
  id v5 = [v4 cloudContext];
  uint64_t v6 = [v5 userInfo];
  [v6 maybeUpdateOnboardingVersion:&stru_1000C8CF0];

  id v7 = dispatch_get_global_queue(2, 0);
  dispatch_async(v7, &stru_1000C8D10);

  [(FRAppDelegate *)self _disableLoggingForUnsupportedControls];
  v8 = [(FRAppDelegate *)self bridgedAppDelegate];
  [v8 didCommitFirstFrame];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100050D84;
  v9[3] = &unk_1000C5680;
  void v9[4] = self;
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:v9];
  +[FCTaskScheduler popHighPriorityTaskInFlight];
}

- (id)setupAnalyticsReferralWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:];
  v21 = self;
  if (objc_msgSend(v5, "nss_isNewsURL"))
  {
    uint64_t v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setBool:0 forKey:FCWhitetailOnboardingNeededKey];

    [v5 fr_campaignID];
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v5 fr_campaignType];
    v8 = [v5 fr_creativeID];
    id v9 = [v5 fr_widgetModeGroupID];
    v10 = [(FRAppDelegate *)self _extractWidgetEngagementFromReferralURL:v5];
    if (objc_msgSend(v5, "fr_isFeldsparReferableURL"))
    {
      id v11 = [v5 absoluteString];
      id v12 = 0;
      LOBYTE(v13) = 1;
    }
    else
    {
      id v11 = 0;
      LOBYTE(v13) = 0;
      id v12 = 0;
    }
    uint64_t v15 = 4;
  }
  else
  {
    v13 = [v4 objectForKeyedSubscript:UIApplicationLaunchOptionsUserActivityDictionaryKey];

    if (v13)
    {
      id v14 = [v4 objectForKeyedSubscript:UIApplicationLaunchOptionsUserActivityDictionaryKey];
      id v22 = NSSSafariSearchCampaignID;
      id v12 = [v14 objectForKeyedSubscript:UIApplicationLaunchOptionsUserActivityTypeKey];

      id v11 = 0;
      id v9 = 0;
      v10 = 0;
      uint64_t v15 = 0;
      v8 = 0;
      id v7 = 0;
      LOBYTE(v13) = 1;
    }
    else
    {
      id v11 = 0;
      id v9 = 0;
      v10 = 0;
      uint64_t v15 = 0;
      id v12 = 0;
      v8 = 0;
      id v7 = 0;
      id v22 = 0;
    }
  }
  if (objc_msgSend(v5, "fr_articleOpenedFrom") == (id)2)
  {
    uint64_t v15 = 12;
  }
  else if ([v12 isEqualToString:CSSearchableItemActionType])
  {
    uint64_t v15 = 7;
  }
  else if (objc_msgSend(v5, "fr_isFromSafariSearchWithSourceApplication:", 0))
  {
    uint64_t v15 = 9;
  }
  else if ([v22 isEqualToString:NSSSafariSearchCampaignID])
  {
    uint64_t v15 = 8;
  }
  LOBYTE(v20) = (_BYTE)v13;
  v16 = [[FRAnalyticsReferral alloc] initWithUserActivityType:v12 creativeID:v8 campaignID:v22 campaignType:v7 referringApplication:0 referringURL:v11 appOpenedByUserActivity:v20 widgetModeGroupID:v9 widgetEngagement:v10 appSessionStartMethod:v15 appSessionStartNotificationType:0];
  v17 = [v4 objectForKey:UIApplicationLaunchOptionsURLKey];
  v18 = v17;
  if (v17) {
    [v21 setInPreviewMode:[v17 fr_isPreviewURL]];
  }

  return v16;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[UIApplication sharedApplication];
  id v9 = [v8 key_window];

  v10 = [(FRAppDelegate *)self applicationUpdateNotifier];
  id v11 = [v9 rootViewController];
  [v10 setViewController:v11];

  id v12 = +[FCAppleAccount sharedAccount];
  id v13 = [v12 endpointConnectionClientID];

  id v14 = +[NSUserDefaults standardUserDefaults];
  [v14 setBool:1 forKey:@"hasLaunchedBefore"];

  +[WKBrowsingContextController registerSchemeForCustomProtocol:FCExcerptURLScheme];
  [(FRAppDelegate *)self performSelector:"_didCommitFirstFrame" withObject:0 afterDelay:0.0];
  uint64_t v15 = [(FRAppDelegate *)self bridgedAppDelegate];
  LOBYTE(v14) = [v15 application:v7 didFinishLaunchingWithOptions:v6];

  return (char)v14;
}

- (void)_configureBackgroundFetch
{
  id v3 = [(FRAppDelegate *)self feldsparContext];
  id v4 = [v3 cloudContext];

  id v5 = +[UIApplication sharedApplication];
  id v6 = [objc_alloc((Class)TSApplicationBackgroundFetchScheduler) initWithApplication:v5];
  [v6 prepareForUseWithApplicationDelegate:self];
  [(FRAppDelegate *)self setBackgroundFetchScheduler:v6];
  id v7 = [(FRAppDelegate *)self resolver];
  v8 = [v7 resolveClass:objc_opt_class()];
  [(FRAppDelegate *)self setBackgroundFetchManager:v8];

  id v9 = [(FRAppDelegate *)self backgroundFetchManager];

  if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100077AD4();
  }
  v10 = [v4 appConfigurationManager];
  [v10 addAppConfigObserver:self];
  id v11 = [v10 possiblyUnfetchedAppConfiguration];
  [(FRAppDelegate *)self _updateBackgroundFetchSettingsWithAppConfiguration:v11];
}

- (void)setupAnalyticsControllerWithFeldsparContext:(id *)a3 versionHelpers:(id)a4 referral:(id)a5
{
  id v7 = *a3;
  id v8 = a5;
  id v9 = [FRAnalyticsController alloc];
  v10 = [(FRAppDelegate *)self cloudContext];
  v18 = [(FRAnalyticsController *)v9 initWithCloudContext:v10];

  [v7 setAnalyticsController:v18];
  id v11 = +[UIApplication sharedApplication];
  id v12 = [v11 key_window];

  id v13 = [FRAppActivityMonitor alloc];
  id v14 = [(FRAppDelegate *)self cloudContext];
  uint64_t v15 = [v14 appActivityMonitor];
  v16 = [(FRAppDelegate *)self cloudContext];
  v17 = [(FRAppActivityMonitor *)v13 initWithAnalyticsController:v18 appActivityMonitor:v15 cloudContext:v16 window:v12];

  [(FRAppActivityMonitor *)v17 addObserver:self];
  [v7 setAppActivityMonitor:v17];

  [(FRAppActivityMonitor *)v17 setAppSessionStartReferral:v8];
  [(FRAppDelegate *)self setActivityMonitor:v17];
}

- (void)setupUserDefaultsForPPT
{
  id v5 = +[NSUserDefaults standardUserDefaults];
  v2 = +[FRPPTContext sharedContext];
  unsigned int v3 = [v2 isRunningPPT];

  id v4 = +[FRPPTContext sharedContext];
  [v4 d_logState];

  if (v3)
  {
    [v5 setBool:0 forKey:FCWhitetailOnboardingNeededKey];
    [v5 setBool:1 forKey:FCPeaceOnboardingCompletedKey];
  }
}

- (void)setRunningPPTWithApplication:(id)a3
{
  id v3 = a3;
  id v4 = +[FRPPTContext sharedContext];
  [v4 d_logState];

  id v5 = +[FRPPTContext sharedContext];
  id v6 = [v3 launchedToTest];

  [v5 setRunningPPT:v6];
  id v7 = +[FRPPTContext sharedContext];
  [v7 d_logState];

  id v12 = +[FRPPTContext sharedContext];
  if ([v12 isRunningPPT])
  {
    id v8 = NewsCoreUserDefaults();
    unsigned __int8 v9 = [v8 BOOLForKey:@"skip_hard_reset_on_ppt_runs"];

    if (v9) {
      return;
    }
    v10 = NewsCoreUserDefaults();
    unsigned __int8 v11 = [v10 BOOLForKey:@"skip_hard_reset_on_ppt_runs_sticky"];

    if (v11) {
      return;
    }
    id v12 = +[NSUserDefaults standardUserDefaults];
    [v12 setBool:1 forKey:@"hard_reset_news_on_next_launch"];
  }
}

- (NSArray)bundleAssemblies
{
  id v30 = objc_alloc_init((Class)SXFrameworkAssembly);
  v31[0] = v30;
  id v29 = objc_alloc_init((Class)NUApplicationFrameworkAssembly);
  v31[1] = v29;
  id v28 = objc_alloc_init((Class)TFTeaFoundationAssembly);
  v31[2] = v28;
  id v27 = objc_alloc_init((Class)TUAssembly);
  v31[3] = v27;
  id v26 = objc_alloc_init((Class)FCAssembly);
  v31[4] = v26;
  id v25 = objc_alloc_init((Class)NMAssembly);
  v31[5] = v25;
  id v24 = objc_alloc_init((Class)NYAssembly);
  v31[6] = v24;
  id v23 = objc_alloc_init((Class)NEAssembly);
  v31[7] = v23;
  id v3 = objc_alloc_init((Class)NAAssembly);
  v31[8] = v3;
  id v4 = objc_alloc_init((Class)NPAssembly);
  v31[9] = v4;
  id v5 = objc_alloc_init((Class)NXAssembly);
  v31[10] = v5;
  id v6 = objc_alloc_init((Class)NAPAssembly);
  v31[11] = v6;
  id v7 = objc_alloc((Class)TSFrameworkAssembly);
  v21 = self;
  id v8 = [(FRAppDelegate *)self feldsparContext];
  unsigned __int8 v9 = [v8 cloudContext];
  v10 = [v9 appConfigurationManager];
  id v11 = [v7 initWithNewsAppConfigurationManager:v10];
  v31[12] = v11;
  id v12 = objc_alloc_init((Class)SNAssembly);
  v31[13] = v12;
  id v13 = objc_alloc_init((Class)EGAssembly);
  v31[14] = v13;
  id v22 = +[NSArray arrayWithObjects:v31 count:15];

  if (FeldsparInternalExtrasEnabled())
  {
    id v14 = +[NSBundle fr_feldsparInternalExtrasBundle];
    [v14 load];

    id v15 = [v22 mutableCopy];
    id v16 = objc_alloc(NSClassFromString(@"FRInternalExtrasAssembly"));
    v17 = [(FRAppDelegate *)v21 feldsparContext];
    id v18 = [v16 initWithContext:v17];

    if (v18) {
      [v15 addObject:v18];
    }
    id v19 = objc_alloc_init(NSClassFromString(@"FRInternalExtrasBundleAssembly"));
    if (v19) {
      [v15 addObject:v19];
    }
  }
  else
  {
    id v15 = v22;
  }

  return (NSArray *)v15;
}

- (void)setupCloudContextWithAppActivityMonitor:(id)a3 dataActionProvider:(id)a4 versionHelpers:(id)a5 configurationManager:(id)a6 networkBehaviorMonitor:(id)a7 networkReachability:(id)a8
{
  id v55 = a3;
  id v49 = a8;
  id v50 = a7;
  id v13 = a6;
  id v51 = a5;
  id v14 = a4;
  uint64_t v15 = FRURLForNewsAppCachesDirectory();
  id v16 = +[FCContextConfiguration defaultConfiguration];
  v52 = +[FCFeldsparIDProvider sharedInstance];
  id v17 = objc_alloc((Class)FCCloudContext);
  id v18 = FRURLForNewsAppDocumentsDirectory();
  LOBYTE(a5) = +[FRMacros iPad];
  id v19 = +[UIApplication sharedApplication];
  uint64_t v20 = +[FCPrivateDataSyncAvailability defaultAvailability];
  v21 = +[FRPPTContext sharedContext];
  LOBYTE(v48) = (_BYTE)a5;
  v54 = (void *)v15;
  id v22 = [v17 initWithConfiguration:v16 configurationManager:v13 contentHostDirectory:v15 privateDataHostDirectory:v18 privateDataActionProvider:v14 networkBehaviorMonitor:v50 networkReachability:v49 appActivityMonitor:v55 desiredHeadlineFieldOptions:0xF87FFFFC1 feedUsage:6 deviceIsiPad:v48 backgroundTaskable:v19 privateDataSyncAvailability:v20 pptContext:v21 options:14];

  if (FeldsparInternalExtrasEnabled())
  {
    id v23 = +[NSBundle fr_feldsparInternalExtrasBundle];
    [v23 load];

    id v24 = objc_alloc(NSClassFromString(@"FREntitlementsOverrideProvider"));
    id v25 = [v22 configurationManager];
    id v26 = [v24 initWithConfigurationManager:v25];

    id v27 = FCProtocolCast();
    id v28 = [v22 purchaseController];
    [v28 setEntitlementsOverrideProvider:v27];

    id v29 = [v22 bundleSubscriptionManager];
    [v29 setEntitlementsOverrideProvider:v27];

    id v30 = objc_alloc_init(NSClassFromString(@"FRPurchaseFlowOverrideProvider"));
    v31 = FCProtocolCast();
    v32 = [v22 purchaseManager];
    [v32 setPurchaseFlowOverrideProvider:v31];
  }
  [v22 prewarmStores];
  +[TSTodayPrewarmManager prewarmTodayWithContext:v22];
  v33 = [v22 tagController];
  [v33 setShouldPrefetchGlobalTags:1];

  v34 = [v22 userInfo];
  [v52 registerUserInfo:v34];

  FRSetupLogging();
  v35 = [[FRApplicationUpdateNotifier alloc] initWithVersionHelpers:v51 appActivityMonitor:v55];

  [(FRApplicationUpdateNotifier *)v35 setup];
  [(FRAppDelegate *)self setApplicationUpdateNotifier:v35];
  v36 = +[UIApplication sharedApplication];
  [v36 registerForRemoteNotifications];

  v37 = +[NSUserDefaults standardUserDefaults];
  v38 = NewsCoreUserDefaults();
  id v39 = [v38 BOOLForKey:FCExcludeHiddenFeedsCurrentSharedPreferenceKey];

  if (v39 != [v37 BOOLForKey:@"previous_exclude_hidden_feeds"]) {
    [v37 setBool:v39 forKey:@"previous_exclude_hidden_feeds"];
  }
  v40 = +[NSUserDefaults standardUserDefaults];
  unsigned int v41 = [v40 BOOLForKey:FCShouldResetOnboardingVersion];

  if (v41)
  {
    v42 = +[NSUserDefaults standardUserDefaults];
    id v43 = [v42 integerForKey:FCOnboardingVersionToResetTo];

    if ((unint64_t)v43 <= 1)
    {
      if (!v43)
      {
        v44 = +[NSUserDefaults standardUserDefaults];
        [v44 setBool:0 forKey:@"has_passed_new_user_state"];
      }
      v45 = +[NSUserDefaults standardUserDefaults];
      [v45 setBool:1 forKey:FCWhitetailOnboardingNeededKey];
    }
    v46 = +[NSNumber numberWithInteger:v43];
    v47 = [v22 userInfo];
    [v47 setOnboardingVersionNumber:v46];
  }
  [(FRAppDelegate *)self setCloudContext:v22];
}

- (NSArray)assemblies
{
  id v3 = +[UIApplication sharedApplication];
  uint64_t v20 = [v3 key_window];

  id v4 = [FRCoreAssembly alloc];
  id v30 = [(FRAppDelegate *)self cloudContext];
  v32 = [(FRAppDelegate *)self cloudContext];
  id v29 = [v32 configurationManager];
  v31 = [(FRAppDelegate *)self cloudContext];
  id v28 = [v31 appActivityMonitor];
  id v27 = [(FRAppDelegate *)self networkBehaviorMonitor];
  id v26 = [(FRAppDelegate *)self offlineModeMonitor];
  id v25 = [(FRCoreAssembly *)v4 initWithCloudContext:v30 configurationManager:v29 appActivityMonitor:v28 networkBehaviorMonitor:v27 offlineModeMonitor:v26];
  v33[0] = v25;
  id v24 = objc_alloc_init(FRAnalyticsAssembly);
  v33[1] = v24;
  id v5 = [FRFeldsparContextAssembly alloc];
  id v23 = [(FRAppDelegate *)self feldsparContext];
  id v22 = [(FRAppDelegate *)self privateDataUpdateCoordinator];
  v21 = [(FRFeldsparContextAssembly *)v5 initWithContext:v23 privateDataUpdateCoordinator:v22];
  v33[2] = v21;
  id v6 = objc_alloc_init(FRFeedSubscriptionAssembly);
  v33[3] = v6;
  id v7 = [FREditorialAssembly alloc];
  id v8 = [(FRAppDelegate *)self feldsparContext];
  unsigned __int8 v9 = [(FRAppDelegate *)self dataProviderFactory];
  v10 = [(FREditorialAssembly *)v7 initWithFeldsparContext:v8 dataProviderFactory:v9];
  v33[4] = v10;
  id v11 = objc_alloc_init(FRHeadlineRendererAssembly);
  v33[5] = v11;
  id v12 = [FRRoutingAssembly alloc];
  id v13 = [(FRAppDelegate *)self feldsparContext];
  id v14 = [(FRAppDelegate *)self bridgedAppDelegate];
  uint64_t v15 = [(FRRoutingAssembly *)v12 initWithFeldsparContext:v13 bridgedAppDelegate:v14 window:v20];
  v33[6] = v15;
  id v16 = objc_alloc_init(FRHistoryAssembly);
  v33[7] = v16;
  id v17 = objc_alloc_init(FRLocalDraftsAssembly);
  v33[8] = v17;
  id v19 = +[NSArray arrayWithObjects:v33 count:9];

  return (NSArray *)v19;
}

- (id)setupDestructiveDataAction
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"hard_reset_news_on_next_launch"];

  if (v3)
  {
    id v4 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will perform hard reset because HardResetOnNextLaunch=true", buf, 2u);
    }
  }
  id v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"should_clear_cache_on_next_launch"];

  if (v6)
  {
    id v7 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will clear caches because ClearCacheOnNextLaunch=true", v29, 2u);
    }
  }
  id v8 = objc_opt_new();
  unsigned __int8 v9 = +[NSUserDefaults standardUserDefaults];
  unsigned int v10 = [v9 BOOLForKey:@"hard_reset_news_on_next_launch"];

  if (v10)
  {
    id v11 = objc_opt_new();
    id v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", FCContentEnvironmentSharedPreferenceKey, FCStorefrontSharedPreferenceKey, FCPPTTestNameKey, FCPersonalizationScriptKey, 0);
    id v13 = objc_alloc((Class)NSSUserDefaultsDataDestructionItem);
    id v14 = NewsCoreUserDefaults();
    id v15 = [v13 initWithUserDefaults:v14 domainName:FCDefaultsSuiteName stickyKeys:v12];

    [v8 addObject:v15];
    id v16 = objc_alloc((Class)NSSUserDefaultsDataDestructionItem);
    id v17 = NewsCoreSensitiveUserDefaults();
    uint64_t v18 = FCSensitiveDefaultsSuiteName;
    id v19 = +[NSSet set];
    id v20 = [v16 initWithUserDefaults:v17 domainName:v18 stickyKeys:v19];

    [v8 addObject:v20];
    if (NFInternalBuild())
    {
      uint64_t v21 = +[NSSet setWithObjects:@"news.onboarding.splash_screen.disable_splash_screen", @"news.modules.newsengagement.presentation.disable_all_presentations", 0];
    }
    else
    {
      uint64_t v21 = objc_opt_new();
    }
    id v22 = (void *)v21;
  }
  else
  {
    id v11 = objc_opt_new();
    id v22 = FRAppDefaultsDomainiCloudDataDestructionStickyKeys();
  }
  id v23 = objc_alloc((Class)NSSUserDefaultsDataDestructionItem);
  id v24 = +[NSUserDefaults standardUserDefaults];
  id v25 = [v23 initWithUserDefaults:v24 domainName:@"com.apple.news" stickyKeys:v22];

  [v8 addObject:v25];
  id v26 = [[FRDestructiveDataMigrationHandler alloc] initWithPrivateDataActionProvider:v11 defaultsDataDestructionItems:v8];
  [(FRDestructiveDataMigrationHandler *)v26 handleMigration];
  [(id)objc_opt_class() registerDefaults];
  id v27 = +[NSUserDefaults standardUserDefaults];
  [v27 setBool:1 forKey:@"NSAllowsDefaultLineBreakStrategy"];

  return v11;
}

- (void)setupCloudContextWithFavoritesPersonalizer:(id)a3 state:(int64_t)a4 launchOptions:(id)a5 versionHelpers:(id)a6 referral:(id)a7
{
  id v40 = a7;
  id v39 = a6;
  id v10 = a3;
  id v11 = objc_alloc_init(FRFeldsparContext);
  id v12 = [(FRAppDelegate *)self cloudContext];
  [(FRFeldsparContext *)v11 setCloudContext:v12];

  id v13 = [(FRAppDelegate *)self cloudContext];
  id v14 = [v13 readingHistory];
  [(FRFeldsparContext *)v11 setReadingHistory:v14];

  id v15 = [(FRAppDelegate *)self cloudContext];
  id v16 = [v15 readingList];
  [(FRFeldsparContext *)v11 setReadingList:v16];

  [(FRFeldsparContext *)v11 setFavoritesPersonalizer:v10];
  v42 = v11;
  [(FRAppDelegate *)self setupNotificationManagerWithFeldsparContext:&v42];
  v37 = v42;

  id v17 = [FRPresubscribeService alloc];
  v38 = [(FRAppDelegate *)self cloudContext];
  v36 = [v38 appConfigurationManager];
  uint64_t v18 = [(FRAppDelegate *)self cloudContext];
  id v19 = [v18 tagController];
  id v20 = [(FRAppDelegate *)self cloudContext];
  uint64_t v21 = [v20 subscriptionController];
  id v22 = [(FRAppDelegate *)self cloudContext];
  id v23 = [v22 purchaseController];
  id v24 = [(FRAppDelegate *)self notificationManager];
  id v25 = [(FRPresubscribeService *)v17 initWithAppConfigurationManager:v36 tagController:v19 subscriptionController:v21 purchaseController:v23 notificationManager:v24];
  [(FRFeldsparContext *)v37 setPresubscribeService:v25];

  id v26 = [FRArticleContentPool alloc];
  id v27 = [(FRAppDelegate *)self cloudContext];
  id v28 = [(FRAppDelegate *)self dataProviderFactory];
  id v29 = [(FRArticleContentPool *)v26 initWithCloudContext:v27 dataProviderFactory:v28];
  [(FRFeldsparContext *)v37 setArticleContentPool:v29];

  id v30 = [FRSpotlightManager alloc];
  v31 = [(FRAppDelegate *)self cloudContext];
  v32 = [(FRSpotlightManager *)v30 initWithCloudContext:v31];
  [(FRFeldsparContext *)v37 setSpotlightManager:v32];

  id v33 = objc_alloc_init((Class)AppEntityAssociator);
  v34 = [(FRFeldsparContext *)v37 spotlightManager];
  [v34 setAssociator:v33];

  unsigned int v41 = v37;
  [(FRAppDelegate *)self setupAnalyticsControllerWithFeldsparContext:&v41 versionHelpers:v39 referral:v40];

  v35 = v41;
  [(FRAppDelegate *)self setFeldsparContext:v35];
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(FRAppDelegate *)self setupLanguages];
  [(FRAppDelegate *)self scheduleTasksWithOptions:v7];
  v106 = v6;
  [(FRAppDelegate *)self setRunningPPTWithApplication:v6];
  v109 = [(FRAppDelegate *)self setupDestructiveDataAction];
  [(FRAppDelegate *)self registerForDeviceLockNotifications];
  v105 = v7;
  v110 = [(FRAppDelegate *)self setupAnalyticsReferralWithOptions:v7];
  [(FRAppDelegate *)self prepareAppCacheSnapShot];
  id v8 = +[FRAppDelegate stateRestorationURL];
  uint64_t v9 = [v8 path];

  id v10 = +[NSFileManager defaultManager];
  v104 = (void *)v9;
  LOBYTE(v9) = [v10 fileExistsAtPath:v9];

  if ((v9 & 1) == 0) {
    TFCompletedStartup();
  }
  [(FRAppDelegate *)self setupUserDefaultsForPPT];
  v103 = +[UIApplication sharedApplication];
  objc_opt_class();
  id v11 = +[LSBundleProxy bundleProxyForCurrentProcess];
  v102 = FCCheckedDynamicCast();

  v111 = [[FRVersionHelpers alloc] initWithBackgroundTaskable:v103 applicationProxy:v102];
  [(FRVersionHelpers *)v111 updateAppObsolescenceState];
  id v12 = objc_alloc((Class)FCNetworkBehaviorMonitor);
  id v13 = FRURLForNewsAppCachesDirectory();
  id v14 = [v13 path];
  id v108 = [v12 initWithCacheDirectory:v14];

  id v15 = objc_opt_new();
  [v15 addMonitor:v108];
  v101 = +[NSNotificationCenter defaultCenter];
  id v16 = objc_alloc_init((Class)NUApplicationAppActivityMonitorIOS);
  id v98 = [objc_alloc((Class)FCAppActivationMonitor) initWithAppActivityMonitor:v16];
  id v17 = +[NSBundle mainBundle];
  v100 = [v17 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

  uint64_t v18 = +[NSBundle mainBundle];
  v99 = [v18 objectForInfoDictionaryKey:@"CFBundleVersion"];

  id v19 = objc_alloc((Class)FCConfigurationManager);
  id v20 = +[FCContextConfiguration defaultConfiguration];
  uint64_t v21 = FRURLForNewsAppCachesDirectory();
  id v22 = +[FCFeldsparIDProvider sharedInstance];
  v96 = v16;
  id v23 = [v19 initWithContextConfiguration:v20 contentHostDirectoryFileURL:v21 feldsparIDProvider:v22 appShortVersionString:v100 buildNumberString:v99 networkBehaviorMonitor:v15 appActivityMonitor:v16 applicationState:0];

  v95 = v23;
  v97 = v15;
  id v24 = [objc_alloc((Class)FCOfflineModeMonitor) initWithAppActivationMonitor:v98 configurationManager:v23 networkBehaviorMonitor:v15];
  [(FRAppDelegate *)self setNetworkBehaviorMonitor:v108];
  [(FRAppDelegate *)self setOfflineModeMonitor:v24];
  v94 = v24;
  [(FRAppDelegate *)self setupCloudContextWithAppActivityMonitor:v16 dataActionProvider:v109 versionHelpers:v111 configurationManager:v23 networkBehaviorMonitor:v15 networkReachability:v24];
  id v25 = [FRFavoritesPersonalizer alloc];
  id v26 = [(FRAppDelegate *)self cloudContext];
  v107 = [(FRFavoritesPersonalizer *)v25 initWithCloudContext:v26];

  id v27 = [(FRAppDelegate *)self cloudContext];
  v93 = [v27 subscriptionList];

  id v28 = [[FRPrivateDataUpdateCoordinator alloc] initWithNetworkReachability:v24];
  [(FRAppDelegate *)self setPrivateDataUpdateCoordinator:v28];

  v92 = [(FRAppDelegate *)self cloudContext];
  v91 = [v92 subscriptionList];
  v112[0] = v91;
  v90 = [(FRAppDelegate *)self cloudContext];
  v89 = [v90 readingList];
  v112[1] = v89;
  v88 = [(FRAppDelegate *)self cloudContext];
  v87 = [v88 userInfo];
  v112[2] = v87;
  v86 = [(FRAppDelegate *)self cloudContext];
  v85 = [v86 audioPlaylist];
  v112[3] = v85;
  v84 = [(FRAppDelegate *)self cloudContext];
  v83 = [v84 privateChannelMembershipController];
  v112[4] = v83;
  v82 = [(FRAppDelegate *)self cloudContext];
  v81 = [v82 shortcutList];
  v112[5] = v81;
  v80 = [(FRAppDelegate *)self cloudContext];
  v79 = [v80 shortcutCategoryList];
  v112[6] = v79;
  v78 = [(FRAppDelegate *)self cloudContext];
  v77 = [v78 personalizationData];
  v112[7] = v77;
  v76 = [(FRAppDelegate *)self cloudContext];
  id v29 = [v76 userEventHistory];
  v112[8] = v29;
  id v30 = [(FRAppDelegate *)self cloudContext];
  v31 = [v30 readingHistory];
  v112[9] = v31;
  v32 = [(FRAppDelegate *)self cloudContext];
  id v33 = [v32 issueReadingHistory];
  v112[10] = v33;
  v34 = [(FRAppDelegate *)self cloudContext];
  v35 = [v34 puzzleHistory];
  v112[11] = v35;
  v36 = +[NSArray arrayWithObjects:v112 count:12];
  v37 = [(FRAppDelegate *)self privateDataUpdateCoordinator];
  [v37 setPrivateDataControllers:v36];

  v38 = [FRFlintEmbedConfigurationManager alloc];
  id v39 = [(FRAppDelegate *)self cloudContext];
  id v40 = [v39 appConfigurationManager];
  unsigned int v41 = [(FRAppDelegate *)self cloudContext];
  v42 = [v41 flintResourceManager];
  id v43 = [(FRFlintEmbedConfigurationManager *)v38 initWithConfigurationManager:v40 resourceManager:v42];
  [(FRAppDelegate *)self setEmbedConfigurationManager:v43];

  v44 = [FRFlintDataProviderFactory alloc];
  v45 = [(FRAppDelegate *)self cloudContext];
  v46 = [(FRAppDelegate *)self cloudContext];
  v47 = [v46 flintResourceManager];
  uint64_t v48 = [(FRAppDelegate *)self embedConfigurationManager];
  id v49 = [(FRFlintDataProviderFactory *)v44 initWithCloudContext:v45 resourceManager:v47 embedConfigurationManager:v48];

  [(FRAppDelegate *)self setDataProviderFactory:v49];
  -[FRAppDelegate setupCloudContextWithFavoritesPersonalizer:state:launchOptions:versionHelpers:referral:](self, "setupCloudContextWithFavoritesPersonalizer:state:launchOptions:versionHelpers:referral:", v107, [v106 applicationState], v105, v111, v110);
  id v50 = [(FRAppDelegate *)self bridgedAppDelegate];
  [v50 bootstrapWithApplication:v106];

  id v51 = [(FRAppDelegate *)self bridgedAppDelegate];
  v52 = [v51 createBridgedAppResolver];
  [(FRAppDelegate *)self setResolver:v52];

  v53 = [(FRAppDelegate *)self resolver];
  v54 = [v53 resolveProtocol:&OBJC_PROTOCOL___FCReadonlyAggregateStoreProviderType];

  [(FRFavoritesPersonalizer *)v107 setAggregateStoreProvider:v54];
  id v55 = [(FRAppDelegate *)self resolver];
  v56 = [v55 resolveProtocol:&OBJC_PROTOCOL___FCTagRanking];

  [(FRFavoritesPersonalizer *)v107 setTagRanker:v56];
  v57 = [(FRAppDelegate *)self resolver];
  v58 = [v57 resolveProtocol:&OBJC_PROTOCOL___FCFeedPersonalizing];
  v59 = [(FRAppDelegate *)self cloudContext];
  [v59 setFeedPersonalizer:v58];

  v60 = [(FRAppDelegate *)self cloudContext];
  [v60 setAggregateStoreProvider:v54];

  v61 = [(FRAppDelegate *)self resolver];
  v62 = [v61 resolveProtocol:&OBJC_PROTOCOL___FCUserVectorAggregateVectorProvider];
  v63 = [(FRAppDelegate *)self cloudContext];
  [v63 setTabiBasedUserVectorAggregateVectorProvider:v62];

  v64 = [FRSubscribedTagRanker alloc];
  v65 = [(FRAppDelegate *)self resolver];
  v66 = [v65 resolveProtocol:&OBJC_PROTOCOL___FCFeedPersonalizing];
  v67 = [(FRSubscribedTagRanker *)v64 initWithTagRanker:v66];
  [v93 setSubscribedTagRanker:v67];

  [v93 assignOrderToTagSubscriptionsIfNeeded];
  [(FRAppDelegate *)self resolveAppSingletons];
  v68 = [(FRAppDelegate *)self resolver];
  v69 = [v68 resolveProtocol:&OBJC_PROTOCOL___FRURLAnalyticsReferralFactory];

  v70 = [(FRAppDelegate *)self feldsparContext];
  v71 = [v70 appActivityMonitor];
  [v71 setAnalyticsReferralFactory:v69];

  v72 = [(FRAppDelegate *)self feldsparContext];
  v73 = [v72 appActivityMonitor];
  [v73 applicationWillFinishLaunching];

  [(FRAppDelegate *)self prewarmAd];
  v74 = [(FRAppDelegate *)self bridgedAppDelegate];
  LOBYTE(v72) = [v74 application:v106 willFinishLaunchingWithOptions:v105];

  return (char)v72;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (TSAppDelegate)bridgedAppDelegate
{
  return self->_bridgedAppDelegate;
}

- (void)resolveAppSingletons
{
  v2 = self;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10003BDB4;
  v43[3] = &unk_1000C77B0;
  v43[4] = v2;
  unsigned int v3 = [(FRAppDelegate *)v2 cloudContext];
  [v3 setOfflineArticleManagerProvider:v43];

  id v4 = [(FRAppDelegate *)v2 resolver];
  id v5 = [v4 resolveProtocol:&OBJC_PROTOCOL___FCLocalRegionManager];
  id v6 = [(FRAppDelegate *)v2 cloudContext];
  [v6 setLocalRegionProvider:v5];

  id v7 = [(FRAppDelegate *)v2 resolver];
  id v8 = [v7 resolveProtocol:&OBJC_PROTOCOL___FCLocalChannelsProvider];
  uint64_t v9 = [(FRAppDelegate *)v2 cloudContext];
  [v9 setLocalChannelsProvider:v8];

  id v10 = [(FRAppDelegate *)v2 resolver];
  id v11 = [v10 resolveClass:objc_opt_class()];
  [(FRAppDelegate *)v2 setTodayAgent:v11];

  id v12 = [(FRAppDelegate *)v2 resolver];
  id v13 = [v12 resolveClass:objc_opt_class()];
  [(FRAppDelegate *)v2 setDiagnosticFileCollector:v13];

  id v14 = [(FRAppDelegate *)v2 feldsparContext];
  id v15 = [(FRAppDelegate *)v2 resolver];
  id v16 = [v15 resolveProtocol:&OBJC_PROTOCOL___TSSharedImageCacheType];
  [v14 setUnderlyingImageCache:v16];

  id v17 = [(FRAppDelegate *)v2 resolver];
  uint64_t v18 = [v17 resolveClass:objc_opt_class()];
  [v14 setArticlePrefetchManager:v18];

  id v19 = [(FRAppDelegate *)v2 resolver];
  id v20 = [v19 resolveProtocol:&OBJC_PROTOCOL___AAViewingSessionManagerType name:@"Issue"];
  [v14 setIssueViewingSessionManager:v20];

  uint64_t v21 = [(FRAppDelegate *)v2 resolver];
  id v22 = [v21 resolveProtocol:&OBJC_PROTOCOL___FRToCEditorialManager];

  [v22 refreshEditorialItems];
  id v23 = [(FRAppDelegate *)v2 resolver];
  id v24 = [v23 resolveProtocol:&OBJC_PROTOCOL___TSLocationDetectionManagerType];
  id v25 = [(FRAppDelegate *)v2 feldsparContext];
  id v26 = [v25 favoritesPersonalizer];
  [v26 setLocationManager:v24];

  [(FRAppDelegate *)v2 setFeldsparContext:v14];
  [(FRAppDelegate *)v2 clearOldCacheItemsWithFeldsparContext:v14];
  if (+[FRMacros iPhone])
  {
    id v27 = [FRGizmoSyncManager alloc];
    id v28 = [v14 cloudContext];
    id v29 = [v28 appConfigurationManager];
    id v30 = [v14 readingList];
    v31 = [v14 readingHistory];
    v32 = [(FRGizmoSyncManager *)v27 initWithAppConfigManager:v29 readingList:v30 readingHistory:v31];

    [(FRGizmoSyncManager *)v32 setDelegate:v2];
    [v14 setGizmoSyncManager:v32];
  }
  id v33 = [(FRAppDelegate *)v2 resolver];
  v34 = [v33 resolveProtocol:&OBJC_PROTOCOL___FRURLRouterManagerType];
  [(FRAppDelegate *)v2 setUrlRouterManager:v34];

  if (NFInternalBuild())
  {
    v35 = NewsCoreUserDefaults();
    unsigned int v36 = [v35 BOOLForKey:@"news_articles.drafts.allow_remote_preview"];

    if (v36)
    {
      v37 = [(FRAppDelegate *)v2 resolver];
      v38 = [v37 resolveProtocol:&OBJC_PROTOCOL___TSLocalDraftsDeviceManagerType];
      [(FRAppDelegate *)v2 setDeviceManager:v38];

      id v39 = [(FRAppDelegate *)v2 deviceManager];
      [v39 setDelegate:v2];

      id v40 = +[UIAlertController alertControllerWithTitle:@"News Preview - Device PIN" message:0 preferredStyle:1];
      [(FRAppDelegate *)v2 setPinAlertController:v40];

      unsigned int v41 = [(FRAppDelegate *)v2 pinAlertController];
      v42 = +[UIAlertAction actionWithTitle:@"Done" style:1 handler:0];
      [v41 addAction:v42];
    }
  }
  [(FRAppDelegate *)v2 _configureBackgroundFetch];
}

- (TFResolver)resolver
{
  resolver = self->_resolver;
  if (!resolver)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000778F4();
    }
    resolver = self->_resolver;
  }

  return resolver;
}

- (void)sceneDidBecomeActive
{
  [(FRAppDelegate *)self _timeSinceLastActivation];
  double v4 = v3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = +[NSDate date];
  [v5 setObject:v6 forKey:@"lastActivationDate"];

  if (v4 > 604800.0
    || (+[NSUserDefaults standardUserDefaults],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 BOOLForKey:FCSimulateServerSidePrivateDataReset],
        v7,
        v8))
  {
    uint64_t v9 = [(FRAppDelegate *)self privateDataUpdateCoordinator];
    [v9 markAllPrivateDataControllersAsNeedingUpdate];
  }
  id v10 = [(FRAppDelegate *)self privateDataUpdateCoordinator];
  [v10 updatePrivateDataControllersWithCompletion:&stru_1000C8DA0];

  id v11 = +[NSUserDefaults standardUserDefaults];
  unsigned int v12 = [v11 BOOLForKey:@"simulate_quick_subscription_refresh"];

  if (v12)
  {
    id v13 = [(FRAppDelegate *)self cloudContext];
    id v14 = [v13 subscriptionController];
    [v14 performSelector:"refreshAndNotifyAboutSubscribedTags" withObject:0 afterDelay:120.0];
  }
  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10005179C;
    v31[3] = &unk_1000C5680;
    v31[4] = self;
    +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:v31];
  }
  id v15 = +[UNUserNotificationCenter currentNotificationCenter];
  [v15 setBadgeCount:0 withCompletionHandler:0];
  id v16 = +[UIApplication sharedApplication];
  [v16 setApplicationIconBadgeNumber:0];

  id v17 = +[NSDate date];
  uint64_t v18 = [(FRAppDelegate *)self feldsparContext];
  id v19 = [v18 cloudContext];
  id v20 = [v19 userInfo];
  [v20 setDateLastOpened:v17];

  uint64_t v21 = +[NSNotificationCenter defaultCenter];
  id v22 = +[NSOperationQueue mainQueue];
  id v23 = [v21 addObserverForName:@"Unregister Crash Callbacks" object:0 queue:v22 usingBlock:&stru_1000C8DE0];

  id v24 = +[NSNotificationQueue defaultQueue];
  id v25 = +[NSNotification notificationWithName:@"Unregister Crash Callbacks" object:0];
  NSRunLoopMode v32 = NSRunLoopCommonModes;
  id v26 = +[NSArray arrayWithObjects:&v32 count:1];
  [v24 enqueueNotification:v25 postingStyle:1 coalesceMask:3 forModes:v26];

  id v27 = [(FRAppDelegate *)self feldsparContext];
  id v28 = [v27 gizmoSyncManager];
  [v28 syncWithGizmo];

  id v29 = [(FRAppDelegate *)self resolver];
  id v30 = [v29 resolveClass:objc_opt_class()];

  [v30 updateUnderlyingMappingWithQualityOfService:-1 completion:0];
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (void)prepareAppCacheSnapShot
{
  if (FeldsparInternalExtrasEnabled())
  {
    id v2 = objc_alloc_init(NSClassFromString(@"FRAppCacheSnapshotter"));
    if ([v2 snapshotPreparedAndWaitingForRestoration]) {
      [v2 finalizeRestoreOfCachesDirectory];
    }
  }
}

- (void)setUrlRouterManager:(id)a3
{
}

- (void)setTodayAgent:(id)a3
{
}

- (void)setResolver:(id)a3
{
}

- (void)setPrivateDataUpdateCoordinator:(id)a3
{
}

- (void)setOfflineModeMonitor:(id)a3
{
}

- (void)setNotificationManager:(id)a3
{
}

- (void)setNetworkBehaviorMonitor:(id)a3
{
}

- (void)setFeldsparContext:(id)a3
{
}

- (void)setEmbedConfigurationManager:(id)a3
{
}

- (void)setDiagnosticFileCollector:(id)a3
{
}

- (void)setDataProviderFactory:(id)a3
{
}

- (void)setCloudContext:(id)a3
{
}

- (void)setBackgroundFetchScheduler:(id)a3
{
}

- (void)setBackgroundFetchManager:(id)a3
{
}

- (void)setApplicationUpdateNotifier:(id)a3
{
}

- (void)setAmsPushHandler:(id)a3
{
}

- (void)setActivityMonitor:(id)a3
{
}

- (FRPrivateDataUpdateCoordinator)privateDataUpdateCoordinator
{
  return self->_privateDataUpdateCoordinator;
}

- (FCOfflineModeMonitor)offlineModeMonitor
{
  return self->_offlineModeMonitor;
}

- (FRNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (int)fcDigestModeFromScheduledDeliverySetting:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (FRFlintEmbedConfigurationManager)embedConfigurationManager
{
  return self->_embedConfigurationManager;
}

- (FRFlintDataProviderFactory)dataProviderFactory
{
  return self->_dataProviderFactory;
}

- (TSBackgroundFetchScheduler)backgroundFetchScheduler
{
  return self->_backgroundFetchScheduler;
}

- (FRBackgroundFetchManager)backgroundFetchManager
{
  return self->_backgroundFetchManager;
}

- (FRApplicationUpdateNotifier)applicationUpdateNotifier
{
  return self->_applicationUpdateNotifier;
}

- (id)createCarPlaySceneContainer
{
  id v2 = [(FRAppDelegate *)self bridgedAppDelegate];
  double v3 = [v2 createCarPlaySceneContainer];

  return v3;
}

- (id)_extractWidgetEngagementFromReferralURL:(id)a3
{
  id v3 = a3;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100074E58();
  }
  if ((objc_msgSend(v3, "nss_isNewsURL") & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100074D78();
  }
  double v4 = [v3 fr_widgetEngagementFileURL];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSData) initWithContentsOfURL:v4];
    if (v5) {
      id v6 = [objc_alloc((Class)NTPBWidgetEngagement) initWithData:v5];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)sharedDelegate
{
  objc_opt_class();
  id v2 = +[UIApplication sharedApplication];
  id v3 = [v2 delegate];
  double v4 = FCDynamicCast();

  return v4;
}

- (void)dealloc
{
  [(FRAppDelegate *)self unregisterForDeviceLockNotifications];
  v3.receiver = self;
  v3.super_class = (Class)FRAppDelegate;
  [(FRAppDelegate *)&v3 dealloc];
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(FRAppDelegate *)self resolver];
  id v10 = [v9 resolveProtocol:&OBJC_PROTOCOL___SNTestRunner];

  LOBYTE(v9) = [v10 runTest:v8 options:v7];
  return (char)v9;
}

- (void)localDraftsDeviceOnPreview:(id)a3 articleIdentifier:(id)a4 channelIdentifier:(id)a5
{
  id v6 = +[NSString stringWithFormat:@"applenews://preview/%@/%@", a5, a4];
  id v7 = +[NSURL URLWithString:v6];

  [(FRAppDelegate *)self _application:self openURL:v7 options:&__NSDictionary0__struct animated:+[UIView areAnimationsEnabled]];
}

- (void)showAlertWithPin:(id)a3 pin:(id)a4
{
  id v5 = a4;
  id v6 = +[UIApplication sharedApplication];
  [v6 key_window];
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = objc_alloc((Class)NSMutableAttributedString);
  id v8 = [@"\n" stringByAppendingString:v5];

  id v9 = [v7 initWithString:v8];
  id v10 = +[UIFont fontWithName:@"Helvetica" size:24.0];
  [v9 addAttribute:NSFontAttributeName value:v10 range:0, 7];

  [v9 addAttribute:NSKernAttributeName value:&off_1000CFCD8 range:0, 7];
  id v11 = [(FRAppDelegate *)self pinAlertController];
  [v11 setValue:v9 forKey:@"attributedMessage"];

  unsigned int v12 = [v14 rootViewController];
  id v13 = [(FRAppDelegate *)self pinAlertController];
  [v12 presentViewController:v13 animated:1 completion:0];
}

- (void)hideAlert:(id)a3
{
  id v3 = [(FRAppDelegate *)self pinAlertController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)showAppUnsupportedAlert
{
  id v2 = +[NSBundle mainBundle];
  id v10 = [v2 localizedStringForKey:@"Apple News isn’t supported in your current region." value:&stru_1000CABC0 table:0];

  id v3 = +[UIAlertController alertControllerWithTitle:0 message:v10 preferredStyle:1];
  double v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"Quit" value:&stru_1000CABC0 table:0];

  id v6 = +[UIAlertAction actionWithTitle:v5 style:0 handler:&stru_1000C8CD0];
  [v3 addAction:v6];
  id v7 = +[UIApplication sharedApplication];
  id v8 = [v7 key_window];

  id v9 = [v8 rootViewController];
  [v9 presentViewController:v3 animated:1 completion:0];
}

- (void)application:(id)a3 handleIntent:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FRAppDelegate *)self bridgedAppDelegate];
  [v11 application:v10 handleIntent:v9 completionHandler:v8];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  double v4 = [(FRAppDelegate *)self bridgedAppDelegate];
  id v5 = [v4 forwardingTargetForSelector:a3];

  return v5;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(FRAppDelegate *)self bridgedAppDelegate];
  [v5 buildMenuWithBuilder:v4];
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(FRAppDelegate *)self bridgedAppDelegate];
  [v5 validateCommand:v4];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  id v7 = [(FRAppDelegate *)self bridgedAppDelegate];
  LOBYTE(a3) = [v7 canPerformAction:a3 withSender:v6];

  return (char)a3;
}

- (void)_didResumeLowPriorityTasks
{
  id v3 = [(FRAppDelegate *)self resolver];
  id v4 = [v3 resolveProtocol:&OBJC_PROTOCOL___TSCacheFlushingManagerType];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100050F38;
  v16[3] = &unk_1000C6E78;
  v16[4] = self;
  [v4 addPreFlushTask:v16];
  id v5 = [(FRAppDelegate *)self resolver];
  id v6 = [v5 resolveProtocol:&OBJC_PROTOCOL___FRToCEditorialManager];

  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10005100C;
  id v14 = &unk_1000C6E78;
  id v15 = v6;
  id v7 = v6;
  [v4 addPreFlushTask:&v11];
  id v8 = [(FRAppDelegate *)self resolver];
  id v9 = [v8 resolveClass:objc_opt_class()];

  [v9 acquireHoldTokenOnUnderlyingAssets];
  [v4 enableFlushing];
  id v10 = [(FRAppDelegate *)self todayAgent];
  [v10 performSelector:"enable" withObject:0 afterDelay:1.0];
}

- (void)application:(id)a3 didSendEvent:(id)a4
{
  id v5 = a4;
  id v6 = [(FRAppDelegate *)self keyboardInputMonitor];
  [v6 handle:v5];
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  LODWORD(v11) = +[UIView areAnimationsEnabled];
  uint64_t v12 = FRNavigationLog;
  if (os_log_type_enabled((os_log_t)FRNavigationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v37 = v9;
    __int16 v38 = 1024;
    int v39 = (int)v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ApplicationDelegate received URL to handle <%{public}@>, animated %d", buf, 0x12u);
  }
  LODWORD(v13) = [v9 nss_isNewsURL];
  if (v13)
  {
    id v14 = objc_alloc((Class)UIView);
    id v15 = +[UIScreen mainScreen];
    [v15 bounds];
    id v16 = [v14 initWithFrame:];

    id v17 = +[UIColor systemBackgroundColor];
    [v16 setBackgroundColor:v17];

    uint64_t v18 = [v10 valueForKey:NUURLWasOpenedFromNewsKey];
    if (([v18 isEqual:&__kCFBooleanTrue] & 1) == 0)
    {
      [v10 valueForKey:UIApplicationOpenURLOptionsSourceApplicationKey];
      id v11 = v29 = (char)v11;
      id v19 = +[NSBundle mainBundle];
      [v19 bundleIdentifier];
      id v20 = v16;
      char v21 = (char)v13;
      id v13 = v10;
      id v22 = self;
      v24 = id v23 = v8;
      unsigned __int8 v28 = [v11 isEqual:v24];

      id v8 = v23;
      self = v22;
      id v10 = v13;
      LOBYTE(v13) = v21;
      id v16 = v20;

      LOBYTE(v11) = v29;
      if (v28)
      {
LABEL_8:
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100051384;
        block[3] = &unk_1000C8D80;
        block[4] = self;
        id v31 = v8;
        id v32 = v9;
        char v35 = (char)v11;
        id v33 = v10;
        id v34 = v16;
        id v26 = v16;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        goto LABEL_9;
      }
      id v25 = +[UIApplication sharedApplication];
      uint64_t v18 = [v25 key_window];

      [v18 addSubview:v16];
    }

    goto LABEL_8;
  }
LABEL_9:

  return (char)v13;
}

+ (BOOL)shouldHideHeadline:(id)a3
{
  id v3 = a3;
  id v4 = +[FRAppDelegate sharedDelegate];
  id v5 = [v4 cloudContext];
  id v6 = [v5 readingList];
  unsigned __int8 v7 = [v6 shouldHideHeadline:v3];

  return v7;
}

- (void)_application:(id)a3 openURL:(id)a4 options:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend(v9, "nss_isNewsURL"))
  {
    if (objc_msgSend(v9, "fr_isFeldsparOpenInNewsErrorURL"))
    {
      id v11 = +[UIApplication sharedApplication];
      uint64_t v12 = [v11 key_window];

      id v13 = [v12 rootViewController];
      id v14 = [v13 presentedViewController];

      if (v14)
      {
        uint64_t v15 = [v13 presentedViewController];

        id v13 = (void *)v15;
      }
      FROpenInNewsAlert(v13);
    }
    else
    {
      id v16 = [(FRAppDelegate *)self resolver];
      uint64_t v12 = [v16 resolveProtocol:&OBJC_PROTOCOL___FRURLAnalyticsReferralFactory];

      id v17 = [v10 objectForKeyedSubscript:UIApplicationOpenURLOptionsSourceApplicationKey];
      uint64_t v18 = [v12 analyticsReferralForURL:v9 sourceApplication:v17];

      id v19 = [(FRAppDelegate *)self feldsparContext];
      id v20 = [v19 appActivityMonitor];
      [v20 setAppSessionStartReferral:v18];

      if (v6)
      {
        char v21 = [(FRAppDelegate *)self urlRouterManager];
        [v21 handleOpenURL:v9 options:v10 analyticsReferral:v18];
      }
      else
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100051684;
        v22[3] = &unk_1000C5720;
        v22[4] = self;
        id v23 = v9;
        id v24 = v10;
        id v25 = v18;
        +[UIView performWithoutAnimation:v22];
      }
    }
  }
}

- (void)sceneDidEnterBackground
{
  id v3 = [(FRAppDelegate *)self feldsparContext];
  id v7 = [v3 underlyingImageCache];

  [v7 pruneImagesOlderThan:86400.0];
  id v4 = objc_alloc_init(FRInternalExtrasFakeNotificationSender);
  id v5 = [(FRAppDelegate *)self notificationManager];
  BOOL v6 = +[UIApplication sharedApplication];
  [(FRInternalExtrasFakeNotificationSender *)v4 scheduleAnyFakeNotificationsFromInternalExtras:v5 whenAppEntersBackground:v6];
}

- (void)unregisterForDeviceLockNotifications
{
  if (notify_cancel(self->lockStateToken))
  {
    id v2 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
      sub_100077A18(v2);
    }
  }
}

- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4
{
  id v5 = a4;
  BOOL v6 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR)) {
    sub_100077A5C((uint64_t)v5, v6);
  }
  objc_opt_class();
  id v7 = [(FRAppDelegate *)self feldsparContext];
  id v8 = FCDynamicCast();

  id v9 = +[UNUserNotificationCenter currentNotificationCenter];
  id v10 = [v9 notificationSettings];
  uint64_t v11 = -[FRAppDelegate fcDigestModeFromScheduledDeliverySetting:](self, "fcDigestModeFromScheduledDeliverySetting:", [v10 scheduledDeliverySetting]);
  uint64_t v12 = [v8 cloudContext];
  id v13 = [v12 notificationController];
  [v13 registerDeviceToken:0 deviceDigestMode:v11];
}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FRAppDelegate *)self bridgedAppDelegate];
  [v11 application:v10 didReceiveRemoteNotification:v9 fetchCompletionHandler:v8];
}

- (id)gizmoSyncManager:(id)a3 fetchOperationForArticleIDs:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)FCArticleHeadlinesFetchOperation);
  id v7 = [(FRAppDelegate *)self feldsparContext];
  id v8 = [v7 cloudContext];
  id v9 = [v5 copy];

  id v10 = [v6 initWithContext:v8 articleIDs:v9 ignoreCacheForArticleIDs:&__NSArray0__struct];

  return v10;
}

- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = FRBackgroundFetchLog;
  if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "app was awoken for fetching via application:performFetchWithCompletionHandler:", buf, 2u);
  }
  id v9 = [(FRAppDelegate *)self offlineModeMonitor];
  unsigned __int8 v10 = [v9 isCloudKitReachable];

  if (v10)
  {
    if ([(FRAppDelegate *)self safeIsAppRunningInBackground])
    {
      +[FCTaskScheduler enableBackgroundDownloadsInSpiteOfHighPriorityTasks];
      id v11 = dispatch_group_create();
      uint64_t v12 = +[NSMutableSet set];
      id v13 = [(FRAppDelegate *)self bridgedAppDelegate];

      if (v13)
      {
        id v14 = FRBackgroundFetchLog;
        if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "will run bridged backround fetch", buf, 2u);
        }
        dispatch_group_enter(v11);
        uint64_t v15 = [(FRAppDelegate *)self bridgedAppDelegate];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100051FDC;
        v26[3] = &unk_1000C8E58;
        id v27 = v12;
        unsigned __int8 v28 = v11;
        [v15 application:v6 performFetchWithCompletionHandler:v26];
      }
      id v16 = [(FRAppDelegate *)self backgroundFetchManager];

      if (v16)
      {
        id v17 = FRBackgroundFetchLog;
        if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "will run legacy backround fetch", buf, 2u);
        }
        dispatch_group_enter(v11);
        uint64_t v18 = [(FRAppDelegate *)self backgroundFetchManager];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100052094;
        v23[3] = &unk_1000C8E80;
        id v24 = v12;
        id v25 = v11;
        [v18 peformBackgroundFetchWithReason:0 timeout:v23 completionHandler:25.0];
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10005214C;
      v20[3] = &unk_1000C5BF8;
      id v21 = v12;
      id v22 = v7;
      id v19 = v12;
      dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, v20);
    }
    else
    {
      char v29 = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472;
      id v31 = sub_100051FC8;
      id v32 = &unk_1000C6E28;
      id v33 = (void (**)(id, uint64_t))v7;
      v33[2](v33, 1);
      id v11 = v33;
    }
  }
  else
  {
    id v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472;
    unsigned int v36 = sub_100051FB4;
    id v37 = &unk_1000C6E28;
    __int16 v38 = (void (**)(id, uint64_t))v7;
    v38[2](v38, 2);
    id v11 = v38;
  }
}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
}

- (BOOL)safeIsAppRunningInBackground
{
  id v3 = +[UIApplication sharedApplication];
  id v4 = [v3 key_window];

  if (+[NSThread isMainThread])
  {
    id v5 = [v4 windowScene];
    if ([v5 activationState] == (id)2) {
      unsigned __int8 v6 = 1;
    }
    else {
      unsigned __int8 v6 = [(FRAppDelegate *)self isDeviceLocked];
    }
  }
  else
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100052320;
    block[3] = &unk_1000C8EA8;
    id v11 = &v12;
    id v9 = v4;
    unsigned __int8 v10 = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    unsigned __int8 v6 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (FRAppActivityMonitor)activityMonitor
{
  return self->_activityMonitor;
}

- (BOOL)inPreviewMode
{
  return self->_inPreviewMode;
}

- (void)setInPreviewMode:(BOOL)a3
{
  self->_inPreviewMode = a3;
}

- (BOOL)appOpenedByUserActivity
{
  return self->_appOpenedByUserActivity;
}

- (void)setAppOpenedByUserActivity:(BOOL)a3
{
  self->_appOpenedByUserActivity = a3;
}

- (void)setBundleAssemblies:(id)a3
{
}

- (void)setAssemblies:(id)a3
{
}

- (TFBridgedContainer)bridgedContainer
{
  return self->_bridgedContainer;
}

- (void)setBridgedContainer:(id)a3
{
}

- (NSTimer)handoffStreamsTimer
{
  return self->_handoffStreamsTimer;
}

- (void)setHandoffStreamsTimer:(id)a3
{
}

- (FCAccountActionQueue)accountActionQueue
{
  return self->_accountActionQueue;
}

- (void)setAccountActionQueue:(id)a3
{
}

- (TUKeyboardInputMonitor)keyboardInputMonitor
{
  return self->_keyboardInputMonitor;
}

- (void)setKeyboardInputMonitor:(id)a3
{
}

- (void)setBridgedAppDelegate:(id)a3
{
}

- (TFDiagnosticFileCollector)diagnosticFileCollector
{
  return self->_diagnosticFileCollector;
}

- (FRURLRouterManagerType)urlRouterManager
{
  return self->_urlRouterManager;
}

- (UIAlertController)pinAlertController
{
  return self->_pinAlertController;
}

- (void)setPinAlertController:(id)a3
{
}

- (FRTodayAgent)todayAgent
{
  return self->_todayAgent;
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  self->_isDeviceLocked = a3;
}

- (FCAMSPushHandler)amsPushHandler
{
  return self->_amsPushHandler;
}

- (TSLocalDraftsDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_applicationUpdateNotifier, 0);
  objc_storeStrong((id *)&self->_amsPushHandler, 0);
  objc_storeStrong((id *)&self->_backgroundFetchManager, 0);
  objc_storeStrong((id *)&self->_todayAgent, 0);
  objc_storeStrong((id *)&self->_pinAlertController, 0);
  objc_storeStrong((id *)&self->_backgroundFetchScheduler, 0);
  objc_storeStrong((id *)&self->_urlRouterManager, 0);
  objc_storeStrong((id *)&self->_embedConfigurationManager, 0);
  objc_storeStrong((id *)&self->_dataProviderFactory, 0);
  objc_storeStrong((id *)&self->_diagnosticFileCollector, 0);
  objc_storeStrong((id *)&self->_offlineModeMonitor, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_bridgedAppDelegate, 0);
  objc_storeStrong((id *)&self->_keyboardInputMonitor, 0);
  objc_storeStrong((id *)&self->_accountActionQueue, 0);
  objc_storeStrong((id *)&self->_handoffStreamsTimer, 0);
  objc_storeStrong((id *)&self->_bridgedContainer, 0);
  objc_storeStrong((id *)&self->_assemblies, 0);
  objc_storeStrong((id *)&self->_bundleAssemblies, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_activityMonitor, 0);
  objc_storeStrong((id *)&self->_privateDataUpdateCoordinator, 0);
  objc_storeStrong((id *)&self->_feldsparContext, 0);

  objc_storeStrong((id *)&self->_resolver, 0);
}

@end