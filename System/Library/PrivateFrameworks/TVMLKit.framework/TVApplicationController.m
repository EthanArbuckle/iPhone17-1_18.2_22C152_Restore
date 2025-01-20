@interface TVApplicationController
+ (id)_applicationControllerForElement:(id)a3;
+ (id)_jsLaunchOptionsWithApplicationOptions:(id)a3;
+ (void)initialize;
- (BOOL)_hasReloadOnResumeMinIntervalPassed;
- (BOOL)_shouldReloadOnResume;
- (BOOL)appContext:(id)a3 highlightViewForElement:(id)a4 contentColor:(id)a5 paddingColor:(id)a6 borderColor:(id)a7 marginColor:(id)a8;
- (BOOL)appContext:(id)a3 highlightViewsForElements:(id)a4 contentColor:(id)a5 paddingColor:(id)a6 borderColor:(id)a7 marginColor:(id)a8;
- (BOOL)appContext:(id)a3 validateDOMDocument:(id)a4 inContext:(id)a5 error:(id *)a6;
- (BOOL)appNavigationController:(id)a3 shouldDismissShroudForDocument:(id)a4;
- (BOOL)appNavigationController:(id)a3 shouldIgnoreDismissalForViewController:(id)a4;
- (BOOL)appNavigationController:(id)a3 shouldOverrideModalBehaviorForDocument:(id)a4 andExistingDocument:(id)a5;
- (BOOL)cancelHighlightViewForAppContext:(id)a3;
- (BOOL)isTimeZoneSet;
- (BOOL)jsOpenURL:(id)a3 options:(id)a4;
- (BOOL)openURL:(id)a3 options:(id)a4;
- (CGSize)screenSize;
- (TVApplicationController)init;
- (TVApplicationController)initWithContext:(id)a3 window:(id)a4 delegate:(id)a5;
- (TVApplicationControllerContext)context;
- (TVApplicationControllerDelegate)delegate;
- (UINavigationController)_currentNavigationController;
- (UITraitEnvironment)keyTraitEnvironment;
- (UIView)viewServiceKeyView;
- (UIViewController)rootViewController;
- (UIWindow)window;
- (_TVApplicationInspector)applicationInspector;
- (id)_appContext;
- (id)_rootViewController;
- (id)activeDocument;
- (id)dynamicUICompletion;
- (id)modalControllerForContext:(id)a3;
- (id)navigationControllerForContext:(id)a3;
- (id)storeFrontCountryCode;
- (id)systemLanguage;
- (id)tabBarForContext:(id)a3;
- (id)timeZone;
- (unint64_t)preferredVideoFormat;
- (unint64_t)preferredVideoPreviewFormat;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_applicationWillTerminateNotification:(id)a3;
- (void)_launchApp;
- (void)_openURLControllerDidDisplay:(id)a3;
- (void)_openURLControllerDidUpdate:(id)a3;
- (void)_openURLControllerHandler:(BOOL)a3;
- (void)_openURLIfPossibleWithOptions:(id)a3;
- (void)_openURLOnAppLaunchControllerDidDisplay:(id)a3;
- (void)_reloadControllerDidDisplay:(id)a3;
- (void)_resetControllerNotifications;
- (void)_rootControllerDidDisplay:(id)a3;
- (void)_statusBarOrientationDidChange:(id)a3;
- (void)appContext:(id)a3 didChangeInspectElementMode:(BOOL)a4;
- (void)appContext:(id)a3 didFailWithError:(id)a4;
- (void)appContext:(id)a3 didStartWithOptions:(id)a4;
- (void)appContext:(id)a3 didStopWithOptions:(id)a4;
- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4 options:(id)a5;
- (void)appContext:(id)a3 openDynamicUIURL:(id)a4 metricsOverlay:(id)a5 completion:(id)a6;
- (void)appContext:(id)a3 openMarketingItem:(id)a4 metricsOverlay:(id)a5 completion:(id)a6;
- (void)applicationDidResume:(id)a3;
- (void)applicationWillSuspend:(id)a3;
- (void)dealloc;
- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5;
- (void)evaluateInJavaScriptContext:(id)a3 completion:(id)a4;
- (void)reload;
- (void)setDynamicUICompletion:(id)a3;
- (void)setKeyTraitEnvironment:(id)a3;
- (void)stop;
@end

@implementation TVApplicationController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _TVSetupLoggingObjects();
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
  }
}

+ (id)_jsLaunchOptionsWithApplicationOptions:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if ([v3 count])
  {
    v5 = (void *)[v3 mutableCopy];
    uint64_t v6 = *MEMORY[0x263F1D080];
    v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F1D080]];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 absoluteString];
      [v4 setObject:v9 forKeyedSubscript:@"openURL"];

      uint64_t v10 = *MEMORY[0x263F1D078];
      v11 = [v5 objectForKeyedSubscript:*MEMORY[0x263F1D078]];
      if (v11) {
        [v4 setObject:v11 forKeyedSubscript:@"sourceAppIdentifier"];
      }
    }
    else
    {
      uint64_t v10 = *MEMORY[0x263F1D078];
    }
    [v4 addEntriesFromDictionary:v5];
    [v4 removeObjectForKey:v6];
    [v4 removeObjectForKey:v10];
    [v4 removeObjectForKey:*MEMORY[0x263F1D068]];
    v12 = [v4 objectForKeyedSubscript:@"sourceAppIdentifier"];
    if (([v12 isEqualToString:@"com.apple.PineBoard"] & 1) != 0
      || ([v12 isEqualToString:@"com.apple.HeadBoard"] & 1) != 0
      || [v12 isEqualToString:@"com.apple.SpringBoard"])
    {
      [v4 removeObjectForKey:@"sourceAppIdentifier"];
    }
  }
  v13 = (void *)[v4 copy];

  return v13;
}

