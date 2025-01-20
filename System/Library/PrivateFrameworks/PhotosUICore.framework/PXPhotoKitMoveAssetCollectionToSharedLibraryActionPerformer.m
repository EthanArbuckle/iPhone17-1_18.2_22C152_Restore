@interface PXPhotoKitMoveAssetCollectionToSharedLibraryActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitMoveAssetCollectionToSharedLibraryActionPerformer

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"person.2";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  v7 = objc_msgSend(a4, "assetCollection", a3);
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, a1, @"PXPhotoKitMoveAssetCollectionToSharedLibraryActionPerformer.m", 43, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v22 object file lineNumber description];
LABEL_21:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v23);
    v24 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v20 handleFailureInMethod:a2, a1, @"PXPhotoKitMoveAssetCollectionToSharedLibraryActionPerformer.m", 43, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v22, v24 object file lineNumber description];

    goto LABEL_21;
  }
LABEL_3:
  uint64_t v8 = [v7 estimatedPhotosCount];
  uint64_t v9 = [v7 estimatedVideosCount];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v10 = v9, v9 == 0x7FFFFFFFFFFFFFFFLL) || (v11 = v9 + v8, v10 + v8 < 1))
  {
    uint64_t v17 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_Action_MoveToSharedLibrary");
  }
  else
  {
    BOOL v12 = v10 == 0;
    BOOL v13 = v12 || v8 != 0;
    BOOL v14 = !v13;
    uint64_t v15 = 2;
    if (!v14) {
      uint64_t v15 = 0;
    }
    if (v8 != 0 && v12) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v15;
    }
    uint64_t v17 = PXLocalizedSharedLibraryAssetCountForUsage(v11, v16, 0, 17);
  }
  v18 = (void *)v17;

  return v18;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4 = a3;
  v5 = [v4 assetCollection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v4 assetCollection];
    if (objc_msgSend(v7, "px_isSharedLibrarySharingSuggestionsSmartAlbum")) {
      char v8 = 1;
    }
    else {
      char v8 = objc_msgSend(v7, "px_isSharedLibrarySharingSuggestion");
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)performBackgroundTask
{
  v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_INFO, "Attempting remove sharing suggestions. Calling PXSharedLibraryRemoveSharingSuggestions()", buf, 2u);
  }

  id v4 = [(PXAssetCollectionActionPerformer *)self assetsDataSource];
  v5 = v4;
  if (!v4)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F38EB8];
    uint64_t v10 = [(PXAssetCollectionActionPerformer *)self assetCollection];
    v6 = [v9 fetchAssetsInAssetCollection:v10 options:0];

    if (v6) {
      goto LABEL_5;
    }
LABEL_7:
    PXAssertGetLog();
  }
  v6 = [v4 allItemsEnumerator];
  if (!v6) {
    goto LABEL_7;
  }
LABEL_5:
  v7 = [[PXMoveAssetsToSharedLibraryAction alloc] initWithAssets:v6];
  char v8 = [(PXActionPerformer *)self undoManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__PXPhotoKitMoveAssetCollectionToSharedLibraryActionPerformer_performBackgroundTask__block_invoke;
  v11[3] = &unk_1E5DD3158;
  v11[4] = self;
  [(PXAction *)v7 executeWithUndoManager:v8 completionHandler:v11];
}

uint64_t __84__PXPhotoKitMoveAssetCollectionToSharedLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

@end