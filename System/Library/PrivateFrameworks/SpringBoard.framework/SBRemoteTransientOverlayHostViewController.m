@interface SBRemoteTransientOverlayHostViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsCustomPresentationDismissalAnimations;
- (BOOL)allowsHomeButtonDismissal;
- (BOOL)allowsStackingOverlayContentAbove;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)handleDoubleHeightStatusBarTap;
- (BOOL)isAttachedToWindowedAccessory;
- (BOOL)isContentOpaque;
- (BOOL)prefersWallpaperTunnelActive;
- (BOOL)resignFirstResponder;
- (BOOL)shouldDisableBanners;
- (BOOL)shouldDisableControlCenter;
- (BOOL)shouldDisableInteractiveScreenshotGesture;
- (BOOL)shouldDisableOrientationUpdates;
- (BOOL)shouldDisableReachability;
- (BOOL)shouldDisableSiri;
- (BOOL)shouldEnableFadeInAnimation;
- (BOOL)shouldEnableFadeOutAnimation;
- (BOOL)shouldIgnoreContentOverlayInsetUpdates;
- (BOOL)shouldPendAlertItems;
- (CGRect)windowedAccessoryCutoutFrameInScreen;
- (NSNumber)preferredSceneDeactivationReasonValue;
- (NSSet)preferredBackgroundActivitiesToSuppress;
- (NSString)description;
- (SBRemoteTransientOverlayHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBRemoteTransientOverlayHostViewControllerDelegate)delegate;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)_preferredStatusBarVisibility;
- (int64_t)dismissalAnimationStyle;
- (int64_t)preferredStatusBarStyle;
- (int64_t)requestedBackgroundStyle;
- (int64_t)swipeDismissalStyle;
- (unint64_t)preferredHardwareButtonEvents;
- (void)_participateInSystemAnimationFence:(id)a3;
- (void)_setDesiredHardwareButtonEvents:(unint64_t)a3;
- (void)_updateContentOverlayInsetsFromParentIfNecessary;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)deactivate;
- (void)didInvalidateForRemoteAlert;
- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4;
- (void)dismissForTransientOverlayAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)invalidate;
- (void)prepareForActivationWithContext:(id)a3 presentationMode:(int64_t)a4 completion:(id)a5;
- (void)presentForTransientOverlayAnimated:(BOOL)a3 completion:(id)a4;
- (void)preserveInputViewsAnimated:(BOOL)a3;
- (void)restoreInputViewsAnimated:(BOOL)a3;
- (void)setAllowsAlertItems:(BOOL)a3;
- (void)setAllowsAlertStacking:(BOOL)a3;
- (void)setAllowsBanners:(BOOL)a3;
- (void)setAllowsControlCenter:(BOOL)a3;
- (void)setAllowsCustomPresentationDismissalAnimations:(BOOL)a3;
- (void)setAllowsMenuButtonDismissal:(BOOL)a3;
- (void)setAllowsSiri:(BOOL)a3;
- (void)setBackgroundActivitiesToCancel:(id)a3 animationSettings:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDesiredAutoLockDuration:(double)a3;
- (void)setDesiredIdleTimerSettings:(id)a3;
- (void)setDismissalAnimationStyle:(int64_t)a3;
- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setInteractiveScreenshotGestureDisabled:(BOOL)a3;
- (void)setLaunchingInterfaceOrientation:(int64_t)a3;
- (void)setOrientationChangedEventsEnabled:(BOOL)a3;
- (void)setReachabilityDisabled:(BOOL)a3;
- (void)setSceneDeactivationReason:(id)a3;
- (void)setShouldDisableFadeInAnimation:(BOOL)a3;
- (void)setShouldEnableFadeInAnimation:(BOOL)a3;
- (void)setShouldEnableFadeOutAnimation:(BOOL)a3;
- (void)setShouldIgnoreContentOverlayInsetUpdates:(BOOL)a3;
- (void)setStatusBarHidden:(BOOL)a3 withDuration:(double)a4;
- (void)setStyleOverridesToCancel:(unint64_t)a3 animationSettings:(id)a4;
- (void)setSwipeDismissalStyle:(int64_t)a3;
- (void)setWallpaperStyle:(int64_t)a3 withDuration:(double)a4;
- (void)setWallpaperTunnelActive:(BOOL)a3;
- (void)setWhitePointAdaptivityStyle:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBRemoteTransientOverlayHostViewController

- (SBRemoteTransientOverlayHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  v4 = [(SBRemoteTransientOverlayHostViewController *)&v10 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    preferredSceneDeactivationReasonValue = v4->_preferredSceneDeactivationReasonValue;
    v4->_preferredSceneDeactivationReasonValue = (NSNumber *)&unk_1F334A7A8;

    uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
    preferredBackgroundActivitiesToSuppress = v5->_preferredBackgroundActivitiesToSuppress;
    v5->_preferredBackgroundActivitiesToSuppress = (NSSet *)v7;

    v5->_requestedBackgroundStyle = 0;
  }
  return v5;
}

- (NSString)description
{
  return (NSString *)[(SBRemoteTransientOverlayHostViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBRemoteTransientOverlayHostViewController *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(_UIRemoteViewController *)self serviceBundleIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"serviceBundleIdentifier"];

  id v6 = (id)objc_msgSend(v3, "appendInt64:withName:", -[_UIRemoteViewController serviceProcessIdentifier](self, "serviceProcessIdentifier"), @"servicePID");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBRemoteTransientOverlayHostViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (BOOL)handleDoubleHeightStatusBarTap
{
  v2 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v2 handleDoubleHeightStatusBarTap];

  return 1;
}

- (void)didInvalidateForRemoteAlert
{
  id v2 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v2 didInvalidateForRemoteAlert];
}

- (void)setAllowsBanners:(BOOL)a3
{
  if (self->_shouldDisableBanners != !a3)
  {
    self->_shouldDisableBanners = !a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:self];
    }
  }
}

- (void)setAllowsAlertItems:(BOOL)a3
{
  if (self->_shouldPendAlertItems != !a3)
  {
    self->_shouldPendAlertItems = !a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:self];
    }
  }
}

- (void)setAllowsControlCenter:(BOOL)a3
{
  if (self->_shouldDisableControlCenter != !a3)
  {
    self->_shouldDisableControlCenter = !a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:self];
    }
  }
}

- (void)setAllowsSiri:(BOOL)a3
{
  if (self->_shouldDisableSiri != !a3)
  {
    self->_shouldDisableSiri = !a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:self];
    }
  }
}

- (void)deactivate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteTransientOverlayHostViewControllerRequestsDeactivation:self];
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteTransientOverlayHostViewControllerRequestsInvalidation:self];
}

- (void)_setDesiredHardwareButtonEvents:(unint64_t)a3
{
  if (self->_preferredHardwareButtonEvents != a3)
  {
    self->_preferredHardwareButtonEvents = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteTransientOverlayHostViewControllerDidChangeDesiredHardwareButtonEvents:self];
  }
}

- (void)setWallpaperTunnelActive:(BOOL)a3
{
  if (self->_prefersWallpaperTunnelActive != a3)
  {
    self->_prefersWallpaperTunnelActive = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteTransientOverlayHostViewControllerDidChangePrefersWallpaperTunnel:self];
  }
}

- (void)setWallpaperStyle:(int64_t)a3 withDuration:(double)a4
{
  if (self->_requestedBackgroundStyle != a3)
  {
    self->_requestedBackgroundStyle = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (BSFloatGreaterThanFloat())
    {
      id v6 = [MEMORY[0x1E4F4F680] settingsWithDuration:a4];
      [WeakRetained remoteTransientOverlayHostViewControllerDidChangeRequestedBackgroundStyle:self withAnimationSettings:v6];
    }
    else
    {
      [WeakRetained remoteTransientOverlayHostViewControllerDidChangeRequestedBackgroundStyle:self withAnimationSettings:0];
    }
  }
}