- (TVApplicationController)init
{
  return 0;
}

- (TVApplicationController)initWithContext:(id)a3 window:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v67.receiver = self;
  v67.super_class = (Class)TVApplicationController;
  v11 = [(TVApplicationController *)&v67 init];
  v12 = (TVApplicationController *)v11;
  if (v11)
  {
    *(_WORD *)(v11 + 65) = 0;
    v13 = (void *)*((void *)v11 + 6);
    *((void *)v11 + 6) = 0;

    objc_storeStrong((id *)&v12->_window, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    uint64_t v14 = [v8 copy];
    context = v12->_context;
    v12->_context = (TVApplicationControllerContext *)v14;

    v16 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v17 = [v16 bundleIdentifier];

    uint64_t v18 = 1;
    v19 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v20 = [v19 firstObject];
    v21 = [v20 stringByAppendingPathComponent:v17];

    v22 = +[_TVProcessInfo currentProcessInfo];
    LODWORD(v20) = [v22 hasPrivateEntitlement];

    if (v20)
    {
      v23 = (const void *)MGCopyAnswer();
      if (v23)
      {
        v24 = v23;
        CFTypeID v25 = CFGetTypeID(v23);
        if (v25 == CFStringGetTypeID())
        {
          v26 = [NSString stringWithString:v24];
          v27 = [MEMORY[0x263EFFA40] standardUserDefaults];
          v28 = [v27 stringForKey:@"TVMLKitImageCacheKey"];

          if (![v26 length]
            || [v28 length] && (objc_msgSend(v28, "isEqualToString:", v26) & 1) != 0)
          {
            uint64_t v18 = 0;
          }
          else
          {
            v29 = [MEMORY[0x263EFFA40] standardUserDefaults];
            [v29 setObject:v26 forKey:@"TVMLKitImageCacheKey"];

            uint64_t v18 = 1;
          }
        }
        else
        {
          uint64_t v18 = 0;
        }
        CFRelease(v24);
      }
      else
      {
        uint64_t v18 = 0;
      }
    }
    +[TVAssetLibrary initializeAssetLibraryWithCachePath:v21 purgeCacheOnLoad:v18];
    uint64_t v30 = [(TVApplicationController *)v12 _rootViewController];
    appRootViewController = v12->_appRootViewController;
    v12->_appRootViewController = (TVAppRootViewController *)v30;

    window = v12->_window;
    if (window)
    {
      [(UIWindow *)window setRootViewController:v12->_appRootViewController];
      [(UIWindow *)v12->_window makeKeyAndVisible];
    }
    v33 = [(TVApplicationControllerContext *)v12->_context storageIdentifier];
    uint64_t v34 = [v33 length];

    if (v34)
    {
      v35 = [(TVApplicationControllerContext *)v12->_context storageIdentifier];
      v36 = [v35 stringByAppendingString:@".localStorage.plist"];
    }
    else
    {
      v36 = @"localStorage.plist";
    }
    id v37 = objc_alloc(MEMORY[0x263F4B3D0]);
    v38 = [v21 stringByAppendingPathComponent:v36];
    v66 = (void *)v17;
    uint64_t v39 = [v37 initWithFilePath:v38 identifier:v17];
    appLocalStorage = v12->_appLocalStorage;
    v12->_appLocalStorage = (IKAppDataStorage *)v39;

    v41 = [[_TVMLKitApplication alloc] initWithLaunchContext:v12->_context];
    application = v12->_application;
    v12->_application = v41;

    [(_TVMLKitApplication *)v12->_application setLocalDataStorage:v12->_appLocalStorage];
    [(_TVMLKitApplication *)v12->_application setAppRootViewController:v12->_appRootViewController];
    v43 = v12->_application;
    v44 = objc_opt_class();
    v45 = [(TVApplicationControllerContext *)v12->_context launchOptions];
    v46 = [v44 _jsLaunchOptionsWithApplicationOptions:v45];
    [(_TVMLKitApplication *)v43 setJavaScriptLaunchOptions:v46];

    id v47 = v9;
    [(_TVMLKitApplication *)v12->_application setKeyWindow:v9];
    v48 = [(TVApplicationControllerContext *)v12->_context launchOptions];
    v49 = [v48 objectForKeyedSubscript:*MEMORY[0x263F1D080]];

    if (v49) {
      v12->_doLaunchOpenURLHandling = 1;
    }
    [(TVApplicationController *)v12 _launchApp];
    v50 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v51 = *MEMORY[0x263F1D038];
    v52 = [MEMORY[0x263F1C408] sharedApplication];
    [v50 addObserver:v12 selector:sel__applicationDidBecomeActiveNotification_ name:v51 object:v52];

    v53 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v54 = *MEMORY[0x263F1D050];
    v55 = [MEMORY[0x263F1C408] sharedApplication];
    [v53 addObserver:v12 selector:sel__applicationDidEnterBackgroundNotification_ name:v54 object:v55];

    v56 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v57 = *MEMORY[0x263F1D0D8];
    v58 = [MEMORY[0x263F1C408] sharedApplication];
    [v56 addObserver:v12 selector:sel__applicationWillResignActiveNotification_ name:v57 object:v58];

    v59 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v60 = *MEMORY[0x263F1D0E0];
    v61 = [MEMORY[0x263F1C408] sharedApplication];
    [v59 addObserver:v12 selector:sel__applicationWillTerminateNotification_ name:v60 object:v61];

    v12->_interfaceOrientation = [(id)*MEMORY[0x263F1D020] statusBarOrientation];
    v62 = [MEMORY[0x263F08A00] defaultCenter];
    [v62 addObserver:v12 selector:sel__statusBarOrientationDidChange_ name:*MEMORY[0x263F1D048] object:0];

    v63 = [[_TVApplicationInspector alloc] initWithApplicationController:v12];
    applicationInspector = v12->_applicationInspector;
    v12->_applicationInspector = v63;

    id v9 = v47;
  }

  return v12;
}

