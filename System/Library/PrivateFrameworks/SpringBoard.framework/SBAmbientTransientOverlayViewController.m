@interface SBAmbientTransientOverlayViewController
- (BOOL)_canAddPrimaryActivityItem;
- (BOOL)_canAddSecondaryActivityItem:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isFirstPresentation;
- (BOOL)_isPresentingOnboardingView;
- (BOOL)_isShowingFullActivityOverlay;
- (BOOL)_itemIsFirstPartyActivity:(id)a3;
- (BOOL)_shouldDisableIdleTimer;
- (BOOL)activityAmbientViewController:(id)a3 isActiveActivityItem:(id)a4;
- (BOOL)activityAmbientViewControllerCanBeginFullOverlayDismissGesture:(id)a3;
- (BOOL)allowsStackingOverlayContentAbove;
- (BOOL)ambientViewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4;
- (BOOL)ambientViewController:(id)a3 wantsBiometricAuthenticationBlockedForDeepUserInteraction:(BOOL)a4;
- (BOOL)ambientViewControllerIsAuthenticated:(id)a3;
- (BOOL)handleHomeButtonPress;
- (BOOL)isConfiguringUIVisible;
- (BOOL)isContentOpaque;
- (BOOL)isForegroundActive;
- (BOOL)prefersEmbeddedDisplayPresentation;
- (BOOL)prefersStatusBarHidden;
- (BOOL)preventsDismissalOnLockForInactiveScreen;
- (BOOL)preventsSystemApertureSuppressionFromBelow;
- (BOOL)shouldAutorotate;
- (NSDictionary)activeConfigurationMetadata;
- (PRSPosterConfiguration)activeConfiguration;
- (SBAmbientTransientOverlayViewController)init;
- (SBAmbientTransientOverlayViewControllerDelegate)delegate;
- (SBFIdleTimerBehaviorProviding)ambientIdleTimerBehaviorProvider;
- (id)_newBackgroundBlurMaterialViewWithInitialWeighting:(double)a3 parentView:(id)a4;
- (id)_newContentBlurMaterialViewWithInitialWeighting:(double)a3 parentView:(id)a4;
- (id)activityAmbientViewControllerNextPendingActivityItem:(id)a3;
- (id)ambientDefaultsForAmbientViewController:(id)a3;
- (id)ambientViewControllerRequestsConnectedChargerId:(id)a3;
- (id)associatedBundleIdentifiersToSuppressInSystemAperture;
- (id)associatedSceneIdentifiersToSuppressInSystemAperture;
- (id)audioCategoriesDisablingVolumeHUD;
- (id)defaultWidgetDescriptorStacksForAmbientViewController:(id)a3;
- (id)newTransientOverlayDismissalTransitionCoordinator;
- (id)newTransientOverlayPresentationTransitionCoordinator;
- (id)preferredDisplayLayoutElementIdentifier;
- (id)widgetHostManagerForAmbientViewController:(id)a3;
- (int64_t)homeAffordanceSuppression;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)preferredLockedGestureDismissalStyle;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredUnlockedGestureDismissalStyle;
- (unint64_t)notificationCount;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addActivityViewControllerWithPrimaryItem:(id)a3 withOverlayMode:(int64_t)a4 completion:(id)a5;
- (void)_addNewPrimaryActivityWithItem:(id)a3 forOngoingActivity:(BOOL)a4;
- (void)_addProudLockViewControllerIfNecessary;
- (void)_animateDismissalOfActivityView:(id)a3 withCompletion:(id)a4;
- (void)_animatePresentationOfActivityView:(id)a3;
- (void)_backlightLuminanceDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_clearContentBlurMaterialViewIfNecessary;
- (void)_configureActivityViewBlurMaterialWithInitialWeighting:(double)a3 parentView:(id)a4;
- (void)_configureBlurMaterialView:(id)a3 withParentView:(id)a4;
- (void)_configureTransitionAnimationBackgroundBlurMaterialViewWithInitialWeighting:(double)a3;
- (void)_configureTransitionAnimationContentBlurMaterialViewWithInitialWeighting:(double)a3;
- (void)_decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:(id)a3 withCompletion:(id)a4;
- (void)_decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary;
- (void)_dismissActivityViewController;
- (void)_incrementActivityPresentationAnimationCount;
- (void)_incrementTransitionAnimationCount;
- (void)_registerForFirstPresentationStateChange;
- (void)_removeActivityViewBlurMaterialView;
- (void)_removeBackgroundBlurMaterialView;
- (void)_removeContentBlurMaterialView;
- (void)_removeProudLockViewController;
- (void)_requestZStackParticipantPreferencesUpdate;
- (void)_setActivityViewHidden:(BOOL)a3;
- (void)_setProudLockAuthenticated:(BOOL)a3;
- (void)_setupAmbientDefaults;
- (void)activityAmbientViewController:(id)a3 addPendingItem:(id)a4;
- (void)activityAmbientViewController:(id)a3 removePendingItem:(id)a4;
- (void)addActivityItem:(id)a3 forOngoingActivity:(BOOL)a4;
- (void)ambientViewController:(id)a3 didSetBiometricAuthenticationDisabled:(BOOL)a4;
- (void)ambientViewController:(id)a3 didSetInlineAuthenticationViewVisible:(BOOL)a4;
- (void)ambientViewController:(id)a3 didUpdateActiveConfiguration:(id)a4 withMetadata:(id)a5;
- (void)ambientViewController:(id)a3 isTransitioningSettled:(BOOL)a4;
- (void)ambientViewController:(id)a3 requestsUnlock:(id)a4 withCompletion:(id)a5;
- (void)ambientViewControllerWillBeginConfiguration:(id)a3;
- (void)ambientViewControllerWillEndConfiguration:(id)a3;
- (void)attemptUnlockForSender:(id)a3 forBioUnlock:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)keybag:(id)a3 extendedStateDidChange:(id)a4;
- (void)loadView;
- (void)onboardingViewController:(id)a3 requestsDismissalWithUserIntent:(BOOL)a4;
- (void)presentAmbientActivityAlert:(id)a3;
- (void)removeActivityItem:(id)a3;
- (void)setAmbientIdleTimerBehaviorProvider:(id)a3;
- (void)setConfiguringUIVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsIdleTimerReset;
- (void)setNotificationCount:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBAmbientTransientOverlayViewController

- (SBAmbientTransientOverlayViewController)init
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SBAmbientTransientOverlayViewController;
  v2 = [(SBAmbientTransientOverlayViewController *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(SBActivityAmbientObserver);
    ambientActivityObserver = v2->_ambientActivityObserver;
    v2->_ambientActivityObserver = v3;

    uint64_t v5 = +[SBActivityManager sharedInstance];
    activityManager = v2->_activityManager;
    v2->_activityManager = (SBActivityManager *)v5;

    [(SBActivityAmbientObserver *)v2->_ambientActivityObserver setDelegate:v2];
    [(SBActivityManager *)v2->_activityManager addObserver:v2->_ambientActivityObserver];
    [(SBActivityManager *)v2->_activityManager setEnvironment:1];
    v7 = [MEMORY[0x1E4FA5F80] sharedInstance];
    [v7 addObserver:v2];
    [(SBTransientOverlayViewController *)v2 setPresentationAllowsHomeGrabberAutoHide:1];
    v8 = self;
    v13[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v10 = (id)[(SBAmbientTransientOverlayViewController *)v2 registerForTraitChanges:v9 withAction:sel__backlightLuminanceDidChange_previousTraitCollection_];

    [(SBAmbientTransientOverlayViewController *)v2 setOverrideUserInterfaceStyle:2];
  }
  return v2;
}

- (void)dealloc
{
  [(SBAmbientTransientOverlayViewController *)self invalidate];
  [(BSInvalidatable *)self->_lockElementBloomSuppressionAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBAmbientTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v3 dealloc];
}

- (void)setNotificationCount:(unint64_t)a3
{
}

- (unint64_t)notificationCount
{
  return [(AMUIAmbientViewController *)self->_ambientViewController notificationCount];
}

- (void)setAmbientIdleTimerBehaviorProvider:(id)a3
{
  objc_storeStrong((id *)&self->_ambientIdleTimerBehaviorProvider, a3);
  id v5 = [(SBTransientOverlayViewController *)self idleTimerCoordinator];
  id v4 = (id)[v5 idleTimerProvider:self didProposeBehavior:self forReason:@"SBAmbientTransientOverlayViewController"];
}

- (PRSPosterConfiguration)activeConfiguration
{
  return (PRSPosterConfiguration *)[(AMUIAmbientViewController *)self->_ambientViewController activeConfiguration];
}

- (NSDictionary)activeConfigurationMetadata
{
  return (NSDictionary *)[(AMUIAmbientViewController *)self->_ambientViewController activeConfigurationMetadata];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(SBAmbientTransientOverlayViewController *)self _setupAmbientDefaults];
    id v5 = obj;
  }
}

