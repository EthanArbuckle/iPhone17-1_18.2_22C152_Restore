@interface PXPhotoKitDestructiveActionPerformer
+ (BOOL)canExpungeAsset:(id)a3 inAssetCollection:(id)a4;
- (BOOL)isCancellable;
- (id)_assetsAllowedToExpunge:(id)a3;
- (int64_t)destructivePhotosAction;
- (void)_logCompletionAnalyticsForAssets:(id)a3 withAction:(int64_t)a4;
- (void)_performAction:(int64_t)a3 onAssets:(id)a4;
- (void)_presentAllDuplicatesDeletionAlertWithCompletion:(id)a3;
- (void)deletePhotosActionController:(id)a3 dismissConfirmationViewController:(id)a4;
- (void)deletePhotosActionController:(id)a3 presentConfirmationViewController:(id)a4;
- (void)getConfirmationMessage:(id *)a3 confirmationButtonTitle:(id *)a4 isDestructive:(BOOL *)a5;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitDestructiveActionPerformer

+ (BOOL)canExpungeAsset:(id)a3 inAssetCollection:(id)a4
{
  return PXCanExpungeAssetFromAssetCollection(a3, a4);
}

- (BOOL)isCancellable
{
  return [(PXActionPerformer *)self state] == 10;
}

- (void)deletePhotosActionController:(id)a3 dismissConfirmationViewController:(id)a4
{
  if (![(PXActionPerformer *)self dismissViewController:a4 completionHandler:0])
  {
    v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "Failed to dismiss delete confirmation.", v5, 2u);
    }
  }
}

