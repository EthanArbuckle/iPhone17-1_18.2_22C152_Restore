@interface PRUISModalRemoteViewController
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBScene)scene;
- (NSString)description;
- (PRUISModalRemoteViewController)initWithEntryPoint:(id)a3;
- (PRUISModalRemoteViewControllerDelegate)delegate;
- (id)_defaultDisplayConfigurationWithScreen:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)preferredStatusBarUpdateAnimation;
- (unint64_t)supportedInterfaceOrientations;
- (void)_acquireKeyboardFocusDeferringRuleIfNecessary;
- (void)_configureSceneIfNeededWithParentWindow:(id)a3;
- (void)_invalidateAfterDismissal;
- (void)_invokeDidDismissDelegateWithResponse:(id)a3;
- (void)_invokeWillDismissDelegateWithResponse:(id)a3;
- (void)_teardown;
- (void)_update;
- (void)_updateCommonModalSceneSettings:(id)a3 withFrame:(CGRect)a4 interfaceOrientation:(int64_t)a5;
- (void)_updateSceneToSize:(CGSize)a3 orientation:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6;
- (void)_updateStatusBarVisibilityWithTransitionContext:(id)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)endObservingApplicationLifecycle;
- (void)invalidate;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sendRequestDismissalAction;
- (void)setDelegate:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)startObservingApplicationLifecycle;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PRUISModalRemoteViewController

- (PRUISModalRemoteViewController)initWithEntryPoint:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PRUISModalRemoteViewController;
  v6 = [(PRUISModalRemoteViewController *)&v14 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_entryPoint, a3);
    if (_PRUISModalRemoteViewControllerSceneWorkspace_onceToken != -1) {
      dispatch_once(&_PRUISModalRemoteViewControllerSceneWorkspace_onceToken, &__block_literal_global_232);
    }
    id v8 = (id)_PRUISModalRemoteViewControllerSceneWorkspace_workspace;
    uint64_t v9 = [v8 createScene:&__block_literal_global_15];
    scene = v7->_scene;
    v7->_scene = (FBScene *)v9;

    [(FBScene *)v7->_scene addExtension:objc_opt_class()];
    v11 = PRUISLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v7->_scene;
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_25A03F000, v11, OS_LOG_TYPE_DEFAULT, "Created new PosterBoard modal scene %{public}@", buf, 0xCu);
    }

    [(FBScene *)v7->_scene setDelegate:v7];
  }

  return v7;
}

void __53__PRUISModalRemoteViewController_initWithEntryPoint___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F64598];
  id v3 = a2;
  id v10 = [v2 identityForAngelJobLabel:@"com.apple.PosterBoard"];
  v4 = NSNumber;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  v6 = [v5 stringValue];
  v7 = [@"sceneID:com.apple.PosterBoard-modal:" stringByAppendingString:v6];

  [v3 setIdentifier:v7];
  id v8 = +[FBSSceneSpecification specification];
  [v3 setSpecification:v8];

  uint64_t v9 = [MEMORY[0x263F3F4C0] identityForProcessIdentity:v10];
  [v3 setClientIdentity:v9];
}

- (void)dealloc
{
  [(PRUISModalRemoteViewController *)self endObservingApplicationLifecycle];
  [(PRUISModalRemoteViewController *)self _teardown];
  v3.receiver = self;
  v3.super_class = (Class)PRUISModalRemoteViewController;
  [(PRUISModalRemoteViewController *)&v3 dealloc];
}

- (id)_defaultDisplayConfigurationWithScreen:(id)a3
{
  if (a3)
  {
    objc_super v3 = [a3 displayConfiguration];
  }
  else
  {
    v4 = [MEMORY[0x263F1C920] mainScreen];
    objc_super v3 = [v4 displayConfiguration];
  }

  return v3;
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_displayConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    [(PRUISModalRemoteViewController *)self _update];
  }
}