- (BOOL)isForegroundActive
{
  v2 = self;
  objc_super v3 = [(SBTransientOverlayViewController *)self transientOverlayDelegate];
  LOBYTE(v2) = [v3 transientOverlayViewControllerIsForegroundActive:v2];

  return (char)v2;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)SBAmbientTransientOverlayViewController;
  [(SBAmbientTransientOverlayViewController *)&v9 loadView];
  objc_super v3 = [(SBAmbientTransientOverlayViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  if (v5 < v7)
  {
    v8 = [(SBAmbientTransientOverlayViewController *)self view];
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, v7, v5);
  }
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)SBAmbientTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v23 viewDidLoad];
  objc_super v3 = [(SBTransientOverlayViewController *)self contentView];
  [v3 setAccessibilityIdentifier:@"sb-ambient-transient-overlay-view"];
  double v4 = (AMUIAmbientViewController *)objc_alloc_init(MEMORY[0x1E4F4A488]);
  ambientViewController = self->_ambientViewController;
  self->_ambientViewController = v4;

  [(AMUIAmbientViewController *)self->_ambientViewController setDelegate:self];
  double v6 = self->_ambientViewController;
  double v7 = objc_opt_new();
  [(AMUIAmbientViewController *)v6 setDateProvider:v7];

  v8 = self->_ambientViewController;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __54__SBAmbientTransientOverlayViewController_viewDidLoad__block_invoke;
  v21[3] = &unk_1E6AF53D0;
  v21[4] = self;
  id v9 = v3;
  id v22 = v9;
  [(SBAmbientTransientOverlayViewController *)self bs_addChildViewController:v8 withSuperview:v9 animated:0 transitionBlock:v21];
  if ([(SBAmbientTransientOverlayViewController *)self _isFirstPresentation])
  {
    id v10 = (AMUIOnboardingViewController *)objc_alloc_init(MEMORY[0x1E4F4A498]);
    onboardingViewController = self->_onboardingViewController;
    self->_onboardingViewController = v10;

    [(AMUIOnboardingViewController *)self->_onboardingViewController setDelegate:self];
    [(AMUIOnboardingViewController *)self->_onboardingViewController setAmbientDefaults:self->_ambientDefaults];
    objc_super v12 = self->_onboardingViewController;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __54__SBAmbientTransientOverlayViewController_viewDidLoad__block_invoke_2;
    v18 = &unk_1E6AF53D0;
    v19 = self;
    id v13 = v9;
    id v20 = v13;
    [(SBAmbientTransientOverlayViewController *)self bs_addChildViewController:v12 withSuperview:v13 animated:0 transitionBlock:&v15];
    v14 = [(AMUIOnboardingViewController *)self->_onboardingViewController view];
    [v13 bringSubviewToFront:v14];
  }
  [(SBActivityAmbientObserver *)self->_ambientActivityObserver addOverlaysForOngoingActivitiesIfNecessary];
}

void __54__SBAmbientTransientOverlayViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 1400);
  double v4 = a2;
  id v5 = [v3 view];
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v5, "setFrame:");
  [v5 setAutoresizingMask:18];
  v4[2](v4);
}

void __54__SBAmbientTransientOverlayViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 1496);
  double v4 = a2;
  id v5 = [v3 view];
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v5, "setFrame:");
  [v5 setAutoresizingMask:18];
  v4[2](v4);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)preventsSystemApertureSuppressionFromBelow
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBAmbientTransientOverlayViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  id v5 = [(SBAmbientTransientOverlayViewController *)self delegate];
  [v5 ambientTransientOverlayViewController:self viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidAppear:](&v6, sel_viewDidAppear_);
  id v5 = [(SBAmbientTransientOverlayViewController *)self delegate];
  [v5 ambientTransientOverlayViewController:self viewDidAppear:v3];

  if (([(AMUIAmbientViewController *)self->_ambientViewController bs_isAppearingOrAppeared] & 1) == 0) {
    [(AMUIAmbientViewController *)self->_ambientViewController bs_endAppearanceTransition:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBAmbientTransientOverlayViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  id v5 = [(SBAmbientTransientOverlayViewController *)self delegate];
  [v5 ambientTransientOverlayViewController:self viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  id v5 = [(SBAmbientTransientOverlayViewController *)self delegate];
  [v5 ambientTransientOverlayViewController:self viewDidDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)SBAmbientTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v14 viewDidLayoutSubviews];
  BOOL v3 = [(SBAmbientTransientOverlayViewController *)self view];
  [v3 bounds];
  long double v5 = v4;
  long double v7 = v6;

  UIRectGetCenter();
  double v9 = v8;
  double v11 = v10;
  double v12 = hypot(v5, v7);
  id v13 = [(SBTransientOverlayViewController *)self backgroundView];
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, v12, v12);
  objc_msgSend(v13, "setCenter:", v9, v11);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)SBAmbientTransientOverlayViewController;
  id v5 = a3;
  [(SBTransientOverlayViewController *)&v6 viewDidMoveToWindow:v5 shouldAppearOrDisappear:v4];
  objc_msgSend(v5, "setClipsToBounds:", 0, v6.receiver, v6.super_class);
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return 1;
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return 0;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return 0;
}

- (BOOL)isContentOpaque
{
  return 1;
}

- (BOOL)handleHomeButtonPress
{
  return 1;
}

- (BOOL)preventsDismissalOnLockForInactiveScreen
{
  return 1;
}

- (int64_t)homeAffordanceSuppression
{
  return 1;
}

- (id)audioCategoriesDisablingVolumeHUD
{
  return [(SBActivityAmbientViewController *)self->_activityViewController audioCategoriesDisablingVolumeHUD];
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  BOOL v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  BOOL v4 = [(SBTransientOverlayViewController *)self contentView];
  id v5 = [(SBTransientOverlayViewController *)self backgroundView];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v9[3] = &unk_1E6B0B3F8;
  id v10 = v4;
  id v11 = v5;
  double v12 = self;
  id v6 = v5;
  id v7 = v4;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v9];

  return v3;
}

