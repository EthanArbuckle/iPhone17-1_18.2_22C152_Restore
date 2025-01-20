@interface WFShowResultAction
- (BOOL)getInputContentFromVariablesInParameterState:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFShowResultAction

- (BOOL)getInputContentFromVariablesInParameterState:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (WFGetVariableInputContentForPreviewing(v8, v9, v10))
  {
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFShowResultAction;
    BOOL v11 = [(WFAction *)&v13 getInputContentFromVariablesInParameterState:v8 context:v9 completionHandler:v10];
  }

  return v11;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFAction *)self userInterface];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__WFShowResultAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_1E6557668;
  v6[4] = self;
  WFShowResult(v4, v5, 1, v6);
}

uint64_t __49__WFShowResultAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

@end