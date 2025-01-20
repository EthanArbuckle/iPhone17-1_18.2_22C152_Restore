@interface PXCPLLearnMoreClientVersionTooOldInformationActionPerformer
- (void)_didOpenURL:(BOOL)a3;
- (void)performBackgroundTask;
@end

@implementation PXCPLLearnMoreClientVersionTooOldInformationActionPerformer

- (void)_didOpenURL:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    v5 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Did navigate to 'client version too old' KB article", buf, 2u);
    }
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to navigate to 'client version too old' KB article");
    v5 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Failed to navigate to 'client version too old' KB article", v7, 2u);
    }
  }

  [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:v3 error:v6];
}

- (void)performBackgroundTask
{
  BOOL v3 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "Will navigate to 'client version too old' KB article", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht212139?cid=mc-ols-icloudphotos-article_ht212139-ios_ui-01212021"];
  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__PXCPLLearnMoreClientVersionTooOldInformationActionPerformer_performBackgroundTask__block_invoke;
  v6[3] = &unk_1E5DCE660;
  objc_copyWeak(&v7, buf);
  [v5 openURL:v4 withCompletionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __84__PXCPLLearnMoreClientVersionTooOldInformationActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didOpenURL:a2];
}

@end