@interface HOAppDelegate
+ (NSString)itemManagerUpdatesDisabledReasonScrollPerformanceTest;
+ (void)_logSupportedSensitiveFeatures;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (HFWiFiExecutionEnvironmentObserver)wifiExecutionEnvironmentObserver;
- (HOAppNavigationURLHandler)URLHandler;
- (HOAppNavigator)appNavigator;
- (HOAppNavigator)navigator;
- (HOBaseControllerDelegate)baseViewController;
- (HOHomeScreenQuickActionController)homeScreenQuickActionController;
- (HOSplitViewController)splitViewController;
- (NAFuture)applicationActiveFuture;
- (NSMutableDictionary)itemIdentifierToBackgroundTaskIdentifierMap;
- (UITabBarController)tabBarController;
- (UIWindow)window;
- (id)_cameraProfileForTestingInHome:(id)a3 withUUID:(id)a4;
- (id)_firstReadCompleteFuture;
- (id)_networkConfigurationProfileForTestingInHome:(id)a3;
- (id)_networkRouterForTestingInHome:(id)a3;
- (id)_runScrollTestWithTestName:(id)a3 scrollView:(id)a4 options:(id)a5;
- (id)_selectAndFinishFirstReadForTabWithIdentifier:(id)a3;
- (id)_sortedAccessoriesInHome:(id)a3;
- (id)findAccessoryWithItemManager:(id)a3 accessoryID:(id)a4 testBlock:(id)a5;
- (id)findPreferredAccessoryWithItemManager:(id)a3 accessoryID:(id)a4 with:(id)a5;
- (id)firstReadCompleteFuture;
- (id)homeKitObjectIDFrom:(id)a3 userDefaultsEnabled:(BOOL)a4;
- (id)serviceLikeItemWithItem:(id)a3 itemManager:(id)a4 withID:(id)a5;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (void)_clearCachedWalletKeyDeviceStateForCurrentDevice;
- (void)_deleteRoomWithName:(id)a3 inHome:(id)a4;
- (void)_endBackgroundTaskWithItemIdentifier:(id)a3;
- (void)_endBackgroundTaskWithTaskIdentifier:(unint64_t)a3;
- (void)_logAccessoryCountMetricsWithHomes:(id)a3;
- (void)_logNonConfiguredAccessoryMetricsWithHomes:(id)a3;
- (void)_logUserAutomationNamingTypeProportions:(id)a3;
- (void)_logUserMetrics;
- (void)_runAddRoomTestWithApplication:(id)a3 options:(id)a4;
- (void)_runDeleteRoomTestWithApplication:(id)a3 options:(id)a4;
- (void)_runExtendedLaunchTestWithApplication:(id)a3 options:(id)a4;
- (void)_runPresentHomeSettingsTestWithApplication:(id)a3 options:(id)a4;
- (void)_runPresentNetworkConfigurationSettingsTestWithApplication:(id)a3 options:(id)a4;
- (void)_runPresentNetworkRouterSettingsTestWithApplication:(id)a3 options:(id)a4;
- (void)_runPresentNetworkSettingsTestWithApplication:(id)a3 options:(id)a4;
- (void)_runScrollAutomationTestWithApplication:(id)a3 options:(id)a4;
- (void)_runScrollCameraClipsInPlayerTestWithApplication:(id)a3 options:(id)a4;
- (void)_runTabSwitchToAutomationTestWithApplication:(id)a3 options:(id)a4;
- (void)_runToggleLightTestWithApplication:(id)a3 options:(id)a4;
- (void)_runToggleSceneTestWithApplication:(id)a3 options:(id)a4;
- (void)_startBackgroundTaskWithItemIdentifier:(id)a3;
- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5;
- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)endAppleMusicLoginBackgroundTask:(id)a3;
- (void)endSymptomFixBackgroundTask:(id)a3;
- (void)navigateToEnergyCategory:(id)a3;
- (void)setApplicationActiveFuture:(id)a3;
- (void)setHomeScreenQuickActionController:(id)a3;
- (void)setItemIdentifierToBackgroundTaskIdentifierMap:(id)a3;
- (void)setNavigator:(id)a3;
- (void)setSplitViewController:(id)a3;
- (void)setTabBarController:(id)a3;
- (void)setURLHandler:(id)a3;
- (void)setWifiExecutionEnvironmentObserver:(id)a3;
- (void)setWindow:(id)a3;
- (void)startAppleMusicLoginBackgroundTask:(id)a3;
- (void)startSymptomFixBackgroundTask:(id)a3;
@end

@implementation HOAppDelegate

- (void)_logUserAutomationNamingTypeProportions:(id)a3
{
  [a3 na_flatMap:&stru_1000C2718];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [v9 na_filter:&stru_1000C2758];
  if ([v9 count])
  {
    float v4 = (float)(unint64_t)[v3 count];
    float v5 = (float)(v4 / (float)(unint64_t)[v9 count]) * 100.0;
    v6 = +[NSMutableDictionary dictionary];
    *(float *)&double v7 = v5;
    v8 = +[NSNumber numberWithFloat:v7];
    [v6 setObject:v8 forKeyedSubscript:HFAnalyticsAutomationNamingTypeProportionPercentUsingConfiguredNameKey];

    +[HFAnalytics sendEvent:25 withData:v6];
  }
}

