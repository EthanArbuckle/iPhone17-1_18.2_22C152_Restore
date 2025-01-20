@interface SBAppViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)applicationSceneViewControllerIsInNonrotatingWindow:(id)a3;
- (BOOL)automatesLifecycle;
- (BOOL)canHostAnApp;
- (BOOL)ignoresOcclusions;
- (BOOL)isHostingAnApp;
- (BOOL)placeholderContentEnabled;
- (BOOL)wantsSecureRendering;
- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4;
- (CGSize)contentReferenceSize;
- (NSSet)actionsToDeliver;
- (SBActivationSettings)supplementalActivationSettings;
- (SBAppViewController)initWithIdentifier:(id)a3 andApplicationSceneEntity:(id)a4;
- (SBAppViewControllerDelegate)delegate;
- (SBApplicationSceneHandle)sceneHandle;
- (SBApplicationSceneView)appView;
- (SBApplicationSceneViewControllingStatusBarDelegate)applicationSceneStatusBarDelegate;
- (SBScenePlaceholderContentContext)placeholderContentContext;
- (UIView)customContentView;
- (double)statusBarAlpha;
- (id)_configureApplicationSceneEntity:(id)a3 deliveringActions:(BOOL)a4;
- (id)_createSceneUpdateTransactionForApplicationSceneEntity:(id)a3 deliveringActions:(BOOL)a4;
- (id)_windowSceneFromSceneHandle;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)layoutStateForApplicationTransitionContext:(id)a3;
- (id)newSnapshot;
- (id)newSnapshotView;
- (id)previousLayoutStateForApplicationTransitionContext:(id)a3;
- (int64_t)containerOrientation;
- (int64_t)contentOrientation;
- (int64_t)currentMode;
- (int64_t)displayMode;
- (int64_t)overrideStatusBarStyle;
- (int64_t)requestedMode;
- (void)_activateApp;
- (void)_createSceneViewController;
- (void)_deactivateHostedApp;
- (void)_destroySceneViewController;
- (void)_installedAppsDidChange:(id)a3;
- (void)_sendActions:(id)a3;
- (void)_setCurrentMode:(int64_t)a3;
- (void)_transformHostedAppViewForRotationToOrientation:(int64_t)a3;
- (void)_updateForAppearanceState:(int)a3;
- (void)containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3;
- (void)dealloc;
- (void)invalidate;
- (void)newSnapshotViewOnQueue:(id)a3 withCompletion:(id)a4;
- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4;
- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5;
- (void)sceneUpdateTransaction:(id)a3 finishedApplyingUpdate:(BOOL)a4;
- (void)setActionsToDeliver:(id)a3;
- (void)setApplicationSceneStatusBarDelegate:(id)a3;
- (void)setAutomatesLifecycle:(BOOL)a3;
- (void)setContentReferenceSize:(CGSize)a3 withContentOrientation:(int64_t)a4 andContainerOrientation:(int64_t)a5;
- (void)setCustomContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5;
- (void)setIgnoresOcclusions:(BOOL)a3;
- (void)setPlaceholderContentContext:(id)a3;
- (void)setPlaceholderContentEnabled:(BOOL)a3;
- (void)setRequestedMode:(int64_t)a3;
- (void)setSupplementalActivationSettings:(id)a3;
- (void)setWantsSecureRendering:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation SBAppViewController

- (BOOL)isHostingAnApp
{
  return self->_currentMode == 2;
}

- (SBApplicationSceneHandle)sceneHandle
{
  return &self->_sceneHandle->super;
}

