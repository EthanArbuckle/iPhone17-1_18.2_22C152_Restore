@interface PXPhotoKitToggleFavoriteActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (BOOL)toggledValueForActionManager:(id)a3;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)_logEventForAssets:(id)a3 favorite:(BOOL)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitToggleFavoriteActionPerformer

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (id)systemImageNameForActionManager:(id)a3
{
  if ([a1 toggledValueForActionManager:a3]) {
    v3 = @"heart";
  }
  else {
    v3 = @"heart.slash";
  }
  return v3;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  if ([a1 toggledValueForActionManager:a4]) {
    v4 = @"FAVORITE_ASSET_SHORTCUT";
  }
  else {
    v4 = @"UNFAVORITE_ASSET_SHORTCUT";
  }
  return PXLocalizedStringFromTable(v4, @"PhotosUICore");
}

+ (BOOL)toggledValueForActionManager:(id)a3
{
  v3 = [a3 effectiveSelectionSnapshot];
  v4 = [v3 allItemsEnumerator];

  LOBYTE(v3) = +[PXFavoriteAssetsAction toggledValueForAssets:v4];
  return (char)v3;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return +[PXFavoriteAssetsAction canPerformOnAsset:inAssetCollection:](PXFavoriteAssetsAction, "canPerformOnAsset:inAssetCollection:", a3, a4, a5, a6);
}

- (void).cxx_destruct
{
}

- (void)_logEventForAssets:(id)a3 favorite:(BOOL)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = (void **)MEMORY[0x1E4F56418];
    if (!a4) {
      v5 = (void **)MEMORY[0x1E4F56420];
    }
    v6 = *v5;
    v7 = (void *)MEMORY[0x1E4F56658];
    uint64_t v8 = *MEMORY[0x1E4F56558];
    v16[0] = a3;
    uint64_t v9 = *MEMORY[0x1E4F56560];
    v15[0] = v8;
    v15[1] = v9;
    id v10 = v6;
    id v11 = a3;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v16[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    [v7 sendEvent:v10 withPayload:v14];
  }
}

- (void)performBackgroundTask
{
  v3 = self->_assetsToProcess;
  BOOL v4 = +[PXFavoriteAssetsAction toggledValueForAssets:self->_assetsToProcess];
  if (!v4 && [(PXActionPerformer *)self prefersAssetInclusionAfterRemoval]) {
    [(PXPhotoKitAssetActionPerformer *)self forceIncludeAssetsInDataSource];
  }
  v5 = [[PXFavoriteAssetsAction alloc] initWithAssets:v3 favorite:v4];
  v6 = [(PXActionPerformer *)self undoManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PXPhotoKitToggleFavoriteActionPerformer_performBackgroundTask__block_invoke;
  v8[3] = &unk_1E5DC7BF0;
  v8[4] = self;
  uint64_t v9 = v3;
  BOOL v10 = v4;
  v7 = v3;
  [(PXAction *)v5 executeWithUndoManager:v6 completionHandler:v8];
}

void __64__PXPhotoKitToggleFavoriteActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) _logEventForAssets:*(void *)(a1 + 40) favorite:*(unsigned __int8 *)(a1 + 48)];
  }
  [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:v5];
}

- (void)performUserInteractionTask
{
  objc_initWeak(&location, self);
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  BOOL v4 = [(PXActionPerformer *)self presentationEnvironment];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PXPhotoKitToggleFavoriteActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E5DC7BC8;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __69__PXPhotoKitToggleFavoriteActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v12 = a3;
  id v7 = a4;
  if ([v12 count])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), a3);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v9 = WeakRetained;
    uint64_t v10 = 1;
    id v11 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v9 = WeakRetained;
    uint64_t v10 = 0;
    id v11 = v7;
  }
  [WeakRetained completeUserInteractionTaskWithSuccess:v10 error:v11];
}

@end