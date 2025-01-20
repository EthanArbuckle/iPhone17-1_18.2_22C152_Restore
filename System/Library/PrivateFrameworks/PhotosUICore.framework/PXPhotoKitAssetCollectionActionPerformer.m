@interface PXPhotoKitAssetCollectionActionPerformer
+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5;
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5;
+ (id)createStandardActionForAssetCollectionReference:(id)a3 withInput:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)menuElementsForAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4;
- (UIAction)sendingAction;
- (id)_confirmationAlertTitleForBlacklistingAction:(id)a3 viewSpec:(id)a4;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (void)_addAssets:(id)a3 toSharedAlbum:(id)a4;
- (void)_addStreamShareSources:(id)a3 toSharedAlbum:(id)a4;
- (void)_promptBlacklistingConfirmatonForUserAction:(id)a3 viewSpec:(id)a4 completionHandler:(id)a5;
- (void)addAssets:(id)a3 toSharedAlbum:(id)a4;
- (void)setSendingAction:(id)a3;
@end

@implementation PXPhotoKitAssetCollectionActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingAction, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
}

- (void)setSendingAction:(id)a3
{
}

- (UIAction)sendingAction
{
  return self->_sendingAction;
}

- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return [(PXActionPerformer *)self dismissViewController:a4 completionHandler:a5];
}

- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4
{
  return [(PXActionPerformer *)self presentViewController:a4];
}

- (void)addAssets:(id)a3 toSharedAlbum:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = PLSharedAlbumsGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v8 uuid];
    *(_DWORD *)buf = 138543362;
    v26 = v10;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "PXPhotoKitAssetCollectionActionPerformer: Posting assets to shared album with UUID=%{public}@", buf, 0xCu);
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 781, @"%s must be called on the main thread", "-[PXPhotoKitAssetCollectionActionPerformer addAssets:toSharedAlbum:]");
  }
  if ([v7 count])
  {
    id v11 = v8;
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_8:
        v12 = [(PXActionPerformer *)self presentationEnvironment];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __68__PXPhotoKitAssetCollectionActionPerformer_addAssets_toSharedAlbum___block_invoke;
        v22[3] = &unk_1E5DB3470;
        id v23 = v11;
        SEL v24 = a2;
        v22[4] = self;
        id v13 = v11;
        PXSharedAlbumsValidateSharedAlbumAddAssets(v13, v7, v12, v22);

        goto LABEL_12;
      }
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v20);
      v21 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
      [v17 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 788, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v19, v21 object file lineNumber description];
    }
    else
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      [v17 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionActionManager.m", 788, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v19 object file lineNumber description];
    }

    goto LABEL_8;
  }
  v14 = PLSharedAlbumsGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v8 uuid];
    *(_DWORD *)buf = 138543362;
    v26 = v15;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "PXPhotoKitAssetCollectionActionPerformer: No assets to add to shared album with UUID=%{public}@", buf, 0xCu);
  }
  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
LABEL_12:
}

void __68__PXPhotoKitAssetCollectionActionPerformer_addAssets_toSharedAlbum___block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  id v14 = v3;
  if (v3)
  {
    id v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = a1[6];
      uint64_t v10 = a1[4];
      id v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      id v13 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v8 handleFailureInMethod:v9, v10, @"PXPhotoKitAssetCollectionActionManager.m", 791, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"validatedAssets", v12, v13 object file lineNumber description];
    }
    BOOL v5 = +[PXVideoTrimQueueController areVideoSourcesStreamShareSources:v4];
    v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    if (v5) {
      [v6 _addStreamShareSources:v4 toSharedAlbum:v7];
    }
    else {
      [v6 _addAssets:v4 toSharedAlbum:v7];
    }
  }
  else
  {
    [(id)a1[4] completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

- (void)_addAssets:(id)a3 toSharedAlbum:(id)a4
{
  id v6 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __69__PXPhotoKitAssetCollectionActionPerformer__addAssets_toSharedAlbum___block_invoke;
  v15 = &unk_1E5DD0058;
  v16 = self;
  id v17 = v6;
  id v7 = v6;
  id v8 = +[PXSharedAlbumAddToViewFactory contentHostedViewControllerWithSharedAlbum:a4 assets:v7 doneCallback:&v12];
  id v9 = objc_alloc(MEMORY[0x1E4FB19E8]);
  uint64_t v10 = (UINavigationController *)objc_msgSend(v9, "initWithRootViewController:", v8, v12, v13, v14, v15, v16);
  presentedViewController = self->_presentedViewController;
  self->_presentedViewController = v10;

  [(UINavigationController *)self->_presentedViewController setModalPresentationStyle:1];
  [(PXActionPerformer *)self presentViewController:self->_presentedViewController completionHandler:0];
}

uint64_t __69__PXPhotoKitAssetCollectionActionPerformer__addAssets_toSharedAlbum___block_invoke(uint64_t result, int a2)
{
  if (*(void *)(*(void *)(result + 32) + 152))
  {
    uint64_t v3 = result;
    id v4 = PLUIGetLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Adding assets to Shared Albums succeeded.", buf, 2u);
      }

      PXIncrementShareCountForAssets(*(void **)(v3 + 40));
    }
    else
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Adding assets to Shared Albums cancelled.", buf, 2u);
      }
    }
    id v6 = *(void **)(v3 + 32);
    uint64_t v7 = v6[19];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__PXPhotoKitAssetCollectionActionPerformer__addAssets_toSharedAlbum___block_invoke_494;
    v8[3] = &unk_1E5DCFE98;
    v8[4] = v6;
    char v9 = a2;
    return [v6 dismissViewController:v7 completionHandler:v8];
  }
  return result;
}

