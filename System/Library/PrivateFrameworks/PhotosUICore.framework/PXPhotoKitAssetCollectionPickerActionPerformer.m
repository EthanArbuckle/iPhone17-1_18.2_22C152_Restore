@interface PXPhotoKitAssetCollectionPickerActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (void)_addAssets:(id)a3 toUserAlbum:(id)a4;
- (void)_dismissPickerControllerAndCompleteTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_handlePickedAssets:(id)a3;
- (void)performUserInteractionTask;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation PXPhotoKitAssetCollectionPickerActionPerformer

- (void).cxx_destruct
{
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_pickerDidFinishPicking)
  {
    v3 = PLUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring swipe to dismiss callback because the action is already finished (dismissed via the Cancel/Add button).", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    self->_pickerDidFinishPicking = 1;
    v3 = [(PXAssetCollectionActionPerformer *)self assetCollection];
    v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "Picker action manually dismissed with no picked assets for assetCollection %@", (uint8_t *)&v6, 0xCu);
    }

    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

- (void)_addAssets:(id)a3 toUserAlbum:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v7 canPerformEditOperation:3] & 1) == 0) {
    PXAssertGetLog();
  }
  uint64_t v8 = [[PXAddAssetsToAssetCollectionAction alloc] initWithAssets:v6 assetCollection:v7];
  if (v8)
  {
    v9 = [(PXActionPerformer *)self undoManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__PXPhotoKitAssetCollectionPickerActionPerformer__addAssets_toUserAlbum___block_invoke;
    v11[3] = &unk_1E5DD1CD8;
    id v12 = v6;
    id v13 = v7;
    v14 = self;
    [(PXAction *)v8 executeWithUndoManager:v9 completionHandler:v11];
  }
  else
  {
    v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_INFO, "Finishing picker action with no assets needed to be added to assetCollection %@", buf, 0xCu);
    }

    [(PXPhotoKitAssetCollectionPickerActionPerformer *)self _dismissPickerControllerAndCompleteTaskWithSuccess:1 error:0];
  }
}

void __73__PXPhotoKitAssetCollectionPickerActionPerformer__addAssets_toUserAlbum___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLUIGetLog();
  id v7 = v6;
  if (a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    uint64_t v8 = [*(id *)(a1 + 32) count];
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    v10 = "Picker action added %lu assets to asset collection %@";
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v14 = [*(id *)(a1 + 32) count];
    uint64_t v15 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    uint64_t v20 = v15;
    __int16 v21 = 2112;
    id v22 = v5;
    v10 = "Failed to add %lu assets to asset collection %@. Error: %@";
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 32;
  }
  _os_log_impl(&dword_1A9AE7000, v11, v12, v10, buf, v13);
LABEL_7:

  id v16 = v5;
  px_dispatch_on_main_queue();
}

uint64_t __73__PXPhotoKitAssetCollectionPickerActionPerformer__addAssets_toUserAlbum___block_invoke_969(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissPickerControllerAndCompleteTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)_handlePickedAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  uint64_t v6 = [v4 count];
  id v7 = PLUIGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_INFO, "Picked %lu assets to add to %@", buf, 0x16u);
    }

    if (objc_msgSend(v5, "px_isSharedAlbum"))
    {
      pickerController = self->_pickerController;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __70__PXPhotoKitAssetCollectionPickerActionPerformer__handlePickedAssets___block_invoke;
      v10[3] = &unk_1E5DD0F30;
      v10[4] = self;
      id v11 = v4;
      id v12 = v5;
      [(PXActionPerformer *)self dismissViewController:pickerController completionHandler:v10];
    }
    else
    {
      [(PXPhotoKitAssetCollectionPickerActionPerformer *)self _addAssets:v4 toUserAlbum:v5];
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = (uint64_t)v5;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_INFO, "Finishing picker action with no picked assets for assetCollection %@", buf, 0xCu);
    }

    [(PXPhotoKitAssetCollectionPickerActionPerformer *)self _dismissPickerControllerAndCompleteTaskWithSuccess:1 error:0];
  }
}

void __70__PXPhotoKitAssetCollectionPickerActionPerformer__handlePickedAssets___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) fetchedObjects];
  [v2 addAssets:v3 toSharedAlbum:*(void *)(a1 + 48)];
}

- (void)_dismissPickerControllerAndCompleteTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  pickerController = self->_pickerController;
  id v7 = a4;
  [(PXActionPerformer *)self dismissViewController:pickerController completionHandler:0];
  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:v4 error:v7];
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_pickerDidFinishPicking)
  {
    self->_pickerDidFinishPicking = 1;
    PXMap();
  }
  uint64_t v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring picker did finish picking callback because the action is already finished (dismissed via swipe gesture or Cancel + Done were tapped at the same time).", v7, 2u);
  }
}

uint64_t __74__PXPhotoKitAssetCollectionPickerActionPerformer_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetIdentifier];
}

- (void)performUserInteractionTask
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXActionPerformer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [(PXActionPerformer *)self delegate];
    id v5 = [v4 memoryAssetsActionFactory];
    uint64_t v6 = [v5 assetsPickerPresenter];

    if (v6)
    {
      [v6 presentAssetPicker];
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [(PXAssetCollectionActionPerformer *)self assetCollection];
    int v16 = 138412290;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_INFO, "Presenting picker for adding assets to assetCollection %@", (uint8_t *)&v16, 0xCu);
  }
  id v9 = objc_alloc(MEMORY[0x1E4F39930]);
  v10 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  id v11 = [v10 photoLibrary];
  uint64_t v6 = (void *)[v9 initWithPhotoLibraryAndOnlyReturnsIdentifiers:v11];

  [v6 setSelectionLimit:0];
  [v6 setDisabledCapabilities:16];
  [v6 _setDisabledPrivateCapabilities:7];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v6];
  [v12 setDelegate:self];
  uint32_t v13 = [v12 presentationController];
  [v13 setDelegate:self];

  if ([(PXActionPerformer *)self presentViewController:v12])
  {
    uint64_t v14 = v12;
    pickerController = self->_pickerController;
    self->_pickerController = v14;
  }
  else
  {
    pickerController = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"PXPhotoKitAssetCollectionPickerActionPerformer: Failed to present Picker");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:pickerController];
  }

LABEL_11:
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypeAddToAlbumFromPicker" systemImageName:a5];
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return @"plus";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(@"PXPhotosGridAddPhotosActionMenuTitle", @"PhotosUICore");
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [a3 assetCollection];
  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint32_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 2353, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v14 object file lineNumber description];
LABEL_10:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v15 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v15);
    int v16 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 2353, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v14, v16 object file lineNumber description];

    goto LABEL_10;
  }
LABEL_3:
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v7 memoryAssetsActionFactory],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    char v10 = 1;
  }
  else
  {
    char v10 = [v8 canPerformEditOperation:3];
  }

  return v10;
}

@end