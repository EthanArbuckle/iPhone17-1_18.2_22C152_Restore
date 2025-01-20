@interface SBInCallTransientOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsStackingOverlayContentAbove;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)isContentOpaque;
- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3;
- (BOOL)prefersContinuityDisplayPresentation;
- (BOOL)prefersEmbeddedDisplayPresentation;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)preventsSystemApertureSuppressionFromBelow;
- (BOOL)shouldAlwaysPreventHomeGestureDismissal;
- (BOOL)shouldDisableBanners;
- (BOOL)shouldIgnoreHomeIndicatorAutoHiddenClientSettings;
- (BOOL)shouldUseSceneBasedKeyboardFocus;
- (BOOL)supportsAlwaysOnDisplay;
- (SBDeviceApplicationSceneHandle)sceneHandle;
- (SBInCallTransientOverlayViewController)initWithSceneHandle:(id)a3 shouldPreferContinuityDisplay:(BOOL)a4;
- (SBInCallTransientOverlayViewControllerDelegate)delegate;
- (id)_inCallSceneClientSettingsDiffInspector;
- (id)associatedBundleIdentifiersToSuppressInSystemAperture;
- (id)associatedSceneIdentifiersToSuppressInSystemAperture;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)hostedSceneIdentityTokens;
- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5;
- (id)keyboardFocusTarget;
- (id)newTransientOverlayDismissalTransitionCoordinator;
- (id)newTransientOverlayPresentationTransitionCoordinator;
- (id)preferredBackgroundActivitiesToSuppress;
- (id)preferredDisplayLayoutElementIdentifier;
- (id)sceneDeactivationPredicate;
- (id)succinctDescriptionBuilder;
- (int)serviceProcessIdentifier;
- (int64_t)preferredLockedGestureDismissalStyle;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredUnlockedGestureDismissalStyle;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_registerForAmbientPresentationTraitChange;
- (void)dealloc;
- (void)handleGestureDismissal;
- (void)invalidate;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIdleTimerCoordinator:(id)a3;
- (void)setShouldAlwaysPreventHomeGestureDismissal:(BOOL)a3;
- (void)setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBInCallTransientOverlayViewController

- (SBInCallTransientOverlayViewController)initWithSceneHandle:(id)a3 shouldPreferContinuityDisplay:(BOOL)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBInCallTransientOverlayViewController;
  v8 = [(SBTransientOverlayViewController *)&v18 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    p_sceneHandle = (id *)&v8->_sceneHandle;
    objc_storeStrong((id *)&v8->_sceneHandle, a3);
    v9->_preferContinuityDisplay = a4;
    [*p_sceneHandle addObserver:v9];
    v11 = [*p_sceneHandle statusBarStateProvider];
    [v11 addStatusBarObserver:v9];

    uint64_t v12 = +[SBInCallDomain rootSettings];
    settings = v9->_settings;
    v9->_settings = (SBInCallSettings *)v12;

    v14 = [[SBIdleTimerCoordinatorHelper alloc] initWithSourceProvider:v9];
    idleTimerCoordinatorHelper = v9->_idleTimerCoordinatorHelper;
    v9->_idleTimerCoordinatorHelper = v14;

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v9 selector:sel_setNeedsGestureDismissalStyleUpdate name:*MEMORY[0x1E4FADDC8] object:0];
  }
  return v9;
}

- (void)dealloc
{
  if ([(SBInCallTransientOverlayViewController *)self isViewLoaded]) {
    [(SBInCallTransientOverlayViewController *)self bs_removeChildViewController:self->_sceneViewController];
  }
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FADDC8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBInCallTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v4 dealloc];
}

- (id)hostedSceneIdentityTokens
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  v3 = v2;
  if (v2)
  {
    objc_super v4 = [v2 identityToken];
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canResignFirstResponder
{
  return 1;
}

- (int)serviceProcessIdentifier
{
  v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  v3 = [v2 clientProcess];
  int v4 = [v3 pid];

  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle statusBarStateProvider];
  int64_t v3 = _SBStatusBarLegacyStyleFromStyle([v2 statusBarStyle]);

  return v3;
}

