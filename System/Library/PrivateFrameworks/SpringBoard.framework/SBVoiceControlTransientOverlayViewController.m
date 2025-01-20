@interface SBVoiceControlTransientOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)handleHomeButtonPress;
- (BOOL)isVoiceControlLoggingEnabled;
- (BOOL)prefersEmbeddedDisplayPresentation;
- (BOOL)prefersProximityDetectionEnabled;
- (BOOL)resignFirstResponder;
- (BOOL)shouldAllowSensitiveActions;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutorotate;
- (BOOL)shouldDisableHandlerActions;
- (BOOL)shouldDisableOrientationUpdates;
- (BOOL)shouldDisableVoiceControlForBluetoothRequests;
- (NSArray)nextRecognitionAudioInputPaths;
- (NSString)coverSheetIdentifier;
- (SBVoiceControlTransientOverlayViewController)initWithSource:(id)a3;
- (SBVoiceControlTransientOverlayViewControllerDelegate)voiceControlDelegate;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForScreenEdgesDeferringSystemGestures;
- (id)newTransientOverlayDismissalTransitionCoordinator;
- (id)newTransientOverlayPresentationTransitionCoordinator;
- (int)_preferredStatusBarVisibility;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredLockedGestureDismissalStyle;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredUnlockedGestureDismissalStyle;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)restrictedCapabilities;
- (unint64_t)supportedInterfaceOrientations;
- (void)beginIgnoringAppearanceUpdates;
- (void)dealloc;
- (void)endIgnoringAppearanceUpdates;
- (void)handleHeadsetButtonUpFromButtonDownSource:(BOOL)a3;
- (void)resetSessionWithSource:(id)a3;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setNextRecognitionAudioInputPaths:(id)a3;
- (void)setShouldAllowSensitiveActions:(BOOL)a3;
- (void)setShouldDisableHandlerActions:(BOOL)a3;
- (void)setShouldDisableVoiceControlForBluetoothRequests:(BOOL)a3;
- (void)setVoiceControlDelegate:(id)a3;
- (void)setVoiceControlLoggingEnabled:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)voiceControlViewControllerRequestsDismissal:(id)a3;
@end

@implementation SBVoiceControlTransientOverlayViewController

- (SBVoiceControlTransientOverlayViewController)initWithSource:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  v5 = [(SBTransientOverlayViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = [[SBVoiceControlViewController alloc] initWithSource:v4];
    contentViewController = v5->_contentViewController;
    v5->_contentViewController = v6;

    [(SBVoiceControlViewController *)v5->_contentViewController setVoiceControlDelegate:v5];
    [(SBVoiceControlViewController *)v5->_contentViewController setInterfaceOrientation:[(SBTransientOverlayViewController *)v5 containerOrientation]];
  }

  return v5;
}

- (void)dealloc
{
  v3 = [(SBVoiceControlViewController *)self->_contentViewController parentViewController];

  if (v3 == self)
  {
    [(SBVoiceControlViewController *)self->_contentViewController willMoveToParentViewController:0];
    if ([(SBVoiceControlViewController *)self->_contentViewController isViewLoaded])
    {
      id v4 = [(SBVoiceControlViewController *)self->_contentViewController view];
      [v4 removeFromSuperview];
    }
    [(SBVoiceControlViewController *)self->_contentViewController removeFromParentViewController];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v5 dealloc];
}

- (BOOL)becomeFirstResponder
{
  return [(SBVoiceControlViewController *)self->_contentViewController becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return [(SBVoiceControlViewController *)self->_contentViewController canBecomeFirstResponder];
}

- (BOOL)canResignFirstResponder
{
  return [(SBVoiceControlViewController *)self->_contentViewController canResignFirstResponder];
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return [(SBVoiceControlViewController *)self->_contentViewController preferredInterfaceOrientationForPresentation];
}

- (int64_t)preferredStatusBarStyle
{
  return [(SBVoiceControlViewController *)self->_contentViewController preferredStatusBarStyle];
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return [(SBVoiceControlViewController *)self->_contentViewController preferredWhitePointAdaptivityStyle];
}

- (BOOL)resignFirstResponder
{
  return [(SBVoiceControlViewController *)self->_contentViewController resignFirstResponder];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleTransientOverlay")) {
    return 1;
  }
  contentViewController = self->_contentViewController;
  return [(SBVoiceControlViewController *)contentViewController shouldAutorotate];
}

