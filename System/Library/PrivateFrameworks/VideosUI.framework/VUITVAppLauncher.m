@interface VUITVAppLauncher
+ (BOOL)_isDeeplinkTVButton:(id)a3;
+ (BOOL)_isRunningState:(id)a3;
+ (BOOL)_isRunningWithoutJSState:(id)a3;
+ (BOOL)isDeeplinkTVButton:(id)a3;
+ (BOOL)isSidebarEnabled;
+ (id)_libraryOnlyTabBarItem;
+ (id)sharedInstance;
- (ATAParsedOpenURL)deferredParsedOpenURL;
- (BOOL)_isActiveMediaLibraryTheDeviceMediaLibrary;
- (BOOL)_shouldRecordExitEvent;
- (BOOL)appWasForegrounded;
- (BOOL)appWasRunningWithoutJavascript;
- (BOOL)applicationDidFinishLaunchingWithOptions:(id)a3;
- (BOOL)applicationWillFinishLaunchingWithOptions:(id)a3;
- (BOOL)isAppRunning;
- (BOOL)isAppRunningWithoutJS;
- (BOOL)isDeeplinkLaunched;
- (BOOL)isStillProcessingStartupItems;
- (BOOL)isTerminating;
- (BOOL)openURL:(id)a3 options:(id)a4;
- (BOOL)overrideOrientation;
- (BOOL)startupOfferProcessingCompleted;
- (BOOL)startupPrewarmSubscriptionDataCompleted;
- (NSArray)tabBarItems;
- (NSDictionary)launchOptions;
- (NSString)sportsTabIdentifier;
- (UIWindow)appWindow;
- (VUIRootSplitViewController)splitViewController;
- (VUIStateMachine)stateMachine;
- (VUITVAppLauncher)init;
- (VUITVApplicationController)appController;
- (VUITabBarProtocol)tabBarController;
- (_TtC8VideosUI20VUIJetPackController)jetPackController;
- (id)_dialogMetricsForGDPR;
- (id)deeplinkCompletionHandler;
- (id)rootViewController;
- (id)rootViewControllerForAppController:(id)a3;
- (id)switchTabHandler;
- (void)_accountsChanged:(id)a3;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_applicationWillTerminateNotification:(id)a3;
- (void)_configureStateMachine;
- (void)_fetchApplicationControllerBootURL;
- (void)_fetchFullFeatureFlag:(id)a3;
- (void)_finishAppLoading;
- (void)_finishApplicationControllerWithLaunchContext:(id)a3 completion:(id)a4;
- (void)_handleAMSEngagementSheetPresentation:(BOOL)a3;
- (void)_handleDeferredParsedOpenURLIfNeeded;
- (void)_handleNetworkReachabilityDidChangeNotification:(id)a3;
- (void)_handleOfferProcessingDidFinishNotification:(id)a3;
- (void)_handleOfferProcessingDidStartNotification:(id)a3;
- (void)_handleParsedOpenURL:(id)a3;
- (void)_handlePrewarmSubscriptionDataNotification:(id)a3;
- (void)_initializeBookmarkService;
- (void)_initializeMediaLibrary;
- (void)_initializePlayer;
- (void)_isLibraryOnlyCountryChanged:(id)a3;
- (void)_javascriptSetTabBarItems:(id)a3;
- (void)_registerStateMachineHandlers;
- (void)_resetDeferredParsedOpenURL;
- (void)_resetJavascriptState;
- (void)_retrieveSportsTabIdentifierFromTabBarItems:(id)a3;
- (void)_showJavascriptUnavailableUIWithNetworkAvailable:(BOOL)a3;
- (void)_startApplicationControllerWithBootURL:(id)a3 completion:(id)a4;
- (void)_startJavascriptSetup;
- (void)_stopApplicationController;
- (void)_updateDeviceMediaLibraryFromCloud;
- (void)_updateTabControllerWithTabBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4;
- (void)appController:(id)a3 didFailWithError:(id)a4;
- (void)appController:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (void)appController:(id)a3 didStopWithOptions:(id)a4;
- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)cleanUp;
- (void)configureAppWindow;
- (void)didAcceptGDPRWelcome;
- (void)didFailToLaunch:(id)a3;
- (void)didShowGDPRWelcome;
- (void)hideLoadingView;
- (void)prewarmOnMain;
- (void)prewarmPostAppDidFinishLaunching;
- (void)processStartupItems;
- (void)refreshTabBarItems;
- (void)registerForApplicationNotifications;
- (void)selectTabBarItem:(id)a3;
- (void)setAppController:(id)a3;
- (void)setAppWasForegrounded:(BOOL)a3;
- (void)setAppWasRunningWithoutJavascript:(BOOL)a3;
- (void)setAppWindow:(id)a3;
- (void)setDeeplinkCompletionHandler:(id)a3;
- (void)setDeferredParsedOpenURL:(id)a3;
- (void)setIsDeeplinkLaunched:(BOOL)a3;
- (void)setIsStillProcessingStartupItems:(BOOL)a3;
- (void)setIsTerminating:(BOOL)a3;
- (void)setJetPackController:(id)a3;
- (void)setLaunchOptions:(id)a3;
- (void)setMainWindow:(id)a3;
- (void)setOverrideOrientation:(BOOL)a3;
- (void)setSplitViewController:(id)a3;
- (void)setSportsTabIdentifier:(id)a3;
- (void)setStartupOfferProcessingCompleted:(BOOL)a3;
- (void)setStartupPrewarmSubscriptionDataCompleted:(BOOL)a3;
- (void)setStateMachine:(id)a3;
- (void)setSwitchTabHandler:(id)a3;
- (void)setTabBarController:(id)a3;
- (void)setTabBarItems:(id)a3;
- (void)showLoadingView;
@end

@implementation VUITVAppLauncher

- (void)appController:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v9 = @"Options";
    v10[0] = a4;
    v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = a4;
    v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    v7 = 0;
  }
  v8 = [(VUITVAppLauncher *)self stateMachine];
  [v8 postEvent:@"TVApplicationController Did Finish Launching" withContext:0 userInfo:v7];
}

- (void)configureAppWindow
{
  v3 = VUISignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.configureAppWindow.init", "", buf, 2u);
  }

  appWindow = self->_appWindow;
  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  [(UIWindow *)appWindow setTintColor:v5];

  id v6 = self->_appWindow;
  v7 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  [(UIWindow *)v6 setBackgroundColor:v7];

  v8 = [[VUISplitViewController alloc] initWithStyle:1];
  [(UIWindow *)self->_appWindow setRootViewController:v8];
  v9 = VUISignpostLogObject();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.configureAppWindow.init", "", v14, 2u);
  }

  v10 = VUISignpostLogObject();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.configureAppWindow.makeKey", "", v13, 2u);
  }

  [(UIWindow *)self->_appWindow vui_makeKeyAndVisible];
  v11 = VUISignpostLogObject();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.configureAppWindow.makeKey", "", v12, 2u);
  }
}

void __60__VUITVAppLauncher__applicationDidBecomeActiveNotification___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = +[VUIAppReviewManager sharedInstance];
    [v2 reportApplicationDidForegroundtoAMSSharedStoreReview];
  }
}

- (void)_updateTabControllerWithTabBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 count];
  v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = @"NO";
    *(_DWORD *)v26 = 138412802;
    *(void *)&v26[4] = v6;
    if (v4) {
      v9 = @"YES";
    }
    *(_WORD *)&v26[12] = 2048;
    *(void *)&v26[14] = v7;
    __int16 v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Updating tabbar with items: %@ - count %ld - setSelectedIdentifierFromDefaults: %@", v26, 0x20u);
  }

  v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v10 userInterfaceIdiom] != 1) {
    goto LABEL_8;
  }
  v11 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v11 isRunningTest])
  {

LABEL_8:
LABEL_9:
    v12 = [(VUITVAppLauncher *)self tabBarController];
    v13 = [(VUITVAppLauncher *)self appController];
    v14 = [v13 appContext];
    [v12 updateWithTabBarItems:v6 setSelectedIdentifierFromDefaults:v4 appContext:v14];
LABEL_10:

    goto LABEL_11;
  }
  char v23 = _os_feature_enabled_impl();

  if (v23) {
    goto LABEL_9;
  }
  if (v7)
  {
    v12 = [(VUITVAppLauncher *)self splitViewController];
    v13 = [(VUITVAppLauncher *)self appController];
    v14 = [v13 appContext];
    [v12 updateWithBarItems:v6 setSelectedIdentifierFromDefaults:v4 appContext:v14];
    goto LABEL_10;
  }
  v24 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  char v25 = [v24 isNetworkReachable];

  v12 = VUIDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[VUITVAppLauncher _updateTabControllerWithTabBarItems:setSelectedIdentifierFromDefaults:](v25, v12);
  }
LABEL_11:

  [(VUITVAppLauncher *)self _retrieveSportsTabIdentifierFromTabBarItems:v6];
  if (!self->_deferredParsedOpenURL)
  {
    v15 = [(VUITVAppLauncher *)self appController];
    v16 = [v15 appContext];

    if (v16)
    {
      v17 = [(VUITVAppLauncher *)self appController];
      v18 = [v17 appContext];
      +[VUIGDPRPresentationManager showGDPRWelcomeScreen:v18];
    }
  }
  if (!+[VUIGDPRPresentationManager shouldShowWelcomeScreen])
  {
    v19 = dispatch_get_global_queue(0, 0);
    dispatch_async(v19, &__block_literal_global_330);
  }
  v20 = +[VUIInterfaceFactory sharedInstance];
  v21 = [v20 openURLHandler];
  if ([v21 openedByDeeplink])
  {
  }
  else
  {
    BOOL v22 = +[VUIGDPRPresentationManager shouldShowWelcomeScreen];

    if (!v22) {
      [(VUITVAppLauncher *)self processStartupItems];
    }
  }
  [(VUITVAppLauncher *)self _handleDeferredParsedOpenURLIfNeeded];
}

- (VUITVApplicationController)appController
{
  return self->_appController;
}

- (VUITabBarProtocol)tabBarController
{
  tabBarController = self->_tabBarController;
  if (!tabBarController)
  {
    if (+[VUIUtilities isSUIEnabled])
    {
      BOOL v4 = +[VUIInterfaceFactory sharedInstance];
      v5 = [v4 tabBarController];

      goto LABEL_8;
    }
    id v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Initializing TabBarController", v10, 2u);
    }

    uint64_t v7 = objc_alloc_init(VUITabBarController);
    v8 = self->_tabBarController;
    self->_tabBarController = (VUITabBarProtocol *)v7;

    tabBarController = self->_tabBarController;
  }
  v5 = tabBarController;
LABEL_8:
  return v5;
}

- (id)rootViewControllerForAppController:(id)a3
{
  BOOL v4 = +[VUIPlaybackManager sharedInstance];
  int v5 = [v4 isFullscreenPlaybackUIBeingShown];

  id v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];
  if (!v5)
  {
    if (v7 == 1)
    {
      v10 = [MEMORY[0x1E4FB1438] sharedApplication];
      if (![v10 isRunningTest])
      {
        char v20 = _os_feature_enabled_impl();

        if ((v20 & 1) == 0)
        {
          splitViewController = self->_splitViewController;
          self->_splitViewController = 0;
          goto LABEL_13;
        }
LABEL_12:
        splitViewController = self->_tabBarController;
        self->_tabBarController = 0;
LABEL_13:

        goto LABEL_17;
      }
    }
    goto LABEL_12;
  }
  if (v7 != 1)
  {
LABEL_5:

LABEL_6:
    if (![(VUITabBarProtocol *)self->_tabBarController conformsToProtocol:&unk_1F3FE1830])goto LABEL_17; {
    tabBarController = self->_tabBarController;
    }
    goto LABEL_16;
  }
  v8 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v8 isRunningTest])
  {

    goto LABEL_5;
  }
  char v12 = _os_feature_enabled_impl();

  if (v12) {
    goto LABEL_6;
  }
  tabBarController = self->_splitViewController;
LABEL_16:
  [(VUITabBarProtocol *)tabBarController removeAllChildViewControllers];
LABEL_17:
  v13 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v13 userInterfaceIdiom] != 1)
  {
LABEL_20:

    goto LABEL_21;
  }
  v14 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v14 isRunningTest])
  {

    goto LABEL_20;
  }
  char v17 = _os_feature_enabled_impl();

  if ((v17 & 1) == 0)
  {
    id v16 = [(VUITVAppLauncher *)self splitViewController];
    goto LABEL_30;
  }
LABEL_21:
  v15 = [(VUITVAppLauncher *)self tabBarController];
  if ([v15 conformsToProtocol:&unk_1F3F5D0F8]
    || +[VUIUtilities isSUIEnabled])
  {
    id v16 = v15;
  }
  else
  {
    v18 = VUIDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[VUITVAppLauncher rootViewControllerForAppController:](v18);
    }

    id v16 = 0;
  }

