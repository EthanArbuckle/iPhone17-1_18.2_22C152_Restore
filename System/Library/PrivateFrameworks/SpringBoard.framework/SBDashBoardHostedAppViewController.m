@interface SBDashBoardHostedAppViewController
- (BOOL)_shouldDelayDeactivationUntilAfterDisappearance;
- (BOOL)_shouldInvalidateUponDeactivation;
- (BOOL)allowsConfiguringIndividualStatusBarParts;
- (BOOL)appViewControllerIsInNonRotatingWindow:(id)a3;
- (BOOL)appViewControllerShouldBackgroundApplicationOnDeactivate:(id)a3;
- (BOOL)appViewControllerShouldHideHomeGrabberView:(id)a3;
- (BOOL)appViewControllerShouldReactivateApplicationOnDestruction:(id)a3;
- (BOOL)canHostAnApp;
- (BOOL)handleEvent:(id)a3;
- (BOOL)intentToTransitionFromSecureAppToFull;
- (BOOL)interfaceOrientationLocked;
- (BOOL)isHostingAnApp;
- (BOOL)placeholderContentEnabled;
- (CSAppHostContextProviding)hostContextProvider;
- (NSSet)actionsToDeliver;
- (SBApplicationSceneHandle)applicationSceneHandle;
- (SBApplicationSceneStatusBarDescribing)statusBarDescriber;
- (SBApplicationSceneView)appView;
- (SBDashBoardHostedAppViewController)initWithApplicationSceneEntity:(id)a3;
- (SBDashBoardHostedAppViewControllerDelegate)delegate;
- (SBScenePlaceholderContentContext)placeholderContentContext;
- (id)_appViewController;
- (id)_deviceApplicationSceneHandle;
- (id)_newDisplayLayoutElement;
- (id)appearanceIdentifier;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)invalidationHandler;
- (id)statusBarDescriberForStatusBarPart:(id)a3;
- (id)statusBarDescribers;
- (int64_t)containerInterfaceOrientation;
- (int64_t)mode;
- (int64_t)overrideIdleWarnMode;
- (int64_t)presentationPriority;
- (int64_t)presentationStyle;
- (int64_t)presentationType;
- (int64_t)statusBarOrientation;
- (void)_addStatusBarViewIfNeeded;
- (void)_beginShowingStatusBarView;
- (void)_deactivateIfAppropriateForReason:(id)a3;
- (void)_endShowingStatusBarView;
- (void)_setMode:(int64_t)a3 fromClient:(BOOL)a4 forReason:(id)a5;
- (void)_setResignActiveAssertionEnabled:(BOOL)a3;
- (void)_updateDisplayLayoutElementForActivation:(id)a3;
- (void)_updateStatusBarContainerOrientation;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)appViewController:(id)a3 didTransitionFromMode:(int64_t)a4 toMode:(int64_t)a5;
- (void)appViewControllerDidDeactivateApplication:(id)a3;
- (void)appViewControllerDidFailToActivateApplication:(id)a3;
- (void)appViewControllerWillActivateApplication:(id)a3;
- (void)applicationSceneHandle:(id)a3 appendToSceneSettings:(id)a4 fromRequestContext:(id)a5 entity:(id)a6;
- (void)applicationSceneViewController:(id)a3 didUpdateStatusBarSettings:(id)a4;
- (void)dealloc;
- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)invalidate;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)sceneWithIdentifier:(id)a3 didChangeSceneInterfaceOrientationTo:(int64_t)a4;
- (void)setActionsToDeliver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostContextProvider:(id)a3;
- (void)setHostedAppReferenceSize:(CGSize)a3 withInterfaceOrientation:(int64_t)a4;
- (void)setIntentToTransitionFromSecureAppToFull:(BOOL)a3;
- (void)setInterfaceOrientationLocked:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOverrideIdleWarnMode:(int64_t)a3;
- (void)setPlaceholderContentContext:(id)a3;
- (void)setPlaceholderContentEnabled:(BOOL)a3;
- (void)setSupplementalActivationSettings:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation SBDashBoardHostedAppViewController

- (BOOL)isHostingAnApp
{
  return [(SBAppViewController *)self->_appViewController isHostingAnApp];
}

- (void)aggregateBehavior:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBDashBoardHostedAppViewController;
  [(CSCoverSheetViewControllerBase *)&v13 aggregateBehavior:v4];
  v5 = +[SBSecureAppManager sharedInstance];
  v6 = [v5 secureAppAction];
  char v7 = [v6 isInProcessAction];

  if ((v7 & 1) != 0
    || (+[SBThermalController sharedInstance],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 level],
        v8,
        (v9 & 0xFFFFFFFFFFFFFFFELL) != 2))
  {
    if (self->_wantsIdleTimerDisabled) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 1;
    }
    if (self->_wantsIdleTimerDisabled) {
      uint64_t v10 = 14;
    }
    else {
      uint64_t v10 = 12;
    }
    if (self->_wantsIdleTimerDisabled) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }
  }
  else
  {
    uint64_t v10 = 9;
    uint64_t v11 = 1;
    uint64_t v12 = 1;
  }
  [v4 setIdleTimerMode:v11];
  [v4 setIdleTimerDuration:v10];
  [v4 setIdleWarnMode:v12];
  if (self->_overrideIdleWarnMode) {
    objc_msgSend(v4, "setIdleWarnMode:");
  }
  [v4 setNotificationBehavior:2];
}

