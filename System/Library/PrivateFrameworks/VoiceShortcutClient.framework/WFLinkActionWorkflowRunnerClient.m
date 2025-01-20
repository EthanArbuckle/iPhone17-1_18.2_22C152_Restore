@interface WFLinkActionWorkflowRunnerClient
- (BOOL)shouldUseRunnerInfrastructureForRequest:(id)a3 action:(id)a4;
- (NSString)linkRunnerClientRunSourceOverride;
- (WFLinkActionWorkflowRunnerClient)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 runSource:(int64_t)a6 authenticationPolicy:(int64_t)a7;
- (WFLinkActionWorkflowRunnerClient)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 runSource:(int64_t)a6 runSourceOverride:(id)a7 authenticationPolicy:(int64_t)a8;
- (WFLinkActionWorkflowRunnerClient)initWithLinkAction:(id)a3 bundleIdentifier:(id)a4 runSource:(int64_t)a5;
- (int64_t)linkRunnerClientRunSource;
- (unsigned)transcriptActionSourceForSurface:(unint64_t)a3;
- (void)finishWithError:(id)a3;
- (void)start;
@end

@implementation WFLinkActionWorkflowRunnerClient

- (void).cxx_destruct
{
}

- (NSString)linkRunnerClientRunSourceOverride
{
  return self->_linkRunnerClientRunSourceOverride;
}

- (int64_t)linkRunnerClientRunSource
{
  return self->_linkRunnerClientRunSource;
}

- (WFLinkActionWorkflowRunnerClient)initWithLinkAction:(id)a3 bundleIdentifier:(id)a4 runSource:(int64_t)a5
{
  return [(WFLinkActionWorkflowRunnerClient *)self initWithLinkAction:a3 appBundleIdentifier:a4 extensionBundleIdentifier:0 runSource:a5 authenticationPolicy:0];
}

- (void)finishWithError:(id)a3
{
  id v11 = a3;
  v4 = [(WFWorkflowRunnerClient *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  v6 = [(WFWorkflowRunnerClient *)self delegate];
  v7 = v6;
  if (v5)
  {
    [v6 workflowRunnerClient:self didFinishRunningWorkflowWithOutput:0 error:v11 cancelled:0];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();

    v9 = [(WFWorkflowRunnerClient *)self delegate];
    v7 = v9;
    if (v8)
    {
      [v9 workflowRunnerClient:self didFinishRunningWorkflowWithAllResults:0 error:v11 cancelled:0];
    }
    else
    {
      char v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0) {
        goto LABEL_8;
      }
      v7 = [(WFWorkflowRunnerClient *)self delegate];
      [v7 workflowRunnerClient:self didFinishRunningWorkflowWithError:v11 cancelled:0];
    }
  }

LABEL_8:
}

- (void)start
{
  v3 = [(WFWorkflowRunnerClient *)self runRequest];
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
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if ([(WFLinkActionWorkflowRunnerClient *)self shouldUseRunnerInfrastructureForRequest:v5 action:v8])
  {
    v31.receiver = self;
    v31.super_class = (Class)WFLinkActionWorkflowRunnerClient;
    [(WFWorkflowRunnerClient *)&v31 start];
  }
  else
  {
    v9 = [v8 linkAction];
    char v10 = [v5 actionContext];
    uint64_t v11 = -[WFLinkActionWorkflowRunnerClient transcriptActionSourceForSurface:](self, "transcriptActionSourceForSurface:", [v10 surface]);

    v12 = [WFLinkActionExecutor alloc];
    v13 = [v8 appBundleIdentifier];
    v14 = [v8 extensionBundleIdentifier];
    uint64_t v15 = [v8 authenticationPolicy];
    v16 = [(WFLinkActionWorkflowRunnerClient *)self linkRunnerClientRunSourceOverride];
    id v30 = 0;
    v17 = [(WFLinkActionExecutor *)v12 initWithLinkAction:v9 appBundleIdentifier:v13 extensionBundleIdentifier:v14 authenticationPolicy:v15 source:v11 sourceOverride:v16 error:&v30];
    id v18 = v30;

    if (v17)
    {
      v19 = [(WFLinkActionExecutor *)v17 metadata];
      v20 = [v19 systemProtocols];

      v21 = [MEMORY[0x1E4F72DD0] sessionStartingProtocol];
      int v22 = [v20 containsObject:v21];

      if (v22)
      {
        v29.receiver = self;
        v29.super_class = (Class)WFLinkActionWorkflowRunnerClient;
        [(WFWorkflowRunnerClient *)&v29 start];
      }
      else
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __41__WFLinkActionWorkflowRunnerClient_start__block_invoke;
        v23[3] = &unk_1E6077FC8;
        v24 = v17;
        v25 = self;
        id v26 = v8;
        id v27 = v9;
        id v28 = v5;
        [(WFLinkActionExecutor *)v24 performWithCompletionHandler:v23];
      }
    }
    else
    {
      [(WFLinkActionWorkflowRunnerClient *)self finishWithError:v18];
    }
  }
}

