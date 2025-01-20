@interface PXPlacesMapFetchResultViewController
- (BOOL)autoRefocusOnDataChange;
- (BOOL)canEditLocation;
- (BOOL)enableNearbyAssetsAffordance;
- (BOOL)pu_shouldOptOutFromChromelessBars;
- (BOOL)showNavigationBar;
- (BOOL)wantsMapOptionsView;
- (PXMapOptionsView)mapOptionsView;
- (PXPhotoKitAssetsDataSourceManager)oneUpDataSourceManager;
- (PXPlacesAssetsSelectionDelegate)assetSelectionDelegate;
- (PXPlacesGeotaggable)selectedGeotaggable;
- (PXPlacesMapBarButtonsDelegate)barButtonsDelegate;
- (PXPlacesMapFetchResultController)mapFetchResultsController;
- (PXPlacesMapFetchResultViewController)init;
- (PXPlacesMapFetchResultViewController)initWithCoder:(id)a3;
- (PXPlacesMapFetchResultViewController)initWithInitialCenterCoordinate:(CLLocationCoordinate2D)a3 enableNearbyAssetsAffordance:(BOOL)a4 wantsMapOptionsView:(BOOL)a5 photoLibrary:(id)a6 mapFetchResultController:(id)a7;
- (PXPlacesMapFetchResultViewController)initWithInitialCoordinateRegion:(id *)a3 enableNearbyAssetsAffordance:(BOOL)a4 wantsMapOptionsView:(BOOL)a5 photoLibrary:(id)a6 mapFetchResultController:(id)a7;
- (PXPlacesMapFetchResultViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXPlacesMapLocationEditDelegate)editLocationDelegate;
- (PXPlacesMapOptionsController)mapOptionsController;
- (PXPlacesMapThumbnailLocationCurator)thumbnailLocationCurator;
- (UIBarButtonItem)filterAssetsBtn;
- (UIViewController)pxOneUpPresentationViewController;
- (id)_fetchHydratedAssetForPlacesAsset:(id)a3;
- (id)dataSourceForAssets:(id)a3;
- (id)oneUpPresentationInitialAssetReference:(id)a3;
- (id)oneUpPresentationMediaProvider:(id)a3;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (unint64_t)style;
- (void)_placeToolbarItems:(id)a3;
- (void)_reloadContentModeDisplay:(unint64_t)a3;
- (void)_selectedGeotaggables:(id)a3;
- (void)_setupMapModeControlsOverlay;
- (void)_updateMapOptionsView;
- (void)dataSourceDidChange:(id)a3;
- (void)dealloc;
- (void)didSelectGeotaggableItems:(id)a3 fromMapView:(id)a4;
- (void)loadView;
- (void)ppt_performPlacesScrollTest:(id)a3 iterations:(int64_t)a4 screenDelta:(int64_t)a5 delay:(double)a6 completion:(id)a7;
- (void)ppt_performPlacesZoomTest:(id)a3 iterations:(int64_t)a4 delay:(double)a5 completion:(id)a6;
- (void)setAssetSelectionDelegate:(id)a3;
- (void)setAutoRefocusOnDataChange:(BOOL)a3;
- (void)setBarButtonsDelegate:(id)a3;
- (void)setCanEditLocation:(BOOL)a3;
- (void)setEditLocationDelegate:(id)a3;
- (void)setFilterAssetsBtn:(id)a3;
- (void)setMapOptionsController:(id)a3;
- (void)setMapOptionsView:(id)a3;
- (void)setOneUpDataSourceManager:(id)a3;
- (void)setPxOneUpPresentationViewController:(id)a3;
- (void)setSelectedGeotaggable:(id)a3;
- (void)setShowNavigationBar:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setThumbnailLocationCurator:(id)a3;
- (void)tapFilterAssetsBtn:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXPlacesMapFetchResultViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapOptionsController, 0);
  objc_storeStrong((id *)&self->_mapOptionsView, 0);
  objc_storeStrong((id *)&self->_thumbnailLocationCurator, 0);
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_storeStrong((id *)&self->_filterAssetsBtn, 0);
  objc_storeStrong((id *)&self->_selectedGeotaggable, 0);
  objc_destroyWeak((id *)&self->_pxOneUpPresentationViewController);
  objc_destroyWeak((id *)&self->_editLocationDelegate);
  objc_destroyWeak((id *)&self->_barButtonsDelegate);
  objc_destroyWeak((id *)&self->_assetSelectionDelegate);
  objc_storeStrong((id *)&self->_mapFetchResultsController, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setMapOptionsController:(id)a3
{
}

- (PXPlacesMapOptionsController)mapOptionsController
{
  return self->_mapOptionsController;
}

- (void)setMapOptionsView:(id)a3
{
}

- (PXMapOptionsView)mapOptionsView
{
  return self->_mapOptionsView;
}

- (BOOL)wantsMapOptionsView
{
  return self->_wantsMapOptionsView;
}

- (BOOL)enableNearbyAssetsAffordance
{
  return self->_enableNearbyAssetsAffordance;
}

- (void)setThumbnailLocationCurator:(id)a3
{
}

- (PXPlacesMapThumbnailLocationCurator)thumbnailLocationCurator
{
  return self->_thumbnailLocationCurator;
}

- (void)setOneUpDataSourceManager:(id)a3
{
}

- (PXPhotoKitAssetsDataSourceManager)oneUpDataSourceManager
{
  return self->_oneUpDataSourceManager;
}

- (void)setFilterAssetsBtn:(id)a3
{
}

- (void)setSelectedGeotaggable:(id)a3
{
}

- (PXPlacesGeotaggable)selectedGeotaggable
{
  return (PXPlacesGeotaggable *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setAutoRefocusOnDataChange:(BOOL)a3
{
  self->_autoRefocusOnDataChange = a3;
}

- (BOOL)autoRefocusOnDataChange
{
  return self->_autoRefocusOnDataChange;
}

- (void)setCanEditLocation:(BOOL)a3
{
  self->_canEditLocation = a3;
}

- (BOOL)canEditLocation
{
  return self->_canEditLocation;
}

- (BOOL)showNavigationBar
{
  return self->_showNavigationBar;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setPxOneUpPresentationViewController:(id)a3
{
}

- (UIViewController)pxOneUpPresentationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pxOneUpPresentationViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setEditLocationDelegate:(id)a3
{
}

- (PXPlacesMapLocationEditDelegate)editLocationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editLocationDelegate);
  return (PXPlacesMapLocationEditDelegate *)WeakRetained;
}

- (void)setBarButtonsDelegate:(id)a3
{
}

- (PXPlacesMapBarButtonsDelegate)barButtonsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barButtonsDelegate);
  return (PXPlacesMapBarButtonsDelegate *)WeakRetained;
}

