@interface PXPhotoKitDeleteAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (BOOL)isActionDestructive;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (id)actionType;
- (int64_t)destructivePhotosAction;
@end

@implementation PXPhotoKitDeleteAssetActionPerformer

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"trash";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  v4 = objc_msgSend(a4, "effectiveSelectionSnapshot", a3);
  int v5 = [v4 isAnyItemSelected];

  if (v5) {
    v6 = @"PXPhotoKitDeleteAssetActionPerformer_TitleDefault";
  }
  else {
    v6 = @"PXPhotoKitDeleteAssetActionPerformer_TitleSelection";
  }
  return PXLocalizedStringFromTable(v6, @"PhotosUICore");
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  id v7 = a3;
  v8 = [a5 selectionManager];
  v9 = [v8 selectionSnapshot];
  int v10 = [v9 isAnyItemSelected];

  if (v10) {
    v11 = @"PXPhotoKitDeleteAssetActionPerformer_TitleDefault";
  }
  else {
    v11 = @"PXPhotoKitDeleteAssetActionPerformer_TitleSelection";
  }
  v12 = PXLocalizedStringFromTable(v11, @"PhotosUICore");
  v13 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v12 style:0 target:v7 action:a4];

  return v13;
}

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "px_isRecentlyDeletedSmartAlbum")) {
    char v4 = 1;
  }
  else {
    char v4 = objc_msgSend(v3, "px_isRecoveredSmartAlbum");
  }

  return v4;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  if (([v9 isTrashBin] & 1) != 0 || objc_msgSend(v9, "px_isRecoveredSmartAlbum")) {
    char v10 = [a1 canExpungeAsset:v8 inAssetCollection:v9];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (id)actionType
{
  v2 = @"PXAssetActionTypeDelete";
  return @"PXAssetActionTypeDelete";
}

- (int64_t)destructivePhotosAction
{
  char v4 = [(PXPhotoKitAssetActionPerformer *)self assetsByAssetCollection];
  int v5 = [v4 allKeys];
  v6 = [v5 firstObject];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PXPhotoKitDeleteAssetActionPerformer.m", 46, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetsByAssetCollection.allKeys.firstObject", v11, v13 object file lineNumber description];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    char v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PXPhotoKitDeleteAssetActionPerformer.m", 46, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetsByAssetCollection.allKeys.firstObject", v11 object file lineNumber description];
  }

LABEL_3:
  if ([v6 isTrashBin]) {
    int64_t v7 = 6;
  }
  else {
    int64_t v7 = 5;
  }

  return v7;
}

@end