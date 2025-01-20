@interface VUIDownloadShowTableViewController
- (BOOL)_episodeHasAllCanonicalIDs:(id)a3;
- (BOOL)_mediaItemShouldShowRenewOption:(id)a3;
- (NSArray)seasons;
- (NSMutableArray)assetControllersToRemove;
- (NSMutableArray)groupings;
- (UIBarButtonItem)backBarButtonItem;
- (UIBarButtonItem)leftBarButtonItem;
- (UIBarButtonItem)rightBarButtonItem;
- (VUIDownloadShowDataSource)downloadDataSource;
- (VUIDownloadShowTableHeaderView)sizingHeader;
- (VUIDownloadShowTableViewController)initWithDataSource:(id)a3 seasonsDataSource:(id)a4;
- (VUIMediaEntitiesDataSource)seasonsDataSource;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_configureDeleteAlertControllerForIndexPath:(id)a3 withCompletion:(id)a4;
- (id)_configureRenewAlertControllerForIndexPath:(id)a3 forPreferredStyle:(int64_t)a4 withCompletion:(id)a5;
- (id)_headerTitleForEpisodeMediaItem:(id)a3;
- (id)_moreEpisodesURLForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_clearTableViewSelections:(BOOL)a3;
- (void)_didPressGetMoreEpisodes:(id)a3;
- (void)_editToggled;
- (void)_exitEditingMode;
- (void)_popIfNeeded;
- (void)_updateNavigationBarPadding;
- (void)dataSourceDidFinishFetching:(id)a3;
- (void)dealloc;
- (void)downloadCellDidRequestCancelDownload:(id)a3;
- (void)fullscreenPlaybackUIDidChangeNotification:(id)a3;
- (void)loadView;
- (void)setAssetControllersToRemove:(id)a3;
- (void)setBackBarButtonItem:(id)a3;
- (void)setDownloadDataSource:(id)a3;
- (void)setGroupings:(id)a3;
- (void)setLeftBarButtonItem:(id)a3;
- (void)setRightBarButtonItem:(id)a3;
- (void)setSeasons:(id)a3;
- (void)setSeasonsDataSource:(id)a3;
- (void)setSizingHeader:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VUIDownloadShowTableViewController

- (VUIDownloadShowTableViewController)initWithDataSource:(id)a3 seasonsDataSource:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VUIDownloadShowTableViewController;
  v9 = [(VUIDownloadShowTableViewController *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_downloadDataSource, a3);
    objc_storeStrong((id *)&v10->_seasonsDataSource, a4);
    v11 = [(VUIDownloadShowTableViewController *)v10 navigationItem];
    [v11 _setSupportsTwoLineLargeTitles:1];
    objc_initWeak(&location, v10);
    v19[0] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__VUIDownloadShowTableViewController_initWithDataSource_seasonsDataSource___block_invoke;
    v15[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v16, &location);
    id v13 = (id)[(VUIDownloadShowTableViewController *)v10 registerForTraitChanges:v12 withHandler:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v10;
}

void __75__VUIDownloadShowTableViewController_initWithDataSource_seasonsDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSizingHeader:0];
}

