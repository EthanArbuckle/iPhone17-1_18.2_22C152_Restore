@interface SearchUIRunShortcutHandler
+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4;
- (ATXActionSearchResultExecution)action;
- (BOOL)shouldDeselectAfterExecution;
- (WFWorkflowRunViewSource)runViewSource;
- (WFWorkflowRunnerClient)workFlowRunnerClient;
- (id)actionProvider;
- (unint64_t)destination;
- (void)actionSearchResultExecution:(id)a3 didDismissRemoteAlertWithReason:(int64_t)a4 actionCompleted:(BOOL)a5 withResult:(int64_t)a6 shouldClearAction:(BOOL)a7;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
- (void)removeRowModel;
- (void)setAction:(id)a3;
- (void)setRunViewSource:(id)a3;
- (void)setWorkFlowRunnerClient:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation SearchUIRunShortcutHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  v4 = [a3 identifyingResult];
  BOOL v5 = +[SearchUIUtilities resultIsSiriAction:v4];

  if (v5) {
    v6 = objc_opt_new();
  }
  else {
    v6 = 0;
  }
  return v6;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6 = a3;
  v7 = [(SearchUICommandHandler *)self rowModel];
  v8 = [v7 identifyingResult];

  if (+[SearchUIUtilities resultBlockedForScreenTime:v8])
  {
    goto LABEL_10;
  }
  uint64_t v9 = [v8 identifier];
  if (!v9) {
    goto LABEL_9;
  }
  v10 = (void *)v9;
  v11 = [v8 sectionBundleIdentifier];
  v12 = +[SearchUIUtilities bundleIdentifierForApp:15];
  if (([v11 isEqualToString:v12] & 1) == 0)
  {

    goto LABEL_9;
  }
  char v13 = [MEMORY[0x1E4FAE198] isMacOS];

  if (v13)
  {
LABEL_9:
    v16 = [MEMORY[0x1E4FB4540] standardClient];
    v17 = [v6 voiceShortcutIdentifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__SearchUIRunShortcutHandler_performCommand_triggerEvent_environment___block_invoke;
    v18[3] = &unk_1E6E74328;
    id v19 = v6;
    v20 = self;
    [v16 getVoiceShortcutWithIdentifier:v17 completion:v18];

    goto LABEL_10;
  }
  v14 = objc_opt_new();
  [v14 setSearchResult:v8];
  [v14 setDelegate:self];
  if (objc_opt_respondsToSelector())
  {
    v15 = [(SearchUIRunShortcutHandler *)self runViewSource];
    [v14 setRunViewSource:v15];
  }
  [v14 executeShortcut];
  [(SearchUIRunShortcutHandler *)self setAction:v14];
  objc_storeStrong((id *)&s_activeHandler_0, self);

LABEL_10:
}

void __70__SearchUIRunShortcutHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 shortcut];
  if (!v3)
  {
    v4 = SearchUIGeneralLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__SearchUIRunShortcutHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(a1, v4);
    }
  }
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4FB49C0]) initWithINShortcut:v3 executionContext:5];
  [v5 setDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setWorkFlowRunnerClient:v5];
  id v6 = [*(id *)(a1 + 40) workFlowRunnerClient];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [*(id *)(a1 + 40) workFlowRunnerClient];
    uint64_t v9 = [*(id *)(a1 + 40) runViewSource];
    [v8 setRunViewSource:v9];
  }
  objc_storeStrong((id *)&s_activeHandler_0, *(id *)(a1 + 40));
  [v5 start];
}

- (unint64_t)destination
{
  v2 = [(SearchUICommandHandler *)self rowModel];
  v3 = [v2 punchouts];
  v4 = [v3 firstObject];
  if ([v4 isRunnableInBackground]) {
    unint64_t v5 = 3;
  }
  else {
    unint64_t v5 = 2;
  }

  return v5;
}

