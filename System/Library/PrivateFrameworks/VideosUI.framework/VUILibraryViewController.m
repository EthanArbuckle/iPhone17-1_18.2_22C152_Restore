@interface VUILibraryViewController
+ (id)_localizedTitleForShelfType:(int64_t)a3;
+ (id)shelfTypesSortComparator;
- (BOOL)_didFailUpdateCloudLibrary;
- (BOOL)_downloadsAreAvailable;
- (BOOL)_gestureRecognizerShouldBegin;
- (BOOL)_haveAllInitialFetchesCompleted;
- (BOOL)_isDeviceMediaLibraryInitialUpdateInProgress;
- (BOOL)_shouldShowContentView;
- (BOOL)currentLibraryCategoryIsFromShelf;
- (BOOL)currentLibraryCategoryIsValid;
- (BOOL)doesDeviceSupportHDR;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasBatchChangesInProgress;
- (BOOL)hasMediaEntitiesFetchCompleted;
- (BOOL)hasMenuItemFetchCompleted;
- (BOOL)hasNewerBatchChanges;
- (BOOL)hasPendingShelvesUpdate;
- (BOOL)isPresentingDownloads;
- (BOOL)viewHasAppearedAtLeastOnce;
- (BOOL)vui_ppt_isLoading;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)homeShares;
- (NSArray)menuCells;
- (NSMutableArray)shelves;
- (NSMutableArray)validShelfTypes;
- (UIBarButtonItem)libraryBarButton;
- (VUIDownloadTableViewController)presentedDownloadViewController;
- (VUIFamilyMember)familyMember;
- (VUILibraryBannerCollectionViewCell)bannerViewSizingCell;
- (VUILibraryMenuDataSource)menuDataSource;
- (VUILibraryMenuItemViewCell)menuItemSizingCell;
- (VUILibraryShelvesDataSource)shelvesDataSource;
- (VUILibraryViewController)initWithMenuDataSource:(id)a3;
- (VUILibraryViewController)initWithMenuDataSource:(id)a3 familyMember:(id)a4;
- (VUIMediaLibrary)currentHomeShareMediaLibrary;
- (VUIMediaLibrary)mediaLibrary;
- (VUIViewControllerContentPresenter)contentPresenter;
- (_VUILibrarySeeAllController)currentSeeAllController;
- (id)_dataSourceForShelves;
- (id)_deviceMediaLibrary;
- (id)_downloadViewController;
- (id)_localizedTitleForCellType:(int64_t)a3;
- (id)_menuItems;
- (id)_navigationBarTitle;
- (id)_symbolNameForCellType:(int64_t)a3;
- (id)_viewControllerWithCellType:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)_categoryForCellType:(int64_t)a3;
- (int64_t)_categoryForShelfType:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)currentLibraryCategory;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_accountsChanged:(id)a3;
- (void)_addMediaLibraryNotificationObservers;
- (void)_addNotificationObserversWithDeviceLibrary:(id)a3;
- (void)_applyBatchChanges;
- (void)_configureShelfViewController:(id)a3 withShelfType:(int64_t)a4;
- (void)_constructLibraryDataSourceAndUpdateActiveView;
- (void)_constructShelves;
- (void)_deviceMediaLibraryUpdateStateDidChange:(id)a3;
- (void)_homeShareMediaLibrariesDidChange:(id)a3;
- (void)_networkReachabilityDidChange:(id)a3;
- (void)_presentDownloadViewController;
- (void)_removeDownloadViewController;
- (void)_removeMediaLibraryNotificationObservers;
- (void)_removeNotificationObserversWithDeviceLibrary:(id)a3;
- (void)_resetNavigationBar;
- (void)_selectLibraryCellType:(int64_t)a3;
- (void)_setupNavigationItemAccessoryView;
- (void)_showContentOrNoContentView;
- (void)_startMonitoringDeviceMediaLibraryInitialUpdate;
- (void)_stopMonitoringDeviceMediaLibraryInitialUpdate;
- (void)_updateNavigationTitle;
- (void)_updateViewIfFetchComplete;
- (void)_updateVisibleCellSeparators;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureWithCollectionView:(id)a3;
- (void)dataSourceDidFinishFetching:(id)a3;
- (void)dealloc;
- (void)didSelectMenuItemAtIndexPath:(id)a3;
- (void)familyMemberViewController:(id)a3 didSelectFamilyMember:(id)a4;
- (void)loadView;
- (void)seeAllButtonPressed:(id)a3;
- (void)setBannerViewSizingCell:(id)a3;
- (void)setContentPresenter:(id)a3;
- (void)setCurrentHomeShareMediaLibrary:(id)a3;
- (void)setCurrentLibraryCategory:(int64_t)a3;
- (void)setCurrentLibraryCategoryIsFromShelf:(BOOL)a3;
- (void)setCurrentLibraryCategoryIsValid:(BOOL)a3;
- (void)setCurrentSeeAllController:(id)a3;
- (void)setDoesDeviceSupportHDR:(BOOL)a3;
- (void)setFamilyMember:(id)a3;
- (void)setHasBatchChangesInProgress:(BOOL)a3;
- (void)setHasMediaEntitiesFetchCompleted:(BOOL)a3;
- (void)setHasMenuItemFetchCompleted:(BOOL)a3;
- (void)setHasNewerBatchChanges:(BOOL)a3;
- (void)setHasPendingShelvesUpdate:(BOOL)a3;
- (void)setHomeShares:(id)a3;
- (void)setIsPresentingDownloads:(BOOL)a3;
- (void)setLibraryBarButton:(id)a3;
- (void)setMenuCells:(id)a3;
- (void)setMenuDataSource:(id)a3;
- (void)setMenuItemSizingCell:(id)a3;
- (void)setPresentedDownloadViewController:(id)a3;
- (void)setShelves:(id)a3;
- (void)setShelvesDataSource:(id)a3;
- (void)setValidShelfTypes:(id)a3;
- (void)setViewHasAppearedAtLeastOnce:(BOOL)a3;
- (void)shelfCollectionViewController:(id)a3 collectionView:(id)a4 didSelectMediaEntity:(id)a5 atIndexPath:(id)a6;
- (void)shelvesDidFinishWithDataSource:(id)a3;
- (void)start;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation VUILibraryViewController

- (VUILibraryViewController)initWithMenuDataSource:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VUILibraryViewController;
  v6 = [(VUILibraryStackViewController *)&v18 init];
  v7 = v6;
  if (v6)
  {
    v6->_viewHasAppearedAtLeastOnce = 0;
    v6->_currentLibraryCategoryIsValid = 0;
    objc_storeStrong((id *)&v6->_menuDataSource, a3);
    v8 = [(VUILibraryViewController *)v7 menuDataSource];
    [v8 setDelegate:v7];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [v5 mediaLibrary];
      mediaLibrary = v7->_mediaLibrary;
      v7->_mediaLibrary = (VUIMediaLibrary *)v9;

      v11 = VUIDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(VUIMediaLibrary *)v7->_mediaLibrary type];
        *(_DWORD *)buf = 134217984;
        uint64_t v20 = v12;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] library init with media library type %lu", buf, 0xCu);
      }
    }
    v7->_doesDeviceSupportHDR = SSDeviceIsHDRCapable();
    v13 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v7->_contentPresenter;
    v7->_contentPresenter = v13;

    [(VUIViewControllerContentPresenter *)v7->_contentPresenter setLogName:@"VUILibraryViewController"];
    v15 = VUIDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = VUIBoolLogString();
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = (uint64_t)v16;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUILibraryViewController _doesDeviceSupportHDR = %@", buf, 0xCu);
    }
  }

  return v7;
}

- (VUILibraryViewController)initWithMenuDataSource:(id)a3 familyMember:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)VUILibraryViewController;
  uint64_t v9 = [(VUILibraryStackViewController *)&v23 init];
  v10 = v9;
  if (v9)
  {
    v9->_viewHasAppearedAtLeastOnce = 0;
    v9->_currentLibraryCategoryIsValid = 0;
    objc_storeStrong((id *)&v9->_menuDataSource, a3);
    objc_storeStrong((id *)&v10->_familyMember, a4);
    v11 = [(VUILibraryViewController *)v10 menuDataSource];
    [v11 setDelegate:v10];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = [v7 mediaLibrary];
      mediaLibrary = v10->_mediaLibrary;
      v10->_mediaLibrary = (VUIMediaLibrary *)v12;

      v14 = VUIDefaultLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [(VUIMediaLibrary *)v10->_mediaLibrary type];
        *(_DWORD *)buf = 134217984;
        uint64_t v25 = v15;
        _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] library init with media library type %lu", buf, 0xCu);
      }
    }
    v10->_doesDeviceSupportHDR = SSDeviceIsHDRCapable();
    v16 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v10->_contentPresenter;
    v10->_contentPresenter = v16;

    [(VUIViewControllerContentPresenter *)v10->_contentPresenter setLogName:@"VUILibraryViewController"];
    objc_super v18 = VUIDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = VUIBoolLogString();
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = (uint64_t)v19;
      _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "VUILibraryViewController _doesDeviceSupportHDR = %@", buf, 0xCu);
    }
    uint64_t v20 = [(VUILibraryViewController *)v10 view];
    uint64_t v21 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:@"Library"];
    [v20 setAccessibilityIdentifier:v21];
  }
  return v10;
}

- (void)dealloc
{
  [(VUILibraryViewController *)self _removeMediaLibraryNotificationObservers];
  v3.receiver = self;
  v3.super_class = (Class)VUILibraryViewController;
  [(VUILibraryViewController *)&v3 dealloc];
}

- (void)loadView
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VUILibraryViewController;
  [(VUILibraryViewController *)&v11 loadView];
  [(VUILibraryViewController *)self _updateNavigationTitle];
  [(VUILibraryViewController *)self _setupNavigationItemAccessoryView];
  objc_super v3 = objc_alloc_init(VUILibraryMenuItemViewCell);
  menuItemSizingCell = self->_menuItemSizingCell;
  self->_menuItemSizingCell = v3;

  id v5 = [(VUILibraryViewController *)self contentPresenter];
  [v5 setRootViewForViewController:self];

  objc_initWeak(&location, self);
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__VUILibraryViewController_loadView__block_invoke;
  v8[3] = &unk_1E6DF4CB0;
  objc_copyWeak(&v9, &location);
  id v7 = (id)[(VUILibraryViewController *)self registerForTraitChanges:v6 withHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __36__VUILibraryViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateViewIfFetchComplete];
}

- (void)viewWillAppear:(BOOL)a3
{
  v24.receiver = self;
  v24.super_class = (Class)VUILibraryViewController;
  -[VUILibraryViewController viewWillAppear:](&v24, sel_viewWillAppear_);
  id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 != 1)
  {
    id v7 = +[VUIMediaLibraryManager defaultManager];
    id v8 = [(VUILibraryViewController *)self mediaLibrary];
    [v7 setActiveMediaLibrary:v8];
  }
  currentSeeAllController = self->_currentSeeAllController;
  self->_currentSeeAllController = 0;

  currentHomeShareMediaLibrary = self->_currentHomeShareMediaLibrary;
  self->_currentHomeShareMediaLibrary = 0;

  objc_super v11 = [(VUILibraryViewController *)self contentPresenter];
  uint64_t v12 = [v11 currentContentViewType];

  if (v12 == 3)
  {
    v13 = [(VUILibraryStackViewController *)self stackCollectionView];
    v14 = [v13 indexPathsForSelectedItems];
    uint64_t v15 = [v14 firstObject];

    if (v15)
    {
      v16 = [(VUILibraryViewController *)self transitionCoordinator];
      if (v16)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __43__VUILibraryViewController_viewWillAppear___block_invoke;
        v20[3] = &unk_1E6DF3E68;
        id v21 = v13;
        id v22 = v15;
        BOOL v23 = a3;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __43__VUILibraryViewController_viewWillAppear___block_invoke_2;
        v17[3] = &unk_1E6DF3E90;
        id v18 = v21;
        id v19 = v22;
        [v16 animateAlongsideTransition:v20 completion:v17];
      }
      else
      {
        [v13 deselectItemAtIndexPath:v15 animated:1];
      }
    }
  }
  [(VUILibraryViewController *)self _resetNavigationBar];
}

