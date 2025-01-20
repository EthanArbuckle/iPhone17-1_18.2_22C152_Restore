@interface MTAppDelegate_Shared
- (BOOL)_hasMainWindow;
- (BOOL)_isApplicationActive;
- (BOOL)_isApplicationTerminating;
- (BOOL)_mainWindowIsKey;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)canOpenURL:(id)a3;
- (MTAppController)appController;
- (MTAppDelegate_Shared)init;
- (MTBackgroundTaskScheduler)backgroundTaskScheduler;
- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager;
- (MTSiriPlistDumper)siriDumper;
- (NSOperationQueue)updateQueue;
- (PFFairPlayValidationManager)fairPlayValidationManager;
- (UIViewController)rootViewController;
- (UIWindow)window;
- (_TtC18PodcastsFoundation11SiriDonator)siriDonator;
- (int64_t)_hostWindowLayoutDirection;
- (unint64_t)fairPlayMigrationBackgroundTask;
- (unint64_t)processNotification:(id)a3;
- (void)_setNeedsRetryFlagFromNotificationForStoreId:(int64_t)a3;
- (void)_setupPlayer;
- (void)_submitForegroundAnalytics;
- (void)_validateFairPlayEpisodes;
- (void)_validateFairPlayEpisodesWithCompletionHandler:(id)a3;
- (void)_verifyFairPlayMigrationWithCompletionHandler:(id)a3;
- (void)application:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4;
- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5;
- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4;
- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationDidReceiveMemoryWarning:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)dealloc;
- (void)didChangeStoreAccount:(id)a3;
- (void)processFeedUpdateNotification:(int64_t)a3 triggerBy:(id)a4;
- (void)processSubscriptionSyncNotification;
- (void)processUPPSyncNotification;
- (void)setAppController:(id)a3;
- (void)setBackgroundTaskScheduler:(id)a3;
- (void)setFairPlayMigrationBackgroundTask:(unint64_t)a3;
- (void)setWindow:(id)a3;
- (void)setupAfterBecomingActive;
- (void)storeAccountDidChange;
@end

@implementation MTAppDelegate_Shared

- (MTSiriPlistDumper)siriDumper
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008CE0;
  block[3] = &unk_10054D570;
  block[4] = self;
  if (qword_10060A608 != -1) {
    dispatch_once(&qword_10060A608, block);
  }
  return self->_siriDumper;
}

- (void)_submitForegroundAnalytics
{
  id v3 = (id)objc_opt_new();
  v2 = +[PFAnalyticsEvent globalRetentionPolicy];
  [v3 sendEvent:v2];
}

- (void)_validateFairPlayEpisodes
{
  id v3 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  id v4 = [v3 fairPlayMigrationRetryCount];

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100059130;
    v5[3] = &unk_10054D570;
    v5[4] = self;
    [(MTAppDelegate_Shared *)self _validateFairPlayEpisodesWithCompletionHandler:v5];
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100061230;
    v6[3] = &unk_10054D570;
    v6[4] = self;
    [(MTAppDelegate_Shared *)self _verifyFairPlayMigrationWithCompletionHandler:v6];
  }
}

- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4
{
  id v4 = a4;
  id v5 = +[MTPushNotificationController sharedInstance];
  [v5 didRegisterWithToken:v4];
}