- (void)loadView
{
  v31.receiver = self;
  v31.super_class = (Class)VUIDownloadShowTableViewController;
  [(VUIDownloadShowTableViewController *)&v31 loadView];
  [(VUILibraryDataSource *)self->_downloadDataSource setDelegate:self];
  [(VUIDownloadShowDataSource *)self->_downloadDataSource startFetch];
  [(VUILibraryDataSource *)self->_seasonsDataSource setDelegate:self];
  [(VUIMediaEntitiesDataSource *)self->_seasonsDataSource startFetch];
  v3 = [(VUIDownloadShowTableViewController *)self tableView];
  [v3 setDelegate:self];

  v4 = [(VUIDownloadShowTableViewController *)self tableView];
  [v4 setDataSource:self];

  v5 = [(VUIDownloadShowTableViewController *)self tableView];
  [v5 setAllowsMultipleSelectionDuringEditing:1];

  v6 = [(VUIDownloadShowTableViewController *)self tableView];
  uint64_t v7 = objc_opt_class();
  id v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v6 registerClass:v7 forCellReuseIdentifier:v9];

  v10 = [(VUIDownloadShowTableViewController *)self tableView];
  uint64_t v11 = objc_opt_class();
  v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  [v10 registerClass:v11 forHeaderFooterViewReuseIdentifier:v13];

  v14 = [(VUIDownloadShowTableViewController *)self tableView];
  v15 = objc_opt_new();
  [v14 setTableFooterView:v15];

  id v16 = [(VUIDownloadShowTableViewController *)self tableView];
  [v16 setSeparatorStyle:0];

  v17 = [(VUIDownloadShowTableViewController *)self tableView];
  objc_super v18 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:@"Library.id=\"DownloadedShow\""];
  [v17 setAccessibilityIdentifier:v18];

  if (([MEMORY[0x1E4FB1438] isRunningInStoreDemoMode] & 1) == 0)
  {
    id v19 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v20 = +[VUILocalizationManager sharedInstance];
    v21 = [v20 localizedStringForKey:@"EDIT"];
    v22 = (UIBarButtonItem *)[v19 initWithTitle:v21 style:0 target:self action:sel__editToggled];
    rightBarButtonItem = self->_rightBarButtonItem;
    self->_rightBarButtonItem = v22;

    v24 = [(VUIDownloadShowTableViewController *)self navigationItem];
    [v24 setRightBarButtonItem:self->_rightBarButtonItem];
  }
  v25 = [(VUIDownloadShowTableViewController *)self navigationItem];
  v26 = [v25 leftBarButtonItem];
  backBarButtonItem = self->_backBarButtonItem;
  self->_backBarButtonItem = v26;

  v28 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelPressed];
  leftBarButtonItem = self->_leftBarButtonItem;
  self->_leftBarButtonItem = v28;

  v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v30 addObserver:self selector:sel_fullscreenPlaybackUIDidChangeNotification_ name:VUIPlaybackManagerFullscreenPlaybackUIDidChangeNotification[0] object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIDownloadShowTableViewController;
  -[VUIDownloadShowTableViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(VUIDownloadShowTableViewController *)self _clearTableViewSelections:v3];
  [(VUIDownloadShowTableViewController *)self _updateNavigationBarPadding];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VUIDownloadShowTableViewController;
  [(VUIDownloadShowTableViewController *)&v3 viewWillLayoutSubviews];
  [(VUIDownloadShowTableViewController *)self _updateNavigationBarPadding];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VUIDownloadShowTableViewController;
  [(VUIDownloadShowTableViewController *)&v3 viewDidAppear:a3];
  +[VUILibraryMetrics recordPageEventWithPageType:@"LibraryDownloadedTvShow"];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadShowTableViewController;
  [(VUIDownloadShowTableViewController *)&v4 dealloc];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUIDownloadShowTableViewController;
  id v7 = a4;
  -[VUIDownloadShowTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__VUIDownloadShowTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6DF4CD8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __89__VUIDownloadShowTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exitEditingMode];
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDownloadShowTableViewController *)self downloadDataSource];

  if (v5 == v4)
  {
    v6 = [(VUIDownloadShowTableViewController *)self downloadDataSource];
    id v7 = [v6 grouping];
    id v8 = (void *)[v7 mutableCopy];
    [(VUIDownloadShowTableViewController *)self setGroupings:v8];
  }
  else
  {
    v6 = [(VUIDownloadShowTableViewController *)self seasonsDataSource];
    id v7 = [v6 mediaEntities];
    [(VUIDownloadShowTableViewController *)self setSeasons:v7];
  }

  id v12 = [(VUIDownloadShowTableViewController *)self seasonsDataSource];
  if ([v12 hasCompletedInitialFetch])
  {
    objc_super v9 = [(VUIDownloadShowTableViewController *)self downloadDataSource];
    int v10 = [v9 hasCompletedInitialFetch];

    if (v10)
    {
      uint64_t v11 = [(VUIDownloadShowTableViewController *)self tableView];
      [v11 reloadData];

      [(VUIDownloadShowTableViewController *)self _popIfNeeded];
    }
  }
  else
  {
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (objc_class *)objc_opt_class();
  objc_super v9 = NSStringFromClass(v8);
  int v10 = [v6 dequeueReusableCellWithIdentifier:v9 forIndexPath:v7];

  uint64_t v11 = -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", [v7 section]);
  id v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));
  id v13 = [[VUIDownloadEntity alloc] initWithMediaEntity:v12 withDownloadType:3];
  +[VUIDownloadEntityTableViewCell configureVUIDownloadEntityTableViewCell:v10 withDownloadEntity:v13 forMetrics:0];
  [v10 setDelegate:self];
  v14 = [v10 downloadButton];
  v15 = v14;
  if (v14) {
    [v14 setPresentingViewController:self];
  }
  uint64_t v16 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section")) - 1;
  v17 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v16, objc_msgSend(v7, "section"));
  if ([v7 compare:v17])
  {
    objc_super v18 = objc_alloc_init(VUISeparatorView);
    [v10 setBottomSeparatorView:v18];
  }
  else
  {
    [v10 setBottomSeparatorView:0];
  }

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSMutableArray *)self->_groupings objectAtIndex:a4];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_groupings count];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NSMutableArray *)self->_groupings objectAtIndex:a4];
  id v8 = [v7 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = [(VUIDownloadShowTableViewController *)self _headerTitleForEpisodeMediaItem:v8];
    int v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    id v12 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v11];

    [v12 setHeaderTitle:v9];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (!self->_sizingHeader)
  {
    id v7 = objc_alloc_init(VUIDownloadShowTableHeaderView);
    sizingHeader = self->_sizingHeader;
    self->_sizingHeader = v7;
  }
  objc_super v9 = [(NSMutableArray *)self->_groupings objectAtIndex:a4];
  int v10 = [v9 firstObject];
  objc_opt_class();
  double v11 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    id v12 = [(VUIDownloadShowTableViewController *)self _headerTitleForEpisodeMediaItem:v10];
    [(VUIDownloadShowTableHeaderView *)self->_sizingHeader setHeaderTitle:v12];
    id v13 = self->_sizingHeader;
    v14 = [(VUIDownloadShowTableViewController *)self view];
    [v14 bounds];
    -[VUIDownloadShowTableHeaderView sizeThatFits:](v13, "sizeThatFits:", CGRectGetWidth(v17), 1.79769313e308);
    double v11 = v15;
  }
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VUIDownloadShowTableViewController *)self tableView];
  char v9 = [v8 isEditing];

  if ((v9 & 1) == 0)
  {
    id v12 = -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", [v7 section]);
    id v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v7, "row"));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;
      double v15 = [v14 downloadExpirationDate];
      uint64_t v16 = v15;
      if (v15 && !objc_msgSend(v15, "vui_isInTheFuture"))
      {
        v21 = [(VUIDownloadShowTableViewController *)self _configureRenewAlertControllerForIndexPath:v7 forPreferredStyle:1 withCompletion:0];
        if (v21) {
          [(VUIDownloadShowTableViewController *)self presentViewController:v21 animated:1 completion:0];
        }
        [v6 deselectRowAtIndexPath:v7 animated:1];
      }
      else
      {
        CGRect v17 = [VUIMediaInfo alloc];
        v24[0] = v14;
        objc_super v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
        id v19 = [(VUIMediaInfo *)v17 initWithPlaybackContext:3 vuiMediaItems:v18];

        [(VUIMediaInfo *)v19 setIntent:1];
        [(VUIMediaInfo *)v19 setAutomaticPlaybackStart:0];
        if (v19)
        {
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __72__VUIDownloadShowTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
          v22[3] = &unk_1E6DF3D58;
          v23 = v14;
          +[VUIActionPlay playMediaInfo:v19 watchType:0 isRentAndWatchNow:0 completion:v22];
          v20 = v23;
        }
        else
        {
          v20 = VUIDefaultLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[VUIDownloadShowTableViewController tableView:didSelectRowAtIndexPath:]((uint64_t)v14, v20);
          }
        }
      }
    }

    goto LABEL_17;
  }
  int v10 = [(VUIDownloadShowTableViewController *)self rightBarButtonItem];
  char v11 = [v10 isEnabled];

  if ((v11 & 1) == 0)
  {
    id v12 = [(VUIDownloadShowTableViewController *)self rightBarButtonItem];
    [v12 setEnabled:1];
LABEL_17:
  }
}

