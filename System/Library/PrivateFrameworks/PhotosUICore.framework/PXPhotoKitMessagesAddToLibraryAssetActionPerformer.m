@interface PXPhotoKitMessagesAddToLibraryAssetActionPerformer
+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitMessagesAddToLibraryAssetActionPerformer

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  return 1;
}

- (void)performUserInteractionTask
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  v4 = [(PXAssetActionPerformer *)self selectionSnapshot];
  if (([v4 isAnyItemSelected] & 1) == 0)
  {
    v16 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"PXPhotoKitMessagesAddToLibraryAssetActionPerformer: No items selected for add to library action");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v16];

    goto LABEL_45;
  }
  v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v6 = [v4 dataSource];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    v58 = (objc_class *)objc_opt_class();
    v57 = NSStringFromClass(v58);
    v59 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v55 handleFailureInMethod:a2, self, @"PXPhotoKitMessagesAddToLibraryAssetActionPerformer.m", 54, @"%@ should be an instance inheriting from %@, but it is %@", @"snapshot.dataSource", v57, v59 object file lineNumber description];
  }
  else
  {
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    v56 = (objc_class *)objc_opt_class();
    v57 = NSStringFromClass(v56);
    [v55 handleFailureInMethod:a2, self, @"PXPhotoKitMessagesAddToLibraryAssetActionPerformer.m", 54, @"%@ should be an instance inheriting from %@, but it is nil", @"snapshot.dataSource", v57 object file lineNumber description];
  }

LABEL_4:
  v7 = [(PXPhotoKitAssetActionPerformer *)self importStatusManager];
  v8 = [v4 selectedIndexPaths];
  uint64_t v9 = [v8 itemCount];

  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x2020000000;
  uint64_t v114 = 0;
  uint64_t v107 = 0;
  v108 = &v107;
  uint64_t v109 = 0x2020000000;
  uint64_t v110 = 0;
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x2020000000;
  uint64_t v106 = 0;
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2020000000;
  uint64_t v102 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  v98[3] = 0;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__176101;
  v96 = __Block_byref_object_dispose__176102;
  id v97 = 0;
  v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  v11 = [v4 selectedIndexPaths];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke;
  v79[3] = &unk_1E5DC2040;
  SEL v91 = a2;
  id v62 = v6;
  id v80 = v62;
  v81 = self;
  id v63 = v7;
  id v82 = v63;
  v85 = &v111;
  v86 = &v92;
  id v67 = v5;
  id v83 = v67;
  v87 = &v107;
  id v68 = v10;
  id v84 = v68;
  v88 = &v103;
  v89 = &v99;
  v90 = v98;
  [v11 enumerateItemIndexPathsUsingBlock:v79];

  v64 = (void *)[v68 count];
  v12 = PLSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v112[3];
    uint64_t v14 = v108[3];
    *(_DWORD *)buf = 134218752;
    uint64_t v116 = v9;
    __int16 v117 = 2048;
    uint64_t v118 = v13;
    __int16 v119 = 2048;
    uint64_t v120 = v14;
    __int16 v121 = 2048;
    v122 = v64;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Assets selected: %tu, assets saved: %tu, assets in progress %tu, assets to save: %tu", buf, 0x2Au);
  }

  if (v104[3] == v9)
  {
    v15 = @"_Photo";
  }
  else if (v100[3] == v9)
  {
    v15 = @"_Video";
  }
  else
  {
    v15 = @"_Item";
  }
  int v17 = [v67 isCloudPhotoLibraryEnabled];
  uint64_t v18 = v112[3];
  BOOL v19 = v18 != 0;
  if (v18)
  {
    if (v18 == v9)
    {
      v20 = @"PXCMMMessagesSaveToLibrary_AllSaved_Multiple";
      if (v9 == 1) {
        v20 = @"PXCMMMessagesSaveToLibrary_AllSaved";
      }
      v21 = v20;
      v22 = [(__CFString *)v21 stringByAppendingString:v15];

      v66 = PXLocalizedStringFromTable(v22, @"PhotosUICore");
    }
    else
    {
      if (v108[3] + v18 != v9)
      {
        v51 = [@"PXCMMMessagesSaveToLibrary_SomeSaved" stringByAppendingString:v15];
        v52 = PXLocalizedStringFromTable(v51, @"PhotosUICore");
        uint64_t v61 = v112[3];
        v66 = PXLocalizedStringWithValidatedFormat(v52, @"%tu");

        v53 = objc_msgSend(@"PXCMMMessagesSaveToLibraryActionTitle_SaveWithCount", "stringByAppendingString:", v15, v61);
        v54 = PXLocalizedStringFromTable(v53, @"PhotosUICore");
        uint64_t v60 = v9 - v112[3];
        v36 = PXLocalizedStringWithValidatedFormat(v54, @"%tu");

        BOOL v19 = 0;
        BOOL v65 = 0;
        BOOL v27 = 1;
        int v31 = 1;
        if (v36) {
          goto LABEL_33;
        }
        goto LABEL_30;
      }
      v22 = [@"PXCMMMessagesSaveToLibrary_AllSavedOrInProgress" stringByAppendingString:v15];
      v32 = PXLocalizedStringFromTable(v22, @"PhotosUICore");
      uint64_t v60 = v108[3];
      v66 = PXLocalizedStringWithValidatedFormat(v32, @"%tu");
    }
    BOOL v65 = 0;
    int v31 = 0;
    BOOL v27 = 1;
  }
  else
  {
    int v23 = v17;
    v24 = @"PXCMMMessagesSaveToLibrary_AllUnsaved_Multiple";
    uint64_t v25 = v108[3];
    if (v9 == 1)
    {
      v24 = @"PXCMMMessagesSaveToLibrary_AllUnsaved";
      v26 = @"PXCMMMessagesSaveToLibrary_AllInProgress";
    }
    else
    {
      v26 = @"PXCMMMessagesSaveToLibrary_AllInProgress_Multiple";
    }
    BOOL v27 = v25 != v9;
    BOOL v65 = v25 == v9;
    if (v25 == v9) {
      v28 = v26;
    }
    else {
      v28 = v24;
    }
    v29 = v28;
    v22 = [(__CFString *)v29 stringByAppendingString:v15];

    if (v23)
    {
      uint64_t v30 = [v22 stringByAppendingString:@"_ICPL"];

      v22 = (void *)v30;
    }
    v66 = PXLocalizedStringFromTable(v22, @"PhotosUICore");
    int v31 = v27;
  }

