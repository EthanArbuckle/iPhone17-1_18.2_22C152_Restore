@interface MSApplicationDelegate
- (BOOL)_showsDownloadsTabForDownloadManager:(id)a3;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 sourceApplication:(id)a5 annotation:(id)a6;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (MSApplicationDelegate)init;
- (id)_downloadManager;
- (id)_newDefaultTabBarItemsWithClientContext:(id)a3 style:(int64_t)a4;
- (id)_newTabBarItemsWithStyle:(int64_t)a3;
- (id)_storeReview;
- (id)application:(id)a3 navigationControllerWithTabBarItem:(id)a4;
- (id)bootstrapScriptURLForApplication:(id)a3;
- (id)purchaseManager:(id)a3 purchaseBatchForItems:(id)a4;
- (id)purchaseManager:(id)a3 purchaseBatchForPurchases:(id)a4;
- (int64_t)_maximumTabBarItemsForStyle:(int64_t)a3;
- (int64_t)_tabBarStyleWithWidth:(double)a3;
- (void)_loadApplicationWithLaunchOptions:(id)a3;
- (void)_networkingStartNotification:(id)a3;
- (void)_networkingStopNotification:(id)a3;
- (void)_purchaseFinishedNotification:(id)a3;
- (void)_requestAuthorization;
- (void)_showExternalURL:(id)a3;
- (void)application:(id)a3 didFailToLoadWithError:(id)a4;
- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)application:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidChangeClientContext:(id)a3;
- (void)applicationDidCustomizeTabBarItems:(id)a3;
- (void)applicationDidDisplayFirstPage:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)dealloc;
- (void)downloadManagerDownloadsDidChange:(id)a3;
- (void)presentOnboardingIfNeeded;
@end

@implementation MSApplicationDelegate

- (void)applicationDidBecomeActive:(id)a3
{
  if (self->_onActiveShouldResumeApplication) {
    [(SUUIApplicationController *)self->_applicationController resumeApplicationWithOptions:0];
  }
  id v4 = [(MSApplicationDelegate *)self _storeReview];
  [v4 applicationDidForeground];
}

- (int64_t)_tabBarStyleWithWidth:(double)a3
{
  id v4 = [(SUUIApplicationController *)self->_applicationController clientContext];
  uint64_t v5 = SUUIUserInterfaceIdiom();

  return a3 >= 768.0 && v5 == 1;
}