- (void)dealloc
{
  [(TVApplicationController *)self stop];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVApplicationController;
  [(TVApplicationController *)&v4 dealloc];
}

- (void)stop
{
  [(IKAppContext *)self->_appContext stop];
  appContext = self->_appContext;
  self->_appContext = 0;
}

- (BOOL)openURL:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_opt_new();
    id v9 = [v6 absoluteString];
    [v8 setObject:v9 forKeyedSubscript:@"openURL"];

    id v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263F1D078]];

    uint64_t v11 = *MEMORY[0x263F1D098];
    v12 = [v7 objectForKeyedSubscript:*MEMORY[0x263F1D098]];
    v13 = v12;
    if (!v10)
    {

      if (!v13) {
        goto LABEL_6;
      }
      v13 = [v7 objectForKeyedSubscript:v11];
    }
    [v8 setObject:v13 forKeyedSubscript:@"sourceAppIdentifier"];

LABEL_6:
    if (![(IKAppContext *)self->_appContext isValid])
    {
      if (self->_doLaunchOpenURLHandling)
      {
        v22 = (NSDictionary *)[v8 copy];
        launchOpenURLOptions = self->_launchOpenURLOptions;
        self->_launchOpenURLOptions = v22;
      }
      else if ([v8 count])
      {
        v24 = [(TVApplicationController *)self activeDocument];

        if (!v24)
        {
          CFTypeID v25 = TVMLKitLogObject;
          if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v39 = 0;
            _os_log_impl(&dword_230B4C000, v25, OS_LOG_TYPE_INFO, "App Controller deferring handling of open URL to post launch", v39, 2u);
          }
          [(TVApplicationController *)self _openURLIfPossibleWithOptions:v8];
        }
      }
      goto LABEL_30;
    }
    if (self->_doLaunchOpenURLHandling)
    {
LABEL_26:
      if (self->_suspended)
      {
        v35 = (void *)[v8 copy];
        objc_storeStrong((id *)&self->_openURLResumeOptions, v35);
        appContext = self->_appContext;
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __43__TVApplicationController_openURL_options___block_invoke;
        v40[3] = &unk_264BA68F0;
        id v41 = v35;
        id v37 = v35;
        [(IKAppContext *)appContext evaluate:v40 completionBlock:0];
      }
      else
      {
        [(TVApplicationController *)self _openURLIfPossibleWithOptions:v8];
      }
      self->_doLaunchOpenURLHandling = 0;
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v14 = [(TVApplicationController *)self delegate];
    if ([v14 conformsToProtocol:&unk_26E601E58])
    {
      v15 = [(TVApplicationController *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        uint64_t v17 = [(TVApplicationController *)self delegate];
        int v18 = [v17 appController:self shouldDisplayShroudForURL:v6 withOptions:v7];

        if (!v18)
        {
          v19 = +[_TVAppLoadingView loadingScreen];
          [v19 setTimeout:20.0];

          v20 = +[_TVAppLoadingView loadingScreen];
          [v20 setLoadingDelay:2.0];

          v21 = +[_TVAppLoadingView loadingScreen];
          [v21 showOverKeyWindowWithSpinnerOnly:0];
LABEL_21:

          v26 = [(TVApplicationController *)self _currentNavigationController];
          [v26 dismissModal];

          v27 = [(TVApplicationController *)self rootViewController];
          v28 = [v27 presentedViewController];

          if (v28)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v29 = (id)[v28 popToRootViewControllerAnimated:0];
            }
            uint64_t v30 = [(TVApplicationController *)self rootViewController];
            [v30 dismissViewControllerAnimated:0 completion:0];
          }
          v31 = [(TVApplicationController *)self _currentNavigationController];
          id v32 = (id)[v31 popToRootViewControllerAnimated:0];

          [(TVApplicationController *)self _resetControllerNotifications];
          v33 = [MEMORY[0x263F08A00] defaultCenter];
          [v33 addObserver:self selector:sel__openURLControllerDidDisplay_ name:@"TVAppNavigationDidDisplayViewControllerNotification" object:0];

          uint64_t v34 = [MEMORY[0x263F08A00] defaultCenter];
          [v34 addObserver:self selector:sel__openURLControllerDidUpdate_ name:@"_TVAppDocumentDidUpdateNotification" object:0];

          goto LABEL_26;
        }
      }
    }
    else
    {
    }
    v21 = +[TVStorePlaybackLaunchShroud sharedShroud];
    [v21 setHidden:0 animated:1 withCompletionHandler:0];
    goto LABEL_21;
  }
LABEL_31:

  return v6 != 0;
}

