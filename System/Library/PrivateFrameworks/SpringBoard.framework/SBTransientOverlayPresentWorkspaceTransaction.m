@interface SBTransientOverlayPresentWorkspaceTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)canInterruptForTransitionRequest:(id)a3;
- (SBTransientOverlayPresentWorkspaceTransaction)initWithTransitionRequest:(id)a3;
- (void)_begin;
- (void)_didComplete;
- (void)_logForInterruptAttemptReason:(id)a3;
- (void)_performStandardPresentationAnimated:(BOOL)a3;
- (void)_willBegin;
- (void)_willInterruptWithReason:(id)a3;
- (void)animationControllerDidFinishAnimation:(id)a3;
@end

@implementation SBTransientOverlayPresentWorkspaceTransaction

- (SBTransientOverlayPresentWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayPresentWorkspaceTransaction;
  return [(SBMainWorkspaceTransaction *)&v4 initWithTransitionRequest:a3];
}

- (void)_willBegin
{
  v12.receiver = self;
  v12.super_class = (Class)SBTransientOverlayPresentWorkspaceTransaction;
  [(SBTransientOverlayPresentWorkspaceTransaction *)&v12 _willBegin];
  objc_super v4 = [(SBWorkspaceTransaction *)self windowScene];
  if (!v4)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBTransientOverlayPresentWorkspaceTransaction.m", 61, @"No window scene to get a publisher: %@", self object file lineNumber description];
  }
  v5 = [v4 displayLayoutPublisher];
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBTransientOverlayPresentWorkspaceTransaction.m", 61, @"No publisher for window scene: %@; self: %@",
      v4,
      self);
  }
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 transitionAssertionWithReason:v7];
  displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
  self->_displayLayoutTransitionAssertion = v8;
}

