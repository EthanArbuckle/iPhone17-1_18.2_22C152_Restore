@interface PUPXPhotoKitShareAssetActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5;
+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (id)_assetsFetchResultByAssetCollectionFromCollectionListFetchResult:(id)a3 inDataSource:(id)a4;
- (id)undoManagerForActionPerformer:(id)a3;
- (void)_didCompleteWithActivityType:(id)a3 success:(BOOL)a4 asset:(id)a5 person:(id)a6 socialGroup:(id)a7 selectionSnapshot:(id)a8;
- (void)_performNotThisPersonWithCompletionHandler:(id)a3;
- (void)_performSetKeyFaceWithAsset:(id)a3 completionHandler:(id)a4;
- (void)_presentShareSheet;
- (void)activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5;
- (void)activitySharingControllerDidCancel:(id)a3;
- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4;
@end

@implementation PUPXPhotoKitShareAssetActionPerformer

- (void).cxx_destruct
{
}

- (id)undoManagerForActionPerformer:(id)a3
{
  v4 = [(PXActionPerformer *)self delegate];
  v5 = [v4 undoManagerForActionPerformer:self];

  return v5;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = [(PXActionPerformer *)self dismissViewController:a4 completionHandler:a5];
  if (!v6) {
    [(PUPXPhotoKitShareAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
  return v6;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  BOOL v5 = [(PXActionPerformer *)self presentViewController:a4];
  if (!v5) {
    [(PUPXPhotoKitShareAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
  return v5;
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(PXActionPerformer *)self state] == 10)
  {
    v8.receiver = self;
    v8.super_class = (Class)PUPXPhotoKitShareAssetActionPerformer;
    [(PXActionPerformer *)&v8 completeUserInteractionTaskWithSuccess:v4 error:v6];
  }
  else
  {
    v7 = PXAssertGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v10 = [(PXActionPerformer *)self state];
      _os_log_error_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "[PUPXPhotoKitShareAssetActionPerformer]: Failed to completeUserInteractionTaskWithSuccess because state is %lu", buf, 0xCu);
    }
  }
}

- (void)_performNotThisPersonWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v11 = [(PXPhotoKitAssetActionPerformer *)self person];
  [(PXPhotoKitAssetActionPerformer *)self instantlyExcludeAssetsFromDataSource];
  BOOL v5 = [(PXAssetActionPerformer *)self selectionSnapshot];
  id v6 = [v5 selectedIndexPaths];

  v7 = [(PXPhotoKitAssetActionPerformer *)self photosDataSourceSnapshot];
  objc_super v8 = [v7 fetchResultWithAssetsAtIndexPaths:v6];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F903C0]) initWithPerson:v11 assets:v8];
  unint64_t v10 = [(PXActionPerformer *)self undoManager];
  [v9 executeWithUndoManager:v10 completionHandler:v4];
}

- (void)_performSetKeyFaceWithAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(PXPhotoKitAssetActionPerformer *)self person];
  objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F90040]) initWithPerson:v10 asset:v7];

  v9 = [(PXActionPerformer *)self undoManager];
  [v8 executeWithUndoManager:v9 completionHandler:v6];
}

