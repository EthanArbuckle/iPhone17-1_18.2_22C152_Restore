@interface MSDStoreSearchViewController
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (CLLocation)userLocation;
- (MSDKManagedDevice)device;
- (MSDMapViewController)mapViewController;
- (MSDSearchResultViewController)searchResultViewController;
- (MSDStoreInfo)selectedStore;
- (MSDStoreSearchViewController)init;
- (NSString)customDetentIdentifier;
- (OS_dispatch_queue)updateQueue;
- (UINavigationController)sheetContentViewController;
- (UISheetPresentationControllerDetent)customDetent;
- (id)_searchStoreWithText:(id)a3;
- (void)_help:(id)a3;
- (void)_lockSheetDetent;
- (void)_showSheet;
- (void)_unlockSheetDetent;
- (void)_updateViewWithSearchText:(id)a3;
- (void)didAssignStore:(id)a3 forViewController:(id)a4;
- (void)didDeselectStore:(id)a3 forViewController:(id)a4;
- (void)didDeselectStores:(id)a3 forViewController:(id)a4;
- (void)didDismissStoreListView:(id)a3 forViewController:(id)a4;
- (void)didSelectNoStoreForViewController:(id)a3;
- (void)didSelectStore:(id)a3 forViewController:(id)a4;
- (void)didSelectStores:(id)a3 forViewController:(id)a4;
- (void)setCustomDetent:(id)a3;
- (void)setCustomDetentIdentifier:(id)a3;
- (void)setDevice:(id)a3;
- (void)setMapViewController:(id)a3;
- (void)setSearchResultViewController:(id)a3;
- (void)setSelectedStore:(id)a3;
- (void)setSheetContentViewController:(id)a3;
- (void)setUpdateQueue:(id)a3;
- (void)setUserLocation:(id)a3;
- (void)userLocationDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MSDStoreSearchViewController

- (MSDStoreSearchViewController)init
{
  v17.receiver = self;
  v17.super_class = (Class)MSDStoreSearchViewController;
  v2 = [(MSDStoreSearchViewController *)&v17 init];
  v3 = v2;
  if (v2)
  {
    [(MSDStoreSearchViewController *)v2 setUserLocation:0];
    [(MSDStoreSearchViewController *)v3 setSelectedStore:0];
    v4 = [MEMORY[0x263F55C40] sharedInstance];
    [(MSDStoreSearchViewController *)v3 setDevice:v4];

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.msdstoresearch", 0);
    [(MSDStoreSearchViewController *)v3 setUpdateQueue:v5];

    v6 = +[MSDSetupUILocalization localizedStringForKey:@"STORE_SEARCH_HEADER"];
    [(MSDStoreSearchViewController *)v3 setTitle:v6];

    [(MSDStoreSearchViewController *)v3 setCustomDetentIdentifier:@"customMedium"];
    v7 = (void *)MEMORY[0x263F1C988];
    v8 = [(MSDStoreSearchViewController *)v3 customDetentIdentifier];
    v9 = [v7 _detentWithIdentifier:v8 resolutionContextBlock:&__block_literal_global_4];
    [(MSDStoreSearchViewController *)v3 setCustomDetent:v9];

    v10 = [[MSDMapViewController alloc] initWithDelegate:v3];
    [(MSDStoreSearchViewController *)v3 setMapViewController:v10];

    v11 = [[MSDSearchResultViewController alloc] initWithDelegate:v3];
    [(MSDStoreSearchViewController *)v3 setSearchResultViewController:v11];

    id v12 = objc_alloc(MEMORY[0x263F1C7F8]);
    v13 = [(MSDStoreSearchViewController *)v3 searchResultViewController];
    v14 = (void *)[v12 initWithRootViewController:v13];
    [(MSDStoreSearchViewController *)v3 setSheetContentViewController:v14];

    v15 = [(MSDStoreSearchViewController *)v3 sheetContentViewController];
    [v15 setNavigationBarHidden:1];
  }
  return v3;
}

double __36__MSDStoreSearchViewController_init__block_invoke(uint64_t a1, void *a2)
{
  [a2 _maximumDetentValue];
  return v2 * 0.4;
}

