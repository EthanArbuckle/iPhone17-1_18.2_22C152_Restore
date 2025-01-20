@interface VUILibraryEpisodeShelfViewController
- (BOOL)_canRemoveEpisodeAtIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)dialogInteractionController:(id)a3 shouldBeginInteractionForIndexPath:(id)a4;
- (BOOL)shouldIgnoreSelectEvent;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)episodeViewModels;
- (NSIndexPath)popoverIndexPath;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (VUIEpisodeDetailViewController)episodeDetailViewController;
- (VUILibraryEpisodeShelfViewController)initWithEpisodes:(id)a3 season:(id)a4;
- (VUILibraryEpisodeShelfViewControllerDelegate)delegate;
- (VUIMediaCollection)season;
- (id)_createDiffableDataSourceForCollectionView:(id)a3;
- (id)_createDiffableDataSourceSnapshot;
- (id)_episodeViewModelsWithFetchedEpisodes:(id)a3;
- (id)_episodeWithIdentifier:(id)a3;
- (id)_getEntityIdentifiersFromViewModels;
- (void)_configureShelfLayout:(id)a3;
- (void)_updateHeaderView;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureWithCollectionView:(id)a3;
- (void)dialogInteractionController:(id)a3 interactionDidBeginForIndexPath:(id)a4;
- (void)dialogInteractionController:(id)a3 interactionDidEndForIndexPath:(id)a4;
- (void)episodeDetailViewControllerWasDismissed:(id)a3;
- (void)removeDownloadDismissed;
- (void)removeDownloadPressed;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setEpisodeDetailViewController:(id)a3;
- (void)setEpisodeViewModels:(id)a3;
- (void)setPopoverIndexPath:(id)a3;
- (void)setSeason:(id)a3;
- (void)setShouldIgnoreSelectEvent:(BOOL)a3;
- (void)updateShelfLayout:(id)a3;
- (void)updateWithEpisodes:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation VUILibraryEpisodeShelfViewController

- (VUILibraryEpisodeShelfViewController)initWithEpisodes:(id)a3 season:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VUILibraryEpisodeShelfViewController;
  v8 = [(VUIShelfViewController *)&v13 initWithGridStyle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_season, a4);
    uint64_t v10 = [(VUILibraryEpisodeShelfViewController *)v9 _episodeViewModelsWithFetchedEpisodes:v6];
    episodeViewModels = v9->_episodeViewModels;
    v9->_episodeViewModels = (NSArray *)v10;

    [(VUILibraryEpisodeShelfViewController *)v9 _updateHeaderView];
  }

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VUILibraryEpisodeShelfViewController;
  -[VUILibraryEpisodeShelfViewController viewWillAppear:](&v16, sel_viewWillAppear_);
  v5 = [(VUIShelfViewController *)self collectionView];
  id v6 = [v5 indexPathsForSelectedItems];
  id v7 = [v6 firstObject];

  if (v7)
  {
    v8 = [(VUILibraryEpisodeShelfViewController *)self transitionCoordinator];
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __55__VUILibraryEpisodeShelfViewController_viewWillAppear___block_invoke;
      v12[3] = &unk_1E6DF3E68;
      id v13 = v5;
      id v14 = v7;
      BOOL v15 = a3;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __55__VUILibraryEpisodeShelfViewController_viewWillAppear___block_invoke_2;
      v9[3] = &unk_1E6DF3E90;
      id v10 = v13;
      id v11 = v14;
      [v8 animateAlongsideTransition:v12 completion:v9];
    }
    else
    {
      [v5 deselectItemAtIndexPath:v7 animated:1];
    }
  }
  [(VUILibraryEpisodeShelfViewController *)self setEpisodeDetailViewController:0];
}