- (SBAppViewController)initWithIdentifier:(id)a3 andApplicationSceneEntity:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  NSClassFromString(&cfstr_Sbapplications_8.isa);
  if (!v9)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBAppViewController initWithIdentifier:andApplicationSceneEntity:](a2);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8C930D0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:SBApplicationSceneEntityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBAppViewController initWithIdentifier:andApplicationSceneEntity:](a2);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8C93134);
  }

  v29.receiver = self;
  v29.super_class = (Class)SBAppViewController;
  v10 = [(SBAppViewController *)&v29 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    uint64_t v12 = [v9 sceneHandle];
    sceneHandle = v11->_sceneHandle;
    v11->_sceneHandle = (SBDeviceApplicationSceneHandle *)v12;

    if (![(SBDeviceApplicationSceneHandle *)v11->_sceneHandle isDeviceApplicationSceneHandle])
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:v11 file:@"SBAppViewController.m" lineNumber:77 description:@"SBAppViewController sadly only deals with SBDeviceApplicationSceneHandles right now."];
    }
    uint64_t v14 = [(SBDeviceApplicationSceneHandle *)v11->_sceneHandle newScenePlaceholderContentContextWithActivationSettings:v9];
    placeholderContentContext = v11->_placeholderContentContext;
    v11->_placeholderContentContext = (SBScenePlaceholderContentContext *)v14;

    v16 = objc_alloc_init(SBActivationSettings);
    activationSettings = v11->_activationSettings;
    v11->_activationSettings = v16;

    v18 = v11->_activationSettings;
    v19 = (void *)[v9 copyActivationSettings];
    [(SBActivationSettings *)v18 applyActivationSettings:v19];

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeTransitions = v11->_activeTransitions;
    v11->_activeTransitions = v20;

    uint64_t v22 = [v9 actions];
    actionsToDeliver = v11->_actionsToDeliver;
    v11->_actionsToDeliver = (NSSet *)v22;

    v11->_requestedMode = 0;
    v11->_currentMode = 0;
    v11->_sceneContentIsReady = 0;
    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v11 selector:sel__installedAppsDidChange_ name:@"SBInstalledApplicationsDidChangeNotification" object:0];
  }
  return v11;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBAppViewController.m" lineNumber:97 description:@"AppViewController must be explicitly invalidated before it can deallocate."];
  }
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBInstalledApplicationsDidChangeNotification" object:0];

  v6.receiver = self;
  v6.super_class = (Class)SBAppViewController;
  [(SBAppViewController *)&v6 dealloc];
}

- (void)setActionsToDeliver:(id)a3
{
  v5 = (NSSet *)a3;
  p_actionsToDeliver = &self->_actionsToDeliver;
  if (self->_actionsToDeliver != v5)
  {
    id v9 = v5;
    objc_storeStrong((id *)&self->_actionsToDeliver, a3);
    uint64_t v7 = [(NSSet *)*p_actionsToDeliver count];
    v5 = v9;
    if (v7)
    {
      if (self->_currentMode == 2)
      {
        [(SBAppViewController *)self _sendActions:*p_actionsToDeliver];
        id v8 = *p_actionsToDeliver;
        *p_actionsToDeliver = 0;

        v5 = v9;
      }
    }
  }
}

- (void)setRequestedMode:(int64_t)a3
{
  if (self->_requestedMode != a3)
  {
    self->_requestedMode = a3;
    if (!self->_automatesLifecycle) {
      -[SBAppViewController _setCurrentMode:](self, "_setCurrentMode:");
    }
  }
}

- (void)setAutomatesLifecycle:(BOOL)a3
{
  if (self->_automatesLifecycle != a3)
  {
    self->_automatesLifecycle = a3;
    if (a3)
    {
      uint64_t v4 = [(SBAppViewController *)self _appearState];
      [(SBAppViewController *)self _updateForAppearanceState:v4];
    }
    else if (self->_requestedMode != self->_currentMode)
    {
      -[SBAppViewController _setCurrentMode:](self, "_setCurrentMode:");
    }
  }
}

- (void)setPlaceholderContentEnabled:(BOOL)a3
{
  if (self->_placeholderContentEnabled != a3)
  {
    BOOL v3 = a3;
    self->_placeholderContentEnabled = a3;
    id v4 = [(SBAppViewController *)self appView];
    [v4 setPlaceholderContentEnabled:v3];
  }
}

- (BOOL)placeholderContentEnabled
{
  v2 = [(SBAppViewController *)self appView];
  BOOL v3 = [v2 placeholderContentProvider];
  BOOL v4 = v3 == 0;

  return v4;
}