- (BOOL)_showsDownloadsTabForDownloadManager:(id)a3
{
  id v3 = a3;
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5)
  {
    v6 = [v3 downloads];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)_requestAuthorization
{
  objc_initWeak(&location, self);
  v2 = +[UNUserNotificationCenter currentNotificationCenter];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000548C;
  v3[3] = &unk_100010758;
  objc_copyWeak(&v4, &location);
  [v2 requestAuthorizationWithOptions:6 completionHandler:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)_downloadManager
{
  downloadManager = self->_downloadManager;
  if (!downloadManager)
  {
    id v4 = [(SUUIApplicationController *)self->_applicationController clientContext];
    id v5 = [v4 clientInterface];

    v6 = [v5 viewControllerFactory];
    id v7 = [v6 newDownloadManagerOptions];
    v8 = [v5 queueSessionManager];
    v9 = [v8 beginDownloadManagerSessionWithManagerOptions:v7];
    v10 = self->_downloadManager;
    self->_downloadManager = v9;

    [(SSDownloadManager *)self->_downloadManager addObserver:self];
    downloadManager = self->_downloadManager;
  }

  return downloadManager;
}

- (MSApplicationDelegate)init
{
  v9.receiver = self;
  v9.super_class = (Class)MSApplicationDelegate;
  v2 = [(MSApplicationDelegate *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)SUUIMutableApplicationControllerOptions);
    [v3 setPageRenderMetricsEnabled:1];
    id v4 = (SUUIApplicationController *)[objc_alloc((Class)SUUIApplicationController) initWithClientContextClass:objc_opt_class() options:v3];
    applicationController = v2->_applicationController;
    v2->_applicationController = v4;

    [(SUUIApplicationController *)v2->_applicationController setDelegate:v2];
    id v6 = [objc_alloc((Class)NSURLCache) initWithMemoryCapacity:512000 diskCapacity:52428800 diskPath:0];
    +[NSURLCache setSharedURLCache:v6];
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_networkingStartNotification:" name:SSVNetworkingDidStartNotification object:0];
    [v7 addObserver:v2 selector:"_networkingStopNotification:" name:SSVNetworkingDidStopNotification object:0];
    [v7 addObserver:v2 selector:"_purchaseFinishedNotification:" name:SUPurchaseFinishedNotification object:0];
  }
  return v2;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSUserDefaults standardUserDefaults];
  [v8 registerDefaults:&off_1000110E8];

  window = self->_window;
  if (!window)
  {
    id v10 = objc_alloc((Class)UIWindow);
    v11 = +[UIScreen mainScreen];
    [v11 bounds];
    v12 = [v10 initWithFrame:];
    v13 = self->_window;
    self->_window = v12;

    [(UIWindow *)self->_window setAutoresizingMask:18];
    v14 = self->_window;
    v15 = sub_100006678();
    [(UIWindow *)v14 setTintColor:v15];

    window = self->_window;
  }
  v16 = [(SUUIApplicationController *)self->_applicationController rootViewController];
  [(UIWindow *)window setRootViewController:v16];

  [(UIWindow *)self->_window makeKeyAndVisible];
  unsigned __int8 v17 = [v7 launchedToTest];

  if ((v17 & 1) == 0) {
    [(MSApplicationDelegate *)self _loadApplicationWithLaunchOptions:v6];
  }
  v18 = [(SUUIApplicationController *)self->_applicationController tabBarItems];

  if (!v18)
  {
    [(UIWindow *)self->_window bounds];
    int64_t v20 = [(MSApplicationDelegate *)self _tabBarStyleWithWidth:v19];
    v21 = [(SUUIApplicationController *)self->_applicationController tabBarController];
    [v21 _setMaximumNumberOfItems:[self _maximumTabBarItemsForStyle:v20]];

    applicationController = self->_applicationController;
    id v23 = [(MSApplicationDelegate *)self _newTabBarItemsWithStyle:v20];
    [(SUUIApplicationController *)applicationController setTabBarItems:v23];
  }
  +[MSQuickActionController updateShortcutItems];
  v24 = +[AVAudioSession sharedInstance];
  [v24 setCategory:AVAudioSessionCategoryPlayback error:0];

  [(MSApplicationDelegate *)self _requestAuthorization];
  return 1;
}

