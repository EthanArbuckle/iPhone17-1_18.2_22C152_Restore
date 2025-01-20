@interface SPUISpotlightRemoteViewController
+ (unint64_t)spotlightSupportedInterfaceOrientations;
- (BOOL)_canShowWhileLocked;
- (BOOL)crashedWhileForeground;
- (BOOL)prewarmSceneInTheBackground;
- (BOOL)setSceneFrameOnRotation;
- (CGRect)sceneSettingsFrameFromRect:(CGRect)a3;
- (CGSize)initialFittingSize;
- (FBApplicationUpdateScenesTransaction)transaction;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBScene)scene;
- (NSMutableArray)sceneEventsQueue;
- (NSString)sceneIdentifier;
- (SPUISpotlightRemoteViewController)initWithSceneIdentifier:(id)a3;
- (UIScenePresentation)hostView;
- (UIScenePresenter)presenter;
- (_UILegibilitySettings)legibilitySettings;
- (id)sceneSpecification;
- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4;
- (id)watchdogTerminationRequestForProcess:(id)a3 error:(id)a4;
- (int64_t)currentOrientation;
- (void)addOrExecuteEventAsNeeded:(id)a3;
- (void)clearEventQueue;
- (void)createSceneIfNeededWithPriority:(int64_t)a3;
- (void)createSceneWithPriority:(int64_t)a3;
- (void)didInvalidateSceneWhenForeground;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)setCrashedWhileForeground:(BOOL)a3;
- (void)setCurrentOrientation:(int64_t)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setForeground:(BOOL)a3;
- (void)setHostView:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setScene:(id)a3;
- (void)setSceneEventsQueue:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setTransaction:(id)a3;
- (void)transaction:(id)a3 didCreateScene:(id)a4;
- (void)updateSafeAreasOnSettings:(id)a3;
- (void)updateSceneToOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)updateTraitCollection;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willLaunchSpotlightInBackground;
@end

@implementation SPUISpotlightRemoteViewController

- (NSString)sceneIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1000, 1);
}

+ (unint64_t)spotlightSupportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v2 userInterfaceIdiom]) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (SPUISpotlightRemoteViewController)initWithSceneIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SPUISpotlightRemoteViewController;
  v5 = [(SPUISpotlightRemoteViewController *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(SPUISpotlightRemoteViewController *)v5 setSceneIdentifier:v4];
    v7 = [MEMORY[0x263F1CCD0] sharedInstanceForStyle:1];
    [(SPUISpotlightRemoteViewController *)v6 setLegibilitySettings:v7];

    v8 = objc_opt_new();
    [(SPUISpotlightRemoteViewController *)v6 setSceneEventsQueue:v8];

    id v9 = +[SPUISpotlightSceneManager sharedManager];
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v6 selector:sel_updateTraitCollection name:*MEMORY[0x263F1D890] object:0];

    if ([(SPUISpotlightRemoteViewController *)v6 prewarmSceneInTheBackground])
    {
      v11 = +[SPUISpotlightSceneManager sharedManager];
      [v11 setDelegate:v6];
    }
  }

  return v6;
}

- (void)willLaunchSpotlightInBackground
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SPUISpotlightRemoteViewController_willLaunchSpotlightInBackground__block_invoke;
  block[3] = &unk_264702B08;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__SPUISpotlightRemoteViewController_willLaunchSpotlightInBackground__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) createSceneIfNeededWithPriority:2];
}

- (void)updateTraitCollection
{
  unint64_t v3 = [(SPUISpotlightRemoteViewController *)self scene];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__SPUISpotlightRemoteViewController_updateTraitCollection__block_invoke;
  v4[3] = &unk_264702D08;
  v4[4] = self;
  [v3 updateSettingsWithBlock:v4];
}

void __58__SPUISpotlightRemoteViewController_updateTraitCollection__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 isUISubclass])
  {
    unint64_t v3 = *(void **)(a1 + 32);
    id v4 = v8;
    v5 = [v3 view];
    v6 = objc_msgSend(v5, "tlks_screen");
    v7 = [v6 traitCollection];
    objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
  }
}