- (void)deletePhotosActionController:(id)a3 presentConfirmationViewController:(id)a4
{
  if (![(PXActionPerformer *)self presentViewController:a4])
  {
    v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Failed to present delete confirmation. User must confirm to perform removal.", v6, 2u);
    }

    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

- (void)performUserInteractionTask
{
  int64_t v4 = [(PXPhotoKitDestructiveActionPerformer *)self destructivePhotosAction];
  id v5 = [(PXPhotoKitAssetActionPerformer *)self assets];
  if ((unint64_t)(v4 - 5) <= 1)
  {
    v6 = [(PXPhotoKitAssetActionPerformer *)self assetsByAssetCollection];
    v7 = [v6 allKeys];
    v8 = [v7 firstObject];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_4;
      }
      v66 = [MEMORY[0x1E4F28B00] currentHandler];
      v69 = (objc_class *)objc_opt_class();
      v68 = NSStringFromClass(v69);
      v70 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
      [v66 handleFailureInMethod:a2, self, @"PXPhotoKitDestructiveActionPerformer.m", 181, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetsByAssetCollection.allKeys.firstObject", v68, v70 object file lineNumber description];
    }
    else
    {
      v66 = [MEMORY[0x1E4F28B00] currentHandler];
      v67 = (objc_class *)objc_opt_class();
      v68 = NSStringFromClass(v67);
      [v66 handleFailureInMethod:a2, self, @"PXPhotoKitDestructiveActionPerformer.m", 181, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetsByAssetCollection.allKeys.firstObject", v68 object file lineNumber description];
    }

LABEL_4:
    if (![v8 isTrashBin])
    {
LABEL_21:

      goto LABEL_22;
    }
    v9 = [(PXPhotoKitAssetActionPerformer *)self assetsByAssetCollection];
    v10 = [v9 allKeys];
    v11 = [v10 firstObject];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_7;
      }
      v71 = [MEMORY[0x1E4F28B00] currentHandler];
      v74 = (objc_class *)objc_opt_class();
      v73 = NSStringFromClass(v74);
      v75 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
      [v71 handleFailureInMethod:a2, self, @"PXPhotoKitDestructiveActionPerformer.m", 183, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetsByAssetCollection.allKeys.firstObject", v73, v75 object file lineNumber description];
    }
    else
    {
      v71 = [MEMORY[0x1E4F28B00] currentHandler];
      v72 = (objc_class *)objc_opt_class();
      v73 = NSStringFromClass(v72);
      [v71 handleFailureInMethod:a2, self, @"PXPhotoKitDestructiveActionPerformer.m", 183, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetsByAssetCollection.allKeys.firstObject", v73 object file lineNumber description];
    }

LABEL_7:
    v12 = [v11 photoLibrary];
    v13 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v12];

    v14 = [v13 exiting];

    int v15 = [v13 hasSharedLibrary];
    if (v14)
    {
      v16 = [(PXPhotoKitDestructiveActionPerformer *)self _assetsAllowedToExpunge:v5];
      uint64_t v17 = [v5 count];
      v88 = v16;
      if (v17 != [v16 count])
      {
        uint64_t v18 = [v5 count];
        uint64_t v104 = 0;
        v105[0] = 0;
        uint64_t v103 = 0;
        +[PXPhotoKitDeletePhotosActionController assetTypeCountsForAssets:v5 photosCount:v105 videosCount:&v104 othersCount:&v103];
        if (v105[0] == v18)
        {
          v19 = @"SHAREDLIBRARY_EXPUNGE_EXITING_TITLE_PHOTO";
          v20 = @"SHAREDLIBRARY_EXPUNGE_EXITING_MESSAGE_PHOTO";
        }
        else
        {
          if (v104 == v18) {
            v20 = @"SHAREDLIBRARY_EXPUNGE_EXITING_MESSAGE_VIDEO";
          }
          else {
            v20 = @"SHAREDLIBRARY_EXPUNGE_EXITING_MESSAGE_ITEM";
          }
          if (v104 == v18) {
            v19 = @"SHAREDLIBRARY_EXPUNGE_EXITING_TITLE_VIDEO";
          }
          else {
            v19 = @"SHAREDLIBRARY_EXPUNGE_EXITING_TITLE_ITEM";
          }
        }
        if (v18 >= 2)
        {
          v19 = [(__CFString *)v19 stringByAppendingString:@"S"];
          v20 = [(__CFString *)v20 stringByAppendingString:@"S"];
        }
        uint64_t v26 = PLServicesSharedLibraryLocalizedFrameworkString();
        v86 = v20;
        uint64_t v27 = PLServicesSharedLibraryLocalizedFrameworkString();
        uint64_t v76 = *MEMORY[0x1E4F8B2B8];
        v82 = (void *)v27;
        uint64_t v28 = PFLocalizedStringWithValidatedFormat();
        v29 = PLServicesSharedLibraryLocalizedFrameworkString();
        v84 = (void *)v26;
        v80 = (void *)v28;
        v30 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v26, v28, 0, v76);
        if ([v88 count])
        {
          id v31 = v88;

          v78 = v11;
          v32 = v30;
          v33 = v29;
          v34 = v13;
          v35 = v19;
          v36 = (void *)MEMORY[0x1E4FB1410];
          v100[0] = MEMORY[0x1E4F143A8];
          v100[1] = 3221225472;
          v100[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke;
          v100[3] = &unk_1E5DC5D50;
          v100[4] = self;
          int64_t v102 = v4;
          id v5 = v31;
          id v101 = v5;
          v37 = v36;
          v19 = v35;
          v13 = v34;
          v29 = v33;
          v30 = v32;
          v11 = v78;
          v38 = [v37 actionWithTitle:v29 style:2 handler:v100];
          [v30 addAction:v38];

          v39 = (void *)MEMORY[0x1E4FB1410];
          v40 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_2;
          v99[3] = &unk_1E5DD0030;
          v99[4] = self;
          v41 = [v39 actionWithTitle:v40 style:1 handler:v99];
          [v30 addAction:v41];

          v42 = v101;
        }
        else
        {
          v43 = (void *)MEMORY[0x1E4FB1410];
          v42 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
          v98[0] = MEMORY[0x1E4F143A8];
          v98[1] = 3221225472;
          v98[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_3;
          v98[3] = &unk_1E5DD0030;
          v98[4] = self;
          v44 = [v43 actionWithTitle:v42 style:0 handler:v98];
          [v30 addAction:v44];
        }
        if (![(PXActionPerformer *)self presentViewController:v30])
        {
          v45 = PLSharedLibraryGetLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A9AE7000, v45, OS_LOG_TYPE_ERROR, "Failed to present shared library item removal warning.", buf, 2u);
          }

          [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
        }

LABEL_58:
        goto LABEL_59;
      }
    }
    else
    {
      if (!v15)
      {
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      v24 = [(PXPhotoKitDestructiveActionPerformer *)self _assetsAllowedToExpunge:v5];
      uint64_t v25 = [v5 count];
      v88 = v24;
      if (v25 != [v24 count])
      {
        uint64_t v46 = [v5 count];
        uint64_t v104 = 0;
        v105[0] = 0;
        uint64_t v103 = 0;
        +[PXPhotoKitDeletePhotosActionController assetTypeCountsForAssets:v5 photosCount:v105 videosCount:&v104 othersCount:&v103];
        if (v105[0] == v46)
        {
          v47 = @"SHAREDLIBRARY_EXPUNGE_UNOWNED_MESSAGE_PHOTO";
          v19 = @"SHAREDLIBRARY_EXPUNGE_UNOWNED_TITLE_PHOTO";
        }
        else
        {
          if (v104 == v46) {
            v19 = @"SHAREDLIBRARY_EXPUNGE_UNOWNED_TITLE_VIDEO";
          }
          else {
            v19 = @"SHAREDLIBRARY_EXPUNGE_UNOWNED_TITLE_ITEM";
          }
          if (v104 == v46) {
            v47 = @"SHAREDLIBRARY_EXPUNGE_UNOWNED_MESSAGE_VIDEO";
          }
          else {
            v47 = @"SHAREDLIBRARY_EXPUNGE_UNOWNED_MESSAGE_ITEM";
          }
        }
        if (v46 >= 2)
        {
          v19 = [(__CFString *)v19 stringByAppendingString:@"S"];
          v47 = [(__CFString *)v47 stringByAppendingString:@"S"];
        }
        uint64_t v48 = PLServicesSharedLibraryLocalizedFrameworkString();
        v79 = v47;
        uint64_t v49 = PLServicesSharedLibraryLocalizedFrameworkString();
        uint64_t v77 = *MEMORY[0x1E4F8B2B8];
        v83 = (void *)v49;
        uint64_t v50 = PFLocalizedStringWithValidatedFormat();
        v51 = PLServicesSharedLibraryLocalizedFrameworkString();
        v85 = (void *)v48;
        v81 = (void *)v50;
        v52 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v48, v50, 0, v77);
        v87 = v52;
        if ([v88 count])
        {
          id v53 = v88;

          v54 = v51;
          v55 = v19;
          v56 = (void *)MEMORY[0x1E4FB1410];
          v94[0] = MEMORY[0x1E4F143A8];
          v94[1] = 3221225472;
          v94[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_293;
          v94[3] = &unk_1E5DC5D50;
          v94[4] = self;
          int64_t v96 = v4;
          id v5 = v53;
          id v95 = v5;
          v57 = v56;
          v19 = v55;
          v51 = v54;
          v52 = v87;
          v58 = [v57 actionWithTitle:v51 style:2 handler:v94];
          [v87 addAction:v58];

          v59 = (void *)MEMORY[0x1E4FB1410];
          v60 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
          v93[0] = MEMORY[0x1E4F143A8];
          v93[1] = 3221225472;
          v93[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_2_294;
          v93[3] = &unk_1E5DD0030;
          v93[4] = self;
          v61 = [v59 actionWithTitle:v60 style:1 handler:v93];
          [v87 addAction:v61];

          v62 = v95;
        }
        else
        {
          v63 = (void *)MEMORY[0x1E4FB1410];
          v62 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_3_295;
          v92[3] = &unk_1E5DD0030;
          v92[4] = self;
          v64 = [v63 actionWithTitle:v62 style:0 handler:v92];
          [v52 addAction:v64];
        }
        if (![(PXActionPerformer *)self presentViewController:v52])
        {
          v65 = PLSharedLibraryGetLog();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A9AE7000, v65, OS_LOG_TYPE_ERROR, "Failed to present shared library item removal warning.", buf, 2u);
          }

          [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
        }

        goto LABEL_58;
      }
    }

    goto LABEL_19;
  }
  if (!v4)
  {
    v8 = [(PXAssetActionPerformer *)self selectionSnapshot];
    v11 = [v8 dataSource];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [v8 dataSource];
      v22 = [v21 containerCollection];
      int v23 = objc_msgSend(v22, "px_isAllLibraryDuplicatesSmartAlbum");

      if (v23 && PXDeduplicationEntireDuplicatesGroupsAreSelected(v8))
      {
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_297;
        v89[3] = &unk_1E5DBEE90;
        v89[4] = self;
        uint64_t v91 = 0;
        id v5 = v5;
        id v90 = v5;
        [(PXPhotoKitDestructiveActionPerformer *)self _presentAllDuplicatesDeletionAlertWithCompletion:v89];

LABEL_59:
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_22:
  [(PXPhotoKitDestructiveActionPerformer *)self _performAction:v4 onAssets:v5];
LABEL_23:
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _performAction:*(void *)(a1 + 48) onAssets:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 completeUserInteractionTaskWithSuccess:1 error:0];
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_293(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performAction:*(void *)(a1 + 48) onAssets:*(void *)(a1 + 40)];
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_2_294(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_3_295(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:0 error:0];
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_297(void *a1, int a2)
{
  v3 = (void *)a1[4];
  if (a2) {
    return [v3 _performAction:a1[6] onAssets:a1[5]];
  }
  else {
    return [v3 completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

- (void)_performAction:(int64_t)a3 onAssets:(id)a4
{
  id v6 = a4;
  v7 = [PXPhotoKitDeletePhotosActionController alloc];
  v8 = [(PXActionPerformer *)self undoManager];
  v9 = [(PXPhotoKitDeletePhotosActionController *)v7 initWithAction:a3 assets:v6 undoManager:v8 delegate:self];

  [(PXPhotoKitDeletePhotosActionController *)v9 setShouldSkipDeleteConfirmation:[(PXPhotoKitAssetActionPerformer *)self shouldSkipUserConfirmation]];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__PXPhotoKitDestructiveActionPerformer__performAction_onAssets___block_invoke;
  v15[3] = &unk_1E5DD0588;
  v15[4] = self;
  v15[5] = v16;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__PXPhotoKitDestructiveActionPerformer__performAction_onAssets___block_invoke_2;
  v11[3] = &unk_1E5DBEE68;
  v13 = v16;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  int64_t v14 = a3;
  [(PXPhotoKitDeletePhotosActionController *)v9 performWithWillDeleteHandler:v15 completionHandler:v11];

  _Block_object_dispose(v16, 8);
}

uint64_t __64__PXPhotoKitDestructiveActionPerformer__performAction_onAssets___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result == 10)
  {
    [*(id *)(a1 + 32) instantlyExcludeAssetsFromDataSource];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v3 = *(void **)(a1 + 32);
    return [v3 completeUserInteractionTaskWithSuccess:1 error:0];
  }
  return result;
}

uint64_t __64__PXPhotoKitDestructiveActionPerformer__performAction_onAssets___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((a2 & 1) == 0 && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) stopExcludingAssetsFromDataSource];
  }
  uint64_t v4 = [*(id *)(a1 + 32) state];
  id v5 = *(void **)(a1 + 32);
  if (v4 == 10)
  {
    uint64_t result = [v5 completeUserInteractionTaskWithSuccess:a2 error:0];
  }
  else
  {
    uint64_t result = [v5 state];
    if (result == 20) {
      uint64_t result = [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:0];
    }
  }
  if (a2)
  {
    uint64_t result = [*(id *)(a1 + 40) count];
    if (result)
    {
      uint64_t result = [*(id *)(a1 + 32) _logCompletionAnalyticsForAssets:*(void *)(a1 + 40) withAction:*(void *)(a1 + 56)];
      if (*(void *)(a1 + 56) <= 1uLL)
      {
        return +[PXTipsAppDonation donateSignalForEvent:0];
      }
    }
  }
  return result;
}

- (void)_logCompletionAnalyticsForAssets:(id)a3 withAction:(int64_t)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v13, "px_isUnsavedSyndicatedAsset")) {
          int64_t v14 = v7;
        }
        else {
          int64_t v14 = v6;
        }
        [v14 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v10);
  }

  uint64_t v15 = [v6 count];
  v16 = (void *)MEMORY[0x1E4F56560];
  char v17 = (void *)MEMORY[0x1E4F56558];
  if (v15)
  {
    if ((unint64_t)a4 > 5) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = off_1E5DBC758[a4];
    }
    v19 = v18;
    v20 = (void *)MEMORY[0x1E4F56658];
    v51[0] = *v16;
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    v51[1] = *v17;
    v52[0] = v22;
    int v23 = (void *)[v6 copy];
    v52[1] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
    [v20 sendEvent:v19 withPayload:v24];
  }
  if ([v7 count])
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v7;
    uint64_t v25 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v35 = 0;
      uint64_t v38 = *v16;
      uint64_t v39 = *(void *)v41;
      uint64_t v37 = *v17;
