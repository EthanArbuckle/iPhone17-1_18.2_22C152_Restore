@interface PXCMMFileBackedSaveToLibraryActionPerformer
- (void)performBackgroundTask;
@end

@implementation PXCMMFileBackedSaveToLibraryActionPerformer

- (void)performBackgroundTask
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(PXCMMActionPerformer *)self session];
  v5 = [v4 viewModel];
  v6 = [v5 selectionManager];
  v7 = [v6 selectionSnapshot];

  if (v7)
  {
    v8 = [v7 dataSource];
    v9 = [v7 selectedIndexPaths];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke;
    v17[3] = &unk_1E5DCA3B8;
    id v18 = v3;
    id v19 = v8;
    id v10 = v8;
    [v9 enumerateItemIndexPathsUsingBlock:v17];
  }
  if ([v3 count])
  {
    v11 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_2;
    v15[3] = &unk_1E5DD36F8;
    id v16 = v3;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_196;
    v14[3] = &unk_1E5DD3158;
    v14[4] = self;
    [v11 performChanges:v15 completionHandler:v14];
  }
  else
  {
    v12 = PLSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "CMM File-backed save action triggered without any selected assets. This may indicate a UI logic bug", v13, 2u);
    }

    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:0];
  }
}

void __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, _OWORD *a2)
{
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  v5 = [v2 assetAtItemIndexPath:v6];
  [v3 addObject:v5];
}

void __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8 * v5);
        v7 = [MEMORY[0x1E4F38F28] creationRequestForAsset];
        if ([v6 mediaType] == 1)
        {
          v8 = [v6 url];
          [v7 addResourceWithType:1 fileURL:v8 options:0];
        }
        else
        {
          v8 = PLSharingGetLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v9 = 0;
            _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Non-photo resources aren't supported in this debug flow", v9, 2u);
          }
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

void __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_196(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = PLSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Failed to save assets with error: %@", buf, 0xCu);
    }
  }
  id v6 = v4;
  px_dispatch_on_main_queue();
}

uint64_t __68__PXCMMFileBackedSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_197(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

@end