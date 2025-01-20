@interface VUITVApplicationController
+ (id)_jsLaunchOptionsWithApplicationOptions:(id)a3;
+ (void)initialize;
- (BOOL)_hasReloadOnResumeMinIntervalPassed;
- (BOOL)_shouldReloadOnResume;
- (BOOL)openURL:(id)a3 options:(id)a4;
- (UITraitEnvironment)keyTraitEnvironment;
- (UIWindow)window;
- (VUIAppContext)appContext;
- (VUITVApplicationController)init;
- (VUITVApplicationController)initWithContext:(id)a3 window:(id)a4 delegate:(id)a5;
- (VUITVApplicationControllerContext)context;
- (VUITVApplicationControllerDelegate)delegate;
- (id)_currentNavigationController;
- (id)_rootViewController;
- (id)appRootViewController;
- (id)rootViewController;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_applicationWillTerminateNotification:(id)a3;
- (void)_launchApp;
- (void)_openURLControllerDidDisplay:(id)a3;
- (void)_openURLControllerHandler:(BOOL)a3;
- (void)_openURLOnAppLaunchControllerDidDisplay:(id)a3;
- (void)_reloadControllerDidDisplay:(id)a3;
- (void)_statusBarOrientationDidChange:(id)a3;
- (void)appContext:(id)a3 didFailWithError:(id)a4;
- (void)appContext:(id)a3 didStartWithOptions:(id)a4;
- (void)appContext:(id)a3 didStopWithOptions:(id)a4;
- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4 options:(id)a5;
- (void)appContext:(id)a3 scriptForURL:(id)a4 cachePolicy:(unint64_t)a5 completion:(id)a6;
- (void)applicationDidResume:(id)a3;
- (void)applicationWillSuspend:(id)a3;
- (void)dealloc;
- (void)evaluateInJavaScriptContext:(id)a3 completion:(id)a4;
- (void)registerForApplicationNotifications;
- (void)reload;
- (void)setKeyTraitEnvironment:(id)a3;
- (void)stop;
@end

@implementation VUITVApplicationController

- (void)appContext:(id)a3 didStartWithOptions:(id)a4
{
  v6 = (VUIAppContext *)a3;
  id v7 = a4;
  v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "VUITVApplicationController - App Context didStartWithOptions", v12, 2u);
  }

  if (_os_feature_enabled_impl()) {
    +[VideosUI fetchUMConfigurations];
  }
  if (self->_appContext == v6 && !self->_reloadInProgress)
  {
    v9 = [(VUITVApplicationController *)self delegate];
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v9 appController:self didFinishLaunchingWithOptions:v7];
    }
  }
  if (self->_doLaunchOpenURLHandling)
  {
    [(NSDictionary *)self->_launchOpenURLOptions count];
    launchOpenURLOptions = self->_launchOpenURLOptions;
    self->_launchOpenURLOptions = 0;

    self->_doLaunchOpenURLHandling = 0;
  }
  else if (self->_reloadInProgress)
  {
    *(_WORD *)&self->_reloadInProgress = 0;
    openURLReloadOptions = self->_openURLReloadOptions;
    if (openURLReloadOptions)
    {
      self->_openURLReloadOptions = 0;
    }
  }
}

- (VUIAppContext)appContext
{
  return self->_appContext;
}

+ (void)initialize
{
  v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_INFO, "VUITVApplicationController - init", v3, 2u);
  }
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
}

+ (id)_jsLaunchOptionsWithApplicationOptions:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if ([v3 count])
  {
    v5 = (void *)[v3 mutableCopy];
    uint64_t v6 = *MEMORY[0x1E4FB26A8];
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB26A8]];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 absoluteString];
      [v4 setObject:v9 forKeyedSubscript:@"openURL"];

      uint64_t v10 = *MEMORY[0x1E4FB26A0];
      v11 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB26A0]];
      if (v11) {
        [v4 setObject:v11 forKeyedSubscript:@"sourceAppIdentifier"];
      }
    }
    else
    {
      uint64_t v10 = *MEMORY[0x1E4FB26A0];
    }
    [v4 addEntriesFromDictionary:v5];
    [v4 removeObjectForKey:v6];
    [v4 removeObjectForKey:v10];
  }
  v12 = (void *)[v4 copy];

  return v12;
}

