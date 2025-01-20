@interface PXPhotoKitAssetCollectionMoveOutActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)_grandParentOfCollection:(id)a3;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionMoveOutActionPerformer

- (void)performBackgroundTask
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v4 = [(PXAssetCollectionActionPerformer *)self assetCollectionReference];
  v5 = [v4 assetCollection];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    v15 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionMoveOutActionPerformer.m", 79, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollectionReference.assetCollection", v13, v15 object file lineNumber description];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionMoveOutActionPerformer.m", 79, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollectionReference.assetCollection", v13 object file lineNumber description];
  }

LABEL_3:
  v6 = +[PXPhotoKitAssetCollectionMoveOutActionPerformer _grandParentOfCollection:v5];
  if (v6)
  {
    v7 = [PXMoveToCollectionListAction alloc];
    v17[0] = v5;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v9 = [(PXMoveToCollectionListAction *)v7 initWithCollections:v8 targetCollectionList:v6];

    v10 = [(PXActionPerformer *)self undoManager];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__PXPhotoKitAssetCollectionMoveOutActionPerformer_performBackgroundTask__block_invoke;
    v16[3] = &unk_1E5DD3158;
    v16[4] = self;
    [(PXAction *)v9 executeWithUndoManager:v10 completionHandler:v16];
  }
}

uint64_t __72__PXPhotoKitAssetCollectionMoveOutActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

- (void)performUserInteractionTask
{
  v4 = [(PXAssetCollectionActionPerformer *)self assetCollectionReference];
  v5 = [v4 assetCollection];

  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionMoveOutActionPerformer.m", 40, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollectionReference.assetCollection", v18 object file lineNumber description];
LABEL_14:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    v20 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v16 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionMoveOutActionPerformer.m", 40, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollectionReference.assetCollection", v18, v20 object file lineNumber description];

    goto LABEL_14;
  }
LABEL_3:
  v6 = [v5 photoLibrary];
  v7 = [v6 librarySpecificFetchOptions];

  [v7 setIncludeRootFolder:1];
  v8 = [MEMORY[0x1E4F39008] fetchCollectionListsContainingCollection:v5 options:v7];
  v9 = [v8 firstObject];

  if (v9
    && ([MEMORY[0x1E4F39008] fetchCollectionListsContainingCollection:v9 options:v7],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 firstObject],
        v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    v12 = [(PXActionPerformer *)self presentationEnvironment];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__PXPhotoKitAssetCollectionMoveOutActionPerformer_performUserInteractionTask__block_invoke;
    v22[3] = &unk_1E5DCFC18;
    id v23 = v11;
    id v24 = v9;
    v25 = self;
    id v13 = v11;
    v14 = [v12 presentAlertWithConfigurationHandler:v22];

    if (!v14)
    {
      v15 = PLUIGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "Failed to present remove confirmation. User must confirm to perform removal.", buf, 2u);
      }

      [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
    }
  }
  else
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

void __77__PXPhotoKitAssetCollectionMoveOutActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = objc_msgSend(v3, "px_isTopLevelFolder");
  v6 = NSString;
  if (v5)
  {
    v7 = PXLocalizedStringFromTable(@"PXPhotoKitAssetCollectionMoveOutActionPerformer_ToAllAlbums_%@_TitleFormat", @"PhotosUICore");
    v8 = [*(id *)(a1 + 40) localizedTitle];
    v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
  }
  else
  {
    v7 = PXLocalizedStringFromTable(@"PXPhotoKitAssetCollectionMoveOutActionPerformer_ToUserFolder_%@_%@_TitleFormat", @"PhotosUICore");
    v8 = [*(id *)(a1 + 40) localizedTitle];
    v10 = [*(id *)(a1 + 32) localizedTitle];
    v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8, v10);
  }
  [v4 setTitle:v9];
  [v4 setStyle:0];
  v11 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__PXPhotoKitAssetCollectionMoveOutActionPerformer_performUserInteractionTask__block_invoke_2;
  v14[3] = &unk_1E5DD36F8;
  v14[4] = *(void *)(a1 + 48);
  [v4 addActionWithTitle:v11 style:1 action:v14];
  v12 = PXLocalizedStringFromTable(@"PXPhotoKitAssetCollectionMoveOutActionPerformerTitle", @"PhotosUICore");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__PXPhotoKitAssetCollectionMoveOutActionPerformer_performUserInteractionTask__block_invoke_3;
  v13[3] = &unk_1E5DD36F8;
  v13[4] = *(void *)(a1 + 48);
  [v4 addActionWithTitle:v12 style:0 action:v13];
}

uint64_t __77__PXPhotoKitAssetCollectionMoveOutActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

uint64_t __77__PXPhotoKitAssetCollectionMoveOutActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"folder.badge.minus";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(@"PXPhotoKitAssetCollectionMoveOutActionPerformerTitle", @"PhotosUICore");
}

+ (id)_grandParentOfCollection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 photoLibrary];
  int v5 = [v4 librarySpecificFetchOptions];

  [v5 setIncludeRootFolder:1];
  v6 = [MEMORY[0x1E4F39008] fetchCollectionListsContainingCollection:v3 options:v5];

  v7 = [v6 firstObject];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F39008] fetchCollectionListsContainingCollection:v7 options:v5];
    v9 = [v8 firstObject];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v6 = [a3 assetCollection];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionMoveOutActionPerformer.m", 31, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v12, v14 object file lineNumber description];
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionMoveOutActionPerformer.m", 31, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v12 object file lineNumber description];
  }

LABEL_3:
  if (objc_msgSend(v6, "px_isRegularAlbum"))
  {
    v7 = +[PXPhotoKitAssetCollectionMoveOutActionPerformer _grandParentOfCollection:v6];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end