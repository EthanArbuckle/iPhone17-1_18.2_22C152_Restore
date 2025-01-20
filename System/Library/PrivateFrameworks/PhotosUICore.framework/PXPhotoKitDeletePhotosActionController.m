@interface PXPhotoKitDeletePhotosActionController
+ (id)_suffix:(id)a3;
+ (id)warningStringForAssets:(id)a3 isDeleting:(BOOL)a4;
+ (void)assetTypeCountsForAssets:(id)a3 photosCount:(int64_t *)a4 videosCount:(int64_t *)a5 othersCount:(int64_t *)a6;
- (BOOL)shouldSkipDeleteConfirmation;
- (NSArray)_assets;
- (NSArray)_plAssets;
- (NSUndoManager)undoManager;
- (PXPhotoKitDeletePhotosActionController)initWithAction:(int64_t)a3 assets:(id)a4 undoManager:(id)a5 delegate:(id)a6;
- (PXPhotoKitDeletePhotosActionControllerDelegate)delegate;
- (UIAlertController)_mainAlertController;
- (UIAlertController)_oneTimeConfirmationAlertController;
- (int64_t)action;
- (void)_ensureMainAlertController;
- (void)_ensureOneTimeConfirmationAlertController;
- (void)_handleFinalConfirmation:(int64_t)a3;
- (void)_handleMainAlertConfirmation:(int64_t)a3;
- (void)_handleOneTimeAlertConfirmed;
- (void)_recordUserConfirmation:(int64_t)a3;
- (void)_recordVariant:(id)a3;
- (void)_runDestructiveActionWithCompletion:(id)a3;
- (void)_setMainAlertController:(id)a3;
- (void)_setOneTimeConfirmationAlertController:(id)a3;
- (void)_showOnetimeConfirmation;
- (void)appWasBackgrounded:(id)a3;
- (void)beginObservingAppBackgroundingEvents;
- (void)getConfirmationMessage:(id *)a3 destructiveButtonTitle:(id *)a4 cancelButtonTitle:(id *)a5 isDestructiveBehavior:(BOOL *)a6;
- (void)performWithWillDeleteHandler:(id)a3 completionHandler:(id)a4;
- (void)ppt_performDeleteWithoutUserConfirmationWithCompletionHandler:(id)a3;
- (void)setShouldSkipDeleteConfirmation:(BOOL)a3;
- (void)stopObservingAppBackgroundEvents;
@end

@implementation PXPhotoKitDeletePhotosActionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__oneTimeConfirmationAlertController, 0);
  objc_storeStrong((id *)&self->__mainAlertController, 0);
  objc_storeStrong((id *)&self->__plAssets, 0);
  objc_storeStrong((id *)&self->__assets, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong(&self->_willDeleteHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

- (void)_setOneTimeConfirmationAlertController:(id)a3
{
}

- (UIAlertController)_oneTimeConfirmationAlertController
{
  return self->__oneTimeConfirmationAlertController;
}

- (void)_setMainAlertController:(id)a3
{
}

- (UIAlertController)_mainAlertController
{
  return self->__mainAlertController;
}

- (NSArray)_plAssets
{
  return self->__plAssets;
}

- (NSArray)_assets
{
  return self->__assets;
}

- (void)setShouldSkipDeleteConfirmation:(BOOL)a3
{
  self->_shouldSkipDeleteConfirmation = a3;
}

- (BOOL)shouldSkipDeleteConfirmation
{
  return self->_shouldSkipDeleteConfirmation;
}

- (PXPhotoKitDeletePhotosActionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotoKitDeletePhotosActionControllerDelegate *)WeakRetained;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (int64_t)action
{
  return self->_action;
}

- (void)appWasBackgrounded:(id)a3
{
  v4 = [(PXPhotoKitDeletePhotosActionController *)self _oneTimeConfirmationAlertController];

  if (v4)
  {
    v5 = [(PXPhotoKitDeletePhotosActionController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      v7 = [(PXPhotoKitDeletePhotosActionController *)self delegate];
      v8 = [(PXPhotoKitDeletePhotosActionController *)self _oneTimeConfirmationAlertController];
      [v7 deletePhotosActionController:self dismissConfirmationViewController:v8];
    }
    [(PXPhotoKitDeletePhotosActionController *)self _setOneTimeConfirmationAlertController:0];
  }
  v9 = [(PXPhotoKitDeletePhotosActionController *)self _mainAlertController];

  if (v9)
  {
    v10 = [(PXPhotoKitDeletePhotosActionController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(PXPhotoKitDeletePhotosActionController *)self delegate];
      v13 = [(PXPhotoKitDeletePhotosActionController *)self _mainAlertController];
      [v12 deletePhotosActionController:self dismissConfirmationViewController:v13];
    }
    [(PXPhotoKitDeletePhotosActionController *)self _setMainAlertController:0];
    [(PXPhotoKitDeletePhotosActionController *)self _setMainAlertController:0];
  }
  [(PXPhotoKitDeletePhotosActionController *)self _handleFinalConfirmation:2];
}

- (void)stopObservingAppBackgroundEvents
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];
}

- (void)beginObservingAppBackgroundingEvents
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_appWasBackgrounded_ name:*MEMORY[0x1E4FB2640] object:0];
}