uint64_t __69__PXPhotoKitAssetCollectionActionPerformer__addAssets_toSharedAlbum___block_invoke_494(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 40) error:0];
}

- (void)_addStreamShareSources:(id)a3 toSharedAlbum:(id)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PXPhotoKitAssetCollectionActionPerformer__addStreamShareSources_toSharedAlbum___block_invoke;
  v8[3] = &unk_1E5DD2188;
  v8[4] = self;
  BOOL v5 = +[PXSharedAlbumAddToViewFactory contentHostedViewControllerWithSharedAlbum:a4 mediaSources:a3 doneCallback:v8];
  id v6 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  presentedViewController = self->_presentedViewController;
  self->_presentedViewController = v6;

  [(UINavigationController *)self->_presentedViewController setModalPresentationStyle:1];
  [(PXActionPerformer *)self presentViewController:self->_presentedViewController completionHandler:0];
}

uint64_t __81__PXPhotoKitAssetCollectionActionPerformer__addStreamShareSources_toSharedAlbum___block_invoke(uint64_t result, int a2)
{
  if (*(void *)(*(void *)(result + 32) + 152))
  {
    uint64_t v3 = result;
    id v4 = PLUIGetLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        id v6 = "Adding media sources to Shared Albums succeeded.";
LABEL_7:
        _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      }
    }
    else if (v5)
    {
      *(_WORD *)buf = 0;
      id v6 = "Adding media sources to Shared Albums cancelled.";
      goto LABEL_7;
    }

    uint64_t v7 = *(void **)(v3 + 32);
    uint64_t v8 = v7[19];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__PXPhotoKitAssetCollectionActionPerformer__addStreamShareSources_toSharedAlbum___block_invoke_490;
    v9[3] = &unk_1E5DCFE98;
    v9[4] = v7;
    char v10 = a2;
    return [v7 dismissViewController:v8 completionHandler:v9];
  }
  return result;
}

uint64_t __81__PXPhotoKitAssetCollectionActionPerformer__addStreamShareSources_toSharedAlbum___block_invoke_490(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 40) error:0];
}

