@interface PXPhotoKitAssetPickAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetPickAssetActionPerformer

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v4 = a4;
  v5 = [v4 objectReference];
  v6 = @"PXPhotoKitAssetActionManagerPreviewActionTitle_SelectItem";
  if (v5)
  {
    v7 = [v4 selectionManager];
    v8 = [v7 selectionSnapshot];

    v9 = [v8 selectedIndexPaths];
    [v5 indexPath];
    int v10 = [v9 containsIndexPath:&v13];

    if (v10) {
      v6 = @"PXPhotoKitAssetActionManagerPreviewActionTitle_DeselectItem";
    }
  }
  v11 = PXLocalizedStringFromTable(v6, @"PhotosUICore");

  return v11;
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
    [v18 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetPickAssetActionPerformer.m", 26, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v20 object file lineNumber description];
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
    [v18 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetPickAssetActionPerformer.m", 26, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v20, v22 object file lineNumber description];

    goto LABEL_11;
  }
LABEL_6:
  BOOL v16 = [v15 status] == 3;

LABEL_8:
  return v16;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  return a3 != 0;
}

- (void)performUserInteractionTask
{
}

@end