uint64_t __55__VUILibraryEpisodeShelfViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __55__VUILibraryEpisodeShelfViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
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

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)VUILibraryEpisodeShelfViewController;
  [(VUILibraryEpisodeShelfViewController *)&v12 viewDidLoad];
  v3 = [(VUILibraryEpisodeShelfViewController *)self diffableDataSource];
  v4 = [(VUILibraryEpisodeShelfViewController *)self _createDiffableDataSourceSnapshot];
  [v3 applySnapshot:v4 animatingDifferences:1];

  if (!self->_dialogInteractionController)
  {
    uint64_t v5 = objc_alloc_init(VUILibraryDownloadPopoverViewController);
    [(VUILibraryDownloadPopoverViewController *)v5 setDelegate:self];
    id v6 = [VUIDialogInteractionController alloc];
    id v7 = [(VUIShelfViewController *)self collectionView];
    v8 = [(VUIDialogInteractionController *)v6 initWithPresentingViewController:self collectionView:v7 controllerToPresent:v5];
    dialogInteractionController = self->_dialogInteractionController;
    self->_dialogInteractionController = v8;

    if (([MEMORY[0x1E4FB1438] isRunningInStoreDemoMode] & 1) == 0) {
      [(VUIDialogInteractionController *)self->_dialogInteractionController setDelegate:self];
    }
  }
  if ([MEMORY[0x1E4FB3CA0] isUniquelyiPadEnabled])
  {
    id v10 = [(VUIShelfViewController *)self collectionView];
    [v10 setClipsToBounds:0];

    id v11 = [(VUIShelfViewController *)self collectionView];
    objc_msgSend(v11, "_setVisibleRectEdgeInsets:", 0.0, -400.0, 0.0, 0.0);
  }
}

- (void)updateWithEpisodes:(id)a3
{
  v4 = [(VUILibraryEpisodeShelfViewController *)self _episodeViewModelsWithFetchedEpisodes:a3];
  episodeViewModels = self->_episodeViewModels;
  self->_episodeViewModels = v4;

  id v6 = [(VUIShelfViewController *)self collectionView];
  id v7 = [v6 collectionViewLayout];
  [(VUILibraryEpisodeShelfViewController *)self updateShelfLayout:v7];

  [(VUILibraryEpisodeShelfViewController *)self _updateHeaderView];
  v8 = [(VUILibraryEpisodeShelfViewController *)self diffableDataSource];
  v9 = [(VUILibraryEpisodeShelfViewController *)self _createDiffableDataSourceSnapshot];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__VUILibraryEpisodeShelfViewController_updateWithEpisodes___block_invoke;
  v10[3] = &unk_1E6DF3D58;
  v10[4] = self;
  [v8 applySnapshot:v9 animatingDifferences:1 completion:v10];
}

void __59__VUILibraryEpisodeShelfViewController_updateWithEpisodes___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) episodeDetailViewController];
  if (v2)
  {
    id v7 = v2;
    v3 = [v2 presentingViewController];

    v2 = v7;
    if (v3)
    {
      v4 = [v7 mediaItem];
      uint64_t v5 = [v4 identifier];
      id v6 = [*(id *)(a1 + 32) _episodeWithIdentifier:v5];
      if (!v6)
      {
        [v7 dismissViewControllerAnimated:1 completion:0];
        [*(id *)(a1 + 32) setEpisodeDetailViewController:0];
      }

      v2 = v7;
    }
  }
}

- (void)configureWithCollectionView:(id)a3
{
  id v4 = a3;
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"EpisodeList"];
  id v5 = [(VUILibraryEpisodeShelfViewController *)self _createDiffableDataSourceForCollectionView:v4];

  [(VUILibraryEpisodeShelfViewController *)self setDiffableDataSource:v5];
}

