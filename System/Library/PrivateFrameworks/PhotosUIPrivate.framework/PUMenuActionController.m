@interface PUMenuActionController
- (BOOL)assetActionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)assetActionPerformer:(id)a3 presentViewController:(id)a4;
- (NSArray)actions;
- (PUAssetActionPerformer)_activeActionPerformer;
- (PUBrowsingSession)browsingSession;
- (PUMenuActionControllerDelegate)delegate;
- (PXActionManager)photosUICoreActionManager;
- (PXRegionOfInterestProvider)regionOfInterestProvider;
- (UIViewController)presentingViewController;
- (id)_contextMenuActionWithTitle:(id)a3 image:(id)a4 attributes:(unint64_t)a5 actionHandler:(id)a6;
- (id)_copyMenuElement;
- (id)contextMenuActionIfAvailableForActionType:(unint64_t)a3;
- (id)debugActions;
- (id)undoManagerForAssetActionPerformer:(id)a3;
- (void)_executeActionPerformer:(id)a3;
- (void)_notifyDelegateOfAction:(id)a3;
- (void)_performFavoriteAction:(BOOL)a3;
- (void)_performSimpleActionWithType:(unint64_t)a3 completionHandler:(id)a4;
- (void)_promptTrashActionConfirmationForAsset:(id)a3 withCompletionHandler:(id)a4;
- (void)_setActiveActionPerformer:(id)a3;
- (void)setBrowsingSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPhotosUICoreActionManager:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRegionOfInterestProvider:(id)a3;
@end

@implementation PUMenuActionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeActionPerformer, 0);
  objc_storeStrong((id *)&self->_photosUICoreActionManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_regionOfInterestProvider);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_browsingSession, 0);
}

- (void)_setActiveActionPerformer:(id)a3
{
}

- (PUAssetActionPerformer)_activeActionPerformer
{
  return self->__activeActionPerformer;
}

- (void)setPhotosUICoreActionManager:(id)a3
{
}

- (PXActionManager)photosUICoreActionManager
{
  return self->_photosUICoreActionManager;
}

- (PUMenuActionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUMenuActionControllerDelegate *)WeakRetained;
}

- (void)setRegionOfInterestProvider:(id)a3
{
}

- (PXRegionOfInterestProvider)regionOfInterestProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_regionOfInterestProvider);
  return (PXRegionOfInterestProvider *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (BOOL)assetActionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, SEL, id, id))a5 + 2))(a5, a2, a3, a4);
  }
  return 1;
}

- (BOOL)assetActionPerformer:(id)a3 presentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PUMenuActionController *)self presentingViewController];
  if (v8)
  {
    if ([v6 actionType] == 32)
    {
      v9 = [[PUNavigationController alloc] initWithRootViewController:v7];
      [v8 presentViewController:v9 animated:1 completion:0];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v7;
        v11 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v12 = [v11 userInterfaceIdiom];

        if (v12 == 1) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = objc_msgSend(v10, "px_shouldForceAlertStyle");
        }
        [v10 setPreferredStyle:v13];
      }
      [v8 presentViewController:v7 animated:1 completion:0];
    }
  }

  return v8 != 0;
}

- (id)undoManagerForAssetActionPerformer:(id)a3
{
  v3 = [(PUMenuActionController *)self presentingViewController];
  v4 = [v3 undoManager];

  return v4;
}

- (void)_executeActionPerformer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PUMenuActionController *)self _activeActionPerformer];
  uint64_t v6 = [v5 state];

  if (v6 == 10 || v6 == 5)
  {
    id v7 = PLOneUpGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [(PUMenuActionController *)self _activeActionPerformer];
      *(_DWORD *)buf = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Attempted to execute performer:%@ while an active performer is busy: %@", buf, 0x16u);
    }
  }
  else
  {
    [(PUMenuActionController *)self _setActiveActionPerformer:v4];
    [v4 setDelegate:self];
    uint64_t v9 = [v4 actionType];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__PUMenuActionController__executeActionPerformer___block_invoke;
    v10[3] = &unk_1E5F2E8E0;
    v10[4] = self;
    v10[5] = v9;
    [v4 performWithCompletionHandler:v10];
  }
}