- (SBApplicationSceneView)appView
{
  return (SBApplicationSceneView *)[(SBSceneViewController *)self->_deviceAppViewController _sceneView];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    [(SBAppViewController *)self _setCurrentMode:0];
    [(SBAppViewController *)self setDelegate:0];
    [(SBAppViewController *)self setActionsToDeliver:0];
    self->_invalidated = 1;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBAppViewController;
  [(SBAppViewController *)&v4 viewWillAppear:a3];
  if (self->_automatesLifecycle) {
    [(SBAppViewController *)self _updateForAppearanceState:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBAppViewController;
  [(SBAppViewController *)&v4 viewDidAppear:a3];
  if (self->_automatesLifecycle) {
    [(SBAppViewController *)self _updateForAppearanceState:2];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBAppViewController;
  [(SBAppViewController *)&v4 viewWillDisappear:a3];
  if (self->_automatesLifecycle) {
    [(SBAppViewController *)self _updateForAppearanceState:3];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBAppViewController;
  [(SBAppViewController *)&v4 viewDidDisappear:a3];
  if (self->_automatesLifecycle) {
    [(SBAppViewController *)self _updateForAppearanceState:0];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBAppViewController;
  -[SBAppViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3 && self->_automatesLifecycle) {
    [(SBAppViewController *)self _setCurrentMode:0];
  }
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SBAppViewController;
  [(SBAppViewController *)&v9 viewDidLayoutSubviews];
  BOOL v3 = [(SBAppViewController *)self view];
  objc_super v4 = [v3 window];
  objc_super v5 = [v4 _roleHint];
  char v6 = SBTraitsArbiterOrientationActuationEnabledForRole(v5);

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(SBDeviceApplicationSceneViewController *)self->_deviceAppViewController view];
    id v8 = [(SBAppViewController *)self view];
    [v8 bounds];
    objc_msgSend(v7, "setFrame:");
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBAppViewController;
  -[SBAppViewController viewWillTransitionToSize:withTransitionCoordinator:](&v21, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id v8 = [(SBAppViewController *)self view];
  objc_super v9 = [v8 window];
  v10 = [v9 _roleHint];
  char v11 = SBTraitsArbiterOrientationActuationEnabledForRole(v10);

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
    v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 uiSettings];
      char v15 = [v14 deviceOrientationEventsEnabled];

      if (v15)
      {
        v16 = SBFWindowForViewControllerTransition();
        uint64_t v17 = [v16 _toWindowOrientation];

        -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceAppViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v17, v17, width, height);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __74__SBAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
        v18[3] = &unk_1E6AF53F8;
        v18[4] = self;
        [v7 animateAlongsideTransition:0 completion:v18];
      }
      else
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __74__SBAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
        v19[3] = &unk_1E6B090E8;
        id v20 = v7;
        [v13 updateUISettingsWithTransitionBlock:v19];
      }
    }
  }
}

id __74__SBAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = SBFWindowForViewControllerTransition();
  objc_msgSend(v3, "setInterfaceOrientation:", objc_msgSend(v4, "_toWindowOrientation"));

  id v5 = objc_alloc_init(MEMORY[0x1E4F42790]);
  char v6 = (void *)MEMORY[0x1E4F4F680];
  [*(id *)(a1 + 32) transitionDuration];
  id v7 = objc_msgSend(v6, "settingsWithDuration:");
  [v5 setAnimationSettings:v7];

  id v8 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
  [v5 setAnimationFence:v8];

  return v5;
}

uint64_t __74__SBAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 992) contentOrientation];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "bs_isAppearingOrAppeared");
  if (result) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 _transformHostedAppViewForRotationToOrientation:v2];
  }
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)canHostAnApp
{
  return 1;
}

- (id)hostedAppSceneHandle
{
  if ([(SBAppViewController *)self isHostingAnApp]) {
    sceneHandle = self->_sceneHandle;
  }
  else {
    sceneHandle = 0;
  }
  return sceneHandle;
}

- (id)hostedAppSceneHandles
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(SBAppViewController *)self isHostingAnApp] && self->_sceneHandle)
  {
    v5[0] = self->_sceneHandle;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (void)_transformHostedAppViewForRotationToOrientation:(int64_t)a3
{
  id v5 = [(SBAppViewController *)self view];
  char v6 = [v5 window];
  id v7 = [v6 _roleHint];
  char v8 = SBTraitsArbiterOrientationActuationEnabledForRole(v7);

  if ((v8 & 1) == 0)
  {
    objc_super v9 = [(SBAppViewController *)self view];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    v18 = [(SBAppViewController *)self view];
    v19 = [MEMORY[0x1E4F42D90] mainScreen];
    id v20 = [v19 fixedCoordinateSpace];
    objc_msgSend(v18, "convertRect:toCoordinateSpace:", v20, v11, v13, v15, v17);
    double v22 = v21;
    double v24 = v23;

    double Height = v15;
    double Width = v17;
    if ((unint64_t)(a3 - 3) < 2 != (unint64_t)([(SBAppViewController *)self interfaceOrientation]- 3) < 2)
    {
      v29.origin.x = v11;
      v29.origin.y = v13;
      v29.size.double width = v15;
      v29.size.double height = v17;
      double Height = CGRectGetHeight(v29);
      v30.origin.x = v11;
      v30.origin.y = v13;
      v30.size.double width = v15;
      v30.size.double height = v17;
      double Width = CGRectGetWidth(v30);
    }
    v27 = [(SBDeviceApplicationSceneViewController *)self->_deviceAppViewController view];
    [(SBAppViewController *)self interfaceOrientation];
    SBFTransformFromOrientationToOrientation();
    [v27 setTransform:&v28];
    UIRectGetCenter();
    objc_msgSend(v27, "setCenter:");
    objc_msgSend(v27, "setBounds:", v11, v13, Height, Width);
    -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceAppViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a3, a3, v22, v24);
  }
}