- (void)viewDidLoad
{
  v44[4] = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)MSDStoreSearchViewController;
  [(MSDStoreSearchViewController *)&v43 viewDidLoad];
  v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  dispatch_queue_t v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 bounds];
  double v7 = v6;

  if (v4 == 1)
  {
    [MEMORY[0x263F5B890] preferredContentSize];
    double v7 = v8;
  }
  v9 = [(MSDStoreSearchViewController *)self mapViewController];
  v10 = [v9 mapView];
  objc_msgSend(v10, "setLayoutMargins:", 0.0, 0.0, v7 * 0.4, 0.0);

  v11 = [(MSDStoreSearchViewController *)self mapViewController];
  [(MSDStoreSearchViewController *)self addChildViewController:v11];

  id v12 = [(MSDStoreSearchViewController *)self mapViewController];
  v13 = [v12 view];

  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [(MSDStoreSearchViewController *)self view];
  [v14 addSubview:v13];

  v40 = [v13 topAnchor];
  v41 = [(MSDStoreSearchViewController *)self view];
  v39 = [v41 safeAreaLayoutGuide];
  v38 = [v39 topAnchor];
  v37 = [v40 constraintEqualToAnchor:v38];
  v44[0] = v37;
  v35 = [v13 bottomAnchor];
  v36 = [(MSDStoreSearchViewController *)self view];
  v34 = [v36 safeAreaLayoutGuide];
  v33 = [v34 bottomAnchor];
  v32 = [v35 constraintEqualToAnchor:v33];
  v44[1] = v32;
  v42 = v13;
  v30 = [v13 leftAnchor];
  v15 = [(MSDStoreSearchViewController *)self view];
  v16 = [v15 safeAreaLayoutGuide];
  objc_super v17 = [v16 leftAnchor];
  v18 = [v30 constraintEqualToAnchor:v17];
  v44[2] = v18;
  v19 = [v13 rightAnchor];
  v20 = [(MSDStoreSearchViewController *)self view];
  v21 = [v20 safeAreaLayoutGuide];
  v22 = [v21 rightAnchor];
  v23 = [v19 constraintEqualToAnchor:v22];
  v44[3] = v23;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];

  [MEMORY[0x263F08938] activateConstraints:v31];
  v24 = [(MSDStoreSearchViewController *)self mapViewController];
  [v24 didMoveToParentViewController:self];

  v25 = (void *)MEMORY[0x263F1C488];
  v26 = [MEMORY[0x263F1C6B0] systemImageNamed:@"questionmark.circle"];
  v27 = [v25 systemButtonWithImage:v26 target:self action:sel__help_];

  v28 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v27];
  v29 = [(MSDStoreSearchViewController *)self navigationItem];
  [v29 setRightBarButtonItem:v28];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSDStoreSearchViewController;
  [(MSDStoreSearchViewController *)&v4 viewDidAppear:a3];
  [(MSDStoreSearchViewController *)self _showSheet];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSDStoreSearchViewController;
  [(MSDStoreSearchViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(MSDStoreSearchViewController *)self presentedViewController];

  if (v4) {
    [(MSDStoreSearchViewController *)self dismissViewControllerAnimated:0 completion:0];
  }
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)didSelectStore:(id)a3 forViewController:(id)a4
{
  id v5 = a3;
  double v6 = [(MSDStoreSearchViewController *)self updateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__MSDStoreSearchViewController_didSelectStore_forViewController___block_invoke;
  v8[3] = &unk_264D882F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __65__MSDStoreSearchViewController_didSelectStore_forViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) selectedStore];
  if (!v2
    || (v3 = (void *)v2,
        [*(id *)(a1 + 32) selectedStore],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isEqual:*(void *)(a1 + 40)],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    [*(id *)(a1 + 32) setSelectedStore:*(void *)(a1 + 40)];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__MSDStoreSearchViewController_didSelectStore_forViewController___block_invoke_2;
    v7[3] = &unk_264D882F0;
    double v6 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    dispatch_sync(MEMORY[0x263EF83A0], v7);
  }
}

void __65__MSDStoreSearchViewController_didSelectStore_forViewController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _lockSheetDetent];
  id v2 = [*(id *)(a1 + 32) mapViewController];
  [v2 zoomToStore:*(void *)(a1 + 40)];
}

