@interface PXCPLManageCellularDataDisabledActionPerformer
- (void)performBackgroundTask;
@end

@implementation PXCPLManageCellularDataDisabledActionPerformer

- (void)performBackgroundTask
{
  v3 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "Will navigate to cellular settings", buf, 2u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__PXCPLManageCellularDataDisabledActionPerformer_performBackgroundTask__block_invoke;
  v4[3] = &unk_1E5DD3158;
  v4[4] = self;
  +[PXSystemNavigation navigateToDestination:9 completion:v4];
}

void __71__PXCPLManageCellularDataDisabledActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PLUserStatusUIGetLog();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      v8 = "Did navigate to cellular settings";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 2;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v9, v10, v8, (uint8_t *)&v12, v11);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412290;
    id v13 = v5;
    v8 = "Failed to navigate to cellular settings: %@";
    v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 12;
    goto LABEL_6;
  }

  [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:v5];
}

@end