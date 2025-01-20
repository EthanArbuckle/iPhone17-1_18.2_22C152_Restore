@interface _TVMLKitApplication
- (BOOL)appIsPrivileged;
- (BOOL)appIsTrusted;
- (BOOL)headless;
- (BOOL)shouldIgnoreJSValidation;
- (BOOL)supportsPictureInPicturePlayback;
- (IKAppDataStorage)localDataStorage;
- (NSDictionary)javaScriptLaunchOptions;
- (TVAppRootViewController)appRootViewController;
- (TVApplicationControllerContext)launchContext;
- (UITraitEnvironment)keyTraitEnvironment;
- (UIWindow)keyWindow;
- (_TVMLKitApplication)initWithLaunchContext:(id)a3;
- (id)activeDocument;
- (id)appIdentifier;
- (id)appJSCachePath;
- (id)appJSURL;
- (id)appLaunchParams;
- (id)appLocalJSURL;
- (id)appTraitCollection;
- (id)bagBootURLKey;
- (id)offlineJSURL;
- (id)userDefaultsStorage;
- (id)vendorIdentifier;
- (id)vendorStorage;
- (void)setAppRootViewController:(id)a3;
- (void)setHeadless:(BOOL)a3;
- (void)setJavaScriptLaunchOptions:(id)a3;
- (void)setKeyTraitEnvironment:(id)a3;
- (void)setKeyWindow:(id)a3;
- (void)setLaunchContext:(id)a3;
- (void)setLocalDataStorage:(id)a3;
@end

@implementation _TVMLKitApplication

- (_TVMLKitApplication)initWithLaunchContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_TVMLKitApplication;
  v5 = [(_TVMLKitApplication *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_launchContext, v4);
    v6->_headless = 0;
  }

  return v6;
}

- (BOOL)supportsPictureInPicturePlayback
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  char v3 = [WeakRetained supportsPictureInPicturePlayback];

  return v3;
}

- (id)activeDocument
{
  v2 = [(_TVMLKitApplication *)self appRootViewController];
  char v3 = [v2 currentNavigationController];

  if ([v3 conformsToProtocol:&unk_26E5D0C80]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v5 = [v4 activeDocument];

  return v5;
}

- (id)appIdentifier
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  char v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)appJSURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  char v3 = [WeakRetained javaScriptApplicationURL];

  return v3;
}

- (id)appLocalJSURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  char v3 = [WeakRetained appLocalJSURL];

  return v3;
}

- (id)appJSCachePath
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  char v3 = [WeakRetained appJSCachePath];

  return v3;
}

- (id)offlineJSURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  char v3 = [WeakRetained offlineJSURL];

  return v3;
}

- (id)bagBootURLKey
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  char v3 = [WeakRetained bagBootURLKey];

  return v3;
}

- (id)appLaunchParams
{
  char v3 = objc_opt_new();
  id v4 = [(_TVMLKitApplication *)self appJSURL];
  v5 = [v4 absoluteString];

  if (v5) {
    [v3 setObject:v5 forKey:@"location"];
  }
  v6 = [(_TVMLKitApplication *)self bagBootURLKey];
  if (v6) {
    [v3 setObject:v6 forKey:@"bagBootURLKey"];
  }
  v7 = [(_TVMLKitApplication *)self javaScriptLaunchOptions];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [(_TVMLKitApplication *)self javaScriptLaunchOptions];
    [v3 addEntriesFromDictionary:v9];
  }
  if (self->_headless) {
    [v3 setObject:@"background" forKeyedSubscript:@"launchContext"];
  }
  v10 = (void *)[v3 copy];

  return v10;
}

- (BOOL)shouldIgnoreJSValidation
{
  return 1;
}

- (id)vendorIdentifier
{
  return 0;
}

- (id)vendorStorage
{
  return 0;
}

- (id)userDefaultsStorage
{
  return (id)[MEMORY[0x263F4B3F0] sharedUserDefaults];
}