- (int64_t)displayMode
{
  return [(SBSceneViewController *)self->_deviceAppViewController displayMode];
}

- (void)setPlaceholderContentContext:(id)a3
{
  id v5 = (SBScenePlaceholderContentContext *)a3;
  p_placeholderContentContext = &self->_placeholderContentContext;
  if (self->_placeholderContentContext != v5)
  {
    char v8 = v5;
    objc_storeStrong((id *)&self->_placeholderContentContext, a3);
    id v7 = [(SBAppViewController *)self appView];
    [v7 setPlaceholderContentContext:*p_placeholderContentContext];

    id v5 = v8;
  }
}

- (UIView)customContentView
{
  return [(SBSceneViewController *)self->_deviceAppViewController customContentView];
}

- (void)setCustomContentView:(id)a3
{
}

- (id)newSnapshot
{
  return [(SBSceneViewController *)self->_deviceAppViewController newSnapshot];
}

- (id)newSnapshotView
{
  return [(SBSceneViewController *)self->_deviceAppViewController newSnapshotView];
}

- (void)newSnapshotViewOnQueue:(id)a3 withCompletion:(id)a4
{
  deviceAppViewController = self->_deviceAppViewController;
  if (deviceAppViewController) {
    [(SBSceneViewController *)deviceAppViewController newSnapshotViewOnQueue:a3 withCompletion:a4];
  }
  else {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (CGSize)contentReferenceSize
{
  [(SBSceneViewController *)self->_deviceAppViewController contentReferenceSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (int64_t)contentOrientation
{
  return [(SBSceneViewController *)self->_deviceAppViewController contentOrientation];
}

- (int64_t)containerOrientation
{
  return [(SBSceneViewController *)self->_deviceAppViewController containerOrientation];
}

- (void)setContentReferenceSize:(CGSize)a3 withContentOrientation:(int64_t)a4 andContainerOrientation:(int64_t)a5
{
  -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceAppViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a4, a5, a3.width, a3.height);
  deviceAppViewController = self->_deviceAppViewController;
  uint64_t v8 = [(SBDeviceApplicationSceneViewController *)deviceAppViewController interfaceOrientation];
  objc_super v9 = [(SBAppViewController *)self view];
  [(SBDeviceApplicationSceneViewController *)deviceAppViewController willRotateFromInterfaceOrientation:v8 toInterfaceOrientation:a4 alongsideContainerView:v9 animated:1];

  id v10 = [(SBAppViewController *)self view];
  [v10 setNeedsLayout];
}

- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  deviceAppViewController = self->_deviceAppViewController;
  if (deviceAppViewController)
  {
    objc_initWeak(&location, deviceAppViewController);
    double v12 = self->_deviceAppViewController;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__SBAppViewController_setDisplayMode_animationFactory_completion___block_invoke;
    v13[3] = &unk_1E6B08340;
    v13[4] = self;
    objc_copyWeak(&v15, &location);
    id v14 = v10;
    [(SBDeviceApplicationSceneViewController *)v12 setDisplayMode:a3 animationFactory:v8 completion:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

uint64_t __66__SBAppViewController_setDisplayMode_animationFactory_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) displayMode] != 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setCustomContentView:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3
{
}

- (double)statusBarAlpha
{
  deviceAppViewController = self->_deviceAppViewController;
  if (!deviceAppViewController) {
    return 1.0;
  }
  [(SBApplicationSceneViewController *)deviceAppViewController statusBarAlpha];
  return result;
}

- (int64_t)overrideStatusBarStyle
{
  return [(SBApplicationSceneViewController *)self->_deviceAppViewController overrideStatusBarStyle];
}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)a4 >= 2)
  {
    if (a4 == 2 && !self->_sceneContentIsReady)
    {
      id v8 = v6;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained appViewControllerDidBecomeReady:self];
      }
      self->_sceneContentIsReady = 1;

      id v6 = v8;
    }
  }
  else
  {
    self->_sceneContentIsReady = 0;
  }
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (!self->_invalidated)
  {
    if (self->_currentMode != 2)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"SBAppViewController.m" lineNumber:423 description:@"We're still observing the scene handle when the scene handle died."];
    }
    self->_sceneContentIsReady = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || [WeakRetained appViewControllerShouldReactivateApplicationOnDestruction:self])
    {
      [(SBAppViewController *)self _activateApp];
    }
  }
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v26 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_variant_has_internal_content())
  {
LABEL_9:

    return;
  }
  double v11 = [v26 scene];
  double v12 = [v11 settings];

  if ([v9 containsProperty:sel_isForeground]
    && ([v12 isForeground] & 1) == 0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    double v23 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIdentifier];
    v18 = NSStringFromSBAppViewControllerMode(self->_currentMode);
    v19 = [v9 description];
    double v24 = [(SBAppViewController *)self view];
    id v20 = [v24 window];
    double v21 = [v20 recursiveDescription];
    [v25 handleFailureInMethod:a2, self, @"SBAppViewController.m", 452, @"Something changed the scene's (%@) foreground status out from underneath us (current mode: %@, diff: %@, window: %@).", v23, v18, v19, v21 object file lineNumber description];
  }
  if (!self->_ignoresOcclusions) {
    goto LABEL_8;
  }
  double v13 = [v10 ignoreOcclusionReasons];
  id v14 = [v12 ignoreOcclusionReasons];
  char v15 = BSEqualObjects();

  if ((v15 & 1) != 0
    || ([v12 ignoreOcclusionReasons],
        double v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v16 containsObject:self->_identifier],
        v16,
        (v17 & 1) != 0))
  {
LABEL_8:

    goto LABEL_9;
  }
  double v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[sceneSettings ignoreOcclusionReasons] containsObject:_identifier]"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBAppViewController sceneHandle:didUpdateSettingsWithDiff:previousSettings:](a2);
  }
  [v22 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (BOOL)applicationSceneViewControllerIsInNonrotatingWindow:(id)a3
{
  BOOL v4 = [(SBAppViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 appViewControllerIsInNonRotatingWindow:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)_updateForAppearanceState:(int)a3
{
  if (a3 <= 3) {
    [(SBAppViewController *)self _setCurrentMode:qword_1D8FD2A00[a3]];
  }
}

- (void)_setCurrentMode:(int64_t)a3
{
  if (!self->_invalidated && self->_currentMode != a3)
  {
    self->_int64_t currentMode = a3;
    self->_sceneContentIsReady = 0;
    int64_t currentMode = self->_currentMode;
    switch(currentMode)
    {
      case 2:
        [(SBAppViewController *)self _activateApp];
        break;
      case 1:
        [(SBAppViewController *)self _createSceneViewController];
        [(SBAppViewController *)self _deactivateHostedApp];
        break;
      case 0:
        [(SBAppViewController *)self _deactivateHostedApp];
        [(SBAppViewController *)self _destroySceneViewController];
        break;
    }
  }
}

- (void)_createSceneViewController
{
  if (self->_invalidated)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SBAppViewController.m", 517, @"Cannot create an app view on an invalidated appViewController: %@", self object file lineNumber description];
  }
  double v3 = [(SBAppViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(SBAppViewController *)self view];
  double v13 = [MEMORY[0x1E4F42D90] mainScreen];
  id v14 = [v13 fixedCoordinateSpace];
  objc_msgSend(v12, "convertRect:toCoordinateSpace:", v14, v5, v7, v9, v11);
  double v16 = v15;
  double v18 = v17;

  if (!self->_deviceAppViewController)
  {
    uint64_t v19 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle currentInterfaceOrientation];
    if (!v19) {
      uint64_t v19 = [(SBAppViewController *)self interfaceOrientation];
    }
    id v20 = [(SBDeviceApplicationSceneViewController *)[SBPriorityDeviceApplicationSceneViewController alloc] initWithSceneHandle:self->_sceneHandle];
    deviceAppViewController = self->_deviceAppViewController;
    self->_deviceAppViewController = &v20->super;

    [(SBDeviceApplicationSceneViewController *)self->_deviceAppViewController setRendersWhileLocked:1];
    [(SBDeviceApplicationSceneViewController *)self->_deviceAppViewController loadViewIfNeeded];
    -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceAppViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v19, v19, v16, v18);
    double v22 = self->_deviceAppViewController;
    double v23 = [(SBAppViewController *)self applicationSceneStatusBarDelegate];
    [(SBApplicationSceneViewController *)v22 setApplicationSceneStatusBarDelegate:v23];

    [(SBDeviceApplicationSceneViewController *)self->_deviceAppViewController setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      -[SBDeviceApplicationSceneViewController setHomeGrabberDisplayMode:](self->_deviceAppViewController, "setHomeGrabberDisplayMode:", [WeakRetained appViewControllerShouldHideHomeGrabberView:self]);
    }
    double v24 = [(SBDeviceApplicationSceneViewController *)self->_deviceAppViewController view];
    v25 = [(SBAppViewController *)self appView];
    objc_msgSend(v24, "setBounds:", v5, v7, v9, v11);
    UIRectGetCenter();
    objc_msgSend(v24, "setCenter:");
    [v25 setPlaceholderContentContext:self->_placeholderContentContext];
    [v25 setPlaceholderContentEnabled:self->_placeholderContentEnabled];
    [v25 setDisplayMode:2 animationFactory:0 completion:0];
    [(SBAppViewController *)self bs_addChildViewController:self->_deviceAppViewController animated:0 transitionBlock:0];
  }
}

- (void)_destroySceneViewController
{
  deviceAppViewController = self->_deviceAppViewController;
  if (deviceAppViewController)
  {
    [(SBAppViewController *)self bs_removeChildViewController:deviceAppViewController animated:0 transitionBlock:0];
    double v4 = [(SBAppViewController *)self appView];
    [v4 invalidate];

    double v5 = self->_deviceAppViewController;
    self->_deviceAppViewController = 0;
  }
}

- (void)_sendActions:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    if (self->_currentMode != 2)
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"SBAppViewController.m" lineNumber:564 description:@"Current mode must be live."];
    }
    if (self->_invalidated)
    {
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"SBAppViewController.m", 565, @"Cannot activate an application on an invalidated appViewController: %@", self object file lineNumber description];
    }
    double v6 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__SBAppViewController__sendActions___block_invoke;
    v9[3] = &unk_1E6B090E8;
    id v10 = v5;
    [v6 updateUISettingsWithTransitionBlock:v9];
  }
}

