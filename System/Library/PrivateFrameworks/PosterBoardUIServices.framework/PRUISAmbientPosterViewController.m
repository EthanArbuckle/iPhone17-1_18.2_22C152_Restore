@interface PRUISAmbientPosterViewController
+ (NSArray)suggestedInstanceIdentifiers;
+ (id)defaultSnapshotCacheURL;
+ (id)defaultSnapshotCacheURLInCurrentContainer:(BOOL)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldSnapshot;
- (BOOL)isEditingSupported;
- (BOOL)isExtensionUserInteractionEnabled;
- (BOOL)isPreview;
- (BOOL)shouldShareTouchesWithHost;
- (BOOL)updateConfiguration:(id)a3;
- (FBSDisplayConfiguration)displayConfiguration;
- (PRUISAmbientPosterViewController)initWithBoundingShape:(int64_t)a3;
- (PRUISAmbientPosterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PRUISAmbientPosterViewControllerDelegate)delegate;
- (PRUISPosterSnapshotController)snapshotController;
- (id)_currentSnapshotDefinition;
- (id)_defaultDisplayConfiguration;
- (id)_posterProviderForPosterPath:(id)a3;
- (id)_snapshotBundle:(id)a3 imageForLayer:(unint64_t)a4;
- (id)cancelTouchesForCurrentEventInHostedContent;
- (id)scene:(id)a3 handleActions:(id)a4;
- (int64_t)_currentOrientation;
- (int64_t)_renderingModeForVisibility:(unint64_t)a3;
- (int64_t)boundingShape;
- (unint64_t)_effectivePresentationMode;
- (unint64_t)_titleAlignmentForInterfaceOrientation:(int64_t)a3;
- (unint64_t)presentationMode;
- (unint64_t)visibility;
- (unint64_t)visibleSnapshotLayers;
- (void)_backlightLuminanceTraitDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_clearTouchDeliveryPolicies;
- (void)_enumerateSceneObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_enumerateSnapshotLayerViews:(id)a3;
- (void)_fetchSnapshotsWithRequest:(id)a3 animated:(BOOL)a4;
- (void)_noteWindowWillRotate:(id)a3;
- (void)_registerForAmbientPresentationTraitChanges;
- (void)_resetScreenWakeStateForTeardown:(BOOL)a3;
- (void)_screenDidTurnOn;
- (void)_setClientWantsScreenWakeEvents:(BOOL)a3;
- (void)_setupScene;
- (void)_takeNewSnapshots;
- (void)_teardownScene;
- (void)_updateAmbientPresentationSettingsForSceneSettings:(id)a3;
- (void)_updateForCurrentIsSnapshot;
- (void)_updateForCurrentPresentationMode;
- (void)_updateForCurrentVisibility;
- (void)_updateForSnapshotBundle:(id)a3;
- (void)_updateSceneLayerPresenters;
- (void)_updateSceneSettingsForUpdatedDisplayConfiguration;
- (void)_updateSceneWithCompletion:(id)a3;
- (void)_updateSceneWithCompletion:(id)a3 window:(id)a4;
- (void)_updateSceneWithCompletion:(id)a3 window:(id)a4 orientation:(int64_t)a5;
- (void)_updateSeparatedLayerHosting;
- (void)_updateSnapshotLayerVisibility;
- (void)_updateSnapshotOpacities;
- (void)_updateSnapshots;
- (void)_updateSnapshotsAnimated:(BOOL)a3;
- (void)_updateTouchDeliveryPolicies;
- (void)addSceneObserver:(id)a3;
- (void)dealloc;
- (void)eventOccurred:(id)a3;
- (void)fetchAppIntentsListenerEndpointWithHandler:(id)a3;
- (void)invalidate;
- (void)removeSceneObserver:(id)a3;
- (void)scene:(id)a3 clientDidConnect:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setExtensionUserInteractionEnabled:(BOOL)a3;
- (void)setIsPreview:(BOOL)a3;
- (void)setOpacity:(double)a3 forLayers:(unint64_t)a4;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setShouldShareTouchesWithHost:(BOOL)a3;
- (void)setSnapshotController:(id)a3;
- (void)setVisibility:(unint64_t)a3;
- (void)setVisibleSnapshotLayers:(unint64_t)a3;
- (void)userTapEventOccurredWithLocation:(CGPoint)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillMoveToWindow:(id)a3;
@end

@implementation PRUISAmbientPosterViewController

- (BOOL)_shouldSnapshot
{
  if (!self->__snapshotController) {
    return 0;
  }
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 objectForKey:@"PRUISAmbientEnableSnapshots"];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v8 = v6;

  char v9 = [v8 BOOLValue];
  if (v8) {
    return v9;
  }
  else {
    return 1;
  }
}

- (PRUISAmbientPosterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[PRUISAmbientPosterViewController initWithBoundingShape:](self, "initWithBoundingShape:", -1, a4);
}

- (PRUISAmbientPosterViewController)initWithBoundingShape:(int64_t)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = PUIPosterBoundingShapeFromInt();
  if ((PUIPosterBoundingShapeIsValid() & 1) == 0)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PUIPosterBoundingShapeIsValid(puiBoundingShape)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(PRUISAmbientPosterViewController *)a2 initWithBoundingShape:(uint64_t)v22];
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A04E658);
  }
  v23.receiver = self;
  v23.super_class = (Class)PRUISAmbientPosterViewController;
  v6 = [(PRUISAmbientPosterViewController *)&v23 initWithNibName:0 bundle:0];
  if (v6)
  {
    v7 = objc_alloc_init(PRUISDefaultSessionReconnectPolicy);
    reconnectPolicy = v6->_reconnectPolicy;
    v6->_reconnectPolicy = (PRUISSessionReconnectPolicy *)v7;

    v6->_visibleSnapshotLayers = -1;
    v6->_boundingShape = v5;
    char v9 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    snapshotBackgroundLayerView = v6->_snapshotBackgroundLayerView;
    v6->_snapshotBackgroundLayerView = v9;

    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    snapshotForegroundLayerView = v6->_snapshotForegroundLayerView;
    v6->_snapshotForegroundLayerView = v11;

    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    snapshotFloatingLayerView = v6->_snapshotFloatingLayerView;
    v6->_snapshotFloatingLayerView = v13;

    v6->_backgroundOpacity = 1.0;
    v6->_foregroundOpacity = 1.0;
    v6->_floatingOpacity = 1.0;
    uint64_t v15 = [MEMORY[0x263F3F430] mainConfiguration];
    displayConfiguration = v6->_displayConfiguration;
    v6->_displayConfiguration = (FBSDisplayConfiguration *)v15;

    v17 = self;
    v24[0] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    id v19 = (id)[(PRUISAmbientPosterViewController *)v6 registerForTraitChanges:v18 withAction:sel__backlightLuminanceTraitDidChange_previousTraitCollection_];

    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:v6 selector:sel__windowDidAttachContext_ name:*MEMORY[0x263F1D8C0] object:0];
    [v20 addObserver:v6 selector:sel__windowDidDetachContext_ name:*MEMORY[0x263F1D8C8] object:0];
  }
  return v6;
}

- (void)dealloc
{
  if (self->_ambientPresentationTraitChangeRegistration) {
    -[PRUISAmbientPosterViewController unregisterForTraitChanges:](self, "unregisterForTraitChanges:");
  }
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D8C0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D8C8] object:0];
  [(PRUISAmbientPosterViewController *)self invalidate];

  v4.receiver = self;
  v4.super_class = (Class)PRUISAmbientPosterViewController;
  [(PRUISAmbientPosterViewController *)&v4 dealloc];
}

- (BOOL)updateConfiguration:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  configuration = self->_configuration;
  if (!configuration)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    [(PRUISAmbientPosterViewController *)self _setupScene];
    [(PRUISAmbientPosterViewController *)self _registerForAmbientPresentationTraitChanges];
    goto LABEL_15;
  }
  v7 = [(PRSPosterConfiguration *)configuration _path];
  id v8 = [v5 _path];
  v26 = v7;
  char v9 = [v7 serverIdentity];
  v10 = [v8 serverIdentity];
  v11 = [v9 posterUUID];
  v12 = [v10 posterUUID];
  int v13 = [v11 isEqual:v12];

  if (v13)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    uint64_t v14 = [v10 version];
    uint64_t v15 = [v9 version];
    v16 = PRUISLogCommon();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14 == v15)
    {
      if (v17)
      {
        v18 = [(FBScene *)self->_scene pui_shortDescription];
        *(_DWORD *)buf = 138543362;
        v30 = v18;
        id v19 = "Refreshing ambient poster %{public}@.";
        v20 = v16;
        uint32_t v21 = 12;
LABEL_12:
        _os_log_impl(&dword_25A03F000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
    else if (v17)
    {
      v18 = [(FBScene *)self->_scene pui_shortDescription];
      *(_DWORD *)buf = 138543874;
      v30 = v18;
      __int16 v31 = 2048;
      uint64_t v32 = [v9 version];
      __int16 v33 = 2048;
      uint64_t v34 = [v10 version];
      id v19 = "Updating ambient poster %{public}@ from version %llu to %llu.";
      v20 = v16;
      uint32_t v21 = 32;
      goto LABEL_12;
    }

    scene = self->_scene;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __56__PRUISAmbientPosterViewController_updateConfiguration___block_invoke;
    v27[3] = &unk_26546B688;
    v27[4] = self;
    id v28 = v8;
    [(FBScene *)scene pruis_updateWithoutActivating:v27];

    goto LABEL_14;
  }
  v22 = PRUISLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25A03F000, v22, OS_LOG_TYPE_DEFAULT, "Cannot update to proposed poster configuration.", buf, 2u);
  }

