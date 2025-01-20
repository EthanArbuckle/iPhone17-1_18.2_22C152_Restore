@interface SearchUIOpenUserActivityHandler
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUIOpenUserActivityHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke;
  v9[3] = &unk_1E6E741B8;
  id v10 = v7;
  v11 = self;
  id v8 = v7;
  [(SearchUIOpenUserActivityHandler *)self getUserActivityForCommand:a3 environment:v8 completionHandler:v9];
}

void __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) presentingViewController];
  BOOL v8 = +[SearchUIUtilities downloadDemotedAppIfNecessaryForBundleIdentifier:v6 presentingViewControllerForExplanationAlert:v7];

  if (!v8)
  {
    if (v5)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];
      id v10 = objc_opt_new();
      v11 = +[SearchUIUtilities openApplicationOptions];
      [v10 setFrontBoardOptions:v11];

      v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v12 openUserActivity:v5 usingApplicationRecord:v9 configuration:v10 completionHandler:&__block_literal_global_35];
    }
    else
    {
      v13 = [*(id *)(a1 + 40) rowModel];
      v14 = [v13 identifyingResult];

      v15 = SearchUITapLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(v14, v15);
      }

      if (v6) {
        +[SearchUILaunchAppHandler openApplicationWithBundleIdentifier:v6 environment:*(void *)(a1 + 32)];
      }
    }
  }
}

void __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    id v5 = SearchUIGeneralLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1((uint64_t)v4, v5);
    }
  }
}

void __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 identifier];
  int v5 = 138412546;
  id v6 = a1;
  __int16 v7 = 2112;
  BOOL v8 = v4;
  _os_log_fault_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_FAULT, "nil user activity generated for result: %@ (id: %@)", (uint8_t *)&v5, 0x16u);
}

void __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Failed to open activity with error %@", (uint8_t *)&v2, 0xCu);
}

@end