void __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAnimated])
  {
    BOOL v4 = (void *)MEMORY[0x1E4F42FF0];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v36[3] = &unk_1E6AF4E00;
    id v37 = a1[4];
    id v5 = a1[5];
    id v6 = a1[6];
    id v38 = v5;
    id v39 = v6;
    [v4 performWithoutAnimation:v36];
    id v7 = (id *)a1[6];
    if (v7[187])
    {
      [v7[187] performPresentationAnimation];
      id v7 = (id *)a1[6];
    }
    [v7 _incrementTransitionAnimationCount];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v34[3] = &unk_1E6AF4AC0;
    id v35 = a1[6];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
    v33[3] = &unk_1E6AF5350;
    v33[4] = v35;
    [MEMORY[0x1E4F42FF0] _animateUsingSpringWithDuration:2 delay:v34 options:v33 mass:1.9 stiffness:0.0 damping:25.0 initialVelocity:600.0 animations:500.0 completion:0.0];
    [a1[6] _incrementTransitionAnimationCount];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5;
    v31[3] = &unk_1E6AF4AC0;
    id v32 = a1[6];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_6;
    v30[3] = &unk_1E6AF5350;
    v30[4] = v32;
    [MEMORY[0x1E4F42FF0] _animateUsingSpringWithDuration:2 delay:v31 options:v30 mass:1.0 stiffness:0.0 damping:5.0 initialVelocity:467.2 animations:104.72 completion:0.0];
    [a1[6] _incrementTransitionAnimationCount];
    double v8 = (void *)MEMORY[0x1E4F42FF0];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_7;
    v28[3] = &unk_1E6AF4AC0;
    id v29 = a1[4];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_8;
    v27[3] = &unk_1E6AF5350;
    v27[4] = a1[6];
    [v8 _animateUsingSpringWithDuration:2 delay:v28 options:v27 mass:1.5 stiffness:0.0 damping:2.0 initialVelocity:78.9568 animations:50.0 completion:0.0];
    [a1[6] _incrementTransitionAnimationCount];
    double v9 = (void *)MEMORY[0x1E4F42FF0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_9;
    v23[3] = &unk_1E6AF4E00;
    id v24 = a1[4];
    id v25 = a1[5];
    id v26 = v3;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_10;
    id v20 = &unk_1E6AF4A98;
    id v10 = v26;
    id v11 = a1[6];
    id v21 = v10;
    id v22 = v11;
    [v9 _animateUsingSpringWithDuration:2 delay:v23 options:&v17 mass:2.3 stiffness:0.0 damping:30.0 initialVelocity:500.0 animations:500.0 completion:0.0];
    double v12 = a1[6];
    id v13 = (void *)v12[185];
    if (v13)
    {
      objc_super v14 = objc_msgSend(v13, "view", v17, v18, v19, v20);
      [v12 _animatePresentationOfActivityView:v14];
    }
  }
  else
  {
    [a1[4] setAlpha:1.0];
    [a1[5] setAlpha:1.0];
    id v15 = a1[5];
    uint64_t v16 = [MEMORY[0x1E4F428B8] blackColor];
    [v15 setBackgroundColor:v16];

    [v3 performAlongsideTransitions];
    [v3 completeTransition:1];
  }
}

void __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v6, 1.3, 1.3);
  [v2 setTransform:&v6];
  id v3 = *(void **)(a1 + 40);
  BOOL v4 = [MEMORY[0x1E4F428B8] clearColor];
  [v3 setBackgroundColor:v4];

  [*(id *)(a1 + 48) _configureTransitionAnimationBackgroundBlurMaterialViewWithInitialWeighting:0.0];
  [*(id *)(a1 + 48) _configureTransitionAnimationContentBlurMaterialViewWithInitialWeighting:1.0];
  id v5 = [*(id *)(a1 + 32) layer];
  [v5 setAllowsGroupOpacity:1];

  *(unsigned char *)(*(void *)(a1 + 48) + 1472) = 1;
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1424) setWeighting:1.0];
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary];
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[179];
  int v3 = [v1 _isPresentingOnboardingView];
  double v4 = 0.3;
  if (!v3) {
    double v4 = 0.0;
  }
  return [v2 setWeighting:v4];
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary];
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_7(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary];
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  long long v2 = *(void **)(a1 + 40);
  int v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
  [v2 setBackgroundColor:v3];

  double v4 = *(void **)(a1 + 48);
  return [v4 performAlongsideTransitions];
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_10(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransition:1];
  long long v2 = *(void **)(a1 + 40);
  return [v2 _decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary];
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  int v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  double v4 = [(SBTransientOverlayViewController *)self contentView];
  id v5 = [(SBTransientOverlayViewController *)self backgroundView];
  [(AMUIAmbientViewController *)self->_ambientViewController setNotificationCount:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v9[3] = &unk_1E6B0B3F8;
  void v9[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v6 = v5;
  id v7 = v4;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v9];

  return v3;
}

void __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAnimated])
  {
    double v4 = (void *)MEMORY[0x1E4F42FF0];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
    v33[3] = &unk_1E6AF4E00;
    id v5 = a1[5];
    v33[4] = a1[4];
    id v34 = v5;
    id v35 = a1[6];
    [v4 performWithoutAnimation:v33];
    [a1[4] _incrementTransitionAnimationCount];
    id v6 = (void *)MEMORY[0x1E4F42FF0];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
    v31[3] = &unk_1E6AF4AC0;
    id v32 = a1[5];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4;
    v30[3] = &unk_1E6AF5350;
    v30[4] = a1[4];
    [v6 _animateUsingSpringWithDuration:2 delay:v31 options:v30 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
    [a1[4] _incrementTransitionAnimationCount];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5;
    v28[3] = &unk_1E6AF4AC0;
    id v29 = a1[4];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_6;
    v27[3] = &unk_1E6AF5350;
    v27[4] = v29;
    [MEMORY[0x1E4F42FF0] _animateUsingSpringWithDuration:2 delay:v28 options:v27 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
    [a1[4] _incrementTransitionAnimationCount];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_7;
    v25[3] = &unk_1E6AF4AC0;
    id v26 = a1[4];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_8;
    v24[3] = &unk_1E6AF5350;
    v24[4] = v26;
    [MEMORY[0x1E4F42FF0] _animateUsingSpringWithDuration:2 delay:v25 options:v24 mass:1.0 stiffness:0.0 damping:5.0 initialVelocity:467.2 animations:104.72 completion:0.0];
    [a1[4] _incrementTransitionAnimationCount];
    id v7 = (void *)MEMORY[0x1E4F42FF0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_9;
    v21[3] = &unk_1E6AF5290;
    id v22 = a1[5];
    id v23 = v3;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_10;
    v18[3] = &unk_1E6AF4A98;
    id v8 = v23;
    id v9 = a1[4];
    id v19 = v8;
    id v20 = v9;
    [v7 _animateUsingSpringWithDuration:2 delay:v21 options:v18 mass:1.5 stiffness:0.0 damping:2.0 initialVelocity:78.9568 animations:50.0 completion:0.0];
    id v10 = a1[4];
    id v11 = (void *)v10[185];
    if (v11)
    {
      double v12 = [v11 view];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_11;
      v17[3] = &unk_1E6AF4AC0;
      v17[4] = a1[4];
      [v10 _animateDismissalOfActivityView:v12 withCompletion:v17];

      id v10 = a1[4];
    }
    id v13 = (void *)v10[187];
    if (v13) {
      [v13 performDismissalAnimation];
    }
  }
  else
  {
    [a1[5] setAlpha:0.0];
    [a1[6] setAlpha:0.0];
    id v14 = a1[6];
    id v15 = [MEMORY[0x1E4F428B8] clearColor];
    [v14 setBackgroundColor:v15];

    [v3 performAlongsideTransitions];
    [v3 completeTransition:1];
    uint64_t v16 = a1[4];
    if (v16[185]) {
      [v16 _dismissActivityViewController];
    }
  }
}

void __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureTransitionAnimationBackgroundBlurMaterialViewWithInitialWeighting:1.0];
  [*(id *)(a1 + 32) _configureTransitionAnimationContentBlurMaterialViewWithInitialWeighting:0.0];
  long long v2 = [*(id *)(a1 + 40) layer];
  [v2 setAllowsGroupOpacity:1];

  id v3 = *(void **)(a1 + 48);
  id v4 = [MEMORY[0x1E4F428B8] clearColor];
  [v3 setBackgroundColor:v4];
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary];
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1432) setWeighting:1.0];
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary];
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_7(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1424) setWeighting:0.0];
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary];
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_9(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 1.3, 1.3);
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 40) performAlongsideTransitions];
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_10(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransition:1];
  long long v2 = *(void **)(a1 + 40);
  return [v2 _decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary];
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissActivityViewController];
}