- (void)setAssetSelectionDelegate:(id)a3
{
}

- (PXPlacesAssetsSelectionDelegate)assetSelectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetSelectionDelegate);
  return (PXPlacesAssetsSelectionDelegate *)WeakRetained;
}

- (PXPlacesMapFetchResultController)mapFetchResultsController
{
  return self->_mapFetchResultsController;
}

- (void)ppt_performPlacesZoomTest:(id)a3 iterations:(int64_t)a4 delay:(double)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = [(PXPlacesMapFetchResultViewController *)self mapFetchResultsController];
  id v13 = [v12 mapView];

  objc_msgSend(v13, "ppt_performPlacesZoomTest:iterations:delay:completion:", v11, a4, v10, a5);
}

- (void)ppt_performPlacesScrollTest:(id)a3 iterations:(int64_t)a4 screenDelta:(int64_t)a5 delay:(double)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  v14 = [(PXPlacesMapFetchResultViewController *)self mapFetchResultsController];
  id v15 = [v14 mapView];

  objc_msgSend(v15, "ppt_performPlacesScrollTest:iterations:screenDelta:delay:completion:", v13, a4, a5, v12, a6);
}

- (void)_updateMapOptionsView
{
  if ([(PXPlacesMapFetchResultViewController *)self wantsMapOptionsView])
  {
    v3 = [(PXPlacesMapFetchResultViewController *)self mapOptionsView];
    v4 = [(PXPlacesMapFetchResultViewController *)self mapOptionsController];
    objc_msgSend(v3, "setPerspectiveButtonState:animated:", objc_msgSend(v4, "perspectiveButtonState"), 1);

    v5 = [(PXPlacesMapFetchResultViewController *)self mapOptionsController];
    uint64_t v6 = [v5 mapStyle];
    v7 = [(PXPlacesMapFetchResultViewController *)self mapOptionsView];
    [v7 setMapStyle:v6];

    id v10 = [(PXPlacesMapFetchResultViewController *)self mapOptionsController];
    uint64_t v8 = [v10 enableUserTrackingButton];
    v9 = [(PXPlacesMapFetchResultViewController *)self mapOptionsView];
    [v9 setEnableUserTrackingButton:v8];
  }
}

