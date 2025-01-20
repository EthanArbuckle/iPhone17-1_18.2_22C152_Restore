@interface PXPhotoKitAssetSelectionActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetSelectionActionPerformer

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
    [v18 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetSelectionActionPerformer.m", 26, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v20 object file lineNumber description];
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
    [v18 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetSelectionActionPerformer.m", 26, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v20, v22 object file lineNumber description];

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
  v3 = [(PXAssetActionPerformer *)self selectionSnapshot];
  id v4 = [v3 dataSource];
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = [(PXPhotoKitAssetActionPerformer *)self objectReference];
  if (v4)
  {
    [v4 indexPathForObjectReference:v5];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }

  if ((void)v21 == *(void *)off_1E5DAAED8)
  {
    uint64_t v6 = [v3 selectedIndexPaths];
  }
  else
  {
    v20[0] = v21;
    v20[1] = v22;
    uint64_t v6 = [off_1E5DA6F50 indexPathSetWithIndexPath:v20];
  }
  v7 = (void *)v6;
  v8 = [(PXAssetActionPerformer *)self selectionManager];
  v9 = [v8 selectionSnapshot];
  int v10 = [v9 selectedIndexPaths];
  char v11 = [v10 isSupersetOfSet:v7];

  id v12 = [(PXAssetActionPerformer *)self selectionManager];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  BOOL v16 = __69__PXPhotoKitAssetSelectionActionPerformer_performUserInteractionTask__block_invoke;
  v17 = &unk_1E5DCFE48;
  char v19 = v11;
  id v18 = v7;
  id v13 = v7;
  [v12 performChanges:&v14];
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0, v14, v15, v16, v17);
}

uint64_t __69__PXPhotoKitAssetSelectionActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedState:*(unsigned char *)(a1 + 40) == 0 forIndexPathSet:*(void *)(a1 + 32)];
}

@end