- (void)_logUserMetrics
{
  v3 = +[HFHomeKitDispatcher sharedDispatcher];
  float v4 = [v3 allHomesFuture];
  float v5 = +[NAScheduler globalAsyncScheduler];
  v6 = [v4 reschedule:v5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003CEC;
  v8[3] = &unk_1000C2618;
  v8[4] = self;
  id v7 = [v6 addSuccessBlock:v8];
}

- (void)applicationDidBecomeActive:(id)a3
{
  float v4 = +[HFExecutionEnvironment sharedInstance];
  [v4 executionEnvironmentDidBecomeActive];

  float v5 = [(HOAppDelegate *)self applicationActiveFuture];
  [v5 finishWithNoResult];

  [(HOAppDelegate *)self _clearCachedWalletKeyDeviceStateForCurrentDevice];
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting notification authorization.", v8, 2u);
  }

  id v7 = +[UNUserNotificationCenter currentNotificationCenter];
  [v7 requestAuthorizationWithOptions:55 completionHandler:&stru_1000C2588];
}

- (void)_logAccessoryCountMetricsWithHomes:(id)a3
{
  id v3 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005230;
  v10[3] = &unk_1000C2690;
  v10[4] = &v11;
  v10[5] = &v23;
  v10[6] = &v19;
  v10[7] = &v15;
  [v3 na_each:v10];
  v27[0] = HFAnalyticsEventFieldNameUnsupportedServicesCount;
  float v4 = +[NSNumber numberWithInteger:v24[3]];
  v27[1] = HFAnalyticsEventFieldNameSupportedServicesCount;
  v28[0] = v4;
  float v5 = +[NSNumber numberWithInteger:v20[3]];
  v28[1] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  id v7 = [v6 mutableCopy];

  v8 = +[NSNumber numberWithInteger:v12[3]];
  [v7 na_safeSetObject:v8 forKey:HFAnalyticsEventFieldNameFavoriteServicesCount];

  id v9 = +[NSNumber numberWithInteger:v16[3]];
  [v7 na_safeSetObject:v9 forKey:HFAnalyticsEventFieldNameShowInHomeCamerasCount];

  +[HFAnalytics sendEvent:31 withData:v7];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

- (void)_clearCachedWalletKeyDeviceStateForCurrentDevice
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  float v4 = [v3 homeManager];
  float v5 = [v4 homes];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) hf_clearCachedWalletKeyDeviceStateForCurrentDevice:v12];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v22 count:16];
    }
    while (v8);
  }

  uint64_t v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v17 = self;
    __int16 v18 = 2080;
    uint64_t v19 = "-[HOAppDelegate _clearCachedWalletKeyDeviceStateForCurrentDevice]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%@:%s) Clearing cached wallet key device states for homes %@", buf, 0x20u);
  }
}

