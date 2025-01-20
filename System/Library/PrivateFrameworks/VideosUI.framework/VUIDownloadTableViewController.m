@interface VUIDownloadTableViewController
- (BOOL)_downloadEntityShouldShowRenewOption:(id)a3;
- (BOOL)isSelectingAll;
- (NSDictionary)identifierToDownloadEntityDictionary;
- (NSMutableArray)assetControllersToRemove;
- (NSMutableArray)downloadEntities;
- (UIAlertController)alertController;
- (UIBarButtonItem)backBarButtonItem;
- (UIBarButtonItem)leftBarButtonItem;
- (UIBarButtonItem)rightBarButtonItem;
- (UIBarButtonItem)selectAllBarButtonItem;
- (UITableView)downloadEntitiesTableView;
- (UITableViewDiffableDataSource)diffableDataSource;
- (VUIDownloadDataSource)downloadDataSource;
- (VUIDownloadEntityTableViewCell)sizingCell;
- (VUIDownloadTableViewController)initWithDataSource:(id)a3;
- (VUIViewControllerContentPresenter)contentPresenter;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_configureAlertControllerForIndexPath:(id)a3 withCompletion:(id)a4;
- (id)_configureRenewAlertControllerForIndexPath:(id)a3 forPreferredStyle:(int64_t)a4 withCompletion:(id)a5;
- (id)_createDiffableDataSource;
- (id)_createDiffableDataSourceSnapshot;
- (id)_createIdentifierToDownloadEntityDictionary;
- (id)_identifiersForDownloadEntities;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (void)_batchSelectToggled;
- (void)_clearSelections;
- (void)_clearTableViewSelections:(BOOL)a3;
- (void)_deleteDownloadEntities:(id)a3;
- (void)_deleteMediaEntitiesInDownloadEntities:(id)a3;
- (void)_editToggled;
- (void)_exitEditingMode;
- (void)_popIfNeeded;
- (void)_selectAllCells;
- (void)_toggleRightBarEditItemIfNeeded;
- (void)_updateNavigationBarPadding;
- (void)dealloc;
- (void)downloadCellDidRequestCancelDownload:(id)a3;
- (void)downloadManager:(id)a3 downloadedFetchDidFinishWithEntities:(id)a4;
- (void)downloadManager:(id)a3 downloadsDidChange:(id)a4;
- (void)fullscreenPlaybackUIDidChangeNotification:(id)a3;
- (void)loadView;
- (void)setAlertController:(id)a3;
- (void)setAssetControllersToRemove:(id)a3;
- (void)setBackBarButtonItem:(id)a3;
- (void)setContentPresenter:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setDownloadDataSource:(id)a3;
- (void)setDownloadEntities:(id)a3;
- (void)setDownloadEntitiesTableView:(id)a3;
- (void)setIdentifierToDownloadEntityDictionary:(id)a3;
- (void)setIsSelectingAll:(BOOL)a3;
- (void)setLeftBarButtonItem:(id)a3;
- (void)setRightBarButtonItem:(id)a3;
- (void)setSelectAllBarButtonItem:(id)a3;
- (void)setSizingCell:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VUIDownloadTableViewController

- (VUIDownloadTableViewController)initWithDataSource:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIDownloadTableViewController;
  v5 = [(VUIDownloadTableViewController *)&v15 init];
  v6 = v5;
  if (v5)
  {
    [(VUIDownloadTableViewController *)v5 setDownloadDataSource:v4];
    v7 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v6->_contentPresenter;
    v6->_contentPresenter = v7;

    [(VUIViewControllerContentPresenter *)v6->_contentPresenter setLogName:@"VUIDownloadTableViewController"];
    objc_initWeak(&location, v6);
    v16[0] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__VUIDownloadTableViewController_initWithDataSource___block_invoke;
    v12[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v13, &location);
    id v10 = (id)[(VUIDownloadTableViewController *)v6 registerForTraitChanges:v9 withHandler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __53__VUIDownloadTableViewController_initWithDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSizingCell:0];
}

- (void)loadView
{
  v39.receiver = self;
  v39.super_class = (Class)VUIDownloadTableViewController;
  [(VUIDownloadTableViewController *)&v39 loadView];
  v3 = [(VUIDownloadTableViewController *)self contentPresenter];
  [v3 setRootViewForViewController:self];

  id v4 = objc_alloc(MEMORY[0x1E4FB1D00]);
  v5 = (UITableView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  downloadEntitiesTableView = self->_downloadEntitiesTableView;
  self->_downloadEntitiesTableView = v5;

  [(UITableView *)self->_downloadEntitiesTableView setDelegate:self];
  [(UITableView *)self->_downloadEntitiesTableView setAllowsMultipleSelectionDuringEditing:1];
  [(UITableView *)self->_downloadEntitiesTableView setSeparatorStyle:0];
  v7 = self->_downloadEntitiesTableView;
  uint64_t v8 = objc_opt_class();
  v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  [(UITableView *)v7 registerClass:v8 forCellReuseIdentifier:v10];

  v11 = self->_downloadEntitiesTableView;
  v12 = objc_opt_new();
  [(UITableView *)v11 setTableFooterView:v12];

  id v13 = [(VUIDownloadTableViewController *)self _createDiffableDataSource];
  [(VUIDownloadTableViewController *)self setDiffableDataSource:v13];

  if (([MEMORY[0x1E4FB1438] isRunningInStoreDemoMode] & 1) == 0)
  {
    id v14 = objc_alloc(MEMORY[0x1E4FB14A8]);
    objc_super v15 = +[VUILocalizationManager sharedInstance];
    v16 = [v15 localizedStringForKey:@"EDIT"];
    v17 = (UIBarButtonItem *)[v14 initWithTitle:v16 style:0 target:self action:sel__editToggled];
    rightBarButtonItem = self->_rightBarButtonItem;
    self->_rightBarButtonItem = v17;

    v19 = [(VUIDownloadTableViewController *)self navigationItem];
    [v19 setRightBarButtonItem:self->_rightBarButtonItem];

    id v20 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v21 = +[VUILocalizationManager sharedInstance];
    v22 = [v21 localizedStringForKey:@"SELECT_ALL"];
    v23 = (UIBarButtonItem *)[v20 initWithTitle:v22 style:0 target:self action:sel__batchSelectToggled];
    selectAllBarButtonItem = self->_selectAllBarButtonItem;
    self->_selectAllBarButtonItem = v23;
  }
  v25 = [(VUIDownloadTableViewController *)self navigationItem];
  v26 = [v25 leftBarButtonItem];
  backBarButtonItem = self->_backBarButtonItem;
  self->_backBarButtonItem = v26;

  v28 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelPressed];
  leftBarButtonItem = self->_leftBarButtonItem;
  self->_leftBarButtonItem = v28;

  objc_initWeak(&location, self);
  v30 = (void *)MEMORY[0x1E4FB5180];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __42__VUIDownloadTableViewController_loadView__block_invoke;
  v36[3] = &unk_1E6DF59E8;
  objc_copyWeak(&v37, &location);
  [v30 isFullTVAppEnabledwithCompletion:v36];
  v31 = VUIDefaultLogObject();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_1E2BD7000, v31, OS_LOG_TYPE_INFO, "[VUIDownloadTableViewController] - load view - update content view type to loading", v35, 2u);
  }

  v32 = [(VUIDownloadTableViewController *)self contentPresenter];
  [v32 setCurrentContentViewType:1];

  v33 = [(VUIDownloadTableViewController *)self contentPresenter];
  [v33 setContentView:self->_downloadEntitiesTableView];

  v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v34 addObserver:self selector:sel_fullscreenPlaybackUIDidChangeNotification_ name:VUIPlaybackManagerFullscreenPlaybackUIDidChangeNotification[0] object:0];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

