@interface PXPhotoKitMergeDuplicatesActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (BOOL)canPerformWithActionManager:(id)a3;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (BOOL)shouldEnableWithActionManager:(id)a3;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
- (BOOL)canPresentAlertInBackgroudState;
- (BOOL)shouldExitSelectModeForState:(unint64_t)a3;
- (void)_clearSelection;
- (void)_presentDuplicatesTypeDialogWithIdenticalCount:(int64_t)a3 totalCount:(int64_t)a4 completion:(id)a5;
- (void)_presentGenericFailureAlertAndCompleteBackgroundTaskWithError:(id)a3;
- (void)completeBackgroundTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)performBackgroundTask;
- (void)performMergeWithSelection:(id)a3 localizedMessage:(id)a4 onlyIdenticalItemsSelected:(BOOL)a5;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitMergeDuplicatesActionPerformer

- (void).cxx_destruct
{
}

- (void)_clearSelection
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Will clear selection", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(PXAssetActionPerformer *)self selectionManager];
  [v4 performChanges:&__block_literal_global_40812];
}

uint64_t __59__PXPhotoKitMergeDuplicatesActionPerformer__clearSelection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (void)_presentGenericFailureAlertAndCompleteBackgroundTaskWithError:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Present Server Side Disabled Alert", buf, 0xCu);
  }

  v6 = PXLocalizedStringFromTable(@"MERGE_DUPLICATES_ACTION_ERROR_TITLE", @"PhotosUICore");
  uint64_t v7 = PXLocalizedStringFromTable(@"MERGE_DUPLICATES_ACTION_ERROR_MESSAGE", @"PhotosUICore");
  v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  v9 = (void *)MEMORY[0x1E4FB1410];
  v10 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __106__PXPhotoKitMergeDuplicatesActionPerformer__presentGenericFailureAlertAndCompleteBackgroundTaskWithError___block_invoke;
  v17 = &unk_1E5DD1068;
  v18 = self;
  id v11 = v4;
  id v19 = v11;
  v12 = [v9 actionWithTitle:v10 style:0 handler:&v14];
  objc_msgSend(v8, "addAction:", v12, v14, v15, v16, v17, v18);

  if (![(PXActionPerformer *)self presentViewController:v8])
  {
    v13 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present failure alert.");
    [(PXPhotoKitMergeDuplicatesActionPerformer *)self completeBackgroundTaskWithSuccess:0 error:v13];
  }
}

uint64_t __106__PXPhotoKitMergeDuplicatesActionPerformer__presentGenericFailureAlertAndCompleteBackgroundTaskWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:0 error:*(void *)(a1 + 40)];
}

- (BOOL)canPresentAlertInBackgroudState
{
  return 1;
}

- (void)completeBackgroundTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = PLDuplicateDetectionGetLog();
  v8 = v7;
  if (v4)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = self;
    v9 = "%{public}@ Merge succeeded";
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v6;
    v9 = "%{public}@ Merge failed with error %@";
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
  }
  _os_log_impl(&dword_1A9AE7000, v10, v11, v9, buf, v12);
LABEL_7:

  v13.receiver = self;
  v13.super_class = (Class)PXPhotoKitMergeDuplicatesActionPerformer;
  [(PXActionPerformer *)&v13 completeBackgroundTaskWithSuccess:v4 error:v6];
  if (!v4) {
    [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.deduplicationEventFailed" withPayload:MEMORY[0x1E4F1CC08]];
  }
}

