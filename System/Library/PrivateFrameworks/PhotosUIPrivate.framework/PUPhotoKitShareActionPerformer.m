@interface PUPhotoKitShareActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4;
- (PUActivitySharingController)activitySharingController;
- (UIViewController)preheatedSharingViewController;
- (id)_assetsFetchResultByAssetCollectionFromCollectionListFetchResult:(id)a3 inDataSource:(id)a4;
- (id)_createSharingViewControllerFromCurrentSelection;
- (void)performUserInteractionTask;
- (void)preheatUserInteractionTask;
- (void)setActivitySharingController:(id)a3;
- (void)setPreheatedSharingViewController:(id)a3;
@end

@implementation PUPhotoKitShareActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySharingController, 0);
  objc_storeStrong((id *)&self->_preheatedSharingViewController, 0);
}

- (void)setActivitySharingController:(id)a3
{
}

- (PUActivitySharingController)activitySharingController
{
  return self->_activitySharingController;
}

- (void)setPreheatedSharingViewController:(id)a3
{
}

- (UIViewController)preheatedSharingViewController
{
  return self->_preheatedSharingViewController;
}

- (id)_assetsFetchResultByAssetCollectionFromCollectionListFetchResult:(id)a3 inDataSource:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
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
          v14 = objc_msgSend(v6, "assetsInSection:", objc_msgSend(v6, "sectionForAssetCollection:", v13, (void)v19));
          if (v14) {
            goto LABEL_9;
          }
          id v15 = objc_alloc(MEMORY[0x1E4F39150]);
          v16 = [v6 photoLibrary];
          v17 = [MEMORY[0x1E4F38EB8] fetchType];
          v14 = (void *)[v15 initWithObjects:MEMORY[0x1E4F1CBF0] photoLibrary:v16 fetchType:v17 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

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

- (void)performUserInteractionTask
{
  v4 = [(PUAssetActionPerformer *)self assets];
  uint64_t v5 = [v4 count];

  if (v5 != 1)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PUPhotoKitAssetActionManager.m" lineNumber:1787 description:@"There can be only one asset in a share action"];
  }
  id v6 = [(PUAssetActionPerformer *)self actionPerformerLog];
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayLatency", "", buf, 2u);
  }
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayDuration", " enableTelemetry=YES ", v10, 2u);
  }
  v7 = [(PUPhotoKitShareActionPerformer *)self preheatedSharingViewController];
  if (!v7)
  {
    v7 = [(PUPhotoKitShareActionPerformer *)self _createSharingViewControllerFromCurrentSelection];
  }
  [(PUAssetActionPerformer *)self completeUserInteractionTaskWithSuccess:[(PUAssetActionPerformer *)self presentViewController:v7] error:0];
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayLatency", "", v9, 2u);
  }
}

- (void)preheatUserInteractionTask
{
  v3 = [(PUAssetActionPerformer *)self actionPerformerLog];
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayPreheat", "", buf, 2u);
  }
  v4 = [(PUPhotoKitShareActionPerformer *)self _createSharingViewControllerFromCurrentSelection];
  [(PUPhotoKitShareActionPerformer *)self setPreheatedSharingViewController:v4];

  if (os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayPreheat", "", v5, 2u);
  }
}

