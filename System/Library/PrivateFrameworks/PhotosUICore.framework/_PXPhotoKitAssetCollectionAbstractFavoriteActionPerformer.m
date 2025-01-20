@interface _PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer
+ (BOOL)_targetFavoriteStateForAssetCollectionReference:(id)a3;
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation _PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer

- (void)performBackgroundTask
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_class();
  v5 = [(PXAssetCollectionActionPerformer *)self assetCollectionReference];
  uint64_t v6 = [v4 _targetFavoriteStateForAssetCollectionReference:v5];

  v7 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  if (!objc_msgSend(v7, "px_isMemory"))
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PXPhotoKitAssetCollectionActionManager.m" lineNumber:901 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v8 = v7;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v18);
    v19 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 884, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v16, v19 object file lineNumber description];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 884, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v16 object file lineNumber description];
  }

LABEL_4:
  v9 = [PXFavoriteMemoriesAction alloc];
  v25[0] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  v11 = [(PXFavoriteMemoriesAction *)v9 initWithMemories:v10 favorite:v6];

  if (!v11)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 887, @"Invalid parameter not satisfying: %@", @"action != nil" object file lineNumber description];
  }
  v12 = [(PXActionPerformer *)self undoManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82___PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer_performBackgroundTask__block_invoke;
  v21[3] = &unk_1E5DC7BF0;
  char v24 = v6;
  id v22 = v8;
  v23 = self;
  id v13 = v8;
  [(PXAction *)v11 executeWithUndoManager:v12 completionHandler:v21];
}

- (void)performUserInteractionTask
{
  v4 = +[PXContentSyndicationAssetSavingHelper assetSavingHelperFromAssetCollectionActionPerformer:self];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87___PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E5DB3498;
  v5[4] = self;
  v5[5] = a2;
  [v4 performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion:v5];
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v6 = a4;
  int v7 = [(id)objc_opt_class() _targetFavoriteStateForAssetCollectionReference:v6];

  id v8 = @"Standard";
  if (!a3) {
    id v8 = @"Preview";
  }
  v9 = @"Unfavorite";
  if (v7) {
    v9 = @"Favorite";
  }
  v10 = [NSString stringWithFormat:@"PXPhotoKitAssetCollectionManager%@ActionTitle_%@Memory", v8, v9];
  v11 = PXLocalizedStringFromTable(v10, @"PhotosUICore");

  return v11;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  if (objc_msgSend(a1, "_targetFavoriteStateForAssetCollectionReference:", a3, a4)) {
    v4 = @"heart";
  }
  else {
    v4 = @"heart.slash";
  }
  return v4;
}

+ (BOOL)_targetFavoriteStateForAssetCollectionReference:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  int v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 836, @"Method %s is a responsibility of subclass %@", "+[_PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer _targetFavoriteStateForAssetCollectionReference:]", v8 object file lineNumber description];

  abort();
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v4 = [a3 assetCollection];
  if (objc_msgSend(v4, "px_isMemory")) {
    char v5 = objc_msgSend(v4, "px_canEditFavoriteState");
  }
  else {
    char v5 = 0;
  }

  return v5;
}

@end