uint64_t __43__VUILibraryViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __43__VUILibraryViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 selectItemAtIndexPath:v5 animated:0 scrollPosition:0];
  }
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VUILibraryViewController;
  [(VUILibraryStackViewController *)&v7 viewDidAppear:a3];
  [(VUILibraryViewController *)self setCurrentLibraryCategoryIsValid:0];
  [(VUILibraryViewController *)self setViewHasAppearedAtLeastOnce:1];
  v4 = @"LibraryMain";
  uint64_t v5 = [(VUILibraryViewController *)self familyMember];

  if (v5)
  {
    uint64_t v6 = @"FamilySharingLibraryMain";

    v4 = v6;
  }
  +[VUILibraryMetrics recordPageEventWithPageType:v4];
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VUILibraryViewController;
  [(VUILibraryViewController *)&v18 willMoveToParentViewController:v4];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(VUILibraryViewController *)self mediaLibrary];
      if (v5)
      {
        uint64_t v6 = (void *)v5;
        objc_super v7 = [(VUILibraryViewController *)self mediaLibrary];
        uint64_t v8 = [v7 type];

        if (v8 != 1)
        {
          v16 = [(VUILibraryViewController *)self navigationController];
          v17 = [v16 interactivePopGestureRecognizer];
          [v17 setEnabled:1];

          uint64_t v12 = [(VUILibraryViewController *)self navigationController];
          v13 = [v12 interactivePopGestureRecognizer];
          v14 = v13;
          uint64_t v15 = self;
          goto LABEL_7;
        }
      }
    }
  }
  id v9 = [(VUILibraryViewController *)self navigationController];

  if (v9)
  {
    v10 = [(VUILibraryViewController *)self navigationController];
    objc_super v11 = [v10 interactivePopGestureRecognizer];
    [v11 setEnabled:0];

    uint64_t v12 = [(VUILibraryViewController *)self navigationController];
    v13 = [v12 interactivePopGestureRecognizer];
    v14 = v13;
    uint64_t v15 = 0;
LABEL_7:
    [v13 setDelegate:v15];
  }
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)VUILibraryViewController;
  [(VUILibraryStackViewController *)&v21 viewDidLoad];
  objc_super v3 = [(VUILibraryViewController *)self contentPresenter];
  id v4 = +[VUILocalizationManager sharedInstance];
  uint64_t v5 = [v4 localizedStringForKey:@"LIBRARY_LOADING_MESSAGE"];
  [v3 setLoadingMessage:v5];

  uint64_t v6 = [(VUILibraryViewController *)self contentPresenter];
  objc_super v7 = +[VUILocalizationManager sharedInstance];
  uint64_t v8 = [v7 localizedStringForKey:@"LIBRARY_LOADING_TITLE"];
  [v6 setLoadingTitle:v8];

  objc_initWeak(&location, self);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __39__VUILibraryViewController_viewDidLoad__block_invoke;
  objc_super v18 = &unk_1E6DF4A30;
  objc_copyWeak(&v19, &location);
  +[VUIGDPRPresentationManager checkGDPRConsentAndPerformRequests:&v15];
  id v9 = +[VUIMediaLibraryManager defaultManager];
  [v9 beginDiscoveringHomeShareMediaLibraries];

  v10 = [(VUILibraryViewController *)self presentedDownloadViewController];

  if (!v10)
  {
    objc_super v11 = [(VUILibraryViewController *)self contentPresenter];
    uint64_t v12 = [(VUILibraryStackViewController *)self stackView];
    [v11 setContentView:v12];
  }
  v13 = [(VUILibraryViewController *)self view];
  v14 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:@"Library"];
  [v13 setAccessibilityIdentifier:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __39__VUILibraryViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained start];
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)VUILibraryViewController;
  [(VUILibraryViewController *)&v8 viewWillLayoutSubviews];
  objc_super v3 = [(VUILibraryViewController *)self contentPresenter];
  id v4 = [(VUILibraryViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");

  uint64_t v5 = [(VUILibraryStackViewController *)self stackView];
  [v5 bounds];
  LODWORD(v4) = CGRectEqualToRect(v9, *MEMORY[0x1E4F1DB28]);

  if (v4)
  {
    uint64_t v6 = [(VUILibraryStackViewController *)self stackView];
    objc_super v7 = [(VUILibraryViewController *)self view];
    [v7 bounds];
    objc_msgSend(v6, "setFrame:");
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VUILibraryViewController *)self navigationController];
  id v6 = [v5 interactivePopGestureRecognizer];

  if (v6 != v4) {
    return 1;
  }
  objc_super v8 = [(VUILibraryViewController *)self navigationController];
  CGRect v9 = [v8 viewControllers];
  if ((unint64_t)[v9 count] < 2)
  {
  }
  else
  {
    BOOL v10 = [(VUILibraryViewController *)self _gestureRecognizerShouldBegin];

    if (v10) {
      return 1;
    }
  }
  return 0;
}

- (void)configureWithCollectionView:(id)a3
{
}

- (void)start
{
  objc_super v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] library view starts all fetches", (uint8_t *)buf, 2u);
  }

  [(VUILibraryViewController *)self _addMediaLibraryNotificationObservers];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__accountsChanged_ name:@"VUIAuthenticationManagerAccountStoreDidChangeNotification" object:0];

  uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  shelves = self->_shelves;
  self->_shelves = v5;

  objc_super v7 = [(VUILibraryViewController *)self _dataSourceForShelves];
  shelvesDataSource = self->_shelvesDataSource;
  self->_shelvesDataSource = v7;

  CGRect v9 = [(VUILibraryViewController *)self menuDataSource];
  [v9 startFetch];

  BOOL v10 = [(VUILibraryViewController *)self mediaLibrary];
  if ([v10 type])
  {
    if ([v10 type] == 1)
    {
      if ([v10 isConnectable])
      {
        objc_super v11 = NSString;
        uint64_t v12 = +[VUILocalizationManager sharedInstance];
        v13 = [v12 localizedStringForKey:@"LIBRARY_EMPTY_HS_DESCRIPTION"];
        v14 = [v10 title];
        uint64_t v15 = [v11 stringWithValidatedFormat:v13, @"%@", 0, v14 validFormatSpecifiers error];

        uint64_t v16 = [(VUILibraryViewController *)self contentPresenter];
        [v16 setNoContentErrorMessage:v15];

        v17 = VUIDefaultLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_INFO, "[VUILibraryViewController] start - home share - update content view type to loading", (uint8_t *)buf, 2u);
        }

        objc_super v18 = [(VUILibraryViewController *)self contentPresenter];
        [v18 setCurrentContentViewType:1];

        objc_initWeak(buf, self);
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __33__VUILibraryViewController_start__block_invoke_112;
        v40[3] = &unk_1E6DF6A38;
        objc_copyWeak(&v41, buf);
        [v10 connectWithCompletionHandler:v40 progressHandler:0];
        objc_destroyWeak(&v41);
        objc_destroyWeak(buf);
      }
      else
      {
        v33 = [(VUILibraryViewController *)self contentPresenter];
        v34 = +[VUILocalizationManager sharedInstance];
        v35 = [v34 localizedStringForKey:@"LIBRARY_HS_UNSUPPORTED_VERSION_TITLE"];
        [v33 setNoContentErrorTitle:v35];

        v36 = [(VUILibraryViewController *)self contentPresenter];
        v37 = +[VUILocalizationManager sharedInstance];
        v38 = [v37 localizedStringForKey:@"LIBRARY_HS_UNSUPPORTED_VERSION_DESCRIPTION"];
        [v36 setNoContentErrorMessage:v38];

        v39 = [(VUILibraryViewController *)self contentPresenter];
        [v39 setCurrentContentViewType:2];
      }
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4FB3CF8] sharedInstance];
    char v20 = [v19 isNetworkReachable];

    if (v20)
    {
      objc_super v21 = VUIDefaultLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_INFO, "[VUILibraryViewController] start - update content view type to loading", (uint8_t *)buf, 2u);
      }

      id v22 = [(VUILibraryViewController *)self contentPresenter];
      [v22 setCurrentContentViewType:1];
    }
    else
    {
      [(VUILibraryViewController *)self _presentDownloadViewController];
    }
    BOOL v23 = [(VUILibraryViewController *)self _isDeviceMediaLibraryInitialUpdateInProgress];
    objc_super v24 = VUIDefaultLogObject();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] Device Media Library Update in progress", (uint8_t *)buf, 2u);
      }

      [(VUILibraryViewController *)self _startMonitoringDeviceMediaLibraryInitialUpdate];
    }
    else
    {
      if (v25)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] Device Media Library already ready", (uint8_t *)buf, 2u);
      }

      [(VUILibraryViewController *)self setHasMenuItemFetchCompleted:1];
      [(VUILibraryViewController *)self _updateViewIfFetchComplete];
    }
    uint64_t v26 = [(VUILibraryViewController *)self contentPresenter];
    v27 = +[VUILocalizationManager sharedInstance];
    v28 = [v27 localizedStringForKey:@"LIBRARY_CLOUD_UPDATE_FAILED_TITLE"];
    [v26 setCloudUpdateFailedTitle:v28];

    v29 = [(VUILibraryViewController *)self contentPresenter];
    v30 = +[VUILocalizationManager sharedInstance];
    v31 = [v30 localizedStringForKey:@"LIBRARY_CLOUD_UPDATE_FAILED_MESSAGE"];
    [v29 setCloudUpdateFailedMessage:v31];

    objc_initWeak(buf, self);
    v32 = (void *)MEMORY[0x1E4FB5180];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __33__VUILibraryViewController_start__block_invoke;
    v42[3] = &unk_1E6DF59E8;
    objc_copyWeak(&v43, buf);
    [v32 isFullTVAppEnabledwithCompletion:v42];
    objc_destroyWeak(&v43);
    objc_destroyWeak(buf);
  }
}

void __33__VUILibraryViewController_start__block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__VUILibraryViewController_start__block_invoke_2;
  v3[3] = &unk_1E6DF5330;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __33__VUILibraryViewController_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v29 = WeakRetained;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = [WeakRetained familyMember];
    if (v3)
    {
      id v4 = (void *)v3;
      char v5 = [v29 familyMember];
      char v6 = [v5 sharingPurchases];

      if ((v6 & 1) == 0)
      {
        objc_super v21 = [v29 contentPresenter];
        id v22 = +[VUILocalizationManager sharedInstance];
        BOOL v23 = [v22 localizedStringForKey:@"LIBRARY_FS_NOT_SHARING_TITLE"];
        [v21 setNoContentErrorTitle:v23];

        objc_super v11 = [v29 contentPresenter];
        uint64_t v12 = NSString;
        v13 = +[VUILocalizationManager sharedInstance];
        v14 = v13;
        uint64_t v15 = @"LIBRARY_FS_NOT_SHARING_DESCRIPTION";
        goto LABEL_8;
      }
    }
    objc_super v7 = [v29 contentPresenter];
    objc_super v8 = +[VUILocalizationManager sharedInstance];
    CGRect v9 = [v8 localizedStringForKey:@"LIBRARY_EMPTY_TITLE_NEW"];
    [v7 setNoContentErrorTitle:v9];

    BOOL v10 = [v29 familyMember];

    objc_super v11 = [v29 contentPresenter];
    if (v10)
    {
      uint64_t v12 = NSString;
      v13 = +[VUILocalizationManager sharedInstance];
      v14 = v13;
      uint64_t v15 = @"LIBRARY_FS_EMPTY_DESCRIPTION";
LABEL_8:
      objc_super v24 = [v13 localizedStringForKey:v15];
      BOOL v25 = [v29 familyMember];
      uint64_t v26 = [v25 firstName];
      v27 = [v12 stringWithValidatedFormat:v24, @"%@", 0, v26 validFormatSpecifiers error];
      [v11 setNoContentErrorMessage:v27];

      goto LABEL_11;
    }
    id v19 = +[VUILocalizationManager sharedInstance];
    v14 = v19;
    char v20 = @"LIBRARY_EMPTY_DESCRIPTION_NEW";
  }
  else
  {
    uint64_t v16 = [WeakRetained contentPresenter];
    v17 = +[VUILocalizationManager sharedInstance];
    objc_super v18 = [v17 localizedStringForKey:@"LIBRARY_EMPTY_TITLE_LIBRARY_ONLY"];
    [v16 setNoContentErrorTitle:v18];

    objc_super v11 = [v29 contentPresenter];
    id v19 = +[VUILocalizationManager sharedInstance];
    v14 = v19;
    char v20 = @"LIBRARY_EMPTY_DESCRIPTION_LIBRARY_ONLY";
  }
  objc_super v24 = [v19 localizedStringForKey:v20];
  [v11 setNoContentErrorMessage:v24];
