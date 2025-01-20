@interface PRSceneViewController
+ (NSString)role;
- (BOOL)_depthEffectDisallowed;
- (BOOL)_shouldSceneBeForeground;
- (BOOL)forcesSceneForeground;
- (BOOL)isSceneAvailable;
- (BOOL)isSceneContentReady;
- (BOOL)isSceneUserInteractionEnabled;
- (BOOL)scenePresenterIsValid;
- (CGSize)sceneSize;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBScene)scene;
- (PFServerPosterIdentity)contentsIdentity;
- (PRPosterConfigurableOptions)configurableOptions;
- (PRPosterConfiguredProperties)configuredProperties;
- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4;
- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5;
- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6;
- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 additionalInfo:(id)a7;
- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configuredProperties:(id)a5;
- (UIScenePresenter)scenePresenter;
- (id)_acquireLocalKeyboardFocusAssertion;
- (id)_defaultDisplayConfigurationForScreen:(id)a3;
- (id)_initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 previewing:(BOOL)a7;
- (id)_initWithProvider:(id)a3 contents:(id)a4 previewing:(BOOL)a5;
- (id)_presentationBackgroundColor;
- (id)scene:(id)a3 handleActions:(id)a4;
- (id)userInfo;
- (unint64_t)significantEventsCounter;
- (void)_acquireKeyboardFocusDeferringRuleIfNecessary;
- (void)_addScenePresentationView:(id)a3;
- (void)_adjustParentScene;
- (void)_configureInitialSceneClientSettings:(id)a3;
- (void)_configureInitialSceneSettings:(id)a3;
- (void)_teardown;
- (void)_update;
- (void)_updatePresentationBackgroundColor;
- (void)_updateSceneToSize:(CGSize)a3 orientation:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)invalidate;
- (void)scene:(id)a3 clientDidConnect:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)setConfiguredProperties:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setForcesSceneForeground:(BOOL)a3;
- (void)setScene:(id)a3;
- (void)setSceneAvailable:(BOOL)a3;
- (void)setSceneUserInteractionEnabled:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PRSceneViewController

- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4
{
  return (PRSceneViewController *)[(PRSceneViewController *)self _initWithProvider:a3 contents:a4 configurableOptions:0 configuredProperties:0 previewing:0];
}

- (id)_initWithProvider:(id)a3 contents:(id)a4 previewing:(BOOL)a5
{
  return [(PRSceneViewController *)self _initWithProvider:a3 contents:a4 configurableOptions:0 configuredProperties:0 previewing:a5];
}

- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5
{
  return (PRSceneViewController *)[(PRSceneViewController *)self _initWithProvider:a3 contents:a4 configurableOptions:a5 configuredProperties:0 previewing:0];
}

- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configuredProperties:(id)a5
{
  return (PRSceneViewController *)[(PRSceneViewController *)self _initWithProvider:a3 contents:a4 configurableOptions:0 configuredProperties:a5 previewing:0];
}

- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6
{
  return (PRSceneViewController *)[(PRSceneViewController *)self _initWithProvider:a3 contents:a4 configurableOptions:a5 configuredProperties:a6 previewing:0];
}

- (id)_initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 previewing:(BOOL)a7
{
  BOOL v7 = a7;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v7)
  {
    v19 = @"PRSceneViewControllerAdditionalInfoKeyPreviewing";
    v20[0] = MEMORY[0x1E4F1CC38];
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  }
  else
  {
    v16 = 0;
  }
  v17 = [(PRSceneViewController *)self initWithProvider:v12 contents:v13 configurableOptions:v14 configuredProperties:v15 additionalInfo:v16];

  return v17;
}

- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 additionalInfo:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    v65 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"provider"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:]();
    }
