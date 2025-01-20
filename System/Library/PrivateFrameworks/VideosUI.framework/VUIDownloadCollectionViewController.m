@interface VUIDownloadCollectionViewController
- (BOOL)isEditing;
- (BOOL)isSelectingAll;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSDictionary)identifierToDownloadEntityDictionary;
- (NSMutableArray)assetControllersToRemove;
- (NSMutableArray)downloadEntities;
- (UIAlertController)alertController;
- (UIBarButtonItem)backBarButtonItem;
- (UIBarButtonItem)leftBarButtonItem;
- (UIBarButtonItem)rightBarButtonItem;
- (UIBarButtonItem)selectAllBarButtonItem;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (VUIDownloadCollectionViewCell)sizingCell;
- (VUIDownloadCollectionViewController)initWithDataSource:(id)a3;
- (VUIDownloadDataSource)downloadDataSource;
- (VUILegacyCollectionView)collectionView;
- (VUIViewControllerContentPresenter)contentPresenter;
- (double)_computeBottomMargin;
- (double)cellWidth;
- (double)lastViewWidth;
- (id)_configureAlertController;
- (id)_createCollectionView;
- (id)_createDiffableDataSource;
- (id)_createDiffableDataSourceSnapshot;
- (id)_createIdentifierToDownloadEntityDictionary;
- (id)_deleteActionTitleString;
- (id)_identifiersForDownloadEntities;
- (int64_t)gridStyle;
- (int64_t)gridType;
- (void)_batchSelectToggled;
- (void)_clearSelections;
- (void)_configureNavigationBarForEditingMode;
- (void)_deleteDownloadEntities:(id)a3;
- (void)_deleteMediaEntitiesInDownloadEntities:(id)a3;
- (void)_editToggled;
- (void)_enterEditingMode;
- (void)_exitEditingMode;
- (void)_selectAllCells;
- (void)_toggleRightBarEditItemIfNeeded;
- (void)_updateAllVisibleCellsForEditingMode;
- (void)_updateLayoutForSize:(CGSize)a3;
- (void)_updateNavigationBarPadding;
- (void)_updateSelectAllBarButtonItemIfNecessary;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)downloadCellDidRequestCancelDownload:(id)a3;
- (void)downloadManager:(id)a3 downloadedFetchDidFinishWithEntities:(id)a4;
- (void)downloadManager:(id)a3 downloadsDidChange:(id)a4;
- (void)loadView;
- (void)setAlertController:(id)a3;
- (void)setAssetControllersToRemove:(id)a3;
- (void)setBackBarButtonItem:(id)a3;
- (void)setCellWidth:(double)a3;
- (void)setCollectionView:(id)a3;
- (void)setContentPresenter:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setDownloadDataSource:(id)a3;
- (void)setDownloadEntities:(id)a3;
- (void)setGridStyle:(int64_t)a3;
- (void)setGridType:(int64_t)a3;
- (void)setIdentifierToDownloadEntityDictionary:(id)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setIsSelectingAll:(BOOL)a3;
- (void)setLastViewWidth:(double)a3;
- (void)setLeftBarButtonItem:(id)a3;
- (void)setRightBarButtonItem:(id)a3;
- (void)setSelectAllBarButtonItem:(id)a3;
- (void)setSizingCell:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VUIDownloadCollectionViewController

- (VUIDownloadCollectionViewController)initWithDataSource:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VUIDownloadCollectionViewController;
  v5 = [(VUIDownloadCollectionViewController *)&v19 init];
  v6 = v5;
  if (v5)
  {
    [(VUIDownloadCollectionViewController *)v5 setDownloadDataSource:v4];
    v7 = +[VUILocalizationManager sharedInstance];
    v8 = [v7 localizedStringForKey:@"DOWNLOADED"];
    [(VUIDownloadCollectionViewController *)v6 setTitle:v8];

    [(VUIDownloadCollectionViewController *)v6 setGridStyle:5];
    [(VUIDownloadCollectionViewController *)v6 setGridType:1];
    v9 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v6->_contentPresenter;
    v6->_contentPresenter = v9;

    [(VUIViewControllerContentPresenter *)v6->_contentPresenter setLogName:@"VUIDownloadCollectionViewController"];
    v6->_isEditing = 0;
    v6->_isSelectingAll = 0;
    v6->_lastViewWidth = 0.0;
    v11 = [(VUIDownloadCollectionViewController *)v6 view];
    v12 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:@"Library.id=\"Downloaded\""];
    [v11 setAccessibilityIdentifier:v12];

    objc_initWeak(&location, v6);
    v20[0] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__VUIDownloadCollectionViewController_initWithDataSource___block_invoke;
    v16[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v17, &location);
    id v14 = (id)[(VUIDownloadCollectionViewController *)v6 registerForTraitChanges:v13 withHandler:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __58__VUIDownloadCollectionViewController_initWithDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained view];
  [v1 bounds];
  objc_msgSend(WeakRetained, "_updateLayoutForSize:", v2, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VUIDownloadCollectionViewController;
  -[VUIDownloadCollectionViewController viewWillAppear:](&v16, sel_viewWillAppear_);
  v5 = self->_collectionView;
  v6 = [(VUILegacyCollectionView *)v5 indexPathsForSelectedItems];
  v7 = [v6 firstObject];

  if (v7)
  {
    v8 = [(VUIDownloadCollectionViewController *)self transitionCoordinator];
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __54__VUIDownloadCollectionViewController_viewWillAppear___block_invoke;
      v12[3] = &unk_1E6DF3E68;
      v13 = v5;
      id v14 = v7;
      BOOL v15 = a3;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __54__VUIDownloadCollectionViewController_viewWillAppear___block_invoke_2;
      v9[3] = &unk_1E6DF3E90;
      v10 = v13;
      id v11 = v14;
      [v8 animateAlongsideTransition:v12 completion:v9];
    }
    else
    {
      [(VUILegacyCollectionView *)v5 deselectItemAtIndexPath:v7 animated:1];
    }
  }
}

uint64_t __54__VUIDownloadCollectionViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __54__VUIDownloadCollectionViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 selectItemAtIndexPath:v5 animated:0 scrollPosition:0];
  }
  return result;
}