LABEL_11:

  v28 = [v29 contentPresenter];
  [v28 refreshNoContentViewIfNeeded];
}

void __33__VUILibraryViewController_start__block_invoke_112(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__VUILibraryViewController_start__block_invoke_2_113;
  v3[3] = &unk_1E6DF5330;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __33__VUILibraryViewController_start__block_invoke_2_113(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!*(unsigned char *)(a1 + 40))
  {
    id v10 = WeakRetained;
    uint64_t v3 = [WeakRetained contentPresenter];
    id v4 = +[VUILocalizationManager sharedInstance];
    char v5 = [v4 localizedStringForKey:@"LIBRARY_HS_CONNECTION_FAILED_TITLE"];
    [v3 setNoContentErrorTitle:v5];

    char v6 = [v10 contentPresenter];
    objc_super v7 = +[VUILocalizationManager sharedInstance];
    objc_super v8 = [v7 localizedStringForKey:@"LIBRARY_HS_CONNECTION_FAILED_DESCRIPTION"];
    [v6 setNoContentErrorMessage:v8];

    CGRect v9 = [v10 contentPresenter];
    [v9 setCurrentContentViewType:2];

    id WeakRetained = v10;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0:
      objc_super v7 = [(VUILibraryViewController *)self mediaLibrary];
      int64_t v8 = [v7 type] == 1;

      break;
    case 1:
      uint64_t v9 = 1072;
      goto LABEL_7;
    case 2:
      uint64_t v9 = 1088;
      goto LABEL_7;
    case 3:
      uint64_t v9 = 1120;
LABEL_7:
      int64_t v8 = [*(id *)((char *)&self->super.super.super.super.isa + v9) count];
      break;
    default:
      int64_t v8 = 0;
      break;
  }

  return v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([v7 section])
  {
    case 0:
      int64_t v8 = +[VUILocalizationManager sharedInstance];
      uint64_t v9 = [v8 localizedStringForKey:@"LIBRARY_BANNER_LOCAL"];

      id v10 = NSString;
      objc_super v11 = [(VUILibraryViewController *)self mediaLibrary];
      uint64_t v12 = [v11 title];
      v13 = [v10 stringWithValidatedFormat:v9, @"%@", 0, v12 validFormatSpecifiers error];

      v14 = [v6 dequeueReusableCellWithReuseIdentifier:@"VUILibraryBannerCellReuseIdentifier" forIndexPath:v7];
      uint64_t v15 = [v14 titleLabel];
      uint64_t v16 = [v15 textLayout];
      v17 = [v14 titleLabel];
      id v18 = +[VUILabel labelWithString:v13 textLayout:v16 existingLabel:v17];

      goto LABEL_13;
    case 1:
      id v19 = -[NSArray objectAtIndex:](self->_menuCells, "objectAtIndex:", [v7 row]);
      uint64_t v20 = (int)[v19 intValue];

      uint64_t v9 = [(VUILibraryViewController *)self _symbolNameForCellType:v20];
      v14 = [v6 dequeueReusableCellWithReuseIdentifier:@"VUILibraryMenuCellReuseIdentifier" forIndexPath:v7];
      objc_super v21 = [v14 titleLabel];
      id v22 = [v21 textLayout];

      if ([v9 length])
      {
        BOOL v23 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
        [v22 setColor:v23];
      }
      objc_super v24 = [(VUILibraryViewController *)self _localizedTitleForCellType:v20];
      BOOL v25 = [v14 titleLabel];
      id v26 = +[VUILabel labelWithString:v24 textLayout:v22 existingLabel:v25];

      if ([v7 row])
      {
        [v14 setTopSeparatorView:0];
      }
      else
      {
        v32 = objc_alloc_init(VUISeparatorView);
        [v14 setTopSeparatorView:v32];
      }
      [v14 setImageName:v9];

      goto LABEL_16;
    case 2:
      uint64_t v9 = -[NSArray objectAtIndex:](self->_homeShares, "objectAtIndex:", [v7 row]);
      v14 = [v6 dequeueReusableCellWithReuseIdentifier:@"VUILibraryMenuCellReuseIdentifier" forIndexPath:v7];
      v27 = [v9 title];
      v28 = [v14 titleLabel];
      id v29 = [v28 textLayout];
      v30 = [v14 titleLabel];
      id v31 = +[VUILabel labelWithString:v27 textLayout:v29 existingLabel:v30];

      if (-[NSArray count](self->_menuCells, "count") || [v7 row]) {
        goto LABEL_10;
      }
      goto LABEL_12;
    case 3:
      v14 = [v6 dequeueReusableCellWithReuseIdentifier:@"VUILibraryCollectionCellReuseIdentifier" forIndexPath:v7];
      uint64_t v9 = -[NSMutableArray objectAtIndex:](self->_shelves, "objectAtIndex:", [v7 item]);
      [v14 setViewController:v9];
      if ([v7 row])
      {
LABEL_12:
        v13 = objc_alloc_init(VUISeparatorView);
        [v14 setTopSeparatorView:v13];
LABEL_13:
      }
      else
      {
LABEL_10:
        [v14 setTopSeparatorView:0];
      }
LABEL_16:

      break;
    default:
      v14 = 0;
      break;
  }

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v16 = a4;
  switch([v16 section])
  {
    case 0:
    case 3:
      goto LABEL_9;
    case 1:
      char v5 = -[NSArray objectAtIndex:](self->_menuCells, "objectAtIndex:", [v16 row]);
      uint64_t v6 = (int)[v5 intValue];

      [(VUILibraryViewController *)self _selectLibraryCellType:v6];
      id v7 = [(VUILibraryViewController *)self _categoryForCellType:v6];
      if (v7)
      {
        int64_t v8 = *v7;
        free(v7);
        uint64_t v9 = 1;
        goto LABEL_8;
      }
      uint64_t v9 = 0;
      goto LABEL_7;
    case 2:
      -[NSArray objectAtIndexedSubscript:](self->_homeShares, "objectAtIndexedSubscript:", [v16 row]);
      id v10 = (VUIMediaLibrary *)objc_claimAutoreleasedReturnValue();
      objc_super v11 = [VUILibraryViewController alloc];
      uint64_t v12 = +[VUILibraryMenuDataSourceFactory libraryMenuDataSourceForMediaLibrary:v10];
      v13 = [(VUILibraryViewController *)v11 initWithMenuDataSource:v12];

      currentHomeShareMediaLibrary = self->_currentHomeShareMediaLibrary;
      self->_currentHomeShareMediaLibrary = v10;

      uint64_t v15 = [(VUILibraryViewController *)self navigationController];
      uint64_t v9 = 1;
      [v15 pushViewController:v13 animated:1];

      int64_t v8 = 9;
      goto LABEL_8;
    default:
      uint64_t v9 = 1;
LABEL_7:
      int64_t v8 = 1;
LABEL_8:
      [(VUILibraryViewController *)self setCurrentLibraryCategory:v8];
      [(VUILibraryViewController *)self setCurrentLibraryCategoryIsValid:v9];
      [(VUILibraryViewController *)self setCurrentLibraryCategoryIsFromShelf:0];
LABEL_9:

      return;
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(VUILibraryViewController *)self view];
  [v7 bounds];
  double Width = CGRectGetWidth(v47);

  switch([v6 section])
  {
    case 0:
      uint64_t v9 = +[VUILocalizationManager sharedInstance];
      id v10 = [v9 localizedStringForKey:@"LIBRARY_BANNER_LOCAL"];

      objc_super v11 = NSString;
      uint64_t v12 = [(VUILibraryViewController *)self mediaLibrary];
      v13 = [v12 title];
      v14 = [v11 stringWithValidatedFormat:v10, @"%@", 0, v13 validFormatSpecifiers error];

      bannerViewSizingCell = self->_bannerViewSizingCell;
      if (!bannerViewSizingCell)
      {
        id v16 = [VUILibraryBannerCollectionViewCell alloc];
        v17 = -[VUILibraryBannerCollectionViewCell initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        id v18 = self->_bannerViewSizingCell;
        self->_bannerViewSizingCell = v17;

        bannerViewSizingCell = self->_bannerViewSizingCell;
      }
      id v19 = [(VUILibraryBannerCollectionViewCell *)bannerViewSizingCell titleLabel];
      uint64_t v20 = [v19 textLayout];
      objc_super v21 = [(VUILibraryBannerCollectionViewCell *)self->_bannerViewSizingCell titleLabel];
      id v22 = +[VUILabel labelWithString:v14 textLayout:v20 existingLabel:v21];

      -[VUILibraryBannerCollectionViewCell sizeThatFits:](self->_bannerViewSizingCell, "sizeThatFits:", Width, 1.79769313e308);
      double v24 = v23;

      goto LABEL_9;
    case 1:
      uint64_t v25 = [(NSArray *)self->_menuCells count];
      if (v25 <= [v6 row]) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = [v6 row];
      }
      v36 = [(NSArray *)self->_menuCells objectAtIndex:v26];
      uint64_t v37 = (int)[v36 intValue];

      v38 = [(VUILibraryViewController *)self _localizedTitleForCellType:v37];
      v39 = [(VUILibraryMenuItemViewCell *)self->_menuItemSizingCell titleLabel];
      v40 = [v39 textLayout];
      id v41 = [(VUILibraryMenuItemViewCell *)self->_menuItemSizingCell titleLabel];
      id v42 = +[VUILabel labelWithString:v38 textLayout:v40 existingLabel:v41];

      -[VUILibraryMenuItemViewCell sizeThatFits:](self->_menuItemSizingCell, "sizeThatFits:", Width, 1.79769313e308);
      double v24 = v43;
      break;
    case 2:
      id v10 = -[NSArray objectAtIndexedSubscript:](self->_homeShares, "objectAtIndexedSubscript:", [v6 row]);
      v27 = [v10 title];
      v28 = [(VUILibraryMenuItemViewCell *)self->_menuItemSizingCell titleLabel];
      id v29 = [v28 textLayout];
      v30 = [(VUILibraryMenuItemViewCell *)self->_menuItemSizingCell titleLabel];
      id v31 = +[VUILabel labelWithString:v27 textLayout:v29 existingLabel:v30];

      -[VUILibraryMenuItemViewCell sizeThatFits:](self->_menuItemSizingCell, "sizeThatFits:", Width, 1.79769313e308);
      double v24 = v32;
LABEL_9:

      break;
    case 3:
      v33 = -[NSMutableArray objectAtIndex:](self->_shelves, "objectAtIndex:", [v6 item]);
      v34 = [v33 view];
      objc_msgSend(v34, "sizeThatFits:", Width, 1.79769313e308);
      double v24 = v35;

      break;
    default:
      double Width = *MEMORY[0x1E4F1DB30];
      double v24 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
  }

  double v44 = Width;
  double v45 = v24;
  result.height = v45;
  result.width = v44;
  return result;
}