- (MTAppDelegate_Shared)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTAppDelegate_Shared;
  v2 = [(MTAppDelegate_Shared *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.podcasts.AppDelegateAccountChangeQueue", 0);
    accountChangeQueue = v2->_accountChangeQueue;
    v2->_accountChangeQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BOOL)_isApplicationActive
{
  v2 = +[UIApplication sharedApplication];
  BOOL v3 = [v2 applicationState] == 0;

  return v3;
}

- (PFFairPlayValidationManager)fairPlayValidationManager
{
  fairPlayValidationManager = self->_fairPlayValidationManager;
  if (!fairPlayValidationManager)
  {
    id v4 = objc_alloc((Class)PFFairPlayValidationManager);
    id v5 = +[MTLibrary sharedInstance];
    objc_super v6 = (PFFairPlayValidationManager *)[v4 initWithEpisodeRemovalManager:v5];
    v7 = self->_fairPlayValidationManager;
    self->_fairPlayValidationManager = v6;

    fairPlayValidationManager = self->_fairPlayValidationManager;
  }

  return fairPlayValidationManager;
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v3 = a3;
  id v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = MTApplicationDidBecomeActiveNotification;
  objc_super v6 = +[UIApplication sharedApplication];
  [v4 postNotificationName:v5 object:v6];

  id v8 = +[PodcastsApplicationStateMonitor shared];
  id v7 = [v3 applicationState];

  [v8 setUIApplicationState:v7];
}

- (void)_verifyFairPlayMigrationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(2, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DA08;
  v7[3] = &unk_10054D738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_validateFairPlayEpisodesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PFFairPlayRolloutController sharedInstance];
  unsigned int v6 = [v5 isEnabled];

  if (v6)
  {
    id v7 = [(MTAppDelegate_Shared *)self fairPlayValidationManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100058C60;
    v13[3] = &unk_10054D6C0;
    id v14 = v4;
    id v8 = v4;
    [v7 validateDownloadedEpisodesWithCompletion:v13];

    id v9 = v14;
  }
  else
  {
    id v8 = objc_alloc_init((Class)_TtC10PodcastsUI23UIStoreResponseDelegate);
    v10 = [(MTAppDelegate_Shared *)self secureDownloadRenewalManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100061244;
    v11[3] = &unk_10054D6E8;
    id v12 = v4;
    id v9 = v4;
    [v10 updateDRMKeysForDownloadsWithUrlProtocolDelegate:v8 completionHandler:v11];
  }
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 userInfo];
  NSLog(@"Continue Activity! %@", v9);

  v10 = [v8 activityType];
  unsigned int v11 = [v10 isEqualToString:NSUserActivityTypeBrowsingWeb];

  if (v11)
  {
    id v12 = [v8 webpageURL];
    [(MTAppDelegate_Shared *)self application:v7 openURL:v12 options:&__NSDictionary0__struct];

LABEL_9:
    unsigned __int8 v18 = 1;
    goto LABEL_10;
  }
  if ([v8 isStateRestorationActivity])
  {
    [(MTAppDelegate_Shared *)self application:v7 handleStateRestorationWith:v8];
    goto LABEL_9;
  }
  v13 = [v8 userInfo];
  +[IMMetrics recordUserAction:@"handoff" dataSource:0 withData:v13];

  id v14 = +[MTIntentDonationUtil sharedInstance];
  v15 = [v8 activityType];
  unsigned int v16 = [v14 canContinueIntentWithUserActivityType:v15];

  if (!v16)
  {
    if ((os_feature_enabled_bluemoon() & 1) == 0)
    {
      v19 = +[MTHandoffController sharedInstance];
      [v19 continueActivity:v8];
    }
    goto LABEL_9;
  }
  v17 = +[MTIntentDonationUtil sharedInstance];
  unsigned __int8 v18 = [v17 continueIntentsUserActivity:v8];

LABEL_10:
  return v18;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  uint64_t v5 = +[IMNetworkObserver sharedInstance];
  [v5 beginObserving];

  if (+[DebugUtil isInternalInstall])
  {
    unsigned int v6 = +[NSUserDefaults standardUserDefaults];
    unsigned int v7 = [v6 BOOLForKey:@"EnableCharlesSupport"];

    if (v7) {
      +[AMSDefaults setIgnoreServerTrustEvaluation:1];
    }
  }
  id v8 = +[MTAccountController sharedInstance];
  +[UIViewController swizzleMethodsForMetrics];
  +[MTDebugDataManager setup];
  id v9 = +[MTDeviceCapacityMonitor shared];
  [v9 setActiveNotificationName:MTApplicationDidBecomeActiveNotification];
  id v10 = +[MTReachability sharedInstance];
  id v11 = +[MTLibrary sharedInstance];
  if ((os_feature_enabled_bluemoon() & 1) == 0) {
    [(MTAppDelegate_Shared *)self _setupPlayer];
  }
  id v12 = [(MTAppDelegate_Shared *)self backgroundTaskScheduler];

  if (!v12)
  {
    +[MTBackgroundTaskScheduler registerBackgroundTaskClass:objc_opt_class()];
    v13 = objc_alloc_init(MTBackgroundTaskScheduler);
    [(MTAppDelegate_Shared *)self setBackgroundTaskScheduler:v13];
  }
  return 1;
}

- (void)setupAfterBecomingActive
{
  id v3 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MTAppDelegate_Shared setupAfterBecomingActive", (uint8_t *)&v11, 2u);
  }

  id v4 = +[PFDeferredLaunchTaskCoordinator sharedInstance];
  [v4 scheduleDefaultDeferralDeadline];

  if ([(MTAppDelegate_Shared *)self _isApplicationActive])
  {
    uint64_t v5 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "MTAppDelegate_Shared Application is Active!", (uint8_t *)&v11, 2u);
    }

    if (qword_10060A5F0 != -1) {
      dispatch_once(&qword_10060A5F0, &stru_10054D758);
    }
    unsigned int v6 = +[MTForegroundSyncUtil sharedInstance];
    [v6 syncEverythingIfNeeded];

    unsigned int v7 = dispatch_get_global_queue(0, 0);
    dispatch_async(v7, &stru_10054D818);

    id v8 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = +[NSNumber numberWithDouble:2.0];
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will start deleting hidden podcasts in %@ seconds", (uint8_t *)&v11, 0xCu);
    }
    dispatch_time_t v10 = dispatch_time(0, 2000000000);
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, &stru_10054D858);
  }
  +[IMMetrics endTimer:@"app_resume"];
  +[IMMetrics endTimer:@"app_launch"];
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = +[IMNetworkObserver sharedInstance];
  [v4 beginObserving];

  uint64_t v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = MTApplicationWillEnterForegroundNotification;
  unsigned int v7 = +[UIApplication sharedApplication];
  [v5 postNotificationName:v6 object:v7];

  +[IMMetrics startTimer:@"app_resume"];
  id v8 = +[PFRestrictionsController shared];
  [v8 startListening];

  id v9 = +[PFRestrictionsController shared];
  [v9 reload];

  dispatch_time_t v10 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Foreground Sync] Application will enter foreground", buf, 2u);
  }

  int v11 = dispatch_get_global_queue(0, 0);
  dispatch_async(v11, &stru_10054D630);

  id v12 = +[MTForegroundSyncUtil sharedInstance];
  [v12 updatePlaybackSettingIfNeeded];

  v13 = +[MTForegroundSyncUtil sharedInstance];
  [v13 setNeedsSyncing];

  id v14 = +[MTForegroundSyncUtil sharedInstance];
  [v14 feedUpdateAllPodcastsOnForeground];

  v15 = +[MTPurchaseControllerWrapper sharedInstance];
  [v15 syncMusicSubscriptionInformation];

  [(MTAppDelegate_Shared *)self _validateFairPlayEpisodes];
  unsigned int v16 = +[ICUserIdentity activeAccount];
  v17 = +[MPCloudController controllerWithUserIdentity:v16];
  [v17 processPendingKeyInvalidations];

  unsigned __int8 v18 = +[PFSharedDispatchQueues localAssetSupportWorkQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059050;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async(v18, block);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = MTApplicationDidFinishLaunchingNotification;
  id v8 = +[UIApplication sharedApplication];
  [v6 postNotificationName:v7 object:v8];

  id v9 = +[PodcastsApplicationStateMonitor shared];
  id v10 = [v5 applicationState];

  [v9 setUIApplicationState:v10];
  int v11 = +[MTPushNotificationController sharedInstance];
  [v11 registerPushNotifications];

  id v12 = dispatch_get_global_queue(0, 0);
  dispatch_async(v12, &stru_10054D590);

  if ((os_feature_enabled_bluemoon() & 1) == 0) {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10054D5B0);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10054D5D0);
  v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"didChangeStoreAccount:" name:ACDAccountStoreDidChangeNotification object:0];

  id v14 = +[NSNotificationCenter defaultCenter];
  [v14 addObserver:self selector:"didChangeStoreAccountDSID" name:@"AccountDSIDChangedNotification" object:0];

  v15 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "MTAppDelegate_Shared SiriX donation will begin", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007B30;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async(v12, block);

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10054D5F0);
  return 1;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void)setFairPlayMigrationBackgroundTask:(unint64_t)a3
{
  self->_fairPlayMigrationBackgroundTask = a3;
}