LABEL_57:
    [v65 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C2230D4);
  }
  v18 = v17;
  id v19 = v14;
  NSClassFromString(&cfstr_Pfposterpath.isa);
  if (!v19)
  {
    v66 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:]();
    }
    [v66 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C223138);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v67 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFPosterPathClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:]();
    }
    [v67 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C22319CLL);
  }
  v82 = self;

  uint64_t v20 = objc_opt_class();
  id v21 = v19;
  id obj = a3;
  if (v20)
  {
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }
  id v23 = v22;
  v80 = v21;

  if (v23)
  {
    v24 = [v13 extension];
    v25 = [v24 posterExtensionBundleIdentifier];
    v26 = [v23 identity];
    [v26 provider];
    id v27 = v13;
    v29 = id v28 = v23;
    char v30 = BSEqualStrings();

    id v23 = v28;
    id v13 = v27;

    if ((v30 & 1) == 0)
    {
      v69 = [NSString stringWithFormat:@"provider and path mismatch! provider=%@ path=%@", v27, v23];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:].cold.6();
      }
      [v69 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C223258);
    }
  }
  id v31 = v15;
  if (v31)
  {
    NSClassFromString(&cfstr_Prposterconfig_3.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v70 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurableOptionsClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:].cold.5();
      }
      [v70 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C2232BCLL);
    }
  }

  id v32 = v16;
  if (v32)
  {
    NSClassFromString(&cfstr_Prposterconfig_0.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v65 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:].cold.4();
      }
      goto LABEL_57;
    }
  }

  v79 = [(id)objc_opt_class() role];
  if (!v79)
  {
    v68 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"role != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:]();
    }
    [v68 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C223200);
  }
  v33 = +[PRPosterPathModelObjectCache modelObjectCacheForPath:v23];
  v34 = v33;
  if (!v32)
  {
    v35 = [v33 configuredProperties];
    v36 = v35;
    if (v35)
    {
      id v37 = v35;
    }
    else
    {
      id v37 = +[PRPosterPathUtilities loadConfiguredPropertiesForPath:v23 error:0];
    }
    id v32 = v37;
  }
  v81 = v23;
  v38 = (void *)[v32 mutableCopy];
  v39 = [v32 complicationLayout];
  if (!v39)
  {
    v40 = [v34 complicationLayout];
    v41 = v40;
    if (v40)
    {
      id v42 = v40;
    }
    else
    {
      id v42 = +[PRPosterPathUtilities loadComplicationLayoutForPath:v81 error:0];
    }
    v39 = v42;

    [v38 setComplicationLayout:v39];
  }
  v78 = v31;
  v43 = [v32 renderingConfiguration];
  if (!v43)
  {
    v44 = [v34 renderingConfiguration];
    v45 = v44;
    if (v44)
    {
      id v46 = v44;
    }
    else
    {
      id v46 = +[PRPosterPathUtilities loadRenderingConfigurationForPath:v81 error:0];
    }
    v43 = v46;

    [v38 setRenderingConfiguration:v43];
  }
  v76 = v34;
  v77 = v13;
  v75 = v38;
  v47 = (void *)[v38 copy];
  v48 = [v18 objectForKey:@"PRSceneViewControllerAdditionalInfoKeyPreviewing"];
  char v72 = [v48 BOOLValue];

  v49 = [v18 objectForKey:@"PRSceneViewControllerAdditionalInfoKeySignificantEventsCounter"];
  uint64_t v73 = [v49 unsignedIntegerValue];

  v50 = [v18 objectForKey:@"PRSceneViewControllerAdditionalInfoKeyShowHeaderElements"];
  v51 = [v18 objectForKey:@"PRSceneViewControllerAdditionalInfoKeyShowComplications"];
  v52 = [v18 objectForKey:@"PRSceneViewControllerAdditionalInfoKeyRenderingMode"];
  v53 = [v18 objectForKey:@"PRSceneViewControllerAdditionalInfoKeyCreateSceneInCurrentProcess"];
  v54 = [v18 objectForKey:@"PRSceneViewControllerAdditionalInfoKeyBoundingShape"];
  [v54 integerValue];
  uint64_t v71 = PUIPosterBoundingShapeFromInt();

  v93.receiver = v82;
  v93.super_class = (Class)PRSceneViewController;
  v55 = [(PRSceneViewController *)&v93 initWithNibName:0 bundle:0];
  v56 = v55;
  if (v55)
  {
    objc_storeStrong((id *)&v55->_extensionInstance, obj);
    uint64_t v57 = [v81 identity];
    contentsIdentity = v56->_contentsIdentity;
    v56->_contentsIdentity = (PFServerPosterIdentity *)v57;

    v83 = v47;
    uint64_t v59 = [v47 copy];
    configuredProperties = v56->_configuredProperties;
    v56->_configuredProperties = (PRPosterConfiguredProperties *)v59;

    v56->_sceneUserInteractionEnabled = 1;
    [(PRSceneViewController *)v56 _configureUsingPath:v80];
    if ([v53 BOOLValue]) {
      objc_msgSend(MEMORY[0x1E4F62488], "pr_createPosterSceneWithinCurrentProcessForRole:path:", v79, v80);
    }
    else {
    uint64_t v61 = objc_msgSend(MEMORY[0x1E4F62488], "pr_createPosterSceneWithRole:path:instance:", v79, v80, v77);
    }
    scene = v56->_scene;
    v56->_scene = (FBScene *)v61;

    [(FBScene *)v56->_scene setDelegate:v56];
    v63 = v56->_scene;
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __107__PRSceneViewController_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo___block_invoke;
    v84[3] = &unk_1E54DBCE8;
    id v85 = v52;
    char v92 = v72;
    id v86 = v50;
    id v87 = v51;
    uint64_t v90 = v71;
    id v88 = v78;
    v89 = v56;
    uint64_t v91 = v73;
    [(FBScene *)v63 configureParameters:v84];

    v47 = v83;
  }

  return v56;
}