void __50__PUMenuActionController__executeActionPerformer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Error executing action: %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v6 = [*(id *)(a1 + 32) presentingViewController];
    id v7 = (void *)v6;
    if (*(void *)(a1 + 40) == 30 && v6)
    {
      v8 = PULocalizedString(@"COPY_TO_PASTEBOARD_PREPARATION_ERROR_TITLE");
      uint64_t v9 = PULocalizedString(@"COPY_TO_PASTEBOARD_PREPARATION_ERROR_MESSAGE");
      id v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:v9 preferredStyle:1];
      v11 = (void *)MEMORY[0x1E4FB1410];
      id v12 = PULocalizedString(@"OK");
      __int16 v13 = [v11 actionWithTitle:v12 style:0 handler:&__block_literal_global_103071];
      [v10 addAction:v13];

      [v7 presentViewController:v10 animated:1 completion:0];
    }
  }
  [*(id *)(a1 + 32) _setActiveActionPerformer:0];
}

- (void)_performFavoriteAction:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  v5 = [(PUMenuActionController *)self browsingSession];
  uint64_t v6 = [v5 viewModel];
  id v7 = [v6 currentAssetReference];

  v8 = [v7 asset];
  uint64_t v9 = [v7 assetCollection];
  id v10 = (void *)v9;
  if (v8 && v9)
  {
    v11 = [v5 actionManager];
    if ([v11 canPerformActionType:41 onAsset:v8 inAssetCollection:v10])
    {
      v14[0] = v7;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      __int16 v13 = [v11 actionPerformerForSettingFavoriteTo:v3 onAssetReferences:v12];
      [(PUMenuActionController *)self _executeActionPerformer:v13];
    }
  }
}

- (void)_promptTrashActionConfirmationForAsset:(id)a3 withCompletionHandler:(id)a4
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__103080;
  v73 = __Block_byref_object_dispose__103081;
  id v74 = 0;
  uint64_t v63 = 0;
  v64 = (id *)&v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__103080;
  v67 = __Block_byref_object_dispose__103081;
  id v68 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__103080;
  v61 = __Block_byref_object_dispose__103081;
  id v62 = 0;
  int v8 = [v6 isGuestAsset];
  char v9 = v8;
  if (!v8) {
    goto LABEL_3;
  }
  v75[0] = v6;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
  id v12 = (id *)(v58 + 5);
  v11 = (void *)v58[5];
  __int16 v13 = v64;
  id v55 = v64[5];
  id obj = v11;
  char v14 = PXContentSyndicationRemoveConfirmationTitleAndMessageLocalizedStrings();
  objc_storeStrong(v12, obj);
  objc_storeStrong(v13 + 5, v55);

  if ((v14 & 1) == 0)
  {
LABEL_3:
    id v15 = [v6 photoLibrary];
    uint64_t v16 = [v15 photoLibrary];

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F8ACA0]) initWithPhotoLibrary:v16];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __87__PUMenuActionController__promptTrashActionConfirmationForAsset_withCompletionHandler___block_invoke;
    v47[3] = &unk_1E5F2E870;
    id v18 = v17;
    id v48 = v18;
    v51 = &v69;
    v52 = &v63;
    v53 = &v57;
    id v49 = v6;
    id v19 = v16;
    id v50 = v19;
    char v54 = v9;
    [v19 performBlockAndWait:v47];
  }
  v20 = PULocalizedString(@"CANCEL");
  v21 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v70[5] message:v64[5] preferredStyle:0];
  v22 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v23 = v58[5];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __87__PUMenuActionController__promptTrashActionConfirmationForAsset_withCompletionHandler___block_invoke_2;
  v45[3] = &unk_1E5F2E898;
  id v24 = v7;
  id v46 = v24;
  v25 = [v22 actionWithTitle:v23 style:2 handler:v45];
  [v21 addAction:v25];

  v26 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  v42 = __87__PUMenuActionController__promptTrashActionConfirmationForAsset_withCompletionHandler___block_invoke_3;
  v43 = &unk_1E5F2E898;
  id v27 = v24;
  id v44 = v27;
  v28 = [v26 actionWithTitle:v20 style:1 handler:&v40];
  objc_msgSend(v21, "addAction:", v28, v40, v41, v42, v43);

  v29 = [(PUMenuActionController *)self browsingSession];
  v30 = [v29 viewModel];
  v31 = [v30 currentAssetReference];
  v32 = [v31 pxAssetReference];

  v33 = [(PUMenuActionController *)self regionOfInterestProvider];
  v34 = [v33 regionOfInterestForAssetReference:v32];

  if (v34)
  {
    v35 = [v21 popoverPresentationController];
    v36 = [(PUMenuActionController *)self presentingViewController];
    v37 = [v36 view];
    [v35 setSourceView:v37];

    v38 = [v35 sourceView];
    [v34 rectInCoordinateSpace:v38];
    objc_msgSend(v35, "setSourceRect:");
  }
  v39 = [(PUMenuActionController *)self presentingViewController];
  [v39 presentViewController:v21 animated:1 completion:0];

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v69, 8);
}