- (void)setBackgroundTaskScheduler:(id)a3
{
}

- (void)setAppController:(id)a3
{
}

- (unint64_t)fairPlayMigrationBackgroundTask
{
  return self->_fairPlayMigrationBackgroundTask;
}

- (MTBackgroundTaskScheduler)backgroundTaskScheduler
{
  return self->backgroundTaskScheduler;
}

- (MTAppController)appController
{
  return self->_appController;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTAppDelegate_Shared;
  [(MTAppDelegate_Shared *)&v4 dealloc];
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v5 = a4;
  uint64_t v6 = [v5 absoluteString];
  unsigned int v7 = +[MTDBUtil isSupportedUrlString:v6];

  if (v7)
  {
    id v8 = [v5 absoluteString];
    unsigned int v9 = [v8 hasPrefix:@"feed:http"];

    if (v9)
    {
      id v10 = [v5 absoluteString];
      int v11 = [v10 stringByReplacingOccurrencesOfString:@"feed:" withString:&stru_10056A8A0 options:8 range:0, 5];

      uint64_t v12 = +[NSURL URLWithString:v11];

      id v5 = (id)v12;
    }
    v13 = [v5 scheme];
    id v14 = [v13 lowercaseString];

    if ([v14 hasPrefix:@"itms"])
    {
      int64_t v15 = 1000000000;
      unsigned int v16 = (id *)v25;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100060B70;
      v25[3] = &unk_10054D570;
      id v5 = v5;
      v25[4] = v5;
    }
    else if ([v14 hasPrefix:@"podcasts"])
    {
      unsigned int v16 = (id *)v24;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100060BC8;
      v24[3] = &unk_10054D570;
      id v5 = v5;
      int64_t v15 = 0;
      v24[4] = v5;
    }
    else
    {
      if (+[DebugUI isDebugUrl:v5])
      {
        +[DebugUI showDebugUI];
LABEL_15:

        goto LABEL_16;
      }
      if ([v14 isEqualToString:@"podcast"])
      {
        v17 = [v5 absoluteString];
        unsigned __int8 v18 = [v17 stringByReplacingOccurrencesOfString:@"podcast" withString:@"http" options range];

        uint64_t v19 = +[NSURL URLWithString:v18];

        id v5 = (id)v19;
      }
      int64_t v15 = 1000000000;
      unsigned int v16 = (id *)v23;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100060C20;
      v23[3] = &unk_10054D570;
      id v5 = v5;
      v23[4] = v5;
    }
    v20 = objc_retainBlock(v16);

    if (v20)
    {
      dispatch_time_t v21 = dispatch_time(0, v15);
      dispatch_after(v21, (dispatch_queue_t)&_dispatch_main_q, v20);
    }
    goto LABEL_15;
  }
LABEL_16:

  return v7;
}