- (void)getConfirmationMessage:(id *)a3 destructiveButtonTitle:(id *)a4 cancelButtonTitle:(id *)a5 isDestructiveBehavior:(BOOL *)a6
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v10 = [(PXPhotoKitDeletePhotosActionController *)self _plAssets];
  uint64_t v11 = [v10 count];
  uint64_t v70 = v11;
  v64 = PLSuffixForItems();
  v12 = [v10 firstObject];
  id v13 = objc_alloc(MEMORY[0x1E4F8ACA0]);
  v14 = [v12 photoLibrary];
  v65 = (void *)[v13 initWithPhotoLibrary:v14];

  switch(self->_action)
  {
    case 0:
    case 1:
      v60 = a4;
      v15 = [(PXPhotoKitDeletePhotosActionController *)self _assets];
      uint64_t v16 = PXContentSyndicationAssetCount(v15);
      if (v16 == [v15 count])
      {
        v69[1] = 0;
        v69[2] = 0;
        char v17 = PXContentSyndicationRemoveConfirmationTitleAndMessageLocalizedStrings(v15);
        id v18 = 0;
        id v19 = 0;
        if (v17)
        {
LABEL_9:
          id v62 = v19;

          a4 = v60;
          if (!v18) {
            goto LABEL_18;
          }
          goto LABEL_10;
        }
      }
      else
      {
        id v19 = 0;
        id v18 = 0;
      }
      id v68 = v18;
      v69[0] = v19;
      [v65 getDeletionWarningTitle:0 message:v69 buttonTitle:&v68 forAssets:v10 syndicationAssetCount:v16 clientName:0 style:0];
      id v23 = v69[0];

      id v24 = v68;
      id v18 = v24;
      id v19 = v23;
      goto LABEL_9;
    case 2:
      id v62 = 0;
      BOOL v20 = 0;
      int v21 = 0;
      v22 = @"RECOVER_BUTTON_TITLE_";
      goto LABEL_19;
    case 3:
    case 4:
      id v62 = 0;
      BOOL v20 = 0;
      int v21 = 1;
      v22 = @"UNDELETE_BUTTON_TITLE_";
      goto LABEL_19;
    case 5:
      if (v11 == 1) {
        v27 = &stru_1F00B0030;
      }
      else {
        v27 = @"S";
      }
      v28 = [NSString stringWithFormat:@"EXPUNGE_%@%@_WARNING", v64, v27];
      PLLocalizedFrameworkString();
      id v62 = (id)objc_claimAutoreleasedReturnValue();

      int v21 = 0;
      BOOL v20 = 1;
      v22 = @"EXPUNGE_BUTTON_TITLE_";
      goto LABEL_19;
    case 6:
      id v66 = 0;
      id v67 = 0;
      [v65 getExpungeWarningMessage:&v67 buttonTitle:&v66 forAssets:v10];
      id v62 = v67;
      id v18 = v66;
      if (v18)
      {
LABEL_10:
        BOOL v20 = 1;
        v26 = v62;
        v25 = a3;
        if (!a3) {
          goto LABEL_48;
        }
        goto LABEL_47;
      }
LABEL_18:
      v22 = 0;
      int v21 = 0;
      BOOL v20 = 1;
      uint64_t v11 = v70;
LABEL_19:
      [v65 getAvalancheDeleteWarning:0 actualDeletionCount:&v70 forAssets:v10];
      uint64_t v29 = v70;
      if (v21 && !v70)
      {
        v55 = v22;
        BOOL v56 = v20;
        v59 = a6;
        v61 = a4;
        v57 = v12;
        v58 = a5;
        v30 = [(PXPhotoKitDeletePhotosActionController *)self _assets];
        v31 = [(PXPhotoKitDeletePhotosActionController *)self _plAssets];
        id v32 = v30;
        id v33 = v31;
        v34 = [MEMORY[0x1E4F1CA80] set];
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v35 = v32;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v75 objects:buf count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v76;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v76 != v38) {
                objc_enumerationMutation(v35);
              }
              v40 = [*(id *)(*((void *)&v75 + 1) + 8 * i) uuid];
              if (v40) {
                [v34 addObject:v40];
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v75 objects:buf count:16];
          }
          while (v37);
        }

        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v41 = v33;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v71 objects:v79 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v72;
          do
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v72 != v44) {
                objc_enumerationMutation(v41);
              }
              v46 = objc_msgSend(*(id *)(*((void *)&v71 + 1) + 8 * j), "pl_uuid");
              if (v46 && [v34 containsObject:v46]) {
                [v34 removeObject:v46];
              }
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v71 objects:v79 count:16];
          }
          while (v43);
        }

        v47 = [v34 allObjects];

        v48 = PLUIGetLog();
        v12 = v57;
        BOOL v20 = v56;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = [(PXPhotoKitDeletePhotosActionController *)self _assets];
          uint64_t v50 = [v49 count];
          v51 = [(PXPhotoKitDeletePhotosActionController *)self _plAssets];
          uint64_t v52 = [v51 count];
          *(_DWORD *)buf = 134218754;
          uint64_t v81 = v11;
          __int16 v82 = 2048;
          uint64_t v83 = v50;
          __int16 v84 = 2048;
          uint64_t v85 = v52;
          __int16 v86 = 2112;
          v87 = v47;
          _os_log_impl(&dword_1A9AE7000, v48, OS_LOG_TYPE_ERROR, "Invalid recover assets state. previousDeletionCount: %ld, assetsCount: %lu, plAssetsCount: %lu, missingUUIDs: %@", buf, 0x2Au);
        }
        uint64_t v29 = v70;
        a5 = v58;
        a6 = v59;
        a4 = v61;
        v22 = v55;
      }
      if (v29 == 1)
      {
        v53 = [NSString stringWithFormat:@"%@%@", v22, v64];
        PLLocalizedFrameworkString();
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v53 = [NSString stringWithFormat:@"%@%@S", v22, v64];
        v54 = PLLocalizedFrameworkString();
        PXLocalizedStringWithValidatedFormat(v54, @"%lu");
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v26 = v62;
      v25 = a3;

      if (a3) {
LABEL_47:
      }
        id *v25 = v26;
LABEL_48:
      if (a4) {
        *a4 = v18;
      }
      if (a5)
      {
        PLLocalizedFrameworkString();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a6) {
        *a6 = v20;
      }

      return;
    default:
      id v62 = 0;
      v22 = 0;
      int v21 = 0;
      BOOL v20 = 1;
      goto LABEL_19;
  }
}

