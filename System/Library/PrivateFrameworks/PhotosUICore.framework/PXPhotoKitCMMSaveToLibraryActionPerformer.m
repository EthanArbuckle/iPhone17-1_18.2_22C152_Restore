@interface PXPhotoKitCMMSaveToLibraryActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitCMMSaveToLibraryActionPerformer

- (void)performBackgroundTask
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v4 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  if (!v4)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 2209, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v9 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v10);
    v11 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v7 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 2209, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v9, v11 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v13[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PXPhotoKitCMMSaveToLibraryActionPerformer_performBackgroundTask__block_invoke;
  v12[3] = &unk_1E5DD3158;
  v12[4] = self;
  PXMomentShareSaveAllAssetsToLibrary(v6, v5, v12);
}

uint64_t __66__PXPhotoKitCMMSaveToLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeCopyExistingLink" systemImageName:@"link.icloud"];
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"link.icloud";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(a4, "assetCollection", a3);
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    id v6 = 0;
    goto LABEL_8;
  }
  id v6 = v5;

  if (!v6)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  v13[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  int v8 = PXMomentSharesSupportsSavingAssetsToLibrary(v7, &v12, (uint64_t)&v11);

  v9 = 0;
  if (v8)
  {
    if (v12) {
      PXMenuItemTitleForSavingMomentShareAssetsToLibrary(v12, v11);
    }
    else {
    v9 = PXLocalizedStringFromTable(@"PXCMMSaveToLibraryActionMenuTitle", @"PhotosUICore");
    }
  }
LABEL_9:

  return v9;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v4 = [a3 assetCollection];
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    id v5 = 0;
    goto LABEL_9;
  }
  id v5 = v4;

  if (!v5)
  {
LABEL_9:
    BOOL v8 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = 0;
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  char v7 = PXMomentSharesSupportsSavingAssetsToLibrary(v6, &v10, 0);
  if (v10) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }

LABEL_10:
  return v8;
}

@end