id __36__SBAppViewController__sendActions___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42790]);
  [v2 setActions:*(void *)(a1 + 32)];
  return v2;
}

- (void)_activateApp
{
  if (self->_currentMode != 2)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBAppViewController.m" lineNumber:576 description:@"Cannot deactivate when the mode is live."];
  }
  if (!self->_sceneHandle)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBAppViewController.m" lineNumber:577 description:@"scene handle must exist"];
  }
  if (self->_invalidated)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBAppViewController.m", 578, @"Cannot activate an application on an invalidated appViewController: %@", self object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained appViewControllerWillActivateApplication:self];
  }
  [(SBDeviceApplicationSceneHandle *)self->_sceneHandle setHostedSecureApp:1];
  id v5 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:self->_sceneHandle];
  double v6 = [(SBAppViewController *)self _createSceneUpdateTransactionForApplicationSceneEntity:v5 deliveringActions:1];
  [(SBDeviceApplicationSceneHandle *)self->_sceneHandle addObserver:self];
  [(SBActivationSettings *)self->_activationSettings clearActivationSettings];
  objc_initWeak(&location, v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__SBAppViewController__activateApp__block_invoke;
  v11[3] = &unk_1E6AF7920;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  [v6 setCompletionBlock:v11];
  [(NSMutableSet *)self->_activeTransitions addObject:v6];
  [v6 begin];
  [(SBAppViewController *)self _createSceneViewController];
  double v7 = +[SBSceneView defaultDisplayModeAnimationFactory];
  [(SBAppViewController *)self setDisplayMode:4 animationFactory:v7 completion:0];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __35__SBAppViewController__activateApp__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(*(void *)(a1 + 32) + 1016) removeObject:WeakRetained];
  }
  id v2 = [*(id *)(a1 + 32) view];
  double v3 = [v2 window];
  double v4 = [v3 _roleHint];
  char v5 = SBTraitsArbiterOrientationActuationEnabledForRole(v4);

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 984) currentInterfaceOrientation];
    double v7 = [*(id *)(a1 + 32) appView];

    if (v7)
    {
      if (v6) {
        [*(id *)(a1 + 32) _transformHostedAppViewForRotationToOrientation:v6];
      }
    }
  }
}

