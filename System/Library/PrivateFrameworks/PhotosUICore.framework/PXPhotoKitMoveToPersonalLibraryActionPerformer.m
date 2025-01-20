@interface PXPhotoKitMoveToPersonalLibraryActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)canPresentAlertInBackgroudState;
- (BOOL)shouldExitSelectModeForState:(unint64_t)a3;
- (BOOL)shouldShowConfirmation;
- (PXFastEnumeration)assetsToMove;
- (id)_multiContributorConfirmationAlertControllerForAssets:(id)a3 contributorName:(id)a4;
- (void)_moveAssetsToPersonalLibraryWithCompletionHandler:(id)a3;
- (void)_presentFailureWithError:(id)a3 completionHandler:(id)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
- (void)setAssetsToMove:(id)a3;
@end

@implementation PXPhotoKitMoveToPersonalLibraryActionPerformer

+ (id)systemImageNameForActionManager:(id)a3
{
  v3 = @"person";
  return @"person";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedSharedLibraryString(@"PXSharedLibrary_Action_MoveToPersonalLibrary");
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  v7 = (PXActionManagerTapGestureRecognizer *)a3;
  v8 = [a5 selectionManager];
  v9 = [v8 selectionSnapshot];
  v10 = [v9 allItemsEnumerator];
  v11 = _PXSharedLibraryFetchAssetsFromAssets(v10, 0, 1, 0);

  uint64_t v12 = [v11 count];
  if (v12)
  {
    v13 = PXLocalizedSharedLibraryAssetCountForUsage(v12, 0, 0, 16);
    v14 = [[PXActionManagerTapGestureRecognizer alloc] initWithTarget:v7 action:a4];

    v15 = PXPhotosBarsCreateSelectModeCaptionLabel();
    v16 = (void *)MEMORY[0x1E4FB08E0];
    [MEMORY[0x1E4FB08E0] labelFontSize];
    v17 = objc_msgSend(v16, "systemFontOfSize:");
    [v15 setFont:v17];

    [v15 setText:v13];
    v18 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v15 setTextColor:v18];

    [v15 setUserInteractionEnabled:1];
    [v15 addGestureRecognizer:v14];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v15];
    [(PXActionManagerTapGestureRecognizer *)v14 setBarButtonItem:v19];

    v7 = v14;
  }
  else
  {
    id v20 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v13 = PXLocalizedStringFromTable(@"PXSelectItems", @"PhotosUICore");
    v19 = (void *)[v20 initWithTitle:v13 style:0 target:v7 action:a4];
  }

  return v19;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4FB13F0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__PXPhotoKitMoveToPersonalLibraryActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v12[3] = &unk_1E5DC8470;
  id v13 = v7;
  id v9 = v7;
  v10 = [v8 actionWithTitle:a3 image:a4 identifier:0 handler:v12];

  return v10;
}

uint64_t __93__PXPhotoKitMoveToPersonalLibraryActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (objc_msgSend(a4, "px_allowsMoveToPersonalLibrary"))
  {
    v8 = [v7 photoLibrary];
    id v9 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v8];

    v10 = [v9 exiting];

    if (v10)
    {
      LOBYTE(CanMoveAssetsToPersonalLibrary) = 0;
    }
    else
    {
      v14[0] = v7;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      uint64_t CanMoveAssetsToPersonalLibrary = PXSharedLibraryCanMoveAssetsToPersonalLibrary(v12);
    }
  }
  else
  {
    LOBYTE(CanMoveAssetsToPersonalLibrary) = 0;
  }

  return CanMoveAssetsToPersonalLibrary;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isAnyItemSelected])
  {
    v11 = [v8 allItemsEnumerator];
    uint64_t v12 = PXSharedLibraryFetchAnySharedAssetFromAssets(v11);

    if (v12)
    {
      id v13 = [v12 photoLibrary];
      v14 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v13];

      v15 = [v14 exiting];

      if (v15)
      {
        unsigned __int8 v16 = 0;
      }
      else
      {
        v18.receiver = a1;
        v18.super_class = (Class)&OBJC_METACLASS___PXPhotoKitMoveToPersonalLibraryActionPerformer;
        unsigned __int8 v16 = objc_msgSendSuper2(&v18, sel_canPerformWithSelectionSnapshot_person_socialGroup_, v8, v9, v10);
      }
    }
    else
    {
      unsigned __int8 v16 = 0;
    }
  }
  else
  {
    unsigned __int8 v16 = 0;
  }

  return v16;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)setAssetsToMove:(id)a3
{
}