- (void)loadView
{
  v32.receiver = self;
  v32.super_class = (Class)VUIDownloadCollectionViewController;
  [(VUIDownloadCollectionViewController *)&v32 loadView];
  double v3 = [(VUIDownloadCollectionViewController *)self contentPresenter];
  [v3 setRootViewForViewController:self];

  id v4 = [(VUIDownloadCollectionViewController *)self _createCollectionView];
  [(VUIDownloadCollectionViewController *)self setCollectionView:v4];

  uint64_t v5 = [(VUIDownloadCollectionViewController *)self _createDiffableDataSource];
  [(VUIDownloadCollectionViewController *)self setDiffableDataSource:v5];

  if (([MEMORY[0x1E4FB1438] isRunningInStoreDemoMode] & 1) == 0)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v7 = +[VUILocalizationManager sharedInstance];
    v8 = [v7 localizedStringForKey:@"EDIT"];
    v9 = (UIBarButtonItem *)[v6 initWithTitle:v8 style:0 target:self action:sel__editToggled];
    rightBarButtonItem = self->_rightBarButtonItem;
    self->_rightBarButtonItem = v9;

    id v11 = [(VUIDownloadCollectionViewController *)self navigationItem];
    [v11 setRightBarButtonItem:self->_rightBarButtonItem];

    id v12 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v13 = +[VUILocalizationManager sharedInstance];
    id v14 = [v13 localizedStringForKey:@"SELECT_ALL"];
    BOOL v15 = (UIBarButtonItem *)[v12 initWithTitle:v14 style:0 target:self action:sel__batchSelectToggled];
    selectAllBarButtonItem = self->_selectAllBarButtonItem;
    self->_selectAllBarButtonItem = v15;
  }
  id v17 = [(VUIDownloadCollectionViewController *)self navigationItem];
  v18 = [v17 leftBarButtonItem];
  backBarButtonItem = self->_backBarButtonItem;
  self->_backBarButtonItem = v18;

  v20 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelPressed];
  leftBarButtonItem = self->_leftBarButtonItem;
  self->_leftBarButtonItem = v20;

  objc_initWeak(&location, self);
  v22 = (void *)MEMORY[0x1E4FB5180];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __47__VUIDownloadCollectionViewController_loadView__block_invoke;
  v29 = &unk_1E6DF59E8;
  objc_copyWeak(&v30, &location);
  [v22 isFullTVAppEnabledwithCompletion:&v26];
  v23 = [(VUIDownloadCollectionViewController *)self contentPresenter];
  [v23 setCurrentContentViewType:1];

  v24 = [(VUIDownloadCollectionViewController *)self contentPresenter];
  v25 = [(VUIDownloadCollectionViewController *)self collectionView];
  [v24 setContentView:v25];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __47__VUIDownloadCollectionViewController_loadView__block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__VUIDownloadCollectionViewController_loadView__block_invoke_2;
  v3[3] = &unk_1E6DF5330;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __47__VUIDownloadCollectionViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  char v3 = [v2 isNetworkReachable];

  if (v3)
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);
    char v5 = [WeakRetained contentPresenter];
    id v6 = +[VUILocalizationManager sharedInstance];
    v7 = v6;
    if (v4)
    {
      v8 = [v6 localizedStringForKey:@"LIBRARY_EMPTY_TITLE_NEW"];
      [v5 setNoContentErrorTitle:v8];

      v9 = [WeakRetained contentPresenter];
      v10 = +[VUILocalizationManager sharedInstance];
      id v11 = v10;
      id v12 = @"LIBRARY_EMPTY_DESCRIPTION_NEW";
LABEL_6:
      uint64_t v16 = [v10 localizedStringForKey:v12];
      goto LABEL_8;
    }
LABEL_5:
    BOOL v15 = [v7 localizedStringForKey:@"LIBRARY_EMPTY_TITLE_LIBRARY_ONLY"];
    [v5 setNoContentErrorTitle:v15];

    v9 = [WeakRetained contentPresenter];
    v10 = +[VUILocalizationManager sharedInstance];
    id v11 = v10;
    id v12 = @"LIBRARY_EMPTY_DESCRIPTION_LIBRARY_ONLY";
    goto LABEL_6;
  }
  int v13 = WLKIsRegulatedSKU();
  char v5 = [WeakRetained contentPresenter];
  id v14 = +[VUILocalizationManager sharedInstance];
  v7 = v14;
  if (v13) {
    goto LABEL_5;
  }
  id v17 = [v14 localizedStringForKey:@"LIBRARY_EMPTY_TITLE_NO_CONNECTION"];
  [v5 setNoContentErrorTitle:v17];

  v9 = [WeakRetained contentPresenter];
  id v11 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
  uint64_t v16 = [v11 localizedStringForKey:@"LIBRARY_EMPTY_DESCRIPTION_NO_CONNNECTION" value:0 table:@"VideosUIEmbedded"];
LABEL_8:
  v18 = (void *)v16;
  [v9 setNoContentErrorMessage:v16];

  objc_super v19 = [WeakRetained contentPresenter];
  [v19 refreshNoContentViewIfNeeded];

  [WeakRetained _toggleRightBarEditItemIfNeeded];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIDownloadCollectionViewController;
  [(VUIDownloadCollectionViewController *)&v6 viewDidAppear:a3];
  [(VUIDownloadCollectionViewController *)self _updateNavigationBarPadding];
  int v4 = [(VUIDownloadCollectionViewController *)self navigationController];
  char v5 = [v4 navigationBar];
  [v5 sizeToFit];

  +[VUILibraryMetrics recordPageEventWithPageType:@"LibraryDownloaded"];
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)VUIDownloadCollectionViewController;
  [(VUIDownloadCollectionViewController *)&v18 viewDidLoad];
  char v3 = [(VUIDownloadCollectionViewController *)self downloadDataSource];
  [v3 setDownloadDelegate:self];

  int v4 = [(VUIDownloadCollectionViewController *)self downloadDataSource];
  char v5 = [v4 hasCompletedInitialFetch];

  if (v5)
  {
    objc_super v6 = [(VUIDownloadCollectionViewController *)self downloadDataSource];
    v7 = [v6 downloadEntities];
    v8 = (void *)[v7 mutableCopy];
    [(VUIDownloadCollectionViewController *)self setDownloadEntities:v8];

    v9 = [(VUIDownloadCollectionViewController *)self downloadEntities];
    uint64_t v10 = [v9 count];

    id v11 = [(VUIDownloadCollectionViewController *)self contentPresenter];
    id v12 = v11;
    if (v10)
    {
      uint64_t v13 = [v11 currentContentViewType];

      if (v13 != 3)
      {
        id v14 = [(VUIDownloadCollectionViewController *)self contentPresenter];
        [v14 setCurrentContentViewType:3];
      }
      id v12 = [(VUIDownloadCollectionViewController *)self diffableDataSource];
      BOOL v15 = [(VUIDownloadCollectionViewController *)self _createDiffableDataSourceSnapshot];
      [v12 applySnapshot:v15 animatingDifferences:v13 == 3 completion:0];
    }
    else
    {
      [v11 setCurrentContentViewType:2];
    }
  }
  else
  {
    uint64_t v16 = VUIDefaultLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "[VUIDownloadCollectionViewController] Fetching downloads", v17, 2u);
    }

    id v12 = [(VUIDownloadCollectionViewController *)self downloadDataSource];
    [v12 startFetch];
  }
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)VUIDownloadCollectionViewController;
  [(VUIDownloadCollectionViewController *)&v8 viewDidLayoutSubviews];
  char v3 = [(VUIDownloadCollectionViewController *)self contentPresenter];
  int v4 = [(VUIDownloadCollectionViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");

  char v5 = [(VUIDownloadCollectionViewController *)self view];
  [v5 bounds];
  -[VUIDownloadCollectionViewController _updateLayoutForSize:](self, "_updateLayoutForSize:", v6, v7);

  [(VUIDownloadCollectionViewController *)self _updateNavigationBarPadding];
}

- (void)setDownloadEntities:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "identifier", (void)v21);
        if (v12)
        {
          uint64_t v13 = [(VUIDownloadCollectionViewController *)self identifierToDownloadEntityDictionary];
          id v14 = [v13 objectForKey:v12];

          if (v14)
          {
            BOOL v15 = [v11 mediaEntities];
            uint64_t v16 = (void *)[v15 copy];
            [v14 setMediaEntities:v16];

            id v17 = v5;
            objc_super v18 = v14;
          }
          else
          {
            id v17 = v5;
            objc_super v18 = v11;
          }
          [(NSMutableArray *)v17 addObject:v18];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  downloadEntities = self->_downloadEntities;
  self->_downloadEntities = v5;

  v20 = [(VUIDownloadCollectionViewController *)self _createIdentifierToDownloadEntityDictionary];
  [(VUIDownloadCollectionViewController *)self setIdentifierToDownloadEntityDictionary:v20];

  [(VUIDownloadCollectionViewController *)self _toggleRightBarEditItemIfNeeded];
}