- (id)associatedBundleIdentifiersToSuppressInSystemAperture
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  CGAffineTransform v4 = [(SBActivityAmbientViewController *)self->_activityViewController primaryActivityItem];
  id v5 = [v4 descriptor];
  id v6 = [v5 platterTargetBundleIdentifier];

  if (v6) {
    [v3 addObject:v6];
  }
  id v7 = [(SBActivityAmbientViewController *)self->_activityViewController secondaryActivityItem];
  id v8 = [v7 descriptor];
  id v9 = [v8 platterTargetBundleIdentifier];

  if (v9) {
    [v3 addObject:v9];
  }

  return v3;
}

- (id)associatedSceneIdentifiersToSuppressInSystemAperture
{
  id v3 = [MEMORY[0x1E4F1CAD0] set];
  CGAffineTransform v4 = [(SBActivityAmbientViewController *)self->_activityViewController primaryActivityItem];
  id v5 = [v4 descriptor];
  id v6 = [v5 platterTargetBundleIdentifier];

  id v7 = [(SBActivityAmbientViewController *)self->_activityViewController secondaryActivityItem];
  id v8 = [v7 descriptor];
  id v9 = [v8 platterTargetBundleIdentifier];

  if (([v6 isEqualToString:@"com.apple.InCallService"] & 1) != 0
    || [v9 isEqualToString:@"com.apple.InCallService"])
  {
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    id v11 = (void *)[@"SBAmbientFullScreenPresentationInCallSceneIdentifier" copy];
    uint64_t v12 = [v10 setWithObject:v11];

    id v3 = (void *)v12;
  }

  return v3;
}

- (id)preferredDisplayLayoutElementIdentifier
{
  return (id)*MEMORY[0x1E4FA6F80];
}

- (void)setNeedsIdleTimerReset
{
  v4.receiver = self;
  v4.super_class = (Class)SBAmbientTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v4 setNeedsIdleTimerReset];
  id v3 = [(SBAmbientTransientOverlayViewController *)self delegate];
  objc_msgSend(v3, "ambientTransientOverlayViewController:didUpdatedWantsIdleTimerDisabled:", self, -[SBAmbientTransientOverlayViewController wantsIdleTimerDisabled](self, "wantsIdleTimerDisabled"));
}

- (int64_t)idleTimerMode
{
  if ([(SBAmbientTransientOverlayViewController *)self _shouldDisableIdleTimer]) {
    return 3;
  }
  ambientIdleTimerBehaviorProvider = self->_ambientIdleTimerBehaviorProvider;
  return [(SBFIdleTimerBehaviorProviding *)ambientIdleTimerBehaviorProvider idleTimerMode];
}

- (int64_t)idleTimerDuration
{
  if ([(SBAmbientTransientOverlayViewController *)self _shouldDisableIdleTimer]) {
    return 14;
  }
  ambientIdleTimerBehaviorProvider = self->_ambientIdleTimerBehaviorProvider;
  return [(SBFIdleTimerBehaviorProviding *)ambientIdleTimerBehaviorProvider idleTimerDuration];
}

- (int64_t)idleWarnMode
{
  if ([(SBAmbientTransientOverlayViewController *)self _shouldDisableIdleTimer]) {
    return 1;
  }
  ambientIdleTimerBehaviorProvider = self->_ambientIdleTimerBehaviorProvider;
  return [(SBFIdleTimerBehaviorProviding *)ambientIdleTimerBehaviorProvider idleWarnMode];
}

- (void)addActivityItem:(id)a3 forOngoingActivity:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(SBAmbientTransientOverlayViewController *)self _canAddPrimaryActivityItem])
  {
    [(SBAmbientTransientOverlayViewController *)self _addNewPrimaryActivityWithItem:v6 forOngoingActivity:v4];
  }
  else if ([(SBAmbientTransientOverlayViewController *)self _canAddSecondaryActivityItem:v6])
  {
    [(SBActivityAmbientViewController *)self->_activityViewController addOverlayForSecondaryActivityItem:v6];
  }
  else
  {
    [(SBActivityAmbientObserver *)self->_ambientActivityObserver addPendingItem:v6];
  }
  [(SBAmbientTransientOverlayViewController *)self _requestZStackParticipantPreferencesUpdate];
}

- (void)removeActivityItem:(id)a3
{
  activityViewController = self->_activityViewController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SBAmbientTransientOverlayViewController_removeActivityItem___block_invoke;
  v5[3] = &unk_1E6AF4AC0;
  v5[4] = self;
  [(SBActivityAmbientViewController *)activityViewController removeOverlayForActivityItem:a3 withCompletion:v5];
  [(SBAmbientTransientOverlayViewController *)self _requestZStackParticipantPreferencesUpdate];
}

void __62__SBAmbientTransientOverlayViewController_removeActivityItem___block_invoke(uint64_t a1)
{
  long long v2 = [*(id *)(*(void *)(a1 + 32) + 1480) primaryActivityItem];
  if (v2
    || ([*(id *)(*(void *)(a1 + 32) + 1480) secondaryActivityItem],
        (long long v2 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([*(id *)(*(void *)(a1 + 32) + 1408) nextPendingItem],
        (long long v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else if (([*(id *)(*(void *)(a1 + 32) + 1480) isTransitioning] & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 _dismissActivityViewController];
  }
}

- (void)presentAmbientActivityAlert:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __71__SBAmbientTransientOverlayViewController_presentAmbientActivityAlert___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canPresentInEnvironment:1 alertType:3])
  {
    long long v2 = [*(id *)(a1 + 32) item];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__SBAmbientTransientOverlayViewController_presentAmbientActivityAlert___block_invoke_2;
    v5[3] = &unk_1E6AF4AC0;
    id v6 = *(id *)(a1 + 32);
    id v3 = (void *)MEMORY[0x1D948C7A0](v5);
    id v4 = *(id **)(a1 + 40);
    if (v4[185]) {
      [v4[185] alertActivityItem:v2 withAlertBlock:v3];
    }
    else {
      [v4 _addActivityViewControllerWithPrimaryItem:v2 withOverlayMode:0 completion:v3];
    }
  }
}

void __71__SBAmbientTransientOverlayViewController_presentAmbientActivityAlert___block_invoke_2(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) options];
  id v4 = [v2 presentationOptions];

  if (v4) {
    uint64_t v3 = [v4 interrupting];
  }
  else {
    uint64_t v3 = 0;
  }
  [*(id *)(a1 + 32) alertWithScreenOn:1 playSound:v3];
}

- (void)activityAmbientViewController:(id)a3 addPendingItem:(id)a4
{
}

- (void)activityAmbientViewController:(id)a3 removePendingItem:(id)a4
{
}

- (id)activityAmbientViewControllerNextPendingActivityItem:(id)a3
{
  return [(SBActivityAmbientObserver *)self->_ambientActivityObserver nextPendingItem];
}

- (BOOL)activityAmbientViewControllerCanBeginFullOverlayDismissGesture:(id)a3
{
  uint64_t v3 = self;
  id v4 = [(SBTransientOverlayViewController *)self transientOverlayDelegate];
  LOBYTE(v3) = [v4 transientOverlayViewControllerIsForegroundActive:v3];

  return (char)v3;
}

- (BOOL)activityAmbientViewController:(id)a3 isActiveActivityItem:(id)a4
{
  return [(SBActivityAmbientObserver *)self->_ambientActivityObserver isActiveActivityItem:a4];
}

- (void)keybag:(id)a3 extendedStateDidChange:(id)a4
{
}

uint64_t __73__SBAmbientTransientOverlayViewController_keybag_extendedStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1400) setAuthenticated:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)_canAddPrimaryActivityItem
{
  long long v2 = [(SBActivityAmbientViewController *)self->_activityViewController primaryActivityItem];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)_canAddSecondaryActivityItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SBActivityAmbientViewController *)self->_activityViewController secondaryActivityItem];
  int64_t v6 = [(SBActivityAmbientViewController *)self->_activityViewController overlayMode];
  if (v5)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v8 = v6 == 0;
    id v9 = [v4 descriptor];
    id v10 = [v9 platterTargetBundleIdentifier];

    id v11 = [(SBActivityAmbientViewController *)self->_activityViewController primaryActivityItem];
    uint64_t v12 = [v11 descriptor];
    id v13 = [v12 platterTargetBundleIdentifier];
    char v14 = [v13 isEqualToString:v10];

    BOOL v7 = v8 & ~v14;
  }

  return v7;
}