- (int64_t)currentOrientation
{
  if ([(id)objc_opt_class() spotlightSupportedInterfaceOrientations] == 2)
  {
    int64_t result = 1;
    self->_currentOrientation = 1;
  }
  else
  {
    int64_t result = self->_currentOrientation;
    if (!result)
    {
      id v4 = SBUIGetUserAgent();
      self->_currentOrientation = [v4 activeInterfaceOrientation];

      return self->_currentOrientation;
    }
  }
  return result;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SPUISpotlightRemoteViewController;
  [(SPUISpotlightRemoteViewController *)&v7 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  v5 = [(SPUISpotlightRemoteViewController *)self scene];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__SPUISpotlightRemoteViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke;
  v6[3] = &unk_264702D08;
  v6[4] = self;
  [v5 updateSettingsWithBlock:v6];
}

uint64_t __81__SPUISpotlightRemoteViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateSafeAreasOnSettings:a2];
}

- (void)updateSafeAreasOnSettings:(id)a3
{
  id v4 = a3;
  v5 = [(SPUISpotlightRemoteViewController *)self view];
  v6 = [v5 window];
  objc_super v7 = [v6 _scene];
  id v8 = [v7 settings];

  id v10 = v4;
  if ([v8 isUISubclass])
  {
    if ([v10 isUISubclass])
    {
      [v8 safeAreaInsetsPortrait];
      objc_msgSend(v10, "setSafeAreaInsetsPortrait:");
      [v8 peripheryInsets];
      if (v9 > 0.0)
      {
        UIEdgeInsetsRotate();
        objc_msgSend(v10, "setSafeAreaInsetsLandscapeLeft:");
        UIEdgeInsetsRotate();
        objc_msgSend(v10, "setSafeAreaInsetsLandscapeRight:");
      }
    }
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  v6 = [(SPUISpotlightRemoteViewController *)self scene];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__SPUISpotlightRemoteViewController_setLegibilitySettings___block_invoke;
  v8[3] = &unk_264702D08;
  id v9 = v5;
  id v7 = v5;
  [v6 updateSettingsWithBlock:v8];
}

void __59__SPUISpotlightRemoteViewController_setLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setLegibilitySettings:*(void *)(a1 + 32)];
  }
}