- (void)_toggleRightBarEditItemIfNeeded
{
  v8[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(VUIDownloadCollectionViewController *)self downloadEntities];
  uint64_t v4 = [v3 count];

  char v5 = [(VUIDownloadCollectionViewController *)self navigationItem];
  id v6 = v5;
  if (v4)
  {
    v8[0] = self->_rightBarButtonItem;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v6 setRightBarButtonItems:v7];
  }
  else
  {
    [v5 setRightBarButtonItems:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUIDownloadCollectionViewController;
  id v7 = a4;
  -[VUIDownloadCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __90__VUIDownloadCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6DF4CD8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __90__VUIDownloadCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [v1 view];
  [v4 bounds];
  objc_msgSend(v1, "_updateLayoutForSize:", v2, v3);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  objc_msgSend(v9, "setEditing:", -[VUIDownloadCollectionViewController isEditing](self, "isEditing"));
  if ([(VUIDownloadCollectionViewController *)self isEditing]
    && [(VUIDownloadCollectionViewController *)self isSelectingAll])
  {
    uint64_t v8 = [(VUIDownloadCollectionViewController *)self collectionView];
    [v8 selectItemAtIndexPath:v7 animated:1 scrollPosition:0];

    [v9 setSelected:1];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(VUIDownloadCollectionViewController *)self isEditing])
  {
    uint64_t v8 = [v6 cellForItemAtIndexPath:v7];
    [v8 setSelected:1 animated:1];
    [(VUIDownloadCollectionViewController *)self _updateSelectAllBarButtonItemIfNecessary];
  }
  else
  {
    [v6 deselectItemAtIndexPath:v7 animated:0];
    id v9 = [(VUIDownloadCollectionViewController *)self diffableDataSource];
    uint64_t v10 = [v9 itemIdentifierForIndexPath:v7];

    id v11 = [(VUIDownloadCollectionViewController *)self identifierToDownloadEntityDictionary];
    v82 = [v11 objectForKey:v10];

    id v12 = [v82 mediaEntities];
    uint64_t v13 = [v12 firstObject];

    if (!v13)
    {
      long long v24 = VUIDefaultLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[VUIDownloadCollectionViewController collectionView:didSelectItemAtIndexPath:]((uint64_t)v10, v24);
      }

      goto LABEL_30;
    }
    if ([v82 downloadType])
    {
      if ([v82 downloadType] == 1 || objc_msgSend(v82, "downloadType") == 2)
      {
        +[VUILibraryMetrics recordClickOnMediaEntity:v13];
        id v14 = [[VUIDownloadShowDataSource alloc] initWithMediaEntity:v13];
        BOOL v15 = [v13 showIdentifier];
        uint64_t v16 = +[VUIMediaEntityFetchRequest seasonsFetchRequestWithShowIdentifier:v15];
        id v17 = [v13 mediaLibrary];
        objc_super v18 = +[VUIMediaEntitiesDataSourceFactory dataSourceForFetchRequest:v16 withLibrary:v17];

        objc_super v19 = [[VUIDownloadShowTableViewController alloc] initWithDataSource:v14 seasonsDataSource:v18];
        v20 = [v13 showTitle];

        if (v20)
        {
          long long v21 = [(VUIDownloadShowTableViewController *)v19 navigationItem];
          long long v22 = [v13 showTitle];
          [v21 setTitle:v22];
        }
        long long v23 = [(VUIDownloadCollectionViewController *)self navigationController];
        [v23 pushViewController:v19 animated:1];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v81 = v13;
        v25 = [v81 downloadExpirationDate];
        v80 = v25;
        if (v25 && !objc_msgSend(v25, "vui_isInTheFuture"))
        {
          id v30 = [v81 availabilityEndDate];
          v28 = v30;
          if (v30 && ![(VUIMediaInfo *)v30 vui_isInTheFuture])
          {
            objc_initWeak(&location, self);
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
            aBlock[3] = &unk_1E6DF4A30;
            objc_copyWeak(&v86, &location);
            v70 = _Block_copy(aBlock);
            v77 = NSString;
            v50 = +[VUILocalizationManager sharedInstance];
            v51 = [v50 localizedStringForKey:@"DOWNLOAD_MESSAGE_NO_LONGER_AVAILABLE"];
            v52 = [v81 brandName];
            v73 = [v77 stringWithValidatedFormat:v51, @"%@", 0, v52 validFormatSpecifiers error];

            v53 = (void *)MEMORY[0x1E4FB1418];
            v54 = +[VUILocalizationManager sharedInstance];
            v55 = [v54 localizedStringForKey:@"DOWNLOAD_NO_LONGER_AVAILABLE"];
            v78 = [v53 alertControllerWithTitle:v55 message:v73 preferredStyle:1];

            v56 = (void *)MEMORY[0x1E4FB1410];
            v57 = +[VUILocalizationManager sharedInstance];
            v58 = [v57 localizedStringForKey:@"DELETE"];
            v83[0] = MEMORY[0x1E4F143A8];
            v83[1] = 3221225472;
            v83[2] = __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4;
            v83[3] = &unk_1E6DF4DA0;
            id v59 = v70;
            id v84 = v59;
            v60 = [v56 actionWithTitle:v58 style:0 handler:v83];

            [v78 addAction:v60];
            [(VUIDownloadCollectionViewController *)self presentViewController:v78 animated:1 completion:0];

            objc_destroyWeak(&v86);
            objc_destroyWeak(&location);
          }
          else
          {
            v31 = [MEMORY[0x1E4FB3CF8] sharedInstance];
            int v32 = [v31 isNetworkReachable];

            if (v32)
            {
              int v72 = [v81 allowsManualDownloadRenewal];
              v33 = +[VUILocalizationManager sharedInstance];
              v34 = v33;
              if (v72)
              {
                v71 = [v33 localizedStringForKey:@"RENEW_DOWNLOAD"];

                v35 = +[VUILocalizationManager sharedInstance];
                v68 = [v35 localizedStringForKey:@"RENEW_DOWNLOAD"];

                v36 = NSString;
                v37 = +[VUILocalizationManager sharedInstance];
                [v37 localizedStringForKey:@"DOWNLOAD_MESSAGE_RENEW"];
              }
              else
              {
                v71 = [v33 localizedStringForKey:@"DOWNLOAD_AGAIN"];

                v61 = +[VUILocalizationManager sharedInstance];
                v68 = [v61 localizedStringForKey:@"DOWNLOAD_AGAIN_BUTTON_TITLE"];

                v36 = NSString;
                v37 = +[VUILocalizationManager sharedInstance];
                [v37 localizedStringForKey:@"DOWNLOAD_MESSAGE_REDOWNLOAD"];
              v75 = };
              v38 = [v81 brandName];
              v69 = [v36 stringWithValidatedFormat:v75, @"%@", 0, v38 validFormatSpecifiers error];

              v79 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v71 message:v69 preferredStyle:1];
              objc_initWeak(&location, self);
              v62 = (void *)MEMORY[0x1E4FB1410];
              v87[0] = MEMORY[0x1E4F143A8];
              v87[1] = 3221225472;
              v87[2] = __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_97;
              v87[3] = &unk_1E6DF9BD8;
              objc_copyWeak(&v90, &location);
              id v63 = v81;
              char v91 = v72;
              id v88 = v63;
              v89 = self;
              v74 = [v62 actionWithTitle:v68 style:0 handler:v87];
              [v79 addAction:v74];
              v64 = (void *)MEMORY[0x1E4FB1410];
              v65 = +[VUILocalizationManager sharedInstance];
              v66 = [v65 localizedStringForKey:@"CANCEL"];
              v67 = [v64 actionWithTitle:v66 style:1 handler:0];

              [v79 addAction:v67];
              [(VUIDownloadCollectionViewController *)self presentViewController:v79 animated:1 completion:0];

              objc_destroyWeak(&v90);
              objc_destroyWeak(&location);
            }
            else
            {
              v41 = (void *)MEMORY[0x1E4FB1418];
              v76 = +[VUILocalizationManager sharedInstance];
              v42 = [v76 localizedStringForKey:@"DOWNLOAD_OFFLINE_RENEW"];
              v43 = +[VUILocalizationManager sharedInstance];
              v44 = [v43 localizedStringForKey:@"DOWNLOAD_OFFLINE_RENEW_MESSAGE"];
              v45 = [v41 alertControllerWithTitle:v42 message:v44 preferredStyle:1];

              v46 = (void *)MEMORY[0x1E4FB1410];
              v47 = +[VUILocalizationManager sharedInstance];
              v48 = [v47 localizedStringForKey:@"OK"];
              v49 = [v46 actionWithTitle:v48 style:1 handler:0];

              [v45 addAction:v49];
              [(VUIDownloadCollectionViewController *)self presentViewController:v45 animated:1 completion:0];
            }
          }
        }
        else
        {
          uint64_t v26 = [VUIMediaInfo alloc];
          v95[0] = v81;
          uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:1];
          v28 = [(VUIMediaInfo *)v26 initWithPlaybackContext:3 vuiMediaItems:v27];

          [(VUIMediaInfo *)v28 setIntent:1];
          [(VUIMediaInfo *)v28 setAutomaticPlaybackStart:0];
          if (v28)
          {
            v93[0] = MEMORY[0x1E4F143A8];
            v93[1] = 3221225472;
            v93[2] = __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
            v93[3] = &unk_1E6DF3D58;
            v94 = v81;
            +[VUIActionPlay playMediaInfo:v28 watchType:0 isRentAndWatchNow:0 completion:v93];
            v29 = v94;
          }
          else
          {
            v29 = VUIDefaultLogObject();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              -[VUIDownloadShowTableViewController tableView:didSelectRowAtIndexPath:]((uint64_t)v81, v29);
            }
          }
        }
      }
    }
  }
  v39 = [(VUIDownloadCollectionViewController *)self rightBarButtonItem];
  char v40 = [v39 isEnabled];

  if ((v40 & 1) == 0)
  {
    uint64_t v10 = [(VUIDownloadCollectionViewController *)self rightBarButtonItem];
    [v10 setEnabled:1];
LABEL_30:
  }
}