- (void)applicationWillResignActive:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = MTApplicationWillResignActiveNotification;
  uint64_t v6 = +[UIApplication sharedApplication];
  [v4 postNotificationName:v5 object:v6];

  unsigned int v7 = +[PodcastsApplicationStateMonitor shared];
  id v8 = [v3 applicationState];

  [v7 setUIApplicationState:v8];
  +[MTBaseFeedManager saveSubscriptionMetadata];
  id v10 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  unsigned int v9 = +[NSDate now];
  [v10 setLastAppUseDate:v9];
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = MTApplicationDidEnterBackgroundNotification;
  uint64_t v6 = +[UIApplication sharedApplication];
  [v4 postNotificationName:v5 object:v6];

  unsigned int v7 = +[PodcastsApplicationStateMonitor shared];
  id v8 = [v3 applicationState];

  [v7 setUIApplicationState:v8];
  unsigned int v9 = +[PFRestrictionsController shared];
  [v9 stopListening];

  id v10 = dispatch_get_global_queue(0, 0);
  dispatch_async(v10, &stru_10054D610);

  id v11 = +[IMNetworkObserver sharedInstance];
  [v11 endObserving];
}

- (void)applicationDidReceiveMemoryWarning:(id)a3
{
  id v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v3 = MTApplicationDidReceiveMemoryWarningNotification;
  objc_super v4 = +[UIApplication sharedApplication];
  [v5 postNotificationName:v3 object:v4];
}