- (void)appContext:(id)a3 scriptForURL:(id)a4 cachePolicy:(unint64_t)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  uint64_t v10 = VUIDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_INFO, "VUITVApplicationController - fetchAppJavascript", v12, 2u);
  }

  v11 = +[VUIAppScriptDownloadManager sharedInstance];
  [v11 fetchAppJavascript:v9 cachePolicy:a5 completionHandler:v8];
}

- (VUITVApplicationController)initWithContext:(id)a3 window:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)VUITVApplicationController;
  v11 = [(VUITVApplicationController *)&v28 init];
  v12 = (VUITVApplicationController *)v11;
  if (v11)
  {
    *(_WORD *)(v11 + 41) = 0;
    v13 = (void *)*((void *)v11 + 4);
    *((void *)v11 + 4) = 0;

    objc_storeStrong((id *)&v12->_window, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    uint64_t v14 = [v8 copy];
    context = v12->_context;
    v12->_context = (VUITVApplicationControllerContext *)v14;

    uint64_t v16 = [(VUITVApplicationController *)v12 _rootViewController];
    appRootViewController = v12->_appRootViewController;
    v12->_appRootViewController = (VUITVAppRootViewController *)v16;

    window = v12->_window;
    if (window)
    {
      [(UIWindow *)window vui_setRootViewController:v12->_appRootViewController];
      [(UIWindow *)v12->_window vui_makeKeyAndVisible];
    }
    v19 = [[_VUICoreApplication alloc] initWithLaunchContext:v12->_context];
    application = v12->_application;
    v12->_application = v19;

    v21 = v12->_application;
    v22 = objc_opt_class();
    v23 = [(VUITVApplicationControllerContext *)v12->_context launchOptions];
    v24 = [v22 _jsLaunchOptionsWithApplicationOptions:v23];
    [(_VUICoreApplication *)v21 setJavaScriptLaunchOptions:v24];

    [(_VUICoreApplication *)v12->_application setKeyWindow:v9];
    v25 = [(VUITVApplicationControllerContext *)v12->_context launchOptions];
    v26 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4FB26A8]];

    if (v26) {
      v12->_doLaunchOpenURLHandling = 1;
    }
    [(VUITVApplicationController *)v12 _launchApp];
    [(VUITVApplicationController *)v12 registerForApplicationNotifications];
  }

  return v12;
}

- (void)registerForApplicationNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__applicationDidBecomeActiveNotification_ name:*MEMORY[0x1E4FB3D70] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__applicationDidEnterBackgroundNotification_ name:*MEMORY[0x1E4FB3D78] object:0];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__applicationWillResignActiveNotification_ name:*MEMORY[0x1E4FB3D88] object:0];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__applicationWillTerminateNotification_ name:*MEMORY[0x1E4FB3D90] object:0];

  self->_interfaceOrientation = [(id)*MEMORY[0x1E4FB2608] statusBarOrientation];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__statusBarOrientationDidChange_ name:*MEMORY[0x1E4FB2638] object:0];
}

- (id)_rootViewController
{
  id v3 = [(VUITVApplicationController *)self delegate];
  if (!v3
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v3 rootViewControllerForAppController:self],
        (v4 = (_VUITVAppNavigationController *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = objc_alloc_init(_VUITVAppNavigationController);
  }

  return v4;
}

- (void)_launchApp
{
  if (!self->_appContext)
  {
    id v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUITVApplicationController - _launchApp", v8, 2u);
    }

    v4 = [(VUITVApplicationControllerContext *)self->_context javaScriptApplicationURL];
    uint64_t v5 = [v4 isFileURL];

    uint64_t v6 = [[VUIAppContext alloc] initWithApplication:self->_application mode:v5 delegate:self];
    appContext = self->_appContext;
    self->_appContext = v6;

    [(VUIAppContext *)self->_appContext start];
  }
}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v5 = a4;
  uint64_t v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "VUITVApplicationController - evaluateAppJavaScriptInContext", v8, 2u);
  }

  id v7 = [(VUITVApplicationController *)self delegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 appController:self evaluateAppJavaScriptInContext:v5];
  }
}

- (VUITVApplicationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUITVApplicationControllerDelegate *)WeakRetained;
}

