@interface SBCoverSheetToAppsWorkspaceTransaction
- (BOOL)preservesBanners;
- (SBCoverSheetToAppsWorkspaceTransaction)initWithTransitionRequest:(id)a3;
- (unint64_t)_dismissOverlaysOptions;
- (void)_autoPIPIfNeeded;
- (void)_begin;
- (void)_didComplete;
- (void)_dismissOverlaysIfNeeded;
- (void)dealloc;
- (void)setPreservesBanners:(BOOL)a3;
@end

@implementation SBCoverSheetToAppsWorkspaceTransaction

- (SBCoverSheetToAppsWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBCoverSheetToAppsWorkspaceTransaction.m", 34, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v6 = +[SBWorkspace mainWorkspace];
  v7 = [v6 transientOverlayPresentationManager];

  char v8 = [v7 hasActivePresentation];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__SBCoverSheetToAppsWorkspaceTransaction_initWithTransitionRequest___block_invoke;
  v22[3] = &__block_descriptor_33_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  char v23 = v8 ^ 1;
  [v5 modifyApplicationContext:v22];
  v21.receiver = self;
  v21.super_class = (Class)SBCoverSheetToAppsWorkspaceTransaction;
  v9 = [(SBToAppsWorkspaceTransaction *)&v21 initWithTransitionRequest:v5];
  if (v9)
  {
    if (SBMainWorkspaceTransitionSourceIsUserEventDriven([v5 source]))
    {
      v10 = [(SBToAppsWorkspaceTransaction *)v9 layoutTransaction];
      uint64_t v11 = [v10 options];

      v12 = [(SBToAppsWorkspaceTransaction *)v9 layoutTransaction];
      [v12 setOptions:v11 | 2];
    }
    v13 = +[SBWorkspace mainWorkspace];
    v14 = [v13 createRequestWithOptions:0];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__SBCoverSheetToAppsWorkspaceTransaction_initWithTransitionRequest___block_invoke_2;
    v19[3] = &unk_1E6AF8040;
    id v20 = v7;
    [v14 modifyTransientOverlayContext:v19];
    if (+[SBTransientOverlayDismissAllWorkspaceTransaction isValidForTransitionRequest:v14])
    {
      v15 = [[SBTransientOverlayDismissAllWorkspaceTransaction alloc] initWithTransitionRequest:v14];
      transientOverlayTransaction = v9->_transientOverlayTransaction;
      v9->_transientOverlayTransaction = v15;
    }
    [(SBToAppsWorkspaceTransaction *)v9 _setShouldSerialDismissOverlays:0];
  }
  return v9;
}

void __68__SBCoverSheetToAppsWorkspaceTransaction_initWithTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setWaitsForSceneUpdates:0];
  [v3 setAnimationDisabled:*(unsigned __int8 *)(a1 + 32)];
  [v3 setAlwaysRunsWatchdog:1];
}

void __68__SBCoverSheetToAppsWorkspaceTransaction_initWithTransitionRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAnimated:1];
  [v3 setPresentationManager:*(void *)(a1 + 32)];
  [v3 setTransitionType:1];
}

- (void)dealloc
{
  [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction setCompletionBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)SBCoverSheetToAppsWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v3 dealloc];
}

