@interface ICSystemPaperSceneViewController
+ (void)presentSystemPaperWithUserActivityData:(id)a3 presenter:(id)a4 completion:(id)a5;
- (BOOL)isActive;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (ICSystemPaperSceneViewController)initWithCoder:(id)a3;
- (ICSystemPaperSceneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICSystemPaperSceneViewController)initWithUserActivityData:(id)a3;
- (NSData)userActivityData;
- (id)uiActivityContinuationActionForUserActivityData:(id)a3;
- (int64_t)contentState;
- (void)_adjustParentScene;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_teardown;
- (void)_update;
- (void)_updateSceneSafeAreaInsets;
- (void)_updateSceneToSize:(CGSize)a3 orientation:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6;
- (void)_updateSceneUIApplicationSceneSettingsWithBlock:(id)a3;
- (void)_updateSceneUserInterfaceStyle;
- (void)createLinkWithUserActivityData:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)registerForTraitChanges;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICSystemPaperSceneViewController

+ (void)presentSystemPaperWithUserActivityData:(id)a3 presenter:(id)a4 completion:(id)a5
{
}

- (ICSystemPaperSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (ICSystemPaperSceneViewController)initWithCoder:(id)a3
{
  return 0;
}

- (ICSystemPaperSceneViewController)initWithUserActivityData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSystemPaperSceneViewController;
  v5 = [(ICSystemPaperSceneViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    userActivityData = v5->_userActivityData;
    v5->_userActivityData = (NSData *)v6;
  }
  return v5;
}

- (void)viewDidLoad
{
  v29[4] = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)ICSystemPaperSceneViewController;
  [(ICSystemPaperSceneViewController *)&v28 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  id v4 = [(ICSystemPaperSceneViewController *)self view];
  [v4 bounds];
  v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  sceneContainerView = self->_sceneContainerView;
  self->_sceneContainerView = v5;

  [(UIView *)self->_sceneContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [(ICSystemPaperSceneViewController *)self view];
  [v7 addSubview:self->_sceneContainerView];

  v20 = (void *)MEMORY[0x263F08938];
  v26 = [(UIView *)self->_sceneContainerView leadingAnchor];
  v27 = [(ICSystemPaperSceneViewController *)self view];
  v25 = [v27 leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v29[0] = v24;
  v22 = [(UIView *)self->_sceneContainerView trailingAnchor];
  v23 = [(ICSystemPaperSceneViewController *)self view];
  v21 = [v23 trailingAnchor];
  v19 = [v22 constraintEqualToAnchor:v21];
  v29[1] = v19;
  v8 = [(UIView *)self->_sceneContainerView topAnchor];
  objc_super v9 = [(ICSystemPaperSceneViewController *)self view];
  v10 = [v9 topAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v29[2] = v11;
  v12 = [(UIView *)self->_sceneContainerView bottomAnchor];
  v13 = [(ICSystemPaperSceneViewController *)self view];
  v14 = [v13 bottomAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v29[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
  [v20 activateConstraints:v16];

  v17 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v18 = [(ICSystemPaperSceneViewController *)self view];
  [v18 setBackgroundColor:v17];

  [(ICSystemPaperSceneViewController *)self registerForTraitChanges];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSystemPaperSceneViewController;
  [(ICSystemPaperSceneViewController *)&v4 viewWillAppear:a3];
  self->_visible = 1;
  [(ICSystemPaperSceneViewController *)self _update];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSystemPaperSceneViewController;
  [(ICSystemPaperSceneViewController *)&v4 viewDidDisappear:a3];
  self->_visible = 0;
  [(ICSystemPaperSceneViewController *)self invalidate];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v17 = [v7 containerView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v17;
  }
  else
  {
    id v8 = [v17 window];
  }
  objc_super v9 = v8;
  if (v7)
  {
    uint64_t v10 = [v8 _toWindowOrientation];
    v11 = [(UIScene *)self->_uiParentScene _synchronizedDrawingFence];
    v12 = (void *)MEMORY[0x263F3F3D8];
    [v7 transitionDuration];
    v13 = objc_msgSend(v12, "settingsWithDuration:");
    -[ICSystemPaperSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v10, v13, v11, width, height);
  }
  else
  {
    uint64_t v14 = [(ICSystemPaperSceneViewController *)self interfaceOrientation];
    v13 = [(ICSystemPaperSceneViewController *)self view];
    [v13 bounds];
    -[ICSystemPaperSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v14, 0, 0, v15, v16);
  }

  [v7 animateAlongsideTransition:&__block_literal_global completion:&__block_literal_global_15];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)ICSystemPaperSceneViewController;
  [(ICSystemPaperSceneViewController *)&v6 viewDidLayoutSubviews];
  id v3 = [(ICSystemPaperSceneViewController *)self view];
  [v3 bounds];
  -[ICSystemPaperSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", [(ICSystemPaperSceneViewController *)self interfaceOrientation], 0, 0, v4, v5);
}

- (int64_t)contentState
{
  return [(FBScene *)self->_scene contentState];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ICSystemPaperSceneViewController;
  [(ICSystemPaperSceneViewController *)&v2 dealloc];
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    self->_BOOL invalidated = 1;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL invalidated = self->_invalidated;
      int v4 = 134218240;
      double v5 = self;
      __int16 v6 = 1024;
      BOOL v7 = invalidated;
      _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: invalidated is now %{BOOL}i", (uint8_t *)&v4, 0x12u);
    }
    [(ICSystemPaperSceneViewController *)self _teardown];
  }
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssertMain();
  if (self->_active != v3)
  {
    self->_BOOL active = v3;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL active = self->_active;
      int v6 = 134218240;
      BOOL v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = active;
      _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: active is now %{BOOL}i", (uint8_t *)&v6, 0x12u);
    }
    [(ICSystemPaperSceneViewController *)self _update];
  }
}

- (void)_teardown
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  scenePresenter = self->_scenePresenter;
  if (scenePresenter)
  {
    [(UIScenePresenter *)scenePresenter invalidate];
    int v4 = self->_scenePresenter;
    self->_scenePresenter = 0;
  }
  if (self->_scene)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = [(FBScene *)self->_scene identityToken];
      int v6 = [v5 stringRepresentation];
      int v8 = 134218242;
      BOOL v9 = self;
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: invalidating scene %@", (uint8_t *)&v8, 0x16u);
    }
    [(FBScene *)self->_scene setDelegate:0];
    [(FBScene *)self->_scene invalidate];
    scene = self->_scene;
    self->_scene = 0;
  }
}

