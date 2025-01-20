@interface PXPhotoKitRemoveSharingSuggestionAssetCollectionActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (BOOL)isActionDestructive;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitRemoveSharingSuggestionAssetCollectionActionPerformer

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"minus.circle";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  v5 = objc_msgSend(a4, "assetCollection", a3);
  int v6 = objc_msgSend(v5, "px_isSharedLibrarySharingSuggestionsSmartAlbum");

  if (v6) {
    v7 = @"PXSharedLibrary_Action_RemoveAllSharingSuggestions";
  }
  else {
    v7 = @"PXSharedLibrary_Action_RemoveThisSharingSuggestion";
  }
  return PXLocalizedSharedLibraryString(v7);
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
    v9 = (void *)MEMORY[0x1E4F38EB8];
    v10 = [(PXAssetCollectionActionPerformer *)self assetCollection];
    int v6 = [v9 fetchAssetsInAssetCollection:v10 options:0];

    if (v6) {
      goto LABEL_5;
    }
LABEL_7:
    PXAssertGetLog();
  }
  int v6 = [v4 allItemsEnumerator];
  if (!v6) {
    goto LABEL_7;
  }
LABEL_5:
  v7 = [(PXAssetsAction *)[PXRemoveLibrarySharingSuggestionAction alloc] initWithAssets:v6];
  char v8 = [(PXActionPerformer *)self undoManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PXPhotoKitRemoveSharingSuggestionAssetCollectionActionPerformer_performBackgroundTask__block_invoke;
  v11[3] = &unk_1E5DD3158;
  v11[4] = self;
  [(PXAction *)v7 executeWithUndoManager:v8 completionHandler:v11];
}

uint64_t __88__PXPhotoKitRemoveSharingSuggestionAssetCollectionActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

@end