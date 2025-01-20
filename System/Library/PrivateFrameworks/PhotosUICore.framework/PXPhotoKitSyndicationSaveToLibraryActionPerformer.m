@interface PXPhotoKitSyndicationSaveToLibraryActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformWithActionManager:(id)a3;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitSyndicationSaveToLibraryActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"square.and.arrow.down";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v4 = a4;
  v5 = [v4 selectionManager];
  v6 = [v5 selectionSnapshot];
  v7 = [v6 allItemsEnumerator];

  uint64_t v8 = [v7 count];
  [v4 presentationSource];

  if (v8 == 1) {
    PXMediaTypeForAssets();
  }
  PXFilter();
}

uint64_t __92__PXPhotoKitSyndicationSaveToLibraryActionPerformer_localizedTitleForUseCase_actionManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "px_isUnsavedSyndicatedAsset");
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  if (a3) {
    return objc_msgSend(a3, "px_isUnsavedSyndicatedAsset");
  }
  else {
    return 0;
  }
}

+ (BOOL)canPerformWithActionManager:(id)a3
{
  id v4 = [a3 objectReference];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6 = [v5 asset];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = [v5 assetCollection];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  char v10 = [a1 canPerformOnAsset:v7 inAssetCollection:v9 person:0 socialGroup:0];
  return v10;
}

- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return [(PXActionPerformer *)self dismissViewController:a4 completionHandler:a5];
}

- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4
{
  return [(PXActionPerformer *)self presentViewController:a4];
}

- (void)performBackgroundTask
{
  v3 = +[PXContentSyndicationSettings sharedInstance];
  int v4 = [v3 preventActualSaveToLibraryBehavior];

  if (v4)
  {
    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:0];
  }
  else
  {
    id v5 = [(PXPhotoKitAssetActionPerformer *)self assets];
    v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke;
    v11[3] = &unk_1E5DD36F8;
    id v12 = v5;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_243;
    v8[3] = &unk_1E5DD2570;
    id v9 = v12;
    char v10 = self;
    id v7 = v12;
    [v6 performChanges:v11 completionHandler:v8];
  }
}

void __74__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v7 = PLSyndicationUIGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [v6 uuid];
          *(_DWORD *)buf = 138543618;
          v15 = v8;
          __int16 v16 = 2112;
          v17 = v6;
          _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "SyndicationSaveActionPerformer: Saving asset (%{public}@): %@", buf, 0x16u);
        }
        id v9 = (id)[MEMORY[0x1E4F38F28] creationRequestForAssetFromGuestAsset:v6];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v18 count:16];
    }
    while (v3);
  }
}

void __74__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_243(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_2;
  v7[3] = &unk_1E5DCA2A0;
  char v11 = a2;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 40);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __74__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = PLSyndicationUIGetLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v5 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v35 = v5;
    id v6 = "SyndicationSaveActionPerformer: All %ld assets saved";
    id v7 = v4;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v10 = [*(id *)(a1 + 32) count];
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v35 = v10;
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    id v6 = "SyndicationSaveActionPerformer: All %ld assets did not save. Error: %@";
    id v7 = v4;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 22;
  }
  _os_log_impl(&dword_1A9AE7000, v7, v8, v6, buf, v9);
LABEL_7:

  [*(id *)(a1 + 48) completeBackgroundTaskWithSuccess:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 56))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v25 = 0;
      uint64_t v14 = *(void *)v28;
      uint64_t v15 = *MEMORY[0x1E4F56560];
      uint64_t v16 = *MEMORY[0x1E4F56558];
LABEL_10:
      uint64_t v17 = 0;
      uint64_t v18 = 9;
      if (v25 > 9) {
        uint64_t v18 = v25;
      }
      uint64_t v19 = v25 - v18;
      while (1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * v17);
        v21 = (void *)MEMORY[0x1E4F56658];
        v31[0] = v15;
        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        v31[1] = v16;
        v32[0] = v23;
        v32[1] = v20;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
        [v21 sendEvent:@"com.apple.photos.CPAnalytics.syndicatedAssetsSaved" withPayload:v24];

        if (!(v19 + v17)) {
          break;
        }
        if (v13 == ++v17)
        {
          v25 += v17;
          uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
          if (v13) {
            goto LABEL_10;
          }
          break;
        }
      }
    }
  }
}

- (void)performUserInteractionTask
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PXContentSyndicationSettings sharedInstance];
  int v4 = [v3 preventActualSaveToLibraryBehavior];

  if (v4)
  {
    id v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Save to Library Prevented" message:@"Saving to Library is currently disabled via our internal settings (for debugging)." preferredStyle:1];
    uint64_t v5 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
    [v10 addAction:v5];

    [(PXActionPerformer *)self presentViewController:v10];
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    id v6 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(PXPhotoKitAssetActionPerformer *)self assets];
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = [v7 count];
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "SyndicationSaveActionPerformer: Ensuring all %lu unsaved assets are available locally...", buf, 0xCu);
    }
    os_log_type_t v8 = PXCreateDefaultAssetSharingHelper(self);
    uint32_t v9 = [(PXPhotoKitAssetActionPerformer *)self assets];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performUserInteractionTask__block_invoke;
    v11[3] = &unk_1E5DD2188;
    void v11[4] = self;
    [v8 ensureLocalAssetsForSyndicationSave:v9 completion:v11];
  }
}

uint64_t __79__PXPhotoKitSyndicationSaveToLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = PLSyndicationUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    if (a2) {
      uint64_t v5 = @"YES";
    }
    id v6 = v5;
    int v8 = 138543362;
    uint32_t v9 = v6;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "SyndicationSaveActionPerformer: Unsaved assets were all made locally available: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:0];
}

@end