- (FBSDisplayConfiguration)displayConfiguration
{
  displayConfiguration = self->_displayConfiguration;
  if (displayConfiguration)
  {
    objc_super v3 = displayConfiguration;
  }
  else
  {
    id v5 = [(UIWindowScene *)self->_uiParentScene screen];
    objc_super v3 = [(PRUISModalRemoteViewController *)self _defaultDisplayConfigurationWithScreen:v5];
  }

  return v3;
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
      id v5 = self;
      __int16 v6 = 1024;
      BOOL v7 = invalidated;
      _os_log_impl(&dword_25A03F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "PosterBoard modal-%p: invalidated is now %{BOOL}i", (uint8_t *)&v4, 0x12u);
    }
    [(PRUISModalRemoteViewController *)self _teardown];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRUISModalRemoteViewController;
  [(PRUISModalRemoteViewController *)&v4 viewWillAppear:a3];
  [(PRUISModalRemoteViewController *)self _update];
  [(PRUISModalRemoteViewController *)self startObservingApplicationLifecycle];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRUISModalRemoteViewController;
  [(PRUISModalRemoteViewController *)&v4 viewDidAppear:a3];
  [(PRUISModalRemoteViewController *)self _update];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRUISModalRemoteViewController;
  [(PRUISModalRemoteViewController *)&v4 viewWillDisappear:a3];
  [(PRUISModalRemoteViewController *)self _update];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRUISModalRemoteViewController;
  [(PRUISModalRemoteViewController *)&v4 viewDidDisappear:a3];
  [(PRUISModalRemoteViewController *)self _update];
  [(PRUISModalRemoteViewController *)self endObservingApplicationLifecycle];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PRUISModalRemoteViewController;
  [(PRUISModalRemoteViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(PRUISModalRemoteViewController *)self _update];
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PRUISModalRemoteViewController;
  [(PRUISModalRemoteViewController *)&v4 didMoveToParentViewController:a3];
  [(PRUISModalRemoteViewController *)self _update];
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PRUISModalRemoteViewController;
  id v4 = a3;
  [(PRUISModalRemoteViewController *)&v7 traitCollectionDidChange:v4];
  objc_super v5 = [(PRUISModalRemoteViewController *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6) {
    [(PRUISModalRemoteViewController *)self _update];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v20 = a4;
  objc_super v7 = [v20 containerView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v7 window];
  }
  uint64_t v9 = v8;
  id v10 = [(PRUISModalRemoteViewController *)self view];
  v11 = [v10 window];
  v12 = [v11 windowScene];
  uint64_t v13 = [v12 interfaceOrientation];

  if (v20)
  {
    uint64_t v14 = [v9 _toWindowOrientation];
    v15 = [(UIWindowScene *)self->_uiParentScene _synchronizedDrawingFence];
    v16 = (void *)MEMORY[0x263F29BC8];
    [v20 transitionDuration];
    uint64_t v17 = objc_msgSend(v16, "settingsWithDuration:");
    [(PRUISModalRemoteViewController *)self _configureSceneIfNeededWithParentWindow:v9];
    -[PRUISModalRemoteViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v14, v17, v15, width, height);
  }
  else
  {
    [(PRUISModalRemoteViewController *)self _configureSceneIfNeededWithParentWindow:v9];
    uint64_t v17 = [(PRUISModalRemoteViewController *)self view];
    [v17 bounds];
    -[PRUISModalRemoteViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v13, 0, 0, v18, v19);
  }
}

- (BOOL)prefersStatusBarHidden
{
  return self->_presentedPrefersStatusBarHidden;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(PRUISModalRemoteViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)_teardown
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  scenePresenter = self->_scenePresenter;
  if (scenePresenter)
  {
    [(UIScenePresenter *)scenePresenter invalidate];
    id v4 = self->_scenePresenter;
    self->_scenePresenter = 0;
  }
  if (self->_scene)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v5 = [(FBScene *)self->_scene identityToken];
      int v6 = [v5 stringRepresentation];
      int v10 = 134218242;
      v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl(&dword_25A03F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "PosterBoard modal-%p: invalidating scene %@", (uint8_t *)&v10, 0x16u);
    }
    [(FBScene *)self->_scene setDelegate:0];
    [(FBScene *)self->_scene invalidate];
    scene = self->_scene;
    self->_scene = 0;
  }
  keyboardFocusDeferringRule = self->_keyboardFocusDeferringRule;
  if (keyboardFocusDeferringRule)
  {
    [(BSInvalidatable *)keyboardFocusDeferringRule invalidate];
    uint64_t v9 = self->_keyboardFocusDeferringRule;
    self->_keyboardFocusDeferringRule = 0;
  }
}