uint64_t __72__VUIDownloadShowTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return +[VUILibraryMetrics recordPlayOfMediaEntity:*(void *)(a1 + 32) isLaunchingExtras:0];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  int64_t v5 = [(VUIDownloadShowTableViewController *)self tableView];
  int v6 = [v5 isEditing];

  if (v6)
  {
    id v7 = [(VUIDownloadShowTableViewController *)self tableView];
    id v8 = [v7 indexPathsForSelectedRows];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      id v10 = [(VUIDownloadShowTableViewController *)self rightBarButtonItem];
      [v10 setEnabled:0];
    }
  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  id v6 = [(VUIDownloadShowTableViewController *)self rightBarButtonItem];
  id v4 = +[VUILocalizationManager sharedInstance];
  int64_t v5 = [v4 localizedStringForKey:@"DONE"];
  [v6 setTitle:v5];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  id v6 = [(VUIDownloadShowTableViewController *)self rightBarButtonItem];
  id v4 = +[VUILocalizationManager sharedInstance];
  int64_t v5 = [v4 localizedStringForKey:@"EDIT"];
  [v6 setTitle:v5];
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4FB1438] isRunningInStoreDemoMode])
  {
    id v7 = 0;
  }
  else
  {
    id v31 = v6;
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_initWeak(&location, self);
    id v8 = (void *)MEMORY[0x1E4FB1688];
    uint64_t v9 = +[VUILocalizationManager sharedInstance];
    id v10 = [v9 localizedStringForKey:@"DELETE"];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __99__VUIDownloadShowTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    v41[3] = &unk_1E6DF4D00;
    objc_copyWeak(&v43, &location);
    id v29 = v6;
    id v42 = v29;
    v30 = [v8 contextualActionWithStyle:1 title:v10 handler:v41];

    [v33 addObject:v30];
    if (v29)
    {
      char v11 = -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", [v29 section]);
      id v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v29, "row"));
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v13 = [(VUIDownloadShowTableViewController *)self tableView];
      id v14 = [v13 indexPathsForSelectedRows];

      id v12 = 0;
      char v11 = 0;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v38;
        do
        {
          uint64_t v17 = 0;
          objc_super v18 = v12;
          id v19 = v11;
          do
          {
            if (*(void *)v38 != v16) {
              objc_enumerationMutation(v14);
            }
            v20 = *(void **)(*((void *)&v37 + 1) + 8 * v17);
            char v11 = -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", [v20 section]);

            id v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v20, "row"));

            ++v17;
            objc_super v18 = v12;
            id v19 = v11;
          }
          while (v15 != v17);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v15);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v12;
      if ([(VUIDownloadShowTableViewController *)self _mediaItemShouldShowRenewOption:v21])
      {
        v22 = (void *)MEMORY[0x1E4FB1688];
        v23 = +[VUILocalizationManager sharedInstance];
        v24 = [v23 localizedStringForKey:@"RENEW"];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __99__VUIDownloadShowTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2;
        v34[3] = &unk_1E6DF4D00;
        objc_copyWeak(&v36, &location);
        id v35 = v29;
        v25 = [v22 contextualActionWithStyle:0 title:v24 handler:v34];

        [v33 addObject:v25];
        objc_destroyWeak(&v36);
      }
    }
    v26 = (void *)MEMORY[0x1E4FB1CC0];
    v27 = (void *)[v33 copy];
    id v7 = [v26 configurationWithActions:v27];

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);

    id v6 = v31;
  }

  return v7;
}

void __99__VUIDownloadShowTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int64_t v5 = (id *)(a1 + 40);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained _configureDeleteAlertControllerForIndexPath:*(void *)(a1 + 32) withCompletion:v6];

  if (v7) {
    [WeakRetained presentViewController:v7 animated:1 completion:0];
  }
}

void __99__VUIDownloadShowTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int64_t v5 = (id *)(a1 + 40);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained _configureRenewAlertControllerForIndexPath:*(void *)(a1 + 32) forPreferredStyle:0 withCompletion:v6];

  if (v7) {
    [WeakRetained presentViewController:v7 animated:1 completion:0];
  }
}

- (void)downloadCellDidRequestCancelDownload:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(VUIDownloadShowTableViewController *)self tableView];
  id v6 = [v5 indexPathForCell:v4];

  if (v6)
  {
    id v7 = [(VUIDownloadShowTableViewController *)self groupings];
    id v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "section"));

    uint64_t v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      if (([v10 markedAsDeleted] & 1) != 0
        || ([v10 downloadExpirationDate],
            char v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            !v11))
      {
        objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v6, "row"));
        id v12 = [(VUIDownloadShowTableViewController *)self tableView];
        v14[0] = v6;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        [v12 deleteRowsAtIndexPaths:v13 withRowAnimation:100];
      }
    }
  }
}

- (id)_headerTitleForEpisodeMediaItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 seasonTitle];

  if (v4)
  {
    int64_t v5 = [v3 seasonTitle];
  }
  else
  {
    id v6 = [v3 seasonNumber];

    id v3 = [v6 stringValue];

    id v7 = NSString;
    id v8 = +[VUILocalizationManager sharedInstance];
    uint64_t v9 = [v8 localizedStringForKey:@"SEASON_%@"];
    int64_t v5 = [v7 stringWithValidatedFormat:v9, @"%@", 0, v3 validFormatSpecifiers error];
  }
  return v5;
}

- (void)_editToggled
{
  id v3 = [(VUIDownloadShowTableViewController *)self tableView];
  char v4 = [v3 isEditing];

  int64_t v5 = [(VUIDownloadShowTableViewController *)self tableView];
  id v6 = v5;
  if (v4)
  {
    id v7 = [v5 indexPathsForSelectedRows];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [(VUIDownloadShowTableViewController *)self _configureDeleteAlertControllerForIndexPath:0 withCompletion:0];
      if (v9)
      {
        id v14 = v9;
        [(VUIDownloadShowTableViewController *)self presentViewController:v9 animated:1 completion:0];
        uint64_t v9 = v14;
      }
    }
    else
    {
      [(VUIDownloadShowTableViewController *)self _exitEditingMode];
    }
  }
  else
  {
    [v5 setEditing:1 animated:1];

    rightBarButtonItem = self->_rightBarButtonItem;
    char v11 = +[VUILocalizationManager sharedInstance];
    id v12 = [v11 localizedStringForKey:@"DELETE"];
    [(UIBarButtonItem *)rightBarButtonItem setTitle:v12];

    id v13 = [(VUIDownloadShowTableViewController *)self rightBarButtonItem];
    [v13 setEnabled:0];

    id v15 = [(VUIDownloadShowTableViewController *)self navigationItem];
    [v15 setLeftBarButtonItem:self->_leftBarButtonItem];
  }
}

- (id)_configureDeleteAlertControllerForIndexPath:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VUIDownloadShowTableViewController *)self tableView];
  uint64_t v9 = [v8 indexPathsForSelectedRows];
  unint64_t v10 = [v9 count];

  char v11 = +[VUILocalizationManager sharedInstance];
  id v12 = [v11 localizedStringForKey:@"DELETE_EXPLANATION"];

  id v13 = +[VUILocalizationManager sharedInstance];
  id v14 = [v13 localizedStringForKey:@"DELETE_DOWNLOAD"];

  if (!v6 && v10 >= 2)
  {
    id v15 = +[VUILocalizationManager sharedInstance];
    uint64_t v16 = [v15 localizedStringForKey:@"DELETES_EXPLANATION"];

    uint64_t v17 = NSString;
    objc_super v18 = +[VUILocalizationManager sharedInstance];
    id v19 = [v18 localizedStringForKey:@"DELETE_%U_DOWNLOADS"];
    uint64_t v20 = objc_msgSend(v17, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, @"%u", 0, v10);

    id v14 = (void *)v20;
    id v12 = (void *)v16;
  }
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke;
  aBlock[3] = &unk_1E6DF43D0;
  objc_copyWeak(&v51, location);
  id v21 = v6;
  id v49 = v21;
  id v22 = v7;
  id v50 = v22;
  long long v40 = _Block_copy(aBlock);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_6;
  v45[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v47, location);
  id v23 = v22;
  id v46 = v23;
  v24 = _Block_copy(v45);
  if (v21 || v10)
  {
    long long v38 = self;
    v25 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v12 preferredStyle:0];
    long long v39 = v14;
    v26 = (void *)MEMORY[0x1E4FB1410];
    v27 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, @"%lu", 0, v10);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_7;
    v43[3] = &unk_1E6DF4DA0;
    id v44 = v40;
    v28 = [v26 actionWithTitle:v27 style:2 handler:v43];

    [v25 addAction:v28];
    id v29 = (void *)MEMORY[0x1E4FB1410];
    v30 = +[VUILocalizationManager sharedInstance];
    id v31 = [v30 localizedStringForKey:@"CANCEL"];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_8;
    v41[3] = &unk_1E6DF4DA0;
    id v42 = v24;
    id v32 = [v29 actionWithTitle:v31 style:1 handler:v41];

    [v25 addAction:v32];
    id v33 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v34 = [v33 userInterfaceIdiom];

    if (v34 == 1)
    {
      [v25 setModalPresentationStyle:7];
      id v35 = [v25 popoverPresentationController];
      id v36 = [(VUIDownloadShowTableViewController *)v38 rightBarButtonItem];
      [v35 setBarButtonItem:v36];
    }
    id v14 = v39;
  }
  else
  {
    if (v23) {
      (*((void (**)(id, void))v23 + 2))(v23, 0);
    }
    v25 = 0;
  }

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v51);
  objc_destroyWeak(location);

  return v25;
}