+ (void)_logSupportedSensitiveFeatures
{
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Features enabled...", (uint8_t *)&v13, 2u);
  }

  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = _os_feature_enabled_impl();
    int v13 = 67109120;
    int v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HOME_ENABLE_AUTOMATION_REVAMP enabled = %{BOOL}d", (uint8_t *)&v13, 8u);
  }

  float v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = _os_feature_enabled_impl();
    int v13 = 67109120;
    int v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HOME_TARGET_BUILDS_COORDINATION compiled in. HOME_HAS_ENABLED_COORDINATION = %{BOOL}d", (uint8_t *)&v13, 8u);
  }

  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109120;
    int v14 = 1;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HM_FEATURE_SIRI_ENDPOINTS_SUPPORTED compiled in. HOME_ENABLE_SIRI_ENDPOINTS = %{BOOL}d", (uint8_t *)&v13, 8u);
  }

  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109120;
    int v14 = 1;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "HOME_SUPPORTS_RESTRICTED_GUEST compiled in. HOME_SUPPORTS_RESTRICTED_GUEST = %{BOOL}d", (uint8_t *)&v13, 8u);
  }

  uint64_t v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = _os_feature_enabled_impl();
    int v13 = 67109120;
    int v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HOME_SUPPORTS_WALLET_KEY_UWB compiled in. HOME_ENABLE_WALLET_KEY_UWB = %{BOOL}d", (uint8_t *)&v13, 8u);
  }

  uint64_t v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = (_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED() != 0;
    int v13 = 67109120;
    int v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "HOME_SUPPORTS_RVC compiled in. HOME_ENABLE_RVC = %{BOOL}d", (uint8_t *)&v13, 8u);
  }
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  int v4 = dispatch_get_global_queue(-2, 0);
  dispatch_async(v4, &stru_1000C24D8);
  float v5 = +[HFHomeKitDispatcher sharedDispatcher];
  [v5 warmup];

  int v6 = +[HFWallpaperManager sharedInstance];
  id v7 = objc_alloc_init((Class)HUNamedWallpaperFactory);
  id v8 = objc_alloc_init((Class)HUProcessedWallpaperFactory);
  [v6 registerWallpaperSource:v7 processedSource:v8];

  uint64_t v9 = +[HFWallpaperManager sharedInstance];
  [v9 preheatCache];

  int v10 = +[NAScheduler globalAsyncScheduler];
  [v10 performBlock:&stru_1000C24F8];

  objc_opt_class();
  id v11 = +[HOMainTabBarController preloadTabIcons];
  BOOL v12 = +[HFMediaServiceManager sharedManager];
  [v12 warmup];

  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  +[HOAppNavigator addViewControllersToRegistry];
  id v6 = +[HOActivationManager sharedInstance];
  id v7 = objc_alloc_init((Class)UIWindow);
  [(HOAppDelegate *)self setWindow:v7];

  id v8 = [(HOAppDelegate *)self window];
  [v8 makeKeyAndVisible];

  uint64_t v9 = +[UIColor hf_keyColor];
  int v10 = [(HOAppDelegate *)self window];
  [v10 setTintColor:v9];

  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    sub_1000060B4(self);
  }
  else if (+[HFUtilities isAnIPad])
  {
    sub_10002185C(self);
  }
  else
  {
    sub_1000219D8(self);
  }
  id v11 = [HOAppNavigationURLHandler alloc];
  BOOL v12 = [(HOAppDelegate *)self navigator];
  int v13 = [(HOAppNavigationURLHandler *)v11 initWithNavigator:v12];
  [(HOAppDelegate *)self setURLHandler:v13];

  id v14 = objc_alloc_init((Class)NAFuture);
  [(HOAppDelegate *)self setApplicationActiveFuture:v14];

  long long v15 = [(HOAppDelegate *)self URLHandler];
  v16 = +[HFUserNotificationCenter sharedInstance];
  [v16 setPresentationHandler:v15];

  uint64_t v17 = [(HOAppDelegate *)self URLHandler];
  __int16 v18 = +[HFOpenURLRouter sharedInstance];
  [v18 setApplicationURLHandler:v17];

  uint64_t v19 = objc_opt_new();
  [(HOAppDelegate *)self setItemIdentifierToBackgroundTaskIdentifierMap:v19];

  __int16 v20 = +[NSNotificationCenter defaultCenter];
  [v20 addObserver:self selector:"startSymptomFixBackgroundTask:" name:HFSymptomFixManagerStartSessionNotification object:0];

  id v21 = +[NSNotificationCenter defaultCenter];
  [v21 addObserver:self selector:"endSymptomFixBackgroundTask:" name:HFSymptomFixManagerEndSessionNotification object:0];

  uint64_t v22 = +[NSNotificationCenter defaultCenter];
  [v22 addObserver:self selector:"startAppleMusicLoginBackgroundTask:" name:HFAppleMusicAccountStartManualLoginNotification object:0];

  uint64_t v23 = +[NSNotificationCenter defaultCenter];
  [v23 addObserver:self selector:"endAppleMusicLoginBackgroundTask:" name:HFAppleMusicAccountEndManualLoginNotification object:0];

  v24 = +[NSNotificationCenter defaultCenter];
  [v24 addObserver:self selector:"navigateToEnergyCategory:" name:@"CompletedUtilityOnboarding" object:0];

  uint64_t v25 = +[UIApplication sharedApplication];
  id v26 = [v25 applicationState];

  v27 = HFLogForCategory();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v26 == (id)2)
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Application state is launched in background", buf, 2u);
    }

    v29 = +[HFExecutionEnvironment sharedInstance];
    [v29 setRunningState:1];
  }
  else
  {
    if (v28)
    {
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Application state is launched in foreground", v39, 2u);
    }

    v30 = +[HFExecutionEnvironment sharedInstance];
    [v30 setRunningState:0];

    v29 = +[HFCharacteristicNotificationManager sharedManager];
    [v29 enableNotificationsForSelectedHomeWithReason:HOAppDelegateNotificationsEnabledReasonForeground];
  }

  id v31 = objc_alloc((Class)HFWiFiExecutionEnvironmentObserver);
  v32 = +[HFExecutionEnvironment sharedInstance];
  v33 = +[HFHomeKitDispatcher sharedDispatcher];
  id v34 = [v31 initWithExecutionEnvironment:v32 dispatcher:v33];
  [(HOAppDelegate *)self setWifiExecutionEnvironmentObserver:v34];

  [(HOAppDelegate *)self _logUserMetrics];
  if (+[HFUtilities isInternalInstall]) {
    +[HOAppDelegate _logSupportedSensitiveFeatures];
  }
  v35 = HFLogForCategory();
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)v38 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, 0x1F4uLL, "HomeAppLaunch", "App Finished Launching!", v38, 2u);
  }

  v36 = [[HOHomeScreenQuickActionController alloc] initWithApplication:v5];
  [(HOAppDelegate *)self setHomeScreenQuickActionController:v36];

  return 1;
}

- (HOAppNavigationURLHandler)URLHandler
{
  return self->_URLHandler;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  id v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)1) {
    return 30;
  }
  id v8 = [(HOAppDelegate *)self window];
  uint64_t v9 = [v8 rootViewController];
  int v10 = [v9 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 30;
  }
  else {
    return 2;
  }
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void)setWifiExecutionEnvironmentObserver:(id)a3
{
}

- (void)setURLHandler:(id)a3
{
}

- (void)setTabBarController:(id)a3
{
}

- (void)setNavigator:(id)a3
{
}

- (void)setItemIdentifierToBackgroundTaskIdentifierMap:(id)a3
{
}

- (void)setHomeScreenQuickActionController:(id)a3
{
}

- (void)setApplicationActiveFuture:(id)a3
{
}

- (HOAppNavigator)navigator
{
  return self->_navigator;
}

- (NAFuture)applicationActiveFuture
{
  return self->_applicationActiveFuture;
}