- (void)seeAllButtonPressed:(id)a3
{
  id v23 = a3;
  if (-[NSMutableArray containsObject:](self->_shelves, "containsObject:"))
  {
    id v4 = [(VUILibraryShelvesDataSource *)self->_shelvesDataSource dataSourcesByShelfType];
    char v5 = [v23 dataSource];
    id v6 = [v4 allKeysForObject:v5];

    if ([v6 count])
    {
      id v7 = [v6 firstObject];
      unint64_t v8 = [v7 unsignedIntegerValue];
      uint64_t v9 = VUILibraryCategoryTypeFromShelfType(v8);
      id v10 = [(VUILibraryViewController *)self familyMember];

      if (v10)
      {
        objc_super v11 = [(VUILibraryViewController *)self familyMember];
        +[VUIMediaEntitiesDataSourceFactory dataSourceForShelf:v8 withFamilyMember:v11];
      }
      else
      {
        uint64_t v12 = [(VUILibraryViewController *)self menuDataSource];
        objc_super v11 = [v12 mediaLibrary];

        +[VUIMediaEntitiesDataSourceFactory dataSourceForShelf:v8 withLibrary:v11];
      v13 = };

      v14 = [[VUILibraryGridCollectionViewController alloc] initWithDataSource:v13 categoryType:v9];
      uint64_t v15 = [(VUILibraryViewController *)self familyMember];
      [(VUILibraryGridCollectionViewController *)v14 setFamilyMember:v15];

      id v16 = [(id)objc_opt_class() _localizedTitleForShelfType:v8];
      [(VUILibraryGridCollectionViewController *)v14 setTitle:v16 withLargeTitleDisplayEnabled:0];

      v17 = [(VUILibraryViewController *)self libraryBarButton];
      [(VUILibraryGridCollectionViewController *)v14 setLibraryBarButton:v17];

      [(VUILibraryGridCollectionViewController *)v14 setForceBackButton:1];
      id v18 = +[VUILibraryMetrics pageStringForLibraryShelfType:v8];
      id v19 = [NSString stringWithFormat:@"%@_%@", @"LibrarySeeAll", v18];
      [(VUILibraryGridCollectionViewController *)v14 setPageType:v19];
      uint64_t v20 = objc_alloc_init(_VUILibrarySeeAllController);
      currentSeeAllController = self->_currentSeeAllController;
      self->_currentSeeAllController = v20;

      [(_VUILibrarySeeAllController *)self->_currentSeeAllController setGridViewController:v14];
      [(_VUILibrarySeeAllController *)self->_currentSeeAllController setShelfType:v8];
      id v22 = [(VUILibraryViewController *)self navigationController];
      [v22 pushViewController:v14 animated:1];
    }
  }
}

- (void)shelfCollectionViewController:(id)a3 collectionView:(id)a4 didSelectMediaEntity:(id)a5 atIndexPath:(id)a6
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(VUILibraryViewController *)self familyMember];
  id v19 = +[VUILibraryViewFactory viewControllerForMediaEntity:v8 withFamilyMember:v10];

  objc_super v11 = NSString;
  uint64_t v12 = [v8 type];
  v13 = [v12 stringDescription];
  v14 = [v11 stringWithFormat:@"Library.id=\"%@\"", v13];

  uint64_t v15 = [v19 view];
  id v16 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:v14];
  [v15 setAccessibilityIdentifier:v16];

  uint64_t v17 = [v9 shelfType];
  [(VUILibraryViewController *)self setCurrentLibraryCategory:[(VUILibraryViewController *)self _categoryForShelfType:v17]];
  [(VUILibraryViewController *)self setCurrentLibraryCategoryIsFromShelf:1];
  [(VUILibraryViewController *)self setCurrentLibraryCategoryIsValid:1];
  id v18 = [(VUILibraryViewController *)self navigationController];
  [v18 pushViewController:v19 animated:1];

  +[VUILibraryMetrics recordClickOnMediaEntity:v8];
}

- (void)shelvesDidFinishWithDataSource:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  if (![(VUILibraryViewController *)self hasBatchChangesInProgress])
  {
    id v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] Shelves datasource fetch completed", buf, 2u);
    }

    char v5 = [MEMORY[0x1E4FB3CF8] sharedInstance];
    char v6 = [v5 isNetworkReachable];

    BOOL v7 = [(VUILibraryViewController *)self hasMediaEntitiesFetchCompleted];
    if (v6)
    {
      if (v7)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id obj = [(VUILibraryViewController *)self validShelfTypes];
        uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (!v8) {
          goto LABEL_22;
        }
        uint64_t v9 = v8;
        uint64_t v22 = *(void *)v25;
        while (1)
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v25 != v22) {
              objc_enumerationMutation(obj);
            }
            objc_super v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
            uint64_t v12 = [v23 dataSourcesByShelfType];
            v13 = [v12 objectForKey:v11];

            v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dataSource == %@", v13];
            uint64_t v15 = [(VUILibraryViewController *)self shelves];
            id v16 = [v15 filteredArrayUsingPredicate:v14];

            uint64_t v17 = [v16 firstObject];
            id v18 = [v13 mediaEntities];
            uint64_t v19 = [v18 count];

            if (!v17)
            {
              if (!v19) {
                goto LABEL_20;
              }
              uint64_t v17 = [[VUILibraryShelfCollectionViewController alloc] initWithDataSource:v13];
              -[VUILibraryViewController _configureShelfViewController:withShelfType:](self, "_configureShelfViewController:withShelfType:", v17, [v11 unsignedIntegerValue]);
              uint64_t v20 = [(VUILibraryViewController *)self shelves];
              [v20 addObject:v17];
              goto LABEL_18;
            }
            if (!v19)
            {
              uint64_t v20 = [(VUILibraryViewController *)self shelves];
              [v20 removeObject:v17];
LABEL_18:

              goto LABEL_19;
            }
            [(VUILibraryShelfCollectionViewController *)v17 updateWithDataSource:v13];
LABEL_19:

LABEL_20:
            ++v10;
          }
          while (v9 != v10);
          uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (!v9)
          {
LABEL_22:

            [(VUILibraryViewController *)self _updateViewIfFetchComplete];
            [(VUILibraryViewController *)self _showContentOrNoContentView];
            goto LABEL_25;
          }
        }
      }
    }
    else if (v7)
    {
      goto LABEL_25;
    }
    [(VUILibraryViewController *)self _constructShelves];
    [(VUILibraryViewController *)self setHasMediaEntitiesFetchCompleted:1];
    [(VUILibraryViewController *)self _updateViewIfFetchComplete];
    goto LABEL_25;
  }
  [(VUILibraryViewController *)self setHasPendingShelvesUpdate:1];
LABEL_25:
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] Datasource fetch completed", v9, 2u);
  }

  char v5 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v6 = [v5 isNetworkReachable];

  BOOL v7 = +[VUIAuthenticationManager userHasActiveAccount];
  BOOL v8 = [(VUILibraryViewController *)self hasMenuItemFetchCompleted];
  if (!v6 || !v7)
  {
    if (v8)
    {
LABEL_10:
      [(VUILibraryViewController *)self _updateViewIfFetchComplete];
      return;
    }
LABEL_9:
    [(VUILibraryViewController *)self setHasMenuItemFetchCompleted:1];
    goto LABEL_10;
  }
  if (!v8) {
    goto LABEL_9;
  }
  if ([(VUILibraryViewController *)self hasBatchChangesInProgress]) {
    [(VUILibraryViewController *)self setHasNewerBatchChanges:1];
  }
  else {
    [(VUILibraryViewController *)self _applyBatchChanges];
  }
}

- (void)familyMemberViewController:(id)a3 didSelectFamilyMember:(id)a4
{
  id v5 = a4;
  id v11 = +[VUILibraryMenuDataSourceFactory libraryMenuDataSourceForFamilyMember:v5];
  int v6 = [[VUILibraryViewController alloc] initWithMenuDataSource:v11 familyMember:v5];

  BOOL v7 = [NSString stringWithFormat:@"Library.id=\"%@\", @"FamilyMemberLibrary""];
  BOOL v8 = [(VUILibraryViewController *)v6 view];
  uint64_t v9 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:v7];
  [v8 setAccessibilityIdentifier:v9];

  uint64_t v10 = [(VUILibraryViewController *)self navigationController];
  [v10 pushViewController:v6 animated:1];
}

- (id)_dataSourceForShelves
{
  uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  validShelfTypes = self->_validShelfTypes;
  self->_validShelfTypes = v3;

  id v5 = [(VUILibraryViewController *)self familyMember];
  if (v5)
  {
  }
  else
  {
    int v6 = [(VUILibraryViewController *)self mediaLibrary];
    uint64_t v7 = [v6 type];

    if (!v7) {
      [(NSMutableArray *)self->_validShelfTypes addObject:&unk_1F3F3D5F8];
    }
  }
  [(NSMutableArray *)self->_validShelfTypes addObject:&unk_1F3F3D610];
  [(NSMutableArray *)self->_validShelfTypes addObject:&unk_1F3F3D628];
  BOOL v8 = [(VUILibraryViewController *)self familyMember];
  if (v8)
  {
  }
  else if (self->_doesDeviceSupportHDR)
  {
    [(NSMutableArray *)self->_validShelfTypes addObject:&unk_1F3F3D640];
  }
  uint64_t v9 = [(VUILibraryViewController *)self familyMember];

  if (v9)
  {
    uint64_t v10 = [VUIFamilySharingLibraryShelvesDataSource alloc];
    id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_validShelfTypes];
    uint64_t v12 = [(VUILibraryViewController *)self familyMember];
    uint64_t v13 = [(VUIFamilySharingLibraryShelvesDataSource *)v10 initWithValidShelfTypes:v11 withFamilyMember:v12];
  }
  else
  {
    v14 = [VUIMPLibraryShelvesDataSource alloc];
    id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_validShelfTypes];
    uint64_t v12 = [(VUILibraryViewController *)self mediaLibrary];
    uint64_t v13 = [(VUIMPLibraryShelvesDataSource *)v14 initWithValidShelfTypes:v11 forMediaLibrary:v12];
  }
  uint64_t v15 = (void *)v13;

  [v15 setShelvesDelegate:self];
  [v15 startFetch];
  return v15;
}

- (BOOL)_haveAllInitialFetchesCompleted
{
  return self->_hasMenuItemFetchCompleted && self->_hasMediaEntitiesFetchCompleted;
}

- (void)_updateViewIfFetchComplete
{
  if ([(VUILibraryViewController *)self _haveAllInitialFetchesCompleted])
  {
    [(VUILibraryViewController *)self _constructLibraryDataSourceAndUpdateActiveView];
  }
}

