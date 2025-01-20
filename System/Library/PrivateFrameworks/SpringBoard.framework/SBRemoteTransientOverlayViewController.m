@interface SBRemoteTransientOverlayViewController
+ (id)identifiersForActiveDisplayLayoutElements;
+ (void)requestViewControllersForAlertDefinition:(id)a3 sceneWorkspaceController:(id)a4 connectionHandler:(id)a5;
- (BOOL)_canShowWhileLocked;
- (BOOL)_needsWallpaperEffectView;
- (BOOL)allowsStackingOverlayContentAbove;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)handleDoubleHeightStatusBarTap;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)hasServiceProcessIdentifier:(int)a3;
- (BOOL)hidEventDeferringDisabled;
- (BOOL)isActivatingForSiri;
- (BOOL)isContentOpaque;
- (BOOL)isPresentedByBundleIdentifier:(id)a3;
- (BOOL)isPresentedByProcess:(id)a3;
- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3;
- (BOOL)isScreenshotMarkup;
- (BOOL)isSwitcherEligible;
- (BOOL)prefersStatusBarActivityItemVisible;
- (BOOL)resignFirstResponder;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutorotate;
- (BOOL)shouldDisableBanners;
- (BOOL)shouldDisableControlCenter;
- (BOOL)shouldDisableInteractiveScreenshotGesture;
- (BOOL)shouldDisableOrientationUpdates;
- (BOOL)shouldDisableReachability;
- (BOOL)shouldDisableSiri;
- (BOOL)shouldInvalidateWhenDeactivated;
- (BOOL)shouldPendAlertItems;
- (BOOL)shouldUseSceneBasedKeyboardFocus;
- (SBRemoteTransientOverlayViewController)pairedRemoteTransientOverlay;
- (SBRemoteTransientOverlayViewControllerDelegate)delegate;
- (id)_hostContentViewController;
- (id)_initWithHostContentAdapter:(id)a3;
- (id)associatedBundleIdentifiersToSuppressInSystemAperture;
- (id)associatedSceneIdentifiersToSuppressInSystemAperture;
- (id)clientSceneIdentityToken;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)hostedSceneIdentityTokens;
- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5;
- (id)keyboardFocusTarget;
- (id)newTransientOverlayDismissalTransitionCoordinator;
- (id)newTransientOverlayPresentationTransitionCoordinator;
- (id)preferredBackgroundActivitiesToSuppress;
- (id)preferredDisplayLayoutElementIdentifier;
- (id)preferredSceneDeactivationReasonValue;
- (id)remoteTransientOverlayHostContentAdapter:(id)a3 requestsActionForHandlingButtonEvents:(unint64_t)a4;
- (id)representedDisplayItem;
- (id)sceneForClientSettings;
- (id)serviceBundleIdentifier;
- (id)succinctDescriptionBuilder;
- (int)_preferredStatusBarVisibility;
- (int)pictureInPictureProcessIdentifier;
- (int)serviceProcessIdentifier;
- (int64_t)defaultPreferredInterfaceOrientationForPresentationForRemoteTransientOverlayHostContentAdapter:(id)a3;
- (int64_t)preferredDismissalAnimationStyle;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredLockedGestureDismissalStyle;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredUnlockedGestureDismissalStyle;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (int64_t)wallpaperVariant;
- (unint64_t)supportedInterfaceOrientations;
- (void)_configureWallpaperEffectViewWithAnimationSettings:(id)a3;
- (void)_doBoundsPreservingRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4;
- (void)_setMediaOverridePID:(int)a3;
- (void)beginIgnoringAppearanceUpdates;
- (void)beginIgnoringContentOverlayInsetUpdates;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didDeactivate;
- (void)didInvalidate;
- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4;
- (void)endIgnoringAppearanceUpdates;
- (void)endIgnoringContentOverlayInsetUpdates;
- (void)handleGestureDismissal;
- (void)handlePictureInPictureDidBegin;
- (void)prepareForActivationWithContext:(id)a3 presentationMode:(int64_t)a4 presentEmbedded:(BOOL)a5 windowScene:(id)a6 completion:(id)a7;
- (void)preserveInputViewsAnimated:(BOOL)a3;
- (void)remoteTransientOverlayHostContentAdapter:(id)a3 didTerminateWithError:(id)a4;
- (void)remoteTransientOverlayHostContentAdapter:(id)a3 needsStatusBarAppearanceUpdateWithAnimationSettings:(id)a4;
- (void)remoteTransientOverlayHostContentAdapter:(id)a3 requestsWallpaperEffectUpdateWithAnimationSettings:(id)a4;
- (void)remoteTransientOverlayHostContentAdapterDidChangeSupportedInterfaceOrientations:(id)a3;
- (void)remoteTransientOverlayHostContentAdapterRequestsDeactivation:(id)a3;
- (void)remoteTransientOverlayHostContentAdapterRequestsInvalidation:(id)a3;
- (void)restoreInputViewsAnimated:(BOOL)a3;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLayoutElementActive:(BOOL)a3;
- (void)setIdleTimerCoordinator:(id)a3;
- (void)setPairedRemoteTransientOverlay:(id)a3;
- (void)setPresentationEmbeddedInTargetScene:(BOOL)a3;
- (void)setWallpaperVariant:(int64_t)a3;
- (void)updateDisplayLayoutElementWithBuilder:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBRemoteTransientOverlayViewController

+ (id)identifiersForActiveDisplayLayoutElements
{
  if (identifiersForActiveDisplayLayoutElements_onceToken != -1) {
    dispatch_once(&identifiersForActiveDisplayLayoutElements_onceToken, &__block_literal_global_97);
  }
  v2 = (void *)identifiersForActiveDisplayLayoutElements_identifiersForActiveDisplayLayoutElements;
  return v2;
}

void __83__SBRemoteTransientOverlayViewController_identifiersForActiveDisplayLayoutElements__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)identifiersForActiveDisplayLayoutElements_identifiersForActiveDisplayLayoutElements;
  identifiersForActiveDisplayLayoutElements_identifiersForActiveDisplayLayoutElements = v0;
}

- (id)_initWithHostContentAdapter:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBRemoteTransientOverlayViewController;
  v6 = [(SBRemoteTransientOverlayViewController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_presentationEmbeddedInTargetScene = 0;
    p_hostContentAdapter = (id *)&v6->_hostContentAdapter;
    objc_storeStrong((id *)&v6->_hostContentAdapter, a3);
    [*p_hostContentAdapter setDelegate:v7];
    v7->_lastWallpaperStyle = 0;
    v9 = [[SBIdleTimerCoordinatorHelper alloc] initWithSourceProvider:v7];
    idleTimerCoordinatorHelper = v7->_idleTimerCoordinatorHelper;
    v7->_idleTimerCoordinatorHelper = v9;

    [*p_hostContentAdapter setIdleTimerCoordinator:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter setDelegate:0];
  [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter setIdleTimerCoordinator:0];
  if ([(SBRemoteTransientOverlayViewController *)self isViewLoaded])
  {
    v3 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
    [(SBRemoteTransientOverlayViewController *)self bs_removeChildViewController:v3];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v4 dealloc];
}

+ (void)requestViewControllersForAlertDefinition:(id)a3 sceneWorkspaceController:(id)a4 connectionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __126__SBRemoteTransientOverlayViewController_requestViewControllersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke;
  v10[3] = &unk_1E6AFD248;
  id v11 = v8;
  id v12 = a1;
  id v9 = v8;
  +[SBRemoteTransientOverlayHostContentAdapter requestContentAdaptersForAlertDefinition:a3 sceneWorkspaceController:a4 connectionHandler:v10];
}

void __126__SBRemoteTransientOverlayViewController_requestViewControllersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v11)
  {
    id v9 = (void *)[objc_alloc(*(Class *)(a1 + 40)) _initWithHostContentAdapter:v11];
    if (v7)
    {
LABEL_3:
      v10 = (void *)[objc_alloc(*(Class *)(a1 + 40)) _initWithHostContentAdapter:v7];
      goto LABEL_6;
    }
  }
  else
  {
    id v9 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  v10 = 0;
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)becomeFirstResponder
{
  v2 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)canResignFirstResponder
{
  v2 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
  char v3 = [v2 canResignFirstResponder];

  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter preferredInterfaceOrientationForPresentation];
}

- (int64_t)preferredStatusBarStyle
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter preferredStatusBarStyle];
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter preferredWhitePointAdaptivityStyle];
}

- (BOOL)resignFirstResponder
{
  v2 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
  char v3 = [v2 resignFirstResponder];

  return v3;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter supportedInterfaceOrientations];
}

- (id)serviceBundleIdentifier
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter serviceBundleIdentifier];
}

- (int)serviceProcessIdentifier
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter serviceProcessIdentifier];
}