- (void)_handleOneTimeAlertConfirmed
{
  id v3 = [(PXPhotoKitDeletePhotosActionController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(PXPhotoKitDeletePhotosActionController *)self delegate];
    char v6 = [(PXPhotoKitDeletePhotosActionController *)self _oneTimeConfirmationAlertController];
    [v5 deletePhotosActionController:self dismissConfirmationViewController:v6];
  }
  [(PXPhotoKitDeletePhotosActionController *)self _setOneTimeConfirmationAlertController:0];
  PLCPLRecordDidNotifyDeleteBehaviorForCurrentAccount();
  int64_t v7 = [(PXActionRecord *)self->_record userConfirmation];
  [(PXPhotoKitDeletePhotosActionController *)self _handleFinalConfirmation:v7];
}

- (void)_handleMainAlertConfirmation:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  -[PXPhotoKitDeletePhotosActionController _recordUserConfirmation:](self, "_recordUserConfirmation:");
  unsigned int v5 = ((unint64_t)a3 < 5) & (0x1Au >> a3);
  char v6 = [(PXPhotoKitDeletePhotosActionController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(PXPhotoKitDeletePhotosActionController *)self delegate];
    v9 = [(PXPhotoKitDeletePhotosActionController *)self _mainAlertController];
    [v8 deletePhotosActionController:self dismissConfirmationViewController:v9];
  }
  [(PXPhotoKitDeletePhotosActionController *)self _setMainAlertController:0];
  if (v5
    && self->_action <= 1uLL
    && ([(PXPhotoKitDeletePhotosActionController *)self _plAssets],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 indexOfObjectPassingTest:&__block_literal_global_239],
        v10,
        v11 != 0x7FFFFFFFFFFFFFFFLL)
    && PLCPLShouldNotifyDeleteBehaviorForCurrentAccount())
  {
    v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "[PXPhotoKitDeletePhotosActionController] Will show Onetime Confirmation Sheet.", (uint8_t *)&v16, 2u);
    }

    [(PXPhotoKitDeletePhotosActionController *)self _showOnetimeConfirmation];
  }
  else
  {
    id v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = @"NO";
      if (v5) {
        v14 = @"YES";
      }
      v15 = v14;
      int v16 = 138412290;
      char v17 = v15;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "[PXPhotoKitDeletePhotosActionController] Handling Final User Decision Should Delete: %@.", (uint8_t *)&v16, 0xCu);
    }
    [(PXPhotoKitDeletePhotosActionController *)self _handleFinalConfirmation:a3];
  }
}

