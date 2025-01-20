@interface SBBlockSystemActionExecutor
- (BOOL)_canBeExecuted;
- (BOOL)_isExecuting;
- (BOOL)_requiresAuthenticationAtLeastOnceSinceBootBeforeExecution;
- (SBBlockSystemActionExecutor)initWithSystemAction:(id)a3;
- (SBSystemActionActionBlockProviding)systemAction;
- (id)_beginInteractiveExecutionWithContext:(id)a3 executionHandler:(id)a4 error:(id *)a5;
- (id)_previewWithCoordinator:(id)a3;
- (void)_cancelPreviewing;
- (void)_handleExecutionBlockFinishedWithResult:(id)a3;
@end

@implementation SBBlockSystemActionExecutor

- (SBBlockSystemActionExecutor)initWithSystemAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBBlockSystemActionExecutor;
  return [(SBAbstractSystemActionExecutor *)&v4 initWithSystemAction:a3];
}

- (SBSystemActionActionBlockProviding)systemAction
{
  v4.receiver = self;
  v4.super_class = (Class)SBBlockSystemActionExecutor;
  v2 = [(SBAbstractSystemActionExecutor *)&v4 systemAction];
  return (SBSystemActionActionBlockProviding *)v2;
}

- (BOOL)_canBeExecuted
{
  return !self->_executing;
}

- (BOOL)_isExecuting
{
  return self->_executing;
}

- (BOOL)_requiresAuthenticationAtLeastOnceSinceBootBeforeExecution
{
  v2 = [(SBBlockSystemActionExecutor *)self systemAction];
  v3 = [v2 configuredAction];
  objc_super v4 = [v3 identifier];

  LOBYTE(v2) = [v4 hasSuffix:*MEMORY[0x1E4FA6948]];
  return (char)v2;
}

- (id)_previewWithCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(SBBlockSystemActionExecutor *)self systemAction];
  v6 = [v4 showPreviewForAction:v5 withContext:0];

  previewAssertion = self->_previewAssertion;
  self->_previewAssertion = v6;

  return 0;
}

- (void)_cancelPreviewing
{
  [(SBSystemActionPreviewInvalidatable *)self->_previewAssertion invalidateAfterDefaultTimeoutForActionCancelled];
  previewAssertion = self->_previewAssertion;
  self->_previewAssertion = 0;
}

- (id)_beginInteractiveExecutionWithContext:(id)a3 executionHandler:(id)a4 error:(id *)a5
{
  id v7 = a3;
  previewAssertion = self->_previewAssertion;
  v9 = (void (**)(id, void *))a4;
  v10 = [(SBSystemActionPreviewInvalidatable *)previewAssertion acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed];
  v11 = self->_previewAssertion;
  self->_previewAssertion = 0;

  self->_executing = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__SBBlockSystemActionExecutor__beginInteractiveExecutionWithContext_executionHandler_error___block_invoke;
  v15[3] = &unk_1E6AFDDB0;
  v15[4] = self;
  id v16 = v7;
  id v12 = v7;
  v13 = (void *)MEMORY[0x1D948C7A0](v15);
  v9[2](v9, v13);

  return v10;
}

void __92__SBBlockSystemActionExecutor__beginInteractiveExecutionWithContext_executionHandler_error___block_invoke(uint64_t a1, int a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = [v3 systemAction];
    v5 = [v4 actionBlock];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __92__SBBlockSystemActionExecutor__beginInteractiveExecutionWithContext_executionHandler_error___block_invoke_2;
    v7[3] = &unk_1E6AFC6D0;
    uint64_t v6 = *(void *)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    ((void (**)(void, uint64_t, void *))v5)[2](v5, v6, v7);
  }
  else
  {
    objc_msgSend(v3, "_handleExecutionBlockFinishedWithResult:");
  }
}

uint64_t __92__SBBlockSystemActionExecutor__beginInteractiveExecutionWithContext_executionHandler_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleExecutionBlockFinishedWithResult:a2];
}

- (void)_handleExecutionBlockFinishedWithResult:(id)a3
{
  self->_executing = 0;
  [(SBAbstractSystemActionExecutor *)self _finishExecutingWithResult:a3];
}

- (void).cxx_destruct
{
}

@end