@interface SBWorkspaceTransaction
- (BOOL)_isInterruptingForTransitionRequest;
- (BOOL)canInterruptForTransitionRequest:(id)a3;
- (BOOL)clearsCompletionAsynchronously;
- (BOOL)isMainDisplayTransaction;
- (BOOL)shouldInterceptTransitionRequest:(id)a3;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBSDisplayIdentity)displayIdentity;
- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator;
- (SBSceneManager)sceneManager;
- (SBUIAnimationController)suggestedAnimationController;
- (SBWindowScene)windowScene;
- (SBWorkspaceTransaction)init;
- (SBWorkspaceTransaction)initWithTransitionRequest:(id)a3;
- (SBWorkspaceTransitionRequest)transitionRequest;
- (id)_childWorkspaceTransactions;
- (id)_customizedDescriptionProperties;
- (id)_transitionRequestForInterruption;
- (void)_didComplete;
- (void)_didInterruptForTransitionRequest:(id)a3;
- (void)_performDeviceCoherencyCheck;
- (void)_willInterruptForTransitionRequest:(id)a3;
- (void)interruptForTransitionRequest:(id)a3;
- (void)keepAliveForAsyncBlock:(id)a3;
- (void)setClearsCompletionAsynchronously:(BOOL)a3;
- (void)setSuggestedAnimationController:(id)a3;
@end

@implementation SBWorkspaceTransaction

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (FBSDisplayIdentity)displayIdentity
{
  return [(SBWorkspaceTransitionRequest *)self->_transitionRequest displayIdentity];
}

- (void)_didComplete
{
  [(SBWorkspaceTransaction *)self _performDeviceCoherencyCheck];
  v3.receiver = self;
  v3.super_class = (Class)SBWorkspaceTransaction;
  [(SBWorkspaceTransaction *)&v3 _didComplete];
}

- (void)_performDeviceCoherencyCheck
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F4F718] descriptionForObject:a1];
  v5 = [a1 transitionRequest];
  v6 = [v5 compactDescriptionBuilder];
  v7 = [v6 build];
  int v8 = 138543618;
  v9 = v4;
  __int16 v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Re-locking because device coherency check failed for transaction %{public}@ with transition request %{public}@", (uint8_t *)&v8, 0x16u);
}

- (BOOL)clearsCompletionAsynchronously
{
  return self->_clearsCompletionAsynchronously;
}

- (id)_childWorkspaceTransactions
{
  v2 = [(SBWorkspaceTransaction *)self childTransactions];
  objc_super v3 = objc_msgSend(v2, "bs_objectsOfClass:", objc_opt_class());

  return v3;
}

- (BOOL)_isInterruptingForTransitionRequest
{
  return self->_transitionRequestForPendingInterruption != 0;
}

- (SBUIAnimationController)suggestedAnimationController
{
  return self->_suggestedAnimationController;
}

- (SBWorkspaceTransitionRequest)transitionRequest
{
  return self->_transitionRequest;
}

- (BOOL)shouldInterceptTransitionRequest:(id)a3
{
  return 0;
}

- (SBWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBWorkspaceTransaction;
  v6 = [(SBTransaction *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitionRequest, a3);
    v7->_clearsCompletionAsynchronously = 1;
    int v8 = [(id)SBApp windowSceneManager];
    v9 = [v5 displayIdentity];
    uint64_t v10 = [v8 windowSceneForDisplayIdentity:v9];
    windowScene = v7->_windowScene;
    v7->_windowScene = (SBWindowScene *)v10;

    uint64_t v12 = [(SBWindowScene *)v7->_windowScene layoutStateTransitionCoordinator];
    layoutStateTransitionCoordinator = v7->_layoutStateTransitionCoordinator;
    v7->_layoutStateTransitionCoordinator = (SBLayoutStateTransitionCoordinator *)v12;

    uint64_t v14 = [(SBWindowScene *)v7->_windowScene sceneManager];
    sceneManager = v7->_sceneManager;
    v7->_sceneManager = (SBSceneManager *)v14;

    [(SBWorkspaceTransitionRequest *)v7->_transitionRequest finalize];
  }

  return v7;
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  return self->_layoutStateTransitionCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_transitionRequest, 0);
  objc_storeStrong((id *)&self->_transitionRequestForPendingInterruption, 0);
  objc_storeStrong((id *)&self->_suggestedAnimationController, 0);
}

