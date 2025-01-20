@interface TVAppDelegate
+ (void)hideAppLoadingView;
+ (void)showAppLoadingViewWithTimeout:(double)a3;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)shouldTerminateOnEnterBackground;
- (TVAppDelegate)init;
- (TVApplicationController)appController;
- (UIWindow)window;
- (id)_launchContext;
- (id)launchOptionsWithDefaultOptions:(id)a3;
- (void)_controllerDidDisplay:(id)a3;
- (void)_presetDialogWithError:(int64_t)a3 appController:(id)a4;
- (void)_runScrollMoveTest:(id)a3;
- (void)_successTest:(id)a3 callback:(id)a4;
- (void)appController:(id)a3 didFailWithError:(id)a4;
- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)applicationDidEnterBackground:(id)a3;
- (void)dealloc;
- (void)setAppController:(id)a3;
- (void)setShouldTerminateOnEnterBackground:(BOOL)a3;
- (void)setWindow:(id)a3;
@end

@implementation TVAppDelegate

- (TVAppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)TVAppDelegate;
  return [(TVAppDelegate *)&v3 init];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVAppDelegate;
  [(TVAppDelegate *)&v4 dealloc];
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x263F1CBC8]);
  v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 bounds];
  v8 = (UIWindow *)objc_msgSend(v6, "initWithFrame:");
  window = self->_window;
  self->_window = v8;

  [(UIWindow *)self->_window makeKeyWindow];
  v10 = [(TVAppDelegate *)self _launchContext];
  v11 = [(TVAppDelegate *)self launchOptionsWithDefaultOptions:v5];
  if (v11)
  {
    v12 = [(TVAppDelegate *)self launchOptionsWithDefaultOptions:v5];
    v13 = (void *)[v12 mutableCopy];
  }
  else
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
  }

  v14 = (void *)[v13 copy];
  [v10 setLaunchOptions:v14];

  v15 = [[TVApplicationController alloc] initWithContext:v10 window:self->_window delegate:self];
  objc_storeStrong((id *)&self->_appController, v15);
  v16 = [(TVApplicationController *)self->_appController _currentNavigationController];
  v17 = [v16 viewControllers];
  uint64_t v18 = [v17 count];

  if (!v18)
  {
    v19 = +[_TVAppLoadingView loadingScreen];
    [v19 setTimeout:60.0];

    v20 = +[_TVAppLoadingView loadingScreen];
    [v20 showOverKeyWindowWithSpinnerOnly:0];

    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:self selector:sel__controllerDidDisplay_ name:@"TVAppNavigationDidDisplayViewControllerNotification" object:0];
  }
  return 1;
}

- (void)applicationDidEnterBackground:(id)a3
{
  if ([(TVAppDelegate *)self shouldTerminateOnEnterBackground])
  {
    id v3 = [MEMORY[0x263F1C408] sharedApplication];
    [v3 terminateWithSuccess];
  }
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(TVAppDelegate *)self appController];
  char v10 = [v9 openURL:v8 options:v7];

  return v10;
}

- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__TVAppDelegate_appController_evaluateAppJavaScriptInContext___block_invoke;
  v12[3] = &unk_264BA7398;
  objc_copyWeak(&v13, &location);
  id v8 = (void *)MEMORY[0x230FC9DC0](v12);
  [v7 setObject:v8 forKeyedSubscript:@"ppt_scrollMoveTest"];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__TVAppDelegate_appController_evaluateAppJavaScriptInContext___block_invoke_2;
  v10[3] = &unk_264BA73C0;
  objc_copyWeak(&v11, &location);
  v9 = (void *)MEMORY[0x230FC9DC0](v10);
  [v7 setObject:v9 forKeyedSubscript:@"ppt_successTest"];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __62__TVAppDelegate_appController_evaluateAppJavaScriptInContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _runScrollMoveTest:v3];
}

void __62__TVAppDelegate_appController_evaluateAppJavaScriptInContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_super v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _successTest:v6 callback:v5];
}

- (void)appController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  -[TVAppDelegate _presetDialogWithError:appController:](self, "_presetDialogWithError:appController:", [a4 code], v6);
}

- (id)launchOptionsWithDefaultOptions:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (void)showAppLoadingViewWithTimeout:(double)a3
{
  objc_super v4 = +[_TVAppLoadingView loadingScreen];
  [v4 setTimeout:a3];

  id v5 = +[_TVAppLoadingView loadingScreen];
  [v5 showOverKeyWindowWithSpinnerOnly:0];
}

