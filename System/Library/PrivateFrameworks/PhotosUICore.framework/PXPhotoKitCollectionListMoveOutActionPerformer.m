@interface PXPhotoKitCollectionListMoveOutActionPerformer
+ (BOOL)canPerformOnCollectionList:(id)a3;
+ (id)_grandParentOfCollection:(id)a3;
+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4;
+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitCollectionListMoveOutActionPerformer

- (void)performBackgroundTask
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PXPhotoKitCollectionListActionPerformer *)self collectionList];
  v4 = +[PXPhotoKitCollectionListMoveOutActionPerformer _grandParentOfCollection:v3];
  if (v4)
  {
    v5 = [PXMoveToCollectionListAction alloc];
    v10[0] = v3;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v7 = [(PXMoveToCollectionListAction *)v5 initWithCollections:v6 targetCollectionList:v4];

    v8 = [(PXActionPerformer *)self undoManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__PXPhotoKitCollectionListMoveOutActionPerformer_performBackgroundTask__block_invoke;
    v9[3] = &unk_1E5DD3158;
    v9[4] = self;
    [(PXAction *)v7 executeWithUndoManager:v8 completionHandler:v9];
  }
}

uint64_t __71__PXPhotoKitCollectionListMoveOutActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

- (void)performUserInteractionTask
{
  v3 = [(PXPhotoKitCollectionListActionPerformer *)self collectionList];
  v4 = [v3 photoLibrary];
  v5 = [v4 librarySpecificFetchOptions];

  [v5 setIncludeRootFolder:1];
  v6 = [MEMORY[0x1E4F39008] fetchCollectionListsContainingCollection:v3 options:v5];
  v7 = [v6 firstObject];

  if (v7
    && ([MEMORY[0x1E4F39008] fetchCollectionListsContainingCollection:v7 options:v5],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 firstObject],
        v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        v9))
  {
    v10 = [(PXActionPerformer *)self presentationEnvironment];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__PXPhotoKitCollectionListMoveOutActionPerformer_performUserInteractionTask__block_invoke;
    v15[3] = &unk_1E5DCFC18;
    id v16 = v9;
    id v17 = v7;
    v18 = self;
    id v11 = v9;
    v12 = [v10 presentAlertWithConfigurationHandler:v15];

    if (!v12)
    {
      v13 = PLUIGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Failed to present remove confirmation. User must confirm to perform removal.", v14, 2u);
      }

      [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
    }
  }
  else
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

void __76__PXPhotoKitCollectionListMoveOutActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = objc_msgSend(v3, "px_isTopLevelFolder");
  v6 = NSString;
  if (v5)
  {
    v7 = PXLocalizedStringFromTable(@"PXPhotoKitCollectionListMoveOutActionPerformer_ToAllAlbums_%@_TitleFormat", @"PhotosUICore");
    v8 = [*(id *)(a1 + 40) localizedTitle];
    v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
  }
  else
  {
    v7 = PXLocalizedStringFromTable(@"PXPhotoKitCollectionListMoveOutActionPerformer_ToUserFolder_%@_%@_TitleFormat", @"PhotosUICore");
    v8 = [*(id *)(a1 + 40) localizedTitle];
    v10 = [*(id *)(a1 + 32) localizedTitle];
    v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8, v10);
  }
  [v4 setTitle:v9];
  [v4 setStyle:0];
  id v11 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PXPhotoKitCollectionListMoveOutActionPerformer_performUserInteractionTask__block_invoke_2;
  v14[3] = &unk_1E5DD36F8;
  v14[4] = *(void *)(a1 + 48);
  [v4 addActionWithTitle:v11 style:1 action:v14];
  v12 = PXLocalizedStringFromTable(@"PXPhotoKitCollectionListMoveOutActionPerformerTitle", @"PhotosUICore");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PXPhotoKitCollectionListMoveOutActionPerformer_performUserInteractionTask__block_invoke_3;
  v13[3] = &unk_1E5DD36F8;
  v13[4] = *(void *)(a1 + 48);
  [v4 addActionWithTitle:v12 style:0 action:v13];
}

uint64_t __76__PXPhotoKitCollectionListMoveOutActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

uint64_t __76__PXPhotoKitCollectionListMoveOutActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  return @"folder.badge.minus";
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  return PXLocalizedStringFromTable(@"PXPhotoKitCollectionListMoveOutActionPerformerTitle", @"PhotosUICore");
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

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  id v3 = +[PXPhotoKitCollectionListMoveOutActionPerformer _grandParentOfCollection:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

@end