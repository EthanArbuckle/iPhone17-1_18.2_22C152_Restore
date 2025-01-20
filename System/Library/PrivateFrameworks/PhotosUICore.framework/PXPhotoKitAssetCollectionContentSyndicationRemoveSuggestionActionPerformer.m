@interface PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)_mediaSpecificMessageForKeyPrefix:(id)a3 forAssets:(id)a4;
+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (BOOL)shouldSkipUserConfirmation;
- (id)_assetsFromAssetCollection;
- (void)_createRecord;
- (void)_recordUserConfirmation:(int64_t)a3;
- (void)_recordVariant:(id)a3;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
- (void)setShouldSkipUserConfirmation:(BOOL)a3;
@end

@implementation PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer

+ (id)_mediaSpecificMessageForKeyPrefix:(id)a3 forAssets:(id)a4
{
}

+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(id)objc_opt_class() localizedTitleForUseCase:1 assetCollectionReference:v8 withInputs:0];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v9 style:0 target:v7 action:a5];
  return v10;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"trash";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  v5 = objc_msgSend(a4, "assetCollection", a3);
  v6 = [v5 photoLibrary];
  id v7 = [v6 librarySpecificFetchOptions];
  id v8 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v7];
  v9 = PXLocalizationKeyByAddingMediaSpecificSuffix(@"PXPhotoKitAssetCollectionActionManagerActionTitle_ContentSyndicationRemoveSuggestion_", [v8 count], objc_msgSend(v5, "aggregateMediaType"));
  v10 = PXLocalizedStringFromTable(v9, @"PhotosUICore");

  return v10;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v4 = [a3 assetCollection];
  char v5 = objc_msgSend(v4, "px_isContentSyndicationAlbum");

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setShouldSkipUserConfirmation:(BOOL)a3
{
  self->_shouldSkipUserConfirmation = a3;
}

- (BOOL)shouldSkipUserConfirmation
{
  return self->_shouldSkipUserConfirmation;
}

- (void)_recordVariant:(id)a3
{
  id v5 = a3;
  record = self->_record;
  id v10 = v5;
  if (!record)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer.m", 169, @"Invalid parameter not satisfying: %@", @"_record != nil" object file lineNumber description];

    id v5 = v10;
    record = self->_record;
  }
  id v7 = [(PXActionRecord *)record withVariant:v5];
  id v8 = self->_record;
  self->_record = v7;
}

- (void)_recordUserConfirmation:(int64_t)a3
{
  if (!self->_record)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer.m", 163, @"Invalid parameter not satisfying: %@", @"_record != nil" object file lineNumber description];
  }
  id v9 = [(PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer *)self _assetsFromAssetCollection];
  -[PXActionRecord withUserConfirmation:assetCount:](self->_record, "withUserConfirmation:assetCount:", a3, [v9 count]);
  id v5 = (PXActionRecord *)objc_claimAutoreleasedReturnValue();
  record = self->_record;
  self->_record = v5;
}

- (void)_createRecord
{
  if (self->_record)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer.m", 157, @"Invalid parameter not satisfying: %@", @"_record == nil" object file lineNumber description];
  }
  id v10 = [(PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer *)self _assetsFromAssetCollection];
  v3 = [PXActionRecord alloc];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = -[PXActionRecord initWithSourceIdentifier:assetCount:](v3, "initWithSourceIdentifier:assetCount:", v5, [v10 count]);
  record = self->_record;
  self->_record = v6;
}

- (id)_assetsFromAssetCollection
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  v4 = [v3 photoLibrary];

  id v5 = [v4 librarySpecificFetchOptions];
  v6 = (void *)MEMORY[0x1E4F38EB8];
  id v7 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  id v8 = [v6 fetchAssetsInAssetCollection:v7 options:v5];

  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v9, "addObject:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  return v9;
}

- (void)performBackgroundTask
{
  v4 = +[PXContentSyndicationSettings sharedInstance];
  int v5 = [v4 preventActualRemoveSuggestionBehavior];

  if (v5)
  {
    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:0];
  }
  else
  {
    v6 = [(PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer *)self _assetsFromAssetCollection];
    id v7 = self->_record;
    if (!v7)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer.m", 110, @"Invalid parameter not satisfying: %@", @"record != nil" object file lineNumber description];
    }
    id v8 = +[PXDestructiveAssetsAction actionWithAssets:v6 record:v7];
    if (!v8)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer.m", 112, @"Invalid parameter not satisfying: %@", @"deleteAssetsAction != nil" object file lineNumber description];
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __99__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performBackgroundTask__block_invoke;
    v12[3] = &unk_1E5DD2570;
    v12[4] = self;
    id v13 = v6;
    id v9 = v6;
    [v8 executeWithUndoManager:0 completionHandler:v12];
  }
}

void __99__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performBackgroundTask__block_invoke_2;
  v8[3] = &unk_1E5DCA2A0;
  char v11 = a2;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __99__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 56))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v14 = 0;
      uint64_t v16 = *(void *)v18;
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
        if (*(void *)v18 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v6);
        id v10 = (void *)MEMORY[0x1E4F56658];
        v21[0] = v4;
        char v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        v21[1] = v5;
        v22[0] = v12;
        v22[1] = v9;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
        [v10 sendEvent:@"com.apple.photos.CPAnalytics.syndicationSuggestionRemoved" withPayload:v13];

        if (!(v8 + v6)) {
          break;
        }
        if (v3 == ++v6)
        {
          v14 += v6;
          uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
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
  [(PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer *)self _createRecord];
  uint64_t v3 = +[PXContentSyndicationSettings sharedInstance];
  int v4 = [v3 preventActualRemoveSuggestionBehavior];

  if (v4)
  {
    id v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Remove Suggestion Prevented" message:@"Remove Suggestion is currently disabled via our internal settings (for debugging)." preferredStyle:1];
    uint64_t v5 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
    [v16 addAction:v5];

    [(PXActionPerformer *)self presentViewController:v16];
    [(PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer *)self _recordVariant:@"prevented"];
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else if ([(PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer *)self shouldSkipUserConfirmation])
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    uint64_t v6 = [(PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer *)self _assetsFromAssetCollection];
    v19[5] = 0;
    v19[6] = 0;
    int v7 = PXContentSyndicationRemoveConfirmationTitleAndMessageLocalizedStrings(v6);
    id v8 = 0;
    id v9 = 0;
    if (v7)
    {
      id v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v9 preferredStyle:0];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __104__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performUserInteractionTask__block_invoke;
      v19[3] = &unk_1E5DD0030;
      v19[4] = self;
      char v11 = [MEMORY[0x1E4FB1410] actionWithTitle:v8 style:2 handler:v19];
      [v10 addAction:v11];

      uint64_t v12 = (void *)MEMORY[0x1E4FB1410];
      id v13 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __104__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performUserInteractionTask__block_invoke_2;
      v18[3] = &unk_1E5DD0030;
      v18[4] = self;
      uint64_t v14 = [v12 actionWithTitle:v13 style:1 handler:v18];
      [v10 addAction:v14];

      [(PXActionPerformer *)self presentViewController:v10];
    }
    else
    {
      v15 = PLUIGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "Syndication Content Removal: Failed to retrieve alert confirmation information.", buf, 2u);
      }

      [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
    }
  }
}

uint64_t __104__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _recordUserConfirmation:1];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __104__PXPhotoKitAssetCollectionContentSyndicationRemoveSuggestionActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _recordUserConfirmation:2];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 completeUserInteractionTaskWithSuccess:0 error:0];
}

@end