- (void)setAllowsMenuButtonDismissal:(BOOL)a3
{
  if (self->_allowsHomeButtonDismissal != a3)
  {
    self->_allowsHomeButtonDismissal = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteTransientOverlayHostViewControllerDidChangeAllowsMenuButtonDismissal:self];
  }
}

- (void)setAllowsAlertStacking:(BOOL)a3
{
  self->_allowsStackingOverlayContentAbove = a3;
}

- (void)setDismissalAnimationStyle:(int64_t)a3
{
  if (self->_dismissalAnimationStyle != a3)
  {
    self->_dismissalAnimationStyle = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteTransientOverlayHostViewControllerDidChangeDismissalAnimationStyle:self];
  }
}

- (void)setSwipeDismissalStyle:(int64_t)a3
{
  if (self->_swipeDismissalStyle != a3)
  {
    self->_swipeDismissalStyle = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteTransientOverlayHostViewControllerDidChangeSwipeDismissalStyle:self];
  }
}

- (void)setStyleOverridesToCancel:(unint64_t)a3 animationSettings:(id)a4
{
  id v5 = a4;
  STUIBackgroundActivityIdentifiersForStyleOverrides();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(SBRemoteTransientOverlayHostViewController *)self setBackgroundActivitiesToCancel:v6 animationSettings:v5];
}

- (void)setBackgroundActivitiesToCancel:(id)a3 animationSettings:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (NSSet *)[a3 copy];
  preferredBackgroundActivitiesToSuppress = self->_preferredBackgroundActivitiesToSuppress;
  self->_preferredBackgroundActivitiesToSuppress = v7;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteTransientOverlayHostViewController:self didChangeBackgroundActivitiesToSuppressWithAnimationSettings:v6];
}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  if (a4)
  {
    BOOL v4 = a3;
    p_delegate = &self->_delegate;
    id v7 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained remoteTransientOverlayHostViewController:self didSetIdleTimerDisabled:v4 forReason:v7];
  }
}

- (void)setDesiredAutoLockDuration:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteTransientOverlayHostViewController:self didSetDesiredAutoLockDuration:a3];
}

- (void)setStatusBarHidden:(BOOL)a3 withDuration:(double)a4
{
  if (a3) {
    int v4 = 1;
  }
  else {
    int v4 = 2;
  }
  self->_preferredStatusBarVisibility = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__SBRemoteTransientOverlayHostViewController_setStatusBarHidden_withDuration___block_invoke;
  v5[3] = &unk_1E6AF4AC0;
  v5[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v5 animations:a4];
}

uint64_t __78__SBRemoteTransientOverlayHostViewController_setStatusBarHidden_withDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

- (void)setShouldDisableFadeInAnimation:(BOOL)a3
{
  self->_shouldEnableFadeInAnimation = !a3;
}

- (void)setInteractiveScreenshotGestureDisabled:(BOOL)a3
{
  if (self->_shouldDisableInteractiveScreenshotGesture != a3)
  {
    self->_shouldDisableInteractiveScreenshotGesture = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:self];
    }
  }
}

- (void)setLaunchingInterfaceOrientation:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteTransientOverlayHostViewController:self didChangeLaunchingInterfaceOrientation:a3];
}

- (void)setOrientationChangedEventsEnabled:(BOOL)a3
{
  if (self->_shouldDisableOrientationUpdates != !a3)
  {
    self->_shouldDisableOrientationUpdates = !a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained remoteTransientOverlayHostViewControllerDidChangeShouldDisableOrientationUpdates:self];
    }
  }
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteTransientOverlayHostViewController:self didChangeWhitePointAdaptivityStyle:a3];
}

- (void)setDesiredIdleTimerSettings:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained remoteTransientOverlayHostViewController:self didSetDesiredIdleTimerSettings:v5];
}

- (void)setReachabilityDisabled:(BOOL)a3
{
  if (self->_shouldDisableReachability != a3)
  {
    self->_shouldDisableReachability = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained remoteTransientOverlayHostViewControllerDidChangeFeaturePolicy:self];
    }
  }
}