- (void)createSceneWithPriority:(int64_t)a3
{
  id v5 = +[SPUISpotlightSceneManager sharedManager];
  [v5 launchSpotlightIfNeededWithForegroundPriority:1];

  v6 = [(SPUISpotlightRemoteViewController *)self transaction];

  id v7 = qword_26AB56270;
  if (v6)
  {
    if (!qword_26AB56270)
    {
      SPUIInitLogging();
      id v7 = qword_26AB56270;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SPUISpotlightRemoteViewController createSceneWithPriority:](v7, self);
    }
  }
  else
  {
    if (!qword_26AB56270)
    {
      SPUIInitLogging();
      id v7 = qword_26AB56270;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_224D5D000, v7, OS_LOG_TYPE_DEFAULT, "Spotlight is running the frontboard transaction", (uint8_t *)&buf, 2u);
    }
    id v8 = qword_26AB56278;
    if (!qword_26AB56278)
    {
      SPUIInitLogging();
      id v8 = qword_26AB56278;
    }
    id v9 = (char *)os_signpost_id_generate(v8);
    id v10 = (void *)qword_26AB56278;
    if (!qword_26AB56278)
    {
      SPUIInitLogging();
      id v10 = (void *)qword_26AB56278;
    }
    v11 = v10;
    v12 = v11;
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_224D5D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "sceneTransactionInterval", (const char *)&unk_224D68EE7, (uint8_t *)&buf, 2u);
    }

    id v13 = objc_alloc(MEMORY[0x263F3F428]);
    v14 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:@"com.apple.Spotlight"];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke;
    v45[3] = &unk_264702D30;
    v45[4] = self;
    v45[5] = a3;
    v15 = (void *)[v13 initWithProcessIdentity:v14 executionContextProvider:v45];
    [(SPUISpotlightRemoteViewController *)self setTransaction:v15];

    objc_initWeak(&buf, self);
    v16 = [(SPUISpotlightRemoteViewController *)self transaction];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_2;
    v42[3] = &unk_264702D80;
    objc_copyWeak(v43, &buf);
    v43[1] = (id)a3;
    v43[2] = v9;
    [v16 setCompletionBlock:v42];

    v17 = [(SPUISpotlightRemoteViewController *)self sceneSpecification];
    id v18 = objc_alloc_init((Class)[v17 settingsClass]);
    v19 = (void *)[v18 mutableCopy];

    v20 = [(SPUISpotlightRemoteViewController *)self displayConfiguration];
    [v19 setDisplayConfiguration:v20];

    v21 = [(SPUISpotlightRemoteViewController *)self view];
    v22 = objc_msgSend(v21, "tlks_screen");
    v23 = [v22 traitCollection];
    objc_msgSend(v19, "setUserInterfaceStyle:", objc_msgSend(v23, "userInterfaceStyle"));

    [v19 setForeground:a3 == 4];
    -[SPUISpotlightRemoteViewController sceneSettingsFrameFromRect:](self, "sceneSettingsFrameFromRect:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    objc_msgSend(v19, "setFrame:");
    [v19 setDeviceOrientationEventsEnabled:0];
    objc_msgSend(v19, "setInterfaceOrientation:", -[SPUISpotlightRemoteViewController currentOrientation](self, "currentOrientation"));
    v24 = [v19 ignoreOcclusionReasons];
    [v24 addObject:@"SPUIRemoteSearchIgnoreOcclusionsReason"];

    [v19 setForcedStatusBarForegroundTransparent:1];
    [v19 setInterruptionPolicy:3];
    v25 = [(SPUISpotlightRemoteViewController *)self sceneIdentifier];
    [v19 setPersistenceIdentifier:v25];

    v26 = [(SPUISpotlightRemoteViewController *)self legibilitySettings];
    [v19 setLegibilitySettings:v26];

    if (+[SPUIDefaults enableFloatingWindow]) {
      [v19 setEnhancedWindowingEnabled:1];
    }
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_19;
    v40[3] = &unk_264702DA8;
    id v27 = v19;
    id v41 = v27;
    v28 = (void (**)(void, void))MEMORY[0x22A622110](v40);
    v28[2](v28, 1);
    v28[2](v28, 2);
    v28[2](v28, 4);
    v28[2](v28, 3);
    id v29 = objc_alloc_init((Class)[v17 clientSettingsClass]);
    v30 = (void *)[v29 mutableCopy];

    [v30 setStatusBarAlpha:1.0];
    [v30 setStatusBarHidden:0];
    [v30 setBackgroundStyle:4];
    v31 = [MEMORY[0x263F3F490] parametersForSpecification:v17];
    [v31 setSettings:v27];
    [v31 setClientSettings:v30];
    v32 = [(SPUISpotlightRemoteViewController *)self transaction];
    v33 = (void *)MEMORY[0x263F3F4D0];
    v34 = [(SPUISpotlightRemoteViewController *)self sceneIdentifier];
    v35 = [v33 identityForIdentifier:v34 workspaceIdentifier:@"com.apple.Spotlight"];
    id v36 = objc_alloc_init((Class)[v17 transitionContextClass]);
    [v32 updateSceneWithIdentity:v35 parameters:v31 transitionContext:v36];

    v37 = [(SPUISpotlightRemoteViewController *)self transaction];
    [v37 addObserver:self];

    v38 = [(SPUISpotlightRemoteViewController *)self transaction];
    [v38 begin];

    v39 = [(SPUISpotlightRemoteViewController *)self transaction];
    [v39 setWaitsForSceneCommits:1];

    objc_destroyWeak(v43);
    objc_destroyWeak(&buf);
  }
}

id __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  [v2 setWatchdogProvider:*(void *)(a1 + 32)];
  [v2 setLaunchIntent:*(void *)(a1 + 40)];
  return v2;
}

