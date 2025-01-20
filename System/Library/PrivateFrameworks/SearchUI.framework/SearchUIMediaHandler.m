@interface SearchUIMediaHandler
- (BOOL)prefersModalPresentation;
- (BOOL)supportsIntentPath;
- (INIntent)intent;
- (NSString)clientSelectedBundleIdentifier;
- (SFMediaMetadata)mediaMetadata;
- (WFSpotlightResultWorkflowRunnerClient)workflowClient;
- (void)executeFallbackPath;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
- (void)performIntent:(id)a3 withBundleIdentifier:(id)a4;
- (void)setWorkflowClient:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation SearchUIMediaHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  v6 = [(SearchUIMediaHandler *)self clientSelectedBundleIdentifier];
  if ([v6 length])
  {
    v7 = [(SearchUIMediaHandler *)self intent];
    [(SearchUIMediaHandler *)self performIntent:v7 withBundleIdentifier:v6];
  }
  else
  {
    v8 = [(SearchUIMediaHandler *)self mediaMetadata];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke;
    v10[3] = &unk_1E6E73F88;
    id v11 = v8;
    v12 = self;
    id v9 = v8;
    +[SearchUIMediaUtilities predictionForMediaMetadata:v9 completion:v10];
  }
}

void __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke_2;
  v7[3] = &unk_1E6E72938;
  id v8 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:v7];
}

void __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) selectedBundleIdentifier];
  if (!v2) {
    goto LABEL_3;
  }
  id v3 = (void *)v2;
  id v4 = [*(id *)(a1 + 40) bundleIdentifiersToExclude];
  uint64_t v5 = [*(id *)(a1 + 32) selectedBundleIdentifier];
  char v6 = [v4 containsObject:v5];

  if ((v6 & 1) == 0)
  {
    id v8 = SearchUITapLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = [*(id *)(a1 + 32) selectedBundleIdentifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v59 = v9;
      __int16 v60 = 2112;
      v61 = v10;
      _os_log_impl(&dword_1E45B5000, v8, OS_LOG_TYPE_DEFAULT, "%@: performing intent with selectedBundleIdentifier: %@", buf, 0x16u);
    }
    id v11 = *(void **)(a1 + 48);
    v12 = [v11 intent];
    v13 = [*(id *)(a1 + 32) selectedBundleIdentifier];
    [v11 performIntent:v12 withBundleIdentifier:v13];
  }
  else
  {
LABEL_3:
    v7 = +[SearchUIMediaUtilities mediaDestinationsForMediaMetadata:*(void *)(a1 + 40)];
    if ([v7 count])
    {

LABEL_9:
      v16 = objc_opt_new();
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v17 = [*(id *)(a1 + 32) disambiguateBundleIdentifiers];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v53 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v52 + 1) + 8 * i);
            v23 = [*(id *)(a1 + 40) bundleIdentifiersToExclude];
            char v24 = [v23 containsObject:v22];

            if ((v24 & 1) == 0)
            {
              v25 = objc_opt_new();
              [v25 setAppBundleIdentifier:v22];
              [v25 setMediaMetadata:*(void *)(a1 + 40)];
              [v16 addObject:v25];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v57 count:16];
        }
        while (v19);
      }

      v26 = +[SearchUIMediaUtilities mediaDestinationsForMediaMetadata:*(void *)(a1 + 40)];
      [v16 addObjectsFromArray:v26];

      v27 = SearchUITapLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = objc_opt_class();
        v29 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v59 = v28;
        __int16 v60 = 2112;
        v61 = v29;
        _os_log_impl(&dword_1E45B5000, v27, OS_LOG_TYPE_DEFAULT, "%@: adding disambiguationUI for bundleIdentifiers: %@", buf, 0x16u);
      }

      v30 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v31 = a1;
      v32 = [*(id *)(a1 + 40) disambiguationTitle];
      v33 = [v30 alertControllerWithTitle:v32 message:0 preferredStyle:0];

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v12 = v16;
      uint64_t v34 = [v12 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v49;
        do
        {
          v37 = v12;
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v49 != v36) {
              objc_enumerationMutation(v37);
            }
            v39 = *(void **)(*((void *)&v48 + 1) + 8 * j);
            v40 = (void *)MEMORY[0x1E4FB1410];
            v41 = [v39 title];
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke_60;
            v47[3] = &unk_1E6E73F60;
            uint64_t v42 = *(void *)(v31 + 48);
            v47[4] = v39;
            v47[5] = v42;
            v43 = [v40 actionWithTitle:v41 style:0 handler:v47];

            [v33 addAction:v43];
          }
          v12 = v37;
          uint64_t v35 = [v37 countByEnumeratingWithState:&v48 objects:v56 count:16];
        }
        while (v35);
      }

      v44 = (void *)MEMORY[0x1E4FB1410];
      v45 = +[SearchUIUtilities localizedStringForKey:@"CANCEL"];
      v46 = [v44 actionWithTitle:v45 style:1 handler:0];
      [v33 addAction:v46];

      [*(id *)(v31 + 48) requestAuthIfNecessaryAndPresentViewController:v33 animated:1];
      goto LABEL_28;
    }
    v14 = [*(id *)(a1 + 32) disambiguateBundleIdentifiers];
    uint64_t v15 = [v14 count];

    if (v15) {
      goto LABEL_9;
    }
    v12 = SearchUITapLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1(v12);
    }
  }