- (id)clientSceneIdentityToken
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter clientSceneIdentityToken];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidAppear:](&v12, sel_viewDidAppear_);
  BOOL v6 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  id v7 = SBLogTransientOverlay();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);
    }
    if (v3) {
      BOOL v3 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldEnableFadeInAnimation];
    }
    id v11 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
    [v11 endAppearanceTransition];

    id v7 = [(SBRemoteTransientOverlayViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 remoteTransientOverlayViewController:self didAppearAnimated:v3];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v12, sel_viewDidDisappear_);
  BOOL v6 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  id v7 = SBLogTransientOverlay();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);
    }
    if (v3) {
      BOOL v3 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldEnableFadeOutAnimation];
    }
    id v11 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
    [v11 endAppearanceTransition];

    id v7 = [(SBRemoteTransientOverlayViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 remoteTransientOverlayViewController:self didDisappearAnimated:v3];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SBRemoteTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v7 viewDidLayoutSubviews];
  BOOL v3 = [(SBTransientOverlayViewController *)self contentView];
  [v3 bounds];
  -[UIView setFrame:](self->_contentViewWrapperView, "setFrame:");
  objc_super v4 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
  id v5 = [v4 view];
  [(UIView *)self->_contentViewWrapperView bounds];
  objc_msgSend(v5, "setFrame:");

  BOOL v6 = [(SBTransientOverlayViewController *)self backgroundView];
  [v6 bounds];
  -[SBTransientOverlayWallpaperEffectView setFrame:](self->_wallpaperEffectView, "setFrame:");
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)SBRemoteTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v12 viewDidLoad];
  BOOL v3 = [(SBTransientOverlayViewController *)self contentView];
  [v3 bounds];
  BOOL v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, v5, v6, v7);
  contentViewWrapperView = self->_contentViewWrapperView;
  self->_contentViewWrapperView = v8;

  [v3 addSubview:self->_contentViewWrapperView];
  v10 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
  [(SBRemoteTransientOverlayViewController *)self addChildViewController:v10];
  id v11 = [v10 view];
  [(UIView *)self->_contentViewWrapperView addSubview:v11];
  [v10 didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBRemoteTransientOverlayViewController viewWillAppear:](&v12, sel_viewWillAppear_);
  BOOL v6 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  double v7 = SBLogTransientOverlay();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);
    }
    if (v3) {
      BOOL v3 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldEnableFadeInAnimation];
    }
    id v11 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
    [v11 beginAppearanceTransition:1 animated:v3];

    double v7 = [(SBRemoteTransientOverlayViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 remoteTransientOverlayViewController:self willAppearAnimated:v3];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBRemoteTransientOverlayViewController viewWillDisappear:](&v11, sel_viewWillDisappear_);
  if ([(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates])
  {
    BOOL v6 = SBLogTransientOverlay();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      __int16 v15 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v3) {
      BOOL v3 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldEnableFadeOutAnimation];
    }
    BOOL v8 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
    [v8 beginAppearanceTransition:0 animated:v3];

    id v9 = SBLogTransientOverlay();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      __int16 v15 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);
    }
    BOOL v6 = [(SBRemoteTransientOverlayViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 remoteTransientOverlayViewController:self willDisappearAnimated:v3];
    }
  }
}

- (int)_preferredStatusBarVisibility
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter preferredStatusBarVisibility];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)succinctDescriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)SBRemoteTransientOverlayViewController;
  BOOL v3 = [(SBTransientOverlayViewController *)&v6 succinctDescriptionBuilder];
  id v4 = (id)[v3 appendObject:self->_hostContentAdapter withName:@"hostContentAdapter" skipIfNil:1];
  return v3;
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  return [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper proposeIdleTimerBehavior:a4 fromProvider:a3 reason:a5];
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter coordinatorRequestedIdleTimerBehavior:self];
}

- (void)remoteTransientOverlayHostContentAdapterDidChangeSupportedInterfaceOrientations:(id)a3
{
  if ([(SBRemoteTransientOverlayViewController *)self isViewLoaded])
  {
    [(SBTransientOverlayViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (void)remoteTransientOverlayHostContentAdapterRequestsDeactivation:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteTransientOverlayViewControllerRequestsDeactivation:self];
}

- (void)remoteTransientOverlayHostContentAdapterRequestsInvalidation:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteTransientOverlayViewControllerRequestsInvalidation:self];
}

- (void)remoteTransientOverlayHostContentAdapter:(id)a3 didTerminateWithError:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained remoteTransientOverlayViewController:self didTerminateWithError:v6];
}

- (void)remoteTransientOverlayHostContentAdapter:(id)a3 requestsWallpaperEffectUpdateWithAnimationSettings:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_isPresented) {
    [(SBRemoteTransientOverlayViewController *)self _configureWallpaperEffectViewWithAnimationSettings:v6];
  }
  else {
    objc_storeStrong((id *)&self->_pendingAnimationSettings, a4);
  }
}

- (void)remoteTransientOverlayHostContentAdapter:(id)a3 needsStatusBarAppearanceUpdateWithAnimationSettings:(id)a4
{
  id v5 = a4;
  if ([(SBRemoteTransientOverlayViewController *)self isViewLoaded])
  {
    id v6 = (void *)MEMORY[0x1E4F42FF0];
    [v5 duration];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __135__SBRemoteTransientOverlayViewController_remoteTransientOverlayHostContentAdapter_needsStatusBarAppearanceUpdateWithAnimationSettings___block_invoke;
    v7[3] = &unk_1E6AF4AC0;
    v7[4] = self;
    objc_msgSend(v6, "animateWithDuration:animations:", v7);
  }
}

uint64_t __135__SBRemoteTransientOverlayViewController_remoteTransientOverlayHostContentAdapter_needsStatusBarAppearanceUpdateWithAnimationSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

- (int64_t)defaultPreferredInterfaceOrientationForPresentationForRemoteTransientOverlayHostContentAdapter:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return [(SBTransientOverlayViewController *)&v4 preferredInterfaceOrientationForPresentation];
}

- (id)remoteTransientOverlayHostContentAdapter:(id)a3 requestsActionForHandlingButtonEvents:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [WeakRetained remoteTransientOverlayViewController:self requestsActionForHandlingButtonEvents:a4];

  return v7;
}