LABEL_14:
  [(PRUISAmbientPosterViewController *)self _registerForAmbientPresentationTraitChanges];
  if (!v13)
  {
    BOOL v24 = 0;
    goto LABEL_17;
  }
LABEL_15:
  [(PRUISAmbientPosterViewController *)self _updateSnapshots];
  [(PRUISAmbientPosterViewController *)self _updateForCurrentPresentationMode];
  [(PRUISAmbientPosterViewController *)self _updateSceneWithCompletion:0];
  BOOL v24 = 1;
LABEL_17:

  return v24;
}

uint64_t __56__PRUISAmbientPosterViewController_updateConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 984), "pr_updateWithPath:inSettings:", *(void *)(a1 + 40), a2);
}

- (void)setExtensionUserInteractionEnabled:(BOOL)a3
{
  if (self->_extensionUserInteractionEnabled != a3)
  {
    self->_extensionUserInteractionEnabled = a3;
    scene = self->_scene;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __71__PRUISAmbientPosterViewController_setExtensionUserInteractionEnabled___block_invoke;
    v4[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
    BOOL v5 = a3;
    [(FBScene *)scene updateSettingsWithBlock:v4];
  }
}

uint64_t __71__PRUISAmbientPosterViewController_setExtensionUserInteractionEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setExtensionUserInteractionEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setIsPreview:(BOOL)a3
{
  if (self->_isPreview != a3)
  {
    self->_isPreview = a3;
    [(PRUISAmbientPosterViewController *)self _updateForCurrentIsSnapshot];
  }
}

- (void)setVisibility:(unint64_t)a3
{
  if (self->_visibility != a3)
  {
    self->_visibility = a3;
    [(PRUISAmbientPosterViewController *)self _updateForCurrentVisibility];
  }
}

- (void)setPresentationMode:(unint64_t)a3
{
  if (self->_presentationMode != a3)
  {
    self->_presentationMode = a3;
    [(PRUISAmbientPosterViewController *)self _updateForCurrentPresentationMode];
  }
}

- (void)setVisibleSnapshotLayers:(unint64_t)a3
{
  if (self->_visibleSnapshotLayers != a3)
  {
    self->_visibleSnapshotLayers = a3;
    [(PRUISAmbientPosterViewController *)self _updateSnapshotLayerVisibility];
  }
}

+ (id)defaultSnapshotCacheURL
{
  return (id)[a1 defaultSnapshotCacheURLInCurrentContainer:1];
}

+ (id)defaultSnapshotCacheURLInCurrentContainer:(BOOL)a3
{
  v10[3] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v3 = [MEMORY[0x263F08850] defaultManager];
    objc_super v4 = [v3 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:0];
  }
  else
  {
    BOOL v5 = NSURL;
    v3 = BSCurrentUserDirectory();
    v10[0] = v3;
    v10[1] = @"Library";
    v10[2] = @"Caches";
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:3];
    objc_super v4 = [v5 fileURLWithPathComponents:v6];
  }
  v7 = [v4 URLByAppendingPathComponent:@"Ambient"];
  id v8 = [v7 URLByAppendingPathComponent:@"PosterSnapshots"];

  return v8;
}

- (PRUISPosterSnapshotController)snapshotController
{
  return self->__snapshotController;
}

- (void)setSnapshotController:(id)a3
{
  if (self->__snapshotController != a3) {
    objc_storeStrong((id *)&self->__snapshotController, a3);
  }

  MEMORY[0x270F9A758]();
}

- (void)invalidate
{
  [(PRUISAmbientPosterViewController *)self _teardownScene];

  [(PRUISAmbientPosterViewController *)self setSnapshotController:0];
}

- (void)userTapEventOccurredWithLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(FBScene *)self->_scene clientSettings];
  int v7 = objc_msgSend(v6, "pui_userTapEventsRequested");

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F5F528]);
    id v9 = (id)objc_msgSend(v8, "initWithType:location:", *MEMORY[0x263F5F580], x, y);
    [(PRUISAmbientPosterViewController *)self eventOccurred:v9];
  }
}

- (void)eventOccurred:(id)a3
{
  id v5 = (id)[a3 newAction];
  objc_super v4 = [MEMORY[0x263EFFA08] setWithObject:v5];
  [(FBScene *)self->_scene sendActions:v4];
}

- (void)setOpacity:(double)a3 forLayers:(unint64_t)a4
{
  if (a4)
  {
    self->_backgroundOpacitdouble y = a3;
    if ((a4 & 2) == 0)
    {
LABEL_3:
      if ((a4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((a4 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_foregroundOpacitdouble y = a3;
  if ((a4 & 4) != 0) {
LABEL_4:
  }
    self->_floatingOpacitdouble y = a3;
LABEL_5:
  [(PRUISAmbientPosterViewController *)self _updateSeparatedLayerHosting];

  [(PRUISAmbientPosterViewController *)self _updateSnapshotOpacities];
}

+ (NSArray)suggestedInstanceIdentifiers
{
  if (suggestedInstanceIdentifiers_onceToken != -1) {
    dispatch_once(&suggestedInstanceIdentifiers_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)suggestedInstanceIdentifiers_identifiers;

  return (NSArray *)v2;
}

void __64__PRUISAmbientPosterViewController_suggestedInstanceIdentifiers__block_invoke()
{
  v10[8] = *MEMORY[0x263EF8340];
  v0 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0FCA6C3D-1F82-411A-A9B1-1C06D12DCC42"];
  v10[0] = v0;
  v1 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"5A844F1E-4289-4717-B96D-D6A03A258B53"];
  v10[1] = v1;
  v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"DA40E1E8-43D0-4F86-8B7B-72A3CCDED2A6"];
  v10[2] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"AF57A69A-C2B0-4A23-9B45-CDFC4F672571"];
  v10[3] = v3;
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0A2C2CA5-4530-4DC9-87FB-327184120271"];
  void v10[4] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"534788DA-63B5-4AED-84B2-8752F9B01893"];
  v10[5] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"A5E96117-83BF-4B55-BC3A-C39FC602F12C"];
  v10[6] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"271390E6-6D65-4209-9273-B6A920C290A0"];
  v10[7] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:8];
  id v9 = (void *)suggestedInstanceIdentifiers_identifiers;
  suggestedInstanceIdentifiers_identifiers = v8;
}

- (id)_defaultDisplayConfiguration
{
  return (id)[MEMORY[0x263F3F430] mainConfiguration];
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_displayConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    [(PRUISAmbientPosterViewController *)self _updateSceneSettingsForUpdatedDisplayConfiguration];
  }
}

- (FBSDisplayConfiguration)displayConfiguration
{
  displayConfiguration = self->_displayConfiguration;
  if (displayConfiguration)
  {
    v3 = displayConfiguration;
  }
  else
  {
    v3 = [(PRUISAmbientPosterViewController *)self _defaultDisplayConfiguration];
  }

  return v3;
}

- (void)_updateSceneSettingsForUpdatedDisplayConfiguration
{
  v3 = [(PRUISAmbientPosterViewController *)self displayConfiguration];
  scene = self->_scene;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__PRUISAmbientPosterViewController__updateSceneSettingsForUpdatedDisplayConfiguration__block_invoke;
  v6[3] = &unk_26546B258;
  id v7 = v3;
  id v5 = v3;
  [(FBScene *)scene pruis_updateWithoutActivating:v6];
}

void __86__PRUISAmbientPosterViewController__updateSceneSettingsForUpdatedDisplayConfiguration__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setDisplayConfiguration:*(void *)(a1 + 32)];
}

- (void)fetchAppIntentsListenerEndpointWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__PRUISAmbientPosterViewController_fetchAppIntentsListenerEndpointWithHandler___block_invoke;
  v6[3] = &unk_26546B6D0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __79__PRUISAmbientPosterViewController_fetchAppIntentsListenerEndpointWithHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 984);
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFFA08]);
    id v9 = (id)[objc_alloc(MEMORY[0x263F5F490]) initWithHandler:*(void *)(a1 + 40)];
    id v4 = objc_msgSend(v3, "initWithObjects:", v9, 0);
    [v2 sendActions:v4];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      *(void *)&long long v6 = -1;
      *((void *)&v6 + 1) = -1;
      v10[0] = v6;
      v10[1] = v6;
      id v7 = [MEMORY[0x263F29BE0] tokenFromAuditToken:v10];
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "pr_errorWithCode:", 9);
      (*(void (**)(uint64_t, void, void *, void *))(v5 + 16))(v5, 0, v7, v8);
    }
  }
}