- (void)_logNonConfiguredAccessoryMetricsWithHomes:(id)a3
{
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = +[HFUtilities isAMac];
  if ((v11 & 1) == 0)
  {
    objc_initWeak(&location, self);
    BOOL v12 = [(HOAppDelegate *)self applicationActiveFuture];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100021C34;
    v15[3] = &unk_1000C2520;
    objc_copyWeak(&v17, &location);
    id v16 = v9;
    id v13 = [v12 addCompletionBlock:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v11 ^ 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v6 = [a4 interaction:a3];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 intent];
    id v9 = [(HOAppDelegate *)self navigator];
    +[HOIntentHandler handleIntent:v8 withNavigator:v9];
  }
  return 1;
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HOAppDelegate *)self homeScreenQuickActionController];

  if (v9)
  {
    id v10 = [(HOAppDelegate *)self homeScreenQuickActionController];
    unsigned __int8 v11 = [(HOAppDelegate *)self navigator];
    BOOL v12 = [v10 performActionForShortcutItem:v7 navigator:v11];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100021E54;
    v14[3] = &unk_1000C2548;
    id v15 = v8;
    id v13 = [v12 addCompletionBlock:v14];
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = +[HFAccessoryDiagnosticsUploadManager backgroundURLSessionIdentifier];
  unsigned int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Handle background URL Session update for identifier:%@.", (uint8_t *)&v12, 0xCu);
    }

    unsigned __int8 v11 = +[HFAccessoryDiagnosticsUploadManager sharedManager];
    [v11 resumeServiceForURLSessionIdentifier:v6];
    [v11 setBackgroundUrlSessionCompletionHandler:v7];
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v3 = +[HFCharacteristicNotificationManager sharedManager];
  [v3 enableNotificationsForSelectedHomeWithReason:HOAppDelegateNotificationsEnabledReasonForeground];

  int v4 = +[HFExecutionEnvironment sharedInstance];
  [v4 executionEnvironmentWillEnterForeground];

  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  [v5 updateHomeSensingState];
}

- (void)applicationWillResignActive:(id)a3
{
  int v4 = +[HFExecutionEnvironment sharedInstance];
  [v4 executionEnvironmentWillResignActive];

  id v5 = objc_alloc_init((Class)NAFuture);
  [(HOAppDelegate *)self setApplicationActiveFuture:v5];
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3 = +[HFExecutionEnvironment sharedInstance];
  [v3 executionEnvironmentDidEnterBackground];

  int v4 = +[HFCharacteristicNotificationManager sharedManager];
  [v4 disableNotificationsForSelectedHomeWithReason:HOAppDelegateNotificationsEnabledReasonBackground];

  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  id v6 = [v5 homeManager];
  id v7 = [v6 homes];
  [v7 na_each:&stru_1000C25C8];

  +[HOWidgetUpdater updateAllWidgetsThatHaveTimelines];
}

- (void)startSymptomFixBackgroundTask:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 userInfo];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 objectForKeyedSubscript:symptomItemIdentifierKey];

  if (v8)
  {
    [(HOAppDelegate *)self _startBackgroundTaskWithItemIdentifier:v8];
  }
  else
  {
    unsigned int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100082C04();
    }
  }
}

- (void)endSymptomFixBackgroundTask:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 userInfo];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 objectForKeyedSubscript:symptomItemIdentifierKey];

  if (v8)
  {
    [(HOAppDelegate *)self _endBackgroundTaskWithItemIdentifier:v8];
  }
  else
  {
    unsigned int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100082C6C();
    }
  }
}

- (void)startAppleMusicLoginBackgroundTask:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 userInfo];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 objectForKeyedSubscript:symptomItemIdentifierKey];

  if (v8)
  {
    [(HOAppDelegate *)self _startBackgroundTaskWithItemIdentifier:v8];
  }
  else
  {
    unsigned int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100082C04();
    }
  }
}

- (void)endAppleMusicLoginBackgroundTask:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 userInfo];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 objectForKeyedSubscript:symptomItemIdentifierKey];

  if (v8)
  {
    [(HOAppDelegate *)self _endBackgroundTaskWithItemIdentifier:v8];
  }
  else
  {
    unsigned int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100082C6C();
    }
  }
}

- (void)_startBackgroundTaskWithItemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v5 = +[UIApplication sharedApplication];
  id v6 = [v4 UUIDString];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100022848;
  v13[3] = &unk_1000C25F0;
  id v7 = v4;
  id v15 = self;
  id v16 = &v17;
  id v14 = v7;
  id v8 = [v5 beginBackgroundTaskWithName:v6 expirationHandler:v13];

  v18[3] = (uint64_t)v8;
  unsigned int v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v18[3];
    *(_DWORD *)buf = 138412546;
    id v22 = v7;
    __int16 v23 = 2048;
    uint64_t v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Began background task for itemID = %@ - taskID = %lu", buf, 0x16u);
  }

  unsigned __int8 v11 = [(HOAppDelegate *)self itemIdentifierToBackgroundTaskIdentifierMap];
  int v12 = +[NSNumber numberWithUnsignedInteger:v18[3]];
  [v11 setObject:v12 forKey:v7];

  _Block_object_dispose(&v17, 8);
}

- (void)_endBackgroundTaskWithItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HOAppDelegate *)self itemIdentifierToBackgroundTaskIdentifierMap];
  id v6 = [v5 objectForKey:v4];
  id v7 = [v6 unsignedIntegerValue];

  if (v7)
  {
    [(HOAppDelegate *)self _endBackgroundTaskWithTaskIdentifier:v7];
    id v8 = [(HOAppDelegate *)self itemIdentifierToBackgroundTaskIdentifierMap];
    [v8 removeObjectForKey:v4];
  }
  else
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100082CD4();
    }
  }
}

- (void)_endBackgroundTaskWithTaskIdentifier:(unint64_t)a3
{
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ending background task with taskID %lu", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[UIApplication sharedApplication];
  [v5 endBackgroundTask:a3];
}

