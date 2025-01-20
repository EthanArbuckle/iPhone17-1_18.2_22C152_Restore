@interface PLAnalysisCoordinatorStepSearchSuggestions
- (void)_performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5;
- (void)cancel;
- (void)performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation PLAnalysisCoordinatorStepSearchSuggestions

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(PLAnalysisCoordinatorStep *)self parentTaskID];
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Search Suggestions Step request to be cancelled, cannot actively stop but step will end soon", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, NSObject *))a5;
  v11 = [(PLAnalysisCoordinatorStep *)self libraryServicesManager];
  v12 = [v11 databaseContext];
  v13 = (void *)[v12 newShortLivedLibraryWithName:"-[PLAnalysisCoordinatorStepSearchSuggestions _performStepForAssets:withProgress:withCompletionHandler:]"];

  if (v13)
  {
    v14 = [v13 libraryServicesManager];
    uint64_t v15 = [v14 wellKnownPhotoLibraryIdentifier];

    if (v15 == 1)
    {
      +[PLInitialSuggestionsManager generateInitialSuggestionsForPhotoLibrary:v13];
      objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v9, "completedUnitCount") + objc_msgSend(v8, "count"));
      v16 = (void *)MEMORY[0x1E4F8B9B8];
      v17 = [MEMORY[0x1E4F1CA98] null];
      v18 = [v16 successWithResult:v17];

      v10[2](v10, v18);
    }
    else
    {
      v18 = PLBackendGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 134217984;
        uint64_t v23 = v15;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Initial suggestion generation requested for unsupported library with identifier: %tu. No initial suggestions will be generated.", (uint8_t *)&v22, 0xCu);
      }
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F8B9B8];
    v20 = (void *)PLErrorCreate();
    v21 = [v19 failureWithError:v20];
    v10[2](v10, v21);
  }
}

- (void)performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(PLAnalysisCoordinatorStep *)self parentTaskID];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = (uint64_t)v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting Search Suggestions Step", buf, 0xCu);
  }
  PLAnalysisCoordinatorGetLog();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  uint64_t v15 = v13;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    uint64_t v17 = [v8 count];
    v18 = [(PLAnalysisCoordinatorStep *)self parentTaskID];
    *(_DWORD *)buf = 134349314;
    uint64_t v26 = v17;
    __int16 v27 = 2114;
    v28 = v18;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "AnalysisCoordinatorStepSearchSuggestions", "asset count: %{public}lu, parent task: %{public}@", buf, 0x16u);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3254779904;
  v21[2] = __102__PLAnalysisCoordinatorStepSearchSuggestions_performStepForAssets_withProgress_withCompletionHandler___block_invoke;
  v21[3] = &unk_1EEB29A90;
  v21[4] = self;
  uint64_t v23 = v16;
  os_signpost_id_t v24 = v14;
  id v19 = v10;
  id v22 = v19;
  v20 = v16;
  [(PLAnalysisCoordinatorStepSearchSuggestions *)self _performStepForAssets:v8 withProgress:v9 withCompletionHandler:v21];
}

void __102__PLAnalysisCoordinatorStepSearchSuggestions_performStepForAssets_withProgress_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [*(id *)(a1 + 32) parentTaskID];
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished Search Suggestions Step with result: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  v6 = *(id *)(a1 + 48);
  uint64_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v8, "AnalysisCoordinatorStepSearchSuggestions", "", (uint8_t *)&v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end