- (PXFastEnumeration)assetsToMove
{
  return self->_assetsToMove;
}

- (void)_presentFailureWithError:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  v6 = PXLocalizedSharedLibraryString(@"PXSharedLibraryMoveToPersonalLibraryFailureAlertTitle");
  id v7 = PXLocalizedSharedLibraryString(@"PXSharedLibraryGenericFailureAlertMessage");
  id v8 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
  id v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  id v10 = (void *)MEMORY[0x1E4FB1410];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__PXPhotoKitMoveToPersonalLibraryActionPerformer__presentFailureWithError_completionHandler___block_invoke;
  v16[3] = &unk_1E5DD1068;
  v16[4] = self;
  id v11 = v5;
  id v17 = v11;
  uint64_t v12 = [v10 actionWithTitle:v8 style:0 handler:v16];
  [v9 addAction:v12];

  if (![(PXActionPerformer *)self presentViewController:v9])
  {
    id v13 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Failed to present failure alert", v15, 2u);
    }

    v14 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Failed to present failure alert");
    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:0 error:v14];
  }
}

uint64_t __93__PXPhotoKitMoveToPersonalLibraryActionPerformer__presentFailureWithError_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:*(void *)(a1 + 40)];
}

- (void)_moveAssetsToPersonalLibraryWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXPhotoKitMoveToPersonalLibraryActionPerformer.m", 263, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v6 = [(PXPhotoKitMoveToPersonalLibraryActionPerformer *)self assetsToMove];
  if (![v6 count])
  {
    unsigned __int8 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXPhotoKitMoveToPersonalLibraryActionPerformer.m", 266, @"Invalid parameter not satisfying: %@", @"assetsToMove.count" object file lineNumber description];
  }
  id v7 = PXLocalizedSharedLibraryString(@"PXSharedLibraryMoveToPersonalLibraryToastTitle");
  id v8 = PXLocalizedAssetCountForUsage([v6 count], 0, 0, 0);
  id v9 = [(id)objc_opt_class() createIndeterminateProgressToastForActionPerformer:self title:v7 description:v8];
  [v9 willStartProgress];
  id v10 = PLUIGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_INFO, "Attempting to move assets to personal library. Calling PXSharedLibraryMoveAssetsToPersonalLibrary()", buf, 2u);
  }

  id v11 = [(PXAssetsAction *)[PXMoveAssetsToPersonalLibraryAction alloc] initWithAssets:v6];
  uint64_t v12 = [(PXActionPerformer *)self undoManager];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __100__PXPhotoKitMoveToPersonalLibraryActionPerformer__moveAssetsToPersonalLibraryWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E5DD1B00;
  v19 = self;
  id v20 = v5;
  id v18 = v9;
  id v13 = v5;
  id v14 = v9;
  [(PXAction *)v11 executeWithUndoManager:v12 completionHandler:v17];
}

void __100__PXPhotoKitMoveToPersonalLibraryActionPerformer__moveAssetsToPersonalLibraryWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 finishProgressMarkingAsComplete:0];
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    [*(id *)(a1 + 40) _presentFailureWithError:v6 completionHandler:*(void *)(a1 + 48)];
  }
}

- (BOOL)canPresentAlertInBackgroudState
{
  return 1;
}

- (void)performBackgroundTask
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __71__PXPhotoKitMoveToPersonalLibraryActionPerformer_performBackgroundTask__block_invoke;
  v2[3] = &unk_1E5DD3158;
  v2[4] = self;
  [(PXPhotoKitMoveToPersonalLibraryActionPerformer *)self _moveAssetsToPersonalLibraryWithCompletionHandler:v2];
}

uint64_t __71__PXPhotoKitMoveToPersonalLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

- (void)performUserInteractionTask
{
  v4 = [(PXPhotoKitAssetActionPerformer *)self assetsFetchResult];
  id v5 = _PXSharedLibraryFetchAssetsFromAssets(v4, 0, 1, 0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E5DD0D90;
  id v6 = v5;
  id v13 = self;
  SEL v14 = a2;
  id v12 = v6;
  id v7 = (void (**)(void))_Block_copy(aBlock);
  id v8 = [(PXPhotoKitAssetActionPerformer *)self assetsFetchResult];
  id v9 = [v8 photoLibrary];

  id v10 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v9];
  if ([(PXPhotoKitMoveToPersonalLibraryActionPerformer *)self shouldShowConfirmation]
    && PXSharedLibraryShouldDisplayMoveToPersonalLibraryConfirmation([v10 hasPreview]))
  {
    PXSharedLibraryGetMoveToPersonalLibraryConfirmationTitleAndMessage(v6);
  }
  v7[2](v7);
}