- (BOOL)isMainDisplayTransaction
{
  v2 = [(SBWorkspaceTransaction *)self windowScene];
  char v3 = [v2 isMainDisplayWindowScene];

  return v3;
}

- (SBSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (SBWorkspaceTransaction)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBWorkspaceTransaction.m" lineNumber:93 description:@"use initWithTransitionRequest:"];

  return 0;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return [(SBWorkspaceTransitionRequest *)self->_transitionRequest displayConfiguration];
}

- (void)keepAliveForAsyncBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(SBWorkspaceTransaction *)self addMilestone:@"keepAliveForAsyncBlock"];
    id v5 = [(SBTransaction *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__SBWorkspaceTransaction_keepAliveForAsyncBlock___block_invoke;
    v6[3] = &unk_1E6AF5A78;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __49__SBWorkspaceTransaction_keepAliveForAsyncBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 removeMilestone:@"keepAliveForAsyncBlock"];
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  return 0;
}

- (void)interruptForTransitionRequest:(id)a3
{
  id v13 = a3;
  if ([(SBWorkspaceTransaction *)self isRunning]
    && ([(SBWorkspaceTransaction *)self isComplete] & 1) == 0
    && ([(SBWorkspaceTransaction *)self isInterrupted] & 1) == 0)
  {
    id v6 = v13;
    if (!v13)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"SBWorkspaceTransaction.m" lineNumber:146 description:@"Transition request cannot be nil when interrupting."];

      id v6 = 0;
    }
    [(SBWorkspaceTransaction *)self _willInterruptForTransitionRequest:v6];
    objc_storeStrong((id *)&self->_transitionRequestForPendingInterruption, a3);
    id v7 = NSString;
    int v8 = [v13 succinctDescriptionBuilder];
    v9 = [v8 build];
    uint64_t v10 = [v7 stringWithFormat:@"Interrupted for transition request: %@", v9];
    [(SBWorkspaceTransaction *)self interruptWithReason:v10];

    transitionRequestForPendingInterruption = self->_transitionRequestForPendingInterruption;
    self->_transitionRequestForPendingInterruption = 0;

    [(SBWorkspaceTransaction *)self _didInterruptForTransitionRequest:v13];
  }
}

- (id)_customizedDescriptionProperties
{
  if ([(SBWorkspaceTransaction *)self _isRootTransaction])
  {
    char v3 = [MEMORY[0x1E4F1CA60] dictionary];
    id v4 = [(SBWorkspaceTransaction *)self transitionRequest];
    id v5 = [v4 succinctDescription];

    if (v5) {
      [v3 setObject:v5 forKey:@"Request"];
    }
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

- (id)_transitionRequestForInterruption
{
  return self->_transitionRequestForPendingInterruption;
}

- (void)_willInterruptForTransitionRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  self->_clearsCompletionAsynchronously = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(SBWorkspaceTransaction *)self _childWorkspaceTransactions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(id **)(*((void *)&v12 + 1) + 8 * v10);
        objc_storeStrong(v11 + 20, a3);
        [v11 _willInterruptForTransitionRequest:v5];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_didInterruptForTransitionRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(SBWorkspaceTransaction *)self _childWorkspaceTransactions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        v11 = (void *)v10[20];
        v10[20] = 0;

        [v10 _didInterruptForTransitionRequest:v4];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)setSuggestedAnimationController:(id)a3
{
}

- (void)setClearsCompletionAsynchronously:(BOOL)a3
{
  self->_clearsCompletionAsynchronously = a3;
}

@end