void __87__PUMenuActionController__promptTrashActionConfirmationForAsset_withCompletionHandler___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  id v12 = *(id *)(v6 + 40);
  id obj = v4;
  uint64_t v7 = *(void *)(v5 + 8);
  id v11 = *(id *)(v7 + 40);
  int v8 = *(void **)(a1 + 32);
  char v9 = objc_msgSend(*(id *)(a1 + 40), "pl_managedAssetFromPhotoLibrary:", v2);
  v14[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v8 getDeletionWarningTitle:&obj message:&v12 buttonTitle:&v11 forAssets:v10 syndicationAssetCount:*(unsigned __int8 *)(a1 + 80) clientName:0 style:0];
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_storeStrong((id *)(v6 + 40), v12);
  objc_storeStrong((id *)(v7 + 40), v11);
}

uint64_t __87__PUMenuActionController__promptTrashActionConfirmationForAsset_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __87__PUMenuActionController__promptTrashActionConfirmationForAsset_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performSimpleActionWithType:(unint64_t)a3 completionHandler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  uint64_t v7 = [(PUMenuActionController *)self browsingSession];
  int v8 = [v7 viewModel];
  char v9 = [v8 currentAssetReference];

  id v10 = [v9 asset];
  uint64_t v11 = [v9 assetCollection];
  id v12 = (void *)v11;
  uint64_t v13 = 0;
  if (v10 && v11)
  {
    char v14 = [v7 actionManager];
    v21 = v10;
    v22 = v12;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    v23[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

    uint64_t v13 = [v14 canPerformAction:a3 onAllAssetsByAssetCollection:v16];
    if (v13)
    {
      v20 = v9;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
      v17 = id v19 = self;
      id v18 = [v14 actionPerformerForSimpleActionType:a3 onAssetReferences:v17];
      [(PUMenuActionController *)v19 _executeActionPerformer:v18];
    }
  }
  if (v6) {
    v6[2](v6, v13);
  }
}

- (void)_notifyDelegateOfAction:(id)a3
{
  if (self->_delegateRespondsTo.didDismissWithActionIdentifier)
  {
    id v4 = a3;
    id v5 = [(PUMenuActionController *)self delegate];
    [v5 menuActionController:self didDismissWithActionIdentifier:v4];
  }
}