LABEL_19:
      uint64_t v27 = 0;
      uint64_t v28 = 9;
      if (v35 > 9) {
        uint64_t v28 = v35;
      }
      uint64_t v29 = v35 - v28;
      while (1)
      {
        if (*(void *)v41 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void *)(*((void *)&v40 + 1) + 8 * v27);
        id v31 = (void *)MEMORY[0x1E4F56658];
        v48[0] = v38;
        v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        v48[1] = v37;
        v49[0] = v33;
        v49[1] = v30;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
        [v31 sendEvent:@"com.apple.photos.CPAnalytics.syndicationSuggestionRemoved" withPayload:v34];

        if (!(v29 + v27)) {
          break;
        }
        if (v26 == ++v27)
        {
          v35 += v27;
          uint64_t v26 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
          if (v26) {
            goto LABEL_19;
          }
          break;
        }
      }
    }
  }
}

- (void)_presentAllDuplicatesDeletionAlertWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PXLocalizedStringFromTable(@"DELETE_ALL_DUPLICATES_WARNING_TITLE", @"PhotosUICore");
  id v6 = PXLocalizedStringFromTable(@"DELETE_ALL_DUPLICATES_WARNING_MESSAGE", @"PhotosUICore");
  id v7 = [(PXActionPerformer *)self presentationEnvironment];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__PXPhotoKitDestructiveActionPerformer__presentAllDuplicatesDeletionAlertWithCompletion___block_invoke;
  v14[3] = &unk_1E5DC56E8;
  id v15 = v5;
  id v16 = v6;
  id v8 = v4;
  id v17 = v8;
  id v9 = v6;
  id v10 = v5;
  uint64_t v11 = [v7 presentAlertWithConfigurationHandler:v14];

  if (!v11)
  {
    id v12 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Failed to present all duplicates removal warning.", v13, 2u);
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __89__PXPhotoKitDestructiveActionPerformer__presentAllDuplicatesDeletionAlertWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setMessage:*(void *)(a1 + 40)];
  [v4 setStyle:0];
  id v5 = PXLocalizedStringFromTable(@"PXContinue", @"PhotosUICore");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__PXPhotoKitDestructiveActionPerformer__presentAllDuplicatesDeletionAlertWithCompletion___block_invoke_2;
  v9[3] = &unk_1E5DD3128;
  id v10 = *(id *)(a1 + 48);
  [v4 addActionWithTitle:v5 style:0 action:v9];

  id v6 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PXPhotoKitDestructiveActionPerformer__presentAllDuplicatesDeletionAlertWithCompletion___block_invoke_3;
  v7[3] = &unk_1E5DD3128;
  id v8 = *(id *)(a1 + 48);
  [v4 addActionWithTitle:v6 style:0 action:v7];
}

