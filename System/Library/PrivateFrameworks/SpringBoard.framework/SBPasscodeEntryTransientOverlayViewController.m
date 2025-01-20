@interface SBPasscodeEntryTransientOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeLocalFirstResponder;
- (BOOL)dismissesSiriForPresentation;
- (BOOL)isContentOpaque;
- (BOOL)prefersEmbeddedDisplayPresentation;
- (BOOL)shouldAutorotate;
- (BOOL)showEmergencyCallButton;
- (BOOL)useBiometricPresentation;
- (NSString)unlockDestination;
- (SBPasscodeEntryTransientOverlayViewController)initWithAuthenticationController:(id)a3;
- (SBPasscodeEntryTransientOverlayViewControllerDelegate)delegate;
- (id)newTransientOverlayDismissalTransitionCoordinator;
- (id)newTransientOverlayPresentationTransitionCoordinator;
- (id)preferredDisplayLayoutElementIdentifier;
- (int)_preferredStatusBarVisibility;
- (int)intent;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)overridePresentationOrientation;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_attemptUnlock:(id)a3 passcode:(id)a4;
- (void)_passcodeLockViewPasscodeEntered:(id)a3 authenticationType:(unint64_t)a4;
- (void)_updatePrototypeSettings;
- (void)handleFailedAuthenticationRequest:(id)a3 error:(id)a4;
- (void)handleInvalidAuthenticationRequest:(id)a3;
- (void)handleSuccessfulAuthenticationRequest:(id)a3;
- (void)handleWillShowKeyboard:(BOOL)a3;
- (void)passcodeLockViewCancelButtonPressed:(id)a3;
- (void)passcodeLockViewEmergencyCallButtonPressed:(id)a3;
- (void)passcodeLockViewPasscodeDidChange:(id)a3;
- (void)passcodeLockViewPasscodeEntered:(id)a3;
- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissesSiriForPresentation:(BOOL)a3;
- (void)setIntent:(int)a3;
- (void)setOverridePresentationOrientation:(int64_t)a3;
- (void)setShowEmergencyCallButton:(BOOL)a3;
- (void)setUnlockDestination:(id)a3;
- (void)setUseBiometricPresentation:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBPasscodeEntryTransientOverlayViewController

- (SBPasscodeEntryTransientOverlayViewController)initWithAuthenticationController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  v6 = [(SBTransientOverlayViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_authenticationController, a3);
    v7->_intent = 2;
    v7->_overridePresentationOrientation = 0;
    v9.receiver = v7;
    v9.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
    v7->_dismissesSiriForPresentation = [(SBTransientOverlayViewController *)&v9 dismissesSiriForPresentation];
  }

  return v7;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
    return [(SBTransientOverlayViewController *)&v6 preferredInterfaceOrientationForPresentation];
  }
  else if (self->_overridePresentationOrientation <= 1uLL)
  {
    return 1;
  }
  else
  {
    return self->_overridePresentationOrientation;
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
    return [(SBTransientOverlayViewController *)&v7 supportedInterfaceOrientations];
  }
  else
  {
    unint64_t overridePresentationOrientation = self->_overridePresentationOrientation;
    if (overridePresentationOrientation)
    {
      if (overridePresentationOrientation <= 2) {
        return 2;
      }
      else {
        return 24;
      }
    }
    else
    {
      return 2;
    }
  }
}

