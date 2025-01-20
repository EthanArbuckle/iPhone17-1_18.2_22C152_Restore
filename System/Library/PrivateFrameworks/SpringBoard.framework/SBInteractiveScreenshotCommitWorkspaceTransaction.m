@interface SBInteractiveScreenshotCommitWorkspaceTransaction
- (BOOL)hasFinishedFlashAnimation;
- (BOOL)hasFinishedSettlingAnimation;
- (NSUUID)gestureSessionID;
- (SBInteractiveScreenshotCommitWorkspaceTransaction)initWithTransitionRequest:(id)a3 gestureSessionID:(id)a4;
- (SBInteractiveScreenshotCommitWorkspaceTransactionDelegate)interactiveScreenshotCommitDelegate;
- (SBTransientOverlayViewController)screenshotMarkupTransientOverlayViewController;
- (void)_begin;
- (void)_handleWatchdogTimeout;
- (void)_updateState;
- (void)setHasFinishedFlashAnimation:(BOOL)a3;
- (void)setHasFinishedSettlingAnimation:(BOOL)a3;
- (void)setInteractiveScreenshotCommitDelegate:(id)a3;
- (void)setScreenshotMarkupTransientOverlayViewController:(id)a3;
- (void)transientOverlayPresentWorkspaceTransactionDidPerformPresentation:(id)a3;
@end

@implementation SBInteractiveScreenshotCommitWorkspaceTransaction

- (SBInteractiveScreenshotCommitWorkspaceTransaction)initWithTransitionRequest:(id)a3 gestureSessionID:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBInteractiveScreenshotCommitWorkspaceTransaction;
  v7 = [(SBMainWorkspaceTransaction *)&v11 initWithTransitionRequest:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    gestureSessionID = v7->_gestureSessionID;
    v7->_gestureSessionID = (NSUUID *)v8;
  }
  return v7;
}

- (void)_begin
{
  v14.receiver = self;
  v14.super_class = (Class)SBInteractiveScreenshotCommitWorkspaceTransaction;
  [(SBInteractiveScreenshotCommitWorkspaceTransaction *)&v14 _begin];
  [(SBInteractiveScreenshotCommitWorkspaceTransaction *)self addMilestone:@"pendingCompletion"];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E4F1CB00];
  UIAnimationDragCoefficient();
  double v5 = v4 * 5.0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __59__SBInteractiveScreenshotCommitWorkspaceTransaction__begin__block_invoke;
  objc_super v11 = &unk_1E6AF61A0;
  objc_copyWeak(&v12, &location);
  id v6 = [v3 scheduledTimerWithTimeInterval:0 repeats:&v8 block:v5];
  watchdogTimeoutTimer = self->_watchdogTimeoutTimer;
  self->_watchdogTimeoutTimer = v6;

  [(SBInteractiveScreenshotCommitWorkspaceTransaction *)self _updateState];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __59__SBInteractiveScreenshotCommitWorkspaceTransaction__begin__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  float v4 = WeakRetained;
  if (WeakRetained && (id)WeakRetained[27] == v5) {
    [WeakRetained _handleWatchdogTimeout];
  }
}

- (void)transientOverlayPresentWorkspaceTransactionDidPerformPresentation:(id)a3
{
  self->_hasBeganPresentation = 1;
  [(SBInteractiveScreenshotCommitWorkspaceTransaction *)self _updateState];
}

- (void)setHasFinishedFlashAnimation:(BOOL)a3
{
  if (self->_hasFinishedFlashAnimation != a3)
  {
    self->_hasFinishedFlashAnimation = a3;
    [(SBInteractiveScreenshotCommitWorkspaceTransaction *)self _updateState];
  }
}

- (void)setHasFinishedSettlingAnimation:(BOOL)a3
{
  if (self->_hasFinishedSettlingAnimation != a3)
  {
    self->_hasFinishedSettlingAnimation = a3;
    [(SBInteractiveScreenshotCommitWorkspaceTransaction *)self _updateState];
  }
}

- (void)setScreenshotMarkupTransientOverlayViewController:(id)a3
{
  id v5 = a3;
  if (v5 && !self->_screenshotMarkupTransientOverlayViewController)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_screenshotMarkupTransientOverlayViewController, a3);
    [(SBInteractiveScreenshotCommitWorkspaceTransaction *)self _updateState];
    id v5 = v6;
  }
}

- (void)_handleWatchdogTimeout
{
  self->_hasWatchdogExpired = 1;
  [(SBInteractiveScreenshotCommitWorkspaceTransaction *)self _updateState];
}