- (id)debugActions
{
  uint64_t v2 = [(PUMenuActionController *)self photosUICoreActionManager];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if (v2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__PUMenuActionController_debugActions__block_invoke;
    v6[3] = &unk_1E5F2E848;
    id v7 = v2;
    id v8 = v3;
    id v4 = _Block_copy(v6);
    (*((void (**)(void *, void, void))v4 + 2))(v4, *MEMORY[0x1E4F90CD8], 0);
    (*((void (**)(void *, void, void))v4 + 2))(v4, *MEMORY[0x1E4F90CD0], 0);
    (*((void (**)(void *, void, void))v4 + 2))(v4, *MEMORY[0x1E4F90CC0], 0);
    (*((void (**)(void *, void, void))v4 + 2))(v4, *MEMORY[0x1E4F90CC8], 0);
    (*((void (**)(void *, void, void))v4 + 2))(v4, *MEMORY[0x1E4F90CE0], 0);
    (*((void (**)(void *, void, void))v4 + 2))(v4, *MEMORY[0x1E4F90CE8], 0);
    (*((void (**)(void *, void, void))v4 + 2))(v4, *MEMORY[0x1E4F90CF8], 0);
  }
  return v3;
}

void __38__PUMenuActionController_debugActions__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v11 = a2;
  int v5 = [*(id *)(a1 + 32) canPerformActionType:v11];
  uint64_t v6 = v11;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) systemImageNameForActionType:v11];
    id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:v7];
    char v9 = [*(id *)(a1 + 32) previewActionForActionType:v11 image:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a3) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 0;
      }
      [v9 setAttributes:v10];
    }
    [*(id *)(a1 + 40) addObject:v9];

    uint64_t v6 = v11;
  }
}