uint64_t __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return +[VUILibraryMetrics recordPlayOfMediaEntity:*(void *)(a1 + 32) isLaunchingExtras:0];
}

void __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_97(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v3 = [*(id *)(a1 + 32) assetController];

    if (v3)
    {
      if (*(unsigned char *)(a1 + 56))
      {
        id v4 = [*(id *)(a1 + 32) assetController];
        [v4 fetchNewKeysForDownloadedVideo];
      }
      else
      {
        char v5 = +[VUIDownloadManager sharedInstance];
        id v6 = *(void **)(a1 + 32);
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = [v6 assetController];
        uint64_t v9 = [v8 contentAllowsCellularDownload];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
        v10[3] = &unk_1E6DF4DC8;
        id v11 = *(id *)(a1 + 32);
        [v5 preflightDownloadForLibraryMediaEntity:v6 presentingViewController:v7 contentAllowsCellularDownload:v9 completion:v10];
      }
    }
  }
}

void __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) assetController];
    [v6 startDownloadAllowingCellular:a3 quality:a4 shouldMarkAsDeletedOnCancellationOrFailure:0 prefer3DOrImmersiveDownload:1 completion:0];
  }
}

void __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v3 = objc_msgSend(WeakRetained, "collectionView", 0);
  id v4 = [v3 indexPathsForSelectedItems];

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
        uint64_t v10 = [WeakRetained downloadEntities];
        id v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "row"));
        [v2 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [WeakRetained _deleteDownloadEntities:v2];
  [WeakRetained _exitEditingMode];
}