- (BOOL)shouldAutorotate
{
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  return [(SBTransientOverlayViewController *)&v6 shouldAutorotate];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v5 viewDidDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passcodeEntryTransientOverlayViewControllerDidDisappear:self];
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v5 viewDidLayoutSubviews];
  passcodeView = self->_passcodeView;
  uint64_t v4 = [(SBTransientOverlayViewController *)self contentView];
  [v4 bounds];
  -[SBUIPasscodeViewWithLockScreenStyle setFrame:](passcodeView, "setFrame:");
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v25 viewDidLoad];
  v3 = [(SBTransientOverlayViewController *)self contentView];
  [v3 bounds];
  v8 = -[SBUIPasscodeViewWithLockScreenStyle initWithFrame:includeBlur:passcodeViewGenerator:]([SBUIPasscodeViewWithLockScreenStyle alloc], "initWithFrame:includeBlur:passcodeViewGenerator:", 1, &__block_literal_global_201, v4, v5, v6, v7);
  passcodeView = self->_passcodeView;
  self->_passcodeView = v8;

  objc_super v10 = [(SBUIPasscodeViewWithLockScreenStyle *)self->_passcodeView passcodeView];
  [v10 setDelegate:self];
  [v10 setShowsEmergencyCallButton:self->_showEmergencyCallButton];
  [v10 setUnlockDestination:self->_unlockDestination];
  [v10 setUsesBiometricPresentation:self->_useBiometricPresentation];
  uint64_t v11 = 0;
  uint64_t v12 = SBFEffectiveArtworkSubtype();
  if (v12 > 2795)
  {
    if (v12 != 2796 && v12 != 2868) {
      goto LABEL_7;
    }
  }
  else if (v12 != 2556 && v12 != 2622)
  {
LABEL_7:
    uint64_t v11 = 1;
  }
  [v10 setShowsProudLock:v11];
  if ([v10 supportsPoseidonCoaching])
  {
    v13 = (CSPoseidonViewController *)objc_alloc_init(MEMORY[0x1E4F5E440]);
    poseidonViewController = self->_poseidonViewController;
    self->_poseidonViewController = v13;

    v15 = self->_poseidonViewController;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __60__SBPasscodeEntryTransientOverlayViewController_viewDidLoad__block_invoke_2;
    v22 = &unk_1E6AF53D0;
    id v23 = v10;
    v24 = self;
    [(SBPasscodeEntryTransientOverlayViewController *)self bs_addChildViewController:v15 animated:0 transitionBlock:&v19];
  }
  objc_msgSend(v3, "addSubview:", self->_passcodeView, v19, v20, v21, v22);
  v16 = [MEMORY[0x1E4F5E408] rootSettings];
  v17 = [v16 pearlSettings];
  pearlSettings = self->_pearlSettings;
  self->_pearlSettings = v17;

  [(CSLockScreenPearlSettings *)self->_pearlSettings addKeyObserver:self];
  [(SBPasscodeEntryTransientOverlayViewController *)self _updatePrototypeSettings];
}

uint64_t __60__SBPasscodeEntryTransientOverlayViewController_viewDidLoad__block_invoke()
{
  return [MEMORY[0x1E4FA7CC0] passcodeLockViewForUsersCurrentStyle];
}

void __60__SBPasscodeEntryTransientOverlayViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  double v4 = *(void **)(*(void *)(a1 + 40) + 1440);
  v8 = a2;
  double v5 = [v4 view];
  [v3 setPoseidonContainerView:v5];

  double v6 = *(void **)(a1 + 32);
  double v7 = [*(id *)(*(void *)(a1 + 40) + 1440) poseidonContainerViewController];
  [v6 setPoseidonContainerViewController:v7];

  v8[2]();
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  [(SBPasscodeEntryTransientOverlayViewController *)&v11 viewWillAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained passcodeEntryTransientOverlayViewControllerDidDetectFaceOcclusionsSinceScreenOn:self])
  {
    double v5 = [(SBUIPasscodeViewWithLockScreenStyle *)self->_passcodeView passcodeView];
    [v5 noteFaceHasBeenOccluded];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained passcodeEntryTransientOverlayViewControllerDidDetectBottomFaceOcclusionsSinceScreenOn:self])
  {
    double v6 = [(SBUIPasscodeViewWithLockScreenStyle *)self->_passcodeView passcodeView];
    [v6 noteBottomFaceHasBeenOccluded];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [WeakRetained passcodeEntryTransientOverlayViewControllerStatusText];
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [WeakRetained passcodeEntryTransientOverlayViewControllerStatusSubtitleText];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v7 | v8)
  {
    objc_super v9 = [(SBUIPasscodeViewWithLockScreenStyle *)self->_passcodeView passcodeView];
    [v9 updateStatusText:v7 subtitle:v8 animated:0];
  }
  objc_super v10 = [(SBUIPasscodeViewWithLockScreenStyle *)self->_passcodeView passcodeView];
  [v10 becomeFirstResponder];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int)_preferredStatusBarVisibility
{
  if ([(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] != 1) {
    return 0;
  }
  v3 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
  int v4 = [v3 coachingActive];

  return v4;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  -[SBTransientOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  uint64_t v8 = [(SBUIPasscodeViewWithLockScreenStyle *)self->_passcodeView passcodeView];
  int v9 = [v8 supportsPoseidonCoaching];

  if (v9 && self->_keyboardVisible)
  {
    objc_super v10 = SBFWindowForViewControllerTransition();
    uint64_t v11 = [v10 _toWindowOrientation];
    if (v11 == 4 || v11 == 2)
    {
      uint64_t v12 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
      v13 = v12;
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v12 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
      v13 = v12;
      uint64_t v14 = 1;
    }
    [v12 showCoaching:v14];
  }
}

- (BOOL)isContentOpaque
{
  return 0;
}

- (BOOL)canBecomeLocalFirstResponder
{
  return 1;
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __98__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __98__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAnimated])
  {
    int v4 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
    double v5 = [MEMORY[0x1E4F4F680] settingsWithDuration:v4 timingFunction:0.4];
    double v6 = (void *)[v5 mutableCopy];

    CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v6, "setPreferredFrameRateRange:", *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
    [v6 setHighFrameRateReason:1114126];
    id v7 = (void *)MEMORY[0x1E4F4F898];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __98__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
    v11[3] = &unk_1E6AF5290;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v3;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __98__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
    v9[3] = &unk_1E6AF4A98;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v12;
    [v7 animateWithSettings:v6 actions:v11 completion:v9];
  }
  else
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 1424) passcodeView];
    [v8 resignFirstResponder];

    [v3 performAlongsideTransitions];
    [v3 completeTransition:1];
  }
}