void __43__TVApplicationController_openURL_options___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = [a2 objectForKeyedSubscript:@"App"];
  objc_super v4 = [v3 toObjectOfClass:NSClassFromString(&cfstr_Ikjsapplicatio.isa)];

  v7[0] = *(void *)(a1 + 32);
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v6 = (id)[v4 invokeMethod:@"onPreloadOpenURL" withArguments:v5];
}

- (void)_openURLIfPossibleWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(TVApplicationController *)self activeDocument];
  if (v5)
  {
  }
  else if ([v4 count])
  {
    id v9 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230B4C000, v9, OS_LOG_TYPE_INFO, "App Controller deferring handling open URL to post presented", buf, 2u);
    }
    [(TVApplicationController *)self _resetControllerNotifications];
    id v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:self selector:sel__rootControllerDidDisplay_ name:@"TVAppNavigationDidDisplayViewControllerNotification" object:0];

    uint64_t v11 = (NSDictionary *)[v4 copy];
    openURLPresentedOptions = self->_openURLPresentedOptions;
    self->_openURLPresentedOptions = v11;
    goto LABEL_11;
  }
  if ([v4 count])
  {
    id v6 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_230B4C000, v6, OS_LOG_TYPE_INFO, "App Controller handling open URL", v12, 2u);
    }
    appContext = self->_appContext;
    openURLPresentedOptions = (NSDictionary *)[v4 copy];
    [(IKAppContext *)appContext openURLWithOptions:openURLPresentedOptions];
LABEL_11:
  }
}

- (BOOL)jsOpenURL:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = [v7 absoluteString];

  [v8 setObject:v9 forKeyedSubscript:@"openURL"];
  id v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F1D078]];

  [v8 setObject:v10 forKeyedSubscript:@"sourceAppIdentifier"];
  int v11 = [(IKAppContext *)self->_appContext isValid];
  if (v11)
  {
    appContext = self->_appContext;
    v13 = (void *)[v8 copy];
    [(IKAppContext *)appContext openURLWithOptions:v13];
  }
  return v11;
}

- (void)evaluateInJavaScriptContext:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void))a4;
  appContext = self->_appContext;
  if (appContext)
  {
    [(IKAppContext *)appContext evaluate:v8 completionBlock:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_popViewControllerOnBackground)
  {
    v5 = [(TVApplicationController *)self _currentNavigationController];
    id v6 = (id)[v5 popViewControllerAnimated:0];

    self->_popViewControllerOnBackground = 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(TVApplicationController *)self _currentNavigationController];
  id v8 = [v7 viewControllers];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v13 setMenuGestureHandler:0];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
}

- (void)_applicationWillTerminateNotification:(id)a3
{
}

- (void)_statusBarOrientationDidChange:(id)a3
{
  int64_t v4 = objc_msgSend((id)*MEMORY[0x263F1D020], "statusBarOrientation", a3);
  if (v4 != self->_interfaceOrientation)
  {
    self->_interfaceOrientation = v4;
    if ([(IKAppContext *)self->_appContext isValid])
    {
      id v5 = [(_TVMLKitApplication *)self->_application appTraitCollection];
      [(IKAppContext *)self->_appContext appTraitCollectionChanged:v5];
    }
  }
}

- (void)appContext:(id)a3 didChangeInspectElementMode:(BOOL)a4
{
}

- (BOOL)appContext:(id)a3 highlightViewForElement:(id)a4 contentColor:(id)a5 paddingColor:(id)a6 borderColor:(id)a7 marginColor:(id)a8
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  applicationInspector = self->_applicationInspector;
  id v17 = a4;
  uint64_t v11 = (void *)MEMORY[0x263EFF8C0];
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  long long v15 = [v11 arrayWithObjects:&v17 count:1];
  -[_TVApplicationInspector highlightViewElements:contentColor:borderColor:](applicationInspector, "highlightViewElements:contentColor:borderColor:", v15, v13, v12, v17, v18);

  return 1;
}

- (BOOL)appContext:(id)a3 highlightViewsForElements:(id)a4 contentColor:(id)a5 paddingColor:(id)a6 borderColor:(id)a7 marginColor:(id)a8
{
  return 1;
}

- (BOOL)cancelHighlightViewForAppContext:(id)a3
{
  return 1;
}

- (id)navigationControllerForContext:(id)a3
{
  if (self->_appContext == a3)
  {
    id v3 = [(TVAppRootViewController *)self->_appRootViewController appNavigationController];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)tabBarForContext:(id)a3
{
  if (self->_appContext == a3)
  {
    id v3 = [(TVAppRootViewController *)self->_appRootViewController appTabBar];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)modalControllerForContext:(id)a3
{
  return 0;
}

- (BOOL)appContext:(id)a3 validateDOMDocument:(id)a4 inContext:(id)a5 error:(id *)a6
{
  return 1;
}

- (void)appContext:(id)a3 didStartWithOptions:(id)a4
{
  id v6 = (IKAppContext *)a3;
  id v7 = a4;
  id v8 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230B4C000, v8, OS_LOG_TYPE_INFO, "App Controller did launch", buf, 2u);
  }
  if (self->_appContext == v6 && !self->_reloadInProgress)
  {
    uint64_t v9 = [(TVApplicationController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(TVApplicationController *)self delegate];
      [v11 appController:self didFinishLaunchingWithOptions:v7];

      _TVMLMetricsLogPublicAPIUsage(sel_appController_didFinishLaunchingWithOptions_);
    }
  }
  if (self->_doLaunchOpenURLHandling)
  {
    if ([(NSDictionary *)self->_launchOpenURLOptions count])
    {
      [(IKAppContext *)self->_appContext openURLWithOptions:self->_launchOpenURLOptions];
      id v12 = TVMLKitLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v15 = 0;
        _os_log_impl(&dword_230B4C000, v12, OS_LOG_TYPE_INFO, "App Controller did handle open URL on launch", v15, 2u);
      }
    }
    launchOpenURLOptions = self->_launchOpenURLOptions;
    self->_launchOpenURLOptions = 0;

    self->_doLaunchOpenURLHandling = 0;
  }
  else if (self->_reloadInProgress)
  {
    *(_WORD *)&self->_reloadInProgress = 0;
    if (self->_openURLReloadOptions)
    {
      -[IKAppContext openURLWithOptions:](self->_appContext, "openURLWithOptions:");
      openURLReloadOptions = self->_openURLReloadOptions;
      self->_openURLReloadOptions = 0;
    }
  }
}