void __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setTransaction:0];
  id v5 = qword_26AB56270;
  if (a2)
  {
    if (!qword_26AB56270)
    {
      SPUIInitLogging();
      id v5 = qword_26AB56270;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_224D5D000, v5, OS_LOG_TYPE_DEFAULT, "Spotlight scene transaction passed", v12, 2u);
    }
  }
  else
  {
    if (!qword_26AB56270)
    {
      SPUIInitLogging();
      id v5 = qword_26AB56270;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_2_cold_1(v5);
    }
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_16;
    block[3] = &unk_264702D58;
    uint64_t v7 = *(void *)(a1 + 40);
    block[4] = WeakRetained;
    void block[5] = v7;
    dispatch_after(v6, MEMORY[0x263EF83A0], block);
  }
  id v8 = (void *)qword_26AB56278;
  if (!qword_26AB56278)
  {
    SPUIInitLogging();
    id v8 = (void *)qword_26AB56278;
  }
  id v9 = v8;
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_224D5D000, v10, OS_SIGNPOST_INTERVAL_END, v11, "sceneTransactionInterval", " enableTelemetry=YES ", v12, 2u);
  }
}

uint64_t __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) createSceneWithPriority:*(void *)(a1 + 40)];
}

uint64_t __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_19(uint64_t a1, uint64_t a2)
{
  [(id)*MEMORY[0x263F1D020] statusBarHeightForOrientation:a2 ignoreHidden:1];
  id v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "setDefaultStatusBarHeight:forOrientation:", a2);
}

- (id)sceneSpecification
{
  v2 = objc_opt_new();
  return v2;
}

- (CGSize)initialFittingSize
{
  v2 = [(SPUISpotlightRemoteViewController *)self view];
  id v3 = objc_msgSend(v2, "tlks_screen");
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setDisplayConfiguration:(id)a3
{
  double v5 = (FBSDisplayConfiguration *)a3;
  if (v5 && self->_displayConfiguration != v5)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    self->_delayPresentationTillSceneContentIsReady = 1;
    if ([(FBSDisplayConfiguration *)v5 isExternal]) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 1;
    }
    [(SPUISpotlightRemoteViewController *)self setCurrentOrientation:v6];
    double v7 = [(SPUISpotlightRemoteViewController *)self scene];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __61__SPUISpotlightRemoteViewController_setDisplayConfiguration___block_invoke;
    v8[3] = &unk_264702DD0;
    double v9 = v5;
    id v10 = self;
    [v7 updateSettingsWithBlock:v8];
  }
}

void __61__SPUISpotlightRemoteViewController_setDisplayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setDisplayConfiguration:v3];
  double v4 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v4, "sceneSettingsFrameFromRect:");
  objc_msgSend(v5, "setFrame:");
}

- (FBSDisplayConfiguration)displayConfiguration
{
  displayConfiguration = self->_displayConfiguration;
  if (displayConfiguration)
  {
    uint64_t v3 = displayConfiguration;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F3F430] mainConfiguration];
  }
  return v3;
}

- (void)createSceneIfNeededWithPriority:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SPUISpotlightRemoteViewController *)self scene];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [(SPUISpotlightRemoteViewController *)self scene],
        double v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isValid],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    double v9 = qword_26AB56270;
    if (!qword_26AB56270)
    {
      SPUIInitLogging();
      double v9 = qword_26AB56270;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      os_signpost_id_t v11 = [(SPUISpotlightRemoteViewController *)self scene];
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl(&dword_224D5D000, v10, OS_LOG_TYPE_DEFAULT, "Current scene %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    [(SPUISpotlightRemoteViewController *)self createSceneWithPriority:a3];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SPUISpotlightRemoteViewController *)self createSceneIfNeededWithPriority:4];
  v5.receiver = self;
  v5.super_class = (Class)SPUISpotlightRemoteViewController;
  [(SPUISpotlightRemoteViewController *)&v5 viewWillAppear:v3];
  [(SPUISpotlightRemoteViewController *)self setForeground:1];
}

- (void)setForeground:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v5 = [(SPUISpotlightRemoteViewController *)self hostView];
  uint64_t v6 = [v5 presenter];
  double v7 = [v6 presentationContext];
  char v8 = [v7 backgroundColorWhileHosting];

  if (v8)
  {
    double v9 = [(SPUISpotlightRemoteViewController *)self hostView];
    id v10 = [v9 presenter];
    [v10 modifyPresentationContext:&__block_literal_global_2];
  }
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__SPUISpotlightRemoteViewController_setForeground___block_invoke_2;
  v14[3] = &unk_264702E40;
  objc_copyWeak(&v15, &location);
  BOOL v16 = v3;
  [(SPUISpotlightRemoteViewController *)self addOrExecuteEventAsNeeded:v14];
  os_signpost_id_t v11 = @"background";
  if (v3) {
    os_signpost_id_t v11 = @"foreground";
  }
  int v12 = v11;
  id v13 = qword_26AB56270;
  if (!qword_26AB56270)
  {
    SPUIInitLogging();
    id v13 = qword_26AB56270;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    v19 = v12;
    _os_log_impl(&dword_224D5D000, v13, OS_LOG_TYPE_DEFAULT, "Spotlight is getting to the %@", buf, 0xCu);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

uint64_t __51__SPUISpotlightRemoteViewController_setForeground___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBackgroundColorWhileHosting:0];
}

