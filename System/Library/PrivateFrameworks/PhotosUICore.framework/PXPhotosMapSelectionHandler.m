@interface PXPhotosMapSelectionHandler
- (PXAssetsDataSourceManager)oneUpDataSourceManager;
- (PXPhotosMapSelectionHandler)init;
- (PXPhotosMapSelectionHandler)initWithViewModel:(id)a3 presentingViewController:(id)a4;
- (PXPhotosViewModel)viewModel;
- (UIViewController)presentingViewController;
- (id)oneUpPresentationInitialAssetReference:(id)a3;
- (id)oneUpPresentationMediaProvider:(id)a3;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (void)didSelectGeotaggableItems:(id)a3 fromMapView:(id)a4;
- (void)setOneUpDataSourceManager:(id)a3;
@end

@implementation PXPhotosMapSelectionHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setOneUpDataSourceManager:(id)a3
{
}

- (PXAssetsDataSourceManager)oneUpDataSourceManager
{
  return self->_oneUpDataSourceManager;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  v3 = [(PXPhotosMapSelectionHandler *)self oneUpDataSourceManager];
  v4 = [v3 dataSource];
  v5 = [v4 startingAssetReference];

  return v5;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 7;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  v5 = [(PXPhotosMapSelectionHandler *)self viewModel];
  v6 = [v5 mediaProvider];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    v12 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXPhotosMapSelectionHandler.m", 104, @"%@ should be an instance inheriting from %@, but it is %@", @"self.viewModel.mediaProvider", v10, v12 object file lineNumber description];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXPhotosMapSelectionHandler.m", 104, @"%@ should be an instance inheriting from %@, but it is nil", @"self.viewModel.mediaProvider", v10 object file lineNumber description];
  }

LABEL_3:
  return v6;
}

- (void)didSelectGeotaggableItems:(id)a3 fromMapView:(id)a4
{
  v6 = [a3 set];
  if ([v6 count])
  {
    if ([v6 count] == 1)
    {
      v7 = [v6 allObjects];
      v8 = [v7 firstObject];

      id v9 = v8;
      v10 = v9;
      if (v9)
      {
        if (([v9 conformsToProtocol:&unk_1F0363A80] & 1) == 0)
        {
          v35 = [MEMORY[0x1E4F28B00] currentHandler];
          v36 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
          [v35 handleFailureInMethod:a2, self, @"PXPhotosMapSelectionHandler.m", 57, @"%@ should be nil or conform to protocol %@, but %@ doesn't", @"selectedGeotaggable", @"PXDisplayAsset", v36 object file lineNumber description];
        }
        v11 = [(PXPhotosMapSelectionHandler *)self viewModel];
        v12 = [v11 currentDataSource];
        uint64_t v13 = [v12 identifier];

        *(void *)buf = v13;
        long long v43 = xmmword_1AB359AA0;
        uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
        v14 = [objc_alloc((Class)off_1E5DA55E0) initWithSectionObject:0 itemObject:v10 subitemObject:0 indexPath:buf];
        v15 = [(PXPhotosMapSelectionHandler *)self viewModel];
        v16 = [v15 dataSourceManager];
        v17 = [v16 createDataSourceManagerForAsset:v14];
        [(PXPhotosMapSelectionHandler *)self setOneUpDataSourceManager:v17];

        v18 = [(PXPhotosMapSelectionHandler *)self presentingViewController];
        objc_msgSend(v18, "px_enableOneUpPresentation");

        v19 = [(PXPhotosMapSelectionHandler *)self presentingViewController];
        v20 = objc_msgSend(v19, "px_oneUpPresentation");

        [v20 setDelegate:self];
        [v20 startWithConfigurationHandler:0];
      }
      else
      {
        v14 = PLUIGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "Unable to provide selectedGeotaggableAsset", buf, 2u);
        }
      }

      goto LABEL_22;
    }
    v21 = [v6 anyObject];
    if (v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_9;
      }
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v33 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v33);
      v34 = objc_msgSend(v21, "px_descriptionForAssertionMessage");
      [v30 handleFailureInMethod:a2, self, @"PXPhotosMapSelectionHandler.m", 73, @"%@ should be an instance inheriting from %@, but it is %@", @"selectedGeotaggables.anyObject", v32, v34 object file lineNumber description];
    }
    else
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      [v30 handleFailureInMethod:a2, self, @"PXPhotosMapSelectionHandler.m", 73, @"%@ should be an instance inheriting from %@, but it is nil", @"selectedGeotaggables.anyObject", v32 object file lineNumber description];
    }

LABEL_9:
    v10 = [v21 photoLibrary];

    if (!v10)
    {
      v26 = PLUIGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_ERROR, "Missing photoLibrary required to show selectedGeotaggables", buf, 2u);
      }

      v10 = 0;
      goto LABEL_22;
    }
    v22 = +[PXLemonadeSettings sharedInstance];
    int v23 = [v22 presentZoomableGridFromMapCluster];

    if (!v23)
    {
      v25 = PXPhotosViewConfigurationForPlacesMomentsWithAllowedAssets(v6, v10);
      PXLocalizedStringFromTable(@"PXPlacesFullSizeViewTitle", @"PhotosUICore");
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      [v25 setTitle:v24];
      goto LABEL_21;
    }
    id v24 = v6;
    if (v24)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_13:
        v25 = PXPhotosViewConfigurationForPlacesGridWithAssetSet(v24, v10);
LABEL_21:

        [v25 setOneUpPresentationOrigin:7];
        v27 = [[PXPhotosUIViewController alloc] initWithConfiguration:v25];
        v28 = [(PXPhotosMapSelectionHandler *)self presentingViewController];
        v29 = [v28 navigationController];
        [v29 pushViewController:v27 animated:1];

LABEL_22:
        goto LABEL_23;
      }
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      v40 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v40);
      v41 = objc_msgSend(v24, "px_descriptionForAssertionMessage");
      [v37 handleFailureInMethod:a2, self, @"PXPhotosMapSelectionHandler.m", 79, @"%@ should be an instance inheriting from %@, but it is %@", @"selectedGeotaggables", v39, v41 object file lineNumber description];
    }
    else
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      [v37 handleFailureInMethod:a2, self, @"PXPhotosMapSelectionHandler.m", 79, @"%@ should be an instance inheriting from %@, but it is nil", @"selectedGeotaggables", v39 object file lineNumber description];
    }

    goto LABEL_13;
  }
LABEL_23:
}

- (PXPhotosMapSelectionHandler)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosMapSelectionHandler.m", 42, @"%s is not available as initializer", "-[PXPhotosMapSelectionHandler init]");

  abort();
}

- (PXPhotosMapSelectionHandler)initWithViewModel:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosMapSelectionHandler;
  id v9 = [(PXPhotosMapSelectionHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

@end