- (BOOL)pu_shouldOptOutFromChromelessBars
{
  return 0;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  v3 = [(PXPlacesMapFetchResultViewController *)self oneUpDataSourceManager];
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
  v3 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  return v3;
}

- (void)didSelectGeotaggableItems:(id)a3 fromMapView:(id)a4
{
  id v5 = [a3 set];
  [(PXPlacesMapFetchResultViewController *)self _selectedGeotaggables:v5];
}

- (void)dataSourceDidChange:(id)a3
{
  if ([(PXPlacesMapFetchResultViewController *)self autoRefocusOnDataChange])
  {
    v4 = [(PXPlacesMapFetchResultViewController *)self mapFetchResultsController];
    id v5 = [v4 mapController];
    int v6 = [v5 mapViewIsVisible];

    if (v6)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__PXPlacesMapFetchResultViewController_dataSourceDidChange___block_invoke;
      block[3] = &unk_1E5DD36F8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __60__PXPlacesMapFetchResultViewController_dataSourceDidChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mapFetchResultsController];
  [v1 focusOnGeotaggablesAnimated:1];
}

- (id)dataSourceForAssets:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  PXMap();
}

uint64_t __60__PXPlacesMapFetchResultViewController_dataSourceForAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (id)_fetchHydratedAssetForPlacesAsset:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28F60];
  v14[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  int v6 = [v4 arrayWithObjects:v14 count:1];
  v7 = [v3 predicateWithFormat:@"SELF in %@", v6];

  uint64_t v8 = [v5 photoLibrary];
  v9 = [v8 librarySpecificFetchOptions];

  [v9 setPredicate:v7];
  id v10 = objc_msgSend(MEMORY[0x1E4F390A0], "px_placesFetchOptionsWith:", v9);

  id v11 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v10];

  if ([v11 count])
  {
    id v12 = [v11 firstObject];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_selectedGeotaggables:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    if ([v5 count] == 1)
    {
      int v6 = [v5 allObjects];
      v7 = [v6 firstObject];

      uint64_t v8 = [(PXPlacesMapFetchResultViewController *)self _fetchHydratedAssetForPlacesAsset:v7];
      [(PXPlacesMapFetchResultViewController *)self setSelectedGeotaggable:v8];

      v9 = [(PXPlacesMapFetchResultViewController *)self selectedGeotaggable];

      if (v9)
      {
        id v10 = self;
        id v11 = [(PXPlacesMapFetchResultViewController *)v10 pxOneUpPresentationViewController];

        id v12 = v10;
        if (v11)
        {
          id v12 = [(PXPlacesMapFetchResultViewController *)v10 pxOneUpPresentationViewController];
        }
        objc_msgSend(v12, "px_enableOneUpPresentation");
        id v13 = objc_msgSend(v12, "px_oneUpPresentation");
        v14 = [(PXPlacesMapFetchResultViewController *)v10 selectedGeotaggable];
        v36[0] = v14;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
        v16 = [(PXPlacesMapFetchResultViewController *)v10 dataSourceForAssets:v15];

        v17 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v16];
        [(PXPlacesMapFetchResultViewController *)v10 setOneUpDataSourceManager:v17];

        [v13 setDelegate:v10];
        [v13 startWithConfigurationHandler:0];
      }
      goto LABEL_19;
    }
    v18 = [v5 anyObject];
    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_9;
      }
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      v28 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v28);
      v29 = objc_msgSend(v18, "px_descriptionForAssertionMessage");
      [v25 handleFailureInMethod:a2, self, @"PXPlacesMapFetchResultViewController.m", 378, @"%@ should be an instance inheriting from %@, but it is %@", @"selectedGeotaggables.anyObject", v27, v29 object file lineNumber description];
    }
    else
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      [v25 handleFailureInMethod:a2, self, @"PXPlacesMapFetchResultViewController.m", 378, @"%@ should be an instance inheriting from %@, but it is nil", @"selectedGeotaggables.anyObject", v27 object file lineNumber description];
    }