- (void)_update
{
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    [(ICSystemPaperSceneViewController *)self _adjustParentScene];
    BOOL v3 = [(ICSystemPaperSceneViewController *)self view];
    [v3 bounds];
    -[ICSystemPaperSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", [(ICSystemPaperSceneViewController *)self interfaceOrientation], 0, 0, v4, v5);

    if (!self->_scenePresenter)
    {
      int v6 = [(FBScene *)self->_scene uiPresentationManager];
      BOOL v7 = [v6 createPresenterWithIdentifier:@"QuickNote"];
      scenePresenter = self->_scenePresenter;
      self->_scenePresenter = v7;

      [(UIScenePresenter *)self->_scenePresenter modifyPresentationContext:&__block_literal_global_25];
      [(UIScenePresenter *)self->_scenePresenter activate];
      sceneContainerView = self->_sceneContainerView;
      id v10 = [(UIScenePresenter *)self->_scenePresenter presentationView];
      [(UIView *)sceneContainerView addSubview:v10];
    }
  }
}

void __43__ICSystemPaperSceneViewController__update__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:2];
  [v2 setClippingDisabled:0];
}

- (void)_adjustParentScene
{
  v15[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICSystemPaperSceneViewController *)self view];
  double v4 = [v3 window];
  double v5 = [v4 windowScene];

  p_uiParentScene = &self->_uiParentScene;
  uiParentScene = self->_uiParentScene;
  if (uiParentScene != v5)
  {
    if (v5)
    {
      objc_storeStrong((id *)&self->_uiParentScene, v5);
      int v8 = *p_uiParentScene;
      v15[0] = self;
      BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
      id v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      [(UIScene *)v8 _registerSettingsDiffActionArray:v9 forKey:v11];
    }
    else
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      [(UIScene *)uiParentScene _unregisterSettingsDiffActionArrayForKey:v13];

      uint64_t v14 = *p_uiParentScene;
      *p_uiParentScene = 0;
    }
  }
}

