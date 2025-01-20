@interface SBDashBoardCaptureExtensionWorkspaceTransitionManager
- (SBDashBoardCaptureExtensionWorkspaceTransitionManager)initWithSwitcherViewController:(id)a3;
- (id)_transactionForRequest:(id)a3;
- (void)executeTransitionRequest:(id)a3 completion:(id)a4;
- (void)interruptCurrentTransitionIfNeeded;
@end

@implementation SBDashBoardCaptureExtensionWorkspaceTransitionManager

- (SBDashBoardCaptureExtensionWorkspaceTransitionManager)initWithSwitcherViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardCaptureExtensionWorkspaceTransitionManager;
  v6 = [(SBDashBoardCaptureExtensionWorkspaceTransitionManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_switcherViewController, a3);
  }

  return v7;
}

- (void)executeTransitionRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SBDashBoardCaptureExtensionWorkspaceTransitionManager *)self _transactionForRequest:v6];
  currentTransaction = self->_currentTransaction;
  self->_currentTransaction = v8;

  v10 = [[SBLayoutStateTransitionContext alloc] initWithWorkspaceTransaction:self->_currentTransaction];
  v11 = self->_switcherViewController;
  [(SBFluidSwitcherViewController *)v11 layoutStateTransitionCoordinator:0 transitionDidBeginWithTransitionContext:v10];
  objc_initWeak(&location, v11);
  v12 = [(SBFluidSwitcherViewController *)v11 animationControllerForTransitionRequest:v6];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__SBDashBoardCaptureExtensionWorkspaceTransitionManager_executeTransitionRequest_completion___block_invoke;
  v17[3] = &unk_1E6AFAEC0;
  objc_copyWeak(&v21, &location);
  id v18 = 0;
  v13 = v10;
  v19 = v13;
  id v14 = v7;
  id v20 = v14;
  [(SBFluidSwitcherAnimationController *)v12 setAnimationCompletion:v17];
  [(SBFluidSwitcherAnimationController *)v12 begin];
  currentAnimationController = self->_currentAnimationController;
  self->_currentAnimationController = v12;
  v16 = v12;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __93__SBDashBoardCaptureExtensionWorkspaceTransitionManager_executeTransitionRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained layoutStateTransitionCoordinator:*(void *)(a1 + 32) transitionWillEndWithTransitionContext:*(void *)(a1 + 40)];
  [WeakRetained layoutStateTransitionCoordinator:*(void *)(a1 + 32) transitionDidEndWithTransitionContext:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
}

- (void)interruptCurrentTransitionIfNeeded
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    currentAnimationController = self->_currentAnimationController;
    [(SBFluidSwitcherAnimationController *)currentAnimationController interruptWithReason:@"New Dashboard Transaction"];
  }
}

- (id)_transactionForRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 applicationContext];
  id v5 = [v4 activatingEntity];

  int v6 = [v5 isHomeScreenEntity];
  id v7 = off_1E6AF15B8;
  if (!v6) {
    id v7 = off_1E6AECED8;
  }
  v8 = (void *)[objc_alloc(*v7) initWithTransitionRequest:v3];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_currentAnimationController, 0);
  objc_storeStrong((id *)&self->_switcherViewController, 0);
}

@end