- (BOOL)isEditingSupported
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v42.receiver = self;
  v42.super_class = (Class)PRUISAmbientPosterViewController;
  [(PRUISAmbientPosterViewController *)&v42 viewDidLoad];
  id v3 = [(PRUISAmbientPosterViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x263F1CB60]);
  [v3 bounds];
  uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
  [v5 setAutoresizingMask:18];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __47__PRUISAmbientPosterViewController_viewDidLoad__block_invoke;
  v40[3] = &unk_26546B6F8;
  id v6 = v5;
  id v41 = v6;
  [(PRUISAmbientPosterViewController *)self _enumerateSnapshotLayerViews:v40];
  [v6 insertSubview:self->_snapshotBackgroundLayerView atIndex:0];
  [v6 insertSubview:self->_snapshotForegroundLayerView atIndex:1];
  [v6 insertSubview:self->_snapshotFloatingLayerView atIndex:2];
  [v3 insertSubview:v6 atIndex:0];
  objc_storeStrong((id *)&self->_snapshotContainerView, v5);
  id v7 = [PRUISAmbientPosterSceneLayerHostView alloc];
  uint64_t v8 = NSString;
  id v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v8 stringWithFormat:@"%@-background", v10];
  v12 = [(PRUISAmbientPosterSceneLayerHostView *)v7 initWithIdentifier:v11];
  backgroundSceneLayerView = self->_backgroundSceneLayerView;
  self->_backgroundSceneLayerView = v12;

  uint64_t v14 = [PRUISAmbientPosterSceneLayerHostView alloc];
  uint64_t v15 = NSString;
  v16 = (objc_class *)objc_opt_class();
  BOOL v17 = NSStringFromClass(v16);
  v18 = [v15 stringWithFormat:@"%@-foreground", v17];
  id v19 = [(PRUISAmbientPosterSceneLayerHostView *)v14 initWithIdentifier:v18];
  foregroundSceneLayerView = self->_foregroundSceneLayerView;
  self->_foregroundSceneLayerView = v19;

  uint32_t v21 = [PRUISAmbientPosterSceneLayerHostView alloc];
  v22 = NSString;
  objc_super v23 = (objc_class *)objc_opt_class();
  BOOL v24 = NSStringFromClass(v23);
  v25 = [v22 stringWithFormat:@"%@-floating", v24];
  v26 = [(PRUISAmbientPosterSceneLayerHostView *)v21 initWithIdentifier:v25];
  floatingSceneLayerView = self->_floatingSceneLayerView;
  self->_floatingSceneLayerView = v26;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v28 = self->_foregroundSceneLayerView;
  v43[0] = self->_backgroundSceneLayerView;
  v43[1] = v28;
  v43[2] = self->_floatingSceneLayerView;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v37;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void **)(*((void *)&v36 + 1) + 8 * v33);
        [v3 bounds];
        objc_msgSend(v34, "setFrame:");
        [v34 setAutoresizingMask:18];
        uint64_t v35 = [v34 layer];
        [v35 setAllowsGroupOpacity:1];

        [v3 addSubview:v34];
        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v31);
  }

  [(PRUISAmbientPosterViewController *)self _updateForCurrentPresentationMode];
}

void __47__PRUISAmbientPosterViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 bounds];
  objc_msgSend(v3, "setFrame:");
  [v3 setAutoresizingMask:18];
  [v3 setContentMode:2];
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PRUISAmbientPosterViewController;
  [(PRUISAmbientPosterViewController *)&v12 viewWillAppear:a3];
  if (!self->_scene) {
    [(PRUISAmbientPosterViewController *)self _setupScene];
  }
  [(PRUISAmbientPosterViewController *)self _updateSceneWithCompletion:0];
  if (!self->_snapshotControllerKeepaliveAssertion)
  {
    id v4 = [(PRUISAmbientPosterViewController *)self snapshotController];
    uint64_t v5 = NSString;
    id v6 = [(PRSPosterConfiguration *)self->_configuration _path];
    id v7 = [v6 serverIdentity];
    uint64_t v8 = [v7 posterUUID];
    id v9 = [v5 stringWithFormat:@"PRUISAmbientPosterViewController %@", v8];
    v10 = [v4 acquireKeepActiveAssertionForReason:v9];
    snapshotControllerKeepaliveAssertion = self->_snapshotControllerKeepaliveAssertion;
    self->_snapshotControllerKeepaliveAssertion = v10;
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRUISAmbientPosterViewController;
  [(PRUISAmbientPosterViewController *)&v4 viewIsAppearing:a3];
  [(PRUISAmbientPosterViewController *)self _updateSnapshotsAnimated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRUISAmbientPosterViewController;
  [(PRUISAmbientPosterViewController *)&v4 viewDidAppear:a3];
  [(PRUISAmbientPosterViewController *)self _updateSceneWithCompletion:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRUISAmbientPosterViewController;
  [(PRUISAmbientPosterViewController *)&v4 viewWillDisappear:a3];
  [(PRUISAmbientPosterViewController *)self _updateSceneWithCompletion:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PRUISAmbientPosterViewController;
  [(PRUISAmbientPosterViewController *)&v5 viewDidDisappear:a3];
  [(PRUISAmbientPosterViewController *)self _updateSceneWithCompletion:0];
  [(PRUISAmbientPosterViewController *)self _takeNewSnapshots];
  [(BSInvalidatable *)self->_snapshotControllerKeepaliveAssertion invalidate];
  snapshotControllerKeepaliveAssertion = self->_snapshotControllerKeepaliveAssertion;
  self->_snapshotControllerKeepaliveAssertion = 0;

  [(PRUISAmbientPosterViewController *)self _teardownScene];
}

- (void)viewWillMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PRUISAmbientPosterViewController;
  id v4 = a3;
  [(PRUISAmbientPosterViewController *)&v5 viewWillMoveToWindow:v4];
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:window:](self, "_updateSceneWithCompletion:window:", 0, v4, v5.receiver, v5.super_class);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISAmbientPosterViewController;
  [(PRUISAmbientPosterViewController *)&v9 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  [(PRUISAmbientPosterViewController *)self _updateSceneWithCompletion:0 window:v6];
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v8 = *MEMORY[0x263F1D840];
  [v7 removeObserver:self name:*MEMORY[0x263F1D840] object:0];
  if (v6)
  {
    [v7 addObserver:self selector:sel__noteWindowWillRotate_ name:v8 object:v6];
    [(PRUISAmbientPosterViewController *)self _updateTouchDeliveryPolicies];
  }
}

- (void)viewWillLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PRUISAmbientPosterViewController;
  [(PRUISAmbientPosterViewController *)&v18 viewWillLayoutSubviews];
  if (_os_feature_enabled_impl())
  {
    id v3 = [(PRUISAmbientPosterViewController *)self view];
    [v3 bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    v19.origin.double x = v5;
    v19.origin.double y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    CGFloat Width = CGRectGetWidth(v19);
    v20.origin.double x = v5;
    v20.origin.double y = v7;
    v20.size.width = v9;
    v20.size.height = v11;
    CGFloat Height = CGRectGetHeight(v20);
    scene = self->_scene;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __58__PRUISAmbientPosterViewController_viewWillLayoutSubviews__block_invoke;
    v17[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
    v17[4] = 0;
    v17[5] = 0;
    *(CGFloat *)&v17[6] = Width;
    *(CGFloat *)&v17[7] = Height;
    [(FBScene *)scene updateSettingsWithBlock:v17];
  }
  snapshotContainerView = self->_snapshotContainerView;
  v16 = [(PRUISAmbientPosterViewController *)self view];
  [v16 bounds];
  -[UIView setFrame:](snapshotContainerView, "setFrame:");
}

uint64_t __58__PRUISAmbientPosterViewController_viewWillLayoutSubviews__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  CGFloat v7 = [a4 processHandle];
  double v8 = PRUISLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v9 = objc_msgSend(v6, "pui_shortDescription");
    double v10 = objc_msgSend(v7, "pb_shortDesc");
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    BOOL v17 = v10;
    _os_log_impl(&dword_25A03F000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ now connected to %{public}@", buf, 0x16u);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__PRUISAmbientPosterViewController_scene_clientDidConnect___block_invoke;
  v12[3] = &unk_26546B740;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(PRUISAmbientPosterViewController *)self _enumerateSceneObserversRespondingToSelector:sel_ambientPosterViewController_didConnectToScene_ usingBlock:v12];
}

uint64_t __59__PRUISAmbientPosterViewController_scene_clientDidConnect___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ambientPosterViewController:*(void *)(a1 + 32) didConnectToScene:*(void *)(a1 + 40)];
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a4;
  CGFloat v5 = PRUISLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_25A03F000, v5, OS_LOG_TYPE_DEFAULT, "Poster sent actions: %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (void)sceneContentStateDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CGFloat v5 = PRUISLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [v4 contentState];
    id v6 = NSStringFromFBSceneContentState();
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_25A03F000, v5, OS_LOG_TYPE_DEFAULT, "Poster content state did change to %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__PRUISAmbientPosterViewController_sceneContentStateDidChange___block_invoke;
  block[3] = &unk_26546B3B8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __63__PRUISAmbientPosterViewController_sceneContentStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForCurrentPresentationMode];
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = PRUISLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend(v6, "pui_shortDescription");
    uint64_t v10 = [v7 descriptionWithMultilinePrefix:0];
    *(_DWORD *)buf = 138543618;
    double v22 = *(double *)&v9;
    __int16 v23 = 2114;
    BOOL v24 = v10;
    _os_log_impl(&dword_25A03F000, v8, OS_LOG_TYPE_DEFAULT, "Poster %{public}@ deactivated with error: %{public}@", buf, 0x16u);
  }
  [(PRUISSessionReconnectPolicy *)self->_reconnectPolicy sessionDidDisconnect];
  unint64_t presentationMode = self->_presentationMode;
  if ([(PRUISAmbientPosterViewController *)self _appearState] && presentationMode == 2)
  {
    [(PRUISSessionReconnectPolicy *)self->_reconnectPolicy sessionReconnectDelay];
    double v13 = v12;
    uint64_t v14 = PRUISLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v22 = v13;
      _os_log_impl(&dword_25A03F000, v14, OS_LOG_TYPE_DEFAULT, "Will attempt reactivation of ambient scene in %0.3f seconds.", buf, 0xCu);
    }

    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__PRUISAmbientPosterViewController_sceneDidDeactivate_withError___block_invoke;
    block[3] = &unk_26546B3B8;
    block[4] = self;
    dispatch_after(v15, MEMORY[0x263EF83A0], block);
  }
  else
  {
    __int16 v16 = PRUISLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25A03F000, v16, OS_LOG_TYPE_DEFAULT, "Not attempting reactivation of ambient scene at this time.", buf, 2u);
    }

    [(PRUISAmbientPosterViewController *)self _teardownScene];
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__PRUISAmbientPosterViewController_sceneDidDeactivate_withError___block_invoke_116;
  v18[3] = &unk_26546B740;
  v18[4] = self;
  id v19 = v6;
  id v17 = v6;
  [(PRUISAmbientPosterViewController *)self _enumerateSceneObserversRespondingToSelector:sel_ambientPosterViewController_didDeactivateScene_ usingBlock:v18];
}