- (void)performBackgroundTask
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v4 = PXDuplicateGroupingAssetIdentifiersFromSelection(self->_mergeableSelection);
  uint64_t v5 = [v4 count];
  id v6 = PLDuplicateDetectionGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = [(PXSelectionSnapshot *)self->_mergeableSelection selectedIndexPaths];
      *(_DWORD *)buf = 138543874;
      v29 = self;
      __int16 v30 = 2048;
      uint64_t v31 = v5;
      __int16 v32 = 2048;
      uint64_t v33 = [v8 count];
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will attempt merging %tu duplicate groups with a total of %tu assets", buf, 0x20u);
    }
    v9 = PXLocalizedStringFromTable(@"MERGE_DUPLICATES_ACTION_ONGOING_TOAST_TITLE", @"PhotosUICore");
    v10 = PXLocalizedStringFromTable(@"MERGE_DUPLICATES_ACTION_SUCCESS_TOAST_TITLE", @"PhotosUICore");
    os_log_type_t v11 = PXLocalizedAssetCountForUsage(v5, 0, 0, 0);
    uint32_t v12 = [(id)objc_opt_class() createIndeterminateProgressToastForActionPerformer:self title:v9 description:v11];
    [v12 willStartProgress];
    objc_super v13 = [(PXSelectionSnapshot *)self->_mergeableSelection firstObject];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_6:
        uint64_t v14 = [v13 photoLibrary];

        uint64_t v15 = (void *)MEMORY[0x1E4F39040];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __65__PXPhotoKitMergeDuplicatesActionPerformer_performBackgroundTask__block_invoke;
        v24[3] = &unk_1E5DD1CD8;
        id v25 = v12;
        id v26 = v10;
        v27 = self;
        id v16 = v10;
        id v17 = v12;
        [v15 mergeDuplicateAssetWithLocalIdentifierGroupingContainer:v4 inPhotoLibrary:v14 completionHandler:v24];

        goto LABEL_10;
      }
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v21 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v21);
      uint64_t v22 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
      uint64_t v18 = v23;
      [v23 handleFailureInMethod:a2, self, @"PXPhotoKitMergeDuplicatesActionPerformer.m", 186, @"%@ should be an instance inheriting from %@, but it is %@", @"_mergeableSelection.firstObject", v20, v22 object file lineNumber description];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      id v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      [v18 handleFailureInMethod:a2, self, @"PXPhotoKitMergeDuplicatesActionPerformer.m", 186, @"%@ should be an instance inheriting from %@, but it is nil", @"_mergeableSelection.firstObject", v20 object file lineNumber description];
    }

    goto LABEL_6;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138543362;
    v29 = self;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Merge skipped, no assets selected.", buf, 0xCu);
  }

  [(PXPhotoKitMergeDuplicatesActionPerformer *)self completeBackgroundTaskWithSuccess:0 error:0];
LABEL_10:
}

void __65__PXPhotoKitMergeDuplicatesActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(id *)(a1 + 32);
  *(id *)(a1 + 40);
  id v5 = v4;
  px_dispatch_on_main_queue();
}

uint64_t __65__PXPhotoKitMergeDuplicatesActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) finishProgressMarkingAsComplete:1 updatedLocalizedTitle:*(void *)(a1 + 40) updatedLocalizedDescription:0];
  v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  if (*(unsigned char *)(a1 + 64))
  {
    return [v2 completeBackgroundTaskWithSuccess:1 error:v3];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    return objc_msgSend(v2, "_presentGenericFailureAlertAndCompleteBackgroundTaskWithError:", v5, v3);
  }
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXPhotoKitMergeDuplicatesActionPerformer;
  [(PXActionPerformer *)&v6 completeUserInteractionTaskWithSuccess:a3 error:a4];
  if (v4) {
    [(PXPhotoKitMergeDuplicatesActionPerformer *)self _clearSelection];
  }
}

- (void)performMergeWithSelection:(id)a3 localizedMessage:(id)a4 onlyIdenticalItemsSelected:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 sectionIndexPathsContainingSelection];
  uint64_t v11 = [v10 count];

  uint32_t v12 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v32 = self;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Present Confirmation Dialog", buf, 0xCu);
  }

  if (v5) {
    objc_super v13 = @"MERGE_%ld_DUPLICATES_CONFIRMATION_IDENTICAL_FORMAT";
  }
  else {
    objc_super v13 = @"MERGE_%ld_DUPLICATES_ACTION_FORMAT";
  }
  uint64_t v14 = PXLocalizedStringFromTable(v13, @"PhotosUICore");
  uint64_t v15 = [v8 selectedIndexPaths];
  uint64_t v26 = [v15 count];
  id v16 = PXLocalizedStringWithValidatedFormat(v14, @"%ld");

  id v17 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", 0, v9, 0, v26);

  uint64_t v18 = (void *)MEMORY[0x1E4FB1410];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __114__PXPhotoKitMergeDuplicatesActionPerformer_performMergeWithSelection_localizedMessage_onlyIdenticalItemsSelected___block_invoke;
  v28[3] = &unk_1E5DC5D50;
  v28[4] = self;
  id v19 = v8;
  id v29 = v19;
  uint64_t v30 = v11;
  v20 = [v18 actionWithTitle:v16 style:2 handler:v28];
  [v17 addAction:v20];

  v21 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v22 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __114__PXPhotoKitMergeDuplicatesActionPerformer_performMergeWithSelection_localizedMessage_onlyIdenticalItemsSelected___block_invoke_2;
  v27[3] = &unk_1E5DD0030;
  v27[4] = self;
  v23 = [v21 actionWithTitle:v22 style:1 handler:v27];
  [v17 addAction:v23];

  if (![(PXActionPerformer *)self presentViewController:v17])
  {
    [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.deduplicationEventFailed" withPayload:MEMORY[0x1E4F1CC08]];
    v24 = PLUIGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_ERROR, "Failed to present unshared unowned confirmation. User must confirm to perform move.", buf, 2u);
    }

    id v25 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Failed to present confirmation dialog.");
    [(PXPhotoKitMergeDuplicatesActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v25];
  }
}