- (id)_createSharingViewControllerFromCurrentSelection
{
  v3 = self;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v4 = [(PUAssetActionPerformer *)self assets];
  if ([v4 count] != 1)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2 object:v3 file:@"PUPhotoKitAssetActionManager.m" lineNumber:1726 description:@"There can be only one asset in a share action"];
  }
  uint64_t v5 = [v4 firstObject];
  id v6 = [(PUPhotoKitActionPerformer *)v3 photosDataSource];
  if (!v6)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2 object:v3 file:@"PUPhotoKitAssetActionManager.m" lineNumber:1731 description:@"Share performer should have a photosDataSource set."];
  }
  uint64_t v7 = [v6 collectionListFetchResult];
  v51 = [(PUPhotoKitShareActionPerformer *)v3 _assetsFetchResultByAssetCollectionFromCollectionListFetchResult:v7 inDataSource:v6];
  id v8 = [(PUAssetActionPerformer *)v3 assetsByAssetCollection];
  uint64_t v9 = [v8 allKeys];
  uint64_t v10 = [v9 firstObject];

  uint64_t v11 = [v6 indexPathForAsset:v5 inCollection:v10];
  v12 = [[PUPhotoSelectionManager alloc] initWithOptions:0];
  unint64_t v13 = [v11 item];
  v50 = (void *)v10;
  v52 = objc_msgSend(v6, "assetsInSection:", objc_msgSend(v6, "sectionForAssetCollection:", v10));
  uint64_t v53 = v13;
  if (v13 >= [v52 count]
    || ([v52 objectAtIndexedSubscript:v13],
        v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 isEqual:v5],
        v14,
        (v15 & 1) == 0))
  {
    uint64_t v53 = [v52 indexOfObject:v5];
    v16 = PLUIGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [NSNumber numberWithInteger:v53];
      *(_DWORD *)buf = 138412802;
      v58 = v5;
      __int16 v59 = 2112;
      v60 = v11;
      __int16 v61 = 2112;
      v62 = v17;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "Index is invalid for current asset %@. Fixing up %@ => %@.", buf, 0x20u);
    }
  }
  v48 = v11;
  SEL v46 = a2;
  v47 = (void *)v7;
  v49 = v12;
  v18 = [[PUActivitySharingConfiguration alloc] initWithCollectionsFetchResult:v7 selectionManager:v12];
  if (_os_feature_enabled_impl())
  {
    long long v19 = (void *)MEMORY[0x1E4F38EB8];
    long long v20 = [v5 objectID];
    v56 = v20;
    long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
    [v5 photoLibrary];
    long long v22 = v6;
    v23 = v5;
    uint64_t v24 = v3;
    v26 = v25 = v4;
    v27 = [v26 librarySpecificFetchOptions];
    v28 = [v19 fetchAssetsWithObjectIDs:v21 options:v27];
    [(PUActivitySharingConfiguration *)v18 setInitialAssetsFetchResult:v28];

    v4 = v25;
    v3 = v24;
    uint64_t v5 = v23;
    id v6 = v22;
  }
  [(PUActivitySharingConfiguration *)v18 setAssetsFetchResultsByAssetCollection:v51];
  [(PUActivitySharingConfiguration *)v18 setPhotosDataSource:v6];
  v29 = +[PUActivityViewController excludedPhotosActivityTypesForPresentationSource:0];
  [(PUActivitySharingConfiguration *)v18 setExcludedActivityTypes:v29];

  BOOL v30 = 1;
  [(PUActivitySharingConfiguration *)v18 setAllowsAirPlayActivity:1];
  [v5 faceAreaMaxX];
  if (v31 <= 0.0)
  {
    [v5 faceAreaMaxY];
    BOOL v30 = v32 > 0.0;
  }
  [(PUActivitySharingConfiguration *)v18 setAllowsSuggestLessPersonActivity:v30];
  v33 = [[PUActivitySharingController alloc] initWithActivitySharingConfiguration:v18];
  objc_storeStrong((id *)&v3->_activitySharingController, v33);
  if (v53 != 0x7FFFFFFFFFFFFFFFLL) {
    [(PUPhotoSelectionManager *)v49 selectAssetAtIndex:v53 inAssetCollection:v50];
  }
  v34 = [(PUActivitySharingController *)v3->_activitySharingController activityViewController];
  v35 = v48;
  if (v34)
  {
    objc_opt_class();
    v36 = v47;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_18;
    }
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    v42 = (objc_class *)objc_opt_class();
    uint64_t v43 = NSStringFromClass(v42);
    v44 = objc_msgSend(v34, "px_descriptionForAssertionMessage");
    v45 = (void *)v43;
    [v54 handleFailureInMethod:v46, v3, @"PUPhotoKitAssetActionManager.m", 1769, @"%@ should be an instance inheriting from %@, but it is %@", @"_activitySharingController.activityViewController", v43, v44 object file lineNumber description];

    v35 = v48;
  }
  else
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    v41 = (objc_class *)objc_opt_class();
    v45 = NSStringFromClass(v41);
    v54 = v40;
    [v40 handleFailureInMethod:v46, v3, @"PUPhotoKitAssetActionManager.m", 1769, @"%@ should be an instance inheriting from %@, but it is nil", @"_activitySharingController.activityViewController", v45 object file lineNumber description];
    v36 = v47;
  }

LABEL_18:
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __82__PUPhotoKitShareActionPerformer__createSharingViewControllerFromCurrentSelection__block_invoke;
  v55[3] = &unk_1E5F2ED10;
  v55[4] = v3;
  [v34 setReadyToInteractHandler:v55];

  return v34;
}

void __82__PUPhotoKitShareActionPerformer__createSharingViewControllerFromCurrentSelection__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) actionPerformerLog];
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v1, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayDuration", " enableTelemetry=YES ", v2, 2u);
  }
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return [a3 isPhotoIrisPlaceholder] ^ 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v6 isPhotoIrisPlaceholder];
  char v8 = [v6 canPerformSharingAction];

  if ((v8 & 1) != 0 || v7) {
    int v7 = [v5 isTrashBin] ^ 1;
  }

  return v7;
}

@end