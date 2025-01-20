@interface PUPXGridPresentation
- (BOOL)_isEmpty:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (PUPXGridPresentation)init;
- (PUPXGridPresentation)initWithUserInterfaceIdiom:(int64_t)a3;
- (PUSessionInfo)sessionInfo;
- (id)createAssetPickerPhotosAlbumViewControllerForAlbum:(id)a3;
- (id)createDuplicatesGridViewControllerWithCollection:(id)a3;
- (id)createImportHistoryGridViewControllerWithCollection:(id)a3;
- (id)createPanoramaViewController;
- (id)createPhotosAlbumViewControllerForAlbum:(id)a3 withFetchResult:(id)a4;
- (id)createPlacesViewControllerForAssetCollection:(id)a3;
- (id)createViewControllerForAssetCollection:(id)a3;
- (id)createViewControllerForAssetCollection:(id)a3 existingAssetsFetchResult:(id)a4;
- (int64_t)userInterfaceIdiom;
- (void)_customizePhotosViewConfiguationForAssetPicker:(id)a3 assetCollection:(id)a4;
- (void)setSessionInfo:(id)a3;
@end

@implementation PUPXGridPresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setSessionInfo:(id)a3
{
}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (void)_customizePhotosViewConfiguationForAssetPicker:(id)a3 assetCollection:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  [v18 setAllowsDragIn:0];
  v7 = [(PUPXGridPresentation *)self sessionInfo];
  objc_msgSend(v18, "setStartsInSelectMode:", objc_msgSend(v7, "allowsMultipleSelection"));

  v8 = [(PUPXGridPresentation *)self sessionInfo];
  objc_msgSend(v18, "setWantsNumberedSelectionStyle:", objc_msgSend(v8, "wantsNumberedSelectionStyle"));

  v9 = [(PUPXGridPresentation *)self sessionInfo];
  objc_msgSend(v18, "setNoContentPlaceholderType:", objc_msgSend(v9, "noContentPlaceholderType"));

  v10 = [(PUPXGridPresentation *)self sessionInfo];
  v11 = [v10 photosViewDelegate];
  [v18 setDelegate:v11];

  v12 = [(PUPXGridPresentation *)self sessionInfo];
  v13 = [v12 loadingStatusManager];
  [v18 setLoadingStatusManager:v13];

  [v18 setOneUpPresentationOrigin:PXOneUpPresentationOriginForAssetCollection()];
  v14 = [(PUPXGridPresentation *)self sessionInfo];
  objc_msgSend(v18, "setContentStartingPosition:", objc_msgSend(v14, "contentStartingPosition"));

  v15 = [(PUPXGridPresentation *)self sessionInfo];
  v16 = [v15 pickerClientBundleIdentifier];
  [v18 setPickerClientBundleIdentifier:v16];

  if (objc_msgSend(v6, "px_isImportHistoryCollection"))
  {
    uint64_t v17 = 2;
  }
  else if (objc_msgSend(v6, "px_isAllLibraryDuplicatesSmartAlbum"))
  {
    uint64_t v17 = 4;
  }
  else
  {
    uint64_t v17 = 0;
  }
  [v18 setSectionHeaderStyle:v17];
}

- (id)createDuplicatesGridViewControllerWithCollection:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    v15 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, self, @"PUPXGridPresentation.m", 279, @"%@ should be an instance inheriting from %@, but it is %@", @"collection", v13, v15 object file lineNumber description];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"PUPXGridPresentation.m", 279, @"%@ should be an instance inheriting from %@, but it is nil", @"collection", v13 object file lineNumber description];
  }

LABEL_3:
  id v6 = [(PUPXGridPresentation *)self sessionInfo];
  v7 = [v6 selectionCoordinator];
  v8 = PXDeduplicationPhotosViewConfiguration();

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F90590]) initWithConfiguration:v8];
  return v9;
}