- (void)navigateToEnergyCategory:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = self;
    __int16 v16 = 2080;
    uint64_t v17 = "-[HOAppDelegate navigateToEnergyCategory:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%s Received onboarding notification", (uint8_t *)&v14, 0x16u);
  }

  int v6 = [v4 userInfo];

  unint64_t v7 = [v6 objectForKey:@"onboardedHome"];

  if (v7)
  {
    unsigned int v8 = [v7 hf_isHomeEnergyHomeEmpty];
    unsigned int v9 = [(HOAppDelegate *)self navigator];
    uint64_t v10 = v9;
    if (v8)
    {
      id v11 = [v9 showHome:v7];
    }
    else
    {
      int v12 = +[HFAccessoryTypeGroup energyAccessoryTypeGroup];
      id v13 = [v10 showAccessoryTypeGroup:v12 forHome:v7 animated:1];
    }
  }
}

- (HFWiFiExecutionEnvironmentObserver)wifiExecutionEnvironmentObserver
{
  return self->_wifiExecutionEnvironmentObserver;
}

- (UITabBarController)tabBarController
{
  return self->_tabBarController;
}

- (HOSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (void)setSplitViewController:(id)a3
{
}

- (HOHomeScreenQuickActionController)homeScreenQuickActionController
{
  return self->_homeScreenQuickActionController;
}

- (NSMutableDictionary)itemIdentifierToBackgroundTaskIdentifierMap
{
  return self->_itemIdentifierToBackgroundTaskIdentifierMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifierToBackgroundTaskIdentifierMap, 0);
  objc_storeStrong((id *)&self->_applicationActiveFuture, 0);
  objc_storeStrong((id *)&self->_homeScreenQuickActionController, 0);
  objc_storeStrong((id *)&self->_URLHandler, 0);
  objc_storeStrong((id *)&self->_navigator, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_wifiExecutionEnvironmentObserver, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

- (void)_runExtendedLaunchTestWithApplication:(id)a3 options:(id)a4
{
  [a3 startedTest:@"ExtendedLaunch PPT" a4];
  id v5 = [(HOAppDelegate *)self baseViewController];
}

- (void)_runTabSwitchToAutomationTestWithApplication:(id)a3 options:(id)a4
{
  id v5 = a3;
  int v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PPT - Switch to automation tab", buf, 2u);
  }

  unint64_t v7 = [(HOAppDelegate *)self baseViewController];
  if (v7)
  {
    unsigned int v8 = [(HOAppDelegate *)self _firstReadCompleteFuture];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002B454;
    v21[3] = &unk_1000C2BA8;
    id v9 = v5;
    id v22 = v9;
    __int16 v23 = @"tabSwitchToAutomation";
    id v24 = v7;
    uint64_t v10 = [v8 flatMap:v21];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002B4A0;
    v18[3] = &unk_1000C2BD0;
    id v11 = v9;
    id v19 = v11;
    uint64_t v20 = @"tabSwitchToAutomation";
    int v12 = [v10 addSuccessBlock:v18];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002B4B4;
    v15[3] = &unk_1000C2BF8;
    id v16 = v11;
    uint64_t v17 = @"tabSwitchToAutomation";
    id v13 = [v12 addFailureBlock:v15];
  }
  else
  {
    int v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100082E30();
    }

    [v5 failedTest:@"tabSwitchToAutomation"];
  }
}

- (void)_runScrollAutomationTestWithApplication:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PPT - Scrolling automation tab", buf, 2u);
  }

  uint64_t v10 = [(HOAppDelegate *)self baseViewController];
  id v11 = v10;
  if (v10)
  {
    int v12 = [v10 selectTabWithIdentifier:HFHomeAppTabIdentifierTriggers];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002B6C8;
    v19[3] = &unk_1000C2C20;
    SEL v22 = a2;
    v19[4] = self;
    id v20 = v8;
    id v21 = @"scrollAutomation";
    id v13 = [v12 addSuccessBlock:v19];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002B8AC;
    v16[3] = &unk_1000C2BF8;
    id v17 = v7;
    __int16 v18 = @"scrollAutomation";
    id v14 = [v13 addFailureBlock:v16];
  }
  else
  {
    id v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100082E64();
    }

    [v7 failedTest:@"scrollAutomation"];
  }
}

- (void)_runAddRoomTestWithApplication:(id)a3 options:(id)a4
{
  id v5 = a3;
  int v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PPT - Add a room", buf, 2u);
  }

  id v7 = [(HOAppDelegate *)self baseViewController];
  if (v7)
  {
    id v8 = +[HFHomeKitDispatcher sharedDispatcher];
    id v9 = [v8 home];

    id v10 = [objc_alloc((Class)HFRoomBuilder) initWithHome:v9];
    [v10 setName:@"PPT-Room"];
    [v5 startedTest:@"addRoom"];
    id v11 = [v10 commitItem];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002BB80;
    v24[3] = &unk_1000C2C48;
    id v12 = v5;
    id v25 = v12;
    id v26 = @"addRoom";
    id v13 = [v11 addSuccessBlock:v24];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002BB8C;
    v21[3] = &unk_1000C2BF8;
    id v22 = v12;
    __int16 v23 = @"addRoom";
    id v14 = [v13 addFailureBlock:v21];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002BBE8;
    v18[3] = &unk_1000C2C70;
    void v18[4] = self;
    id v19 = @"PPT-Room";
    id v20 = v9;
    id v15 = v9;
    id v16 = [v14 addCompletionBlock:v18];
  }
  else
  {
    id v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100082E98();
    }

    [v5 failedTest:@"addRoom"];
  }
}