- (id)_newTabBarItemsWithStyle:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v57 = self;
  id v6 = [(SUUIApplicationController *)self->_applicationController clientContext];
  if (+[UIApplication shouldMakeUIForDefaultPNG])
  {
    id v7 = 0;
  }
  else if (v6)
  {
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_100006614;
    v67[3] = &unk_100010678;
    id v68 = v6;
    id v7 = objc_retainBlock(v67);
  }
  else
  {
    id v7 = &stru_1000106B8;
  }
  id v8 = [v6 tabBarItemsForStyle:a3];
  if (!v8) {
    id v8 = [(MSApplicationDelegate *)v57 _newDefaultTabBarItemsWithClientContext:v6 style:a3];
  }
  v58 = v6;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v10)
  {
    id v11 = v10;
    id v60 = v9;
    uint64_t v12 = *(void *)v64;
    id v59 = v5;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v64 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v63 + 1) + 8 * (void)v13);
        v15 = [v14 tabIdentifier];
        if ([v15 isEqualToString:@"music"])
        {
          id v16 = objc_alloc_init((Class)UITabBarItem);
          unsigned __int8 v17 = +[UIImage _systemImageNamed:@"music"];
          [v16 setImage:v17];

          if (v7)
          {
            invoke = v7->invoke;
            double v19 = v7;
            CFStringRef v20 = @"MUSIC";
            goto LABEL_16;
          }
          goto LABEL_18;
        }
        if ([v15 isEqualToString:@"movies"])
        {
          id v16 = objc_alloc_init((Class)UITabBarItem);
          v24 = +[UIImage _systemImageNamed:@"film.fill"];
          [v16 setImage:v24];

          if (v7)
          {
            v25 = v7->invoke;
            v26 = v7;
            CFStringRef v27 = @"MOVIES";
            goto LABEL_25;
          }
          goto LABEL_26;
        }
        if ([v15 isEqualToString:@"tv"])
        {
          id v16 = objc_alloc_init((Class)UITabBarItem);
          v28 = +[UIImage _systemImageNamed:@"tv.inset.filled"];
          [v16 setImage:v28];

          if (v7)
          {
            v25 = v7->invoke;
            v26 = v7;
            CFStringRef v27 = @"TV_SHOWS";
LABEL_25:
            v29 = v25(v26, v27);
            [v16 setTitle:v29];
          }
LABEL_26:
          v22 = v14;
          uint64_t v23 = 1;
          goto LABEL_27;
        }
        if ([v15 isEqualToString:@"search"])
        {
          id v16 = [objc_alloc((Class)UITabBarItem) initWithTabBarSystemItem:8 tag:0];
          if (v7)
          {
            v31 = v7->invoke;
            v32 = v7;
            CFStringRef v33 = @"SEARCH";
            goto LABEL_34;
          }
          goto LABEL_45;
        }
        if ([v15 isEqualToString:@"audiobooks"])
        {
          id v16 = objc_alloc_init((Class)UITabBarItem);
          v34 = +[UIImage imageNamed:@"UITabBarAudiobooks"];
          v35 = [v34 _imageThatSuppressesAccessibilityHairlineThickening];
          [v16 setImage:v35];

          v36 = +[UIImage imageNamed:@"UITabBarAudiobooksSelected"];
          v37 = [v36 _imageThatSuppressesAccessibilityHairlineThickening];
          [v16 setSelectedImage:v37];

          if (v7)
          {
            v38 = v7->invoke(v7, @"AUDIOBOOKS");
            [v16 setTitle:v38];
          }
          [v14 setBarTintStyle:2];
          id v5 = v59;
          id v9 = v60;
          goto LABEL_28;
        }
        if ([v15 isEqualToString:@"tones"])
        {
          id v16 = objc_alloc_init((Class)UITabBarItem);
          v39 = +[UIImage _systemImageNamed:@"bell.fill"];
          [v16 setImage:v39];

          if (v7)
          {
            invoke = v7->invoke;
            double v19 = v7;
            CFStringRef v20 = @"TONES";
            goto LABEL_16;
          }
LABEL_18:
          v22 = v14;
          uint64_t v23 = 2;
LABEL_27:
          [v22 setBarTintStyle:v23];
LABEL_28:
          [v14 setRootViewControllerClass:objc_opt_class()];
          [v14 setUnderlyingTabBarItem:v16];
          v30 = sub_100006678();
          [v14 setUserInterfaceTintColor:v30];

          [v5 addObject:v14];
          goto LABEL_29;
        }
        if ([v15 isEqualToString:@"charts"])
        {
          id v16 = [objc_alloc((Class)UITabBarItem) initWithTabBarSystemItem:11 tag:0];
          if (v7)
          {
            v31 = v7->invoke;
            v32 = v7;
            CFStringRef v33 = @"CHARTS";
LABEL_34:
            v21 = v31(v32, v33);
            [v16 _setInternalTitle:v21];
LABEL_17:

            goto LABEL_18;
          }
LABEL_45:
          [v16 _setInternalTitle:&stru_1000107F8];
          goto LABEL_18;
        }
        if ([v15 isEqualToString:@"genius"])
        {
          id v16 = objc_alloc_init((Class)UITabBarItem);
          v40 = +[UIImage _systemImageNamed:@"genius"];
          [v16 setImage:v40];

          if (!v7) {
            goto LABEL_18;
          }
          invoke = v7->invoke;
          double v19 = v7;
          CFStringRef v20 = @"GENIUS";
LABEL_16:
          v21 = invoke(v19, v20);
          [v16 setTitle:v21];
          goto LABEL_17;
        }
        if ([v15 isEqualToString:@"purchased"])
        {
          id v16 = objc_alloc_init((Class)UITabBarItem);
          v41 = +[UIImage _systemImageNamed:@"purchased"];
          [v16 setImage:v41];

          if (!v7) {
            goto LABEL_18;
          }
          invoke = v7->invoke;
          double v19 = v7;
          CFStringRef v20 = @"PURCHASED";
          goto LABEL_16;
        }
        if ([v15 isEqualToString:@"downloads"])
        {
          v42 = [(MSApplicationDelegate *)v57 _downloadManager];
          unsigned int v43 = [(MSApplicationDelegate *)v57 _showsDownloadsTabForDownloadManager:v42];

          if (v43)
          {
            id v16 = [objc_alloc((Class)UITabBarItem) initWithTabBarSystemItem:9 tag:0];
            if (v7)
            {
              v44 = v7->invoke(v7, @"DOWNLOADS");
              [v16 setTitle:v44];
            }
            [v14 setBarTintStyle:2];
            [v14 setAlwaysCreatesRootViewController:1];
            goto LABEL_28;
          }
        }
        else
        {
          if ([v15 isEqualToString:@"itunesu"])
          {
            id v16 = objc_alloc_init((Class)UITabBarItem);
            v45 = +[UIImage imageNamed:@"UITabBariTunesU"];
            v46 = [v45 _imageThatSuppressesAccessibilityHairlineThickening];
            [v16 setImage:v46];

            if (v7)
            {
              v47 = v7->invoke;
              v48 = v7;
              CFStringRef v49 = @"ITUNES_U";
              goto LABEL_63;
            }
            goto LABEL_64;
          }
          if ([v15 isEqualToString:@"podcast"])
          {
            id v16 = objc_alloc_init((Class)UITabBarItem);
            v50 = +[UIImage imageNamed:@"UITabBarPodcasts"];
            v51 = [v50 _imageThatSuppressesAccessibilityHairlineThickening];
            [v16 setImage:v51];

            if (v7)
            {
              v47 = v7->invoke;
              v48 = v7;
              CFStringRef v49 = @"PODCASTS";
LABEL_63:
              v52 = v47(v48, v49);
              [v16 setTitle:v52];
            }
LABEL_64:
            [v14 setBarTintStyle:2];
            id v9 = v60;
            goto LABEL_28;
          }
        }