+ (void)hideAppLoadingView
{
  id v2 = +[_TVAppLoadingView loadingScreen];
  [v2 hide];
}

- (void)_runScrollMoveTest:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F4B3C8] currentAppContext];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  uint64_t v25 = 0;
  id v6 = [v4 objectForKeyedSubscript:@"heading"];
  if ([v6 isEqualToString:@"down"]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }

  uint64_t v25 = v7;
  uint64_t v8 = [v4 objectForKeyedSubscript:@"testName"];
  v9 = (void *)v8;
  char v10 = @"subTest";
  if (v8) {
    char v10 = (__CFString *)v8;
  }
  id v11 = v10;

  v12 = [v4 objectForKeyedSubscript:@"iterations"];
  if (v12)
  {
    id v13 = [v4 objectForKeyedSubscript:@"iterations"];
    int v14 = [v13 intValue];
  }
  else
  {
    int v14 = 1;
  }

  v15 = [v4 objectForKeyedSubscript:@"offset"];
  if (v15)
  {
    v16 = [v4 objectForKeyedSubscript:@"offset"];
    int v17 = [v16 intValue];
  }
  else
  {
    int v17 = 20;
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __36__TVAppDelegate__runScrollMoveTest___block_invoke;
  v19[3] = &unk_264BA7410;
  v19[4] = self;
  v21 = v24;
  uint64_t v18 = v11;
  v20 = v18;
  int v22 = v14;
  int v23 = v17;
  [v5 evaluateDelegateBlockSync:v19];

  _Block_object_dispose(v24, 8);
}

void __36__TVAppDelegate__runScrollMoveTest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appController];
  id v3 = [v2 navigationController];
  id v4 = [v3 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = [v5 templateViewController];
  id v27 = 0;
  uint64_t v7 = FindTestableViewForElement(v6, &v27);
  if (!v7)
  {
    uint64_t v8 = [v6 view];
    uint64_t v7 = FindTestableViewForElement(v8, &v27);
  }
  id v9 = v27;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = [v9 isEqualToString:@"vertical"];
    uint64_t v11 = 1;
    if (v10) {
      uint64_t v11 = 2;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
  }
  v12 = FindScrollViewFromView(v7);
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    [v12 contentSize];
    if (v14 == 2) {
      double v15 = v16;
    }
    int v17 = (int)fmin(v15, 5000.0);
    uint64_t v18 = [MEMORY[0x263F1C408] sharedApplication];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __36__TVAppDelegate__runScrollMoveTest___block_invoke_2;
    v21[3] = &unk_264BA73E8;
    id v22 = v13;
    id v19 = *(id *)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 56);
    int v26 = v17;
    uint64_t v20 = *(void *)(a1 + 48);
    id v23 = v19;
    uint64_t v24 = v20;
    [v18 installCACommitCompletionBlock:v21];
  }
}

uint64_t __36__TVAppDelegate__runScrollMoveTest___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performScrollTest:*(void *)(a1 + 40) iterations:*(unsigned int *)(a1 + 56) delta:*(unsigned int *)(a1 + 60) length:*(unsigned int *)(a1 + 64) scrollAxis:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
}

- (void)_successTest:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F4B3C8] currentAppContext];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"testName"];
  int v10 = (void *)v9;
  uint64_t v11 = @"subTest";
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  v12 = v11;

  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __39__TVAppDelegate__successTest_callback___block_invoke;
  v19[3] = &unk_264BA7460;
  id v13 = v12;
  uint64_t v20 = v13;
  objc_copyWeak(&v23, &location);
  id v14 = v8;
  id v21 = v14;
  id v15 = v7;
  id v22 = v15;
  [v14 evaluateDelegateBlockSync:v19];
  if (v15)
  {
    double v16 = [v14 jsContext];
    int v17 = [v16 objectForKeyedSubscript:@"App"];
    uint64_t v18 = [v16 virtualMachine];
    [v18 addManagedReference:v15 withOwner:v17];
  }
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

void __39__TVAppDelegate__successTest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F1C408] sharedApplication];
  [v4 startedTest:*(void *)(a1 + 32)];

  id v5 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__TVAppDelegate__successTest_callback___block_invoke_2;
  v7[3] = &unk_264BA7438;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  [v5 finishedTest:v6 extraResults:0 withTeardownBlock:v7];

  objc_destroyWeak(&v10);
}

void __39__TVAppDelegate__successTest_callback___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __39__TVAppDelegate__successTest_callback___block_invoke_3;
    v4[3] = &unk_264BA68F0;
    id v3 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    [v3 evaluate:v4 completionBlock:0];
  }
}

