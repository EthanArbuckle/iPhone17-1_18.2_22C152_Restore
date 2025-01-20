@interface PXSearchSettings
@end

@implementation PXSearchSettings

void __48__PXSearchSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = a2;
  v5 = [v3 alertControllerWithTitle:@"Search Indexing Status" message:@"Requesting progress..." preferredStyle:1];
  v6 = (void *)MEMORY[0x1E4F1CB00];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_2;
  v19[3] = &unk_1E5F2BBD8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v21 = v5;
  uint64_t v22 = v8;
  id v20 = v7;
  id v9 = v5;
  v10 = [v6 scheduledTimerWithTimeInterval:1 repeats:v19 block:2.0];
  v11 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_5;
  v17 = &unk_1E5F2BF98;
  id v18 = v10;
  id v12 = v10;
  v13 = [v11 actionWithTitle:@"OK" style:0 handler:&v14];
  objc_msgSend(v9, "addAction:", v13, v14, v15, v16, v17);

  [v4 presentViewController:v9 animated:1 completion:0];
}

uint64_t __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Rebuild Search Index" message:@"Are you sure you want to rebuild your search index?" preferredStyle:1];
  v6 = (void *)MEMORY[0x1E4FB1410];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_7;
  v12[3] = &unk_1E5F2BC00;
  id v13 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v14 = v4;
  id v15 = v7;
  id v8 = v4;
  id v9 = [v6 actionWithTitle:@"Rebuild" style:2 handler:v12];
  [v5 addAction:v9];

  v10 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v5 addAction:v10];

  [v8 presentViewController:v5 animated:1 completion:0];
  return 1;
}

uint64_t __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_105(uint64_t a1)
{
  return 1;
}

void __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_7(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) debugClient];
  id v5 = 0;
  [v2 rebuildSearchIndexWithError:&v5];
  id v3 = v5;

  if (v3)
  {
    id v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_ERROR, "Unable to rebuild search index with error: %@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) libraryInternalClient];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_3;
  v8[3] = &unk_1E5F2BBB0;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  [v4 getSearchIndexProgress:v8];
}

uint64_t __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, uint64_t a2, char a3, double a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_4;
  v5[3] = &unk_1E5F2BB88;
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = a2;
  char v11 = a3;
  double v10 = a4;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 48) _formatIndexingStatusAlertMessageForRemainingCount:*(void *)(a1 + 56) isPaused:*(unsigned __int8 *)(a1 + 72) elapsedTimeSincePause:*(double *)(a1 + 64)];
  id v3 = (id)v2;
  if (!*(void *)(a1 + 56))
  {
    [*(id *)(a1 + 32) invalidate];
    uint64_t v2 = (uint64_t)v3;
  }
  [*(id *)(a1 + 40) setMessage:v2];
}

@end