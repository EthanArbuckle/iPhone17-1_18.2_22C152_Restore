@interface _VUICoreApplication
- (BOOL)shouldIgnoreJSValidation;
- (NSDictionary)javaScriptLaunchOptions;
- (UITraitEnvironment)keyTraitEnvironment;
- (UIWindow)keyWindow;
- (VUITVApplicationControllerContext)launchContext;
- (_VUICoreApplication)initWithLaunchContext:(id)a3;
- (id)appIdentifier;
- (id)appJSURL;
- (id)appLaunchParams;
- (id)appTraitCollection;
- (id)userDefaultsStorage;
- (void)setJavaScriptLaunchOptions:(id)a3;
- (void)setKeyTraitEnvironment:(id)a3;
- (void)setKeyWindow:(id)a3;
@end

@implementation _VUICoreApplication

- (id)appTraitCollection
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v3 = [(_VUICoreApplication *)self keyWindow];
  if (v3) {
    goto LABEL_10;
  }
  v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  v5 = [v4 connectedScenes];
  v6 = [v5 allObjects];
  v7 = [v6 firstObject];

  if (!v7) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v7 keyWindow];
  }
  else
  {
LABEL_5:
    v8 = (id *)MEMORY[0x1E4FB2608];
    v9 = [(id)*MEMORY[0x1E4FB2608] delegate];
    if (objc_opt_respondsToSelector())
    {
      v10 = [*v8 delegate];
      v3 = [v10 window];
    }
    else
    {
      v3 = 0;
    }
  }
  if (v3)
  {
LABEL_10:
    v11 = [v3 traitCollection];
  }
  else
  {
    v11 = 0;
  }
  v12 = [(_VUICoreApplication *)self keyTraitEnvironment];
  v13 = v12;
  if (!v11 && v12)
  {
    v11 = [v12 traitCollection];
  }
  if (v11)
  {
    v58[0] = @"userInterfaceIdiom";
    uint64_t v14 = [v11 userInterfaceIdiom];
    if (UserInterfaceString_onceToken != -1) {
      dispatch_once(&UserInterfaceString_onceToken, &__block_literal_global_335);
    }
    v15 = (void *)UserInterfaceString_userInterfaceStrings;
    v16 = [MEMORY[0x1E4F28ED0] numberWithInteger:v14];
    uint64_t v17 = [v15 objectForKeyedSubscript:v16];
    v18 = (void *)v17;
    if (v17) {
      v19 = (__CFString *)v17;
    }
    else {
      v19 = @"unspecified";
    }
    v20 = v19;

    v59[0] = v20;
    v58[1] = @"screenWidth";
    v21 = (void *)MEMORY[0x1E4F28ED0];
    v55 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v55 bounds];
    v54 = [v21 numberWithDouble:v22];
    v59[1] = v54;
    v58[2] = @"screenHeight";
    v23 = (void *)MEMORY[0x1E4F28ED0];
    v53 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v53 bounds];
    v52 = [v23 numberWithDouble:v24];
    v59[2] = v52;
    v58[3] = @"displayScale";
    v25 = (void *)MEMORY[0x1E4F28ED0];
    [v11 displayScale];
    v51 = objc_msgSend(v25, "numberWithDouble:");
    v59[3] = v51;
    v58[4] = @"layoutDirection";
    v26 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v27 = [v26 userInterfaceLayoutDirection];

    v28 = @"ltr";
    if (v27 == 1) {
      v28 = @"rtl";
    }
    v59[4] = v28;
    v58[5] = @"horizontalSizeClass";
    v29 = v28;
    uint64_t v60 = SizeClassString([v11 horizontalSizeClass]);
    v58[6] = @"verticalSizeClass";
    v30 = SizeClassString([v11 verticalSizeClass]);
    v61 = v30;
    v58[7] = @"preferredContentSizeCategory";
    id v31 = [v11 preferredContentSizeCategory];
    v32 = v31;
    v56 = v20;
    v57 = v13;
    if ((id)*MEMORY[0x1E4FB27C8] == v31)
    {
      v33 = v29;
      v34 = @"extraSmall";
    }
    else if ((id)*MEMORY[0x1E4FB27E8] == v31)
    {
      v33 = v29;
      v34 = @"small";
    }
    else if ((id)*MEMORY[0x1E4FB27D8] == v31)
    {
      v33 = v29;
      v34 = @"medium";
    }
    else if ((id)*MEMORY[0x1E4FB27D0] == v31)
    {
      v33 = v29;
      v34 = @"large";
    }
    else if ((id)*MEMORY[0x1E4FB27C0] == v31)
    {
      v33 = v29;
      v34 = @"extraLarge";
    }
    else if ((id)*MEMORY[0x1E4FB27B8] == v31)
    {
      v33 = v29;
      v34 = @"extraExtraLarge";
    }
    else if ((id)*MEMORY[0x1E4FB27B0] == v31)
    {
      v33 = v29;
      v34 = @"extraExtraExtraLarge";
    }
    else if ((id)*MEMORY[0x1E4FB2798] == v31)
    {
      v33 = v29;
      v34 = @"accessibilityMedium";
    }
    else if ((id)*MEMORY[0x1E4FB2790] == v31)
    {
      v33 = v29;
      v34 = @"accessibilityLarge";
    }
    else
    {
      v33 = v29;
      if ((id)*MEMORY[0x1E4FB2788] == v31)
      {
        v34 = @"accessibilityExtraLarge";
      }
      else if ((id)*MEMORY[0x1E4FB2780] == v31)
      {
        v34 = @"accessibilityExtraExtraLarge";
      }
      else if ((id)*MEMORY[0x1E4FB2778] == v31)
      {
        v34 = @"accessibilityExtraExtraExtraLarge";
      }
      else
      {
        v34 = @"unspecified";
      }
    }

    v62 = v34;
    v58[8] = @"windowWidth";
    v36 = (void *)MEMORY[0x1E4F28ED0];
    v37 = v34;
    [v3 bounds];
    v39 = [v36 numberWithDouble:v38];
    v63 = v39;
    v58[9] = @"windowHeight";
    v40 = (void *)MEMORY[0x1E4F28ED0];
    [v3 bounds];
    v42 = [v40 numberWithDouble:v41];
    v64 = v42;
    v58[10] = @"orientation";
    uint64_t v43 = [(id)*MEMORY[0x1E4FB2608] statusBarOrientation];
    if ((unint64_t)(v43 - 3) >= 2) {
      v44 = @"unspecified";
    }
    else {
      v44 = @"landscape";
    }
    if ((unint64_t)(v43 - 1) >= 2) {
      v45 = v44;
    }
    else {
      v45 = @"portrait";
    }
    v65 = v45;
    v58[11] = @"forceTouchCapable";
    v46 = v45;
    uint64_t v47 = [v11 forceTouchCapability];
    v48 = @"false";
    if (v47 == 2) {
      v48 = @"true";
    }
    v66 = v48;
    v35 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v59, v58, 12, v60);

    v13 = v57;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (UIWindow)keyWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyWindow);
  return (UIWindow *)WeakRetained;
}