uint64_t __79__VUIDownloadCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5 = [a3 cellForItemAtIndexPath:a4];
  [v5 setSelected:0 animated:1];
  [(VUIDownloadCollectionViewController *)self _updateSelectAllBarButtonItemIfNecessary];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = [(VUIDownloadCollectionViewController *)self sizingCell];

  if (!v7)
  {
    uint64_t v8 = objc_alloc_init(VUIDownloadCollectionViewCell);
    [(VUIDownloadCollectionViewController *)self setSizingCell:v8];
  }
  uint64_t v9 = [(VUIDownloadCollectionViewController *)self diffableDataSource];
  uint64_t v10 = [v9 itemIdentifierForIndexPath:v6];

  id v11 = [(VUIDownloadCollectionViewController *)self identifierToDownloadEntityDictionary];
  long long v12 = [v11 objectForKey:v10];

  long long v13 = [(VUIDownloadCollectionViewController *)self sizingCell];
  [(VUIDownloadCollectionViewController *)self cellWidth];
  +[VUIDownloadCollectionViewCell configureVUIDownloadEntityCollectionViewCell:withDownloadEntity:width:forMetrics:](VUIDownloadCollectionViewCell, "configureVUIDownloadEntityCollectionViewCell:withDownloadEntity:width:forMetrics:", v13, v12, 1);

  long long v14 = [(VUIDownloadCollectionViewController *)self sizingCell];
  objc_msgSend(v14, "setEditing:", -[VUIDownloadCollectionViewController isEditing](self, "isEditing"));

  long long v15 = [(VUIDownloadCollectionViewController *)self sizingCell];
  [(VUIDownloadCollectionViewController *)self cellWidth];
  objc_msgSend(v15, "sizeThatFits:");
  double v17 = v16;
  double v19 = v18;

  if (v17 <= 0.0 || v19 <= 0.0)
  {
    v20 = VUIDefaultLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      double cellWidth = self->_cellWidth;
      int v24 = 134218754;
      double v25 = v17;
      __int16 v26 = 2048;
      double v27 = v19;
      __int16 v28 = 2048;
      double v29 = cellWidth;
      __int16 v30 = 2112;
      v31 = v12;
      _os_log_error_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_ERROR, "[VUIDownloadCollectionViewController] Incorrect sizing for item width:%f height:%f cellWidth:%f forEntity:%@", (uint8_t *)&v24, 0x2Au);
    }
  }
  double v21 = v17;
  double v22 = v19;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  [(VUIDownloadCollectionViewController *)self _computeBottomMargin];
  double v6 = v5;
  double v7 = 10.0;
  double v8 = 0.0;
  double v9 = 0.0;
  result.right = v9;
  result.bottom = v6;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void)downloadManager:(id)a3 downloadedFetchDidFinishWithEntities:(id)a4
{
  double v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v16 = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "[VUIDownloadCollectionViewController] Fetching downloads completed", v16, 2u);
  }

  double v6 = [(VUIDownloadCollectionViewController *)self downloadDataSource];
  double v7 = [v6 downloadEntities];
  double v8 = (void *)[v7 mutableCopy];
  [(VUIDownloadCollectionViewController *)self setDownloadEntities:v8];

  double v9 = [(VUIDownloadCollectionViewController *)self downloadEntities];
  uint64_t v10 = [v9 count];

  id v11 = [(VUIDownloadCollectionViewController *)self contentPresenter];
  long long v12 = v11;
  if (v10)
  {
    uint64_t v13 = [v11 currentContentViewType];

    if (v13 != 3)
    {
      long long v14 = [(VUIDownloadCollectionViewController *)self contentPresenter];
      [v14 setCurrentContentViewType:3];
    }
    long long v12 = [(VUIDownloadCollectionViewController *)self diffableDataSource];
    long long v15 = [(VUIDownloadCollectionViewController *)self _createDiffableDataSourceSnapshot];
    [v12 applySnapshot:v15 animatingDifferences:v13 == 3 completion:0];
  }
  else
  {
    [v11 setCurrentContentViewType:2];
  }
}

- (void)downloadManager:(id)a3 downloadsDidChange:(id)a4
{
  double v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v14 = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "[VUIDownloadCollectionViewController] Downloads changed", v14, 2u);
  }

  double v6 = [(VUIDownloadCollectionViewController *)self downloadDataSource];
  double v7 = [v6 downloadEntities];
  double v8 = (void *)[v7 mutableCopy];
  [(VUIDownloadCollectionViewController *)self setDownloadEntities:v8];

  double v9 = [(VUIDownloadCollectionViewController *)self downloadEntities];
  uint64_t v10 = [v9 count];

  id v11 = [(VUIDownloadCollectionViewController *)self contentPresenter];
  long long v12 = v11;
  if (v10)
  {
    [v11 setCurrentContentViewType:3];

    long long v12 = [(VUIDownloadCollectionViewController *)self diffableDataSource];
    uint64_t v13 = [(VUIDownloadCollectionViewController *)self _createDiffableDataSourceSnapshot];
    [v12 applySnapshot:v13 animatingDifferences:1 completion:0];
  }
  else
  {
    [v11 setCurrentContentViewType:2];
  }
}

- (void)downloadCellDidRequestCancelDownload:(id)a3
{
  id v4 = a3;
  double v5 = [(VUIDownloadCollectionViewController *)self collectionView];
  id v17 = [v5 indexPathForCell:v4];

  double v6 = v17;
  if (v17)
  {
    double v7 = [(VUIDownloadCollectionViewController *)self downloadEntities];
    double v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v17, "row"));

    double v9 = [v8 mediaEntities];
    uint64_t v10 = [v9 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      if (([v11 markedAsDeleted] & 1) != 0
        || ([v11 downloadExpirationDate],
            long long v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            !v12))
      {
        uint64_t v13 = [(VUIDownloadCollectionViewController *)self downloadEntities];
        objc_msgSend(v13, "removeObjectAtIndex:", objc_msgSend(v17, "row"));

        long long v14 = [(VUIDownloadCollectionViewController *)self _createIdentifierToDownloadEntityDictionary];
        [(VUIDownloadCollectionViewController *)self setIdentifierToDownloadEntityDictionary:v14];

        long long v15 = [(VUIDownloadCollectionViewController *)self diffableDataSource];
        double v16 = [(VUIDownloadCollectionViewController *)self _createDiffableDataSourceSnapshot];
        [v15 applySnapshot:v16 animatingDifferences:1 completion:0];
      }
    }

    double v6 = v17;
  }
}

- (id)_createCollectionView
{
  double v3 = objc_alloc_init(VUITopAlignedCollectionViewFlowLayout);
  [(UICollectionViewFlowLayout *)v3 setScrollDirection:0];
  [(UICollectionViewFlowLayout *)v3 setMinimumLineSpacing:0.0];
  id v4 = (void *)MEMORY[0x1E4FB1F48];
  int64_t v5 = [(VUIDownloadCollectionViewController *)self gridStyle];
  int64_t v6 = [(VUIDownloadCollectionViewController *)self gridType];
  double v7 = [(VUIDownloadCollectionViewController *)self view];
  [v7 bounds];
  objc_msgSend(v4, "vui_collectionInteritemSpace:gridType:windowWidth:", v5, v6, CGRectGetWidth(v18));
  double v9 = v8;

  [(UICollectionViewFlowLayout *)v3 setMinimumInteritemSpacing:v9];
  uint64_t v10 = [VUILegacyCollectionView alloc];
  id v11 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v10, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  long long v12 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  [(VUILegacyCollectionView *)v11 setBackgroundColor:v12];

  [(VUILegacyCollectionView *)v11 setAllowsMultipleSelection:1];
  [(VUILegacyCollectionView *)v11 setDelegate:self];
  [(VUILegacyCollectionView *)v11 setAlwaysBounceVertical:1];
  uint64_t v13 = objc_opt_class();
  long long v14 = (objc_class *)objc_opt_class();
  long long v15 = NSStringFromClass(v14);
  [(VUILegacyCollectionView *)v11 registerClass:v13 forCellWithReuseIdentifier:v15];

  return v11;
}

- (id)_createDiffableDataSource
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1598]);
  id v4 = [(VUIDownloadCollectionViewController *)self collectionView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__VUIDownloadCollectionViewController__createDiffableDataSource__block_invoke;
  v7[3] = &unk_1E6DF9C00;
  v7[4] = self;
  int64_t v5 = (void *)[v3 initWithCollectionView:v4 cellProvider:v7];

  return v5;
}