- (void)updateShelfLayout:(id)a3
{
  id v8 = a3;
  id v4 = (void *)MEMORY[0x1E4FB1F48];
  id v5 = [(VUILibraryEpisodeShelfViewController *)self view];
  [v5 bounds];
  uint64_t v6 = objc_msgSend(v4, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v10));

  if ((unint64_t)(v6 - 2) >= 6) {
    NSUInteger v7 = [(NSArray *)self->_episodeViewModels count];
  }
  else {
    NSUInteger v7 = qword_1E38FD798[v6 - 2];
  }
  [v8 setRowCount:v7];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  if (!self->_sizingCell)
  {
    NSUInteger v7 = [VUILibraryEpisodeListCell alloc];
    id v8 = -[VUILibraryEpisodeListCell initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sizingCell = self->_sizingCell;
    self->_sizingCell = v8;
  }
  CGRect v10 = (void *)MEMORY[0x1E4FB1F48];
  id v11 = [(VUILibraryEpisodeShelfViewController *)self view];
  [v11 bounds];
  objc_msgSend(v10, "vui_itemWidthForGridStyle:gridType:numGridColumns:windowWidth:", 0, 0, 1, CGRectGetWidth(v25));
  double v13 = v12;

  id v14 = -[NSArray objectAtIndex:](self->_episodeViewModels, "objectAtIndex:", [v6 row]);
  BOOL v15 = [v14 episode];
  objc_super v16 = self->_sizingCell;
  v17 = [v14 assetController];
  +[VUILibraryEpisodeListCell configureVUILibraryEpisodeListCell:v16 withMedia:v15 andAssetController:v17];

  -[VUILibraryEpisodeListCell sizeThatFits:](self->_sizingCell, "sizeThatFits:", v13, 1.79769313e308);
  double v19 = v18;
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return !self->_shouldIgnoreSelectEvent;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  unint64_t v5 = objc_msgSend(a4, "row", a3);
  if (v5 < [(NSArray *)self->_episodeViewModels count])
  {
    id v18 = [(NSArray *)self->_episodeViewModels objectAtIndex:v5];
    id v6 = [v18 episode];
    NSUInteger v7 = [[VUIEpisodeDetailViewController alloc] initWithMediaItem:v6];
    [(VUILibraryEpisodeShelfViewController *)self setEpisodeDetailViewController:v7];
    id v8 = [(VUILibraryEpisodeShelfViewController *)self navigationController];
    if (!v8)
    {
      id v8 = +[VUIApplicationRouter currentNavigationController];
    }
    v9 = [(VUILibraryEpisodeShelfViewController *)self traitCollection];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if (v10)
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
      [v11 setModalPresentationStyle:2];
      [(UIViewController *)self vui_presentViewController:v11 animated:1 completion:0];
      double v12 = [(VUILibraryEpisodeShelfViewController *)self view];
      double v13 = [(VUILibraryEpisodeShelfViewController *)self view];
      [v13 bounds];
      double MidX = CGRectGetMidX(v20);
      BOOL v15 = [(VUILibraryEpisodeShelfViewController *)self view];
      [v15 bounds];
      double MidY = CGRectGetMidY(v21);

      v17 = [(VUIEpisodeDetailViewController *)v7 popoverPresentationController];
      [v17 setSourceView:v12];
      objc_msgSend(v17, "setSourceRect:", MidX, MidY, 0.0, 0.0);
      [v17 setPermittedArrowDirections:-1];
    }
    else
    {
      [v8 pushViewController:v7 animated:1];
    }
  }
}