- (void)_runDeleteRoomTestWithApplication:(id)a3 options:(id)a4
{
  id v5 = a3;
  int v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PPT - delete a room", buf, 2u);
  }

  id v7 = [(HOAppDelegate *)self baseViewController];
  if (v7)
  {
    id v8 = +[HFHomeKitDispatcher sharedDispatcher];
    id v9 = [v8 home];

    id v10 = [objc_alloc((Class)HFRoomBuilder) initWithHome:v9];
    [v10 setName:@"PPT-Room"];
    id v11 = [v10 commitItem];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10002BEBC;
    v25[3] = &unk_1000C2C98;
    id v12 = v5;
    id v26 = v12;
    v27 = @"deleteRoom";
    id v28 = v9;
    id v13 = v9;
    id v14 = [v11 flatMap:v25];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002BF48;
    v22[3] = &unk_1000C2CC0;
    id v15 = v12;
    id v23 = v15;
    id v24 = @"deleteRoom";
    id v16 = [v14 addSuccessBlock:v22];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002BF54;
    v19[3] = &unk_1000C2BF8;
    id v20 = v15;
    id v21 = @"deleteRoom";
    id v17 = [v14 addFailureBlock:v19];
  }
  else
  {
    __int16 v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100082ECC();
    }

    [v5 failedTest:@"deleteRoom"];
  }
}

- (void)_runPresentHomeSettingsTestWithApplication:(id)a3 options:(id)a4
{
  id v5 = a3;
  int v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PPT - present home settings", buf, 2u);
  }

  id v7 = [(HOAppDelegate *)self baseViewController];
  if (v7
    && ([(HOAppDelegate *)self appNavigator],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = [v7 selectTabWithIdentifier:HFHomeAppTabIdentifierHome];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002C19C;
    v16[3] = &unk_1000C2CE8;
    id v10 = v5;
    id v17 = v10;
    __int16 v18 = @"presentHomeSettings";
    id v19 = self;
    id v11 = [v9 addSuccessBlock:v16];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002C364;
    v13[3] = &unk_1000C2BF8;
    id v14 = v10;
    id v15 = @"presentHomeSettings";
    id v12 = [v11 addFailureBlock:v13];
  }
  else
  {
    [v5 failedTest:@"presentHomeSettings" withFailure:@"Invalid controller"];
  }
}

- (void)_runPresentNetworkSettingsTestWithApplication:(id)a3 options:(id)a4
{
  id v5 = a3;
  int v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PPT - present network settings", buf, 2u);
  }

  id v7 = [(HOAppDelegate *)self baseViewController];
  if (v7
    && ([(HOAppDelegate *)self appNavigator],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = [v7 selectTabWithIdentifier:HFHomeAppTabIdentifierHome];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002C55C;
    v16[3] = &unk_1000C2CE8;
    id v10 = v5;
    id v17 = v10;
    __int16 v18 = @"presentNetworkSettings";
    id v19 = self;
    id v11 = [v9 addSuccessBlock:v16];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002C754;
    v13[3] = &unk_1000C2BF8;
    id v14 = v10;
    id v15 = @"presentNetworkSettings";
    id v12 = [v11 addFailureBlock:v13];
  }
  else
  {
    [v5 failedTest:@"presentNetworkSettings" withFailure:@"Invalid controller"];
  }
}

- (void)_runPresentNetworkRouterSettingsTestWithApplication:(id)a3 options:(id)a4
{
  id v5 = a3;
  int v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PPT - present network router settings", buf, 2u);
  }

  id v7 = [(HOAppDelegate *)self baseViewController];
  if (v7
    && ([(HOAppDelegate *)self appNavigator],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = [v7 selectTabWithIdentifier:HFHomeAppTabIdentifierHome];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002C94C;
    v16[3] = &unk_1000C2CE8;
    id v10 = v5;
    id v17 = v10;
    __int16 v18 = @"presentNetworkRouterSettings";
    id v19 = self;
    id v11 = [v9 addSuccessBlock:v16];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002CB48;
    v13[3] = &unk_1000C2BF8;
    id v14 = v10;
    id v15 = @"presentNetworkRouterSettings";
    id v12 = [v11 addFailureBlock:v13];
  }
  else
  {
    [v5 failedTest:@"presentNetworkRouterSettings" withFailure:@"Invalid controller"];
  }
}

- (void)_runPresentNetworkConfigurationSettingsTestWithApplication:(id)a3 options:(id)a4
{
  id v5 = a3;
  int v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PPT - present network configuration settings", buf, 2u);
  }

  id v7 = [(HOAppDelegate *)self baseViewController];
  if (v7
    && ([(HOAppDelegate *)self appNavigator],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = [v7 selectTabWithIdentifier:HFHomeAppTabIdentifierHome];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002CD64;
    v17[3] = &unk_1000C2CE8;
    id v10 = v5;
    id v18 = v10;
    id v19 = @"presentNetworkConfigurationSettings";
    id v20 = self;
    id v11 = [v9 addSuccessBlock:v17];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002CF98;
    v14[3] = &unk_1000C2BF8;
    id v15 = v10;
    id v16 = @"presentNetworkConfigurationSettings";
    id v12 = [v11 addFailureBlock:v14];
  }
  else
  {
    id v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100082F00();
    }

    [v5 failedTest:@"presentNetworkConfigurationSettings"];
  }
}

