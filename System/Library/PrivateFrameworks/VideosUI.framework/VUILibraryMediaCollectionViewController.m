@interface VUILibraryMediaCollectionViewController
- (BOOL)_allFetchesHaveCompleted;
- (BOOL)_usingEpisodesGroupFetch;
- (BOOL)canShowMultipleSeasons;
- (BOOL)episodesFetchHasCompleted;
- (BOOL)seasonsFetchHasCompleted;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)episodeGroups;
- (NSArray)episodes;
- (NSArray)seasons;
- (NSString)showTitle;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (VUILibraryMediaCollectionViewController)initWithTitle:(id)a3 withSeasonsDataSource:(id)a4 withEpisodesDataSource:(id)a5;
- (VUILibraryMediaCollectionViewModel)mediaCollectionViewModel;
- (VUIMediaCollection)mediaCollection;
- (VUIMediaEntitiesDataSource)episodesDataSource;
- (VUIMediaEntitiesDataSource)seasonsDataSource;
- (VUIViewControllerContentPresenter)contentPresenter;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)_createDiffableDataSourceForCollectionView:(id)a3;
- (id)_createDiffableDataSourceSnapshot;
- (id)_episodeShelfViewControllerWithSeason:(id)a3 episodes:(id)a4;
- (id)_episodesBySeasonIdentifier;
- (id)_productLockupViewWithSeason:(id)a3;
- (id)_seasonViewModelByIdentifier:(id)a3;
- (id)_seasonViewModelIdentifiers;
- (void)_buildMediaCollectionViewModel;
- (void)_updateAfterContentWasManuallyDeleted:(BOOL)a3;
- (void)_updateDeletedContentErrorMessage;
- (void)_updateEpisodeShelvesWithLatestEpisodes;
- (void)_updateMediaCollectionViewModelForSeasons;
- (void)_updateProductLockupView:(id)a3 withSeason:(id)a4;
- (void)_updateProductLockupViewWithSeasonIdentifier:(id)a3;
- (void)addDownloadButtonToProductLockupView:(id)a3 forSeason:(id)a4;
- (void)configureWithCollectionView:(id)a3;
- (void)contentDescriptionExpanded;
- (void)dataSourceDidFinishFetching:(id)a3;
- (void)libraryEpisodesShelfViewController:(id)a3 didRemoveDownloadForAssetController:(id)a4;
- (void)loadView;
- (void)setCanShowMultipleSeasons:(BOOL)a3;
- (void)setContentPresenter:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setEpisodeGroups:(id)a3;
- (void)setEpisodes:(id)a3;
- (void)setEpisodesDataSource:(id)a3;
- (void)setEpisodesFetchHasCompleted:(BOOL)a3;
- (void)setMediaCollection:(id)a3;
- (void)setMediaCollectionViewModel:(id)a3;
- (void)setSeasons:(id)a3;
- (void)setSeasonsDataSource:(id)a3;
- (void)setSeasonsFetchHasCompleted:(BOOL)a3;
- (void)setShowTitle:(id)a3;
- (void)showItemNotAvailableDialog;
- (void)start;
- (void)titleButtonPressedForStoreId:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation VUILibraryMediaCollectionViewController