- (void)applicationDidResume:(id)a3
{
  BOOL suspended = self->_suspended;
  self->_BOOL suspended = 0;
  if (suspended)
  {
    id v8 = self->_openURLResumeOptions;
    openURLResumeOptions = self->_openURLResumeOptions;
    self->_openURLResumeOptions = 0;

    if ([(VUITVApplicationController *)self _shouldReloadOnResume])
    {
      uint64_t v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      openURLReloadOptions = self->_openURLReloadOptions;
      self->_openURLReloadOptions = v6;

      [(VUITVApplicationController *)self appContext:self->_appContext needsReloadWithUrgency:0 options:0];
    }
    else
    {
      [(VUIAppContext *)self->_appContext resumeWithOptions:v8];
    }
  }
}

- (VUITVApplicationController)init
{
  return 0;
}

- (void)dealloc
{
  [(VUITVApplicationController *)self stop];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUITVApplicationController;
  [(VUITVApplicationController *)&v4 dealloc];
}

- (void)stop
{
  [(VUIAppContext *)self->_appContext stop];
  appContext = self->_appContext;
  self->_appContext = 0;
}

- (BOOL)openURL:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_23;
  }
  id v8 = objc_opt_new();
  id v9 = [v6 absoluteString];
  [v8 setObject:v9 forKeyedSubscript:@"openURL"];

  id v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB26A0]];

  uint64_t v11 = *MEMORY[0x1E4FB26E8];
  v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB26E8]];
  v13 = v12;
  if (v10) {
    goto LABEL_5;
  }

  if (v13)
  {
    v13 = [v7 objectForKeyedSubscript:v11];
LABEL_5:
    [v8 setObject:v13 forKeyedSubscript:@"sourceAppIdentifier"];
  }
  if ([(VUIAppContext *)self->_appContext isValid])
  {
    if (!self->_doLaunchOpenURLHandling)
    {
      uint64_t v14 = [(VUITVApplicationController *)self delegate];
      if (v14
        && (objc_opt_respondsToSelector() & 1) != 0
        && ![v14 appController:self shouldDisplayShroudForURL:v6 withOptions:v7])
      {
        objc_super v28 = +[VUIAppLoadingView loadingScreen];
        [v28 setTimeout:20.0];

        v29 = +[VUIAppLoadingView loadingScreen];
        [v29 setLoadingDelay:2.0];

        v15 = +[VUIAppLoadingView loadingScreen];
        [v15 showOverKeyWindowWithSpinnerOnly:0];
      }
      else
      {
        v15 = +[VUIStorePlaybackLaunchShroud sharedShroud];
        [v15 setHidden:0 animated:1 withCompletionHandler:0];
      }

      uint64_t v16 = [(VUITVApplicationController *)self _currentNavigationController];
      v17 = [v16 presentedViewController];

      if (v17) {
        [v16 dismissViewControllerAnimated:1 completion:0];
      }
      v18 = [(VUITVApplicationController *)self rootViewController];
      v19 = [v18 presentedViewController];

      if (v19)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v20 = (id)[v19 popToRootViewControllerAnimated:0];
        }
        v21 = [(VUITVApplicationController *)self rootViewController];
        [v21 dismissViewControllerAnimated:0 completion:0];
      }
      id v22 = (id)[v16 popToRootViewControllerAnimated:0];
      v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v23 removeObserver:self name:@"VUITVAppNavigationDidDisplayViewControllerNotification" object:0];

      v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v24 addObserver:self selector:sel__openURLControllerDidDisplay_ name:@"VUITVAppNavigationDidDisplayViewControllerNotification" object:0];
    }
    self->_doLaunchOpenURLHandling = 0;
  }
  else if (self->_doLaunchOpenURLHandling)
  {
    v25 = (NSDictionary *)[v8 copy];
    launchOpenURLOptions = self->_launchOpenURLOptions;
    self->_launchOpenURLOptions = v25;
  }
LABEL_23:

  return v6 != 0;
}