void __100__SBDashBoardHostedAppViewController_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = [WeakRetained applicationSceneHandle];
    v3 = [v2 scene];
    id v4 = [v3 uiClientSettings];
    v5[1113] = [v4 idleTimerDisabled];

    [v5 rebuildBehavior];
    WeakRetained = v5;
  }
}

- (SBApplicationSceneHandle)applicationSceneHandle
{
  return [(SBAppViewController *)self->_appViewController sceneHandle];
}

- (void)applicationSceneHandle:(id)a3 appendToSceneSettings:(id)a4 fromRequestContext:(id)a5 entity:(id)a6
{
  id v8 = a4;
  char v7 = [(SBDashBoardHostedAppViewController *)self hostContextProvider];
  if (objc_opt_respondsToSelector()) {
    [v7 appendToHostedAppSceneSettings:v8];
  }
}

- (CSAppHostContextProviding)hostContextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostContextProvider);
  return (CSAppHostContextProviding *)WeakRetained;
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
    if (!appClientSettingsDiffInspector)
    {
      uint64_t v12 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
      objc_super v13 = self->_appClientSettingsDiffInspector;
      self->_appClientSettingsDiffInspector = v12;

      objc_initWeak(&location, self);
      v14 = self->_appClientSettingsDiffInspector;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __100__SBDashBoardHostedAppViewController_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
      v18 = &unk_1E6AF85E0;
      objc_copyWeak(&v19, &location);
      [(UIApplicationSceneClientSettingsDiffInspector *)v14 observeIdleTimerDisabledWithBlock:&v15];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
    }
    objc_msgSend(v9, "evaluateWithInspector:context:", appClientSettingsDiffInspector, v10, v15, v16, v17, v18);
  }
}

- (SBDashBoardHostedAppViewController)initWithApplicationSceneEntity:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Sbapplications_8.isa);
  if (!v5)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBDashBoardHostedAppViewController initWithApplicationSceneEntity:](a2);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8C08904);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:SBApplicationSceneEntityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBDashBoardHostedAppViewController initWithApplicationSceneEntity:](a2);
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8C08968);
  }

  v27.receiver = self;
  v27.super_class = (Class)SBDashBoardHostedAppViewController;
  v6 = [(SBDashBoardHostedAppViewController *)&v27 init];
  if (v6)
  {
    char v7 = [MEMORY[0x1E4F4F718] builderWithObject:v6];
    id v8 = SBLogDashBoardHostedAppViewController();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __69__SBDashBoardHostedAppViewController_initWithApplicationSceneEntity___block_invoke;
      v24[3] = &unk_1E6AF5290;
      id v25 = v7;
      id v26 = v5;
      id v10 = (id)[v25 modifyProem:v24];
    }
    uint64_t v11 = [v5 sceneHandle];
    [v11 addSceneUpdateContributer:v6];

    uint64_t v12 = [v7 build];
    cachedBasicPublicDescription = v6->_cachedBasicPublicDescription;
    v6->_cachedBasicPublicDescription = (NSString *)v12;

    v14 = [SBAppViewController alloc];
    uint64_t v15 = [(SBDashBoardHostedAppViewController *)v6 appearanceIdentifier];
    uint64_t v16 = [(SBAppViewController *)v14 initWithIdentifier:v15 andApplicationSceneEntity:v5];
    appViewController = v6->_appViewController;
    v6->_appViewController = (SBAppViewController *)v16;

    [(SBAppViewController *)v6->_appViewController setAutomatesLifecycle:0];
    [(SBAppViewController *)v6->_appViewController setIgnoresOcclusions:1];
    [(SBAppViewController *)v6->_appViewController setDelegate:v6];
    [(SBAppViewController *)v6->_appViewController setApplicationSceneStatusBarDelegate:v6];
    v18 = [(SBDashBoardHostedAppViewController *)v6 applicationSceneHandle];
    [v18 addObserver:v6];

    id v19 = SBLogDashBoardHostedAppViewController();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = v6->_cachedBasicPublicDescription;
      *(_DWORD *)buf = 138543362;
      v29 = v20;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_INFO, "<%{public}@> created", buf, 0xCu);
    }
  }
  return v6;
}

void __69__SBDashBoardHostedAppViewController_initWithApplicationSceneEntity___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) application];
  v2 = [v3 bundleIdentifier];
  [v1 appendString:v2 withName:@"bundleIdentifier"];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = SBLogDashBoardHostedAppViewController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    *(_DWORD *)buf = 138543362;
    id v8 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "<%{public}@> dealloc", buf, 0xCu);
  }

  [(UIApplicationSceneClientSettingsDiffInspector *)self->_appClientSettingsDiffInspector removeAllObservers];
  id v5 = [(SBDashBoardHostedAppViewController *)self applicationSceneHandle];
  [v5 removeObserver:self];

  [(SBDashBoardHostedAppViewController *)self invalidate];
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardHostedAppViewController;
  [(CSCoverSheetViewControllerBase *)&v6 dealloc];
}