- (void)didDeselectStore:(id)a3 forViewController:(id)a4
{
  id v5 = a3;
  double v6 = [(MSDStoreSearchViewController *)self updateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__MSDStoreSearchViewController_didDeselectStore_forViewController___block_invoke;
  v8[3] = &unk_264D882F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __67__MSDStoreSearchViewController_didDeselectStore_forViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) selectedStore];
  if (v2)
  {
    v3 = (void *)v2;
    objc_super v4 = [*(id *)(a1 + 32) selectedStore];
    int v5 = [v4 isEqual:*(void *)(a1 + 40)];

    if (v5)
    {
      [*(id *)(a1 + 32) setSelectedStore:0];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__MSDStoreSearchViewController_didDeselectStore_forViewController___block_invoke_2;
      block[3] = &unk_264D88200;
      block[4] = *(void *)(a1 + 32);
      dispatch_sync(MEMORY[0x263EF83A0], block);
    }
  }
}

void __67__MSDStoreSearchViewController_didDeselectStore_forViewController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _unlockSheetDetent];
  uint64_t v2 = [*(id *)(a1 + 32) searchResultViewController];
  int v3 = [v2 isShowingSearchResult];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) mapViewController];
    [v4 deselectAnnotation];
  }
}

- (void)didAssignStore:(id)a3 forViewController:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = defaultLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_23911B000, v6, OS_LOG_TYPE_DEFAULT, "User selected store with store ID: %{public}@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__MSDStoreSearchViewController_didAssignStore_forViewController___block_invoke;
  v8[3] = &unk_264D882F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __65__MSDStoreSearchViewController_didAssignStore_forViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mapViewController];
  [v2 stopUpdatingUserLocation];

  id v4 = +[MSDSetupUIController sharedInstance];
  int v3 = [*(id *)(a1 + 40) appleID];
  [v4 setupCompleteWithStoreID:v3];
}

- (void)didSelectNoStoreForViewController:(id)a3
{
  int v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_23911B000, v3, OS_LOG_TYPE_DEFAULT, "User selected I Can't Find My Store", v6, 2u);
  }

  id v4 = objc_alloc_init(MSDDefaultStoreViewController);
  id v5 = +[MSDSetupUIController sharedInstance];
  [v5 pushViewController:v4 andRemoveTopmostView:0];
}

- (void)didDismissStoreListView:(id)a3 forViewController:(id)a4
{
  id v5 = [(MSDStoreSearchViewController *)self updateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__MSDStoreSearchViewController_didDismissStoreListView_forViewController___block_invoke;
  block[3] = &unk_264D88200;
  block[4] = self;
  dispatch_async(v5, block);
}

void __74__MSDStoreSearchViewController_didDismissStoreListView_forViewController___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__MSDStoreSearchViewController_didDismissStoreListView_forViewController___block_invoke_2;
  block[3] = &unk_264D88200;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

void __74__MSDStoreSearchViewController_didDismissStoreListView_forViewController___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mapViewController];
  [v1 deselectAnnotation];
}

- (void)didSelectStores:(id)a3 forViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = [(MSDStoreSearchViewController *)self updateQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__MSDStoreSearchViewController_didSelectStores_forViewController___block_invoke;
    v9[3] = &unk_264D882F0;
    id v10 = v6;
    id v11 = self;
    dispatch_async(v8, v9);
  }
}

void __66__MSDStoreSearchViewController_didSelectStores_forViewController___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] == 1)
  {
    uint64_t v2 = [*(id *)(a1 + 32) firstObject];
    uint64_t v3 = [*(id *)(a1 + 40) selectedStore];
    if (!v3
      || (id v4 = (void *)v3,
          [*(id *)(a1 + 40) selectedStore],
          id v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = [v5 isEqual:v2],
          v5,
          v4,
          (v6 & 1) == 0))
    {
      [*(id *)(a1 + 40) setSelectedStore:v2];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__MSDStoreSearchViewController_didSelectStores_forViewController___block_invoke_2;
      block[3] = &unk_264D882F0;
      block[4] = *(void *)(a1 + 40);
      id v12 = v2;
      dispatch_sync(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__MSDStoreSearchViewController_didSelectStores_forViewController___block_invoke_3;
    v9[3] = &unk_264D882F0;
    int8x16_t v8 = *(int8x16_t *)(a1 + 32);
    id v7 = (id)v8.i64[0];
    int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
    dispatch_sync(MEMORY[0x263EF83A0], v9);
  }
}

void __66__MSDStoreSearchViewController_didSelectStores_forViewController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _lockSheetDetent];
  id v2 = [*(id *)(a1 + 32) searchResultViewController];
  [v2 showStoreInfo:*(void *)(a1 + 40)];
}