void __42__VUIDownloadTableViewController_loadView__block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__VUIDownloadTableViewController_loadView__block_invoke_2;
  v3[3] = &unk_1E6DF5330;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __42__VUIDownloadTableViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  char v3 = [v2 isNetworkReachable];

  if (v3)
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);
    char v5 = [WeakRetained contentPresenter];
    v6 = +[VUILocalizationManager sharedInstance];
    v7 = v6;
    if (v4)
    {
      uint64_t v8 = [v6 localizedStringForKey:@"LIBRARY_EMPTY_TITLE_NEW"];
      [v5 setNoContentErrorTitle:v8];

      v9 = [WeakRetained contentPresenter];
      id v10 = +[VUILocalizationManager sharedInstance];
      v11 = v10;
      v12 = @"LIBRARY_EMPTY_DESCRIPTION_NEW";
LABEL_6:
      uint64_t v16 = [v10 localizedStringForKey:v12];
      goto LABEL_8;
    }
LABEL_5:
    objc_super v15 = [v7 localizedStringForKey:@"LIBRARY_EMPTY_TITLE_LIBRARY_ONLY"];
    [v5 setNoContentErrorTitle:v15];

    v9 = [WeakRetained contentPresenter];
    id v10 = +[VUILocalizationManager sharedInstance];
    v11 = v10;
    v12 = @"LIBRARY_EMPTY_DESCRIPTION_LIBRARY_ONLY";
    goto LABEL_6;
  }
  int v13 = WLKIsRegulatedSKU();
  char v5 = [WeakRetained contentPresenter];
  id v14 = +[VUILocalizationManager sharedInstance];
  v7 = v14;
  if (v13) {
    goto LABEL_5;
  }
  v17 = [v14 localizedStringForKey:@"LIBRARY_EMPTY_TITLE_NO_CONNECTION"];
  [v5 setNoContentErrorTitle:v17];

  v9 = [WeakRetained contentPresenter];
  v11 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
  uint64_t v16 = [v11 localizedStringForKey:@"LIBRARY_EMPTY_DESCRIPTION_NO_CONNNECTION" value:0 table:@"VideosUIEmbedded"];
LABEL_8:
  v18 = (void *)v16;
  [v9 setNoContentErrorMessage:v16];

  v19 = [WeakRetained contentPresenter];
  [v19 refreshNoContentViewIfNeeded];

  [WeakRetained _toggleRightBarEditItemIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIDownloadTableViewController;
  -[VUIDownloadTableViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(VUIDownloadTableViewController *)self _clearTableViewSelections:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadTableViewController;
  [(VUIDownloadTableViewController *)&v4 viewDidAppear:a3];
  +[VUILibraryMetrics recordPageEventWithPageType:@"LibraryDownloaded"];
  [(VUIDownloadTableViewController *)self _updateNavigationBarPadding];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)VUIDownloadTableViewController;
  [(VUIDownloadTableViewController *)&v17 viewDidLoad];
  BOOL v3 = +[VUILocalizationManager sharedInstance];
  objc_super v4 = [v3 localizedStringForKey:@"DOWNLOADED"];
  [(VUIDownloadTableViewController *)self setTitle:v4];

  [(VUIDownloadDataSource *)self->_downloadDataSource setDownloadDelegate:self];
  if ([(VUILibraryDataSource *)self->_downloadDataSource hasCompletedInitialFetch])
  {
    objc_super v5 = [(VUIDownloadTableViewController *)self downloadDataSource];
    v6 = [v5 downloadEntities];
    v7 = (void *)[v6 mutableCopy];
    [(VUIDownloadTableViewController *)self setDownloadEntities:v7];

    uint64_t v8 = [(VUIDownloadTableViewController *)self downloadEntities];
    uint64_t v9 = [v8 count];

    id v10 = [(VUIDownloadTableViewController *)self contentPresenter];
    v11 = v10;
    if (v9)
    {
      uint64_t v12 = [v10 currentContentViewType];

      if (v12 != 3)
      {
        int v13 = [(VUIDownloadTableViewController *)self contentPresenter];
        [v13 setCurrentContentViewType:3];
      }
      v11 = [(VUIDownloadTableViewController *)self diffableDataSource];
      id v14 = [(VUIDownloadTableViewController *)self _createDiffableDataSourceSnapshot];
      [v11 applySnapshot:v14 animatingDifferences:v12 == 3 completion:0];
    }
    else
    {
      [v10 setCurrentContentViewType:2];
    }

    [(VUIDownloadTableViewController *)self _toggleRightBarEditItemIfNeeded];
  }
  else
  {
    [(VUIDownloadDataSource *)self->_downloadDataSource startFetch];
  }
  objc_super v15 = [(VUIDownloadTableViewController *)self view];
  uint64_t v16 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:@"Library.id=\"Downloaded\""];
  [v15 setAccessibilityIdentifier:v16];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VUIDownloadTableViewController;
  [(VUIDownloadTableViewController *)&v5 viewWillLayoutSubviews];
  BOOL v3 = [(VUIDownloadTableViewController *)self contentPresenter];
  objc_super v4 = [(VUIDownloadTableViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VUIDownloadTableViewController;
  [(VUIDownloadTableViewController *)&v3 viewDidLayoutSubviews];
  [(VUIDownloadTableViewController *)self _updateNavigationBarPadding];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadTableViewController;
  [(VUIDownloadTableViewController *)&v4 dealloc];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUIDownloadTableViewController;
  id v7 = a4;
  -[VUIDownloadTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__VUIDownloadTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6DF4CD8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __85__VUIDownloadTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exitEditingMode];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (!self->_sizingCell)
  {
    v6 = objc_alloc_init(VUIDownloadEntityTableViewCell);
    sizingCell = self->_sizingCell;
    self->_sizingCell = v6;
  }
  uint64_t v8 = [(VUIDownloadTableViewController *)self diffableDataSource];
  objc_super v9 = [v8 itemIdentifierForIndexPath:v5];

  id v10 = [(VUIDownloadTableViewController *)self identifierToDownloadEntityDictionary];
  v11 = [v10 objectForKey:v9];

  +[VUIDownloadEntityTableViewCell configureVUIDownloadEntityTableViewCell:self->_sizingCell withDownloadEntity:v11 forMetrics:1];
  uint64_t v12 = self->_sizingCell;
  int v13 = [(VUIDownloadTableViewController *)self view];
  [v13 bounds];
  -[VUIDownloadEntityTableViewCell sizeThatFits:](v12, "sizeThatFits:", CGRectGetWidth(v17), 1.79769313e308);
  double v15 = v14;

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(UITableView *)self->_downloadEntitiesTableView isEditing])
  {
    v11 = [(VUIDownloadTableViewController *)self diffableDataSource];
    id v10 = [v11 itemIdentifierForIndexPath:v7];

    uint64_t v12 = [(VUIDownloadTableViewController *)self identifierToDownloadEntityDictionary];
    int v13 = [v12 objectForKey:v10];

    if ([v13 downloadType])
    {
      if ([v13 downloadType] == 1 || objc_msgSend(v13, "downloadType") == 2)
      {
        double v14 = objc_msgSend(v13, "mediaEntities", v10);
        double v15 = [v14 firstObject];

        +[VUILibraryMetrics recordClickOnMediaEntity:v15];
        uint64_t v16 = [[VUIDownloadShowDataSource alloc] initWithMediaEntity:v15];
        CGRect v17 = [v15 showIdentifier];
        v18 = +[VUIMediaEntityFetchRequest seasonsFetchRequestWithShowIdentifier:v17];
        v19 = [v15 mediaLibrary];
        id v20 = +[VUIMediaEntitiesDataSourceFactory dataSourceForFetchRequest:v18 withLibrary:v19];

        v21 = [[VUIDownloadShowTableViewController alloc] initWithDataSource:v16 seasonsDataSource:v20];
        v22 = [v15 showTitle];

        if (v22)
        {
          v23 = [(VUIDownloadShowTableViewController *)v21 navigationItem];
          v24 = [v15 showTitle];
          [v23 setTitle:v24];
        }
        v25 = [(VUIDownloadTableViewController *)self navigationController];
        [v25 pushViewController:v21 animated:1];

        id v10 = v36;
      }
    }
    else
    {
      v26 = [v13 mediaEntities];
      v27 = [v26 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = v27;
        v29 = [v28 downloadExpirationDate];
        v30 = v29;
        if (v29 && !objc_msgSend(v29, "vui_isInTheFuture"))
        {
          v35 = [(VUIDownloadTableViewController *)self _configureRenewAlertControllerForIndexPath:v7 forPreferredStyle:1 withCompletion:0];
          if (v35) {
            [(VUIDownloadTableViewController *)self presentViewController:v35 animated:1 completion:0];
          }
          [v6 deselectRowAtIndexPath:v7 animated:1];
        }
        else
        {
          v31 = [VUIMediaInfo alloc];
          v39[0] = v28;
          v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
          v33 = [(VUIMediaInfo *)v31 initWithPlaybackContext:3 vuiMediaItems:v32];

          [(VUIMediaInfo *)v33 setIntent:1];
          [(VUIMediaInfo *)v33 setAutomaticPlaybackStart:0];
          if (v33)
          {
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __68__VUIDownloadTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
            v37[3] = &unk_1E6DF3D58;
            v38 = v28;
            +[VUIActionPlay playMediaInfo:v33 watchType:0 isRentAndWatchNow:0 completion:v37];
            v34 = v38;
          }
          else
          {
            v34 = VUIDefaultLogObject();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              -[VUIDownloadShowTableViewController tableView:didSelectRowAtIndexPath:]((uint64_t)v28, v34);
            }
          }
        }
      }
    }
    goto LABEL_24;
  }
  uint64_t v8 = [(VUIDownloadTableViewController *)self rightBarButtonItem];
  char v9 = [v8 isEnabled];

  if ((v9 & 1) == 0)
  {
    id v10 = [(VUIDownloadTableViewController *)self rightBarButtonItem];
    [v10 setEnabled:1];
LABEL_24:
  }
}