- (NSArray)actions
{
  v100[1] = *MEMORY[0x1E4F143B8];
  v92 = [(PUMenuActionController *)self browsingSession];
  v87 = [v92 actionManager];
  id v4 = [v92 viewModel];
  v91 = [v4 currentAssetReference];

  v93 = [v91 asset];
  v88 = [v91 assetCollection];
  int v5 = objc_msgSend(v88, "px_isMemory");
  id v94 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(PUMenuActionController *)self photosUICoreActionManager];
  id v7 = [(PUMenuActionController *)self _copyMenuElement];
  if (v7) {
    [v94 addObject:v7];
  }
  v86 = v7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__PUMenuActionController_actions__block_invoke;
  aBlock[3] = &unk_1E5F2E820;
  id v8 = v6;
  id v99 = v8;
  char v9 = (char *)_Block_copy(aBlock);
  uint64_t v10 = v9;
  if (v8)
  {
    id v11 = (void (**)(char *, void, id))(v9 + 16);
    (*((void (**)(char *, void, id))v9 + 2))(v9, *MEMORY[0x1E4F90C50], v94);
    (*v11)(v10, *MEMORY[0x1E4F90D28], v94);
    (*v11)(v10, *MEMORY[0x1E4F90D68], v94);
    id v12 = +[PUPhotoEditProtoSettings sharedInstance];
    int v13 = [v12 showAutoEnhanceAction];

    if (v13) {
      (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90C70], v94);
    }
    char v14 = +[PUPhotoEditProtoSettings sharedInstance];
    int v15 = [v14 showRotateAction];

    if (v15)
    {
      (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90C88], v94);
      (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90C90], v94);
    }
    if (([v8 canPerformActionType:*MEMORY[0x1E4F90D00]] & 1) == 0)
    {
      uint64_t v16 = *MEMORY[0x1E4F90DC8];
      if ([v8 canPerformActionType:*MEMORY[0x1E4F90DC8]])
      {
        v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle"];
        id v18 = [v8 previewActionForActionType:v16 image:v17];
        [v94 addObject:v18];
      }
    }
    uint64_t v19 = *MEMORY[0x1E4F90D38];
    if ([v8 canPerformActionType:*MEMORY[0x1E4F90D38]])
    {
      v20 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle"];
      v21 = [v8 previewActionForActionType:v19 image:v20];
      [v94 addObject:v21];
    }
    id v22 = (id)*MEMORY[0x1E4F90D70];
    if ([v8 canPerformActionType:v22])
    {
      uint64_t v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
      id v24 = [v8 previewActionForActionType:v22 image:v23];

      [v94 addObject:v24];
    }

    if (![v8 canPerformActionType:*MEMORY[0x1E4F90DC0]]) {
      goto LABEL_23;
    }
  }
  else
  {
    v25 = [(PUMenuActionController *)self contextMenuActionIfAvailableForActionType:32];
    if (v25) {
      [v94 addObject:v25];
    }
  }
  v26 = [(PUMenuActionController *)self contextMenuActionIfAvailableForActionType:41];
  if (v26) {
    [v94 addObject:v26];
  }

  if (v8)
  {
LABEL_23:
    (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90C68], v94);
    (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90CB0], v94);
    uint64_t v27 = *MEMORY[0x1E4F90D60];
    int v28 = [v8 canPerformActionType:*MEMORY[0x1E4F90D60]];
    if (v93) {
      int v29 = v28;
    }
    else {
      int v29 = 0;
    }
    if (v29 == 1)
    {
      id v30 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v78 = [MEMORY[0x1E4F28B00] currentHandler];
        v79 = (objc_class *)objc_opt_class();
        v80 = NSStringFromClass(v79);
        v81 = objc_msgSend(v30, "px_descriptionForAssertionMessage");
        [v78 handleFailureInMethod:a2, self, @"PUMenuActionController.m", 305, @"%@ should be an instance inheriting from %@, but it is %@", @"photosUICoreActionManager", v80, v81, v86 object file lineNumber description];
      }
      if ([v30 shouldEnableActionType:v27 onAsset:v93])
      {
        v31 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrowshape.turn.up.left"];
        v32 = [v30 previewActionForActionType:v27 image:v31];
        [v94 addObject:v32];
      }
    }
    uint64_t v33 = *MEMORY[0x1E4F90C20];
    if (([v8 canPerformActionType:*MEMORY[0x1E4F90C20]] & (v93 != 0)) == 1)
    {
      id v34 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v82 = [MEMORY[0x1E4F28B00] currentHandler];
        v83 = (objc_class *)objc_opt_class();
        v84 = NSStringFromClass(v83);
        v85 = objc_msgSend(v34, "px_descriptionForAssertionMessage");
        [v82 handleFailureInMethod:a2, self, @"PUMenuActionController.m", 320, @"%@ should be an instance inheriting from %@, but it is %@", @"photosUICoreActionManager", v84, v85 object file lineNumber description];
      }
      if ([v34 shouldEnableActionType:v33 onAsset:v93])
      {
        v35 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.circle"];
        v36 = [v34 previewActionForActionType:v33 image:v35];
        [v94 addObject:v36];
      }
    }
    id v37 = (id)*MEMORY[0x1E4F90DA0];
    if ([v8 canPerformActionType:v37])
    {
      v38 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.rectangle.stack"];
      v39 = [v8 previewActionForActionType:v37 image:v38];

      if (v39) {
        [v94 addObject:v39];
      }
    }
    if (v5)
    {
      id v40 = (id)*MEMORY[0x1E4F90DA8];
      if ([v8 canPerformActionType:v40])
      {
        uint64_t v41 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle"];
        v42 = [v8 previewActionForActionType:v40 image:v41];

        if (v42) {
          [v94 addObject:v42];
        }
      }
    }
    uint64_t v43 = *MEMORY[0x1E4F90D80];
    if ([v8 canPerformActionType:*MEMORY[0x1E4F90D80]])
    {
      if (!self->_delegateRespondsTo.preventRevealInMomentAction
        || ([(PUMenuActionController *)self delegate],
            id v44 = objc_claimAutoreleasedReturnValue(),
            char v45 = [v44 menuActionControllerPreventRevealInMomentAction:self],
            v44,
            (v45 & 1) == 0))
      {
        id v46 = [MEMORY[0x1E4FB1818] systemImageNamed:@"photo.on.rectangle"];
        v47 = [v8 previewActionForActionType:v43 image:v46];

        [v94 addObject:v47];
      }
    }
    goto LABEL_58;
  }
  int v48 = [v87 canPerformActionType:33 onAsset:v93 inAssetCollection:v88];
  int v49 = v48;
  if (!self->_delegateRespondsTo.preventRevealInMomentAction)
  {
    if ((v48 & 1) == 0) {
      goto LABEL_59;
    }
    goto LABEL_57;
  }
  id v50 = [(PUMenuActionController *)self delegate];
  char v51 = [v50 menuActionControllerPreventRevealInMomentAction:self];

  if ((v51 & 1) == 0 && ((v49 ^ 1) & 1) == 0)
  {
LABEL_57:
    PULocalizedString(@"PUONEUP_QUICK_ACTION_REVEAL_IN_ALLPHOTOS");
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v52 = (void *)MEMORY[0x1E4FB13F0];
    v53 = [MEMORY[0x1E4FB1818] systemImageNamed:@"photo.on.rectangle"];
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __33__PUMenuActionController_actions__block_invoke_2;
    v95[3] = &unk_1E5F2E7A8;
    objc_copyWeak(&v96, &location);
    char v54 = [v52 actionWithTitle:v37 image:v53 identifier:0 handler:v95];

    [v94 addObject:v54];
    objc_destroyWeak(&v96);
    objc_destroyWeak(&location);
LABEL_58:
  }