void __51__SPUISpotlightRemoteViewController_setForeground___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = *(unsigned __int8 *)(a1 + 40);
  double v4 = +[SPUISpotlightSceneManager sharedManager];
  objc_super v5 = [WeakRetained scene];
  if (v3) {
    [v4 sceneWillForeground:v5];
  }
  else {
    [v4 sceneWillBackground:v5];
  }

  uint64_t v6 = [WeakRetained scene];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SPUISpotlightRemoteViewController_setForeground___block_invoke_3;
  v7[3] = &unk_264702E18;
  char v8 = *(unsigned char *)(a1 + 40);
  v7[4] = WeakRetained;
  [v6 updateSettingsWithTransitionBlock:v7];
}

uint64_t __51__SPUISpotlightRemoteViewController_setForeground___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setForeground:*(unsigned __int8 *)(a1 + 40)];
  if ([v3 isUISubclass] && *(unsigned char *)(a1 + 40))
  {
    double v4 = [*(id *)(a1 + 32) view];
    objc_super v5 = [v4 window];
    objc_msgSend(*(id *)(a1 + 32), "setCurrentOrientation:", objc_msgSend(v5, "_windowInterfaceOrientation"));

    id v6 = v3;
    objc_msgSend(v6, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 32), "currentOrientation"));
    [*(id *)(a1 + 32) updateSafeAreasOnSettings:v6];
    if (!+[SPUIDefaults enableFloatingWindow]) {
      [v6 setForcedStatusBarStyle:&unk_26D82E030];
    }
  }
  return 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SPUISpotlightRemoteViewController;
  [(SPUISpotlightRemoteViewController *)&v4 viewDidDisappear:a3];
  [(SPUISpotlightRemoteViewController *)self setCrashedWhileForeground:0];
  [(SPUISpotlightRemoteViewController *)self setForeground:0];
  [(SPUISpotlightRemoteViewController *)self clearEventQueue];
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SPUISpotlightRemoteViewController *)self scene];
  [v5 removeObserver:self];

  id v6 = [(SPUISpotlightRemoteViewController *)self transaction];
  [v6 removeObserver:self];

  [(SPUISpotlightRemoteViewController *)self setScene:0];
  [(SPUISpotlightRemoteViewController *)self setPresenter:0];
  double v7 = [(SPUISpotlightRemoteViewController *)self hostView];
  [v7 removeFromSuperview];

  [(SPUISpotlightRemoteViewController *)self setHostView:0];
  char v8 = +[SPUISpotlightSceneManager sharedManager];
  [v8 removeScene:v4];

  double v9 = [v4 settings];
  if ([v9 isForeground]) {
    BOOL v10 = [(SPUISpotlightRemoteViewController *)self _appearState] != 0;
  }
  else {
    BOOL v10 = 0;
  }
  [(SPUISpotlightRemoteViewController *)self setCrashedWhileForeground:v10];

  if ([(SPUISpotlightRemoteViewController *)self crashedWhileForeground])
  {
    os_signpost_id_t v11 = qword_26AB56270;
    if (!qword_26AB56270)
    {
      SPUIInitLogging();
      os_signpost_id_t v11 = qword_26AB56270;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SPUISpotlightRemoteViewController sceneDidInvalidate:]((uint64_t)v4, v11);
    }
    [(SPUISpotlightRemoteViewController *)self createSceneWithPriority:4];
  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  if (self->_delayPresentationTillSceneContentIsReady)
  {
    uint64_t v4 = [a3 contentState];
    if (v4 == 2) {
      self->_delayPresentationTillSceneContentIsReady = 0;
    }
    objc_super v5 = [(SPUISpotlightRemoteViewController *)self hostView];
    id v7 = v5;
    double v6 = 0.0;
    if (v4 == 2) {
      double v6 = 1.0;
    }
    [v5 setAlpha:v6];
  }
}