id __64__VUIDownloadCollectionViewController__createDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  long long v12 = [v9 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v8];

  uint64_t v13 = [*(id *)(a1 + 32) identifierToDownloadEntityDictionary];
  long long v14 = [v13 objectForKey:v7];

  [*(id *)(a1 + 32) cellWidth];
  +[VUIDownloadCollectionViewCell configureVUIDownloadEntityCollectionViewCell:withDownloadEntity:width:forMetrics:](VUIDownloadCollectionViewCell, "configureVUIDownloadEntityCollectionViewCell:withDownloadEntity:width:forMetrics:", v12, v14, 0);
  objc_msgSend(v12, "setEditing:", objc_msgSend(*(id *)(a1 + 32), "isEditing"));
  long long v15 = [v12 downloadButton];
  double v16 = v15;
  if (v15) {
    [v15 setPresentingViewController:*(void *)(a1 + 32)];
  }

  return v12;
}

- (id)_createDiffableDataSourceSnapshot
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v7[0] = @"DownloadGridMainSection";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 appendSectionsWithIdentifiers:v4];

  int64_t v5 = [(VUIDownloadCollectionViewController *)self _identifiersForDownloadEntities];
  [v3 appendItemsWithIdentifiers:v5 intoSectionWithIdentifier:@"DownloadGridMainSection"];

  return v3;
}

- (id)_createIdentifierToDownloadEntityDictionary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(VUIDownloadCollectionViewController *)self downloadEntities];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        if (v10) {
          [v3 setValue:v9 forKey:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = (void *)[v3 copy];
  return v11;
}

- (id)_identifiersForDownloadEntities
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(VUIDownloadCollectionViewController *)self downloadEntities];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v3 array];

  return v10;
}

- (double)_computeBottomMargin
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  id v4 = [(VUIDownloadCollectionViewController *)self diffableDataSource];
  uint64_t v5 = [v4 itemIdentifierForIndexPath:v3];

  uint64_t v6 = [(VUIDownloadCollectionViewController *)self identifierToDownloadEntityDictionary];
  uint64_t v7 = [v6 objectForKey:v5];

  id v8 = [(VUIDownloadCollectionViewController *)self sizingCell];
  [(VUIDownloadCollectionViewController *)self cellWidth];
  +[VUIDownloadCollectionViewCell configureVUIDownloadEntityCollectionViewCell:withDownloadEntity:width:forMetrics:](VUIDownloadCollectionViewCell, "configureVUIDownloadEntityCollectionViewCell:withDownloadEntity:width:forMetrics:", v8, v7, 1);

  id v9 = [(VUIDownloadCollectionViewController *)self sizingCell];
  objc_msgSend(v9, "setEditing:", -[VUIDownloadCollectionViewController isEditing](self, "isEditing"));

  uint64_t v10 = [(VUIDownloadCollectionViewController *)self sizingCell];
  +[VUIViewSpacer spacerB];
  objc_msgSend(v10, "bottomMarginWithBaselineMargin:");
  double v12 = v11;

  if (v12 == 0.0)
  {
    +[VUIViewSpacer spacerB];
    double v14 = v13;
    long long v15 = [(VUIDownloadCollectionViewController *)self traitCollection];
    +[VUIUtilities scaleContentSizeValue:v15 forTraitCollection:v14];
    double v12 = v16;
  }
  return v12;
}

- (void)_updateLayoutForSize:(CGSize)a3
{
  double width = a3.width;
  [(VUIDownloadCollectionViewController *)self lastViewWidth];
  if (v5 != width)
  {
    [(VUIDownloadCollectionViewController *)self setLastViewWidth:width];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClassForWindowWidth:", width);
    int64_t v7 = 3;
    if ((unint64_t)(v6 - 3) < 3) {
      int64_t v7 = 5;
    }
    self->_gridStyle = v7;
    objc_msgSend(MEMORY[0x1E4FB1F48], "vui_itemWidthForGridStyle:gridType:numGridColumns:windowWidth:", -[VUIDownloadCollectionViewController gridStyle](self, "gridStyle"), -[VUIDownloadCollectionViewController gridType](self, "gridType"), 1, width);
    self->_double cellWidth = v8;
    objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:", width);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = [(VUIDownloadCollectionViewController *)self collectionView];
    id v21 = [v17 collectionViewLayout];

    objc_msgSend(MEMORY[0x1E4FB1F48], "vui_collectionInteritemSpace:gridType:windowWidth:", -[VUIDownloadCollectionViewController gridStyle](self, "gridStyle"), -[VUIDownloadCollectionViewController gridType](self, "gridType"), width);
    objc_msgSend(v21, "setMinimumInteritemSpacing:");
    uint64_t v18 = [(VUIDownloadCollectionViewController *)self collectionView];
    objc_msgSend(v18, "setContentInset:", v10, v12, v14, v16);

    double v19 = [(VUIDownloadCollectionViewController *)self collectionView];
    v20 = [v19 collectionViewLayout];
    [v20 invalidateLayout];
  }
}

- (void)_editToggled
{
  if ([(VUIDownloadCollectionViewController *)self isEditing])
  {
    id v3 = [(VUIDownloadCollectionViewController *)self collectionView];
    id v4 = [v3 indexPathsForSelectedItems];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      uint64_t v6 = [(VUIDownloadCollectionViewController *)self _configureAlertController];
      alertController = self->_alertController;
      self->_alertController = v6;

      double v8 = self->_alertController;
      if (v8) {
        [(VUIDownloadCollectionViewController *)self presentViewController:v8 animated:1 completion:0];
      }
    }
    else
    {
      [(VUIDownloadCollectionViewController *)self _exitEditingMode];
    }
  }
  else
  {
    [(VUIDownloadCollectionViewController *)self _enterEditingMode];
  }
  [(VUIDownloadCollectionViewController *)self _updateAllVisibleCellsForEditingMode];
}

- (void)_batchSelectToggled
{
  if (self->_isSelectingAll)
  {
    [(VUIDownloadCollectionViewController *)self setIsSelectingAll:0];
    id v3 = [(VUIDownloadCollectionViewController *)self selectAllBarButtonItem];
    id v4 = +[VUILocalizationManager sharedInstance];
    uint64_t v5 = [v4 localizedStringForKey:@"SELECT_ALL"];
    [v3 setTitle:v5];

    [(VUIDownloadCollectionViewController *)self _clearSelections];
    uint64_t v6 = [(VUIDownloadCollectionViewController *)self rightBarButtonItem];
    id v11 = v6;
    uint64_t v7 = 0;
  }
  else
  {
    [(VUIDownloadCollectionViewController *)self setIsSelectingAll:1];
    double v8 = [(VUIDownloadCollectionViewController *)self selectAllBarButtonItem];
    double v9 = +[VUILocalizationManager sharedInstance];
    double v10 = [v9 localizedStringForKey:@"DESELECT_ALL"];
    [v8 setTitle:v10];

    [(VUIDownloadCollectionViewController *)self _selectAllCells];
    uint64_t v6 = [(VUIDownloadCollectionViewController *)self rightBarButtonItem];
    id v11 = v6;
    uint64_t v7 = 1;
  }
  [v6 setEnabled:v7];
}