- (void)_update
{
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    uint64_t v3 = [(PRUISModalRemoteViewController *)self view];
    id v4 = [v3 window];
    [(PRUISModalRemoteViewController *)self _configureSceneIfNeededWithParentWindow:v4];
    uint64_t v5 = [v4 _windowInterfaceOrientation];
    [v3 bounds];
    -[PRUISModalRemoteViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v5, 0, 0, v6, v7);
    scenePresenter = self->_scenePresenter;
    if (v4)
    {
      if (!scenePresenter)
      {
        uint64_t v9 = [(FBScene *)self->_scene uiPresentationManager];
        int v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        __int16 v12 = [v9 createPresenterWithIdentifier:v11];
        uint64_t v13 = self->_scenePresenter;
        self->_scenePresenter = v12;

        [(UIScenePresenter *)self->_scenePresenter modifyPresentationContext:&__block_literal_global_34_0];
        [(UIScenePresenter *)self->_scenePresenter activate];
        uint64_t v14 = PRUISLogRemoteEditing();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v18 = 0;
          _os_log_impl(&dword_25A03F000, v14, OS_LOG_TYPE_DEFAULT, "Installing live scene view on scene setup", v18, 2u);
        }

        v15 = [(UIScenePresenter *)self->_scenePresenter presentationView];
        [v3 bounds];
        objc_msgSend(v15, "setFrame:");
        [v15 setAutoresizingMask:18];
        [v3 addSubview:v15];
        [v3 sendSubviewToBack:v15];
        scenePresentationView = self->_scenePresentationView;
        self->_scenePresentationView = (UIScenePresentation *)v15;
      }
    }
    else
    {
      [(UIScenePresenter *)scenePresenter invalidate];
      uint64_t v17 = self->_scenePresenter;
      self->_scenePresenter = 0;
    }
    [(PRUISModalRemoteViewController *)self _updateStatusBarVisibilityWithTransitionContext:0];
  }
}

void __41__PRUISModalRemoteViewController__update__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:2];
  [v2 setClippingDisabled:1];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PRUISModalRemoteViewController;
  [(PRUISModalRemoteViewController *)&v8 viewDidLayoutSubviews];
  if (!self->_invalidated)
  {
    uint64_t v3 = [(PRUISModalRemoteViewController *)self view];
    id v4 = [v3 window];
    uint64_t v5 = [v4 _windowInterfaceOrientation];

    [v3 bounds];
    -[PRUISModalRemoteViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v5, 0, 0, v6, v7);
  }
}

- (void)_configureSceneIfNeededWithParentWindow:(id)a3
{
  if (!self->_didConfigureScene)
  {
    id v4 = [a3 windowScene];
    uiParentScene = self->_uiParentScene;
    self->_uiParentScene = v4;

    if (self->_uiParentScene)
    {
      scene = self->_scene;
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __74__PRUISModalRemoteViewController__configureSceneIfNeededWithParentWindow___block_invoke;
      v7[3] = &unk_26546BDE0;
      v7[4] = self;
      [(FBScene *)scene configureParameters:v7];
      self->_didConfigureScene = 1;
    }
  }
}

uint64_t __74__PRUISModalRemoteViewController__configureSceneIfNeededWithParentWindow___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __74__PRUISModalRemoteViewController__configureSceneIfNeededWithParentWindow___block_invoke_2;
  v3[3] = &unk_26546BDB8;
  v3[4] = *(void *)(a1 + 32);
  return [a2 updateSettingsWithBlock:v3];
}

void __74__PRUISModalRemoteViewController__configureSceneIfNeededWithParentWindow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[129];
  id v9 = a2;
  [v4 bounds];
  objc_msgSend(v3, "_updateCommonModalSceneSettings:withFrame:interfaceOrientation:", v9, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 984), "interfaceOrientation"), v5, v6, v7, v8);
}

- (void)_updateSceneToSize:(CGSize)a3 orientation:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v12;
  if (self->_didConfigureScene)
  {
    scene = self->_scene;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __93__PRUISModalRemoteViewController__updateSceneToSize_orientation_withAnimationSettings_fence___block_invoke;
    v17[3] = &unk_26546BE08;
    if ((unint64_t)(a4 - 3) >= 2) {
      double v15 = height;
    }
    else {
      double v15 = width;
    }
    if ((unint64_t)(a4 - 3) >= 2) {
      double v16 = width;
    }
    else {
      double v16 = height;
    }
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    v17[4] = self;
    double v22 = v16;
    double v23 = v15;
    int64_t v24 = a4;
    id v18 = v12;
    id v19 = v11;
    [(FBScene *)scene performUpdate:v17];
  }
}