LABEL_59:
  v90 = [(PUMenuActionController *)self contextMenuActionIfAvailableForActionType:14];
  if (v90) {
    [v94 addObject:v90];
  }
  v89 = [(PUMenuActionController *)self contextMenuActionIfAvailableForActionType:12];
  if (v89) {
    [v94 addObject:v89];
  }
  if (v8)
  {
    id v55 = (id)*MEMORY[0x1E4F90D30];
    if ([v8 canPerformActionType:v55])
    {
      v56 = [MEMORY[0x1E4FB1818] systemImageNamed:@"rectangle.stack.person.crop"];
      uint64_t v57 = [v8 previewActionForActionType:v55 image:v56];

      [v94 addObject:v57];
    }
    id v58 = (id)*MEMORY[0x1E4F90D90];
    if ([v8 canPerformActionType:v58])
    {
      uint64_t v59 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.2.square.stack"];
      v60 = [v8 previewActionForActionType:v58 image:v59];

      [v94 addObject:v60];
    }
    id v61 = (id)*MEMORY[0x1E4F90C28];
    if ([v8 canPerformActionType:v61])
    {
      id v62 = [MEMORY[0x1E4FB1818] systemImageNamed:@"photo"];
      uint64_t v63 = [v8 previewActionForActionType:v61 image:v62];

      [v94 addObject:v63];
    }

    (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90C08], v94);
    (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90C18], v94);
    (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90D18], v94);
    (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90D10], v94);
    (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90D58], v94);
  }
  v64 = [(PUMenuActionController *)self contextMenuActionIfAvailableForActionType:54];
  if (v64) {
    [v94 addObject:v64];
  }
  if (v8)
  {
    (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90D50], v94);
    id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v66 = (id)*MEMORY[0x1E4F90D20];
    if ([v8 canPerformActionType:v66]) {
      (*((void (**)(char *, id, id))v10 + 2))(v10, v66, v65);
    }
    id v67 = (id)*MEMORY[0x1E4F90DE0];
    if ([v8 canPerformActionType:v67])
    {
      id v68 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
      uint64_t v69 = [v8 previewActionForActionType:v67 image:v68];

      [v65 addObject:v69];
    }
    (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90D48], v65);
    (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90C38], v65);
    (*((void (**)(char *, void, id))v10 + 2))(v10, *MEMORY[0x1E4F90C30], v65);
    v70 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v65];
    [v94 addObject:v70];
  }
  uint64_t v71 = [(PUMenuActionController *)self debugActions];
  if ([v71 count])
  {
    v72 = [MEMORY[0x1E4FB1818] systemImageNamed:@"apple.logo"];
    v73 = [MEMORY[0x1E4FB1970] menuWithTitle:@"Internal" image:v72 identifier:0 options:0 children:v71];
    id v74 = (void *)MEMORY[0x1E4FB1970];
    v100[0] = v73;
    v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:1];
    v76 = [v74 menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v75];
    [v94 addObject:v76];
  }
  return (NSArray *)v94;
}