- (VUILibraryMediaCollectionViewController)initWithTitle:(id)a3 withSeasonsDataSource:(id)a4 withEpisodesDataSource:(id)a5
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)VUILibraryMediaCollectionViewController;
  v12 = [(VUILibraryStackViewController *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_seasonsDataSource, a4);
    objc_storeStrong((id *)&v13->_episodesDataSource, a5);
    v14 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v13->_contentPresenter;
    v13->_contentPresenter = v14;

    [(VUIViewControllerContentPresenter *)v13->_contentPresenter setLogName:@"VUILibraryMediaCollectionViewController"];
    objc_storeStrong((id *)&v13->_showTitle, a3);
    objc_initWeak(&location, v13);
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __102__VUILibraryMediaCollectionViewController_initWithTitle_withSeasonsDataSource_withEpisodesDataSource___block_invoke;
    v19[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v20, &location);
    id v17 = (id)[(VUILibraryMediaCollectionViewController *)v13 registerForTraitChanges:v16 withHandler:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __102__VUILibraryMediaCollectionViewController_initWithTitle_withSeasonsDataSource_withEpisodesDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v2 = [v1 userInterfaceIdiom];

  if (!v2)
  {
    v3 = [WeakRetained showTitle];
    [WeakRetained setTitle:v3];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VUILibraryMediaCollectionViewController;
  [(VUILibraryStackViewController *)&v3 viewDidAppear:a3];
  +[VUILibraryMetrics recordPageEventWithPageType:@"LibraryTvShowSeason"];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)VUILibraryMediaCollectionViewController;
  [(VUILibraryMediaCollectionViewController *)&v4 loadView];
  objc_super v3 = [(VUILibraryMediaCollectionViewController *)self contentPresenter];
  [v3 setRootViewForViewController:self];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VUILibraryMediaCollectionViewController;
  [(VUILibraryMediaCollectionViewController *)&v5 viewWillLayoutSubviews];
  objc_super v3 = [(VUILibraryMediaCollectionViewController *)self contentPresenter];
  objc_super v4 = [(VUILibraryMediaCollectionViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)VUILibraryMediaCollectionViewController;
  [(VUILibraryStackViewController *)&v6 viewDidLoad];
  [(VUILibraryMediaCollectionViewController *)self start];
  objc_super v3 = [(VUILibraryStackViewController *)self stackView];
  objc_super v4 = [(VUILibraryMediaCollectionViewController *)self contentPresenter];
  [v4 setContentView:v3];

  objc_super v5 = [(VUILibraryMediaCollectionViewController *)self navigationItem];
  [v5 _setSupportsTwoLineLargeTitles:1];
  [(VUILibraryMediaCollectionViewController *)self setTitle:self->_showTitle];
}

- (void)configureWithCollectionView:(id)a3
{
  id v4 = a3;
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"VUICollectionViewWrapperCellReuseIdentifier"];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"VUILibraryEpisodeFooterCellReuseIdentifier"];
  id v5 = [(VUILibraryMediaCollectionViewController *)self _createDiffableDataSourceForCollectionView:v4];

  [(VUILibraryMediaCollectionViewController *)self setDiffableDataSource:v5];
}