- (void)applicationWillTerminate:(id)a3
{
  id v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v3 = MTApplicationWillTerminateNotification;
  objc_super v4 = +[UIApplication sharedApplication];
  [v5 postNotificationName:v3 object:v4];
}

- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4
{
  id v4 = a4;
  id v5 = +[MTPushNotificationController sharedInstance];
  [v5 didFailToRegisterWithError:v4];
}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = +[MTAccountController sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100061178;
  v12[3] = &unk_10054D658;
  id v13 = v7;
  id v14 = v8;
  v12[4] = self;
  id v10 = v7;
  id v11 = v8;
  [v9 fetchActiveAccountWithCompletion:v12];
}

- (void)_setupPlayer
{
  v2 = +[IMAVPlayer sharedPlayer];
  [v2 setChapterMetadataMode:1];

  id v3 = +[IMAVPlayer sharedPlayer];
  [v3 becomeActiveMediaPlayer];
}

- (void)storeAccountDidChange
{
}

- (BOOL)canOpenURL:(id)a3
{
  return 0;
}

- (void)didChangeStoreAccount:(id)a3
{
  if (+[MTAccountController iTunesAccountDidChangeForACAccountNotification:a3])
  {
    [(MTAppDelegate_Shared *)self storeAccountDidChange];
  }
}

- (UIViewController)rootViewController
{
  return 0;
}

- (NSOperationQueue)updateQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000616D0;
  block[3] = &unk_10054D570;
  block[4] = self;
  if (qword_10060A600 != -1) {
    dispatch_once(&qword_10060A600, block);
  }
  return self->_updateQueue;
}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  id v7 = (NSString *)a4;
  id v8 = a5;
  unsigned int v9 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_retainBlock(v8);
    int v19 = 138412802;
    v20 = self;
    __int16 v21 = 2112;
    v22 = v7;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ handleEventsForBackgroundURLSession called for session with identifier %@ and completionHandler: %@.", (uint8_t *)&v19, 0x20u);
  }
  id v11 = +[PUIAssetDownloaders sharedDownloaders];
  [v11 registerBackgroundCompletion:v8 forSession:v7];

  if ([(NSString *)v7 containsString:@"MTImageDownloader"])
  {
    uint64_t v12 = [NSClassFromString(v7) sharedInstance];
    id v13 = [v12 sessionCompletionHandler];

    if (v13)
    {
      id v14 = _MTLogCategoryNetwork();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int64_t v15 = [v12 sessionCompletionHandler];
        unsigned int v16 = objc_retainBlock(v15);
        int v19 = 138412546;
        v20 = (MTAppDelegate_Shared *)v7;
        __int16 v21 = 2112;
        v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "handleEventsForBackgroundURLSession being called BEFORE URLSessionDidFinishEventsForBackgroundURLSession for identifier %@.  Invoking existing completionHandler %@.", (uint8_t *)&v19, 0x16u);
      }
      v17 = [v12 sessionCompletionHandler];
      v17[2]();

      [v12 setSessionCompletionHandler:0];
    }
    unsigned __int8 v18 = _MTLogCategoryNetwork();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting sessionCompletionHandler for MTImageDownloader.", (uint8_t *)&v19, 2u);
    }

    [v12 setSessionCompletionHandler:v8];
  }
  else
  {
    uint64_t v12 = +[MTFeedManager sharedInstance];
    [v12 handleEventsForBackgroundURLSessionFor:v7 completionHandler:v8];
  }
}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4 = a4;
  NSLog(@"Will Continue");
  if (([v4 isEqualToString:NSUserActivityTypeBrowsingWeb] & 1) != 0
    || (+[MTIntentDonationUtil sharedInstance],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 canContinueIntentWithUserActivityType:v4],
        v5,
        (v6 & 1) != 0))
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    id v8 = +[MTHandoffController sharedInstance];
    unsigned int v9 = [v8 supportedActivityTypes];
    unsigned __int8 v7 = [v9 containsObject:v4];
  }
  return v7;
}