uint64_t __71__PXPhotoKitDeletePhotosActionController__handleMainAlertConfirmation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canMoveToTrash];
}

- (void)_showOnetimeConfirmation
{
  [(PXPhotoKitDeletePhotosActionController *)self _ensureOneTimeConfirmationAlertController];
  id v4 = [(PXPhotoKitDeletePhotosActionController *)self delegate];
  id v3 = [(PXPhotoKitDeletePhotosActionController *)self _oneTimeConfirmationAlertController];
  [v4 deletePhotosActionController:self presentConfirmationViewController:v3];
}

- (void)_ensureOneTimeConfirmationAlertController
{
  id v3 = [(PXPhotoKitDeletePhotosActionController *)self _oneTimeConfirmationAlertController];

  if (!v3)
  {
    id v4 = PLLocalizedFrameworkString();
    unsigned int v5 = PLLocalizedFrameworkString();
    objc_initWeak(&location, self);
    char v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:v5 preferredStyle:1];
    objc_msgSend(v6, "setPx_shouldForceAlertStyle:", 1);
    char v7 = (void *)MEMORY[0x1E4FB1410];
    v8 = PLLocalizedFrameworkString();
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __83__PXPhotoKitDeletePhotosActionController__ensureOneTimeConfirmationAlertController__block_invoke;
    id v13 = &unk_1E5DC20B8;
    objc_copyWeak(&v14, &location);
    v9 = [v7 actionWithTitle:v8 style:1 handler:&v10];
    objc_msgSend(v6, "addAction:", v9, v10, v11, v12, v13);

    [(PXPhotoKitDeletePhotosActionController *)self _setOneTimeConfirmationAlertController:v6];
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
}

void __83__PXPhotoKitDeletePhotosActionController__ensureOneTimeConfirmationAlertController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleOneTimeAlertConfirmed];
}