- (void)start
{
  contentPresenter = self->_contentPresenter;
  id v4 = +[VUILocalizationManager sharedInstance];
  id v5 = [v4 localizedStringForKey:@"LIBRARY_GENERIC_FETCH_ERROR_TITLE"];
  [(VUIViewControllerContentPresenter *)contentPresenter setNoContentErrorTitle:v5];

  [(VUIViewControllerContentPresenter *)self->_contentPresenter setCurrentContentViewType:1];
  id v10 = [(VUILibraryMediaCollectionViewController *)self navigationItem];
  [v10 _setSupportsTwoLineLargeTitles:1];
  objc_super v6 = [(VUILibraryMediaCollectionViewController *)self episodesDataSource];
  [v6 setDelegate:self];

  v7 = [(VUILibraryMediaCollectionViewController *)self seasonsDataSource];
  [v7 setDelegate:self];

  v8 = [(VUILibraryMediaCollectionViewController *)self episodesDataSource];
  [v8 startFetch];

  id v9 = [(VUILibraryMediaCollectionViewController *)self seasonsDataSource];
  [v9 startFetch];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  id v8 = a5;
  id v9 = [(VUILibraryMediaCollectionViewController *)self diffableDataSource];
  id v10 = [v9 itemIdentifierForIndexPath:v8];

  id v11 = [(VUILibraryMediaCollectionViewController *)self _seasonViewModelByIdentifier:v10];
  if (!v11) {
    goto LABEL_15;
  }
  v12 = [(VUILibraryMediaCollectionViewController *)self view];
  [v12 bounds];
  double v14 = v13;

  if ([MEMORY[0x1E4FB3CA0] isUniquelyiPadEnabled])
  {
    char v15 = [(VUILibraryMediaCollectionViewController *)self vuiIsRTL];
    v16 = [(VUILibraryMediaCollectionViewController *)self view];
    [v16 safeAreaInsets];
    double v18 = v17;
    double v20 = v19;

    if (v15) {
      double v14 = v14 - v20;
    }
    else {
      double v14 = v14 - v18;
    }
  }
  uint64_t v21 = [v11 type];
  switch(v21)
  {
    case 2:
      objc_super v22 = objc_alloc_init(VUILibraryEpisodeFooterCell);
      -[VUILibraryEpisodeFooterCell sizeThatFits:](v22, "sizeThatFits:", v14, 1.79769313e308);
      double v6 = v31;
      double v7 = v32;
LABEL_14:

      break;
    case 1:
      v33 = [(VUILibraryMediaCollectionViewModel *)self->_mediaCollectionViewModel episodeShelfViewControllerBySeasonIdentifier];
      v34 = [v11 seasonIdentifier];
      objc_super v22 = [v33 objectForKey:v34];

      v35 = [(VUILibraryEpisodeFooterCell *)v22 view];
      objc_msgSend(v35, "sizeThatFits:", v14, 1.79769313e308);
      double v6 = v36;
      double v7 = v37;

      goto LABEL_14;
    case 0:
      objc_super v22 = [v11 seasonIdentifier];
      v23 = [(VUILibraryMediaCollectionViewModel *)self->_mediaCollectionViewModel productLockupViewBySeasonIdentifier];
      v24 = [v23 objectForKey:v22];

      if (!v24)
      {
        v25 = [(VUILibraryMediaCollectionViewModel *)self->_mediaCollectionViewModel seasonBySeasonIdentifier];
        v26 = [v25 objectForKey:v22];

        v24 = [(VUILibraryMediaCollectionViewController *)self _productLockupViewWithSeason:v26];
        v27 = [(VUILibraryMediaCollectionViewModel *)self->_mediaCollectionViewModel productLockupViewBySeasonIdentifier];
        v28 = (void *)[v27 mutableCopy];

        [v28 setObject:v24 forKey:v22];
        [(VUILibraryMediaCollectionViewModel *)self->_mediaCollectionViewModel setProductLockupViewBySeasonIdentifier:v28];
      }
      objc_msgSend(v24, "sizeThatFits:", v14, 1.79769313e308);
      double v6 = v29;
      double v7 = v30;

      goto LABEL_14;
  }
LABEL_15:

  double v38 = v6;
  double v39 = v7;
  result.height = v39;
  result.width = v38;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  +[VUIViewSpacer spacerB];
  double v7 = v6;
  id v8 = [(VUILibraryMediaCollectionViewController *)self traitCollection];
  +[VUIUtilities scaleContentSizeValue:v8 forTraitCollection:v7];
  double v10 = v9;

  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = v10;
  result.right = v13;
  result.bottom = v14;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUILibraryMediaCollectionViewController *)self seasonsDataSource];

  if (v5 == v4) {
    [(VUILibraryMediaCollectionViewController *)self setSeasonsFetchHasCompleted:1];
  }
  else {
    [(VUILibraryMediaCollectionViewController *)self setEpisodesFetchHasCompleted:1];
  }
  if ([(VUILibraryMediaCollectionViewController *)self _allFetchesHaveCompleted])
  {
    BOOL v6 = [(VUILibraryMediaCollectionViewController *)self _usingEpisodesGroupFetch];
    double v7 = [(VUILibraryStackViewController *)self stackCollectionView];
    id v8 = [(VUILibraryMediaCollectionViewController *)self seasonsDataSource];
    double v9 = [v8 mediaEntities];
    [(VUILibraryMediaCollectionViewController *)self setSeasons:v9];

    double v10 = [(VUILibraryMediaCollectionViewController *)self episodesDataSource];
    double v11 = [v10 mediaEntities];
    [(VUILibraryMediaCollectionViewController *)self setEpisodes:v11];

    double v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = [(VUILibraryMediaCollectionViewController *)self seasons];
      uint64_t v14 = [v13 count];
      char v15 = [(VUILibraryMediaCollectionViewController *)self episodes];
      *(_DWORD *)buf = 134218240;
      uint64_t v36 = v14;
      __int16 v37 = 2048;
      uint64_t v38 = [v15 count];
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "VUILibraryMediaCollectionViewController:Setting %lu seasons, %lu episodes", buf, 0x16u);
    }
    if (v6)
    {
      v16 = [(VUILibraryMediaCollectionViewController *)self episodesDataSource];
      double v17 = [v16 grouping];
      [(VUILibraryMediaCollectionViewController *)self setEpisodeGroups:v17];
    }
    double v18 = [(VUILibraryMediaCollectionViewController *)self mediaCollectionViewModel];

    if (v18)
    {
      double v19 = [(VUILibraryMediaCollectionViewController *)self seasonsDataSource];
      double v20 = [v19 mediaEntities];
      [(VUILibraryMediaCollectionViewController *)self setSeasons:v20];

      uint64_t v21 = [(VUILibraryMediaCollectionViewController *)self episodesDataSource];
      objc_super v22 = [v21 mediaEntities];
      [(VUILibraryMediaCollectionViewController *)self setEpisodes:v22];

      [(VUILibraryMediaCollectionViewController *)self _updateMediaCollectionViewModelForSeasons];
      v23 = [(VUILibraryMediaCollectionViewController *)self mediaCollectionViewModel];
      LODWORD(v22) = [v23 hasContent];

      v24 = [(VUILibraryMediaCollectionViewController *)self contentPresenter];
      v25 = v24;
      if (!v22)
      {
        [v24 setCurrentContentViewType:2];

        goto LABEL_15;
      }
      [v24 setCurrentContentViewType:3];

      v26 = [(VUILibraryMediaCollectionViewController *)self diffableDataSource];
      v27 = [(VUILibraryMediaCollectionViewController *)self _createDiffableDataSourceSnapshot];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __71__VUILibraryMediaCollectionViewController_dataSourceDidFinishFetching___block_invoke_2;
      v31[3] = &unk_1E6DF3F68;
      v31[4] = self;
      id v32 = v7;
      [v26 applySnapshot:v27 animatingDifferences:1 completion:v31];

      v28 = v32;
    }
    else
    {
      [(VUILibraryMediaCollectionViewController *)self _buildMediaCollectionViewModel];
      [(VUILibraryMediaCollectionViewController *)self _updateDeletedContentErrorMessage];
      double v29 = [(VUILibraryMediaCollectionViewController *)self diffableDataSource];
      double v30 = [(VUILibraryMediaCollectionViewController *)self _createDiffableDataSourceSnapshot];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __71__VUILibraryMediaCollectionViewController_dataSourceDidFinishFetching___block_invoke;
      v33[3] = &unk_1E6DF3F68;
      v33[4] = self;
      id v34 = v7;
      [v29 applySnapshot:v30 animatingDifferences:1 completion:v33];

      v28 = v34;
    }

