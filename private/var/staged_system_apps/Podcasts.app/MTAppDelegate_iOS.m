@interface MTAppDelegate_iOS
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)canOpenURL:(id)a3;
- (BOOL)optionDown;
- (UIResponder)commandController;
- (UIViewController)rootViewController;
- (_TtC8Podcasts11AppDelegate)internalAppDelegate;
- (_TtC8Podcasts19LibraryDataProvider)libraryDataProvider;
- (id)_platformContentController;
- (id)application:(id)a3 handlerForIntent:(id)a4;
- (id)createWindowWithScene:(id)a3;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (void)_prewarmSingletons;
- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5;
- (void)application:(id)a3 handleStateRestorationWith:(id)a4;
- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)openURL:(id)a3;
- (void)performActionForShortcutItem:(id)a3 completionHandler:(id)a4;
- (void)setCommandController:(id)a3;
- (void)setInternalAppDelegate:(id)a3;
- (void)setLibraryDataProvider:(id)a3;
- (void)setOptionDown:(BOOL)a3;
- (void)setupAfterBecomingActive;
- (void)setupAfterBecomingFrontmost;
- (void)setupAfterResigningFrontmost;
- (void)startLibraryUpdate;
- (void)switchToLibraryIfNowHasContent;
- (void)willConnectScene;
- (void)willSwitchUser;
@end

@implementation MTAppDelegate_iOS

- (void)_prewarmSingletons
{
  v2 = dispatch_get_global_queue(2, 0);
  dispatch_async(v2, &stru_100552760);
}

- (id)_platformContentController
{
  platformContentController = self->_platformContentController;
  if (!platformContentController)
  {
    v4 = objc_alloc_init(_TtC8Podcasts25PlatformContentController);
    v5 = self->_platformContentController;
    self->_platformContentController = v4;

    platformContentController = self->_platformContentController;
  }

  return platformContentController;
}

- (id)createWindowWithScene:(id)a3
{
  id v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 registerDefaults:&off_10057AF28];

  v5 = +[AppDelegate createWindowWithScene:v3];

  return v5;
}

