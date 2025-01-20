@interface PXPhotosMapLayout
- (CGSize)singleViewLayout:(id)a3 desiredSizeForReferenceSize:(CGSize)a4;
- (CLLocation)initialLocation;
- (PXPhotosMapLayout)initWithViewModel:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4 traitCollection:(id)a5 presentingViewController:(id)a6 initialLocation:(id)a7;
- (PXPhotosMapSelectionHandler)selectionHandler;
- (PXPhotosViewModel)viewModel;
- (PXPlacesMapController)mapController;
- (PXPlacesMapControllerSelectionDelegate)selectionDelegate;
- (PXPlacesMapFetchResultController)mapFetchResultsController;
- (PXPlacesMapModeController)mapModeController;
- (PXPlacesMapOptionsController)mapOptionsController;
- (PXSimpleIndexPath)sectionIndexPath;
- (UIViewController)presentingViewController;
- (void)_fetchAssetResultsForMap;
- (void)_updateConfigurationView;
- (void)appearStateDidChangeForSingleViewLayout:(id)a3;
- (void)setInitialLocation:(id)a3;
- (void)setMapOptionsController:(id)a3;
- (void)setSelectionDelegate:(id)a3;
@end

@implementation PXPhotosMapLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialLocation, 0);
  objc_storeStrong((id *)&self->_mapOptionsController, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_mapModeController, 0);
  objc_storeStrong((id *)&self->_mapController, 0);
  objc_storeStrong((id *)&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_mapFetchResultsController, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setInitialLocation:(id)a3
{
}

- (CLLocation)initialLocation
{
  return self->_initialLocation;
}

- (void)setMapOptionsController:(id)a3
{
}

- (PXPlacesMapOptionsController)mapOptionsController
{
  return self->_mapOptionsController;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (PXPlacesMapModeController)mapModeController
{
  return self->_mapModeController;
}

- (PXPlacesMapController)mapController
{
  return self->_mapController;
}

- (PXPhotosMapSelectionHandler)selectionHandler
{
  return self->_selectionHandler;
}

- (PXPlacesMapFetchResultController)mapFetchResultsController
{
  return self->_mapFetchResultsController;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  long long v3 = *(_OWORD *)&self[33].dataSourceIdentifier;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[32].item;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (void)_fetchAssetResultsForMap
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v3 = [(PXPhotosMapLayout *)self viewModel];
  v4 = [v3 currentDataSource];

  v5 = (void *)[v4 identifier];
  [(PXPhotosMapLayout *)self sectionIndexPath];
  location[0] = v5;
  location[1] = v14;
  int64x2_t v16 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v6 = [v4 assetsInSectionIndexPath:location];
  if (!v6) {
    PXAssertGetLog();
  }
  v7 = [(PXPhotosMapLayout *)self mapFetchResultsController];
  objc_initWeak(location, v7);

  v8 = [(PXPhotosMapLayout *)self initialLocation];
  BOOL v9 = v8 == 0;

  id WeakRetained = objc_loadWeakRetained(location);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke;
  v11[3] = &unk_1E5DD0EE8;
  objc_copyWeak(&v12, location);
  BOOL v13 = v9;
  [WeakRetained loadFetchResult:v6 withCompletion:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(location);
}

void __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke_2;
  v4[3] = &unk_1E5DD0EE8;
  objc_copyWeak(&v5, v2);
  char v6 = *(unsigned char *)(a1 + 40);
  [WeakRetained reloadContentModeWithCompletion:v4];

  objc_destroyWeak(&v5);
}

void __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke_3;
  v4[3] = &unk_1E5DD0EE8;
  char v6 = *(unsigned char *)(a1 + 40);
  objc_copyWeak(&v5, v2);
  [WeakRetained resumeWithCompletion:v4];

  objc_destroyWeak(&v5);
}

void __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke_3(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke_4;
  v1[3] = &unk_1E5DD0EE8;
  char v3 = *(unsigned char *)(a1 + 40);
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], v1);
  objc_destroyWeak(&v2);
}

void __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained focusOnProvidedAssetsAnimated:0];
  }
}

- (void)_updateConfigurationView
{
  id v18 = [(PXPlacesMapFetchResultController *)self->_mapFetchResultsController mapView];
  v4 = [(PXPhotosMapLayout *)self mapOptionsController];
  uint64_t v5 = [v4 perspectiveButtonState];

  char v6 = [(PXPhotosMapLayout *)self mapOptionsController];
  uint64_t v7 = [v6 mapStyle];

  v8 = [(PXPhotosMapLayout *)self mapOptionsController];
  uint64_t v9 = [v8 enableUserTrackingButton];

  v10 = [PXPhotosMapContainerViewConfiguration alloc];
  v11 = [(PXPhotosMapLayout *)self mapOptionsController];
  id v12 = [(PXPhotosMapContainerViewConfiguration *)v10 initWithMapView:v18 mapOptionsViewDelegate:v11 enableUserTrackingButton:v9 perspectiveButtonState:v5 mapStyle:v7];

  BOOL v13 = [(PXGSingleViewLayout *)self contentView];
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = (objc_class *)objc_opt_class();
      int64x2_t v16 = NSStringFromClass(v15);
      uint64_t v17 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
      [v14 handleFailureInMethod:a2, self, @"PXPhotosMapLayout.m", 133, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.contentView", v16, v17 object file lineNumber description];
    }
  }
  [v13 updateWithConfiguration:v12];
}

