@interface TPSAppDelegate
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)isCollectionsViewVisible;
- (CollectionListViewController)collectionListViewController;
- (TPSMainViewController)mainViewController;
- (TPSTipsByCollectionViewController)tipsByCollectionViewController;
- (TPSUIAppController)appController;
- (TipListViewController)tipListViewController;
- (UIWindow)window;
- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)clearBadgeCount;
- (void)displayCollectionID:(id)a3 tipID:(id)a4;
- (void)handleTipsURL:(id)a3;
- (void)resetCacheDefaults;
- (void)setMainViewController:(id)a3;
- (void)setTipListViewController:(id)a3;
- (void)setWindow:(id)a3;
- (void)showCollectionsView;
- (void)showTOCView;
- (void)showTipsView;
@end

@implementation TPSAppDelegate

- (void)applicationDidBecomeActive:(id)a3
{
  id v3 = [(TPSAppDelegate *)self mainViewController];
  [v3 applicationDidBecomeActive];
}

- (void)resetCacheDefaults
{
  +[TPSDataCacheController removeAllDataCache];
  v2 = +[TPSJSONCacheController sharedInstance];
  [v2 removeAllDataCache];

  id v3 = +[TPSAssetCacheController sharedInstance];
  [v3 removeAllDataCache];
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = +[AVAudioSession sharedInstance];
  [v5 setCategory:AVAudioSessionCategoryAmbient error:0];

  v6 = +[NSUserDefaults standardUserDefaults];
  [v6 registerDefaults:&off_1000B9FF0];
  v7 = +[NSBundle mainBundle];
  uint64_t v8 = [v7 infoDictionary];
  v9 = [(id)v8 objectForKey:@"CFBundleShortVersionString"];

  v10 = [v6 objectForKey:@"TipsAppLastLaunchedAppVersion"];
  LOBYTE(v8) = [v9 isEqualToString:v10];

  if ((v8 & 1) == 0)
  {
    v11 = +[TPSJSONCacheController sharedInstance];
    [v11 removeAllDataCache];

    [v6 removeObjectForKey:@"TPSJSONCacheIdentifier"];
    [v6 setObject:v9 forKey:@"TipsAppLastLaunchedAppVersion"];
    [v6 synchronize];
  }
  v12 = (void *)MGCopyAnswer();
  v13 = [v12 componentsSeparatedByString:@"."];
  v14 = [v13 firstObject];

  v15 = [v6 objectForKey:@"kTipsAppLastLaunchedMajorVersion"];
  unsigned int v16 = +[TPSCommonDefines hardwareChanged];
  if (([v14 isEqualToString:v15] & 1) == 0)
  {
    [v6 setObject:v14 forKey:@"kTipsAppLastLaunchedMajorVersion"];
    [v6 removeObjectForKey:@"TPSAppLastDisplayedContent"];
    [v6 removeObjectForKey:@"TPSLastViewedTipIdentifier"];
    [v6 removeObjectForKey:@"TPSPreviousFeaturedTipIdentifier"];
    [v6 removeObjectForKey:@"TPSFeedLastModified"];
    [v6 removeObjectForKey:@"TPSLikedTipsList"];
    [v6 removeObjectForKey:@"TPSIntroShown"];
    [v6 removeObjectForKey:@"TPSLikeDictionaryKey"];
    [v6 removeObjectForKey:@"validPairedDevices"];
    [v6 removeObjectForKey:@"TPSLastVisibleTipsIDs"];
    [v6 removeObjectForKey:@"TPSLastViewedContentGroup"];
    [v6 removeObjectForKey:@"TPSImageCacheIdentifier"];
    [v6 removeObjectForKey:@"TPSVideoCacheIdentifier"];
    [v6 removeObjectForKey:@"TPSVisibilityForIdMap"];
    [v6 removeObjectForKey:@"TPSVisibleTimestampForIDMap"];
    [v6 removeObjectForKey:@"TPSTargetingVisibleTimestampForIDMap"];
    [v6 removeObjectForKey:@"TPSJSONCacheIdentifier"];
    v18 = +[TPSAnalyticsEventAppLaunched firstLaunchEvent];
    [v18 log];

    v19 = +[TPSAnalyticsChecklistSessionController sharedInstance];
    [v19 setIsFirstLaunch:1];

    if ((v16 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v16)
  {
    v17 = +[TPSAnalyticsChecklistSessionController sharedInstance];
    [v17 setIsFirstLaunch:0];

LABEL_7:
    [(TPSAppDelegate *)self resetCacheDefaults];
    goto LABEL_8;
  }
  if (+[TPSDefaultsManager resetDataCache]) {
    goto LABEL_7;
  }
LABEL_8:
  [v6 synchronize];
  v20 = +[TPSLogger default];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_10007FB44();
  }

  [(TPSAppDelegate *)self clearBadgeCount];
  id v21 = objc_alloc((Class)UIWindow);
  v22 = +[UIScreen mainScreen];
  [v22 bounds];
  id v23 = [v21 initWithFrame:];
  [(TPSAppDelegate *)self setWindow:v23];

  v24 = objc_alloc_init(TPSMainViewController);
  [(TPSAppDelegate *)self setMainViewController:v24];

  v25 = [(TPSAppDelegate *)self mainViewController];
  v26 = [(TPSAppDelegate *)self window];
  [v26 setRootViewController:v25];

  v27 = [(TPSAppDelegate *)self window];
  [v27 makeKeyAndVisible];

  return 1;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void)setMainViewController:(id)a3
{
}

- (TPSMainViewController)mainViewController
{
  return self->_mainViewController;
}

- (void)clearBadgeCount
{
  id v2 = +[UNUserNotificationCenter currentNotificationCenter];
  [v2 setBadgeCount:0 withCompletionHandler:0];
}

- (TPSUIAppController)appController
{
  id v2 = [(TPSAppDelegate *)self mainViewController];
  id v3 = [v2 appController];

  return (TPSUIAppController *)v3;
}

- (TipListViewController)tipListViewController
{
  id v2 = [(TPSAppDelegate *)self mainViewController];
  id v3 = [v2 tipListViewController];

  return (TipListViewController *)v3;
}

- (CollectionListViewController)collectionListViewController
{
  id v2 = [(TPSAppDelegate *)self mainViewController];
  id v3 = [v2 collectionListViewController];

  return (CollectionListViewController *)v3;
}

- (TPSTipsByCollectionViewController)tipsByCollectionViewController
{
  id v2 = [(TPSAppDelegate *)self mainViewController];
  id v3 = [v2 tipsByCollectionViewController];

  return (TPSTipsByCollectionViewController *)v3;
}

- (void)displayCollectionID:(id)a3 tipID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TPSAppDelegate *)self mainViewController];
  [v8 displayCollectionID:v7 tipID:v6];
}