void __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_opt_new();
  char v4 = objc_opt_new();
  [WeakRetained setAssetControllersToRemove:v4];

  if (*(void *)(v1 + 32))
  {
    int64_t v5 = [WeakRetained groupings];
    id v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(*(id *)(v1 + 32), "section"));

    id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(*(id *)(v1 + 32), "row"));
    [v3 addObject:v7];
    uint64_t v8 = [v7 assetController];
    uint64_t v9 = [WeakRetained assetControllersToRemove];
    [v9 addObject:v8];
  }
  else
  {
    uint64_t v46 = v1;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    unint64_t v10 = [WeakRetained tableView];
    char v11 = [v10 indexPathsForSelectedRows];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v65 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v17 = [WeakRetained groupings];
          objc_super v18 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v16, "section"));

          id v19 = objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v16, "row"));
          [v3 addObject:v19];
          uint64_t v20 = [v19 assetController];
          id v21 = [WeakRetained assetControllersToRemove];
          [v21 addObject:v20];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v13);
    }

    uint64_t v1 = v46;
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v22 = [WeakRetained assetControllersToRemove];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v61 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v60 + 1) + 8 * j) cancelAndRemoveDownload];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v24);
  }

  if (*(void *)(v1 + 32))
  {
    v27 = [WeakRetained tableView];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_2;
    v58[3] = &unk_1E6DF3F68;
    v58[4] = WeakRetained;
    id v59 = *(id *)(v1 + 32);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_3;
    v56[3] = &unk_1E6DF3DA8;
    v56[4] = WeakRetained;
    id v57 = *(id *)(v1 + 40);
    [v27 performBatchUpdates:v58 completion:v56];
  }
  else
  {
    uint64_t v47 = v1;
    v28 = objc_opt_new();
    id v29 = objc_opt_new();
    v30 = [WeakRetained groupings];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_4;
    v52[3] = &unk_1E6DF4D50;
    id v53 = v3;
    id v31 = v28;
    id v54 = v31;
    id v32 = v29;
    id v55 = v32;
    [v30 enumerateObjectsUsingBlock:v52];

    [WeakRetained setGroupings:v31];
    id v33 = [WeakRetained tableView];
    [v33 beginUpdates];

    if ([v32 count])
    {
      uint64_t v34 = [WeakRetained tableView];
      [v34 deleteSections:v32 withRowAnimation:100];
    }
    id v35 = objc_opt_new();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v36 = [WeakRetained tableView];
    long long v37 = [v36 indexPathsForSelectedRows];

    uint64_t v38 = [v37 countByEnumeratingWithState:&v48 objects:v68 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v49;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v49 != v40) {
            objc_enumerationMutation(v37);
          }
          id v42 = *(void **)(*((void *)&v48 + 1) + 8 * k);
          if ((objc_msgSend(v32, "containsIndex:", objc_msgSend(v42, "section")) & 1) == 0) {
            [v35 addObject:v42];
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v48 objects:v68 count:16];
      }
      while (v39);
    }

    if ([v35 count])
    {
      id v43 = [WeakRetained tableView];
      [v43 deleteRowsAtIndexPaths:v35 withRowAnimation:100];
    }
    id v44 = [WeakRetained tableView];
    [v44 endUpdates];

    [WeakRetained _exitEditingMode];
    [WeakRetained _popIfNeeded];
    uint64_t v45 = *(void *)(v47 + 40);
    if (v45) {
      (*(void (**)(uint64_t, uint64_t))(v45 + 16))(v45, 1);
    }
  }
}

void __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) groupings];
  id v3 = objc_msgSend(v2, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));

  objc_msgSend(v3, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));
  if (![v3 count])
  {
    char v4 = [*(id *)(a1 + 32) groupings];
    objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));

    int64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
    id v6 = [*(id *)(a1 + 32) tableView];
    [v6 deleteSections:v5 withRowAnimation:100];
  }
  id v7 = [*(id *)(a1 + 32) tableView];
  v9[0] = *(void *)(a1 + 40);
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v7 deleteRowsAtIndexPaths:v8 withRowAnimation:100];
}

uint64_t __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _exitEditingMode];
  [*(id *)(a1 + 32) _popIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_4(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_opt_new();
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  unint64_t v10 = __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_5;
  char v11 = &unk_1E6DF4D28;
  id v12 = a1[4];
  id v7 = v6;
  id v13 = v7;
  [v5 enumerateObjectsUsingBlock:&v8];

  if (objc_msgSend(v7, "count", v8, v9, v10, v11)) {
    [a1[5] addObject:v7];
  }
  else {
    [a1[6] addIndex:a3];
  }
}

void __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _exitEditingMode];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
}