- (void)_updateSceneToSize:(CGSize)a3 orientation:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v71 = *MEMORY[0x263EF8340];
  unint64_t v11 = (unint64_t)a5;
  unint64_t v12 = (unint64_t)a6;
  if ((unint64_t)(a4 - 3) >= 2) {
    double v13 = height;
  }
  else {
    double v13 = width;
  }
  if ((unint64_t)(a4 - 3) >= 2) {
    double height = width;
  }
  uint64_t v14 = [(UIScene *)self->_uiParentScene _FBSScene];
  double v15 = [v14 settings];
  __int16 v16 = [v15 deactivationReasons];

  if (!(v11 | v12))
  {
    id v17 = [(ICSystemPaperSceneViewController *)self userActivityData];

    if (!v17)
    {
      id v62 = 0;
      goto LABEL_15;
    }
  }
  id v18 = objc_alloc_init(MEMORY[0x263F1C438]);
  [v18 setAnimationSettings:v11];
  [v18 setAnimationFence:v12];
  uint64_t v19 = [(ICSystemPaperSceneViewController *)self userActivityData];
  id v62 = v18;
  if (!v19) {
    goto LABEL_15;
  }
  v20 = (void *)v19;
  scene = self->_scene;
  if (!scene)
  {

    goto LABEL_13;
  }
  char v22 = [(FBScene *)scene isActive];

  if ((v22 & 1) == 0)
  {
LABEL_13:
    v23 = [(ICSystemPaperSceneViewController *)self userActivityData];
    v24 = [(ICSystemPaperSceneViewController *)self uiActivityContinuationActionForUserActivityData:v23];

    v25 = [MEMORY[0x263EFFA08] setWithObject:v24];
    [v18 setActions:v25];
  }
LABEL_15:
  v26 = self->_scene;
  if (!v26)
  {
    v27 = [MEMORY[0x263F3F488] definition];
    objc_super v28 = (void *)MEMORY[0x263F3F4D0];
    [MEMORY[0x263F08C38] UUID];
    __int16 v61 = v16;
    v30 = unint64_t v29 = v11;
    [v30 UUIDString];
    int64_t v31 = a4;
    v33 = unint64_t v32 = v12;
    v34 = [@"com.apple.mobilenotes" stringByAppendingString:@".QuickNote"];
    v35 = [v28 identityForIdentifier:v33 workspaceIdentifier:v34];
    [v27 setIdentity:v35];

    unint64_t v12 = v32;
    a4 = v31;

    unint64_t v11 = v29;
    __int16 v16 = v61;
    v36 = (void *)MEMORY[0x263F3F4C0];
    v37 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:@"com.apple.mobilenotes"];
    v38 = [v36 identityForProcessIdentity:v37];
    [v27 setClientIdentity:v38];

    v39 = [NSClassFromString(&cfstr_Sbsuisystemnot.isa) specification];
    [v27 setSpecification:v39];

    v40 = [MEMORY[0x263F3F4F0] sharedInstance];
    v41 = [v40 createSceneWithDefinition:v27];
    v42 = self->_scene;
    self->_scene = v41;

    [(FBScene *)self->_scene setDelegate:self];
    v26 = self->_scene;
  }
  unint64_t v43 = v16 & 0x100;
  v44 = [(FBScene *)v26 settings];
  v45 = (void *)[v44 mutableCopy];

  [v45 setInterfaceOrientation:a4];
  if (self->_visible)
  {
    BOOL active = self->_active;
    BOOL v47 = self->_active;
    if ([v45 isForeground] == v47) {
      goto LABEL_25;
    }
  }
  else
  {
    if (([v45 isForeground] & 1) == 0) {
      goto LABEL_25;
    }
    BOOL active = 0;
    BOOL v47 = 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v48 = [(FBScene *)self->_scene identityToken];
    v49 = [v48 stringRepresentation];
    *(_DWORD *)buf = 134218498;
    v66 = self;
    __int16 v67 = 1024;
    int v68 = active;
    __int16 v69 = 2112;
    v70 = v49;
    _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: foreground changed to %{BOOL}i on %@", buf, 0x1Cu);
  }
  [v45 setForeground:v47];
