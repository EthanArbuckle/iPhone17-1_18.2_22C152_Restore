@interface PXPhotoKitRemoveAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (id)actionType;
- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitRemoveAssetActionPerformer

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(PXActionPerformer *)self state] == 10)
  {
    v7.receiver = self;
    v7.super_class = (Class)PXPhotoKitRemoveAssetActionPerformer;
    [(PXActionPerformer *)&v7 completeUserInteractionTaskWithSuccess:v4 error:v6];
  }
}

- (void)performBackgroundTask
{
  [(PXPhotoKitAssetActionPerformer *)self instantlyExcludeAssetsFromDataSource];
  v3 = [PXRemoveAssetsFromAssetCollectionAction alloc];
  BOOL v4 = [(PXAssetActionPerformer *)self selectionSnapshot];
  v5 = [(PXAssetsSelectionAction *)v3 initWithSelectionSnapshot:v4];

  id v6 = [(PXActionPerformer *)self undoManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PXPhotoKitRemoveAssetActionPerformer_performBackgroundTask__block_invoke;
  v7[3] = &unk_1E5DD3158;
  v7[4] = self;
  [(PXAction *)v5 executeWithUndoManager:v6 completionHandler:v7];
}

void __61__PXPhotoKitRemoveAssetActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PXPhotoKitRemoveAssetActionPerformer_performBackgroundTask__block_invoke_2;
  block[3] = &unk_1E5DD21E8;
  char v9 = a2;
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__PXPhotoKitRemoveAssetActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v2 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) stopExcludingAssetsFromDataSource];
    BOOL v2 = *(unsigned char *)(a1 + 48) != 0;
  }
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 completeBackgroundTaskWithSuccess:v2 error:v4];
}

- (void)performUserInteractionTask
{
  if ([(PXPhotoKitAssetActionPerformer *)self shouldSkipUserConfirmation])
  {
    [(PXPhotoKitRemoveAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
    uint64_t v4 = [(PXActionPerformer *)self presentationEnvironment];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__PXPhotoKitRemoveAssetActionPerformer_performUserInteractionTask__block_invoke;
    v9[3] = &unk_1E5DCEB00;
    id v10 = v3;
    v11 = self;
    id v5 = v3;
    id v6 = [v4 presentAlertWithConfigurationHandler:v9];

    if (!v6)
    {
      objc_super v7 = PLUIGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Failed to present remove confirmation. User must confirm to perform removal.", v8, 2u);
      }

      [(PXPhotoKitRemoveAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
    }
  }
}

void __66__PXPhotoKitRemoveAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PLLocalizedStringForAction();
  [v3 setTitle:v4];
  [v3 setStyle:0];
  id v5 = PXLocalizedStringFromTable(@"PXPhotoKitRemoveAssetActionPerformer_CancelButtonTitle", @"PhotosUICore");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PXPhotoKitRemoveAssetActionPerformer_performUserInteractionTask__block_invoke_2;
  v8[3] = &unk_1E5DD36F8;
  v8[4] = *(void *)(a1 + 40);
  [v3 addActionWithTitle:v5 style:1 action:v8];
  id v6 = PXLocalizedStringFromTable(@"PXPhotoKitRemoveAssetActionPerformer_RemoveButtonTitle", @"PhotosUICore");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PXPhotoKitRemoveAssetActionPerformer_performUserInteractionTask__block_invoke_3;
  v7[3] = &unk_1E5DD36F8;
  v7[4] = *(void *)(a1 + 40);
  [v3 addActionWithTitle:v6 style:0 action:v7];
}

uint64_t __66__PXPhotoKitRemoveAssetActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

uint64_t __66__PXPhotoKitRemoveAssetActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

- (id)actionType
{
  BOOL v2 = @"PXAssetActionTypeRemove";
  return @"PXAssetActionTypeRemove";
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"trash";
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  uint64_t v4 = NSString;
  if (a3 > 2) {
    id v5 = 0;
  }
  else {
    id v5 = off_1E5DB8B58[a3];
  }
  id v6 = v5;
  objc_super v7 = [v4 stringWithFormat:@"PXPhotoKitAssetActionManager%@Title_Remove", v6];

  id v8 = PXLocalizedStringFromTable(v7, @"PhotosUICore");

  return v8;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return [a4 canPerformEditOperation:2];
}

@end