- (void)_addNewPrimaryActivityWithItem:(id)a3 forOngoingActivity:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(SBAmbientTransientOverlayViewController *)self _addActivityViewControllerWithPrimaryItem:v6 withOverlayMode:[(SBAmbientTransientOverlayViewController *)self _itemIsFirstPartyActivity:v6] ^ 1 | v4 completion:0];
}

- (void)_addActivityViewControllerWithPrimaryItem:(id)a3 withOverlayMode:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  activityViewController = self->_activityViewController;
  if (activityViewController)
  {
    [(SBActivityAmbientViewController *)activityViewController addOverlayForPrimaryActivityItem:v8 withOverlayMode:a4];
    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    id v11 = [[SBActivityAmbientViewController alloc] initWithPrimaryActivityItem:v8 overlayMode:a4];
    [(SBActivityAmbientViewController *)v11 setDelegate:self];
    objc_storeStrong((id *)&self->_activityViewController, v11);
    if ([(SBAmbientTransientOverlayViewController *)self isConfiguringUIVisible])
    {
      uint64_t v12 = [(SBActivityAmbientViewController *)v11 view];
      [v12 setAlpha:0.0];
    }
    id v13 = [(SBTransientOverlayViewController *)self contentView];
    char v14 = self->_activityViewController;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __112__SBAmbientTransientOverlayViewController__addActivityViewControllerWithPrimaryItem_withOverlayMode_completion___block_invoke;
    v16[3] = &unk_1E6AF53D0;
    v16[4] = self;
    id v17 = v13;
    id v15 = v13;
    [(SBAmbientTransientOverlayViewController *)self bs_addChildViewController:v14 withSuperview:v15 animated:1 transitionBlock:v16];
  }
}

void __112__SBAmbientTransientOverlayViewController__addActivityViewControllerWithPrimaryItem_withOverlayMode_completion___block_invoke(uint64_t a1, void *a2)
{
  BOOL v4 = a2;
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 1480) view];
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v3, "setFrame:");
  [v3 setAutoresizingMask:18];
  [*(id *)(a1 + 40) bringSubviewToFront:v3];
  if (v4) {
    v4[2]();
  }
}

- (BOOL)_itemIsFirstPartyActivity:(id)a3
{
  BOOL v3 = [a3 descriptor];
  BOOL v4 = [v3 platterTargetBundleIdentifier];

  id v5 = +[SBActivityManager sharedInstance];
  id v6 = [v5 firstPartyActivityGroupingIdentifiers];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (BOOL)ambientViewControllerIsAuthenticated:(id)a3
{
  BOOL v3 = objc_msgSend((id)SBApp, "authenticationController", a3);
  char v4 = [v3 isAuthenticated];

  return v4;
}

- (void)ambientViewController:(id)a3 isTransitioningSettled:(BOOL)a4
{
  if (self->_isPerformingPresentationAnimation && !a4)
  {
    id v5 = [(SBTransientOverlayViewController *)self backgroundView];
    char v4 = [MEMORY[0x1E4F428B8] blackColor];
    [v5 setBackgroundColor:v4];
  }
}

- (id)ambientViewControllerRequestsConnectedChargerId:(id)a3
{
  char v4 = [(SBAmbientTransientOverlayViewController *)self delegate];
  id v5 = [v4 ambientTransientOverlayViewControllerRequestsConnectedChargerId:self];

  return v5;
}

- (void)ambientViewController:(id)a3 requestsUnlock:(id)a4 withCompletion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v11 = objc_alloc_init(SBLockScreenUnlockRequest);
  [(SBLockScreenUnlockRequest *)v11 setSource:13];
  [(SBLockScreenUnlockRequest *)v11 setIntent:2];
  id v8 = [v7 name];
  [(SBLockScreenUnlockRequest *)v11 setName:v8];

  [(SBLockScreenUnlockRequest *)v11 setWantsBiometricPresentation:1];
  [(SBLockScreenUnlockRequest *)v11 setConfirmedNotInPocket:1];
  id v9 = [v7 unlockDestination];

  [(SBLockScreenUnlockRequest *)v11 setUnlockDestination:v9];
  id v10 = +[SBLockScreenManager sharedInstance];
  [v10 unlockWithRequest:v11 completion:v6];
}

- (void)ambientViewControllerWillBeginConfiguration:(id)a3
{
  [(SBAmbientTransientOverlayViewController *)self setConfiguringUIVisible:1];
  [(SBAmbientTransientOverlayViewController *)self setNeedsIdleTimerReset];
  [(SBAmbientTransientOverlayViewController *)self _setActivityViewHidden:1];
  id v4 = [(SBAmbientTransientOverlayViewController *)self delegate];
  [v4 ambientTransientOverlayViewControllerWillBeginConfiguration:self];
}

- (void)ambientViewControllerWillEndConfiguration:(id)a3
{
  [(SBAmbientTransientOverlayViewController *)self setConfiguringUIVisible:0];
  [(SBAmbientTransientOverlayViewController *)self setNeedsIdleTimerReset];
  [(SBAmbientTransientOverlayViewController *)self _setActivityViewHidden:0];
  id v4 = [(SBAmbientTransientOverlayViewController *)self delegate];
  [v4 ambientTransientOverlayViewControllerWillEndConfiguration:self];
}

- (id)widgetHostManagerForAmbientViewController:(id)a3
{
  id v4 = [(SBAmbientTransientOverlayViewController *)self delegate];
  id v5 = [v4 widgetHostManagerForAmbientTransientOverlayViewController:self];

  return v5;
}

- (id)ambientDefaultsForAmbientViewController:(id)a3
{
  id v4 = [(SBAmbientTransientOverlayViewController *)self delegate];
  id v5 = [v4 ambientDefaultsForAmbientTransientOverlayViewController:self];

  return v5;
}

- (id)defaultWidgetDescriptorStacksForAmbientViewController:(id)a3
{
  id v4 = [(SBAmbientTransientOverlayViewController *)self delegate];
  id v5 = [v4 defaultWidgetDescriptorStacksForAmbientTransientOverlayViewController:self];

  return v5;
}

- (void)ambientViewController:(id)a3 didSetInlineAuthenticationViewVisible:(BOOL)a4
{
  BOOL v4 = a4;
  [(SBAmbientTransientOverlayViewController *)self _setActivityViewHidden:a4];
  id v6 = [(SBAmbientTransientOverlayViewController *)self delegate];
  [v6 ambientTransientOverlayViewController:self didSetInlineAuthenticationViewVisible:v4];
}

- (BOOL)ambientViewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4
{
  id v4 = a4;
  id v5 = +[SBIconController sharedInstance];
  char v6 = [v5 isIconVisibleForBundleIdentifier:v4];

  return v6;
}

- (void)ambientViewController:(id)a3 didSetBiometricAuthenticationDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  lockElementBloomSuppressionAssertion = self->_lockElementBloomSuppressionAssertion;
  if (v4)
  {
    if (lockElementBloomSuppressionAssertion) {
      goto LABEL_6;
    }
    id v11 = v6;
    id v8 = +[SBLockScreenManager sharedInstance];
    id v9 = [v8 acquireSystemApertureLockElementBloomSuppressionAssertionWithReason:@"Domino inline biometric auth disabled"];
    id v10 = self->_lockElementBloomSuppressionAssertion;
    self->_lockElementBloomSuppressionAssertion = v9;
  }
  else
  {
    id v11 = v6;
    [(BSInvalidatable *)lockElementBloomSuppressionAssertion invalidate];
    id v8 = self->_lockElementBloomSuppressionAssertion;
    self->_lockElementBloomSuppressionAssertion = 0;
  }

  id v6 = v11;