LABEL_29:

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v53 = [v9 countByEnumeratingWithState:&v63 objects:v69 count:16];
      id v11 = v53;
    }
    while (v53);
  }

  v54 = +[NSUserDefaults standardUserDefaults];
  v55 = [v54 objectForKey:@"MSApplicationDelegateTabBarOrdering"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000099D0;
    v61[3] = &unk_1000106E0;
    id v62 = v55;
    [v5 sortUsingComparator:v61];
  }
  return v5;
}

- (id)application:(id)a3 navigationControllerWithTabBarItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 tabIdentifier];
  unsigned __int8 v8 = [v7 isEqualToString:@"search"];
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 1;
  }
  else if (([v7 isEqualToString:@"movies"] & 1) != 0 {
         || [v7 isEqualToString:@"tv"])
  }
  {
    uint64_t v10 = 0;
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
  }
  id v11 = [v5 clientContext];
  uint64_t v12 = [v11 clientInterface];
  id v13 = [objc_alloc((Class)SUSection) initWithClientInterface:v12 sectionType:v10 defaultPNGStyle:v9];
  if ((v8 & 1) != 0 || SUUIUserInterfaceIdiom() == 1)
  {
    v14 = +[SUSearchFieldConfiguration defaultConfigurationWithClientInterface:v12];
    [v13 setSearchFieldConfiguration:v14];
  }
  v15 = [v6 underlyingTabBarItem];
  id v16 = [v15 image];
  [v13 setImage:v16];

  unsigned __int8 v17 = [v15 selectedImage];
  [v13 setSelectedImage:v17];

  id v18 = [objc_alloc((Class)SUNavigationController) initWithSection:v13];
  [v18 setClientInterface:v12];

  return v18;
}