- (void)appContext:(id)a3 didFailWithError:(id)a4
{
  id v6 = (IKAppContext *)a3;
  id v7 = a4;
  if (self->_appContext == v6)
  {
    self->_appContext = 0;

    id v8 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR)) {
      -[TVApplicationController appContext:didFailWithError:]((uint64_t)v7, v8);
    }
    uint64_t v9 = [(TVApplicationController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(TVApplicationController *)self delegate];
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"TVMLKitErrorDomain" code:3 userInfo:0];
      [v11 appController:self didFailWithError:v12];

      _TVMLMetricsLogPublicAPIUsage(sel_appController_didFailWithError_);
    }
  }
}

- (void)appContext:(id)a3 didStopWithOptions:(id)a4
{
  char v10 = (IKAppContext *)a3;
  id v6 = a4;
  if (!self->_reloadInProgress)
  {
    id v7 = [(TVApplicationController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [(TVApplicationController *)self delegate];
      [v9 appController:self didStopWithOptions:v6];

      _TVMLMetricsLogPublicAPIUsage(sel_appController_didStopWithOptions_);
    }
    if (self->_appContext == v10)
    {
      self->_appContext = 0;
    }
  }
}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = +[_TVProcessInfo currentProcessInfo];
  int v8 = [v7 hasPrivateEntitlement];
  uint64_t v9 = [(TVApplicationController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  int v11 = v8 & [v7 hasiTunesAPIEntitlement];
  if ((v10 & 1) == 0)
  {
    if (!v11) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v12 = [(TVApplicationController *)self delegate];
  [v12 appController:self evaluateAppJavaScriptInContext:v6];

  _TVMLMetricsLogPublicAPIUsage(sel_appController_evaluateAppJavaScriptInContext_);
  if (v11)
  {
    id v13 = [v6 objectForKeyedSubscript:@"itms"];
    char v14 = [v13 toBool];

    if ((v14 & 1) == 0)
    {
LABEL_6:
      long long v15 = (void *)[objc_alloc(MEMORY[0x263F4B458]) initWithAppContext:v16];
      [v6 setObject:v15 forKeyedSubscript:@"itms"];
    }
  }
LABEL_7:
}

- (void)reload
{
  self->_reloadOnResume = 1;
  [(TVApplicationController *)self appContext:self->_appContext needsReloadWithUrgency:0 options:0];
}

- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  char v10 = v9;
  if (a4 == 1)
  {
    self->_reloadOnResume = 1;
    int v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F4B2A8]];
    [v11 doubleValue];
    self->_reloadOnResumeMinInterval = v12;

    if (self->_reloadOnResumeMinInterval > 0.0)
    {
      id v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v13 floatForKey:@"override-minSuspensionTime"];
      float v15 = v14;

      if (v15 > 0.0)
      {
        id v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
        [v16 floatForKey:@"override-minSuspensionTime"];
        self->_reloadOnResumeMinInterval = v17;
      }
    }
  }
  else
  {
    if (self->_reloadOnResume)
    {
      if (!self->_reloadOnResumeBackgroundedDate || self->_reloadOnResumeMinInterval == 0.0) {
        goto LABEL_10;
      }
      if (![(TVApplicationController *)self _hasReloadOnResumeMinIntervalPassed]) {
        goto LABEL_20;
      }
      if (self->_reloadOnResume)
      {
LABEL_10:
        uint64_t v18 = +[_TVProcessInfo currentProcessInfo];
        int v19 = [v18 hasPrivateEntitlement];

        if (v19)
        {
          v20 = +[_TVAppLoadingView loadingScreen];
          [v20 setTimeout:60.0];

          v21 = +[_TVAppLoadingView loadingScreen];
          [v21 showOverKeyWindowWithSpinnerOnly:0];

          [(TVApplicationController *)self _resetControllerNotifications];
          v22 = [MEMORY[0x263F08A00] defaultCenter];
          [v22 addObserver:self selector:sel__reloadControllerDidDisplay_ name:@"TVAppNavigationDidDisplayViewControllerNotification" object:0];
        }
      }
    }
    self->_reloadOnResume = 0;
    reloadOnResumeBackgroundedDate = self->_reloadOnResumeBackgroundedDate;
    self->_reloadOnResumeMinInterval = 0.0;
    self->_reloadOnResumeBackgroundedDate = 0;

    if (!self->_reloadInProgress)
    {
      objc_initWeak(&location, self);
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __69__TVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke;
      v30[3] = &unk_264BA6918;
      objc_copyWeak(&v32, &location);
      id v31 = v8;
      v24 = (void (**)(void))MEMORY[0x230FC9DC0](v30);
      CFTypeID v25 = [(TVAppRootViewController *)self->_appRootViewController currentNavigationController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v26 = v25;
      }
      else {
        v26 = 0;
      }
      id v27 = v26;
      if (v27)
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __69__TVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke_2;
        v28[3] = &unk_264BA68A0;
        id v29 = v24;
        [v27 dismissAllModals:v28];
      }
      else
      {
        v24[2](v24);
      }

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
  }