- (BOOL)prefersStatusBarHidden
{
  v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle statusBarStateProvider];
  if ([v2 statusBarHidden])
  {
    char v3 = 1;
  }
  else
  {
    [v2 statusBarAlpha];
    char v3 = BSFloatLessThanOrEqualToFloat();
  }

  return v3;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return [(SBDeviceApplicationSceneHandle *)self->_sceneHandle whitePointAdaptivityStyle];
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v3 = objc_opt_class();
  int v4 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  v5 = [v4 clientSettings];
  v6 = SBSafeCast(v3, v5);

  if (v6)
  {
    unint64_t v7 = [v6 supportedInterfaceOrientations];
    if (!v7)
    {
      v8 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v9 = [v8 userInterfaceIdiom];

      if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        unint64_t v7 = 30;
      }
      else {
        unint64_t v7 = 1 << [v6 interfaceOrientation];
      }
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBInCallTransientOverlayViewController;
    unint64_t v7 = [(SBTransientOverlayViewController *)&v11 supportedInterfaceOrientations];
  }

  return v7;
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)SBInCallTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v16 viewDidLayoutSubviews];
  uint64_t v3 = [(SBTransientOverlayViewController *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  int64_t v13 = [(SBTransientOverlayViewController *)self containerOrientation];
  -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_sceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v13, v13, v9, v11);
  v14 = [(SBTransientOverlayViewController *)self backgroundView];
  existingSceneBackgroundView = self->_existingSceneBackgroundView;
  [v14 bounds];
  -[SBApplicationSceneBackgroundView setFrame:](existingSceneBackgroundView, "setFrame:");
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)SBInCallTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v20 viewDidLoad];
  uint64_t v3 = [(SBTransientOverlayViewController *)self contentView];
  double v4 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle newSceneViewController];
  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = v4;

  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController setRendersWhileLocked:1];
  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController setHomeGrabberDisplayMode:1];
  [(SBInCallTransientOverlayViewController *)self addChildViewController:self->_sceneViewController];
  [v3 bounds];
  double v7 = v6;
  double v9 = v8;
  int64_t v10 = [(SBTransientOverlayViewController *)self containerOrientation];
  -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_sceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v10, v10, v7, v9);
  double v11 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController view];
  [v3 addSubview:v11];

  uint64_t v12 = [(SBTransientOverlayViewController *)self backgroundView];
  int64_t v13 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController backgroundView];
  existingSceneBackgroundView = self->_existingSceneBackgroundView;
  self->_existingSceneBackgroundView = v13;

  v15 = [_SBInCallProxySceneBackgroundView alloc];
  [(SBApplicationSceneBackgroundView *)self->_existingSceneBackgroundView frame];
  objc_super v16 = -[_SBInCallProxySceneBackgroundView initWithFrame:proxyTarget:](v15, "initWithFrame:proxyTarget:", self->_existingSceneBackgroundView);
  proxySceneBackgroundView = self->_proxySceneBackgroundView;
  self->_proxySceneBackgroundView = v16;

  objc_super v18 = self->_proxySceneBackgroundView;
  v19 = [MEMORY[0x1E4F428B8] clearColor];
  [(_SBInCallProxySceneBackgroundView *)v18 setBackgroundColor:v19];

  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController setBackgroundView:self->_proxySceneBackgroundView];
  [v12 addSubview:self->_existingSceneBackgroundView];
  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController didMoveToParentViewController:self];
  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController setDisplayMode:4 animationFactory:0 completion:0];
  [(SBInCallTransientOverlayViewController *)self _registerForAmbientPresentationTraitChange];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBInCallTransientOverlayViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained inCallTransientOverlayViewController:self willAppearAnimated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidAppear:](&v8, sel_viewDidAppear_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained inCallTransientOverlayViewController:self didAppearAnimated:v3];

  objc_super v6 = [(SBInCallTransientOverlayViewController *)self view];
  double v7 = [MEMORY[0x1E4F428B8] colorWithWhite:0.025 alpha:1.0];
  [v6 setBackgroundColor:v7];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBInCallTransientOverlayViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained inCallTransientOverlayViewController:self willDisappearAnimated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained inCallTransientOverlayViewController:self didDisappearAnimated:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBInCallTransientOverlayViewController;
  id v7 = a4;
  -[SBTransientOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__SBInCallTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6AF53F8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __93__SBInCallTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = [MEMORY[0x1E4F42FF0] _currentAnimationSettings];
  [v4 inCallTransientOverlayViewController:v2 viewWillTransitionSizeWithAnimationSettings:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return 1;
}

- (id)sceneDeactivationPredicate
{
  uint64_t v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIdentifier];
  BOOL v3 = v2;
  if (v2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__SBInCallTransientOverlayViewController_sceneDeactivationPredicate__block_invoke;
    v6[3] = &unk_1E6AF9A10;
    id v7 = v2;
    id v4 = (void *)MEMORY[0x1D948C7A0](v6);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __68__SBInCallTransientOverlayViewController_sceneDeactivationPredicate__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

- (void)handleGestureDismissal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained inCallTransientOverlayViewControllerRequestsDismissal:self];
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  if ([(SBInCallTransientOverlayViewController *)self prefersHomeIndicatorAutoHidden]) {
    return 0;
  }
  else {
    return 2;
  }
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  if ([(SBInCallTransientOverlayViewController *)self prefersHomeIndicatorAutoHidden]) {
    return 0;
  }
  else {
    return 2;
  }
}

