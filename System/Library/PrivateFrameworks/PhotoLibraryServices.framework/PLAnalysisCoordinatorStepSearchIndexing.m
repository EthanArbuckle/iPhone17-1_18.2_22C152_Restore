@interface PLAnalysisCoordinatorStepSearchIndexing
- (void)_batchIndexAssetStartingAtIndex:(unint64_t)a3 withAssetIDs:(id)a4 searchIndexingEngine:(id)a5 library:(id)a6 progress:(id)a7 withCompletionHandler:(id)a8;
- (void)_performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5;
- (void)cancel;
- (void)performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation PLAnalysisCoordinatorStepSearchIndexing

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(PLAnalysisCoordinatorStep *)self parentTaskID];
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Search Indexing Step request to be cancelled, iterations will stop", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_batchIndexAssetStartingAtIndex:(unint64_t)a3 withAssetIDs:(id)a4 searchIndexingEngine:(id)a5 library:(id)a6 progress:(id)a7 withCompletionHandler:(id)a8
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = (void (**)(id, void *))a8;
  if ([v14 count] <= a3)
  {
    v22 = (void *)MEMORY[0x1E4F8B9B8];
    v23 = [MEMORY[0x1E4F1CA98] null];
    v24 = [v22 successWithResult:v23];

    v18[2](v18, v24);
  }
  else if ([v17 isCancelled])
  {
    v19 = (void *)MEMORY[0x1E4F8B9B8];
    v20 = (void *)PLErrorCreate();
    v21 = [v19 failureWithError:v20];
    v18[2](v18, v21);
  }
  else
  {
    uint64_t v25 = [v14 count];
    if (v25 - a3 >= 0xC8) {
      uint64_t v26 = 200;
    }
    else {
      uint64_t v26 = v25 - a3;
    }
    v27 = PLAnalysisCoordinatorGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [(PLAnalysisCoordinatorStep *)self parentTaskID];
      *(_DWORD *)buf = 138543874;
      v41 = v28;
      __int16 v42 = 2048;
      unint64_t v43 = a3;
      __int16 v44 = 2048;
      unint64_t v45 = a3 + v26 - 1;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Batch Search Indexing Range [%lu...%lu]", buf, 0x20u);
    }
    v29 = objc_msgSend(v14, "subarrayWithRange:", a3, v26);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __148__PLAnalysisCoordinatorStepSearchIndexing__batchIndexAssetStartingAtIndex_withAssetIDs_searchIndexingEngine_library_progress_withCompletionHandler___block_invoke;
    v30[3] = &unk_1E5863918;
    id v31 = v17;
    v32 = self;
    uint64_t v37 = v26;
    unint64_t v38 = a3;
    uint64_t v39 = 200;
    id v33 = v14;
    id v34 = v15;
    id v35 = v16;
    v36 = v18;
    [v34 indexAssetsIfNeededWithObjectIDs:v29 library:v35 completion:v30];
  }
}

void __148__PLAnalysisCoordinatorStepSearchIndexing__batchIndexAssetStartingAtIndex_withAssetIDs_searchIndexingEngine_library_progress_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isSuccess])
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", *(void *)(a1 + 80) + objc_msgSend(*(id *)(a1 + 32), "completedUnitCount"));
    [*(id *)(a1 + 40) _batchIndexAssetStartingAtIndex:*(void *)(a1 + 96) + *(void *)(a1 + 88) withAssetIDs:*(void *)(a1 + 48) searchIndexingEngine:*(void *)(a1 + 56) library:*(void *)(a1 + 64) progress:*(void *)(a1 + 32) withCompletionHandler:*(void *)(a1 + 72)];
  }
  else
  {
    v4 = PLAnalysisCoordinatorGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = [*(id *)(a1 + 40) parentTaskID];
      v6 = [v3 error];
      int v7 = 138543618;
      v8 = v5;
      __int16 v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Batch Search Indexing Failed with Error: %@", (uint8_t *)&v7, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

- (void)_performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PLAnalysisCoordinatorStep *)self libraryServicesManager];
  v12 = [v11 databaseContext];
  v13 = (void *)[v12 newShortLivedLibraryWithName:"-[PLAnalysisCoordinatorStepSearchIndexing _performStepForAssets:withProgress:withCompletionHandler:]"];

  if (v13)
  {
    id v14 = [(PLAnalysisCoordinatorStep *)self libraryServicesManager];
    id v15 = [v14 searchIndexingEngine];

    if (v15)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __100__PLAnalysisCoordinatorStepSearchIndexing__performStepForAssets_withProgress_withCompletionHandler___block_invoke;
      v21[3] = &unk_1E586F0F0;
      id v22 = v10;
      [(PLAnalysisCoordinatorStepSearchIndexing *)self _batchIndexAssetStartingAtIndex:0 withAssetIDs:v8 searchIndexingEngine:v15 library:v13 progress:v9 withCompletionHandler:v21];
    }
    else
    {
      v18 = (void *)MEMORY[0x1E4F8B9B8];
      v19 = (void *)PLErrorCreate();
      v20 = [v18 failureWithError:v19];
      (*((void (**)(id, void *))v10 + 2))(v10, v20);
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F8B9B8];
    id v15 = (void *)PLErrorCreate();
    id v17 = [v16 failureWithError:v15];
    (*((void (**)(id, void *))v10 + 2))(v10, v17);
  }
}

uint64_t __100__PLAnalysisCoordinatorStepSearchIndexing__performStepForAssets_withProgress_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(PLAnalysisCoordinatorStep *)self parentTaskID];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = (uint64_t)v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting Search Indexing Step", buf, 0xCu);
  }
  PLAnalysisCoordinatorGetLog();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  id v15 = v13;
  id v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    uint64_t v17 = [v8 count];
    v18 = [(PLAnalysisCoordinatorStep *)self parentTaskID];
    *(_DWORD *)buf = 134349314;
    uint64_t v26 = v17;
    __int16 v27 = 2114;
    v28 = v18;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "AnalysisCoordinatorStepSearchIndexing", "asset count: %{public}lu, parent task: %{public}@", buf, 0x16u);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3254779904;
  v21[2] = __99__PLAnalysisCoordinatorStepSearchIndexing_performStepForAssets_withProgress_withCompletionHandler___block_invoke;
  v21[3] = &unk_1EEB29A90;
  void v21[4] = self;
  v23 = v16;
  os_signpost_id_t v24 = v14;
  id v19 = v10;
  id v22 = v19;
  v20 = v16;
  [(PLAnalysisCoordinatorStepSearchIndexing *)self _performStepForAssets:v8 withProgress:v9 withCompletionHandler:v21];
}

void __99__PLAnalysisCoordinatorStepSearchIndexing_performStepForAssets_withProgress_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished Search Indexing Step with result: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  v6 = *(id *)(a1 + 48);
  int v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v8, "AnalysisCoordinatorStepSearchIndexing", "", (uint8_t *)&v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end