- (void)_didCompleteWithActivityType:(id)a3 success:(BOOL)a4 asset:(id)a5 person:(id)a6 socialGroup:(id)a7 selectionSnapshot:(id)a8
{
  BOOL v12 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v18 = PLUIGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = @"NO";
    if (v12) {
      v19 = @"YES";
    }
    v20 = v19;
    *(_DWORD *)buf = 138412546;
    id v36 = v14;
    __int16 v37 = 2112;
    v38 = v20;
    _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_DEFAULT, "[PUPXPhotoKitShareAssetActionPerformer] didCompleteWithActivityType: %@, success %@", buf, 0x16u);
  }
  if (v12)
  {
    if (v15 && a6)
    {
      if ([v14 isEqualToString:*MEMORY[0x1E4F90AB8]])
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke;
        v34[3] = &unk_1E5F2E3B8;
        v34[4] = self;
        [(PUPXPhotoKitShareAssetActionPerformer *)self _performSetKeyFaceWithAsset:v15 completionHandler:v34];
        goto LABEL_26;
      }
      if ([v14 isEqualToString:*MEMORY[0x1E4F90A78]])
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_243;
        v33[3] = &unk_1E5F2E3B8;
        v33[4] = self;
        [(PUPXPhotoKitShareAssetActionPerformer *)self _performNotThisPersonWithCompletionHandler:v33];
        goto LABEL_26;
      }
    }
    if (v15 && v16 && [v14 isEqualToString:*MEMORY[0x1E4F90AD0]])
    {
      v21 = (void *)MEMORY[0x1E4F90428];
      v22 = [(PXActionPerformer *)self undoManager];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_246;
      v30[3] = &unk_1E5F2D4B8;
      id v31 = v16;
      v32 = self;
      [v21 performSetSocialGroupKeyPhotoWithAsset:v15 socialGroup:v31 undoManager:v22 completionHandler:v30];
    }
    else if ([v14 isEqualToString:*MEMORY[0x1E4F90AF8]] {
           && ([(PXPhotoKitAssetActionPerformer *)self createPerformerWithClass:objc_opt_class() actionType:*MEMORY[0x1E4F90D88]], (uint64_t v23 = objc_claimAutoreleasedReturnValue()) != 0))
    }
    {
      v24 = (void *)v23;
      v25 = [v17 selectedIndexPaths];
      uint64_t v26 = [v25 count];

      if (v26 < 1)
      {
        [(PUPXPhotoKitShareAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
      }
      else
      {
        [v24 setSelectionSnapshot:v17];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_248;
        v29[3] = &unk_1E5F2E3B8;
        v29[4] = self;
        [v24 performActionWithCompletionHandler:v29];
      }
    }
    else
    {
      if ([v14 isEqualToString:*MEMORY[0x1E4F9F348]])
      {
        v27 = self;
        uint64_t v28 = 0;
      }
      else
      {
        v27 = self;
        uint64_t v28 = 1;
      }
      [(PUPXPhotoKitShareAssetActionPerformer *)v27 completeUserInteractionTaskWithSuccess:v28 error:0];
    }
  }
LABEL_26:
}

void __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v3 = v4;
  px_dispatch_on_main_queue();
}

void __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_243(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v3 = v4;
  px_dispatch_on_main_queue();
}

void __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_246(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = *(id *)(a1 + 32);
  id v5 = v4;
  px_dispatch_on_main_queue();
}

uint64_t __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:a3];
}

void __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_2_247(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) localIdentifier];
  if (*(unsigned char *)(a1 + 56))
  {
    id v3 = PLUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v2;
      id v4 = "Setting new key photo succeeded for social group: %@";
      id v5 = v3;
      os_log_type_t v6 = OS_LOG_TYPE_INFO;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_1AE9F8000, v5, v6, v4, (uint8_t *)&v9, v7);
    }
  }
  else
  {
    [*(id *)(a1 + 40) stopExcludingAssetsFromDataSource];
    id v3 = PLUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      int v9 = 138412546;
      id v10 = v2;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      id v4 = "Setting new key photo failed for social group: %@ with error: %@";
      id v5 = v3;
      os_log_type_t v6 = OS_LOG_TYPE_ERROR;
      uint32_t v7 = 22;
      goto LABEL_6;
    }
  }

  [*(id *)(a1 + 40) completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

uint64_t __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_2_244(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = PLUIGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      id v3 = "[PUPXPhotoKitShareAssetActionPerformer] Not This Person succeeded.";
      id v4 = v2;
      os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
      uint32_t v6 = 2;
LABEL_6:
      _os_log_impl(&dword_1AE9F8000, v4, v5, v3, (uint8_t *)&v9, v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) stopExcludingAssetsFromDataSource];
    v2 = PLUIGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v7;
      id v3 = "[PUPXPhotoKitShareAssetActionPerformer] Not This Person failed with error %@.";
      id v4 = v2;
      os_log_type_t v5 = OS_LOG_TYPE_ERROR;
      uint32_t v6 = 12;
      goto LABEL_6;
    }
  }

  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

uint64_t __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = PLUIGetLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      os_log_type_t v5 = "[PUPXPhotoKitShareAssetActionPerformer] Set Key Face succeeded";
      uint32_t v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      uint32_t v8 = 2;
