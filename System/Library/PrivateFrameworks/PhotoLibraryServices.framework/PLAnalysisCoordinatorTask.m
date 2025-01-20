@interface PLAnalysisCoordinatorTask
+ (id)_orderedStepsForFeature:(unint64_t)a3 withLibraryServicesManager:(id)a4 taskID:(id)a5;
- (NSProgress)progress;
- (NSString)taskID;
- (id)initForFeature:(unint64_t)a3 assets:(id)a4 lsm:(id)a5;
- (void)_cancel;
- (void)_executeStepsStartingAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)executeWithCompletionHandler:(id)a3;
@end

@implementation PLAnalysisCoordinatorTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)taskID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)_cancel
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    taskID = self->_taskID;
    int v10 = 138543362;
    v11 = taskID;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cancelling Task", (uint8_t *)&v10, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock_currentStepIndex);
  unint64_t currentStepIndex = self->_currentStepIndex;
  if (currentStepIndex >= [(NSArray *)self->_steps count])
  {
    v6 = PLAnalysisCoordinatorGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_taskID;
      NSUInteger v8 = [(NSArray *)self->_steps count];
      unint64_t v9 = self->_currentStepIndex;
      int v10 = 138543874;
      v11 = v7;
      __int16 v12 = 2050;
      NSUInteger v13 = v8;
      __int16 v14 = 2050;
      unint64_t v15 = v9;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] All %{public}lu steps completed, nothing to cancel. %{public}lu step out of bounds", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    v6 = [(NSArray *)self->_steps objectAtIndexedSubscript:self->_currentStepIndex];
    [v6 cancel];
  }

  os_unfair_lock_unlock(&self->_lock_currentStepIndex);
}

- (void)executeWithCompletionHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _os_activity_create(&dword_19B3C7000, "analysis-coordinator-task", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    taskID = self->_taskID;
    *(_DWORD *)buf = 138543362;
    NSUInteger v25 = (NSUInteger)taskID;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting Task", buf, 0xCu);
  }

  PLAnalysisCoordinatorGetLog();
  NSUInteger v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  int v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    NSUInteger v12 = [(NSArray *)self->_assets count];
    NSUInteger v13 = self->_taskID;
    *(_DWORD *)buf = 134218242;
    NSUInteger v25 = v12;
    __int16 v26 = 2114;
    v27 = v13;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AnalysisCoordinatorTask", "asset count: %lu, uuid: %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  progress = self->_progress;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__PLAnalysisCoordinatorTask_executeWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E5875F08;
  objc_copyWeak(&v22, (id *)buf);
  [(NSProgress *)progress setCancellationHandler:v21];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3254779904;
  v17[2] = __58__PLAnalysisCoordinatorTask_executeWithCompletionHandler___block_invoke_2;
  v17[3] = &unk_1EEB29A90;
  v17[4] = self;
  unint64_t v15 = v11;
  v19 = v15;
  os_signpost_id_t v20 = v9;
  id v16 = v4;
  id v18 = v16;
  [(PLAnalysisCoordinatorTask *)self _executeStepsStartingAtIndex:0 withCompletionHandler:v17];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

  os_activity_scope_leave(&state);
}

void __58__PLAnalysisCoordinatorTask_executeWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancel];
}

void __58__PLAnalysisCoordinatorTask_executeWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 56);
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finishing Task with result: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = *(id *)(a1 + 48);
  v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v8, "AnalysisCoordinatorTask", "", (uint8_t *)&v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_executeStepsStartingAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void *))a4;
  os_unfair_lock_lock(&self->_lock_currentStepIndex);
  self->_unint64_t currentStepIndex = a3;
  os_unfair_lock_unlock(&self->_lock_currentStepIndex);
  if ([(NSArray *)self->_steps count] <= a3)
  {
    __int16 v14 = (void *)MEMORY[0x1E4F8B9B8];
    unint64_t v15 = [MEMORY[0x1E4F1CA98] null];
    id v16 = [v14 successWithResult:v15];

    v6[2](v6, v16);
  }
  else
  {
    v7 = PLAnalysisCoordinatorGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      taskID = self->_taskID;
      *(_DWORD *)buf = 138543618;
      v24 = taskID;
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing step %lu", buf, 0x16u);
    }

    if ([(NSProgress *)self->_progress isCancelled])
    {
      int v9 = PLAnalysisCoordinatorGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = self->_taskID;
        *(_DWORD *)buf = 138543618;
        v24 = v10;
        __int16 v25 = 2048;
        unint64_t v26 = a3;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Abandoning step %lu due to cancelled progress", buf, 0x16u);
      }

      __int16 v11 = (void *)MEMORY[0x1E4F8B9B8];
      id v12 = (void *)PLErrorCreate();
      uint64_t v13 = [v11 failureWithError:v12];
      v6[2](v6, v13);
    }
    else
    {
      v17 = [(NSArray *)self->_steps objectAtIndexedSubscript:a3];
      assets = self->_assets;
      progress = self->_progress;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __80__PLAnalysisCoordinatorTask__executeStepsStartingAtIndex_withCompletionHandler___block_invoke;
      v20[3] = &unk_1E586AA80;
      v20[4] = self;
      unint64_t v22 = a3;
      v21 = v6;
      [v17 performStepForAssets:assets withProgress:progress withCompletionHandler:v20];
    }
  }
}