- (void)appearStateDidChangeForSingleViewLayout:(id)a3
{
  uint64_t v4 = [a3 appearState];
  if (v4 == 1)
  {
    [(PXPhotosMapLayout *)self _fetchAssetResultsForMap];
  }
  else if (!v4)
  {
    id v6 = [(PXPhotosMapLayout *)self mapController];
    uint64_t v5 = [v6 mapView];
    [v5 deselectAllAnnotationsAnimated:0];
  }
}

- (CGSize)singleViewLayout:(id)a3 desiredSizeForReferenceSize:(CGSize)a4
{
  double height = a4.height;
  CGFloat width = a4.width;
  [a3 safeAreaInsets];
  double v8 = height - v7;
  uint64_t v9 = [(PXPhotosMapLayout *)self viewModel];
  [v9 headerTitleTopInset];
  double v11 = v8 - v10;

  double v12 = width;
  double v13 = v11;
  result.double height = v13;
  result.CGFloat width = v12;
  return result;
}

- (PXPlacesMapControllerSelectionDelegate)selectionDelegate
{
  id v2 = [(PXPhotosMapLayout *)self mapFetchResultsController];
  char v3 = [v2 mapController];
  uint64_t v4 = [v3 selectionDelegate];

  return (PXPlacesMapControllerSelectionDelegate *)v4;
}

- (void)setSelectionDelegate:(id)a3
{
  id v4 = a3;
  id v6 = [(PXPhotosMapLayout *)self mapFetchResultsController];
  uint64_t v5 = [v6 mapController];
  [v5 setSelectionDelegate:v4];
}

- (PXPhotosMapLayout)initWithViewModel:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4 traitCollection:(id)a5 presentingViewController:(id)a6 initialLocation:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v54.receiver = self;
  v54.super_class = (Class)PXPhotosMapLayout;
  uint64_t v17 = [(PXGSingleViewLayout *)&v54 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_viewModel, a3);
    long long v19 = *(_OWORD *)&a4->item;
    *(_OWORD *)&v18->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a4->dataSourceIdentifier;
    *(_OWORD *)&v18->_sectionIndexPath.item = v19;
    objc_storeWeak((id *)&v18->_presentingViewController, v15);
    objc_storeStrong((id *)&v18->_initialLocation, a7);
    v20 = objc_alloc_init(PXPhotosMapContainerView);
    [(PXGSingleViewLayout *)v18 setContentView:v20];

    [(PXGSingleViewLayout *)v18 setStyle:2];
    [(PXGSingleViewLayout *)v18 setDelegate:v18];
    v21 = objc_alloc_init(PXPlacesMapController);
    mapController = v18->_mapController;
    v18->_mapController = v21;

    v23 = [[PXPhotosMapControllerAccessor alloc] initWithMapController:v18->_mapController traitCollection:v14 mapViewController:0];
    v24 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v25 = [PXPlacesMapFetchResultController alloc];
    id v53 = v13;
    v26 = [v13 libraryFilterState];
    uint64_t v27 = [(PXPlacesMapFetchResultController *)v25 initWithMapControllerAccessor:v23 libraryFilterState:v26 photoLibrary:v24];
    mapFetchResultsController = v18->_mapFetchResultsController;
    v18->_mapFetchResultsController = (PXPlacesMapFetchResultController *)v27;

    [(PXPlacesMapFetchResultController *)v18->_mapFetchResultsController setContentMode:1];
    v29 = [(PXPhotosMapLayout *)v18 initialLocation];

    if (v29)
    {
      v30 = +[PXLemonadeSettings sharedInstance];
      [v30 mapLensAnchorFocusKilometerRadius];

      v31 = [(PXPhotosMapLayout *)v18 initialLocation];
      double v32 = MEMORY[0x1AD109A20]([v31 coordinate]);
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;

      v39 = [(PXPlacesMapFetchResultController *)v18->_mapFetchResultsController mapController];
      objc_msgSend(v39, "setInitialCoordinateRegion:", v32, v34, v36, v38);
    }
    [(PXPlacesMapFetchResultController *)v18->_mapFetchResultsController preloadMap];
    v40 = [(PXPlacesMapFetchResultController *)v18->_mapFetchResultsController mapView];
    v41 = [[PXPlacesMapModeController alloc] initWithMapView:v40 prefersRealisticElevationStyle:1];
    mapModeController = v18->_mapModeController;
    v18->_mapModeController = v41;

    v43 = [PXPlacesMapOptionsController alloc];
    v44 = [(PXPhotosMapLayout *)v18 mapModeController];
    v45 = [(PXPhotosMapLayout *)v18 mapFetchResultsController];
    v46 = +[PXPlacesLocationAuthorizationMonitor sharedInstance];
    uint64_t v47 = [(PXPlacesMapOptionsController *)v43 initWithMapModeController:v44 mapFetchResultController:v45 locationAuthorizationMonitor:v46];
    mapOptionsController = v18->_mapOptionsController;
    v18->_mapOptionsController = (PXPlacesMapOptionsController *)v47;

    [(PXPlacesMapOptionsController *)v18->_mapOptionsController setDelegate:v18];
    v49 = [(PXPhotosMapLayout *)v18 viewModel];
    if ([v49 scrollingBehavior] == 2) {
      uint64_t v50 = 2;
    }
    else {
      uint64_t v50 = 1;
    }
    [v40 setPanningGestureMinimumNumberOfTouches:v50];

    [(PXPhotosMapLayout *)v18 _updateConfigurationView];
    id v16 = v52;
    id v13 = v53;
  }

  return v18;
}

@end