- (id)_storeReview
{
  if (qword_100015E40 != -1) {
    dispatch_once(&qword_100015E40, &stru_100010650);
  }
  v2 = (void *)qword_100015E38;

  return v2;
}

- (int64_t)_maximumTabBarItemsForStyle:(int64_t)a3
{
  if (a3) {
    return 8;
  }
  else {
    return 5;
  }
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:SSVNetworkingDidStartNotification object:0];
  [v3 removeObserver:self name:SSVNetworkingDidStopNotification object:0];
  [v3 removeObserver:self name:SUPurchaseFinishedNotification object:0];
  [(SUUIApplicationController *)self->_applicationController setDelegate:0];
  [(SSDownloadManager *)self->_downloadManager removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MSApplicationDelegate;
  [(MSApplicationDelegate *)&v4 dealloc];
}

- (void)applicationDidChangeClientContext:(id)a3
{
  objc_super v4 = [(SUUIApplicationController *)self->_applicationController clientContext];
  [v4 setPurchaseReferrerURL:self->_launchURL];

  [(SSDownloadManager *)self->_downloadManager removeObserver:self];
  downloadManager = self->_downloadManager;
  self->_downloadManager = 0;

  id v18 = [(SUUIApplicationController *)self->_applicationController rootViewController];
  id v6 = [v18 view];
  [v6 bounds];
  int64_t v8 = [(MSApplicationDelegate *)self _tabBarStyleWithWidth:v7];

  applicationController = self->_applicationController;
  id v10 = [(MSApplicationDelegate *)self _newTabBarItemsWithStyle:v8];
  [(SUUIApplicationController *)applicationController setTabBarItems:v10];

  [(UIWindow *)self->_window setRootViewController:v18];
  id v11 = [(SUUIApplicationController *)self->_applicationController clientContext];
  uint64_t v12 = [v11 clientInterface];

  id v13 = (SULegacyClientBridge *)[objc_alloc((Class)SULegacyClientBridge) initWithClientInterface:v12];
  legacyBridge = self->_legacyBridge;
  self->_legacyBridge = v13;

  v15 = self->_legacyBridge;
  id v16 = [(SUUIApplicationController *)self->_applicationController tabBarController];
  [(SULegacyClientBridge *)v15 setRootViewController:v16];

  +[SUClientDispatch setClientBridge:self->_legacyBridge];
  unsigned __int8 v17 = [v12 purchaseManager];
  [v17 setDelegate:self];

  [(MSApplicationDelegate *)self presentOnboardingIfNeeded];
}

- (void)applicationDidCustomizeTabBarItems:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [v3 tabBarItems];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007F5C;
  v8[3] = &unk_100010550;
  id v9 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v8];

  double v7 = +[NSUserDefaults standardUserDefaults];
  [v7 setObject:v6 forKey:@"MSApplicationDelegateTabBarOrdering"];
  [v7 synchronize];
}

- (void)applicationDidDisplayFirstPage:(id)a3
{
  id v11 = a3;
  if (!self->_launchNotificationsController)
  {
    id v4 = [MSLaunchNotificationsController alloc];
    id v5 = [(UIWindow *)self->_window rootViewController];
    id v6 = [(MSLaunchNotificationsController *)v4 initWithParentViewController:v5];
    launchNotificationsController = self->_launchNotificationsController;
    self->_launchNotificationsController = v6;

    int64_t v8 = self->_launchNotificationsController;
    id v9 = [v11 clientContext];
    [(MSLaunchNotificationsController *)v8 setClientContext:v9];

    if ((+[MSOnboardingUtil shouldShowOnboarding] & 1) == 0) {
      [(MSLaunchNotificationsController *)self->_launchNotificationsController checkForNotifications];
    }
  }
  self->_didDisplayFirstPage = 1;
  if (self->_quickActionBlock
    && (+[MSOnboardingUtil shouldShowOnboarding] & 1) == 0)
  {
    (*((void (**)(void))self->_quickActionBlock + 2))();
    id quickActionBlock = self->_quickActionBlock;
    self->_id quickActionBlock = 0;
  }
  [(MSApplicationDelegate *)self presentOnboardingIfNeeded];
}