- (void)_promptBlacklistingConfirmatonForUserAction:(id)a3 viewSpec:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(PXPhotoKitAssetCollectionActionPerformer *)self _confirmationAlertTitleForBlacklistingAction:v10 viewSpec:v8];
  uint64_t v12 = PXLocalizedStringFromTable(@"PXBlockMemoryResetDescription_iOS", @"PhotosUICore");
  uint64_t v13 = PXLocalizedStringFromTable(@"PXBlockConfirmationDialogButtonTitle_Confirm", @"PhotosUICore");
  id v14 = PXLocalizedStringFromTable(@"PXBlockConfirmationDialogButtonTitle_Cancel", @"PhotosUICore");
  v26 = (void *)v11;
  v15 = (void *)[[NSString alloc] initWithFormat:@"%@\n%@", v11, v12];
  v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v15 preferredStyle:0];
  LODWORD(v11) = [v10 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeaturePerson"];

  id v17 = 0;
  if (v11)
  {
    v18 = [v8 person];
    [v8 accessoryViewFrame];
    id v17 = +[PXMemoriesBlacklistAccessoryViewHelper avatarViewWithFrame:person:](PXMemoriesBlacklistAccessoryViewHelper, "avatarViewWithFrame:person:", v18);
  }
  v19 = (void *)MEMORY[0x1E4FB1410];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __115__PXPhotoKitAssetCollectionActionPerformer__promptBlacklistingConfirmatonForUserAction_viewSpec_completionHandler___block_invoke;
  v29[3] = &unk_1E5DCE788;
  id v20 = v9;
  id v30 = v20;
  v21 = [v19 actionWithTitle:v13 style:2 handler:v29];
  [v16 addAction:v21];

  v22 = (void *)MEMORY[0x1E4FB1410];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __115__PXPhotoKitAssetCollectionActionPerformer__promptBlacklistingConfirmatonForUserAction_viewSpec_completionHandler___block_invoke_2;
  v27[3] = &unk_1E5DCE788;
  id v23 = v20;
  id v28 = v23;
  SEL v24 = [v22 actionWithTitle:v14 style:1 handler:v27];
  [v16 addAction:v24];

  if (v17)
  {
    v25 = [[PXMemoriesBlacklistAccessoryViewController alloc] initWithAccessoryView:v17 viewSpec:v8];
    [v16 _setHeaderContentViewController:v25];
  }
  [(PXActionPerformer *)self presentViewController:v16];
}

uint64_t __115__PXPhotoKitAssetCollectionActionPerformer__promptBlacklistingConfirmatonForUserAction_viewSpec_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __115__PXPhotoKitAssetCollectionActionPerformer__promptBlacklistingConfirmatonForUserAction_viewSpec_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_confirmationAlertTitleForBlacklistingAction:(id)a3 viewSpec:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeatureTimeDate"])
  {
    uint64_t v7 = @"PXBlockMemoryDayConfirmationTitle";
  }
  else if ([v5 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeatureTimeDateInterval"])
  {
    uint64_t v7 = @"PXBlockMemoryDateIntervalConfirmationTitle";
  }
  else if ([v5 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeatureHoliday"])
  {
    uint64_t v7 = @"PXBlockMemoryHolidayConfirmationTitle";
  }
  else if ([v5 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeaturePlace"])
  {
    uint64_t v7 = @"PXBlockMemoryPlaceConfirmationTitle";
  }
  else
  {
    if ([v5 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeaturePerson"])
    {
      id v8 = [v6 person];
      id v9 = objc_msgSend(v8, "px_localizedName");

      if ([v9 length])
      {
        id v10 = PXLocalizedStringFromTable(@"PXBlockMemoryPersonSpecificConfirmationTitle", @"PhotosUICore");
        uint64_t v11 = PXLocalizedStringWithValidatedFormat(v10, @"%@");
      }
      else
      {
        uint64_t v11 = PXLocalizedStringFromTable(@"PXBlockMemoryPersonConfirmationTitle", @"PhotosUICore");
      }

      goto LABEL_14;
    }
    uint64_t v7 = @"PXBlockMemoryGenericConfirmationTitle";
  }
  uint64_t v11 = PXLocalizedStringFromTable(v7, @"PhotosUICore");
LABEL_14:

  return v11;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  id v5 = objc_opt_class();
  id v6 = [(PXAssetCollectionActionPerformer *)self assetCollectionReference];
  uint64_t v7 = [v5 localizedTitleForUseCase:a3 assetCollectionReference:v6 withInputs:self];

  return v7;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return 0;
}

+ (id)menuElementsForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)createStandardActionForAssetCollectionReference:(id)a3 withInput:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [a1 localizedTitleForUseCase:1 assetCollectionReference:v10 withInputs:v9];
  uint64_t v12 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v13 = [a1 systemImageNameForAssetCollectionReference:v10 withInputs:v9];

  id v14 = [v12 systemImageNamed:v13];

  if (![v11 length]) {
    PXAssertGetLog();
  }
  v15 = [MEMORY[0x1E4FB13F0] actionWithTitle:v11 image:v14 identifier:0 handler:v8];
  if ([a1 isActionDestructive]) {
    objc_msgSend(v15, "setAttributes:", objc_msgSend(v15, "attributes") | 2);
  }

  return v15;
}

+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  return 0;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return 0;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return 0;
}

+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5
{
  return [a1 canPerformOnAssetCollectionReference:a4 withInputs:a5];
}

@end