uint64_t __65__PRUISAmbientPosterViewController_sceneDidDeactivate_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSceneWithCompletion:0];
}

uint64_t __65__PRUISAmbientPosterViewController_sceneDidDeactivate_withError___block_invoke_116(uint64_t a1, void *a2)
{
  return [a2 ambientPosterViewController:*(void *)(a1 + 32) didDeactivateScene:*(void *)(a1 + 40)];
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (objc_msgSend(v11, "pr_updateSnapshot"))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __110__PRUISAmbientPosterViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
    block[3] = &unk_26546B3B8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  if (objc_msgSend(v10, "pr_hideChromeDidChange"))
  {
    double v12 = [v9 clientSettings];
    uint64_t v13 = objc_msgSend(v12, "pr_hideChrome");

    uint64_t v14 = [(PRUISAmbientPosterViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      dispatch_time_t v15 = [v11 animationSettings];
      __int16 v16 = [v11 animationFence];
      [v14 ambientPosterViewController:self setChromeVisibility:v13 withAnimationSettings:v15 animationFence:v16];
    }
  }
  if (objc_msgSend(v10, "pui_significantEventsDidChange"))
  {
    id v17 = [v9 clientSettings];
    objc_msgSend(v17, "pui_significantEventOptions");

    [(PRUISAmbientPosterViewController *)self _setClientWantsScreenWakeEvents:PUIPosterSignificantEventOptionsContainsEvent()];
  }
  id v18 = objc_alloc_init(MEMORY[0x263F3F4C8]);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __110__PRUISAmbientPosterViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2;
  v19[3] = &unk_26546B768;
  v19[4] = self;
  [v18 observeLayersWithBlock:v19];
  objc_msgSend(v18, "inspectDiff:withContext:", v10, objc_msgSend(v9, "clientSettings"));
  [v18 removeAllObservers];
}

uint64_t __110__PRUISAmbientPosterViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _takeNewSnapshots];
}

uint64_t __110__PRUISAmbientPosterViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSceneLayerPresenters];
}

- (void)setShouldShareTouchesWithHost:(BOOL)a3
{
  if (self->_shouldShareTouchesWithHost != a3)
  {
    self->_shouldShareTouchesWithHost = a3;
    if (a3) {
      [(PRUISAmbientPosterViewController *)self _updateTouchDeliveryPolicies];
    }
    else {
      [(PRUISAmbientPosterViewController *)self _clearTouchDeliveryPolicies];
    }
  }
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssertMain();
  v29 = self;
  objc_initWeak(&location, self);
  uint64_t v38 = MEMORY[0x263EF8330];
  uint64_t v39 = 3221225472;
  v40 = __79__PRUISAmbientPosterViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke;
  id v41 = &unk_26546B790;
  v27 = &v42;
  objc_copyWeak(&v42, &location);
  uint64_t v31 = BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
  id v3 = [(PRUISAmbientPosterViewController *)self view];
  id v28 = [v3 _window];

  if (v31 && v28)
  {
    objc_msgSend((id)*MEMORY[0x263F1D020], "_initialTouchTimestampForWindow:", v28, &v42);
    double v5 = v4;
    id v6 = [(FBScene *)v29->_scene layerManager];
    id v7 = [v6 layers];

    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = [*(id *)(*((void *)&v34 + 1) + 8 * i) contextID];
          id v13 = objc_alloc_init(MEMORY[0x263F298B8]);
          uint64_t v14 = [MEMORY[0x263F298B0] policyCancelingTouchesDeliveredToContextId:v12 withInitialTouchTimestamp:v5];
          dispatch_time_t v15 = [v13 endpoint];
          [v14 setAssertionEndpoint:v15];

          objc_msgSend(v31, "ipc_addPolicy:", v14);
          __int16 v16 = PRUISLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544130;
            uint64_t v45 = v29;
            __int16 v46 = 2114;
            id v47 = v13;
            __int16 v48 = 2050;
            unint64_t v49 = v12;
            __int16 v50 = 2114;
            v51 = v14;
            _os_log_impl(&dword_25A03F000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Acquired cancel touches assertion: %{public}@ (context id: 0x%{public}llx, policy: %{public}@)", buf, 0x2Au);
          }

          [v8 addObject:v13];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v52 count:16];
      }
      while (v9);
    }

    id v17 = objc_alloc(MEMORY[0x263F29CD8]);
    id v18 = [MEMORY[0x263F08C38] UUID];
    id v19 = [v18 UUIDString];
    uint64_t v20 = MEMORY[0x263EF83A0];
    id v21 = MEMORY[0x263EF83A0];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __79__PRUISAmbientPosterViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke_129;
    v32[3] = &unk_26546B7B8;
    id v22 = v8;
    id v33 = v22;
    __int16 v23 = (void *)[v17 initWithIdentifier:v19 forReason:@"cancel touches in poster" queue:v20 invalidationBlock:v32];

    BOOL v24 = PRUISLogCommon();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v29;
      __int16 v46 = 2114;
      id v47 = v23;
      _os_log_impl(&dword_25A03F000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Made cancel touches group assertion: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v25 = PRUISLogCommon();
    obj = v25;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v45 = v29;
      __int16 v46 = 2114;
      id v47 = v31;
      __int16 v48 = 2114;
      unint64_t v49 = (unint64_t)v28;
      _os_log_impl(&dword_25A03F000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did not make cancel touches group assertion because of server: %{public}@, or window: %{public}@", buf, 0x20u);
    }
    __int16 v23 = 0;
  }

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  return v23;
}

void __79__PRUISAmbientPosterViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = PRUISLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543618;
      id v7 = WeakRetained;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_25A03F000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending cancellation touch delivery policy failed with error: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void __79__PRUISAmbientPosterViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke_129(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "invalidate", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_updateSceneWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(PRUISAmbientPosterViewController *)self viewIfLoaded];
  uint64_t v5 = [v6 window];
  [(PRUISAmbientPosterViewController *)self _updateSceneWithCompletion:v4 window:v5];
}

- (void)_updateSceneWithCompletion:(id)a3 window:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:window:orientation:](self, "_updateSceneWithCompletion:window:orientation:", v7, v6, [v6 _windowInterfaceOrientation]);
}

- (void)_updateSceneWithCompletion:(id)a3 window:(id)a4 orientation:(int64_t)a5
{
  long long v8 = (void (**)(void))a3;
  id v9 = a4;
  int v10 = [(PRUISAmbientPosterViewController *)self _appearState];
  unint64_t presentationMode = self->_presentationMode;
  int64_t v12 = [(PRUISAmbientPosterViewController *)self _renderingModeForVisibility:self->_visibility];
  if (self->_scene)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __82__PRUISAmbientPosterViewController__updateSceneWithCompletion_window_orientation___block_invoke;
    v22[3] = &unk_26546B7E0;
    if (v10) {
      BOOL v13 = presentationMode == 2;
    }
    else {
      BOOL v13 = 0;
    }
    int v14 = v13;
    char v26 = v14;
    int64_t v24 = v12;
    int64_t v25 = a5;
    v22[4] = self;
    id v23 = v9;
    dispatch_time_t v15 = (void *)MEMORY[0x25A2F4350](v22);
    scene = self->_scene;
    if (v14 == 1)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __82__PRUISAmbientPosterViewController__updateSceneWithCompletion_window_orientation___block_invoke_2;
      v20[3] = &unk_26546B808;
      id v17 = (id *)&v21;
      id v21 = v8;
      [(FBScene *)scene performUpdate:v15 withCompletion:v20];
    }
    else
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __82__PRUISAmbientPosterViewController__updateSceneWithCompletion_window_orientation___block_invoke_3;
      v18[3] = &unk_26546B808;
      id v17 = (id *)&v19;
      id v19 = v8;
      [(FBScene *)scene pruis_updateWithoutActivating:v15 withCompletion:v18];
      if ([(FBScene *)self->_scene isActive]) {
        [(FBScene *)self->_scene deactivate:&__block_literal_global_135];
      }
    }
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