- (void)_ensureMainAlertController
{
  id v3 = [(PXPhotoKitDeletePhotosActionController *)self _mainAlertController];

  if (!v3)
  {
    unsigned __int8 v26 = 0;
    id v24 = 0;
    id v25 = 0;
    id v23 = 0;
    [(PXPhotoKitDeletePhotosActionController *)self getConfirmationMessage:&v25 destructiveButtonTitle:&v24 cancelButtonTitle:&v23 isDestructiveBehavior:&v26];
    id v4 = v25;
    id v5 = v24;
    id v6 = v23;
    objc_initWeak(&location, self);
    char v7 = [(PXPhotoKitDeletePhotosActionController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0
      && ([(PXPhotoKitDeletePhotosActionController *)self delegate],
          v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 preferredAlertControllerStyleForDeletePhotosActionController:self],
          v9,
          v10))
    {
      uint64_t v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:&stru_1F00B0030 message:v4 preferredStyle:v10];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:0 preferredStyle:0];
    }
    v12 = (void *)v11;
    uint64_t v13 = 2 * v26;
    id v14 = (void *)MEMORY[0x1E4FB1410];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__PXPhotoKitDeletePhotosActionController__ensureMainAlertController__block_invoke;
    v20[3] = &unk_1E5DC20B8;
    objc_copyWeak(&v21, &location);
    v15 = [v14 actionWithTitle:v5 style:v13 handler:v20];
    [v12 addAction:v15];

    int v16 = (void *)MEMORY[0x1E4FB1410];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__PXPhotoKitDeletePhotosActionController__ensureMainAlertController__block_invoke_2;
    v18[3] = &unk_1E5DC20B8;
    objc_copyWeak(&v19, &location);
    char v17 = [v16 actionWithTitle:v6 style:1 handler:v18];
    [v12 addAction:v17];

    [(PXPhotoKitDeletePhotosActionController *)self _setMainAlertController:v12];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }
}

void __68__PXPhotoKitDeletePhotosActionController__ensureMainAlertController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMainAlertConfirmation:1];
}

void __68__PXPhotoKitDeletePhotosActionController__ensureMainAlertController__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMainAlertConfirmation:2];
}

- (void)_runDestructiveActionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = self->_record;
  unint64_t v6 = [(PXActionRecord *)v5 userConfirmation];
  if (v6 > 4 || ((0x1Au >> v6) & 1) == 0)
  {
    v4[2](v4, 0);
  }
  else
  {
    char v8 = [(PXPhotoKitDeletePhotosActionController *)self _assets];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_2;
    aBlock[3] = &unk_1E5DBC718;
    aBlock[4] = self;
    id v9 = v8;
    id v25 = v9;
    uint64_t v10 = (void (**)(void *, PXDeleteAssetsAction *, void *))_Block_copy(aBlock);
    switch(self->_action)
    {
      case 0:
      case 1:
        uint64_t v11 = [(PXDestructiveAssetsAction *)[PXDeleteAssetsAction alloc] initWithAssets:v9 record:v5];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_212;
        v21[3] = &unk_1E5DBF0C8;
        v12 = &v22;
        v22 = &__block_literal_global_206_124485;
        id v23 = v4;
        v10[2](v10, v11, v21);
        uint64_t v13 = v23;
        goto LABEL_11;
      case 2:
        uint64_t v11 = [(PXAssetsAction *)[PXRecoverAssetsAction alloc] initWithAssets:v9];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_4;
        v14[3] = &unk_1E5DCDD58;
        v12 = (id *)&v15;
        v15 = v4;
        v10[2](v10, v11, v14);
        goto LABEL_13;
      case 3:
      case 4:
        uint64_t v11 = [(PXDestructiveAssetsAction *)[PXRestoreAssetsAction alloc] initWithAssets:v9 record:v5];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_3_216;
        v16[3] = &unk_1E5DCDD58;
        v12 = (id *)&v17;
        char v17 = v4;
        v10[2](v10, v11, v16);
        goto LABEL_13;
      case 5:
      case 6:
        uint64_t v11 = [(PXDestructiveAssetsAction *)[PXExpungeAssetsAction alloc] initWithAssets:v9 record:v5];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_2_214;
        v18[3] = &unk_1E5DBF0C8;
        v12 = &v19;
        id v19 = &__block_literal_global_206_124485;
        BOOL v20 = v4;
        v10[2](v10, v11, v18);
        uint64_t v13 = v20;
LABEL_11:

LABEL_13:
        break;
      default:
        break;
    }
  }
}