- (id)_menuItems
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [(VUILibraryViewController *)self menuDataSource];
  uint64_t v3 = [v2 menuItems];
  id v4 = [v3 mainMenuItemsWithDefaultItemsForIphone];
  id v5 = (void *)[v4 copy];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    char v26 = 0;
    char v10 = 0;
    char v11 = 0;
    char v12 = 0;
    char v13 = 0;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v6);
        }
        id v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v16 longValue] == 2)
        {
          char v12 = 1;
        }
        else if ([v16 longValue] == 3)
        {
          char v13 = 1;
        }
        else if ([v16 longValue] == 5)
        {
          char v11 = 1;
        }
        else if ([v16 longValue] == 7)
        {
          char v9 = 1;
        }
        else if ([v16 longValue] == 8)
        {
          char v26 = 1;
        }
        else
        {
          v10 |= [v16 longValue] == 0;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
    char v26 = 0;
    char v10 = 0;
    char v11 = 0;
    char v12 = 0;
    char v13 = 0;
  }

  uint64_t v17 = objc_opt_new();
  id v18 = v17;
  if (v10)
  {
    [v17 addObject:&unk_1F3F3D658];
    if ((v13 & 1) == 0)
    {
LABEL_23:
      if ((v12 & 1) == 0) {
        goto LABEL_24;
      }
      goto LABEL_36;
    }
  }
  else if ((v13 & 1) == 0)
  {
    goto LABEL_23;
  }
  [v18 addObject:&unk_1F3F3D628];
  if ((v12 & 1) == 0)
  {
LABEL_24:
    if ((v11 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v18 addObject:&unk_1F3F3D610];
  if ((v11 & 1) == 0)
  {
LABEL_25:
    if ((v9 & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_37:
  [v18 addObject:&unk_1F3F3D640];
  if (v9) {
LABEL_26:
  }
    [v18 addObject:&unk_1F3F3D670];
LABEL_27:
  if (v26) {
    [v18 addObject:&unk_1F3F3D688];
  }
  uint64_t v19 = [(VUILibraryViewController *)self menuDataSource];
  uint64_t v20 = [v19 menuItems];
  objc_super v21 = [v20 genreMenuItems];
  uint64_t v22 = [v21 count];

  if (v22) {
    [v18 addObject:&unk_1F3F3D6A0];
  }
  id v23 = (void *)[v18 copy];

  return v23;
}

- (void)_constructLibraryDataSourceAndUpdateActiveView
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUILibraryViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:0];

  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v5 = [(NSArray *)self->_menuCells count];
    *(_DWORD *)buf = 134217984;
    NSUInteger v24 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] before update, menu cells count is %lu", buf, 0xCu);
  }

  if ([(VUILibraryViewController *)self hasBatchChangesInProgress])
  {
    [(VUILibraryViewController *)self setHasNewerBatchChanges:1];
  }
  else
  {
    id v6 = [(VUILibraryViewController *)self _menuItems];
    menuCells = self->_menuCells;
    self->_menuCells = v6;
  }
  uint64_t v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v9 = [(NSArray *)self->_menuCells count];
    *(_DWORD *)buf = 134217984;
    NSUInteger v24 = v9;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] after update, menu cells count is %lu", buf, 0xCu);
  }

  char v10 = [(VUILibraryViewController *)self mediaLibrary];
  if ([v10 type]) {
    goto LABEL_14;
  }
  char v11 = [(VUILibraryViewController *)self menuDataSource];
  char v12 = [v11 validCategories];
  int v13 = [v12 containsObject:&unk_1F3F3D6B8];

  if (v13)
  {
    char v10 = +[VUIMediaLibraryManager defaultManager];
    uint64_t v14 = [v10 homeShareMediaLibraries];
    uint64_t v15 = (void *)v14;
    if (v14) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = MEMORY[0x1E4F1CBF0];
    }
    [(VUILibraryViewController *)self setHomeShares:v16];

LABEL_14:
  }
  uint64_t v17 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v18 = [v17 isNetworkReachable];

  if (v18
    && (+[VUIAuthenticationManager userHasActiveAccount]
     || ![(VUILibraryViewController *)self _downloadsAreAvailable]))
  {
    [(VUILibraryViewController *)self _removeDownloadViewController];
    [(VUILibraryViewController *)self _showContentOrNoContentView];
    if (![(VUILibraryViewController *)self hasBatchChangesInProgress])
    {
      uint64_t v19 = [(VUILibraryStackViewController *)self stackCollectionView];
      [v19 reloadData];
    }
    if (!self->_ppt_isLoaded)
    {
      dispatch_time_t v20 = dispatch_time(0, 10000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__VUILibraryViewController__constructLibraryDataSourceAndUpdateActiveView__block_invoke;
      block[3] = &unk_1E6DF3D58;
      block[4] = self;
      dispatch_after(v20, MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    [(VUILibraryViewController *)self _presentDownloadViewController];
  }
  [(VUILibraryViewController *)self setNeedsStatusBarAppearanceUpdate];
  objc_super v21 = [(VUILibraryViewController *)self navigationController];
  [v21 setNeedsStatusBarAppearanceUpdate];
}

void __74__VUILibraryViewController__constructLibraryDataSourceAndUpdateActiveView__block_invoke(uint64_t a1)
{
  v2 = *MEMORY[0x1E4FA9D28];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4FA9D28]))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PerceivedLaunch", "", v8, 2u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1016) = 1;
  uint64_t v3 = (id *)MEMORY[0x1E4FB2608];
  if ([(id)*MEMORY[0x1E4FB2608] shouldRecordExtendedLaunchTime])
  {
    id v4 = *v3;
    NSUInteger v5 = [*v3 _launchTestName];
    LODWORD(v4) = [v4 isRunningTest:v5];

    if (v4)
    {
      id v6 = *v3;
      uint64_t v7 = [*v3 _launchTestName];
      [v6 finishedTest:v7 extraResults:0];
    }
  }
}

- (void)_applyBatchChanges
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  [(VUILibraryViewController *)self setHasBatchChangesInProgress:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke;
  aBlock[3] = &unk_1E6DFBFD0;
  aBlock[4] = self;
  uint64_t v3 = _Block_copy(aBlock);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke_4;
  v45[3] = &unk_1E6DF5B20;
  v45[4] = self;
  id v4 = _Block_copy(v45);
  uint64_t v5 = [(VUILibraryViewController *)self _menuItems];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB3C58]);
  uint64_t v7 = [(VUILibraryViewController *)self menuCells];
  long long v30 = v6;
  id v31 = (void *)v5;
  uint64_t v8 = [v6 changeSetFromObjects:v7 toObjects:v5 identifierBlock:&__block_literal_global_136 isEqualBlock:0];

  int v9 = [v8 hasChanges];
  char v10 = [(VUILibraryViewController *)self homeShares];
  char v11 = +[VUIMediaLibraryManager defaultManager];
  uint64_t v12 = [v11 homeShareMediaLibraries];
  int v13 = (void *)v12;
  uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
  if (v12) {
    uint64_t v14 = (void *)v12;
  }
  id v15 = v14;

  id v29 = objc_alloc_init(MEMORY[0x1E4FB3C58]);
  uint64_t v16 = [v29 changeSetFromObjects:v10 toObjects:v15 identifierBlock:&__block_literal_global_173 isEqualBlock:0];
  int v17 = [v16 hasChanges];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke_7;
  v38[3] = &unk_1E6DFC060;
  id v18 = v10;
  id v39 = v18;
  id v19 = v15;
  id v40 = v19;
  id v20 = v16;
  id v41 = v20;
  id v42 = self;
  id v21 = v3;
  id v43 = v21;
  id v22 = v4;
  id v44 = v22;
  id v23 = _Block_copy(v38);
  NSUInteger v24 = v23;
  if (v9)
  {
    uint64_t v25 = VUIDefaultLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      menuCells = self->_menuCells;
      *(_DWORD *)buf = 138412802;
      v48 = menuCells;
      __int16 v49 = 2112;
      v50 = v31;
      __int16 v51 = 2112;
      v52 = v8;
      _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "Apply ChangeSet To The Categories Section: Current Menu Items: %@, Latest Menu Items: %@, Changes: %@", buf, 0x20u);
    }

    long long v27 = [(VUILibraryStackViewController *)self stackCollectionView];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke_176;
    v36[3] = &unk_1E6DFC038;
    v36[4] = self;
    long long v28 = v31;
    id v37 = v31;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke_2_177;
    v32[3] = &unk_1E6DFC088;
    char v35 = v17;
    id v33 = v24;
    id v34 = v22;
    objc_msgSend(v27, "vui_applyChangeSet:inSection:updateDataSourceBlock:applyChangeBlock:completionHandler:", v8, 1, v36, v21, v32);
  }
  else
  {
    if (v17) {
      (*((void (**)(void *))v23 + 2))(v23);
    }
    else {
      [(VUILibraryViewController *)self setHasBatchChangesInProgress:0];
    }
    long long v28 = v31;
  }
}

uint64_t __46__VUILibraryViewController__applyBatchChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [v5 changeKind];
  if (v6 == 1)
  {
    uint64_t v7 = [v5 destinationIndexes];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    int v17 = __46__VUILibraryViewController__applyBatchChanges__block_invoke_3;
    id v18 = &unk_1E6DF7F48;
    int v9 = (id *)v19;
    v19[0] = v12;
    v19[1] = a2;
    id v10 = v12;
    [v7 enumerateIndexesUsingBlock:&v15];
    char v11 = objc_msgSend(*(id *)(a1 + 32), "stackCollectionView", v15, v16, v17, v18);
    [v11 insertItemsAtIndexPaths:v10];
  }
  else
  {
    if (v6 != 2)
    {
      uint64_t v13 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [v5 sourceIndexes];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke_2;
    v20[3] = &unk_1E6DF7F48;
    int v9 = (id *)v21;
    v21[0] = v8;
    v21[1] = a2;
    id v10 = v8;
    [v7 enumerateIndexesUsingBlock:v20];
    char v11 = [*(id *)(a1 + 32) stackCollectionView];
    [v11 deleteItemsAtIndexPaths:v10];
  }

  uint64_t v13 = 1;
LABEL_7:

  return v13;
}

void __46__VUILibraryViewController__applyBatchChanges__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

void __46__VUILibraryViewController__applyBatchChanges__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:a2 inSection:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

void __46__VUILibraryViewController__applyBatchChanges__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateVisibleCellSeparators];
  [*(id *)(a1 + 32) setHasBatchChangesInProgress:0];
  int v2 = [*(id *)(a1 + 32) hasNewerBatchChanges];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setHasNewerBatchChanges:0];
    id v4 = *(void **)(a1 + 32);
    [v4 _applyBatchChanges];
  }
  else
  {
    int v5 = [v3 hasPendingShelvesUpdate];
    uint64_t v6 = *(void **)(a1 + 32);
    if (v5)
    {
      [v6 setHasPendingShelvesUpdate:0];
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = [v7 shelvesDataSource];
      [v7 shelvesDidFinishWithDataSource:v8];
    }
    else
    {
      [v6 _showContentOrNoContentView];
    }
  }
}

id __46__VUILibraryViewController__applyBatchChanges__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __46__VUILibraryViewController__applyBatchChanges__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __46__VUILibraryViewController__applyBatchChanges__block_invoke_7(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_INFO, "Apply ChangeSet To The Home Shares Section: Current Home Shares: %@, Latest Home Shares: %@, ChangeSet: %@", buf, 0x20u);
  }

  uint64_t v6 = [*(id *)(a1 + 56) stackCollectionView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__VUILibraryViewController__applyBatchChanges__block_invoke_174;
  v8[3] = &unk_1E6DFC038;
  uint64_t v7 = *(void *)(a1 + 48);
  void v8[4] = *(void *)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  objc_msgSend(v6, "vui_applyChangeSet:inSection:updateDataSourceBlock:applyChangeBlock:completionHandler:", v7, 2, v8, *(void *)(a1 + 64), *(void *)(a1 + 72));
}

void __46__VUILibraryViewController__applyBatchChanges__block_invoke_174(uint64_t a1)
{
}

void __46__VUILibraryViewController__applyBatchChanges__block_invoke_176(uint64_t a1)
{
}

uint64_t __46__VUILibraryViewController__applyBatchChanges__block_invoke_2_177(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)_shouldShowContentView
{
  BOOL v3 = [(NSArray *)self->_menuCells count]
    || [(NSArray *)self->_homeShares count]
    || [(NSMutableArray *)self->_shelves count] != 0;
  return v3 & +[VUIAuthenticationManager userHasActiveAccount];
}

- (void)_showContentOrNoContentView
{
  if ([(VUILibraryViewController *)self _shouldShowContentView])
  {
    uint64_t v3 = 3;
  }
  else
  {
    if ([(VUILibraryViewController *)self _didFailUpdateCloudLibrary]) {
      uint64_t v3 = 4;
    }
    else {
      uint64_t v3 = 2;
    }
    [(VUILibraryViewController *)self _startMonitoringDeviceMediaLibraryInitialUpdate];
  }
  id v4 = [(VUILibraryViewController *)self contentPresenter];
  [v4 setCurrentContentViewType:v3];
}

- (void)_updateNavigationTitle
{
  id v5 = [(VUILibraryViewController *)self navigationItem];
  uint64_t v3 = [(VUILibraryViewController *)self _navigationBarTitle];
  [v5 setTitle:v3];
  if ([MEMORY[0x1E4FB3C90] isPhone]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  [v5 setLargeTitleDisplayMode:v4];
  [v5 _setSupportsTwoLineLargeTitles:1];
}

- (void)_setupNavigationItemAccessoryView
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Library:: appController doesn't exists, other tabs is not showing; don't display account setting button",
    v1,
    2u);
}