void __33__PUMenuActionController_actions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) canPerformActionType:v10])
  {
    uint64_t v6 = [*(id *)(a1 + 32) systemImageNameForActionType:v10];
    id v7 = *(void **)(a1 + 32);
    id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:v6];
    char v9 = [v7 menuElementForActionType:v10 image:v8 willStartActionHandler:0 didEndActionHandler:0];

    if (v9)
    {
      [v5 addObject:v9];
    }
  }
}

void __33__PUMenuActionController_actions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performSimpleActionWithType:33 completionHandler:0];
}

- (id)_copyMenuElement
{
  uint64_t v3 = [(PUMenuActionController *)self photosUICoreActionManager];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x1E4F90C48];
    if ([v3 canPerformActionType:*MEMORY[0x1E4F90C48]])
    {
      uint64_t v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
      id v7 = [v4 previewActionForActionType:v5 image:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = [(PUMenuActionController *)self contextMenuActionIfAvailableForActionType:30];
  }

  return v7;
}

- (id)contextMenuActionIfAvailableForActionType:(unint64_t)a3
{
  if (a3 != 2
    || ([(PUMenuActionController *)self presentingViewController],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 conformsToProtocol:&unk_1F07C3768],
        v6,
        (v7 & 1) == 0))
  {
    char v9 = [(PUMenuActionController *)self browsingSession];
    uint64_t v10 = [v9 actionManager];

    id v11 = [(PUMenuActionController *)self browsingSession];
    id v12 = [v11 viewModel];
    int v13 = [v12 currentAssetReference];

    char v14 = [v13 asset];
    int v15 = [v13 assetCollection];
    objc_initWeak(location, self);
    id v37 = v13;
    if ((uint64_t)a3 <= 29)
    {
      if (a3 - 1 < 2)
      {
        v38 = PULocalizedString(@"PUONEUP_QUICK_ACTION_REMOVE_FROM_ALBUM");
        uint64_t v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
        goto LABEL_36;
      }
      if (a3 - 11 < 2)
      {
        v38 = PULocalizedString(@"PUONEUP_QUICK_ACTION_RECOVER");
        uint64_t v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.bin"];
        goto LABEL_36;
      }
      if (a3 - 13 < 2)
      {
        v38 = PULocalizedString(@"PUONEUP_QUICK_ACTION_RESTORE");
        uint64_t v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.bin"];
LABEL_36:
        v21 = (void *)v16;
        id v18 = (void *)v10;
LABEL_42:
        uint64_t v29 = 0;
        goto LABEL_43;
      }
      goto LABEL_40;
    }
    if ((uint64_t)a3 > 53)
    {
      if (a3 - 55 < 2)
      {
        id v18 = (void *)v10;
        uint64_t v25 = [v14 mediaType];
        v26 = @"ITEM";
        if (v25 == 2) {
          v26 = @"VIDEO";
        }
        if (v25 == 1) {
          uint64_t v27 = @"PHOTO";
        }
        else {
          uint64_t v27 = v26;
        }
        int v28 = [@"PUONEUP_QUICK_ACTION_SYNDICATION_REMOVE_SUGGESTION_" stringByAppendingString:v27];
        v38 = PULocalizedString(v28);

        v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
        uint64_t v29 = 2;
        goto LABEL_43;
      }
      if (a3 == 54)
      {
        id v18 = (void *)v10;
        uint64_t v30 = [v14 mediaType];
        v31 = @"ITEM";
        if (v30 == 1) {
          v31 = @"PHOTO";
        }
        if (v30 == 2) {
          v31 = @"VIDEO";
        }
        v32 = v31;
        uint64_t v33 = [@"PUONEUP_QUICK_ACTION_SYNDICATION_SAVE_TO_LIBRARY_" stringByAppendingString:v32];
        v38 = PULocalizedString(v33);

        v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.down"];
        goto LABEL_41;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x1EuLL:
          v38 = PULocalizedString(@"PUONEUP_QUICK_ACTION_COPY");
          uint64_t v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
          goto LABEL_36;
        case 0x20uLL:
          v38 = PULocalizedString(@"PUONEUP_QUICK_ACTION_SHARE");
          v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
          id v18 = (void *)v10;
          uint64_t v23 = v44;
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __68__PUMenuActionController_contextMenuActionIfAvailableForActionType___block_invoke;
          v44[3] = &unk_1E5F2E7A8;
          id v24 = &v45;
          objc_copyWeak(&v45, location);
          goto LABEL_38;
        case 0x29uLL:
          if ([v14 isFavorite]) {
            v17 = @"PUONEUP_QUICK_ACTION_UNFAVORITE";
          }
          else {
            v17 = @"PUONEUP_QUICK_ACTION_FAVORITE";
          }
          v38 = PULocalizedString(v17);
          id v18 = (void *)v10;
          int v19 = [v14 isFavorite];
          if (v19) {
            v20 = @"heart.slash";
          }
          else {
            v20 = @"heart";
          }
          v21 = [MEMORY[0x1E4FB1818] systemImageNamed:v20];
          char v22 = v19 ^ 1;
          uint64_t v23 = v41;
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __68__PUMenuActionController_contextMenuActionIfAvailableForActionType___block_invoke_2;
          v41[3] = &unk_1E5F2E7D0;
          id v24 = &v42;
          objc_copyWeak(&v42, location);
          char v43 = v22;
LABEL_38:
          id v34 = _Block_copy(v23);
          objc_destroyWeak(v24);
          uint64_t v29 = 0;
          if (v34)
          {
LABEL_44:
            int v35 = [v18 canPerformActionType:a3 onAsset:v14 inAssetCollection:v15];
            if ((v35 & [v18 shouldEnableActionType:a3 onAsset:v14 inAssetCollection:v15]) == 1)
            {
              id v8 = [(PUMenuActionController *)self _contextMenuActionWithTitle:v38 image:v21 attributes:v29 actionHandler:v34];
            }
            else
            {
              id v8 = 0;
            }
            objc_destroyWeak(location);

            goto LABEL_48;
          }
LABEL_43:
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __68__PUMenuActionController_contextMenuActionIfAvailableForActionType___block_invoke_3;
          aBlock[3] = &unk_1E5F2E7F8;
          objc_copyWeak(v40, location);
          v40[1] = (id)a3;
          id v34 = _Block_copy(aBlock);
          objc_destroyWeak(v40);
          goto LABEL_44;
      }
    }
LABEL_40:
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [(__CFString *)v32 handleFailureInMethod:a2, self, @"PUMenuActionController.m", 171, @"Attempted to create an on-demand context menu action for an unsupported action type: %ld", a3, v13 object file lineNumber description];
    id v18 = (void *)v10;
    v21 = 0;
    v38 = 0;
LABEL_41:

    goto LABEL_42;
  }
  id v8 = 0;