uint64_t __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97__VUIDownloadShowTableViewController__configureDeleteAlertControllerForIndexPath_withCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_configureRenewAlertControllerForIndexPath:(id)a3 forPreferredStyle:(int64_t)a4 withCompletion:(id)a5
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v76 = v7;
  v77 = (void (**)(void))a5;
  val = self;
  if (v7)
  {
    uint64_t v8 = -[NSMutableArray objectAtIndex:](self->_groupings, "objectAtIndex:", [v7 section]);
    uint64_t v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row"));
  }
  else
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    unint64_t v10 = [(VUIDownloadShowTableViewController *)self tableView];
    char v11 = [v10 indexPathsForSelectedRows];

    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v98 objects:v102 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v99;
      do
      {
        uint64_t v14 = 0;
        id v15 = v8;
        uint64_t v16 = v9;
        do
        {
          if (*(void *)v99 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v98 + 1) + 8 * v14);
          uint64_t v8 = -[NSMutableArray objectAtIndex:](val->_groupings, "objectAtIndex:", [v17 section]);

          uint64_t v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v17, "row"));

          ++v14;
          id v15 = v8;
          uint64_t v16 = v9;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v98 objects:v102 count:16];
      }
      while (v12);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v74 = v9;
    v75 = [v74 availabilityEndDate];
    if (v75 && !objc_msgSend(v75, "vui_isInTheFuture"))
    {
      objc_initWeak(&location, val);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_5;
      aBlock[3] = &unk_1E6DF4E40;
      objc_copyWeak(&v86, &location);
      id v82 = v76;
      id v33 = v74;
      id v83 = v33;
      id v84 = v8;
      v85 = v77;
      v73 = (id *)_Block_copy(aBlock);
      uint64_t v34 = NSString;
      id v35 = +[VUILocalizationManager sharedInstance];
      id v36 = [v35 localizedStringForKey:@"DOWNLOAD_MESSAGE_NO_LONGER_AVAILABLE"];
      long long v37 = [v33 brandName];
      uint64_t v38 = [v34 stringWithValidatedFormat:v36, @"%@", 0, v37 validFormatSpecifiers error];

      uint64_t v39 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v40 = +[VUILocalizationManager sharedInstance];
      v41 = [v40 localizedStringForKey:@"DOWNLOAD_NO_LONGER_AVAILABLE"];
      uint64_t v23 = [v39 alertControllerWithTitle:v41 message:v38 preferredStyle:1];

      id v42 = (void *)MEMORY[0x1E4FB1410];
      id v43 = +[VUILocalizationManager sharedInstance];
      id v44 = [v43 localizedStringForKey:@"DELETE"];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_8;
      v79[3] = &unk_1E6DF4DA0;
      uint64_t v45 = v73;
      v80 = v45;
      uint64_t v46 = [v42 actionWithTitle:v44 style:0 handler:v79];

      [v23 addAction:v46];
      objc_destroyWeak(&v86);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4FB3CF8] sharedInstance];
      int v19 = [v18 isNetworkReachable];

      if (v19)
      {
        int v20 = [v74 allowsManualDownloadRenewal];
        char v21 = v20;
        if (v20)
        {
          if (a4 == 1)
          {
            id v22 = +[VUILocalizationManager sharedInstance];
            uint64_t v71 = [v22 localizedStringForKey:@"RENEW_DOWNLOAD"];
          }
          else
          {
            uint64_t v71 = 0;
          }
          long long v48 = +[VUILocalizationManager sharedInstance];
          v70 = [v48 localizedStringForKey:@"RENEW_DOWNLOAD"];

          long long v49 = NSString;
          long long v50 = +[VUILocalizationManager sharedInstance];
          long long v51 = [v50 localizedStringForKey:@"DOWNLOAD_MESSAGE_RENEW"];
          v52 = [v74 brandName];
          uint64_t v53 = [v49 stringWithValidatedFormat:v51, @"%@", 0, v52 validFormatSpecifiers error];
        }
        else
        {
          if (a4 == 1)
          {
            uint64_t v47 = +[VUILocalizationManager sharedInstance];
            uint64_t v71 = [v47 localizedStringForKey:@"DOWNLOAD_AGAIN"];
          }
          else
          {
            uint64_t v71 = 0;
          }
          id v54 = +[VUILocalizationManager sharedInstance];
          v70 = [v54 localizedStringForKey:@"DOWNLOAD_AGAIN_BUTTON_TITLE"];

          id v55 = NSString;
          long long v50 = +[VUILocalizationManager sharedInstance];
          long long v51 = [v50 localizedStringForKey:@"DOWNLOAD_MESSAGE_REDOWNLOAD"];
          v52 = [v74 brandName];
          uint64_t v53 = [v55 stringWithValidatedFormat:v51, @"%@", 0, v52 validFormatSpecifiers error];
        }
        v56 = (void *)v53;

        uint64_t v23 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v71 message:v56 preferredStyle:a4];
        objc_initWeak(&location, val);
        id v57 = (void *)MEMORY[0x1E4FB1410];
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke;
        v92[3] = &unk_1E6DF4DF0;
        objc_copyWeak(&v95, &location);
        id v93 = v74;
        char v96 = v21;
        v58 = v77;
        v94 = v58;
        id v59 = [v57 actionWithTitle:v70 style:0 handler:v92];
        [v23 addAction:v59];
        long long v60 = (void *)MEMORY[0x1E4FB1410];
        long long v61 = +[VUILocalizationManager sharedInstance];
        long long v62 = [v61 localizedStringForKey:@"CANCEL"];
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_3;
        v89[3] = &unk_1E6DF4E18;
        objc_copyWeak(&v91, &location);
        v90 = v58;
        long long v63 = [v60 actionWithTitle:v62 style:1 handler:v89];

        [v23 addAction:v63];
        objc_destroyWeak(&v91);

        objc_destroyWeak(&v95);
        objc_destroyWeak(&location);
      }
      else
      {
        uint64_t v24 = (void *)MEMORY[0x1E4FB1418];
        uint64_t v25 = +[VUILocalizationManager sharedInstance];
        v26 = [v25 localizedStringForKey:@"DOWNLOAD_OFFLINE_RENEW"];
        v27 = +[VUILocalizationManager sharedInstance];
        v28 = [v27 localizedStringForKey:@"DOWNLOAD_OFFLINE_RENEW_MESSAGE"];
        uint64_t v23 = [v24 alertControllerWithTitle:v26 message:v28 preferredStyle:1];

        id v29 = (void *)MEMORY[0x1E4FB1410];
        v30 = +[VUILocalizationManager sharedInstance];
        id v31 = [v30 localizedStringForKey:@"OK"];
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_4;
        v87[3] = &unk_1E6DF4DA0;
        v88 = v77;
        id v32 = [v29 actionWithTitle:v31 style:1 handler:v87];

        [v23 addAction:v32];
      }
    }
  }
  else
  {
    if (v77) {
      v77[2]();
    }
    uint64_t v23 = 0;
  }
  long long v64 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v66 = [v64 userInterfaceIdiom] == 1 && v23 != 0;

  if (v66)
  {
    [v23 setModalPresentationStyle:7];
    long long v67 = [v23 popoverPresentationController];
    v68 = [(VUIDownloadShowTableViewController *)val rightBarButtonItem];
    [v67 setBarButtonItem:v68];
  }
  return v23;
}