void __82__PRUISAmbientPosterViewController__updateSceneWithCompletion_window_orientation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 4294967293;
  }
  [v14 setActivityMode:v6];
  objc_msgSend(v14, "pui_setMode:", *(void *)(a1 + 48));
  objc_msgSend(v14, "pui_setContent:", objc_msgSend(*(id *)(a1 + 32), "isPreview"));
  objc_msgSend(v14, "pui_setPosterBoundingShape:", objc_msgSend(*(id *)(a1 + 32), "boundingShape"));
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = [v14 interfaceOrientation];
  if (v7)
  {
    if (v8 != v7)
    {
      [v14 setInterfaceOrientation:v7];
      objc_msgSend(v14, "pr_setTitleAlignment:", objc_msgSend(*(id *)(a1 + 32), "_titleAlignmentForInterfaceOrientation:", v7));
      if (v5)
      {
        if ([*(id *)(*(void *)(a1 + 32) + 984) isActive])
        {
          id v9 = *(void **)(a1 + 40);
          if (v9)
          {
            int v10 = [v9 windowScene];
            [v10 _synchronizeDrawing];
            uint64_t v11 = [v10 _synchronizedDrawingFence];
            [v5 setAnimationFence:v11];

            int64_t v12 = (void *)MEMORY[0x263F29BC8];
            [MEMORY[0x263F1CB60] inheritedAnimationDuration];
            BOOL v13 = objc_msgSend(v12, "settingsWithDuration:");
            [v5 setAnimationSettings:v13];
          }
        }
      }
    }
  }
  [*(id *)(a1 + 32) _updateAmbientPresentationSettingsForSceneSettings:v14];
}

uint64_t __82__PRUISAmbientPosterViewController__updateSceneWithCompletion_window_orientation___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __82__PRUISAmbientPosterViewController__updateSceneWithCompletion_window_orientation___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)_titleAlignmentForInterfaceOrientation:(int64_t)a3
{
  id v5 = [(PRUISAmbientPosterViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v6 = [v5 ambientPosterViewController:self titleAlignmentForInterfaceOrientation:a3];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)_effectivePresentationMode
{
  unint64_t result = self->_presentationMode;
  if (result >= 2)
  {
    if (result == 2)
    {
      scene = self->_scene;
      if (!scene) {
        return 1;
      }
      unint64_t result = [(FBScene *)scene contentState];
      if (result != 2) {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int64_t)_renderingModeForVisibility:(unint64_t)a3
{
  int64_t v3 = 2;
  if (a3 != 1) {
    int64_t v3 = 3;
  }
  if (a3 == 2) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)_updateForCurrentIsSnapshot
{
}

- (void)_updateForCurrentVisibility
{
}

- (void)_updateForCurrentPresentationMode
{
  unint64_t v3 = [(PRUISAmbientPosterViewController *)self _effectivePresentationMode];
  if (!v3)
  {
    [(UIView *)self->_sceneView setHidden:1];
    [(PRUISAmbientPosterSceneLayerHostView *)self->_backgroundSceneLayerView setHidden:1];
    [(PRUISAmbientPosterSceneLayerHostView *)self->_foregroundSceneLayerView setHidden:1];
    [(PRUISAmbientPosterSceneLayerHostView *)self->_floatingSceneLayerView setHidden:1];
    snapshotContainerView = self->_snapshotContainerView;
    uint64_t v6 = 1;
LABEL_7:
    [(UIView *)snapshotContainerView setHidden:v6];
    goto LABEL_8;
  }
  if (v3 == 1)
  {
    [(UIView *)self->_sceneView setHidden:1];
    [(PRUISAmbientPosterSceneLayerHostView *)self->_backgroundSceneLayerView setHidden:1];
    [(PRUISAmbientPosterSceneLayerHostView *)self->_foregroundSceneLayerView setHidden:1];
    [(PRUISAmbientPosterSceneLayerHostView *)self->_floatingSceneLayerView setHidden:1];
    snapshotContainerView = self->_snapshotContainerView;
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  if (v3 != 2)
  {
LABEL_8:
    id v4 = 0;
    goto LABEL_9;
  }
  [(UIView *)self->_sceneView setHidden:0];
  [(PRUISAmbientPosterSceneLayerHostView *)self->_backgroundSceneLayerView setHidden:0];
  [(PRUISAmbientPosterSceneLayerHostView *)self->_foregroundSceneLayerView setHidden:0];
  [(PRUISAmbientPosterSceneLayerHostView *)self->_floatingSceneLayerView setHidden:0];
  [(UIView *)self->_snapshotContainerView setHidden:0];
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __69__PRUISAmbientPosterViewController__updateForCurrentPresentationMode__block_invoke;
  int v10 = &unk_26546B850;
  objc_copyWeak(&v11, &location);
  id v4 = (void *)MEMORY[0x25A2F4350](&v7);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
LABEL_9:
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:](self, "_updateSceneWithCompletion:", v4, v7, v8, v9, v10);
}

void __69__PRUISAmbientPosterViewController__updateForCurrentPresentationMode__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTouchDeliveryPolicies];
}

- (void)_enumerateSnapshotLayerViews:(id)a3
{
  id v4 = (void (**)(id, UIImageView *, uint64_t))((char *)a3 + 16);
  id v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_snapshotForegroundLayerView, 2);
  (*v4)(v6, self->_snapshotFloatingLayerView, 4);
}

- (id)_snapshotBundle:(id)a3 imageForLayer:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = 0;
  switch(a4)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      uint64_t v8 = [v5 compositeSnapshot];
      goto LABEL_6;
    case 1uLL:
      uint64_t v8 = [v5 backgroundSnapshot];
      goto LABEL_6;
    case 2uLL:
      uint64_t v8 = [v5 foregroundSnapshot];
      goto LABEL_6;
    case 4uLL:
      uint64_t v8 = [v5 floatingSnapshot];
LABEL_6:
      uint64_t v7 = (void *)v8;
      break;
    default:
      break;
  }

  return v7;
}

- (void)_updateForSnapshotBundle:(id)a3
{
  id v4 = a3;
  self->_loadedPosterSnapshotLayers = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__PRUISAmbientPosterViewController__updateForSnapshotBundle___block_invoke;
  v6[3] = &unk_26546B878;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PRUISAmbientPosterViewController *)self _enumerateSnapshotLayerViews:v6];
}

void __61__PRUISAmbientPosterViewController__updateForSnapshotBundle___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v3 = *(void **)(a1 + 32);
  if ((v3[149] & a3) != 0)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = a2;
    id v8 = [v3 _snapshotBundle:v6 imageForLayer:a3];
    objc_msgSend(v7, "setImage:");

    *(void *)(*(void *)(a1 + 32) + 1040) |= a3;
  }
  else
  {
    id v8 = a2;
    [v8 setImage:0];
  }
}

- (void)_updateSnapshotLayerVisibility
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __66__PRUISAmbientPosterViewController__updateSnapshotLayerVisibility__block_invoke;
  v2[3] = &unk_26546B6F8;
  v2[4] = self;
  [(PRUISAmbientPosterViewController *)self _enumerateSnapshotLayerViews:v2];
}

uint64_t __66__PRUISAmbientPosterViewController__updateSnapshotLayerVisibility__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setHidden:(*(void *)(*(void *)(a1 + 32) + 1192) & a3) == 0];
}

- (id)_currentSnapshotDefinition
{
  scene = self->_scene;
  if (scene
    && ([(FBScene *)scene settings],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 conformsToProtocol:&unk_270820DE0],
        v4,
        v5))
  {
    uint64_t v6 = [(FBScene *)self->_scene settings];
  }
  else
  {
    uint64_t v6 = [(PRUISAmbientPosterViewController *)self traitCollection];
  }
  id v7 = v6;
  uint64_t v8 = [v6 ambientDisplayStyle];

  if (v8 == 1)
  {
    id v9 = [MEMORY[0x263F5F518] redmodeAmbientPosterSnapshotDefinition];
  }
  else if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [MEMORY[0x263F5F518] defaultAmbientPosterSnapshotDefinition];
  }

  return v9;
}

- (int64_t)_currentOrientation
{
  uint64_t v2 = [(PRUISAmbientPosterViewController *)self viewIfLoaded];
  unint64_t v3 = [v2 window];

  if (v3) {
    int64_t v4 = [v3 _windowInterfaceOrientation];
  }
  else {
    int64_t v4 = 4;
  }

  return v4;
}

- (void)_updateSnapshots
{
}

- (void)_updateSnapshotsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PRUISAmbientPosterViewController *)self _shouldSnapshot])
  {
    int v5 = self->_configuration;
    uint64_t v6 = [(PRUISAmbientPosterViewController *)self _currentSnapshotDefinition];
    id v9 = +[PRUISPosterSnapshotRequest snapshotRequestForPRSPosterConfiguration:v5 definition:v6 interfaceOrientation:[(PRUISAmbientPosterViewController *)self _currentOrientation]];

    id v7 = [(PRUISAmbientPosterViewController *)self snapshotController];
    uint64_t v8 = [v7 currentSnapshotBundleForRequest:v9 error:0];

    if (v8) {
      [(PRUISAmbientPosterViewController *)self _updateForSnapshotBundle:v8];
    }
    else {
      [(PRUISAmbientPosterViewController *)self _fetchSnapshotsWithRequest:v9 animated:v3];
    }
  }
}

- (void)_takeNewSnapshots
{
  if ([(PRUISAmbientPosterViewController *)self _shouldSnapshot])
  {
    BOOL v3 = self->_configuration;
    int64_t v4 = [(PRUISAmbientPosterViewController *)self _currentSnapshotDefinition];
    int v5 = +[PRUISPosterSnapshotRequest snapshotRequestForPRSPosterConfiguration:v3 definition:v4 interfaceOrientation:[(PRUISAmbientPosterViewController *)self _currentOrientation]];

    uint64_t v6 = [(PRUISAmbientPosterViewController *)self snapshotController];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__PRUISAmbientPosterViewController__takeNewSnapshots__block_invoke;
    v8[3] = &unk_26546B8A0;
    id v9 = v3;
    id v7 = v3;
    [v6 executeSnapshotRequest:v5 completion:v8];
  }
}