- (void)application:(id)a3 didFailToLoadWithError:(id)a4
{
  id v4 = a3;
  id v5 = [v4 clientContext];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 localizedStringForKey:@"GENERIC_ERROR"];
  }
  else
  {
    int64_t v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"GENERIC_ERROR" value:&stru_1000107F8 table:0];

    uint64_t v7 = (uint64_t)v9;
  }
  id v10 = (id)v7;
  [v4 showErrorViewWithTitle:v7 message:0];
}

- (void)application:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  double width = a4.width;
  id v17 = a3;
  id v8 = a5;
  id v9 = [v17 rootViewController];
  id v10 = [v9 view];
  [v10 bounds];
  int64_t v12 = [(MSApplicationDelegate *)self _tabBarStyleWithWidth:v11];

  int64_t v13 = [(MSApplicationDelegate *)self _tabBarStyleWithWidth:width];
  if (v12 != v13)
  {
    int64_t v14 = v13;
    id v15 = [(MSApplicationDelegate *)self _newTabBarItemsWithStyle:v13];
    id v16 = [v17 tabBarController];
    [v16 _setMaximumNumberOfItems:[self _maximumTabBarItemsForStyle:v14]];

    [v17 updateTabBarWithItems:v15 animated:[v8 isAnimated]];
  }
}

- (id)bootstrapScriptURLForApplication:(id)a3
{
  id v3 = +[UIApplication sharedApplication];
  unsigned int v4 = [v3 launchedToTest];

  if (v4)
  {
    id v5 = objc_alloc((Class)NSString);
    id v6 = [v5 initWithFormat:@"%@://PPT.js", SUUITestDataURLScheme];
    uint64_t v7 = +[NSURL URLWithString:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000840C;
  v7[3] = &unk_100010498;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (id)purchaseManager:(id)a3 purchaseBatchForItems:(id)a4
{
  id v4 = a4;
  id v5 = [objc_alloc((Class)MSPurchaseBatch) initWithItems:v4];

  return v5;
}

- (id)purchaseManager:(id)a3 purchaseBatchForPurchases:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)MSPurchaseBatch);
  uint64_t v7 = [(SUUIApplicationController *)self->_applicationController clientContext];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v7 customizePurchase:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [v6 setPurchasesAndContinuationsFromPurchases:v8];

  return v6;
}

- (BOOL)application:(id)a3 openURL:(id)a4 sourceApplication:(id)a5 annotation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)SUUIURL) initWithURL:v11];
  [v14 setReferrerApplicationName:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = (void *)sub_100007B58();
    id v16 = *(id *)sub_100007C0C("LSReferrerURLKey", v15);
    if (v16)
    {
      long long v17 = [v13 objectForKey:v16];
    }
    else
    {
      long long v17 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 setReferrerURLString:v17];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v18 = [v17 absoluteString];
        [v14 setReferrerURLString:v18];
      }
    }
  }
  objc_initWeak(&location, self);
  applicationController = self->_applicationController;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100008978;
  v25[3] = &unk_1000105B8;
  objc_copyWeak(&v27, &location);
  id v20 = v14;
  id v26 = v20;
  [(SUUIApplicationController *)applicationController evaluateBlockWhenLoaded:v25];
  self->_onActiveShouldResumeApplication = 0;
  v21 = [(SUUIApplicationController *)self->_applicationController clientContext];
  [v21 setPurchaseReferrerURL:v20];

  launchURL = self->_launchURL;
  self->_launchURL = (SUUIURL *)v20;
  id v23 = v20;

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return 1;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 pathForResource:@"testDefinitions" ofType:@"plist"];

  if (v10)
  {
    id v11 = [objc_alloc((Class)NSData) initWithContentsOfFile:v10];
    id v12 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v13 = v12;
      id v14 = [v13 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v14)
      {
        id v15 = v14;
        v28 = v12;
        id v29 = v11;
        v30 = v8;
        v31 = self;
        uint64_t v16 = *(void *)v33;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v33 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              double v19 = [v18 objectForKey:@"testName"];
              unsigned int v20 = [v19 isEqualToString:v7];

              if (v20)
              {
                id v8 = v18;

                self = v31;
                goto LABEL_14;
              }
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v32 objects:v38 count:16];
          if (v15) {
            continue;
          }
          break;
        }
        self = v31;
