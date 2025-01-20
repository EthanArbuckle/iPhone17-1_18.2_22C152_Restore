@interface TVStoreApplicationDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)overrideOrientation;
- (BOOL)shouldBeForcedLeftToRight;
- (BOOL)supportsIdleModeVisualEffects;
- (IKURLBagCache)bagCache;
- (TVApplicationController)appController;
- (TVStoreApplicationDelegate)init;
- (UIWindow)window;
- (id)_bagBootURL;
- (id)appLocalBootURL;
- (id)bagBootURLKey;
- (id)bootURL;
- (id)cachedBagPath;
- (id)offlineJSURL;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (void)_controllerDidDisplay:(id)a3;
- (void)_launchApp;
- (void)_loadWithBootURL:(id)a3;
- (void)_presetDialogWithError:(int64_t)a3 appController:(id)a4;
- (void)appController:(id)a3 didFailWithError:(id)a4;
- (void)applicationDidEnterBackground:(id)a3;
- (void)dealloc;
- (void)reload;
- (void)setOverrideOrientation:(BOOL)a3;
- (void)setWindow:(id)a3;
- (void)updateIdleModeVisualEffectsStatus:(BOOL)a3;
@end

@implementation TVStoreApplicationDelegate

- (TVStoreApplicationDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)TVStoreApplicationDelegate;
  return [(TVStoreApplicationDelegate *)&v3 init];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVStoreApplicationDelegate;
  [(TVStoreApplicationDelegate *)&v4 dealloc];
}

- (id)bagBootURLKey
{
  if ([MEMORY[0x263F4B3C8] isInFactoryMode]) {
    v2 = 0;
  }
  else {
    v2 = @"itml-app-url";
  }
  return v2;
}

- (id)_bagBootURL
{
  objc_super v3 = [(TVStoreApplicationDelegate *)self bagBootURLKey];
  if (v3)
  {
    objc_super v4 = NSURL;
    v5 = NSString;
    v6 = [(TVStoreApplicationDelegate *)self bagBootURLKey];
    v7 = [v5 stringWithFormat:@"com.apple.TVMLKit.bagBootURLKey://%@", v6];
    v8 = [v4 URLWithString:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)cachedBagPath
{
  return 0;
}

- (id)bootURL
{
  return 0;
}

- (id)appLocalBootURL
{
  return 0;
}

- (id)offlineJSURL
{
  return 0;
}

- (void)reload
{
  id v2 = [(TVStoreApplicationDelegate *)self appController];
  [v2 reload];
}

- (BOOL)supportsIdleModeVisualEffects
{
  return 1;
}

- (void)updateIdleModeVisualEffectsStatus:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TVStoreApplicationDelegate *)self supportsIdleModeVisualEffects])
  {
    v5 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
      -[TVStoreApplicationDelegate updateIdleModeVisualEffectsStatus:](v3, v5);
    }
    objc_msgSend((id)*MEMORY[0x263F1D020], "_setIdleModeVisualEffectsEnabled:", -[TVStoreApplicationDelegate supportsIdleModeVisualEffects](self, "supportsIdleModeVisualEffects") & v3);
  }
}

- (BOOL)shouldBeForcedLeftToRight
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v3 = [v2 bundleIdentifier];

  if ([v3 isEqualToString:@"com.apple.TVShows"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.TVMovies"];
  }

  return v4;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = TVMLKitSignpostLogObject;
  if (os_signpost_enabled((os_log_t)TVMLKitSignpostLogObject))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_230B4C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TVApplicationControllerSetup", (const char *)&unk_230C3F5C6, v25, 2u);
  }
  if ([(TVStoreApplicationDelegate *)self shouldBeForcedLeftToRight]) {
    [(id)*MEMORY[0x263F1D020] _setForcedUserInterfaceLayoutDirection:0];
  }
  v9 = [MEMORY[0x263F4B4B8] sharedCache];
  bagCache = self->_bagCache;
  self->_bagCache = v9;

  id v11 = objc_alloc(MEMORY[0x263F1CBC8]);
  v12 = [MEMORY[0x263F1C920] mainScreen];
  [v12 bounds];
  v13 = (UIWindow *)objc_msgSend(v11, "initWithFrame:");
  window = self->_window;
  self->_window = v13;

  v15 = self->_window;
  v16 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
  [(UIWindow *)v15 setTintColor:v16];

  v17 = self->_window;
  v18 = [MEMORY[0x263F1C550] whiteColor];
  [(UIWindow *)v17 setBackgroundColor:v18];

  v19 = (NSDictionary *)[v7 copy];
  launchOptions = self->_launchOptions;
  self->_launchOptions = v19;

  v21 = +[_TVAppLoadingView loadingScreen];
  [v21 setTimeout:60.0];

  v22 = +[_TVAppLoadingView loadingScreen];
  [v22 showOverKeyWindowWithSpinnerOnly:0];

  v23 = [MEMORY[0x263F08A00] defaultCenter];
  [v23 addObserver:self selector:sel__controllerDidDisplay_ name:@"TVAppNavigationDidDisplayViewControllerNotification" object:0];

  [(TVStoreApplicationDelegate *)self _launchApp];
  return 1;
}