- (void)setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:(BOOL)a3
{
  if (self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings != a3)
  {
    self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings = a3;
    [(SBTransientOverlayViewController *)self setNeedsGestureDismissalStyleUpdate];
  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4FADA90] sharedInstance];
  [v3 currentCalls];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "isEmergency", (void)v13))
        {

          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (self->_shouldAlwaysPreventHomeGestureDismissal)
  {
    char v9 = 1;
  }
  else
  {
LABEL_12:
    if (self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings)
    {
      char v9 = 0;
    }
    else
    {
      int64_t v10 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
      double v11 = [v10 clientSettings];
      char v9 = [v11 transientOverlayHomeIndicatorAutoHidden];
    }
  }

  return v9;
}

- (BOOL)handleHomeButtonPress
{
  int64_t v3 = [(SBInCallTransientOverlayViewController *)self preferredLockedGestureDismissalStyle];
  id WeakRetained = SBLogInCallPresentation();
  BOOL v5 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D85BA000, WeakRetained, OS_LOG_TYPE_DEFAULT, "SBInCallTransientOverlayViewController is consuming home button press to dismiss overlay", v7, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained inCallTransientOverlayViewControllerRequestsDismissal:self];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, WeakRetained, OS_LOG_TYPE_DEFAULT, "SBInCallTransientOverlayViewController is consuming home button press to prevent dismissal", buf, 2u);
  }

  return 1;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  if (([(SBDeviceApplicationSceneHandle *)self->_sceneHandle preferredHardwareButtonEventTypes] & 2) != 0)
  {
    sceneHandle = self->_sceneHandle;
    return [(SBDeviceApplicationSceneHandle *)sceneHandle handleHardwareButtonEventType:1];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBInCallTransientOverlayViewController;
    return [(SBTransientOverlayViewController *)&v5 handleVolumeUpButtonPress];
  }
}

- (BOOL)handleVolumeDownButtonPress
{
  if (([(SBDeviceApplicationSceneHandle *)self->_sceneHandle preferredHardwareButtonEventTypes] & 4) != 0)
  {
    sceneHandle = self->_sceneHandle;
    return [(SBDeviceApplicationSceneHandle *)sceneHandle handleHardwareButtonEventType:2];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBInCallTransientOverlayViewController;
    return [(SBTransientOverlayViewController *)&v5 handleVolumeDownButtonPress];
  }
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle preferredHardwareButtonEventTypes];
  if (!v3)
  {
    if ((v5 & 8) != 0)
    {
      sceneHandle = self->_sceneHandle;
      uint64_t v7 = 3;
      goto LABEL_7;
    }
LABEL_5:
    v9.receiver = self;
    v9.super_class = (Class)SBInCallTransientOverlayViewController;
    return [(SBTransientOverlayViewController *)&v9 handleHeadsetButtonPress:v3];
  }
  if ((v5 & 0x10) == 0) {
    goto LABEL_5;
  }
  sceneHandle = self->_sceneHandle;
  uint64_t v7 = 4;