- (BOOL)appIsTrusted
{
  v2 = +[_TVProcessInfo currentProcessInfo];
  char v3 = [v2 hasiTunesAPIEntitlement];

  return v3;
}

- (BOOL)appIsPrivileged
{
  v2 = +[_TVProcessInfo currentProcessInfo];
  char v3 = [v2 hasPrivateEntitlement];

  return v3;
}

- (id)appTraitCollection
{
  v57[12] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(_TVMLKitApplication *)self keyWindow];
  id v4 = (void *)v3;
  BOOL v5 = !self->_headless && v3 == 0;
  v6 = (id *)MEMORY[0x263F1D020];
  if (v5)
  {
    v7 = [(id)*MEMORY[0x263F1D020] delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [*v6 delegate];
      id v4 = [v8 window];
    }
    else
    {
      id v4 = 0;
    }
  }
  if (v4)
  {
    v9 = [v4 traitCollection];
    if (v9) {
      goto LABEL_14;
    }
  }
  v10 = [(_TVMLKitApplication *)self keyTraitEnvironment];

  if (!v10) {
    goto LABEL_35;
  }
  v11 = [(_TVMLKitApplication *)self keyTraitEnvironment];
  v9 = [v11 traitCollection];

  if (v9)
  {
LABEL_14:
    uint64_t v12 = [*v6 userInterfaceLayoutDirection];
    uint64_t v13 = [*v6 statusBarOrientation];
    v56[0] = @"userInterfaceIdiom";
    uint64_t v14 = [v9 userInterfaceIdiom];
    if (UserInterfaceString_onceToken != -1) {
      dispatch_once(&UserInterfaceString_onceToken, &__block_literal_global_3);
    }
    v15 = (void *)UserInterfaceString_userInterfaceStrings;
    v16 = [NSNumber numberWithInteger:v14];
    uint64_t v17 = [v15 objectForKeyedSubscript:v16];
    v18 = (void *)v17;
    if (v17) {
      v19 = (__CFString *)v17;
    }
    else {
      v19 = @"unspecified";
    }
    v20 = v19;

    v57[0] = v20;
    v56[1] = @"screenWidth";
    v21 = NSNumber;
    v54 = [MEMORY[0x263F1C920] mainScreen];
    [v54 bounds];
    v53 = [v21 numberWithDouble:v22];
    v57[1] = v53;
    v56[2] = @"screenHeight";
    v23 = NSNumber;
    v24 = [MEMORY[0x263F1C920] mainScreen];
    [v24 bounds];
    v51 = [v23 numberWithDouble:v25];
    v57[2] = v51;
    v56[3] = @"displayScale";
    v26 = NSNumber;
    [v9 displayScale];
    uint64_t v27 = objc_msgSend(v26, "numberWithDouble:");
    v28 = @"ltr";
    if (v12 == 1) {
      v28 = @"rtl";
    }
    v50 = (void *)v27;
    v57[3] = v27;
    v57[4] = v28;
    v56[4] = @"layoutDirection";
    v56[5] = @"horizontalSizeClass";
    v49 = v28;
    v29 = SizeClassString([v9 horizontalSizeClass]);
    v57[5] = v29;
    v56[6] = @"verticalSizeClass";
    v30 = SizeClassString([v9 verticalSizeClass]);
    v57[6] = v30;
    v56[7] = @"preferredContentSizeCategory";
    id v31 = [v9 preferredContentSizeCategory];
    v32 = v31;
    v55 = v20;
    v52 = v24;
    if ((id)*MEMORY[0x263F1D178] == v31)
    {
      v33 = @"extraSmall";
    }
    else if ((id)*MEMORY[0x263F1D198] == v31)
    {
      v33 = @"small";
    }
    else if ((id)*MEMORY[0x263F1D188] == v31)
    {
      v33 = @"medium";
    }
    else if ((id)*MEMORY[0x263F1D180] == v31)
    {
      v33 = @"large";
    }
    else if ((id)*MEMORY[0x263F1D170] == v31)
    {
      v33 = @"extraLarge";
    }
    else if ((id)*MEMORY[0x263F1D168] == v31)
    {
      v33 = @"extraExtraLarge";
    }
    else if ((id)*MEMORY[0x263F1D160] == v31)
    {
      v33 = @"extraExtraExtraLarge";
    }
    else if ((id)*MEMORY[0x263F1D150] == v31)
    {
      v33 = @"accessibilityMedium";
    }
    else if ((id)*MEMORY[0x263F1D148] == v31)
    {
      v33 = @"accessibilityLarge";
    }
    else if ((id)*MEMORY[0x263F1D140] == v31)
    {
      v33 = @"accessibilityExtraLarge";
    }
    else if ((id)*MEMORY[0x263F1D138] == v31)
    {
      v33 = @"accessibilityExtraExtraLarge";
    }
    else if ((id)*MEMORY[0x263F1D130] == v31)
    {
      v33 = @"accessibilityExtraExtraExtraLarge";
    }
    else
    {
      v33 = @"unspecified";
    }

    v57[7] = v33;
    v56[8] = @"windowWidth";
    v35 = NSNumber;
    v36 = v33;
    [v4 size];
    v37 = objc_msgSend(v35, "numberWithDouble:");
    v57[8] = v37;
    v56[9] = @"windowHeight";
    v38 = NSNumber;
    [v4 size];
    uint64_t v40 = [v38 numberWithDouble:v39];
    v41 = (void *)v40;
    v42 = @"landscape";
    if ((unint64_t)(v13 - 3) >= 2) {
      v42 = @"unspecified";
    }
    if ((unint64_t)(v13 - 1) < 2) {
      v42 = @"portrait";
    }
    v57[9] = v40;
    v57[10] = v42;
    v56[10] = @"orientation";
    v56[11] = @"forceTouchCapable";
    v43 = v42;
    uint64_t v44 = [v9 forceTouchCapability];
    v45 = @"false";
    if (v44 == 2) {
      v45 = @"true";
    }
    v57[11] = v45;
    v34 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:12];
  }
  else
  {
LABEL_35:
    v34 = 0;
  }
  if (v34) {
    v46 = v34;
  }
  else {
    v46 = (void *)MEMORY[0x263EFFA78];
  }
  id v47 = v46;

  return v47;
}