void __107__PRSceneViewController_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo___block_invoke(uint64_t a1, void *a2)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __107__PRSceneViewController_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo___block_invoke_2;
  v11[3] = &unk_1E54DBCC0;
  id v12 = *(id *)(a1 + 32);
  char v19 = *(unsigned char *)(a1 + 88);
  id v13 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 72);
  id v14 = v4;
  uint64_t v17 = v5;
  id v15 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 80);
  id v16 = v6;
  uint64_t v18 = v7;
  id v8 = a2;
  [v8 updateSettingsWithBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __107__PRSceneViewController_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo___block_invoke_3;
  v9[3] = &unk_1E54DB518;
  id v10 = *(id *)(a1 + 64);
  [v8 updateClientSettingsWithBlock:v9];
}

void __107__PRSceneViewController_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v11 = v3;
  if (v4)
  {
    unsigned int v5 = [v4 unsignedIntValue];
    id v3 = v11;
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = *(unsigned __int8 *)(a1 + 88);
  }
  objc_msgSend(v3, "pui_setContent:", v6);
  uint64_t v7 = *(void **)(a1 + 40);
  if (v7) {
    objc_msgSend(v11, "pui_setShowsHeaderElements:", objc_msgSend(v7, "BOOLValue"));
  }
  id v8 = *(void **)(a1 + 48);
  if (v8) {
    objc_msgSend(v11, "pui_setShowsHeaderElements:", objc_msgSend(v8, "BOOLValue"));
  }
  if (*(void *)(a1 + 72)) {
    objc_msgSend(v11, "pui_setPosterBoundingShape:");
  }
  objc_msgSend(v11, "pr_setPosterConfigurableOptions:", *(void *)(a1 + 56));
  v9 = [*(id *)(*(void *)(a1 + 64) + 1056) titleStyleConfiguration];
  objc_msgSend(v11, "pr_setPosterTitleStyleConfiguration:", v9);

  id v10 = [*(id *)(*(void *)(a1 + 64) + 1056) ambientConfiguration];
  objc_msgSend(v11, "pr_setPosterAmbientConfiguration:", v10);

  if (*(void *)(a1 + 80)) {
    objc_msgSend(v11, "pui_setSignificantEventsCounter:");
  }
  [*(id *)(a1 + 64) _configureInitialSceneSettings:v11];
}

uint64_t __107__PRSceneViewController_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _configureInitialSceneClientSettings:a2];
}