LABEL_25:
  v50 = [(ICSystemPaperSceneViewController *)self _screen];
  v51 = [v50 displayConfiguration];
  [v45 setDisplayConfiguration:v51];

  objc_msgSend(v45, "setFrame:", 0.0, 0.0, height, v13);
  v52 = [(ICSystemPaperSceneViewController *)self traitCollection];
  objc_msgSend(v45, "setUserInterfaceStyle:", objc_msgSend(v52, "userInterfaceStyle"));

  v53 = [(ICSystemPaperSceneViewController *)self view];
  [v53 safeAreaInsets];
  objc_msgSend(v45, "setSafeAreaInsetsPortrait:");

  unint64_t v54 = [v45 deactivationReasons] & 0xFFFFFFFFFFFFFEFFLL | v43;
  if ([v45 deactivationReasons] != v54)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v55 = [(FBScene *)self->_scene identityToken];
      v56 = [v55 stringRepresentation];
      *(_DWORD *)buf = 134218498;
      v66 = self;
      __int16 v67 = 1024;
      int v68 = v43 >> 8;
      __int16 v69 = 2112;
      v70 = v56;
      _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: keyboardSuppression changed to %{BOOL}i on %@", buf, 0x1Cu);
    }
    [v45 setDeactivationReasons:v54];
  }
  int v57 = [(FBScene *)self->_scene isActive];
  v58 = self->_scene;
  if (v57)
  {
    v59 = v62;
    [(FBScene *)self->_scene updateSettings:v45 withTransitionContext:v62];
  }
  else
  {
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __95__ICSystemPaperSceneViewController__updateSceneToSize_orientation_withAnimationSettings_fence___block_invoke;
    v63[3] = &unk_264E7BAF8;
    id v60 = v45;
    id v64 = v60;
    [(FBScene *)v58 configureParameters:v63];
    if ([v60 isForeground]) {
      [(FBScene *)self->_scene activateWithTransitionContext:v62];
    }

    v59 = v62;
  }
}

uint64_t __95__ICSystemPaperSceneViewController__updateSceneToSize_orientation_withAnimationSettings_fence___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSettings:*(void *)(a1 + 32)];
}

- (void)_updateSceneUIApplicationSceneSettingsWithBlock:(id)a3
{
  id v4 = a3;
  scene = self->_scene;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__ICSystemPaperSceneViewController__updateSceneUIApplicationSceneSettingsWithBlock___block_invoke;
  v7[3] = &unk_264E7BB20;
  id v8 = v4;
  id v6 = v4;
  [(FBScene *)scene updateSettingsWithBlock:v7];
}

void __84__ICSystemPaperSceneViewController__updateSceneUIApplicationSceneSettingsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "#sceneHosting Expected scene's settings to be UIMutableApplicationSceneSettings, but they weren't {actualClass: %@}", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_updateSceneSafeAreaInsets
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(ICSystemPaperSceneViewController *)self view];
  [v3 safeAreaInsets];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v17.top = v5;
    v17.left = v7;
    v17.bottom = v9;
    v17.right = v11;
    unint64_t v12 = NSStringFromUIEdgeInsets(v17);
    *(_DWORD *)buf = 138412290;
    double v15 = v12;
    _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "#sceneHosting Updating scene's safe area insets {newSafeAreaInsets: %@}", buf, 0xCu);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__ICSystemPaperSceneViewController__updateSceneSafeAreaInsets__block_invoke;
  v13[3] = &__block_descriptor_64_e43_v16__0__UIMutableApplicationSceneSettings_8l;
  *(CGFloat *)&v13[4] = v5;
  *(CGFloat *)&v13[5] = v7;
  *(CGFloat *)&v13[6] = v9;
  *(CGFloat *)&v13[7] = v11;
  [(ICSystemPaperSceneViewController *)self _updateSceneUIApplicationSceneSettingsWithBlock:v13];
}

uint64_t __62__ICSystemPaperSceneViewController__updateSceneSafeAreaInsets__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setSafeAreaInsetsPortrait:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ICSystemPaperSceneViewController;
  [(ICSystemPaperSceneViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(ICSystemPaperSceneViewController *)self _updateSceneSafeAreaInsets];
}

- (void)_updateSceneUserInterfaceStyle
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __66__ICSystemPaperSceneViewController__updateSceneUserInterfaceStyle__block_invoke;
  v2[3] = &unk_264E7BB68;
  v2[4] = self;
  [(ICSystemPaperSceneViewController *)self _updateSceneUIApplicationSceneSettingsWithBlock:v2];
}