void __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) assetController];

    if (v3)
    {
      if (*(unsigned char *)(a1 + 56))
      {
        char v4 = [*(id *)(a1 + 32) assetController];
        [v4 fetchNewKeysForDownloadedVideo];
      }
      else
      {
        id v5 = +[VUIDownloadManager sharedInstance];
        id v6 = *(void **)(a1 + 32);
        id v7 = [v6 assetController];
        uint64_t v8 = [v7 contentAllowsCellularDownload];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_2;
        v10[3] = &unk_1E6DF4DC8;
        id v11 = *(id *)(a1 + 32);
        [v5 preflightDownloadForLibraryMediaEntity:v6 presentingViewController:WeakRetained contentAllowsCellularDownload:v8 completion:v10];
      }
    }
    [WeakRetained _exitEditingMode];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
    }
  }
}

void __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) assetController];
    [v6 startDownloadAllowingCellular:a3 quality:a4 shouldMarkAsDeletedOnCancellationOrFailure:0 prefer3DOrImmersiveDownload:1 completion:0];
  }
}

void __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _exitEditingMode];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
}

uint64_t __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_5(id *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  [WeakRetained _exitEditingMode];
  id v3 = objc_opt_new();
  char v4 = objc_opt_new();
  [WeakRetained setAssetControllersToRemove:v4];

  if (a1[4])
  {
    [v3 addObject:a1[5]];
    id v5 = [a1[5] assetController];
    id v6 = [WeakRetained assetControllersToRemove];
    [v6 addObject:v5];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [WeakRetained assetControllersToRemove];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v11++) cancelAndRemoveDownload];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  if (a1[4])
  {
    uint64_t v12 = [WeakRetained tableView];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_6;
    v16[3] = &unk_1E6DF45D8;
    id v17 = a1[6];
    id v18 = a1[4];
    id v19 = WeakRetained;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_7;
    v14[3] = &unk_1E6DF3DA8;
    v14[4] = WeakRetained;
    id v15 = a1[7];
    [v12 performBatchUpdates:v16 completion:v14];
  }
  else
  {
    uint64_t v13 = (void (**)(id, void))a1[7];
    if (v13) {
      v13[2](v13, 0);
    }
  }
}

void __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_6(id *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(a1[4], "removeObjectAtIndex:", objc_msgSend(a1[5], "row"));
  if (![a1[4] count])
  {
    uint64_t v2 = [a1[6] groupings];
    objc_msgSend(v2, "removeObjectAtIndex:", objc_msgSend(a1[5], "section"));

    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndex:", objc_msgSend(a1[5], "section"));
    char v4 = [a1[6] tableView];
    [v4 deleteSections:v3 withRowAnimation:100];
  }
  id v5 = [a1[6] tableView];
  v7[0] = a1[5];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v5 deleteRowsAtIndexPaths:v6 withRowAnimation:100];
}

uint64_t __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) _popIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __114__VUIDownloadShowTableViewController__configureRenewAlertControllerForIndexPath_forPreferredStyle_withCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_exitEditingMode
{
  id v3 = [(VUIDownloadShowTableViewController *)self rightBarButtonItem];
  [v3 setEnabled:1];

  char v4 = [(VUIDownloadShowTableViewController *)self tableView];
  [v4 setEditing:0 animated:1];

  id v5 = [(VUIDownloadShowTableViewController *)self rightBarButtonItem];
  id v6 = +[VUILocalizationManager sharedInstance];
  id v7 = [v6 localizedStringForKey:@"EDIT"];
  [v5 setTitle:v7];

  id v9 = [(VUIDownloadShowTableViewController *)self navigationItem];
  uint64_t v8 = [(VUIDownloadShowTableViewController *)self backBarButtonItem];
  [v9 setLeftBarButtonItem:v8];
}

- (void)_popIfNeeded
{
  id v3 = [(VUIDownloadShowTableViewController *)self groupings];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v6 = [(VUIDownloadShowTableViewController *)self navigationController];
    id v5 = (id)[v6 popViewControllerAnimated:1];
  }
}

- (id)_moreEpisodesURLForSection:(int64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_groupings objectAtIndex:a3];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && [(VUIDownloadShowTableViewController *)self _episodeHasAllCanonicalIDs:v9])
      {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    uint64_t v10 = [v9 canonicalID];
    uint64_t v11 = [v9 seasonCanonicalID];
    uint64_t v12 = [v9 showCanonicalID];
    uint64_t v13 = (void *)MEMORY[0x1E4FB5110];
    id v14 = objc_alloc_init(MEMORY[0x1E4FB5108]);
    id v15 = [v13 _watchListAppPunchoutURLWithPlayable:v14 forContentType:3 canonicalID:v10 showCanonicalID:v12 seasonCanonicalID:v11 allowPlayAction:0 isPlaybackURL:0];

    if (v15) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_10:
  }
  uint64_t v16 = [v4 firstObject];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = [(VUIDownloadShowTableViewController *)self seasons];
  id v15 = (void *)[v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v15)
  {
    uint64_t v18 = *(void *)v29;
LABEL_14:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v29 != v18) {
        objc_enumerationMutation(v17);
      }
      long long v20 = *(void **)(*((void *)&v28 + 1) + 8 * v19);
      long long v21 = [v20 identifier];
      long long v22 = [v16 seasonIdentifier];
      char v23 = [v21 isEqual:v22];

      if (v23) {
        break;
      }
      if (v15 == (void *)++v19)
      {
        id v15 = (void *)[v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v15) {
          goto LABEL_14;
        }
        goto LABEL_23;
      }
    }
    uint64_t v24 = [v20 storeID];

    if (v24)
    {
      uint64_t v25 = (void *)MEMORY[0x1E4F1CB10];
      v26 = [NSString stringWithFormat:@"https://itunes.apple.com/us/tv-season//id%@", v24, 0];
      id v15 = [v25 URLWithString:v26];

      id v17 = (void *)v24;
      goto LABEL_23;
    }
    id v15 = 0;
  }
  else
  {
LABEL_23:
  }
