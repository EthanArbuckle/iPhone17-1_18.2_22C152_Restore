@interface PUPhotoKitRemoveSharingSuggestionAssetActionPerformer
+ (Class)pxActionPerformerClass;
- (BOOL)assetActionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)assetActionPerformer:(id)a3 presentViewController:(id)a4;
- (PUPhotoKitTrashActionPerformer)trashActionPerformer;
- (id)pxActionType;
- (id)undoManagerForAssetActionPerformer:(id)a3;
- (void)_performTrashTask;
- (void)performUserInteractionTask;
- (void)setTrashActionPerformer:(id)a3;
@end

@implementation PUPhotoKitRemoveSharingSuggestionAssetActionPerformer

- (void).cxx_destruct
{
}

- (void)setTrashActionPerformer:(id)a3
{
}

- (PUPhotoKitTrashActionPerformer)trashActionPerformer
{
  return self->_trashActionPerformer;
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

- (void)_performTrashTask
{
  v3 = [PUPhotoKitTrashActionPerformer alloc];
  id v4 = [(PUAssetActionPerformer *)self assets];
  v5 = [(PUAssetActionPerformer *)self assetsByAssetCollection];
  v6 = [(PUAssetActionPerformer *)v3 initWithActionType:8 assets:v4 orAssetsByAssetCollection:v5];

  [(PUAssetActionPerformer *)v6 setDelegate:self];
  [(PUPhotoKitRemoveSharingSuggestionAssetActionPerformer *)self setTrashActionPerformer:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer__performTrashTask__block_invoke;
  v7[3] = &unk_1E5F2E3B8;
  v7[4] = self;
  [(PUAssetActionPerformer *)v6 performWithCompletionHandler:v7];
}

uint64_t __74__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer__performTrashTask__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:0];
}

- (void)performUserInteractionTask
{
  v3 = [(PUAssetActionPerformer *)self assets];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E5F2BF98;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer_performUserInteractionTask__block_invoke_2;
  v20[3] = &unk_1E5F2BF98;
  v20[4] = self;
  v5 = _Block_copy(v20);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer_performUserInteractionTask__block_invoke_3;
  v19[3] = &unk_1E5F2BF98;
  v19[4] = self;
  v6 = _Block_copy(v19);
  uint64_t v7 = [MEMORY[0x1E4F90488] warningStringForAssets:v3 isDeleting:1];
  id v8 = PULocalizedString(@"CANCEL");
  v9 = PULocalizedString(@"REMOVE_FROM_ALBUM_BUTTON");
  v10 = PULocalizedString(@"DELETE_FROM_LIBRARY_BUTTON_TITLE");
  v17 = (void *)v7;
  v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:0 preferredStyle:0];
  v12 = [MEMORY[0x1E4FB1410] actionWithTitle:v8 style:1 handler:v4];
  [v11 addAction:v12];

  v13 = [MEMORY[0x1E4FB1410] actionWithTitle:v9 style:0 handler:v5];
  [v11 addAction:v13];

  v14 = [MEMORY[0x1E4FB1410] actionWithTitle:v10 style:2 handler:v6];
  [v11 addAction:v14];

  if (![(PUAssetActionPerformer *)self presentViewController:v11])
  {
    v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Failed to present remove confirmation. User must confirm to perform removal.", buf, 2u);
    }

    v16 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present confirmation dialog.");
    [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v16];
  }
}

void __83__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Remove shared library suggestion canceled.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 completeUserInteractionTaskWithSuccess:0 error:v2];
}

id __83__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PUPhotoKitRemoveSharingSuggestionAssetActionPerformer;
  return objc_msgSendSuper2(&v2, sel_performUserInteractionTask);
}

uint64_t __83__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performTrashTask];
}

- (id)pxActionType
{
  return (id)*MEMORY[0x1E4F90D58];
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end