LABEL_30:
  return v16;
}

- (void)processStartupItems
{
  v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUITVAppLauncher - processStartupItems", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__VUITVAppLauncher_processStartupItems__block_invoke;
  aBlock[3] = &unk_1E6DF5B20;
  aBlock[4] = self;
  BOOL v4 = _Block_copy(aBlock);
  int v5 = +[VUITVAppLauncher sharedInstance];
  [v5 setIsStillProcessingStartupItems:1];

  if (!self->_appWasRunningWithoutJavascript)
  {
    id v6 = [(VUITVAppLauncher *)self appController];
    uint64_t v7 = [v6 appContext];
    +[VUIOfferUtilities fetchAndPresentOffer:v7 sourceEvent:@"AppLaunch" completion:v4];
  }
  self->_appWasRunningWithoutJavascript = 0;
}

- (void)_retrieveSportsTabIdentifierFromTabBarItems:(id)a3
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x1E4F1CAD0];
  v39[0] = @"sports";
  v39[1] = @"mls";
  v39[2] = @"tvs.sbd.7000";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
  uint64_t v7 = [v5 setWithArray:v6];

  sportsTabIdentifier = self->_sportsTabIdentifier;
  p_sportsTabIdentifier = (id *)&self->_sportsTabIdentifier;
  id *p_sportsTabIdentifier = 0;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v4;
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v27 = *(void *)v34;
    v26 = p_sportsTabIdentifier;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "vui_stringForKey:", @"identifier");
        if ([v7 containsObject:v14])
        {
          p_sportsTabIdentifier = v26;
          char v23 = *v26;
          *v26 = v14;

          goto LABEL_21;
        }
        v15 = objc_msgSend(v13, "vui_arrayForKey:", @"childItems");
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v30;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v30 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "vui_stringForKey:", @"identifier");
              if ([v7 containsObject:v21])
              {
                BOOL v22 = *v26;
                *v26 = v21;

                goto LABEL_17;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      p_sportsTabIdentifier = v26;
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  if (![*p_sportsTabIdentifier length])
  {
    v24 = VUIDefaultLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_INFO, "VUITVAppLauncher - VUITVAppLauncher:: there may be no sports tab in the remote items, or the sport tab has different identifier now. Double check it", buf, 2u);
    }

    objc_storeStrong(p_sportsTabIdentifier, @"sports");
  }
}

- (void)_handleDeferredParsedOpenURLIfNeeded
{
  id v6 = [(VUITVAppLauncher *)self deferredParsedOpenURL];
  if (v6)
  {
    [(VUITVAppLauncher *)self setDeferredParsedOpenURL:0];
    [(VUITVAppLauncher *)self _handleParsedOpenURL:v6];
  }
  else
  {
    v3 = +[VUIInterfaceFactory sharedInstance];
    id v4 = [v3 openURLHandler];
    int v5 = [v4 deferredOpenURL];

    if (([(id)objc_opt_class() isDeeplinkTVButton:v5] & 1) == 0) {
      [(VUITVAppLauncher *)self hideLoadingView];
    }
  }
}

- (void)hideLoadingView
{
}

- (ATAParsedOpenURL)deferredParsedOpenURL
{
  return self->_deferredParsedOpenURL;
}

- (void)_finishAppLoading
{
  [(VUITVAppLauncher *)self setIsStillProcessingStartupItems:0];
  +[VideosUI handleAppDidFinishLoading];
}

- (void)setIsStillProcessingStartupItems:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  p_isStillProcessingStartupItemsLock = &self->_isStillProcessingStartupItemsLock;
  os_unfair_lock_lock(&self->_isStillProcessingStartupItemsLock);
  self->_isStillProcessingStartupItems = v3;
  os_unfair_lock_unlock(p_isStillProcessingStartupItemsLock);
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = @"NO";
    if (v3) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "VUITVAppLauncher::set isStillProcessingStartupItems to %@", (uint8_t *)&v8, 0xCu);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__VUITVAppLauncher_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_34 != -1) {
    dispatch_once(&sharedInstance_onceToken_34, block);
  }
  id v2 = (void *)sharedInstance_sSharedInstance_2;
  return v2;
}

- (BOOL)isAppRunning
{
  BOOL v3 = objc_opt_class();
  id v4 = [(VUITVAppLauncher *)self stateMachine];
  int v5 = [v4 currentState];
  LOBYTE(v3) = [v3 _isRunningState:v5];

  return (char)v3;
}

void __24__VUITVAppLauncher_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  BOOL v6 = +[VUITVAppLauncher _isRunningState:a3];
  BOOL v7 = +[VUITVAppLauncher _isRunningState:v5];

  if (v7 && !v6)
  {
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"VUITVAppLauncherDidStartRunningNotification" object:0];
  }
}

+ (BOOL)_isRunningState:(id)a3
{
  v8[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v8[0] = @"RunningWithJavascript";
  v8[1] = @"RunningWithoutJavascript";
  v8[2] = @"RunningWithoutJavascriptWaitingForBootURL";
  v8[3] = @"RunningWithoutJavascriptWaitingForFullFeatureFlag";
  v8[4] = @"RunningWithoutJavascriptWaitingForTVApplicationControllerToStart";
  v8[5] = @"RunningWithoutJavascriptWaitingForInitialTabItems";
  v8[6] = @"RunningWithoutJavascriptWaitingForTVApplicationControllerToStartAndInitialTabItems";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:7];
  id v5 = v4;
  if (v3) {
    char v6 = [v4 containsObject:v3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_259(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[VideosUI initializeUIFactory];
  uint64_t v10 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v11 = [v10 isNetworkReachable];

  char v12 = VUIDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = @"NO";
    *(_DWORD *)v41 = 138412802;
    *(void *)&v41[4] = @"UIApplication Did Finish Launching";
    *(void *)&v41[14] = @"StartingUIApplication";
    *(_WORD *)&v41[12] = 2112;
    if (v11) {
      v13 = @"YES";
    }
    *(_WORD *)&v41[22] = 2112;
    v42 = v13;
    _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: %@ - JS State: %@ - isNetworkReachable: %@", v41, 0x20u);
  }

  BOOL v14 = +[VUIAuthenticationManager isLibraryOnlyCountry];
  if (v14) {
    LOBYTE(v14) = +[VUIAuthenticationManager isLibraryOnlyCountryResolved];
  }
  if (!v11 || v14)
  {
    objc_msgSend(WeakRetained, "_showJavascriptUnavailableUIWithNetworkAvailable:", 0, *(_OWORD *)v41, *(void *)&v41[16]);
    id v16 = @"RunningWithoutJavascript";
  }
  else
  {
    (*(void (**)(void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7, v15);
    id v16 = @"WaitingForBootURL";
  }
  if (os_variant_has_internal_content()) {
    JSRemoteInspectorSetLogToSystemConsole();
  }
  id v17 = +[VUISettingsManager sharedInstance];
  id v18 = +[VUIPostPlayUpsellManager sharedInstance];
  uint64_t v19 = objc_msgSend(v8, "vui_dictionaryForKey:", @"Options");

  [WeakRetained setLaunchOptions:v19];
  char v20 = VUISignpostLogObject();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BookmarkService Initialization", "", v41, 2u);
  }

  v21 = +[VUIPerfMetricsAppLaunchController sharedInstance];
  [v21 recordAppLaunchEventWithEventType:@"bookmarkServiceInitializationStart"];

  [WeakRetained _initializeBookmarkService];
  BOOL v22 = VUISignpostLogObject();
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BookmarkService Initialization", "", v41, 2u);
  }

  char v23 = +[VUIPerfMetricsAppLaunchController sharedInstance];
  [v23 recordAppLaunchEventWithEventType:@"bookmarkServiceInitializationEnd"];

  v24 = VUISignpostLogObject();
  if (os_signpost_enabled(v24))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Rentals.Init", "", v41, 2u);
  }

  char v25 = +[VUIRentalManager sharedInstance];
  [v25 initializeRentals];

  v26 = +[VUIARQLPreviewManager sharedInstance];
  [v26 cancelExistingDownloadsIfAny];

  uint64_t v27 = VUISignpostLogObject();
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Rentals.Init", "", v41, 2u);
  }

  v28 = VUISignpostLogObject();
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v28, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.DidFinishLaunch.OthersInit", "", v41, 2u);
  }

  id v29 = (id)[MEMORY[0x1E4FB50E8] defaultCenter];
  [WeakRetained _initializePlayer];
  id v30 = (id)[MEMORY[0x1E4FB5030] sharedInstance];
  long long v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v31 addObserver:WeakRetained selector:sel__handleNetworkReachabilityDidChangeNotification_ name:*MEMORY[0x1E4FB3E08] object:0];
  long long v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v32 addObserver:*(void *)(a1 + 32) selector:sel__accountsChanged_ name:@"VUIAuthenticationManagerAccountStoreDidChangeNotification" object:0];

  long long v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v33 addObserver:*(void *)(a1 + 32) selector:sel__isLibraryOnlyCountryChanged_ name:@"VUIAuthenticationManagerIsLibraryOnlyCountryDidChangeNotification" object:0];

  long long v34 = [MEMORY[0x1E4FB3C28] sharedInstance];
  [v34 listenForApplicationNotifications];

  id v35 = (id)[MEMORY[0x1E4FB3C20] sharedInstance];
  long long v36 = VUISignpostLogObject();
  if (os_signpost_enabled(v36))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v36, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UIApplicationLaunch", "", v41, 2u);
  }

  v37 = +[VUIPerfMetricsAppLaunchController sharedInstance];
  [v37 recordAppLaunchEventWithEventType:@"uikitApplicationLaunchEnd"];

  id v38 = +[VUIAppReviewManager sharedInstance];
  v39 = VUISignpostLogObject();
  if (os_signpost_enabled(v39))
  {
    *(_WORD *)v41 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v39, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.DidFinishLaunch.OthersInit", "", v41, 2u);
  }

  return v16;
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VUISignpostLogObject();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.WaitingForStateTransition", "", buf, 2u);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_254;
  v5[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  [v3 executeBlockAfterCurrentStateTransition:v5];
  objc_destroyWeak(&v6);
}

- (void)setLaunchOptions:(id)a3
{
}

- (void)_isLibraryOnlyCountryChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    +[VUIAuthenticationManager isLibraryOnlyCountry];
    id v5 = VUIBoolLogString();
    +[VUIAuthenticationManager isLibraryOnlyCountryResolved];
    id v6 = VUIBoolLogString();
    int v8 = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    int v11 = v6;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Is library only has changed. isLibraryOnlyCountry %@ . isLibraryOnlyCountryResolved %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(VUITVAppLauncher *)self stateMachine];
  [v7 postEvent:@"Is Library Only Country Did Change"];
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_281(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (+[VUIAuthenticationManager isLibraryOnlyCountryResolved](VUIAuthenticationManager, "isLibraryOnlyCountryResolved")&& +[VUIAuthenticationManager isLibraryOnlyCountry])
  {
    id v2 = [MEMORY[0x1E4FB3CF8] sharedInstance];
    uint64_t v3 = [v2 isNetworkReachable];

    [WeakRetained _showJavascriptUnavailableUIWithNetworkAvailable:v3];
    id v4 = @"RunningWithoutJavascript";
  }
  else
  {
    id v4 = @"WaitingForBootURL";
  }

  return v4;
}

- (void)_initializePlayer
{
  id v2 = +[VUIMediaLibraryManager defaultManager];
  id v3 = (id)[v2 sidebandMediaLibrary];

  id v6 = dispatch_queue_create("Temp download dir cleanup queue", 0);
  dispatch_async(v6, &__block_literal_global_354);
  +[VUIStoreFPSKeyLoader preFetchFPSCertificate];
  id v4 = +[VUIPlaybackReporterUTS sharedInstance];
  id v5 = +[VUIPlaybackReporterVPAF sharedInstance];
}

- (void)_initializeBookmarkService
{
  id v2 = [MEMORY[0x1E4F31A60] sharedUbiquitousPlaybackPositionController];
  [v2 beginUsingPlaybackPositionMetadata];
}