- (UIViewController)rootViewController
{
  v2 = [(MTAppDelegate_iOS *)self internalAppDelegate];
  id v3 = [v2 window];
  v4 = [v3 rootViewController];

  if (!v4) {
    v4 = objc_opt_new();
  }

  return (UIViewController *)v4;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MTAppDelegate_iOS;
  if ([(MTAppDelegate_Shared *)&v13 application:v8 continueUserActivity:v9 restorationHandler:v10])
  {
    BOOL v11 = [self->_internalAppDelegate application:v8 continueUserActivity:v9 restorationHandler:v10];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)setupAfterBecomingActive
{
  v10.receiver = self;
  v10.super_class = (Class)MTAppDelegate_iOS;
  [(MTAppDelegate_Shared *)&v10 setupAfterBecomingActive];
  id v3 = +[MTImageDownloader sharedInstance];
  [v3 cleanupTemporaryResourcesDirectoryIfNecessary];

  if ((os_feature_enabled_bluemoon() & 1) == 0)
  {
    v4 = +[MTPlayerController defaultInstance];
    [v4 restorePlayerManifestWithCompletion:0];
  }
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012ED58;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  v6 = +[MTNotificationManager sharedInstance];
  unsigned int v7 = [v6 autoSimulateNotificationOnAppActivate];

  if (v7)
  {
    id v8 = +[MTNotificationManager sharedInstance];
    [v8 simulateAnyTestNotification];
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = _MTLogCategoryLifecycle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = +[MTReachability sharedInstance];
    *(_DWORD *)buf = 67109120;
    unsigned int v9 = [v6 isReachable];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received applicationWillEnterForeground, isNetworkReachable: %hhd", buf, 8u);
  }
  v7.receiver = self;
  v7.super_class = (Class)MTAppDelegate_iOS;
  [(MTAppDelegate_Shared *)&v7 applicationWillEnterForeground:v4];
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = _MTLogCategoryLifecycle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = +[MTReachability sharedInstance];
    *(_DWORD *)buf = 67109120;
    unsigned int v16 = [v6 isReachable];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received applicationDidBecomeActive, isNetworkReachable: %hhd", buf, 8u);
  }
  v14.receiver = self;
  v14.super_class = (Class)MTAppDelegate_iOS;
  [(MTAppDelegate_Shared *)&v14 applicationDidBecomeActive:v4];
  objc_super v7 = [(MTAppDelegate_iOS *)self _platformContentController];
  if ([(MTAppDelegate_iOS *)self optionDown]) {
    uint64_t v8 = +[MTWelcomeUtil shouldShowWelcome] ^ 1;
  }
  else {
    uint64_t v8 = 0;
  }
  if (([v7 isMigrationPossible] & 1) != 0 || v8)
  {
    objc_super v10 = +[MTDB sharedInstance];
    BOOL v11 = [v10 mainQueueContext];
    BOOL v9 = [v11 countOfPodcasts] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100059140;
  v12[3] = &unk_10054D960;
  BOOL v13 = v9;
  v12[4] = self;
  [v7 performMigrationIfNecessaryWithOptionKeyDown:v8 :v12];
  [self->_internalAppDelegate applicationDidBecomeActive:v4];
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _MTLogCategoryLifecycle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = +[MTReachability sharedInstance];
    *(_DWORD *)buf = 138543618;
    id v19 = v7;
    __int16 v20 = 1024;
    unsigned int v21 = [v9 isReachable];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received didFinishLaunchingWithOptions: %{public}@, isNetworkReachable: %hhd", buf, 0x12u);
  }
  v17.receiver = self;
  v17.super_class = (Class)MTAppDelegate_iOS;
  [(MTAppDelegate_Shared *)&v17 application:v6 didFinishLaunchingWithOptions:v7];
  objc_super v10 = +[PFRestrictionsController shared];
  [v10 presentLaunchAlertIfNeeded];

  BOOL v11 = +[UMUserManager sharedManager];
  unsigned int v12 = [v11 isMultiUser];

  if (v12)
  {
    BOOL v13 = +[UMUserManager sharedManager];
    [v13 registerUserSwitchStakeHolder:self];
  }
  BOOL v14 = [self->_internalAppDelegate application:v6 didFinishLaunchingWithOptions:v7];
  v15 = [v7 valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
  if (v15)
  {
    [(MTAppDelegate_iOS *)self performActionForShortcutItem:v15 completionHandler:0];
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MTAppDelegate_iOS *)self _prewarmSingletons];
  uint64_t v8 = _MTLogCategoryLifecycle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = +[MTReachability sharedInstance];
    *(_DWORD *)buf = 138543618;
    id v20 = v6;
    __int16 v21 = 1024;
    unsigned int v22 = [v9 isReachable];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received willFinishLaunchingWithOptions: %{public}@, isNetworkReachable: %hhd", buf, 0x12u);
  }
  if ((os_feature_enabled_bluemoon() & 1) == 0)
  {
    objc_super v10 = objc_opt_new();
    +[MTPlayerController setDefaultInstance:v10];
  }
  BOOL v11 = +[AccessAppDelegate shared];

  if (!v11)
  {
    unsigned int v12 = objc_alloc_init(_TtC8Podcasts11AppDelegate);
    +[AccessAppDelegate setShared:v12];
  }
  BOOL v13 = +[AccessAppDelegate shared];
  internalAppDelegate = self->_internalAppDelegate;
  self->_internalAppDelegate = v13;

  v18.receiver = self;
  v18.super_class = (Class)MTAppDelegate_iOS;
  [(MTAppDelegate_Shared *)&v18 application:v7 willFinishLaunchingWithOptions:v6];
  BOOL v15 = [self->_internalAppDelegate application:v7 willFinishLaunchingWithOptions:v6];

  unsigned int v16 = [self->_internalAppDelegate libraryDataProvider];
  [(MTAppDelegate_iOS *)self setLibraryDataProvider:v16];

  return v15;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  id v4 = a4;
  dispatch_time_t v5 = +[UIApplication sharedApplication];
  id v6 = [v5 supportedInterfaceOrientationsForWindow:v4];

  return (unint64_t)v6;
}

