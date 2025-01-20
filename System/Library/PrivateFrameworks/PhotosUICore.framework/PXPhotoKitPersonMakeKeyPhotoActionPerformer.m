@interface PXPhotoKitPersonMakeKeyPhotoActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitPersonMakeKeyPhotoActionPerformer

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(@"PXPeopleMakeKeyPhoto", @"PhotosUICore");
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4FB13F0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__PXPhotoKitPersonMakeKeyPhotoActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v12[3] = &unk_1E5DC8470;
  id v13 = v7;
  id v9 = v7;
  v10 = [v8 actionWithTitle:a3 image:a4 identifier:0 handler:v12];

  return v10;
}

uint64_t __90__PXPhotoKitPersonMakeKeyPhotoActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  if (a3) {
    BOOL v6 = a5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

- (void)performBackgroundTask
{
  v3 = [PXChangePersonKeyFaceAction alloc];
  v4 = [(PXPhotoKitAssetActionPerformer *)self person];
  v5 = [(PXPhotoKitAssetActionPerformer *)self assets];
  BOOL v6 = [v5 firstObject];
  id v7 = [(PXChangePersonKeyFaceAction *)v3 initWithPerson:v4 asset:v6];

  v8 = [(PXActionPerformer *)self undoManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__PXPhotoKitPersonMakeKeyPhotoActionPerformer_performBackgroundTask__block_invoke;
  v9[3] = &unk_1E5DD3158;
  v9[4] = self;
  [(PXAction *)v7 executeWithUndoManager:v8 completionHandler:v9];
}

void __68__PXPhotoKitPersonMakeKeyPhotoActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    BOOL v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      int v14 = 138412290;
      v15 = v8;
      id v9 = "[%@] Make Key Photo succeeded.";
      v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else
  {
    [*(id *)(a1 + 32) stopExcludingAssetsFromDataSource];
    BOOL v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v13 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v13);
      int v14 = 138412546;
      v15 = v8;
      __int16 v16 = 2112;
      id v17 = v5;
      id v9 = "[%@] Make Key Photo failed: %@.";
      v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
      goto LABEL_6;
    }
  }

  [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:v5];
}

@end