uint64_t __98__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1424) setBlurEnabled:0];
  v2 = [*(id *)(*(void *)(a1 + 32) + 1424) passcodeView];
  [v2 setAlpha:0.0];

  id v3 = *(void **)(a1 + 40);
  return [v3 performAlongsideTransitions];
}

uint64_t __98__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1424) passcodeView];
  [v2 resignFirstResponder];

  id v3 = *(void **)(a1 + 40);
  return [v3 completeTransition:1];
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  id v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E6AF5378;
  v5[4] = self;
  [(SBTransientOverlayBlockTransitionCoordinator *)v3 setStartTransitionHandler:v5];
  return v3;
}

void __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAnimated])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v13[3] = &unk_1E6AF4AC0;
    v13[4] = *(void *)(a1 + 32);
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v13];
    int v4 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
    double v5 = [MEMORY[0x1E4F4F680] settingsWithDuration:v4 timingFunction:0.4];
    double v6 = (void *)[v5 mutableCopy];

    CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v6, "setPreferredFrameRateRange:", *(double *)&v14.minimum, *(double *)&v14.maximum, *(double *)&v14.preferred);
    [v6 setHighFrameRateReason:1114126];
    id v7 = (void *)MEMORY[0x1E4F4F898];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v11[3] = &unk_1E6AF5290;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v3;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
    v9[3] = &unk_1E6AF4A98;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v12;
    [v7 animateWithSettings:v6 actions:v11 completion:v9];
  }
  else
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 1424) passcodeView];
    [v8 becomeFirstResponder];

    [v3 performAlongsideTransitions];
    [v3 completeTransition:1];
  }
}

void __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1424) setBlurEnabled:0];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1424) passcodeView];
  [v2 setAlpha:0.0];
}

uint64_t __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1424) setBlurEnabled:1];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1424) passcodeView];
  [v2 setAlpha:1.0];

  id v3 = *(void **)(a1 + 40);
  return [v3 performAlongsideTransitions];
}

uint64_t __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1424) passcodeView];
  [v2 becomeFirstResponder];

  id v3 = *(void **)(a1 + 40);
  return [v3 completeTransition:1];
}

- (id)preferredDisplayLayoutElementIdentifier
{
  return (id)*MEMORY[0x1E4FA6F60];
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (void)handleSuccessfulAuthenticationRequest:(id)a3
{
  p_passcodeRequester = &self->_passcodeRequester;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeRequester);
  [WeakRetained resetForSuccess];

  self->_attemptingUnlock = 0;
  objc_storeWeak((id *)p_passcodeRequester, 0);
}

- (void)handleFailedAuthenticationRequest:(id)a3 error:(id)a4
{
  p_passcodeRequester = &self->_passcodeRequester;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeRequester);
  [WeakRetained resetForFailedPasscode];

  self->_attemptingUnlock = 0;
  objc_storeWeak((id *)p_passcodeRequester, 0);
}