LABEL_7:
  return [(SBDeviceApplicationSceneHandle *)sceneHandle handleHardwareButtonEventType:v7];
}

- (BOOL)isContentOpaque
{
  return 1;
}

- (BOOL)preventsSystemApertureSuppressionFromBelow
{
  return 1;
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  BOOL v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 isAnimated];
  char v5 = [*(id *)(*(void *)(a1 + 32) + 1432) view];
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 1440) transientOverlayFadeOutSettings];
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    [v7 dampingRatio];
    [v7 response];
    convertDampingRatioAndResponseToTensionAndFriction();
    objc_super v8 = (void *)MEMORY[0x1E4F4F898];
    objc_super v9 = [MEMORY[0x1E4F4F840] settingsWithMass:1.0 stiffness:0.0 damping:0.0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
    v19[3] = &unk_1E6AF4AC0;
    id v10 = v3;
    id v20 = v10;
    [v8 animateWithSettings:v9 actions:v19];

    double v11 = (void *)MEMORY[0x1E4F42FF0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
    v16[3] = &unk_1E6AF5290;
    id v12 = v6;
    uint64_t v13 = *(void *)(a1 + 32);
    id v17 = v12;
    uint64_t v18 = v13;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4;
    v14[3] = &unk_1E6AFA1B8;
    id v15 = v10;
    objc_msgSend(v11, "sb_animateWithSettings:mode:animations:completion:", v7, 3, v16, v14);
  }
  else
  {
    [v5 setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 1400) setAlpha:0.0];
    [v3 performAlongsideTransitions];
    [v3 completeTransition:1];
  }
}

uint64_t __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAlongsideTransitions];
}

uint64_t __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 1400);
  return [v2 setAlpha:0.0];
}

uint64_t __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  id v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) loadViewIfNeeded];
  int v4 = [v3 isAnimated];
  char v5 = [*(id *)(*(void *)(a1 + 32) + 1432) view];
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F42FF0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v26[3] = &unk_1E6AF5290;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 32);
    id v27 = v8;
    uint64_t v28 = v9;
    [v7 _performWithoutRetargetingAnimations:v26];
    id v10 = [*(id *)(*(void *)(a1 + 32) + 1440) transientOverlayFadeInSettings];
    double v11 = (void *)MEMORY[0x1E4F42FF0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v23[3] = &unk_1E6AF5290;
    id v12 = v8;
    uint64_t v13 = *(void *)(a1 + 32);
    id v24 = v12;
    uint64_t v25 = v13;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
    v21[3] = &unk_1E6AFA1B8;
    id v14 = v3;
    id v22 = v14;
    objc_msgSend(v11, "sb_animateWithSettings:mode:animations:completion:", v10, 3, v23, v21);
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    [v10 dampingRatio];
    [v10 response];
    convertDampingRatioAndResponseToTensionAndFriction();
    id v15 = (void *)MEMORY[0x1E4F4F898];
    long long v16 = [MEMORY[0x1E4F4F840] settingsWithMass:1.0 stiffness:0.0 damping:0.0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5;
    v17[3] = &unk_1E6AF4AC0;
    id v18 = v14;
    [v15 animateWithSettings:v16 actions:v17];
  }
  else
  {
    [v5 setAlpha:1.0];
    [*(id *)(*(void *)(a1 + 32) + 1400) setAlpha:1.0];
    [v3 performAlongsideTransitions];
    [v3 completeTransition:1];
  }
}

uint64_t __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 1400);
  return [v2 setAlpha:0.0];
}

uint64_t __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 1400);
  return [v2 setAlpha:1.0];
}

uint64_t __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

uint64_t __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAlongsideTransitions];
}