LABEL_14:
        id v11 = v29;
        id v12 = v28;
      }
    }
  }
  v21 = +[SSLogConfig sharedConfig];
  unsigned int v22 = [v21 shouldLog];
  if ([v21 shouldLogToDisk]) {
    v22 |= 2u;
  }
  id v23 = [v21 OSLogObject];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    int v24 = v22;
  }
  else {
    int v24 = v22 & 2;
  }
  if (!v24) {
    goto LABEL_25;
  }
  int v36 = 138412290;
  id v37 = v8;
  LODWORD(v27) = 12;
  v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    id v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v36, v27);
    free(v25);
    SSFileLog();
LABEL_25:
  }
  [(MSApplicationDelegate *)self _loadApplicationWithLaunchOptions:v8];

  return 1;
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self->_applicationController);
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  long long v18 = sub_100008E54;
  double v19 = &unk_1000105E0;
  objc_copyWeak(&v22, &location);
  id v11 = v9;
  id v20 = v11;
  id v12 = v10;
  id v21 = v12;
  id v13 = objc_retainBlock(&v16);
  id quickActionBlock = self->_quickActionBlock;
  self->_id quickActionBlock = v13;

  if (self->_didDisplayFirstPage
    && (+[MSOnboardingUtil shouldShowOnboarding] & 1) == 0)
  {
    (*((void (**)(void))self->_quickActionBlock + 2))();
    id v15 = self->_quickActionBlock;
    self->_id quickActionBlock = 0;
  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)applicationWillResignActive:(id)a3
{
  id v3 = a3;
  [v3 beginBackgroundTaskWithExpirationHandler:0];
  id v4 = v3;
  SSDialogGetDaemonDialogState();
}

- (void)_networkingStartNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009124;
  block[3] = &unk_100010470;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_networkingStopNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000091F4;
  block[3] = &unk_100010470;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_purchaseFinishedNotification:(id)a3
{
  id v4 = [a3 object];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 buyParameters];

    if (v6)
    {
      id v7 = [v5 buyParameters];
      id v8 = +[AMSBuyParams buyParamsWithString:v7];

      id v9 = [v8 parameterForKey:@"mtApp"];
      if ([v9 isEqual:@"com.apple.MobileStore"])
      {
        id v10 = [(MSApplicationDelegate *)self _storeReview];
        unsigned int v11 = [v10 shouldAttemptPromptReview];

        if (v11)
        {
          id v12 = [(MSApplicationDelegate *)self _storeReview];
          [v12 didAttemptPromptReview];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100009484;
          block[3] = &unk_100010470;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
      }
    }
  }
}

- (void)_loadApplicationWithLaunchOptions:(id)a3
{
  id v4 = a3;
  id v13 = [(id)objc_opt_class() applicationOptionsWithLaunchOptions:v4];

  [(SUUIApplicationController *)self->_applicationController loadApplicationWithOptions:v13];
  id v5 = [(SUUIApplicationController *)self->_applicationController clientContext];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 clientInterface];
    id v8 = (SULegacyClientBridge *)[objc_alloc((Class)SULegacyClientBridge) initWithClientInterface:v7];
    legacyBridge = self->_legacyBridge;
    self->_legacyBridge = v8;

    id v10 = self->_legacyBridge;
    unsigned int v11 = [(SUUIApplicationController *)self->_applicationController tabBarController];
    [(SULegacyClientBridge *)v10 setRootViewController:v11];

    +[SUClientDispatch setClientBridge:self->_legacyBridge];
    id v12 = [v7 purchaseManager];
    [v12 setDelegate:self];
  }
}