LABEL_6:
      _os_log_impl(&dword_1AE9F8000, v6, v7, v5, (uint8_t *)&v11, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v9;
    os_log_type_t v5 = "[PUPXPhotoKitShareAssetActionPerformer] Set Key Face failed with error %@.";
    uint32_t v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
    uint32_t v8 = 12;
    goto LABEL_6;
  }

  return [*(id *)(a1 + 40) completeUserInteractionTaskWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

- (void)activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  activitySharingController = self->_activitySharingController;
  if (activitySharingController)
  {
    if (v5)
    {
      self->_activitySharingController = 0;
    }
    id v12 = v9;
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_6:
        uint64_t v13 = [v12 currentAsset];
        id v14 = [(PXPhotoKitAssetActionPerformer *)self person];
        id v15 = [(PXPhotoKitAssetActionPerformer *)self socialGroup];
        id v16 = [v12 selectionSnapshot];
        [(PUPXPhotoKitShareAssetActionPerformer *)self _didCompleteWithActivityType:v10 success:v5 asset:v13 person:v14 socialGroup:v15 selectionSnapshot:v16];

        goto LABEL_10;
      }
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      v21 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v21);
      v22 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v18 handleFailureInMethod:a2, self, @"PUPXPhotoKitAssetActionManager.m", 314, @"%@ should be an instance inheriting from %@, but it is %@", @"activitySharingController", v20, v22 object file lineNumber description];
    }
    else
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      [v18 handleFailureInMethod:a2, self, @"PUPXPhotoKitAssetActionManager.m", 314, @"%@ should be an instance inheriting from %@, but it is nil", @"activitySharingController", v20 object file lineNumber description];
    }

    goto LABEL_6;
  }
  id v17 = PLUIGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_ERROR, "didCompleteWithActivityType: was called whereas _activitySharingController == nil.", buf, 2u);
  }

LABEL_10:
}