+ (BOOL)isDeeplinkTVButton:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  if ([v4 isEqualToString:@"button"])
  {
    id v5 = [v3 path];
    char v6 = [v5 isEqualToString:@"/tv"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

void __35__VUITVAppLauncher_hideLoadingView__block_invoke()
{
  id v0 = +[VUIAppLoadingView loadingScreen];
  [v0 hide];
}

- (void)_registerStateMachineHandlers
{
  v82[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v3 = [(VUITVAppLauncher *)self stateMachine];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2;
  aBlock[3] = &unk_1E6DF7370;
  id v77 = &__block_literal_global_251;
  objc_copyWeak(&v78, &location);
  id v4 = _Block_copy(aBlock);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_3;
  v73[3] = &unk_1E6DFCBD8;
  id v74 = &__block_literal_global_251;
  objc_copyWeak(&v75, &location);
  id v5 = _Block_copy(v73);
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_4;
  v70[3] = &unk_1E6DF7370;
  id v71 = &__block_literal_global_251;
  objc_copyWeak(&v72, &location);
  char v6 = _Block_copy(v70);
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_5;
  v68[3] = &unk_1E6DFCC00;
  objc_copyWeak(&v69, &location);
  id v7 = _Block_copy(v68);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_257;
  v67[3] = &unk_1E6DFCC28;
  v67[4] = self;
  [v3 registerHandlerForEvent:@"UIApplication Will Finish Launching" onState:@"Idle" withBlock:v67];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_259;
  v64[3] = &unk_1E6DFCC50;
  objc_copyWeak(&v66, &location);
  id v18 = v7;
  id v65 = v18;
  v64[4] = self;
  [v3 registerHandlerForEvent:@"UIApplication Did Finish Launching" onState:@"StartingUIApplication" withBlock:v64];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_281;
  v62[3] = &unk_1E6DFCC78;
  objc_copyWeak(&v63, &location);
  [v3 registerHandlerForEvent:@"Is Library Only Country Did Change" onState:@"WaitingForBootURL" withBlock:v62];
  v82[0] = @"RunningWithJavascript";
  v82[1] = @"RunningWithoutJavascript";
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_282;
  v60[3] = &unk_1E6DFCC78;
  objc_copyWeak(&v61, &location);
  [v3 registerHandlerForEvent:@"UIApplication Open URL" onStates:v8 withBlock:v60];

  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_3_283;
  v58[3] = &unk_1E6DFCC78;
  objc_copyWeak(&v59, &location);
  [v3 registerDefaultHandlerForEvent:@"UIApplication Open URL" withBlock:v58];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_4_284;
  v56[3] = &unk_1E6DFCC78;
  objc_copyWeak(&v57, &location);
  [v3 registerHandlerForEvent:@"Boot URL Fetch Did Complete" onState:@"WaitingForBootURL" withBlock:v56];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_285;
  v54[3] = &unk_1E6DFCC78;
  objc_copyWeak(&v55, &location);
  [v3 registerHandlerForEvent:@"Boot URL Fetch Did Complete" onState:@"RunningWithoutJavascriptWaitingForBootURL" withBlock:v54];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_286;
  v52[3] = &unk_1E6DFCC78;
  objc_copyWeak(&v53, &location);
  [v3 registerHandlerForEvent:@"Full Feature Flag Fetch Did Complete" onState:@"WaitingForFullFeatureFlag" withBlock:v52];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_290;
  v50[3] = &unk_1E6DFCC78;
  objc_copyWeak(&v51, &location);
  [v3 registerHandlerForEvent:@"Full Feature Flag Fetch Did Complete" onState:@"RunningWithoutJavascriptWaitingForFullFeatureFlag" withBlock:v50];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_291;
  v48[3] = &unk_1E6DFCCA0;
  id v9 = v4;
  id v49 = v9;
  [v3 registerHandlerForEvent:@"Tab Items Received From Javascript" onState:@"WaitingForTVApplicationControllerToStartAndInitialTabItems" withBlock:v48];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_292;
  v45[3] = &unk_1E6DFCCC8;
  id v46 = &__block_literal_global_251;
  id v10 = v5;
  id v47 = v10;
  v45[4] = self;
  [v3 registerHandlerForEvent:@"Tab Items Received From Javascript" onState:@"WaitingForInitialTabItems" withBlock:v45];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_294;
  v43[3] = &unk_1E6DFCCA0;
  id v17 = v6;
  id v44 = v17;
  [v3 registerHandlerForEvent:@"Tab Items Received From Javascript" onState:@"RunningWithJavascript" withBlock:v43];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_295;
  v41[3] = &unk_1E6DFCCA0;
  id v15 = v9;
  id v42 = v15;
  [v3 registerHandlerForEvent:@"Tab Items Received From Javascript" onState:@"RunningWithoutJavascriptWaitingForTVApplicationControllerToStartAndInitialTabItems" withBlock:v41];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_296;
  v39[3] = &unk_1E6DFCCA0;
  id v16 = v10;
  id v40 = v16;
  [v3 registerHandlerForEvent:@"Tab Items Received From Javascript" onState:@"RunningWithoutJavascriptWaitingForInitialTabItems" withBlock:v39];
  [v3 registerHandlerForEvent:@"TVApplicationController Did Finish Launching" onState:@"WaitingForTVApplicationControllerToStartAndInitialTabItems" withBlock:&__block_literal_global_299];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_300;
  v37[3] = &unk_1E6DFCC78;
  objc_copyWeak(&v38, &location);
  [v3 registerHandlerForEvent:@"TVApplicationController Did Finish Launching" onState:@"WaitingForTVApplicationControllerToStart" withBlock:v37];
  [v3 registerHandlerForEvent:@"TVApplicationController Did Finish Launching" onState:@"RunningWithoutJavascriptWaitingForTVApplicationControllerToStartAndInitialTabItems" withBlock:&__block_literal_global_303];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_304;
  v35[3] = &unk_1E6DFCC78;
  objc_copyWeak(&v36, &location);
  [v3 registerHandlerForEvent:@"TVApplicationController Did Finish Launching" onState:@"RunningWithoutJavascriptWaitingForTVApplicationControllerToStart" withBlock:v35];
  v81[0] = @"RunningWithoutJavascriptWaitingForTVApplicationControllerToStart";
  v81[1] = @"RunningWithoutJavascriptWaitingForTVApplicationControllerToStartAndInitialTabItems";
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_305;
  v33[3] = &unk_1E6DFCC78;
  objc_copyWeak(&v34, &location);
  [v3 registerHandlerForEvent:@"TVApplicationController Did Fail To Launch" onStates:v11 withBlock:v33];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_306;
  v31[3] = &unk_1E6DFCC78;
  objc_copyWeak(&v32, &location);
  [v3 registerDefaultHandlerForEvent:@"TVApplicationController Did Fail To Launch" withBlock:v31];
  [v3 registerDefaultHandlerForEvent:@"TVApplicationController Did Stop" withBlock:&__block_literal_global_309];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_4_310;
  v30[3] = &unk_1E6DFCC28;
  v30[4] = self;
  [v3 registerHandlerForEvent:@"App Will Enter Foreground" onState:@"RunningWithoutJavascript" withBlock:v30];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_5_311;
  v29[3] = &unk_1E6DFCC28;
  v29[4] = self;
  [v3 registerHandlerForEvent:@"App Will Enter Foreground" onState:@"RunningWithJavascript" withBlock:v29];
  v80[0] = @"RunningWithoutJavascriptWaitingForTVApplicationControllerToStartAndInitialTabItems";
  v80[1] = @"RunningWithoutJavascriptWaitingForInitialTabItems";
  v80[2] = @"RunningWithoutJavascriptWaitingForTVApplicationControllerToStart";
  v80[3] = @"WaitingForTVApplicationControllerToStartAndInitialTabItems";
  v80[4] = @"WaitingForInitialTabItems";
  v80[5] = @"WaitingForTVApplicationControllerToStart";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:6];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_312;
  v27[3] = &unk_1E6DFCC78;
  objc_copyWeak(&v28, &location);
  [v3 registerHandlerForEvent:@"Network Reachability Did Change" onStates:v12 withBlock:v27];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_313;
  v24[3] = &unk_1E6DFCD10;
  objc_copyWeak(&v26, &location);
  id v13 = v18;
  id v25 = v13;
  [v3 registerHandlerForEvent:@"Network Reachability Did Change" onState:@"RunningWithoutJavascript" withBlock:v24];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_323;
  v22[3] = &unk_1E6DFCD38;
  objc_copyWeak(&v23, &location);
  v22[4] = self;
  [v3 registerHandlerForEvent:@"Network Reachability Did Change" onState:@"RunningWithJavascript" withBlock:v22];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_326;
  v19[3] = &unk_1E6DFCD10;
  objc_copyWeak(&v21, &location);
  id v14 = v13;
  id v20 = v14;
  [v3 registerHandlerForEvent:@"Without Javascript Active Account Did Change" onState:@"RunningWithoutJavascript" withBlock:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&v57);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&v63);

  objc_destroyWeak(&v66);
  objc_destroyWeak(&v69);

  objc_destroyWeak(&v72);
  objc_destroyWeak(&v75);

  objc_destroyWeak(&v78);
  objc_destroyWeak(&location);
}

void __42__VUITVAppLauncher__fetchFullFeatureFlag___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", *(void *)(a1 + 32), @"BootURL");
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v4, @"fullFeatureFlag");

  id v5 = VUISignpostLogObject();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.URLLoad.FetchFullFeatureFlag", "", v7, 2u);
  }

  char v6 = [WeakRetained stateMachine];
  [v6 postEvent:@"Full Feature Flag Fetch Did Complete" withContext:0 userInfo:v3];
}

- (BOOL)applicationWillFinishLaunchingWithOptions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher - applicationWillFinishLaunchingWithOptions %@", (uint8_t *)&v13, 0xCu);
  }

  char v6 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v4, @"Options");
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__handlePrewarmSubscriptionDataNotification_ name:*MEMORY[0x1E4FB5298] object:0];

  int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__handleOfferProcessingDidStartNotification_ name:@"VUIJSOfferdidStartProcessing" object:0];

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__handleOfferProcessingDidFinishNotification_ name:@"VUIJSOfferdidFinishProcessing" object:0];

  id v10 = [(VUITVAppLauncher *)self stateMachine];
  int v11 = (void *)[v6 copy];
  [v10 postEvent:@"UIApplication Will Finish Launching" withContext:0 userInfo:v11];

  return 1;
}

- (BOOL)applicationDidFinishLaunchingWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v18 = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher - applicationDidFinishLaunchingWithOptions", v18, 2u);
  }

  char v6 = VUISignpostLogObject();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)id v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.configureAppWindow", "", v18, 2u);
  }

  [(VUITVAppLauncher *)self configureAppWindow];
  id v7 = VUISignpostLogObject();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)id v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.configureAppWindow", "", v18, 2u);
  }

  int v8 = VUISignpostLogObject();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)id v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.showLoadingView", "", v18, 2u);
  }

  [(VUITVAppLauncher *)self showLoadingView];
  id v9 = VUISignpostLogObject();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)id v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.showLoadingView", "", v18, 2u);
  }

  id v10 = VUISignpostLogObject();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.stateMachine", "", v18, 2u);
  }

  int v11 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v11, "vui_setObjectIfNotNil:forKey:", v4, @"Options");

  uint64_t v12 = [(VUITVAppLauncher *)self stateMachine];
  int v13 = (void *)[v11 copy];
  [v12 postEvent:@"UIApplication Did Finish Launching" withContext:0 userInfo:v13];

  id v14 = VUISignpostLogObject();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)id v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.stateMachine", "", v18, 2u);
  }

  uint64_t v15 = VUISignpostLogObject();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)id v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.registerButtonListener", "", v18, 2u);
  }

  id v16 = VUISignpostLogObject();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)id v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.registerButtonListener", "", v18, 2u);
  }

  [(VUITVAppLauncher *)self prewarmPostAppDidFinishLaunching];
  return 1;
}

void __46__VUITVAppLauncher__javascriptSetTabBarItems___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained isTerminating] & 1) == 0)
  {
    id v2 = [WeakRetained stateMachine];
    [v2 postEvent:@"Tab Items Received From Javascript" withContext:0 userInfo:*(void *)(a1 + 32)];
  }
}

void __54__VUITVAppLauncher__fetchApplicationControllerBootURL__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [WeakRetained jetPackController];

    if (v4 == v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v7 = [*(id *)(a1 + 40) url];
      objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v7, @"BootURL");

      objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", *(void *)(a1 + 48), @"Error");
      int v8 = [v3 stateMachine];
      [v8 postEvent:@"Boot URL Fetch Did Complete" withContext:0 userInfo:v6];

      [v3 setJetPackController:0];
      id v9 = VUISignpostLogObject();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)int v11 = 0;
        _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.URLLoad", "", v11, 2u);
      }

      id v10 = +[VUIPerfMetricsAppLaunchController sharedInstance];
      [v10 recordAppLaunchEventWithEventType:@"javascriptRuntimeEnd"];
    }
  }
}

- (VUIStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)showLoadingView
{
  id v2 = +[VUIAppLoadingView loadingScreen];
  [v2 setTimeout:60.0];
  [v2 showOverKeyWindowWithSpinnerOnly:0];
}

- (_TtC8VideosUI20VUIJetPackController)jetPackController
{
  return self->_jetPackController;
}