void __114__PXPhotoKitMergeDuplicatesActionPerformer_performMergeWithSelection_localizedMessage_onlyIdenticalItemsSelected___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 192) dataSource];
  PXDeduplicationSendMergeAnalytics(v2, [v3 numberOfSections]);
}

uint64_t __114__PXPhotoKitMergeDuplicatesActionPerformer_performMergeWithSelection_localizedMessage_onlyIdenticalItemsSelected___block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.deduplicationEventSkip" withPayload:MEMORY[0x1E4F1CC08]];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 completeUserInteractionTaskWithSuccess:0 error:0];
}

- (void)_presentDuplicatesTypeDialogWithIdenticalCount:(int64_t)a3 totalCount:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  if (a4 == a3) {
    PXAssertGetLog();
  }
  id v9 = (void *)MEMORY[0x1E4FB1418];
  v10 = PXLocalizedStringFromTable(@"MERGE_DUPLICATES_ACTION_CONFIRMATION_IDENTICAL_AND_PERCEPTUAL", @"PhotosUICore");
  uint64_t v11 = [v9 alertControllerWithTitle:0 message:v10 preferredStyle:0];

  uint32_t v12 = PXLocalizedStringFromTable(@"MERGE_%ld_IDENITICAL_DUPLICATES_ACTION_FORMAT", @"PhotosUICore");
  int64_t v27 = a3;
  objc_super v13 = PXLocalizedStringWithValidatedFormat(v12, @"%ld");

  uint64_t v14 = (void *)MEMORY[0x1E4FB1410];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __113__PXPhotoKitMergeDuplicatesActionPerformer__presentDuplicatesTypeDialogWithIdenticalCount_totalCount_completion___block_invoke;
  v33[3] = &unk_1E5DCE788;
  id v15 = v8;
  id v34 = v15;
  id v16 = objc_msgSend(v14, "actionWithTitle:style:handler:", v13, 0, v33, v27);
  [v11 addAction:v16];

  id v17 = PXLocalizedStringFromTable(@"MERGE_%ld_ALL_DUPLICATES_ACTION_FORMAT", @"PhotosUICore");
  int64_t v28 = a4;
  uint64_t v18 = PXLocalizedStringWithValidatedFormat(v17, @"%ld");

  id v19 = (void *)MEMORY[0x1E4FB1410];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __113__PXPhotoKitMergeDuplicatesActionPerformer__presentDuplicatesTypeDialogWithIdenticalCount_totalCount_completion___block_invoke_2;
  v31[3] = &unk_1E5DCE788;
  id v20 = v15;
  id v32 = v20;
  v21 = objc_msgSend(v19, "actionWithTitle:style:handler:", v18, 0, v31, v28);
  [v11 addAction:v21];

  uint64_t v22 = (void *)MEMORY[0x1E4FB1410];
  v23 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __113__PXPhotoKitMergeDuplicatesActionPerformer__presentDuplicatesTypeDialogWithIdenticalCount_totalCount_completion___block_invoke_3;
  v29[3] = &unk_1E5DCE788;
  id v24 = v20;
  id v30 = v24;
  id v25 = [v22 actionWithTitle:v23 style:1 handler:v29];
  [v11 addAction:v25];

  if (![(PXActionPerformer *)self presentViewController:v11])
  {
    uint64_t v26 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_ERROR, "Failed to present duplicates merge warning.", buf, 2u);
    }

    (*((void (**)(id, void, void))v24 + 2))(v24, 0, 0);
  }
}

uint64_t __113__PXPhotoKitMergeDuplicatesActionPerformer__presentDuplicatesTypeDialogWithIdenticalCount_totalCount_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v1 = (void *)MEMORY[0x1E4F56658];
  uint64_t v2 = MEMORY[0x1E4F1CC08];
  return [v1 sendEvent:@"com.apple.photos.CPAnalytics.deduplicationSkipPerceptualMerge" withPayload:v2];
}

