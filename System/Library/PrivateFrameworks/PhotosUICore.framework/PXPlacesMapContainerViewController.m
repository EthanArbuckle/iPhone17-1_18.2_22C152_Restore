@interface PXPlacesMapContainerViewController
- (BOOL)gridControllerEditing;
- (BOOL)pu_shouldOptOutFromChromelessBars;
- (NSArray)initialLeftBarButtonItems;
- (PHPhotoLibrary)photoLibrary;
- (PXPlacesMapContainerConfiguration)configuration;
- (PXPlacesMapContainerViewController)init;
- (PXPlacesMapContainerViewController)initWithCoder:(id)a3;
- (PXPlacesMapContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXPlacesMapContainerViewController)initWithPhotoLibrary:(id)a3 configuration:(id)a4;
- (PXPlacesMapFetchResultViewController)fetchResultViewController;
- (UISegmentedControl)subviewControl;
- (id)px_navigationDestination;
- (int64_t)initialNavigationBarStyle;
- (unint64_t)previousNavigationBarSegmentedControlSelectedIndex;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (void)_resetNavigationItem;
- (void)_switchToLegacyGridController;
- (void)_switchToMapController;
- (void)_updateNavigationItemTitleWithConfigurationIfPossible;
- (void)_updateShouldOptOutFromChromelessBars;
- (void)legacyStrategyForHandleViewController:(id)a3 didUpdateBarsAnimated:(BOOL)a4 isSelecting:(BOOL)a5;
- (void)loadView;
- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)setGridControllerEditing:(BOOL)a3;
- (void)setInitialLeftBarButtonItems:(id)a3;
- (void)setInitialNavigationBarStyle:(int64_t)a3;
- (void)setNavigationBarButtons:(id)a3;
- (void)setPreviousNavigationBarSegmentedControlSelectedIndex:(unint64_t)a3;
- (void)setSubviewControl:(id)a3;
- (void)subviewControlChanged:(id)a3;
- (void)viewControllerDidUpdateNavigationItemAppearance:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PXPlacesMapContainerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_initialLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_subviewControl, 0);
  objc_storeStrong((id *)&self->_fetchResultViewController, 0);
  objc_storeStrong((id *)&self->_px_navigationDestination, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setInitialLeftBarButtonItems:(id)a3
{
}

- (NSArray)initialLeftBarButtonItems
{
  return self->_initialLeftBarButtonItems;
}

- (PXPlacesMapContainerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setInitialNavigationBarStyle:(int64_t)a3
{
  self->_initialNavigationBarStyle = a3;
}

- (int64_t)initialNavigationBarStyle
{
  return self->_initialNavigationBarStyle;
}

- (void)setGridControllerEditing:(BOOL)a3
{
  self->_gridControllerEditing = a3;
}

- (BOOL)gridControllerEditing
{
  return self->_gridControllerEditing;
}

- (void)setSubviewControl:(id)a3
{
}

- (UISegmentedControl)subviewControl
{
  return self->_subviewControl;
}

- (void)setPreviousNavigationBarSegmentedControlSelectedIndex:(unint64_t)a3
{
  self->_previousNavigationBarSegmentedControlSelectedIndex = a3;
}

- (unint64_t)previousNavigationBarSegmentedControlSelectedIndex
{
  return self->_previousNavigationBarSegmentedControlSelectedIndex;
}

- (PXPlacesMapFetchResultViewController)fetchResultViewController
{
  return self->_fetchResultViewController;
}

- (id)px_navigationDestination
{
  px_navigationDestination = self->_px_navigationDestination;
  if (!px_navigationDestination)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v5 = objc_msgSend(v4, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000203);
    v6 = [[PXProgrammaticNavigationDestination alloc] initWithObject:v5 revealMode:0];
    v7 = self->_px_navigationDestination;
    self->_px_navigationDestination = v6;

    px_navigationDestination = self->_px_navigationDestination;
  }
  return px_navigationDestination;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v15 = (void (**)(id, uint64_t, void))a5;
  id v7 = a3;
  unint64_t v8 = [(PXPlacesMapContainerViewController *)self routingOptionsForDestination:v7];
  v9 = [v7 sidebarBackNavigationRootDestination];

  v10 = [v9 collection];
  int v11 = objc_msgSend(v10, "px_isPlacesSmartAlbum");

  if (v11)
  {
    v12 = [(PXPlacesMapContainerViewController *)self navigationItem];
    objc_msgSend(v12, "px_setHidesBackButtonInRegularWidth:", 1);
    v13 = [(PXPlacesMapContainerViewController *)self traitCollection];
    objc_msgSend(v12, "px_updateBackButtonVisibilityForTraitCollection:", v13);
  }
  if (v8 == 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 2;
  }
  v15[2](v15, v14, 0);
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 8)
  {
    v4 = [v3 collection];
    unint64_t v5 = objc_msgSend(v4, "px_isPlacesSmartAlbum");
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)setNavigationBarButtons:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPlacesMapContainerViewController *)self navigationItem];
  [v5 setRightBarButtonItems:v4];
}