uint64_t __89__PXPhotoKitDestructiveActionPerformer__presentAllDuplicatesDeletionAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__PXPhotoKitDestructiveActionPerformer__presentAllDuplicatesDeletionAlertWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_assetsAllowedToExpunge:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "canPerformEditOperation:", 101, (void)v12)) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)getConfirmationMessage:(id *)a3 confirmationButtonTitle:(id *)a4 isDestructive:(BOOL *)a5
{
  id v9 = [PXPhotoKitDeletePhotosActionController alloc];
  int64_t v10 = [(PXPhotoKitDestructiveActionPerformer *)self destructivePhotosAction];
  uint64_t v11 = [(PXPhotoKitAssetActionPerformer *)self assets];
  long long v12 = [(PXActionPerformer *)self undoManager];
  long long v13 = [(PXPhotoKitDeletePhotosActionController *)v9 initWithAction:v10 assets:v11 undoManager:v12 delegate:self];

  [(PXPhotoKitDeletePhotosActionController *)v13 getConfirmationMessage:a3 destructiveButtonTitle:a4 cancelButtonTitle:0 isDestructiveBehavior:a5];
}

- (int64_t)destructivePhotosAction
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXPhotoKitDestructiveActionPerformer.m", 42, @"Method %s is a responsibility of subclass %@", "-[PXPhotoKitDestructiveActionPerformer destructivePhotosAction]", v6 object file lineNumber description];

  abort();
}

@end