- (void)_resetNavigationBar
{
  id v2 = [(VUILibraryViewController *)self navigationController];
  id v4 = [v2 navigationBar];

  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  [v4 setTintColor:v3];

  [v4 _setTitleOpacity:1.0];
  [v4 _setBackgroundOpacity:1.0];
  [v4 setPrefersLargeTitles:1];
}

- (void)_selectLibraryCellType:(int64_t)a3
{
  -[VUILibraryViewController _viewControllerWithCellType:](self, "_viewControllerWithCellType:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(VUILibraryViewController *)self navigationController];
  uint64_t v6 = v5;
  if (a3 == 6)
  {
    id v7 = (id)[v5 popToViewController:self animated:0];
  }
  else if (v8)
  {
    [v5 pushViewController:v8 animated:1];
  }
}

- (id)_viewControllerWithCellType:(int64_t)a3
{
  uint64_t v3 = 0;
  uint64_t v6 = 0;
  switch(a3)
  {
    case 1:
      id v7 = [(VUILibraryViewController *)self familyMember];

      if (v7)
      {
        id v8 = [(VUILibraryViewController *)self familyMember];
        uint64_t v9 = 2;
        uint64_t v10 = 2;
        goto LABEL_6;
      }
      id v33 = [(VUILibraryViewController *)self menuDataSource];
      id v8 = [v33 mediaLibrary];

      uint64_t v9 = 2;
      uint64_t v13 = 2;
      goto LABEL_19;
    case 2:
      uint64_t v11 = [(VUILibraryViewController *)self familyMember];

      if (v11)
      {
        id v8 = [(VUILibraryViewController *)self familyMember];
        uint64_t v9 = 3;
        uint64_t v10 = 3;
LABEL_6:
        uint64_t v12 = +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:v10 withFamilyMember:v8];
      }
      else
      {
        id v34 = [(VUILibraryViewController *)self menuDataSource];
        id v8 = [v34 mediaLibrary];

        uint64_t v9 = 3;
        uint64_t v13 = 3;
LABEL_19:
        uint64_t v12 = +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:v13 withLibrary:v8];
      }
      uint64_t v3 = (void *)v12;
LABEL_21:

      if (v3)
      {
        uint64_t v6 = [[VUILibraryGridCollectionViewController alloc] initWithDataSource:v3 categoryType:v9];
        char v35 = [(VUILibraryViewController *)self familyMember];
        [(VUILibraryGridCollectionViewController *)v6 setFamilyMember:v35];

        v36 = [(VUILibraryViewController *)self _localizedTitleForCellType:a3];
        [(VUILibraryGridCollectionViewController *)v6 setTitle:v36 withLargeTitleDisplayEnabled:1];

        id v37 = [(VUILibraryViewController *)self libraryBarButton];
        [(VUILibraryGridCollectionViewController *)v6 setLibraryBarButton:v37];

        __int16 v14 = +[VUILibraryMetrics pageStringForLibraryCellType:a3];
        v38 = @"LibraryMain";
        id v39 = [(VUILibraryViewController *)self familyMember];

        if (v39)
        {
          id v40 = @"FamilySharingLibraryMain";

          v38 = v40;
        }
        id v41 = [NSString stringWithFormat:@"%@_%@", v38, v14];
        [(VUILibraryGridCollectionViewController *)v6 setPageType:v41];

LABEL_25:
      }
      else
      {
        uint64_t v6 = 0;
      }
LABEL_27:

      return v6;
    case 3:
      id v8 = [(VUILibraryViewController *)self mediaLibrary];
      uint64_t v9 = 5;
      uint64_t v13 = 5;
      goto LABEL_19;
    case 4:
      __int16 v14 = objc_alloc_init(VUILibraryFamilyMembersDataSource);
      uint64_t v15 = [[VUIFamilyMembersViewController alloc] initWithDataSource:v14];
      uint64_t v6 = (VUILibraryGridCollectionViewController *)v15;
      goto LABEL_14;
    case 5:
      uint64_t v16 = (void *)MEMORY[0x1E4FB1F48];
      int v17 = [(VUILibraryViewController *)self view];
      [v17 bounds];
      unint64_t v18 = objc_msgSend(v16, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v44));

      id v19 = +[VUIMediaLibraryManager defaultManager];
      id v20 = [v19 aggregateMediaLibrary];
      __int16 v14 = +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:8 withLibrary:v20];

      id v21 = &off_1E6DF2700;
      if (v18 >= 3) {
        id v21 = off_1E6DF26F0;
      }
      uint64_t v6 = (VUILibraryGridCollectionViewController *)[objc_alloc(*v21) initWithDataSource:v14];
      goto LABEL_15;
    case 6:
      goto LABEL_27;
    case 7:
      id v22 = [(VUILibraryViewController *)self menuDataSource];
      id v8 = [v22 mediaLibrary];

      uint64_t v3 = +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:0 withLibrary:v8];
      uint64_t v9 = 0;
      goto LABEL_21;
    case 8:
      id v23 = [VUIMenuDataSource alloc];
      NSUInteger v24 = [MEMORY[0x1E4F1C978] array];
      uint64_t v25 = [(VUILibraryViewController *)self menuDataSource];
      char v26 = [v25 menuItems];
      long long v27 = [v26 genreMenuItems];
      __int16 v14 = [(VUIMenuDataSource *)v23 initWithMainMenuItems:v24 genreMenuItems:v27];

      long long v28 = [(VUILibraryViewController *)self menuDataSource];
      id v29 = [v28 menuItems];
      long long v30 = [v29 genreTypes];
      [(VUILibraryFamilyMembersDataSource *)v14 setGenreTypes:v30];

      id v31 = [VUIMenuCollectionViewController alloc];
      uint64_t v32 = objc_alloc_init(VUILibraryGenresMenuCollectionConfiguration);
      uint64_t v6 = [(VUIMenuCollectionViewController *)v31 initWithCategories:v14 gridConfiguration:v32];

      [(VUILibraryGridCollectionViewController *)v6 setShouldDeselectOnViewAppear:1];
      uint64_t v15 = (VUIFamilyMembersViewController *)v6;
LABEL_14:
      [(VUIFamilyMembersViewController *)v15 setDelegate:self];
LABEL_15:
      uint64_t v3 = 0;
      goto LABEL_25;
    default:
      uint64_t v6 = 0;
      goto LABEL_27;
  }
}

- (void)_homeShareMediaLibrariesDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:@"VUIMediaLibraryManagerHomeSharesDidChangeUserInfoKeyMediaLibraries"];
  id v7 = [v5 objectForKey:@"VUIMediaLibraryManagerHomeSharesDidChangeUserInfoKeyChangeSet"];
  if ([(VUILibraryViewController *)self _haveAllInitialFetchesCompleted])
  {
    id v8 = [(VUILibraryViewController *)self homeShares];
    uint64_t v9 = objc_msgSend(v8, "vui_arrayByApplyingChangeSet:destinationObjects:", v7, v6);
    uint64_t v10 = v9;
    if (self->_currentHomeShareMediaLibrary && (objc_msgSend(v9, "containsObject:") & 1) == 0)
    {
      objc_initWeak(&location, self);
      uint64_t v11 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v12 = +[VUILocalizationManager sharedInstance];
      uint64_t v13 = [v12 localizedStringForKey:@"LIBRARY_HS_UNAVAILABLE"];
      unint64_t v18 = [v11 alertControllerWithTitle:0 message:v13 preferredStyle:1];

      __int16 v14 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v15 = +[VUILocalizationManager sharedInstance];
      uint64_t v16 = [v15 localizedStringForKey:@"OK"];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      void v19[2] = __62__VUILibraryViewController__homeShareMediaLibrariesDidChange___block_invoke;
      v19[3] = &unk_1E6DFC0B0;
      objc_copyWeak(&v20, &location);
      v19[4] = self;
      int v17 = [v14 actionWithTitle:v16 style:0 handler:v19];

      [v18 addAction:v17];
      [(UIViewController *)self vui_presentViewController:v18 animated:1 completion:0];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    if (v7 && [v7 hasChanges])
    {
      if ([(VUILibraryViewController *)self hasBatchChangesInProgress]) {
        [(VUILibraryViewController *)self setHasNewerBatchChanges:1];
      }
      else {
        [(VUILibraryViewController *)self _applyBatchChanges];
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_homeShares, v10);
    }
  }
  else
  {
    [(VUILibraryViewController *)self setHomeShares:v6];
  }
}

void __62__VUILibraryViewController__homeShareMediaLibrariesDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained navigationController];
  id v3 = (id)[v2 popToViewController:*(void *)(a1 + 32) animated:1];
}

- (void)didSelectMenuItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(VUILibraryViewController *)self menuDataSource];
  uint64_t v6 = [v5 menuItems];
  id v22 = [v6 genreMenuItems];

  uint64_t v7 = [v4 row];
  id v8 = [v22 objectAtIndex:v7];
  uint64_t v9 = [(VUILibraryViewController *)self familyMember];

  if (v9)
  {
    uint64_t v10 = [(VUILibraryViewController *)self menuDataSource];
    uint64_t v11 = [v10 getGenreByGenreTitle:v8];

    uint64_t v12 = [(VUILibraryViewController *)self familyMember];
    uint64_t v13 = +[VUIMediaEntitiesDataSourceFactory dataSourceForGenre:v11 withFamilyMember:v12];

    if (!v13) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v13 = +[VUIMediaEntitiesDataSourceFactory dataSourceForGenre:v8 withLibrary:self->_mediaLibrary];
    if (!v13) {
      goto LABEL_8;
    }
  }
  __int16 v14 = [[VUILibraryGridCollectionViewController alloc] initWithDataSource:v13 categoryType:10];
  [(VUILibraryGridCollectionViewController *)v14 setTitle:v8 withLargeTitleDisplayEnabled:1];
  uint64_t v15 = [(VUILibraryViewController *)self libraryBarButton];
  [(VUILibraryGridCollectionViewController *)v14 setLibraryBarButton:v15];

  uint64_t v16 = [v8 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F3E921E0];
  int v17 = @"LibraryMain";
  unint64_t v18 = [(VUILibraryViewController *)self familyMember];

  if (v18)
  {
    id v19 = @"FamilySharingLibraryMain";

    int v17 = v19;
  }
  id v20 = [NSString stringWithFormat:@"%@_%@", v17, v16];
  [(VUILibraryGridCollectionViewController *)v14 setPageType:v20];
  id v21 = [(VUILibraryViewController *)self navigationController];
  [v21 pushViewController:v14 animated:1];

LABEL_8:
}

- (void)_networkReachabilityDidChange:(id)a3
{
  id v14 = [a3 userInfo];
  id v4 = objc_msgSend(v14, "vui_numberForKey:", *MEMORY[0x1E4FB3E10]);
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = [(VUILibraryViewController *)self navigationController];
    id v7 = (id)[v6 popToViewController:self animated:0];

    [(VUILibraryViewController *)self _resetNavigationBar];
    if (self->_presentedDownloadViewController)
    {
      [(VUILibraryViewController *)self _removeDownloadViewController];
      presentedDownloadViewController = self->_presentedDownloadViewController;
      self->_presentedDownloadViewController = 0;
    }
    else
    {
      [(VUILibraryViewController *)self setCurrentLibraryCategoryIsValid:0];
    }
  }
  else if (!self->_presentedDownloadViewController)
  {
    [(VUILibraryViewController *)self _resetNavigationBar];
    uint64_t v9 = +[VUIMediaLibraryManager defaultManager];
    uint64_t v10 = [v9 aggregateMediaLibrary];
    uint64_t v11 = +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:8 withLibrary:v10];

    uint64_t v12 = [[VUIDownloadTableViewController alloc] initWithDataSource:v11];
    uint64_t v13 = self->_presentedDownloadViewController;
    self->_presentedDownloadViewController = v12;

    [(VUILibraryViewController *)self _presentDownloadViewController];
  }
}