- (void)episodeDetailViewControllerWasDismissed:(id)a3
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VUILibraryEpisodeShelfViewController;
  -[VUIShelfViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  if ([(VUIDialogInteractionController *)self->_dialogInteractionController isPresenting]) {
    [(VUIDialogInteractionController *)self->_dialogInteractionController dismissConfirmation];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUILibraryEpisodeShelfViewController;
  [(VUILibraryEpisodeShelfViewController *)&v4 viewWillDisappear:a3];
  if ([(VUIDialogInteractionController *)self->_dialogInteractionController isPresenting]) {
    [(VUIDialogInteractionController *)self->_dialogInteractionController dismissConfirmation];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUILibraryEpisodeShelfViewController;
  -[VUILibraryEpisodeShelfViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  if (!a3)
  {
    dialogInteractionController = self->_dialogInteractionController;
    self->_dialogInteractionController = 0;
  }
}

- (void)removeDownloadPressed
{
  popoverIndexPath = self->_popoverIndexPath;
  if (popoverIndexPath)
  {
    unint64_t v4 = [(NSIndexPath *)popoverIndexPath row];
    if (v4 < [(NSArray *)self->_episodeViewModels count])
    {
      id v9 = [(NSArray *)self->_episodeViewModels objectAtIndex:v4];
      objc_super v5 = [v9 assetController];
      objc_super v6 = v5;
      if (v5)
      {
        [v5 cancelAndRemoveDownload];
        NSUInteger v7 = [(VUILibraryEpisodeShelfViewController *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v7 libraryEpisodesShelfViewController:self didRemoveDownloadForAssetController:v6];
        }
        dialogInteractionController = self->_dialogInteractionController;
        if (dialogInteractionController) {
          [(VUIDialogInteractionController *)dialogInteractionController dismissConfirmation];
        }
      }
    }
  }
}

- (void)removeDownloadDismissed
{
  self->_shouldIgnoreSelectEvent = 0;
}

- (BOOL)dialogInteractionController:(id)a3 shouldBeginInteractionForIndexPath:(id)a4
{
  BOOL result = [(VUILibraryEpisodeShelfViewController *)self _canRemoveEpisodeAtIndexPath:a4];
  self->_shouldIgnoreSelectEvent = result;
  return result;
}

- (void)dialogInteractionController:(id)a3 interactionDidBeginForIndexPath:(id)a4
{
}

- (void)dialogInteractionController:(id)a3 interactionDidEndForIndexPath:(id)a4
{
  self->_shouldIgnoreSelectEvent = 0;
  popoverIndexPath = self->_popoverIndexPath;
  self->_popoverIndexPath = 0;
}

- (id)_createDiffableDataSourceForCollectionView:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4FB1598]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__VUILibraryEpisodeShelfViewController__createDiffableDataSourceForCollectionView___block_invoke;
  v8[3] = &unk_1E6DF3EB8;
  objc_copyWeak(&v9, &location);
  objc_super v6 = (void *)[v5 initWithCollectionView:v4 cellProvider:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

id __83__VUILibraryEpisodeShelfViewController__createDiffableDataSourceForCollectionView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"EpisodeList" forIndexPath:v5];

  id v9 = [WeakRetained episodeViewModels];
  uint64_t v10 = [v5 row];

  id v11 = [v9 objectAtIndex:v10];

  double v12 = [v11 episode];
  double v13 = [v11 assetController];
  +[VUILibraryEpisodeListCell configureVUILibraryEpisodeListCell:v8 withMedia:v12 andAssetController:v13];

  return v8;
}

- (id)_createDiffableDataSourceSnapshot
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v7[0] = @"ShelfMainSection";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 appendSectionsWithIdentifiers:v4];

  id v5 = [(VUILibraryEpisodeShelfViewController *)self _getEntityIdentifiersFromViewModels];
  [v3 appendItemsWithIdentifiers:v5 intoSectionWithIdentifier:@"ShelfMainSection"];

  return v3;
}

- (id)_getEntityIdentifiersFromViewModels
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(VUILibraryEpisodeShelfViewController *)self episodeViewModels];
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
        id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) episode];
        uint64_t v10 = [v9 identifier];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = (void *)[v3 copy];
  return v11;
}

- (void)setEpisodeDetailViewController:(id)a3
{
  uint64_t v5 = (VUIEpisodeDetailViewController *)a3;
  p_episodeDetailViewController = &self->_episodeDetailViewController;
  episodeDetailViewController = self->_episodeDetailViewController;
  id v8 = v5;
  if (episodeDetailViewController != v5)
  {
    if (episodeDetailViewController) {
      [(VUIEpisodeDetailViewController *)episodeDetailViewController setDelegate:0];
    }
    objc_storeStrong((id *)&self->_episodeDetailViewController, a3);
    if (*p_episodeDetailViewController) {
      [(VUIEpisodeDetailViewController *)*p_episodeDetailViewController setDelegate:self];
    }
  }
}

