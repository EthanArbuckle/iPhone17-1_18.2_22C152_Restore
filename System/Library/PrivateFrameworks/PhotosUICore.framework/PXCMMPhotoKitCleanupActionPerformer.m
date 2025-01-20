@interface PXCMMPhotoKitCleanupActionPerformer
- (void)_activateSuggestion:(id)a3 completionHandler:(id)a4;
- (void)performBackgroundTask;
@end

@implementation PXCMMPhotoKitCleanupActionPerformer

- (void)_activateSuggestion:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = PLSharingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Will mark suggestion as active: %@", buf, 0xCu);
  }

  v8 = [v5 photoLibrary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__PXCMMPhotoKitCleanupActionPerformer__activateSuggestion_completionHandler___block_invoke;
  v14[3] = &unk_1E5DD36F8;
  id v15 = v5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__PXCMMPhotoKitCleanupActionPerformer__activateSuggestion_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5DD2B90;
  id v12 = v15;
  id v13 = v6;
  id v9 = v6;
  id v10 = v15;
  [v8 performChanges:v14 completionHandler:v11];
}

void __77__PXCMMPhotoKitCleanupActionPerformer__activateSuggestion_completionHandler___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F39318] changeRequestForSuggestion:*(void *)(a1 + 32)];
  [v1 markActive];
}

void __77__PXCMMPhotoKitCleanupActionPerformer__activateSuggestion_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLSharingGetLog();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v8;
      id v9 = "Did mark suggestion as active: %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v15 = 138412546;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    id v18 = v5;
    id v9 = "Failed to mark suggestion as active: %@, error: %@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v5, v14);
}

- (void)performBackgroundTask
{
  v3 = [(PXCMMActionPerformer *)self session];
  v4 = [v3 viewModel];
  id v5 = [v4 shareURL];

  if (v5)
  {
    id v6 = [v3 viewModel];
    [v6 performChanges:&__block_literal_global_20220];

    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    char v33 = 1;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    char v31 = 1;
    *(void *)buf = 0;
    v25 = buf;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__20221;
    v28 = __Block_byref_object_dispose__20222;
    id v29 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__20221;
    v22[4] = __Block_byref_object_dispose__20222;
    id v23 = 0;
    v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    uint64_t v8 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_191;
    block[3] = &unk_1E5DBC600;
    id v18 = v5;
    v20 = v32;
    v21 = buf;
    id v9 = v7;
    uint64_t v19 = v9;
    dispatch_async(v8, block);

    id v10 = [v3 suggestion];
    if (v10)
    {
      dispatch_group_enter(v9);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_3;
      v13[3] = &unk_1E5DD1AB0;
      int v15 = v30;
      uint64_t v16 = v22;
      uint64_t v14 = v9;
      [(PXCMMPhotoKitCleanupActionPerformer *)self _activateSuggestion:v10 completionHandler:v13];
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_4;
    v12[3] = &unk_1E5DCA520;
    v12[6] = v22;
    v12[7] = buf;
    v12[4] = self;
    v12[5] = v32;
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], v12);

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    os_log_type_t v11 = PLSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Cleanup CMM phase without a share URL. Nothing to clean up", buf, 2u);
    }

    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:0];
  }
}

void __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_191(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_2;
  v4[3] = &unk_1E5DD1AB0;
  uint64_t v6 = *(void *)(a1 + 56);
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  _PXDeleteMomentShareForURL(v1, 1, v4);
}

void __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v1 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  }
  else {
    BOOL v1 = 0;
  }
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v2) {
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:v1 error:v2];
}

void __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __60__PXCMMPhotoKitCleanupActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShareURL:0];
}

@end