- (id)_deviceMediaLibrary
{
  id v2 = [(VUILibraryViewController *)self mediaLibrary];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)_isDeviceMediaLibraryInitialUpdateInProgress
{
  id v2 = [(VUILibraryViewController *)self _deviceMediaLibrary];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isInitialUpdateInProgress];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_didFailUpdateCloudLibrary
{
  id v2 = [(VUILibraryViewController *)self _deviceMediaLibrary];
  if (v2
    && +[VUIAuthenticationManager userHasActiveAccount])
  {
    char v3 = [v2 didFailUpdateCloudLibrary];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (void)_startMonitoringDeviceMediaLibraryInitialUpdate
{
  id v4 = [(VUILibraryViewController *)self _deviceMediaLibrary];
  if (v4)
  {
    char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__deviceMediaLibraryUpdateStateDidChange_ name:@"VUIDeviceMediaLibraryUpdateStateDidChangeNotification" object:v4];
  }
}

- (void)_stopMonitoringDeviceMediaLibraryInitialUpdate
{
  id v4 = [(VUILibraryViewController *)self _deviceMediaLibrary];
  if (v4)
  {
    char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:@"VUIDeviceMediaLibraryUpdateStateDidChangeNotification" object:v4];
  }
}

- (void)_deviceMediaLibraryUpdateStateDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] Media Library Update state changed", (uint8_t *)&v14, 2u);
  }

  if (!+[VUIAuthenticationManager userHasActiveAccount])
  {
    if ([(VUILibraryViewController *)self _downloadsAreAvailable])
    {
      [(VUILibraryViewController *)self _presentDownloadViewController];
      return;
    }
    uint64_t v9 = [(VUILibraryViewController *)self contentPresenter];
    uint64_t v10 = v9;
    uint64_t v11 = 2;
    goto LABEL_15;
  }
  BOOL v5 = [(VUILibraryViewController *)self _isDeviceMediaLibraryInitialUpdateInProgress];
  uint64_t v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = VUIBoolLogString();
    int v14 = 138412290;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] Media library is update in progress:%@", (uint8_t *)&v14, 0xCu);
  }
  if (v5)
  {
    id v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "[VUILibraryViewController] _deviceMediaLibraryUpdateStateDidChange - update content view type to loading", (uint8_t *)&v14, 2u);
    }

    uint64_t v9 = [(VUILibraryViewController *)self contentPresenter];
    uint64_t v10 = v9;
    uint64_t v11 = 1;
LABEL_15:
    [v9 setCurrentContentViewType:v11];
    goto LABEL_16;
  }
  [(VUILibraryViewController *)self setHasMenuItemFetchCompleted:0];
  [(VUILibraryViewController *)self setHasMediaEntitiesFetchCompleted:0];
  [(VUILibraryViewController *)self _stopMonitoringDeviceMediaLibraryInitialUpdate];
  uint64_t v12 = [(VUILibraryViewController *)self menuDataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return;
  }
  uint64_t v10 = [(VUILibraryViewController *)self menuDataSource];
  [v10 refetch];
LABEL_16:
}

- (void)_addMediaLibraryNotificationObservers
{
  char v3 = [(VUILibraryViewController *)self _deviceMediaLibrary];
  if (v3)
  {
    id v4 = v3;
    [(VUILibraryViewController *)self _addNotificationObserversWithDeviceLibrary:v3];
    char v3 = v4;
  }
}

- (void)_addNotificationObserversWithDeviceLibrary:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addObserver:self selector:sel__homeShareMediaLibrariesDidChange_ name:@"VUIMediaLibraryManagerHomeSharesDidChangeNotification" object:0];
  [v4 addObserver:self selector:sel__networkReachabilityDidChange_ name:*MEMORY[0x1E4FB3E08] object:0];
}

- (void)_removeMediaLibraryNotificationObservers
{
  char v3 = [(VUILibraryViewController *)self _deviceMediaLibrary];
  if (v3)
  {
    id v4 = v3;
    [(VUILibraryViewController *)self _removeNotificationObserversWithDeviceLibrary:v3];
    char v3 = v4;
  }
}

- (void)_removeNotificationObserversWithDeviceLibrary:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeObserver:self name:@"VUIMediaLibraryManagerHomeSharesDidChangeNotification" object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB3E08] object:0];
  [(VUILibraryViewController *)self _stopMonitoringDeviceMediaLibraryInitialUpdate];
}

- (void)_configureShelfViewController:(id)a3 withShelfType:(int64_t)a4
{
  id v6 = a3;
  id v13 = [(id)objc_opt_class() _localizedTitleForShelfType:a4];
  if (a4 == 3)
  {
    id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    uint64_t v9 = +[VUILocalizationManager sharedInstance];
    uint64_t v10 = v9;
    if (v8) {
      uint64_t v11 = @"LIBRARY_HDR_SUBTITLE_PAD";
    }
    else {
      uint64_t v11 = @"LIBRARY_HDR_SUBTITLE_PHONE";
    }
    uint64_t v12 = [v9 localizedStringForKey:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }
  [v6 setHeaderTitle:v13 andSubtitle:v12];
  [v6 setShelfType:a4];
  [v6 setDelegate:self];
}

- (void)_constructShelves
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v3 = [(VUILibraryViewController *)self shelves];
  [v3 removeAllObjects];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(VUILibraryViewController *)self validShelfTypes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        uint64_t v10 = [(VUILibraryViewController *)self shelvesDataSource];
        uint64_t v11 = [v10 dataSourcesByShelfType];
        uint64_t v12 = [v11 objectForKey:v9];

        id v13 = [v12 mediaEntities];
        uint64_t v14 = [v13 count];

        if (v14)
        {
          uint64_t v15 = [[VUILibraryShelfCollectionViewController alloc] initWithDataSource:v12];
          -[VUILibraryViewController _configureShelfViewController:withShelfType:](self, "_configureShelfViewController:withShelfType:", v15, [v9 unsignedIntegerValue]);
          uint64_t v16 = [(VUILibraryViewController *)self shelves];
          [v16 addObject:v15];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

+ (id)shelfTypesSortComparator
{
  return &__block_literal_global_221;
}

uint64_t __52__VUILibraryViewController_shelfTypesSortComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)_localizedTitleForShelfType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      char v3 = +[VUILocalizationManager sharedInstance];
      id v4 = v3;
      uint64_t v5 = @"RENTALS";
      goto LABEL_7;
    case 1:
      char v3 = +[VUILocalizationManager sharedInstance];
      id v4 = v3;
      uint64_t v5 = @"LIBRARY_RECENT_SHOWS";
      goto LABEL_7;
    case 2:
      char v3 = +[VUILocalizationManager sharedInstance];
      id v4 = v3;
      uint64_t v5 = @"LIBRARY_RECENT_MOVIES";
      goto LABEL_7;
    case 3:
      char v3 = +[VUILocalizationManager sharedInstance];
      id v4 = v3;
      uint64_t v5 = @"LIBRARY_HDR_TITLE";
LABEL_7:
      uint64_t v6 = [v3 localizedStringForKey:v5];

      break;
    default:
      uint64_t v6 = &stru_1F3E921E0;
      break;
  }
  return v6;
}

- (id)_localizedTitleForCellType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      char v3 = +[VUILocalizationManager sharedInstance];
      id v4 = v3;
      uint64_t v5 = @"LIBRARY_MOVIES";
      goto LABEL_11;
    case 2:
      char v3 = +[VUILocalizationManager sharedInstance];
      id v4 = v3;
      uint64_t v5 = @"LIBRARY_TVSHOWS";
      goto LABEL_11;
    case 3:
      char v3 = +[VUILocalizationManager sharedInstance];
      id v4 = v3;
      uint64_t v5 = @"LIBRARY_HOME_VIDEOS";
      goto LABEL_11;
    case 4:
      char v3 = +[VUILocalizationManager sharedInstance];
      id v4 = v3;
      uint64_t v5 = @"LIBRARY_FAMILY_SHARING";
      goto LABEL_11;
    case 5:
      char v3 = +[VUILocalizationManager sharedInstance];
      id v4 = v3;
      uint64_t v5 = @"DOWNLOADED";
      goto LABEL_11;
    case 6:
      char v3 = +[VUILocalizationManager sharedInstance];
      id v4 = v3;
      uint64_t v5 = @"RECENTLY_ADDED";
      goto LABEL_11;
    case 7:
      char v3 = +[VUILocalizationManager sharedInstance];
      id v4 = v3;
      uint64_t v5 = @"EMPTY_PURCHASES";
      goto LABEL_11;
    case 8:
      char v3 = +[VUILocalizationManager sharedInstance];
      id v4 = v3;
      uint64_t v5 = @"LIBRARY_GENRES_HEADER";
LABEL_11:
      uint64_t v6 = [v3 localizedStringForKey:v5];

      break;
    default:
      uint64_t v6 = &stru_1F3E921E0;
      break;
  }
  return v6;
}

- (id)_symbolNameForCellType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return &stru_1F3E921E0;
  }
  else {
    return off_1E6DFC0D0[a3 - 1];
  }
}

- (int64_t)_categoryForCellType:(int64_t)a3
{
  CGSize result = (int64_t *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  switch(a3)
  {
    case 1:
      int64_t v5 = 2;
      goto LABEL_11;
    case 2:
      int64_t v5 = 3;
      goto LABEL_11;
    case 3:
      int64_t v5 = 5;
      goto LABEL_11;
    case 4:
      int64_t v5 = 7;
      goto LABEL_11;
    case 5:
      int64_t v5 = 8;
      goto LABEL_11;
    case 6:
      int64_t v5 = 1;
      goto LABEL_11;
    case 7:
      *CGSize result = 0;
      return result;
    case 8:
      int64_t v5 = 10;
LABEL_11:
      *CGSize result = v5;
      break;
    default:
      free(result);
      CGSize result = 0;
      break;
  }
  return result;
}

- (int64_t)_categoryForShelfType:(int64_t)a3
{
  int64_t v3 = 4;
  if (a3 != 3) {
    int64_t v3 = 1;
  }
  if (a3) {
    return v3;
  }
  else {
    return 6;
  }
}

- (void)_accountsChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (+[VUIAuthenticationManager userHasActiveAccount])
    {
      int64_t v5 = @"YES";
    }
    else
    {
      int64_t v5 = @"NO";
    }
    if ([(VUILibraryViewController *)self _isDeviceMediaLibraryInitialUpdateInProgress])
    {
      uint64_t v6 = @"YES";
    }
    else
    {
      uint64_t v6 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] _accountsChanged - has active account %@ - isInitialUpdateInProgress %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  uint64_t v8 = __45__VUILibraryViewController__accountsChanged___block_invoke;
  uint64_t v9 = &unk_1E6DF3D58;
  uint64_t v10 = self;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v8((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __45__VUILibraryViewController__accountsChanged___block_invoke(uint64_t a1)
{
  id v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_INFO, "[VUILibraryViewController] _accountsChanged - update content view type to loading", v11, 2u);
  }

  int64_t v3 = [*(id *)(a1 + 32) contentPresenter];
  [v3 setCurrentContentViewType:1];

  BOOL v4 = +[VUIAuthenticationManager userHasActiveAccount];
  int64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 _removeDownloadViewController];
  }
  else
  {
    if ([v5 _downloadsAreAvailable]) {
      [*(id *)(a1 + 32) _presentDownloadViewController];
    }
    int v6 = [*(id *)(a1 + 32) _isDeviceMediaLibraryInitialUpdateInProgress];
    uint64_t v7 = *(void **)(a1 + 32);
    if (v6)
    {
      [v7 _startMonitoringDeviceMediaLibraryInitialUpdate];
    }
    else
    {
      [v7 setHasMediaEntitiesFetchCompleted:1];
      uint64_t v8 = [*(id *)(a1 + 32) menuDataSource];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v10 = [*(id *)(a1 + 32) menuDataSource];
        [v10 refetch];
      }
    }
  }
}