- (BOOL)isTerminating
{
  return self->_isTerminating;
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_297()
{
  return @"WaitingForInitialTabItems";
}

uint64_t __37__VUITVAppLauncher__initializePlayer__block_invoke()
{
  return [MEMORY[0x1E4FA9D98] removeTemporaryDownloadDirectory];
}

uint64_t __24__VUITVAppLauncher_init__block_invoke()
{
  return +[VUISportsFavoriteService initializeSportsManager];
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_257(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = VUISignpostLogObject();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UIApplicationLaunch", "", (uint8_t *)&v16, 2u);
  }

  int v8 = +[VUIPerfMetricsAppLaunchController sharedInstance];
  [v8 recordAppLaunchEventWithEventType:@"uikitApplicationLaunchStart"];

  id v9 = objc_msgSend(v6, "vui_dictionaryForKey:", @"Options");

  id v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v9;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Launching with options: %@", (uint8_t *)&v16, 0xCu);
  }

  int v11 = VUISignpostLogObject();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MediaLibrary", "", (uint8_t *)&v16, 2u);
  }

  [*(id *)(a1 + 32) _initializeMediaLibrary];
  uint64_t v12 = VUISignpostLogObject();
  if (os_signpost_enabled(v12))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MediaLibrary", "", (uint8_t *)&v16, 2u);
  }

  id v13 = +[VUIMetricsController sharedInstance];
  id v14 = VUIDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "UNIFIED_MESSAGING: Unified Messaging is enabled", (uint8_t *)&v16, 2u);
  }

  +[VideosUI initializeUnifiedMessagingManager];
  return @"StartingUIApplication";
}

- (void)_initializeMediaLibrary
{
  id v3 = VUISignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MediaLibrary Initialization", "", (uint8_t *)buf, 2u);
  }

  id v4 = +[VUIPerfMetricsAppLaunchController sharedInstance];
  [v4 recordAppLaunchEventWithEventType:@"mediaLibraryInitializeStart"];

  objc_initWeak(buf, self);
  id v5 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VUITVAppLauncher__initializeMediaLibrary__block_invoke;
  block[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v7, buf);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  [(VUITVAppLauncher *)self _syncBookmarkServiceIfRequired];
  id v4 = +[VUISettingsManager sharedInstance];
  [v4 checkAndUpdateSettings];

  id v5 = +[VUIMetricsController sharedInstance];
  [v5 recordAppBecameActive];

  BOOL appWasForegrounded = self->_appWasForegrounded;
  self->_BOOL appWasForegrounded = 1;
  id v7 = +[VUIAppReviewManager sharedInstance];
  [v7 isFeatureEnabled:&__block_literal_global_241];

  if (appWasForegrounded)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__VUITVAppLauncher__applicationDidBecomeActiveNotification___block_invoke_2;
    aBlock[3] = &unk_1E6DF5B20;
    void aBlock[4] = self;
    int v8 = _Block_copy(aBlock);
    id v9 = +[VUIInterfaceFactory sharedInstance];
    id v10 = [v9 openURLHandler];

    if (([v10 openedByDeeplink] & 1) == 0
      && !+[VUIGDPRPresentationManager shouldShowWelcomeScreen])
    {
      int v11 = VUIDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "VUITVAppLauncher - App foreground -- Check if there is any pending offer to present", v15, 2u);
      }

      uint64_t v12 = [(VUITVAppLauncher *)self appController];
      id v13 = [v12 appContext];
      +[VUIOfferUtilities fetchAndPresentOffer:v13 sourceEvent:@"AppForeground" completion:v8];
    }
    id v14 = [MEMORY[0x1E4FB5170] sharedInstance];
    [v14 refreshSubscriptionDataIfNeeded];
  }
}

void __43__VUITVAppLauncher__initializeMediaLibrary__block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  [v1 _updateDeviceMediaLibraryFromCloud];

  id v2 = +[VUIPerfMetricsAppLaunchController sharedInstance];
  [v2 recordAppLaunchEventWithEventType:@"mediaLibraryInitializeEnd"];

  id v3 = VUISignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MediaLibrary Initialization", "", v4, 2u);
  }

  objc_destroyWeak(&to);
}

- (void)_updateDeviceMediaLibraryFromCloud
{
  id v3 = +[VUIMediaLibraryManager defaultManager];
  id v2 = [v3 deviceMediaLibrary];
  [v2 updateFromCloudWithReason:0];
}

- (void)_handlePrewarmSubscriptionDataNotification:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (![(VUITVAppLauncher *)v4 startupPrewarmSubscriptionDataCompleted]) {
    [(VUITVAppLauncher *)v4 setStartupPrewarmSubscriptionDataCompleted:1];
  }
  objc_sync_exit(v4);
}

- (BOOL)startupPrewarmSubscriptionDataCompleted
{
  return self->_startupPrewarmSubscriptionDataCompleted;
}

- (void)setStartupPrewarmSubscriptionDataCompleted:(BOOL)a3
{
  self->_startupPrewarmSubscriptionDataCompleted = a3;
}

void __90__VUITVAppLauncher__updateTabControllerWithTabBarItems_setSelectedIdentifierFromDefaults___block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4E6FAE0]();
  +[VideosUI initializeGroupActivities];
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_254(uint64_t a1)
{
  id v2 = VUISignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.WaitingForStateTransition", "", buf, 2u);
  }

  id v3 = VUISignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.URLLoad", "", v6, 2u);
  }

  id v4 = +[VUIPerfMetricsAppLaunchController sharedInstance];
  [v4 recordAppLaunchEventWithEventType:@"javascriptRuntimeStart"];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startJavascriptSetup];
}

- (void)_startJavascriptSetup
{
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUITVAppLauncher -  start JS setup", v4, 2u);
  }

  [(VUITVAppLauncher *)self _resetJavascriptState];
  [(VUITVAppLauncher *)self _resetDeferredParsedOpenURL];
  [(VUITVAppLauncher *)self _fetchApplicationControllerBootURL];
}

- (void)setDeferredParsedOpenURL:(id)a3
{
}

- (void)_resetDeferredParsedOpenURL
{
}

- (void)_fetchApplicationControllerBootURL
{
  id v3 = kVUIBagTVAppJetpackURL;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = +[VUIJetPackController controllerWithBagKey:v3 defaults:v4 urlOverrideDefaultKey:@"boot-url"];

  [(VUITVAppLauncher *)self setJetPackController:v5];
  objc_initWeak(&location, self);
  id v6 = [v5 getJetPackURL];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__VUITVAppLauncher__fetchApplicationControllerBootURL__block_invoke;
  v8[3] = &unk_1E6DFCD60;
  objc_copyWeak(&v10, &location);
  id v7 = v5;
  id v9 = v7;
  [v6 resultWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_292(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = VUISignpostLogObject();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TabBarItemsFetch", "", buf, 2u);
  }

  int v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if ([v8 count])
  {
    id v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Recieved tab items from javascript after waiting for initial tab items", v13, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v10 = [MEMORY[0x1E4FB5138] sharedInstance];
    [v10 prewarmSubscriptionData];

    int v11 = @"RunningWithJavascript";
  }
  else
  {
    [*(id *)(a1 + 32) _showJavascriptUnavailableUIWithNetworkAvailable:1];
    int v11 = @"RunningWithoutJavascript";
  }

  return v11;
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setTabBarItems:v6];
  [WeakRetained _finishJavascriptSetupWithTabBarItems:v6 setSelectedIdentifierFromDefaults:a3];
}

uint64_t __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vui_arrayForKey:", @"TabItems");
}

- (void)_resetJavascriptState
{
  id v3 = VUISignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.URLLoad.ResetState", "", buf, 2u);
  }

  [(VUITVAppLauncher *)self setTabBarItems:0];
  [(VUITVAppLauncher *)self setJetPackController:0];
  [(VUITVAppLauncher *)self setAppController:0];
  id v4 = VUISignpostLogObject();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.URLLoad.ResetState", "", v5, 2u);
  }
}

- (void)setJetPackController:(id)a3
{
}

- (void)setTabBarItems:(id)a3
{
}

- (void)setAppController:(id)a3
{
}

- (void)_handleOfferProcessingDidFinishNotification:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(VUITVAppLauncher *)v4 setStartupOfferProcessingCompleted:1];
  objc_sync_exit(v4);
}

- (void)_handleOfferProcessingDidStartNotification:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(VUITVAppLauncher *)v4 setStartupOfferProcessingCompleted:0];
  objc_sync_exit(v4);
}

- (void)setStartupOfferProcessingCompleted:(BOOL)a3
{
  self->_startupOfferProcessingCompleted = a3;
}

- (void)_startApplicationControllerWithBootURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v23 = a4;
  id v7 = VUISignpostLogObject();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.StartingApplicationControllerWithBootURL", "", buf, 2u);
  }

  int v8 = +[VUIPerfMetricsAppLaunchController sharedInstance];
  [v8 recordAppLaunchEventWithEventType:@"applicationControllerWithBootUrlStart"];

  id v9 = objc_alloc_init(VUITVApplicationControllerContext);
  [(VUITVApplicationControllerContext *)v9 setJavaScriptApplicationURL:v6];
  id v10 = +[VUIAppScriptDownloadManager sharedInstance];
  [v10 fetchAppJavascript:v6 cachePolicy:0 completionHandler:0];

  int v11 = [(VUITVAppLauncher *)self launchOptions];
  uint64_t v12 = v11;
  if (v11) {
    uint64_t v13 = [v11 mutableCopy];
  }
  else {
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
  }
  id v14 = (void *)v13;
  uint64_t v15 = [MEMORY[0x1E4F28B50] mainBundle];
  int v16 = [v15 bundleIdentifier];

  [v14 setObject:v16 forKey:@"reqApp"];
  id v17 = [v12 objectForKey:*MEMORY[0x1E4FB26A0]];
  if (v17) {
    [v14 setObject:v17 forKey:@"refApp"];
  }
  uint64_t v18 = self;
  uint64_t v19 = objc_msgSend(v6, "vui_parsedQueryParametersDictionary");
  if ([v19 count]) {
    [v14 setObject:v19 forKey:@"query"];
  }
  id v20 = [MEMORY[0x1E4FB3CA0] sharedInstance];
  id v21 = [v20 osFeatureFlagsJSON];

  if ([v21 count]) {
    [v14 setObject:v21 forKey:@"featureFlags"];
  }
  BOOL v22 = (void *)[v14 copy];
  [(VUITVApplicationControllerContext *)v9 setLaunchOptions:v22];

  [(VUITVAppLauncher *)v18 _finishApplicationControllerWithLaunchContext:v9 completion:v23];
}

- (NSDictionary)launchOptions
{
  return self->_launchOptions;
}

- (void)_finishApplicationControllerWithLaunchContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = a3;
  int v8 = [[VUITVApplicationController alloc] initWithContext:v7 window:self->_appWindow delegate:self];

  [(VUITVAppLauncher *)self setAppController:v8];
  id v9 = VUISignpostLogObject();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.StartingApplicationControllerWithBootURL", "", v13, 2u);
  }

  id v10 = +[VUIPerfMetricsAppLaunchController sharedInstance];
  [v10 recordAppLaunchEventWithEventType:@"applicationControllerWithBootUrlEnd"];

  appWindow = self->_appWindow;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_windowBackgroundColor");
  [(UIWindow *)appWindow setBackgroundColor:v12];

  if (v6) {
    v6[2](v6);
  }
}

uint64_t __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_287()
{
  uint64_t result = +[VUIGDPRPresentationManager shouldShowWelcomeScreen];
  if ((result & 1) == 0)
  {
    id v1 = VUIDefaultLogObject();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v2 = 0;
      _os_log_impl(&dword_1E2BD7000, v1, OS_LOG_TYPE_INFO, "VUITVAppLauncher - GDPR shown already, register device for offers now.", v2, 2u);
    }

    return +[VUIOfferUtilities registerDeviceForCommerceOffers];
  }
  return result;
}

- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[VideosUI initializeJSContext:v7];
  int v8 = [v7 objectForKeyedSubscript:@"App"];
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __65__VUITVAppLauncher_appController_evaluateAppJavaScriptInContext___block_invoke;
  uint64_t v13 = &unk_1E6DF9690;
  objc_copyWeak(&v14, &location);
  id v9 = _Block_copy(&v10);
  objc_msgSend(v8, "setValue:forProperty:", v9, @"ata_setTabBarItems", v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_286(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v8 = objc_msgSend(v6, "vui_numberForKey:", @"fullFeatureFlag");
  int v9 = [v8 BOOLValue];
  uint64_t v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v9) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    uint64_t v12 = objc_msgSend(v6, "vui_URLForKey:", @"Error");
    int v16 = 138413058;
    id v17 = @"Full Feature Flag Fetch Did Complete";
    __int16 v18 = 2112;
    uint64_t v19 = @"WaitingForFullFeatureFlag";
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: %@ - JS State: %@ - fullFeatureFlag: %@ - error: %@", (uint8_t *)&v16, 0x2Au);
  }
  if (v9)
  {
    uint64_t v13 = objc_msgSend(v6, "vui_URLForKey:", @"BootURL");
    [WeakRetained _startApplicationControllerWithBootURL:v13 completion:&__block_literal_global_289];

    id v14 = @"WaitingForTVApplicationControllerToStartAndInitialTabItems";
  }
  else
  {
    [WeakRetained _showJavascriptUnavailableUIWithNetworkAvailable:1];
    id v14 = @"RunningWithoutJavascript";
  }

  return v14;
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_4_284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v8 = objc_msgSend(v6, "vui_URLForKey:", @"BootURL");
  int v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (v8) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    uint64_t v11 = objc_msgSend(v6, "vui_URLForKey:", @"Error");
    int v14 = 138413058;
    uint64_t v15 = @"Boot URL Fetch Did Complete";
    __int16 v16 = 2112;
    id v17 = @"WaitingForBootURL";
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: %@ - JS State: %@ - bootURL: %@ - error: %@", (uint8_t *)&v14, 0x2Au);
  }
  if (v8)
  {
    [WeakRetained _fetchFullFeatureFlag:v8];
    uint64_t v12 = @"WaitingForFullFeatureFlag";
  }
  else
  {
    [WeakRetained _showJavascriptUnavailableUIWithNetworkAvailable:1];
    uint64_t v12 = @"RunningWithoutJavascript";
  }

  return v12;
}

- (void)_fetchFullFeatureFlag:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Fetching full feature flag - bootURL: %@", buf, 0xCu);
  }

  id v6 = VUISignpostLogObject();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.URLLoad.FetchFullFeatureFlag", "", buf, 2u);
  }

  id v7 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__VUITVAppLauncher__fetchFullFeatureFlag___block_invoke;
  v9[3] = &unk_1E6DF4F18;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 isFullTVAppEnabledwithCompletion:v9];
}

uint64_t __39__VUITVAppLauncher_processStartupItems__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  if (a2) {
    [v4 _finishAppLoading];
  }
  else {
    [v4 _presentSyndicationOnboardingIfNeeded];
  }
  id v5 = *(void **)(a1 + 32);
  return [v5 _handleAMSEngagementSheetPresentation:a2];
}

- (void)_handleAMSEngagementSheetPresentation:(BOOL)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", a3);
  int v4 = [v3 isRunningTest];

  if (v4)
  {
    id v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Running PPT test. Skip handling of engagement presentation sheet.", v6, 2u);
    }
  }
}

void __65__VUITVAppLauncher_appController_evaluateAppJavaScriptInContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _javascriptSetTabBarItems:v3];
}

- (void)_javascriptSetTabBarItems:(id)a3
{
  int v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v5, @"TabItems");

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VUITVAppLauncher__javascriptSetTabBarItems___block_invoke;
  block[3] = &unk_1E6DF5490;
  objc_copyWeak(&v10, &location);
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __34__VUITVAppLauncher_sharedInstance__block_invoke()
{
  id v0 = VUISignpostLogObject();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launcher.Init", "", buf, 2u);
  }

  id v1 = objc_alloc_init((Class)objc_opt_class());
  id v2 = (void *)sharedInstance_sSharedInstance_2;
  sharedInstance_sSharedInstance_2 = (uint64_t)v1;

  id v3 = VUISignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)int v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launcher.Init", "", v4, 2u);
  }
}

- (VUITVAppLauncher)init
{
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUITVAppLauncher - initialized.", (uint8_t *)buf, 2u);
  }

  VUIRequireMainThread();
  v18.receiver = self;
  v18.super_class = (Class)VUITVAppLauncher;
  int v4 = [(VUITVAppLauncher *)&v18 init];
  if (v4)
  {
    id v5 = VUISignpostLogObject();
    if (os_signpost_enabled(v5))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PerceivedLaunch", "", (uint8_t *)buf, 2u);
    }

    v4->_startupPrewarmSubscriptionDataCompleted = 0;
    id v6 = dispatch_get_global_queue(0, 0);
    dispatch_async(v6, &__block_literal_global_149);

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB3D30]) initWithName:@"VUITVAppLauncher_StateMachine" initialState:@"Idle" mode:0 stateChangeHandler:&__block_literal_global_183];
    stateMachine = v4->_stateMachine;
    v4->_stateMachine = (VUIStateMachine *)v7;

    [(VUITVAppLauncher *)v4 _configureStateMachine];
    v4->_isTerminating = 0;
    v4->_isStillProcessingStartupItems = 0;
    v4->_isStillProcessingStartupItemsLock._os_unfair_lock_opaque = 0;
    objc_initWeak(buf, v4);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __24__VUITVAppLauncher_init__block_invoke_3;
    v15[3] = &unk_1E6DFCB48;
    objc_copyWeak(&v16, buf);
    [(VUITVAppLauncher *)v4 setSwitchTabHandler:v15];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __24__VUITVAppLauncher_init__block_invoke_4;
    uint64_t v13 = &unk_1E6DFCB70;
    objc_copyWeak(&v14, buf);
    [(VUITVAppLauncher *)v4 setDeeplinkCompletionHandler:&v10];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
  }
  [(VUITVAppLauncher *)v4 registerForApplicationNotifications];
  return v4;
}

- (void)setSwitchTabHandler:(id)a3
{
}

- (void)setDeeplinkCompletionHandler:(id)a3
{
}

- (void)registerForApplicationNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__applicationDidBecomeActiveNotification_ name:*MEMORY[0x1E4FB3D70] object:0];

  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__applicationDidEnterBackgroundNotification_ name:*MEMORY[0x1E4FB3D78] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__applicationWillResignActiveNotification_ name:*MEMORY[0x1E4FB3D88] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__applicationWillTerminateNotification_ name:*MEMORY[0x1E4FB3D90] object:0];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4FB3D80] object:0];
}

- (void)_configureStateMachine
{
  [(VUITVAppLauncher *)self _registerStateMachineHandlers];
  id v4 = [(VUITVAppLauncher *)self stateMachine];
  id v3 = VUIDefaultLogObject();
  [v4 setLogObject:v3];

  [v4 logUnhandledEvents];
  [v4 setShouldAcceptEvents:1];
}

- (void)setMainWindow:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_appWindow, a3);
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - setMainWindow %@", (uint8_t *)&v7, 0xCu);
  }
}

void __42__VUITVAppLauncher__fetchFullFeatureFlag___block_invoke(uint64_t a1, char a2)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__VUITVAppLauncher__fetchFullFeatureFlag___block_invoke_2;
  v4[3] = &unk_1E6DF7118;
  objc_copyWeak(&v6, &location);
  id v5 = *(id *)(a1 + 40);
  char v7 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __54__VUITVAppLauncher__fetchApplicationControllerBootURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__VUITVAppLauncher__fetchApplicationControllerBootURL__block_invoke_2;
  v9[3] = &unk_1E6DFBD90;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

- (void)prewarmPostAppDidFinishLaunching
{
  id v2 = self;
  VUITVAppLauncher.prewarmPostAppDidFinishLaunching()();
}

- (void)prewarmOnMain
{
  id v2 = self;
  VUITVAppLauncher.prewarmOnMain()();
}

+ (BOOL)_isRunningWithoutJSState:(id)a3
{
  return [a3 isEqualToString:@"RunningWithoutJavascript"];
}

void __24__VUITVAppLauncher_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v8)
  {
    id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v4 userInterfaceIdiom] == 1)
    {
      id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
      if (![v5 isRunningTest])
      {
        char v7 = _os_feature_enabled_impl();

        if ((v7 & 1) == 0)
        {
          id v6 = [WeakRetained splitViewController];
          [v6 setSelectedIndexForIdentifier:v8 withDeeplinkURL:0];
          goto LABEL_7;
        }
LABEL_6:
        id v6 = [WeakRetained tabBarController];
        [v6 setSelectedIndexForTabBarItemIdentifier:v8];
LABEL_7:

        goto LABEL_8;
      }
    }
    goto LABEL_6;
  }
LABEL_8:
}

void __24__VUITVAppLauncher_init__block_invoke_4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v8 = a2;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!v9) {
    goto LABEL_24;
  }
  id v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v11 userInterfaceIdiom] != 1) {
    goto LABEL_5;
  }
  id v12 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v12 isRunningTest])
  {

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v4 = _os_feature_enabled_impl();

  if ((v4 & 1) == 0)
  {
    id v16 = [WeakRetained splitViewController];
    [v16 setSelectedIndexForIdentifier:v9 withDeeplinkURL:v8];
    goto LABEL_10;
  }
LABEL_6:
  id v13 = [MEMORY[0x1E4F1CA98] null];
  int v14 = [v9 isEqual:v13];

  uint64_t v15 = [WeakRetained tabBarController];
  id v16 = v15;
  if (v14) {
    id v17 = 0;
  }
  else {
    id v17 = v9;
  }
  [v15 setSelectedIndexForTabBarItemIdentifier:v17 clearStack:a4];
LABEL_10:

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __24__VUITVAppLauncher_init__block_invoke_5;
  aBlock[3] = &unk_1E6DF6B68;
  char v29 = a4;
  id v18 = WeakRetained;
  id v27 = v18;
  id v28 = v8;
  uint64_t v19 = (void (**)(void))_Block_copy(aBlock);
  __int16 v20 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v21 = [v20 userInterfaceIdiom];
  if (v21 == 1)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    if (([(id)v4 isRunningTest] & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
    {
      uint64_t v22 = [v18 splitViewController];
      goto LABEL_18;
    }
  }
  uint64_t v22 = [v18 tabBarController];
  if (v21 == 1) {
LABEL_18:
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v22 vuiPresentedViewController],
        id v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        v23))
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __24__VUITVAppLauncher_init__block_invoke_8;
    v24[3] = &unk_1E6DF3DD0;
    id v25 = v19;
    objc_msgSend(v22, "vui_dismissViewControllerAnimated:completion:", 1, v24);
  }
  else
  {
    v19[2](v19);
  }

LABEL_24:
}

void __24__VUITVAppLauncher_init__block_invoke_5(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __24__VUITVAppLauncher_init__block_invoke_6;
  aBlock[3] = &unk_1E6DF6B68;
  char v6 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v2 = (void (**)(void))_Block_copy(aBlock);
  v2[2]();
}

void __24__VUITVAppLauncher_init__block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) appController];
    id v3 = [v2 navigationController];
    id v4 = (id)[v3 popToRootViewControllerAnimated:0];
  }
  id v7 = +[VUIApplicationRouter topMostVisibleViewController];
  if (![v7 conformsToProtocol:&unk_1F4019DC0]
    || [v7 deeplinkURLWasHandled:*(void *)(a1 + 40)])
  {
    id v5 = +[VUIInterfaceFactory sharedInstance];
    char v6 = [v5 documentCreator];
    [v6 scrollViewControllerToTop:v7 animated:0 needsFocusUpdate:1];
  }
}

uint64_t __24__VUITVAppLauncher_init__block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)openURL:(id)a3 options:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - openURL %@, options %@", (uint8_t *)&v19, 0x16u);
  }

  [(VUITVAppLauncher *)self setIsDeeplinkLaunched:[(VUITVAppLauncher *)self isAppRunning] ^ 1];
  id v9 = +[ATAParsedOpenURL parsedOpenURLWithURL:v6 andOptions:v7];
  if (v9)
  {
    id v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - openURL creating openUrlEvent userInfo", (uint8_t *)&v19, 2u);
    }

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(v11, "vui_setObjectIfNotNil:forKey:", v9, @"ParsedOpenURL");
    objc_msgSend(v11, "vui_setObjectIfNotNil:forKey:", v7, @"Options");
    id v12 = [(VUITVAppLauncher *)self stateMachine];
    [v12 postEvent:@"UIApplication Open URL" withContext:0 userInfo:v11];

    id v13 = [v9 URL];
    int v14 = [v13 absoluteString];

    uint64_t v15 = +[VUIMetricsController sharedInstance];
    id v16 = v15;
    if (v7) {
      id v17 = v7;
    }
    else {
      id v17 = (id)MEMORY[0x1E4F1CC08];
    }
    [v15 recordOpenUrlLaunchWithExtURL:v14 andOptions:v17];
  }
  return v9 != 0;
}

- (void)didFailToLaunch:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "VUITVAppLauncher - didFailToLaunch %@", (uint8_t *)&v5, 0xCu);
  }
}

- (UIWindow)appWindow
{
  return self->_appWindow;
}

+ (BOOL)isSidebarEnabled
{
  id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v2 userInterfaceIdiom] == 1)
  {
    id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    if ([v3 isRunningTest]) {
      LOBYTE(v4) = 0;
    }
    else {
      int v4 = _os_feature_enabled_impl() ^ 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)cleanUp
{
  self->_isTerminating = 1;
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUITVAppLauncher - cleanUp", v6, 2u);
  }

  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x1E4FB3D90] object:0];

  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];
}