- (void)willConnectScene
{
  id v3 = [(MTAppDelegate_iOS *)self internalAppDelegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    dispatch_time_t v5 = [(MTAppDelegate_iOS *)self internalAppDelegate];
    [v5 willConnectScene];
    id v6 = +[AccessAppDelegate shared];
    id v7 = +[PlatformAppController appControllerWithDelegate:v6];
    [(MTAppDelegate_Shared *)self setAppController:v7];

    uint64_t v8 = [(MTAppDelegate_iOS *)self _platformContentController];
    BOOL v9 = [(MTAppDelegate_Shared *)self appController];
    [v8 setMigrationPresenter:v9];

    objc_super v10 = [(MTAppDelegate_iOS *)self rootViewController];
    [v10 becomeFirstResponder];

    BOOL v11 = _MTLogCategoryLifecycle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Will kick off downloads restoration, if needed.", v13, 2u);
    }

    unsigned int v12 = [(MTAppDelegate_iOS *)self libraryDataProvider];
    [v12 restorePreviouslyDownloadedEpisodes];
  }
}

- (_TtC8Podcasts11AppDelegate)internalAppDelegate
{
  return self->_internalAppDelegate;
}

- (void)setLibraryDataProvider:(id)a3
{
}

- (BOOL)optionDown
{
  return self->_optionDown;
}

- (_TtC8Podcasts19LibraryDataProvider)libraryDataProvider
{
  return self->_libraryDataProvider;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(MTAppDelegate_iOS *)self internalAppDelegate];

  if (v11)
  {
    unsigned int v12 = [(MTAppDelegate_iOS *)self internalAppDelegate];
    unsigned __int8 v13 = [v12 application:v8 runTest:v9 options:v10];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = _MTLogCategoryLifecycle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received handleEventsForBackgroundURLSession, identifier %{public}@", buf, 0xCu);
  }

  unsigned int v12 = [(MTAppDelegate_iOS *)self libraryDataProvider];
  unsigned __int8 v13 = [v12 handleEventsForBackgroundURLSessionWithIdentifier:v9 handler:v10];

  if ((v13 & 1) == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)MTAppDelegate_iOS;
    [(MTAppDelegate_Shared *)&v14 application:v8 handleEventsForBackgroundURLSession:v9 completionHandler:v10];
  }
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = _MTLogCategoryLifecycle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[MTReachability sharedInstance];
    *(_DWORD *)buf = 67109120;
    unsigned int v9 = [v6 isReachable];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received applicationWillTerminate, isNetworkReachable: %hhd", buf, 8u);
  }
  [self->_internalAppDelegate applicationWillTerminate:v4];
  v7.receiver = self;
  v7.super_class = (Class)MTAppDelegate_iOS;
  [(MTAppDelegate_Shared *)&v7 applicationWillTerminate:v4];
}

- (void)switchToLibraryIfNowHasContent
{
  id v3 = +[MTDB sharedInstance];
  id v5 = [v3 mainQueueContext];

  if ([v5 countOfPodcasts])
  {
    id v4 = [(MTAppDelegate_Shared *)self appController];
    [v4 selectMyPodcastsTab];
  }
}

- (void)applicationWillResignActive:(id)a3
{
  id v4 = a3;
  id v5 = _MTLogCategoryLifecycle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[MTReachability sharedInstance];
    *(_DWORD *)buf = 67109120;
    unsigned int v10 = [v6 isReachable];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received applicationWillResignActive, isNetworkReachable: %hhd", buf, 8u);
  }
  v8.receiver = self;
  v8.super_class = (Class)MTAppDelegate_iOS;
  [(MTAppDelegate_Shared *)&v8 applicationWillResignActive:v4];

  objc_super v7 = +[MTNotificationManager sharedInstance];
  [v7 processNotificationsWithReason:@"Application Resign"];
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  id v5 = _MTLogCategoryLifecycle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[MTReachability sharedInstance];
    *(_DWORD *)buf = 67109120;
    unsigned int v12 = [v6 isReachable];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received applicationDidEnterBackground, isNetworkReachable: %hhd", buf, 8u);
  }
  objc_super v7 = +[MTMediaLibraryUpdater sharedInstance];
  [v7 stopObservingMediaLibrary];

  objc_super v8 = +[MTNMSDefaultsUpdater sharedInstance];
  [v8 stopObservingDownloadedPodcastsChanges];

  unsigned int v9 = +[MTAppShortcutManager sharedInstance];
  [v9 updateShortcutItems];

  [self->_internalAppDelegate applicationDidEnterBackground:v4];
  v10.receiver = self;
  v10.super_class = (Class)MTAppDelegate_iOS;
  [(MTAppDelegate_Shared *)&v10 applicationDidEnterBackground:v4];
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = _MTLogCategoryLifecycle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [v9 absoluteString];
    *(_DWORD *)buf = 138412290;
    objc_super v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received openURL: url: %@", buf, 0xCu);
  }
  internalAppDelegate = self->_internalAppDelegate;
  if (internalAppDelegate
    && [internalAppDelegate application:v8 openURL:v9 options:v10])
  {
    BOOL v14 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)MTAppDelegate_iOS;
    BOOL v14 = [(MTAppDelegate_Shared *)&v16 application:v8 openURL:v9 options:v10];
  }

  return v14;
}