void __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    char v7 = [*(id *)(a1 + 32) undoManager];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_3;
    v10[3] = &unk_1E5DCDD58;
    id v11 = v6;
    [v5 executeWithUndoManager:v7 completionHandler:v10];
  }
  else if ([*(id *)(a1 + 40) count])
  {
    char v8 = PLUIActionsGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Destructive action missing", v9, 2u);
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
  }
}

uint64_t __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_212(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_2_214(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_3_216(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v2 = *MEMORY[0x1E4FB2610];
    id v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 removeDefaultImage:v2 forScreen:v3];
  }
}

void __78__PXPhotoKitDeletePhotosActionController__runDestructiveActionWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLUIActionsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Destructive action failed: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleFinalConfirmation:(int64_t)a3
{
  -[PXPhotoKitDeletePhotosActionController _recordUserConfirmation:](self, "_recordUserConfirmation:");
  id v5 = objc_initWeak(&location, self);
  [(PXPhotoKitDeletePhotosActionController *)self stopObservingAppBackgroundEvents];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PXPhotoKitDeletePhotosActionController__handleFinalConfirmation___block_invoke;
  v9[3] = &unk_1E5DD2188;
  v9[4] = self;
  id v6 = _Block_copy(v9);
  int v7 = v6;
  if (unint64_t)a3 <= 4 && ((0x1Au >> a3))
  {
    willDeleteHandler = (void (**)(void))self->_willDeleteHandler;
    if (willDeleteHandler) {
      willDeleteHandler[2]();
    }
    [(PXPhotoKitDeletePhotosActionController *)self _runDestructiveActionWithCompletion:v7];
  }
  else
  {
    (*((void (**)(void *, void))v6 + 2))(v6, 0);
  }

  objc_destroyWeak(&location);
}

void __67__PXPhotoKitDeletePhotosActionController__handleFinalConfirmation___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void (***)(void, void))(v6 + 16);
  if (v7)
  {
    v7[2](v7, a2);
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(void (***)(void, void))(v6 + 16);
  }
  *(void *)(v6 + 16) = 0;
}

- (void)ppt_performDeleteWithoutUserConfirmationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = &__block_literal_global_124496;
  }
  id v5 = v4;
  [(PXPhotoKitDeletePhotosActionController *)self _recordVariant:@"ppt"];
  [(PXPhotoKitDeletePhotosActionController *)self _recordUserConfirmation:3];
  [(PXPhotoKitDeletePhotosActionController *)self _runDestructiveActionWithCompletion:v5];
}

- (void)_recordVariant:(id)a3
{
  id v4 = [(PXActionRecord *)self->_record withVariant:a3];
  record = self->_record;
  self->_record = v4;
}

- (void)_recordUserConfirmation:(int64_t)a3
{
  record = self->_record;
  id v8 = [(PXPhotoKitDeletePhotosActionController *)self _assets];
  -[PXActionRecord withUserConfirmation:assetCount:](record, "withUserConfirmation:assetCount:", a3, [v8 count]);
  uint64_t v6 = (PXActionRecord *)objc_claimAutoreleasedReturnValue();
  int v7 = self->_record;
  self->_record = v6;
}

- (void)performWithWillDeleteHandler:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_completionHandler)
  {
    char v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXPhotoKitDeletePhotosActionController.m", 70, @"Completion handler for %@ should be nil here", self object file lineNumber description];
  }
  if (self->_willDeleteHandler)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXPhotoKitDeletePhotosActionController.m", 71, @"Delete completion handler for %@ should be nil here", self object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PXPhotoKitDeletePhotosActionController_performWithWillDeleteHandler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5DCD158;
  id v9 = v8;
  aBlock[4] = self;
  id v20 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = (void *)[v7 copy];
  id willDeleteHandler = self->_willDeleteHandler;
  self->_id willDeleteHandler = v11;

  uint64_t v13 = (void *)[v10 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v13;

  [(PXPhotoKitDeletePhotosActionController *)self beginObservingAppBackgroundingEvents];
  if ([(PXPhotoKitDeletePhotosActionController *)self shouldSkipDeleteConfirmation])
  {
    [(PXPhotoKitDeletePhotosActionController *)self _handleMainAlertConfirmation:3];
  }
  else
  {
    [(PXPhotoKitDeletePhotosActionController *)self _ensureMainAlertController];
    v15 = [(PXPhotoKitDeletePhotosActionController *)self delegate];
    int v16 = [(PXPhotoKitDeletePhotosActionController *)self _mainAlertController];
    [v15 deletePhotosActionController:self presentConfirmationViewController:v16];
  }
}