- (void)refreshTabBarItems
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VUITVAppLauncher_refreshTabBarItems__block_invoke;
  block[3] = &unk_1E6DF3D58;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __38__VUITVAppLauncher_refreshTabBarItems__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appController];
  id v1 = [v2 appContext];
  [v1 evaluate:&__block_literal_global_212];
}

void __38__VUITVAppLauncher_refreshTabBarItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:@"App"];
  id v3 = v2;
  if (v2 && [v2 hasProperty:@"fetchConfigAndSetTabBarItems"])
  {
    int v4 = VUISignpostLogObject();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)id v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TabBarItemsFetch", "", v6, 2u);
    }

    id v5 = (id)[v3 invokeMethod:@"fetchConfigAndSetTabBarItems" withArguments:0];
  }
}

- (void)selectTabBarItem:(id)a3
{
  id v8 = a3;
  int v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v4 userInterfaceIdiom] != 1) {
    goto LABEL_4;
  }
  id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v5 isRunningTest])
  {

LABEL_4:
LABEL_5:
    id v6 = [(VUITVAppLauncher *)self tabBarController];
    [v6 setSelectedIndexForTabBarItemIdentifier:v8];
    goto LABEL_6;
  }
  char v7 = _os_feature_enabled_impl();

  if (v7) {
    goto LABEL_5;
  }
  id v6 = [(VUITVAppLauncher *)self splitViewController];
  [v6 setSelectedIndexForIdentifier:v8 withDeeplinkURL:0];
LABEL_6:
}

- (BOOL)isAppRunningWithoutJS
{
  id v3 = objc_opt_class();
  int v4 = [(VUITVAppLauncher *)self stateMachine];
  id v5 = [v4 currentState];
  LOBYTE(v3) = [v3 _isRunningWithoutJSState:v5];

  return (char)v3;
}

- (void)didShowGDPRWelcome
{
  id v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUITVAppLauncher - didShowGDPRWelcome", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v5 = __38__VUITVAppLauncher_didShowGDPRWelcome__block_invoke;
  id v6 = &unk_1E6DF3D58;
  char v7 = self;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v5((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __38__VUITVAppLauncher_didShowGDPRWelcome__block_invoke(uint64_t a1)
{
  id v3 = +[VUIMetricsController sharedInstance];
  id v2 = [*(id *)(a1 + 32) _dialogMetricsForGDPR];
  [v3 recordDialog:v2];
}

- (void)didAcceptGDPRWelcome
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  int v4 = [(VUITVAppLauncher *)self _dialogMetricsForGDPR];
  [v3 addEntriesFromDictionary:v4];

  v10[0] = @"targetId";
  v10[1] = @"targetType";
  v11[0] = @"continue";
  v11[1] = @"button";
  void v10[2] = @"actionType";
  v11[2] = @"gdprConsent";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v3 addEntriesFromDictionary:v5];

  id v6 = +[VUIMetricsController sharedInstance];
  [v6 recordClick:v3];

  char v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_INFO, "VUITVAppLauncher - didAcceptGDPRWelcome", v9, 2u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread]) {
    __40__VUITVAppLauncher_didAcceptGDPRWelcome__block_invoke();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_220);
  }
  id v8 = dispatch_get_global_queue(0, 0);
  dispatch_async(v8, &__block_literal_global_222);
}

void __40__VUITVAppLauncher_didAcceptGDPRWelcome__block_invoke()
{
  id v0 = +[VUIMetricsController sharedInstance];
  [v0 forceGDPRConsentStatus:1];
}

void __40__VUITVAppLauncher_didAcceptGDPRWelcome__block_invoke_2()
{
  id v0 = (void *)MEMORY[0x1E4E6FAE0]();
  +[VideosUI initializeGroupActivities];
}

- (id)_dialogMetricsForGDPR
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"dialogId";
  v4[1] = @"dialogType";
  v5[0] = @"GDPR";
  v5[1] = @"GDPR";
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0
    && [(VUITVAppLauncher *)self _isActiveMediaLibraryTheDeviceMediaLibrary])
  {
    id v5 = +[VUIMediaLibraryManager defaultManager];
    [v5 beginDiscoveringHomeShareMediaLibraries];
  }
  self->_BOOL appWasForegrounded = 1;
  self->_startupOfferProcessingCompleted = 0;
  objc_initWeak(&location, self);
  id v6 = dispatch_get_global_queue(2, 0);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __52__VUITVAppLauncher__applicationWillEnterForeground___block_invoke;
  id v12 = &unk_1E6DF4A30;
  objc_copyWeak(&v13, &location);
  dispatch_async(v6, &v9);

  if (_os_feature_enabled_impl())
  {
    char v7 = objc_msgSend(MEMORY[0x1E4FB5128], "defaultManager", v9, v10, v11, v12);
    [v7 fetchStatusForAllTypesWithCompletion:0];
  }
  id v8 = [(VUITVAppLauncher *)self stateMachine];
  [v8 postEvent:@"App Will Enter Foreground" withContext:0 userInfo:0];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __52__VUITVAppLauncher__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  [v1 _updateDeviceMediaLibraryFromCloud];

  objc_destroyWeak(&to);
}

uint64_t __60__VUITVAppLauncher__applicationDidBecomeActiveNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAMSEngagementSheetPresentation:a2];
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((_os_feature_enabled_impl() & 1) == 0
    && [(VUITVAppLauncher *)self _isActiveMediaLibraryTheDeviceMediaLibrary])
  {
    id v4 = +[VUIMediaLibraryManager defaultManager];
    [v4 endDiscoveringHomeShareMediaLibraries];
  }
  id v5 = +[VUIInterfaceFactory sharedInstance];
  id v6 = [v5 openURLHandler];
  [v6 setOpenedByDeeplink:0];

  char v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v8 setObject:v7 forKey:@"lastActiveDate"];

  uint64_t v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "DropOnTab: Updating lastActiveDate to %@", (uint8_t *)&v11, 0xCu);
  }

  if ([(VUITVAppLauncher *)self _shouldRecordExitEvent])
  {
    uint64_t v10 = +[VUIMetricsController sharedInstance];
    [v10 recordAppWillBackground];
  }
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  self->_BOOL appWasForegrounded = 0;
}

- (void)_applicationWillTerminateNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "VUITVAppLauncher - will terminate.", (uint8_t *)&v9, 2u);
  }

  if ([(VUITVAppLauncher *)self _shouldRecordExitEvent])
  {
    id v5 = +[VUIMetricsController sharedInstance];
    [v5 recordAppWillTerminate];
  }
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  char v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v7 setObject:v6 forKey:@"lastActiveDate"];

  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "DropOnTab: Updating lastActiveDate to %@", (uint8_t *)&v9, 0xCu);
  }
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setTabBarItems:v3];
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setTabBarItems:v3];
  [WeakRetained _updateTabControllerWithTabBarItems:v3 setSelectedIdentifierFromDefaults:1];
}

id __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_282(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = [v8 objectForKey:@"ParsedOpenURL"];

  [WeakRetained _handleParsedOpenURL:v10];
  if (([(id)objc_opt_class() _isDeeplinkTVButton:v10] & 1) == 0)
  {
    uint64_t v11 = +[VUIInterfaceFactory sharedInstance];
    id v12 = [v11 openURLHandler];
    [v12 setOpenedByDeeplink:1];
  }
  uint64_t v13 = [v7 currentState];

  return v13;
}

id __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_3_283(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = [v8 objectForKey:@"ParsedOpenURL"];

  [WeakRetained setDeferredParsedOpenURL:v10];
  if (([(id)objc_opt_class() _isDeeplinkTVButton:v10] & 1) == 0)
  {
    uint64_t v11 = +[VUIInterfaceFactory sharedInstance];
    id v12 = [v11 openURLHandler];
    [v12 setOpenedByDeeplink:1];
  }
  uint64_t v13 = [v7 currentState];

  return v13;
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_285(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = objc_msgSend(v6, "vui_URLForKey:", @"BootURL");
  int v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    uint64_t v11 = objc_msgSend(v6, "vui_URLForKey:", @"Error");
    int v14 = 138413058;
    uint64_t v15 = @"Boot URL Fetch Did Complete";
    __int16 v16 = 2112;
    id v17 = @"RunningWithoutJavascriptWaitingForBootURL";
    __int16 v18 = 2112;
    int v19 = v10;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Event: %@ - JS State: %@ - bootURL: %@ - error: %@", (uint8_t *)&v14, 0x2Au);
  }
  if (v8)
  {
    [WeakRetained _fetchFullFeatureFlag:v8];
    id v12 = @"RunningWithoutJavascriptWaitingForFullFeatureFlag";
  }
  else
  {
    [WeakRetained _handleDeferredParsedOpenURLIfNeeded];
    id v12 = @"RunningWithoutJavascript";
  }

  return v12;
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = objc_msgSend(v6, "vui_numberForKey:", @"fullFeatureFlag");
  int v9 = [v8 BOOLValue];
  uint64_t v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v9) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    id v12 = objc_msgSend(v6, "vui_URLForKey:", @"Error");
    int v16 = 138413058;
    id v17 = @"Full Feature Flag Fetch Did Complete";
    __int16 v18 = 2112;
    int v19 = @"RunningWithoutJavascriptWaitingForFullFeatureFlag";
    __int16 v20 = 2112;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: %@ - JS State: %@ - fullFeatureFlag: %@ - error: %@", (uint8_t *)&v16, 0x2Au);
  }
  if (v9)
  {
    uint64_t v13 = objc_msgSend(v6, "vui_URLForKey:", @"BootURL");
    [WeakRetained _startApplicationControllerWithBootURL:v13 completion:0];

    int v14 = @"RunningWithoutJavascriptWaitingForTVApplicationControllerToStartAndInitialTabItems";
  }
  else
  {
    [WeakRetained _showJavascriptUnavailableUIWithNetworkAvailable:1];
    int v14 = @"RunningWithoutJavascript";
  }

  return v14;
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_291(uint64_t a1)
{
  return @"WaitingForTVApplicationControllerToStart";
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Recieved tab items from javascript while running with javascript", v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return @"RunningWithJavascript";
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_295(uint64_t a1)
{
  return @"RunningWithoutJavascriptWaitingForTVApplicationControllerToStart";
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_296(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Recieved tab items from javascript while running without javascript waint for initial tab items", v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return @"RunningWithJavascript";
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_300(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = VUISignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TabBarItemUpdates", "", buf, 2u);
  }

  id v3 = +[VUIPerfMetricsAppLaunchController sharedInstance];
  [v3 recordAppLaunchEventWithEventType:@"tabBarItemUpdatesStart"];

  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - tv app controller did finish launching from waiting for tv app controller to start, updating tab bar items", v10, 2u);
  }

  id v5 = [WeakRetained tabBarItems];
  [WeakRetained _finishJavascriptSetupWithTabBarItems:v5 setSelectedIdentifierFromDefaults:1];

  id v6 = VUISignpostLogObject();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)int v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TabBarItemUpdates", "", v9, 2u);
  }

  id v7 = +[VUIPerfMetricsAppLaunchController sharedInstance];
  [v7 recordAppLaunchEventWithEventType:@"tabBarItemUpdatesEnd"];

  return @"RunningWithJavascript";
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_301()
{
  return @"RunningWithoutJavascriptWaitingForInitialTabItems";
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_304(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - tv app controller did finish launching from running without javascript, updating tab bar items", v5, 2u);
  }

  id v3 = [WeakRetained tabBarItems];
  [WeakRetained _finishJavascriptSetupWithTabBarItems:v3 setSelectedIdentifierFromDefaults:0];

  return @"RunningWithJavascript";
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_305(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showJavascriptUnavailableUIWithNetworkAvailable:1];
  [WeakRetained _handleDeferredParsedOpenURLIfNeeded];

  return @"RunningWithoutJavascript";
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_306(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showJavascriptUnavailableUIWithNetworkAvailable:1];

  return @"RunningWithoutJavascript";
}

uint64_t __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_3_307(uint64_t a1, void *a2)
{
  return [a2 currentState];
}

id __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_4_310(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v5 = [v4 isNetworkReachable];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) stateMachine];
    [v6 postEvent:@"Network Reachability Did Change" withContext:0 userInfo:0];
  }
  id v7 = [v3 currentState];

  return v7;
}