- (void)transaction:(id)a3 didCreateScene:(id)a4
{
  *(void *)((char *)&v46[1] + 4) = *MEMORY[0x263EF8340];
  id v5 = a4;
  [(SPUISpotlightRemoteViewController *)self setScene:v5];
  double v6 = [(SPUISpotlightRemoteViewController *)self scene];
  [v6 addObserver:self];

  id v7 = +[SPUISpotlightSceneManager sharedManager];
  [v7 addScene:v5];

  char v8 = [(SPUISpotlightRemoteViewController *)self scene];
  double v9 = [v8 uiPresentationManager];

  BOOL v10 = [(SPUISpotlightRemoteViewController *)self sceneIdentifier];
  os_signpost_id_t v11 = [v9 createPresenterWithIdentifier:v10];

  [(SPUISpotlightRemoteViewController *)self setPresenter:v11];
  int v12 = [v11 presentationView];
  [(SPUISpotlightRemoteViewController *)self setHostView:v12];

  [v11 modifyPresentationContext:&__block_literal_global_39];
  [v11 activate];
  id v13 = [(SPUISpotlightRemoteViewController *)self view];
  uint64_t v14 = [(SPUISpotlightRemoteViewController *)self hostView];
  id v15 = [(SPUISpotlightRemoteViewController *)self hostView];
  [v13 addSubview:v15];

  BOOL v16 = [(SPUISpotlightRemoteViewController *)self hostView];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [v14 leadingAnchor];
  id v18 = [v13 leadingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  uint64_t v20 = [v14 trailingAnchor];
  v21 = [v13 trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [v14 topAnchor];
  v24 = [v13 topAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  v26 = [v14 bottomAnchor];
  id v27 = [v13 bottomAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  id v29 = qword_26AB56270;
  if (!qword_26AB56270)
  {
    SPUIInitLogging();
    id v29 = qword_26AB56270;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    v46[0] = v5;
    _os_log_impl(&dword_224D5D000, v29, OS_LOG_TYPE_DEFAULT, "Spotlight created scene %@", buf, 0xCu);
  }
  [(SPUISpotlightRemoteViewController *)self sceneContentStateDidChange:v5];
  if ([(SPUISpotlightRemoteViewController *)self crashedWhileForeground])
  {
    [(SPUISpotlightRemoteViewController *)self didInvalidateSceneWhenForeground];
    [(SPUISpotlightRemoteViewController *)self setCrashedWhileForeground:0];
  }
  else
  {
    v37 = v11;
    v38 = v9;
    id v39 = v5;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v30 = [(SPUISpotlightRemoteViewController *)self sceneEventsQueue];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v41;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v41 != v33) {
            objc_enumerationMutation(v30);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v40 + 1) + 8 * v34) + 16))();
          v35 = qword_26AB56270;
          if (!qword_26AB56270)
          {
            SPUIInitLogging();
            v35 = qword_26AB56270;
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
            [(SPUISpotlightRemoteViewController *)buf transaction:self didCreateScene:v46];
          }
          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = [v30 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v32);
    }

    [(SPUISpotlightRemoteViewController *)self clearEventQueue];
    double v9 = v38;
    id v5 = v39;
    os_signpost_id_t v11 = v37;
  }
  id v36 = [(SPUISpotlightRemoteViewController *)self view];
  [v36 layoutIfNeeded];
}

void __64__SPUISpotlightRemoteViewController_transaction_didCreateScene___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPresentedLayerTypes:26];
  [v2 setAppearanceStyle:2];
  [v2 setClippingDisabled:1];
}

