@interface PUPhotoKitDeleteActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (int64_t)destructivePhotosAction;
@end

@implementation PUPhotoKitDeleteActionPerformer

- (int64_t)destructivePhotosAction
{
  v4 = [(PUAssetActionPerformer *)self assetsByAssetCollection];
  v5 = [v4 allKeys];
  v6 = [v5 firstObject];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 945, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetsByAssetCollection.allKeys.firstObject", v11, v13 object file lineNumber description];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PUPhotoKitAssetActionManager.m", 945, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetsByAssetCollection.allKeys.firstObject", v11 object file lineNumber description];
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

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isTrashBin]) {
    char v7 = PXCanExpungeAssetFromAssetCollection();
  }
  else {
    char v7 = 0;
  }

  return v7;
}

@end