LABEL_6:
}

- (BOOL)ambientViewController:(id)a3 wantsBiometricAuthenticationBlockedForDeepUserInteraction:(BOOL)a4
{
  if (a4) {
    return 0;
  }
  id v5 = +[SBLockScreenManager sharedInstance];
  uint64_t v6 = [v5 biometricAuthenticationCoordinator];
  char v7 = [(id)v6 isAutoUnlockingDisabled];

  id v8 = [MEMORY[0x1E4FA7C68] sharedInstance];
  LOBYTE(v6) = [v8 hasPearlSupport];

  return v7 & v6;
}

- (void)attemptUnlockForSender:(id)a3 forBioUnlock:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (a4)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [v7 passcode];
  }
  id v10 = +[SBLockScreenManager sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __90__SBAmbientTransientOverlayViewController_attemptUnlockForSender_forBioUnlock_completion___block_invoke;
  v13[3] = &unk_1E6AFA340;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [v10 attemptUnlockWithPasscode:v9 finishUIUnlock:0 completion:v13];
}

uint64_t __90__SBAmbientTransientOverlayViewController_attemptUnlockForSender_forBioUnlock_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  if (a3) {
    [v4 resetForSuccess];
  }
  else {
    [v4 resetForFailedPasscode];
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

- (void)ambientViewController:(id)a3 didUpdateActiveConfiguration:(id)a4 withMetadata:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SBAmbientTransientOverlayViewController *)self delegate];
  [v9 ambientTransientOverlayViewController:self didUpdateActiveConfiguration:v8 withMetadata:v7];
}

- (void)onboardingViewController:(id)a3 requestsDismissalWithUserIntent:(BOOL)a4
{
  if (self->_onboardingViewController)
  {
    -[SBAmbientTransientOverlayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", a3, a4);
    onboardingViewController = self->_onboardingViewController;
    self->_onboardingViewController = 0;
  }
}

- (void)invalidate
{
  BOOL v3 = +[SBActivityManager sharedInstance];
  [v3 removeObserver:self->_ambientActivityObserver];

  [(SBActivityManager *)self->_activityManager setEnvironment:0];
  defaultObserver = self->_defaultObserver;
  if (defaultObserver)
  {
    [(BSDefaultObserver *)defaultObserver invalidate];
    id v5 = self->_defaultObserver;
    self->_defaultObserver = 0;
  }
  activityViewController = self->_activityViewController;
  if (activityViewController)
  {
    [(SBActivityAmbientViewController *)activityViewController invalidate];
    id v7 = self->_activityViewController;
    self->_activityViewController = 0;
  }
  ambientDefaults = self->_ambientDefaults;
  self->_ambientDefaults = 0;

  ambientActivityObserver = self->_ambientActivityObserver;
  self->_ambientActivityObserver = 0;

  activityManager = self->_activityManager;
  self->_activityManager = 0;
}

- (void)_dismissActivityViewController
{
  if (self->_activityViewController)
  {
    -[SBAmbientTransientOverlayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    [(SBActivityAmbientViewController *)self->_activityViewController invalidate];
    activityViewController = self->_activityViewController;
    self->_activityViewController = 0;
  }
}

- (BOOL)_isShowingFullActivityOverlay
{
  BOOL v3 = [(SBActivityAmbientViewController *)self->_activityViewController primaryActivityItem];
  if (v3) {
    BOOL v4 = [(SBActivityAmbientViewController *)self->_activityViewController overlayMode] == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_backlightLuminanceDidChange:(id)a3 previousTraitCollection:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SBLogAmbientPresentation();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSNumber;
    id v10 = [v6 traitCollection];
    id v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "_backlightLuminance"));
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "_backlightLuminance"));
    *(_DWORD *)buf = 138412546;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Backlight trait changed. New luminance: %@ old: %@", buf, 0x16u);
  }
  id v13 = [v6 traitCollection];
  uint64_t v14 = [v13 _backlightLuminance];

  if (v14)
  {
    if (![v7 _backlightLuminance])
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __96__SBAmbientTransientOverlayViewController__backlightLuminanceDidChange_previousTraitCollection___block_invoke_2;
      v16[3] = &unk_1E6AF4AC0;
      v16[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v16];
      id v15 = +[SBIdleTimerGlobalCoordinator sharedInstanceIfExists];
      [v15 resetIdleTimerForReason:@"Ambient Screen On"];
    }
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __96__SBAmbientTransientOverlayViewController__backlightLuminanceDidChange_previousTraitCollection___block_invoke;
    v17[3] = &unk_1E6AF5350;
    v17[4] = self;
    [MEMORY[0x1E4F4F898] addAlongsideAnimations:0 completion:v17];
  }
}

uint64_t __96__SBAmbientTransientOverlayViewController__backlightLuminanceDidChange_previousTraitCollection___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return objc_msgSend(*(id *)(*(void *)(result + 32) + 1400), "bs_endAppearanceTransition:", 0);
  }
  return result;
}

uint64_t __96__SBAmbientTransientOverlayViewController__backlightLuminanceDidChange_previousTraitCollection___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1400) _appearState];
  if (result != 1)
  {
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1400);
    return objc_msgSend(v3, "bs_endAppearanceTransition:", 1);
  }
  return result;
}

- (void)_requestZStackParticipantPreferencesUpdate
{
  id v3 = [(SBTransientOverlayViewController *)self transientOverlayDelegate];
  [v3 transientOverlayViewController:self requestZStackParticipantPreferencesUpdateWithReason:@"Ambient Activities Updated"];
}

- (BOOL)_shouldDisableIdleTimer
{
  if ([(SBAmbientTransientOverlayViewController *)self isConfiguringUIVisible]) {
    return 1;
  }
  activityViewController = self->_activityViewController;
  return [(SBActivityAmbientViewController *)activityViewController wantsIdleTimerDisabled];
}

- (BOOL)_isPresentingOnboardingView
{
  return self->_onboardingViewController != 0;
}

- (BOOL)_isFirstPresentation
{
  return [(AMAmbientDefaults *)self->_ambientDefaults isFirstPresentation];
}

- (void)_registerForFirstPresentationStateChange
{
  if ([(SBAmbientTransientOverlayViewController *)self _isFirstPresentation])
  {
    objc_initWeak(&location, self);
    ambientDefaults = self->_ambientDefaults;
    BOOL v4 = [NSString stringWithUTF8String:"firstPresentation"];
    uint64_t v5 = MEMORY[0x1E4F14428];
    id v6 = MEMORY[0x1E4F14428];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__SBAmbientTransientOverlayViewController__registerForFirstPresentationStateChange__block_invoke;
    v9[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v10, &location);
    id v7 = [(AMAmbientDefaults *)ambientDefaults observeDefault:v4 onQueue:v5 withBlock:v9];
    defaultObserver = self->_defaultObserver;
    self->_defaultObserver = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __83__SBAmbientTransientOverlayViewController__registerForFirstPresentationStateChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    char v3 = [WeakRetained _isFirstPresentation];
    long long v2 = v4;
    if ((v3 & 1) == 0)
    {
      [v4 _clearContentBlurMaterialViewIfNecessary];
      long long v2 = v4;
    }
  }
}

- (void)_clearContentBlurMaterialViewIfNecessary
{
  if (self->_contentBlurMaterialView)
  {
    [(SBAmbientTransientOverlayViewController *)self _incrementTransitionAnimationCount];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __83__SBAmbientTransientOverlayViewController__clearContentBlurMaterialViewIfNecessary__block_invoke;
    _OWORD v4[3] = &unk_1E6AF4AC0;
    v4[4] = self;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __83__SBAmbientTransientOverlayViewController__clearContentBlurMaterialViewIfNecessary__block_invoke_2;
    v3[3] = &unk_1E6AF5350;
    v3[4] = self;
    [MEMORY[0x1E4F42FF0] _animateUsingSpringWithDuration:2 delay:v4 options:v3 mass:1.5 stiffness:0.0 damping:3.0 initialVelocity:200.0 animations:45.0 completion:0.0];
  }
}

