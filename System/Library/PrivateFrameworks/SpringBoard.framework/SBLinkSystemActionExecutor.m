@interface SBLinkSystemActionExecutor
- (BOOL)_canBeExecuted;
- (BOOL)_isExecuting;
- (BOOL)_requiresAuthenticationAtLeastOnceSinceBootBeforeExecution;
- (SBLinkSystemActionExecutor)initWithSystemAction:(id)a3;
- (id)_beginInteractiveExecutionWithContext:(id)a3 executionHandler:(id)a4 error:(id *)a5;
- (id)_previewWithCoordinator:(id)a3;
- (void)_cancelPreviewing;
- (void)_finishExecutingWithResult:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation SBLinkSystemActionExecutor

- (SBLinkSystemActionExecutor)initWithSystemAction:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBLinkSystemActionExecutor;
  v3 = [(SBAbstractSystemActionExecutor *)&v7 initWithSystemAction:a3];
  if (v3)
  {
    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    prewarmQueue = v3->_prewarmQueue;
    v3->_prewarmQueue = (OS_dispatch_queue *)SerialWithQoS;
  }
  return v3;
}

- (BOOL)_canBeExecuted
{
  return [(WFStaccatoWorkflowRunnerClient *)self->_runnerClient hasCompletedRun] ^ 1;
}

- (BOOL)_isExecuting
{
  return [(WFStaccatoWorkflowRunnerClient *)self->_runnerClient isRunning];
}

- (BOOL)_requiresAuthenticationAtLeastOnceSinceBootBeforeExecution
{
  return 1;
}

- (id)_previewWithCoordinator:(id)a3
{
  id v5 = a3;
  v6 = [(SBAbstractSystemActionExecutor *)self systemAction];
  objc_super v7 = [v6 configuredAction];
  v8 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = v7;
    v11 = [v10 intent];
    v12 = [(SBSystemActionPreviewContext *)v11 linkAction];
    if (!v12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(%@) Cannot execute action without link action; app intent: %@, configured action: %@",
        self,
        v11,
      v31 = v10);
      v32 = SBLogSystemActionExecution();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        -[SBLinkSystemActionExecutor _previewWithCoordinator:]((uint64_t)v31, v32);
      }

      v18 = SBSystemActionExecutionErrorCreate(1, v31);

      goto LABEL_29;
    }
  }
  id v10 = [v7 associatedBundleIdentifier];
  if (!v10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%@) Cannot execute action without bundle ID; configured action: %@",
      self,
      v7);
    v11 = (SBSystemActionPreviewContext *)objc_claimAutoreleasedReturnValue();
    v17 = SBLogSystemActionExecution();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[SBLinkSystemActionExecutor _previewWithCoordinator:]((uint64_t)v11, v17);
    }

    v18 = SBSystemActionExecutionErrorCreate(1, v11);
    goto LABEL_29;
  }
  v13 = [v7 sectionIdentifier];
  int v14 = [v13 isEqualToString:@"Shortcuts"];

  v15 = self->_runnerClient;
  if (v15)
  {
    v16 = v15;
    v11 = 0;
LABEL_20:
    prewarmQueue = self->_prewarmQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SBLinkSystemActionExecutor__previewWithCoordinator___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(prewarmQueue, block);
    if (v11) {
      int v25 = 0;
    }
    else {
      int v25 = v14;
    }
    if (v25 == 1)
    {
      v11 = objc_alloc_init(SBSystemActionPreviewContext);
      v26 = [v16 presentableRequester];
      [(SBSystemActionPreviewContext *)v11 setClientIdentifier:v26];

      v27 = [v16 presentableIdentifier];
      [(SBSystemActionPreviewContext *)v11 setElementIdentifier:v27];

      v28 = [(SBSystemActionPreviewContext *)v11 userInfo];
      [v28 setObject:v16 forKey:@"SBLinkSystemActionRunnerClient"];
    }
    v29 = [v5 showPreviewForAction:v6 withContext:v11];
    previewAssertion = self->_previewAssertion;
    self->_previewAssertion = v29;

    v18 = 0;
LABEL_29:

    return v18;
  }
  v38 = a2;
  v19 = [v5 previewContextForAction:v6];
  v20 = v19;
  if (v19) {
    int v21 = v14;
  }
  else {
    int v21 = 0;
  }
  if (v21 != 1) {
    goto LABEL_18;
  }
  v22 = [v19 userInfo];
  v16 = [v22 objectForKey:@"SBLinkSystemActionRunnerClient"];

  if (!v16)
  {
LABEL_17:

LABEL_18:
    v16 = (void *)[objc_alloc(MEMORY[0x1E4FB49A0]) initWithStaccatoAction:v7];
    v11 = 0;
LABEL_19:
    [v16 setDelegate:self];
    objc_storeStrong((id *)&self->_runnerClient, v16);

    goto LABEL_20;
  }
  v23 = [v16 action];
  char v37 = [v23 isEqual:v7];

  if (v37)
  {
    if (![v16 hasCompletedRun])
    {
      v11 = v20;
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  v34 = NSString;
  v35 = [v16 action];
  objc_msgSend(v34, "stringWithFormat:", @"The found runner client should be for the same system action; runner client action: %@",
  v36 = v35);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(SBLinkSystemActionExecutor *)v38 _previewWithCoordinator:(uint64_t)v36];
  }
  [v36 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t __54__SBLinkSystemActionExecutor__previewWithCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) userInteractionBegan];
}