uint64_t __68__VUIDownloadTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return +[VUILibraryMetrics recordPlayOfMediaEntity:*(void *)(a1 + 32) isLaunchingExtras:0];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
  int v6 = [v5 isEditing];

  if (v6)
  {
    id v7 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
    uint64_t v8 = [v7 indexPathsForSelectedRows];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      id v10 = [(VUIDownloadTableViewController *)self rightBarButtonItem];
      [v10 setEnabled:0];
    }
  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  id v6 = [(VUIDownloadTableViewController *)self rightBarButtonItem];
  objc_super v4 = +[VUILocalizationManager sharedInstance];
  id v5 = [v4 localizedStringForKey:@"DONE"];
  [v6 setTitle:v5];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  id v6 = [(VUIDownloadTableViewController *)self rightBarButtonItem];
  objc_super v4 = +[VUILocalizationManager sharedInstance];
  id v5 = [v4 localizedStringForKey:@"EDIT"];
  [v6 setTitle:v5];
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4FB1438] isRunningInStoreDemoMode])
  {
    id v7 = 0;
  }
  else
  {
    id v32 = v6;
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_initWeak(&location, self);
    uint64_t v8 = (void *)MEMORY[0x1E4FB1688];
    uint64_t v9 = +[VUILocalizationManager sharedInstance];
    id v10 = [v9 localizedStringForKey:@"DELETE"];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __95__VUIDownloadTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    v42[3] = &unk_1E6DF4D00;
    objc_copyWeak(&v44, &location);
    id v11 = v6;
    id v43 = v11;
    v31 = [v8 contextualActionWithStyle:1 title:v10 handler:v42];

    [v34 addObject:v31];
    if (v11)
    {
      uint64_t v12 = [(VUIDownloadTableViewController *)self diffableDataSource];
      int v13 = [v12 itemIdentifierForIndexPath:v11];

      double v14 = [(VUIDownloadTableViewController *)self identifierToDownloadEntityDictionary];
      double v15 = [v14 objectForKey:v13];
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v16 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
      int v13 = [v16 indexPathsForSelectedRows];

      double v15 = 0;
      uint64_t v17 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v39;
        do
        {
          uint64_t v19 = 0;
          id v20 = v15;
          do
          {
            if (*(void *)v39 != v18) {
              objc_enumerationMutation(v13);
            }
            double v15 = -[NSMutableArray objectAtIndex:](self->_downloadEntities, "objectAtIndex:", [*(id *)(*((void *)&v38 + 1) + 8 * v19) row]);

            ++v19;
            id v20 = v15;
          }
          while (v17 != v19);
          uint64_t v17 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v17);
      }
    }

    if ([(VUIDownloadTableViewController *)self _downloadEntityShouldShowRenewOption:v15])
    {
      v21 = [v15 mediaEntities];
      v22 = [v21 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [v22 downloadExpirationDate];
        if (v23)
        {
          v24 = (void *)MEMORY[0x1E4FB1688];
          v25 = +[VUILocalizationManager sharedInstance];
          v26 = [v25 localizedStringForKey:@"RENEW"];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __95__VUIDownloadTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2;
          v35[3] = &unk_1E6DF4D00;
          objc_copyWeak(&v37, &location);
          id v36 = v11;
          v27 = [v24 contextualActionWithStyle:0 title:v26 handler:v35];

          [v34 addObject:v27];
          objc_destroyWeak(&v37);
        }
      }
    }
    id v28 = (void *)MEMORY[0x1E4FB1CC0];
    v29 = (void *)[v34 copy];
    id v7 = [v28 configurationWithActions:v29];

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);

    id v6 = v32;
  }

  return v7;
}