- (void)didInvalidateSceneWhenForeground
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224D5D000, log, OS_LOG_TYPE_ERROR, "Spotlight died in the foreground coming back up", v1, 2u);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)SPUISpotlightRemoteViewController;
  id v7 = a4;
  -[SPUISpotlightRemoteViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  char v8 = [(SPUISpotlightRemoteViewController *)self view];
  double v9 = [v8 window];
  uint64_t v10 = [v9 _toWindowOrientation];

  if (v10) {
    [(SPUISpotlightRemoteViewController *)self setCurrentOrientation:v10];
  }
  else {
    uint64_t v10 = [(SPUISpotlightRemoteViewController *)self currentOrientation];
  }
  [(SPUISpotlightRemoteViewController *)self updateSceneToOrientation:v10 withTransitionCoordinator:v7];
}

- (void)updateSceneToOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = [(SPUISpotlightRemoteViewController *)self scene];
  char v8 = [v7 settings];
  uint64_t v9 = [v8 interfaceOrientation];

  if (v9 != a3)
  {
    uint64_t v10 = [(SPUISpotlightRemoteViewController *)self scene];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __88__SPUISpotlightRemoteViewController_updateSceneToOrientation_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_264702E68;
    id v12 = v6;
    int64_t v13 = a3;
    [v10 updateSettingsWithTransitionBlock:v11];
  }
}

id __88__SPUISpotlightRemoteViewController_updateSceneToOrientation_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263F1C438] transitionContext];
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F3F3D8];
    [v5 transitionDuration];
    id v7 = objc_msgSend(v6, "settingsWithDuration:");
    [v4 setAnimationSettings:v7];

    char v8 = [MEMORY[0x263F1C908] _synchronizedDrawingFence];
    [v4 setAnimationFence:v8];
  }
  [v3 setInterfaceOrientation:*(void *)(a1 + 40)];

  return v4;
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SPUISpotlightRemoteViewController;
  [(SPUISpotlightRemoteViewController *)&v22 viewDidLayoutSubviews];
  id v3 = [(SPUISpotlightRemoteViewController *)self view];
  [v3 bounds];
  -[SPUISpotlightRemoteViewController sceneSettingsFrameFromRect:](self, "sceneSettingsFrameFromRect:");
  id v5 = v4;
  id v7 = v6;
  uint64_t v9 = v8;
  objc_super v11 = v10;

  id v12 = [(SPUISpotlightRemoteViewController *)self scene];
  int64_t v13 = [v12 settings];
  [v13 frame];
  v24.origin.x = v14;
  v24.origin.y = v15;
  v24.size.double width = v16;
  v24.size.double height = v17;
  *(void *)&v23.origin.x = v5;
  *(void *)&v23.origin.y = v7;
  *(void *)&v23.size.double width = v9;
  *(void *)&v23.size.double height = v11;
  BOOL v18 = CGRectEqualToRect(v23, v24);

  if (!v18)
  {
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __58__SPUISpotlightRemoteViewController_viewDidLayoutSubviews__block_invoke;
    v19[3] = &unk_264702EB0;
    objc_copyWeak(v20, &location);
    v20[1] = v5;
    v20[2] = v7;
    v20[3] = v9;
    v20[4] = v11;
    [(SPUISpotlightRemoteViewController *)self addOrExecuteEventAsNeeded:v19];
    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
}

void __58__SPUISpotlightRemoteViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained scene];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SPUISpotlightRemoteViewController_viewDidLayoutSubviews__block_invoke_2;
  v5[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
  long long v4 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v4;
  [v3 updateSettingsWithBlock:v5];
}

uint64_t __58__SPUISpotlightRemoteViewController_viewDidLayoutSubviews__block_invoke_2(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (CGRect)sceneSettingsFrameFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectEqualToRect(a3, *MEMORY[0x263F001A8]))
  {
    [(SPUISpotlightRemoteViewController *)self initialFittingSize];
    double width = v8;
    [(SPUISpotlightRemoteViewController *)self initialFittingSize];
    double height = v9;
  }
  int64_t v10 = [(SPUISpotlightRemoteViewController *)self currentOrientation];
  if ((unint64_t)(v10 - 3) >= 2) {
    double v11 = height;
  }
  else {
    double v11 = width;
  }
  if ((unint64_t)(v10 - 3) >= 2) {
    double v12 = width;
  }
  else {
    double v12 = height;
  }
  double v13 = x;
  double v14 = y;
  result.size.double height = v11;
  result.size.double width = v12;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)addOrExecuteEventAsNeeded:(id)a3
{
  long long v4 = (void (**)(void))a3;
  uint64_t v5 = [(SPUISpotlightRemoteViewController *)self scene];
  if (v5
    && (long long v6 = (void *)v5,
        [(SPUISpotlightRemoteViewController *)self scene],
        long long v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isValid],
        v7,
        v6,
        v8))
  {
    v4[2](v4);
    double v9 = qword_26AB56270;
    if (!qword_26AB56270)
    {
      SPUIInitLogging();
      double v9 = qword_26AB56270;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SPUISpotlightRemoteViewController addOrExecuteEventAsNeeded:](v9, self);
    }
  }
  else
  {
    int64_t v10 = [(SPUISpotlightRemoteViewController *)self sceneEventsQueue];
    double v11 = (void *)MEMORY[0x22A622110](v4);
    [v10 addObject:v11];
  }
}