- (void)_cancelPreviewing
{
  [(SBSystemActionPreviewInvalidatable *)self->_previewAssertion invalidateAfterDefaultTimeoutForActionCancelled];
  previewAssertion = self->_previewAssertion;
  self->_previewAssertion = 0;
}

- (id)_beginInteractiveExecutionWithContext:(id)a3 executionHandler:(id)a4 error:(id *)a5
{
  objc_super v7 = (void (**)(id, void *))a4;
  id v8 = a3;
  v9 = -[SBCameraActivationManager workspace]((uint64_t)v8);
  id v10 = (id)*MEMORY[0x1E4FB4DD8];
  uint64_t v11 = -[SBHomeScreenConfigurationServer listener]((uint64_t)v8);

  if (v11)
  {
    if (v11 != 1) {
      goto LABEL_6;
    }
    v12 = (id *)MEMORY[0x1E4FB4DC8];
  }
  else
  {
    v12 = (id *)MEMORY[0x1E4FB4DD0];
  }
  id v13 = *v12;

  id v10 = v13;
LABEL_6:
  int v14 = [(SBSystemActionPreviewInvalidatable *)self->_previewAssertion acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed];
  previewAssertion = self->_previewAssertion;
  self->_previewAssertion = 0;

  unint64_t v16 = [(SBAbstractSystemActionExecutor *)self executionGeneration];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__SBLinkSystemActionExecutor__beginInteractiveExecutionWithContext_executionHandler_error___block_invoke;
  v21[3] = &unk_1E6B08740;
  v21[4] = self;
  id v22 = v10;
  id v23 = v9;
  unint64_t v24 = v16;
  id v17 = v9;
  id v18 = v10;
  v19 = (void *)MEMORY[0x1D948C7A0](v21);
  v7[2](v7, v19);

  return v14;
}

void __91__SBLinkSystemActionExecutor__beginInteractiveExecutionWithContext_executionHandler_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  id v5 = *(void **)(*(void *)(a1 + 32) + 56);
  if (a2)
  {
    [v5 startWithInteractionType:*(void *)(a1 + 40) preciseTimeStamp:*(void *)(a1 + 48)];
  }
  else if (([v5 isRunning] & 1) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6 == [*(id *)(a1 + 32) executionGeneration]) {
      [*(id *)(a1 + 32) _finishExecutingWithResult:v7];
    }
  }
}

- (void)_finishExecutingWithResult:(id)a3
{
  runnerClient = self->_runnerClient;
  self->_runnerClient = 0;
  id v5 = a3;

  v6.receiver = self;
  v6.super_class = (Class)SBLinkSystemActionExecutor;
  [(SBAbstractSystemActionExecutor *)&v6 _finishExecutingWithResult:v5];
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = a5;
  if (v6)
  {
    id v10 = v8;
    uint64_t v9 = SBSystemActionExecutionErrorCreateWithError(2, v8);

    id v8 = (id)v9;
  }
  id v11 = v8;
  [(SBLinkSystemActionExecutor *)self _finishExecutingWithResult:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmQueue, 0);
  objc_storeStrong((id *)&self->_runnerClient, 0);
  objc_storeStrong((id *)&self->_previewAssertion, 0);
}

- (void)_previewWithCoordinator:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_FAULT, "%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_previewWithCoordinator:(uint64_t)a3 .cold.3(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  BOOL v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBLinkSystemActionExecutor.m";
  __int16 v16 = 1024;
  int v17 = 95;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end