LABEL_26:

  return v15;
}

- (BOOL)_episodeHasAllCanonicalIDs:(id)a3
{
  id v3 = a3;
  id v4 = [v3 canonicalID];
  if (v4)
  {
    uint64_t v5 = [v3 seasonCanonicalID];
    if (v5)
    {
      uint64_t v6 = [v3 showCanonicalID];
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_didPressGetMoreEpisodes:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4FB1438];
    id v4 = a3;
    id v5 = [v3 sharedApplication];
    [v5 openURL:v4 options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
}

- (BOOL)_mediaItemShouldShowRenewOption:(id)a3
{
  id v3 = a3;
  id v4 = [v3 availabilityEndDate];
  id v5 = [v3 downloadExpirationDate];
  uint64_t v6 = v5;
  if (!v5 || objc_msgSend(v5, "vui_isInTheFuture"))
  {
    BOOL v7 = [v3 brandID];
    if ([v7 length])
    {
      uint64_t v8 = +[VUIFeaturesConfiguration sharedInstance];
      id v9 = [(id)v8 downloadConfig];
      uint64_t v10 = [v9 blacklistedEarlyRenewalBrands];

      LOBYTE(v8) = [v10 containsObject:v7];
      if (v8)
      {

LABEL_10:
        LOBYTE(v11) = 0;
        goto LABEL_11;
      }
    }
  }
  if (v4 && !objc_msgSend(v4, "vui_isInTheFuture")) {
    goto LABEL_10;
  }
  int v11 = [v3 renewsOfflineKeysAutomatically] ^ 1;
LABEL_11:

  return v11;
}

- (void)_updateNavigationBarPadding
{
  id v3 = (void *)MEMORY[0x1E4FB1F48];
  id v4 = [(VUIDownloadShowTableViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v27));
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = [(VUIDownloadShowTableViewController *)self navigationController];
  id v14 = [v13 navigationBar];
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
  long long v22 = [(VUIDownloadShowTableViewController *)self navigationController];
  char v23 = [v22 navigationBar];
  objc_msgSend(v23, "setLayoutMargins:", v6, v8, v10, v12);

  id v25 = [(VUIDownloadShowTableViewController *)self navigationController];
  uint64_t v24 = [v25 navigationBar];
  [v24 setNeedsLayout];
}

- (void)_clearTableViewSelections:(BOOL)a3
{
  double v5 = [(VUIDownloadShowTableViewController *)self tableView];
  double v6 = [v5 indexPathsForSelectedRows];
  double v7 = [v6 firstObject];

  if (v7)
  {
    double v8 = [(VUIDownloadShowTableViewController *)self transitionCoordinator];
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64__VUIDownloadShowTableViewController__clearTableViewSelections___block_invoke;
      v12[3] = &unk_1E6DF3E68;
      id v13 = v5;
      id v14 = v7;
      BOOL v15 = a3;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __64__VUIDownloadShowTableViewController__clearTableViewSelections___block_invoke_2;
      v9[3] = &unk_1E6DF3E90;
      id v10 = v13;
      id v11 = v14;
      [v8 animateAlongsideTransition:v12 completion:v9];
    }
    else
    {
      [v5 deselectRowAtIndexPath:v7 animated:1];
    }
  }
}

uint64_t __64__VUIDownloadShowTableViewController__clearTableViewSelections___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectRowAtIndexPath:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __64__VUIDownloadShowTableViewController__clearTableViewSelections___block_invoke_2(uint64_t a1, void *a2)
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
    [(VUIDownloadShowTableViewController *)self _clearTableViewSelections:1];
  }
}

- (VUIDownloadShowDataSource)downloadDataSource
{
  return self->_downloadDataSource;
}

- (void)setDownloadDataSource:(id)a3
{
}

- (VUIMediaEntitiesDataSource)seasonsDataSource
{
  return self->_seasonsDataSource;
}

- (void)setSeasonsDataSource:(id)a3
{
}

- (VUIDownloadShowTableHeaderView)sizingHeader
{
  return self->_sizingHeader;
}

- (void)setSizingHeader:(id)a3
{
}

- (NSMutableArray)groupings
{
  return self->_groupings;
}

- (void)setGroupings:(id)a3
{
}

- (UIBarButtonItem)rightBarButtonItem
{
  return self->_rightBarButtonItem;
}

- (void)setRightBarButtonItem:(id)a3
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

- (NSArray)seasons
{
  return self->_seasons;
}

- (void)setSeasons:(id)a3
{
}

- (NSMutableArray)assetControllersToRemove
{
  return self->_assetControllersToRemove;
}

- (void)setAssetControllersToRemove:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetControllersToRemove, 0);
  objc_storeStrong((id *)&self->_seasons, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_groupings, 0);
  objc_storeStrong((id *)&self->_sizingHeader, 0);
  objc_storeStrong((id *)&self->_seasonsDataSource, 0);
  objc_storeStrong((id *)&self->_downloadDataSource, 0);
}

- (void)tableView:(uint64_t)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Unable to start playback because mediaInfo is nil; mediaEntity: %@",
    (uint8_t *)&v2,
    0xCu);
}

@end