- (void)application:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
}

- (int64_t)_hostWindowLayoutDirection
{
  return 0;
}

- (BOOL)_hasMainWindow
{
  return 1;
}

- (BOOL)_mainWindowIsKey
{
  return 1;
}

- (BOOL)_isApplicationTerminating
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlayValidationManager, 0);
  objc_storeStrong((id *)&self->_secureDownloadRenewalManager, 0);
  objc_storeStrong((id *)&self->_siriDonator, 0);
  objc_storeStrong((id *)&self->_siriDumper, 0);
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->backgroundTaskScheduler, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_accountChangeQueue, 0);
}

- (unint64_t)processNotification:(id)a3
{
  id v4 = a3;
  id v5 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Processing Notification %@", (uint8_t *)&v20, 0xCu);
  }

  unsigned __int8 v6 = +[MTPushNotificationController sharedInstance];
  unsigned int v7 = [v6 shouldShowAnnouncementNotification:v4];

  if (v7)
  {
    id v8 = +[MTPushNotificationController sharedInstance];
    [v8 processAnnouncementNotification:v4];
    unint64_t v9 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if (+[MTPushNotificationController shouldProcessNotification:v4])
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    if (+[MTPushNotificationController shouldSyncFeedUpdateForNotification:v4])
    {
      id v10 = +[MTPushNotificationController storeIdFromFeedUpdateNotification:v4];
      id v11 = +[MTPushNotificationController triggeredByFromFeedUpdateNotification:v4];
      -[MTAppDelegate_Shared _setNeedsRetryFlagFromNotificationForStoreId:](self, "_setNeedsRetryFlagFromNotificationForStoreId:", [v10 longLongValue]);
      -[MTAppDelegate_Shared processFeedUpdateNotification:triggerBy:](self, "processFeedUpdateNotification:triggerBy:", [v10 longLongValue], v11);
      uint64_t v12 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412546;
        id v21 = v10;
        __int16 v22 = 2112;
        __int16 v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Push] Processing Feed Update push notification for podcast %@ with triggerBy %@", (uint8_t *)&v20, 0x16u);
      }

      id v13 = +[MTFeedUpdateMetricsDataKey podcastStoreId];
      [v8 setObject:v10 forKey:v13];

      id v14 = +[MTFeedUpdateMetricsDataKey notificationType];
      [v8 setObject:@"FeedUpdate" forKey:v14];
    }
    else
    {
      if (+[MTPushNotificationController shouldSyncSubscriptionsForNotification:v4])
      {
        int64_t v15 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Push] Processing Subscription Sync push notification.", (uint8_t *)&v20, 2u);
        }

        [(MTAppDelegate_Shared *)self processSubscriptionSyncNotification];
        id v10 = +[MTFeedUpdateMetricsDataKey notificationType];
        CFStringRef v16 = @"BookKeeper";
      }
      else
      {
        if (!+[MTPushNotificationController shouldSyncUppForNotification:v4])
        {
          unint64_t v9 = 1;
          goto LABEL_21;
        }
        v17 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[Push] Processing UPP Sync push notification.", (uint8_t *)&v20, 2u);
        }

        [(MTAppDelegate_Shared *)self processUPPSyncNotification];
        id v10 = +[MTFeedUpdateMetricsDataKey notificationType];
        CFStringRef v16 = @"UPP";
      }
      [v8 setObject:v16 forKey:v10];
    }

    unint64_t v9 = 0;