- (int64_t)mode
{
  return [(SBAppViewController *)self->_appViewController requestedMode];
}

- (void)setMode:(int64_t)a3
{
}

- (SBApplicationSceneView)appView
{
  return [(SBAppViewController *)self->_appViewController appView];
}

- (SBScenePlaceholderContentContext)placeholderContentContext
{
  return [(SBAppViewController *)self->_appViewController placeholderContentContext];
}

- (void)setPlaceholderContentContext:(id)a3
{
}

- (NSSet)actionsToDeliver
{
  return [(SBAppViewController *)self->_appViewController actionsToDeliver];
}

- (void)setActionsToDeliver:(id)a3
{
}

- (BOOL)placeholderContentEnabled
{
  return [(SBAppViewController *)self->_appViewController placeholderContentEnabled];
}

- (void)setPlaceholderContentEnabled:(BOOL)a3
{
}

- (void)setInterfaceOrientationLocked:(BOOL)a3
{
  BOOL v3 = a3;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleSecureApp") & 1) == 0
    && (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheetCamera") & 1) == 0
    && self->_interfaceOrientationLocked != v3)
  {
    self->_interfaceOrientationLocked = v3;
    if ([(SBDashBoardHostedAppViewController *)self _appearState] == 2)
    {
      if (self->_interfaceOrientationLocked)
      {
        id v5 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:@"SBDashBoardHostedApp"];
        deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
        self->_deferOrientationUpdatesAssertion = v5;
      }
      else
      {
        [(BSInvalidatable *)self->_deferOrientationUpdatesAssertion invalidate];
        deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
        self->_deferOrientationUpdatesAssertion = 0;
      }
    }
  }
}

- (void)setSupplementalActivationSettings:(id)a3
{
}

- (void)setOverrideIdleWarnMode:(int64_t)a3
{
  if (self->_overrideIdleWarnMode != a3)
  {
    self->_overrideIdleWarnMode = a3;
    [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    id v11 = [MEMORY[0x1E4F62490] sharedInstance];
    BOOL v3 = +[SBSceneManagerCoordinator secureMainDisplaySceneManager];
    id v4 = [(SBDashBoardHostedAppViewController *)self appView];
    id v5 = [v4 application];
    objc_super v6 = [v3 sceneIdentityForApplication:v5];
    char v7 = [v6 identifier];

    [(SBFAuthenticationAssertion *)self->_authenticationAssertion invalidate];
    [(SBAppViewController *)self->_appViewController invalidate];
    [(SBDashBoardHostedAppViewController *)self _setResignActiveAssertionEnabled:0];
    self->_invalidated = 1;
    id v8 = [v11 sceneWithIdentifier:v7];

    if (v8) {
      [v11 destroyScene:v7 withTransitionContext:0];
    }
    uint64_t v9 = [(SBDashBoardHostedAppViewController *)self invalidationHandler];
    id v10 = (void *)v9;
    if (v9) {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardHostedAppViewController;
  [(CSCoverSheetViewControllerBase *)&v5 viewDidLoad];
  appViewController = self->_appViewController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SBDashBoardHostedAppViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E6AF6698;
  v4[4] = self;
  [(SBDashBoardHostedAppViewController *)self bs_addChildViewController:appViewController animated:0 transitionBlock:v4];
  [(SBDashBoardHostedAppViewController *)self _addStatusBarViewIfNeeded];
}

void __49__SBDashBoardHostedAppViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1072);
  id v4 = a2;
  id v6 = [v3 view];
  objc_super v5 = [*(id *)(a1 + 32) viewIfLoaded];
  [v5 bounds];
  objc_msgSend(v6, "setFrame:");

  [v6 setAutoresizingMask:18];
  v4[2](v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SBDashBoardHostedAppViewController;
  [(CSCoverSheetViewControllerBase *)&v12 viewWillAppear:a3];
  id v4 = SBLogDashBoardHostedAppViewController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    *(_DWORD *)buf = 138543362;
    v14 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "<%{public}@> viewWillAppear", buf, 0xCu);
  }

  [(SBDashBoardHostedAppViewController *)self _setMode:2 fromClient:0 forReason:@"viewWillAppear"];
  if (!self->_authenticationAssertion)
  {
    id v6 = [(id)SBApp authenticationController];
    char v7 = [(SBDashBoardHostedAppViewController *)self appearanceIdentifier];
    id v8 = [v6 createKeybagUnlockAssertionWithReason:v7];
    authenticationAssertion = self->_authenticationAssertion;
    self->_authenticationAssertion = v8;

    [(SBFAuthenticationAssertion *)self->_authenticationAssertion activate];
  }
  if (self->_interfaceOrientationLocked)
  {
    id v10 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:@"SBDashBoardHostedApp"];
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = v10;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SBDashBoardHostedAppViewController;
  [(CSCoverSheetExternalViewControllerBase *)&v14 viewDidAppear:a3];
  id v4 = SBLogDashBoardHostedAppViewController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "<%{public}@> viewDidAppear", buf, 0xCu);
  }

  id v6 = [(SBDashBoardHostedAppViewController *)self hostedAppSceneHandle];
  char v7 = [v6 sceneIfExists];

  if (v7)
  {
    id v8 = [v7 uiClientSettings];
    int v9 = [v8 idleTimerDisabled];

    if (self->_wantsIdleTimerDisabled != v9)
    {
      self->_wantsIdleTimerDisabled = v9;
      [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
    }
  }
  [(SBDashBoardHostedAppViewController *)self _setMode:2 fromClient:0 forReason:@"viewDidAppear"];
  id v10 = +[SBKeyboardFocusCoordinator sharedInstance];
  id v11 = [(SBDashBoardHostedAppViewController *)self _appViewController];
  objc_super v12 = [v11 _sbWindowScene];
  objc_super v13 = +[SBKeyboardFocusArbitrationReason dsahBoardAppViewControllerDidAppear];
  [v10 requestArbitrationForSBWindowScene:v12 forReason:v13];
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardHostedAppViewController;
  [(CSCoverSheetExternalViewControllerBase *)&v6 viewWillDisappear:a3];
  id v4 = SBLogDashBoardHostedAppViewController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    *(_DWORD *)buf = 138543362;
    id v8 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "<%{public}@> viewWillDisappear", buf, 0xCu);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SBDashBoardHostedAppViewController;
  [(CSCoverSheetViewControllerBase *)&v14 viewDidDisappear:a3];
  id v4 = SBLogDashBoardHostedAppViewController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "<%{public}@> viewDidDisappear", buf, 0xCu);
  }

  if (self->_interfaceOrientationLocked)
  {
    [(BSInvalidatable *)self->_deferOrientationUpdatesAssertion invalidate];
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = 0;
  }
  BOOL v7 = [(SBDashBoardHostedAppViewController *)self _shouldDelayDeactivationUntilAfterDisappearance];
  self->_waitingToDeactivateAfterDisappearance = v7;
  if (v7)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__SBDashBoardHostedAppViewController_viewDidDisappear___block_invoke;
    v13[3] = &unk_1E6AF4AC0;
    v13[4] = self;
    objc_msgSend(MEMORY[0x1E4F39CF8], "bs_performAfterSynchronizedCommit:", v13);
  }
  else
  {
    [(SBDashBoardHostedAppViewController *)self _deactivateIfAppropriateForReason:@"viewDidDisappear"];
  }
  [(SBFAuthenticationAssertion *)self->_authenticationAssertion invalidate];
  authenticationAssertion = self->_authenticationAssertion;
  self->_authenticationAssertion = 0;

  uint64_t v9 = +[SBKeyboardFocusCoordinator sharedInstance];
  id v10 = [(SBDashBoardHostedAppViewController *)self _appViewController];
  id v11 = [v10 _sbWindowScene];
  objc_super v12 = +[SBKeyboardFocusArbitrationReason dsahBoardAppViewControllerDidDisappear];
  [v9 requestArbitrationForSBWindowScene:v11 forReason:v12];
}

void __55__SBDashBoardHostedAppViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__SBDashBoardHostedAppViewController_viewDidDisappear___block_invoke_2;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = *(void *)(a1 + 32);
  v1 = (void (**)(void))MEMORY[0x1D948C7A0](v2);
  v1[2]();
}

uint64_t __55__SBDashBoardHostedAppViewController_viewDidDisappear___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  char v3 = [v2 _isInAWindow];

  if ((v3 & 1) == 0) {
    [*(id *)(a1 + 32) _setResignActiveAssertionEnabled:0];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1114) = 0;
  id v4 = *(void **)(a1 + 32);
  return [v4 _deactivateIfAppropriateForReason:@"after viewDidDisappear"];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardHostedAppViewController;
  [(SBDashBoardHostedAppViewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (!a3) {
    [(SBDashBoardHostedAppViewController *)self _setResignActiveAssertionEnabled:0];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardHostedAppViewController;
  -[SBDashBoardHostedAppViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3) {
    [(SBDashBoardHostedAppViewController *)self _setResignActiveAssertionEnabled:0];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardHostedAppViewController;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id v8 = [(SBDashBoardHostedAppViewController *)self view];
  uint64_t v9 = [v8 window];
  id v10 = [v9 _roleHint];
  char v11 = SBTraitsArbiterOrientationActuationEnabledForRole(v10);

  if ((v11 & 1) == 0)
  {
    objc_super v12 = [(SBDashBoardHostedAppViewController *)self hostedAppSceneHandle];
    int v13 = [v12 wantsDeviceOrientationEventsEnabled];

    if (v13)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __89__SBDashBoardHostedAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      v14[3] = &unk_1E6AF53F8;
      v14[4] = self;
      [v7 animateAlongsideTransition:v14 completion:0];
    }
  }
}

uint64_t __89__SBDashBoardHostedAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStatusBarContainerOrientation];
}