- (void)dealloc
{
  extensionInstance = self->_extensionInstance;
  self->_extensionInstance = 0;

  [(PRSceneViewController *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)PRSceneViewController;
  [(PRSceneViewController *)&v4 dealloc];
}

- (FBScene)scene
{
  return self->_scene;
}

- (PRPosterConfigurableOptions)configurableOptions
{
  v2 = [(FBScene *)self->_scene parameters];
  id v3 = objc_msgSend(v2, "pr_posterConfigurableOptions");

  return (PRPosterConfigurableOptions *)v3;
}

- (void)setConfiguredProperties:(id)a3
{
  id v5 = a3;
  if (![(PRPosterConfiguredProperties *)self->_configuredProperties isEqualToConfiguredProperties:v5])
  {
    objc_storeStrong((id *)&self->_configuredProperties, a3);
    scene = self->_scene;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__PRSceneViewController_setConfiguredProperties___block_invoke;
    v7[3] = &unk_1E54DBD10;
    id v8 = v5;
    [(FBScene *)scene updateSettingsWithBlock:v7];
  }
}

void __49__PRSceneViewController_setConfiguredProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 titleStyleConfiguration];
  objc_msgSend(v4, "pr_setPosterTitleStyleConfiguration:", v5);

  id v6 = [*(id *)(a1 + 32) ambientConfiguration];
  objc_msgSend(v4, "pr_setPosterAmbientConfiguration:", v6);
}

- (void)setSceneUserInteractionEnabled:(BOOL)a3
{
  if (self->_sceneUserInteractionEnabled != a3)
  {
    self->_sceneUserInteractionEnabled = a3;
    if (a3)
    {
      [(UIView *)self->_touchBlockingView removeFromSuperview];
      touchBlockingView = self->_touchBlockingView;
      self->_touchBlockingView = 0;
    }
    else
    {
      v9 = [(PRSceneViewController *)self view];
      id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(UIView *)v9 bounds];
      id v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      [(UIView *)v6 setAutoresizingMask:18];
      uint64_t v7 = [(UIView *)v6 layer];
      [v7 setHitTestsAsOpaque:1];

      [(UIView *)v9 addSubview:v6];
      id v8 = self->_touchBlockingView;
      self->_touchBlockingView = v6;

      touchBlockingView = v9;
    }
  }
}

- (void)setForcesSceneForeground:(BOOL)a3
{
  if (self->_forcesSceneForeground != a3)
  {
    self->_forcesSceneForeground = a3;
    [(PRSceneViewController *)self _update];
  }
}

- (BOOL)isSceneAvailable
{
  return self->_scene != 0;
}

- (BOOL)isSceneContentReady
{
  id v3 = [(FBScene *)self->_scene clientSettings];
  int v4 = objc_msgSend(v3, "pui_didFinishInitialization");

  return v4 && [(FBScene *)self->_scene contentState] == 2;
}

- (unint64_t)significantEventsCounter
{
  v2 = [(FBScene *)self->_scene settings];
  unint64_t v3 = objc_msgSend(v2, "pui_significantEventsCounter");

  return v3;
}

- (id)_defaultDisplayConfigurationForScreen:(id)a3
{
  if (a3)
  {
    unint64_t v3 = [a3 displayConfiguration];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F62970]);
    unint64_t v3 = [v4 mainConfiguration];
  }
  return v3;
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_displayConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    [(PRSceneViewController *)self _update];
  }
}