- (void)showTipsView
{
  id v2 = [(TPSAppDelegate *)self mainViewController];
  [v2 showTipsView];
}

- (void)showCollectionsView
{
  id v2 = [(TPSAppDelegate *)self mainViewController];
  [v2 showCollectionsView];
}

- (void)showTOCView
{
  id v2 = [(TPSAppDelegate *)self mainViewController];
  [v2 showTOCView];
}

- (BOOL)isCollectionsViewVisible
{
  id v2 = [(TPSAppDelegate *)self mainViewController];
  unsigned __int8 v3 = [v2 isCollectionsViewVisible];

  return v3;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v6 = a4;
  id v7 = [(TPSAppDelegate *)self mainViewController];
  unsigned __int8 v8 = [v7 handleUserActivity:v6];

  return v8;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(TPSAppDelegate *)self mainViewController];
  unsigned __int8 v10 = [v9 openURL:v8 options:v7];

  return v10;
}

- (void)applicationWillTerminate:(id)a3
{
  v4 = +[TPSLogger default];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10007FB78();
  }

  v5 = [(TPSAppDelegate *)self mainViewController];
  [v5 applicationWillTerminate];
}

- (void)applicationWillEnterForeground:(id)a3
{
  v4 = +[TPSLogger default];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10007FBAC();
  }

  [(TPSAppDelegate *)self clearBadgeCount];
  v5 = [(TPSAppDelegate *)self mainViewController];
  [v5 applicationWillEnterForeground];
}

- (void)applicationDidEnterBackground:(id)a3
{
  v4 = +[TPSLogger default];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10007FBE0();
  }

  [(TPSAppDelegate *)self clearBadgeCount];
  v5 = [(TPSAppDelegate *)self mainViewController];
  [v5 applicationDidEnterBackground];
}

- (void)handleTipsURL:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSAppDelegate *)self mainViewController];
  [v5 handleTipsURL:v4];
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8 = (void (**)(id, uint64_t))a5;
  id v7 = [a4 type];
  [(TPSAppDelegate *)self handleTipsURL:v7];

  v8[2](v8, 1);
}

- (void)setTipListViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_tipListViewController, 0);
}

@end