void __66__MSDStoreSearchViewController_didSelectStores_forViewController___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) searchResultViewController];
  [v2 showStoreList:*(void *)(a1 + 40) inDisplayMode:2];
}

- (void)didDeselectStores:(id)a3 forViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    int8x16_t v8 = [(MSDStoreSearchViewController *)self updateQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__MSDStoreSearchViewController_didDeselectStores_forViewController___block_invoke;
    v9[3] = &unk_264D882F0;
    id v10 = v6;
    id v11 = self;
    dispatch_async(v8, v9);
  }
}

void __68__MSDStoreSearchViewController_didDeselectStores_forViewController___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] != 1) {
    goto LABEL_5;
  }
  id v6 = [*(id *)(a1 + 32) firstObject];
  uint64_t v2 = [*(id *)(a1 + 40) selectedStore];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 40) selectedStore];
    int v5 = [v4 isEqual:v6];

    if (v5)
    {
      [*(id *)(a1 + 40) setSelectedStore:0];

LABEL_5:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__MSDStoreSearchViewController_didDeselectStores_forViewController___block_invoke_2;
      block[3] = &unk_264D88200;
      block[4] = *(void *)(a1 + 40);
      dispatch_sync(MEMORY[0x263EF83A0], block);
      return;
    }
  }
}

void __68__MSDStoreSearchViewController_didDeselectStores_forViewController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _unlockSheetDetent];
  id v2 = [*(id *)(a1 + 32) searchResultViewController];
  [v2 dismissAllTopViews];
}

- (void)userLocationDidChange:(id)a3
{
  id v4 = a3;
  id v6 = [(MSDStoreSearchViewController *)self userLocation];
  [(MSDStoreSearchViewController *)self setUserLocation:v4];

  int v5 = v6;
  if (!v6)
  {
    [(MSDStoreSearchViewController *)self _updateViewWithSearchText:0];
    int v5 = 0;
  }
}

- (void)_help:(id)a3
{
  uint64_t v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_23911B000, v3, OS_LOG_TYPE_DEFAULT, "User clicked help button", v6, 2u);
  }

  id v4 = objc_alloc_init(MSDHelpMenuViewController);
  int v5 = +[MSDSetupUIController sharedInstance];
  [v5 pushViewController:v4 andRemoveTopmostView:0];
}

- (void)_showSheet
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MSDStoreSearchViewController *)self sheetContentViewController];
  [v3 setModalPresentationStyle:2];

  [MEMORY[0x263F5B890] preferredContentSize];
  double v5 = v4;
  double v7 = v6;
  int8x16_t v8 = [(MSDStoreSearchViewController *)self sheetContentViewController];
  objc_msgSend(v8, "setPreferredContentSize:", v5, v7);

  id v9 = [(MSDStoreSearchViewController *)self sheetContentViewController];
  id v10 = [v9 sheetPresentationController];

  [v10 setPrefersGrabberVisible:1];
  id v11 = [(MSDStoreSearchViewController *)self customDetent];
  v16[0] = v11;
  id v12 = [MEMORY[0x263F1C988] largeDetent];
  v16[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  [v10 setDetents:v13];

  v14 = [(MSDStoreSearchViewController *)self customDetentIdentifier];
  [v10 setLargestUndimmedDetentIdentifier:v14];

  [v10 setDelegate:self];
  v15 = [(MSDStoreSearchViewController *)self sheetContentViewController];
  [(MSDStoreSearchViewController *)self presentViewController:v15 animated:1 completion:0];
}

- (void)_lockSheetDetent
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MSDStoreSearchViewController *)self sheetContentViewController];
  double v4 = [v3 sheetPresentationController];

  double v5 = [(MSDStoreSearchViewController *)self customDetent];
  v7[0] = v5;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v4 setDetents:v6];
}

- (void)_unlockSheetDetent
{
  v8[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MSDStoreSearchViewController *)self sheetContentViewController];
  double v4 = [v3 sheetPresentationController];

  double v5 = [(MSDStoreSearchViewController *)self customDetent];
  v8[0] = v5;
  double v6 = [MEMORY[0x263F1C988] largeDetent];
  v8[1] = v6;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [v4 setDetents:v7];

  [v4 _setIndexOfCurrentDetent:0];
}