- (id)_episodeViewModelsWithFetchedEpisodes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      uint64_t v16 = v6;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        uint64_t v10 = objc_alloc_init(VUILibraryEpisodeShelfEpisodeViewModel);
        [(VUILibraryEpisodeShelfEpisodeViewModel *)v10 setEpisode:v9];
        id v11 = [v9 assetController];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = v7;
          id v13 = v11;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v14 = [(VUIMediaCollection *)self->_season mediaItemCollection];
            [v13 setMpMediaItemCollection:v14];
          }
          uint64_t v7 = v12;
          uint64_t v6 = v16;
        }
        [(VUILibraryEpisodeShelfEpisodeViewModel *)v10 setAssetController:v11];
        [v4 addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_episodeWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_episodeViewModels;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "episode", (void)v14);
      id v11 = [v10 identifier];
      char v12 = [v11 isEqual:v4];

      if (v12) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_configureShelfLayout:(id)a3
{
  id v7 = a3;
  id v4 = [(VUILibraryEpisodeShelfViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1) {
    NSUInteger v6 = 4;
  }
  else {
    NSUInteger v6 = [(NSArray *)self->_episodeViewModels count];
  }
  [v7 setRowCount:v6];
}

- (BOOL)_canRemoveEpisodeAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 row];
  if (v5 >= [(NSArray *)self->_episodeViewModels count]) {
    goto LABEL_4;
  }
  NSUInteger v6 = -[NSArray objectAtIndex:](self->_episodeViewModels, "objectAtIndex:", [v4 row]);
  id v7 = [v6 episode];
  uint64_t v8 = [v7 isLocal];
  char v9 = [v8 BOOLValue];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
LABEL_4:
  }
    BOOL v10 = 0;

  return v10;
}

- (void)_updateHeaderView
{
  NSUInteger v3 = [(NSArray *)self->_episodeViewModels count];
  id v4 = NSString;
  unint64_t v5 = +[VUILocalizationManager sharedInstance];
  NSUInteger v6 = [v5 localizedStringForKey:@"NUMBER_OF_EPISODES"];
  objc_msgSend(v4, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v6, @"%d", 0, v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9];
  uint64_t v8 = +[VUICollectionHeaderView configureCollectionHeaderViewWithTitle:v7 subtitle:0 buttonString:0 existingView:0];
  [(VUIShelfViewController *)self setHeaderView:v8];
}

- (VUILibraryEpisodeShelfViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUILibraryEpisodeShelfViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)episodeViewModels
{
  return self->_episodeViewModels;
}

- (void)setEpisodeViewModels:(id)a3
{
}

- (VUIMediaCollection)season
{
  return self->_season;
}

- (void)setSeason:(id)a3
{
}

- (VUIEpisodeDetailViewController)episodeDetailViewController
{
  return self->_episodeDetailViewController;
}

- (NSIndexPath)popoverIndexPath
{
  return self->_popoverIndexPath;
}

- (void)setPopoverIndexPath:(id)a3
{
}

- (BOOL)shouldIgnoreSelectEvent
{
  return self->_shouldIgnoreSelectEvent;
}

- (void)setShouldIgnoreSelectEvent:(BOOL)a3
{
  self->_shouldIgnoreSelectEvent = a3;
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
  objc_storeStrong((id *)&self->_popoverIndexPath, 0);
  objc_storeStrong((id *)&self->_episodeDetailViewController, 0);
  objc_storeStrong((id *)&self->_season, 0);
  objc_storeStrong((id *)&self->_episodeViewModels, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dialogInteractionController, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
}

@end