LABEL_9:
    v7 = [v18 photoLibrary];

    if (!v7)
    {
      v23 = PLUIGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_ERROR, "Missing photoLibrary to show selectedGeotaggables", buf, 2u);
      }

      v7 = 0;
      goto LABEL_19;
    }
    v19 = +[PXLemonadeSettings sharedInstance];
    int v20 = [v19 presentZoomableGridFromMapCluster];

    if (!v20)
    {
      v22 = PXPhotosViewConfigurationForPlacesMomentsWithAllowedAssets(v5, v7);
      PXLocalizedStringFromTable(@"PXPlacesFullSizeViewTitle", @"PhotosUICore");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      [v22 setTitle:v21];
      goto LABEL_18;
    }
    id v21 = v5;
    if (v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_13:
        v22 = PXPhotosViewConfigurationForPlacesGridWithAssetSet(v21, v7);
LABEL_18:

        [v22 setOneUpPresentationOrigin:7];
        v24 = +[PXLemonadeDetailsViewFactory makeDetailsViewControllerWithPhotosViewConfiguration:v22];
        [(PXPlacesMapFetchResultViewController *)self presentViewController:v24 animated:1 completion:0];

LABEL_19:
        goto LABEL_20;
      }
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v33 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v33);
      v34 = objc_msgSend(v21, "px_descriptionForAssertionMessage");
      [v30 handleFailureInMethod:a2, self, @"PXPlacesMapFetchResultViewController.m", 383, @"%@ should be an instance inheriting from %@, but it is %@", @"selectedGeotaggables", v32, v34 object file lineNumber description];
    }
    else
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      [v30 handleFailureInMethod:a2, self, @"PXPlacesMapFetchResultViewController.m", 383, @"%@ should be an instance inheriting from %@, but it is nil", @"selectedGeotaggables", v32 object file lineNumber description];
    }

    goto LABEL_13;
  }
LABEL_20:
}

- (void)tapFilterAssetsBtn:(id)a3
{
  v4 = [(PXPlacesMapFetchResultViewController *)self mapFetchResultsController];
  uint64_t v5 = [v4 contentMode];

  [(PXPlacesMapFetchResultViewController *)self _reloadContentModeDisplay:v5 == 0];
  id v6 = [(PXPlacesMapFetchResultViewController *)self mapFetchResultsController];
  [v6 setContentMode:v5 == 0];
  [v6 reloadContentModeWithCompletion:0];
}

