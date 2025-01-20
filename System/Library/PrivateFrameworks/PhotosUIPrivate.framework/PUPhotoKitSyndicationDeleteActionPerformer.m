@interface PUPhotoKitSyndicationDeleteActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4;
- (int64_t)destructivePhotosAction;
- (void)_createRecord;
- (void)_recordUserConfirmation:(int64_t)a3;
- (void)_recordVariant:(id)a3;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PUPhotoKitSyndicationDeleteActionPerformer

- (void).cxx_destruct
{
}

- (void)_recordVariant:(id)a3
{
  id v5 = a3;
  record = self->_record;
  id v10 = v5;
  if (!record)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 2196, @"Invalid parameter not satisfying: %@", @"_record != nil" object file lineNumber description];

    id v5 = v10;
    record = self->_record;
  }
  v7 = [(PXActionRecord *)record withVariant:v5];
  v8 = self->_record;
  self->_record = v7;
}

- (void)_recordUserConfirmation:(int64_t)a3
{
  record = self->_record;
  if (!record)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 2191, @"Invalid parameter not satisfying: %@", @"_record != nil" object file lineNumber description];

    record = self->_record;
  }
  id v10 = [(PUAssetActionPerformer *)self assets];
  -[PXActionRecord withUserConfirmation:assetCount:](record, "withUserConfirmation:assetCount:", a3, [v10 count]);
  v6 = (PXActionRecord *)objc_claimAutoreleasedReturnValue();
  v7 = self->_record;
  self->_record = v6;
}

- (void)_createRecord
{
  if (self->_record)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 2186, @"Invalid parameter not satisfying: %@", @"_record == nil" object file lineNumber description];
  }
  id v3 = objc_alloc(MEMORY[0x1E4F8FF38]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(PUAssetActionPerformer *)self assets];
  v6 = (PXActionRecord *)objc_msgSend(v3, "initWithSourceIdentifier:assetCount:", v10, objc_msgSend(v5, "count"));
  record = self->_record;
  self->_record = v6;
}

- (int64_t)destructivePhotosAction
{
  return 0;
}

- (void)performBackgroundTask
{
  v4 = [MEMORY[0x1E4F90090] sharedInstance];
  int v5 = [v4 preventActualRemoveSuggestionBehavior];

  if (v5)
  {
    [(PUAssetActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:0];
  }
  else
  {
    v6 = [(PUAssetActionPerformer *)self assets];
    v7 = self->_record;
    if (!v7)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 2155, @"Invalid parameter not satisfying: %@", @"record != nil" object file lineNumber description];
    }
    v8 = [MEMORY[0x1E4F900C0] actionWithAssets:v6 record:v7];
    if (!v8)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 2157, @"Invalid parameter not satisfying: %@", @"deleteAssetsAction != nil" object file lineNumber description];
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__PUPhotoKitSyndicationDeleteActionPerformer_performBackgroundTask__block_invoke;
    v12[3] = &unk_1E5F2D4B8;
    v12[4] = self;
    id v13 = v6;
    id v9 = v6;
    [v8 executeWithUndoManager:0 completionHandler:v12];
  }
}

void __67__PUPhotoKitSyndicationDeleteActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__PUPhotoKitSyndicationDeleteActionPerformer_performBackgroundTask__block_invoke_2;
  v8[3] = &unk_1E5F2BAD8;
  char v11 = a2;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __67__PUPhotoKitSyndicationDeleteActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 56))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v14 = 0;
      uint64_t v17 = *(void *)v19;
      uint64_t v16 = *MEMORY[0x1E4F90B90];
      uint64_t v4 = *MEMORY[0x1E4F56560];
      uint64_t v5 = *MEMORY[0x1E4F56558];
LABEL_4:
      uint64_t v6 = 0;
      uint64_t v7 = 9;
      if (v14 > 9) {
        uint64_t v7 = v14;
      }
      uint64_t v8 = v14 - v7;
      while (1)
      {
        if (*(void *)v19 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v6);
        id v10 = (void *)MEMORY[0x1E4F56658];
        v22[0] = v4;
        char v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v22[1] = v5;
        v23[0] = v12;
        v23[1] = v9;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
        [v10 sendEvent:v16 withPayload:v13];

        if (!(v8 + v6)) {
          break;
        }
        if (v3 == ++v6)
        {
          v14 += v6;
          uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
          if (v3) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)performUserInteractionTask
{
  [(PUPhotoKitSyndicationDeleteActionPerformer *)self _createRecord];
  uint64_t v3 = [MEMORY[0x1E4F90090] sharedInstance];
  int v4 = [v3 preventActualRemoveSuggestionBehavior];

  if (v4)
  {
    id v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Remove Suggestion Prevented" message:@"Remove Suggestion is currently disabled via our internal settings (for debugging)." preferredStyle:1];
    uint64_t v5 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
    [v16 addAction:v5];

    [(PUAssetActionPerformer *)self presentViewController:v16];
    [(PUPhotoKitSyndicationDeleteActionPerformer *)self _recordVariant:@"prevented"];
    [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    uint64_t v6 = [(PUAssetActionPerformer *)self assets];
    v19[5] = 0;
    v19[6] = 0;
    int v7 = PXContentSyndicationRemoveConfirmationTitleAndMessageLocalizedStrings();
    id v8 = 0;
    id v9 = 0;

    if (v7)
    {
      id v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v9 preferredStyle:0];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __72__PUPhotoKitSyndicationDeleteActionPerformer_performUserInteractionTask__block_invoke;
      v19[3] = &unk_1E5F2BF98;
      v19[4] = self;
      char v11 = [MEMORY[0x1E4FB1410] actionWithTitle:v8 style:2 handler:v19];
      [v10 addAction:v11];

      v12 = (void *)MEMORY[0x1E4FB1410];
      id v13 = PXLocalizedString();
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __72__PUPhotoKitSyndicationDeleteActionPerformer_performUserInteractionTask__block_invoke_2;
      v18[3] = &unk_1E5F2BF98;
      v18[4] = self;
      uint64_t v14 = [v12 actionWithTitle:v13 style:1 handler:v18];
      [v10 addAction:v14];

      [(PUAssetActionPerformer *)self presentViewController:v10];
    }
    else
    {
      v15 = PLUIGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Syndication Content Removal: Failed to retrieve alert confirmation information.", buf, 2u);
      }

      [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
    }
  }
}

uint64_t __72__PUPhotoKitSyndicationDeleteActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _recordUserConfirmation:1];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __72__PUPhotoKitSyndicationDeleteActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _recordUserConfirmation:2];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 completeUserInteractionTaskWithSuccess:0 error:0];
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "px_isSyndicatedAsset");
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "px_isSyndicatedAsset");
}

@end