void __41__WFLinkActionWorkflowRunnerClient_start__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  [a1[5] finishWithError:v3];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __41__WFLinkActionWorkflowRunnerClient_start__block_invoke_2;
  v12 = &unk_1E6077FA0;
  id v13 = a1[6];
  id v14 = a1[7];
  id v4 = v3;
  id v15 = v4;
  id v16 = a1[8];
  id v5 = &v9;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  v6 = (void (*)(__CFString *, uint64_t *))getAnalyticsSendEventLazySymbolLoc_ptr;
  v21 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getAnalyticsSendEventLazySymbolLoc_block_invoke;
    v17[3] = &unk_1E6079C28;
    v17[4] = &v18;
    __getAnalyticsSendEventLazySymbolLoc_block_invoke(v17);
    v6 = (void (*)(__CFString *, uint64_t *))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (v6)
  {
    v6(@"com.apple.shortcuts.RunActionFinish", v5);
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void soft_AnalyticsSendEventLazy(const NSString *__strong, NSDictionary<NSString *,NSObject *> *(^__strong)(void))");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"WFLinkActionWorkflowRunnerClient.m", 26, @"%s", dlerror(), v9, v10, v11, v12, v13, v14, v15);

    __break(1u);
  }
}

id __41__WFLinkActionWorkflowRunnerClient_start__block_invoke_2(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"actionIdentifier";
  v2 = [*(id *)(a1 + 32) appBundleIdentifier];
  v10[0] = v2;
  id v3 = [*(id *)(a1 + 40) identifier];
  v10[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v5 = [v4 componentsJoinedByString:@"."];
  v12[0] = v5;
  v11[1] = @"completed";
  v6 = [NSNumber numberWithInt:*(void *)(a1 + 48) == 0];
  v12[1] = v6;
  v11[2] = @"runSource";
  v7 = [*(id *)(a1 + 56) runSource];
  v12[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v8;
}

- (BOOL)shouldUseRunnerInfrastructureForRequest:(id)a3 action:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    goto LABEL_8;
  }
  v7 = [v5 actionContext];
  if ([v7 surface] != 10)
  {
    id v8 = [v5 actionContext];
    if ([v8 surface] == 11)
    {

      goto LABEL_5;
    }
    uint64_t v10 = [v5 actionContext];
    uint64_t v11 = [v10 surface];

    if (v11 == 18) {
      goto LABEL_6;
    }
LABEL_8:
    BOOL v9 = 1;
    goto LABEL_9;
  }
LABEL_5:

LABEL_6:
  BOOL v9 = 0;
LABEL_9:

  return v9;
}

- (unsigned)transcriptActionSourceForSurface:(unint64_t)a3
{
  if (a3 - 2 > 0xE) {
    return 0;
  }
  else {
    return word_1B3D88B50[a3 - 2];
  }
}

- (WFLinkActionWorkflowRunnerClient)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 runSource:(int64_t)a6 runSourceOverride:(id)a7 authenticationPolicy:(int64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v36 = (NSString *)a7;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"WFLinkActionWorkflowRunnerClient.m", 69, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"WFLinkActionWorkflowRunnerClient.m", 70, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

LABEL_3:
  uint64_t v18 = [WFLinkContextualAction alloc];
  if (a8 == 2) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = a8 == 1;
  }
  uint64_t v20 = [(WFLinkContextualAction *)v18 initWithAction:v15 appBundleIdentifier:v16 extensionBundleIdentifier:v17 authenticationPolicy:v19];
  v21 = [WFContextualActionContext alloc];
  if ((unint64_t)a6 > 9) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = qword_1B3D88B00[a6];
  }
  v23 = [(WFContextualActionContext *)v21 initWithSurface:v22];
  v24 = [[WFContextualActionRunDescriptor alloc] initWithAction:v20 context:v23];
  v25 = [[WFContextualActionRunRequest alloc] initWithAction:v20 actionContext:v23];
  id v26 = v15;
  if ([(WFContextualActionContext *)v23 surface] == 10
    || [(WFContextualActionContext *)v23 surface] == 11)
  {
    id v27 = v17;
    uint64_t v28 = 3;
  }
  else
  {
    id v27 = v17;
    if ([(WFContextualActionContext *)v23 surface] == 18) {
      uint64_t v28 = 3;
    }
    else {
      uint64_t v28 = 0;
    }
  }
  [(WFWorkflowRunRequest *)v25 setPresentationMode:v28];
  self->_linkRunnerClientRunSource = a6;
  linkRunnerClientRunSourceOverride = self->_linkRunnerClientRunSourceOverride;
  self->_linkRunnerClientRunSourceOverride = v36;
  id v30 = v36;

  v37.receiver = self;
  v37.super_class = (Class)WFLinkActionWorkflowRunnerClient;
  objc_super v31 = [(WFWorkflowRunnerClient *)&v37 initWithDescriptor:v24 runRequest:v25];

  if (v31) {
    v32 = v31;
  }

  return v31;
}

- (WFLinkActionWorkflowRunnerClient)initWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 runSource:(int64_t)a6 authenticationPolicy:(int64_t)a7
{
  return [(WFLinkActionWorkflowRunnerClient *)self initWithLinkAction:a3 appBundleIdentifier:a4 extensionBundleIdentifier:a5 runSource:a6 runSourceOverride:0 authenticationPolicy:a7];
}

@end