- (void)_reloadContentModeDisplay:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v5 = [(PXPlacesMapFetchResultViewController *)self filterAssetsBtn];
    id v3 = @"PXPlacesShowNearbyAssets";
  }
  else
  {
    if (a3) {
      return;
    }
    id v5 = [(PXPlacesMapFetchResultViewController *)self filterAssetsBtn];
    id v3 = @"PXPlacesHideNearbyAssets";
  }
  v4 = PXLocalizedStringFromTable(v3, @"PhotosUICore");
  [v5 setTitle:v4];
}

- (void)_placeToolbarItems:(id)a3
{
  id v6 = a3;
  v4 = [(PXPlacesMapFetchResultViewController *)self barButtonsDelegate];

  if (v4)
  {
    id v5 = [(PXPlacesMapFetchResultViewController *)self barButtonsDelegate];
    [v5 setToolbarButtons:v6];
  }
  else
  {
    [(PXPlacesMapFetchResultViewController *)self setToolbarItems:v6];
  }
}

- (void)setShowNavigationBar:(BOOL)a3
{
  if (self->_showNavigationBar != a3)
  {
    self->_showNavigationBar = a3;
    v4 = [(UIViewController *)self px_barAppearance];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__PXPlacesMapFetchResultViewController_setShowNavigationBar___block_invoke;
    v5[3] = &unk_1E5DBCB30;
    v5[4] = self;
    [v4 performChangesWithAnimationOptions:0 changes:v5];
  }
}

void __61__PXPlacesMapFetchResultViewController_setShowNavigationBar___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setPrefersNavigationBarVisible:", objc_msgSend(v2, "showNavigationBar"));
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(PXPlacesMapFetchResultViewController *)self reloadStyle];
  }
}

- (UIBarButtonItem)filterAssetsBtn
{
  filterAssetsBtn = self->_filterAssetsBtn;
  if (!filterAssetsBtn)
  {
    v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:0 style:0 target:self action:sel_tapFilterAssetsBtn_];
    id v5 = self->_filterAssetsBtn;
    self->_filterAssetsBtn = v4;

    filterAssetsBtn = self->_filterAssetsBtn;
  }
  return filterAssetsBtn;
}

