@interface SBTransientOverlayDismissAllToAppsWorkspaceTransaction
- (BOOL)_shouldAnimateTransition;
- (BOOL)_shouldResignActiveForAnimation;
- (BOOL)_shouldUseSwitcherDismissalAnimationForTransientOverlayViewController:(id)a3;
- (BOOL)canInterruptForTransitionRequest:(id)a3;
- (SBTransientOverlayDismissAllToAppsWorkspaceTransaction)initWithTransitionRequest:(id)a3;
- (id)_setupAnimation;
- (unint64_t)_concurrentOverlayDismissalOptions;
- (unint64_t)_serialOverlayPreDismissalOptions;
- (void)_begin;
- (void)_didComplete;
- (void)_handleDismissOverlaysCompletion;
- (void)_logForInterruptAttemptReason:(id)a3;
- (void)_performDismissal;
- (void)dealloc;
@end

@implementation SBTransientOverlayDismissAllToAppsWorkspaceTransaction

- (SBTransientOverlayDismissAllToAppsWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBTransientOverlayDismissAllToAppsWorkspaceTransaction;
  v5 = [(SBToAppsWorkspaceTransaction *)&v11 initWithTransitionRequest:v4];
  v6 = v5;
  if (v5)
  {
    [(SBToAppsWorkspaceTransaction *)v5 _setShouldSerialDismissOverlays:0];
    if (SBMainWorkspaceTransitionSourceIsUserEventDriven([v4 source]))
    {
      v7 = [(SBToAppsWorkspaceTransaction *)v6 layoutTransaction];
      uint64_t v8 = [v7 options];

      v9 = [(SBToAppsWorkspaceTransaction *)v6 layoutTransaction];
      [v9 setOptions:v8 | 2];
    }
  }

  return v6;
}

- (void)dealloc
{
  [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction setCompletionBlock:0];
  [(BSInvalidatable *)self->_pipWindowLevelOverrideAssertionInvalidatable invalidate];
  pipWindowLevelOverrideAssertionInvalidatable = self->_pipWindowLevelOverrideAssertionInvalidatable;
  self->_pipWindowLevelOverrideAssertionInvalidatable = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayDismissAllToAppsWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v4 dealloc];
}

- (void)_begin
{
  v6.receiver = self;
  v6.super_class = (Class)SBTransientOverlayDismissAllToAppsWorkspaceTransaction;
  [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)&v6 _begin];
  [(SBToAppsWorkspaceTransaction *)self activateApplications];
  unint64_t v3 = [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self _serialOverlayPreDismissalOptions];
  if (+[SBDismissOverlaysAnimationController willDismissOverlaysForDismissOptions:v3])
  {
    [(SBToAppsWorkspaceTransaction *)self _delayTransitionCompletionForRequester:@"_SBTransientOverlayDismissAllToAppsWorkspaceTransactionDelayRequesterDismissOverlays"];
    objc_super v4 = [[SBDismissOverlaysAnimationController alloc] initWithTransitionContextProvider:self->super.super.super._transitionRequest options:v3];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__begin__block_invoke;
    v5[3] = &unk_1E6AF5350;
    v5[4] = self;
    [(SBDismissOverlaysAnimationController *)v4 setCompletionBlock:v5];
    [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self addChildTransaction:v4 withSchedulingPolicy:0];
  }
  else
  {
    [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self _handleDismissOverlaysCompletion];
  }
}

uint64_t __64__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__begin__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleDismissOverlaysCompletion];
  v2 = *(void **)(a1 + 32);
  return [v2 _stopDelayingTransitionCompletionForRequester:@"_SBTransientOverlayDismissAllToAppsWorkspaceTransactionDelayRequesterDismissOverlays"];
}

- (void)_didComplete
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(SBToAppsWorkspaceTransaction *)self _clearAnimation];
  [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction setCompletionBlock:0];
  [(BSInvalidatable *)self->_pipWindowLevelOverrideAssertionInvalidatable invalidate];
  pipWindowLevelOverrideAssertionInvalidatable = self->_pipWindowLevelOverrideAssertionInvalidatable;
  self->_pipWindowLevelOverrideAssertionInvalidatable = 0;

  objc_super v4 = (void *)[(NSArray *)self->_switcherTransitioningTransientOverlayViewControllers copy];
  switcherTransitioningTransientOverlayViewControllers = self->_switcherTransitioningTransientOverlayViewControllers;
  self->_switcherTransitioningTransientOverlayViewControllers = 0;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v11 endIgnoringAppearanceUpdates];
        [v11 endIgnoringContentOverlayInsetUpdates];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v12 = +[SBKeyboardFocusCoordinator sharedInstance];
  v13 = [(SBWorkspaceTransaction *)self windowScene];
  v14 = +[SBKeyboardFocusArbitrationReason transientOverlayDismissAllToAppsWorkspaceTransactionDidComplete];
  [v12 requestArbitrationForSBWindowScene:v13 forReason:v14];

  v15.receiver = self;
  v15.super_class = (Class)SBTransientOverlayDismissAllToAppsWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v15 _didComplete];
}