- (id)sceneForClientSettings
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter sceneForClientSettings];
}

- (id)hostedSceneIdentityTokens
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter clientSceneIdentityToken];
  BOOL v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter allowsStackingOverlayContentAbove];
}

- (void)beginIgnoringAppearanceUpdates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  v6.receiver = self;
  v6.super_class = (Class)SBRemoteTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v6 beginIgnoringAppearanceUpdates];
  BOOL v4 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  if (!v3 && v4)
  {
    id v5 = SBLogTransientOverlay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      BOOL v8 = self;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Begin ignoring appearance changes...", buf, 0xCu);
    }
  }
}

- (void)endIgnoringAppearanceUpdates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  v10.receiver = self;
  v10.super_class = (Class)SBRemoteTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v10 endIgnoringAppearanceUpdates];
  BOOL v4 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  if (v3 && !v4)
  {
    id v5 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
    unsigned int v6 = [v5 _appearState];
    unsigned int v7 = [(SBRemoteTransientOverlayViewController *)self _appearState];
    BOOL v8 = SBLogTransientOverlay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      objc_super v12 = self;
      __int16 v13 = 2048;
      uint64_t v14 = v6;
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Ended ignoring appearance changes. Content appear state: %td, container appear state: %td", buf, 0x20u);
    }

    if (v7 == v6) {
      goto LABEL_23;
    }
    if (v7 - 1 < 2)
    {
      uint64_t v9 = [(SBRemoteTransientOverlayViewController *)self delegate];
      if (v6 - 3 <= 0xFFFFFFFD)
      {
        [v5 beginAppearanceTransition:1 animated:0];
        if (objc_opt_respondsToSelector()) {
          [v9 remoteTransientOverlayViewController:self willAppearAnimated:0];
        }
      }
      if (v7 == 2)
      {
        [v5 endAppearanceTransition];
        if (objc_opt_respondsToSelector()) {
          [v9 remoteTransientOverlayViewController:self didAppearAnimated:0];
        }
      }
    }
    else
    {
      if (v7 != 3 && v7) {
        goto LABEL_23;
      }
      uint64_t v9 = [(SBRemoteTransientOverlayViewController *)self delegate];
      if (v6)
      {
        if (v6 != 3)
        {
          [v5 beginAppearanceTransition:0 animated:0];
          if (objc_opt_respondsToSelector()) {
            [v9 remoteTransientOverlayViewController:self willDisappearAnimated:0];
          }
        }
      }
      if (!v7)
      {
        [v5 endAppearanceTransition];
        if (objc_opt_respondsToSelector()) {
          [v9 remoteTransientOverlayViewController:self didDisappearAnimated:0];
        }
      }
    }

LABEL_23:
  }
}

- (void)beginIgnoringContentOverlayInsetUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)SBRemoteTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v3 beginIgnoringContentOverlayInsetUpdates];
  [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter setShouldIgnoreContentOverlayInsetUpdates:[(SBTransientOverlayViewController *)self isIgnoringContentOverlayInsetUpdates]];
}

- (void)endIgnoringContentOverlayInsetUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)SBRemoteTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v3 endIgnoringContentOverlayInsetUpdates];
  [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter setShouldIgnoreContentOverlayInsetUpdates:[(SBTransientOverlayViewController *)self isIgnoringContentOverlayInsetUpdates]];
}

- (BOOL)handleDoubleHeightStatusBarTap
{
  if ([(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter handleDoubleHeightStatusBarTap])
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return [(SBTransientOverlayViewController *)&v4 handleDoubleHeightStatusBarTap];
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[SBRemoteTransientOverlayHostContentAdapter handleHeadsetButtonPress:](self->_hostContentAdapter, "handleHeadsetButtonPress:"))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBRemoteTransientOverlayViewController;
  return [(SBTransientOverlayViewController *)&v6 handleHeadsetButtonPress:v3];
}

