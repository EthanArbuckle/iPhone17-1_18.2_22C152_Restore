@interface PUPXPhotoKitAddToAlbumActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
+ (void)_configureAction:(id)a3;
- (UIViewController)albumPickerViewController;
- (void)_dismissPickerControllerAndCompleteTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_handlePickedAlbum:(id)a3 assets:(id)a4;
- (void)_handleUserInteractionTaskResult:(BOOL)a3 error:(id)a4;
- (void)_presentAlbumPickerForAssets:(id)a3;
- (void)performUserInteractionTask;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setAlbumPickerViewController:(id)a3;
@end

@implementation PUPXPhotoKitAddToAlbumActionPerformer

- (void).cxx_destruct
{
}

- (void)setAlbumPickerViewController:(id)a3
{
}

- (UIViewController)albumPickerViewController
{
  return self->_albumPickerViewController;
}

- (void)_handleUserInteractionTaskResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPXPhotoKitAssetActionManager.m", 717, @"%s must be called on the main thread", "-[PUPXPhotoKitAddToAlbumActionPerformer _handleUserInteractionTaskResult:error:]");
  }
  objc_initWeak(&location, self);
  v8 = [(PUPXPhotoKitAddToAlbumActionPerformer *)self albumPickerViewController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__PUPXPhotoKitAddToAlbumActionPerformer__handleUserInteractionTaskResult_error___block_invoke;
  v10[3] = &unk_1E5F2E530;
  objc_copyWeak(&v11, &location);
  [(PXActionPerformer *)self dismissViewController:v8 completionHandler:v10];

  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:v4 error:v7];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __80__PUPXPhotoKitAddToAlbumActionPerformer__handleUserInteractionTaskResult_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAlbumPickerViewController:0];
}

- (void)_handlePickedAlbum:(id)a3 assets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  if (!v6)
  {
    v10 = @"Missing asset collection";
LABEL_6:
    objc_copyWeak(&v11, &location);
    px_dispatch_on_main_queue();

    objc_destroyWeak(&v11);
    goto LABEL_7;
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F8FF60]) initWithAssets:v7 assetCollection:v6];
  if (!v8)
  {
    v10 = @"Failed to create add to asset collection action";
    goto LABEL_6;
  }
  [(id)objc_opt_class() _configureAction:v8];
  v9 = [(PXActionPerformer *)self undoManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PUPXPhotoKitAddToAlbumActionPerformer__handlePickedAlbum_assets___block_invoke;
  v12[3] = &unk_1E5F286B8;
  id v13 = v7;
  id v14 = v6;
  objc_copyWeak(&v15, &location);
  [v8 executeWithUndoManager:v9 completionHandler:v12];

  objc_destroyWeak(&v15);
LABEL_7:
  objc_destroyWeak(&location);
}

void __67__PUPXPhotoKitAddToAlbumActionPerformer__handlePickedAlbum_assets___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      id v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "failed adding assets to album: %@ %@ %@", buf, 0x20u);
    }
  }
  objc_copyWeak(&v10, (id *)(a1 + 48));
  char v11 = a2;
  id v9 = v5;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v10);
}

void __67__PUPXPhotoKitAddToAlbumActionPerformer__handlePickedAlbum_assets___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", *(void *)(a1 + 32));
  [WeakRetained _handleUserInteractionTaskResult:0 error:v2];
}

void __67__PUPXPhotoKitAddToAlbumActionPerformer__handlePickedAlbum_assets___block_invoke_416(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleUserInteractionTaskResult:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

- (void)_dismissPickerControllerAndCompleteTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = [(PUPXPhotoKitAddToAlbumActionPerformer *)self albumPickerViewController];
  [(PXActionPerformer *)self dismissViewController:v6 completionHandler:0];

  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:v4 error:v7];
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    id v6 = [(PXPhotoKitAssetActionPerformer *)self assets];
    id v7 = [v6 firstObject];
    uint64_t v8 = [v7 photoLibrary];
    id v9 = [v8 librarySpecificFetchOptions];

    id v10 = [v5 firstObject];
    char v11 = [v10 itemIdentifier];

    v12 = (void *)MEMORY[0x1E4F38EE8];
    v17[0] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    __int16 v14 = [v12 fetchAssetCollectionsWithLocalIdentifiers:v13 options:v9];
    uint64_t v15 = [v14 firstObject];

    __int16 v16 = [(PXPhotoKitAssetActionPerformer *)self assets];
    [(PUPXPhotoKitAddToAlbumActionPerformer *)self _handlePickedAlbum:v15 assets:v16];
  }
  else
  {
    [(PUPXPhotoKitAddToAlbumActionPerformer *)self _dismissPickerControllerAndCompleteTaskWithSuccess:0 error:0];
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Picker cancelled by presentation controller dismissal");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PUPXPhotoKitAddToAlbumActionPerformer *)self _dismissPickerControllerAndCompleteTaskWithSuccess:0 error:v4];
}

- (void)performUserInteractionTask
{
  objc_initWeak(&location, self);
  v3 = [(PXPhotoKitAssetActionPerformer *)self assets];
  id v4 = [(PXActionPerformer *)self presentationEnvironment];
  objc_copyWeak(&v5, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary();

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__PUPXPhotoKitAddToAlbumActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v10 count];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (v7) {
    [WeakRetained _presentAlbumPickerForAssets:v10];
  }
  else {
    [WeakRetained completeUserInteractionTaskWithSuccess:0 error:v6];
  }
}

- (void)_presentAlbumPickerForAssets:(id)a3
{
  id v8 = +[PUPickerUtilities pickerConfigurationForAddToAlbumWithAssetsToAdd:a3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v8];
  [v4 setDelegate:self];
  [(PUPXPhotoKitAddToAlbumActionPerformer *)self setAlbumPickerViewController:v4];
  id v5 = [(PUPXPhotoKitAddToAlbumActionPerformer *)self albumPickerViewController];
  id v6 = [v5 presentationController];
  [v6 setDelegate:self];

  uint64_t v7 = [(PUPXPhotoKitAddToAlbumActionPerformer *)self albumPickerViewController];
  [(PXActionPerformer *)self presentViewController:v7];
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"rectangle.stack.badge.plus";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(@"ADD_TO_ALBUM");
}

+ (void)_configureAction:(id)a3
{
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x1E4FB14A8];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = PULocalizedString(@"ADD_TO_ALBUM_BUTTON_TITLE");
  id v10 = (void *)[v8 initWithTitle:v9 style:0 target:v7 action:a4];

  return v10;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a5];
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 sourceType];
  if ([v7 isTrashed] & 1) != 0 || (objc_msgSend(v7, "isRecoveredAsset"))
  {
    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = 0;
    if (v9 != 2 && v9 != 8) {
      BOOL v10 = [v8 assetCollectionType] != 7;
    }
  }

  return v10;
}

@end