- (FBSDisplayConfiguration)displayConfiguration
{
  displayConfiguration = self->_displayConfiguration;
  if (displayConfiguration)
  {
    unint64_t v3 = displayConfiguration;
  }
  else
  {
    id v5 = [(PRSceneViewController *)self _screen];
    unint64_t v3 = [(PRSceneViewController *)self _defaultDisplayConfigurationForScreen:v5];
  }
  return v3;
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    self->_BOOL invalidated = 1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      BOOL invalidated = self->_invalidated;
      int v4 = 134218240;
      id v5 = self;
      __int16 v6 = 1024;
      BOOL v7 = invalidated;
      _os_log_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: invalidated is now %{BOOL}i", (uint8_t *)&v4, 0x12u);
    }
    [(PRSceneViewController *)self _teardown];
  }
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PRSceneViewController;
  [(PRSceneViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRSceneViewController;
  [(PRSceneViewController *)&v4 viewWillAppear:a3];
  [(PRSceneViewController *)self _update];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRSceneViewController;
  [(PRSceneViewController *)&v4 viewDidAppear:a3];
  [(PRSceneViewController *)self _update];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRSceneViewController;
  [(PRSceneViewController *)&v4 viewWillDisappear:a3];
  [(PRSceneViewController *)self _update];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRSceneViewController;
  [(PRSceneViewController *)&v4 viewDidDisappear:a3];
  [(PRSceneViewController *)self _update];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PRSceneViewController;
  -[PRSceneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v21, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  uint64_t v8 = [v7 containerView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [v8 window];
  }
  id v10 = v9;
  id v11 = [(PRSceneViewController *)self view];
  id v12 = [v11 window];
  id v13 = [v12 windowScene];
  uint64_t v14 = [v13 interfaceOrientation];

  if (v7)
  {
    uint64_t v15 = [v10 _toWindowOrientation];
    id v16 = [(UIScene *)self->_uiParentScene _synchronizedDrawingFence];
    uint64_t v17 = (void *)MEMORY[0x1E4F4F680];
    [v7 transitionDuration];
    uint64_t v18 = objc_msgSend(v17, "settingsWithDuration:");
    -[PRSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v15, v18, v16, width, height);
  }
  else
  {
    uint64_t v18 = [(PRSceneViewController *)self view];
    [v18 bounds];
    -[PRSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v14, 0, 0, v19, v20);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PRSceneViewController;
  [(PRSceneViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(PRSceneViewController *)self _update];
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRSceneViewController;
  [(PRSceneViewController *)&v4 didMoveToParentViewController:a3];
  [(PRSceneViewController *)self _update];
}

- (void)_teardown
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  scenePresenter = self->_scenePresenter;
  if (scenePresenter)
  {
    [(UIScenePresenter *)scenePresenter invalidate];
    objc_super v4 = self->_scenePresenter;
    self->_scenePresenter = 0;
  }
  if (self->_scene)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      objc_super v5 = [(FBScene *)self->_scene identityToken];
      __int16 v6 = [v5 stringRepresentation];
      int v9 = 134218242;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: invalidating scene %@", (uint8_t *)&v9, 0x16u);
    }
    [(FBScene *)self->_scene setDelegate:0];
    [(FBScene *)self->_scene pui_invalidateWithCompletion:0];
    scene = self->_scene;
    self->_scene = 0;
  }
  [(BSInvalidatable *)self->_keyboardFocusDeferringRule invalidate];
  keyboardFocusDeferringRule = self->_keyboardFocusDeferringRule;
  self->_keyboardFocusDeferringRule = 0;
}

- (void)_update
{
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    [(PRSceneViewController *)self _adjustParentScene];
    if ([(PRSceneViewController *)self scenePresenterIsValid])
    {
      unint64_t v3 = [(PRSceneViewController *)self view];
      objc_super v4 = [v3 window];
      objc_super v5 = [v4 windowScene];
      uint64_t v6 = [v5 interfaceOrientation];

      id v7 = [(PRSceneViewController *)self traitCollection];
      uint64_t v8 = [v7 userInterfaceIdiom];

      int v9 = [(PRSceneViewController *)self contentsIdentity];
      id v10 = [v9 role];
      int v11 = [v10 isEqual:@"PRPosterRoleLockScreen"];
      if (v8 == 1) {
        uint64_t v12 = v6;
      }
      else {
        uint64_t v12 = 1;
      }
      if (v11) {
        uint64_t v6 = v12;
      }
      [(PRSceneViewController *)self sceneSize];
      -[PRSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v6, 0, 0);
      if (!self->_scenePresenter)
      {
        uint64_t v13 = [(FBScene *)self->_scene uiPresentationManager];
        uint64_t v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v14);
        id v16 = [v13 createPresenterWithIdentifier:v15];
        scenePresenter = self->_scenePresenter;
        self->_scenePresenter = v16;

        uint64_t v18 = [(PRSceneViewController *)self _presentationBackgroundColor];
        double v19 = self->_scenePresenter;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __32__PRSceneViewController__update__block_invoke;
        v23[3] = &unk_1E54DBD38;
        id v24 = v18;
        id v20 = v18;
        [(UIScenePresenter *)v19 modifyPresentationContext:v23];
        [(UIScenePresenter *)self->_scenePresenter activate];
        objc_super v21 = [(UIScenePresenter *)self->_scenePresenter presentationView];
        [(PRSceneViewController *)self _addScenePresentationView:v21];
      }
    }
    else
    {
      [(UIScenePresenter *)self->_scenePresenter invalidate];
      v22 = self->_scenePresenter;
      self->_scenePresenter = 0;
    }
  }
}