- (UITraitEnvironment)keyTraitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyTraitEnvironment);
  return (UITraitEnvironment *)WeakRetained;
}

- (id)appLaunchParams
{
  v3 = objc_opt_new();
  v4 = [(_VUICoreApplication *)self appJSURL];
  v5 = [v4 absoluteString];

  if (v5) {
    [v3 setObject:v5 forKey:@"location"];
  }
  v6 = [(_VUICoreApplication *)self javaScriptLaunchOptions];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [(_VUICoreApplication *)self javaScriptLaunchOptions];
    [v3 addEntriesFromDictionary:v8];
  }
  v9 = (void *)[v3 copy];

  return v9;
}

- (NSDictionary)javaScriptLaunchOptions
{
  return self->_javaScriptLaunchOptions;
}

- (id)appJSURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  v3 = [WeakRetained javaScriptApplicationURL];

  return v3;
}

- (void)setKeyWindow:(id)a3
{
}

- (void)setJavaScriptLaunchOptions:(id)a3
{
}

- (_VUICoreApplication)initWithLaunchContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_VUICoreApplication;
  v5 = [(_VUICoreApplication *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_launchContext, v4);
  }

  return v6;
}

- (id)appIdentifier
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)userDefaultsStorage
{
  return +[VUIAppUserDefaults sharedUserDefaults];
}

- (BOOL)shouldIgnoreJSValidation
{
  return 1;
}

- (VUITVApplicationControllerContext)launchContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchContext);
  return (VUITVApplicationControllerContext *)WeakRetained;
}

- (void)setKeyTraitEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyTraitEnvironment);
  objc_destroyWeak((id *)&self->_keyWindow);
  objc_storeStrong((id *)&self->_javaScriptLaunchOptions, 0);
  objc_destroyWeak((id *)&self->_launchContext);
}

@end