- (unint64_t)supportedInterfaceOrientations
{
  return [(SBVoiceControlViewController *)self->_contentViewController supportedInterfaceOrientations];
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_contentViewController;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_contentViewController;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidAppear:](&v11, sel_viewDidAppear_);
  BOOL v6 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  v7 = SBLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      objc_super v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);
    }
    [(SBVoiceControlViewController *)self->_contentViewController viewDidAppear:v3];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v11, sel_viewDidDisappear_);
  BOOL v6 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  WeakRetained = SBLogCommon();
  BOOL v8 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      objc_super v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1D85BA000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1D85BA000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);
    }
    [(SBVoiceControlViewController *)self->_contentViewController viewDidDisappear:v3];
    WeakRetained = objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
    [WeakRetained voiceControlTransientOverlayViewControllerDidDisappear:self];
  }
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v22 viewDidLayoutSubviews];
  BOOL v3 = [(SBTransientOverlayViewController *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(SBVoiceControlViewController *)self->_contentViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(SBTransientOverlayViewController *)self backgroundView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:", v15, v17, v19, v21);
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v8 viewDidLoad];
  BOOL v3 = (_UIBackdropView *)[objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:-2];
  backdropView = self->_backdropView;
  self->_backdropView = v3;

  double v5 = [(SBTransientOverlayViewController *)self backgroundView];
  [v5 addSubview:self->_backdropView];

  double v6 = [(SBTransientOverlayViewController *)self contentView];
  [(SBVoiceControlTransientOverlayViewController *)self addChildViewController:self->_contentViewController];
  double v7 = [(SBVoiceControlViewController *)self->_contentViewController view];
  [v6 addSubview:v7];

  [(SBVoiceControlViewController *)self->_contentViewController didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBVoiceControlTransientOverlayViewController viewWillAppear:](&v11, sel_viewWillAppear_);
  BOOL v6 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  double v7 = SBLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      double v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      double v15 = v9;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      double v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      double v15 = v10;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);
    }
    [(SBVoiceControlViewController *)self->_contentViewController viewWillAppear:v3];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBVoiceControlTransientOverlayViewController viewWillDisappear:](&v11, sel_viewWillDisappear_);
  BOOL v6 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  double v7 = SBLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      double v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      double v15 = v9;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      double v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      double v15 = v10;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);
    }
    [(SBVoiceControlViewController *)self->_contentViewController viewWillDisappear:v3];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int)_preferredStatusBarVisibility
{
  return [(SBVoiceControlViewController *)self->_contentViewController _preferredStatusBarVisibility];
}

- (void)beginIgnoringAppearanceUpdates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  v6.receiver = self;
  v6.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v6 beginIgnoringAppearanceUpdates];
  BOOL v4 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  if (!v3 && v4)
  {
    double v5 = SBLogCommon();
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
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  v9.receiver = self;
  v9.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v9 endIgnoringAppearanceUpdates];
  BOOL v4 = [(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates];
  if (v3 && !v4)
  {
    unsigned int v5 = [(SBVoiceControlViewController *)self->_contentViewController _appearState];
    unsigned int v6 = [(SBVoiceControlTransientOverlayViewController *)self _appearState];
    double v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      objc_super v11 = self;
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      __int16 v14 = 2048;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ended ignoring appearance changes. Content appear state: %td, container appear state: %td", buf, 0x20u);
    }

    if (v6 != v5)
    {
      if (v6 - 1 < 2)
      {
        if (v5 - 3 <= 0xFFFFFFFD) {
          [(SBVoiceControlViewController *)self->_contentViewController viewWillAppear:0];
        }
        if (v6 == 2) {
          [(SBVoiceControlViewController *)self->_contentViewController viewDidAppear:0];
        }
      }
      else if (v6 == 3 || !v6)
      {
        if (v5 && v5 != 3) {
          [(SBVoiceControlViewController *)self->_contentViewController viewWillDisappear:0];
        }
        if (!v6)
        {
          [(SBVoiceControlViewController *)self->_contentViewController viewDidDisappear:0];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
          [WeakRetained voiceControlTransientOverlayViewControllerDidDisappear:self];
        }
      }
    }
  }
}

- (BOOL)handleHomeButtonPress
{
  return [(SBVoiceControlViewController *)self->_contentViewController handleHomeButtonPress];
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  BOOL v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = dispatch_group_create();
  uint64_t v5 = [v3 isAnimated];
  if (v5)
  {
    dispatch_group_enter(v4);
    unsigned int v6 = (void *)MEMORY[0x1E4F42FF0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
    v18[3] = &unk_1E6AF5290;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    id v19 = v7;
    uint64_t v20 = v8;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
    v16[3] = &unk_1E6AF4A98;
    v16[4] = v8;
    double v17 = v4;
    [v6 animateWithDuration:v18 animations:v16 completion:0.3];
  }
  else
  {
    [v3 performAlongsideTransitions];
  }
  dispatch_group_enter(v4);
  objc_super v9 = *(void **)(*(void *)(a1 + 32) + 1408);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4;
  v14[3] = &unk_1E6AF5350;
  uint64_t v15 = v4;
  double v10 = v4;
  [v9 performDismissalTransitionAnimated:v5 completionHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5;
  v12[3] = &unk_1E6AF4AC0;
  id v13 = v3;
  id v11 = v3;
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], v12);
}