void __66__ICSystemPaperSceneViewController__updateSceneUserInterfaceStyle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 traitCollection];
  objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [v6 identityToken];
    CGFloat v9 = [v8 stringRepresentation];
    *(_DWORD *)buf = 134218498;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v9;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did receive actions %@", buf, 0x20u);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    uint64_t v14 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            UIEdgeInsets v17 = [v16 dismissalReason];
            *(_DWORD *)buf = 134218242;
            v25 = self;
            __int16 v26 = 2114;
            v27 = v17;
            _os_log_impl(&dword_23CA54000, v14, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: dismiss for reason: %{public}@", buf, 0x16u);
          }
          id v18 = [(ICSystemPaperSceneViewController *)self presentingViewController];
          [v18 dismissViewControllerAnimated:1 completion:0];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = a3;
    id v6 = [v5 identityToken];
    id v7 = [v6 stringRepresentation];
    [v5 contentState];

    double v8 = NSStringFromFBSceneContentState();
    int v9 = 134218498;
    id v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did change content state to %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)sceneDidActivate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [a3 identityToken];
    id v6 = [v5 stringRepresentation];
    int v7 = 134218242;
    double v8 = self;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did activate", (uint8_t *)&v7, 0x16u);
  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [v6 identityToken];
    __int16 v9 = [v8 stringRepresentation];
    int v16 = 134218498;
    UIEdgeInsets v17 = self;
    __int16 v18 = 2112;
    long long v19 = v9;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did deactivate with error %@", (uint8_t *)&v16, 0x20u);
  }
  id v10 = [v7 domain];
  if ([v10 isEqualToString:*MEMORY[0x263F3F3D0]])
  {
    uint64_t v11 = [v7 code];

    if (v11 == 1)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v6 identityToken];
        __int16 v13 = [v12 stringRepresentation];
        int v16 = 134218498;
        UIEdgeInsets v17 = self;
        __int16 v18 = 2112;
        long long v19 = v13;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did deactivate with fatal error %@", (uint8_t *)&v16, 0x20u);
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v6 identityToken];
    uint64_t v15 = [v14 stringRepresentation];
    int v16 = 134218498;
    UIEdgeInsets v17 = self;
    __int16 v18 = 2112;
    long long v19 = v15;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did deactivate with transient error %@", (uint8_t *)&v16, 0x20u);
  }
  [(ICSystemPaperSceneViewController *)self _update];
LABEL_11:
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = a6;
    id v11 = a4;
    uint64_t v12 = [a3 identityToken];
    __int16 v13 = [v12 stringRepresentation];

    int v14 = 134218754;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    UIEdgeInsets v17 = v13;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_23CA54000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ICSystemPaperSceneViewController-%p: scene %@ did update client settings with diff %@, transition %@", (uint8_t *)&v14, 0x2Au);
  }
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v10 = a6;
  id v11 = [a4 settings];
  [v11 deactivationReasons];

  [v10 deactivationReasons];
  if ((BSEqualBools() & 1) == 0)
  {
    [(ICSystemPaperSceneViewController *)self _update];
  }
}

- (void)createLinkWithUserActivityData:(id)a3
{
  id v6 = [(ICSystemPaperSceneViewController *)self uiActivityContinuationActionForUserActivityData:a3];
  scene = self->_scene;
  id v5 = [MEMORY[0x263EFFA08] setWithObject:v6];
  [(FBScene *)scene sendActions:v5];
}

- (id)uiActivityContinuationActionForUserActivityData:(id)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F08D38];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] _initWithUserActivityData:v4];
  id v6 = objc_alloc(MEMORY[0x263F1C3D0]);
  v14[0] = v4;
  v13[0] = &unk_26F0A9120;
  v13[1] = &unk_26F0A9138;
  id v7 = [v5 activityType];
  v14[1] = v7;
  v13[2] = &unk_26F0A9150;
  double v8 = [v5 activityType];
  v14[2] = v8;
  v13[3] = &unk_26F0A9168;
  __int16 v9 = [MEMORY[0x263EFF910] date];
  v14[3] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  id v11 = (void *)[v6 initWithSettings:v10];

  return v11;
}

- (void)registerForTraitChanges
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[(ICSystemPaperSceneViewController *)self registerForTraitChanges:v3 withAction:sel__updateSceneUserInterfaceStyle];
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityData, 0);
  objc_storeStrong((id *)&self->_uiParentScene, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);

  objc_storeStrong((id *)&self->_sceneContainerView, 0);
}

@end