- (void)evaluateInJavaScriptContext:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void))a4;
  appContext = self->_appContext;
  if (appContext)
  {
    [(VUIAppContext *)appContext evaluate:v8 completionBlock:v6 completionQueue:0];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  if (self->_popViewControllerOnBackground)
  {
    objc_super v4 = [(VUITVAppRootViewController *)self->_appRootViewController vuiNavigationController];
    id v5 = (id)[v4 popViewControllerAnimated:0];

    self->_popViewControllerOnBackground = 0;
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
  int64_t v4 = objc_msgSend((id)*MEMORY[0x1E4FB2608], "statusBarOrientation", a3);
  if (v4 != self->_interfaceOrientation) {
    self->_interfaceOrientation = v4;
  }
}

- (void)appContext:(id)a3 didFailWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = (VUIAppContext *)a3;
  id v7 = a4;
  if (self->_appContext == v6)
  {
    self->_appContext = 0;

    id v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "VUITVApplicationController - App Context Failed with Error: %@", (uint8_t *)&v11, 0xCu);
    }

    id v9 = [(VUITVApplicationController *)self delegate];
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB3E18] code:3 userInfo:0];
      [v9 appController:self didFailWithError:v10];
    }
  }
}

- (void)appContext:(id)a3 didStopWithOptions:(id)a4
{
  id v6 = (VUIAppContext *)a3;
  id v7 = a4;
  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "VUITVApplicationController - App Context didStopWithOptions", v10, 2u);
  }

  if (!self->_reloadInProgress)
  {
    id v9 = [(VUITVApplicationController *)self delegate];
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v9 appController:self didStopWithOptions:v7];
    }
    if (self->_appContext == v6)
    {
      self->_appContext = 0;
    }
  }
}

- (void)reload
{
  self->_reloadOnResume = 1;
  [(VUITVApplicationController *)self appContext:self->_appContext needsReloadWithUrgency:0 options:0];
}

- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!+[VUIUtilities isInFullscreenOrPipPlayback])
  {
    if (a4 == 1)
    {
      self->_reloadOnResume = 1;
      id v10 = [v9 objectForKeyedSubscript:@"VUIAppReloadUrgencyMinSuspensionTime"];
      [v10 doubleValue];
      self->_reloadOnResumeMinInterval = v11;

      if (self->_reloadOnResumeMinInterval > 0.0)
      {
        id v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v12 floatForKey:@"override-minSuspensionTime"];
        float v14 = v13;

        if (v14 > 0.0)
        {
          v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          [v15 floatForKey:@"override-minSuspensionTime"];
          self->_reloadOnResumeMinInterval = v16;
        }
      }
    }
    else
    {
      if (self->_reloadOnResume)
      {
        if (!self->_reloadOnResumeBackgroundedDate || self->_reloadOnResumeMinInterval <= 0.0) {
          goto LABEL_11;
        }
        if (![(VUITVApplicationController *)self _hasReloadOnResumeMinIntervalPassed])goto LABEL_20; {
        if (self->_reloadOnResume)
        }
        {
LABEL_11:
          v17 = +[VUIAppLoadingView loadingScreen];
          [v17 setTimeout:60.0];

          v18 = +[VUIAppLoadingView loadingScreen];
          [v18 showOverKeyWindowWithSpinnerOnly:0];

          v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v19 removeObserver:self name:@"VUITVAppNavigationDidDisplayViewControllerNotification" object:0];

          id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v20 addObserver:self selector:sel__reloadControllerDidDisplay_ name:@"VUITVAppNavigationDidDisplayViewControllerNotification" object:0];
        }
      }
      self->_reloadOnResume = 0;
      reloadOnResumeBackgroundedDate = self->_reloadOnResumeBackgroundedDate;
      self->_reloadOnResumeMinInterval = 0.0;
      self->_reloadOnResumeBackgroundedDate = 0;

      if (!self->_reloadInProgress)
      {
        objc_initWeak(&location, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __72__VUITVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke;
        aBlock[3] = &unk_1E6DF5490;
        objc_copyWeak(&v30, &location);
        id v29 = v8;
        id v22 = (void (**)(void))_Block_copy(aBlock);
        v23 = [(VUITVApplicationController *)self _currentNavigationController];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v24 = v23;
        }
        else {
          v24 = 0;
        }
        id v25 = v24;
        if (v25)
        {
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __72__VUITVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke_64;
          v26[3] = &unk_1E6DF3DD0;
          v27 = v22;
          [v25 dismissAllModals:v26];
        }
        else
        {
          v22[2](v22);
        }

        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
      }
    }
  }
LABEL_20:
}