- (void)setSceneDeactivationReason:(id)a3
{
  int v4 = (NSNumber *)a3;
  preferredSceneDeactivationReasonValue = self->_preferredSceneDeactivationReasonValue;
  if (preferredSceneDeactivationReasonValue != v4)
  {
    objc_super v10 = v4;
    char v6 = [(NSNumber *)preferredSceneDeactivationReasonValue isEqual:v4];
    int v4 = v10;
    if ((v6 & 1) == 0)
    {
      id v7 = (NSNumber *)[(NSNumber *)v10 copy];
      v8 = self->_preferredSceneDeactivationReasonValue;
      self->_preferredSceneDeactivationReasonValue = v7;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained remoteTransientOverlayHostViewControllerDidChangePreferredSceneDeactivationReasonValue:self];
      }

      int v4 = v10;
    }
  }
}

- (void)_participateInSystemAnimationFence:(id)a3
{
  if (a3) {
    objc_msgSend(MEMORY[0x1E4F42D58], "_synchronizeDrawingWithFence:");
  }
  else {
    [MEMORY[0x1E4F42D58] _synchronizeDrawing];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  v3 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v3, "sb_becomeFirstResponder");

  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  return [(SBRemoteTransientOverlayHostViewController *)&v5 becomeFirstResponder];
}

- (BOOL)canResignFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  v3 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v3, "sb_resignFirstResponder");

  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  return [(SBRemoteTransientOverlayHostViewController *)&v5 resignFirstResponder];
}

- (int64_t)preferredStatusBarStyle
{
  if (self->_preferredStatusBarStyleValue)
  {
    preferredStatusBarStyleValue = self->_preferredStatusBarStyleValue;
    return [(NSNumber *)preferredStatusBarStyleValue integerValue];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBRemoteTransientOverlayHostViewController;
    return [(_UIRemoteViewController *)&v4 preferredStatusBarStyle];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  -[_UIRemoteViewController viewDidAppear:](&v8, sel_viewDidAppear_);
  char v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    objc_super v10 = self;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ animated: %{BOOL}u", buf, 0x1Cu);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  -[_UIRemoteViewController viewDidDisappear:](&v8, sel_viewDidDisappear_);
  char v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    objc_super v10 = self;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ animated: %{BOOL}u", buf, 0x1Cu);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  -[_UIRemoteViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  char v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    objc_super v10 = self;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ animated: %{BOOL}u", buf, 0x1Cu);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  -[_UIRemoteViewController viewWillDisappear:](&v8, sel_viewWillDisappear_);
  char v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    objc_super v10 = self;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ animated: %{BOOL}u", buf, 0x1Cu);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRemoteTransientOverlayHostViewController;
  id v4 = a3;
  [(_UIRemoteViewController *)&v6 viewServiceDidTerminateWithError:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayHostViewController:didTerminateWithError:", self, v4, v6.receiver, v6.super_class);
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34A3BF0];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F35B1988];
}

- (void)_updateContentOverlayInsetsFromParentIfNecessary
{
  if (!self->_shouldIgnoreContentOverlayInsetUpdates)
  {
    v2.receiver = self;
    v2.super_class = (Class)SBRemoteTransientOverlayHostViewController;
    [(SBRemoteTransientOverlayHostViewController *)&v2 _updateContentOverlayInsetsFromParentIfNecessary];
  }
}

- (int)_preferredStatusBarVisibility
{
  int result = self->_preferredStatusBarVisibility;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBRemoteTransientOverlayHostViewController;
    return [(_UIRemoteViewController *)&v4 _preferredStatusBarVisibility];
  }
  return result;
}

