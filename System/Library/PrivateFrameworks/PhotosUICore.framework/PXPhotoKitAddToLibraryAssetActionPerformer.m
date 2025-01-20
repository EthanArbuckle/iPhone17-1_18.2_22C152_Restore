@interface PXPhotoKitAddToLibraryAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
- (void)_simulateImportForAssetReference:(id)a3 assetImportStatusManager:(id)a4;
- (void)importAssets:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAddToLibraryAssetActionPerformer

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  v6 = (void *)MEMORY[0x1E4FB1818];
  id v7 = a3;
  v8 = [v6 systemImageNamed:@"square.and.arrow.down"];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v8 style:0 target:v7 action:a4];

  return v9;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  v4 = NSString;
  if (a3 > 2) {
    v5 = 0;
  }
  else {
    v5 = off_1E5DB8B58[a3];
  }
  v6 = v5;
  id v7 = [v4 stringWithFormat:@"PXPhotoKitAssetActionManager%@Title_AddToLibrary", v6];

  v8 = PXLocalizedStringFromTable(v7, @"PhotosUICore");

  return v8;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11 || [v11 sourceType] != 8 || objc_msgSend(v12, "assetCollectionType") != 7)
  {
    BOOL v16 = 0;
    goto LABEL_8;
  }
  id v15 = v12;
  if (!v15)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v18 handleFailureInMethod:a2, a1, @"PXPhotoKitAddToLibraryAssetActionPerformer.m", 33, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v20 object file lineNumber description];
LABEL_11:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v21);
    v22 = objc_msgSend(v15, "px_descriptionForAssertionMessage");
    [v18 handleFailureInMethod:a2, a1, @"PXPhotoKitAddToLibraryAssetActionPerformer.m", 33, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v20, v22 object file lineNumber description];

    goto LABEL_11;
  }
LABEL_6:
  BOOL v16 = [v15 status] == 3;

LABEL_8:
  return v16;
}

- (void)importAssets:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F38F20]);
  [v5 setShouldDownloadOrCloudReReferenceMissingResources:1];
  v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__PXPhotoKitAddToLibraryAssetActionPerformer_importAssets___block_invoke;
  v12[3] = &unk_1E5DD0F30;
  id v13 = v4;
  id v14 = v5;
  id v15 = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PXPhotoKitAddToLibraryAssetActionPerformer_importAssets___block_invoke_2;
  v9[3] = &unk_1E5DD2570;
  id v10 = v13;
  id v11 = self;
  id v7 = v13;
  id v8 = v5;
  [v6 performChanges:v12 completionHandler:v9];
}

void __59__PXPhotoKitAddToLibraryAssetActionPerformer_importAssets___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(MEMORY[0x1E4F38F28], "creationRequestForAssetCopyFromAsset:options:", *(void *)(*((void *)&v9 + 1) + 8 * v6), *(void *)(a1 + 40), (void)v9);
        id v8 = [*(id *)(a1 + 48) importSessionID];
        [v7 setImportSessionID:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __59__PXPhotoKitAddToLibraryAssetActionPerformer_importAssets___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(id *)(a1 + 32);
  id v5 = v4;
  px_dispatch_on_main_queue();
}

uint64_t __59__PXPhotoKitAddToLibraryAssetActionPerformer_importAssets___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = PLSharingGetLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v5;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "[AddToLibrary] Successfully started to Add %lu assets", buf, 0xCu);
    }

    uint64_t v6 = (void *)MEMORY[0x1E4F56658];
    uint64_t v15 = *MEMORY[0x1E4F56560];
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    BOOL v16 = v8;
    long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    objc_msgSend(v6, "sendEvent:withPayload:", @"com.apple.photos.CPAnalytics.addAssetsToLibrary", v9, v15);

    long long v10 = *(void **)(a1 + 40);
    uint64_t v11 = 1;
    uint64_t v12 = 0;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v13;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "[AddToLibrary] Failed to start to Add to Library, err: %@", buf, 0xCu);
    }

    long long v10 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v11 = 0;
  }
  return [v10 completeUserInteractionTaskWithSuccess:v11 error:v12];
}

- (void)_simulateImportForAssetReference:(id)a3 assetImportStatusManager:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = [v6 asset];
    *(_DWORD *)buf = 138412290;
    v24 = v9;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "[AddToLibrary] Simulating import for asset: %@", buf, 0xCu);
  }
  long long v10 = +[PXCompleteMyMomentSettings sharedInstance];
  int v11 = [v10 simulateImportFailure];

  if (v11)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Simulated failure");
  }
  else
  {
    uint64_t v12 = 0;
  }
  [v7 beginSimulatedImportForAssetReference:v6];
  dispatch_time_t v13 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PXPhotoKitAddToLibraryAssetActionPerformer__simulateImportForAssetReference_assetImportStatusManager___block_invoke;
  block[3] = &unk_1E5DC3A48;
  id v18 = v7;
  id v19 = v6;
  char v22 = v11;
  v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v6;
  id v16 = v7;
  dispatch_after(v13, MEMORY[0x1E4F14428], block);
}