void __95__VUIDownloadTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained _configureAlertControllerForIndexPath:*(void *)(a1 + 32) withCompletion:v6];

  [WeakRetained setAlertController:v7];
  uint64_t v8 = [WeakRetained alertController];

  if (v8)
  {
    uint64_t v9 = [WeakRetained alertController];
    [WeakRetained presentViewController:v9 animated:1 completion:0];
  }
}

void __95__VUIDownloadTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained _configureRenewAlertControllerForIndexPath:*(void *)(a1 + 32) forPreferredStyle:0 withCompletion:v6];

  if (v7) {
    [WeakRetained presentViewController:v7 animated:1 completion:0];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  if (self->_isSelectingAll) {
    [a4 setSelected:1];
  }
}

- (void)downloadManager:(id)a3 downloadedFetchDidFinishWithEntities:(id)a4
{
  id v5 = [(VUIDownloadTableViewController *)self downloadDataSource];
  id v6 = [v5 downloadEntities];
  id v7 = (void *)[v6 mutableCopy];
  [(VUIDownloadTableViewController *)self setDownloadEntities:v7];

  uint64_t v8 = [(VUIDownloadTableViewController *)self downloadEntities];
  uint64_t v9 = [v8 count];

  id v10 = [(VUIDownloadTableViewController *)self contentPresenter];
  id v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v10 currentContentViewType];

    if (v12 != 3)
    {
      int v13 = [(VUIDownloadTableViewController *)self contentPresenter];
      [v13 setCurrentContentViewType:3];
    }
    id v15 = [(VUIDownloadTableViewController *)self diffableDataSource];
    double v14 = [(VUIDownloadTableViewController *)self _createDiffableDataSourceSnapshot];
    [v15 applySnapshot:v14 animatingDifferences:v12 == 3 completion:0];
  }
  else
  {
    [v10 setCurrentContentViewType:2];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__VUIDownloadTableViewController_downloadManager_downloadedFetchDidFinishWithEntities___block_invoke;
    block[3] = &unk_1E6DF3D58;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __87__VUIDownloadTableViewController_downloadManager_downloadedFetchDidFinishWithEntities___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _popIfNeeded];
}

- (void)downloadManager:(id)a3 downloadsDidChange:(id)a4
{
  id v5 = [(VUIDownloadTableViewController *)self downloadDataSource];
  id v6 = [v5 downloadEntities];
  id v7 = (void *)[v6 mutableCopy];
  [(VUIDownloadTableViewController *)self setDownloadEntities:v7];

  uint64_t v8 = [(VUIDownloadTableViewController *)self downloadEntities];
  uint64_t v9 = [v8 count];

  id v10 = [(VUIDownloadTableViewController *)self contentPresenter];
  id v11 = v10;
  if (v9)
  {
    [v10 setCurrentContentViewType:3];

    id v13 = [(VUIDownloadTableViewController *)self diffableDataSource];
    uint64_t v12 = [(VUIDownloadTableViewController *)self _createDiffableDataSourceSnapshot];
    [v13 applySnapshot:v12 animatingDifferences:1 completion:0];
  }
  else
  {
    [v10 setCurrentContentViewType:2];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__VUIDownloadTableViewController_downloadManager_downloadsDidChange___block_invoke;
    block[3] = &unk_1E6DF3D58;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __69__VUIDownloadTableViewController_downloadManager_downloadsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _popIfNeeded];
}

- (void)setDownloadEntities:(id)a3
{
  objc_storeStrong((id *)&self->_downloadEntities, a3);
  objc_super v4 = [(VUIDownloadTableViewController *)self _createIdentifierToDownloadEntityDictionary];
  [(VUIDownloadTableViewController *)self setIdentifierToDownloadEntityDictionary:v4];

  [(VUIDownloadTableViewController *)self _toggleRightBarEditItemIfNeeded];
}

- (void)_popIfNeeded
{
  objc_super v3 = [(VUIDownloadTableViewController *)self navigationController];
  id v7 = [v3 childViewControllers];

  objc_super v4 = [(VUIDownloadTableViewController *)self downloadEntities];
  if (![v4 count] && (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    id v5 = [v7 lastObject];

    if (v5 != self) {
      goto LABEL_6;
    }
    objc_super v4 = [(VUIDownloadTableViewController *)self navigationController];
    id v6 = (id)[v4 popViewControllerAnimated:1];
  }

LABEL_6:
}

- (void)downloadCellDidRequestCancelDownload:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
  id v14 = [v5 indexPathForCell:v4];

  id v6 = v14;
  if (v14)
  {
    id v7 = -[NSMutableArray objectAtIndex:](self->_downloadEntities, "objectAtIndex:", [v14 row]);
    uint64_t v8 = [v7 mediaEntities];
    uint64_t v9 = [v8 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      if (([v10 markedAsDeleted] & 1) != 0
        || ([v10 downloadExpirationDate],
            id v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            !v11))
      {
        -[NSMutableArray removeObjectAtIndex:](self->_downloadEntities, "removeObjectAtIndex:", [v14 row]);
        uint64_t v12 = [(VUIDownloadTableViewController *)self diffableDataSource];
        id v13 = [(VUIDownloadTableViewController *)self _createDiffableDataSourceSnapshot];
        [v12 applySnapshot:v13 animatingDifferences:1 completion:0];
      }
    }

    id v6 = v14;
  }
}