- (void)aggregateAppearance:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardHostedAppViewController;
  id v3 = a3;
  [(CSCoverSheetViewControllerBase *)&v7 aggregateAppearance:v3];
  id v4 = objc_opt_new();
  objc_super v5 = objc_msgSend(v4, "priority:", 10, v7.receiver, v7.super_class);
  objc_super v6 = [v5 fakeStatusBar:1];
  [v3 addComponent:v6];
}

- (id)_newDisplayLayoutElement
{
  v2 = [(SBDashBoardHostedAppViewController *)self applicationSceneHandle];
  id v3 = [v2 application];
  id v4 = [v3 bundleIdentifier];

  if (v4)
  {
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4FA6A68]) initWithIdentifier:v4];
    [v5 setFillsDisplayBounds:1];
    [v5 setLayoutRole:6];
    [v5 setUIApplicationElement:1];
    [v5 setBundleIdentifier:v4];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (void)_updateDisplayLayoutElementForActivation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardHostedAppViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v5 _updateDisplayLayoutElementForActivation:v4];
  objc_msgSend(v4, "sb_setTransitioning:", (-[SBDashBoardHostedAppViewController _appearState](self, "_appearState", v5.receiver, v5.super_class) & 0xFFFFFFFD) == 1);
}

- (id)appearanceIdentifier
{
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardHostedAppViewController;
  id v3 = [(CSCoverSheetViewControllerBase *)&v6 appearanceIdentifier];
  cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
  return cachedBasicPublicDescription;
}

- (int64_t)presentationStyle
{
  return 1;
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 0;
}

- (BOOL)canHostAnApp
{
  return [(SBAppViewController *)self->_appViewController canHostAnApp];
}

- (id)hostedAppSceneHandle
{
  return [(SBAppViewController *)self->_appViewController hostedAppSceneHandle];
}

- (id)hostedAppSceneHandles
{
  return [(SBAppViewController *)self->_appViewController hostedAppSceneHandles];
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
}

- (void)setHostedAppReferenceSize:(CGSize)a3 withInterfaceOrientation:(int64_t)a4
{
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBDashBoardHostedAppViewController;
  if (![(CSCoverSheetViewControllerBase *)&v16 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    uint64_t v6 = [v4 type];
    if (v6 == 11)
    {
      if ([(CSCoverSheetExternalViewControllerBase *)self isExternalToDashBoard])
      {
LABEL_21:
        char v5 = 0;
        goto LABEL_22;
      }
      uint64_t v9 = SBLogDashBoardHostedAppViewController();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
        *(_DWORD *)buf = 138543362;
        v18 = cachedBasicPublicDescription;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "<%{public}@> didBecomeActive", buf, 0xCu);
      }

      char v11 = self;
      uint64_t v12 = 0;
    }
    else
    {
      if (v6 != 10)
      {
        if (v6 == 9 && ![(CSCoverSheetExternalViewControllerBase *)self isExternalToDashBoard])
        {
          objc_super v7 = SBLogDashBoardHostedAppViewController();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            id v8 = self->_cachedBasicPublicDescription;
            *(_DWORD *)buf = 138543362;
            v18 = v8;
            _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "<%{public}@> didDeactivate", buf, 0xCu);
          }

          [(SBDashBoardHostedAppViewController *)self _setResignActiveAssertionEnabled:0];
          [(SBDashBoardHostedAppViewController *)self _setMode:0 fromClient:0 forReason:@"DashBoard deactivated"];
        }
        goto LABEL_21;
      }
      if ([(CSCoverSheetExternalViewControllerBase *)self isExternalToDashBoard]) {
        goto LABEL_21;
      }
      int v13 = SBLogDashBoardHostedAppViewController();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_super v14 = self->_cachedBasicPublicDescription;
        *(_DWORD *)buf = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, "<%{public}@> didResignActive", buf, 0xCu);
      }

      if ([(CSCoverSheetViewControllerBase *)self isDisappeared]) {
        goto LABEL_21;
      }
      char v11 = self;
      uint64_t v12 = 1;
    }
    [(SBDashBoardHostedAppViewController *)v11 _setResignActiveAssertionEnabled:v12];
    goto LABEL_21;
  }
  char v5 = [v4 isConsumable];
LABEL_22:

  return v5;
}

- (void)appViewControllerWillActivateApplication:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogDashBoardHostedAppViewController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    int v12 = 138543362;
    int v13 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "<%{public}@> willActivateApplication", (uint8_t *)&v12, 0xCu);
  }

  if (!self->_authenticationAssertion)
  {
    uint64_t v6 = SBLogDashBoardHostedAppViewController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_super v7 = self->_cachedBasicPublicDescription;
      int v12 = 138543362;
      int v13 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "<%{public}@> taking authentication sustain assertion", (uint8_t *)&v12, 0xCu);
    }

    id v8 = [(id)SBApp authenticationController];
    uint64_t v9 = [(SBDashBoardHostedAppViewController *)self appearanceIdentifier];
    id v10 = [v8 createKeybagUnlockAssertionWithReason:v9];
    authenticationAssertion = self->_authenticationAssertion;
    self->_authenticationAssertion = v10;

    [(SBFAuthenticationAssertion *)self->_authenticationAssertion activate];
  }
  self->_intentToTransitionFromSecureAppToFull = 0;
  [(SBDashBoardHostedAppViewController *)self _beginShowingStatusBarView];
}