- (void)_updateNavigationItemTitleWithConfigurationIfPossible
{
  id v6 = [(PXPlacesMapContainerViewController *)self configuration];
  id v3 = [v6 localizedNavigationItemTitle];
  id v4 = v3;
  if (!v3)
  {
    id v4 = PXLocalizedStringFromTable(@"PXPlacesFullSizeViewTitle", @"PhotosUICore");
  }
  id v5 = [(PXPlacesMapContainerViewController *)self navigationItem];
  [v5 setTitle:v4];

  if (!v3) {
}
  }

- (void)_resetNavigationItem
{
  id v5 = [(PXPlacesMapContainerViewController *)self navigationItem];
  id v3 = [(PXPlacesMapContainerViewController *)self initialLeftBarButtonItems];
  [v5 setLeftBarButtonItems:v3];

  [v5 setRightBarButtonItems:0];
  id v4 = [(PXPlacesMapContainerViewController *)self subviewControl];
  [v5 setTitleView:v4];

  [v5 setStandardAppearance:0];
  [v5 setCompactAppearance:0];
  [v5 setScrollEdgeAppearance:0];
}

- (void)viewControllerDidUpdateNavigationItemAppearance:(id)a3
{
  id v4 = a3;
  id v9 = [(PXPlacesMapContainerViewController *)self navigationItem];
  id v5 = [v4 navigationItem];

  id v6 = [v5 standardAppearance];
  [v9 setStandardAppearance:v6];

  id v7 = [v5 compactAppearance];
  [v9 setCompactAppearance:v7];

  unint64_t v8 = [v5 scrollEdgeAppearance];
  [v9 setScrollEdgeAppearance:v8];
}

- (void)legacyStrategyForHandleViewController:(id)a3 didUpdateBarsAnimated:(BOOL)a4 isSelecting:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v18 = a3;
  unint64_t v8 = [(PXPlacesMapContainerViewController *)self navigationItem];
  id v9 = [v18 navigationItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v10 = [(PXPlacesMapContainerViewController *)self gridControllerEditing];
    [(PXPlacesMapContainerViewController *)self setGridControllerEditing:v5];
    if (v5)
    {
      [v8 setTitleView:0];
      int v11 = [v9 title];
      [v8 setTitle:v11];

      v12 = [v9 leftBarButtonItems];
      [v8 setLeftBarButtonItems:v12 animated:v6];
    }
    else if (v10)
    {
      v15 = [(PXPlacesMapContainerViewController *)self subviewControl];
      [v8 setTitleView:v15];

      [v8 setLeftBarButtonItems:MEMORY[0x1E4F1CBF0] animated:v6];
    }
    v16 = [v9 rightBarButtonItems];
    [v8 setRightBarButtonItems:v16 animated:v6];

    uint64_t v14 = [v18 toolbarItems];
    [(PXPlacesMapContainerViewController *)self setToolbarItems:v14 animated:v6];
  }
  else if (v5)
  {
    [(PXPlacesMapContainerViewController *)self setGridControllerEditing:1];
    [v8 setTitleView:0];
    v13 = [v9 title];
    [v8 setTitle:v13];

    uint64_t v14 = [v9 leftBarButtonItems];
    [v8 setLeftBarButtonItems:v14 animated:v6];
  }
  else
  {
    if ([(PXPlacesMapContainerViewController *)self gridControllerEditing])
    {
      v17 = [(PXPlacesMapContainerViewController *)self subviewControl];
      [v8 setTitleView:v17];
    }
    uint64_t v14 = [v9 rightBarButtonItems];
    [v8 setRightBarButtonItems:v14 animated:v6];
  }
}

- (void)_updateShouldOptOutFromChromelessBars
{
  v2 = self;
  BOOL v3 = [(PXPlacesMapContainerViewController *)self pu_shouldOptOutFromChromelessBars];
  id v4 = [v2 navigationController];
  id v9 = v4;
  if (v3)
  {
    v2 = [v4 navigationBar];
    BOOL v5 = [v2 standardAppearance];
    id v4 = v9;
  }
  else
  {
    BOOL v5 = 0;
  }
  BOOL v6 = [v4 navigationBar];
  [v6 setScrollEdgeAppearance:v5];

  if (v3)
  {

    v2 = [v9 toolbar];
    id v7 = [v2 standardAppearance];
  }
  else
  {
    id v7 = 0;
  }
  unint64_t v8 = [v9 toolbar];
  [v8 setScrollEdgeAppearance:v7];

  if (v3)
  {
  }
}