LABEL_15:
  }
}

void __71__VUILibraryMediaCollectionViewController_dataSourceDidFinishFetching___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mediaCollectionViewModel];
  int v3 = [v2 hasContent];

  id v4 = [*(id *)(a1 + 32) contentPresenter];
  id v5 = v4;
  if (v3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  [v4 setCurrentContentViewType:v6];

  id v7 = [*(id *)(a1 + 40) collectionViewLayout];
  [v7 invalidateLayout];
}

void __71__VUILibraryMediaCollectionViewController_dataSourceDidFinishFetching___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateEpisodeShelvesWithLatestEpisodes];
  uint64_t v2 = [*(id *)(a1 + 40) collectionViewLayout];
  [v2 invalidateLayout];

  id v3 = [*(id *)(a1 + 32) stackCollectionView];
  [v3 setNeedsLayout];
}

- (void)contentDescriptionExpanded
{
  id v3 = [(VUILibraryStackViewController *)self stackCollectionView];
  uint64_t v2 = [v3 collectionViewLayout];
  [v2 invalidateLayout];
}

- (void)libraryEpisodesShelfViewController:(id)a3 didRemoveDownloadForAssetController:(id)a4
{
  id v7 = a4;
  id v5 = [(VUILibraryMediaCollectionViewController *)self episodes];
  uint64_t v6 = [v5 count];

  if (v6 == 1) {
    -[VUILibraryMediaCollectionViewController _updateAfterContentWasManuallyDeleted:](self, "_updateAfterContentWasManuallyDeleted:", [v7 supportsStartingDownload]);
  }
}

- (void)titleButtonPressedForStoreId:(id)a3
{
  id v3 = [a3 stringValue];
  if (![v3 length])
  {
    id v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[VUILibraryMediaCollectionViewController titleButtonPressedForStoreId:](v4);
    }
  }
  id v5 = +[VUIFeaturesConfiguration sharedInstance];
  uint64_t v6 = [v5 canonicalConfig];

  id v7 = +[VUITVAppLauncher sharedInstance];
  if (+[VUITVAppLauncher isSidebarEnabled])
  {
    id v8 = [v7 splitViewController];
    int v9 = [v8 isTabbarMode];
  }
  else
  {
    int v9 = 1;
  }
  double v10 = [v7 switchTabHandler];
  v24 = v6;
  double v11 = [v6 storeTabIdentifier];
  ((void (**)(void, void *))v10)[2](v10, v11);

  double v12 = [[VUIDocumentDataSource alloc] initWithDocumentRef:@"TVShowCanonical"];
  [(VUIDocumentDataSource *)v12 setControllerRef:@"TVShowCanonical"];
  [(VUIDocumentDataSource *)v12 setDocumentType:@"canonical"];
  double v13 = [[VUIDocumentContextDataTVShow alloc] initWithAdamID:v3];
  [(VUIDocumentDataSource *)v12 setContextData:v13];
  uint64_t v14 = objc_alloc_init(VUIDocumentUIConfiguration);
  [(VUIDocumentUIConfiguration *)v14 setType:1];
  [(VUIDocumentUIConfiguration *)v14 setAnimated:1];
  [(VUIDocumentDataSource *)v12 setUiConfiguration:v14];
  char v15 = [v7 appController];
  v16 = [v15 appContext];

  double v17 = +[VUIInterfaceFactory sharedInstance];
  double v18 = [v17 viewControllerWithDocumentDataSource:v12 appContext:v16];

  if (v18)
  {
    double v19 = [v7 appController];
    double v20 = [v19 navigationController];

    if (v9) {
      [v7 tabBarController];
    }
    else {
    uint64_t v21 = [v7 splitViewController];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v21 vuiPresentedViewController],
          objc_super v22 = objc_claimAutoreleasedReturnValue(),
          v22,
          v22))
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __72__VUILibraryMediaCollectionViewController_titleButtonPressedForStoreId___block_invoke;
      v25[3] = &unk_1E6DF3F68;
      id v26 = v20;
      id v27 = v18;
      objc_msgSend(v21, "vui_dismissViewControllerAnimated:completion:", 1, v25);
    }
    else
    {
      [v20 pushViewController:v18 animated:1];
    }
  }
  else
  {
    [(VUILibraryMediaCollectionViewController *)self showItemNotAvailableDialog];
  }
}