- (void)_launchApp
{
  id v8 = [(TVStoreApplicationDelegate *)self bootURL];
  if ([MEMORY[0x263F4B3C8] isInFactoryMode])
  {
    id v3 = v8;
    if (v8) {
      goto LABEL_6;
    }
    char v4 = NSURL;
    v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v8 = [v5 objectForKey:@"boot-url"];
    uint64_t v6 = objc_msgSend(v4, "URLWithString:");
  }
  else
  {
    v5 = [(TVStoreApplicationDelegate *)self _bagBootURL];
    uint64_t v6 = +[TVStoreApplicationSetupHelper bootURLWithBagBootURL:v5 defaultBootURL:v8];
  }
  uint64_t v7 = v6;

  id v3 = (id)v7;
LABEL_6:
  id v9 = v3;
  [(TVStoreApplicationDelegate *)self _loadWithBootURL:v3];
}

- (void)applicationDidEnterBackground:(id)a3
{
  if (self->_shouldTerminateOnEnterBackground)
  {
    objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 terminateWithSuccess];
  }
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(TVStoreApplicationDelegate *)self appController];

  if (v10)
  {
    launchOpenURLOptions = [(TVStoreApplicationDelegate *)self appController];
    char v12 = [launchOpenURLOptions openURL:v8 options:v9];
  }
  else
  {
    if (!v8)
    {
      char v12 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&self->_launchOpenURL, a4);
    v13 = (NSDictionary *)v9;
    launchOpenURLOptions = self->_launchOpenURLOptions;
    self->_launchOpenURLOptions = v13;
    char v12 = 1;
  }

LABEL_6:
  return v12;
}

- (void)appController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  -[TVStoreApplicationDelegate _presetDialogWithError:appController:](self, "_presetDialogWithError:appController:", [a4 code], v6);
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  v5 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3, a4);
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1) {
    return 30;
  }
  if (TVShouldConstrainToPortait()
    && ![(TVStoreApplicationDelegate *)self overrideOrientation])
  {
    return 2;
  }
  return 26;
}

- (void)_loadWithBootURL:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  uint64_t v5 = [(TVStoreApplicationDelegate *)self bagBootURLKey];
  unint64_t v6 = v4 | v5;

  if (v6)
  {
    id v8 = [(TVStoreApplicationDelegate *)self _bagBootURL];
    if ([(id)v4 isEqual:v8])
    {
      id v9 = [(TVStoreApplicationDelegate *)self bagBootURLKey];
    }
    else
    {
      id v9 = 0;
    }

    if (v9) {
      v10 = 0;
    }
    else {
      v10 = (void *)v4;
    }
    id v11 = v10;

    [(TVStoreApplicationDelegate *)self setupWithBootURL:v11];
    char v12 = 0;
    if (objc_opt_respondsToSelector())
    {
      char v12 = [(TVStoreApplicationDelegate *)self offlineJSURL];
    }
    v13 = [(TVStoreApplicationDelegate *)self appLocalBootURL];
    v14 = +[TVStoreApplicationSetupHelper launchContextWithLaunchOptions:self->_launchOptions bootURL:v11 bagBootURLKey:v9 useCache:v13 != 0];
    v15 = v14;
    if (v12) {
      [v14 setOfflineJSURL:v12];
    }
    else {
      [v14 setAppLocalJSURL:v13];
    }
    v16 = [[TVApplicationController alloc] initWithContext:v15 window:self->_window delegate:self];
    objc_storeStrong((id *)&self->_appController, v16);
    if (self->_launchOpenURL)
    {
      v17 = [(TVStoreApplicationDelegate *)self appController];
      [v17 openURL:self->_launchOpenURL options:self->_launchOpenURLOptions];

      launchOpenURL = self->_launchOpenURL;
      self->_launchOpenURL = 0;

      launchOpenURLOptions = self->_launchOpenURLOptions;
      self->_launchOpenURLOptions = 0;
    }
  }
  else
  {
    uint64_t v7 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR)) {
      -[TVStoreApplicationDelegate _loadWithBootURL:](v7);
    }
    [(TVStoreApplicationDelegate *)self _presetDialogWithError:3 appController:0];
  }
  v20 = TVMLKitSignpostLogObject;
  if (os_signpost_enabled((os_log_t)TVMLKitSignpostLogObject))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_230B4C000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TVApplicationControllerSetup", (const char *)&unk_230C3F5C6, buf, 2u);
  }
  v21 = TVMLKitSignpostLogObject;
  if (os_signpost_enabled((os_log_t)TVMLKitSignpostLogObject))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_230B4C000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TVApplicationControllerJSEvaluation", (const char *)&unk_230C3F5C6, v22, 2u);
  }
}