- (void)_toggleRightBarEditItemIfNeeded
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(VUIDownloadTableViewController *)self downloadEntities];
  uint64_t v4 = [v3 count];

  id v5 = [(VUIDownloadTableViewController *)self navigationItem];
  id v6 = v5;
  if (v4)
  {
    v8[0] = self->_rightBarButtonItem;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v6 setRightBarButtonItems:v7];
  }
  else
  {
    [v5 setRightBarButtonItems:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_editToggled
{
  if ([(UITableView *)self->_downloadEntitiesTableView isEditing])
  {
    objc_super v3 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
    uint64_t v4 = [v3 indexPathsForSelectedRows];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = [(VUIDownloadTableViewController *)self _configureAlertControllerForIndexPath:0 withCompletion:0];
      alertController = self->_alertController;
      self->_alertController = v6;

      if (self->_alertController)
      {
        -[VUIDownloadTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:");
      }
    }
    else
    {
      [(VUIDownloadTableViewController *)self _exitEditingMode];
    }
  }
  else
  {
    [(UITableView *)self->_downloadEntitiesTableView setEditing:1 animated:1];
    rightBarButtonItem = self->_rightBarButtonItem;
    uint64_t v9 = +[VUILocalizationManager sharedInstance];
    id v10 = [v9 localizedStringForKey:@"DELETE"];
    [(UIBarButtonItem *)rightBarButtonItem setTitle:v10];

    id v11 = [(VUIDownloadTableViewController *)self rightBarButtonItem];
    [v11 setEnabled:0];

    uint64_t v12 = [(VUIDownloadTableViewController *)self selectAllBarButtonItem];
    id v13 = +[VUILocalizationManager sharedInstance];
    id v14 = [v13 localizedStringForKey:@"SELECT_ALL"];
    [v12 setTitle:v14];

    id v18 = (id)objc_opt_new();
    if (self->_rightBarButtonItem) {
      objc_msgSend(v18, "addObject:");
    }
    if (self->_selectAllBarButtonItem) {
      objc_msgSend(v18, "addObject:");
    }
    id v15 = [(VUIDownloadTableViewController *)self navigationItem];
    uint64_t v16 = (void *)[v18 copy];
    [v15 setRightBarButtonItems:v16];

    uint64_t v17 = [(VUIDownloadTableViewController *)self navigationItem];
    [v17 setLeftBarButtonItem:self->_leftBarButtonItem];
  }
}

- (void)_batchSelectToggled
{
  if (self->_isSelectingAll)
  {
    [(VUIDownloadTableViewController *)self setIsSelectingAll:0];
    objc_super v3 = [(VUIDownloadTableViewController *)self selectAllBarButtonItem];
    uint64_t v4 = +[VUILocalizationManager sharedInstance];
    uint64_t v5 = [v4 localizedStringForKey:@"SELECT_ALL"];
    [v3 setTitle:v5];

    [(VUIDownloadTableViewController *)self _clearSelections];
    id v6 = [(VUIDownloadTableViewController *)self rightBarButtonItem];
    id v11 = v6;
    uint64_t v7 = 0;
  }
  else
  {
    [(VUIDownloadTableViewController *)self setIsSelectingAll:1];
    uint64_t v8 = [(VUIDownloadTableViewController *)self selectAllBarButtonItem];
    uint64_t v9 = +[VUILocalizationManager sharedInstance];
    id v10 = [v9 localizedStringForKey:@"DESELECT_ALL"];
    [v8 setTitle:v10];

    [(VUIDownloadTableViewController *)self _selectAllCells];
    id v6 = [(VUIDownloadTableViewController *)self rightBarButtonItem];
    id v11 = v6;
    uint64_t v7 = 1;
  }
  [v6 setEnabled:v7];
}

- (void)_clearSelections
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
  uint64_t v4 = [v3 indexPathsForSelectedRows];

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
        id v11 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
        [v11 deselectRowAtIndexPath:v10 animated:1];

        uint64_t v12 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
        id v13 = [v12 cellForRowAtIndexPath:v10];

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
  objc_super v3 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
  uint64_t v4 = [v3 indexPathsForVisibleRows];

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
        id v11 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
        [v11 selectRowAtIndexPath:v10 animated:1 scrollPosition:0];

        uint64_t v12 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
        id v13 = [v12 cellForRowAtIndexPath:v10];

        [v13 setSelected:1 animated:1];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)_configureAlertControllerForIndexPath:(id)a3 withCompletion:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v57 = a4;
  uint64_t v6 = [(UITableView *)self->_downloadEntitiesTableView indexPathsForSelectedRows];
  uint64_t v59 = [v6 count];

  uint64_t v7 = +[VUILocalizationManager sharedInstance];
  v61 = [v7 localizedStringForKey:@"DELETE_EXPLANATION"];

  uint64_t v8 = +[VUILocalizationManager sharedInstance];
  v60 = [v8 localizedStringForKey:@"DELETE_DOWNLOAD"];

  if (v62)
  {
    uint64_t v9 = [(VUIDownloadTableViewController *)self diffableDataSource];
    uint64_t v10 = [v9 itemIdentifierForIndexPath:v62];

    id v11 = [(VUIDownloadTableViewController *)self identifierToDownloadEntityDictionary];
    uint64_t v12 = [v11 objectForKey:v10];

    id v13 = [v12 numberOfMediaItems];
    unint64_t v14 = [v13 unsignedIntegerValue];
  }
  else if (self->_isSelectingAll)
  {
    unint64_t v14 = [(NSMutableArray *)self->_downloadEntities count];
  }
  else
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v15 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
    long long v16 = [v15 indexPathsForSelectedRows];

    unint64_t v14 = 0;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v79 objects:v84 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v80 != v18) {
            objc_enumerationMutation(v16);
          }
          id v20 = -[NSMutableArray objectAtIndex:](self->_downloadEntities, "objectAtIndex:", [*(id *)(*((void *)&v79 + 1) + 8 * i) row]);
          v21 = [v20 numberOfMediaItems];
          uint64_t v22 = [v21 unsignedIntegerValue];

          v14 += v22;
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v79 objects:v84 count:16];
      }
      while (v17);
    }
  }
  if (v14 >= 2)
  {
    v23 = +[VUILocalizationManager sharedInstance];
    uint64_t v24 = [v23 localizedStringForKey:@"DELETES_EXPLANATION"];

    v25 = NSString;
    v26 = +[VUILocalizationManager sharedInstance];
    v27 = [v26 localizedStringForKey:@"DELETE_%U_DOWNLOADS"];
    uint64_t v28 = objc_msgSend(v25, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v27, @"%u", 0, v14);

    v60 = (void *)v28;
    v61 = (void *)v24;
  }
  v29 = (NSMutableArray *)objc_opt_new();
  if (v62)
  {
    v30 = [(VUIDownloadTableViewController *)self diffableDataSource];
    v31 = [v30 itemIdentifierForIndexPath:v62];

    id v32 = [(VUIDownloadTableViewController *)self identifierToDownloadEntityDictionary];
    id v33 = [v32 objectForKey:v31];

    [(NSMutableArray *)v29 addObject:v33];
  }
  else if (self->_isSelectingAll)
  {
    v31 = v29;
    v29 = self->_downloadEntities;
  }
  else
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v34 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
    v31 = [v34 indexPathsForSelectedRows];

    uint64_t v35 = [v31 countByEnumeratingWithState:&v75 objects:v83 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v76;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v76 != v36) {
            objc_enumerationMutation(v31);
          }
          long long v38 = -[NSMutableArray objectAtIndex:](self->_downloadEntities, "objectAtIndex:", [*(id *)(*((void *)&v75 + 1) + 8 * j) row]);
          [(NSMutableArray *)v29 addObject:v38];
        }
        uint64_t v35 = [v31 countByEnumeratingWithState:&v75 objects:v83 count:16];
      }
      while (v35);
    }
  }

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke;
  aBlock[3] = &unk_1E6DF43D0;
  v56 = &v73;
  objc_copyWeak(&v73, &location);
  v55 = v29;
  v71 = v55;
  id v39 = v57;
  id v72 = v39;
  v58 = _Block_copy(aBlock);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke_2;
  v67[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v69, &location);
  id v40 = v39;
  id v68 = v40;
  long long v41 = _Block_copy(v67);
  if (v59) {
    BOOL v42 = 1;
  }
  else {
    BOOL v42 = v62 != 0;
  }
  if (v42)
  {
    id v43 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v61 preferredStyle:0];
    id v44 = (void *)MEMORY[0x1E4FB1410];
    v45 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v60, @"%lu", 0, v59, v55, &v73);
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke_3;
    v65[3] = &unk_1E6DF4DA0;
    id v66 = v58;
    v46 = [v44 actionWithTitle:v45 style:2 handler:v65];

    [v43 addAction:v46];
    uint64_t v47 = (void *)MEMORY[0x1E4FB1410];
    v48 = +[VUILocalizationManager sharedInstance];
    v49 = [v48 localizedStringForKey:@"CANCEL"];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke_4;
    v63[3] = &unk_1E6DF4DA0;
    id v64 = v41;
    v50 = [v47 actionWithTitle:v49 style:1 handler:v63];

    [v43 addAction:v50];
    v51 = [MEMORY[0x1E4FB16C8] currentDevice];
    LODWORD(v48) = [v51 userInterfaceIdiom] == 1;

    if (v48)
    {
      [v43 setModalPresentationStyle:7];
      v52 = [v43 popoverPresentationController];
      v53 = [(VUIDownloadTableViewController *)self rightBarButtonItem];
      [v52 setBarButtonItem:v53];
    }
  }
  else
  {
    if (v40) {
      (*((void (**)(id, void))v40 + 2))(v40, 0);
    }
    id v43 = 0;
  }

  objc_destroyWeak(&v69);
  objc_destroyWeak(v56);
  objc_destroyWeak(&location);

  return v43;
}