- (void)_begin
{
  objc_super v3 = +[SBLockStateAggregator sharedInstance];
  char v4 = [v3 lockState];

  transientOverlayTransaction = self->_transientOverlayTransaction;
  if (transientOverlayTransaction) {
    [(SBCoverSheetToAppsWorkspaceTransaction *)self addChildTransaction:self->_transientOverlayTransaction];
  }
  v6 = +[SBCoverSheetPresentationManager sharedInstance];
  v7 = v6;
  if ((v4 & 2) == 0
    && [v6 isVisible]
    && ([v7 isAnyGestureActivelyRecognized] & 1) == 0)
  {
    char v8 = +[SBCoverSheetPresentationManager sharedInstance];
    [v8 setCoverSheetPresented:0 animated:transientOverlayTransaction == 0 options:2 withCompletion:0];
  }
  [(SBCoverSheetToAppsWorkspaceTransaction *)self _dismissOverlaysIfNeeded];
  [(SBToAppsWorkspaceTransaction *)self activateApplications];
  [(SBCoverSheetToAppsWorkspaceTransaction *)self _autoPIPIfNeeded];
  v9.receiver = self;
  v9.super_class = (Class)SBCoverSheetToAppsWorkspaceTransaction;
  [(SBCoverSheetToAppsWorkspaceTransaction *)&v9 _begin];
}

- (void)_didComplete
{
  [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction setCompletionBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)SBCoverSheetToAppsWorkspaceTransaction;
  [(SBToAppsWorkspaceTransaction *)&v3 _didComplete];
}

- (void)_dismissOverlaysIfNeeded
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SBCoverSheetToAppsWorkspaceTransaction *)self _dismissOverlaysOptions];
  if (+[SBDismissOverlaysAnimationController willDismissOverlaysForDismissOptions:v3]&& !self->_dismissOverlaysAnimationController)
  {
    char v4 = [SBDismissOverlaysAnimationController alloc];
    id v5 = [(SBWorkspaceTransaction *)self transitionRequest];
    v6 = [(SBDismissOverlaysAnimationController *)v4 initWithTransitionContextProvider:v5 options:v3];
    dismissOverlaysAnimationController = self->_dismissOverlaysAnimationController;
    self->_dismissOverlaysAnimationController = v6;

    [(SBCoverSheetToAppsWorkspaceTransaction *)self addChildTransaction:self->_dismissOverlaysAnimationController withSchedulingPolicy:0];
    char v8 = SBLogDashBoard();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_super v9 = [(SBDismissOverlaysAnimationController *)self->_dismissOverlaysAnimationController debugDescription];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "dismissOverlaysAnimationController: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (unint64_t)_dismissOverlaysOptions
{
  if ([(SBCoverSheetToAppsWorkspaceTransaction *)self preservesBanners]) {
    return -33;
  }
  else {
    return -1;
  }
}

- (void)_autoPIPIfNeeded
{
  id v9 = [(SBWorkspaceTransaction *)self transitionRequest];
  if (+[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:reason:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:reason:"))
  {
    p_autoPIPTransaction = &self->_autoPIPTransaction;
    [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction setCompletionBlock:0];
    if ([(SBAutoPIPWorkspaceTransaction *)self->_autoPIPTransaction isRunning]) {
      [(SBAutoPIPWorkspaceTransaction *)*p_autoPIPTransaction interruptWithReason:@"NewTransition"];
    }
    char v4 = *p_autoPIPTransaction;
    *p_autoPIPTransaction = 0;

    id v5 = [SBAutoPIPWorkspaceTransaction alloc];
    v6 = [(SBWorkspaceTransaction *)self transitionRequest];
    v7 = [(SBAutoPIPWorkspaceTransaction *)v5 initWithTransitionRequest:v6];

    char v8 = [(SBAutoPIPWorkspaceTransaction *)v7 entityToPIP];
    if (v8)
    {
      objc_storeStrong((id *)&self->_autoPIPTransaction, v7);
      [(SBCoverSheetToAppsWorkspaceTransaction *)self addChildTransaction:*p_autoPIPTransaction withSchedulingPolicy:0];
    }
  }
}

- (BOOL)preservesBanners
{
  return self->_preservesBanners;
}

- (void)setPreservesBanners:(BOOL)a3
{
  self->_preservesBanners = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoPIPTransaction, 0);
  objc_storeStrong((id *)&self->_transientOverlayTransaction, 0);
  objc_storeStrong((id *)&self->_dismissOverlaysAnimationController, 0);
}

@end