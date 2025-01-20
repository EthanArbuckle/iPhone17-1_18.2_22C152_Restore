@interface PUPhotoKitRemoveActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (BOOL)assetActionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)assetActionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)shouldShowConfirmation;
- (NSDictionary)fetchResultsByAssetCollection;
- (PUPhotoKitTrashActionPerformer)trashActionPerformer;
- (id)undoManagerForAssetActionPerformer:(id)a3;
- (void)_performTrashTask;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
- (void)setFetchResultsByAssetCollection:(id)a3;
- (void)setTrashActionPerformer:(id)a3;
@end

@implementation PUPhotoKitRemoveActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashActionPerformer, 0);
  objc_storeStrong((id *)&self->_fetchResultsByAssetCollection, 0);
}

- (void)setTrashActionPerformer:(id)a3
{
}

- (PUPhotoKitTrashActionPerformer)trashActionPerformer
{
  return self->_trashActionPerformer;
}

- (void)setFetchResultsByAssetCollection:(id)a3
{
}

- (NSDictionary)fetchResultsByAssetCollection
{
  return self->_fetchResultsByAssetCollection;
}

- (BOOL)assetActionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(PUAssetActionPerformer *)self delegate];
  LOBYTE(self) = [v9 assetActionPerformer:self dismissViewController:v8 completionHandler:v7];

  return (char)self;
}

- (BOOL)assetActionPerformer:(id)a3 presentViewController:(id)a4
{
  return [(PUAssetActionPerformer *)self presentViewController:a4];
}

- (id)undoManagerForAssetActionPerformer:(id)a3
{
  id v4 = a3;
  v5 = [(PUAssetActionPerformer *)self delegate];
  v6 = [v5 undoManagerForAssetActionPerformer:v4];

  return v6;
}

- (void)performBackgroundTask
{
  v3 = [(PUPhotoKitRemoveActionPerformer *)self trashActionPerformer];

  if (v3)
  {
    [(PUAssetActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:0];
  }
  else
  {
    [(PUPhotoKitActionPerformer *)self instantlyExcludeAssetsFromDataSource];
    id v4 = [(PUAssetActionPerformer *)self assetsByAssetCollection];
    v5 = (void *)MEMORY[0x1E4F90460];
    v6 = [v4 allKeys];
    id v7 = [v5 dataSourceWithAssetCollections:v6];

    id v8 = [v7 selectionSnapshotForAssetsByAssetCollection:v4];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F90600]) initWithSelectionSnapshot:v8];
    v10 = [(PUAssetActionPerformer *)self undoManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__PUPhotoKitRemoveActionPerformer_performBackgroundTask__block_invoke;
    v11[3] = &unk_1E5F2E3B8;
    v11[4] = self;
    [v9 executeWithUndoManager:v10 completionHandler:v11];
  }
}

void __56__PUPhotoKitRemoveActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) stopExcludingAssetsFromDataSource];
  }
  [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:v5];
}

- (void)_performTrashTask
{
  v3 = [PUPhotoKitTrashActionPerformer alloc];
  id v4 = [(PUAssetActionPerformer *)self assets];
  id v5 = [(PUAssetActionPerformer *)self assetsByAssetCollection];
  v6 = [(PUAssetActionPerformer *)v3 initWithActionType:8 assets:v4 orAssetsByAssetCollection:v5];

  [(PUAssetActionPerformer *)v6 setDelegate:self];
  [(PUPhotoKitRemoveActionPerformer *)self setTrashActionPerformer:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PUPhotoKitRemoveActionPerformer__performTrashTask__block_invoke;
  v7[3] = &unk_1E5F2E3B8;
  v7[4] = self;
  [(PUAssetActionPerformer *)v6 performWithCompletionHandler:v7];
}

uint64_t __52__PUPhotoKitRemoveActionPerformer__performTrashTask__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:0];
}

