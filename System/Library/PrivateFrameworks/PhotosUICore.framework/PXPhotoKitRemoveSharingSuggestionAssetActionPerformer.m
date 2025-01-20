@interface PXPhotoKitRemoveSharingSuggestionAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)shouldPreventTargetedDismissalAnimation;
- (id)actionType;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitRemoveSharingSuggestionAssetActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"minus.circle";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedSharedLibraryString(@"PXSharedLibrary_Action_RemoveFromSharedLibrarySuggestions");
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4FB13F0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__PXPhotoKitRemoveSharingSuggestionAssetActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v12[3] = &unk_1E5DC8470;
  id v13 = v7;
  id v9 = v7;
  v10 = [v8 actionWithTitle:a3 image:a4 identifier:0 handler:v12];
  [v10 setAttributes:2];

  return v10;
}

uint64_t __100__PXPhotoKitRemoveSharingSuggestionAssetActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6 = a4;
  if (objc_msgSend(v6, "px_isSharedLibrarySharingSuggestionsSmartAlbum")) {
    char v7 = 1;
  }
  else {
    char v7 = objc_msgSend(v6, "px_isSharedLibrarySharingSuggestion");
  }

  return v7;
}

- (id)actionType
{
  v2 = @"PXAssetActionTypeRemoveSharingSuggestion";
  return @"PXAssetActionTypeRemoveSharingSuggestion";
}

- (void)performBackgroundTask
{
  v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_INFO, "Attempting remove sharing suggestions. Calling PXRemoveLibrarySharingSuggestionAction", buf, 2u);
  }

  v4 = [PXRemoveLibrarySharingSuggestionAction alloc];
  v5 = [(PXPhotoKitAssetActionPerformer *)self assets];
  id v6 = [(PXAssetsAction *)v4 initWithAssets:v5];

  char v7 = [(PXActionPerformer *)self undoManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PXPhotoKitRemoveSharingSuggestionAssetActionPerformer_performBackgroundTask__block_invoke;
  v8[3] = &unk_1E5DD3158;
  v8[4] = self;
  [(PXAction *)v6 executeWithUndoManager:v7 completionHandler:v8];
}

uint64_t __78__PXPhotoKitRemoveSharingSuggestionAssetActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

- (BOOL)shouldPreventTargetedDismissalAnimation
{
  return 1;
}

@end