- (void)setupAfterBecomingFrontmost
{
  id v2 = +[SyncControllerFactory resolvedSyncController];
  [v2 syncEverything];
}

- (void)setupAfterResigningFrontmost
{
  id v2 = +[SyncControllerFactory resolvedSyncController];
  [v2 syncEverything];
}

- (void)willSwitchUser
{
  id v2 = +[MTPlayerController defaultInstance];
  unsigned int v3 = [v2 isPlayingLocally];

  if (v3)
  {
    id v4 = +[MTPlayerController defaultInstance];
    [v4 pauseLocalPlayerWithInitiator:2];
  }
}

- (BOOL)canOpenURL:(id)a3
{
  id v4 = a3;
  id v5 = [(MTAppDelegate_iOS *)self rootViewController];
  id v6 = [v5 mt_topViewController];

  objc_super v7 = [[MTURLPresentationController alloc] initWithURL:v4];
  LOBYTE(v4) = [(MTURLPresentationController *)v7 canShowWithPresentingViewController:v6];

  return (char)v4;
}

- (void)openURL:(id)a3
{
  id v4 = a3;
  id v5 = [(MTAppDelegate_iOS *)self rootViewController];
  [v5 mt_topViewController];
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [[MTURLPresentationController alloc] initWithURL:v4];
  [(MTURLPresentationController *)v6 showWithPresentingViewController:v7];
}

- (void)application:(id)a3 handleStateRestorationWith:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(MTAppDelegate_iOS *)self internalAppDelegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [(MTAppDelegate_iOS *)self internalAppDelegate];
    [v9 application:v10 openStateRestorationActivity:v6];
  }
}

- (void)startLibraryUpdate
{
  unsigned int v3 = [(MTAppDelegate_Shared *)self updateQueue];
  [v3 cancelAllOperations];

  id v4 = +[MTMediaLibraryUpdater sharedInstance];
  [v4 startObservingMediaLibrary];

  id v5 = _MTLogCategoryMediaLibrary();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "library updater scheduled", buf, 2u);
  }

  id v6 = [(MTAppDelegate_Shared *)self updateQueue];
  [v6 addOperationWithBlock:&stru_1005527A8];

  id v7 = [(MTAppDelegate_Shared *)self updateQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10012F250;
  v8[3] = &unk_10054D570;
  v8[4] = self;
  [v7 addOperationWithBlock:v8];
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = _MTLogCategoryLifecycle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received performActionForShortcutItem", v10, 2u);
  }

  [(MTAppDelegate_iOS *)self performActionForShortcutItem:v8 completionHandler:v7];
}

- (void)performActionForShortcutItem:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[MTAppShortcutManager sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10012F400;
  v9[3] = &unk_10054DA50;
  id v10 = v5;
  id v8 = v5;
  [v7 performActionForShortcutItem:v6 completionHandler:v9];
}

- (id)application:(id)a3 handlerForIntent:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v6 = objc_opt_new();
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)setInternalAppDelegate:(id)a3
{
}

- (UIResponder)commandController
{
  return self->_commandController;
}

- (void)setCommandController:(id)a3
{
}

- (void)setOptionDown:(BOOL)a3
{
  self->_optionDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryDataProvider, 0);
  objc_storeStrong((id *)&self->_commandController, 0);
  objc_storeStrong((id *)&self->_internalAppDelegate, 0);
  objc_storeStrong((id *)&self->_migrationScreen, 0);

  objc_storeStrong((id *)&self->_platformContentController, 0);
}

@end