uint64_t __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) performAlongsideTransitions];
  v2 = *(void **)(*(void *)(a1 + 40) + 1400);
  return [v2 transitionToPrivateStyle:-2];
}

void __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1400) transitionComplete];
  v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4(uint64_t a1)
{
}

uint64_t __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  id v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = dispatch_group_create();
  uint64_t v5 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:2040];
  unsigned int v6 = [MEMORY[0x1E4F428B8] colorWithRed:0.031372549 green:0.262745098 blue:0.560784314 alpha:1.0];
  [v5 setColorTint:v6];

  uint64_t v7 = [v3 isAnimated];
  uint64_t v8 = *(id **)(a1 + 32);
  if (v7)
  {
    objc_super v9 = [v8 contentView];
    double v10 = (void *)MEMORY[0x1E4F42FF0];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v30[3] = &unk_1E6AF4AC0;
    id v11 = v9;
    id v31 = v11;
    [v10 performWithoutAnimation:v30];
    dispatch_group_enter(v4);
    __int16 v12 = (void *)MEMORY[0x1E4F42FF0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v25[3] = &unk_1E6AF59B8;
    id v13 = v3;
    uint64_t v14 = *(void *)(a1 + 32);
    id v26 = v13;
    uint64_t v27 = v14;
    id v28 = v5;
    id v29 = v11;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
    v23[3] = &unk_1E6AF4A98;
    v23[4] = *(void *)(a1 + 32);
    v24 = v4;
    id v15 = v11;
    [v12 animateWithDuration:v25 animations:v23 completion:0.3];
  }
  else
  {
    [v8[175] transitionToSettings:v5];
    [*(id *)(*(void *)(a1 + 32) + 1400) transitionComplete];
    [v3 performAlongsideTransitions];
  }
  dispatch_group_enter(v4);
  uint64_t v16 = *(void **)(*(void *)(a1 + 32) + 1408);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5;
  v21[3] = &unk_1E6AF5350;
  objc_super v22 = v4;
  double v17 = v4;
  [v16 performPresentationTransitionAnimated:v7 completionHandler:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_6;
  v19[3] = &unk_1E6AF4AC0;
  id v20 = v3;
  id v18 = v3;
  dispatch_group_notify(v17, MEMORY[0x1E4F14428], v19);
}

uint64_t __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) performAlongsideTransitions];
  [*(id *)(*(void *)(a1 + 40) + 1400) transitionToSettings:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 56);
  return [v2 setAlpha:1.0];
}

void __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1400) transitionComplete];
  v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5(uint64_t a1)
{
}

uint64_t __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return 1;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return 1;
}

- (BOOL)prefersProximityDetectionEnabled
{
  return [(SBVoiceControlViewController *)self->_contentViewController prefersProximityDetectionEnabled];
}

- (void)setContainerOrientation:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v3 setContainerOrientation:a3];
}

- (BOOL)shouldDisableOrientationUpdates
{
  return 1;
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (int64_t)idleTimerDuration
{
  return 10;
}

- (int64_t)idleTimerMode
{
  return 0;
}

- (int64_t)idleWarnMode
{
  return 1;
}

- (void)voiceControlViewControllerRequestsDismissal:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
  [WeakRetained voiceControlTransientOverlayViewControllerRequestsDismissal:self];
}

- (BOOL)isVoiceControlLoggingEnabled
{
  return [(SBVoiceControlViewController *)self->_contentViewController isVoiceControlLoggingEnabled];
}

- (NSArray)nextRecognitionAudioInputPaths
{
  return [(SBVoiceControlViewController *)self->_contentViewController nextRecognitionAudioInputPaths];
}

- (void)setNextRecognitionAudioInputPaths:(id)a3
{
}

- (void)setShouldAllowSensitiveActions:(BOOL)a3
{
}

- (void)setShouldDisableHandlerActions:(BOOL)a3
{
}

- (void)setShouldDisableVoiceControlForBluetoothRequests:(BOOL)a3
{
}

- (void)setVoiceControlLoggingEnabled:(BOOL)a3
{
}

- (BOOL)shouldAllowSensitiveActions
{
  return [(SBVoiceControlViewController *)self->_contentViewController shouldAllowSensitiveActions];
}

- (BOOL)shouldDisableHandlerActions
{
  return [(SBVoiceControlViewController *)self->_contentViewController shouldDisableHandlerActions];
}

- (BOOL)shouldDisableVoiceControlForBluetoothRequests
{
  return [(SBVoiceControlViewController *)self->_contentViewController shouldDisableVoiceControlForBluetoothRequests];
}

- (void)handleHeadsetButtonUpFromButtonDownSource:(BOOL)a3
{
}

- (void)resetSessionWithSource:(id)a3
{
}

- (SBVoiceControlTransientOverlayViewControllerDelegate)voiceControlDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
  return (SBVoiceControlTransientOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setVoiceControlDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voiceControlDelegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end