uint64_t __72__VUILibraryMediaCollectionViewController_titleButtonPressedForStoreId___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:1];
}

- (void)showItemNotAvailableDialog
{
  id v3 = +[VUILocalizationManager sharedInstance];
  id v10 = [v3 localizedStringForKey:@"TV.Library.Item.Not.Available.Title"];

  id v4 = +[VUILocalizationManager sharedInstance];
  id v5 = [v4 localizedStringForKey:@"TV.Library.Item.Not.Available.Message"];

  uint64_t v6 = +[VUIAlertController vui_alertControllerWithTitle:v10 message:v5 preferredStyle:1];
  id v7 = +[VUILocalizationManager sharedInstance];
  id v8 = [v7 localizedStringForKey:@"OK"];
  int v9 = +[VUIAlertAction vui_actionWithTitle:v8 style:0 handler:0];

  objc_msgSend(v6, "vui_addAction:", v9);
  objc_msgSend(v6, "vui_presentAlertFromPresentingController:animated:completion:", self, 1, 0);
}

- (id)_createDiffableDataSourceForCollectionView:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4FB1598]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__VUILibraryMediaCollectionViewController__createDiffableDataSourceForCollectionView___block_invoke;
  v9[3] = &unk_1E6DFD1F0;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = (void *)[v5 initWithCollectionView:v6 cellProvider:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

id __86__VUILibraryMediaCollectionViewController__createDiffableDataSourceForCollectionView___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v9 = [WeakRetained _seasonViewModelByIdentifier:v7];

  uint64_t v10 = [v9 type];
  switch(v10)
  {
    case 2:
      id v11 = [*(id *)(a1 + 32) dequeueReusableCellWithReuseIdentifier:@"VUILibraryEpisodeFooterCellReuseIdentifier" forIndexPath:v6];
      id v27 = [WeakRetained mediaCollectionViewModel];
      v28 = [v27 seasonBySeasonIdentifier];
      double v29 = [v9 seasonIdentifier];
      double v12 = [v28 objectForKey:v29];

      double v30 = [v12 storeID];
      [v11 setStoreID:v30];

      double v31 = NSString;
      id v32 = +[VUILocalizationManager sharedInstance];
      v33 = [v32 localizedStringForKey:@"GET_MORE_EPISODES"];
      id v34 = +[VUILocalizationManager sharedInstance];
      v35 = [v34 localizedStringForKey:@"PRODUCT_DESCRIPTION_MORE_ELLIPSES"];
      uint64_t v36 = [v31 stringWithFormat:@"%@%@", v33, v35];
      [v11 setTitle:v36];

      [v11 setDelegate:WeakRetained];
LABEL_11:

      goto LABEL_13;
    case 1:
      id v11 = [*(id *)(a1 + 32) dequeueReusableCellWithReuseIdentifier:@"VUILibraryCollectionCellReuseIdentifier" forIndexPath:v6];
      __int16 v37 = [WeakRetained mediaCollectionViewModel];
      uint64_t v38 = [v37 episodeShelfViewControllerBySeasonIdentifier];
      uint64_t v39 = [v9 seasonIdentifier];
      double v12 = [v38 objectForKey:v39];

      [v11 setViewController:v12];
      goto LABEL_11;
    case 0:
      id v11 = [*(id *)(a1 + 32) dequeueReusableCellWithReuseIdentifier:@"VUICollectionViewWrapperCellReuseIdentifier" forIndexPath:v6];
      double v12 = [v9 seasonIdentifier];
      double v13 = [WeakRetained mediaCollectionViewModel];
      uint64_t v14 = [v13 productLockupViewBySeasonIdentifier];

      if (!v14)
      {
        char v15 = [WeakRetained mediaCollectionViewModel];
        id v16 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
        [v15 setProductLockupViewBySeasonIdentifier:v16];
      }
      double v17 = [WeakRetained mediaCollectionViewModel];
      double v18 = [v17 productLockupViewBySeasonIdentifier];
      double v19 = [v18 objectForKey:v12];

      if (!v19)
      {
        double v20 = [WeakRetained mediaCollectionViewModel];
        uint64_t v21 = [v20 seasonBySeasonIdentifier];
        objc_super v22 = [v21 objectForKey:v12];

        double v19 = [WeakRetained _productLockupViewWithSeason:v22];
        v23 = [WeakRetained mediaCollectionViewModel];
        v24 = [v23 productLockupViewBySeasonIdentifier];
        v25 = (void *)[v24 mutableCopy];

        [v25 setObject:v19 forKey:v12];
        id v26 = [WeakRetained mediaCollectionViewModel];
        [v26 setProductLockupViewBySeasonIdentifier:v25];
      }
      [v11 setChildView:v19];

      goto LABEL_11;
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (id)_createDiffableDataSourceSnapshot
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v10[0] = @"MediaCollectionMainSection";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v3 appendSectionsWithIdentifiers:v4];

  id v5 = [(VUILibraryMediaCollectionViewController *)self _seasonViewModelIdentifiers];
  [v3 appendItemsWithIdentifiers:v5 intoSectionWithIdentifier:@"MediaCollectionMainSection"];
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUILibraryMediaCollectionViewController:Creating snapshot with %lu season view models", (uint8_t *)&v8, 0xCu);
  }

  return v3;
}

