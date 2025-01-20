@interface PXCPLResumeActionPerformer
- (void)performBackgroundTask;
@end

@implementation PXCPLResumeActionPerformer

- (void)performBackgroundTask
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(PXCPLActionPerformer *)self cplUIStatus];
  unint64_t v4 = [v3 pauseReason];

  v5 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 > 0x12) {
      v6 = 0;
    }
    else {
      v6 = off_1E5DCF288[v4];
    }
    v7 = v6;
    int v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Will resume iCloud Photos for: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  if (v4 > 0x12) {
    v8 = 0;
  }
  else {
    v8 = off_1E5DCF288[v4];
  }
  v9 = v8;
  _PerformPauseOrResumeBackgroundTask(0, v4 == 1, v9, self);
}

@end