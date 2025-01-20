@interface WFSpotlightResultWorkflowRunnerClient
- (BOOL)runnableRequiresSpotlightRefresh:(id)a3;
- (WFSpotlightResultWorkflowRunnerClient)initWithIntent:(id)a3;
- (WFSpotlightResultWorkflowRunnerClient)initWithIntent:(id)a3 executionContext:(int64_t)a4;
- (WFSpotlightResultWorkflowRunnerClient)initWithRunnable:(id)a3 surface:(unint64_t)a4;
- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4;
- (void)start;
@end

@implementation WFSpotlightResultWorkflowRunnerClient

- (void).cxx_destruct
{
}

- (BOOL)runnableRequiresSpotlightRefresh:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFSpotlightResultWorkflowRunnerClient.m", 326, @"Invalid parameter not satisfying: %@", @"runnable" object file lineNumber description];

    char v9 = 0;
    goto LABEL_5;
  }
  id v7 = v5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v10 = v7;
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();
LABEL_5:

    goto LABEL_6;
  }
  char v9 = 1;
LABEL_6:

  return v9 & 1;
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
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  char v9 = [v5 actionContext];
  objc_msgSend(v8, "wf_launchAppIfNeededUsingSurface:", objc_msgSend(v9, "surface"));

  v10.receiver = self;
  v10.super_class = (Class)WFSpotlightResultWorkflowRunnerClient;
  [(WFWorkflowRunnerClient *)&v10 start];
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__WFSpotlightResultWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke;
  v11[3] = &unk_1E6078FB0;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  v10.receiver = self;
  v10.super_class = (Class)WFSpotlightResultWorkflowRunnerClient;
  id v8 = v6;
  id v9 = v7;
  [(WFWorkflowRunnerClient *)&v10 handleWorkflowRunResult:v8 completion:v11];
}

uint64_t __76__WFSpotlightResultWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[11];
  }
  id v7 = v2;
  v3 = [*(id *)(a1 + 40) error];
  if (v3) {
    goto LABEL_4;
  }
  uint64_t v4 = [*(id *)(a1 + 40) isCancelled];
  id v5 = v7;
  if (v7)
  {
    if ((v4 & 1) == 0)
    {
      uint64_t v4 = [*(id *)(a1 + 32) runnableRequiresSpotlightRefresh:v7];
      id v5 = v7;
      if (v4)
      {
        v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v3 postNotificationName:@"com.apple.shortcuts.spotlight.refresh" object:0];
LABEL_4:

        id v5 = v7;
      }
    }
  }
  return MEMORY[0x1F41817F8](v4, v5);
}

- (WFSpotlightResultWorkflowRunnerClient)initWithIntent:(id)a3 executionContext:(int64_t)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F30738];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] _initWithIntent:v7];

  id v9 = WFWorkflowRunDescriptorForINShortcut(v8);

  objc_super v10 = [[WFWorkflowRunRequest alloc] initWithInput:0 presentationMode:1];
  v11 = WFRunSourceForSpotlightExecutionContext(a4);
  [(WFWorkflowRunRequest *)v10 setRunSource:v11];

  [(WFWorkflowRunRequest *)v10 setDonateInteraction:0];
  id v12 = [(WFWorkflowRunnerClient *)self initWithDescriptor:v9 runRequest:v10];

  return v12;
}

- (WFSpotlightResultWorkflowRunnerClient)initWithIntent:(id)a3
{
  v3 = [(WFSpotlightResultWorkflowRunnerClient *)self initWithIntent:a3 executionContext:0];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [(WFWorkflowRunnerClient *)v3 runRequest];
    [v5 setRunSource:@"spotlight-search-detail-page"];

    id v6 = v4;
  }

  return v4;
}

- (WFSpotlightResultWorkflowRunnerClient)initWithRunnable:(id)a3 surface:(unint64_t)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_runnable, a3);
  id v8 = [v7 runDescriptorForSurface:a4];
  id v9 = [v7 runRequestForSurface:a4];
  objc_super v10 = [v7 settingBiomeStreamIdentifier];

  if (v10) {
    [v9 setPresentationMode:3];
  }
  v11 = [(WFWorkflowRunnerClient *)self initWithDescriptor:v8 runRequest:v9];

  return v11;
}

@end