- (void)_presentDownloadViewController
{
  int64_t v3 = [(VUILibraryViewController *)self presentedDownloadViewController];
  BOOL v4 = [v3 parentViewController];

  if (v4 != self)
  {
    int64_t v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] presentDownloadViewController", v21, 2u);
    }

    int v6 = [(VUILibraryStackViewController *)self stackView];
    [v6 removeFromSuperview];

    uint64_t v7 = [(VUILibraryViewController *)self _downloadViewController];
    [(VUILibraryViewController *)self setPresentedDownloadViewController:v7];

    uint64_t v8 = [(VUILibraryViewController *)self _navigationBarTitle];
    [(VUILibraryViewController *)self setTitle:v8];

    uint64_t v9 = [(VUILibraryViewController *)self view];
    uint64_t v10 = [(VUILibraryViewController *)self presentedDownloadViewController];
    uint64_t v11 = [v10 view];
    [v9 addSubview:v11];

    uint64_t v12 = [(VUILibraryViewController *)self presentedDownloadViewController];
    [(VUILibraryViewController *)self addChildViewController:v12];

    __int16 v13 = [(VUILibraryViewController *)self presentedDownloadViewController];
    [v13 didMoveToParentViewController:self];

    uint64_t v14 = [(VUILibraryViewController *)self presentedDownloadViewController];
    uint64_t v15 = [v14 view];
    uint64_t v16 = [(VUILibraryViewController *)self view];
    [v16 bounds];
    objc_msgSend(v15, "setFrame:");
  }
  long long v17 = [(VUILibraryViewController *)self contentPresenter];
  long long v18 = [(VUILibraryViewController *)self presentedDownloadViewController];
  long long v19 = [v18 view];
  [v17 setContentView:v19];

  long long v20 = [(VUILibraryViewController *)self contentPresenter];
  [v20 setCurrentContentViewType:3];

  [(VUILibraryViewController *)self setCurrentLibraryCategory:8];
  [(VUILibraryViewController *)self setCurrentLibraryCategoryIsValid:1];
  [(VUILibraryViewController *)self setCurrentLibraryCategoryIsFromShelf:0];
  [(VUILibraryViewController *)self setIsPresentingDownloads:1];
}

- (void)_removeDownloadViewController
{
  int64_t v3 = [(VUILibraryViewController *)self presentedDownloadViewController];

  if (v3)
  {
    BOOL v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v13 = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "[VUILibraryViewController] removeDownloadViewController", v13, 2u);
    }

    int64_t v5 = [(VUILibraryViewController *)self presentedDownloadViewController];
    int v6 = [v5 view];
    [v6 removeFromSuperview];

    uint64_t v7 = [(VUILibraryViewController *)self presentedDownloadViewController];
    [v7 willMoveToParentViewController:0];

    uint64_t v8 = [(VUILibraryViewController *)self presentedDownloadViewController];
    [v8 removeFromParentViewController];

    [(VUILibraryViewController *)self setPresentedDownloadViewController:0];
    uint64_t v9 = [(VUILibraryViewController *)self _navigationBarTitle];
    [(VUILibraryViewController *)self setTitle:v9];

    uint64_t v10 = [(VUILibraryViewController *)self contentPresenter];
    uint64_t v11 = [(VUILibraryStackViewController *)self stackView];
    [v10 setContentView:v11];

    uint64_t v12 = [(VUILibraryViewController *)self contentPresenter];
    [v12 setCurrentContentViewType:3];

    [(VUILibraryViewController *)self setCurrentLibraryCategoryIsValid:0];
    [(VUILibraryViewController *)self setIsPresentingDownloads:0];
  }
}

- (id)_navigationBarTitle
{
  int64_t v3 = [(VUILibraryViewController *)self mediaLibrary];
  if ([v3 type] == 1)
  {
    BOOL v4 = [(VUIMediaLibrary *)self->_mediaLibrary title];
  }
  else
  {
    int64_t v5 = +[VUILocalizationManager sharedInstance];
    BOOL v4 = [v5 localizedStringForKey:@"LIBRARY"];
  }
  int v6 = [(VUILibraryViewController *)self presentedDownloadViewController];

  if (v6)
  {
    uint64_t v7 = +[VUILocalizationManager sharedInstance];
    uint64_t v8 = [v7 localizedStringForKey:@"DOWNLOADED"];
  }
  else
  {
    uint64_t v9 = [(VUILibraryViewController *)self familyMember];

    if (!v9) {
      goto LABEL_9;
    }
    uint64_t v10 = NSString;
    uint64_t v7 = +[VUILocalizationManager sharedInstance];
    uint64_t v11 = [v7 localizedStringForKey:@"LIBRARY_FAMILY_SHARING_HEADER"];
    uint64_t v12 = [(VUILibraryViewController *)self familyMember];
    __int16 v13 = [v12 firstName];
    uint64_t v8 = [v10 stringWithValidatedFormat:v11, @"%@", 0, v13 validFormatSpecifiers error];

    BOOL v4 = (void *)v11;
  }

  BOOL v4 = (void *)v8;
LABEL_9:
  return v4;
}

- (BOOL)_gestureRecognizerShouldBegin
{
  id v2 = self;
  int64_t v3 = [(VUILibraryViewController *)self navigationController];
  BOOL v4 = [v3 topViewController];
  LOBYTE(v2) = v4 != v2->_presentedDownloadViewController;

  return (char)v2;
}

- (BOOL)_downloadsAreAvailable
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(VUILibraryViewController *)self _haveAllInitialFetchesCompleted])
  {
    int64_t v3 = [(VUILibraryViewController *)self menuDataSource];
    BOOL v4 = [v3 menuItems];
    int64_t v5 = [v4 mainMenuItemsWithDefaultItemsForIphone];
    int v6 = (void *)[v5 copy];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "longValue", (void)v12) == 8)
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)_downloadViewController
{
  id v2 = +[VUIMediaLibraryManager defaultManager];
  int64_t v3 = [v2 aggregateMediaLibrary];
  BOOL v4 = +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:8 withLibrary:v3];

  int64_t v5 = [[VUIDownloadTableViewController alloc] initWithDataSource:v4];
  return v5;
}

- (BOOL)vui_ppt_isLoading
{
  return !self->_ppt_isLoaded;
}

- (void)_updateVisibleCellSeparators
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int64_t v3 = [(VUILibraryStackViewController *)self stackCollectionView];
  BOOL v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [(VUILibraryStackViewController *)self stackCollectionView];
          uint64_t v11 = [v10 indexPathForCell:v9];

          if ([v11 row]) {
            [v9 setTopSeparatorView:0];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (VUIFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
}

- (int64_t)currentLibraryCategory
{
  return self->_currentLibraryCategory;
}

- (void)setCurrentLibraryCategory:(int64_t)a3
{
  self->_currentLibraryCategory = a3;
}

- (BOOL)viewHasAppearedAtLeastOnce
{
  return self->_viewHasAppearedAtLeastOnce;
}

- (void)setViewHasAppearedAtLeastOnce:(BOOL)a3
{
  self->_viewHasAppearedAtLeastOnce = a3;
}

- (BOOL)currentLibraryCategoryIsFromShelf
{
  return self->_currentLibraryCategoryIsFromShelf;
}

- (void)setCurrentLibraryCategoryIsFromShelf:(BOOL)a3
{
  self->_currentLibraryCategoryIsFromShelf = a3;
}

- (BOOL)currentLibraryCategoryIsValid
{
  return self->_currentLibraryCategoryIsValid;
}

- (void)setCurrentLibraryCategoryIsValid:(BOOL)a3
{
  self->_currentLibraryCategoryIsValid = a3;
}

- (BOOL)isPresentingDownloads
{
  return self->_isPresentingDownloads;
}

- (void)setIsPresentingDownloads:(BOOL)a3
{
  self->_isPresentingDownloads = a3;
}

- (UIBarButtonItem)libraryBarButton
{
  return self->_libraryBarButton;
}

- (void)setLibraryBarButton:(id)a3
{
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
}

- (VUILibraryMenuDataSource)menuDataSource
{
  return self->_menuDataSource;
}

- (void)setMenuDataSource:(id)a3
{
}

- (BOOL)hasMenuItemFetchCompleted
{
  return self->_hasMenuItemFetchCompleted;
}

- (void)setHasMenuItemFetchCompleted:(BOOL)a3
{
  self->_hasMenuItemFetchCompleted = a3;
}

- (NSArray)menuCells
{
  return self->_menuCells;
}

- (void)setMenuCells:(id)a3
{
}

- (VUILibraryMenuItemViewCell)menuItemSizingCell
{
  return self->_menuItemSizingCell;
}

- (void)setMenuItemSizingCell:(id)a3
{
}

- (NSArray)homeShares
{
  return self->_homeShares;
}

- (void)setHomeShares:(id)a3
{
}

- (VUIMediaLibrary)currentHomeShareMediaLibrary
{
  return self->_currentHomeShareMediaLibrary;
}

- (void)setCurrentHomeShareMediaLibrary:(id)a3
{
}

- (VUILibraryBannerCollectionViewCell)bannerViewSizingCell
{
  return self->_bannerViewSizingCell;
}

- (void)setBannerViewSizingCell:(id)a3
{
}

- (VUILibraryShelvesDataSource)shelvesDataSource
{
  return self->_shelvesDataSource;
}

- (void)setShelvesDataSource:(id)a3
{
}

- (NSMutableArray)shelves
{
  return self->_shelves;
}

- (void)setShelves:(id)a3
{
}

- (NSMutableArray)validShelfTypes
{
  return self->_validShelfTypes;
}

- (void)setValidShelfTypes:(id)a3
{
}

- (BOOL)hasMediaEntitiesFetchCompleted
{
  return self->_hasMediaEntitiesFetchCompleted;
}

- (void)setHasMediaEntitiesFetchCompleted:(BOOL)a3
{
  self->_hasMediaEntitiesFetchCompleted = a3;
}

- (_VUILibrarySeeAllController)currentSeeAllController
{
  return self->_currentSeeAllController;
}

- (void)setCurrentSeeAllController:(id)a3
{
}

- (BOOL)doesDeviceSupportHDR
{
  return self->_doesDeviceSupportHDR;
}

- (void)setDoesDeviceSupportHDR:(BOOL)a3
{
  self->_doesDeviceSupportHDR = a3;
}

- (BOOL)hasBatchChangesInProgress
{
  return self->_hasBatchChangesInProgress;
}

- (void)setHasBatchChangesInProgress:(BOOL)a3
{
  self->_hasBatchChangesInProgress = a3;
}

- (BOOL)hasNewerBatchChanges
{
  return self->_hasNewerBatchChanges;
}

- (void)setHasNewerBatchChanges:(BOOL)a3
{
  self->_hasNewerBatchChanges = a3;
}

- (BOOL)hasPendingShelvesUpdate
{
  return self->_hasPendingShelvesUpdate;
}

- (void)setHasPendingShelvesUpdate:(BOOL)a3
{
  self->_hasPendingShelvesUpdate = a3;
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (VUIDownloadTableViewController)presentedDownloadViewController
{
  return self->_presentedDownloadViewController;
}

- (void)setPresentedDownloadViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedDownloadViewController, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_currentSeeAllController, 0);
  objc_storeStrong((id *)&self->_validShelfTypes, 0);
  objc_storeStrong((id *)&self->_shelves, 0);
  objc_storeStrong((id *)&self->_shelvesDataSource, 0);
  objc_storeStrong((id *)&self->_bannerViewSizingCell, 0);
  objc_storeStrong((id *)&self->_currentHomeShareMediaLibrary, 0);
  objc_storeStrong((id *)&self->_homeShares, 0);
  objc_storeStrong((id *)&self->_menuItemSizingCell, 0);
  objc_storeStrong((id *)&self->_menuCells, 0);
  objc_storeStrong((id *)&self->_menuDataSource, 0);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_libraryBarButton, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end