- (void)actionSearchResultExecution:(id)a3 didDismissRemoteAlertWithReason:(int64_t)a4 actionCompleted:(BOOL)a5 withResult:(int64_t)a6 shouldClearAction:(BOOL)a7
{
  id v11 = a3;
  if (objc_opt_respondsToSelector())
  {
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    char v13 = [v11 runViewSource];
    [v12 postNotificationName:@"SearchUICommandHandlerShortcutDidEndNotification" object:v13];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __135__SearchUIRunShortcutHandler_actionSearchResultExecution_didDismissRemoteAlertWithReason_actionCompleted_withResult_shouldClearAction___block_invoke;
  v15[3] = &unk_1E6E74350;
  BOOL v19 = a7;
  v15[4] = self;
  id v16 = v11;
  int64_t v17 = a6;
  int64_t v18 = a4;
  id v14 = v11;
  +[SearchUIUtilities dispatchMainIfNecessary:v15];
}

void __135__SearchUIRunShortcutHandler_actionSearchResultExecution_didDismissRemoteAlertWithReason_actionCompleted_withResult_shouldClearAction___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) removeRowModel];
  }
  v2 = [*(id *)(a1 + 32) environment];
  id v17 = [v2 feedbackDelegate];

  if (objc_opt_respondsToSelector())
  {
    if (*(void *)(a1 + 48) == 4)
    {
      v3 = [*(id *)(a1 + 40) searchResult];
      v4 = [v3 punchout];
      unint64_t v5 = v4;
      if (v4) {
        id v6 = v4;
      }
      else {
        id v6 = (id)objc_opt_new();
      }
      char v7 = v6;
    }
    else
    {
      char v7 = 0;
    }
    id v8 = objc_alloc(MEMORY[0x1E4F99F30]);
    uint64_t v9 = [*(id *)(a1 + 32) rowModel];
    v10 = [v9 cardSection];
    id v11 = (void *)[v8 initWithCardSection:v10 destination:v7 triggerEvent:2 actionCardType:0];

    v12 = [*(id *)(a1 + 40) searchResult];
    objc_msgSend(v11, "setQueryId:", objc_msgSend(v12, "queryId"));

    [v17 didEngageCardSection:v11];
  }
  if (objc_opt_respondsToSelector())
  {
    unint64_t v13 = *(void *)(a1 + 56) - 1;
    if (v13 > 2) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = qword_1E46B6A88[v13];
    }
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F99F48]) initWithEvent:v14];
    [v17 cardViewDidDisappear:v15];
  }
  id v16 = (void *)s_activeHandler_0;
  s_activeHandler_0 = 0;
}

- (id)actionProvider
{
  v3 = [(SearchUICommandHandler *)self environment];
  v4 = [(SearchUICommandHandler *)self rowModel];
  unint64_t v5 = (void *)MEMORY[0x1E4F4B770];
  id v6 = [v4 identifyingResult];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__SearchUIRunShortcutHandler_actionProvider__block_invoke;
  v13[3] = &unk_1E6E72730;
  v13[4] = self;
  char v7 = [v5 actionProviderForSearchResult:v6 dismissSearchResultHandler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__SearchUIRunShortcutHandler_actionProvider__block_invoke_2;
  v11[3] = &unk_1E6E74378;
  id v12 = v7;
  id v8 = v7;
  uint64_t v9 = _Block_copy(v11);

  return v9;
}

uint64_t __44__SearchUIRunShortcutHandler_actionProvider__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeRowModel];
}

uint64_t __44__SearchUIRunShortcutHandler_actionProvider__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = SearchUITapLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SearchUIRunShortcutHandler workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:]((uint64_t)v10, v11);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    unint64_t v13 = [v8 runViewSource];
    [v12 postNotificationName:@"SearchUICommandHandlerShortcutDidEndNotification" object:v13];
  }
}

- (BOOL)shouldDeselectAfterExecution
{
  return 1;
}

- (void)removeRowModel
{
  v3 = [(SearchUICommandHandler *)self environment];
  v4 = [v3 feedbackDelegate];

  if (objc_opt_respondsToSelector())
  {
    dispatch_time_t v5 = dispatch_time(0, 400000000);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__SearchUIRunShortcutHandler_removeRowModel__block_invoke;
    v6[3] = &unk_1E6E72620;
    id v7 = v4;
    id v8 = self;
    dispatch_after(v5, MEMORY[0x1E4F14428], v6);
  }
}

void __44__SearchUIRunShortcutHandler_removeRowModel__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) rowModel];
  [v1 removeRowModel:v2 completion:0];
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunViewSource:(id)a3
{
}

- (ATXActionSearchResultExecution)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (WFWorkflowRunnerClient)workFlowRunnerClient
{
  return self->_workFlowRunnerClient;
}

- (void)setWorkFlowRunnerClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workFlowRunnerClient, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
}

void __70__SearchUIRunShortcutHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 32) voiceShortcutIdentifier];
  int v4 = 138412290;
  dispatch_time_t v5 = v3;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "SearchUIRunShortcutHandler: No INShortcut for identifier: %@", (uint8_t *)&v4, 0xCu);
}

- (void)workflowRunnerClient:(uint64_t)a1 didFinishRunningWorkflowWithOutput:(NSObject *)a2 error:cancelled:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "SearchUIRunShortcutHandler workflowRunnerClient didFinishRunningWorkflowWith error: %@", (uint8_t *)&v2, 0xCu);
}

@end