uint64_t __113__PXPhotoKitMergeDuplicatesActionPerformer__presentDuplicatesTypeDialogWithIdenticalCount_totalCount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __113__PXPhotoKitMergeDuplicatesActionPerformer__presentDuplicatesTypeDialogWithIdenticalCount_totalCount_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performUserInteractionTask
{
  id v3 = [(PXAssetActionPerformer *)self selectionSnapshot];
  BOOL v4 = PXDeduplicationAssetsThatCanBeMergedInSelection(v3);

  BOOL v5 = [v4 selectedIndexPaths];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    BOOL v7 = self;
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  if ([(PXPhotoKitAssetActionPerformer *)self shouldSkipUserConfirmation])
  {
    objc_storeStrong((id *)&self->_mergeableSelection, v4);
    BOOL v7 = self;
    uint64_t v8 = 1;
LABEL_5:
    [(PXPhotoKitMergeDuplicatesActionPerformer *)v7 completeUserInteractionTaskWithSuccess:v8 error:0];
    goto LABEL_11;
  }
  id v9 = PXDeduplicationIdenticalSelectionFromSelection(v4);
  v10 = [v9 selectedIndexPaths];
  uint64_t v11 = [v10 count];

  if (v11 == v6 || !v11)
  {
    BOOL v12 = v11 == v6;
    objc_super v13 = PXDeduplicationLocalizedMergeConfirmationMessage(v4, 1, v12);
    [(PXPhotoKitMergeDuplicatesActionPerformer *)self performMergeWithSelection:v4 localizedMessage:v13 onlyIdenticalItemsSelected:v12];
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__PXPhotoKitMergeDuplicatesActionPerformer_performUserInteractionTask__block_invoke;
    v14[3] = &unk_1E5DB2E98;
    id v15 = v9;
    id v16 = v4;
    id v17 = self;
    [(PXPhotoKitMergeDuplicatesActionPerformer *)self _presentDuplicatesTypeDialogWithIdenticalCount:v11 totalCount:v6 completion:v14];
  }
LABEL_11:
}

void __70__PXPhotoKitMergeDuplicatesActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & 1) != 0 || a3)
  {
    uint64_t v7 = 40;
    if (a2) {
      uint64_t v7 = 32;
    }
    id v8 = *(id *)(a1 + v7);
    PXDeduplicationLocalizedMergeConfirmationMessage(v8, 0, a2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 48) performMergeWithSelection:v8 localizedMessage:v9 onlyIdenticalItemsSelected:a2];
  }
  else
  {
    [*(id *)(a1 + 48) completeUserInteractionTaskWithSuccess:a3 error:0];
    BOOL v5 = (void *)MEMORY[0x1E4F56658];
    uint64_t v6 = MEMORY[0x1E4F1CC08];
    [v5 sendEvent:@"com.apple.photos.CPAnalytics.deduplicationEventSkip" withPayload:v6];
  }
}

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  return a3 == 20;
}

+ (BOOL)canPerformWithActionManager:(id)a3
{
  BOOL v5 = [a3 selectionManager];
  uint64_t v6 = [v5 dataSourceManager];

  if (!v6)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v12 = (objc_class *)objc_opt_class();
    objc_super v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, a1, @"PXPhotoKitMergeDuplicatesActionPerformer.m", 60, @"%@ should be an instance inheriting from %@, but it is nil", @"actionManager.selectionManager.dataSourceManager", v13 object file lineNumber description];
LABEL_9:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = (objc_class *)objc_opt_class();
    objc_super v13 = NSStringFromClass(v14);
    id v15 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, a1, @"PXPhotoKitMergeDuplicatesActionPerformer.m", 60, @"%@ should be an instance inheriting from %@, but it is %@", @"actionManager.selectionManager.dataSourceManager", v13, v15 object file lineNumber description];

    goto LABEL_9;
  }
LABEL_3:
  uint64_t v7 = [v6 dataSource];
  id v8 = [v7 containerCollection];

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      id v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      id v19 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
      [v16 handleFailureInMethod:a2, a1, @"PXPhotoKitMergeDuplicatesActionPerformer.m", 61, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"dataSourceManager.dataSource.containerCollection", v18, v19 object file lineNumber description];
    }
  }
  BOOL v9 = [v8 assetCollectionSubtype] == 1000000212;

  return v9;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  return 0;
}

+ (BOOL)shouldEnableWithActionManager:(id)a3
{
  id v3 = [a3 selectionManager];
  BOOL v4 = [v3 selectionSnapshot];
  BOOL CanEnableMergeActionForSelection = PXDeduplicationCanEnableMergeActionForSelection(v4);

  return CanEnableMergeActionForSelection;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  BOOL v4 = objc_msgSend(a4, "selectionManager", a3);
  BOOL v5 = [v4 selectionSnapshot];
  uint64_t v6 = PXDeduplicationLocalizedMergeActionTitleForSelection(v5, 0);

  return v6;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  id v7 = a3;
  id v8 = [a5 selectionManager];
  BOOL v9 = [v8 selectionSnapshot];
  v10 = PXDeduplicationLocalizedMergeActionTitleForSelection(v9, 1);

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v10 style:0 target:v7 action:a4];
  return v11;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return 1;
}

@end