void __53__PRUISAmbientPosterViewController__takeNewSnapshots__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = PRUISLogCommon();
  uint64_t v8 = v7;
  if (!a3 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__PRUISAmbientPosterViewController__takeNewSnapshots__block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_25A03F000, v8, OS_LOG_TYPE_DEFAULT, "Regenerate snapshot for configuration %{public}@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_fetchSnapshotsWithRequest:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  configuration = self->_configuration;
  if (configuration)
  {
    uint64_t v8 = configuration;
    objc_initWeak(&location, self);
    uint64_t v9 = [(PRUISAmbientPosterViewController *)self snapshotController];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke;
    v11[3] = &unk_26546B910;
    objc_copyWeak(&v13, &location);
    int v10 = v8;
    uint64_t v12 = v10;
    BOOL v14 = a4;
    [v9 executeSnapshotRequest:v6 completion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = WeakRetained;
  if (!v6 || v7)
  {
    int v10 = PRUISLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke_cold_1();
    }
  }
  else if (WeakRetained)
  {
    id v11 = v6;
    BSDispatchMain();
  }
}

void __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke_194(uint64_t a1)
{
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke_2;
  int v10 = &unk_26546B148;
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v2;
  uint64_t v3 = MEMORY[0x25A2F4350](&v7);
  int64_t v4 = (void *)v3;
  if (*(unsigned char *)(a1 + 48))
  {
    int v5 = (void *)MEMORY[0x263F1CB60];
    id v6 = objc_msgSend(*(id *)(a1 + 32), "view", v7, v8, v9, v10, v11);
    [v5 transitionWithView:v6 duration:5242880 options:v4 animations:&__block_literal_global_197 completion:0.25];
  }
  else
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

void __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1056);
  uint64_t v3 = [*(id *)(a1 + 40) backgroundLayerImage];
  [v2 setImage:v3];

  int64_t v4 = *(void **)(*(void *)(a1 + 32) + 1064);
  int v5 = [*(id *)(a1 + 40) foregroundLayerImage];
  [v4 setImage:v5];

  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 1072);
  id v8 = [v6 floatingLayerImage];
  [v7 setImage:v8];
}

- (void)_noteWindowWillRotate:(id)a3
{
  int64_t v4 = [a3 userInfo];
  int v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F1D828]];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  id v12 = [(PRUISAmbientPosterViewController *)self viewIfLoaded];
  int v10 = [v12 window];
  uint64_t v11 = [v9 integerValue];

  [(PRUISAmbientPosterViewController *)self _updateSceneWithCompletion:0 window:v10 orientation:v11];
}

- (void)_registerForAmbientPresentationTraitChanges
{
  v8[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = self;
  v8[0] = v3;
  int64_t v4 = self;
  v8[1] = v4;
  int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  uint64_t v6 = [(PRUISAmbientPosterViewController *)self registerForTraitChanges:v5 withHandler:&__block_literal_global_202];
  ambientPresentationTraitChangeRegistration = self->_ambientPresentationTraitChangeRegistration;
  self->_ambientPresentationTraitChangeRegistration = v6;
}

void __79__PRUISAmbientPosterViewController__registerForAmbientPresentationTraitChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = a2;
  uint64_t v3 = [v2 traitCollection];
  int64_t v4 = PRUISLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = objc_msgSend(v2[123], "pui_shortDescription");
    int v6 = [v3 isAmbientPresented];
    [v3 ambientDisplayStyle];
    id v7 = AMUIAmbientDisplayStyleString();
    int v8 = 138543874;
    id v9 = v5;
    __int16 v10 = 1024;
    int v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_25A03F000, v4, OS_LOG_TYPE_DEFAULT, "Updated ambient presentation traits for scene %{public}@ [ isAmbientPresented=%{BOOL}d ; ambientDisplayStyle=%{public}@ ]",
      (uint8_t *)&v8,
      0x1Cu);
  }
  [v2 _updateSceneWithCompletion:0];
}

- (void)_updateAmbientPresentationSettingsForSceneSettings:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(PRUISAmbientPosterViewController *)self traitCollection];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setAmbientPresented:", objc_msgSend(v4, "isAmbientPresented"));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setAmbientDisplayStyle:", objc_msgSend(v4, "ambientDisplayStyle"));
  }
}

- (id)_posterProviderForPosterPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PRUISAmbientPosterViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = [v5 ambientPosterViewControllerRequestExtensionInstanceIdentifier:self];
  }
  else
  {
    int v6 = 0;
  }
  id v7 = [MEMORY[0x263F5F428] extensionInstanceForPath:v4 instanceIdentifier:v6];

  return v7;
}

- (void)_setupScene
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __47__PRUISAmbientPosterViewController__setupScene__block_invoke;
  v15[3] = &unk_26546B980;
  objc_copyWeak(&v16, &location);
  v15[4] = self;
  v15[5] = &v18;
  uint64_t v3 = (void (**)(void))MEMORY[0x25A2F4350](v15);
  v3[2]();
  scene = self->_scene;
  if (!scene)
  {
    id v5 = PRUISLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_25A03F000, v5, OS_LOG_TYPE_DEFAULT, "Failed to create new ambient poster scene. Trying again.", v14, 2u);
    }

    *((unsigned char *)v19 + 24) = 1;
    ((void (*)(void (**)(void)))v3[2])(v3);
    scene = self->_scene;
  }
  int v6 = [(FBScene *)scene uiPresentationManager];
  id v7 = (objc_class *)objc_opt_class();
  int v8 = NSStringFromClass(v7);
  id v9 = [v6 createPresenterWithIdentifier:v8];
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = v9;

  [(UIScenePresenter *)self->_scenePresenter modifyPresentationContext:&__block_literal_global_213];
  [(UIScenePresenter *)self->_scenePresenter activate];
  int v11 = [(UIScenePresenter *)self->_scenePresenter presentationView];
  __int16 v12 = [(PRUISAmbientPosterViewController *)self view];
  [v12 bounds];
  -[UIView setFrame:](v11, "setFrame:");
  [(UIView *)v11 setAutoresizingMask:18];
  [v12 insertSubview:v11 belowSubview:self->_backgroundSceneLayerView];
  [(PRUISAmbientPosterViewController *)self _updateSceneLayerPresenters];
  [(PRUISAmbientPosterViewController *)self _updateTouchDeliveryPolicies];
  sceneView = self->_sceneView;
  self->_sceneView = v11;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);
}

void __47__PRUISAmbientPosterViewController__setupScene__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[122] _path];
    id v5 = [v3 _posterProviderForPosterPath:v4];
    uint64_t v6 = [v3 _currentOrientation];
    id v7 = (void *)MEMORY[0x263F3F4E0];
    uint64_t v8 = *MEMORY[0x263F5F5E0];
    id v9 = [v3[122] _path];
    __int16 v10 = objc_msgSend(v7, "pr_createPosterSceneWithRole:path:instance:", v8, v9, v5);

    [v10 addExtension:objc_opt_class()];
    [v10 setDelegate:v3];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __47__PRUISAmbientPosterViewController__setupScene__block_invoke_2;
    v16[3] = &unk_26546B958;
    uint64_t v11 = *(void *)(a1 + 32);
    v16[5] = v3;
    v16[6] = v6;
    v16[4] = v11;
    objc_msgSend(v10, "pruis_updateWithoutActivating:", v16);
    objc_storeStrong(v3 + 123, v10);
    uint64_t v12 = [v5 instanceIdentifier];
    id v13 = v3[126];
    v3[126] = (id)v12;

    if (v10)
    {
      uint64_t v14 = PRUISLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_time_t v15 = objc_msgSend(v10, "pui_shortDescription");
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v15;
        _os_log_impl(&dword_25A03F000, v14, OS_LOG_TYPE_DEFAULT, "Created new ambient poster scene: %@", buf, 0xCu);
      }
    }
    else
    {
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v14 = PRUISLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25A03F000, v14, OS_LOG_TYPE_DEFAULT, "Failed to create new ambient poster scene again.", buf, 2u);
      }
    }

    goto LABEL_9;
  }
LABEL_10:
}

void __47__PRUISAmbientPosterViewController__setupScene__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 displayConfiguration];
  [v4 setForeground:1];
  [v6 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setInterfaceOrientation:*(void *)(a1 + 48)];
  objc_msgSend(v4, "pr_setTitleAlignment:", objc_msgSend(*(id *)(a1 + 32), "_titleAlignmentForInterfaceOrientation:", *(void *)(a1 + 48)));
  [v4 setDisplayConfiguration:v6];
  id v5 = [*(id *)(a1 + 40) traitCollection];
  objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  [v4 setActivityMode:4294967293];
  objc_msgSend(v4, "pui_setExtensionUserInteractionEnabled:", objc_msgSend(*(id *)(a1 + 32), "isExtensionUserInteractionEnabled"));
  [*(id *)(a1 + 40) _updateAmbientPresentationSettingsForSceneSettings:v4];
}

void __47__PRUISAmbientPosterViewController__setupScene__block_invoke_210(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:2];
  [v2 setClippingDisabled:0];
  id v3 = [MEMORY[0x263F1C550] blackColor];
  [v2 setBackgroundColorWhileHosting:v3];
}