void __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _deleteDownloadEntities:*(void *)(a1 + 32)];
  [WeakRetained _exitEditingMode];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
}

void __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _exitEditingMode];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
}

uint64_t __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __87__VUIDownloadTableViewController__configureAlertControllerForIndexPath_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_configureRenewAlertControllerForIndexPath:(id)a3 forPreferredStyle:(int64_t)a4 withCompletion:(id)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  long long v76 = (void (**)(void))a5;
  if (v75)
  {
    uint64_t v8 = [(VUIDownloadTableViewController *)self diffableDataSource];
    uint64_t v9 = [v8 itemIdentifierForIndexPath:v75];

    uint64_t v10 = [(VUIDownloadTableViewController *)self identifierToDownloadEntityDictionary];
    id v11 = [v10 objectForKey:v9];
  }
  else
  {
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    uint64_t v12 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
    id v13 = [v12 indexPathsForSelectedRows];

    id v11 = 0;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v95 objects:v99 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v96;
      do
      {
        uint64_t v16 = 0;
        uint64_t v17 = v11;
        do
        {
          if (*(void *)v96 != v15) {
            objc_enumerationMutation(v13);
          }
          id v11 = -[NSMutableArray objectAtIndex:](self->_downloadEntities, "objectAtIndex:", [*(id *)(*((void *)&v95 + 1) + 8 * v16) row]);

          ++v16;
          uint64_t v17 = v11;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v95 objects:v99 count:16];
      }
      while (v14);
    }
  }
  uint64_t v18 = [v11 mediaEntities];
  uint64_t v19 = [v18 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v73 = v19;
    v74 = [v73 availabilityEndDate];
    if (v74 && !objc_msgSend(v74, "vui_isInTheFuture"))
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_5;
      aBlock[3] = &unk_1E6DF4588;
      objc_copyWeak(&v83, &location);
      id v80 = v75;
      id v81 = v11;
      long long v82 = v76;
      v71 = _Block_copy(aBlock);
      id v33 = NSString;
      id v34 = +[VUILocalizationManager sharedInstance];
      uint64_t v35 = [v34 localizedStringForKey:@"DOWNLOAD_MESSAGE_NO_LONGER_AVAILABLE"];
      uint64_t v36 = [v73 brandName];
      id v37 = [v33 stringWithValidatedFormat:v35, @"%@", 0, v36 validFormatSpecifiers error];

      long long v38 = (void *)MEMORY[0x1E4FB1418];
      id v39 = +[VUILocalizationManager sharedInstance];
      id v40 = [v39 localizedStringForKey:@"DOWNLOAD_NO_LONGER_AVAILABLE"];
      v23 = [v38 alertControllerWithTitle:v40 message:v37 preferredStyle:1];

      long long v41 = (void *)MEMORY[0x1E4FB1410];
      BOOL v42 = +[VUILocalizationManager sharedInstance];
      id v43 = [v42 localizedStringForKey:@"DELETE"];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_6;
      v77[3] = &unk_1E6DF4DA0;
      id v44 = v71;
      id v78 = v44;
      v45 = [v41 actionWithTitle:v43 style:0 handler:v77];

      [v23 addAction:v45];
      objc_destroyWeak(&v83);
      objc_destroyWeak(&location);
    }
    else
    {
      id v20 = [MEMORY[0x1E4FB3CF8] sharedInstance];
      int v21 = [v20 isNetworkReachable];

      if (v21)
      {
        int v72 = [v73 allowsManualDownloadRenewal];
        if (v72)
        {
          if (a4 == 1)
          {
            uint64_t v22 = +[VUILocalizationManager sharedInstance];
            v70 = [v22 localizedStringForKey:@"RENEW_DOWNLOAD"];
          }
          else
          {
            v70 = 0;
          }
          uint64_t v47 = +[VUILocalizationManager sharedInstance];
          id v69 = [v47 localizedStringForKey:@"RENEW_DOWNLOAD"];

          v48 = NSString;
          v49 = +[VUILocalizationManager sharedInstance];
          v50 = [v49 localizedStringForKey:@"DOWNLOAD_MESSAGE_RENEW"];
          v51 = [v73 brandName];
          id v68 = [v48 stringWithValidatedFormat:v50, @"%@", 0, v51 validFormatSpecifiers error];
        }
        else
        {
          if (a4 == 1)
          {
            v46 = +[VUILocalizationManager sharedInstance];
            v70 = [v46 localizedStringForKey:@"DOWNLOAD_AGAIN"];
          }
          else
          {
            v70 = 0;
          }
          v52 = +[VUILocalizationManager sharedInstance];
          id v69 = [v52 localizedStringForKey:@"DOWNLOAD_AGAIN_BUTTON_TITLE"];

          v53 = NSString;
          v49 = +[VUILocalizationManager sharedInstance];
          v50 = [v49 localizedStringForKey:@"DOWNLOAD_MESSAGE_REDOWNLOAD"];
          v51 = [v73 brandName];
          id v68 = [v53 stringWithValidatedFormat:v50, @"%@", 0, v51 validFormatSpecifiers error];
        }

        v23 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v70 message:v68 preferredStyle:a4];
        objc_initWeak(&location, self);
        v54 = (void *)MEMORY[0x1E4FB1410];
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke;
        v88[3] = &unk_1E6DF8300;
        objc_copyWeak(&v92, &location);
        id v55 = v73;
        char v93 = v72;
        id v89 = v55;
        v90 = self;
        v56 = v76;
        v91 = v56;
        id v57 = [v54 actionWithTitle:v69 style:0 handler:v88];
        [v23 addAction:v57];
        v58 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v59 = +[VUILocalizationManager sharedInstance];
        v60 = [v59 localizedStringForKey:@"CANCEL"];
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_3;
        v86[3] = &unk_1E6DF4DA0;
        v87 = v56;
        v61 = [v58 actionWithTitle:v60 style:1 handler:v86];

        [v23 addAction:v61];
        objc_destroyWeak(&v92);
        objc_destroyWeak(&location);
      }
      else
      {
        uint64_t v24 = (void *)MEMORY[0x1E4FB1418];
        v25 = +[VUILocalizationManager sharedInstance];
        v26 = [v25 localizedStringForKey:@"DOWNLOAD_OFFLINE_RENEW"];
        v27 = +[VUILocalizationManager sharedInstance];
        uint64_t v28 = [v27 localizedStringForKey:@"DOWNLOAD_OFFLINE_RENEW_MESSAGE"];
        v23 = [v24 alertControllerWithTitle:v26 message:v28 preferredStyle:1];

        v29 = (void *)MEMORY[0x1E4FB1410];
        v30 = +[VUILocalizationManager sharedInstance];
        v31 = [v30 localizedStringForKey:@"OK"];
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_4;
        v84[3] = &unk_1E6DF4DA0;
        uint64_t v85 = v76;
        id v32 = [v29 actionWithTitle:v31 style:1 handler:v84];

        [v23 addAction:v32];
      }
    }
  }
  else
  {
    if (v76) {
      v76[2]();
    }
    v23 = 0;
  }
  id v62 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v64 = [v62 userInterfaceIdiom] == 1 && v23 != 0;

  if (v64)
  {
    [v23 setModalPresentationStyle:7];
    v65 = [v23 popoverPresentationController];
    id v66 = [(VUIDownloadTableViewController *)self rightBarButtonItem];
    [v65 setBarButtonItem:v66];
  }
  return v23;
}