- (void)handleInvalidAuthenticationRequest:(id)a3
{
}

- (void)handleWillShowKeyboard:(BOOL)a3
{
  if (self->_keyboardVisible != a3) {
    self->_keyboardVisible = a3;
  }
  if (a3)
  {
    uint64_t v4 = [(SBPasscodeEntryTransientOverlayViewController *)self interfaceOrientation];
    if (v4 == 4 || v4 == 2)
    {
      id v5 = [(CSPoseidonViewController *)self->_poseidonViewController poseidonContainerViewController];
      [v5 showCoaching:0];
    }
  }
}

- (int64_t)idleTimerDuration
{
  return 6;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleWarnMode
{
  return 1;
}

- (void)passcodeLockViewPasscodeDidChange:(id)a3
{
  id v4 = a3;
  [(SBTransientOverlayViewController *)self setNeedsIdleTimerReset];
  id v5 = [v4 passcode];

  uint64_t v6 = [v5 length];
  authenticationController = self->_authenticationController;
  if (v6)
  {
    [(SBFUserAuthenticationController *)authenticationController notePasscodeEntryBegan];
  }
  else
  {
    [(SBFUserAuthenticationController *)authenticationController notePasscodeEntryCancelled];
  }
}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
}

- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3
{
}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passcodeEntryTransientOverlayViewControllerRequestsDismissal:self];
  }
}

- (void)passcodeLockViewEmergencyCallButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passcodeEntryTransientOverlayViewControllerRequestsEmergencyCall:self];
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_pearlSettings == a3) {
    [(SBPasscodeEntryTransientOverlayViewController *)self _updatePrototypeSettings];
  }
}

- (void)setShowEmergencyCallButton:(BOOL)a3
{
  if (self->_showEmergencyCallButton != a3)
  {
    self->_showEmergencyCallButton = a3;
    id v4 = [(SBUIPasscodeViewWithLockScreenStyle *)self->_passcodeView passcodeView];
    [v4 setShowsEmergencyCallButton:self->_showEmergencyCallButton];
  }
}

- (void)setUnlockDestination:(id)a3
{
  id v4 = (NSString *)a3;
  unlockDestination = self->_unlockDestination;
  if (unlockDestination != v4)
  {
    id v10 = v4;
    BOOL v6 = [(NSString *)unlockDestination isEqualToString:v4];
    id v4 = v10;
    if (!v6)
    {
      id v7 = (NSString *)[(NSString *)v10 copy];
      uint64_t v8 = self->_unlockDestination;
      self->_unlockDestination = v7;

      int v9 = [(SBUIPasscodeViewWithLockScreenStyle *)self->_passcodeView passcodeView];
      [v9 setUnlockDestination:self->_unlockDestination];

      id v4 = v10;
    }
  }
}

- (void)setUseBiometricPresentation:(BOOL)a3
{
  if (self->_useBiometricPresentation != a3)
  {
    self->_useBiometricPresentation = a3;
    id v4 = [(SBUIPasscodeViewWithLockScreenStyle *)self->_passcodeView passcodeView];
    [v4 setUsesBiometricPresentation:self->_useBiometricPresentation];
  }
}

- (void)_attemptUnlock:(id)a3 passcode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v9 = [v7 length];
  [(SBFUserAuthenticationController *)self->_authenticationController addAsFirstResponder:self];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained passcodeEntryTransientOverlayViewController:self authenticatePasscode:v7])
  {
    [(SBFUserAuthenticationController *)self->_authenticationController removeResponder:self];
  }
  else
  {
    [(SBFUserAuthenticationController *)self->_authenticationController removeResponder:self];
    id v10 = objc_alloc(MEMORY[0x1E4FA5EA0]);
    if (v9) {
      uint64_t v11 = [v10 initForPasscode:v7 source:0];
    }
    else {
      uint64_t v11 = [v10 initForBiometricAuthenticationWithSource:0];
    }
    id v12 = (void *)v11;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __73__SBPasscodeEntryTransientOverlayViewController__attemptUnlock_passcode___block_invoke;
    v27[3] = &unk_1E6AF5290;
    id v13 = v6;
    id v28 = v13;
    v29 = self;
    CAFrameRateRange v14 = (void *)MEMORY[0x1D948C7A0](v27);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __73__SBPasscodeEntryTransientOverlayViewController__attemptUnlock_passcode___block_invoke_2;
    v24[3] = &unk_1E6AF5290;
    id v25 = v13;
    v26 = self;
    objc_super v15 = (void *)MEMORY[0x1D948C7A0](v24);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __73__SBPasscodeEntryTransientOverlayViewController__attemptUnlock_passcode___block_invoke_3;
    v22 = &unk_1E6AF5DA8;
    id v23 = v15;
    id v16 = v15;
    v17 = (void *)MEMORY[0x1D948C7A0](&v19);
    v18 = objc_msgSend(MEMORY[0x1E4FA6050], "responderWithSuccessHandler:failureHandler:invalidHandler:", v14, v17, v16, v19, v20, v21, v22);
    [(SBFUserAuthenticationController *)self->_authenticationController processAuthenticationRequest:v12 responder:v18];
  }
}