void __32__PRSceneViewController__update__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAppearanceStyle:2];
  [v3 setClippingDisabled:PUIDynamicRotationIsActive()];
  [v3 setBackgroundColorWhileHosting:*(void *)(a1 + 32)];
}

- (BOOL)scenePresenterIsValid
{
  objc_super v2 = [(PRSceneViewController *)self view];
  id v3 = [v2 window];
  BOOL v4 = v3 != 0;

  return v4;
}

- (CGSize)sceneSize
{
  objc_super v2 = [(PRSceneViewController *)self view];
  id v3 = [v2 window];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (id)_presentationBackgroundColor
{
  if ([(PRSceneViewController *)self isSceneContentReady])
  {
    int has_internal_content = os_variant_has_internal_content();
    id v3 = (void *)MEMORY[0x1E4FB1618];
    if (has_internal_content)
    {
      double v4 = [MEMORY[0x1E4FB1618] systemPinkColor];
      goto LABEL_6;
    }
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4FB1618];
  }
  double v4 = [v3 blackColor];
LABEL_6:
  return v4;
}

- (void)_addScenePresentationView:(id)a3
{
  id v4 = a3;
  double v5 = [(PRSceneViewController *)self view];
  [v5 addSubview:v4];

  id v6 = [(PRSceneViewController *)self view];
  [v6 sendSubviewToBack:v4];
}

- (void)_adjustParentScene
{
  id v3 = [(PRSceneViewController *)self view];
  id v4 = [v3 window];
  id obj = [v4 windowScene];

  double v5 = obj;
  p_uiParentScene = &self->_uiParentScene;
  if (self->_uiParentScene != obj)
  {
    objc_storeStrong((id *)p_uiParentScene, obj);
    double v5 = obj;
  }
  MEMORY[0x1F41817F8](p_uiParentScene, v5);
}

- (void)_updateSceneToSize:(CGSize)a3 orientation:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  int v11 = [(PRSceneViewController *)self displayConfiguration];
  scene = self->_scene;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__PRSceneViewController__updateSceneToSize_orientation_withAnimationSettings_fence___block_invoke;
  v16[3] = &unk_1E54DBD60;
  v16[4] = self;
  id v17 = v11;
  id v19 = v9;
  int64_t v20 = a4;
  id v18 = v10;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  [(FBScene *)scene performUpdate:v16];
}

void __84__PRSceneViewController__updateSceneToSize_orientation_withAnimationSettings_fence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  objc_msgSend(v7, "setForeground:", objc_msgSend(v5, "_shouldSceneBeForeground"));
  [v7 setDisplayConfiguration:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v7, "setFrame:");
  [v7 setInterfaceOrientation:*(void *)(a1 + 64)];
  [v6 setAnimationFence:*(void *)(a1 + 48)];
  [v6 setAnimationSettings:*(void *)(a1 + 56)];
  objc_msgSend(v7, "pr_setDepthEffectDisallowed:", objc_msgSend(*(id *)(a1 + 32), "_depthEffectDisallowed"));
  [*(id *)(a1 + 32) _updateSceneSettings:v7 transitionContext:v6];
}

- (BOOL)_depthEffectDisallowed
{
  id v3 = [(PRSceneViewController *)self configuredProperties];
  id v4 = [v3 renderingConfiguration];

  if (!self->_forcesSceneForeground || v4 == 0)
  {
    id v6 = [(PRSceneViewController *)self view];
    id v7 = [v6 window];
    double v8 = [v7 windowScene];
    uint64_t v9 = [v8 interfaceOrientation];

    LODWORD(v8) = (unint64_t)(v9 - 1) < 2;
    id v10 = [(PRSceneViewController *)self configuredProperties];
    int v11 = [v10 complicationLayout];
    uint64_t v12 = [v11 complications];
    BOOL v13 = [v12 count] != 0;

    id v14 = [v10 titleStyleConfiguration];
    LODWORD(v12) = [v14 prefersVerticalTitleLayout];

    char v15 = PRIsDepthEffectDisallowed((int)v8, v13, v12);
  }
  else
  {
    char v15 = [v4 isDepthEffectDisabled];
  }

  return v15;
}

- (BOOL)_shouldSceneBeForeground
{
  return [(PRSceneViewController *)self forcesSceneForeground]
      || [(PRSceneViewController *)self _appearState] != 0;
}