- (id)preferredDisplayLayoutElementIdentifier
{
  uint64_t v2 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)preferredBackgroundActivitiesToSuppress
{
  uint64_t v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle statusBarStateProvider];
  id v3 = [v2 backgroundActivitiesToSuppress];

  return v3;
}

- (void)setContainerOrientation:(int64_t)a3
{
  int64_t v5 = [(SBTransientOverlayViewController *)self containerOrientation];
  v10.receiver = self;
  v10.super_class = (Class)SBInCallTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v10 setContainerOrientation:a3];
  if (v5 != [(SBTransientOverlayViewController *)self containerOrientation])
  {
    sceneViewController = self->_sceneViewController;
    uint64_t v7 = [(SBTransientOverlayViewController *)self contentView];
    [v7 bounds];
    -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](sceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a3, a3, v8, v9);
  }
}

- (void)setIdleTimerCoordinator:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBInCallTransientOverlayViewController;
  id v4 = a3;
  [(SBTransientOverlayViewController *)&v5 setIdleTimerCoordinator:v4];
  -[SBIdleTimerCoordinatorHelper setTargetCoordinator:](self->_idleTimerCoordinatorHelper, "setTargetCoordinator:", v4, v5.receiver, v5.super_class);
}

- (BOOL)shouldUseSceneBasedKeyboardFocus
{
  return 1;
}

- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3
{
  sceneHandle = self->_sceneHandle;
  id v4 = a3;
  objc_super v5 = [(SBDeviceApplicationSceneHandle *)sceneHandle sceneIfExists];
  uint64_t v6 = [v5 identityToken];
  uint64_t v7 = [v6 stringRepresentation];
  char v8 = [v7 isEqualToString:v4];

  return v8;
}

- (id)keyboardFocusTarget
{
  uint64_t v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  id v3 = +[SBKeyboardFocusTarget targetForFBScene:v2];

  return v3;
}

- (BOOL)shouldDisableBanners
{
  uint64_t v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v2) = [WeakRetained inCallTransientOverlayViewControllerShouldPreventBannerPresentations:v2];

  return (char)v2;
}

- (BOOL)supportsAlwaysOnDisplay
{
  uint64_t v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v2) = [WeakRetained inCallTransientOverlayViewControllerShouldSupportAlwaysOnDisplay:v2];

  return (char)v2;
}

- (id)associatedBundleIdentifiersToSuppressInSystemAperture
{
  uint64_t v2 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
  id v3 = [v2 bundleIdentifier];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)associatedSceneIdentifiersToSuppressInSystemAperture
{
  uint64_t v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIdentifier];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (BOOL)prefersContinuityDisplayPresentation
{
  return self->_preferContinuityDisplay;
}

- (id)succinctDescriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)SBInCallTransientOverlayViewController;
  id v3 = [(SBTransientOverlayViewController *)&v6 succinctDescriptionBuilder];
  id v4 = (id)[v3 appendObject:self->_sceneViewController withName:@"sceneViewController" skipIfNil:1];
  return v3;
}

- (void)invalidate
{
  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController invalidate];
  [(_SBInCallProxySceneBackgroundView *)self->_proxySceneBackgroundView setProxyTarget:0];
  [(SBSUIInCallSceneClientSettingsDiffInspector *)self->_inCallSceneClientSettingsDiffInspector removeAllObservers];
  id v3 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle statusBarStateProvider];
  [v3 removeStatusBarObserver:self];

  sceneHandle = self->_sceneHandle;
  [(SBDeviceApplicationSceneHandle *)sceneHandle removeObserver:self];
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  return [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper proposeIdleTimerBehavior:a4 fromProvider:a3 reason:a5];
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  objc_super v6 = [v5 clientSettings];
  uint64_t v7 = SBSafeCast(v4, v6);

  if ([v7 idleTimerDisabled])
  {
    char v8 = +[SBIdleTimerBehavior disabledBehavior];
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    objc_super v10 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
    double v11 = [v10 settings];
    id v12 = SBSafeCast(v9, v11);

    if ([v7 prefersLockedIdleDurationOnCoversheet])
    {
      if ([v12 isBeingShownAboveCoverSheet]) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = 12;
      }
    }
    else
    {
      uint64_t v13 = 12;
    }
    char v8 = +[SBIdleTimerBehavior behaviorWithDuration:v13 mode:1 warnMode:2];
  }
  return v8;
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v6 = a4;
  id v7 = [(SBInCallTransientOverlayViewController *)self _inCallSceneClientSettingsDiffInspector];
  [v7 inspectDiff:v6 withContext:0];
}