void __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_super v3 = [*(id *)(a1 + 32) assetController];

    if (v3)
    {
      if (*(unsigned char *)(a1 + 64))
      {
        uint64_t v4 = [*(id *)(a1 + 32) assetController];
        [v4 fetchNewKeysForDownloadedVideo];
      }
      else
      {
        id v5 = +[VUIDownloadManager sharedInstance];
        uint64_t v6 = *(void **)(a1 + 32);
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = [v6 assetController];
        uint64_t v9 = [v8 contentAllowsCellularDownload];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_2;
        v11[3] = &unk_1E6DF4DC8;
        id v12 = *(id *)(a1 + 32);
        [v5 preflightDownloadForLibraryMediaEntity:v6 presentingViewController:v7 contentAllowsCellularDownload:v9 completion:v11];
      }
      uint64_t v10 = *(void *)(a1 + 48);
      if (v10) {
        (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 1);
      }
    }
  }
}

void __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) assetController];
    [v6 startDownloadAllowingCellular:a3 quality:a4 shouldMarkAsDeletedOnCancellationOrFailure:0 prefer3DOrImmersiveDownload:1 completion:0];
  }
}

uint64_t __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_5(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(void *)(a1 + 32))
  {
    v5[0] = *(void *)(a1 + 40);
    objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    [WeakRetained _deleteDownloadEntities:v3];

    [WeakRetained _exitEditingMode];
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
    }
  }
}

uint64_t __110__VUIDownloadTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_exitEditingMode
{
  objc_super v3 = [(VUIDownloadTableViewController *)self rightBarButtonItem];
  [v3 setEnabled:1];

  uint64_t v4 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
  [v4 setEditing:0 animated:1];

  id v5 = [(VUIDownloadTableViewController *)self rightBarButtonItem];
  id v6 = +[VUILocalizationManager sharedInstance];
  uint64_t v7 = [v6 localizedStringForKey:@"EDIT"];
  [v5 setTitle:v7];

  [(VUIDownloadTableViewController *)self setIsSelectingAll:0];
  uint64_t v8 = [(VUIDownloadTableViewController *)self selectAllBarButtonItem];
  uint64_t v9 = +[VUILocalizationManager sharedInstance];
  uint64_t v10 = [v9 localizedStringForKey:@"SELECT_ALL"];
  [v8 setTitle:v10];

  id v17 = (id)objc_opt_new();
  if (self->_rightBarButtonItem) {
    objc_msgSend(v17, "addObject:");
  }
  id v11 = [(VUIDownloadTableViewController *)self navigationItem];
  id v12 = (void *)[v17 copy];
  [v11 setRightBarButtonItems:v12];

  id v13 = [(VUIDownloadTableViewController *)self navigationItem];
  uint64_t v14 = [(VUIDownloadTableViewController *)self backBarButtonItem];
  [v13 setLeftBarButtonItem:v14];

  uint64_t v15 = [(VUIDownloadTableViewController *)self alertController];

  if (v15)
  {
    uint64_t v16 = [(VUIDownloadTableViewController *)self alertController];
    [v16 dismissViewControllerAnimated:0 completion:0];
  }
}

- (void)_deleteDownloadEntities:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = __58__VUIDownloadTableViewController__deleteDownloadEntities___block_invoke;
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

void __58__VUIDownloadTableViewController__deleteDownloadEntities___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v3 = [*(id *)(a1 + 32) downloadEntities];
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
  v12[2] = __58__VUIDownloadTableViewController__deleteDownloadEntities___block_invoke_2;
  v12[3] = &unk_1E6DF3F68;
  id v11 = *(void **)(a1 + 40);
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v11;
  [v9 applySnapshot:v10 animatingDifferences:1 completion:v12];
}

uint64_t __58__VUIDownloadTableViewController__deleteDownloadEntities___block_invoke_2(uint64_t a1)
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
  obuint64_t j = v4;
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
        id v12 = [v11 mediaEntities];
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
              uint64_t v18 = [(VUIDownloadTableViewController *)self assetControllersToRemove];
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