- (BOOL)handleHomeButtonPress
{
  if ([(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter handleHomeButtonPress])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return [(SBTransientOverlayViewController *)&v4 handleHomeButtonPress];
}

- (BOOL)handleHomeButtonDoublePress
{
  if ([(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter handleHomeButtonDoublePress])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return [(SBTransientOverlayViewController *)&v4 handleHomeButtonDoublePress];
}

- (BOOL)handleHomeButtonLongPress
{
  if ([(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter handleHomeButtonLongPress])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return [(SBTransientOverlayViewController *)&v4 handleHomeButtonLongPress];
}

- (BOOL)handleLockButtonPress
{
  if ([(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter handleLockButtonPress])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return [(SBTransientOverlayViewController *)&v4 handleLockButtonPress];
}

- (void)handlePictureInPictureDidBegin
{
  v3.receiver = self;
  v3.super_class = (Class)SBRemoteTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v3 handlePictureInPictureDidBegin];
  [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter handlePictureInPictureDidBegin];
}

- (BOOL)handleVolumeUpButtonPress
{
  if ([(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter handleVolumeUpButtonPress])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return [(SBTransientOverlayViewController *)&v4 handleVolumeUpButtonPress];
}

- (BOOL)handleVolumeDownButtonPress
{
  if ([(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter handleVolumeDownButtonPress])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return [(SBTransientOverlayViewController *)&v4 handleVolumeDownButtonPress];
}

- (void)handleGestureDismissal
{
}

- (BOOL)hasServiceProcessIdentifier:(int)a3
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter serviceProcessIdentifier] == a3;
}

- (BOOL)isContentOpaque
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter isContentOpaque];
}

- (BOOL)isPresentedByProcess:(id)a3
{
  id v4 = a3;
  int v5 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter serviceProcessIdentifier];
  if (v5 == [v4 pid])
  {
    objc_super v6 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter serviceBundleIdentifier];
    unsigned int v7 = [v4 bundleIdentifier];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isPresentedByBundleIdentifier:(id)a3
{
  hostContentAdapter = self->_hostContentAdapter;
  id v4 = a3;
  int v5 = [(SBRemoteTransientOverlayHostContentAdapter *)hostContentAdapter serviceBundleIdentifier];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (int)pictureInPictureProcessIdentifier
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter serviceProcessIdentifier];
}

- (id)preferredDisplayLayoutElementIdentifier
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter preferredDisplayLayoutElementIdentifier];
}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBRemoteTransientOverlayViewController;
  if ([(SBTransientOverlayViewController *)&v10 isDisplayLayoutElementActive] != a3)
  {
    int v5 = [(SBRemoteTransientOverlayViewController *)self preferredDisplayLayoutElementIdentifier];
    if (v5)
    {
      char v6 = [(id)objc_opt_class() identifiersForActiveDisplayLayoutElements];
      unsigned int v7 = v6;
      if (v3)
      {
        char v8 = [v6 containsObject:v5];

        if (v8)
        {
          BOOL v3 = 0;
          goto LABEL_9;
        }
        unsigned int v7 = [(id)objc_opt_class() identifiersForActiveDisplayLayoutElements];
        [v7 addObject:v5];
      }
      else
      {
        [v6 removeObject:v5];
      }
    }
LABEL_9:
    v9.receiver = self;
    v9.super_class = (Class)SBRemoteTransientOverlayViewController;
    [(SBTransientOverlayViewController *)&v9 setDisplayLayoutElementActive:v3];
  }
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__SBRemoteTransientOverlayViewController_updateDisplayLayoutElementWithBuilder___block_invoke;
  v7[3] = &unk_1E6AFD270;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SBRemoteTransientOverlayViewController;
  id v5 = v4;
  [(SBTransientOverlayViewController *)&v6 updateDisplayLayoutElementWithBuilder:v7];
}

void __80__SBRemoteTransientOverlayViewController_updateDisplayLayoutElementWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1400);
  id v5 = a2;
  id v4 = [v3 serviceBundleIdentifier];
  [v5 setBundleIdentifier:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  if ([(SBTransientOverlayViewController *)self isAttachedToWindowedAccessory]) {
    return 0;
  }
  hostContentAdapter = self->_hostContentAdapter;
  return [(SBRemoteTransientOverlayHostContentAdapter *)hostContentAdapter preferredLockedGestureDismissalStyle];
}

- (id)preferredSceneDeactivationReasonValue
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter preferredSceneDeactivationReasonValue];
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  if ([(SBTransientOverlayViewController *)self isAttachedToWindowedAccessory]) {
    return 0;
  }
  hostContentAdapter = self->_hostContentAdapter;
  return [(SBRemoteTransientOverlayHostContentAdapter *)hostContentAdapter preferredUnlockedGestureDismissalStyle];
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  BOOL v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  id v4 = [(SBRemoteTransientOverlayViewController *)self _hostContentViewController];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v11[3] = &unk_1E6AFD298;
  v11[4] = self;
  id v5 = v4;
  id v12 = v5;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v11];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5;
  v8[3] = &unk_1E6AFD298;
  id v9 = v5;
  objc_super v10 = self;
  id v6 = v5;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setFinalizeTransitionHandler:v8];

  return v3;
}

void __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = [v4 isAnimated];
  if (v5) {
    int v6 = [*(id *)(*(void *)(a1 + 32) + 1400) shouldEnableFadeOutAnimation];
  }
  else {
    int v6 = 0;
  }
  unsigned int v7 = [*(id *)(a1 + 40) view];
  if (v6)
  {
    ++*(void *)(*(void *)(a1 + 32) + 1456);
    id v8 = (void *)MEMORY[0x1E4F42FF0];
    int v9 = __sb__runningInSpringBoard();
    char v10 = v9;
    if (v9)
    {
      BOOL v11 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v11 = [v2 userInterfaceIdiom] == 1;
    }
    if (v11) {
      double v15 = 0.5;
    }
    else {
      double v15 = 0.4;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
    v22[3] = &unk_1E6AF4E00;
    id v16 = v7;
    uint64_t v17 = *(void *)(a1 + 32);
    id v23 = v16;
    uint64_t v24 = v17;
    id v25 = v4;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
    v20[3] = &unk_1E6AF4A98;
    v20[4] = *(void *)(a1 + 32);
    id v21 = v25;
    [v8 animateWithDuration:v22 animations:v20 completion:v15];
    if ((v10 & 1) == 0) {

    }
    uint64_t v14 = v23;
  }
  else
  {
    [v4 performAlongsideTransitions];
    uint64_t v12 = *(void *)(a1 + 32);
    __int16 v13 = *(void **)(v12 + 1400);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4;
    v18[3] = &unk_1E6AF5290;
    v18[4] = v12;
    id v19 = v4;
    [v13 dismissForTransientOverlayAnimated:v5 completion:v18];
    uint64_t v14 = v19;
  }
}