- (void)appViewControllerDidDeactivateApplication:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogDashBoardHostedAppViewController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    int v9 = 138543362;
    id v10 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "<%{public}@> didDeactivateApplication", (uint8_t *)&v9, 0xCu);
  }

  if (self->_authenticationAssertion)
  {
    uint64_t v6 = SBLogDashBoardHostedAppViewController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_super v7 = self->_cachedBasicPublicDescription;
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "<%{public}@> releasing authentication sustain assertion", (uint8_t *)&v9, 0xCu);
    }

    [(SBFAuthenticationAssertion *)self->_authenticationAssertion invalidate];
    authenticationAssertion = self->_authenticationAssertion;
    self->_authenticationAssertion = 0;
  }
  [(SBDashBoardHostedAppViewController *)self _endShowingStatusBarView];
}

- (void)appViewController:(id)a3 didTransitionFromMode:(int64_t)a4 toMode:(int64_t)a5
{
  [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
}

- (BOOL)appViewControllerShouldBackgroundApplicationOnDeactivate:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = +[SBWorkspace mainWorkspace];
  uint64_t v6 = [v5 createRequestWithOptions:0];

  [v6 finalize];
  objc_super v7 = [v6 applicationContext];
  id v8 = [v7 applicationSceneEntities];

  int v9 = [v4 sceneHandle];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "sceneHandle", (void)v19);
        char v16 = SBDashBoardSceneHandleEqualToSceneHandle(v9, v15);

        if (v16)
        {
          BOOL v17 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_11:

  if ([v9 isSecure] && self->_intentToTransitionFromSecureAppToFull) {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)appViewControllerShouldReactivateApplicationOnDestruction:(id)a3
{
  id v3 = [(SBDashBoardHostedAppViewController *)self hostContextProvider];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 hostedAppShouldReactivateUponDestruction];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)appViewControllerShouldHideHomeGrabberView:(id)a3
{
  id v3 = [(SBDashBoardHostedAppViewController *)self hostContextProvider];
  char v4 = [v3 hostedAppShouldHideHomeGrabberView];

  return v4;
}

- (BOOL)appViewControllerIsInNonRotatingWindow:(id)a3
{
  if (__sb__runningInSpringBoard())
  {
    BOOL v3 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    char v4 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v3 = [v4 userInterfaceIdiom] == 1;
  }
  return !v3;
}

- (void)appViewControllerDidFailToActivateApplication:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained dashBoardHostedAppViewControllerDidFailToActivateApplication:self];
  }
}

- (void)_setMode:(int64_t)a3 fromClient:(BOOL)a4 forReason:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SBDashBoardHostedAppViewController *)self mode] == a3) {
    goto LABEL_15;
  }
  int v9 = SBLogDashBoardHostedAppViewController();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    uint64_t v11 = NSStringFromSBAppViewControllerMode(a3);
    uint64_t v12 = NSStringFromBOOL();
    int v20 = 138544130;
    long long v21 = cachedBasicPublicDescription;
    __int16 v22 = 2114;
    v23 = v11;
    __int16 v24 = 2114;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "<%{public}@> mode change request to %{public}@ (fromClient: %{public}@) for reason: %@", (uint8_t *)&v20, 0x2Au);
  }
  if (!a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      char v14 = [WeakRetained dashBoardHostedAppViewController:self shouldTransitionToMode:a3];

      if ((v14 & 1) == 0)
      {
        objc_super v15 = SBLogDashBoardHostedAppViewController();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          char v16 = self->_cachedBasicPublicDescription;
          int v20 = 138543362;
          long long v21 = v16;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "<%{public}@> mode change request vetoed by delegate", (uint8_t *)&v20, 0xCu);
        }

        goto LABEL_15;
      }
    }
    else
    {
    }
  }
  BOOL v17 = SBLogDashBoardHostedAppViewController();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = self->_cachedBasicPublicDescription;
    long long v19 = NSStringFromSBAppViewControllerMode(a3);
    int v20 = 138543618;
    long long v21 = v18;
    __int16 v22 = 2114;
    v23 = v19;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_INFO, "<%{public}@> mode changed to %{public}@", (uint8_t *)&v20, 0x16u);
  }
  [(SBAppViewController *)self->_appViewController setRequestedMode:a3];
  if (a3 == 2) {
    [(CSCoverSheetViewControllerBase *)self _setDisplayLayoutElementActive:1 immediately:1];
  }
LABEL_15:
}