- (void)_configureInitialSceneSettings:(id)a3
{
  id v4 = a3;
  double v5 = [(PRSceneViewController *)self configuredProperties];
  id v10 = [v5 complicationLayout];

  id v6 = [v10 complications];
  BOOL v7 = [v6 count] != 0;

  double v8 = [v10 sidebarComplications];
  BOOL v9 = [v8 count] != 0;

  objc_msgSend(v4, "pui_setComplicationRowConfigured:", v7);
  objc_msgSend(v4, "pui_setComplicationSidebarConfigured:", v9);
  objc_msgSend(v4, "pr_setParallaxDisallowed:", 1);
}

- (void)_configureInitialSceneClientSettings:(id)a3
{
  id v4 = a3;
  double v5 = [(PRSceneViewController *)self configuredProperties];
  id v6 = [v5 renderingConfiguration];

  objc_msgSend(v4, "pr_setDepthEffectDisabled:", objc_msgSend(v6, "isDepthEffectDisabled"));
  objc_msgSend(v4, "pr_setParallaxEnabled:", objc_msgSend(v6, "isParallaxEnabled"));
}

- (void)_updatePresentationBackgroundColor
{
  id v3 = [(PRSceneViewController *)self _presentationBackgroundColor];
  scenePresenter = self->_scenePresenter;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PRSceneViewController__updatePresentationBackgroundColor__block_invoke;
  v6[3] = &unk_1E54DBD38;
  id v7 = v3;
  id v5 = v3;
  [(UIScenePresenter *)scenePresenter modifyPresentationContext:v6];
}

uint64_t __59__PRSceneViewController__updatePresentationBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBackgroundColorWhileHosting:*(void *)(a1 + 32)];
}

- (void)_acquireKeyboardFocusDeferringRuleIfNecessary
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_18C1C4000, v2, v3, "%{public}@-%{public}p: Cannot acquire keyboard focus deferring assertion because client scene is nil", v4, v5, v6, v7, v8);
}

- (id)_acquireLocalKeyboardFocusAssertion
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PRLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412546;
    char v15 = v5;
    __int16 v16 = 2048;
    id v17 = self;
    _os_log_impl(&dword_18C1C4000, v3, OS_LOG_TYPE_DEFAULT, "%@-%p: acquiring local keyboard focus assertion and invalidating remote deferring rule", buf, 0x16u);
  }
  [(BSInvalidatable *)self->_keyboardFocusDeferringRule invalidate];
  keyboardFocusDeferringRule = self->_keyboardFocusDeferringRule;
  self->_keyboardFocusDeferringRule = 0;

  objc_initWeak((id *)buf, self);
  id v7 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint8_t v8 = [MEMORY[0x1E4F29128] UUID];
  BOOL v9 = [v8 UUIDString];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__PRSceneViewController__acquireLocalKeyboardFocusAssertion__block_invoke;
  v12[3] = &unk_1E54DBD88;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = (void *)[v7 initWithIdentifier:v9 forReason:@"localKeyboardFocus" invalidationBlock:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  return v10;
}

void __60__PRSceneViewController__acquireLocalKeyboardFocusAssertion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    uint64_t v5 = PRLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_loadWeakRetained(&to);
      id v7 = (objc_class *)objc_opt_class();
      uint8_t v8 = NSStringFromClass(v7);
      id v9 = objc_loadWeakRetained(&to);
      *(_DWORD *)buf = 138412546;
      id v13 = v8;
      __int16 v14 = 2048;
      id v15 = v9;
      _os_log_impl(&dword_18C1C4000, v5, OS_LOG_TYPE_DEFAULT, "%@-%p: invalidating local keyboard focus assertion", buf, 0x16u);
    }
    id v10 = objc_loadWeakRetained(&to);
    [v10 _acquireKeyboardFocusDeferringRuleIfNecessary];
  }
  objc_destroyWeak(&to);
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = a4;
    uint8_t v8 = [a3 identityToken];
    id v9 = [v8 stringRepresentation];

    int v11 = 134218498;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = v9;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ handle actions %@", (uint8_t *)&v11, 0x20u);
  }
  return 0;
}