- (void)clearEventQueue
{
  id v2 = [(SPUISpotlightRemoteViewController *)self sceneEventsQueue];
  [v2 removeAllObjects];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)setSceneFrameOnRotation
{
  return 0;
}

- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a4;
  if ([v4 event] == 1 || objc_msgSend(v4, "event") == 2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    long long v6 = [v4 sceneSettings];
    [v6 isForeground];

    long long v7 = (void *)MEMORY[0x263F3F4A8];
    FBSProcessResourceAllowanceMakeWithRealTimeInterval();
    int v8 = [v7 provisionWithAllowance:v12];
    double v9 = (void *)MEMORY[0x263F3F4B8];
    v13[0] = v8;
    int64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    uint64_t v5 = [v9 policyWithProvisions:v10];
  }
  return v5;
}

- (id)watchdogTerminationRequestForProcess:(id)a3 error:(id)a4
{
  id v4 = [MEMORY[0x263F3F4B0] requestForProcess:a3 withLabel:@"Spotlight is unresponsive"];
  [v4 setExplanation:@"Spotlight is unresponsive"];
  [v4 setReportType:1];
  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (void)setCurrentOrientation:(int64_t)a3
{
  self->_currentOrientation = a3;
}

- (FBScene)scene
{
  return (FBScene *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setScene:(id)a3
{
}

- (FBApplicationUpdateScenesTransaction)transaction
{
  return (FBApplicationUpdateScenesTransaction *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setTransaction:(id)a3
{
}

- (UIScenePresentation)hostView
{
  return (UIScenePresentation *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setHostView:(id)a3
{
}

- (UIScenePresenter)presenter
{
  return (UIScenePresenter *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setPresenter:(id)a3
{
}

- (NSMutableArray)sceneEventsQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setSceneEventsQueue:(id)a3
{
}

- (BOOL)prewarmSceneInTheBackground
{
  return self->_prewarmSceneInTheBackground;
}

- (BOOL)crashedWhileForeground
{
  return self->_crashedWhileForeground;
}

- (void)setCrashedWhileForeground:(BOOL)a3
{
  self->_crashedWhileForeground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneEventsQueue, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

- (void)createSceneWithPriority:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [a2 transaction];
  int v5 = 138412290;
  long long v6 = v4;
  _os_log_error_impl(&dword_224D5D000, v3, OS_LOG_TYPE_ERROR, "Spotlight has an existing transaction in progress %@", (uint8_t *)&v5, 0xCu);
}

void __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224D5D000, log, OS_LOG_TYPE_ERROR, "Spotlight launch failed retrying in 1 second", v1, 2u);
}

- (void)sceneDidInvalidate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224D5D000, a2, OS_LOG_TYPE_ERROR, "Spotlight died in the foreground for scene %@", (uint8_t *)&v2, 0xCu);
}

- (void)transaction:(void *)a3 didCreateScene:(void *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  int v8 = [a3 scene];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_debug_impl(&dword_224D5D000, v7, OS_LOG_TYPE_DEBUG, "Spotlight scene got updated %@", a1, 0xCu);
}

- (void)addOrExecuteEventAsNeeded:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 scene];
  int v5 = 138412290;
  long long v6 = v4;
  _os_log_debug_impl(&dword_224D5D000, v3, OS_LOG_TYPE_DEBUG, "Spotlight scene got updated %@", (uint8_t *)&v5, 0xCu);
}

@end