LABEL_30:
  v33 = @"PXCMMMessagesSaveToLibraryActionTitle_Multiple";
  if (v9 == 1) {
    v33 = @"PXCMMMessagesSaveToLibraryActionTitle";
  }
  v34 = v33;
  v35 = [(__CFString *)v34 stringByAppendingString:v15];
  v36 = PXLocalizedStringFromTable(v35, @"PhotosUICore");

LABEL_33:
  v37 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", 0, v66, 0, v60);
  objc_initWeak((id *)buf, self);
  if (v19)
  {
    if (!v93[5])
    {
      v50 = PLSharingGetLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v78 = 0;
        _os_log_impl(&dword_1A9AE7000, v50, OS_LOG_TYPE_ERROR, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Some or all photos are already saved, but we can't find an assetID in Photos to navigate", v78, 2u);
      }

      BOOL v27 = 0;
      BOOL v65 = 1;
      if (!v31) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    v38 = (void *)MEMORY[0x1E4FB1410];
    v39 = PXLocalizedStringFromTable(@"PXCMMMessagesSaveToLibraryActionTitle_ShowInPhotos", @"PhotosUICore");
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_270;
    v76[3] = &unk_1E5DC2068;
    v76[4] = &v92;
    objc_copyWeak(&v77, (id *)buf);
    v40 = [v38 actionWithTitle:v39 style:0 handler:v76];
    [v37 addAction:v40];

    objc_destroyWeak(&v77);
  }
  if (v31)
  {
LABEL_37:
    v41 = (void *)MEMORY[0x1E4FB1410];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_272;
    v73[3] = &unk_1E5DC2090;
    v75[1] = v64;
    objc_copyWeak(v75, (id *)buf);
    id v74 = v68;
    v42 = [v41 actionWithTitle:v36 style:0 handler:v73];
    [v37 addAction:v42];

    objc_destroyWeak(v75);
  }
LABEL_38:
  if (v27)
  {
    v43 = (void *)MEMORY[0x1E4FB1410];
    v44 = PXLocalizedStringFromTable(@"PXCMMMessagesSaveToLibraryCancelTitle", @"PhotosUICore");
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_276;
    v71[3] = &unk_1E5DC20B8;
    objc_copyWeak(&v72, (id *)buf);
    v45 = [v43 actionWithTitle:v44 style:1 handler:v71];
    [v37 addAction:v45];

    objc_destroyWeak(&v72);
  }
  if (v65)
  {
    v46 = (void *)MEMORY[0x1E4FB1410];
    v47 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_280;
    v69[3] = &unk_1E5DC20B8;
    objc_copyWeak(&v70, (id *)buf);
    v48 = [v46 actionWithTitle:v47 style:0 handler:v69];
    [v37 addAction:v48];

    objc_destroyWeak(&v70);
  }
  if (![(PXActionPerformer *)self presentViewController:v37])
  {
    v49 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Failed to present save alert");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v49];
  }
  objc_destroyWeak((id *)buf);

  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(v98, 8);
  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v107, 8);
  _Block_object_dispose(&v111, 8);