- (void)setShouldIgnoreContentOverlayInsetUpdates:(BOOL)a3
{
  if (self->_shouldIgnoreContentOverlayInsetUpdates != a3)
  {
    self->_shouldIgnoreContentOverlayInsetUpdates = a3;
    if (!a3)
    {
      v3.receiver = self;
      v3.super_class = (Class)SBRemoteTransientOverlayHostViewController;
      [(SBRemoteTransientOverlayHostViewController *)&v3 _updateContentOverlayInsetsFromParentIfNecessary];
    }
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v7 legacyAlertOptions];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = objc_msgSend(v8, "bs_safeDictionaryForKey:", *MEMORY[0x1E4FA7208]);
    if (v10)
    {
      __int16 v11 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
      [v11 setUserInfo:v10];
    }
    if (objc_msgSend(v9, "bs_BOOLForKey:", *MEMORY[0x1E4FA7218])) {
      [(SBRemoteTransientOverlayHostViewController *)self setWallpaperTunnelActive:1];
    }
    if (objc_msgSend(v9, "bs_BOOLForKey:", *MEMORY[0x1E4FA71C8])) {
      [(SBRemoteTransientOverlayHostViewController *)self setAllowsMenuButtonDismissal:1];
    }
    v27 = (void *)v10;
    if (objc_msgSend(v9, "bs_BOOLForKey:", *MEMORY[0x1E4FA71A8])) {
      [(SBRemoteTransientOverlayHostViewController *)self setAllowsAlertItems:1];
    }
    v12 = objc_msgSend(v9, "bs_safeNumberForKey:", *MEMORY[0x1E4FA71D0]);
    __int16 v13 = v12;
    if (v12) {
      -[SBRemoteTransientOverlayHostViewController setDismissalAnimationStyle:](self, "setDismissalAnimationStyle:", [v12 integerValue]);
    }
    BOOL v14 = objc_msgSend(v9, "bs_safeNumberForKey:", *MEMORY[0x1E4FA7200]);
    uint64_t v15 = v14;
    if (v14) {
      -[SBRemoteTransientOverlayHostViewController setSwipeDismissalStyle:](self, "setSwipeDismissalStyle:", [v14 integerValue]);
    }
    v16 = objc_msgSend(v9, "bs_safeNumberForKey:", *MEMORY[0x1E4FA71E8]);
    v17 = v16;
    if (v16) {
      -[SBRemoteTransientOverlayHostViewController setLaunchingInterfaceOrientation:](self, "setLaunchingInterfaceOrientation:", [v16 integerValue]);
    }
    v18 = objc_msgSend(v9, "bs_safeNumberForKey:", *MEMORY[0x1E4FA71D8]);
    if (v18)
    {
      objc_storeStrong((id *)&self->_hasTranslucentContentValue, v18);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained remoteTransientOverlayHostViewControllerDidChangeContentOpaque:self];
    }
    v20 = objc_msgSend(v9, "bs_safeNumberForKey:", *MEMORY[0x1E4FA71E0]);
    v21 = v20;
    if (v20) {
      -[SBRemoteTransientOverlayHostViewController setWallpaperStyle:withDuration:](self, "setWallpaperStyle:withDuration:", [v20 integerValue], 0.0);
    }
    if (objc_msgSend(v9, "bs_BOOLForKey:", *MEMORY[0x1E4FA71C0])) {
      [(SBRemoteTransientOverlayHostViewController *)self setShouldDisableFadeInAnimation:1];
    }
    if (objc_msgSend(v9, "bs_BOOLForKey:", *MEMORY[0x1E4FA71F8])) {
      [(SBRemoteTransientOverlayHostViewController *)self setAllowsSiri:0];
    }
    v22 = objc_msgSend(v9, "bs_safeNumberForKey:", *MEMORY[0x1E4FA71F0]);
    if (v22)
    {
      objc_storeStrong((id *)&self->_preferredStatusBarStyleValue, v22);
      [(SBRemoteTransientOverlayHostViewController *)self setNeedsStatusBarAppearanceUpdate];
    }
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __78__SBRemoteTransientOverlayHostViewController_configureWithContext_completion___block_invoke;
  v30[3] = &unk_1E6AF5DA8;
  id v31 = v6;
  id v23 = v6;
  v24 = (void *)MEMORY[0x1D948C7A0](v30);
  v25 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:v24];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __78__SBRemoteTransientOverlayHostViewController_configureWithContext_completion___block_invoke_3;
  v28[3] = &unk_1E6AF5300;
  id v29 = v24;
  id v26 = v24;
  [v25 configureWithContext:v7 completion:v28];
}

void __78__SBRemoteTransientOverlayHostViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  BSDispatchMain();
}

uint64_t __78__SBRemoteTransientOverlayHostViewController_configureWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __78__SBRemoteTransientOverlayHostViewController_configureWithContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepareForActivationWithContext:(id)a3 presentationMode:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v9 activityContinuationIdentifier];
  if (v10)
  {
    __int16 v11 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
    [v11 noteActivatedForActivityContinuationWithIdentifier:v10];
  }
  v12 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v12 noteActivatedWithPresentationMode:a4];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __106__SBRemoteTransientOverlayHostViewController_prepareForActivationWithContext_presentationMode_completion___block_invoke;
  v19[3] = &unk_1E6AF5DA8;
  id v20 = v8;
  id v13 = v8;
  BOOL v14 = (void *)MEMORY[0x1D948C7A0](v19);
  uint64_t v15 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:v14];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __106__SBRemoteTransientOverlayHostViewController_prepareForActivationWithContext_presentationMode_completion___block_invoke_3;
  v17[3] = &unk_1E6AF5300;
  id v18 = v14;
  id v16 = v14;
  [v15 prepareForActivationWithContext:v9 completion:v17];
}

void __106__SBRemoteTransientOverlayHostViewController_prepareForActivationWithContext_presentationMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  BSDispatchMain();
}

uint64_t __106__SBRemoteTransientOverlayHostViewController_prepareForActivationWithContext_presentationMode_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __106__SBRemoteTransientOverlayHostViewController_prepareForActivationWithContext_presentationMode_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)preserveInputViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v4, "sb_preserveInputViewsAnimated:", v3);
}

- (void)restoreInputViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v4, "sb_restoreInputViewsAnimated:", v3);
}

- (void)presentForTransientOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  if ([(SBRemoteTransientOverlayHostViewController *)self allowsCustomPresentationDismissalAnimations])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92__SBRemoteTransientOverlayHostViewController_presentForTransientOverlayAnimated_completion___block_invoke;
    v12[3] = &unk_1E6AF5DA8;
    id v13 = v6;
    uint64_t v7 = MEMORY[0x1D948C7A0](v12);
    id v8 = (void *)v7;
    if (v4)
    {
      id v9 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:v7];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __92__SBRemoteTransientOverlayHostViewController_presentForTransientOverlayAnimated_completion___block_invoke_3;
      v10[3] = &unk_1E6AF5300;
      id v11 = v8;
      objc_msgSend(v9, "sb_presentForAlertAnimated:completion:", 1, v10);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

void __92__SBRemoteTransientOverlayHostViewController_presentForTransientOverlayAnimated_completion___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  BSDispatchMain();
}

uint64_t __92__SBRemoteTransientOverlayHostViewController_presentForTransientOverlayAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __92__SBRemoteTransientOverlayHostViewController_presentForTransientOverlayAnimated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissForTransientOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  if ([(SBRemoteTransientOverlayHostViewController *)self allowsCustomPresentationDismissalAnimations])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92__SBRemoteTransientOverlayHostViewController_dismissForTransientOverlayAnimated_completion___block_invoke;
    v12[3] = &unk_1E6AF5DA8;
    id v13 = v6;
    uint64_t v7 = MEMORY[0x1D948C7A0](v12);
    id v8 = (void *)v7;
    if (v4)
    {
      id v9 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:v7];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __92__SBRemoteTransientOverlayHostViewController_dismissForTransientOverlayAnimated_completion___block_invoke_3;
      v10[3] = &unk_1E6AF5300;
      id v11 = v8;
      objc_msgSend(v9, "sb_dismissForAlertAnimated:completion:", 1, v10);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

void __92__SBRemoteTransientOverlayHostViewController_dismissForTransientOverlayAnimated_completion___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  BSDispatchMain();
}

uint64_t __92__SBRemoteTransientOverlayHostViewController_dismissForTransientOverlayAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __92__SBRemoteTransientOverlayHostViewController_dismissForTransientOverlayAnimated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v5 handleButtonActions:v4];
}