void __80__PLAnalysisCoordinatorTask__executeStepsStartingAtIndex_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isFailure])
  {
    id v4 = PLAnalysisCoordinatorGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 56);
      uint64_t v6 = *(void *)(a1 + 48);
      v7 = [v3 error];
      int v8 = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Step %lu failed due to %@", (uint8_t *)&v8, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _executeStepsStartingAtIndex:*(void *)(a1 + 48) + 1 withCompletionHandler:*(void *)(a1 + 40)];
  }
}

- (id)initForFeature:(unint64_t)a3 assets:(id)a4 lsm:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PLAnalysisCoordinatorTask;
  __int16 v12 = [(PLAnalysisCoordinatorTask *)&v25 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];
    taskID = v12->_taskID;
    v12->_taskID = (NSString *)v14;

    objc_storeStrong((id *)&v12->_assets, a4);
    objc_storeStrong((id *)&v12->_lsm, a5);
    uint64_t v16 = +[PLAnalysisCoordinatorTask _orderedStepsForFeature:a3 withLibraryServicesManager:v11 taskID:v12->_taskID];
    steps = v12->_steps;
    v12->_steps = (NSArray *)v16;

    if (![(NSArray *)v12->_steps count])
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:v12 file:@"PLAnalysisCoordinatorTask.m" lineNumber:48 description:@"Task must have at least one step"];
    }
    uint64_t v18 = [(NSArray *)v12->_steps count];
    uint64_t v19 = [v10 count];
    uint64_t v20 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v19 * v18];
    progress = v12->_progress;
    v12->_progress = (NSProgress *)v20;

    v12->_unint64_t currentStepIndex = 0;
    v12->_lock_currentStepIndex._os_unfair_lock_opaque = 0;
    unint64_t v22 = v12;
  }

  return v12;
}

+ (id)_orderedStepsForFeature:(unint64_t)a3 withLibraryServicesManager:(id)a4 taskID:(id)a5
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  switch(a3)
  {
    case 1uLL:
      uint64_t v9 = [[PLAnalysisCoordinatorStepMediaAnalysis alloc] initWithLibraryServicesManager:v7 parentTaskID:v8 processingType:1];
      v22[0] = v9;
      id v10 = [[PLAnalysisCoordinatorStepMediaAnalysis alloc] initWithLibraryServicesManager:v7 parentTaskID:v8 processingType:16];
      v22[1] = v10;
      id v11 = [[PLAnalysisCoordinatorStepSearchIndexing alloc] initWithLibraryServicesManager:v7 parentTaskID:v8];
      v22[2] = v11;
      __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];

      goto LABEL_10;
    case 2uLL:
      uint64_t v9 = [[PLAnalysisCoordinatorStepSearchIndexing alloc] initWithLibraryServicesManager:v7 parentTaskID:v8];
      v21[0] = v9;
      id v10 = [[PLAnalysisCoordinatorStepSearchSuggestions alloc] initWithLibraryServicesManager:v7 parentTaskID:v8];
      v21[1] = v10;
      uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = v21;
      goto LABEL_9;
    case 3uLL:
      uint64_t v9 = [[PLAnalysisCoordinatorStepMediaAnalysis alloc] initWithLibraryServicesManager:v7 parentTaskID:v8 processingType:1];
      v20[0] = v9;
      id v10 = [[PLAnalysisCoordinatorStepSearchIndexing alloc] initWithLibraryServicesManager:v7 parentTaskID:v8];
      v20[1] = v10;
      uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = v20;
      goto LABEL_9;
    case 4uLL:
      uint64_t v9 = [[PLAnalysisCoordinatorStepMediaAnalysis alloc] initWithLibraryServicesManager:v7 parentTaskID:v8 processingType:8];
      uint64_t v19 = v9;
      __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      goto LABEL_11;
    case 5uLL:
      uint64_t v9 = [[PLAnalysisCoordinatorStepMediaAnalysis alloc] initWithLibraryServicesManager:v7 parentTaskID:v8 processingType:1];
      v18[0] = v9;
      id v10 = [[PLAnalysisCoordinatorStepMediaAnalysis alloc] initWithLibraryServicesManager:v7 parentTaskID:v8 processingType:8];
      v18[1] = v10;
      uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = v18;
      goto LABEL_9;
    default:
      if (a3 == 100)
      {
        uint64_t v9 = [[PLAnalysisCoordinatorStepEmpty alloc] initWithLibraryServicesManager:v7 parentTaskID:v8];
        v17[0] = v9;
        id v10 = [[PLAnalysisCoordinatorStepEmpty alloc] initWithLibraryServicesManager:v7 parentTaskID:v8];
        v17[1] = v10;
        uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v14 = v17;
LABEL_9:
        __int16 v12 = [v13 arrayWithObjects:v14 count:2];
LABEL_10:
      }
      else
      {
        PLAnalysisCoordinatorGetLog();
        uint64_t v9 = (PLAnalysisCoordinatorStepMediaAnalysis *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t v16 = 0;
          _os_log_impl(&dword_19B3C7000, &v9->super.super, OS_LOG_TYPE_FAULT, "Unaccounted for AnalysisCoordinatorFeature", v16, 2u);
        }
        __int16 v12 = (void *)MEMORY[0x1E4F1CBF0];
      }
LABEL_11:

      return v12;
  }
}

@end