- (id)_configureAlertController
{
  id v3 = +[VUILocalizationManager sharedInstance];
  id v4 = [v3 localizedStringForKey:@"DELETES_EXPLANATION"];

  uint64_t v5 = [(VUIDownloadCollectionViewController *)self _deleteActionTitleString];
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke;
  aBlock[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v28, location);
  uint64_t v6 = _Block_copy(aBlock);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke_2;
  v25[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v26, location);
  uint64_t v7 = _Block_copy(v25);
  double v8 = [(VUIDownloadCollectionViewController *)self collectionView];
  double v9 = [v8 indexPathsForSelectedItems];
  double v10 = (void *)[v9 count];

  if (v10)
  {
    double v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v4 preferredStyle:0];
    id v11 = (void *)MEMORY[0x1E4FB1410];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke_3;
    v23[3] = &unk_1E6DF4DA0;
    id v24 = v6;
    v20 = v5;
    double v12 = [v11 actionWithTitle:v5 style:2 handler:v23];
    [v10 addAction:v12];
    double v13 = (void *)MEMORY[0x1E4FB1410];
    double v14 = +[VUILocalizationManager sharedInstance];
    double v15 = [v14 localizedStringForKey:@"CANCEL"];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke_4;
    v21[3] = &unk_1E6DF4DA0;
    id v22 = v7;
    double v16 = [v13 actionWithTitle:v15 style:1 handler:v21];

    [v10 addAction:v16];
    [v10 setModalPresentationStyle:7];
    uint64_t v17 = [v10 popoverPresentationController];
    uint64_t v18 = [(VUIDownloadCollectionViewController *)self rightBarButtonItem];
    [v17 setBarButtonItem:v18];

    uint64_t v5 = v20;
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(location);

  return v10;
}

void __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(WeakRetained, "collectionView", 0);
  id v4 = [v3 indexPathsForSelectedItems];

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
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        double v10 = [WeakRetained downloadEntities];
        id v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "row"));
        [v2 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [WeakRetained _deleteDownloadEntities:v2];
  [WeakRetained _exitEditingMode];
}

void __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _exitEditingMode];
}

uint64_t __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__VUIDownloadCollectionViewController__configureAlertController__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_deleteActionTitleString
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = +[VUILocalizationManager sharedInstance];
  id v4 = [v3 localizedStringForKey:@"DELETE_DOWNLOAD"];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [(VUIDownloadCollectionViewController *)self collectionView];
  uint64_t v6 = [v5 indexPathsForSelectedItems];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = v7;
  unint64_t v9 = 0;
  uint64_t v10 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
      long long v13 = [(VUIDownloadCollectionViewController *)self diffableDataSource];
      long long v14 = [v13 itemIdentifierForIndexPath:v12];

      long long v15 = [(VUIDownloadCollectionViewController *)self identifierToDownloadEntityDictionary];
      double v16 = [v15 objectForKey:v14];

      uint64_t v17 = [v16 numberOfMediaItems];
      v9 += [v17 unsignedIntegerValue];
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v8);

  if (v9 >= 2)
  {
    uint64_t v18 = NSString;
    uint64_t v6 = +[VUILocalizationManager sharedInstance];
    double v19 = [v6 localizedStringForKey:@"DELETE_%U_DOWNLOADS"];
    uint64_t v20 = objc_msgSend(v18, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, @"%u", 0, v9);

    id v4 = (void *)v20;
LABEL_10:
  }
  return v4;
}

- (void)_configureNavigationBarForEditingMode
{
  v22[2] = *MEMORY[0x1E4F143B8];
  if ([(VUIDownloadCollectionViewController *)self isEditing])
  {
    id v3 = [(VUIDownloadCollectionViewController *)self rightBarButtonItem];
    id v4 = +[VUILocalizationManager sharedInstance];
    uint64_t v5 = [v4 localizedStringForKey:@"DELETE"];
    [v3 setTitle:v5];

    uint64_t v6 = [(VUIDownloadCollectionViewController *)self rightBarButtonItem];
    [v6 setEnabled:0];

    uint64_t v7 = [(VUIDownloadCollectionViewController *)self navigationItem];
    selectAllBarButtonItem = self->_selectAllBarButtonItem;
    v22[0] = self->_rightBarButtonItem;
    v22[1] = selectAllBarButtonItem;
    unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    [v7 setRightBarButtonItems:v9];

    uint64_t v10 = [(VUIDownloadCollectionViewController *)self navigationItem];
    [v10 setLeftBarButtonItem:self->_leftBarButtonItem];
  }
  else
  {
    [(VUIDownloadCollectionViewController *)self setIsSelectingAll:0];
    id v11 = [(VUIDownloadCollectionViewController *)self selectAllBarButtonItem];
    uint64_t v12 = +[VUILocalizationManager sharedInstance];
    long long v13 = [v12 localizedStringForKey:@"SELECT_ALL"];
    [v11 setTitle:v13];

    long long v14 = [(VUIDownloadCollectionViewController *)self rightBarButtonItem];
    long long v15 = +[VUILocalizationManager sharedInstance];
    double v16 = [v15 localizedStringForKey:@"EDIT"];
    [v14 setTitle:v16];

    uint64_t v17 = [(VUIDownloadCollectionViewController *)self rightBarButtonItem];
    [v17 setEnabled:1];

    uint64_t v18 = [(VUIDownloadCollectionViewController *)self navigationItem];
    rightBarButtonItem = self->_rightBarButtonItem;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&rightBarButtonItem count:1];
    [v18 setRightBarButtonItems:v19];

    uint64_t v10 = [(VUIDownloadCollectionViewController *)self navigationItem];
    uint64_t v20 = [(VUIDownloadCollectionViewController *)self backBarButtonItem];
    [v10 setLeftBarButtonItem:v20];
  }
}

- (void)_enterEditingMode
{
  [(VUIDownloadCollectionViewController *)self setIsEditing:1];
  [(VUIDownloadCollectionViewController *)self _configureNavigationBarForEditingMode];
}

- (void)_exitEditingMode
{
  [(VUIDownloadCollectionViewController *)self setIsEditing:0];
  [(VUIDownloadCollectionViewController *)self _updateAllVisibleCellsForEditingMode];
  [(VUIDownloadCollectionViewController *)self _clearSelections];
  [(VUIDownloadCollectionViewController *)self _configureNavigationBarForEditingMode];
  id v3 = [(VUIDownloadCollectionViewController *)self alertController];

  if (v3)
  {
    id v4 = [(VUIDownloadCollectionViewController *)self alertController];
    [v4 dismissViewControllerAnimated:0 completion:0];
  }
}

- (void)_clearSelections
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIDownloadCollectionViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        id v11 = [(VUIDownloadCollectionViewController *)self collectionView];
        [v11 deselectItemAtIndexPath:v10 animated:1];

        uint64_t v12 = [(VUIDownloadCollectionViewController *)self collectionView];
        long long v13 = [v12 cellForItemAtIndexPath:v10];

        [v13 setSelected:0 animated:1];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_selectAllCells
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(VUIDownloadCollectionViewController *)self collectionView];
  id v4 = [v3 indexPathsForVisibleItems];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        id v11 = [(VUIDownloadCollectionViewController *)self collectionView];
        [v11 selectItemAtIndexPath:v10 animated:1 scrollPosition:0];

        uint64_t v12 = [(VUIDownloadCollectionViewController *)self collectionView];
        long long v13 = [v12 cellForItemAtIndexPath:v10];

        [v13 setSelected:1 animated:1];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_deleteDownloadEntities:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = __63__VUIDownloadCollectionViewController__deleteDownloadEntities___block_invoke;
  uint64_t v9 = &unk_1E6DF3F68;
  uint64_t v10 = self;
  id v11 = v4;
  id v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472)) {
    v8((uint64_t)&v7);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v7);
  }
}