- (id)_seasonViewModelIdentifiers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(VUILibraryMediaCollectionViewController *)self mediaCollectionViewModel];
  id v5 = [v4 seasonViewModels];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) identifier];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v3 array];

  return v11;
}

- (id)_seasonViewModelByIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(VUILibraryMediaCollectionViewController *)self mediaCollectionViewModel];
  uint64_t v6 = [v5 seasonViewModels];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 identifier];
        int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_updateEpisodeShelvesWithLatestEpisodes
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [(VUILibraryMediaCollectionViewController *)self mediaCollectionViewModel];
  id v4 = [v3 seasonViewModels];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [v9 type];
        id v11 = [v9 seasonIdentifier];
        if (v10)
        {
          if (v10 == 1)
          {
            int v12 = [(VUILibraryMediaCollectionViewController *)self mediaCollectionViewModel];
            long long v13 = [v12 episodeShelfViewControllerBySeasonIdentifier];
            long long v14 = [v13 objectForKey:v11];

            long long v15 = [(VUILibraryMediaCollectionViewController *)self mediaCollectionViewModel];
            long long v16 = [v15 episodesBySeasonIdentifer];
            long long v17 = [v16 objectForKey:v11];

            if (v14 && v17) {
              [v14 updateWithEpisodes:v17];
            }
            [(VUILibraryMediaCollectionViewController *)self _updateProductLockupViewWithSeasonIdentifier:v11];
          }
        }
        else
        {
          [(VUILibraryMediaCollectionViewController *)self _updateProductLockupViewWithSeasonIdentifier:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

- (void)_updateAfterContentWasManuallyDeleted:(BOOL)a3
{
  if (!a3)
  {
    uint64_t v5 = [(VUILibraryMediaCollectionViewController *)self contentPresenter];
    [v5 setContentHasBeenManuallyDeleted:1];

    [(VUILibraryDataSource *)self->_episodesDataSource setDelegate:0];
    [(VUILibraryDataSource *)self->_seasonsDataSource setDelegate:0];
    id v7 = [(VUILibraryMediaCollectionViewController *)self navigationController];
    id v6 = (id)[v7 popViewControllerAnimated:1];
  }
}

- (void)_updateDeletedContentErrorMessage
{
  if ([(VUILibraryMediaCollectionViewController *)self canShowMultipleSeasons])
  {
    uint64_t v3 = NSString;
    id v4 = +[VUILocalizationManager sharedInstance];
    uint64_t v5 = v4;
    id v6 = @"GENERIC_DELETED_ERROR_MESSAGE_FORMAT";
  }
  else
  {
    id v7 = [(VUIMediaEntity *)self->_mediaCollection seasonNumber];
    uint64_t v8 = [v7 unsignedIntegerValue];

    uint64_t v3 = NSString;
    id v4 = +[VUILocalizationManager sharedInstance];
    uint64_t v5 = v4;
    if (v8)
    {
      uint64_t v9 = [v4 localizedStringForKey:@"SPECIFIC_SEASON_DELETED_ERROR_MESSAGE_FORMAT"];
      [v3 stringWithValidatedFormat:v9, @"%lu %@", 0, v8, self->_showTitle validFormatSpecifiers error];
      goto LABEL_7;
    }
    id v6 = @"GENERIC_SEASON_DELETED_ERROR_MESSAGE_FORMAT";
  }
  uint64_t v9 = [v4 localizedStringForKey:v6];
  [v3 stringWithValidatedFormat:v9, @"%@", 0, self->_showTitle, v10 validFormatSpecifiers error];
LABEL_7:
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [(VUIViewControllerContentPresenter *)self->_contentPresenter setDeletedContentErrorMessage:v11];
}

- (id)_episodesBySeasonIdentifier
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (self->_episodeGroups)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    episodeGroups = self->_episodeGroups;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __70__VUILibraryMediaCollectionViewController__episodesBySeasonIdentifier__block_invoke;
    id v11 = &unk_1E6DFCA68;
    id v12 = v3;
    id v5 = v3;
    [(NSArray *)episodeGroups enumerateObjectsUsingBlock:&v8];
    id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);
  }
  else
  {
    id v5 = [(VUIMediaEntity *)self->_mediaCollection identifier];
    id v13 = v5;
    v14[0] = self->_episodes;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }

  return v6;
}