uint64_t __73__SBPasscodeEntryTransientOverlayViewController__attemptUnlock_passcode___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) resetForSuccess];
  *(unsigned char *)(*(void *)(a1 + 40) + 1400) = 0;
  return result;
}

uint64_t __73__SBPasscodeEntryTransientOverlayViewController__attemptUnlock_passcode___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) resetForFailedPasscode];
  *(unsigned char *)(*(void *)(a1 + 40) + 1400) = 0;
  return result;
}

uint64_t __73__SBPasscodeEntryTransientOverlayViewController__attemptUnlock_passcode___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_passcodeLockViewPasscodeEntered:(id)a3 authenticationType:(unint64_t)a4
{
  id v6 = a3;
  if (!self->_attemptingUnlock)
  {
    self->_attemptingUnlock = 1;
    dispatch_time_t v7 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__SBPasscodeEntryTransientOverlayViewController__passcodeLockViewPasscodeEntered_authenticationType___block_invoke;
    block[3] = &unk_1E6AF6FC0;
    unint64_t v11 = a4;
    id v9 = v6;
    id v10 = self;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
}

void __101__SBPasscodeEntryTransientOverlayViewController__passcodeLockViewPasscodeEntered_authenticationType___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 1)
  {
    id v2 = [*(id *)(a1 + 32) passcode];
  }
  else
  {
    id v2 = 0;
  }
  objc_storeWeak((id *)(*(void *)(a1 + 40) + 1416), *(id *)(a1 + 32));
  [*(id *)(a1 + 40) _attemptUnlock:*(void *)(a1 + 32) passcode:v2];
}

- (void)_updatePrototypeSettings
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  pearlSettings = self->_pearlSettings;
  if (pearlSettings) {
    [(CSLockScreenPearlSettings *)pearlSettings proudLockControllerViewControllerConfiguration];
  }
  id v4 = [(SBUIPasscodeViewWithLockScreenStyle *)self->_passcodeView passcodeView];
  v5[2] = v8;
  v5[3] = v9;
  v5[4] = v10;
  v5[0] = v6;
  v5[1] = v7;
  [v4 setProudLockConfiguration:v5];
}

- (BOOL)dismissesSiriForPresentation
{
  return self->_dismissesSiriForPresentation;
}

- (void)setDismissesSiriForPresentation:(BOOL)a3
{
  self->_dismissesSiriForPresentation = a3;
}

- (SBPasscodeEntryTransientOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPasscodeEntryTransientOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showEmergencyCallButton
{
  return self->_showEmergencyCallButton;
}

- (BOOL)useBiometricPresentation
{
  return self->_useBiometricPresentation;
}

- (NSString)unlockDestination
{
  return self->_unlockDestination;
}

- (int)intent
{
  return self->_intent;
}

- (void)setIntent:(int)a3
{
  self->_intent = a3;
}

- (int64_t)overridePresentationOrientation
{
  return self->_overridePresentationOrientation;
}

- (void)setOverridePresentationOrientation:(int64_t)a3
{
  self->_unint64_t overridePresentationOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockDestination, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_poseidonViewController, 0);
  objc_storeStrong((id *)&self->_pearlSettings, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_destroyWeak((id *)&self->_passcodeRequester);
  objc_storeStrong((id *)&self->_authenticationController, 0);
}

@end