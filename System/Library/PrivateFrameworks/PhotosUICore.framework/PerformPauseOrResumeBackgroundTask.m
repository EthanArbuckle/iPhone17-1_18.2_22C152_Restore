@interface PerformPauseOrResumeBackgroundTask
@end

@implementation PerformPauseOrResumeBackgroundTask

void ___PerformPauseOrResumeBackgroundTask_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PLUserStatusUIGetLog();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v8;
      v9 = "Did %{public}@ system budgets for iCloud Photos";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v13;
    __int16 v22 = 2112;
    id v23 = v5;
    v9 = "Failed to %{public}@ system budgets for iCloud Photos with error: %@";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___PerformPauseOrResumeBackgroundTask_block_invoke_127;
  block[3] = &unk_1E5DD21E8;
  id v14 = *(id *)(a1 + 40);
  char v19 = a2;
  id v17 = v14;
  id v18 = v5;
  id v15 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t ___PerformPauseOrResumeBackgroundTask_block_invoke_127(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

@end