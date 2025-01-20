@interface PLAnalysisCoordinatorStepEmpty
- (void)cancel;
- (void)performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation PLAnalysisCoordinatorStepEmpty

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = PLAnalysisCoordinatorGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(PLAnalysisCoordinatorStep *)self parentTaskID];
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unit Test Step cancelled", (uint8_t *)&v5, 0xCu);
  }
}

- (void)performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v7 = (void (**)(id, id))a5;
  id v8 = a4;
  objc_msgSend(v8, "setCompletedUnitCount:", objc_msgSend(v8, "completedUnitCount") + objc_msgSend(a3, "count"));

  v9 = (void *)MEMORY[0x1E4F8B9B8];
  v10 = [MEMORY[0x1E4F1CA98] null];
  id v11 = [v9 successWithResult:v10];

  v7[2](v7, v11);
}

@end