uint64_t __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 40) + 1464) setAlpha:0.0];
  uint64_t v2 = *(void **)(a1 + 48);
  return [v2 performAlongsideTransitions];
}

uint64_t __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 1456);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 1456))
  {
    char v3 = [(id)v2 _needsWallpaperEffectView];
    uint64_t v2 = *(void *)(a1 + 32);
    if ((v3 & 1) == 0)
    {
      [*(id *)(v2 + 1464) removeFromSuperview];
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 1464);
      *(void *)(v4 + 1464) = 0;

      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(unsigned char *)(v2 + 1432) = 0;
  int v6 = *(void **)(a1 + 40);
  return [v6 completeTransition:1];
}

uint64_t __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1432) = 0;
  return [*(id *)(a1 + 40) completeTransition:1];
}

void __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 40) + 1464) setAlpha:1.0];
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  char v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 1432) = 1;
  [*(id *)(a1 + 32) loadViewIfNeeded];
  id v4 = *(id *)(*(void *)(a1 + 32) + 1448);
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(v5 + 1448);
  *(void *)(v5 + 1448) = 0;

  uint64_t v7 = [v3 isAnimated];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 1400) shouldEnableFadeInAnimation];
  if (!v7)
  {
    uint64_t v9 = (uint64_t)v4;
    id v4 = 0;
LABEL_9:

    uint64_t v9 = v7;
    goto LABEL_10;
  }
  uint64_t v9 = v8;
  if (v4) {
    int v10 = 0;
  }
  else {
    int v10 = v8;
  }
  if (v10 != 1) {
    goto LABEL_10;
  }
  BOOL v11 = (void *)MEMORY[0x1E4F4F680];
  int v12 = __sb__runningInSpringBoard();
  char v13 = v12;
  if (v12)
  {
    BOOL v14 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v14 = [(id)v9 userInterfaceIdiom] == 1;
  }
  double v26 = 0.4;
  if (v14) {
    double v26 = 0.5;
  }
  id v4 = [v11 settingsWithDuration:v26];
  if ((v13 & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v9 = 1;
LABEL_10:
  [*(id *)(a1 + 32) _configureWallpaperEffectViewWithAnimationSettings:v4];
  double v15 = [*(id *)(a1 + 32) _hostContentViewController];
  id v16 = [v15 view];

  if (v9)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F42FF0];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v34[3] = &unk_1E6AF4AC0;
    id v18 = v16;
    id v35 = v18;
    [v17 performWithoutAnimation:v34];
    id v19 = (void *)MEMORY[0x1E4F42FF0];
    int v20 = __sb__runningInSpringBoard();
    char v21 = v20;
    if (v20)
    {
      BOOL v22 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v22 = [(id)v9 userInterfaceIdiom] == 1;
    }
    uint64_t v24 = &v35;
    if (v22) {
      double v25 = 0.5;
    }
    else {
      double v25 = 0.4;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v31[3] = &unk_1E6AF5290;
    id v32 = v18;
    id v33 = v3;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
    v29[3] = &unk_1E6AF5350;
    id v30 = v33;
    [v19 animateWithDuration:v31 animations:v29 completion:v25];
    if ((v21 & 1) == 0) {
  }
    }
  else
  {
    [v16 setAlpha:1.0];
    [v3 performAlongsideTransitions];
    id v23 = *(void **)(*(void *)(a1 + 32) + 1400);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5;
    v27[3] = &unk_1E6AF4AC0;
    uint64_t v24 = &v28;
    id v28 = v3;
    [v23 presentForTransientOverlayAnimated:v7 completion:v27];
  }
}

uint64_t __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = *(void **)(a1 + 40);
  return [v2 performAlongsideTransitions];
}

uint64_t __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

uint64_t __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (BOOL)prefersStatusBarActivityItemVisible
{
  id v3 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter serviceBundleIdentifier];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = [WeakRetained remoteTransientOverlayViewController:self prefersStatusBarActivityItemVisibleForServiceBundleIdentifier:v3];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)preserveInputViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController preserveInputViewsAnimated:](&v5, sel_preserveInputViewsAnimated_);
  [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter preserveInputViewsAnimated:v3];
}