LABEL_28:
}

void __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke_60(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) command];
  id v3 = [*(id *)(a1 + 40) environment];
  id v4 = +[SearchUICommandHandler handlerForCommand:v2 environment:v3];

  [v4 executeWithTriggerEvent:2];
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

- (void)performIntent:(id)a3 withBundleIdentifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_clientSelectedBundleIdentifier, a4);
  id v8 = SearchUITapLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl(&dword_1E45B5000, v8, OS_LOG_TYPE_DEFAULT, "media bundle identifier selected %@", (uint8_t *)&v10, 0xCu);
  }

  if ([(SearchUIMediaHandler *)self supportsIntentPath])
  {
    [v6 _setLaunchId:v7];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB4978]) initWithIntent:v6];
    [v9 setDelegate:self];
    [v9 start];
    [(SearchUIMediaHandler *)self setWorkflowClient:v9];
    objc_storeStrong((id *)&s_activeHandler, self);
  }
  else
  {
    [(SearchUIMediaHandler *)self executeFallbackPath];
    uint64_t v9 = SearchUITapLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SearchUIMediaHandler performIntent:withBundleIdentifier:]();
    }
  }
}

- (void)executeFallbackPath
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1E45B5000, v0, v1, "No punchouts for media app simply opening app %@", v2, v3, v4, v5, v6);
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v7 = a5;
  id v8 = SearchUITapLog();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SearchUIMediaHandler workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:]();
    }

    [(SearchUIMediaHandler *)self executeFallbackPath];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1E45B5000, v9, OS_LOG_TYPE_DEFAULT, "Audio played successfully", v11, 2u);
    }
  }
  int v10 = (void *)s_activeHandler;
  s_activeHandler = 0;
}

- (NSString)clientSelectedBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (INIntent)intent
{
  return (INIntent *)objc_getProperty(self, a2, 104, 1);
}

- (SFMediaMetadata)mediaMetadata
{
  return (SFMediaMetadata *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)supportsIntentPath
{
  return self->_supportsIntentPath;
}

- (WFSpotlightResultWorkflowRunnerClient)workflowClient
{
  return (WFSpotlightResultWorkflowRunnerClient *)objc_getProperty(self, a2, 120, 1);
}

- (void)setWorkflowClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowClient, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_clientSelectedBundleIdentifier, 0);
}

void __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "No apps available to play intent punchout to app store?", v1, 2u);
}

- (void)performIntent:withBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1E45B5000, v0, v1, "Failed to get siri intent open capability for app %@", v2, v3, v4, v5, v6);
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1E45B5000, v0, v1, "Workflow finished with error: %@", v2, v3, v4, v5, v6);
}

@end