- (void)_runScrollCameraClipsInPlayerTestWithApplication:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PPT - scroll camera clips", buf, 2u);
  }

  objc_opt_class();
  id v9 = [v7 objectForKeyedSubscript:@"cameraUUID"];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11) {
    id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v11];
  }
  else {
    id v12 = 0;
  }
  *(void *)buf = 0;
  v42 = buf;
  uint64_t v43 = 0x3032000000;
  v44 = sub_10002D3B8;
  v45 = sub_10002D3C8;
  id v46 = 0;
  id v13 = [(HOAppDelegate *)self baseViewController];
  if (v13
    && ([(HOAppDelegate *)self appNavigator],
        id v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    id v15 = [(HOAppDelegate *)self _selectAndFinishFirstReadForTabWithIdentifier:HFHomeAppTabIdentifierHome];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10002D3D0;
    v35[3] = &unk_1000C2D10;
    v40 = buf;
    id v16 = v6;
    id v36 = v16;
    v37 = @"scrollCameraClips";
    v38 = self;
    id v39 = v12;
    id v17 = [v15 flatMap:v35];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10002D5C0;
    v31[3] = &unk_1000C2D38;
    id v34 = buf;
    id v18 = v16;
    id v32 = v18;
    v33 = @"scrollCameraClips";
    id v19 = [v17 flatMap:v31];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10002D664;
    v26[3] = &unk_1000C2D60;
    v30 = buf;
    id v20 = v18;
    id v27 = v20;
    id v28 = @"scrollCameraClips";
    id v29 = v7;
    id v21 = [v19 addSuccessBlock:v26];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10002D788;
    v23[3] = &unk_1000C2BF8;
    id v24 = v20;
    id v25 = @"scrollCameraClips";
    id v22 = [v21 addFailureBlock:v23];
  }
  else
  {
    [v6 failedTest:@"scrollCameraClips" withFailure:@"Invalid controller"];
  }

  _Block_object_dispose(buf, 8);
}

- (void)_runToggleLightTestWithApplication:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PPT - toggling light", buf, 2u);
  }

  id v7 = [(HOAppDelegate *)self baseViewController];
  if (v7
    && ([(HOAppDelegate *)self appNavigator],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = [(HOAppDelegate *)self _selectAndFinishFirstReadForTabWithIdentifier:HFHomeAppTabIdentifierHome];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002D9CC;
    v16[3] = &unk_1000C2BD0;
    id v10 = v5;
    id v17 = v10;
    id v18 = @"toggleLight";
    id v11 = [v9 addSuccessBlock:v16];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002DC98;
    v13[3] = &unk_1000C2BF8;
    id v14 = v10;
    id v15 = @"toggleLight";
    id v12 = [v11 addFailureBlock:v13];
  }
  else
  {
    [v5 failedTest:@"toggleLight" withFailure:@"Invalid controller"];
  }
}

- (void)_runToggleSceneTestWithApplication:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PPT - toggling scene", buf, 2u);
  }

  id v7 = [(HOAppDelegate *)self baseViewController];
  if (v7
    && ([(HOAppDelegate *)self appNavigator],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = [(HOAppDelegate *)self _selectAndFinishFirstReadForTabWithIdentifier:HFHomeAppTabIdentifierHome];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002DE8C;
    v16[3] = &unk_1000C2BD0;
    id v10 = v5;
    id v17 = v10;
    id v18 = @"toggleScene";
    id v11 = [v9 addSuccessBlock:v16];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002E09C;
    v13[3] = &unk_1000C2BF8;
    id v14 = v10;
    id v15 = @"toggleScene";
    id v12 = [v11 addFailureBlock:v13];
  }
  else
  {
    [v5 failedTest:@"toggleScene" withFailure:@"Invalid controller"];
  }
}

- (id)_firstReadCompleteFuture
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  id v3 = [v2 homeFuture];
  id v4 = [v3 flatMap:&stru_1000C2E28];

  return v4;
}

- (id)_selectAndFinishFirstReadForTabWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HOAppDelegate *)self baseViewController];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 selectTabWithIdentifier:v4];
    v18[0] = v7;
    id v8 = +[HFHomeKitDispatcher sharedDispatcher];
    id v9 = [v8 homeFuture];
    v18[1] = v9;
    id v10 = +[NSArray arrayWithObjects:v18 count:2];
    id v11 = +[NAFuture combineAllFutures:v10];
    id v12 = [v11 flatMap:&stru_1000C2E68];

    id v13 = [v12 flatMap:&stru_1000C2EA8];
    id v14 = [v13 flatMap:&stru_1000C2EF0];
    id v15 = [v14 flatMap:&stru_1000C2F58];
  }
  else
  {
    id v16 = +[NSError na_genericError];
    id v15 = +[NAFuture futureWithError:v16];
  }

  return v15;
}

- (id)_networkRouterForTestingInHome:(id)a3
{
  id v3 = [a3 hf_allNetworkRouterAccessories];
  id v4 = [v3 sortedArrayUsingComparator:&stru_1000C2F98];
  id v5 = [v4 firstObject];

  return v5;
}

- (id)_networkConfigurationProfileForTestingInHome:(id)a3
{
  id v3 = [a3 hf_allNetworkConfigurationProfiles];
  id v4 = [v3 sortedArrayUsingComparator:&stru_1000C2FD8];
  id v5 = [v4 firstObject];

  return v5;
}

- (id)_sortedAccessoriesInHome:(id)a3
{
  id v3 = [a3 accessories];
  id v4 = [v3 sortedArrayUsingComparator:&stru_1000C2FF8];

  return v4;
}