- (void)restoreInputViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController restoreInputViewsAnimated:](&v5, sel_restoreInputViewsAnimated_);
  [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter restoreInputViewsAnimated:v3];
}

- (id)preferredBackgroundActivitiesToSuppress
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter preferredBackgroundActivitiesToSuppress];
}

- (void)setContainerOrientation:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v4 setContainerOrientation:a3];
  [(SBTransientOverlayWallpaperEffectView *)self->_wallpaperEffectView setContainerOrientation:[(SBTransientOverlayViewController *)self containerOrientation]];
}

- (void)setIdleTimerCoordinator:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayViewController;
  id v4 = a3;
  [(SBTransientOverlayViewController *)&v5 setIdleTimerCoordinator:v4];
  -[SBIdleTimerCoordinatorHelper setTargetCoordinator:](self->_idleTimerCoordinatorHelper, "setTargetCoordinator:", v4, v5.receiver, v5.super_class);
}

- (BOOL)shouldDisableBanners
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldDisableBanners];
}

- (BOOL)shouldDisableControlCenter
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldDisableControlCenter];
}

- (BOOL)shouldDisableReachability
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldDisableReachability];
}

- (BOOL)shouldDisableOrientationUpdates
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldDisableOrientationUpdates];
}

- (BOOL)shouldDisableInteractiveScreenshotGesture
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldDisableInteractiveScreenshotGesture];
}

- (BOOL)shouldDisableSiri
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldDisableSiri];
}

- (BOOL)shouldPendAlertItems
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldPendAlertItems];
}

- (BOOL)shouldUseSceneBasedKeyboardFocus
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldUseSceneBasedKeyboardFocus];
}

- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter isPresentedFromSceneWithIdentityTokenString:a3];
}

- (id)keyboardFocusTarget
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter keyboardFocusTarget];
}

- (BOOL)hidEventDeferringDisabled
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter hidEventDeferringDisabled];
}

- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:](&v10, sel_didTransitionToAttachedToWindowedAccessory_windowedAccessoryCutoutFrameInScreen_);
  -[SBRemoteTransientOverlayHostContentAdapter didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:](self->_hostContentAdapter, "didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v8, x, y, width, height);
}

- (id)associatedBundleIdentifiersToSuppressInSystemAperture
{
  BOOL v3 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter serviceBundleIdentifier];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    objc_super v5 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter serviceBundleIdentifier];
    int v6 = [v4 setWithObject:v5];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)associatedSceneIdentifiersToSuppressInSystemAperture
{
  BOOL v3 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter associatedSceneIdentifierToSuppressInSystemAperture];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    objc_super v5 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter associatedSceneIdentifierToSuppressInSystemAperture];
    int v6 = [v4 setWithObject:v5];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)setPresentationEmbeddedInTargetScene:(BOOL)a3
{
  BOOL presentationEmbeddedInTargetScene = self->_presentationEmbeddedInTargetScene;
  if (presentationEmbeddedInTargetScene != a3)
  {
    self->_BOOL presentationEmbeddedInTargetScene = a3;
    if ([(SBRemoteTransientOverlayViewController *)self isViewLoaded])
    {
      if ([(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldUpdateSceneBasedViewController])
      {
        objc_super v5 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter contentViewControllerForPresentationEmbeddedInSceneView:presentationEmbeddedInTargetScene];
        [(SBRemoteTransientOverlayViewController *)self bs_removeChildViewController:v5];

        id v6 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter contentViewControllerForPresentationEmbeddedInSceneView:self->_presentationEmbeddedInTargetScene];
        [(SBRemoteTransientOverlayViewController *)self bs_addChildViewController:v6];
      }
    }
  }
}

- (BOOL)isActivatingForSiri
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter isActivatingForSiri];
}

- (BOOL)isScreenshotMarkup
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter isScreenshotMarkup];
}

- (BOOL)isSwitcherEligible
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter isSwitcherEligible];
}

- (id)representedDisplayItem
{
  id v2 = [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter serviceBundleIdentifier];
  if (v2)
  {
    BOOL v3 = +[SBDisplayItem remoteAlertDisplayItemWithServiceBundleIdentifier:v2];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)shouldInvalidateWhenDeactivated
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter shouldInvalidateWhenDeactivated];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
}

- (void)didDeactivate
{
}

- (void)didInvalidate
{
}

- (void)prepareForActivationWithContext:(id)a3 presentationMode:(int64_t)a4 presentEmbedded:(BOOL)a5 windowScene:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  hostContentAdapter = self->_hostContentAdapter;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  [(SBRemoteTransientOverlayHostContentAdapter *)hostContentAdapter setShouldPresentEmbeddedInTargetSceneIfRequested:v8];
  [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter prepareForActivationWithContext:v15 presentationMode:a4 windowScene:v14 completion:v13];
}

- (id)_hostContentViewController
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter contentViewControllerForPresentationEmbeddedInSceneView:self->_presentationEmbeddedInTargetScene];
}

- (void)_setMediaOverridePID:(int)a3
{
}