- (void)activitySharingControllerDidCancel:(id)a3
{
  activitySharingController = self->_activitySharingController;
  self->_activitySharingController = 0;

  if ([(PXActionPerformer *)self state] == 10)
  {
    [(PUPXPhotoKitShareAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

- (id)_assetsFetchResultByAssetCollectionFromCollectionListFetchResult:(id)a3 inDataSource:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  os_log_type_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        if (v6)
        {
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v14 = objc_msgSend(v6, "assetsInSection:", objc_msgSend(v6, "sectionForAssetCollection:", v13, (void)v19));
          if (v14) {
            goto LABEL_9;
          }
          id v15 = objc_alloc(MEMORY[0x1E4F39150]);
          id v16 = [v6 photoLibrary];
          id v17 = [MEMORY[0x1E4F38EB8] fetchType];
          id v14 = (void *)[v15 initWithObjects:MEMORY[0x1E4F1CBF0] photoLibrary:v16 fetchType:v17 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

          if (v14)
          {
LABEL_9:
            [v7 setObject:v14 forKey:v13];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)_presentShareSheet
{
  id v3 = [(PXAssetActionPerformer *)self selectionSnapshot];
  id v4 = [(PXPhotoKitAssetActionPerformer *)self photosDataSourceSnapshot];
  id v5 = [v4 collectionListFetchResult];
  id v6 = [(PUPXPhotoKitShareAssetActionPerformer *)self _assetsFetchResultByAssetCollectionFromCollectionListFetchResult:v5 inDataSource:v4];
  os_log_type_t v7 = [[PUPhotoSelectionManager alloc] initWithOptions:0];
  id v8 = [[PUActivitySharingConfiguration alloc] initWithCollectionsFetchResult:v5 selectionManager:v7];
  if (_os_feature_enabled_impl())
  {
    uint64_t v36 = 0;
    __int16 v37 = &v36;
    uint64_t v38 = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__54117;
    v40 = __Block_byref_object_dispose__54118;
    id v41 = 0;
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v10 = [v3 selectedIndexPaths];
    uint64_t v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

    id v12 = [v3 selectedIndexPaths];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __59__PUPXPhotoKitShareAssetActionPerformer__presentShareSheet__block_invoke;
    v32[3] = &unk_1E5F28618;
    id v33 = v4;
    v35 = &v36;
    id v13 = v11;
    id v34 = v13;
    [v12 enumerateItemIndexPathsUsingBlock:v32];

    id v14 = (void *)MEMORY[0x1E4F38EB8];
    id v15 = [(id)v37[5] librarySpecificFetchOptions];
    id v16 = [v14 fetchAssetsWithObjectIDs:v13 options:v15];
    [(PUActivitySharingConfiguration *)v8 setInitialAssetsFetchResult:v16];

    _Block_object_dispose(&v36, 8);
  }
  id v17 = [(PXPhotoKitAssetActionPerformer *)self person];
  [(PUActivitySharingConfiguration *)v8 setPerson:v17];

  v18 = [(PXPhotoKitAssetActionPerformer *)self socialGroup];
  [(PUActivitySharingConfiguration *)v8 setSocialGroup:v18];

  [(PUActivitySharingConfiguration *)v8 setAssetsFetchResultsByAssetCollection:v6];
  long long v19 = [(PXPhotoKitAssetActionPerformer *)self photosDataSourceSnapshot];
  [(PUActivitySharingConfiguration *)v8 setPhotosDataSource:v19];

  long long v20 = +[PUActivityViewController excludedPhotosActivityTypesForPresentationSource:[(PXPhotoKitAssetActionPerformer *)self presentationSource]];
  [(PUActivitySharingConfiguration *)v8 setExcludedActivityTypes:v20];

  [(PUActivitySharingConfiguration *)v8 setAllowsAirPlayActivity:[(PXPhotoKitAssetActionPerformer *)self supportsAirPlay]];
  long long v21 = [[PUActivitySharingController alloc] initWithActivitySharingConfiguration:v8];
  [(PUActivitySharingController *)v21 setDelegate:self];
  objc_storeStrong((id *)&self->_activitySharingController, v21);
  uint64_t v22 = [v3 selectedIndexPaths];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __59__PUPXPhotoKitShareAssetActionPerformer__presentShareSheet__block_invoke_2;
  v29 = &unk_1E5F28640;
  id v23 = v4;
  id v30 = v23;
  uint64_t v24 = v7;
  id v31 = v24;
  [(id)v22 enumerateItemIndexSetsUsingBlock:&v26];

  v25 = [(PUActivitySharingController *)self->_activitySharingController activityViewController];
  LOBYTE(v22) = [(PXActionPerformer *)self presentViewController:v25];

  if ((v22 & 1) == 0) {
    [(PUPXPhotoKitShareAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

void __59__PUPXPhotoKitShareAssetActionPerformer__presentShareSheet__block_invoke(void *a1, _OWORD *a2)
{
  id v3 = (void *)a1[4];
  long long v4 = a2[1];
  v12[0] = *a2;
  v12[1] = v4;
  id v5 = [v3 assetAtSimpleIndexPath:v12];
  id v6 = v5;
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v7 = [v5 photoLibrary];
    uint64_t v8 = *(void *)(a1[6] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = (void *)a1[5];
  uint64_t v11 = [v6 objectID];
  [v10 addObject:v11];
}

void __59__PUPXPhotoKitShareAssetActionPerformer__presentShareSheet__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = [v6 assetCollectionForSection:a3];
  [*(id *)(a1 + 40) selectAssetsAtIndexes:v7 inAssetCollection:v8];
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"square.and.arrow.up";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  long long v4 = NSString;
  id v5 = PXActionPerformerTitleUseCaseDescription();
  id v6 = [v4 stringWithFormat:@"PXPhotoKitAssetActionManager%@Title_Share", v5];

  id v7 = PXLocalizedString();

  return v7;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x1E4FB13F0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _OWORD v12[2] = __84__PUPXPhotoKitShareAssetActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v12[3] = &unk_1E5F2A928;
  id v13 = v7;
  id v9 = v7;
  uint64_t v10 = [v8 actionWithTitle:a3 image:a4 identifier:0 handler:v12];

  return v10;
}

uint64_t __84__PUPXPhotoKitShareAssetActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x1E4FB14A8];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithBarButtonSystemItem:9 target:v7 action:a4];

  objc_msgSend(v8, "setImageInsets:", -0.5, 0.0, 0.5, 0.0);
  return v8;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6 = a3;
  if ([v6 canPerformSharingAction] && (objc_msgSend(v6, "isTrashed") & 1) == 0) {
    int v7 = [v6 isRecoveredAsset] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

@end