- (void)_updateState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveScreenshotCommitDelegate);
  id v5 = WeakRetained;
  id v6 = &OBJC_IVAR___SBControlCenterController__observers;
  if (self->_hasFinishedPresentation && self->_hasFinishedFlashAnimation || self->_hasWatchdogExpired)
  {
    if ([(SBInteractiveScreenshotCommitWorkspaceTransaction *)self isWaitingForMilestone:@"pendingCompletion"])
    {
      [v5 interactiveScreenshotCommitWorkspaceTransactionRequestsGestureWindowInvalidation:self];
      [(SBInteractiveScreenshotCommitWorkspaceTransaction *)self removeMilestone:@"pendingCompletion"];
    }
  }
  else if (self->_hasFinishedSettlingAnimation)
  {
    if (self->_hasBeganPresentation)
    {
      if (!self->_hasRequestedPlaceholderChromeRemoval)
      {
        self->_hasRequestedPlaceholderChromeRemoval = 1;
        [WeakRetained interactiveScreenshotCommitWorkspaceTransactionRequestsPlaceholderChromeRemoval:self];
      }
    }
    else if (self->_screenshotMarkupTransientOverlayViewController && !self->_hasQueuedPresentationTransaction)
    {
      self->_hasQueuedPresentationTransaction = 1;
      uint64_t v9 = [[SBWorkspaceTransientOverlay alloc] initWithViewController:self->_screenshotMarkupTransientOverlayViewController];
      v10 = +[SBWorkspace mainWorkspace];
      objc_super v11 = [v10 createRequestWithOptions:0];
      [v11 setEventLabelWithFormat:@"PresentScreenshotMarkupTransientOverlay"];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __65__SBInteractiveScreenshotCommitWorkspaceTransaction__updateState__block_invoke;
      v17[3] = &unk_1E6B045D0;
      id v12 = v9;
      v18 = v12;
      id v13 = v10;
      id v19 = v13;
      [v11 modifyTransientOverlayContext:v17];
      objc_super v14 = [v13 transactionForTransitionRequest:v11];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2, self, @"SBInteractiveScreenshotCommitWorkspaceTransaction.m", 127, @"Invalid parameter not satisfying: %@", @"[transaction isKindOfClass:[SBTransientOverlayPresentWorkspaceTransaction class]]" object file lineNumber description];

        id v6 = &OBJC_IVAR___SBControlCenterController__observers;
      }
      [v14 addObserver:self];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __65__SBInteractiveScreenshotCommitWorkspaceTransaction__updateState__block_invoke_2;
      v16[3] = &unk_1E6AF5350;
      v16[4] = self;
      [v14 setCompletionBlock:v16];
      [(SBInteractiveScreenshotCommitWorkspaceTransaction *)self addChildTransaction:v14 withSchedulingPolicy:0];
    }
  }
  if (*((unsigned char *)&self->super.super.super.super.super.isa + v6[956]) || self->_hasWatchdogExpired)
  {
    watchdogTimeoutTimer = self->_watchdogTimeoutTimer;
    self->_watchdogTimeoutTimer = 0;
    uint64_t v8 = watchdogTimeoutTimer;

    [(NSTimer *)v8 invalidate];
  }
}

void __65__SBInteractiveScreenshotCommitWorkspaceTransaction__updateState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTransitionType:0];
  [v3 setTransientOverlay:*(void *)(a1 + 32)];
  [v3 setAnimated:1];
  id v4 = [*(id *)(a1 + 40) mainWindowScene];
  [v3 setWindowScene:v4];
}

uint64_t __65__SBInteractiveScreenshotCommitWorkspaceTransaction__updateState__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 209) = 1;
  return [*(id *)(a1 + 32) _updateState];
}

- (NSUUID)gestureSessionID
{
  return self->_gestureSessionID;
}

- (BOOL)hasFinishedFlashAnimation
{
  return self->_hasFinishedFlashAnimation;
}

- (BOOL)hasFinishedSettlingAnimation
{
  return self->_hasFinishedSettlingAnimation;
}

- (SBTransientOverlayViewController)screenshotMarkupTransientOverlayViewController
{
  return self->_screenshotMarkupTransientOverlayViewController;
}

- (SBInteractiveScreenshotCommitWorkspaceTransactionDelegate)interactiveScreenshotCommitDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveScreenshotCommitDelegate);
  return (SBInteractiveScreenshotCommitWorkspaceTransactionDelegate *)WeakRetained;
}

- (void)setInteractiveScreenshotCommitDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactiveScreenshotCommitDelegate);
  objc_storeStrong((id *)&self->_screenshotMarkupTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_gestureSessionID, 0);
  objc_storeStrong((id *)&self->_watchdogTimeoutTimer, 0);
}

@end