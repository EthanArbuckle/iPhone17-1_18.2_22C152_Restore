@interface SBSpotlightTransientOverlayInteractiveGestureTransaction
- (BOOL)canInterruptForTransitionRequest:(id)a3;
- (SBMainWorkspaceTransaction)presentTransientOverlayTransaction;
- (SBSpotlightSettings)settings;
- (SBSpotlightTransientOverlayInteractiveGestureTransaction)initWithTransitionRequest:(id)a3 spotlightTransientOverlayViewController:(id)a4;
- (SBSpotlightTransientOverlayViewController)spotlightTransientOverlayViewController;
- (id)_homeScreenAnimator;
- (void)_begin;
- (void)_didComplete;
- (void)_dismissSpotlightTransientOverlayViewController;
- (void)_logForInterruptAttemptReason:(id)a3;
- (void)_presentTransientOverlayViewController:(id)a3;
- (void)endPresentation:(BOOL)a3;
- (void)noteGestureFinishedBeforeTransactionBegan;
- (void)setPresentTransientOverlayTransaction:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSpotlightTransientOverlayViewController:(id)a3;
- (void)transactionDidComplete:(id)a3;
- (void)updatePresentationWithProgress:(double)a3 translation:(double)a4;
@end

@implementation SBSpotlightTransientOverlayInteractiveGestureTransaction

- (SBSpotlightTransientOverlayInteractiveGestureTransaction)initWithTransitionRequest:(id)a3 spotlightTransientOverlayViewController:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBSpotlightTransientOverlayInteractiveGestureTransaction;
  v8 = [(SBMainWorkspaceTransaction *)&v13 initWithTransitionRequest:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_spotlightTransientOverlayViewController, a4);
    uint64_t v10 = +[SBSpotlightDomain rootSettings];
    settings = v9->_settings;
    v9->_settings = (SBSpotlightSettings *)v10;
  }
  return v9;
}

- (void)_begin
{
  if (!self->_gestureFinishedBeforeTransactionBegan)
  {
    [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self addMilestone:@"trackingGesture"];
    v3 = +[SBKeyboardSuppressionManager sharedInstance];
    v4 = [(SBWorkspaceTransaction *)self transitionRequest];
    v5 = [v4 displayIdentity];
    [v3 startSuppressingKeyboardWithReason:@"SBSpotlightInteractiveGestureKeyboardSuppressionReason" predicate:0 displayIdentity:v5];
  }
  v9.receiver = self;
  v9.super_class = (Class)SBSpotlightTransientOverlayInteractiveGestureTransaction;
  [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)&v9 _begin];
  if (!self->_gestureFinishedBeforeTransactionBegan)
  {
    [(SBSpotlightTransientOverlayViewController *)self->_spotlightTransientOverlayViewController beginInteractivePresentation];
    spotlightTransientOverlayViewController = self->_spotlightTransientOverlayViewController;
    id v7 = [(SBWorkspaceTransaction *)self transitionRequest];
    v8 = [v7 displayConfiguration];
    [(SBSpotlightTransientOverlayViewController *)spotlightTransientOverlayViewController setTargetDisplayConfiguration:v8];

    [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self _presentTransientOverlayViewController:self->_spotlightTransientOverlayViewController];
  }
}

- (void)_didComplete
{
  v3 = +[SBKeyboardSuppressionManager sharedInstance];
  [v3 stopSuppressingKeyboardWithReason:@"SBSpotlightInteractiveGestureKeyboardSuppressionReason"];

  v4.receiver = self;
  v4.super_class = (Class)SBSpotlightTransientOverlayInteractiveGestureTransaction;
  [(SBMainWorkspaceTransaction *)&v4 _didComplete];
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = SBSafeCast(v5, v4);

  id v7 = (void *)[v6 copyMainWorkspaceTransitionRequest];
  if ([v7 source] == 11)
  {
    v8 = [v7 workspace];
    objc_super v9 = [v8 transactionForTransitionRequest:v7];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> interruptible because:  next request is also interactive spotlight gesture", v12, self];
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_logForInterruptAttemptReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v12];
    if ([(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self isAuditHistoryEnabled])[(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self _addAuditHistoryItem:@"%@", v7]; {
    v8 = SBLogCommon();
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }
  }
}

- (void)updatePresentationWithProgress:(double)a3 translation:(double)a4
{
  if (!SBReduceMotion())
  {
    [(SBSpotlightSettings *)self->_settings maxTranslationForHomeScreenScale];
    [(SBSpotlightSettings *)self->_settings homeScreenScaleRubberbandingMin];
    uint64_t v8 = v7;
    [(SBSpotlightSettings *)self->_settings homeScreenScaleRubberbandingMax];
    [(SBSpotlightSettings *)self->_settings homeScreenScaleRubberbandingRange];
    BSUIConstrainValueToIntervalWithRubberBand();
    double v11 = v10;
    uint64_t v12 = +[SBLockScreenManager sharedInstance];
    int v13 = [v12 isLockScreenVisible];

    if (v13)
    {
      v14 = +[SBUIController sharedInstance];
      [v14 setLockScreenScale:5 withDuration:0 behaviorMode:v11 completion:0.0];
    }
    else
    {
      v14 = [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self _homeScreenAnimator];
      [v14 setHomeScreenScale:5 behaviorMode:0 completion:v11];
    }
  }
  [(SBSpotlightTransientOverlayViewController *)self->_spotlightTransientOverlayViewController updateInteractivePresentationWithProgress:a3 translation:a4];
}

- (void)endPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[SBLockScreenManager sharedInstance];
  int v6 = [v5 isLockScreenVisible];

  if (v6)
  {
    uint64_t v7 = +[SBUIController sharedInstance];
    [v7 setLockScreenScale:3 withDuration:0 behaviorMode:1.0 completion:0.3];
  }
  else
  {
    uint64_t v7 = [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self _homeScreenAnimator];
    [v7 setHomeScreenScale:3 behaviorMode:0 completion:1.0];
  }

  [(SBSpotlightTransientOverlayViewController *)self->_spotlightTransientOverlayViewController endInteractivePresentation:v3];
  if (!v3) {
    [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self _dismissSpotlightTransientOverlayViewController];
  }
  [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self removeMilestone:@"trackingGesture"];
}