void __70__VUILibraryMediaCollectionViewController__episodesBySeasonIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 mediaEntities];
  id v4 = [v3 identifier];

  [*(id *)(a1 + 32) setObject:v5 forKey:v4];
}

- (BOOL)_usingEpisodesGroupFetch
{
  uint64_t v2 = [(VUIMediaEntity *)self->_mediaCollection type];
  id v3 = +[VUIMediaEntityType show];
  BOOL v4 = v2 == v3;

  return v4;
}

- (void)_buildMediaCollectionViewModel
{
  id v3 = objc_alloc_init(VUILibraryMediaCollectionViewModel);
  mediaCollectionViewModel = self->_mediaCollectionViewModel;
  self->_mediaCollectionViewModel = v3;

  [(VUILibraryMediaCollectionViewController *)self _updateMediaCollectionViewModelForSeasons];
}

- (void)_updateMediaCollectionViewModelForSeasons
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v19 = [(VUILibraryMediaCollectionViewController *)self _episodesBySeasonIdentifier];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v23 = [(VUILibraryMediaCollectionViewModel *)self->_mediaCollectionViewModel episodeShelfViewControllerBySeasonIdentifier];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v18 = self;
  obj = self->_seasons;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v8 = [v7 identifier];
        [v24 setObject:v7 forKey:v8];
        uint64_t v9 = [v23 objectForKey:v8];
        if (!v9)
        {
          uint64_t v10 = [v19 objectForKey:v8];
          uint64_t v9 = [(VUILibraryMediaCollectionViewController *)v18 _episodeShelfViewControllerWithSeason:v7 episodes:v10];
        }
        [v22 setObject:v9 forKey:v8];
        id v11 = [[VUILibrarySeasonViewModel alloc] initWithSeasonIdentifier:v8 type:0];
        [v3 addObject:v11];
        id v12 = [[VUILibrarySeasonViewModel alloc] initWithSeasonIdentifier:v8 type:1];
        [v3 addObject:v12];
        id v13 = [v7 storeID];
        uint64_t v14 = [v13 integerValue];

        if (v14)
        {
          long long v15 = [[VUILibrarySeasonViewModel alloc] initWithSeasonIdentifier:v8 type:2];
          [v3 addObject:v15];
        }
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }

  mediaCollectionViewModel = v18->_mediaCollectionViewModel;
  long long v17 = (void *)[v3 copy];
  [(VUILibraryMediaCollectionViewModel *)mediaCollectionViewModel setSeasonViewModels:v17];

  [(VUILibraryMediaCollectionViewModel *)v18->_mediaCollectionViewModel setSeasonBySeasonIdentifier:v24];
  [(VUILibraryMediaCollectionViewModel *)v18->_mediaCollectionViewModel setEpisodeShelfViewControllerBySeasonIdentifier:v22];
  [(VUILibraryMediaCollectionViewModel *)v18->_mediaCollectionViewModel setEpisodesBySeasonIdentifer:v19];
}

- (id)_productLockupViewWithSeason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [VUIProductLockupView alloc];
  id v6 = -[VUIProductLockupView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(VUIProductLockupView *)v6 setDelegate:self];
  [(VUILibraryMediaCollectionViewController *)self _updateProductLockupView:v6 withSeason:v4];

  return v6;
}

- (void)_updateProductLockupViewWithSeasonIdentifier:(id)a3
{
  mediaCollectionViewModel = self->_mediaCollectionViewModel;
  id v5 = a3;
  id v6 = [(VUILibraryMediaCollectionViewModel *)mediaCollectionViewModel productLockupViewBySeasonIdentifier];
  id v10 = [v6 objectForKey:v5];

  id v7 = [(VUILibraryMediaCollectionViewModel *)self->_mediaCollectionViewModel seasonBySeasonIdentifier];
  uint64_t v8 = [v7 objectForKey:v5];

  if (v10) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    [(VUILibraryMediaCollectionViewController *)self _updateProductLockupView:v10 withSeason:v8];
  }
}