LABEL_21:
    unsigned __int8 v18 = +[MTFeedUpdateMetricsAction notificationReceived];
    +[IMMetrics recordUserAction:v18 dataSource:0 withData:v8];

    goto LABEL_22;
  }
  unint64_t v9 = 1;
LABEL_23:

  return v9;
}

- (void)processFeedUpdateNotification:(int64_t)a3 triggerBy:(id)a4
{
  id v5 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  unsigned __int8 v6 = +[UIApplication sharedApplication];
  unsigned int v7 = +[NSString stringWithFormat:@"MTAppDelegate_Shared.FeedUpdatePushNotification.%lld", a3];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000620A0;
  v11[3] = &unk_10054D8A0;
  void v11[4] = &v12;
  id v8 = [v6 beginBackgroundTaskWithName:v7 expirationHandler:v11];

  v13[3] = (uint64_t)v8;
  unint64_t v9 = +[MTFeedUpdateManager sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100062100;
  v10[3] = &unk_10054D8C8;
  v10[4] = &v12;
  v10[5] = a3;
  [v9 updatePodcastWithStoreId:a3 triggerBy:v5 userInitiated:0 forced:1 source:2 completion:v10];

  _Block_object_dispose(&v12, 8);
}

- (void)processSubscriptionSyncNotification
{
  if (os_feature_enabled_homepod_siri_donation_from_apns()
    && (+[PFClientUtil isRunningOnHomepod] & 1) != 0)
  {
    id v3 = [(MTAppDelegate_Shared *)self siriDonator];
    [v3 startDonation];
  }
  else
  {
    id v3 = +[SyncControllerFactory resolvedSyncController];
    [v3 syncAllBookkeeperKeys];
  }

  if (os_feature_enabled_fetch_upp_on_library_push())
  {
    id v4 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching UPP on subscription sync notification in case a UPP push was missed", v5, 2u);
    }

    [(MTAppDelegate_Shared *)self processUPPSyncNotification];
  }
}

- (void)processUPPSyncNotification
{
  id v2 = +[SyncControllerFactory resolvedSyncController];
  [v2 performUniversalPlaybackPositionSync];
}

- (void)_setNeedsRetryFlagFromNotificationForStoreId:(int64_t)a3
{
  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 mainOrPrivateContext];

  +[MTPodcast predicateForPodcastStoreId:a3];
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_100062494;
  uint64_t v15 = &unk_10054D8F0;
  id v16 = v5;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v18 = a3;
  id v6 = v17;
  id v7 = v5;
  [v7 performBlockAndWaitWithSave:&v12];
  id v8 = +[MTFeedUpdateMetricsAction notificationSetRetryFlag];
  unint64_t v9 = +[MTFeedUpdateMetricsDataKey podcastStoreId];
  int v19 = v9;
  id v10 = +[NSNumber numberWithLongLong:a3];
  int v20 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  +[IMMetrics recordUserAction:v8 dataSource:0 withData:v11];
}

- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager
{
  id v2 = +[MTLibrary sharedInstance];
  id v3 = [v2 secureDownloadRenewalManager];

  return (MTSecureDownloadRenewalManager *)v3;
}

- (_TtC18PodcastsFoundation11SiriDonator)siriDonator
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000626C4;
  block[3] = &unk_10054D570;
  block[4] = self;
  if (qword_10060A610 != -1) {
    dispatch_once(&qword_10060A610, block);
  }
  return self->_siriDonator;
}

@end