id __89__PXPhotoKitDeletePhotosActionController_performWithWillDeleteHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return (id)[*(id *)(a1 + 32) description];
}

- (PXPhotoKitDeletePhotosActionController)initWithAction:(int64_t)a3 assets:(id)a4 undoManager:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXPhotoKitDeletePhotosActionController;
  id v14 = [(PXPhotoKitDeletePhotosActionController *)&v24 init];
  v15 = v14;
  if (v14)
  {
    v14->_action = a3;
    objc_storeStrong((id *)&v14->_undoManager, a5);
    objc_storeWeak((id *)&v15->_delegate, v13);
    objc_storeStrong((id *)&v15->__assets, a4);
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F38EB8], "pl_managedAssetsForAssets:", v11);
    plAssets = v15->__plAssets;
    v15->__plAssets = (NSArray *)v16;

    uint64_t v18 = [PXActionRecord alloc];
    id v19 = (objc_class *)objc_opt_class();
    id v20 = NSStringFromClass(v19);
    uint64_t v21 = [(PXActionRecord *)v18 initWithSourceIdentifier:v20 assetCount:[(NSArray *)v15->__assets count]];
    record = v15->_record;
    v15->_record = (PXActionRecord *)v21;
  }
  return v15;
}

+ (id)_suffix:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  +[PXPhotoKitDeletePhotosActionController assetTypeCountsForAssets:v3 photosCount:&v11 videosCount:&v10 othersCount:&v9];

  if (v11 == v4)
  {
    id v5 = @"_ONE_PHOTO";
    if (v4 > 1) {
      id v5 = @"_N_PHOTOS";
    }
  }
  else
  {
    id v5 = @"_ONE_ITEM";
    if (v4 > 1) {
      id v5 = @"_N_ITEMS";
    }
    uint64_t v6 = @"_N_VIDEOS";
    if (v4 <= 1) {
      uint64_t v6 = @"_ONE_VIDEO";
    }
    if (v10 == v4) {
      id v5 = v6;
    }
  }
  id v7 = v5;
  return v7;
}

+ (id)warningStringForAssets:(id)a3 isDeleting:(BOOL)a4
{
  if (a4)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28E78];
    id v5 = a3;
    id v6 = [v4 stringWithString:@"PXPhotoKitUnifiedDestructiveActionPerformer"];
    id v7 = +[PXPhotoKitDeletePhotosActionController _suffix:v5];

    [v6 appendFormat:@"%@", v7];
    PXLocalizedStringFromTable(v6, @"PhotosUICore");
  }
  else
  {
    id v6 = a3;
    PLLocalizedStringForAction();
  id v8 = };

  return v8;
}

+ (void)assetTypeCountsForAssets:(id)a3 photosCount:(int64_t *)a4 videosCount:(int64_t *)a5 othersCount:(int64_t *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    int64_t v11 = 0;
    int64_t v12 = 0;
    int64_t v13 = 0;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v16 isPhoto])
        {
          ++v13;
        }
        else if ([v16 isVideo])
        {
          ++v11;
        }
        else
        {
          ++v12;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
    if (a4) {
      goto LABEL_14;
    }
  }
  else
  {
    int64_t v11 = 0;
    int64_t v12 = 0;
    int64_t v13 = 0;
    if (a4) {
LABEL_14:
    }
      *a4 = v13;
  }
  if (a5) {
    *a5 = v11;
  }
  if (a6) {
    *a6 = v12;
  }
}

@end