- (id)createImportHistoryGridViewControllerWithCollection:(id)a3
{
  id v5 = a3;
  if ([v5 canContainAssets])
  {
    id v6 = v5;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        v7 = [v6 photoLibrary];
        v8 = [v7 librarySpecificFetchOptions];

        v9 = [(PUPXGridPresentation *)self sessionInfo];
        objc_msgSend(v8, "setReverseSortOrder:", objc_msgSend(v9, "reverseSortOrder"));

        v10 = [MEMORY[0x1E4F39100] fetchImportSessionsWithOptions:v8];
        v11 = [(PUPXGridPresentation *)self sessionInfo];
        int v12 = [v11 isForAssetPicker];

        v13 = [(PUPXGridPresentation *)self sessionInfo];
        v14 = v13;
        if (v12)
        {
          [v13 assetsFilterPredicate];
          v15 = id v31 = v5;
          v16 = [(PUPXGridPresentation *)self sessionInfo];
          [v16 reverseSortOrder];
          uint64_t v17 = [(PUPXGridPresentation *)self sessionInfo];
          id v18 = [v17 selectionCoordinator];
          [(PUPXGridPresentation *)self sessionInfo];
          v19 = v32 = v8;
          *(_WORD *)((char *)&v30 + 1) = [v19 allowsSwipeToSelect];
          LOBYTE(v30) = 0;
          v20 = PXPhotosViewConfigurationForImagePickerWithAssetCollectionFetchResult();

          id v5 = v31;
          -[PUPXGridPresentation _customizePhotosViewConfiguationForAssetPicker:assetCollection:](self, "_customizePhotosViewConfiguationForAssetPicker:assetCollection:", v20, v6, v30);
          v21 = (void *)[objc_alloc(MEMORY[0x1E4F90590]) initWithConfiguration:v20];
          v22 = [v6 localizedTitle];
          [v21 setTitle:v22];

          v8 = v32;
        }
        else
        {
          v23 = [v13 selectionCoordinator];
          v20 = PXPhotosViewConfigurationForAssetCollectionFetchResult();

          [v20 setOneUpPresentationOrigin:10];
          v21 = (void *)[objc_alloc(MEMORY[0x1E4F90590]) initWithConfiguration:v20];
        }

        goto LABEL_9;
      }
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      v28 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v28);
      v29 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
      [v25 handleFailureInMethod:a2, self, @"PUPXGridPresentation.m", 253, @"%@ should be an instance inheriting from %@, but it is %@", @"collection", v27, v29 object file lineNumber description];
    }
    else
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      [v25 handleFailureInMethod:a2, self, @"PUPXGridPresentation.m", 253, @"%@ should be an instance inheriting from %@, but it is nil", @"collection", v27 object file lineNumber description];
    }

    goto LABEL_4;
  }
  v21 = 0;
LABEL_9:

  return v21;
}

- (id)createPanoramaViewController
{
  v3 = [(PUPXGridPresentation *)self photoLibrary];
  v4 = [(PUPXGridPresentation *)self sessionInfo];
  int v5 = [v4 isForAssetPicker];

  id v6 = (void *)MEMORY[0x1E4F38EE8];
  v7 = [v3 librarySpecificFetchOptions];
  v8 = [v6 fetchAssetCollectionsWithType:2 subtype:201 options:v7];
  v9 = v8;
  if (v5)
  {
    v10 = [v8 firstObject];

    v11 = [(PUPXGridPresentation *)self sessionInfo];
    int v12 = [v11 assetsFilterPredicate];
    v13 = [(PUPXGridPresentation *)self sessionInfo];
    [v13 reverseSortOrder];
    v14 = [(PUPXGridPresentation *)self sessionInfo];
    v15 = [v14 selectionCoordinator];
    v16 = [(PUPXGridPresentation *)self sessionInfo];
    [v16 allowsSwipeToSelect];
    uint64_t v17 = PXPhotosViewConfigurationForImagePickerWithAssetCollection();

    [(PUPXGridPresentation *)self _customizePhotosViewConfiguationForAssetPicker:v17 assetCollection:v10];
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F90590]) initWithConfiguration:v17];
    v19 = [v10 localizedTitle];
    [v18 setTitle:v19];

    v9 = v10;
  }
  else
  {

    v20 = [(PUPXGridPresentation *)self sessionInfo];
    v21 = [v20 selectionCoordinator];
    uint64_t v17 = PXPhotosViewConfigurationForAssetCollectionFetchResult();

    [v17 setOneUpPresentationOrigin:8];
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F90590]) initWithConfiguration:v17];
  }

  return v18;
}

- (id)createAssetPickerPhotosAlbumViewControllerForAlbum:(id)a3
{
  id v4 = a3;
  int v5 = [(PUPXGridPresentation *)self sessionInfo];
  id v6 = [v5 assetsFilterPredicate];
  v7 = [(PUPXGridPresentation *)self sessionInfo];
  [v7 reverseSortOrder];
  v8 = [(PUPXGridPresentation *)self sessionInfo];
  v9 = [v8 selectionCoordinator];
  v10 = [(PUPXGridPresentation *)self sessionInfo];
  [v10 allowsSwipeToSelect];
  v11 = PXPhotosViewConfigurationForImagePickerWithAssetCollection();

  [(PUPXGridPresentation *)self _customizePhotosViewConfiguationForAssetPicker:v11 assetCollection:v4];
  int v12 = (void *)[objc_alloc(MEMORY[0x1E4F90590]) initWithConfiguration:v11];
  v13 = [v4 localizedTitle];

  [v12 setTitle:v13];
  return v12;
}