- (id)_configureApplicationSceneEntity:(id)a3 deliveringActions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = v6;
  if (self->_ignoresOcclusions) {
    [v6 setObject:self->_identifier forActivationSetting:61];
  }
  [v7 applyActivationSettings:self->_activationSettings];
  [v7 applyActivationSettings:self->_supplementalActivationSettings];
  if (v4 && self->_actionsToDeliver)
  {
    objc_msgSend(v7, "addActions:");
    [(SBAppViewController *)self setActionsToDeliver:0];
  }
  return v7;
}

- (id)_createSceneUpdateTransactionForApplicationSceneEntity:(id)a3 deliveringActions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SBAppViewController *)self _configureApplicationSceneEntity:v6 deliveringActions:v4];
  double v8 = [v6 sceneHandle];
  int v9 = [v8 isSecure];

  if (v9) {
    uint64_t v10 = 12;
  }
  else {
    uint64_t v10 = 4;
  }
  double v11 = +[SBMainWorkspace sharedInstance];
  id v12 = [v11 createRequestWithOptions:v10];

  [v12 setSource:7];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __96__SBAppViewController__createSceneUpdateTransactionForApplicationSceneEntity_deliveringActions___block_invoke;
  id v20 = &unk_1E6AF5638;
  double v21 = self;
  id v22 = v6;
  id v13 = v6;
  [v12 modifyApplicationContext:&v17];
  id v14 = [SBApplicationSceneUpdateTransaction alloc];
  double v15 = -[SBApplicationSceneUpdateTransaction initWithApplicationSceneEntity:transitionRequest:delegate:](v14, "initWithApplicationSceneEntity:transitionRequest:delegate:", v13, v12, self, v17, v18, v19, v20, v21);
  [(FBApplicationUpdateScenesTransaction *)v15 setWaitsForSceneCommits:0];
  [(SBApplicationSceneUpdateTransaction *)v15 setShouldSendActivationResult:1];

  return v15;
}

