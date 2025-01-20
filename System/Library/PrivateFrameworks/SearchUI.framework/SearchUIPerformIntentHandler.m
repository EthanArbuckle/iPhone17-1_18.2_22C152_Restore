@interface SearchUIPerformIntentHandler
- (BOOL)shouldDeselectAfterExecution;
- (WFWorkflowRunViewSource)runViewSource;
- (WFWorkflowRunnerClient)runnerClient;
- (void)getUserActivityForCommand:(id)a3 environment:(id)a4 completionHandler:(id)a5;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
- (void)setRunViewSource:(id)a3;
- (void)setRunnerClient:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation SearchUIPerformIntentHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6 = a3;
  v7 = [v6 intentMessageData];
  if (!v7)
  {
    v16 = SearchUIGeneralLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SearchUIPerformIntentHandler performCommand:triggerEvent:environment:](v16);
    }
    goto LABEL_22;
  }
  if (![v6 isRunnableWorkflow])
  {
    v17 = [v6 intentMessageName];
    v9 = INIntentCreate();

    if (!v9)
    {
      id v22 = 0;
      v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v22];
      id v18 = v22;
      if (v18)
      {
        v19 = SearchUIGeneralLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[SearchUIPerformIntentHandler performCommand:triggerEvent:environment:]((uint64_t)v18, v19);
        }
      }
    }
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB4978]) initWithIntent:v9 executionContext:5];
    goto LABEL_19;
  }
  uint64_t v8 = WFSpotlightResultRunnableFromData();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SearchUICommandHandler *)self rowModel];
    v11 = [v10 cardSection];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [(SearchUICommandHandler *)self rowModel];
      v13 = [v12 identifyingResult];
      int v14 = [v13 isLocalApplicationResult];

      if (v14) {
        uint64_t v15 = 4;
      }
      else {
        uint64_t v15 = 1;
      }
    }
    else
    {

      uint64_t v15 = 1;
    }
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB4978]) initWithRunnable:v9 surface:v15];
LABEL_19:
    v16 = v20;
    if (objc_opt_respondsToSelector())
    {
      v21 = [(SearchUIPerformIntentHandler *)self runViewSource];
      [v16 setRunViewSource:v21];
    }
    [v16 setDelegate:self];
    [v16 start];
    [(SearchUIPerformIntentHandler *)self setRunnerClient:v16];
    objc_storeStrong(&s_intentHandler, self);
LABEL_22:
  }
}

- (void)getUserActivityForCommand:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v6 = (void (**)(id, void *, void *))a5;
  v7 = [v12 intentMessageName];
  uint64_t v8 = [v12 intentMessageData];
  v9 = INIntentCreate();

  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithIntent:v9];
    [v10 _setExecutionContext:5];
    v11 = [v12 applicationBundleIdentifier];
    v6[2](v6, v10, v11);
  }
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = SearchUITapLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SearchUIPerformIntentHandler workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:]((uint64_t)v10, v11);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v13 = [v8 runViewSource];
    [v12 postNotificationName:@"SearchUICommandHandlerShortcutDidEndNotification" object:v13];
  }
}

- (BOOL)shouldDeselectAfterExecution
{
  return 1;
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunViewSource:(id)a3
{
}

- (WFWorkflowRunnerClient)runnerClient
{
  return self->_runnerClient;
}

- (void)setRunnerClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runnerClient, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
}

- (void)performCommand:(os_log_t)log triggerEvent:environment:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "SearchUIPerformIntentHandler: empty intentMessageData", v1, 2u);
}

- (void)performCommand:(uint64_t)a1 triggerEvent:(NSObject *)a2 environment:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "SearchuiPerformIntentHandler: %@", (uint8_t *)&v2, 0xCu);
}

- (void)workflowRunnerClient:(uint64_t)a1 didFinishRunningWorkflowWithOutput:(NSObject *)a2 error:cancelled:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "SearchUIPerformIntentHandler: workflowRunnerClient didFinishRunningWorkflowWithError: %@", (uint8_t *)&v2, 0xCu);
}

@end