- (void)_doBoundsPreservingRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
}

- (void)_configureWallpaperEffectViewWithAnimationSettings:(id)a3
{
  id v4 = a3;
  if ([(SBRemoteTransientOverlayViewController *)self _needsWallpaperEffectView])
  {
    wallpaperEffectView = self->_wallpaperEffectView;
    if (!wallpaperEffectView)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke;
      v32[3] = &unk_1E6AF4AC0;
      v32[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v32];
    }
    [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter preferredBackgroundStyle];
    _WallpaperStyleForBackgroundStyle();
    long long v30 = 0uLL;
    uint64_t v31 = 0;
    PBUIWallpaperStyleTransitionStateMake();
    id v6 = self->_wallpaperEffectView;
    if (!v4)
    {
      long long v23 = v30;
      uint64_t v24 = v31;
      [(SBTransientOverlayWallpaperEffectView *)v6 setTransitionState:&v23];
      goto LABEL_14;
    }
    BOOL v7 = [(SBTransientOverlayWallpaperEffectView *)v6 prepareToAnimateToTransitionState:&v30];
    BOOL v8 = v7;
    ++self->_wallpaperEffectAnimations;
    if (!wallpaperEffectView && !v7) {
      [(SBTransientOverlayWallpaperEffectView *)self->_wallpaperEffectView setAlpha:0.0];
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F4F898];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_2;
    v26[3] = &unk_1E6AFD2C0;
    BOOL v29 = v8;
    v26[4] = self;
    long long v27 = v30;
    uint64_t v28 = v31;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_3;
    v25[3] = &unk_1E6AF5350;
    v25[4] = self;
    objc_super v10 = v26;
    BOOL v11 = v25;
  }
  else
  {
    if (!v4)
    {
      [(SBTransientOverlayWallpaperEffectView *)self->_wallpaperEffectView removeFromSuperview];
      int v12 = self->_wallpaperEffectView;
      self->_wallpaperEffectView = 0;

      goto LABEL_14;
    }
    ++self->_wallpaperEffectAnimations;
    uint64_t v9 = (void *)MEMORY[0x1E4F4F898];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    int v20 = __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_4;
    char v21 = &unk_1E6AF4AC0;
    BOOL v22 = self;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_5;
    id v16 = &unk_1E6AF5350;
    uint64_t v17 = self;
    objc_super v10 = &v18;
    BOOL v11 = &v13;
  }
  objc_msgSend(v9, "animateWithSettings:actions:completion:", v4, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
LABEL_14:
}

void __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) backgroundView];
  [v9 bounds];
  id v6 = -[SBTransientOverlayWallpaperEffectView initWithFrame:wallpaperVariant:]([SBTransientOverlayWallpaperEffectView alloc], "initWithFrame:wallpaperVariant:", *(void *)(*(void *)(a1 + 32) + 1488), v2, v3, v4, v5);
  uint64_t v7 = *(void *)(a1 + 32);
  BOOL v8 = *(void **)(v7 + 1464);
  *(void *)(v7 + 1464) = v6;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1464), "setContainerOrientation:", objc_msgSend(*(id *)(a1 + 32), "containerOrientation"));
  [*(id *)(*(void *)(a1 + 32) + 1464) setWallpaperStyle:0];
  [v9 insertSubview:*(void *)(*(void *)(a1 + 32) + 1464) atIndex:0];
}

uint64_t __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    double v2 = *(void **)(*(void *)(a1 + 32) + 1464);
    long long v4 = *(_OWORD *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 56);
    [v2 setTransitionState:&v4];
  }
  return [*(id *)(*(void *)(a1 + 32) + 1464) setAlpha:1.0];
}

uint64_t __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_3(uint64_t result)
{
  return result;
}

uint64_t __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1464) setAlpha:0.0];
}

void __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_5(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 1456);
  double v2 = *(void **)(a1 + 32);
  if (!v2[182] && ([v2 _needsWallpaperEffectView] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 1464) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 32);
    long long v4 = *(void **)(v3 + 1464);
    *(void *)(v3 + 1464) = 0;
  }
}

- (BOOL)_needsWallpaperEffectView
{
  return [(SBRemoteTransientOverlayHostContentAdapter *)self->_hostContentAdapter preferredBackgroundStyle] != 0;
}

- (int64_t)preferredDismissalAnimationStyle
{
  return self->_preferredDismissalAnimationStyle;
}

- (SBRemoteTransientOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBRemoteTransientOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)wallpaperVariant
{
  return self->_wallpaperVariant;
}

- (void)setWallpaperVariant:(int64_t)a3
{
  self->_wallpaperVariant = a3;
}

- (SBRemoteTransientOverlayViewController)pairedRemoteTransientOverlay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairedRemoteTransientOverlay);
  return (SBRemoteTransientOverlayViewController *)WeakRetained;
}

- (void)setPairedRemoteTransientOverlay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairedRemoteTransientOverlay);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_pendingAnimationSettings, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_contentViewWrapperView, 0);
  objc_storeStrong((id *)&self->_hostContentAdapter, 0);
}

@end