- (void)noteGestureFinishedBeforeTransactionBegan
{
  self->_gestureFinishedBeforeTransactionBegan = 1;
}

- (void)_presentTransientOverlayViewController:(id)a3
{
  id v5 = a3;
  if (self->_presentTransientOverlayTransaction)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_presentTransientOverlayTransaction == nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)a2 _presentTransientOverlayViewController:(uint64_t)v16];
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    int v6 = v5;
    uint64_t v7 = [[SBWorkspaceTransientOverlay alloc] initWithViewController:v5];
    uint64_t v8 = [(SBWorkspaceTransaction *)self transitionRequest];
    uint64_t v9 = [v8 workspace];

    double v10 = [v9 createRequestWithOptions:0];
    double v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v10 setEventLabelWithFormat:@"PresentTransientOverlay = %@", v12];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __99__SBSpotlightTransientOverlayInteractiveGestureTransaction__presentTransientOverlayViewController___block_invoke;
    v17[3] = &unk_1E6AF8040;
    v18 = v7;
    int v13 = v7;
    [v10 modifyTransientOverlayContext:v17];
    [v10 modifyApplicationContext:&__block_literal_global_45];
    v14 = [v9 transactionForTransitionRequest:v10];
    presentTransientOverlayTransaction = self->_presentTransientOverlayTransaction;
    self->_presentTransientOverlayTransaction = v14;

    [(SBMainWorkspaceTransaction *)self->_presentTransientOverlayTransaction addObserver:self];
    [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self addChildTransaction:self->_presentTransientOverlayTransaction];
  }
}

void __99__SBSpotlightTransientOverlayInteractiveGestureTransaction__presentTransientOverlayViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTransitionType:0];
  [v3 setTransientOverlay:*(void *)(a1 + 32)];
  [v3 setAnimated:1];
}

uint64_t __99__SBSpotlightTransientOverlayInteractiveGestureTransaction__presentTransientOverlayViewController___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setWaitsForSceneUpdates:0];
}

- (void)_dismissSpotlightTransientOverlayViewController
{
  id v3 = [[SBWorkspaceTransientOverlay alloc] initWithViewController:self->_spotlightTransientOverlayViewController];
  id v4 = [(SBWorkspaceTransaction *)self transitionRequest];
  id v5 = [v4 workspace];

  int v6 = [v5 createRequestWithOptions:0];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  objc_msgSend(v6, "setEventLabelWithFormat:", @"DismissSearchOverlay", v8);

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__SBSpotlightTransientOverlayInteractiveGestureTransaction__dismissSpotlightTransientOverlayViewController__block_invoke;
  v12[3] = &unk_1E6AF8040;
  uint64_t v9 = v3;
  int v13 = v9;
  [v6 modifyTransientOverlayContext:v12];
  [v6 modifyApplicationContext:&__block_literal_global_47];
  presentTransientOverlayTransaction = self->_presentTransientOverlayTransaction;
  if (presentTransientOverlayTransaction
    && [(SBWorkspaceTransaction *)presentTransientOverlayTransaction canInterruptForTransitionRequest:v6])
  {
    [(SBWorkspaceTransaction *)self->_presentTransientOverlayTransaction interruptForTransitionRequest:v6];
  }
  double v11 = [v5 transactionForTransitionRequest:v6];
  [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self addChildTransaction:v11 withSchedulingPolicy:1];
}

void __107__SBSpotlightTransientOverlayInteractiveGestureTransaction__dismissSpotlightTransientOverlayViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTransitionType:1];
  [v3 setTransientOverlay:*(void *)(a1 + 32)];
  [v3 setAnimated:1];
}

uint64_t __107__SBSpotlightTransientOverlayInteractiveGestureTransaction__dismissSpotlightTransientOverlayViewController__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setWaitsForSceneUpdates:0];
}

- (id)_homeScreenAnimator
{
  v2 = [(UIViewController *)self->_spotlightTransientOverlayViewController _sbWindowScene];
  id v3 = [v2 homeScreenController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[SBUIController sharedInstance];
  }
  int v6 = v5;

  return v6;
}

- (void)transactionDidComplete:(id)a3
{
  id v4 = (SBMainWorkspaceTransaction *)a3;
  if (self->_presentTransientOverlayTransaction == v4)
  {
    self->_presentTransientOverlayTransaction = 0;
    id v5 = v4;

    id v4 = v5;
  }
}

- (SBSpotlightSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (SBSpotlightTransientOverlayViewController)spotlightTransientOverlayViewController
{
  return self->_spotlightTransientOverlayViewController;
}

- (void)setSpotlightTransientOverlayViewController:(id)a3
{
}

- (SBMainWorkspaceTransaction)presentTransientOverlayTransaction
{
  return self->_presentTransientOverlayTransaction;
}

- (void)setPresentTransientOverlayTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentTransientOverlayTransaction, 0);
  objc_storeStrong((id *)&self->_spotlightTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_presentTransientOverlayViewController:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  int v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  double v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBSpotlightTransientOverlayInteractiveGestureTransaction.m";
  __int16 v16 = 1024;
  int v17 = 150;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end