- (void)_updateProductLockupView:(id)a3 withSeason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 updateWithMediaEntity:v6];
  [(VUILibraryMediaCollectionViewController *)self addDownloadButtonToProductLockupView:v7 forSeason:v6];
}

- (id)_episodeShelfViewControllerWithSeason:(id)a3 episodes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[VUILibraryEpisodeShelfViewController alloc] initWithEpisodes:v6 season:v7];

  [(VUILibraryEpisodeShelfViewController *)v8 setDelegate:self];
  return v8;
}

- (void)addDownloadButtonToProductLockupView:(id)a3 forSeason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 downloadView];

  if (!v8)
  {
    BOOL v9 = [v7 assetController];
    if (v9) {
      id v10 = [[VUIDownloadButton alloc] initWithMediaEntity:v7 type:8];
    }
    else {
      id v10 = 0;
    }
    [(VUIDownloadButton *)v10 setUsesDefaultConfiguration:1];
    [(VUIDownloadButton *)v10 setPresentingViewController:self];
    if (v10)
    {
      char v11 = [v9 supportsStartingDownload];
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __90__VUILibraryMediaCollectionViewController_addDownloadButtonToProductLockupView_forSeason___block_invoke;
      v12[3] = &unk_1E6DFD218;
      objc_copyWeak(&v13, &location);
      char v14 = v11;
      [(VUIDownloadButton *)v10 setDownloadStateChangeHandler:v12];
      [v6 setDownloadView:v10];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __90__VUILibraryMediaCollectionViewController_addDownloadButtonToProductLockupView_forSeason___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a3)
  {
    id v8 = WeakRetained;
    id v6 = [WeakRetained seasons];
    uint64_t v7 = [v6 count];

    id WeakRetained = v8;
    if (v7 == 1)
    {
      [v8 _updateAfterContentWasManuallyDeleted:*(unsigned __int8 *)(a1 + 40)];
      id WeakRetained = v8;
    }
  }
}

- (BOOL)_allFetchesHaveCompleted
{
  BOOL v3 = [(VUILibraryMediaCollectionViewController *)self episodesFetchHasCompleted];
  if (v3)
  {
    LOBYTE(v3) = [(VUILibraryMediaCollectionViewController *)self seasonsFetchHasCompleted];
  }
  return v3;
}

- (BOOL)canShowMultipleSeasons
{
  return self->_canShowMultipleSeasons;
}

- (void)setCanShowMultipleSeasons:(BOOL)a3
{
  self->_canShowMultipleSeasons = a3;
}

- (VUIMediaCollection)mediaCollection
{
  return self->_mediaCollection;
}

- (void)setMediaCollection:(id)a3
{
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
}

- (NSArray)seasons
{
  return self->_seasons;
}

- (void)setSeasons:(id)a3
{
}

- (NSArray)episodes
{
  return self->_episodes;
}

- (void)setEpisodes:(id)a3
{
}

- (NSArray)episodeGroups
{
  return self->_episodeGroups;
}

- (void)setEpisodeGroups:(id)a3
{
}

- (VUILibraryMediaCollectionViewModel)mediaCollectionViewModel
{
  return self->_mediaCollectionViewModel;
}

- (void)setMediaCollectionViewModel:(id)a3
{
}

- (NSString)showTitle
{
  return self->_showTitle;
}

- (void)setShowTitle:(id)a3
{
}

- (VUIMediaEntitiesDataSource)seasonsDataSource
{
  return self->_seasonsDataSource;
}

- (void)setSeasonsDataSource:(id)a3
{
}

- (VUIMediaEntitiesDataSource)episodesDataSource
{
  return self->_episodesDataSource;
}

- (void)setEpisodesDataSource:(id)a3
{
}

- (BOOL)seasonsFetchHasCompleted
{
  return self->_seasonsFetchHasCompleted;
}

- (void)setSeasonsFetchHasCompleted:(BOOL)a3
{
  self->_seasonsFetchHasCompleted = a3;
}

- (BOOL)episodesFetchHasCompleted
{
  return self->_episodesFetchHasCompleted;
}

- (void)setEpisodesFetchHasCompleted:(BOOL)a3
{
  self->_episodesFetchHasCompleted = a3;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_episodesDataSource, 0);
  objc_storeStrong((id *)&self->_seasonsDataSource, 0);
  objc_storeStrong((id *)&self->_showTitle, 0);
  objc_storeStrong((id *)&self->_mediaCollectionViewModel, 0);
  objc_storeStrong((id *)&self->_episodeGroups, 0);
  objc_storeStrong((id *)&self->_episodes, 0);
  objc_storeStrong((id *)&self->_seasons, 0);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_mediaCollection, 0);
}

- (void)titleButtonPressedForStoreId:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUILibraryMediaCollectionViewController:: Show more episodes button pressed - missing adamId", v1, 2u);
}

@end