- (void)_deleteRoomWithName:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 rooms];
  if ([v7 count])
  {
    id v8 = +[NSPredicate predicateWithFormat:@"name == %@", v5];
    id v9 = [v7 filteredArrayUsingPredicate:v8];
    if ([v9 count])
    {
      id v10 = [v9 firstObject];
      [v6 removeRoom:v10 completionHandler:&stru_1000C3018];
    }
    else
    {
      id v10 = HFLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100082F68((uint64_t)v5, v10);
      }
    }
  }
  else
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100082F34();
    }
  }
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v5 = a5;
  if (!a4)
  {
    char v8 = 0;
    uint64_t v10 = 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  char v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (v5) {
LABEL_3:
  }
    id v5 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  id v11 = a3;
  id v12 = self;
  v16.value.super.super.isa = (Class)a3;
  v16.is_nil = v8;
  v13.value._countAndFlagsBits = v10;
  v13.value._object = v5;
  Swift::Bool v14 = HOAppDelegate.application(_:runTest:options:)(v16, v13, v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

+ (NSString)itemManagerUpdatesDisabledReasonScrollPerformanceTest
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (id)firstReadCompleteFuture
{
  id CompleteFutureSo8NAFutureCySo6NSNullCGyF_0 = _sSo13HOAppDelegateC7HomeAppE23firstReadCompleteFutureSo8NAFutureCySo6NSNullCGyF_0();

  return CompleteFutureSo8NAFutureCySo6NSNullCGyF_0;
}

- (HOBaseControllerDelegate)baseViewController
{
  NSString v2 = self;
  result = [(HOAppDelegate *)v2 window];
  if (result)
  {
    id v4 = result;
    id v5 = [(HOBaseControllerDelegate *)result rootViewController];

    if (v5)
    {
      id v6 = (void *)swift_dynamicCastObjCProtocolConditional();

      if (!v6) {
    }
      }
    else
    {

      id v6 = 0;
    }
    return (HOBaseControllerDelegate *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (HOAppNavigator)appNavigator
{
  NSString v2 = self;
  id v3 = HOAppDelegate.appNavigator.getter();

  return (HOAppNavigator *)v3;
}

- (id)serviceLikeItemWithItem:(id)a3 itemManager:(id)a4 withID:(id)a5
{
  uint64_t v9 = sub_10000D858((uint64_t *)&unk_1000DD8F0);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  id v15 = a4;
  UIApplication_optional v16 = self;
  Swift::OpaquePointer_optional v17 = _sSo13HOAppDelegateC7HomeAppE15serviceLikeItem4item0H7Manager6withIDSo09HFServicefG0_So6HFItemCXcSgAJ_So0mI0C10Foundation4UUIDVSgtF_0(v14, v15, (uint64_t)v11);

  sub_100003950((uint64_t)v11, (uint64_t *)&unk_1000DD8F0);

  return v17;
}

- (id)findPreferredAccessoryWithItemManager:(id)a3 accessoryID:(id)a4 with:(id)a5
{
  uint64_t v9 = sub_10000D858((uint64_t *)&unk_1000DD8F0);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = type metadata accessor for UUID();
    uint64_t v14 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    uint64_t v15 = type metadata accessor for UUID();
    uint64_t v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
  }
  __chkstk_darwin(v14);
  *(&v20 - 2) = (uint64_t)v12;
  id v16 = a3;
  Swift::OpaquePointer_optional v17 = self;
  id v18 = (void *)HOAppDelegate.findPreferredAccessory(itemManager:accessoryID:with:)(v16, (uint64_t)v11, (uint64_t (*)(id, id))sub_100080A5C, (uint64_t)(&v20 - 4));

  sub_100003950((uint64_t)v11, (uint64_t *)&unk_1000DD8F0);
  _Block_release(v12);

  return v18;
}

- (id)findAccessoryWithItemManager:(id)a3 accessoryID:(id)a4 testBlock:(id)a5
{
  uint64_t v9 = sub_10000D858((uint64_t *)&unk_1000DD8F0);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  _Block_copy(v12);
  id v15 = a3;
  id v16 = self;
  sub_1000805CC(v15, (uint64_t)v11, v16, (uint64_t)v12);
  id v18 = v17;
  _Block_release(v12);

  sub_100003950((uint64_t)v11, (uint64_t *)&unk_1000DD8F0);
  _Block_release(v12);

  return v18;
}

- (id)homeKitObjectIDFrom:(id)a3 userDefaultsEnabled:(BOOL)a4
{
  uint64_t v5 = sub_10000D858((uint64_t *)&unk_1000DD8F0);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = self;
  HOAppDelegate.homeKitObjectID(from:userDefaultsEnabled:)(v8, (uint64_t)v7);

  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }

  return isa;
}

- (id)_runScrollTestWithTestName:(id)a3 scrollView:(id)a4 options:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a4;
  uint64_t v12 = self;
  id v13 = sub_100079A84(v7, v9, v11, v10, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

- (id)_cameraProfileForTestingInHome:(id)a3 withUUID:(id)a4
{
  uint64_t v7 = sub_10000D858((uint64_t *)&unk_1000DD8F0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  id v12 = a3;
  id v13 = self;
  uint64_t v14 = (void *)sub_10007F36C(v12, (uint64_t)v9);

  sub_100003950((uint64_t)v9, (uint64_t *)&unk_1000DD8F0);

  return v14;
}

@end