- (TVApplicationControllerContext)launchContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  return (TVApplicationControllerContext *)WeakRetained;
}

- (void)setLaunchContext:(id)a3
{
}

- (IKAppDataStorage)localDataStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDataStorage);
  return (IKAppDataStorage *)WeakRetained;
}

- (void)setLocalDataStorage:(id)a3
{
}

- (TVAppRootViewController)appRootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appRootViewController);
  return (TVAppRootViewController *)WeakRetained;
}

- (void)setAppRootViewController:(id)a3
{
}

- (UIWindow)keyWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setKeyWindow:(id)a3
{
}

- (UITraitEnvironment)keyTraitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyTraitEnvironment);
  return (UITraitEnvironment *)WeakRetained;
}

- (void)setKeyTraitEnvironment:(id)a3
{
}

- (NSDictionary)javaScriptLaunchOptions
{
  return self->_javaScriptLaunchOptions;
}

- (void)setJavaScriptLaunchOptions:(id)a3
{
}

- (BOOL)headless
{
  return self->_headless;
}

- (void)setHeadless:(BOOL)a3
{
  self->_headless = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_javaScriptLaunchOptions, 0);
  objc_destroyWeak((id *)&self->_keyTraitEnvironment);
  objc_destroyWeak((id *)&self->_keyWindow);
  objc_destroyWeak((id *)&self->_appRootViewController);
  objc_destroyWeak((id *)&self->_localDataStorage);
  objc_destroyWeak((id *)&self->_launchContext);
}

@end