- (void)_teardownScene
{
  [(FBScene *)self->_scene pui_invalidateWithCompletion:0];
  scene = self->_scene;
  self->_scene = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_sceneExtensionInstanceIdentifier && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained ambientPosterViewController:self relinquishExtensionInstanceIdentifier:self->_sceneExtensionInstanceIdentifier];
    sceneExtensionInstanceIdentifier = self->_sceneExtensionInstanceIdentifier;
    self->_sceneExtensionInstanceIdentifier = 0;
  }
  [(UIView *)self->_sceneView removeFromSuperview];
  sceneView = self->_sceneView;
  self->_sceneView = 0;

  [(UIScenePresenter *)self->_scenePresenter deactivate];
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  [(PRUISAmbientPosterViewController *)self _resetScreenWakeStateForTeardown:1];
  [(PRUISAmbientPosterSceneLayerHostView *)self->_backgroundSceneLayerView invalidate];
  [(PRUISAmbientPosterSceneLayerHostView *)self->_foregroundSceneLayerView invalidate];
  [(PRUISAmbientPosterSceneLayerHostView *)self->_floatingSceneLayerView invalidate];
}

- (void)_updateSnapshotOpacities
{
  [(UIImageView *)self->_snapshotBackgroundLayerView setAlpha:self->_backgroundOpacity];
  [(UIImageView *)self->_snapshotForegroundLayerView setAlpha:self->_foregroundOpacity];
  snapshotFloatingLayerView = self->_snapshotFloatingLayerView;
  floatingOpacitdouble y = self->_floatingOpacity;

  [(UIImageView *)snapshotFloatingLayerView setAlpha:floatingOpacity];
}

- (void)_updateSeparatedLayerHosting
{
  if (BSFloatIsOne() && BSFloatIsOne() && BSFloatIsOne())
  {
    uint64_t v3 = 0;
  }
  else
  {
    [(PRUISAmbientPosterSceneLayerHostView *)self->_backgroundSceneLayerView setAlpha:self->_backgroundOpacity];
    [(PRUISAmbientPosterSceneLayerHostView *)self->_foregroundSceneLayerView setAlpha:self->_foregroundOpacity];
    [(PRUISAmbientPosterSceneLayerHostView *)self->_floatingSceneLayerView setAlpha:self->_floatingOpacity];
    uint64_t v3 = 1;
  }
  [(PRUISAmbientPosterSceneLayerHostView *)self->_backgroundSceneLayerView setActive:v3];
  [(PRUISAmbientPosterSceneLayerHostView *)self->_foregroundSceneLayerView setActive:v3];
  floatingSceneLayerView = self->_floatingSceneLayerView;

  [(PRUISAmbientPosterSceneLayerHostView *)floatingSceneLayerView setActive:v3];
}

- (void)_updateSceneLayerPresenters
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [(FBScene *)self->_scene layerManager];
  id v4 = [v3 layers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
    double v11 = (double)(uint64_t)*MEMORY[0x263F5F540];
    double v12 = (double)(uint64_t)*MEMORY[0x263F5F560];
    double v13 = (double)(uint64_t)*MEMORY[0x263F5F550];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v4);
        }
        dispatch_time_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v15 level];
        double v17 = v16;
        if ([v15 type] == 1)
        {
          if (v17 == v11)
          {
            uint64_t v9 = [v15 contextID];
          }
          else if (v17 == v12)
          {
            uint64_t v7 = [v15 contextID];
          }
          else if (v17 == v13)
          {
            uint64_t v8 = [v15 contextID];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }

  if ([(PRUISAmbientPosterSceneLayerHostView *)self->_backgroundSceneLayerView setContextID:v9 scene:self->_scene]|| [(PRUISAmbientPosterSceneLayerHostView *)self->_foregroundSceneLayerView setContextID:v7 scene:self->_scene]|| [(PRUISAmbientPosterSceneLayerHostView *)self->_floatingSceneLayerView setContextID:v8 scene:self->_scene])
  {
    [(PRUISAmbientPosterViewController *)self _updateSeparatedLayerHosting];
  }
}

- (void)_updateTouchDeliveryPolicies
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssertMain();
  if (self->_shouldShareTouchesWithHost
    && self->_presentationMode == 2
    && self->_scene
    && ([(PRUISAmbientPosterViewController *)self view],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 _window],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    uint64_t v5 = [(FBScene *)self->_scene layerManager];
    uint64_t v6 = [v5 layers];

    id v7 = objc_alloc(MEMORY[0x263EFF9C0]);
    uint64_t v8 = [(NSMutableDictionary *)self->_touchDeliveryPolicyAssertions allKeys];
    id v47 = (void *)[v7 initWithArray:v8];

    uint64_t v9 = [(PRUISAmbientPosterViewController *)self view];
    uint64_t v10 = [v9 _window];
    unsigned int v44 = [v10 _contextId];

    double v11 = PRUISLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v64 = self;
      __int16 v65 = 2114;
      v66 = v6;
      _os_log_impl(&dword_25A03F000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Updating touch delivery policies for layers: %{public}@", buf, 0x16u);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    obuint64_t j = v6;
    uint64_t v12 = [obj countByEnumeratingWithState:&v59 objects:v74 count:16];
    if (v12)
    {
      uint64_t v46 = *(void *)v60;
      *(void *)&long long v13 = 138412802;
      long long v43 = v13;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v60 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * i), "contextID", v43);
          double v16 = [NSNumber numberWithUnsignedInt:v15];
          [v47 removeObject:v16];

          touchDeliveryPolicyAssertions = self->_touchDeliveryPolicyAssertions;
          long long v18 = [NSNumber numberWithUnsignedInt:v15];
          long long v19 = [(NSMutableDictionary *)touchDeliveryPolicyAssertions objectForKey:v18];
          LODWORD(touchDeliveryPolicyAssertions) = v19 == 0;

          if (touchDeliveryPolicyAssertions)
          {
            long long v20 = (__CFString *)objc_alloc_init(MEMORY[0x263F298B8]);
            long long v21 = [MEMORY[0x263F298B0] policyRequiringSharingOfTouchesDeliveredToChildContextId:v15 withHostContextId:v44];
            id v22 = [(__CFString *)v20 endpoint];
            [v21 setAssertionEndpoint:v22];

            objc_initWeak(&location, self);
            uint64_t v52 = MEMORY[0x263EF8330];
            uint64_t v53 = 3221225472;
            v54 = __64__PRUISAmbientPosterViewController__updateTouchDeliveryPolicies__block_invoke;
            v55 = &unk_26546B9A8;
            objc_copyWeak(&v57, &location);
            id v23 = v21;
            id v56 = v23;
            int64_t v24 = BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
            if (v24)
            {
              int64_t v25 = PRUISLogCommon();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v43;
                v64 = self;
                __int16 v65 = 2114;
                v66 = v20;
                __int16 v67 = 2050;
                unint64_t v68 = v15;
                _os_log_impl(&dword_25A03F000, v25, OS_LOG_TYPE_DEFAULT, "[%@] Saving touch policy assertion %{public}@ for context id 0x%{public}llx", buf, 0x20u);
              }

              char v26 = self->_touchDeliveryPolicyAssertions;
              if (!v26)
              {
                v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
                id v28 = self->_touchDeliveryPolicyAssertions;
                self->_touchDeliveryPolicyAssertions = v27;

                char v26 = self->_touchDeliveryPolicyAssertions;
              }
              v29 = [NSNumber numberWithUnsignedInt:v15];
              [(NSMutableDictionary *)v26 setObject:v20 forKey:v29];

              objc_msgSend(v24, "ipc_addPolicy:", v23);
            }

            objc_destroyWeak(&v57);
            objc_destroyWeak(&location);
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v59 objects:v74 count:16];
      }
      while (v12);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v30 = v47;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v48 objects:v73 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v49 != v32) {
            objc_enumerationMutation(v30);
          }
          long long v34 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          long long v35 = [(NSMutableDictionary *)self->_touchDeliveryPolicyAssertions objectForKey:v34];
          [(__CFString *)v35 invalidate];
          [(NSMutableDictionary *)self->_touchDeliveryPolicyAssertions removeObjectForKey:v34];
          long long v36 = PRUISLogCommon();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v37 = [v34 unsignedIntValue];
            *(_DWORD *)buf = 138412802;
            v64 = self;
            __int16 v65 = 2114;
            v66 = v35;
            __int16 v67 = 2050;
            unint64_t v68 = v37;
            _os_log_impl(&dword_25A03F000, v36, OS_LOG_TYPE_DEFAULT, "[%@] Invalidating assertion %{public}@ for context id 0x%{public}llx", buf, 0x20u);
          }
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v48 objects:v73 count:16];
      }
      while (v31);
    }
  }
  else
  {
    obuint64_t j = PRUISLogCommon();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_shouldShareTouchesWithHost) {
        uint64_t v38 = @"YES";
      }
      else {
        uint64_t v38 = @"NO";
      }
      unint64_t presentationMode = self->_presentationMode;
      scene = self->_scene;
      id v41 = [(PRUISAmbientPosterViewController *)self view];
      id v42 = [v41 _window];
      *(_DWORD *)buf = 138413314;
      v64 = self;
      __int16 v65 = 2114;
      v66 = v38;
      __int16 v67 = 2050;
      unint64_t v68 = presentationMode;
      __int16 v69 = 2114;
      v70 = scene;
      __int16 v71 = 2114;
      v72 = v42;
      _os_log_impl(&dword_25A03F000, obj, OS_LOG_TYPE_DEFAULT, "[%@] Couldn't update touch delivery policies: _shouldShareTouchesWithHost=%{public}@; _presentationMode=%{public"
        "}ld; _scene=%{public}@; window=%{public}@",
        buf,
        0x34u);
    }
  }
}