- (id)createPhotosAlbumViewControllerForAlbum:(id)a3 withFetchResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PUPXGridPresentation *)self sessionInfo];
  int v9 = [v8 isForAssetPicker];

  if (v9)
  {
    v10 = [(PUPXGridPresentation *)self createAssetPickerPhotosAlbumViewControllerForAlbum:v6];
  }
  else
  {
    v11 = [(PUPXGridPresentation *)self sessionInfo];
    int v12 = [v11 selectionCoordinator];
    v13 = PXPhotosViewConfigurationForAssetCollectionWithExistingAssetsFetchResult();

    [v13 setOneUpPresentationOrigin:PXOneUpPresentationOriginForAssetCollection()];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F90590]) initWithConfiguration:v13];
  }
  return v10;
}

- (id)createPlacesViewControllerForAssetCollection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 photoLibrary];
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F905C8]) initWithConfiguration:&__block_literal_global_53364];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F905D0]) initWithPhotoLibrary:v4 configuration:v5];
  id v7 = [v6 fetchResultViewController];
  v8 = [v7 mapFetchResultsController];
  [v8 preloadMap];
  objc_initWeak(&location, v8);
  int v9 = dispatch_get_global_queue(25, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PUPXGridPresentation_createPlacesViewControllerForAssetCollection___block_invoke_2;
  v13[3] = &unk_1E5F2D758;
  id v14 = v4;
  id v15 = v3;
  id v10 = v3;
  id v11 = v4;
  objc_copyWeak(&v16, &location);
  dispatch_async(v9, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v6;
}

void __69__PUPXGridPresentation_createPlacesViewControllerForAssetCollection___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) librarySpecificFetchOptions];
  id v3 = [MEMORY[0x1E4F90690] sharedLibraryStatusProviderWithPhotoLibrary:*(void *)(a1 + 32)];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F90310]) initWithSharedLibraryStatusProvider:v3];
  objc_msgSend(v2, "setSharingFilter:", objc_msgSend(v4, "sharingFilter"));
  int v5 = objc_msgSend(MEMORY[0x1E4F38EB8], "px_fetchPlacesAssetsInAssetCollection:options:", *(void *)(a1 + 40), v2);
  id v6 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PUPXGridPresentation_createPlacesViewControllerForAssetCollection___block_invoke_3;
  v8[3] = &unk_1E5F2E530;
  objc_copyWeak(&v9, v6);
  [WeakRetained loadFetchResult:v5 withCompletion:v8];

  objc_destroyWeak(&v9);
}

void __69__PUPXGridPresentation_createPlacesViewControllerForAssetCollection___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadContentModeWithCompletion:0];
}

uint64_t __69__PUPXGridPresentation_createPlacesViewControllerForAssetCollection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setGridViewEnabled:1];
}

- (id)createViewControllerForAssetCollection:(id)a3 existingAssetsFetchResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 assetCollectionType] == 9)
  {
    uint64_t v9 = [(PUPXGridPresentation *)self createImportHistoryGridViewControllerWithCollection:v7];
  }
  else if (objc_msgSend(v7, "px_isAllLibraryDuplicatesSmartAlbum"))
  {
    uint64_t v9 = [(PUPXGridPresentation *)self createDuplicatesGridViewControllerWithCollection:v7];
  }
  else if ((objc_msgSend(v7, "px_isTransientPlacesCollection") & 1) != 0 {
         || objc_msgSend(v7, "px_isPlacesSmartAlbum"))
  }
  {
    uint64_t v9 = [(PUPXGridPresentation *)self createPlacesViewControllerForAssetCollection:v7];
  }
  else
  {
    if (objc_msgSend(v7, "px_isPeopleVirtualCollection"))
    {
      int v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PUPXGridPresentation.m" lineNumber:162 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if (objc_msgSend(v7, "px_isPanoramasSmartAlbum")) {
      [(PUPXGridPresentation *)self createPanoramaViewController];
    }
    else {
    uint64_t v9 = [(PUPXGridPresentation *)self createPhotosAlbumViewControllerForAlbum:v7 withFetchResult:v8];
    }
  }
  id v10 = (void *)v9;

  return v10;
}

- (id)createViewControllerForAssetCollection:(id)a3
{
  return [(PUPXGridPresentation *)self createViewControllerForAssetCollection:a3 existingAssetsFetchResult:0];
}

- (BOOL)_isEmpty:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if (*(void *)(*((void *)&v12 + 1) + 8 * i))
          {
            BOOL v10 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 1;
LABEL_12:
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (PUPXGridPresentation)initWithUserInterfaceIdiom:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUPXGridPresentation;
  id v4 = [(PUPXGridPresentation *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    photoLibrary = v4->_photoLibrary;
    v4->_photoLibrary = (PHPhotoLibrary *)v5;

    v4->_userInterfaceIdiom = a3;
  }
  return v4;
}

- (PUPXGridPresentation)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPXGridPresentation.m", 120, @"%s is not available as initializer", "-[PUPXGridPresentation init]");

  abort();
}

@end