LABEL_48:
  return v8;
}

void __68__PUMenuActionController_contextMenuActionIfAvailableForActionType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDelegateOfAction:@"com.apple.mobileslideshow.PUMenuActionController.share"];
}

void __68__PUMenuActionController_contextMenuActionIfAvailableForActionType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performFavoriteAction:*(unsigned __int8 *)(a1 + 40)];
}

void __68__PUMenuActionController_contextMenuActionIfAvailableForActionType___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performSimpleActionWithType:*(void *)(a1 + 40) completionHandler:0];
}

- (id)_contextMenuActionWithTitle:(id)a3 image:(id)a4 attributes:(unint64_t)a5 actionHandler:(id)a6
{
  char v7 = [MEMORY[0x1E4FB13F0] actionWithTitle:a3 image:a4 identifier:0 handler:a6];
  [v7 setAttributes:a5];
  return v7;
}

- (void)setBrowsingSession:(id)a3
{
  uint64_t v5 = (PUBrowsingSession *)a3;
  browsingSession = self->_browsingSession;
  p_browsingSession = &self->_browsingSession;
  if (browsingSession != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_browsingSession, a3);
    uint64_t v5 = v8;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.didDismissWithActionIdentifier = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.preventRevealInMomentAction = objc_opt_respondsToSelector() & 1;
  }
}

@end