- (void)sceneContentStateDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = a3;
    id v6 = [v5 identityToken];
    id v7 = [v6 stringRepresentation];
    [v5 contentState];

    uint8_t v8 = NSStringFromFBSceneContentState();
    int v9 = 134218498;
    id v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did change content state to %@", (uint8_t *)&v9, 0x20u);
  }
  [(PRSceneViewController *)self _sceneContentReadinessDidChange];
}

- (void)sceneDidActivate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [a3 identityToken];
    id v6 = [v5 stringRepresentation];
    int v7 = 134218242;
    uint8_t v8 = self;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did activate", (uint8_t *)&v7, 0x16u);
  }
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  id v5 = a3;
  id v6 = [PRPosterRenderingConfiguration alloc];
  int v7 = [v5 clientSettings];
  uint64_t v8 = objc_msgSend(v7, "pr_isDepthEffectDisabled");
  __int16 v9 = [v5 clientSettings];

  uint64_t v11 = -[PRPosterRenderingConfiguration initWithDepthEffectDisabled:parallaxEnabled:](v6, "initWithDepthEffectDisabled:parallaxEnabled:", v8, objc_msgSend(v9, "pr_isParallaxEnabled"));
  id v10 = (void *)[(PRPosterConfiguredProperties *)self->_configuredProperties mutableCopy];
  [v10 setRenderingConfiguration:v11];
  [(PRSceneViewController *)self setConfiguredProperties:v10];
  [(PRSceneViewController *)self _acquireKeyboardFocusDeferringRuleIfNecessary];
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 identityToken];
    __int16 v9 = [v8 stringRepresentation];
    int v17 = 134218498;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    int64_t v20 = v9;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did deactivate with error %@", (uint8_t *)&v17, 0x20u);
  }
  id v10 = [v7 domain];
  if ([v10 isEqualToString:*MEMORY[0x1E4F623A8]])
  {
    uint64_t v11 = [v7 code];

    if (v11 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v6 identityToken];
        __int16 v13 = [v12 stringRepresentation];
        int v17 = 134218498;
        uint64_t v18 = self;
        __int16 v19 = 2112;
        int64_t v20 = v13;
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did deactivate with fatal error %@", (uint8_t *)&v17, 0x20u);
      }
      [(PRSceneViewController *)self _failWithFatalError:v7];
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = [v6 identityToken];
    uint64_t v15 = [v14 stringRepresentation];
    int v17 = 134218498;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    int64_t v20 = v15;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did deactivate with transient error %@", (uint8_t *)&v17, 0x20u);
  }
  [(PRSceneViewController *)self _update];
LABEL_12:
  [(BSInvalidatable *)self->_keyboardFocusDeferringRule invalidate];
  keyboardFocusDeferringRule = self->_keyboardFocusDeferringRule;
  self->_keyboardFocusDeferringRule = 0;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = [v10 identityToken];
    uint64_t v15 = [v14 stringRepresentation];
    int v18 = 134218754;
    __int16 v19 = self;
    __int16 v20 = 2112;
    __int16 v21 = v15;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did update client settings with diff %@, transition %@", (uint8_t *)&v18, 0x2Au);
  }
  id v16 = [v10 clientSettings];
  int v17 = objc_msgSend(v16, "pui_didFinishInitialization");
  if (v17 != objc_msgSend(v12, "pui_didFinishInitialization")) {
    [(PRSceneViewController *)self _sceneContentReadinessDidChange];
  }
}

- (PFServerPosterIdentity)contentsIdentity
{
  return self->_contentsIdentity;
}

- (PRPosterConfiguredProperties)configuredProperties
{
  return self->_configuredProperties;
}

- (BOOL)isSceneUserInteractionEnabled
{
  return self->_sceneUserInteractionEnabled;
}

- (void)setSceneAvailable:(BOOL)a3
{
  self->_sceneAvailable = a3;
}

- (BOOL)forcesSceneForeground
{
  return self->_forcesSceneForeground;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void)setScene:(id)a3
{
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_configuredProperties, 0);
  objc_storeStrong((id *)&self->_contentsIdentity, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_keyboardFocusDeferringRule, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_uiParentScene, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
}

+ (NSString)role
{
  return 0;
}

- (void)initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:.cold.5()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:.cold.6()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end