- (BOOL)isContentOpaque
{
  hasTranslucentContentValue = self->_hasTranslucentContentValue;
  if (hasTranslucentContentValue) {
    LOBYTE(hasTranslucentContentValue) = ![(NSNumber *)hasTranslucentContentValue BOOLValue];
  }
  return (char)hasTranslucentContentValue;
}

- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  self->_windowedAccessoryCutoutFrameInScreen = a4;
  self->_attachedToWindowedAccessordouble y = a3;
  id v9 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  objc_msgSend(v9, "didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v8, x, y, width, height);
}

- (SBRemoteTransientOverlayHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBRemoteTransientOverlayHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return self->_allowsStackingOverlayContentAbove;
}

- (int64_t)requestedBackgroundStyle
{
  return self->_requestedBackgroundStyle;
}

- (BOOL)prefersWallpaperTunnelActive
{
  return self->_prefersWallpaperTunnelActive;
}

- (BOOL)shouldEnableFadeInAnimation
{
  return self->_shouldEnableFadeInAnimation;
}

- (void)setShouldEnableFadeInAnimation:(BOOL)a3
{
  self->_shouldEnableFadeInAnimation = a3;
}

- (BOOL)shouldEnableFadeOutAnimation
{
  return self->_shouldEnableFadeOutAnimation;
}

- (void)setShouldEnableFadeOutAnimation:(BOOL)a3
{
  self->_shouldEnableFadeOutAnimation = a3;
}

- (BOOL)allowsHomeButtonDismissal
{
  return self->_allowsHomeButtonDismissal;
}

- (unint64_t)preferredHardwareButtonEvents
{
  return self->_preferredHardwareButtonEvents;
}

- (int64_t)dismissalAnimationStyle
{
  return self->_dismissalAnimationStyle;
}

- (int64_t)swipeDismissalStyle
{
  return self->_swipeDismissalStyle;
}

- (NSNumber)preferredSceneDeactivationReasonValue
{
  return self->_preferredSceneDeactivationReasonValue;
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  return self->_preferredBackgroundActivitiesToSuppress;
}

- (BOOL)shouldDisableOrientationUpdates
{
  return self->_shouldDisableOrientationUpdates;
}

- (BOOL)allowsCustomPresentationDismissalAnimations
{
  return self->_allowsCustomPresentationDismissalAnimations;
}

- (void)setAllowsCustomPresentationDismissalAnimations:(BOOL)a3
{
  self->_allowsCustomPresentationDismissalAnimations = a3;
}

- (BOOL)shouldIgnoreContentOverlayInsetUpdates
{
  return self->_shouldIgnoreContentOverlayInsetUpdates;
}

- (BOOL)shouldDisableBanners
{
  return self->_shouldDisableBanners;
}

- (BOOL)shouldDisableControlCenter
{
  return self->_shouldDisableControlCenter;
}

- (BOOL)shouldDisableReachability
{
  return self->_shouldDisableReachability;
}

- (BOOL)shouldDisableInteractiveScreenshotGesture
{
  return self->_shouldDisableInteractiveScreenshotGesture;
}

- (BOOL)shouldDisableSiri
{
  return self->_shouldDisableSiri;
}

- (BOOL)shouldPendAlertItems
{
  return self->_shouldPendAlertItems;
}

- (BOOL)isAttachedToWindowedAccessory
{
  return self->_attachedToWindowedAccessory;
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  double x = self->_windowedAccessoryCutoutFrameInScreen.origin.x;
  double y = self->_windowedAccessoryCutoutFrameInScreen.origin.y;
  double width = self->_windowedAccessoryCutoutFrameInScreen.size.width;
  double height = self->_windowedAccessoryCutoutFrameInScreen.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredBackgroundActivitiesToSuppress, 0);
  objc_storeStrong((id *)&self->_preferredSceneDeactivationReasonValue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hasTranslucentContentValue, 0);
  objc_storeStrong((id *)&self->_preferredStatusBarStyleValue, 0);
}

@end