void __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v2 = _PXSharedLibraryFetchAssetsFromAssets(*(void **)(a1 + 32), 1, 1, 0);
  uint64_t v3 = [*(id *)(a1 + 32) count];
  if (v3 == [v2 count])
  {
    v4 = [v2 firstObject];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_4;
      }
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v37 = *(void *)(a1 + 40);
      uint64_t v36 = *(void *)(a1 + 48);
      v38 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v38);
      v39 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v31 handleFailureInMethod:v36, v37, @"PXPhotoKitMoveToPersonalLibraryActionPerformer.m", 177, @"%@ should be an instance inheriting from %@, but it is %@", @"myAssets.firstObject", v35, v39 object file lineNumber description];
    }
    else
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v33 = *(void *)(a1 + 40);
      uint64_t v32 = *(void *)(a1 + 48);
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      [v31 handleFailureInMethod:v32, v33, @"PXPhotoKitMoveToPersonalLibraryActionPerformer.m", 177, @"%@ should be an instance inheriting from %@, but it is nil", @"myAssets.firstObject", v35 object file lineNumber description];
    }

LABEL_4:
    id v5 = [v4 photoLibrary];
    id v6 = [v5 librarySpecificFetchOptions];

    id v7 = [MEMORY[0x1E4F392E8] fetchContributorsForAssets:v2 options:v6];
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    id v9 = [v7 fetchedObjects];
    id v10 = [v8 setWithArray:v9];

    if ((unint64_t)[v10 count] < 3)
    {
      if ([v10 count] != 2)
      {
        [*(id *)(a1 + 40) setAssetsToMove:*(void *)(a1 + 32)];
        [*(id *)(a1 + 40) completeUserInteractionTaskWithSuccess:1 error:0];
LABEL_33:

        goto LABEL_34;
      }
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v24 = v10;
      id v11 = (void *)[v24 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v11)
      {
        v40 = v7;
        uint64_t v25 = *(void *)v45;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v45 != v25) {
              objc_enumerationMutation(v24);
            }
            v27 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            if (([v27 isCurrentUser] & 1) == 0)
            {
              id v11 = PXSharedLibraryShortNameForParticipant(v27);
              goto LABEL_26;
            }
          }
          id v11 = (void *)[v24 countByEnumeratingWithState:&v44 objects:v49 count:16];
          if (v11) {
            continue;
          }
          break;
        }
LABEL_26:
        id v7 = v40;
      }

      SEL v14 = [*(id *)(a1 + 40) _multiContributorConfirmationAlertControllerForAssets:v2 contributorName:v11];
      if (([*(id *)(a1 + 40) presentViewController:v14] & 1) == 0)
      {
        v28 = PLUIGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9AE7000, v28, OS_LOG_TYPE_ERROR, "Failed to present 'move' dialog.", buf, 2u);
        }

        v29 = *(void **)(a1 + 40);
        v30 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present 'move' dialog.");
        [v29 completeUserInteractionTaskWithSuccess:0 error:v30];
      }
    }
    else
    {
      id v11 = [*(id *)(a1 + 40) _multiContributorConfirmationAlertControllerForAssets:v2 contributorName:0];
      if ([*(id *)(a1 + 40) presentViewController:v11])
      {
LABEL_32:

        goto LABEL_33;
      }
      id v12 = PLUIGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Failed to present 'move' dialog.", buf, 2u);
      }

      id v13 = *(void **)(a1 + 40);
      SEL v14 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present 'move' dialog.");
      [v13 completeUserInteractionTaskWithSuccess:0 error:v14];
    }

    goto LABEL_32;
  }
  v4 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_MoveSomeUnownedToPersonalLibraryConfirmationMessage_Message");
  id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v4 preferredStyle:0];
  v15 = (void *)MEMORY[0x1E4FB1410];
  unsigned __int8 v16 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_MoveMineToPersonalLibrary_Button_Title");
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_267;
  v42[3] = &unk_1E5DD1068;
  v42[4] = *(void *)(a1 + 40);
  id v43 = v2;
  id v17 = [v15 actionWithTitle:v16 style:0 handler:v42];
  [v6 addAction:v17];

  id v18 = (void *)MEMORY[0x1E4FB1410];
  v19 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_2;
  v41[3] = &unk_1E5DD0030;
  v41[4] = *(void *)(a1 + 40);
  id v20 = [v18 actionWithTitle:v19 style:1 handler:v41];
  [v6 addAction:v20];

  if (([*(id *)(a1 + 40) presentViewController:v6] & 1) == 0)
  {
    v21 = PLUIGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_ERROR, "Failed to present 'move mine only' dialog.", buf, 2u);
    }

    v22 = *(void **)(a1 + 40);
    v23 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present 'move mine only' dialog.");
    [v22 completeUserInteractionTaskWithSuccess:0 error:v23];
  }