LABEL_20:
}

void __69__TVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [WeakRetained _rootViewController];
    id v3 = WeakRetained[14];
    WeakRetained[14] = (id)v2;

    [WeakRetained[16] setRootViewController:WeakRetained[14]];
    int64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    id v5 = [WeakRetained[2] javaScriptLaunchOptions];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = [WeakRetained[2] javaScriptLaunchOptions];
      [v4 addEntriesFromDictionary:v7];

      [v4 removeObjectForKey:@"openURL"];
      [v4 removeObjectForKey:@"sourceAppIdentifier"];
    }
    if ([WeakRetained[6] count])
    {
      id v8 = [WeakRetained[6] objectForKey:@"openURL"];
      [v4 setObject:v8 forKeyedSubscript:@"openURL"];
    }
    [v4 setObject:@"reload" forKeyedSubscript:@"launchContext"];
    [WeakRetained[2] setJavaScriptLaunchOptions:v4];
    *((unsigned char *)WeakRetained + 65) = 1;
    [*(id *)(a1 + 32) reload];
  }
}

uint64_t __69__TVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)appContext:(id)a3 openDynamicUIURL:(id)a4 metricsOverlay:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  float v14 = self->_appRootViewController;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2050000000;
  float v15 = (void *)getAMSUIDynamicViewControllerClass_softClass;
  uint64_t v31 = getAMSUIDynamicViewControllerClass_softClass;
  if (!getAMSUIDynamicViewControllerClass_softClass)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __getAMSUIDynamicViewControllerClass_block_invoke;
    v27[3] = &unk_264BA6940;
    v27[4] = &v28;
    __getAMSUIDynamicViewControllerClass_block_invoke((uint64_t)v27);
    float v15 = (void *)v29[3];
  }
  CFTypeID v25 = v13;
  v26 = v10;
  id v16 = v15;
  _Block_object_dispose(&v28, 8);
  float v17 = [MEMORY[0x263F4B4B8] sharedCache];
  uint64_t v18 = (void *)MEMORY[0x263F27B40];
  int v19 = [v16 bagKeySet];
  v20 = [v17 profile];
  v21 = [v17 profileVersion];
  [v18 registerBagKeySet:v19 forProfile:v20 profileVersion:v21];

  v22 = (void *)[objc_alloc((Class)v16) initWithBag:v17 URL:v11];
  v23 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  v24 = objc_msgSend(v23, "ams_activeiTunesAccount");
  [v22 setAccount:v24];

  if ([v12 count]) {
    [v22 setMetricsOverlay:v12];
  }
  [v22 setDelegate:self];
  [(TVApplicationController *)self setDynamicUICompletion:v25];
  [(TVAppRootViewController *)v14 presentViewController:v22 animated:1 completion:0];
}

- (void)appContext:(id)a3 openMarketingItem:(id)a4 metricsOverlay:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  float v14 = self->_appRootViewController;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  float v15 = (void *)getAMSUIMarketingItemViewControllerClass_softClass;
  uint64_t v32 = getAMSUIMarketingItemViewControllerClass_softClass;
  if (!getAMSUIMarketingItemViewControllerClass_softClass)
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __getAMSUIMarketingItemViewControllerClass_block_invoke;
    v28[3] = &unk_264BA6940;
    void v28[4] = &v29;
    __getAMSUIMarketingItemViewControllerClass_block_invoke((uint64_t)v28);
    float v15 = (void *)v30[3];
  }
  v26 = v13;
  id v27 = v10;
  id v16 = v15;
  _Block_object_dispose(&v29, 8);
  float v17 = [MEMORY[0x263F4B4B8] sharedCache];
  uint64_t v18 = (void *)MEMORY[0x263F27B40];
  int v19 = [v16 bagKeySet];
  v20 = [v17 profile];
  v21 = [v17 profileVersion];
  [v18 registerBagKeySet:v19 forProfile:v20 profileVersion:v21];

  v22 = (void *)[objc_alloc(MEMORY[0x263F27CD8]) initWithDictionary:v11];
  v23 = (void *)[objc_alloc((Class)v16) initWithMarketingItem:v22 bag:v17];
  v24 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  CFTypeID v25 = objc_msgSend(v24, "ams_activeiTunesAccount");
  [v23 setAccount:v25];

  if ([v12 count]) {
    [v23 setMetricsOverlay:v12];
  }
  [v23 setDelegate:self];
  [(TVApplicationController *)self setDynamicUICompletion:v26];
  [(TVAppRootViewController *)v14 presentViewController:v23 animated:1 completion:0];
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = [(TVApplicationController *)self dynamicUICompletion];
  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F4B3E0]) initWithCarrierLinkResult:v10];
    ((void (**)(void, void *, id))v8)[2](v8, v9, v7);
    [(TVApplicationController *)self setDynamicUICompletion:0];
  }
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = [(TVApplicationController *)self dynamicUICompletion];
  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F4B3E0]) initWithPurchaseResult:v10];
    ((void (**)(void, void *, id))v8)[2](v8, v9, v7);
    [(TVApplicationController *)self setDynamicUICompletion:0];
  }
}