void __64__PRUISAmbientPosterViewController__updateTouchDeliveryPolicies__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = PRUISLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      id v8 = WeakRetained;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_25A03F000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Sending touch delivery policy %{public}@ failed with error: %{public}@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)_clearTouchDeliveryPolicies
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = PRUISLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl(&dword_25A03F000, v3, OS_LOG_TYPE_DEFAULT, "[%@] Clearing any touch delivery policies", (uint8_t *)&v4, 0xCu);
  }

  [(NSMutableDictionary *)self->_touchDeliveryPolicyAssertions enumerateKeysAndObjectsUsingBlock:&__block_literal_global_227];
  [(NSMutableDictionary *)self->_touchDeliveryPolicyAssertions removeAllObjects];
}

uint64_t __63__PRUISAmbientPosterViewController__clearTouchDeliveryPolicies__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (void)_enumerateSceneObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void (**)(id, void))a4;
  if (v5 && [(NSHashTable *)self->_sceneObservers count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = (void *)[(NSHashTable *)self->_sceneObservers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v11);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_backlightLuminanceTraitDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 traitCollection];
  uint64_t v8 = [v7 _backlightLuminance];

  if (!v8)
  {
    [(PRUISAmbientPosterViewController *)self _screenWillTurnOff];
    uint64_t v9 = (void *)MEMORY[0x263F29D20];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    long long v18 = __94__PRUISAmbientPosterViewController__backlightLuminanceTraitDidChange_previousTraitCollection___block_invoke;
    long long v19 = &unk_26546B3E0;
    long long v20 = self;
    uint64_t v10 = &v16;
    goto LABEL_5;
  }
  if (![v6 _backlightLuminance])
  {
    [(PRUISAmbientPosterViewController *)self _screenWillTurnOn];
    uint64_t v9 = (void *)MEMORY[0x263F29D20];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    long long v13 = __94__PRUISAmbientPosterViewController__backlightLuminanceTraitDidChange_previousTraitCollection___block_invoke_2;
    long long v14 = &unk_26546B3E0;
    long long v15 = self;
    uint64_t v10 = &v11;
LABEL_5:
    objc_msgSend(v9, "addAlongsideAnimations:completion:", 0, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

uint64_t __94__PRUISAmbientPosterViewController__backlightLuminanceTraitDidChange_previousTraitCollection___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _screenDidTurnOff];
  }
  return result;
}

uint64_t __94__PRUISAmbientPosterViewController__backlightLuminanceTraitDidChange_previousTraitCollection___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _screenDidTurnOn];
  }
  return result;
}

- (void)_screenDidTurnOn
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v3 = [(PRUISAmbientPosterViewController *)self bs_isAppearingOrAppeared];
  int v4 = PRUISLogCommon();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_25A03F000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring screen turn on because we're not active", (uint8_t *)&v12, 2u);
    }
    goto LABEL_10;
  }
  if (v5)
  {
    id v6 = [(FBScene *)self->_scene pui_shortDescription];
    int v12 = 138543362;
    long long v13 = v6;
    _os_log_impl(&dword_25A03F000, v4, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ observed screen turn on", (uint8_t *)&v12, 0xCu);
  }
  if (!self->_clientWantsScreenWakeEvents)
  {
    if (self->_clientEverWantedScreenWakeEvents)
    {
      int v4 = PRUISLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [(FBScene *)self->_scene pui_shortDescription];
        int v12 = 138543362;
        long long v13 = v9;
        _os_log_impl(&dword_25A03F000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring screen wake event because scene %{public}@ wanted them and later disabled them", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      ++self->_pendingScreenWakeCount;
      int v4 = PRUISLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [(FBScene *)self->_scene pui_shortDescription];
        uint64_t v11 = [NSNumber numberWithInteger:self->_pendingScreenWakeCount];
        int v12 = 138543618;
        long long v13 = v10;
        __int16 v14 = 2112;
        long long v15 = v11;
        _os_log_impl(&dword_25A03F000, v4, OS_LOG_TYPE_DEFAULT, "Deferring screen wake event for scene %{public}@. total deferred: %@", (uint8_t *)&v12, 0x16u);
      }
    }
LABEL_10:

    return;
  }
  uint64_t v7 = PRUISLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(FBScene *)self->_scene pui_shortDescription];
    int v12 = 138543362;
    long long v13 = v8;
    _os_log_impl(&dword_25A03F000, v7, OS_LOG_TYPE_DEFAULT, "Sending prompt screen wake event to scene %{public}@", (uint8_t *)&v12, 0xCu);
  }
  [(FBScene *)self->_scene pui_postSignificantEvent:3];
}

- (void)_resetScreenWakeStateForTeardown:(BOOL)a3
{
  self->_pendingScreenWakeCount = 0;
  self->_clientWantsScreenWakeEvents = 0;
  self->_clientEverWantedScreenWakeEvents = 0;
}

- (void)_setClientWantsScreenWakeEvents:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->_clientWantsScreenWakeEvents != a3)
  {
    BOOL v3 = a3;
    self->_BOOL clientWantsScreenWakeEvents = a3;
    BOOL v5 = PRUISLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(FBScene *)self->_scene pui_shortDescription];
      BOOL clientWantsScreenWakeEvents = self->_clientWantsScreenWakeEvents;
      BOOL clientEverWantedScreenWakeEvents = self->_clientEverWantedScreenWakeEvents;
      uint64_t v9 = [NSNumber numberWithInteger:self->_pendingScreenWakeCount];
      int v12 = 138544130;
      long long v13 = v6;
      __int16 v14 = 1024;
      BOOL v15 = clientWantsScreenWakeEvents;
      __int16 v16 = 1024;
      BOOL v17 = clientEverWantedScreenWakeEvents;
      __int16 v18 = 2112;
      long long v19 = v9;
      _os_log_impl(&dword_25A03F000, v5, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ wants screen wake events: %{BOOL}u  ever wanted screen wake events: %{BOOL}u  pending wake events: %@", (uint8_t *)&v12, 0x22u);
    }
    if (self->_clientWantsScreenWakeEvents && !self->_clientEverWantedScreenWakeEvents && self->_pendingScreenWakeCount)
    {
      uint64_t v10 = PRUISLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [(FBScene *)self->_scene pui_shortDescription];
        int v12 = 138543362;
        long long v13 = v11;
        _os_log_impl(&dword_25A03F000, v10, OS_LOG_TYPE_DEFAULT, "Sending deferred screen wake event to scene %{public}@", (uint8_t *)&v12, 0xCu);
      }
      [(FBScene *)self->_scene pui_postSignificantEvent:3];
      self->_pendingScreenWakeCount = 0;
    }
    if (v3) {
      self->_BOOL clientEverWantedScreenWakeEvents = 1;
    }
  }
}

- (BOOL)isPreview
{
  return self->_isPreview;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (unint64_t)visibleSnapshotLayers
{
  return self->_visibleSnapshotLayers;
}

- (BOOL)shouldShareTouchesWithHost
{
  return self->_shouldShareTouchesWithHost;
}

- (int64_t)boundingShape
{
  return self->_boundingShape;
}

- (PRUISAmbientPosterViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PRUISAmbientPosterViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isExtensionUserInteractionEnabled
{
  return self->_extensionUserInteractionEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__snapshotController, 0);
  objc_storeStrong((id *)&self->_sceneObservers, 0);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyAssertions, 0);
  objc_storeStrong((id *)&self->_ambientPresentationTraitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_floatingSceneLayerView, 0);
  objc_storeStrong((id *)&self->_foregroundSceneLayerView, 0);
  objc_storeStrong((id *)&self->_backgroundSceneLayerView, 0);
  objc_storeStrong((id *)&self->_snapshotFloatingLayerView, 0);
  objc_storeStrong((id *)&self->_snapshotForegroundLayerView, 0);
  objc_storeStrong((id *)&self->_snapshotBackgroundLayerView, 0);
  objc_storeStrong((id *)&self->_snapshotContainerView, 0);
  objc_storeStrong((id *)&self->_snapshotControllerKeepaliveAssertion, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_reconnectPolicy, 0);
  objc_storeStrong((id *)&self->_sceneExtensionInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)addSceneObserver:(id)a3
{
  id v8 = a3;
  int v4 = self;
  objc_sync_enter(v4);
  sceneObservers = v4->_sceneObservers;
  if (!sceneObservers)
  {
    uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    uint64_t v7 = v4->_sceneObservers;
    v4->_sceneObservers = (NSHashTable *)v6;

    sceneObservers = v4->_sceneObservers;
  }
  [(NSHashTable *)sceneObservers addObject:v8];
  objc_sync_exit(v4);
}

- (void)removeSceneObserver:(id)a3
{
  id v5 = a3;
  int v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_sceneObservers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)initWithBoundingShape:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  BOOL v15 = @"PRUISAmbientPosterViewController.m";
  __int16 v16 = 1024;
  int v17 = 120;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_25A03F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

void __53__PRUISAmbientPosterViewController__takeNewSnapshots__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_25A03F000, v0, v1, "Failed to regenerate snapshot for configuration %{public}@: error %@");
}

void __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_25A03F000, v0, v1, "Failed to fetch snapshot for configuration %{public}@: error %@");
}

@end