@interface PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4;
- (PHFetchResult)savedAssetsFetchResult;
- (void)_handleCompletionForExpectedUUIDs:(id)a3 photoLibrary:(id)a4 success:(BOOL)a5 error:(id)a6;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer

+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  v9 = [a1 systemImageNameForAssetCollectionReference:a3 withInputs:0];
  v10 = [MEMORY[0x1E4FB1818] systemImageNamed:v9];
  v11 = [v10 imageWithBaselineOffsetFromBottom:5.0];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v11 style:0 target:v8 action:a5];
  return v12;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"square.and.arrow.down";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  v5 = objc_msgSend(a4, "assetCollection", a3);
  v6 = [v5 photoLibrary];
  v7 = [v6 librarySpecificFetchOptions];
  id v8 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v7];
  v9 = PXLocalizationKeyByAddingMediaSpecificSuffix(@"PXPhotoKitAssetCollectionActionManagerPreviewActionTitle_ContentSyndicationSaveToLibrary_", [v8 count], objc_msgSend(v5, "aggregateMediaType"));
  v10 = PXLocalizedStringFromTable(v9, @"PhotosUICore");

  return v10;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v6 = [a3 assetCollection];
  if (!objc_msgSend(v6, "px_isContentSyndicationAlbum"))
  {
    BOOL v9 = 0;
    goto LABEL_6;
  }
  id v7 = v6;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer.m", 53, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v13 object file lineNumber description];
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    v15 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer.m", 53, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v13, v15 object file lineNumber description];

    goto LABEL_9;
  }
LABEL_4:
  id v8 = PXContentSyndicationUnsavedSyndicatedAssetsInAssetCollection(v7);
  BOOL v9 = [v8 count] != 0;

LABEL_6:
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetArrivalObserver, 0);
  objc_storeStrong((id *)&self->_unsavedSyndicatedAssetsFetchResult, 0);
}

- (PHFetchResult)savedAssetsFetchResult
{
  return self->_savedAssetsFetchResult;
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
    v5 = self->_unsavedSyndicatedAssetsFetchResult;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__280522;
    v15[4] = __Block_byref_object_dispose__280523;
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[PHFetchResult count](v5, "count"));
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __96__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke;
    v12[3] = &unk_1E5DD0588;
    id v7 = v5;
    v13 = v7;
    v14 = v15;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __96__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_237;
    v9[3] = &unk_1E5DD00B0;
    v9[4] = self;
    v11 = v15;
    id v8 = v6;
    id v10 = v8;
    [v8 performChanges:v12 completionHandler:v9];

    _Block_object_dispose(v15, 8);
  }
}

void __96__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = PLSyndicationUIGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v9 = [v7 uuid];
          *(_DWORD *)buf = 138543618;
          v18 = v9;
          __int16 v19 = 2112;
          v20 = v7;
          _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "AssetCollectionContentSyndicationSaveToLibraryAction: Saving asset (%{public}@): %@", buf, 0x16u);
        }
        id v10 = [MEMORY[0x1E4F38F28] creationRequestForAssetFromGuestAsset:v7];
        v11 = [v10 placeholderForCreatedAsset];
        v12 = [v11 uuid];

        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v12];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v4);
  }
}

void __96__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_237(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_2;
  v9[3] = &unk_1E5DD0088;
  objc_copyWeak(&v13, &location);
  v6 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  id v7 = v6;
  char v14 = a2;
  id v10 = v7;
  id v11 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __96__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleCompletionForExpectedUUIDs:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) photoLibrary:*(void *)(a1 + 32) success:*(unsigned __int8 *)(a1 + 64) error:*(void *)(a1 + 40)];
}

- (void)_handleCompletionForExpectedUUIDs:(id)a3 photoLibrary:(id)a4 success:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = PLSyndicationUIGetLog();
  id v13 = v12;
  if (v7)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "AssetCollectionContentSyndicationSaveToLibraryAction: All unsaved assets were saved", buf, 2u);
    }

    char v14 = (void *)MEMORY[0x1E4F38EB8];
    id v33 = v10;
    long long v15 = [v10 librarySpecificFetchOptions];
    id v34 = v9;
    long long v16 = [v14 fetchAssetsWithUUIDs:v9 options:v15];
    savedAssetsFetchResult = self->_savedAssetsFetchResult;
    self->_savedAssetsFetchResult = v16;

    id v32 = v11;
    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:v11];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obj = self->_savedAssetsFetchResult;
    uint64_t v18 = [(PHFetchResult *)obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = 0;
      uint64_t v21 = *(void *)v38;
      uint64_t v22 = *MEMORY[0x1E4F56560];
      uint64_t v23 = *MEMORY[0x1E4F56558];
LABEL_6:
      uint64_t v24 = 0;
      uint64_t v25 = 9;
      if (v20 > 9) {
        uint64_t v25 = v20;
      }
      uint64_t v26 = v20 - v25;
      while (1)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v37 + 1) + 8 * v24);
        v28 = (void *)MEMORY[0x1E4F56658];
        v43[0] = v22;
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        v43[1] = v23;
        v44[0] = v30;
        v44[1] = v27;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
        [v28 sendEvent:@"com.apple.photos.CPAnalytics.syndicatedAssetsSaved" withPayload:v31];

        if (!(v26 + v24)) {
          break;
        }
        if (v19 == ++v24)
        {
          v20 += v24;
          uint64_t v19 = [(PHFetchResult *)obj countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v19) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    id v10 = v33;
    id v9 = v34;
    id v11 = v32;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v11;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "AssetCollectionContentSyndicationSaveToLibraryAction: Failed to save all unsaved assets. Error: %@", buf, 0xCu);
    }

    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:0 error:v11];
  }
}

- (void)performUserInteractionTask
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PXContentSyndicationSettings sharedInstance];
  int v4 = [v3 preventActualSaveToLibraryBehavior];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Save to Library Prevented" message:@"Saving to Library is currently disabled via our internal settings (for debugging)." preferredStyle:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __101__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performUserInteractionTask__block_invoke;
    v14[3] = &unk_1E5DD0030;
    v14[4] = self;
    v6 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:v14];
    [v5 addAction:v6];

    [(PXActionPerformer *)self presentViewController:v5];
  }
  else
  {
    id v5 = [(PXAssetCollectionActionPerformer *)self assetCollection];
    BOOL v7 = PXContentSyndicationUnsavedSyndicatedAssetsInAssetCollection(v5);
    id v8 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = [v7 count];
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "AssetCollectionContentSyndicationSaveToLibraryAction: Ensuring all %lu unsaved assets are available locally...", buf, 0xCu);
    }

    id v9 = PXCreateDefaultAssetSharingHelper(self);
    id v10 = [v7 fetchedObjects];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __101__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performUserInteractionTask__block_invoke_229;
    v12[3] = &unk_1E5DD0058;
    void v12[4] = self;
    id v13 = v7;
    id v11 = v7;
    [v9 ensureLocalAssetsForSyndicationSave:v10 completion:v12];
  }
}

void __101__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Debug action prevented actual saving.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 completeUserInteractionTaskWithSuccess:0 error:v2];
}

uint64_t __101__PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer_performUserInteractionTask__block_invoke_229(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = PLSyndicationUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"NO";
    if (a2) {
      id v5 = @"YES";
    }
    v6 = v5;
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "AssetCollectionContentSyndicationSaveToLibraryAction: Unsaved assets were all made locally available: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  if (a2) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), *(id *)(a1 + 40));
  }
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:0];
}

@end