- (void)performUserInteractionTask
{
  if ([(PUPhotoKitRemoveActionPerformer *)self shouldShowConfirmation])
  {
    uint64_t v4 = [(PUAssetActionPerformer *)self assets];
    id v5 = [(PUAssetActionPerformer *)self assetsByAssetCollection];
    v6 = [v5 allKeys];
    id v7 = [v6 firstObject];

    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x2020000000;
        char v38 = 1;
        id v8 = [(PUAssetActionPerformer *)self assetsByAssetCollection];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke;
        v34[3] = &unk_1E5F29908;
        v34[4] = &v35;
        [v8 enumerateKeysAndObjectsUsingBlock:v34];

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_3;
        aBlock[3] = &unk_1E5F2BF98;
        aBlock[4] = self;
        v29 = _Block_copy(aBlock);
        if ([v7 canPerformEditOperation:2])
        {
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_4;
          v32[3] = &unk_1E5F2BF98;
          v32[4] = self;
          v9 = _Block_copy(v32);
        }
        else
        {
          v9 = 0;
        }
        v27 = v7;
        if (*((unsigned char *)v36 + 24))
        {
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_5;
          v31[3] = &unk_1E5F2BF98;
          v31[4] = self;
          v10 = _Block_copy(v31);
        }
        else
        {
          v10 = 0;
        }
        v28 = (void *)v4;
        v11 = [MEMORY[0x1E4F90488] warningStringForAssets:v4 isDeleting:1];
        v12 = PULocalizedString(@"CANCEL");
        v13 = PULocalizedString(@"REMOVE_FROM_ALBUM_BUTTON");
        v14 = PULocalizedString(@"DELETE_FROM_LIBRARY_BUTTON_TITLE");
        v15 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v11 message:0 preferredStyle:0];
        v16 = [MEMORY[0x1E4FB1410] actionWithTitle:v12 style:1 handler:v29];
        [v15 addAction:v16];

        v17 = [MEMORY[0x1E4FB1410] actionWithTitle:v13 style:0 handler:v9];
        [v15 addAction:v17];

        v18 = [MEMORY[0x1E4FB1410] actionWithTitle:v14 style:2 handler:v10];
        [v15 addAction:v18];

        if (![(PUAssetActionPerformer *)self presentViewController:v15])
        {
          v19 = PLUIGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Failed to present remove confirmation. User must confirm to perform removal.", buf, 2u);
          }

          v20 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present confirmation dialog.");
          [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v20];
        }
        _Block_object_dispose(&v35, 8);

        return;
      }
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v24);
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v26 = v25 = v7;
      [v21 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 1038, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetsByAssetCollection.allKeys.firstObject", v23, v26 object file lineNumber description];

      id v7 = v25;
    }
    else
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      [v21 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 1038, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetsByAssetCollection.allKeys.firstObject", v23 object file lineNumber description];
    }

    goto LABEL_4;
  }
  [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

void __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  char v9 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v9)
  {
    if ([v7 canPerformEditOperation:1]) {
      char v9 = [v7 isTrashBin] ^ 1;
    }
    else {
      char v9 = 0;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9;
  uint64_t v10 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(*(void *)(v10 + 8) + 24)
    || (v11[0] = MEMORY[0x1E4F143A8],
        v11[1] = 3221225472,
        v11[2] = __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_2,
        v11[3] = &unk_1E5F298E0,
        v11[4] = v10,
        [v8 enumerateObjectsUsingBlock:v11],
        !*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)))
  {
    *a4 = 1;
  }
}

void __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Remove canceled.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 completeUserInteractionTaskWithSuccess:0 error:v2];
}

uint64_t __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performTrashTask];
}

void __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = v6;
  if (*(unsigned char *)(v7 + 24))
  {
    char v8 = [v6 canPerformEditOperation:1];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
}

- (BOOL)shouldShowConfirmation
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return [a4 canPerformEditOperation:2];
}

@end