- (id)_newDefaultTabBarItemsWithClientContext:(id)a3 style:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v7 = SUUIUserInterfaceIdiom();

  id v8 = [objc_alloc((Class)SUUITabBarItem) initWithTabIdentifier:@"music"];
  id v9 = +[NSURL URLWithString:@"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewMusicMain"];
  [v8 setRootURL:v9];

  [v6 addObject:v8];
  id v10 = [objc_alloc((Class)SUUITabBarItem) initWithTabIdentifier:@"movies"];
  unsigned int v11 = +[NSURL URLWithString:@"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewMoviesMain"];
  [v10 setRootURL:v11];

  [v6 addObject:v10];
  id v12 = [objc_alloc((Class)SUUITabBarItem) initWithTabIdentifier:@"tv"];
  id v13 = +[NSURL URLWithString:@"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTVShowsMain"];
  [v12 setRootURL:v13];

  [v6 addObject:v12];
  if (!a4 || v7 != 1)
  {
    id v14 = [objc_alloc((Class)SUUITabBarItem) initWithTabIdentifier:@"search"];
    [v6 addObject:v14];
  }
  id v15 = [objc_alloc((Class)SUUITabBarItem) initWithTabIdentifier:@"audiobooks"];
  uint64_t v16 = +[NSURL URLWithString:@"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewAudiobooksMain"];
  [v15 setRootURL:v16];

  [v6 addObject:v15];
  if (v7 != 1)
  {
    id v17 = [objc_alloc((Class)SUUITabBarItem) initWithTabIdentifier:@"tones"];
    CFStringRef v18 = @"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewRingtones";
    goto LABEL_8;
  }
  if (a4 == 1)
  {
    id v17 = [objc_alloc((Class)SUUITabBarItem) initWithTabIdentifier:@"charts"];
    CFStringRef v18 = @"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop?genreId=34";
LABEL_8:
    double v19 = +[NSURL URLWithString:v18];
    [v17 setRootURL:v19];

    [v6 addObject:v17];
  }
  id v20 = [objc_alloc((Class)SUUITabBarItem) initWithTabIdentifier:@"genius"];
  id v21 = +[NSURL URLWithString:@"https://my.itunes.apple.com/WebObjects/MZPersonalizer.woa/wa/seeAllRecommendations?html=true"];
  [v20 setRootURL:v21];

  [v6 addObject:v20];
  id v22 = [objc_alloc((Class)SUUITabBarItem) initWithTabIdentifier:@"purchased"];
  id v23 = +[NSURL URLWithString:@"https://se.itunes.apple.com/WebObjects/MZStoreElements.woa/wa/purchases?mode=UNHIDDEN"];
  [v22 setRootURL:v23];

  [v22 setRootViewControllerClass:objc_opt_class()];
  [v6 addObject:v22];

  id v24 = [objc_alloc((Class)SUUITabBarItem) initWithTabIdentifier:@"downloads"];
  [v6 addObject:v24];

  return v6;
}

- (void)_showExternalURL:(id)a3
{
  id v4 = a3;
  if (+[MSOnboardingUtil shouldShowOnboarding])
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100009B54;
    v7[3] = &unk_1000105B8;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    id v5 = objc_retainBlock(v7);
    id showURLBlock = self->_showURLBlock;
    self->_id showURLBlock = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SUUIApplicationController *)self->_applicationController showExternalURL:v4];
  }
}

- (void)presentOnboardingIfNeeded
{
  if (self->_didDisplayFirstPage)
  {
    objc_initWeak(&location, self);
    id v3 = [(SUUIApplicationController *)self->_applicationController clientContext];
    v8[0] = SUUIConfigurationKeyTabs;
    v8[1] = SUUIConfigurationKeyStopPages;
    id v4 = +[NSArray arrayWithObjects:v8 count:2];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100009D0C;
    v5[3] = &unk_100010730;
    objc_copyWeak(&v6, &location);
    [v3 loadValueForConfigurationKeys:v4 completionBlock:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_showURLBlock, 0);
  objc_storeStrong(&self->_quickActionBlock, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_legacyBridge, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_launchNotificationsController, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);

  objc_storeStrong((id *)&self->_applicationController, 0);
}

@end