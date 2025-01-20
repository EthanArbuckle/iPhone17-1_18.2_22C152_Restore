@interface PXCMMPhotoKitPhotosPickerActionPerformer
- (NSArray)currentAssetIdentifiers;
- (void)_pickerDidCompleteWithPickedAssets:(id)a3;
- (void)performUserInteractionTask;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation PXCMMPhotoKitPhotosPickerActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_photosPickerViewController, 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
}

- (NSArray)currentAssetIdentifiers
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  currentAssetIdentifiers = self->_currentAssetIdentifiers;
  if (!currentAssetIdentifiers)
  {
    v4 = [(PXCMMActionPerformer *)self session];
    v5 = [v4 dataSourceManager];
    v6 = [v5 dataSource];

    uint64_t v8 = [v6 identifier];
    long long v9 = xmmword_1AB359AA0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    [v6 assetsInSectionIndexPath:&v8];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "count"));
    objc_claimAutoreleasedReturnValue();
    PXDisplayAssetFetchResultFastEnumeration();
  }
  return currentAssetIdentifiers;
}

- (void)_pickerDidCompleteWithPickedAssets:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v37 + 1) + 8 * i) assetIdentifier];
        if (v11)
        {
          [v5 addObject:v11];
        }
        else
        {
          v12 = PLUIGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "CMM picker result is missing an asset identifier", buf, 2u);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v8);
  }

  v13 = [(PXCMMActionPerformer *)self session];
  v14 = [v13 dataSourceManager];
  v15 = [v14 photoLibrary];

  v16 = (void *)MEMORY[0x1E4F38EB8];
  v17 = [v15 librarySpecificFetchOptions];
  v18 = [v16 fetchAssetsWithLocalIdentifiers:v5 options:v17];

  uint64_t v19 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v18 title:0];
  id v20 = objc_alloc(MEMORY[0x1E4F39150]);
  v33 = (void *)v19;
  uint64_t v41 = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v34 = v15;
  v22 = (void *)[v20 initWithObjects:v21 photoLibrary:v15 fetchType:*MEMORY[0x1E4F39650] fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  v23 = [(PXCMMActionPerformer *)self session];
  v24 = [v23 dataSourceManager];
  v25 = [v24 photosDataSource];
  [v25 setCollectionListFetchResult:v22];

  uint64_t v26 = [v18 countOfAssetsWithMediaType:1];
  uint64_t v27 = [v18 countOfAssetsWithMediaType:2];
  uint64_t v28 = [v18 count];
  v29 = [(PXCMMActionPerformer *)self session];
  v30 = [v29 viewModel];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __79__PXCMMPhotoKitPhotosPickerActionPerformer__pickerDidCompleteWithPickedAssets___block_invoke;
  v35[3] = &__block_descriptor_56_e33_v16__0___PXCMMMutableViewModel__8l;
  v35[4] = v26;
  v35[5] = v27;
  v35[6] = v28;
  [v30 performChanges:v35];

  if (![(PXActionPerformer *)self dismissViewController:self->_photosPickerViewController completionHandler:0])
  {
    v31 = PLUIGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_ERROR, "CMM picker failed to dismiss PHPickerViewController", buf, 2u);
    }
  }
  photosPickerViewController = self->_photosPickerViewController;
  self->_photosPickerViewController = 0;

  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

void __79__PXCMMPhotoKitPhotosPickerActionPerformer__pickerDidCompleteWithPickedAssets___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setPhotosCount:v3];
  [v4 setVideosCount:a1[5]];
  [v4 setTotalCount:a1[6]];
  [v4 setSelectedPhotosCount:a1[4]];
  [v4 setSelectedVideosCount:a1[5]];
  [v4 setSelectedCount:a1[6]];
}

- (void)performUserInteractionTask
{
  uint64_t v3 = [(PXCMMActionPerformer *)self session];
  id v4 = [v3 dataSourceManager];
  id v10 = [v4 photoLibrary];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F39930]) initWithPhotoLibraryAndOnlyReturnsIdentifiers:v10];
  [v5 setSelectionLimit:0];
  id v6 = [(PXCMMPhotoKitPhotosPickerActionPerformer *)self currentAssetIdentifiers];
  [v5 setPreselectedAssetIdentifiers:v6];

  [v5 _setDisabledPrivateCapabilities:5];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v5];
  [v7 setDelegate:self];
  uint64_t v8 = [v7 presentationController];
  [v8 setDelegate:self];

  objc_storeStrong((id *)&self->_photosPickerViewController, v7);
  if (![(PXActionPerformer *)self presentViewController:self->_photosPickerViewController])
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1002, @"failed to present photos picker");
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v9];
  }
}

@end