- (void)_controllerDidDisplay:(id)a3
{
  unint64_t v4 = +[_TVAppLoadingView loadingScreen];
  [v4 hide];

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"TVAppNavigationDidDisplayViewControllerNotification" object:0];

  [(TVStoreApplicationDelegate *)self didShowViewController];
}

- (void)_presetDialogWithError:(int64_t)a3 appController:(id)a4
{
  v27 = (UIWindow *)a4;
  if (self->_headLess)
  {
    unint64_t v6 = [MEMORY[0x263F1C408] sharedApplication];
    [v6 terminateWithSuccess];
  }
  if (a3 == 2)
  {
    uint64_t v7 = _TVMLLocString(@"TVAppInternetUnavailableTitle", @"Localizable");
    id v8 = _TVMLLocString(@"TVAppInternetUnavailableError", @"Localizable");
  }
  else
  {
    id v9 = [MEMORY[0x263F086E0] mainBundle];
    v10 = [v9 localizedInfoDictionary];
    id v11 = [v10 objectForKey:@"CFBundleName"];

    if (!v11)
    {
      char v12 = [MEMORY[0x263F086E0] mainBundle];
      v13 = [v12 infoDictionary];
      id v11 = [v13 objectForKey:@"CFBundleName"];
    }
    v14 = NSString;
    v15 = _TVMLLocString(@"TVInternalAppFailureTitle", @"Localizable");
    uint64_t v7 = objc_msgSend(v14, "stringWithFormat:", v15, v11);

    id v8 = _TVMLLocString(@"TVInternalAppFailureBody", @"Localizable");
  }
  v16 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
  v17 = (void *)MEMORY[0x263F1C3F0];
  v18 = _TVMLLocString(@"TVAppOK", @"Localizable");
  v19 = [v17 actionWithTitle:v18 style:1 handler:&__block_literal_global_28];

  [v16 addAction:v19];
  self->_shouldTerminateOnEnterBackground = 1;
  v20 = +[_TVAppLoadingView loadingScreen];
  [v20 hide];

  window = self->_window;
  if (v27)
  {
    [(UIWindow *)window makeKeyAndVisible];
    v22 = v27;
  }
  else
  {
    v23 = [(UIWindow *)window rootViewController];

    if (!v23)
    {
      v24 = self->_window;
      v25 = (void *)[objc_alloc(MEMORY[0x263F1CB68]) initWithNibName:0 bundle:0];
      [(UIWindow *)v24 setRootViewController:v25];
    }
    [(UIWindow *)self->_window makeKeyAndVisible];
    v22 = self->_window;
  }
  v26 = [(UIWindow *)v22 rootViewController];
  [v26 presentViewController:v16 animated:1 completion:0];
}

void __67__TVStoreApplicationDelegate__presetDialogWithError_appController___block_invoke()
{
  id v0 = [MEMORY[0x263F1C408] sharedApplication];
  [v0 terminateWithSuccess];
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

- (IKURLBagCache)bagCache
{
  return self->_bagCache;
}

- (BOOL)overrideOrientation
{
  return self->_overrideOrientation;
}

- (void)setOverrideOrientation:(BOOL)a3
{
  self->_overrideOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagCache, 0);
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_launchOpenURLOptions, 0);
  objc_storeStrong((id *)&self->_launchOpenURL, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_setupHelper, 0);
}

- (void)updateIdleModeVisualEffectsStatus:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = @"disabled";
  if (a1) {
    id v2 = @"enabled";
  }
  int v3 = 138412290;
  unint64_t v4 = v2;
  _os_log_debug_impl(&dword_230B4C000, a2, OS_LOG_TYPE_DEBUG, "Idle mode visual effects are %@", (uint8_t *)&v3, 0xCu);
}

- (void)_loadWithBootURL:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_230B4C000, log, OS_LOG_TYPE_ERROR, "Unable to load with empty boot url", v1, 2u);
}

@end