- (unint64_t)preferredVideoFormat
{
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"PreferredPurchaseResolution", @"com.apple.videos-preferences");
  unint64_t v3 = v2 && (objc_opt_respondsToSelector() & 1) != 0 && [v2 integerValue] == 1;

  return v3;
}

- (unint64_t)preferredVideoPreviewFormat
{
  return 0;
}

- (CGSize)screenSize
{
  uint64_t v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isTimeZoneSet
{
  uint64_t v2 = [MEMORY[0x263EFFA18] systemTimeZone];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)systemLanguage
{
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = [v2 arrayForKey:@"AppleLanguages"];

  double v4 = [v3 firstObject];

  return v4;
}

- (id)storeFrontCountryCode
{
  return 0;
}

- (id)timeZone
{
  uint64_t v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x263EFF4B8]];
  double v4 = [v3 timeZone];

  return v4;
}

- (BOOL)appNavigationController:(id)a3 shouldOverrideModalBehaviorForDocument:(id)a4 andExistingDocument:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(TVApplicationController *)self delegate];
  if ([v9 conformsToProtocol:&unk_26E601E58])
  {
    id v10 = [(TVApplicationController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
    {
      char v12 = 0;
      goto LABEL_7;
    }
    id v9 = [(TVApplicationController *)self delegate];
    char v12 = [v9 appController:self shouldOverrideModalBehaviorForDocument:v7 andExistingModalDocument:v8];
  }
  else
  {
    char v12 = 0;
  }

LABEL_7:
  return v12;
}

- (BOOL)appNavigationController:(id)a3 shouldIgnoreDismissalForViewController:(id)a4
{
  id v5 = a4;
  double v6 = [(TVApplicationController *)self delegate];
  if ([v6 conformsToProtocol:&unk_26E601E58])
  {
    id v7 = [(TVApplicationController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
    {
      char v9 = 0;
      goto LABEL_7;
    }
    double v6 = [(TVApplicationController *)self delegate];
    char v9 = [v6 appController:self shouldIgnoreDismissalForViewController:v5];
  }
  else
  {
    char v9 = 0;
  }

LABEL_7:
  return v9;
}

- (BOOL)appNavigationController:(id)a3 shouldDismissShroudForDocument:(id)a4
{
  id v5 = a4;
  double v6 = [(TVApplicationController *)self delegate];
  if ([v6 conformsToProtocol:&unk_26E601E58])
  {
    id v7 = [(TVApplicationController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
    {
      char v9 = 1;
      goto LABEL_7;
    }
    double v6 = [(TVApplicationController *)self delegate];
    char v9 = [v6 appController:self shouldDismissShroudForDocument:v5];
  }
  else
  {
    char v9 = 1;
  }

LABEL_7:
  return v9;
}

- (UIViewController)rootViewController
{
  return (UIViewController *)self->_appRootViewController;
}

- (void)setKeyTraitEnvironment:(id)a3
{
  p_keyTraitEnvironment = &self->_keyTraitEnvironment;
  id v5 = a3;
  objc_storeWeak((id *)p_keyTraitEnvironment, v5);
  [(_TVMLKitApplication *)self->_application setKeyTraitEnvironment:v5];
}

- (UIView)viewServiceKeyView
{
  BOOL v3 = [(TVApplicationController *)self keyTraitEnvironment];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [(TVApplicationController *)self keyTraitEnvironment];
  }
  else
  {
    double v4 = 0;
  }

  return (UIView *)v4;
}

- (void)applicationDidResume:(id)a3
{
  BOOL suspended = self->_suspended;
  self->_BOOL suspended = 0;
  if (suspended)
  {
    id v5 = self->_openURLResumeOptions;
    openURLResumeOptions = self->_openURLResumeOptions;
    self->_openURLResumeOptions = 0;

    if ([(TVApplicationController *)self _shouldReloadOnResume])
    {
      id v7 = (NSDictionary *)[(NSDictionary *)v5 copy];
      openURLReloadOptions = self->_openURLReloadOptions;
      self->_openURLReloadOptions = v7;

      [(TVApplicationController *)self appContext:self->_appContext needsReloadWithUrgency:0 options:0];
      char v9 = v5;
    }
    else
    {
      if (v5) {
        uint64_t v10 = [(NSDictionary *)v5 mutableCopy];
      }
      else {
        uint64_t v10 = objc_opt_new();
      }
      char v11 = (void *)v10;
      char v12 = [(_TVMLKitApplication *)self->_application appTraitCollection];
      [v11 setObject:v12 forKeyedSubscript:@"appTraitCollection"];

      float v14 = (NSDictionary *)[v11 copy];
      [(IKAppContext *)self->_appContext resumeWithOptions:v14];
      id v13 = [(NSDictionary *)v14 objectForKeyedSubscript:@"openURL"];

      if (v13) {
        [(IKAppContext *)self->_appContext openURLWithOptions:v14];
      }

      char v9 = v14;
    }
  }
}

- (void)applicationWillSuspend:(id)a3
{
  objc_msgSend(MEMORY[0x263EFF910], "date", a3);
  double v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  reloadOnResumeBackgroundedDate = self->_reloadOnResumeBackgroundedDate;
  self->_reloadOnResumeBackgroundedDate = v4;

  appContext = self->_appContext;
  if (appContext)
  {
    [(IKAppContext *)appContext suspendWithOptions:0];
    self->_BOOL suspended = 1;
  }
}

- (id)activeDocument
{
  return [(_TVMLKitApplication *)self->_application activeDocument];
}

+ (id)_applicationControllerForElement:(id)a3
{
  BOOL v3 = [a3 appDocument];
  double v4 = [v3 appContext];

  id v5 = [v4 delegate];
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = [v4 delegate];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_appContext
{
  return self->_appContext;
}

- (UINavigationController)_currentNavigationController
{
  return (UINavigationController *)[(TVAppRootViewController *)self->_appRootViewController currentNavigationController];
}

- (void)_openURLOnAppLaunchControllerDidDisplay:(id)a3
{
}

- (void)_openURLControllerDidDisplay:(id)a3
{
}

- (void)_openURLControllerDidUpdate:(id)a3
{
}

- (void)_rootControllerDidDisplay:(id)a3
{
  [(TVApplicationController *)self _resetControllerNotifications];
  if ([(NSDictionary *)self->_openURLPresentedOptions count])
  {
    double v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel__openURLControllerDidDisplay_ name:@"TVAppNavigationDidDisplayViewControllerNotification" object:0];

    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel__openURLControllerDidUpdate_ name:@"_TVAppDocumentDidUpdateNotification" object:0];

    double v6 = (void *)[(NSDictionary *)self->_openURLPresentedOptions copy];
    openURLPresentedOptions = self->_openURLPresentedOptions;
    self->_openURLPresentedOptions = 0;

    [(IKAppContext *)self->_appContext openURLWithOptions:v6];
    char v8 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v9 = 0;
      _os_log_impl(&dword_230B4C000, v8, OS_LOG_TYPE_INFO, "App Controller did handle open URL on presented", v9, 2u);
    }
  }
}

- (void)_openURLControllerHandler:(BOOL)a3
{
  if (a3)
  {
    double v4 = +[_TVAppLoadingView loadingScreen];
    [v4 hide];
  }
  [(TVApplicationController *)self _resetControllerNotifications];
}

- (void)_reloadControllerDidDisplay:(id)a3
{
  double v4 = +[_TVAppLoadingView loadingScreen];
  [v4 hide];

  [(TVApplicationController *)self _resetControllerNotifications];
}

- (void)_resetControllerNotifications
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"TVAppNavigationDidDisplayViewControllerNotification" object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:@"_TVAppDocumentDidUpdateNotification" object:0];
}