id __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_5_311(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v5 = [v4 isNetworkReachable];

  id v6 = *(void **)(a1 + 32);
  if (!v5)
  {
    int v16 = [v6 stateMachine];
    [v16 postEvent:@"Network Reachability Did Change" withContext:0 userInfo:0];
LABEL_16:

    goto LABEL_17;
  }
  id v7 = [v6 appController];
  id v8 = [v7 appContext];

  int v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = 67109376;
    v22[1] = 1;
    __int16 v23 = 1024;
    BOOL v24 = v8 != 0;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - check tabItesm after app become active network %d, js running %d", (uint8_t *)v22, 0xEu);
  }

  if (!v8)
  {
    int v16 = VUIDefaultLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_5_311_cold_1(v16);
    }
    goto LABEL_16;
  }
  uint64_t v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v10 userInterfaceIdiom] != 1)
  {
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v11 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v11 isRunningTest])
  {

    goto LABEL_8;
  }
  char v19 = _os_feature_enabled_impl();

  if ((v19 & 1) == 0)
  {
    __int16 v20 = [*(id *)(a1 + 32) splitViewController];
    char v21 = [v20 hasRemoteBarItems];

    if (v21) {
      goto LABEL_17;
    }
    goto LABEL_10;
  }
LABEL_9:
  id v12 = [*(id *)(a1 + 32) tabBarController];
  uint64_t v13 = [v12 tabBarItems];
  unint64_t v14 = [v13 count];

  if (v14 > 1) {
    goto LABEL_17;
  }
LABEL_10:
  uint64_t v15 = VUIDefaultLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22[0]) = 0;
    _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - js app runing, network connected but no tabItems??, trying to refresh", (uint8_t *)v22, 2u);
  }

  [*(id *)(a1 + 32) refreshTabBarItems];
LABEL_17:
  id v17 = [v3 currentState];

  return v17;
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_312(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  int v5 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v6 = [v5 isNetworkReachable];

  id v7 = [v3 currentState];

  if (v6)
  {
    id v8 = v7;
  }
  else
  {
    [WeakRetained _showJavascriptUnavailableUIWithNetworkAvailable:0];
    id v8 = @"RunningWithoutJavascript";
  }

  return v8;
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_313(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v28 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v13 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 16) = 1;
  }
  unint64_t v14 = objc_msgSend(MEMORY[0x1E4FB3CF8], "sharedInstance", v28);
  int v15 = [v14 isNetworkReachable];

  if (+[VUIAuthenticationManager isLibraryOnlyCountry]) {
    BOOL v16 = +[VUIAuthenticationManager isLibraryOnlyCountryResolved];
  }
  else {
    BOOL v16 = 0;
  }
  id v17 = VUIDefaultLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v15) {
      __int16 v18 = @"YES - tabbar is visible";
    }
    else {
      __int16 v18 = @"NO - tabbar is hidden";
    }
    char v19 = VUIBoolLogString();
    *(_DWORD *)buf = 138413058;
    long long v33 = @"Network Reachability Did Change";
    __int16 v34 = 2112;
    id v35 = @"RunningWithoutJavascript";
    __int16 v36 = 2112;
    v37 = v18;
    __int16 v38 = 2112;
    v39 = v19;
    _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Event: %@ - JS State: %@ - isNetworkReachable: %@ - isLibraryOnlyCountryMode %@", buf, 0x2Au);
  }
  if (((v15 ^ 1 | v16) & 1) == 0)
  {
    [v13 showLoadingView];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    objc_initWeak((id *)buf, v13);
    uint64_t v25 = (void *)MEMORY[0x1E4FB5180];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_321;
    v30[3] = &unk_1E6DF59E8;
    objc_copyWeak(&v31, (id *)buf);
    [v25 isFullTVAppEnabledwithCompletion:v30];
    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
    BOOL v24 = @"RunningWithoutJavascriptWaitingForBootURL";
    goto LABEL_21;
  }
  __int16 v20 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v20 userInterfaceIdiom] != 1) {
    goto LABEL_15;
  }
  char v21 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v21 isRunningTest])
  {

LABEL_15:
LABEL_16:
    __int16 v22 = VUIDefaultLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: Hiding tab bar", buf, 2u);
    }

    __int16 v23 = [v13 tabBarController];
    [v23 setTabBarHidden:1];

    goto LABEL_19;
  }
  char v27 = _os_feature_enabled_impl();

  if (v27) {
    goto LABEL_16;
  }
LABEL_19:
  BOOL v24 = @"RunningWithoutJavascript";
LABEL_21:

  return v24;
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_321(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = @"NO";
    if (a2) {
      int v5 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Event: Showing tab bar - isFullTVAppEnabled: %@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_322;
  v6[3] = &unk_1E6DF5330;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  char v8 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v6);
  objc_destroyWeak(&v7);
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_322(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(unsigned char *)(a1 + 40))
  {
    id v7 = WeakRetained;
    id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v3 userInterfaceIdiom] != 1)
    {
LABEL_5:

LABEL_6:
      int v5 = [v7 tabBarController];
      [v5 setTabBarHidden:0];

      id WeakRetained = v7;
      goto LABEL_7;
    }
    id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    if ([v4 isRunningTest])
    {

      goto LABEL_5;
    }
    char v6 = _os_feature_enabled_impl();

    id WeakRetained = v7;
    if (v6) {
      goto LABEL_6;
    }
  }
LABEL_7:
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_323(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v14 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v15 = [v14 isNetworkReachable];

  BOOL v16 = VUIDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = @"NO - tabbar is hidden";
    *(_DWORD *)buf = 138412802;
    uint64_t v43 = @"Network Reachability Did Change";
    v45 = @"RunningWithJavascript";
    __int16 v44 = 2112;
    if (v15) {
      id v17 = @"YES - tabbar is visible";
    }
    __int16 v46 = 2112;
    id v47 = v17;
    _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Event: %@ - JS State: %@ - isNetworkReachable: %@", buf, 0x20u);
  }

  if (!v15)
  {
    __int16 v20 = [(id)objc_opt_class() _libraryOnlyTabBarItem];
    char v21 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v21 userInterfaceIdiom] == 1)
    {
      __int16 v22 = [MEMORY[0x1E4FB1438] sharedApplication];
      if (![v22 isRunningTest])
      {
        char v34 = _os_feature_enabled_impl();

        if ((v34 & 1) == 0)
        {
          id v35 = VUIDefaultLogObject();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v35, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - SplitViewController updatedWithBarItems Library Only", buf, 2u);
          }

          BOOL v24 = [*(id *)(a1 + 32) splitViewController];
          v41 = v20;
          uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
          [v24 updateWithBarItems:v25 setSelectedIdentifierFromDefaults:0 appContext:0];
LABEL_14:

          id v26 = [MEMORY[0x1E4FB16C8] currentDevice];
          if ([v26 userInterfaceIdiom] == 1)
          {
            char v27 = [MEMORY[0x1E4FB1438] sharedApplication];
            if (![v27 isRunningTest])
            {
              char v36 = _os_feature_enabled_impl();

              if ((v36 & 1) == 0)
              {
LABEL_19:
                char v29 = [MEMORY[0x1E4FB16C8] currentDevice];
                if ([v29 userInterfaceIdiom] == 1)
                {
                  id v30 = [MEMORY[0x1E4FB1438] sharedApplication];
                  if (![v30 isRunningTest])
                  {
                    char v37 = _os_feature_enabled_impl();

                    if ((v37 & 1) == 0)
                    {
LABEL_26:

                      char v19 = @"RunningWithoutJavascript";
                      goto LABEL_27;
                    }
LABEL_23:
                    id v31 = VUIDefaultLogObject();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1E2BD7000, v31, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Event: Hiding tab bar", buf, 2u);
                    }

                    id v32 = [WeakRetained tabBarController];
                    [v32 setTabBarHidden:1];

                    goto LABEL_26;
                  }
                }
                goto LABEL_23;
              }
LABEL_18:
              id v28 = [WeakRetained tabBarController];
              [v28 setSelectedIndexForTabBarItemIdentifier:@"library"];

              goto LABEL_19;
            }
          }
          goto LABEL_18;
        }
LABEL_11:
        __int16 v23 = VUIDefaultLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - TabBarController updatedWithBarItems Library Only", buf, 2u);
        }

        BOOL v24 = [*(id *)(a1 + 32) tabBarController];
        uint64_t v40 = v20;
        uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
        [v24 updateWithTabBarItems:v25 setSelectedIdentifierFromDefaults:0 appContext:0];
        goto LABEL_14;
      }
    }
    goto LABEL_11;
  }
  objc_initWeak((id *)buf, WeakRetained);
  __int16 v18 = (void *)MEMORY[0x1E4FB5180];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_324;
  v38[3] = &unk_1E6DF59E8;
  objc_copyWeak(&v39, (id *)buf);
  [v18 isFullTVAppEnabledwithCompletion:v38];
  objc_destroyWeak(&v39);
  objc_destroyWeak((id *)buf);
  char v19 = @"RunningWithJavascript";
LABEL_27:

  return v19;
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_324(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_325;
  v3[3] = &unk_1E6DF5330;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_325(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(unsigned char *)(a1 + 40))
  {
    id v7 = WeakRetained;
    id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v3 userInterfaceIdiom] != 1)
    {
LABEL_5:

LABEL_6:
      char v5 = [v7 tabBarController];
      [v5 setTabBarHidden:0];

      id WeakRetained = v7;
      goto LABEL_7;
    }
    id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    if ([v4 isRunningTest])
    {

      goto LABEL_5;
    }
    char v6 = _os_feature_enabled_impl();

    id WeakRetained = v7;
    if (v6) {
      goto LABEL_6;
    }
  }
LABEL_7:
}

__CFString *__49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_326(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v14 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v15 = [v14 isNetworkReachable];

  BOOL v16 = VUIDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = @"Without Javascript Active Account Did Change";
    __int16 v29 = 2112;
    id v30 = @"RunningWithoutJavascript";
    _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: %@ - JS State: %@", buf, 0x16u);
  }

  if (!v15)
  {
    char v19 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v19 userInterfaceIdiom] == 1)
    {
      __int16 v20 = [MEMORY[0x1E4FB1438] sharedApplication];
      if (![v20 isRunningTest])
      {
        char v24 = _os_feature_enabled_impl();

        if ((v24 & 1) == 0)
        {
LABEL_12:
          __int16 v18 = @"RunningWithoutJavascript";
          goto LABEL_13;
        }
LABEL_9:
        char v21 = VUIDefaultLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: Hiding tab bar", buf, 2u);
        }

        __int16 v22 = [WeakRetained tabBarController];
        [v22 setTabBarHidden:1];

        goto LABEL_12;
      }
    }
    goto LABEL_9;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_initWeak((id *)buf, WeakRetained);
  id v17 = (void *)MEMORY[0x1E4FB5180];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_327;
  v25[3] = &unk_1E6DF59E8;
  objc_copyWeak(&v26, (id *)buf);
  [v17 isFullTVAppEnabledwithCompletion:v25];
  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
  __int16 v18 = @"RunningWithoutJavascriptWaitingForBootURL";
LABEL_13:

  return v18;
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_327(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_328;
  v3[3] = &unk_1E6DF5330;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_2_328(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(unsigned char *)(a1 + 40))
  {
    id v7 = WeakRetained;
    id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v3 userInterfaceIdiom] != 1)
    {
LABEL_5:

LABEL_6:
      char v5 = [v7 tabBarController];
      [v5 setTabBarHidden:0];

      id WeakRetained = v7;
      goto LABEL_7;
    }
    id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    if ([v4 isRunningTest])
    {

      goto LABEL_5;
    }
    char v6 = _os_feature_enabled_impl();

    id WeakRetained = v7;
    if (v6) {
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (void)_showJavascriptUnavailableUIWithNetworkAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = @"NO";
    if (v3) {
      char v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    __int16 v23 = v6;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Showing JS unavailable UI - networkAvailable: %@", buf, 0xCu);
  }

  [(VUITVAppLauncher *)self _resetJavascriptState];
  id v7 = [(id)objc_opt_class() _libraryOnlyTabBarItem];
  char v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v8 userInterfaceIdiom] != 1) {
    goto LABEL_8;
  }
  id v9 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v9 isRunningTest])
  {

LABEL_8:
LABEL_9:
    id v10 = [(VUITVAppLauncher *)self tabBarController];
    __int16 v20 = v7;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v10 updateWithTabBarItems:v11 setSelectedIdentifierFromDefaults:0 appContext:0];
    goto LABEL_10;
  }
  char v18 = _os_feature_enabled_impl();

  if (v18) {
    goto LABEL_9;
  }
  id v10 = [(VUITVAppLauncher *)self splitViewController];
  char v21 = v7;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  [v10 updateWithBarItems:v11 setSelectedIdentifierFromDefaults:0 appContext:0];
LABEL_10:

  id v12 = VUIDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Event: Hiding tab bar", buf, 2u);
  }

  uint64_t v13 = [(VUITVAppLauncher *)self tabBarController];
  [v13 setTabBarHidden:1];

  unint64_t v14 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v14 userInterfaceIdiom] != 1) {
    goto LABEL_15;
  }
  int v15 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v15 isRunningTest])
  {

LABEL_15:
LABEL_16:
    uint64_t v16 = [(VUITVAppLauncher *)self tabBarController];
    goto LABEL_17;
  }
  char v19 = _os_feature_enabled_impl();

  if (v19) {
    goto LABEL_16;
  }
  uint64_t v16 = [(VUITVAppLauncher *)self splitViewController];