- (void)_setupMapModeControlsOverlay
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(PXPlacesMapFetchResultViewController *)self mapFetchResultsController];
  uint64_t v4 = [v3 mapView];

  v35 = (void *)v4;
  v36 = [[PXPlacesMapModeController alloc] initWithMapView:v4 prefersRealisticElevationStyle:1];
  id v5 = [PXPlacesMapOptionsController alloc];
  id v6 = [(PXPlacesMapFetchResultViewController *)self mapFetchResultsController];
  v7 = +[PXPlacesLocationAuthorizationMonitor sharedInstance];
  uint64_t v8 = [(PXPlacesMapOptionsController *)v5 initWithMapModeController:v36 mapFetchResultController:v6 locationAuthorizationMonitor:v7];
  [(PXPlacesMapFetchResultViewController *)self setMapOptionsController:v8];

  v34 = [(PXPlacesMapFetchResultViewController *)self mapOptionsController];
  [v34 setDelegate:self];
  v9 = [[PXMapOptionsView alloc] initWithMapView:v4];
  [(PXPlacesMapFetchResultViewController *)self setMapOptionsView:v9];

  id v10 = [(PXPlacesMapFetchResultViewController *)self mapOptionsView];
  [v10 setDelegate:v34];
  [(PXPlacesMapFetchResultViewController *)self _updateMapOptionsView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = [(PXPlacesMapFetchResultViewController *)self view];
  [v11 addSubview:v10];

  v25 = (void *)MEMORY[0x1E4F28DC8];
  v31 = [v10 topAnchor];
  v33 = [(PXPlacesMapFetchResultViewController *)self view];
  v32 = [v33 safeAreaLayoutGuide];
  v30 = [v32 topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:8.0];
  v37[0] = v29;
  v26 = [v10 trailingAnchor];
  v28 = [(PXPlacesMapFetchResultViewController *)self view];
  v27 = [v28 safeAreaLayoutGuide];
  v24 = [v27 trailingAnchor];
  v23 = [v26 constraintEqualToAnchor:v24 constant:-8.0];
  v37[1] = v23;
  id v21 = [v10 leadingAnchor];
  v22 = [(PXPlacesMapFetchResultViewController *)self view];
  id v12 = [v22 safeAreaLayoutGuide];
  id v13 = [v12 leadingAnchor];
  v14 = [v21 constraintGreaterThanOrEqualToAnchor:v13 constant:8.0];
  v37[2] = v14;
  id v15 = [v10 bottomAnchor];
  v16 = [(PXPlacesMapFetchResultViewController *)self view];
  v17 = [v16 safeAreaLayoutGuide];
  v18 = [v17 bottomAnchor];
  v19 = [v15 constraintLessThanOrEqualToAnchor:v18 constant:-8.0];
  v37[3] = v19;
  int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  [v25 activateConstraints:v20];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)PXPlacesMapFetchResultViewController;
  [(PXPlacesMapFetchResultViewController *)&v20 viewDidLoad];
  id v3 = [(PXPlacesMapFetchResultViewController *)self navigationItem];
  uint64_t v4 = PXLocalizedStringFromTable(@"PXPlacesWidgetTitle", @"PhotosUICore");
  [v3 setTitle:v4];

  id v5 = PXLocalizedStringFromTable(@"PXPlacesFullSizeViewTitle", @"PhotosUICore");
  [(PXPlacesMapFetchResultViewController *)self setTitle:v5];

  id v6 = [(PXPlacesMapFetchResultViewController *)self view];
  v7 = [(PXPlacesMapFetchResultViewController *)self mapFetchResultsController];
  uint64_t v8 = [v7 mapControllerAccessor];
  v9 = [v8 mapViewController];

  id v10 = [v9 view];
  [v6 bounds];
  objc_msgSend(v10, "setFrame:");
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 addSubview:v10];
  id v11 = _NSDictionaryOfVariableBindings(&cfstr_Mapcontainervi.isa, v10, 0);
  id v12 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[mapContainerView]|" options:0 metrics:0 views:v11];
  [v6 addConstraints:v12];

  id v13 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[mapContainerView]|" options:0 metrics:0 views:v11];
  [v6 addConstraints:v13];

  if ([(PXPlacesMapFetchResultViewController *)self wantsMapOptionsView]) {
    [(PXPlacesMapFetchResultViewController *)self _setupMapModeControlsOverlay];
  }
  [v9 didMoveToParentViewController:self];
  [(PXPlacesMapFetchResultViewController *)self reloadStyle];
  objc_initWeak(&location, self);
  v14 = [(PXPlacesMapFetchResultViewController *)self mapFetchResultsController];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke;
  v16[3] = &unk_1E5DD20C8;
  id v15 = v14;
  id v17 = v15;
  objc_copyWeak(&v18, &location);
  [v15 reloadContentModeWithCompletion:v16];
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke_2;
  v3[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  [v2 resumeWithCompletion:v3];

  objc_destroyWeak(&v5);
}

void __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke_3;
  v2[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained style];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 focusOnProvidedAssetsAnimated:0];
  }
}

- (void)loadView
{
  uint64_t v3 = [(PXPlacesMapFetchResultViewController *)self nibName];

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PXPlacesMapFetchResultViewController;
    [(PXPlacesMapFetchResultViewController *)&v6 loadView];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v4 = [MEMORY[0x1E4FB1618] whiteColor];
    [v5 setBackgroundColor:v4];

    [(PXPlacesMapFetchResultViewController *)self setView:v5];
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PXPlacesMapFetchResultViewController;
  [(PXPlacesMapFetchResultViewController *)&v4 dealloc];
}

- (PXPlacesMapFetchResultViewController)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapFetchResultViewController.m", 135, @"%s is not available as initializer", "-[PXPlacesMapFetchResultViewController init]");

  abort();
}

- (PXPlacesMapFetchResultViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapFetchResultViewController.m", 131, @"%s is not available as initializer", "-[PXPlacesMapFetchResultViewController initWithCoder:]");

  abort();
}

- (PXPlacesMapFetchResultViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapFetchResultViewController.m", 127, @"%s is not available as initializer", "-[PXPlacesMapFetchResultViewController initWithNibName:bundle:]");

  abort();
}

- (PXPlacesMapFetchResultViewController)initWithInitialCenterCoordinate:(CLLocationCoordinate2D)a3 enableNearbyAssetsAffordance:(BOOL)a4 wantsMapOptionsView:(BOOL)a5 photoLibrary:(id)a6 mapFetchResultController:(id)a7
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v9 = -[PXPlacesMapFetchResultViewController initWithInitialCoordinateRegion:enableNearbyAssetsAffordance:wantsMapOptionsView:photoLibrary:mapFetchResultController:](self, "initWithInitialCoordinateRegion:enableNearbyAssetsAffordance:wantsMapOptionsView:photoLibrary:mapFetchResultController:", a4, a5, a6, a7, *MEMORY[0x1E4F30D30], *(double *)(MEMORY[0x1E4F30D30] + 8), *(double *)(MEMORY[0x1E4F30D30] + 16), *(double *)(MEMORY[0x1E4F30D30] + 24));
  id v10 = [(PXPlacesMapFetchResultController *)v9->_mapFetchResultsController mapController];
  objc_msgSend(v10, "setInitialCenterCoordinate:", latitude, longitude);

  return v9;
}

- (PXPlacesMapFetchResultViewController)initWithInitialCoordinateRegion:(id *)a3 enableNearbyAssetsAffordance:(BOOL)a4 wantsMapOptionsView:(BOOL)a5 photoLibrary:(id)a6 mapFetchResultController:(id)a7
{
  BOOL v12 = a5;
  char v14 = (char)a3;
  double v15 = v10;
  double v16 = v9;
  double v17 = v8;
  double v18 = v7;
  id v21 = (id)a5;
  id v22 = a6;
  if (!v21)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PXPlacesMapFetchResultViewController.m", 89, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v35.receiver = self;
  v35.super_class = (Class)PXPlacesMapFetchResultViewController;
  v23 = [(PXPlacesMapFetchResultViewController *)&v35 initWithNibName:0 bundle:0];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_photoLibrary, (id)v12);
    v24->_style = 0;
    v24->_enableNearbyAssetsAffordance = v14;
    v24->_wantsMapOptionsView = a4;
    objc_storeStrong((id *)&v24->_mapFetchResultsController, a6);
    v24->_showNavigationBar = 1;
    v25 = [v22 mapControllerAccessor];
    v26 = [v25 mapViewController];
    [(PXPlacesMapFetchResultViewController *)v24 addChildViewController:v26];

    v27 = [(PXPlacesMapFetchResultController *)v24->_mapFetchResultsController mapController];
    [v27 setChangeDelegate:v24];

    v28 = [(PXPlacesMapFetchResultController *)v24->_mapFetchResultsController mapController];
    [v28 setSelectionDelegate:v24];

    v29 = [(PXPlacesMapFetchResultController *)v24->_mapFetchResultsController mapController];
    objc_msgSend(v29, "setInitialCoordinateRegion:", v18, v17, v16, v15);

    v30 = objc_alloc_init(PXPlacesMapThumbnailLocationCurator);
    thumbnailLocationCurator = v24->_thumbnailLocationCurator;
    v24->_thumbnailLocationCurator = v30;

    v32 = [(PXPlacesMapFetchResultViewController *)v24 thumbnailLocationCurator];
    [(PXPlacesMapFetchResultController *)v24->_mapFetchResultsController setThumbnailCurationDelegate:v32];
  }
  return v24;
}

@end