- (void)_begin
{
  v19.receiver = self;
  v19.super_class = (Class)SBTransientOverlayPresentWorkspaceTransaction;
  [(SBTransientOverlayPresentWorkspaceTransaction *)&v19 _begin];
  [(SBTransientOverlayPresentWorkspaceTransaction *)self addMilestone:@"SBTransientOverlayPresentWorkspaceTransactionMilestonePresentationCompletion"];
  v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  objc_super v4 = [v3 transientOverlayContext];
  v5 = [v4 transientOverlay];
  v6 = [(SBWorkspaceTransaction *)self windowScene];
  v7 = [v6 switcherController];

  v8 = [v3 workspace];
  v9 = [v8 keyboardFocusController];
  v10 = [(SBWorkspaceTransaction *)self windowScene];
  v11 = [v9 bufferEventsForSpringBoardScene:v10 reason:@"SBTransientOverlayPresentWorkspaceTransaction"];
  eventBufferingAssertion = self->_eventBufferingAssertion;
  self->_eventBufferingAssertion = v11;

  if (v5 && [v7 unlockedEnvironmentMode] == 2)
  {
    v13 = [v7 appLayoutForWorkspaceTransientOverlay:v5];
    if (v13)
    {
      v14 = [v5 viewController];
      BOOL v15 = [v14 preferredUnlockedGestureDismissalStyle] == 3;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }
  v16 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
  [v16 beginTransitionForWorkspaceTransaction:self];
  if (v15)
  {
    v17 = [v7 animationControllerForTransitionRequest:v3];
    animation = self->_animation;
    self->_animation = v17;

    if (self->_animation)
    {
      [(SBTransientOverlayPresentWorkspaceTransaction *)self addMilestone:@"SBTransientOverlayPresentWorkspaceTransactionMilestoneAnimation"];
      [(SBUIAnimationController *)self->_animation addObserver:self];
      [(SBTransientOverlayPresentWorkspaceTransaction *)self addChildTransaction:self->_animation withSchedulingPolicy:0];
    }
  }
  else
  {
    -[SBTransientOverlayPresentWorkspaceTransaction _performStandardPresentationAnimated:](self, "_performStandardPresentationAnimated:", [v4 isAnimated]);
  }
}

- (BOOL)_canBeInterrupted
{
  if ([(SBUIAnimationController *)self->_animation isReasonableMomentToInterrupt]) {
    return 1;
  }
  return [(SBWorkspaceTransaction *)self _isInterruptingForTransitionRequest];
}

- (void)_didComplete
{
  [(BSInvalidatable *)self->_displayLayoutTransitionAssertion invalidate];
  displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
  self->_displayLayoutTransitionAssertion = 0;

  [(BSInvalidatable *)self->_eventBufferingAssertion invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayPresentWorkspaceTransaction;
  [(SBMainWorkspaceTransaction *)&v4 _didComplete];
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  id v4 = a3;
  if (self->_animation)
  {
    uint64_t v5 = objc_opt_class();
    v6 = SBSafeCast(v5, v4);
    v7 = (void *)[v6 copyMainWorkspaceTransitionRequest];
    if ([(SBTransientOverlayPresentWorkspaceTransaction *)self isInterrupted])
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      [(SBTransientOverlayPresentWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  already interrupted", v9, self];
LABEL_19:

      BOOL v17 = 0;
      goto LABEL_20;
    }
    v18 = [v7 applicationContext];
    int v19 = [v18 isBackground];

    if (v19)
    {
      v20 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v20);
      [(SBTransientOverlayPresentWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  request is for background activation", v9, self];
      goto LABEL_19;
    }
    v22 = +[SBSetupManager sharedInstance];
    if ([v22 isInSetupMode])
    {
      v23 = +[SBSetupManager sharedInstance];
      char v24 = [v23 isInSetupModeReadyToExit];

      if ((v24 & 1) == 0)
      {
        v25 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v25);
        [(SBTransientOverlayPresentWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because: we are in setup mode", v9, self];
        goto LABEL_19;
      }
    }
    else
    {
    }
    v26 = [(SBWorkspaceTransaction *)self transitionRequest];
    uint64_t v27 = [v26 source];

    if (v27 == 31)
    {
      v28 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v28);
      [(SBTransientOverlayPresentWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because: we are in a startup transition", v9, self];
      goto LABEL_19;
    }
    v16 = self->_animation;
    if (([(SBUIAnimationController *)v16 isInterruptible] & 1) == 0)
    {
      v32 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v32);
      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      [(SBTransientOverlayPresentWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  self animation isn't interruptible : animationController=<%@:%p>", v31, self, v34, v16];

      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v38 = 0;
      v39 = &v38;
      uint64_t v40 = 0x2020000000;
      char v41 = 0;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __82__SBTransientOverlayPresentWorkspaceTransaction_canInterruptForTransitionRequest___block_invoke;
      v37[3] = &unk_1E6AF4C30;
      v37[4] = &v38;
      [(SBUIAnimationController *)v16 _enumerateCoordinatingAnimationsWithBlock:v37];
      if (!*((unsigned char *)v39 + 24))
      {
        v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        [(SBTransientOverlayPresentWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  self animation isnt switcher animation and doesn't have switcher animation as a child", v36, self];

        _Block_object_dispose(&v38, 8);
        goto LABEL_11;
      }
      _Block_object_dispose(&v38, 8);
    }
    if (v7 && [v7 source] == 14)
    {
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      [(SBTransientOverlayPresentWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  rotation", v31, self];
LABEL_29:

      goto LABEL_11;
    }
  }
  else
  {
    v10 = [(SBWorkspaceTransaction *)self transitionRequest];
    v11 = [v10 transientOverlayContext];
    v6 = [v11 transientOverlay];

    objc_super v12 = [v4 transientOverlayContext];
    v7 = [v12 transientOverlay];

    if (![v6 isAnalogousToEntity:v7]
      || ([v4 transientOverlayContext],
          v13 = objc_claimAutoreleasedReturnValue(),
          uint64_t v14 = [v13 transitionType],
          v13,
          v14 != 1))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v16 = (SBUIAnimationController *)objc_claimAutoreleasedReturnValue();
      [(SBTransientOverlayPresentWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> not interruptible because:  _animation is nil", v16, self];
LABEL_11:
      BOOL v17 = 0;
      goto LABEL_12;
    }
    BOOL v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (SBUIAnimationController *)objc_claimAutoreleasedReturnValue();
    [(SBTransientOverlayPresentWorkspaceTransaction *)self _logForInterruptAttemptReason:@"<%@:%p> interruptible because:  next request is to dismiss the same transient overlay we're currently presenting", v16, self];
  }
  BOOL v17 = 1;
LABEL_12:

LABEL_20:
  return v17;
}

void __82__SBTransientOverlayPresentWorkspaceTransaction_canInterruptForTransitionRequest___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)_willInterruptWithReason:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBTransientOverlayPresentWorkspaceTransaction;
  [(SBTransientOverlayPresentWorkspaceTransaction *)&v5 _willInterruptWithReason:a3];
  id v4 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
  if ([v4 isTransitioning])
  {
    [v4 willEndTransition];
    [v4 endTransitionWithError:0];
  }
}

- (void)animationControllerDidFinishAnimation:(id)a3
{
  [(SBTransientOverlayPresentWorkspaceTransaction *)self _performStandardPresentationAnimated:0];
  [(SBTransientOverlayPresentWorkspaceTransaction *)self removeMilestone:@"SBTransientOverlayPresentWorkspaceTransactionMilestoneAnimation"];
}

- (void)_logForInterruptAttemptReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = SBLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    v7 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v12];
    if ([(SBTransientOverlayPresentWorkspaceTransaction *)self isAuditHistoryEnabled])[(SBTransientOverlayPresentWorkspaceTransaction *)self _addAuditHistoryItem:@"%@", v7]; {
    v8 = SBLogCommon();
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }
  }
}

- (void)_performStandardPresentationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SBWorkspaceTransaction *)self transitionRequest];
  BOOL v6 = [v5 transientOverlayContext];
  v7 = [v6 transientOverlay];
  v8 = [v7 viewController];
  v9 = [v6 presentationManager];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __86__SBTransientOverlayPresentWorkspaceTransaction__performStandardPresentationAnimated___block_invoke;
  v31[3] = &unk_1E6AF4AC0;
  v31[4] = self;
  v10 = (void (**)(void))MEMORY[0x1D948C7A0](v31);
  if ([(SBTransientOverlayPresentWorkspaceTransaction *)self isInterrupted]
    || !v8
    || ([v9 isPresentingViewController:v8] & 1) != 0)
  {
    v10[2](v10);
  }
  else
  {
    uint64_t v11 = [(SBWorkspaceTransaction *)self windowScene];
    uint64_t v12 = [v11 switcherController];

    int v17 = [v12 isAcquiredTransientOverlayViewController:v8];
    if (v17)
    {
      [v8 beginIgnoringAppearanceUpdates];
      [v8 beginIgnoringContentOverlayInsetUpdates];
      [v12 removeAcquiredTransientOverlayViewController:v8];
    }
    v13 = [(SBTransientOverlayPresentationRequest *)[SBMutableTransientOverlayPresentationRequest alloc] initWithViewController:v8];
    [(SBMutableTransientOverlayPresentationRequest *)v13 setAnimated:v3];
    -[SBMutableTransientOverlayPresentationRequest setShouldDismissSiri:](v13, "setShouldDismissSiri:", [v6 shouldDismissSiriUponPresentation]);
    uint64_t v14 = [v6 originatingProcess];
    [(SBMutableTransientOverlayPresentationRequest *)v13 setOriginatingProcess:v14];

    BOOL v15 = [v6 windowScene];
    [(SBMutableTransientOverlayPresentationRequest *)v13 setWindowScene:v15];

    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v23 = 0;
    char v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __86__SBTransientOverlayPresentWorkspaceTransaction__performStandardPresentationAnimated___block_invoke_2;
    v19[3] = &unk_1E6AF4C58;
    v21 = &v23;
    v16 = v10;
    id v20 = v16;
    v22 = &v27;
    [(SBMutableTransientOverlayPresentationRequest *)v13 setCompletionHandler:v19];
    [v9 performPresentationRequest:v13];
    if (!*((unsigned char *)v28 + 24)) {
      *((unsigned char *)v24 + 24) = 1;
    }
    if (v17)
    {
      [v8 endIgnoringAppearanceUpdates];
      [v8 endIgnoringContentOverlayInsetUpdates];
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __86__SBTransientOverlayPresentWorkspaceTransaction__performStandardPresentationAnimated___block_invoke_3;
    v18[3] = &unk_1E6AF4C80;
    v18[4] = self;
    [(SBTransientOverlayPresentWorkspaceTransaction *)self _enumerateObserversWithBlock:v18];
    if (*((unsigned char *)v28 + 24)) {
      v16[2](v16);
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }
}

void __86__SBTransientOverlayPresentWorkspaceTransaction__performStandardPresentationAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layoutStateTransitionCoordinator];
  if ([v2 isTransitioning])
  {
    [v2 willEndTransition];
    [v2 endTransitionWithError:0];
  }
  [*(id *)(a1 + 32) removeMilestone:@"SBTransientOverlayPresentWorkspaceTransactionMilestonePresentationCompletion"];
}

uint64_t __86__SBTransientOverlayPresentWorkspaceTransaction__performStandardPresentationAnimated___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  return result;
}

void __86__SBTransientOverlayPresentWorkspaceTransaction__performStandardPresentationAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transientOverlayPresentWorkspaceTransactionDidPerformPresentation:*(void *)(a1 + 32)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBufferingAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransitionAssertion, 0);
  objc_storeStrong((id *)&self->_animation, 0);
}

@end