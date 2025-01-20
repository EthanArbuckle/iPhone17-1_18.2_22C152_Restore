@interface PXPhotoKitRecoverAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (int64_t)destructivePhotosAction;
@end

@implementation PXPhotoKitRecoverAssetActionPerformer

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  id v7 = a3;
  v8 = [a5 selectionManager];
  v9 = [v8 selectionSnapshot];
  int v10 = [v9 isAnyItemSelected];

  if (v10) {
    v11 = @"PXPhotoKitRecoverAssetActionPerformer_Title";
  }
  else {
    v11 = @"PXPhotoKitRecoverAssetActionPerformer_TitleSelection";
  }
  v12 = PXLocalizedStringFromTable(v11, @"PhotosUICore");
  v13 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v12 style:0 target:v7 action:a4];

  return v13;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"arrow.up.bin";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  v4 = objc_msgSend(a4, "effectiveSelectionSnapshot", a3);
  int v5 = [v4 isAnyItemSelected];

  if (v5) {
    v6 = @"PXPhotoKitRecoverAssetActionPerformer_Title";
  }
  else {
    v6 = @"PXPhotoKitRecoverAssetActionPerformer_TitleSelection";
  }
  return PXLocalizedStringFromTable(v6, @"PhotosUICore");
}

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  return objc_msgSend(a3, "px_isRecoveredSmartAlbum");
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return objc_msgSend(a4, "px_isRecoveredSmartAlbum", a3);
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v7 = a3;
  if (![v7 isAnyItemSelected])
  {
    char v10 = 0;
    goto LABEL_6;
  }
  v8 = [v7 dataSource];
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, a1, @"PXPhotoKitRecoverAssetActionPerformer.m", 23, @"%@ should be an instance inheriting from %@, but it is nil", @"selectionSnapshot.dataSource", v14 object file lineNumber description];
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    v16 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, a1, @"PXPhotoKitRecoverAssetActionPerformer.m", 23, @"%@ should be an instance inheriting from %@, but it is %@", @"selectionSnapshot.dataSource", v14, v16 object file lineNumber description];

    goto LABEL_9;
  }
LABEL_4:
  v9 = [v8 containerCollection];
  char v10 = objc_msgSend(v9, "px_isRecoveredSmartAlbum");

LABEL_6:
  return v10;
}

- (int64_t)destructivePhotosAction
{
  return 2;
}

@end