void __96__SBAppViewController__createSceneUpdateTransactionForApplicationSceneEntity_deliveringActions___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 984), "currentInterfaceOrientation"));
  [v4 setEntity:*(void *)(a1 + 40) forLayoutRole:1];
  double v3 = +[SBWorkspaceEntity entity];
  [v4 setEntity:v3 forLayoutRole:2];

  if ([*(id *)(a1 + 40) BOOLForActivationSetting:3]) {
    [v4 setBackground:1];
  }
  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)_deactivateHostedApp
{
  if (self->_currentMode == 2)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBAppViewController.m" lineNumber:669 description:@"Cannot deactivate when the mode is live."];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained appViewControllerShouldBackgroundApplicationOnDeactivate:self];
  }
  else {
    char v4 = 1;
  }
  [(NSMutableSet *)self->_activeTransitions enumerateObjectsUsingBlock:&__block_literal_global_301];
  [(NSMutableSet *)self->_activeTransitions removeAllObjects];
  [(SBDeviceApplicationSceneHandle *)self->_sceneHandle removeObserver:self];
  [(SBDeviceApplicationSceneHandle *)self->_sceneHandle setHostedSecureApp:0];
  char v5 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__SBAppViewController__deactivateHostedApp__block_invoke_2;
  v13[3] = &unk_1E6B09130;
  char v14 = v4;
  v13[4] = self;
  [v5 updateSettingsWithBlock:v13];

  if ([(SBApplicationSceneHandle *)self->_sceneHandle isSecure])
  {
    id v6 = [MEMORY[0x1E4F62490] sharedInstance];
    id v7 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIdentifier];
    double v8 = [v6 sceneWithIdentifier:v7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__SBAppViewController__deactivateHostedApp__block_invoke_3;
    v11[3] = &unk_1E6B09130;
    char v12 = v4;
    v11[4] = self;
    [v8 updateSettingsWithBlock:v11];
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained appViewControllerDidDeactivateApplication:self];
  }
  [(SBAppViewController *)self setDisplayMode:2 animationFactory:0 completion:0];
}