- (void)_launchApp
{
  if (!self->_appContext)
  {
    BOOL v3 = [(TVApplicationControllerContext *)self->_context javaScriptApplicationURL];
    uint64_t v4 = [v3 isFileURL];

    id v5 = (IKAppContext *)[objc_alloc(MEMORY[0x263F4B3C8]) initWithApplication:self->_application mode:v4 delegate:self];
    appContext = self->_appContext;
    self->_appContext = v5;

    id v7 = self->_appContext;
    [(IKAppContext *)v7 start];
  }
}

- (BOOL)_shouldReloadOnResume
{
  if (self->_reloadOnResume && self->_reloadOnResumeBackgroundedDate && self->_reloadOnResumeMinInterval != 0.0) {
    return [(TVApplicationController *)self _hasReloadOnResumeMinIntervalPassed];
  }
  else {
    return self->_reloadOnResume;
  }
}

- (BOOL)_hasReloadOnResumeMinIntervalPassed
{
  id v3 = objc_alloc(MEMORY[0x263EFF8F0]);
  uint64_t v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  reloadOnResumeBackgroundedDate = self->_reloadOnResumeBackgroundedDate;
  double v6 = [MEMORY[0x263EFF910] date];
  id v7 = [v4 components:128 fromDate:reloadOnResumeBackgroundedDate toDate:v6 options:0];

  LOBYTE(self) = self->_reloadOnResumeMinInterval <= (double)[v7 second];
  return (char)self;
}

- (id)_rootViewController
{
  id v3 = [(TVApplicationController *)self delegate];
  if ([v3 conformsToProtocol:&unk_26E601E58])
  {
    id v4 = v3;
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v4 rootViewControllerForAppController:self];

      if (v5) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v5 = [[_TVAppNavigationController_iOS alloc] initWithApplicationController:self];
LABEL_7:
  [(_TVAppNavigationController *)v5 setAppNavigationControllersDelegate:self];

  return v5;
}

- (UIWindow)window
{
  return self->_window;
}

- (TVApplicationControllerContext)context
{
  return self->_context;
}

- (TVApplicationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVApplicationControllerDelegate *)WeakRetained;
}

- (id)dynamicUICompletion
{
  return self->_dynamicUICompletion;
}

- (void)setDynamicUICompletion:(id)a3
{
}

- (_TVApplicationInspector)applicationInspector
{
  return self->_applicationInspector;
}

- (UITraitEnvironment)keyTraitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyTraitEnvironment);
  return (UITraitEnvironment *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyTraitEnvironment);
  objc_storeStrong((id *)&self->_applicationInspector, 0);
  objc_storeStrong(&self->_dynamicUICompletion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_appRootViewController, 0);
  objc_storeStrong((id *)&self->_launchOpenURLOptions, 0);
  objc_storeStrong((id *)&self->_reloadOnResumeBackgroundedDate, 0);
  objc_storeStrong((id *)&self->_openURLPresentedOptions, 0);
  objc_storeStrong((id *)&self->_openURLReloadOptions, 0);
  objc_storeStrong((id *)&self->_openURLResumeOptions, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_appLocalStorage, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
}

- (void)appContext:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_230B4C000, a2, OS_LOG_TYPE_ERROR, "App Context Failed with Error: %@", (uint8_t *)&v2, 0xCu);
}

@end