LABEL_34:
}

uint64_t __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_272(uint64_t a1)
{
  PXSharedLibrarySetDidConfirmMoveToPersonalLibrary(1);
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

void __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_2_273(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Move to Personal Library canceled.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 completeUserInteractionTaskWithSuccess:0 error:v2];
}

uint64_t __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_267(uint64_t a1)
{
  [*(id *)(a1 + 32) setAssetsToMove:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 completeUserInteractionTaskWithSuccess:1 error:0];
}

void __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Move to Personal Library canceled.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 completeUserInteractionTaskWithSuccess:0 error:v2];
}

- (id)_multiContributorConfirmationAlertControllerForAssets:(id)a3 contributorName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 count];
  id v9 = &stru_1F00B0030;
  if (v8 > 1) {
    id v9 = @"S";
  }
  id v10 = v9;
  uint64_t v11 = [v7 length];
  uint64_t v12 = [v6 count];
  if (v11)
  {
    uint64_t v31 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    +[PXPhotoKitDeletePhotosActionController assetTypeCountsForAssets:v6 photosCount:&v31 videosCount:&v30 othersCount:&v29];
    if (v31 == v12)
    {
      [NSString stringWithFormat:@"PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_For_Contributor_%%@_Photo%@", v10];
    }
    else if (v30 == v12)
    {
      [NSString stringWithFormat:@"PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_For_Contributor_%%@_Video%@", v10];
    }
    else
    {
      [NSString stringWithFormat:@"PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_For_Contributor_%%@_Item%@", v10];
    id v13 = };
    SEL v14 = PXLocalizedSharedLibraryString(v13);
    id v25 = v7;
    v15 = PXLocalizedStringWithValidatedFormat(v14, @"%@");
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    +[PXPhotoKitDeletePhotosActionController assetTypeCountsForAssets:v6 photosCount:&v31 videosCount:&v30 othersCount:&v29];
    if (v31 == v12)
    {
      [NSString stringWithFormat:@"PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_Photo%@", v10];
    }
    else if (v30 == v12)
    {
      [NSString stringWithFormat:@"PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_Video%@", v10];
    }
    else
    {
      [NSString stringWithFormat:@"PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_Item%@", v10];
    id v13 = };
    v15 = PXLocalizedSharedLibraryString(v13);
  }
  unsigned __int8 v16 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", 0, v15, 0, v25);
  id v17 = (void *)MEMORY[0x1E4FB1410];
  id v18 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_Action_MoveToPersonalLibrary");
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __120__PXPhotoKitMoveToPersonalLibraryActionPerformer__multiContributorConfirmationAlertControllerForAssets_contributorName___block_invoke;
  v27[3] = &unk_1E5DD1068;
  v27[4] = self;
  id v28 = v6;
  id v19 = v6;
  id v20 = [v17 actionWithTitle:v18 style:0 handler:v27];
  [v16 addAction:v20];

  v21 = (void *)MEMORY[0x1E4FB1410];
  v22 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __120__PXPhotoKitMoveToPersonalLibraryActionPerformer__multiContributorConfirmationAlertControllerForAssets_contributorName___block_invoke_2;
  v26[3] = &unk_1E5DD0030;
  v26[4] = self;
  v23 = [v21 actionWithTitle:v22 style:1 handler:v26];
  [v16 addAction:v23];

  return v16;
}

uint64_t __120__PXPhotoKitMoveToPersonalLibraryActionPerformer__multiContributorConfirmationAlertControllerForAssets_contributorName___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAssetsToMove:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 completeUserInteractionTaskWithSuccess:1 error:0];
}

void __120__PXPhotoKitMoveToPersonalLibraryActionPerformer__multiContributorConfirmationAlertControllerForAssets_contributorName___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Move to Personal Library canceled.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 completeUserInteractionTaskWithSuccess:0 error:v2];
}

- (BOOL)shouldShowConfirmation
{
  return 1;
}

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  return a3 == 20;
}

@end