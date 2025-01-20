@interface PXPhotoKitCollectionListRenameActionPerformer
+ (BOOL)canPerformOnCollectionList:(id)a3;
+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4;
+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitCollectionListRenameActionPerformer

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  return @"pencil";
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  return PXLocalizedStringFromTable(@"PXRenameFolderActionName", @"PhotosUICore");
}

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return [a3 canPerformEditOperation:7];
}

- (void)performUserInteractionTask
{
  v3 = [(PXPhotoKitCollectionListActionPerformer *)self collectionList];
  v4 = [(PXActionPerformer *)self undoManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PXPhotoKitCollectionListRenameActionPerformer_performUserInteractionTask__block_invoke;
  v7[3] = &unk_1E5DD3158;
  v7[4] = self;
  v5 = PXCollectionRenameActionAlertController(v3, v4, v7);

  if (![(PXActionPerformer *)self presentViewController:v5])
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present collection list rename alert");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v6];
  }
}

uint64_t __75__PXPhotoKitCollectionListRenameActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

@end