void __72__VUITVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained _rootViewController];
    id v5 = (void *)*((void *)v3 + 11);
    *((void *)v3 + 11) = v4;

    objc_msgSend(*((id *)v3 + 13), "vui_setRootViewController:", *((void *)v3 + 11));
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    id v7 = [*((id *)v3 + 2) javaScriptLaunchOptions];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v9 = [*((id *)v3 + 2) javaScriptLaunchOptions];
      [v6 addEntriesFromDictionary:v9];

      [v6 removeObjectForKey:@"openURL"];
    }
    if ([*((id *)v3 + 4) count])
    {
      id v10 = [*((id *)v3 + 4) objectForKey:@"openURL"];
      [v6 setObject:v10 forKeyedSubscript:@"openURL"];
    }
    [v6 setObject:@"reload" forKeyedSubscript:@"launchContext"];
    [*((id *)v3 + 2) setJavaScriptLaunchOptions:v6];
    *((unsigned char *)v3 + 41) = 1;
    double v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUITVApplicationController - reload js application", v12, 2u);
    }

    [*(id *)(a1 + 32) reload];
  }
}

uint64_t __72__VUITVApplicationController_appContext_needsReloadWithUrgency_options___block_invoke_64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)rootViewController
{
  return self->_appRootViewController;
}

- (id)appRootViewController
{
  return self->_appRootViewController;
}

- (void)applicationWillSuspend:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3);
  uint64_t v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  reloadOnResumeBackgroundedDate = self->_reloadOnResumeBackgroundedDate;
  self->_reloadOnResumeBackgroundedDate = v4;

  appContext = self->_appContext;
  if (appContext)
  {
    [(VUIAppContext *)appContext suspendWithOptions:0];
    self->_BOOL suspended = 1;
  }
}

- (id)_currentNavigationController
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(VUITVAppRootViewController *)self->_appRootViewController currentNavigationController];
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB19E8]);
  }
  return v3;
}

- (void)_openURLOnAppLaunchControllerDidDisplay:(id)a3
{
}

- (void)_openURLControllerDidDisplay:(id)a3
{
}

- (void)_openURLControllerHandler:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VUITVApplicationController *)self _currentNavigationController];
  id v6 = [v5 viewControllers];
  unint64_t v7 = [v6 count];

  if (v7 < 2)
  {
    if (!v3) {
      return;
    }
    id v9 = +[VUIAppLoadingView loadingScreen];
    [v9 hide];
  }
  else
  {
    if (v3)
    {
      uint64_t v8 = +[VUIAppLoadingView loadingScreen];
      [v8 hide];
    }
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:self name:@"VUITVAppNavigationDidDisplayViewControllerNotification" object:0];
  }
}

- (void)_reloadControllerDidDisplay:(id)a3
{
  uint64_t v4 = +[VUIAppLoadingView loadingScreen];
  [v4 hide];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"VUITVAppNavigationDidDisplayViewControllerNotification" object:0];
}

- (BOOL)_shouldReloadOnResume
{
  if (self->_reloadOnResume && self->_reloadOnResumeBackgroundedDate && self->_reloadOnResumeMinInterval > 0.0) {
    return [(VUITVApplicationController *)self _hasReloadOnResumeMinIntervalPassed];
  }
  else {
    return self->_reloadOnResume;
  }
}

- (BOOL)_hasReloadOnResumeMinIntervalPassed
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  reloadOnResumeBackgroundedDate = self->_reloadOnResumeBackgroundedDate;
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v7 = [v4 components:128 fromDate:reloadOnResumeBackgroundedDate toDate:v6 options:0];

  LOBYTE(self) = self->_reloadOnResumeMinInterval <= (double)[v7 second];
  return (char)self;
}

- (void)setKeyTraitEnvironment:(id)a3
{
  p_keyTraitEnvironment = &self->_keyTraitEnvironment;
  id v5 = a3;
  objc_storeWeak((id *)p_keyTraitEnvironment, v5);
  [(_VUICoreApplication *)self->_application setKeyTraitEnvironment:v5];
}

- (UIWindow)window
{
  return self->_window;
}

- (VUITVApplicationControllerContext)context
{
  return self->_context;
}

- (UITraitEnvironment)keyTraitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyTraitEnvironment);
  return (UITraitEnvironment *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyTraitEnvironment);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_appRootViewController, 0);
  objc_storeStrong((id *)&self->_launchOpenURLOptions, 0);
  objc_storeStrong((id *)&self->_reloadOnResumeBackgroundedDate, 0);
  objc_storeStrong((id *)&self->_openURLReloadOptions, 0);
  objc_storeStrong((id *)&self->_openURLResumeOptions, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
}

@end