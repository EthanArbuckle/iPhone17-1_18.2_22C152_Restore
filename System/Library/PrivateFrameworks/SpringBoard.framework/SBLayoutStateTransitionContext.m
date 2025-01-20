@interface SBLayoutStateTransitionContext
- (BOOL)animationsDisabled;
- (BOOL)isComplete;
- (BOOL)isInterrupted;
- (NSError)error;
- (SBLayoutState)fromLayoutState;
- (SBLayoutState)toLayoutState;
- (SBLayoutStateTransitionContext)init;
- (SBLayoutStateTransitionContext)initWithWorkspaceTransaction:(id)a3;
- (SBWorkspaceApplicationSceneTransitionContext)applicationTransitionContext;
- (SBWorkspaceTransaction)workspaceTransaction;
- (void)transitionCompletedWithError:(id)a3;
@end

@implementation SBLayoutStateTransitionContext

- (SBWorkspaceApplicationSceneTransitionContext)applicationTransitionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationTransitionContext);
  return (SBWorkspaceApplicationSceneTransitionContext *)WeakRetained;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (SBLayoutStateTransitionContext)initWithWorkspaceTransaction:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBLayoutStateTransitionContext;
  v5 = [(SBLayoutStateTransitionContext *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_workspaceTransaction, v4);
    v7 = [v4 transitionRequest];
    v8 = [v7 applicationContext];

    uint64_t v9 = [v8 previousLayoutState];
    fromLayoutState = v6->_fromLayoutState;
    v6->_fromLayoutState = (SBLayoutState *)v9;

    uint64_t v11 = [v8 layoutState];
    toLayoutState = v6->_toLayoutState;
    v6->_toLayoutState = (SBLayoutState *)v11;

    objc_storeWeak((id *)&v6->_applicationTransitionContext, v8);
    v6->_animationsDisabled = [v8 animationDisabled];
  }
  return v6;
}

- (SBLayoutState)toLayoutState
{
  return self->_toLayoutState;
}

- (void)transitionCompletedWithError:(id)a3
{
  self->_complete = 1;
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isInterrupted
{
  v3 = [(SBLayoutStateTransitionContext *)self workspaceTransaction];
  if ([v3 isInterrupted])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(SBLayoutStateTransitionContext *)self error];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (NSError)error
{
  return self->_error;
}

- (SBWorkspaceTransaction)workspaceTransaction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workspaceTransaction);
  return (SBWorkspaceTransaction *)WeakRetained;
}

- (SBLayoutState)fromLayoutState
{
  return self->_fromLayoutState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationTransitionContext);
  objc_destroyWeak((id *)&self->_workspaceTransaction);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_toLayoutState, 0);
  objc_storeStrong((id *)&self->_fromLayoutState, 0);
}

- (SBLayoutStateTransitionContext)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%@ does not support initialization.", v6 format];

  return [(SBLayoutStateTransitionContext *)self initWithWorkspaceTransaction:0];
}

- (BOOL)animationsDisabled
{
  return self->_animationsDisabled;
}

@end