- (void)_setResignActiveAssertionEnabled:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  resignActiveAssertion = self->_resignActiveAssertion;
  if (a3)
  {
    if (!resignActiveAssertion)
    {
      char v5 = SBLogDashBoardHostedAppViewController();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
        *(_DWORD *)buf = 138543362;
        v18 = cachedBasicPublicDescription;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "<%{public}@> taking resign active assertion", buf, 0xCu);
      }

      objc_super v7 = +[SBSceneManagerCoordinator sharedInstance];
      id v8 = [v7 sceneDeactivationManager];
      int v9 = (UIApplicationSceneDeactivationAssertion *)[v8 newAssertionWithReason:7];
      id v10 = self->_resignActiveAssertion;
      self->_resignActiveAssertion = v9;

      objc_initWeak((id *)buf, self);
      uint64_t v11 = self->_resignActiveAssertion;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __71__SBDashBoardHostedAppViewController__setResignActiveAssertionEnabled___block_invoke;
      v15[3] = &unk_1E6B00560;
      objc_copyWeak(&v16, (id *)buf);
      [(UIApplicationSceneDeactivationAssertion *)v11 acquireWithPredicate:v15 transitionContext:0];
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
  else if (resignActiveAssertion)
  {
    uint64_t v12 = SBLogDashBoardHostedAppViewController();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = self->_cachedBasicPublicDescription;
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "<%{public}@> releasing resign active assertion", buf, 0xCu);
    }

    [(UIApplicationSceneDeactivationAssertion *)self->_resignActiveAssertion relinquish];
    char v14 = self->_resignActiveAssertion;
    self->_resignActiveAssertion = 0;

    [(SBDashBoardHostedAppViewController *)self _deactivateIfAppropriateForReason:@"resign active released"];
  }
}

uint64_t __71__SBDashBoardHostedAppViewController__setResignActiveAssertionEnabled___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v5 = [WeakRetained applicationSceneHandle];
  uint64_t v6 = [v5 sceneIdentifier];
  objc_super v7 = [v3 identifier];

  uint64_t v8 = [v6 isEqualToString:v7];
  return v8;
}

- (void)_deactivateIfAppropriateForReason:(id)a3
{
  id v4 = a3;
  if ([(CSCoverSheetViewControllerBase *)self isDisappeared]
    && !self->_resignActiveAssertion
    && !self->_waitingToDeactivateAfterDisappearance)
  {
    if ([(SBDashBoardHostedAppViewController *)self mode]) {
      [(SBDashBoardHostedAppViewController *)self _setMode:1 fromClient:0 forReason:v4];
    }
    if ([(SBDashBoardHostedAppViewController *)self _shouldInvalidateUponDeactivation]&& [(SBDashBoardHostedAppViewController *)self mode] != 2)
    {
      [(SBDashBoardHostedAppViewController *)self invalidate];
    }
  }
}

- (BOOL)_shouldDelayDeactivationUntilAfterDisappearance
{
  v2 = [(SBDashBoardHostedAppViewController *)self hostContextProvider];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 hostedAppShouldDeactivateAfterDisappearance];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_shouldInvalidateUponDeactivation
{
  v2 = [(SBDashBoardHostedAppViewController *)self hostContextProvider];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 hostedAppShouldInvalidateUponDeactivation];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)applicationSceneViewController:(id)a3 didUpdateStatusBarSettings:(id)a4
{
}

- (void)sceneWithIdentifier:(id)a3 didChangeSceneInterfaceOrientationTo:(int64_t)a4
{
  char v5 = [(SBDashBoardHostedAppViewController *)self view];
  uint64_t v6 = [v5 window];
  objc_super v7 = [v6 _roleHint];
  char v8 = SBTraitsArbiterOrientationActuationEnabledForRole(v7);

  if ((v8 & 1) == 0)
  {
    int v9 = self->_statusBarObserverProxy;
    if (v9)
    {
      uint64_t v13 = v9;
      uint64_t v10 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)v9 statusBarOrientation];
      int v9 = v13;
      if (v10)
      {
        uint64_t v11 = [(SBDashBoardHostedAppViewController *)self _deviceApplicationSceneHandle];
        int v12 = [v11 wantsDeviceOrientationEventsEnabled];

        int v9 = v13;
        if (v12)
        {
          [(SBDashBoardHostedAppViewController *)self _updateStatusBarContainerOrientation];
          [(SBMainDisplaySceneLayoutStatusBarView *)self->_statusBarView layoutStatusBarForSpringBoardRotationToOrientation:v10];
          int v9 = v13;
        }
      }
    }
  }
}

- (id)_deviceApplicationSceneHandle
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SBDashBoardHostedAppViewController *)self applicationSceneHandle];
  char v5 = SBSafeCast(v3, v4);

  return v5;
}

- (int64_t)containerInterfaceOrientation
{
  uint64_t v3 = +[SBLockScreenManager sharedInstance];
  id v4 = [v3 lockScreenEnvironment];
  char v5 = [v4 rootViewController];
  if ([v5 shouldAutorotate]) {
    uint64_t v6 = [(SBDashBoardHostedAppViewController *)self statusBarOrientation];
  }
  else {
    uint64_t v6 = [(id)SBApp activeInterfaceOrientation];
  }
  int64_t v7 = v6;

  return v7;
}

