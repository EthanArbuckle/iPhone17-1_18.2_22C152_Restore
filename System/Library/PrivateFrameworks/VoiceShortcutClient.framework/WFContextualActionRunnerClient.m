@interface WFContextualActionRunnerClient
- (WFContextualActionRunnerClient)initWithContextualAction:(id)a3 actionContext:(id)a4;
- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4;
- (void)start;
- (void)startFromQueue;
@end

@implementation WFContextualActionRunnerClient

- (void)startFromQueue
{
  v3 = [(WFWorkflowRunnerClient *)self descriptor];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  v6 = [v5 action];
  v7 = [v5 context];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__WFContextualActionRunnerClient_startFromQueue__block_invoke;
  v9[3] = &unk_1E6076C00;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [v6 configureIfNeededForContext:v8 completion:v9];
}

void __48__WFContextualActionRunnerClient_startFromQueue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    id v8 = [[WFContextualActionRunRequest alloc] initWithAction:v5 actionContext:*(void *)(a1 + 40)];
    v9 = [[WFContextualActionRunDescriptor alloc] initWithAction:v5 context:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setRunRequest:v8];
    [*(id *)(a1 + 32) setDescriptor:v9];
    id v10 = [*(id *)(a1 + 32) runRequest];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
    id v13 = v11;

    v14 = [v13 action];
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    id v16 = v15;

    v17 = [v13 actionContext];
    objc_msgSend(v16, "wf_launchAppIfNeededUsingSurface:", objc_msgSend(v17, "surface"));

    v18.receiver = *(id *)(a1 + 32);
    v18.super_class = (Class)WFContextualActionRunnerClient;
    objc_msgSendSuper2(&v18, sel_start);
  }
  else
  {
    if (v6)
    {
      v12 = (WFContextualActionRunRequest *)v6;
    }
    else
    {
      v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    }
    id v8 = v12;
    v9 = [[WFWorkflowRunResult alloc] initWithError:v12];
    [*(id *)(a1 + 32) dispatchWorkflowResultHandlingWithResult:v9];
  }
}

- (void)start
{
  id v3 = +[WFContextualActionRunQueue sharedQueue];
  [v3 enqueueRun:self];
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  id v8 = +[WFContextualActionRunQueue sharedQueue];
  [v8 runFinished:self];

  v9 = [(WFWorkflowRunnerClient *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = v6;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = [(WFWorkflowRunnerClient *)self delegate];
      id v13 = [v11 files];
      v14 = [v11 error];
      objc_msgSend(v12, "workflowRunnerClient:didFinishRunningWorkflowWithOutputFiles:error:cancelled:", self, v13, v14, objc_msgSend(v11, "isCancelled"));
    }
    else
    {

      v15 = [(WFWorkflowRunnerClient *)self delegate];
      v12 = [v11 error];
      objc_msgSend(v15, "workflowRunnerClient:didFinishRunningWorkflowWithOutputFiles:error:cancelled:", self, 0, v12, objc_msgSend(v11, "isCancelled"));
      id v11 = v15;
    }

    v7[2](v7);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFContextualActionRunnerClient;
    [(WFWorkflowRunnerClient *)&v16 handleWorkflowRunResult:v6 completion:v7];
  }
}

- (WFContextualActionRunnerClient)initWithContextualAction:(id)a3 actionContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[WFContextualActionRunDescriptor alloc] initWithAction:v7 context:v6];
  v9 = [[WFContextualActionRunRequest alloc] initWithAction:v7 actionContext:v6];

  char v10 = [(WFWorkflowRunnerClient *)self initWithDescriptor:v8 runRequest:v9];
  return v10;
}

@end