uint64_t __83__SBAmbientTransientOverlayViewController__clearContentBlurMaterialViewIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1432) setWeighting:0.0];
}

uint64_t __83__SBAmbientTransientOverlayViewController__clearContentBlurMaterialViewIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary];
}

- (void)_setActivityViewHidden:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__SBAmbientTransientOverlayViewController__setActivityViewHidden___block_invoke;
  v3[3] = &unk_1E6AF5D38;
  BOOL v4 = a3;
  v3[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:0.2];
}

void __66__SBAmbientTransientOverlayViewController__setActivityViewHidden___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1480) view];
  [v2 setAlpha:v1];
}

- (void)_setupAmbientDefaults
{
  char v3 = [(SBAmbientTransientOverlayViewController *)self delegate];
  BOOL v4 = [v3 ambientDefaultsForAmbientTransientOverlayViewController:self];
  ambientDefaults = self->_ambientDefaults;
  self->_ambientDefaults = v4;

  [(SBAmbientTransientOverlayViewController *)self _registerForFirstPresentationStateChange];
}

- (void)_addProudLockViewControllerIfNecessary
{
  if (!self->_proudLockViewController)
  {
    [(SBActivityAmbientViewController *)self->_activityViewController setCompactOverlayHidden:1];
    char v3 = objc_alloc_init(SBAmbientProudLockViewController);
    proudLockViewController = self->_proudLockViewController;
    self->_proudLockViewController = v3;

    uint64_t v5 = self->_proudLockViewController;
    id v6 = [(SBTransientOverlayViewController *)self contentView];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__SBAmbientTransientOverlayViewController__addProudLockViewControllerIfNecessary__block_invoke;
    v7[3] = &unk_1E6AF6698;
    v7[4] = self;
    [(SBAmbientTransientOverlayViewController *)self bs_addChildViewController:v5 withSuperview:v6 animated:0 transitionBlock:v7];
  }
}

void __81__SBAmbientTransientOverlayViewController__addProudLockViewControllerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(*(void *)(a1 + 32) + 1512);
  BOOL v4 = a2;
  uint64_t v5 = [v3 view];
  id v6 = [*(id *)(a1 + 32) contentView];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");

  id v7 = [*(id *)(a1 + 32) view];
  [v7 layoutIfNeeded];

  dispatch_time_t v8 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SBAmbientTransientOverlayViewController__addProudLockViewControllerIfNecessary__block_invoke_2;
  block[3] = &unk_1E6AF4AC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
  v4[2](v4);
}

uint64_t __81__SBAmbientTransientOverlayViewController__addProudLockViewControllerIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FA5F80] sharedInstance];
  char v3 = [v2 state];
  int v4 = [v3 isEffectivelyLocked];

  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    return [v5 _setProudLockAuthenticated:0];
  }
  else
  {
    return [v5 _removeProudLockViewController];
  }
}

- (void)_setProudLockAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  proudLockViewController = self->_proudLockViewController;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__SBAmbientTransientOverlayViewController__setProudLockAuthenticated___block_invoke;
  v6[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v7, &location);
  [(SBAmbientProudLockViewController *)proudLockViewController setAuthenticated:v3 completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __70__SBAmbientTransientOverlayViewController__setProudLockAuthenticated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeProudLockViewController];
}

- (void)_removeProudLockViewController
{
  if (self->_proudLockViewController)
  {
    -[SBAmbientTransientOverlayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    proudLockViewController = self->_proudLockViewController;
    self->_proudLockViewController = 0;

    activityViewController = self->_activityViewController;
    [(SBActivityAmbientViewController *)activityViewController setCompactOverlayHidden:0];
  }
}

- (id)_newContentBlurMaterialViewWithInitialWeighting:(double)a3 parentView:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F743C8];
  id v7 = (void *)MEMORY[0x1E4F28B50];
  id v8 = a4;
  id v9 = [v7 bundleForClass:objc_opt_class()];
  id v10 = [v6 materialViewWithRecipeNamed:@"ambientContentOverlay" inBundle:v9 options:0 initialWeighting:0 scaleAdjustment:a3];

  objc_msgSend(v10, "setZoomEnabled:", -[SBAmbientTransientOverlayViewController _isPresentingOnboardingView](self, "_isPresentingOnboardingView"));
  [(SBAmbientTransientOverlayViewController *)self _configureBlurMaterialView:v10 withParentView:v8];

  return v10;
}

- (id)_newBackgroundBlurMaterialViewWithInitialWeighting:(double)a3 parentView:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F743C8];
  id v7 = a4;
  id v8 = SBHBundle();
  id v9 = [v6 materialViewWithRecipeNamed:@"homeScreenOverlay" inBundle:v8 options:0 initialWeighting:&__block_literal_global_348 scaleAdjustment:a3];

  [(SBAmbientTransientOverlayViewController *)self _configureBlurMaterialView:v9 withParentView:v7];
  return v9;
}

double __105__SBAmbientTransientOverlayViewController__newBackgroundBlurMaterialViewWithInitialWeighting_parentView___block_invoke()
{
  return 1.0;
}

- (void)_configureBlurMaterialView:(id)a3 withParentView:(id)a4
{
  id v5 = a4;
  id v14 = a3;
  [v5 addSubview:v14];
  [v5 bringSubviewToFront:v14];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
  [v14 setAutoresizingMask:18];
}

- (void)_configureTransitionAnimationBackgroundBlurMaterialViewWithInitialWeighting:(double)a3
{
  if (!self->_backgroundBlurMaterialView)
  {
    id v7 = [(SBTransientOverlayViewController *)self backgroundView];
    id v5 = [(SBAmbientTransientOverlayViewController *)self _newBackgroundBlurMaterialViewWithInitialWeighting:v7 parentView:a3];
    backgroundBlurMaterialView = self->_backgroundBlurMaterialView;
    self->_backgroundBlurMaterialView = v5;
  }
}

- (void)_removeBackgroundBlurMaterialView
{
  backgroundBlurMaterialView = self->_backgroundBlurMaterialView;
  if (backgroundBlurMaterialView)
  {
    [(MTMaterialView *)backgroundBlurMaterialView removeFromSuperview];
    int v4 = self->_backgroundBlurMaterialView;
    self->_backgroundBlurMaterialView = 0;
  }
}

- (void)_configureTransitionAnimationContentBlurMaterialViewWithInitialWeighting:(double)a3
{
  if (!self->_contentBlurMaterialView)
  {
    id v5 = [(SBTransientOverlayViewController *)self contentView];
    double v6 = [(SBAmbientTransientOverlayViewController *)self _newContentBlurMaterialViewWithInitialWeighting:v5 parentView:a3];
    contentBlurMaterialView = self->_contentBlurMaterialView;
    self->_contentBlurMaterialView = v6;

    if (self->_onboardingViewController)
    {
      id v9 = [(SBTransientOverlayViewController *)self contentView];
      double v8 = [(AMUIOnboardingViewController *)self->_onboardingViewController view];
      [v9 bringSubviewToFront:v8];
    }
  }
}

- (void)_removeContentBlurMaterialView
{
  contentBlurMaterialView = self->_contentBlurMaterialView;
  if (contentBlurMaterialView)
  {
    [(MTMaterialView *)contentBlurMaterialView removeFromSuperview];
    int v4 = self->_contentBlurMaterialView;
    self->_contentBlurMaterialView = 0;
  }
}

- (void)_incrementTransitionAnimationCount
{
}

- (void)_decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary
{
  unint64_t transitionAnimationCount = self->_transitionAnimationCount;
  if (transitionAnimationCount)
  {
    unint64_t v4 = transitionAnimationCount - 1;
    self->_unint64_t transitionAnimationCount = v4;
    if (!v4)
    {
      [(SBAmbientTransientOverlayViewController *)self _removeBackgroundBlurMaterialView];
      if (![(SBAmbientTransientOverlayViewController *)self _isPresentingOnboardingView]) {
        [(SBAmbientTransientOverlayViewController *)self _removeContentBlurMaterialView];
      }
      id v6 = [(SBTransientOverlayViewController *)self contentView];
      id v5 = [v6 layer];
      [v5 setAllowsGroupOpacity:0];
    }
  }
}