- (BOOL)pu_shouldOptOutFromChromelessBars
{
  return [(PXPlacesMapContainerViewController *)self previousNavigationBarSegmentedControlSelectedIndex] == 0;
}

- (void)_switchToLegacyGridController
{
  BOOL v3 = [(PXPlacesMapContainerViewController *)self fetchResultViewController];
  id v4 = [v3 mapFetchResultsController];
  id v9 = [v4 visibleGeotaggables];

  BOOL v5 = [(PXPlacesMapContainerViewController *)self photoLibrary];
  BOOL v6 = PXPhotosViewConfigurationForPlacesMomentsWithAllowedAssets(v9, v5);

  id v7 = PXLocalizedStringFromTable(@"PXPlacesFullSizeViewTitle", @"PhotosUICore");
  [v6 setTitle:v7];

  [v6 setWantsTabBarHidden:1];
  [v6 setOneUpPresentationOrigin:7];
  unint64_t v8 = [[PXPhotosUIViewController alloc] initWithConfiguration:v6];
  [(PXPhotosUIViewController *)v8 setContainerViewController:self];
  [(PXPhotosUIViewController *)v8 setGridPresentationBarsUpdateDelegate:self];
  [(PXPlacesMapContainerViewController *)self _resetNavigationItem];
  [(UIViewController *)self px_addOrReplaceChildViewController:v8 activateConstraints:1];
  [(PXPlacesMapContainerViewController *)self _updateShouldOptOutFromChromelessBars];
}

- (void)_switchToMapController
{
  id v3 = [(PXPlacesMapContainerViewController *)self fetchResultViewController];
  [(PXPlacesMapContainerViewController *)self _resetNavigationItem];
  [(UIViewController *)self px_addOrReplaceChildViewController:v3 activateConstraints:1];
  [v3 reloadStyle];
  [(PXPlacesMapContainerViewController *)self _updateShouldOptOutFromChromelessBars];
}

- (void)subviewControlChanged:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v5 selectedSegmentIndex];
    if (v4 != [(PXPlacesMapContainerViewController *)self previousNavigationBarSegmentedControlSelectedIndex])
    {
      [(PXPlacesMapContainerViewController *)self setPreviousNavigationBarSegmentedControlSelectedIndex:v4];
      if (v4 == 1)
      {
        [(PXPlacesMapContainerViewController *)self _switchToLegacyGridController];
      }
      else if (!v4)
      {
        [(PXPlacesMapContainerViewController *)self _switchToMapController];
      }
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PXPlacesMapContainerViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1)
  {
    int64_t initialNavigationBarStyle = self->_initialNavigationBarStyle;
    unint64_t v8 = [(PXPlacesMapContainerViewController *)self navigationController];
    id v9 = [v8 navigationItem];
    [v9 setStyle:initialNavigationBarStyle];
  }
  v10.receiver = self;
  v10.super_class = (Class)PXPlacesMapContainerViewController;
  [(PXPlacesMapContainerViewController *)&v10 viewWillDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PXPlacesMapContainerViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1)
  {
    id v7 = [(PXPlacesMapContainerViewController *)self navigationItem];
    self->_int64_t initialNavigationBarStyle = [v7 style];

    unint64_t v8 = [(PXPlacesMapContainerViewController *)self navigationController];
    id v9 = [v8 navigationItem];
    [v9 setStyle:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)PXPlacesMapContainerViewController;
  [(PXPlacesMapContainerViewController *)&v10 viewWillAppear:v3];
}