void __93__PRUISModalRemoteViewController__updateSceneToSize_orientation_withAnimationSettings_fence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v7 = a3;
  id v6 = a2;
  objc_msgSend(v6, "setForeground:", objc_msgSend(v5, "_appearState") != 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateCommonModalSceneSettings:withFrame:interfaceOrientation:", v6, *(void *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  [v7 setAnimationFence:*(void *)(a1 + 40)];
  [v7 setAnimationSettings:*(void *)(a1 + 48)];
}

- (void)_updateCommonModalSceneSettings:(id)a3 withFrame:(CGRect)a4 interfaceOrientation:(int64_t)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  objc_msgSend(v15, "setFrame:", x, y, width, height);
  [v15 setInterfaceOrientation:a5];
  id v11 = [(PRUISModalRemoteViewController *)self traitCollection];
  objc_msgSend(v15, "setUserInterfaceStyle:", objc_msgSend(v11, "userInterfaceStyle"));

  id v12 = [(PRUISModalRemoteViewController *)self displayConfiguration];
  [v15 setDisplayConfiguration:v12];

  [v15 setShouldInheritHostDisplayConfiguration:self->_displayConfiguration != 0];
  [v15 setEntryPoint:self->_entryPoint];
  uint64_t v13 = [(UIWindowScene *)self->_uiParentScene _FBSScene];
  uint64_t v14 = [v13 settings];

  if ([v14 isUISubclass])
  {
    [v14 defaultStatusBarHeightForOrientation:a5];
    objc_msgSend(v15, "setDefaultStatusBarHeight:forOrientation:", a5);
  }
}

- (void)_updateStatusBarVisibilityWithTransitionContext:(id)a3
{
  id v4 = a3;
  double v5 = [(FBScene *)self->_scene clientSettings];
  if ([v5 isUISubclass])
  {
    int v6 = [v5 statusBarHidden];
    if (self->_presentedPrefersStatusBarHidden != v6)
    {
      self->_presentedPrefersStatusBarHidden = v6;
      id v7 = [v4 animationSettings];
      [v7 duration];
      double v9 = v8;

      if (v9 <= 0.0)
      {
        [(PRUISModalRemoteViewController *)self setNeedsStatusBarAppearanceUpdate];
      }
      else
      {
        uiParentScene = self->_uiParentScene;
        id v11 = [v4 animationFence];
        [(UIWindowScene *)uiParentScene _synchronizeDrawingWithFence:v11];

        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __82__PRUISModalRemoteViewController__updateStatusBarVisibilityWithTransitionContext___block_invoke;
        v12[3] = &unk_26546B3B8;
        v12[4] = self;
        [MEMORY[0x263F1CB60] animateWithDuration:v12 animations:v9];
      }
    }
  }
}

uint64_t __82__PRUISModalRemoteViewController__updateStatusBarVisibilityWithTransitionContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

- (void)_invokeWillDismissDelegateWithResponse:(id)a3
{
  id v5 = a3;
  id v4 = [(PRUISModalRemoteViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 modalRemoteViewController:self willDismissWithResponse:v5];
  }
}

- (void)_invokeDidDismissDelegateWithResponse:(id)a3
{
  id v5 = a3;
  id v4 = [(PRUISModalRemoteViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 modalRemoteViewController:self didDismissWithResponse:v5];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 modalRemoteViewControllerDidDismiss:self];
  }
}

- (void)_invalidateAfterDismissal
{
  entryPoint = self->_entryPoint;
  uint64_t v4 = objc_opt_class();
  id v5 = entryPoint;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      int v6 = v5;
    }
    else {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [(PRUISModalEntryPoint *)v7 editingType];
  if (v8 == 1)
  {
    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__PRUISModalRemoteViewController__invalidateAfterDismissal__block_invoke;
    block[3] = &unk_26546B3B8;
    block[4] = self;
    dispatch_after(v9, MEMORY[0x263EF83A0], block);
  }
  else
  {
    [(PRUISModalRemoteViewController *)self invalidate];
  }
}

uint64_t __59__PRUISModalRemoteViewController__invalidateAfterDismissal__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)sendRequestDismissalAction
{
  scene = self->_scene;
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  id v5 = +[PRUISRequestDismissalAction actionWithAnimation:1];
  uint64_t v4 = [v3 setWithObject:v5];
  [(FBScene *)scene sendActions:v4];
}

