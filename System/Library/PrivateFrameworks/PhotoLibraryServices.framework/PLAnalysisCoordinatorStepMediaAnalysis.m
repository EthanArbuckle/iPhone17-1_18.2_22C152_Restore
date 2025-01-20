@interface PLAnalysisCoordinatorStepMediaAnalysis
- (PLAnalysisCoordinatorStepMediaAnalysis)initWithLibraryServicesManager:(id)a3 parentTaskID:(id)a4 processingType:(unint64_t)a5;
- (void)_performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5;
- (void)cancel;
- (void)performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation PLAnalysisCoordinatorStepMediaAnalysis

- (void)cancel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_lock_int64_t currentMediaAnalysisRequestID = &self->_lock_currentMediaAnalysisRequestID;
  os_unfair_lock_lock(&self->_lock_currentMediaAnalysisRequestID);
  int64_t currentMediaAnalysisRequestID = self->_currentMediaAnalysisRequestID;
  int64_t v5 = +[PLMediaAnalysisServiceRequestAdapter invalidVCPRequestID];
  v6 = PLAnalysisCoordinatorGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (currentMediaAnalysisRequestID == v5)
  {
    if (v7)
    {
      v8 = [(PLAnalysisCoordinatorStep *)self parentTaskID];
      int v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cancelling Media Analysis step but no active media request ID", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      v9 = [(PLAnalysisCoordinatorStep *)self parentTaskID];
      int64_t v10 = self->_currentMediaAnalysisRequestID;
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2048;
      int64_t v14 = v10;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cancelling Media Analysis step with media request ID: %lu", (uint8_t *)&v11, 0x16u);
    }
    +[PLMediaAnalysisServiceRequestAdapter cancelRequest:self->_currentMediaAnalysisRequestID];
    self->_int64_t currentMediaAnalysisRequestID = +[PLMediaAnalysisServiceRequestAdapter invalidVCPRequestID];
  }
  os_unfair_lock_unlock(p_lock_currentMediaAnalysisRequestID);
}

- (void)_performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(PLAnalysisCoordinatorStep *)self libraryServicesManager];
  v12 = [v11 databaseContext];
  __int16 v13 = (void *)[v12 newShortLivedLibraryWithName:"-[PLAnalysisCoordinatorStepMediaAnalysis _performStepForAssets:withProgress:withCompletionHandler:]"];

  if (v13)
  {
    uint64_t v14 = [v8 count];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __99__PLAnalysisCoordinatorStepMediaAnalysis__performStepForAssets_withProgress_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E58747F0;
    id v19 = v8;
    id v20 = v13;
    v21 = self;
    id v22 = v9;
    uint64_t v24 = v14;
    id v23 = v10;
    [v20 performBlockAndWait:v18];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F8B9B8];
    v16 = (void *)PLErrorCreate();
    v17 = [v15 failureWithError:v16];
    (*((void (**)(id, void *))v10 + 2))(v10, v17);
  }
}

void __99__PLAnalysisCoordinatorStepMediaAnalysis__performStepForAssets_withProgress_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedAsset assetsWithObjectIDs:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v25 + 1) + 8 * v8) uuid];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 32));
  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = v10[5];
  v12 = [v10 libraryServicesManager];
  __int16 v13 = [v12 libraryURL];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __99__PLAnalysisCoordinatorStepMediaAnalysis__performStepForAssets_withProgress_withCompletionHandler___block_invoke_2;
  v24[3] = &unk_1E586EC20;
  v24[4] = *(void *)(a1 + 48);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __99__PLAnalysisCoordinatorStepMediaAnalysis__performStepForAssets_withProgress_withCompletionHandler___block_invoke_33;
  id v20 = &unk_1E586EC48;
  id v14 = *(id *)(a1 + 56);
  v16 = *(void **)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 72);
  id v21 = v14;
  uint64_t v23 = v15;
  id v22 = v16;
  *(void *)(*(void *)(a1 + 48) + 24) = +[PLMediaAnalysisServiceRequestAdapter requestProcessingTypes:v11 forAssetsWithLocalIdentifiers:v3 fromPhotoLibraryWithURL:v13 progressHandler:v24 completionHandler:&v17];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 32));
  if (objc_msgSend(*(id *)(a1 + 56), "isCancelled", v17, v18, v19, v20)) {
    [*(id *)(a1 + 48) cancel];
  }
}

void __99__PLAnalysisCoordinatorStepMediaAnalysis__performStepForAssets_withProgress_withCompletionHandler___block_invoke_2(uint64_t a1, double a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) parentTaskID];
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2048;
    double v9 = a2;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Progress update: %f", (uint8_t *)&v6, 0x16u);
  }
}

void __99__PLAnalysisCoordinatorStepMediaAnalysis__performStepForAssets_withProgress_withCompletionHandler___block_invoke_33(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", *(void *)(a1 + 48) + objc_msgSend(*(id *)(a1 + 32), "completedUnitCount"));
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)MEMORY[0x1E4F8B9B8];
  if (v7)
  {
    uint64_t v5 = [MEMORY[0x1E4F8B9B8] failureWithError:v7];
  }
  else
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v5 = [v4 successWithResult:v6];
  }
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

- (void)performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(PLAnalysisCoordinatorStep *)self parentTaskID];
    unint64_t processingType = self->_processingType;
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = (uint64_t)v12;
    __int16 v29 = 2048;
    unint64_t v30 = processingType;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting Media Analysis Step. Type: %lu", buf, 0x16u);
  }
  PLAnalysisCoordinatorGetLog();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  v16 = v14;
  uint64_t v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    uint64_t v18 = [v8 count];
    unint64_t v19 = self->_processingType;
    id v20 = [(PLAnalysisCoordinatorStep *)self parentTaskID];
    *(_DWORD *)buf = 134349570;
    uint64_t v28 = v18;
    __int16 v29 = 2050;
    unint64_t v30 = v19;
    __int16 v31 = 2114;
    v32 = v20;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "AnalysisCoordinatorStepMediaAnalysis", "asset count: %{public}lu, type: %{public}lu, parent task: %{public}@", buf, 0x20u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3254779904;
  v23[2] = __98__PLAnalysisCoordinatorStepMediaAnalysis_performStepForAssets_withProgress_withCompletionHandler___block_invoke;
  v23[3] = &unk_1EEB29A90;
  v23[4] = self;
  long long v25 = v17;
  os_signpost_id_t v26 = v15;
  id v21 = v10;
  id v24 = v21;
  id v22 = v17;
  [(PLAnalysisCoordinatorStepMediaAnalysis *)self _performStepForAssets:v8 withProgress:v9 withCompletionHandler:v23];
}

void __98__PLAnalysisCoordinatorStepMediaAnalysis_performStepForAssets_withProgress_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) parentTaskID];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 40);
    int v10 = 138543874;
    uint64_t v11 = v5;
    __int16 v12 = 2050;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished Media Analysis Step for type: %{public}lu with result: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  id v7 = *(id *)(a1 + 48);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_END, v9, "AnalysisCoordinatorStepMediaAnalysis", "", (uint8_t *)&v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (PLAnalysisCoordinatorStepMediaAnalysis)initWithLibraryServicesManager:(id)a3 parentTaskID:(id)a4 processingType:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PLAnalysisCoordinatorStepMediaAnalysis;
  result = [(PLAnalysisCoordinatorStep *)&v7 initWithLibraryServicesManager:a3 parentTaskID:a4];
  if (result) {
    result->_unint64_t processingType = a5;
  }
  return result;
}

@end