- (void)_updateViewWithSearchText:(id)a3
{
  id v4 = a3;
  double v5 = [(MSDStoreSearchViewController *)self updateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __58__MSDStoreSearchViewController__updateViewWithSearchText___block_invoke;
  v7[3] = &unk_264D882F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__MSDStoreSearchViewController__updateViewWithSearchText___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__MSDStoreSearchViewController__updateViewWithSearchText___block_invoke_2;
  block[3] = &unk_264D88200;
  block[4] = *(void *)(a1 + 32);
  id v2 = MEMORY[0x263EF83A0];
  dispatch_sync(MEMORY[0x263EF83A0], block);
  uint64_t v3 = [*(id *)(a1 + 32) _searchStoreWithText:*(void *)(a1 + 40)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__MSDStoreSearchViewController__updateViewWithSearchText___block_invoke_3;
  v6[3] = &unk_264D88420;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_sync(v2, v6);
}

void __58__MSDStoreSearchViewController__updateViewWithSearchText___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) searchResultViewController];
  [v1 showInProgress];
}

void __58__MSDStoreSearchViewController__updateViewWithSearchText___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapViewController];
  [v2 annotateStores:*(void *)(a1 + 40)];

  BOOL v3 = *(void *)(a1 + 48) != 0;
  id v4 = [*(id *)(a1 + 32) searchResultViewController];
  [v4 showStoreList:*(void *)(a1 + 40) inDisplayMode:v3];
}

- (id)_searchStoreWithText:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
  id v5 = objc_opt_new();
  id v6 = v5;
  if (v4) {
    [v5 setObject:v4 forKey:*MEMORY[0x263F55C60]];
  }
  id v7 = [(MSDStoreSearchViewController *)self userLocation];

  if (v7)
  {
    id v8 = NSNumber;
    id v9 = [(MSDStoreSearchViewController *)self userLocation];
    [v9 coordinate];
    id v10 = objc_msgSend(v8, "numberWithDouble:");
    [v6 setObject:v10 forKey:*MEMORY[0x263F55C50]];

    id v11 = NSNumber;
    id v12 = [(MSDStoreSearchViewController *)self userLocation];
    [v12 coordinate];
    v14 = [v11 numberWithDouble:v13];
    [v6 setObject:v14 forKey:*MEMORY[0x263F55C58]];
  }
  v15 = defaultLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v6;
    _os_log_impl(&dword_23911B000, v15, OS_LOG_TYPE_DEFAULT, "Searching for stores with options: %{public}@", buf, 0xCu);
  }

  v16 = [(MSDStoreSearchViewController *)self device];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __53__MSDStoreSearchViewController__searchStoreWithText___block_invoke;
  v20[3] = &unk_264D88448;
  v20[4] = &v27;
  v20[5] = &v21;
  [v16 searchStoreWithOptions:v6 completion:v20];

  objc_super v17 = defaultLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23911B000, v17, OS_LOG_TYPE_DEFAULT, "Waiting for store search results...", buf, 2u);
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)v22[5], 0xFFFFFFFFFFFFFFFFLL);
  id v18 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

void __53__MSDStoreSearchViewController__searchStoreWithText___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (!a3)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
          v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          v16 = [MSDStoreInfo alloc];
          objc_super v17 = -[MSDStoreInfo initWithDict:](v16, "initWithDict:", v14, (void)v18);
          [v15 addObject:v17];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (NSString)customDetentIdentifier
{
  return self->_customDetentIdentifier;
}

- (void)setCustomDetentIdentifier:(id)a3
{
}

- (UISheetPresentationControllerDetent)customDetent
{
  return self->_customDetent;
}

- (void)setCustomDetent:(id)a3
{
}

- (MSDMapViewController)mapViewController
{
  return self->_mapViewController;
}

- (void)setMapViewController:(id)a3
{
}

- (MSDSearchResultViewController)searchResultViewController
{
  return self->_searchResultViewController;
}

- (void)setSearchResultViewController:(id)a3
{
}

- (UINavigationController)sheetContentViewController
{
  return self->_sheetContentViewController;
}

- (void)setSheetContentViewController:(id)a3
{
}

- (CLLocation)userLocation
{
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
}

- (MSDKManagedDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (MSDStoreInfo)selectedStore
{
  return self->_selectedStore;
}

- (void)setSelectedStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedStore, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_sheetContentViewController, 0);
  objc_storeStrong((id *)&self->_searchResultViewController, 0);
  objc_storeStrong((id *)&self->_mapViewController, 0);
  objc_storeStrong((id *)&self->_customDetent, 0);
  objc_storeStrong((id *)&self->_customDetentIdentifier, 0);
}

@end