LABEL_17:
  id v17 = (void *)v16;
  [(UIWindow *)self->_appWindow vui_setRootViewController:v16];
  [(UIWindow *)self->_appWindow vui_makeKeyAndVisible];
  if (v3) {
    +[VUIGDPRPresentationManager showGDPRWelcomeScreen:0];
  }
  else {
    +[VUIGDPRPresentationManager showOfflineGDPRWelcomeScreen];
  }
  [(VUITVAppLauncher *)self _handleDeferredParsedOpenURLIfNeeded];
  [(VUITVAppLauncher *)self _resetDeferredParsedOpenURL];
  [(VUITVAppLauncher *)self hideLoadingView];
}

- (void)_stopApplicationController
{
  id v2 = [(VUITVAppLauncher *)self appController];
  [v2 stop];
}

- (BOOL)_isActiveMediaLibraryTheDeviceMediaLibrary
{
  id v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v2 userInterfaceIdiom] != 1) {
    goto LABEL_4;
  }
  BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v3 isRunningTest])
  {

LABEL_4:
    goto LABEL_5;
  }
  char v9 = _os_feature_enabled_impl();

  if ((v9 & 1) == 0) {
    return 1;
  }
LABEL_5:
  id v4 = +[VUIMediaLibraryManager defaultManager];
  char v5 = [v4 activeMediaLibrary];
  char v6 = [v4 deviceMediaLibrary];
  BOOL v7 = v5 == v6;

  return v7;
}

- (void)_handleNetworkReachabilityDidChangeNotification:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  uint64_t v5 = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", *MEMORY[0x1E4FB3E10], 0);

  char v6 = [(VUITVAppLauncher *)self stateMachine];
  char v9 = @"IsNetworkReachable";
  BOOL v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
  v10[0] = v7;
  char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v6 postEvent:@"Network Reachability Did Change" withContext:0 userInfo:v8];
}

- (VUIRootSplitViewController)splitViewController
{
  splitViewController = self->_splitViewController;
  if (!splitViewController)
  {
    id v4 = +[VUIInterfaceFactory sharedInstance];
    uint64_t v5 = [v4 rootSplitViewController];
    char v6 = self->_splitViewController;
    self->_splitViewController = v5;

    BOOL v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v9 = 0;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUITVAppLauncher - Requested SplitViewController from InterfaceFactory", v9, 2u);
    }

    splitViewController = self->_splitViewController;
  }
  return splitViewController;
}

- (void)_handleParsedOpenURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VUITVAppLauncher *)self appController];
  char v6 = [v5 appContext];
  BOOL v7 = +[VUIGDPRPresentationManager showGDPRWelcomeScreen:v6];

  if (v7)
  {
    objc_initWeak(&location, self);
    char v8 = +[VUIInterfaceFactory sharedInstance];
    char v9 = [v8 openURLHandler];
    id v10 = [v4 URL];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    char v19 = __41__VUITVAppLauncher__handleParsedOpenURL___block_invoke;
    __int16 v20 = &unk_1E6DFCB70;
    objc_copyWeak(&v21, &location);
    [v9 saveDeferredURL:v10 completion:&v17];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    [(VUITVAppLauncher *)self hideLoadingView];
  }
  else
  {
    id v11 = +[VUIInterfaceFactory sharedInstance];
    id v12 = [v11 openURLHandler];
    uint64_t v13 = [v4 URL];
    unint64_t v14 = [(VUITVAppLauncher *)self appController];
    int v15 = [v14 appContext];
    uint64_t v16 = [(VUITVAppLauncher *)self deeplinkCompletionHandler];
    [v12 processDeeplink:v13 appContext:v15 completion:v16];
  }
}

void __41__VUITVAppLauncher__handleParsedOpenURL___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  char v8 = (id *)(a1 + 32);
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  id v11 = [WeakRetained deeplinkCompletionHandler];
  ((void (**)(void, id, id, uint64_t, uint64_t))v11)[2](v11, v10, v9, a4, a5);
}

- (void)_accountsChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = [v4 userInfo];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Active account has changed %@", buf, 0xCu);
  }
  BOOL v7 = +[VUIMetricsController sharedInstance];
  [v7 updateGDPRConsentStatus];

  if (+[VUIAuthenticationManager userHasActiveAccount])
  {
    char v8 = [(VUITVAppLauncher *)self stateMachine];
    id v9 = [v8 currentState];
    int v10 = [v9 isEqual:@"RunningWithoutJavascript"];

    id v11 = VUIDefaultLogObject();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Active account has changed and Javscript is not running", buf, 2u);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      void block[2] = __37__VUITVAppLauncher__accountsChanged___block_invoke;
      block[3] = &unk_1E6DF3D58;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "VUITVAppLauncher - Active account has changed. Fetch config and refresh tab bar items.", buf, 2u);
      }

      [(VUITVAppLauncher *)self refreshTabBarItems];
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__VUITVAppLauncher__accountsChanged___block_invoke_361;
    v13[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v14, (id *)buf);
    dispatch_async(MEMORY[0x1E4F14428], v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __37__VUITVAppLauncher__accountsChanged___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 postEvent:@"Without Javascript Active Account Did Change" withContext:0 userInfo:0];
}

void __37__VUITVAppLauncher__accountsChanged___block_invoke_361(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained tabBarController];
  unint64_t v3 = [v2 selectedIndex];

  id v4 = [WeakRetained tabBarController];
  uint64_t v5 = [v4 tabBarItems];

  if (v3 >= [v5 count]) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = v3;
  }
  BOOL v7 = [v5 objectAtIndex:v6];
  char v8 = objc_msgSend(v7, "vui_stringForKey:", @"documentRef");
  if ([v8 isEqualToString:@"Library"])
  {
    id v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_INFO, "VUITVAppLauncher - User signed out. Popping to library tab root.", v13, 2u);
    }

    int v10 = [WeakRetained appController];
    id v11 = [v10 navigationController];
    id v12 = (id)[v11 popToRootViewControllerAnimated:0];
  }
}

+ (BOOL)_isDeeplinkTVButton:(id)a3
{
  unint64_t v3 = [a3 URL];
  char v4 = [(id)objc_opt_class() isDeeplinkTVButton:v3];

  return v4;
}

- (BOOL)_shouldRecordExitEvent
{
  id v2 = +[VUIMetricsController sharedInstance];
  uint64_t v3 = [v2 currentTabIdentifier];
  char v4 = [(id)v3 isEqualToString:@"library"];

  uint64_t v5 = +[VUIPlaybackManager sharedInstance];
  LOBYTE(v3) = [v5 isFullscreenPlaybackUIBeingShown];

  return v4 | v3;
}

- (void)appController:(id)a3 didFailWithError:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v9 = @"Error";
    v10[0] = a4;
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = a4;
    BOOL v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    BOOL v7 = 0;
  }
  char v8 = [(VUITVAppLauncher *)self stateMachine];
  [v8 postEvent:@"TVApplicationController Did Fail To Launch" withContext:0 userInfo:v7];
}

- (void)appController:(id)a3 didStopWithOptions:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v9 = @"Options";
    v10[0] = a4;
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = a4;
    BOOL v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    BOOL v7 = 0;
  }
  char v8 = [(VUITVAppLauncher *)self stateMachine];
  [v8 postEvent:@"TVApplicationController Did Stop" withContext:0 userInfo:v7];
}

- (id)rootViewController
{
  uint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v3 userInterfaceIdiom] != 1) {
    goto LABEL_4;
  }
  char v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v4 isRunningTest])
  {

LABEL_4:
    goto LABEL_5;
  }
  char v7 = _os_feature_enabled_impl();

  if (v7)
  {
LABEL_5:
    if (+[VUIUtilities isSUIEnabled])
    {
      id v5 = 0;
    }
    else
    {
      id v6 = [(VUITVAppLauncher *)self tabBarController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v5 = v6;
      }
      else {
        id v5 = 0;
      }
    }
    goto LABEL_13;
  }
  id v5 = [(VUITVAppLauncher *)self splitViewController];
LABEL_13:
  return v5;
}

+ (id)_libraryOnlyTabBarItem
{
  v15[6] = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl()
    && ([MEMORY[0x1E4FB16C8] currentDevice],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 userInterfaceIdiom],
        v3,
        v4 == 1))
  {
    id v5 = &stru_1F3E921E0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = [v6 localizedStringForKey:@"LIBRARY_TAB" value:0 table:0];
  }
  v14[0] = @"identifier";
  v14[1] = @"documentRef";
  v15[0] = @"library";
  v15[1] = @"Library";
  v15[2] = v5;
  v14[2] = @"title";
  v14[3] = @"isSideBarItem";
  char v7 = (void *)MEMORY[0x1E4F28ED0];
  char v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];
  if (v9 == 1)
  {
    id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
    if ([v2 isRunningTest]) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = _os_feature_enabled_impl() ^ 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [v7 numberWithInt:v10];
  v15[3] = v11;
  void v15[4] = MEMORY[0x1E4F1CC28];
  v14[4] = @"showHeader";
  v14[5] = @"collapsable";
  v15[5] = MEMORY[0x1E4F1CC28];
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:6];

  if (v9 == 1) {
  return v12;
  }
}

- (BOOL)isStillProcessingStartupItems
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  p_isStillProcessingStartupItemsLock = &self->_isStillProcessingStartupItemsLock;
  os_unfair_lock_lock(&self->_isStillProcessingStartupItemsLock);
  BOOL isStillProcessingStartupItems = self->_isStillProcessingStartupItems;
  os_unfair_lock_unlock(p_isStillProcessingStartupItemsLock);
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = @"NO";
    if (isStillProcessingStartupItems) {
      id v6 = @"YES";
    }
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUITVAppLauncher:: read isStillProcessingStartupItems : %@", (uint8_t *)&v8, 0xCu);
  }

  return isStillProcessingStartupItems;
}

- (void)setTabBarController:(id)a3
{
}

- (void)setSplitViewController:(id)a3
{
}

- (void)setAppWindow:(id)a3
{
}

- (id)switchTabHandler
{
  return self->_switchTabHandler;
}

- (id)deeplinkCompletionHandler
{
  return self->_deeplinkCompletionHandler;
}

- (BOOL)isDeeplinkLaunched
{
  return self->_isDeeplinkLaunched;
}

- (void)setIsDeeplinkLaunched:(BOOL)a3
{
  self->_isDeeplinkLaunched = a3;
}

- (NSArray)tabBarItems
{
  return self->_tabBarItems;
}

- (void)setStateMachine:(id)a3
{
}

- (BOOL)overrideOrientation
{
  return self->_overrideOrientation;
}

- (void)setOverrideOrientation:(BOOL)a3
{
  self->_overrideOrientation = a3;
}

- (BOOL)appWasForegrounded
{
  return self->_appWasForegrounded;
}

- (void)setAppWasForegrounded:(BOOL)a3
{
  self->_BOOL appWasForegrounded = a3;
}

- (BOOL)appWasRunningWithoutJavascript
{
  return self->_appWasRunningWithoutJavascript;
}

- (void)setAppWasRunningWithoutJavascript:(BOOL)a3
{
  self->_appWasRunningWithoutJavascript = a3;
}

- (BOOL)startupOfferProcessingCompleted
{
  return self->_startupOfferProcessingCompleted;
}

- (void)setIsTerminating:(BOOL)a3
{
  self->_isTerminating = a3;
}

- (NSString)sportsTabIdentifier
{
  return self->_sportsTabIdentifier;
}

- (void)setSportsTabIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsTabIdentifier, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_tabBarItems, 0);
  objc_storeStrong((id *)&self->_jetPackController, 0);
  objc_storeStrong((id *)&self->_deferredParsedOpenURL, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong(&self->_deeplinkCompletionHandler, 0);
  objc_storeStrong(&self->_switchTabHandler, 0);
  objc_storeStrong((id *)&self->_appWindow, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_appController, 0);
}

void __49__VUITVAppLauncher__registerStateMachineHandlers__block_invoke_5_311_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUITVAppLauncher - js app not running in state StateRunningWithJavascript is not a valid case.", v1, 2u);
}

- (void)_updateTabControllerWithTabBarItems:(char)a1 setSelectedIdentifierFromDefaults:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = @"NO";
  if (a1) {
    id v2 = @"YES";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUITVAppLauncher - Trying to update sidebar with 0 items, ignoring update. Network is reachable = %@", (uint8_t *)&v3, 0xCu);
}

- (void)rootViewControllerForAppController:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUITVAppLauncher - tabBarController does not conform to VUITVAppRootViewController", v1, 2u);
}

@end