LABEL_45:
}

void __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  *(_OWORD *)buf = *a2;
  *(_OWORD *)&buf[16] = v4;
  v5 = [v3 assetAtItemIndexPath:buf];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v25 = *(void *)(a1 + 120);
    uint64_t v26 = *(void *)(a1 + 40);
    BOOL v27 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v27);
    v28 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v20 handleFailureInMethod:v25, v26, @"PXPhotoKitMessagesAddToLibraryAssetActionPerformer.m", 65, @"%@ should be an instance inheriting from %@, but it is %@", @"[dataSource assetAtItemIndexPath:indexPath]", v24, v28 object file lineNumber description];
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = *(void *)(a1 + 120);
    uint64_t v22 = *(void *)(a1 + 40);
    int v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    [v20 handleFailureInMethod:v21, v22, @"PXPhotoKitMessagesAddToLibraryAssetActionPerformer.m", 65, @"%@ should be an instance inheriting from %@, but it is nil", @"[dataSource assetAtItemIndexPath:indexPath]", v24 object file lineNumber description];
  }

LABEL_3:
  uint64_t v6 = [*(id *)(a1 + 48) importStateForAsset:v5];
  if (v6 == 1)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    v12 = PLSharingGetLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:

      goto LABEL_16;
    }
    uint64_t v13 = [v5 uuid];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v13;
    uint64_t v14 = "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Asset %{public}@ is already downloading";
LABEL_11:
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);

    goto LABEL_12;
  }
  uint64_t v7 = v6;
  if (v6 == 2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      v8 = PXAssetToRevealForMomentSharedAsset(v5, 2, *(void **)(a1 + 56));
      uint64_t v9 = [v8 uuid];
      uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    v12 = PLSharingGetLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v13 = [v5 uuid];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v13;
    uint64_t v14 = "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Asset %{public}@ is already saved";
    goto LABEL_11;
  }
  v15 = PLSharingGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [v5 uuid];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Asset %{public}@ is not saved with state %tu", buf, 0x16u);
  }
  [*(id *)(a1 + 64) addObject:v5];
LABEL_16:
  uint64_t v17 = [v5 mediaType];
  uint64_t v18 = a1 + 104;
  uint64_t v19 = a1 + 112;
  if (v17 == 1) {
    uint64_t v19 = a1 + 96;
  }
  if (v17 != 2) {
    uint64_t v18 = v19;
  }
  ++*(void *)(*(void *)(*(void *)v18 + 8) + 24);
}

void __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_270(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = PLSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138543362;
    id v19 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Show in Photos selected: Will navigate to asset %{public}@", buf, 0xCu);
  }

  id v4 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v5 = [@"photos://asset?uuid=" stringByAppendingString:v4];
  uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  uint64_t v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v17 = 0;
  int v8 = [v7 openSensitiveURL:v6 withOptions:0 error:&v17];
  id v9 = v17;

  uint64_t v10 = PLSharingGetLog();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v4;
      v12 = "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Success navigating to asset %{public}@";
      uint64_t v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 12;
LABEL_8:
      _os_log_impl(&dword_1A9AE7000, v13, v14, v12, buf, v15);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = v4;
    __int16 v20 = 2112;
    id v21 = v9;
    v12 = "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Failed navigating to asset %{public}@, error: %@";
    uint64_t v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 22;
    goto LABEL_8;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained completeUserInteractionTaskWithSuccess:1 error:0];
}

void __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_272(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PLSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Save selected. Saving %lu media objects", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained importAssets:*(void *)(a1 + 32)];
}

void __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_276(uint64_t a1)
{
  v2 = PLSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Cancel selected.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeUserInteractionTaskWithSuccess:1 error:0];
}

void __80__PXPhotoKitMessagesAddToLibraryAssetActionPerformer_performUserInteractionTask__block_invoke_280(uint64_t a1)
{
  v2 = PLSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "PXPhotoKitMessagesAddToLibraryAssetActionPerformer: Okay selected.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeUserInteractionTaskWithSuccess:1 error:0];
}

@end