- (unint64_t)_serialOverlayPreDismissalOptions
{
  v2 = [(SBWorkspaceTransaction *)self transitionRequest];
  uint64_t v3 = [v2 source];

  if (v3 <= 5)
  {
    if (v3 != 2) {
      return v3 == 5;
    }
    return 32;
  }
  if (v3 == 6) {
    return 32;
  }
  unint64_t v4 = 2;
  if (v3 != 33) {
    unint64_t v4 = 0;
  }
  if (v3 == 16) {
    return 16;
  }
  else {
    return v4;
  }
}

- (unint64_t)_concurrentOverlayDismissalOptions
{
  v2 = [(SBWorkspaceTransaction *)self transitionRequest];
  uint64_t v3 = [v2 source];

  if (v3 == 2) {
    return 9;
  }
  else {
    return 0;
  }
}

- (id)_setupAnimation
{
  if (self->_isUsingSwitcherAnimation)
  {
    uint64_t v3 = [(SBWorkspaceTransaction *)self windowScene];
    unint64_t v4 = [v3 switcherController];

    v5 = [(SBWorkspaceTransaction *)self transitionRequest];
    id v6 = [v4 animationControllerForTransitionRequest:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)_shouldAnimateTransition
{
  v2 = [(SBWorkspaceTransaction *)self transitionRequest];
  uint64_t v3 = [v2 transientOverlayContext];
  char v4 = [v3 isAnimated];

  return v4;
}

- (BOOL)_shouldResignActiveForAnimation
{
  v10.receiver = self;
  v10.super_class = (Class)SBTransientOverlayDismissAllToAppsWorkspaceTransaction;
  if (![(SBToAppsWorkspaceTransaction *)&v10 _shouldResignActiveForAnimation]) {
    return 0;
  }
  uint64_t v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  char v4 = [v3 transientOverlayContext];
  v5 = [v4 transientOverlay];
  id v6 = [v5 viewController];
  uint64_t v7 = [v6 preferredSceneDeactivationReasonValue];
  BOOL v8 = v7 != 0;

  return v8;
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = SBSafeCast(v5, v4);
  uint64_t v7 = (void *)[v6 copyMainWorkspaceTransitionRequest];
  if (![(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self isInterrupted])
  {
    objc_super v10 = [v7 applicationContext];
    int v11 = [v10 isBackground];

    if (v11)
    {
      v12 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v12);
      [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  request is for background activation", v9, self];
      goto LABEL_13;
    }
    v13 = +[SBSetupManager sharedInstance];
    if ([v13 isInSetupMode])
    {
      v14 = +[SBSetupManager sharedInstance];
      char v15 = [v14 isInSetupModeReadyToExit];

      if ((v15 & 1) == 0)
      {
        long long v16 = (objc_class *)objc_opt_class();
        uint64_t v9 = NSStringFromClass(v16);
        [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because: we are in setup mode", v9, self];
        goto LABEL_13;
      }
    }
    else
    {
    }
    long long v17 = [(SBWorkspaceTransaction *)self transitionRequest];
    uint64_t v18 = [v17 source];

    if (v18 == 31)
    {
      long long v19 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v19);
      [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because: we are in a startup transition", v9, self];
      goto LABEL_13;
    }
    if (!self->_isUsingSwitcherAnimation && self->_beganDismissingTransientOverlays)
    {
      v23 = [(SBWorkspaceTransaction *)self transitionRequest];
      v24 = [v23 transientOverlayContext];
      uint64_t v9 = [v24 transientOverlay];

      v25 = [v4 transientOverlayContext];
      v26 = [v25 transientOverlay];

      if ([v9 isAnalogousToEntity:v26])
      {
        v27 = [v4 transientOverlayContext];
        uint64_t v28 = [v27 transitionType];

        if (!v28)
        {
          v34 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v34);
          [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> interruptible because:  next request is to present the same transient overlay we're currently dismissing", v33, self];
          goto LABEL_24;
        }
      }
      v29 = [v9 viewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = [v4 eventLabel];
        int v31 = [v30 isEqualToString:@"SBSpotlightTransientOverlayInteractiveGestureEventLabel"];

        if (v31)
        {
          v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> interruptible because:  we're dismissing the spotlight overlay and the next request is to present it interactively", v33, self];
LABEL_24:

          BOOL v21 = 1;
          goto LABEL_14;
        }
      }
      else
      {
      }
    }
    v20 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v20);
    [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  other", v9, self];
    goto LABEL_13;
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  already interrupted", v9, self];
LABEL_13:
  BOOL v21 = 0;
LABEL_14:

  return v21;
}

- (void)_handleDismissOverlaysCompletion
{
  uint64_t v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  if ([(SBToAppsWorkspaceTransaction *)self isGoingToMainSwitcher]
    || !+[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:v3])
  {
    [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self _performDismissal];
  }
  else
  {
    [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction setCompletionBlock:0];
    if ([(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction isRunning]) {
      [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction interruptWithReason:@"NewTransition"];
    }
    autoPIPTransaction = self->_autoPIPTransaction;
    self->_autoPIPTransaction = 0;

    uint64_t v5 = [(id)SBApp windowSceneManager];
    id v6 = [v3 displayIdentity];
    uint64_t v7 = [v5 windowSceneForDisplayIdentity:v6];

    BOOL v8 = [v7 pictureInPictureManager];
    uint64_t v9 = [v7 transientOverlayPresenter];
    [v9 topmostWindowLevel];
    unint64_t v11 = (unint64_t)(v10 + 1.0);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = [v8 acquireWindowLevelOverrideAssertionForControllerWithContentType:0 toWindowLevel:v11 withReason:6 identifier:v13];
    pipWindowLevelOverrideAssertionInvalidatable = self->_pipWindowLevelOverrideAssertionInvalidatable;
    self->_pipWindowLevelOverrideAssertionInvalidatable = v14;

    long long v16 = [SBAutoPIPWorkspaceTransaction alloc];
    long long v17 = [(SBWorkspaceTransaction *)self transitionRequest];
    uint64_t v18 = [(SBAutoPIPWorkspaceTransaction *)v16 initWithTransitionRequest:v17];
    long long v19 = self->_autoPIPTransaction;
    self->_autoPIPTransaction = v18;

    v20 = [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction entityToPIP];
    if (v20)
    {
      [(SBToAppsWorkspaceTransaction *)self _delayTransitionCompletionForRequester:@"_SBTransientOverlayDismissAllToAppsWorkspaceTransactionDelayRequesterAutoPIP"];
      objc_initWeak(&location, self);
      BOOL v21 = self->_autoPIPTransaction;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __90__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__handleDismissOverlaysCompletion__block_invoke;
      v22[3] = &unk_1E6AF7920;
      objc_copyWeak(&v24, &location);
      id v23 = v20;
      [(SBAutoPIPWorkspaceTransaction *)v21 setCompletionBlock:v22];
      [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self addChildTransaction:self->_autoPIPTransaction];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
}

void __90__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__handleDismissOverlaysCompletion__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    if (a2)
    {
      uint64_t v5 = objc_opt_class();
      id v6 = SBSafeCast(v5, *(void **)(a1 + 32));
      uint64_t v7 = [v6 viewController];
      [v7 handlePictureInPictureDidBegin];
    }
    [v8 _performDismissal];
    [v8 _stopDelayingTransitionCompletionForRequester:@"_SBTransientOverlayDismissAllToAppsWorkspaceTransactionDelayRequesterAutoPIP"];
    id WeakRetained = v8;
  }
}

- (void)_performDismissal
{
  [(SBToAppsWorkspaceTransaction *)self _delayTransitionCompletionForRequester:@"_SBTransientOverlayDismissAllToAppsWorkspaceTransactionDelayRequesterDismissal"];
  uint64_t v3 = [(SBWorkspaceTransaction *)self windowScene];
  id v4 = [v3 switcherController];

  uint64_t v5 = [(SBWorkspaceTransaction *)self transitionRequest];
  id v6 = [v5 applicationContext];
  uint64_t v7 = [(id)SBApp windowSceneManager];
  id v8 = [v5 displayIdentity];
  uint64_t v9 = [v7 windowSceneForDisplayIdentity:v8];

  double v10 = [v9 transientOverlayPresenter];
  unint64_t v11 = [v10 topmostPresentedViewController];
  if (v11
    && [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self _shouldUseSwitcherDismissalAnimationForTransientOverlayViewController:v11])
  {
    v12 = [[SBWorkspaceTransientOverlay alloc] initWithViewController:v11];
    v13 = [v4 appLayoutForWorkspaceTransientOverlay:v12];
    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }
  self->_isUsingSwitcherAnimation = v14;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke;
  v40[3] = &unk_1E6AF5770;
  id v15 = v5;
  BOOL v43 = v14;
  id v41 = v15;
  v42 = self;
  long long v16 = (void (**)(void))MEMORY[0x1D948C7A0](v40);
  if (v14)
  {
    id location = 0;
    p_id location = &location;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__46;
    v38 = __Block_byref_object_dispose__46;
    id v39 = 0;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_49;
    v30[3] = &unk_1E6AFACF8;
    id v31 = v4;
    id v32 = v10;
    v33 = &location;
    [v31 enumerateTransientOverlayViewControllersUsingBlock:v30];
    objc_storeStrong((id *)&self->_switcherTransitioningTransientOverlayViewControllers, p_location[5]);
    v16[2](v16);

    _Block_object_dispose(&location, 8);
  }
  else
  {
    long long v17 = [v6 previousEntities];
    id v24 = v6;
    uint64_t v18 = [v6 entities];
    char v19 = [v17 isEqualToSet:v18];

    if (v19)
    {
      v20 = [v15 applicationContext];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_3;
      v25[3] = &unk_1E6AF5A50;
      v26 = v16;
      [v4 performTransitionWithContext:v20 animated:0 completion:v25];
    }
    else
    {
      [(SBToAppsWorkspaceTransaction *)self _delayTransitionCompletionForRequester:@"SBTransientOverlayDismissToAppsSwitcherAlongsideAnimation"];
      BOOL v21 = [v4 animationControllerForTransitionRequest:v15];
      v22 = [v21 completionBlock];
      objc_initWeak(&location, self);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_2_55;
      v27[3] = &unk_1E6AF7498;
      objc_copyWeak(&v29, &location);
      id v23 = v22;
      id v28 = v23;
      [v21 setCompletionBlock:v27];
      [(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self addChildTransaction:v21 withSchedulingPolicy:0];
      v16[2](v16);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    id v6 = v24;
  }
}

void __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke(uint64_t a1)
{
  v2 = [[SBTransientOverlayDismissAllWorkspaceTransaction alloc] initWithTransitionRequest:*(void *)(a1 + 32)];
  uint64_t v3 = v2;
  if (*(unsigned char *)(a1 + 48)) {
    [(SBTransientOverlayDismissAllWorkspaceTransaction *)v2 setAnimatedOverride:0];
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_2;
  v4[3] = &unk_1E6AF5350;
  v4[4] = *(void *)(a1 + 40);
  [(SBTransientOverlayDismissAllWorkspaceTransaction *)v3 setCompletionBlock:v4];
  [*(id *)(a1 + 40) addChildTransaction:v3 withSchedulingPolicy:0];
  *(unsigned char *)(*(void *)(a1 + 40) + 345) = 1;
}

uint64_t __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopDelayingTransitionCompletionForRequester:@"_SBTransientOverlayDismissAllToAppsWorkspaceTransactionDelayRequesterDismissal"];
}

void __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_49(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAcquiredTransientOverlayViewController:") & 1) == 0
    && [*(id *)(a1 + 40) isPresentingViewController:v8])
  {
    [v8 beginIgnoringAppearanceUpdates];
    [v8 beginIgnoringContentOverlayInsetUpdates];
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v4)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    [v4 addObject:v8];
  }
}

uint64_t __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_2_55(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _stopDelayingTransitionCompletionForRequester:@"SBTransientOverlayDismissToAppsSwitcherAlongsideAnimation"];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_shouldUseSwitcherDismissalAnimationForTransientOverlayViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBWorkspaceTransaction *)self windowScene];
  uint64_t v6 = [v5 switcherController];

  if (v4 && [v6 hasAppLayoutForTransientOverlayViewController:v4])
  {
    uint64_t v7 = [(SBWorkspaceTransaction *)self transitionRequest];
    id v8 = [v7 applicationContext];

    uint64_t v9 = objc_opt_class();
    double v10 = [v8 layoutState];
    unint64_t v11 = SBSafeCast(v9, v10);

    uint64_t v12 = objc_opt_class();
    v13 = [v8 previousLayoutState];
    BOOL v14 = SBSafeCast(v12, v13);

    BOOL v15 = [v11 unlockedEnvironmentMode] == 2 || objc_msgSend(v14, "unlockedEnvironmentMode") == 2;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)_logForInterruptAttemptReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    uint64_t v7 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v12];
    if ([(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self isAuditHistoryEnabled])[(SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)self _addAuditHistoryItem:@"%@", v7]; {
    id v8 = SBLogCommon();
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      double v10 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipWindowLevelOverrideAssertionInvalidatable, 0);
  objc_storeStrong((id *)&self->_autoPIPTransaction, 0);
  objc_storeStrong((id *)&self->_switcherTransitioningTransientOverlayViewControllers, 0);
}

@end