- (void)_configureActivityViewBlurMaterialWithInitialWeighting:(double)a3 parentView:(id)a4
{
  if (!self->_activityBlurMaterialView)
  {
    id v5 = [(SBAmbientTransientOverlayViewController *)self _newContentBlurMaterialViewWithInitialWeighting:a4 parentView:a3];
    activityBlurMaterialView = self->_activityBlurMaterialView;
    self->_activityBlurMaterialView = v5;
  }
}

- (void)_removeActivityViewBlurMaterialView
{
  activityBlurMaterialView = self->_activityBlurMaterialView;
  if (activityBlurMaterialView)
  {
    [(MTMaterialView *)activityBlurMaterialView removeFromSuperview];
    unint64_t v4 = self->_activityBlurMaterialView;
    self->_activityBlurMaterialView = 0;
  }
}

- (void)_animatePresentationOfActivityView:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F42FF0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke;
  v24[3] = &unk_1E6AF5290;
  id v6 = v4;
  id v25 = v6;
  id v26 = self;
  [v5 performWithoutAnimation:v24];
  [(SBAmbientTransientOverlayViewController *)self _incrementActivityPresentationAnimationCount];
  id v7 = (void *)MEMORY[0x1E4F42FF0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_2;
  v23[3] = &unk_1E6AF4AC0;
  void v23[4] = self;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_3;
  v21[3] = &unk_1E6AF4A98;
  void v21[4] = self;
  id v8 = v6;
  id v22 = v8;
  [v7 _animateUsingSpringWithDuration:2 delay:v23 options:v21 mass:1.0 stiffness:0.0 damping:5.0 initialVelocity:467.2 animations:104.72 completion:0.0];
  [(SBAmbientTransientOverlayViewController *)self _incrementActivityPresentationAnimationCount];
  id v9 = (void *)MEMORY[0x1E4F42FF0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_4;
  v19[3] = &unk_1E6AF4AC0;
  id v20 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_5;
  v17[3] = &unk_1E6AF4A98;
  v17[4] = self;
  id v10 = v20;
  id v18 = v10;
  [v9 _animateUsingSpringWithDuration:2 delay:v19 options:v17 mass:1.5 stiffness:0.0 damping:2.0 initialVelocity:78.9568 animations:50.0 completion:0.0];
  [(SBAmbientTransientOverlayViewController *)self _incrementActivityPresentationAnimationCount];
  double v11 = (void *)MEMORY[0x1E4F42FF0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_6;
  v15[3] = &unk_1E6AF4AC0;
  id v16 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_7;
  v13[3] = &unk_1E6AF4A98;
  void v13[4] = self;
  id v14 = v16;
  id v12 = v16;
  [v11 _animateUsingSpringWithDuration:2 delay:v15 options:v13 mass:2.3 stiffness:0.0 damping:30.0 initialVelocity:500.0 animations:500.0 completion:0.0];
}

void __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 1.3, 1.3);
  [v2 setTransform:&v4];
  [*(id *)(a1 + 40) _configureActivityViewBlurMaterialWithInitialWeighting:*(void *)(a1 + 32) parentView:1.0];
  BOOL v3 = [*(id *)(a1 + 32) layer];
  [v3 setAllowsGroupOpacity:1];
}

uint64_t __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1440) setWeighting:0.0];
}

uint64_t __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:*(void *)(a1 + 40) withCompletion:0];
}

uint64_t __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_4(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:*(void *)(a1 + 40) withCompletion:0];
}

uint64_t __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:*(void *)(a1 + 40) withCompletion:0];
}

- (void)_animateDismissalOfActivityView:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F42FF0];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke;
  v33[3] = &unk_1E6AF5290;
  id v9 = v6;
  id v34 = v9;
  id v35 = self;
  [v8 performWithoutAnimation:v33];
  [(SBAmbientTransientOverlayViewController *)self _incrementActivityPresentationAnimationCount];
  id v10 = (void *)MEMORY[0x1E4F42FF0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_2;
  v31[3] = &unk_1E6AF4AC0;
  id v32 = v9;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_3;
  v28[3] = &unk_1E6AFA2A0;
  void v28[4] = self;
  id v11 = v32;
  id v29 = v11;
  id v12 = v7;
  id v30 = v12;
  [v10 _animateUsingSpringWithDuration:2 delay:v31 options:v28 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
  [(SBAmbientTransientOverlayViewController *)self _incrementActivityPresentationAnimationCount];
  double v13 = (void *)MEMORY[0x1E4F42FF0];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_4;
  v27[3] = &unk_1E6AF4AC0;
  v27[4] = self;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_5;
  v24[3] = &unk_1E6AFA2A0;
  void v24[4] = self;
  id v14 = v11;
  id v25 = v14;
  id v15 = v12;
  id v26 = v15;
  [v13 _animateUsingSpringWithDuration:2 delay:v27 options:v24 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
  [(SBAmbientTransientOverlayViewController *)self _incrementActivityPresentationAnimationCount];
  id v16 = (void *)MEMORY[0x1E4F42FF0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_6;
  v22[3] = &unk_1E6AF4AC0;
  id v23 = v14;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_7;
  v19[3] = &unk_1E6AFA2A0;
  void v19[4] = self;
  id v20 = v23;
  id v21 = v15;
  id v17 = v15;
  id v18 = v23;
  [v16 _animateUsingSpringWithDuration:2 delay:v22 options:v19 mass:1.5 stiffness:0.0 damping:2.0 initialVelocity:78.9568 animations:50.0 completion:0.0];
}

void __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 40) _configureActivityViewBlurMaterialWithInitialWeighting:*(void *)(a1 + 32) parentView:0.0];
  id v2 = [*(id *)(a1 + 32) layer];
  [v2 setAllowsGroupOpacity:1];
}

uint64_t __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

uint64_t __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1440) setWeighting:1.0];
}

uint64_t __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

uint64_t __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_6(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 1.3, 1.3);
  return [v1 setTransform:&v3];
}

uint64_t __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (void)_incrementActivityPresentationAnimationCount
{
}

- (void)_decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(void))a4;
  unint64_t activityPresentationAnimationCount = self->_activityPresentationAnimationCount;
  if (activityPresentationAnimationCount)
  {
    unint64_t v8 = activityPresentationAnimationCount - 1;
    self->_unint64_t activityPresentationAnimationCount = v8;
    if (!v8)
    {
      [(SBAmbientTransientOverlayViewController *)self _removeActivityViewBlurMaterialView];
      id v9 = [v10 layer];
      [v9 setAllowsGroupOpacity:0];

      if (v6) {
        v6[2](v6);
      }
    }
  }
}

- (SBFIdleTimerBehaviorProviding)ambientIdleTimerBehaviorProvider
{
  return self->_ambientIdleTimerBehaviorProvider;
}

- (SBAmbientTransientOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAmbientTransientOverlayViewControllerDelegate *)WeakRetained;
}

- (BOOL)isConfiguringUIVisible
{
  return self->_configuringUIVisible;
}

- (void)setConfiguringUIVisible:(BOOL)a3
{
  self->_configuringUIVisible = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ambientIdleTimerBehaviorProvider, 0);
  objc_storeStrong((id *)&self->_lockElementBloomSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_proudLockViewController, 0);
  objc_storeStrong((id *)&self->_defaultObserver, 0);
  objc_storeStrong((id *)&self->_onboardingViewController, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_activityBlurMaterialView, 0);
  objc_storeStrong((id *)&self->_contentBlurMaterialView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurMaterialView, 0);
  objc_storeStrong((id *)&self->_ambientSettings, 0);
  objc_storeStrong((id *)&self->_ambientActivityObserver, 0);
  objc_storeStrong((id *)&self->_ambientViewController, 0);
}

@end