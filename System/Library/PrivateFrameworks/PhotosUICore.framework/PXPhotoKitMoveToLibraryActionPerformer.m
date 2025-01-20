@interface PXPhotoKitMoveToLibraryActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
- (BOOL)shouldExitSelectModeForState:(unint64_t)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitMoveToLibraryActionPerformer

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedSharedLibraryString(@"PXSharedLibrary_Action_MoveToLibrary");
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  v7 = (PXActionManagerTapGestureRecognizer *)a3;
  v8 = [a5 selectionManager];
  v9 = [v8 selectionSnapshot];
  v10 = [v9 selectedIndexPaths];
  uint64_t v11 = [v10 itemCount];

  if (v11)
  {
    v12 = PXLocalizedSharedLibraryAssetCountForUsage(v11, 0, 0, 15);
    v13 = [[PXActionManagerTapGestureRecognizer alloc] initWithTarget:v7 action:a4];

    v14 = PXPhotosBarsCreateSelectModeCaptionLabel();
    v15 = (void *)MEMORY[0x1E4FB08E0];
    [MEMORY[0x1E4FB08E0] labelFontSize];
    v16 = objc_msgSend(v15, "systemFontOfSize:");
    [v14 setFont:v16];

    [v14 setText:v12];
    v17 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v14 setTextColor:v17];

    [v14 setUserInteractionEnabled:1];
    [v14 addGestureRecognizer:v13];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v14];
    [(PXActionManagerTapGestureRecognizer *)v13 setBarButtonItem:v18];

    v7 = v13;
  }
  else
  {
    id v19 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v12 = PXLocalizedStringFromTable(@"PXSelectItems", @"PhotosUICore");
    v18 = (void *)[v19 initWithTitle:v12 style:0 target:v7 action:a4];
  }

  return v18;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4FB13F0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__PXPhotoKitMoveToLibraryActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v12[3] = &unk_1E5DC8470;
  id v13 = v7;
  id v9 = v7;
  v10 = [v8 actionWithTitle:a3 image:a4 identifier:0 handler:v12];

  return v10;
}

uint64_t __85__PXPhotoKitMoveToLibraryActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return a3 != 0;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

- (void)performUserInteractionTask
{
  v3 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_Action_MoveToLibrary_Message");
  v4 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_Action_MoveToPersonalLibrary");
  v5 = [(PXPhotoKitAssetActionPerformer *)self assets];
  v6 = _PXSharedLibraryFetchAssetsFromAssets(v5, 0, 1, 0);

  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = PXLocalizedSharedLibraryAssetCountForUsage(v7, 0, 0, 16);

    v4 = (void *)v8;
  }
  id v9 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_Action_MoveToSharedLibrary");
  v10 = [(PXPhotoKitAssetActionPerformer *)self assets];
  uint64_t v11 = _PXSharedLibraryFetchAssetsFromAssets(v10, 0, 0, 0);

  uint64_t v12 = [v11 count];
  if (v12)
  {
    uint64_t v13 = PXLocalizedSharedLibraryAssetCountForUsage(v12, 0, 0, 17);

    id v9 = (void *)v13;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E5DB0448;
  aBlock[4] = self;
  v14 = _Block_copy(aBlock);
  v15 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v3 preferredStyle:0];
  v16 = (void *)MEMORY[0x1E4FB1410];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_2;
  v31[3] = &unk_1E5DC7010;
  v31[4] = self;
  id v17 = v14;
  id v32 = v17;
  v18 = [v16 actionWithTitle:v4 style:0 handler:v31];
  [v15 addAction:v18];

  id v19 = (void *)MEMORY[0x1E4FB1410];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_4;
  v29[3] = &unk_1E5DC7010;
  v29[4] = self;
  id v20 = v17;
  id v30 = v20;
  v21 = [v19 actionWithTitle:v9 style:0 handler:v29];
  [v15 addAction:v21];

  v22 = (void *)MEMORY[0x1E4FB1410];
  v23 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_6;
  v28[3] = &unk_1E5DD0030;
  v28[4] = self;
  v24 = [v22 actionWithTitle:v23 style:1 handler:v28];
  [v15 addAction:v24];

  if (![(PXActionPerformer *)self presentViewController:v15])
  {
    v25 = PLUIGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_ERROR, "Failed to present move to library action dialog", buf, 2u);
    }

    v26 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present move to library dialog.");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v26];
  }
}

id __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) assets];
  v2 = +[PXPhotoKitAssetsDataSource dataSourceWithAssets:v1];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(v2, "numberOfItemsInSection:", 0));
  v4 = objc_msgSend(off_1E5DA6F50, "indexPathSetWithItemIndexes:dataSourceIdentifier:section:", v3, objc_msgSend(v2, "identifier"), 0);
  v5 = (void *)[objc_alloc((Class)off_1E5DA84E8) initWithDataSource:v2 selectedIndexPaths:v4];

  return v5;
}

void __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) createPerformerWithClass:objc_opt_class() actionType:@"PXAssetActionTypeMoveToPersonalLibrary"];
  if (v2)
  {
    v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [v2 setSelectionSnapshot:v3];

    v4 = [*(id *)(a1 + 32) delegate];
    [v2 setDelegate:v4];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_3;
    v7[3] = &unk_1E5DD3158;
    v7[4] = *(void *)(a1 + 32);
    [v2 performActionWithCompletionHandler:v7];
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Move to Personal Library failed.");
    [v5 completeUserInteractionTaskWithSuccess:0 error:v6];
  }
}

void __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) createPerformerWithClass:objc_opt_class() actionType:@"PXAssetActionTypeMoveToSharedLibrary"];
  if (v2)
  {
    v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [v2 setSelectionSnapshot:v3];

    v4 = [*(id *)(a1 + 32) delegate];
    [v2 setDelegate:v4];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_5;
    v7[3] = &unk_1E5DD3158;
    v7[4] = *(void *)(a1 + 32);
    [v2 performActionWithCompletionHandler:v7];
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Move to Shared Library failed.");
    [v5 completeUserInteractionTaskWithSuccess:0 error:v6];
  }
}

void __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Move to Library canceled.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 completeUserInteractionTaskWithSuccess:0 error:v2];
}

uint64_t __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

uint64_t __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  return a3 == 20;
}

@end