uint64_t __104__PXPhotoKitAddToLibraryAssetActionPerformer__simulateImportForAssetReference_assetImportStatusManager___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) completeSimulatedImportForAssetReference:*(void *)(a1 + 40) withSuccess:*(unsigned char *)(a1 + 64) == 0];
  BOOL v2 = *(unsigned char *)(a1 + 64) == 0;
  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  return [v3 completeUserInteractionTaskWithSuccess:v2 error:v4];
}

- (void)performUserInteractionTask
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PXAssetActionPerformer *)self selectionSnapshot];
  uint64_t v5 = [v4 selectedIndexPaths];
  uint64_t v6 = [v5 count];

  if (!v4 || !v6)
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
    goto LABEL_13;
  }
  id v7 = [v4 dataSource];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v20);
    id v21 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v17 handleFailureInMethod:a2, self, @"PXPhotoKitAddToLibraryAssetActionPerformer.m", 66, @"%@ should be an instance inheriting from %@, but it is %@", @"selectionSnapshot.dataSource", v19, v21 object file lineNumber description];
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    id v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    [v17 handleFailureInMethod:a2, self, @"PXPhotoKitAddToLibraryAssetActionPerformer.m", 66, @"%@ should be an instance inheriting from %@, but it is nil", @"selectionSnapshot.dataSource", v19 object file lineNumber description];
  }

LABEL_5:
  id v8 = [(PXPhotoKitAssetActionPerformer *)self importStatusManager];
  long long v9 = v8;
  if (v8 && [v8 supportsStateSimulation])
  {
    long long v10 = [v4 selectedIndexPaths];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __72__PXPhotoKitAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke;
    v30[3] = &unk_1E5DC8CF0;
    id v31 = v7;
    v32 = self;
    id v33 = v9;
    [v10 enumerateItemIndexPathsUsingBlock:v30];

    id v11 = v31;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
    dispatch_time_t v13 = [v4 selectedIndexPaths];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __72__PXPhotoKitAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_2;
    v25[3] = &unk_1E5DC01F0;
    id v26 = v12;
    id v14 = v7;
    v28 = self;
    SEL v29 = a2;
    id v27 = v14;
    id v11 = v12;
    [v13 enumerateItemIndexPathsUsingBlock:v25];

    uint64_t v22 = [v14 identifier];
    long long v23 = xmmword_1AB359AA0;
    uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    id v15 = [v14 assetCollectionAtSectionIndexPath:&v22];
    id v16 = PLSharingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v35 = v6;
      __int16 v36 = 2112;
      v37 = v15;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "[AddToLibrary] Starting to Add %lu assets from Moment Share: %@.", buf, 0x16u);
    }

    [(PXPhotoKitAddToLibraryAssetActionPerformer *)self importAssets:v11];
  }

LABEL_13:
}

void __72__PXPhotoKitAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  uint64_t v5 = [v3 assetReferenceAtItemIndexPath:v6];
  [*(id *)(a1 + 40) _simulateImportForAssetReference:v5 assetImportStatusManager:*(void *)(a1 + 48)];
}

void __72__PXPhotoKitAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_2(void *a1, _OWORD *a2)
{
  long long v4 = (void *)a1[4];
  uint64_t v3 = (void *)a1[5];
  long long v5 = a2[1];
  v16[0] = *a2;
  v16[1] = v5;
  uint64_t v6 = [v3 assetAtItemIndexPath:v16];
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = a1[6];
    uint64_t v8 = a1[7];
    long long v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    [v7 handleFailureInMethod:v8, v9, @"PXPhotoKitAddToLibraryAssetActionPerformer.m", 81, @"%@ should be an instance inheriting from %@, but it is nil", @"[dataSource assetAtItemIndexPath:indexPath]", v11 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = a1[6];
    uint64_t v12 = a1[7];
    id v14 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v14);
    id v15 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v7 handleFailureInMethod:v12, v13, @"PXPhotoKitAddToLibraryAssetActionPerformer.m", 81, @"%@ should be an instance inheriting from %@, but it is %@", @"[dataSource assetAtItemIndexPath:indexPath]", v11, v15 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  [v4 addObject:v6];
}

@end