uint64_t __43__SBAppViewController__deactivateHostedApp__block_invoke(uint64_t a1, void *a2)
{
  return [a2 interrupt];
}

void __43__SBAppViewController__deactivateHostedApp__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    [v3 setForeground:0];
    id v3 = v5;
  }
  char v4 = [v3 ignoreOcclusionReasons];
  [v4 removeObject:*(void *)(*(void *)(a1 + 32) + 976)];
}

void __43__SBAppViewController__deactivateHostedApp__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    [v3 setForeground:0];
    id v3 = v5;
  }
  char v4 = [v3 ignoreOcclusionReasons];
  [v4 removeObject:*(void *)(*(void *)(a1 + 32) + 976)];
}

- (void)_installedAppsDidChange:(id)a3
{
  char v4 = [a3 userInfo];
  id v8 = [v4 objectForKey:@"SBInstalledApplicationsReplacedBundleIDs"];

  id v5 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
  id v6 = [v5 bundleIdentifier];
  int v7 = [v8 containsObject:v6];

  if (v7) {
    [(SBAppViewController *)self _destroySceneViewController];
  }
}

- (id)_windowSceneFromSceneHandle
{
  id v3 = [(id)SBApp windowSceneManager];
  char v4 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle displayIdentity];
  id v5 = [v3 windowSceneForDisplayIdentity:v4];

  return v5;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(SBAppViewController *)self _windowSceneFromSceneHandle];
  id v6 = [v5 layoutStateTransitionCoordinator];
  int v7 = [v6 layoutStateForApplicationTransitionContext:v4];

  return v7;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(SBAppViewController *)self _windowSceneFromSceneHandle];
  id v6 = [v5 layoutStateTransitionCoordinator];
  int v7 = [v6 previousLayoutStateForApplicationTransitionContext:v4];

  return v7;
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  id v4 = [(SBAppViewController *)self _windowSceneFromSceneHandle];
  id v5 = [v4 _FBSScene];
  id v6 = [v5 settings];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)sceneUpdateTransaction:(id)a3 finishedApplyingUpdate:(BOOL)a4
{
  if (!a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained appViewControllerDidFailToActivateApplication:self];
    }
  }
}

- (int64_t)currentMode
{
  return self->_currentMode;
}

- (NSSet)actionsToDeliver
{
  return self->_actionsToDeliver;
}

- (int64_t)requestedMode
{
  return self->_requestedMode;
}

- (BOOL)automatesLifecycle
{
  return self->_automatesLifecycle;
}

- (SBScenePlaceholderContentContext)placeholderContentContext
{
  return self->_placeholderContentContext;
}

- (SBApplicationSceneViewControllingStatusBarDelegate)applicationSceneStatusBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->applicationSceneStatusBarDelegate);
  return (SBApplicationSceneViewControllingStatusBarDelegate *)WeakRetained;
}

- (void)setApplicationSceneStatusBarDelegate:(id)a3
{
}

- (SBAppViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAppViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)ignoresOcclusions
{
  return self->_ignoresOcclusions;
}

- (void)setIgnoresOcclusions:(BOOL)a3
{
  self->_ignoresOcclusions = a3;
}

- (BOOL)wantsSecureRendering
{
  return self->_wantsSecureRendering;
}

- (void)setWantsSecureRendering:(BOOL)a3
{
  self->_wantsSecureRendering = a3;
}

- (SBActivationSettings)supplementalActivationSettings
{
  return self->_supplementalActivationSettings;
}

- (void)setSupplementalActivationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalActivationSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->applicationSceneStatusBarDelegate);
  objc_storeStrong((id *)&self->_actionsToDeliver, 0);
  objc_storeStrong((id *)&self->_activeTransitions, 0);
  objc_storeStrong((id *)&self->_placeholderContentContext, 0);
  objc_storeStrong((id *)&self->_activationSettings, 0);
  objc_storeStrong((id *)&self->_deviceAppViewController, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(const char *)a1 andApplicationSceneEntity:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_30();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sceneHandle:(const char *)a1 didUpdateSettingsWithDiff:previousSettings:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end