- (void)startObservingApplicationLifecycle
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];
  [v3 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];
}

- (void)endObservingApplicationLifecycle
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D0D8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D038] object:0];
}

- (void)applicationWillResignActive:(id)a3
{
  uint64_t v4 = [PRUISForwardExtensionAppearanceNotificationAction alloc];
  id v7 = [(PRUISForwardExtensionAppearanceNotificationAction *)v4 initWithNotificationName:*MEMORY[0x263F07FD8]];
  scene = self->_scene;
  int v6 = [MEMORY[0x263EFFA08] setWithObject:v7];
  [(FBScene *)scene sendActions:v6];
}

- (void)applicationDidBecomeActive:(id)a3
{
  uint64_t v4 = [PRUISForwardExtensionAppearanceNotificationAction alloc];
  id v7 = [(PRUISForwardExtensionAppearanceNotificationAction *)v4 initWithNotificationName:*MEMORY[0x263F07FC0]];
  scene = self->_scene;
  int v6 = [MEMORY[0x263EFFA08] setWithObject:v7];
  [(FBScene *)scene sendActions:v6];
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v10 response];
          [(PRUISModalRemoteViewController *)self _invokeWillDismissDelegateWithResponse:v11];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = [v10 response];
          [(PRUISModalRemoteViewController *)self _invokeDidDismissDelegateWithResponse:v12];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if ((objc_opt_respondsToSelector() & 1) == 0
            || ([WeakRetained modalRemoteViewController:self shouldDeferInvalidation:self] & 1) == 0)
          {
            [(PRUISModalRemoteViewController *)self _invalidateAfterDismissal];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (self->_scene == a3)
  {
    uint64_t v7 = PRUISLogRemoteEditing();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218242;
      int v10 = self;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_25A03F000, v7, OS_LOG_TYPE_DEFAULT, "Remote modal controller %p scene did deactivate with error: %@", (uint8_t *)&v9, 0x16u);
    }

    uint64_t v8 = [[PRUISModalEntryPointResponse alloc] initWithResult:0];
    [(PRUISModalRemoteViewController *)self _invokeWillDismissDelegateWithResponse:v8];
    [(PRUISModalRemoteViewController *)self _invokeDidDismissDelegateWithResponse:v8];
    [(PRUISModalRemoteViewController *)self _invalidateAfterDismissal];
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v9 = a6;
  int v10 = (objc_class *)MEMORY[0x263F1C418];
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(v10);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __108__PRUISModalRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
  uint64_t v19 = &unk_26546BE30;
  uint64_t v20 = self;
  id v21 = v9;
  id v14 = v9;
  [v13 observeStatusBarHiddenWithBlock:&v16];
  uint64_t v15 = objc_msgSend(v12, "clientSettings", v16, v17, v18, v19, v20);

  [v13 inspectDiff:v11 withContext:v15];
  [v13 removeAllObservers];
}

uint64_t __108__PRUISModalRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStatusBarVisibilityWithTransitionContext:*(void *)(a1 + 40)];
}

- (void)_acquireKeyboardFocusDeferringRuleIfNecessary
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_25A03F000, v2, v3, "%{public}@-%{public}p: Cannot acquire keyboard focus deferring assertion because client scene is nil", v4, v5, v6, v7, v8);
}

- (NSString)description
{
  return (NSString *)[(PRUISModalRemoteViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(PRUISModalRemoteViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  uint64_t v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__PRUISModalRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_26546B148;
  id v7 = v6;
  id v11 = v7;
  id v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

id __72__PRUISModalRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1000) withName:@"scenePresenter"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 1016) withName:@"scenePresentationView"];
  int v4 = [MEMORY[0x263F08B88] isMainThread];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 1056);
  if (v4) {
    return (id)[v5 appendObject:v6 withName:@"scene"];
  }
  else {
    return (id)[v5 appendPointer:v6 withName:@"scene"];
  }
}

- (id)succinctDescription
{
  id v2 = [(PRUISModalRemoteViewController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (PRUISModalRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PRUISModalRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyboardFocusDeferringRule, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_scenePresentationView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_uiParentScene, 0);

  objc_storeStrong((id *)&self->_entryPoint, 0);
}

@end