void __63__VUIDownloadCollectionViewController__deleteDownloadEntities___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [*(id *)(a1 + 32) downloadEntities];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (([*(id *)(a1 + 40) containsObject:v8] & 1) == 0) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) setDownloadEntities:v2];
  uint64_t v9 = [*(id *)(a1 + 32) diffableDataSource];
  uint64_t v10 = [*(id *)(a1 + 32) _createDiffableDataSourceSnapshot];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__VUIDownloadCollectionViewController__deleteDownloadEntities___block_invoke_2;
  v12[3] = &unk_1E6DF3F68;
  id v11 = *(void **)(a1 + 40);
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v11;
  [v9 applySnapshot:v10 animatingDifferences:1 completion:v12];
}

uint64_t __63__VUIDownloadCollectionViewController__deleteDownloadEntities___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteMediaEntitiesInDownloadEntities:*(void *)(a1 + 40)];
}

- (void)_deleteMediaEntitiesInDownloadEntities:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (NSMutableArray *)objc_opt_new();
  assetControllersToRemove = self->_assetControllersToRemove;
  self->_assetControllersToRemove = v5;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v12 = [v11 mediaEntities];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v21;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = [*(id *)(*((void *)&v20 + 1) + 8 * v16) assetController];
              uint64_t v18 = [(VUIDownloadCollectionViewController *)self assetControllersToRemove];
              [v18 addObject:v17];

              [v17 cancelAndRemoveDownload];
              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v14);
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }
}

- (void)_updateAllVisibleCellsForEditingMode
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(VUIDownloadCollectionViewController *)self collectionView];
  id v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setEditing:", -[VUIDownloadCollectionViewController isEditing](self, "isEditing"));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateSelectAllBarButtonItemIfNecessary
{
  id v3 = [(VUIDownloadCollectionViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [(VUIDownloadCollectionViewController *)self downloadEntities];
  uint64_t v7 = [v6 count];

  if (v5 == v7)
  {
    [(VUIDownloadCollectionViewController *)self setIsSelectingAll:1];
    uint64_t v8 = [(VUIDownloadCollectionViewController *)self selectAllBarButtonItem];
    long long v9 = +[VUILocalizationManager sharedInstance];
    long long v10 = [v9 localizedStringForKey:@"DESELECT_ALL"];
    [v8 setTitle:v10];

    long long v11 = [(VUIDownloadCollectionViewController *)self rightBarButtonItem];
    id v21 = v11;
    uint64_t v12 = 1;
  }
  else
  {
    [(VUIDownloadCollectionViewController *)self setIsSelectingAll:0];
    uint64_t v13 = [(VUIDownloadCollectionViewController *)self selectAllBarButtonItem];
    uint64_t v14 = +[VUILocalizationManager sharedInstance];
    uint64_t v15 = [v14 localizedStringForKey:@"SELECT_ALL"];
    [v13 setTitle:v15];

    uint64_t v16 = [(VUIDownloadCollectionViewController *)self collectionView];
    long long v17 = [v16 indexPathsForSelectedItems];
    uint64_t v18 = [v17 count];

    if (v18) {
      return;
    }
    uint64_t v19 = [(VUIDownloadCollectionViewController *)self rightBarButtonItem];
    int v20 = [v19 isEnabled];

    if (!v20) {
      return;
    }
    long long v11 = [(VUIDownloadCollectionViewController *)self rightBarButtonItem];
    id v21 = v11;
    uint64_t v12 = 0;
  }
  [v11 setEnabled:v12];
}

- (void)_updateNavigationBarPadding
{
  id v3 = (void *)MEMORY[0x1E4FB1F48];
  id v4 = [(VUIDownloadCollectionViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v27));
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = [(VUIDownloadCollectionViewController *)self navigationController];
  uint64_t v14 = [v13 navigationBar];
  [v14 layoutMargins];
  if (v8 == v18 && v6 == v15 && v12 == v17)
  {
    double v21 = v16;

    if (v10 == v21) {
      return;
    }
  }
  else
  {
  }
  long long v22 = [(VUIDownloadCollectionViewController *)self navigationController];
  long long v23 = [v22 navigationBar];
  objc_msgSend(v23, "setLayoutMargins:", v6, v8, v10, v12);

  id v25 = [(VUIDownloadCollectionViewController *)self navigationController];
  long long v24 = [v25 navigationBar];
  [v24 setNeedsLayout];
}

- (VUIDownloadDataSource)downloadDataSource
{
  return self->_downloadDataSource;
}

- (void)setDownloadDataSource:(id)a3
{
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
}

- (VUILegacyCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (VUIDownloadCollectionViewCell)sizingCell
{
  return self->_sizingCell;
}

- (void)setSizingCell:(id)a3
{
}

- (UIBarButtonItem)leftBarButtonItem
{
  return self->_leftBarButtonItem;
}

- (void)setLeftBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)rightBarButtonItem
{
  return self->_rightBarButtonItem;
}

- (void)setRightBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)backBarButtonItem
{
  return self->_backBarButtonItem;
}

- (void)setBackBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)selectAllBarButtonItem
{
  return self->_selectAllBarButtonItem;
}

- (void)setSelectAllBarButtonItem:(id)a3
{
}

- (NSMutableArray)downloadEntities
{
  return self->_downloadEntities;
}

- (NSDictionary)identifierToDownloadEntityDictionary
{
  return self->_identifierToDownloadEntityDictionary;
}

- (void)setIdentifierToDownloadEntityDictionary:(id)a3
{
}

- (NSMutableArray)assetControllersToRemove
{
  return self->_assetControllersToRemove;
}

- (void)setAssetControllersToRemove:(id)a3
{
}

- (double)cellWidth
{
  return self->_cellWidth;
}

- (void)setCellWidth:(double)a3
{
  self->_double cellWidth = a3;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (BOOL)isSelectingAll
{
  return self->_isSelectingAll;
}

- (void)setIsSelectingAll:(BOOL)a3
{
  self->_isSelectingAll = a3;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (void)setGridStyle:(int64_t)a3
{
  self->_gridStyle = a3;
}

- (int64_t)gridType
{
  return self->_gridType;
}

- (void)setGridType:(int64_t)a3
{
  self->_gridType = a3;
}

- (double)lastViewWidth
{
  return self->_lastViewWidth;
}

- (void)setLastViewWidth:(double)a3
{
  self->_lastViewWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetControllersToRemove, 0);
  objc_storeStrong((id *)&self->_identifierToDownloadEntityDictionary, 0);
  objc_storeStrong((id *)&self->_downloadEntities, 0);
  objc_storeStrong((id *)&self->_selectAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_downloadDataSource, 0);
}

- (void)collectionView:(uint64_t)a1 didSelectItemAtIndexPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Unable to start playback because no entity found for identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end