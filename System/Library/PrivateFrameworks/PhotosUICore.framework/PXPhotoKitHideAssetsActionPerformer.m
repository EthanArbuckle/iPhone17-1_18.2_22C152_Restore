@interface PXPhotoKitHideAssetsActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (PXHideAssetsAction)_action;
- (void)_setupActionWithAssets:(id)a3;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
- (void)set_action:(id)a3;
@end

@implementation PXPhotoKitHideAssetsActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  v3 = +[PXPhotoKitAssetActionManager selectedAssetForActionManager:a3];
  if ([v3 isHidden]) {
    v4 = @"eye";
  }
  else {
    v4 = @"eye.slash";
  }
  v5 = v4;

  return v5;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  v4 = +[PXPhotoKitAssetActionManager selectedAssetForActionManager:a4];
  if ([v4 isHidden]) {
    v5 = @"UNHIDE_ASSET_SHORTCUT";
  }
  else {
    v5 = @"HIDE_ASSET_SHORTCUT";
  }
  v6 = PXLocalizedStringFromTable(v5, @"PhotosUICore");

  return v6;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return +[PXHideAssetsAction canPerformOnAsset:inAssetCollection:](PXHideAssetsAction, "canPerformOnAsset:inAssetCollection:", a3, a4, a5, a6);
}

- (void).cxx_destruct
{
}

- (void)set_action:(id)a3
{
}

- (PXHideAssetsAction)_action
{
  return self->__action;
}

- (void)performBackgroundTask
{
  [(PXPhotoKitAssetActionPerformer *)self instantlyExcludeAssetsFromDataSource];
  [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:1 error:0];
  v3 = [(PXPhotoKitHideAssetsActionPerformer *)self _action];
  v4 = [(PXActionPerformer *)self undoManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PXPhotoKitHideAssetsActionPerformer_performBackgroundTask__block_invoke;
  v5[3] = &unk_1E5DD3158;
  v5[4] = self;
  [v3 executeWithUndoManager:v4 completionHandler:v5];
}

uint64_t __60__PXPhotoKitHideAssetsActionPerformer_performBackgroundTask__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) stopExcludingAssetsFromDataSource];
  }
  return result;
}

- (void)performUserInteractionTask
{
  objc_initWeak(&location, self);
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v4 = [(PXActionPerformer *)self presentationEnvironment];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PXPhotoKitHideAssetsActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E5DCEB28;
  objc_copyWeak(&v6, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __65__PXPhotoKitHideAssetsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v10 count];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (v7) {
    [WeakRetained _setupActionWithAssets:v10];
  }
  else {
    [WeakRetained completeUserInteractionTaskWithSuccess:0 error:v6];
  }
}

- (void)_setupActionWithAssets:(id)a3
{
  id v4 = a3;
  v5 = [[PXHideAssetsAction alloc] initWithAssets:v4];
  [(PXPhotoKitHideAssetsActionPerformer *)self set_action:v5];
  if ([(PXHideAssetsAction *)v5 isHidden])
  {
    id v6 = [(PXActionPerformer *)self presentationEnvironment];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__PXPhotoKitHideAssetsActionPerformer__setupActionWithAssets___block_invoke;
    v8[3] = &unk_1E5DCEB00;
    id v9 = v4;
    id v10 = self;
    uint64_t v7 = [v6 presentAlertWithConfigurationHandler:v8];

    if (!v7) {
      PXAssertGetLog();
    }
  }
  else
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

void __62__PXPhotoKitHideAssetsActionPerformer__setupActionWithAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PLSuffixForItems();
  uint64_t v5 = [*(id *)(a1 + 32) count];
  id v6 = [NSString stringWithFormat:@"PXPhotoKitHideAssetsActionConfirmationMessage_%@", v4];
  uint64_t v7 = PXLocalizedStringFromTable(v6, @"PhotosUICore");
  v8 = PXLocalizedStringWithValidatedFormat(v7, @"%lu");

  id v9 = [NSString stringWithFormat:@"PXPhotoKitHideAssetsActionConfirmationActionTitle_%@", v4];
  id v10 = PXLocalizedStringFromTable(v9, @"PhotosUICore");
  uint64_t v13 = v5;
  v11 = PXLocalizedStringWithValidatedFormat(v10, @"%lu");

  v12 = PXLocalizedStringFromTable(@"PXPhotoKitHideAssetsActionConfirmationActionTitle_Cancel", @"PhotosUICore");
  objc_msgSend(v3, "setTitle:", v8, v13);
  [v3 setStyle:0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__PXPhotoKitHideAssetsActionPerformer__setupActionWithAssets___block_invoke_2;
  v15[3] = &unk_1E5DD36F8;
  v15[4] = *(void *)(a1 + 40);
  [v3 addActionWithTitle:v11 style:2 action:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__PXPhotoKitHideAssetsActionPerformer__setupActionWithAssets___block_invoke_3;
  v14[3] = &unk_1E5DD36F8;
  v14[4] = *(void *)(a1 + 40);
  [v3 addActionWithTitle:v12 style:1 action:v14];
}

uint64_t __62__PXPhotoKitHideAssetsActionPerformer__setupActionWithAssets___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __62__PXPhotoKitHideAssetsActionPerformer__setupActionWithAssets___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

@end