void __39__TVAppDelegate__successTest_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = a2;
    id v5 = (id)[v2 callWithArguments:0];
    id v7 = [v4 objectForKeyedSubscript:@"App"];
    uint64_t v6 = [v4 virtualMachine];

    [v6 removeManagedReference:*(void *)(a1 + 32) withOwner:v7];
  }
}

- (id)_launchContext
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(TVApplicationControllerContext);
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v3 infoDictionary];

  id v5 = [v4 objectForKey:@"TVBootURL"];
  if ([v5 length]
    && ([NSURL URLWithString:v5], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v9 = [v8 stringForKey:@"boot-url"];

    if ([v9 length])
    {
      id v10 = TVMLKitLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v9;
        _os_log_impl(&dword_230B4C000, v10, OS_LOG_TYPE_DEFAULT, "Overriding the boot-url to: %@", (uint8_t *)&v13, 0xCu);
      }
      uint64_t v11 = [NSURL URLWithString:v9];

      id v7 = (void *)v11;
    }
    [(TVApplicationControllerContext *)v2 setJavaScriptApplicationURL:v7];
  }
  else
  {
    id v9 = v5;
  }

  return v2;
}

- (void)_controllerDidDisplay:(id)a3
{
  id v4 = +[_TVAppLoadingView loadingScreen];
  [v4 hide];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"TVAppNavigationDidDisplayViewControllerNotification" object:0];
}

- (void)_presetDialogWithError:(int64_t)a3 appController:(id)a4
{
  int v26 = (UIWindow *)a4;
  if (self->_headLess)
  {
    uint64_t v6 = [MEMORY[0x263F1C408] sharedApplication];
    [v6 terminateWithSuccess];
  }
  if (a3 == 2)
  {
    id v7 = _TVMLLocString(@"TVAppInternetUnavailableTitle", @"Localizable");
    id v8 = _TVMLLocString(@"TVAppInternetUnavailableError", @"Localizable");
  }
  else
  {
    id v9 = [MEMORY[0x263F086E0] mainBundle];
    id v10 = [v9 localizedInfoDictionary];
    uint64_t v11 = [v10 objectForKey:@"CFBundleName"];

    if (!v11)
    {
      v12 = [MEMORY[0x263F086E0] mainBundle];
      int v13 = [v12 infoDictionary];
      uint64_t v11 = [v13 objectForKey:@"CFBundleName"];
    }
    if ((unint64_t)[v11 length] >= 0x15)
    {
      id v14 = NSString;
      uint64_t v15 = [v11 substringToIndex:20];
      uint64_t v16 = [v14 stringWithFormat:@"%@...", v15];

      uint64_t v11 = (void *)v16;
    }
    int v17 = NSString;
    uint64_t v18 = _TVMLLocString(@"TVExternalAppFailureTitle", @"Localizable");
    id v7 = objc_msgSend(v17, "stringWithFormat:", v18, v11);

    id v8 = _TVMLLocString(@"TVExternalAppFailureBody", @"Localizable");
  }
  id v19 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
  uint64_t v20 = (void *)MEMORY[0x263F1C3F0];
  id v21 = _TVMLLocString(@"TVAppOK", @"Localizable");
  id v22 = [v20 actionWithTitle:v21 style:1 handler:&__block_literal_global_20];

  [v19 addAction:v22];
  [(TVAppDelegate *)self setShouldTerminateOnEnterBackground:1];
  id v23 = +[_TVAppLoadingView loadingScreen];
  [v23 hide];

  [(UIWindow *)self->_window makeKeyAndVisible];
  window = v26;
  if (!v26) {
    window = self->_window;
  }
  uint64_t v25 = [(UIWindow *)window rootViewController];
  [v25 presentViewController:v19 animated:1 completion:0];
}

void __54__TVAppDelegate__presetDialogWithError_appController___block_invoke()
{
  id v3 = objc_alloc_init(MEMORY[0x263F1CB48]);
  v0 = [MEMORY[0x263F1C408] sharedApplication];
  v1 = [v0 _mainScene];
  id v2 = [MEMORY[0x263EFFA08] setWithObject:v3];
  [v1 sendActions:v2];
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (TVApplicationController)appController
{
  return self->_appController;
}

- (void)setAppController:(id)a3
{
}

- (BOOL)shouldTerminateOnEnterBackground
{
  return self->_shouldTerminateOnEnterBackground;
}

- (void)setShouldTerminateOnEnterBackground:(BOOL)a3
{
  self->_shouldTerminateOnEnterBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end