- (BOOL)_downloadEntityShouldShowRenewOption:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mediaEntities];
  uint64_t v5 = [v4 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    uint64_t v7 = [v6 availabilityEndDate];
    uint64_t v8 = [v6 downloadExpirationDate];
    uint64_t v9 = v8;
    if (!v8 || objc_msgSend(v8, "vui_isInTheFuture"))
    {
      uint64_t v10 = [v6 brandID];
      if ([v10 length])
      {
        uint64_t v11 = +[VUIFeaturesConfiguration sharedInstance];
        id v12 = [(id)v11 downloadConfig];
        uint64_t v13 = [v12 blacklistedEarlyRenewalBrands];

        LOBYTE(v11) = [v13 containsObject:v10];
        if (v11)
        {

          goto LABEL_12;
        }
      }
    }
    if ((!v7 || objc_msgSend(v7, "vui_isInTheFuture"))
      && ([v6 renewsOfflineKeysAutomatically] & 1) == 0)
    {
      BOOL v14 = [v3 downloadType] == 0;
      goto LABEL_14;
    }
LABEL_12:
    BOOL v14 = 0;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v14 = 0;
LABEL_15:

  return v14;
}

- (id)_createDiffableDataSource
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D20]);
  id v4 = [(VUIDownloadTableViewController *)self downloadEntitiesTableView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__VUIDownloadTableViewController__createDiffableDataSource__block_invoke;
  v7[3] = &unk_1E6DF8328;
  v7[4] = self;
  uint64_t v5 = (void *)[v3 initWithTableView:v4 cellProvider:v7];

  return v5;
}

id __59__VUIDownloadTableViewController__createDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  id v12 = [v7 dequeueReusableCellWithIdentifier:v11 forIndexPath:v8];

  uint64_t v13 = [*(id *)(a1 + 32) identifierToDownloadEntityDictionary];
  BOOL v14 = [v13 objectForKey:v9];

  [v12 setDelegate:*(void *)(a1 + 32)];
  +[VUIDownloadEntityTableViewCell configureVUIDownloadEntityTableViewCell:v12 withDownloadEntity:v14 forMetrics:0];
  uint64_t v15 = [v12 downloadButton];
  uint64_t v16 = v15;
  if (v15) {
    [v15 setPresentingViewController:*(void *)(a1 + 32)];
  }
  [v14 setDelegate:v12];
  if ([v8 row])
  {
    [v12 setTopSeparatorView:0];
  }
  else
  {
    long long v17 = objc_alloc_init(VUISeparatorView);
    [v12 setTopSeparatorView:v17];
  }
  uint64_t v18 = [v7 numberOfSections] - 1;
  uint64_t v19 = [v7 numberOfRowsInSection:v18];
  long long v20 = [MEMORY[0x1E4F28D58] indexPathForRow:v19 - 1 inSection:v18];
  if ([v8 compare:v20])
  {
    long long v21 = objc_alloc_init(VUISeparatorView);
    [v12 setBottomSeparatorView:v21];
  }
  else
  {
    [v12 setBottomSeparatorView:0];
  }

  return v12;
}

- (id)_createDiffableDataSourceSnapshot
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v7[0] = @"DownloadTableViewMainSection";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 appendSectionsWithIdentifiers:v4];

  uint64_t v5 = [(VUIDownloadTableViewController *)self _identifiersForDownloadEntities];
  [v3 appendItemsWithIdentifiers:v5 intoSectionWithIdentifier:@"DownloadTableViewMainSection"];

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
  id v4 = [(VUIDownloadTableViewController *)self downloadEntities];
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

  uint64_t v11 = (void *)[v3 copy];
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
  id v4 = [(VUIDownloadTableViewController *)self downloadEntities];
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

- (void)_updateNavigationBarPadding
{
  id v3 = (void *)MEMORY[0x1E4FB1F48];
  id v4 = [(VUIDownloadTableViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v27));
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  long long v13 = [(VUIDownloadTableViewController *)self navigationController];
  long long v14 = [v13 navigationBar];
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
  long long v22 = [(VUIDownloadTableViewController *)self navigationController];
  long long v23 = [v22 navigationBar];
  objc_msgSend(v23, "setLayoutMargins:", v6, v8, v10, v12);

  id v25 = [(VUIDownloadTableViewController *)self navigationController];
  long long v24 = [v25 navigationBar];
  [v24 setNeedsLayout];
}

- (void)_clearTableViewSelections:(BOOL)a3
{
  double v5 = self->_downloadEntitiesTableView;
  double v6 = [(UITableView *)v5 indexPathsForSelectedRows];
  double v7 = [v6 firstObject];

  if (v7)
  {
    double v8 = [(VUIDownloadTableViewController *)self transitionCoordinator];
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __60__VUIDownloadTableViewController__clearTableViewSelections___block_invoke;
      v12[3] = &unk_1E6DF3E68;
      long long v13 = v5;
      id v14 = v7;
      BOOL v15 = a3;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __60__VUIDownloadTableViewController__clearTableViewSelections___block_invoke_2;
      v9[3] = &unk_1E6DF3E90;
      double v10 = v13;
      id v11 = v14;
      [v8 animateAlongsideTransition:v12 completion:v9];
    }
    else
    {
      [(UITableView *)v5 deselectRowAtIndexPath:v7 animated:1];
    }
  }
}

uint64_t __60__VUIDownloadTableViewController__clearTableViewSelections___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectRowAtIndexPath:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __60__VUIDownloadTableViewController__clearTableViewSelections___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 selectRowAtIndexPath:v5 animated:0 scrollPosition:0];
  }
  return result;
}

- (void)fullscreenPlaybackUIDidChangeNotification:(id)a3
{
  id v4 = +[VUIPlaybackManager sharedInstance];
  char v5 = [v4 isFullscreenPlaybackUIBeingShown];

  if ((v5 & 1) == 0)
  {
    [(VUIDownloadTableViewController *)self _clearTableViewSelections:1];
  }
}

- (UITableView)downloadEntitiesTableView
{
  return self->_downloadEntitiesTableView;
}

- (void)setDownloadEntitiesTableView:(id)a3
{
}

- (VUIDownloadDataSource)downloadDataSource
{
  return self->_downloadDataSource;
}

- (void)setDownloadDataSource:(id)a3
{
}

- (UITableViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (NSMutableArray)downloadEntities
{
  return self->_downloadEntities;
}

- (VUIDownloadEntityTableViewCell)sizingCell
{
  return self->_sizingCell;
}

- (void)setSizingCell:(id)a3
{
}

- (UIBarButtonItem)rightBarButtonItem
{
  return self->_rightBarButtonItem;
}

- (void)setRightBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)selectAllBarButtonItem
{
  return self->_selectAllBarButtonItem;
}

- (void)setSelectAllBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)leftBarButtonItem
{
  return self->_leftBarButtonItem;
}

- (void)setLeftBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)backBarButtonItem
{
  return self->_backBarButtonItem;
}

- (void)setBackBarButtonItem:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
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

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
}

- (BOOL)isSelectingAll
{
  return self->_isSelectingAll;
}

- (void)setIsSelectingAll:(BOOL)a3
{
  self->_isSelectingAll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_assetControllersToRemove, 0);
  objc_storeStrong((id *)&self->_identifierToDownloadEntityDictionary, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_downloadEntities, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_downloadDataSource, 0);
  objc_storeStrong((id *)&self->_downloadEntitiesTableView, 0);
}

@end