- (void)_addStatusBarViewIfNeeded
{
  uint64_t v3 = [(SBDashBoardHostedAppViewController *)self _deviceApplicationSceneHandle];
  if (self->_statusBarView) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (!v4)
  {
    id v26 = v3;
    char v5 = [(SBDashBoardHostedAppViewController *)self view];
    uint64_t v6 = [SBMainDisplaySceneLayoutStatusBarView alloc];
    [v5 bounds];
    int64_t v7 = -[SBMainDisplaySceneLayoutStatusBarView initWithFrame:](v6, "initWithFrame:");
    statusBarView = self->_statusBarView;
    self->_statusBarView = v7;

    int v9 = self->_statusBarView;
    uint64_t v10 = [MEMORY[0x1E4F428B8] redColor];
    uint64_t v11 = [v10 colorWithAlphaComponent:0.4];
    [(SBMainDisplaySceneLayoutStatusBarView *)v9 _setDebugBackgroundColor:v11];

    [(SBMainDisplaySceneLayoutStatusBarView *)self->_statusBarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBMainDisplaySceneLayoutStatusBarView *)self->_statusBarView setDataSource:self];
    int v12 = [(SBDeviceApplicationSceneStatusBarStateProxy *)[_SBDashBoardHostedAppStatusBarStateProxy alloc] initWithDeviceApplicationSceneHandle:v26];
    statusBarObserverProxy = self->_statusBarObserverProxy;
    self->_statusBarObserverProxy = v12;

    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self->_statusBarObserverProxy addStatusBarObserver:self->_statusBarView];
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self->_statusBarObserverProxy addStatusBarObserver:self];
    [(_SBDashBoardHostedAppStatusBarStateProxy *)self->_statusBarObserverProxy setHostedAppVCBackReference:self];
    [v5 addSubview:self->_statusBarView];
    char v14 = [(SBMainDisplaySceneLayoutStatusBarView *)self->_statusBarView leftAnchor];
    objc_super v15 = [v5 leftAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    BOOL v17 = [(SBMainDisplaySceneLayoutStatusBarView *)self->_statusBarView rightAnchor];
    v18 = [v5 rightAnchor];
    uint64_t v19 = [v17 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    int v20 = [(SBMainDisplaySceneLayoutStatusBarView *)self->_statusBarView topAnchor];
    long long v21 = [v5 topAnchor];
    __int16 v22 = [v20 constraintEqualToAnchor:v21];
    [v22 setActive:1];

    v23 = [(SBMainDisplaySceneLayoutStatusBarView *)self->_statusBarView bottomAnchor];
    __int16 v24 = [v5 bottomAnchor];
    id v25 = [v23 constraintEqualToAnchor:v24];
    [v25 setActive:1];

    uint64_t v3 = v26;
  }
}

- (void)_updateStatusBarContainerOrientation
{
  uint64_t v3 = [(SBDashBoardHostedAppViewController *)self view];
  BOOL v4 = [v3 window];
  char v5 = [v4 _roleHint];
  char v6 = SBTraitsArbiterOrientationActuationEnabledForRole(v5);

  if ((v6 & 1) == 0)
  {
    statusBarView = self->_statusBarView;
    int64_t v8 = [(SBDashBoardHostedAppViewController *)self containerInterfaceOrientation];
    [(SBMainDisplaySceneLayoutStatusBarView *)statusBarView setContainerOrientation:v8];
  }
}

- (void)_beginShowingStatusBarView
{
  [(SBMainDisplaySceneLayoutStatusBarView *)self->_statusBarView beginRequiringStatusBarForReason:@"SBDashBoardHostedApp"];
  [(SBMainDisplaySceneLayoutStatusBarView *)self->_statusBarView applyStatusBarStylesForDescriber:self->_statusBarObserverProxy];
  statusBarView = self->_statusBarView;
  int64_t v4 = [(SBDashBoardHostedAppViewController *)self containerInterfaceOrientation];
  [(SBMainDisplaySceneLayoutStatusBarView *)statusBarView setContainerOrientation:v4];
}

- (void)_endShowingStatusBarView
{
}

- (id)_appViewController
{
  return self->_appViewController;
}

- (id)statusBarDescribers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_statusBarObserverProxy;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)statusBarDescriberForStatusBarPart:(id)a3
{
  return self->_statusBarObserverProxy;
}

- (BOOL)allowsConfiguringIndividualStatusBarParts
{
  return 0;
}

- (int64_t)statusBarOrientation
{
  return [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self->_statusBarObserverProxy statusBarOrientation];
}

- (SBDashBoardHostedAppViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDashBoardHostedAppViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)overrideIdleWarnMode
{
  return self->_overrideIdleWarnMode;
}

- (SBApplicationSceneStatusBarDescribing)statusBarDescriber
{
  return (SBApplicationSceneStatusBarDescribing *)self->_statusBarObserverProxy;
}

- (void)setHostContextProvider:(id)a3
{
}

- (BOOL)intentToTransitionFromSecureAppToFull
{
  return self->_intentToTransitionFromSecureAppToFull;
}

- (void)setIntentToTransitionFromSecureAppToFull:(BOOL)a3
{
  self->_intentToTransitionFromSecureAppToFull = a3;
}

- (BOOL)interfaceOrientationLocked
{
  return self->_interfaceOrientationLocked;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_destroyWeak((id *)&self->_hostContextProvider);
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_statusBarObserverProxy, 0);
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_cachedBasicPublicDescription, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_authenticationAssertion, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_appViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithApplicationSceneEntity:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_25();
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

@end