- (id)_inCallSceneClientSettingsDiffInspector
{
  inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
  if (!inCallSceneClientSettingsDiffInspector)
  {
    uint64_t v4 = (SBSUIInCallSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4FA7B98]);
    objc_super v5 = self->_inCallSceneClientSettingsDiffInspector;
    self->_inCallSceneClientSettingsDiffInspector = v4;

    objc_initWeak(&location, self);
    id v6 = self->_inCallSceneClientSettingsDiffInspector;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__SBInCallTransientOverlayViewController__inCallSceneClientSettingsDiffInspector__block_invoke;
    v11[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v12, &location);
    [(SBSUIInCallSceneClientSettingsDiffInspector *)v6 observeTransientOverlayHomeIndicatorAutoHiddenWithBlock:v11];
    id v7 = self->_inCallSceneClientSettingsDiffInspector;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__SBInCallTransientOverlayViewController__inCallSceneClientSettingsDiffInspector__block_invoke_2;
    v9[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v10, &location);
    [(SBSUIInCallSceneClientSettingsDiffInspector *)v7 observePrefersLockedIdleDurationOnCoversheet:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
  }
  return inCallSceneClientSettingsDiffInspector;
}

void __81__SBInCallTransientOverlayViewController__inCallSceneClientSettingsDiffInspector__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsGestureDismissalStyleUpdate];
}

void __81__SBInCallTransientOverlayViewController__inCallSceneClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsIdleTimerReset];
}

- (void)_registerForAmbientPresentationTraitChange
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(SBInCallTransientOverlayViewController *)self delegate];
  objc_initWeak(&location, v3);

  id v4 = objc_loadWeakRetained(&location);
  objc_super v5 = [(SBInCallTransientOverlayViewController *)self traitCollection];
  uint64_t v6 = [v5 isAmbientPresented];
  id v7 = [(SBInCallTransientOverlayViewController *)self traitCollection];
  objc_msgSend(v4, "inCallTransientOverlayViewControllerDidUpdateAmbientPresentationIsAmbientPresented:ambientDisplayStyle:", v6, objc_msgSend(v7, "ambientDisplayStyle"));

  char v8 = self;
  v15[0] = v8;
  uint64_t v9 = self;
  v15[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__SBInCallTransientOverlayViewController__registerForAmbientPresentationTraitChange__block_invoke;
  v12[3] = &unk_1E6B00AB8;
  objc_copyWeak(&v13, &location);
  id v11 = (id)[(SBInCallTransientOverlayViewController *)self registerForTraitChanges:v10 withHandler:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __84__SBInCallTransientOverlayViewController__registerForAmbientPresentationTraitChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 traitCollection];
  uint64_t v7 = [v6 isAmbientPresented];

  LODWORD(v6) = [v11 isAmbientPresented];
  char v8 = [v5 traitCollection];

  uint64_t v9 = [v8 ambientDisplayStyle];
  if (v7 != v6 || v9 != [v11 ambientDisplayStyle])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained inCallTransientOverlayViewControllerDidUpdateAmbientPresentationIsAmbientPresented:v7 ambientDisplayStyle:v9];
  }
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (SBInCallTransientOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBInCallTransientOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldIgnoreHomeIndicatorAutoHiddenClientSettings
{
  return self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings;
}

- (BOOL)shouldAlwaysPreventHomeGestureDismissal
{
  return self->_shouldAlwaysPreventHomeGestureDismissal;
}

- (void)setShouldAlwaysPreventHomeGestureDismissal:(BOOL)a3
{
  self->_shouldAlwaysPreventHomeGestureDismissal = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_proxySceneBackgroundView, 0);
  objc_storeStrong((id *)&self->_inCallSceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_existingSceneBackgroundView, 0);
}

@end