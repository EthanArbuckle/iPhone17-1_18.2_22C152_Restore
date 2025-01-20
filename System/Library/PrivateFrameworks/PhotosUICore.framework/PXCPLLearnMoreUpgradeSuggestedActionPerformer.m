@interface PXCPLLearnMoreUpgradeSuggestedActionPerformer
- (void)_didOpenURL:(BOOL)a3;
- (void)performBackgroundTask;
@end

@implementation PXCPLLearnMoreUpgradeSuggestedActionPerformer

- (void)_didOpenURL:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    v5 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Did navigate to 'upgrade suggested' KB article", buf, 2u);
    }
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to navigate to 'upgrade suggested' KB article");
    v5 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Failed to navigate to 'upgrade suggested' KB article", v7, 2u);
    }
  }

  [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:v3 error:v6];
}

- (void)performBackgroundTask
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXPhotoKitCPLActionPerformer *)self photoLibrary];
  v4 = [v3 cplStatus];

  uint64_t v5 = [v4 clientFeatureCompatibleVersion];
  uint64_t v6 = [v4 serverFeatureCompatibleVersion];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"deviceFeatureVersion=%lu", v5);
    [v7 addObject:v8];
  }
  if (v6)
  {
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"serverFeatureVersion=%lu#%lu", v6, v6);
    [v7 addObject:v9];
  }
  if ([v7 count])
  {
    v10 = [@"https://support.apple.com/kb/HT210706" stringByAppendingString:@"?"];
    v11 = [v7 componentsJoinedByString:@"&"];
    v12 = [v10 stringByAppendingString:v11];
  }
  else
  {
    v12 = @"https://support.apple.com/kb/HT210706";
  }
  v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];

  v14 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v13;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "Will navigate to 'upgrade suggested' KB article with URL: \"%{public}@\"", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v15 = [MEMORY[0x1E4FB1438] sharedApplication];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__PXCPLLearnMoreUpgradeSuggestedActionPerformer_performBackgroundTask__block_invoke;
  v16[3] = &unk_1E5DCE660;
  objc_copyWeak(&v17, (id *)buf);
  [v15 openURL:v13 withCompletionHandler:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __70__PXCPLLearnMoreUpgradeSuggestedActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didOpenURL:a2];
}

@end