- (void)viewDidLoad
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PXPlacesMapContainerViewController;
  [(PXPlacesMapContainerViewController *)&v15 viewDidLoad];
  BOOL v3 = [(PXPlacesMapContainerViewController *)self configuration];
  int v4 = [v3 gridViewEnabled];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1C10]);
    uint64_t v6 = PXLocalizedStringFromTable(@"PXPlacesMapContainerSubviewMapTitle", @"PhotosUICore");
    v16[0] = v6;
    id v7 = PXLocalizedStringFromTable(@"PXPlacesMapContainerSubviewGridTitle", @"PhotosUICore");
    v16[1] = v7;
    unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    id v9 = (void *)[v5 initWithItems:v8];

    objc_msgSend(MEMORY[0x1E4FB1C10], "px_defaultMinimumSegmentWidth");
    objc_msgSend(v9, "px_setMinimumSegmentWidth:");
    [v9 setSelectedSegmentIndex:0];
    [v9 addTarget:self action:sel_subviewControlChanged_ forControlEvents:4096];
    objc_super v10 = [(PXPlacesMapContainerViewController *)self navigationItem];
    [v10 setTitleView:v9];

    [(PXPlacesMapContainerViewController *)self setSubviewControl:v9];
    [(PXPlacesMapContainerViewController *)self _resetNavigationItem];
  }
  else
  {
    int v11 = [(PXPlacesMapContainerViewController *)self navigationItem];
    v12 = [v11 leftBarButtonItems];
    [(PXPlacesMapContainerViewController *)self setInitialLeftBarButtonItems:v12];

    [(PXPlacesMapContainerViewController *)self _updateNavigationItemTitleWithConfigurationIfPossible];
  }
  v13 = [(PXPlacesMapContainerViewController *)self navigationItem];
  [v13 setLargeTitleDisplayMode:2];

  uint64_t v14 = [(PXPlacesMapContainerViewController *)self fetchResultViewController];
  [(UIViewController *)self px_addOrReplaceChildViewController:v14 activateConstraints:1];
}

- (void)loadView
{
  BOOL v3 = [(PXPlacesMapContainerViewController *)self nibName];

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PXPlacesMapContainerViewController;
    [(PXPlacesMapContainerViewController *)&v6 loadView];
  }
  else
  {
    id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 200.0, 200.0);
    int v4 = [MEMORY[0x1E4FB1618] whiteColor];
    [v5 setBackgroundColor:v4];

    [(PXPlacesMapContainerViewController *)self setView:v5];
  }
}

- (PXPlacesMapContainerViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapContainerViewController.m", 106, @"%s is not available as initializer", "-[PXPlacesMapContainerViewController initWithCoder:]");

  abort();
}

- (PXPlacesMapContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapContainerViewController.m", 102, @"%s is not available as initializer", "-[PXPlacesMapContainerViewController initWithNibName:bundle:]");

  abort();
}

- (PXPlacesMapContainerViewController)init
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapContainerViewController.m", 98, @"%s is not available as initializer", "-[PXPlacesMapContainerViewController init]");

  abort();
}

- (PXPlacesMapContainerViewController)initWithPhotoLibrary:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PXPlacesMapContainerViewController;
  id v9 = [(PXPlacesMapContainerViewController *)&v25 initWithNibName:0 bundle:0];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    int v11 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v7];
    v12 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v11];
    v13 = [[PXPlacesMapFetchResultController alloc] initWithLibraryFilterState:v12 photoLibrary:v7];
    uint64_t v14 = [PXPlacesMapFetchResultViewController alloc];
    [v8 initialCoordinateRegion];
    uint64_t v19 = -[PXPlacesMapFetchResultViewController initWithInitialCoordinateRegion:enableNearbyAssetsAffordance:wantsMapOptionsView:photoLibrary:mapFetchResultController:](v14, "initWithInitialCoordinateRegion:enableNearbyAssetsAffordance:wantsMapOptionsView:photoLibrary:mapFetchResultController:", [v8 enableNearbyAssetsAffordance], 1, v7, v13, v15, v16, v17, v18);
    fetchResultViewController = v10->_fetchResultViewController;
    v10->_fetchResultViewController = (PXPlacesMapFetchResultViewController *)v19;

    [(PXPlacesMapFetchResultViewController *)v10->_fetchResultViewController setPxOneUpPresentationViewController:v10];
    [(PXPlacesMapFetchResultViewController *)v10->_fetchResultViewController setBarButtonsDelegate:v10];
    v10->_previousNavigationBarSegmentedControlSelectedIndex = 0;
    LOBYTE(v14) = [(PXPlacesMapFetchResultViewController *)v10->_fetchResultViewController prefersToolbarVisible];
    [(UIViewController *)v10 px_enableBarAppearance];
    [(UIViewController *)v10 px_enablePrefersViewIsAppearingForAppearanceUpdates];
    v21 = [(UIViewController *)v10 px_barAppearance];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73__PXPlacesMapContainerViewController_initWithPhotoLibrary_configuration___block_invoke;
    v23[3] = &__block_descriptor_33_e34_v16__0___PXMutableBarAppearance__8l;
    char v24 = (char)v14;
    [v21 performChangesWithAnimationOptions:0 changes:v23];
  }
  return v10;
}

void __73__PXPlacesMapContainerViewController_initWithPhotoLibrary_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPrefersStatusBarVisible:1];
  [v3 setPrefersNavigationBarVisible:1];
  [v3 setPrefersToolbarVisible:*(unsigned __int8 *)(a1 + 32)];
  [v3 setPrefersTabBarVisible:0];
}

@end