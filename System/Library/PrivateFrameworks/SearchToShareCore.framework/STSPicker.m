@interface STSPicker
- (NSArray)querySuggestions;
- (NSString)headerCellReuseIdentifier;
- (STSPicker)initWithSearchModel:(id)a3 showSuggestions:(BOOL)a4;
- (STSPickerSelectionDelegate)selectionDelegate;
- (STSPickerView)pickerView;
- (id)_detailViewControllerForIndexPath:(id)a3;
- (id)_loadMoreFooter;
- (id)_noticeTextForSearchError:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)getTapToRadarPunchOut:(id)a3;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (id)snapshotImage;
- (int64_t)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_beginDownloadingResultAtIndexPath:(id)a3;
- (void)_cancelActiveDownload;
- (void)_fetchImageWithURL:(id)a3 priority:(int64_t)a4 forCollectionView:(id)a5 atIndexPath:(id)a6;
- (void)_handleDebugGesture:(id)a3;
- (void)_handleLongPress:(id)a3;
- (void)_loadMoreResultsIfNecessary;
- (void)_presentDetailViewControllerForIndexPath:(id)a3;
- (void)_presentNoticeWithText:(id)a3;
- (void)_reportFeedbackDisplayedResultsDidScroll:(BOOL)a3;
- (void)_updatePredictedSuggestionsForSize:(CGSize)a3;
- (void)cancelImageDownloads;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)detailViewControllerDidInsert:(id)a3;
- (void)detailViewControllerDidReportConcern:(id)a3 result:(id)a4 punchout:(id)a5;
- (void)detailViewControllerDidSelectProviderLink:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)headerDidSelectCancelButton:(id)a3;
- (void)headerView:(id)a3 didRequestCompletion:(id)a4;
- (void)headerView:(id)a3 didSearchFor:(id)a4;
- (void)headerView:(id)a3 didSelectSuggestionButtonAtIndex:(unint64_t)a4;
- (void)headerViewDidDeleteText;
- (void)headerViewDidSelectSearchButton:(id)a3;
- (void)loadMoreFooterDidTapLogo;
- (void)loadView;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)performSearchWithQueryString:(id)a3 requestType:(int64_t)a4;
- (void)performZKWSearchQuery;
- (void)previewingContext:(id)a3 commitViewController:(id)a4;
- (void)resetContent;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)searchModel:(id)a3 insertedResultsAtIndexPaths:(id)a4 removedResultsAtIndexPaths:(id)a5;
- (void)searchModelUpdatedPredictedSuggestions:(id)a3;
- (void)sendVisibleResultsFeedback;
- (void)setSelectionDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContentOffset:(double)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
- (void)willResignActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation STSPicker

- (STSPicker)initWithSearchModel:(id)a3 showSuggestions:(BOOL)a4
{
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)STSPicker;
  v8 = [(STSPicker *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_searchModel, a3);
    v9->_showSuggestions = a4;
    [(STSSearchModel *)v9->_searchModel setDelegate:v9];
    v9->_sectionsTag = 0;
    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    lastInsertedIndexesWaitingToLoad = v9->_lastInsertedIndexesWaitingToLoad;
    v9->_lastInsertedIndexesWaitingToLoad = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    displayedResults = v9->_displayedResults;
    v9->_displayedResults = (NSMutableArray *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.messages.picker.displayedresultsq", 0);
    displayedResultsQueue = v9->_displayedResultsQueue;
    v9->_displayedResultsQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = objc_opt_new();
    visibleResultsSent = v9->_visibleResultsSent;
    v9->_visibleResultsSent = (NSMutableSet *)v16;

    v9->_isSnapShotting = 0;
    v9->_debugMode = 0;
    uint64_t v18 = [MEMORY[0x263EFF980] array];
    debugItems = v9->_debugItems;
    v9->_debugItems = (NSMutableArray *)v18;
  }
  return v9;
}

- (void)didReceiveMemoryWarning
{
  v4.receiver = self;
  v4.super_class = (Class)STSPicker;
  [(STSPicker *)&v4 didReceiveMemoryWarning];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Clear image cache for memory warning", v3, 2u);
  }
  v2 = +[STSImageCache sharedCache];
  [v2 clearInMemoryCache];
}

- (void)loadView
{
  v3 = STSLocalizedString(@"POPULAR_RESULTS_TITLE");
  [(STSPicker *)self setTitle:v3];

  v17 = objc_alloc_init(STSPickerView);
  objc_super v4 = [(STSPickerView *)v17 collectionView];
  v5 = [MEMORY[0x263F825C8] clearColor];
  [v4 setBackgroundColor:v5];

  v6 = [(STSPickerView *)v17 collectionView];
  [v6 setScrollsToTop:1];

  id v7 = [(STSPickerView *)v17 collectionView];
  [v7 setDataSource:self];

  v8 = [(STSPickerView *)v17 collectionView];
  [v8 setDelegate:self];

  v9 = [(STSPickerView *)v17 collectionView];
  [v9 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"STSGridLayoutElementKindHeader" withReuseIdentifier:@"STSGridLayoutElementKindHeader"];

  uint64_t v10 = [(STSPickerView *)v17 collectionView];
  [v10 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"STSGridLayoutElementKindFooter" withReuseIdentifier:@"STSGridLayoutElementKindFooter"];

  v11 = [(STSPickerView *)v17 collectionView];
  [v11 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"STSImageCell"];

  uint64_t v12 = [(STSPickerView *)v17 collectionView];
  [v12 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"STSVideoCell"];

  v13 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__handleLongPress_];
  [v13 setMinimumPressDuration:0.75];
  dispatch_queue_t v14 = [(STSPickerView *)v17 collectionView];
  [v14 addGestureRecognizer:v13];

  if (STSIsInternalInstall())
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F82C38]) initWithTarget:self action:sel__handleDebugGesture_];
    [v15 setDirection:3];
    [v15 setNumberOfTouchesRequired:2];
    uint64_t v16 = [(STSPickerView *)v17 collectionView];
    [v16 addGestureRecognizer:v15];
  }
  [(STSPicker *)self setView:v17];
}

- (void)viewDidDisappear:(BOOL)a3
{
  displayedResultsQueue = self->_displayedResultsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__STSPicker_viewDidDisappear___block_invoke;
  block[3] = &unk_264A053F0;
  block[4] = self;
  dispatch_async(displayedResultsQueue, block);
}

uint64_t __30__STSPicker_viewDidDisappear___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1112) removeAllObjects];
}

- (void)willMoveToParentViewController:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)STSPicker;
  -[STSPicker willMoveToParentViewController:](&v22, sel_willMoveToParentViewController_);
  v5 = [(STSSearchModel *)self->_searchModel sections];
  v6 = [v5 firstObject];
  id v7 = [v6 results];

  v8 = [(STSPicker *)self view];
  v9 = [v8 collectionView];
  uint64_t v10 = [v9 indexPathsForVisibleItems];
  if (a3)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __44__STSPicker_willMoveToParentViewController___block_invoke;
    v20[3] = &unk_264A054E0;
    v11 = &v21;
    v20[4] = self;
    objc_super v21 = v7;
    id v12 = v7;
    [v10 enumerateObjectsUsingBlock:v20];
  }
  else
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __44__STSPicker_willMoveToParentViewController___block_invoke_2;
    v17 = &unk_264A054E0;
    v11 = &v19;
    uint64_t v18 = self;
    v19 = v7;
    id v13 = v7;
    [v10 enumerateObjectsUsingBlock:&v14];

    v8 = +[STSImageCache sharedCache];
    [v8 clearInMemoryCache];
  }
}

void __44__STSPicker_willMoveToParentViewController___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = [*(id *)(a1 + 32) view];
  objc_super v4 = [v3 collectionView];
  v5 = [v4 cellForItemAtIndexPath:v12];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v12, "row"));
    id v7 = [v6 thumbnail];
    v8 = [v7 urlValue];
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v9 pickerView];
    v11 = [v10 collectionView];
    [v9 _fetchImageWithURL:v8 priority:0 forCollectionView:v11 atIndexPath:v12];
  }
}

void __44__STSPicker_willMoveToParentViewController___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [*(id *)(a1 + 32) view];
  objc_super v4 = [v3 collectionView];
  v5 = [v4 cellForItemAtIndexPath:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(v11, "row"));
    id v7 = [v6 thumbnail];
    v8 = [v7 urlValue];
    v9 = +[STSImageCache sharedCache];
    uint64_t v10 = [v9 fetchCachedStaticImageForURL:v8];
    [v5 setImage:v10];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4 = [(STSPicker *)self parentViewController];

  if (v4)
  {
    if (!self->_previewingContext)
    {
      v5 = [(STSPicker *)self traitCollection];
      uint64_t v6 = [v5 forceTouchCapability];

      if (v6 == 2)
      {
        id v11 = [(STSPicker *)self view];
        id v7 = [v11 collectionView];
        v8 = [(STSPicker *)self registerForPreviewingWithDelegate:self sourceView:v7];
        previewingContext = self->_previewingContext;
        self->_previewingContext = v8;
      }
    }
  }
  else
  {
    uint64_t v10 = [(STSPicker *)self view];
    [v10 setOverlayView:0];

    if (self->_previewingContext)
    {
      -[STSPicker unregisterForPreviewingWithContext:](self, "unregisterForPreviewingWithContext:");
    }
  }
}

- (void)viewDidLayoutSubviews
{
  if (self->_needsReloadAfterLayout)
  {
    self->_needsReloadAfterLayout = 0;
    v3 = [(STSPicker *)self view];
    objc_super v4 = [v3 collectionView];
    [v4 reloadData];
  }
  v5 = [(STSPicker *)self view];
  [v5 frame];
  -[STSPicker _updatePredictedSuggestionsForSize:](self, "_updatePredictedSuggestionsForSize:", v6, v7);

  if (!self->_isSnapShotting)
  {
    [(STSPicker *)self sendVisibleResultsFeedback];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  -[STSPicker _updatePredictedSuggestionsForSize:](self, "_updatePredictedSuggestionsForSize:", width, height);
  [v7 animateAlongsideTransition:0 completion:0];
  v8.receiver = self;
  v8.super_class = (Class)STSPicker;
  -[STSPicker viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  if (!a3)
  {
    objc_super v4 = [(STSPicker *)self presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v6 = [(STSPicker *)self presentedViewController];
      [v6 dismissViewControllerAnimated:0 completion:0];
    }
  }
}

- (void)willResignActiveWithConversation:(id)a3
{
}

- (id)snapshotImage
{
  self->_isSnapShotting = 1;
  v3 = [(STSPicker *)self view];
  [v3 scrollToTopWithAnimation:0];

  objc_super v4 = [(STSPicker *)self view];
  v5 = [v4 collectionView];
  [v5 setHidden:1];

  id v6 = [(STSPicker *)self view];
  id v7 = [v6 overlayView];
  [v7 setHidden:1];

  BOOL showSuggestions = self->_showSuggestions;
  self->_BOOL showSuggestions = 0;
  v9 = [(STSPicker *)self view];
  uint64_t v10 = [v9 headerView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v12 = [(STSPicker *)self view];
    id v13 = [v12 headerView];

    [v13 setTopSuggestions:0];
    [v13 setBottomSuggestions:0];
    uint64_t v14 = [(STSPicker *)self view];
    [v14 setNeedsLayout];

    uint64_t v15 = [(STSPicker *)self view];
    [v15 layoutIfNeeded];
  }
  uint64_t v16 = [(STSPicker *)self view];
  [v16 bounds];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  double v22 = v21;
  double v24 = v23;

  v25 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v22, v24);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __26__STSPicker_snapshotImage__block_invoke;
  v34[3] = &unk_264A058B8;
  v34[5] = v18;
  v34[6] = v20;
  *(double *)&v34[7] = v22;
  *(double *)&v34[8] = v24;
  v34[4] = self;
  v26 = [v25 imageWithActions:v34];
  self->_BOOL showSuggestions = showSuggestions;
  v27 = [(STSPicker *)self view];
  v28 = [v27 collectionView];
  [v28 setHidden:0];

  v29 = [(STSPicker *)self view];
  v30 = [v29 overlayView];
  [v30 setHidden:0];

  -[STSPicker _updatePredictedSuggestionsForSize:](self, "_updatePredictedSuggestionsForSize:", v22, v24);
  v31 = [(STSPicker *)self view];
  [v31 setNeedsLayout];

  v32 = [(STSPicker *)self view];
  [v32 layoutIfNeeded];

  self->_isSnapShotting = 0;

  return v26;
}

void __26__STSPicker_snapshotImage__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F825C8];
  id v4 = a2;
  v5 = objc_msgSend(v3, "sts_defaultBackgroundColor");
  [v5 setFill];

  objc_msgSend(v4, "fillRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v6 = [*(id *)(a1 + 32) view];
  objc_msgSend(v6, "drawViewHierarchyInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)performZKWSearchQuery
{
  currentQuery = self->_currentQuery;
  self->_currentQuery = 0;

  displayedResultsQueue = self->_displayedResultsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__STSPicker_performZKWSearchQuery__block_invoke;
  block[3] = &unk_264A053F0;
  block[4] = self;
  dispatch_async(displayedResultsQueue, block);
  v5 = [(STSPicker *)self view];
  [v5 setOverlayView:0];

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 1;
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __34__STSPicker_performZKWSearchQuery__block_invoke_2;
  v15[3] = &unk_264A058E0;
  v15[4] = self;
  v15[5] = v16;
  dispatch_after(v6, MEMORY[0x263EF83A0], v15);
  id v7 = [MEMORY[0x263F08C38] UUID];
  objc_storeStrong((id *)&self->_lastSearchId, v7);
  objc_initWeak(&location, self);
  searchModel = self->_searchModel;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__STSPicker_performZKWSearchQuery__block_invoke_3;
  v10[3] = &unk_264A05908;
  objc_copyWeak(&v13, &location);
  id v12 = v16;
  id v9 = v7;
  id v11 = v9;
  [(STSSearchModel *)searchModel performZKWSearchQueryWithCompletion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  _Block_object_dispose(v16, 8);
}

uint64_t __34__STSPicker_performZKWSearchQuery__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1112) removeAllObjects];
}

void __34__STSPicker_performZKWSearchQuery__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setShowActivityIndicator:v1];
}

void __34__STSPicker_performZKWSearchQuery__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v9 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_time_t v6 = WeakRetained;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  if (WeakRetained)
  {
    id v7 = [WeakRetained view];
    [v7 setShowActivityIndicator:0];

    if ([v6[123] isEqual:*(void *)(a1 + 32)])
    {
      if (a2)
      {
        objc_super v8 = [v6 view];
        [v8 scrollToTopWithAnimation:0];
      }
      else
      {
        objc_super v8 = [v6 _noticeTextForSearchError:v9];
        [v6 _presentNoticeWithText:v8];
      }
    }
  }
}

- (void)performSearchWithQueryString:(id)a3 requestType:(int64_t)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_currentQuery, a3);
  objc_super v8 = [(STSPicker *)self view];
  [v8 setOverlayView:0];

  displayedResultsQueue = self->_displayedResultsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__STSPicker_performSearchWithQueryString_requestType___block_invoke;
  block[3] = &unk_264A053F0;
  block[4] = self;
  dispatch_async(displayedResultsQueue, block);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 1;
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54__STSPicker_performSearchWithQueryString_requestType___block_invoke_2;
  v19[3] = &unk_264A058E0;
  v19[4] = self;
  v19[5] = v20;
  dispatch_after(v10, MEMORY[0x263EF83A0], v19);
  id v11 = [MEMORY[0x263F08C38] UUID];
  objc_storeStrong((id *)&self->_lastSearchId, v11);
  objc_initWeak(&location, self);
  searchModel = self->_searchModel;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__STSPicker_performSearchWithQueryString_requestType___block_invoke_3;
  v14[3] = &unk_264A05930;
  objc_copyWeak(v17, &location);
  uint64_t v16 = v20;
  id v13 = v11;
  id v15 = v13;
  v17[1] = (id)a4;
  [(STSSearchModel *)searchModel performSearchWithQueryString:v7 requestType:a4 completion:v14];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Block_object_dispose(v20, 8);
}

uint64_t __54__STSPicker_performSearchWithQueryString_requestType___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1112) removeAllObjects];
}

void __54__STSPicker_performSearchWithQueryString_requestType___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setShowActivityIndicator:v1];
}

void __54__STSPicker_performSearchWithQueryString_requestType___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v9 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_time_t v6 = WeakRetained;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  if (WeakRetained)
  {
    id v7 = [WeakRetained view];
    [v7 setShowActivityIndicator:0];

    if ([v6[123] isEqual:*(void *)(a1 + 32)])
    {
      if (a2)
      {
        if ((*(void *)(a1 + 56) | 4) != 5) {
          goto LABEL_8;
        }
        objc_super v8 = [v6 view];
        [v8 scrollToTopWithAnimation:0];
      }
      else
      {
        objc_super v8 = [v6 _noticeTextForSearchError:v9];
        [v6 _presentNoticeWithText:v8];
      }
    }
  }
LABEL_8:
}

- (void)cancelImageDownloads
{
  [(STSPicker *)self _cancelActiveDownload];
  v3 = +[STSImageCache sharedCache];
  [v3 cancelAllDownloads];

  queuedImageURLs = self->_queuedImageURLs;

  [(NSMutableSet *)queuedImageURLs removeAllObjects];
}

- (void)resetContent
{
  [(STSSearchModel *)self->_searchModel removeAllSections];
  id v3 = [(STSPicker *)self view];
  [v3 setOverlayView:0];
}

- (NSArray)querySuggestions
{
  return [(STSSearchModel *)self->_searchModel querySuggestions];
}

- (STSPickerView)pickerView
{
  [(STSPicker *)self loadViewIfNeeded];

  return (STSPickerView *)[(STSPicker *)self view];
}

- (void)updateContentOffset:(double)a3
{
  id v4 = [(STSPicker *)self pickerView];
  [v4 updateContentOffset:a3];
}

- (void)_handleLongPress:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    v5 = [(STSPicker *)self view];
    dispatch_time_t v6 = [v5 collectionView];
    id v7 = [(STSPicker *)self view];
    objc_super v8 = [v7 collectionView];
    [v4 locationInView:v8];
    id v9 = objc_msgSend(v6, "indexPathForItemAtPoint:");

    [(STSPicker *)self _presentDetailViewControllerForIndexPath:v9];
    unint64_t v10 = [v9 section];
    p_searchModel = &self->_searchModel;
    id v12 = [(STSSearchModel *)*p_searchModel sections];
    unint64_t v13 = [v12 count];

    if (v10 >= v13)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        -[STSPicker _handleLongPress:]((id *)p_searchModel, v10);
      }
    }
    else
    {
      uint64_t v14 = [(STSSearchModel *)*p_searchModel sections];
      id v15 = [v14 objectAtIndexedSubscript:v10];

      uint64_t v16 = [v15 results];
      char v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v9, "item"));

      uint64_t v18 = +[STSFeedbackReporter sharedInstance];
      [v18 didPreviewResultLongPress:v17];
    }
  }
}

- (void)_handleDebugGesture:(id)a3
{
  if (STSIsInternalInstall())
  {
    if (self->_debugMode)
    {
      self->_debugMode = 0;
      id v4 = [(STSPicker *)self pickerView];
      v5 = [v4 collectionView];
      [v5 setAllowsMultipleSelection:0];

      dispatch_time_t v6 = [(STSPicker *)self pickerView];
      id v7 = [v6 collectionView];
      [v7 setBackgroundColor:self->_originalColor];

      if ([(NSMutableArray *)self->_debugItems count])
      {
        objc_super v8 = [MEMORY[0x263F82418] alertControllerWithTitle:@"Open Tap-to-Radar" message:@"Report issue with selected images." preferredStyle:1];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __33__STSPicker__handleDebugGesture___block_invoke;
        v21[3] = &unk_264A05690;
        v21[4] = self;
        id v9 = [MEMORY[0x263F82400] actionWithTitle:@"Yes" style:0 handler:v21];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __33__STSPicker__handleDebugGesture___block_invoke_3;
        void v20[3] = &unk_264A05690;
        v20[4] = self;
        unint64_t v10 = [MEMORY[0x263F82400] actionWithTitle:@"No" style:0 handler:v20];
        [v8 addAction:v9];
        [v8 addAction:v10];
        [(STSPicker *)self presentViewController:v8 animated:1 completion:0];
      }
    }
    else
    {
      self->_debugMode = 1;
      id v11 = [(STSPicker *)self pickerView];
      id v12 = [v11 collectionView];
      unint64_t v13 = [v12 backgroundColor];
      originalColor = self->_originalColor;
      self->_originalColor = v13;

      id v15 = [(STSPicker *)self pickerView];
      uint64_t v16 = [v15 collectionView];
      char v17 = [MEMORY[0x263F825C8] purpleColor];
      [v16 setBackgroundColor:v17];

      id v19 = [(STSPicker *)self pickerView];
      uint64_t v18 = [v19 collectionView];
      [v18 setAllowsMultipleSelection:1];
    }
  }
}

void __33__STSPicker__handleDebugGesture___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  double v24 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v20 = 1152;
  id obj = *(id *)(*(void *)(a1 + 32) + 1152);
  uint64_t v25 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v29;
    char v21 = v27;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v28 + 1) + 8 * v2);
        id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "sections", v20, v21);
        v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v3, "section"));

        dispatch_time_t v6 = [v5 results];
        id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v3, "item"));

        objc_super v8 = [MEMORY[0x263EFF9A0] dictionary];
        id v9 = [v7 thumbnail];
        unint64_t v10 = [v9 urlValue];
        id v11 = [v10 absoluteString];
        [v8 setObject:v11 forKey:@"thumbnail"];

        id v12 = [v7 url];
        unint64_t v13 = [v12 absoluteString];
        [v8 setObject:v13 forKey:@"url"];

        [v24 addObject:v8];
        uint64_t v14 = [*(id *)(a1 + 32) pickerView];
        id v15 = [v14 collectionView];
        uint64_t v16 = [v15 cellForItemAtIndexPath:v3];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          v27[0] = __33__STSPicker__handleDebugGesture___block_invoke_2;
          v27[1] = &unk_264A05958;
          v27[2] = *(void *)(a1 + 32);
          v27[3] = v3;
          dispatch_async(MEMORY[0x263EF83A0], block);
        }

        ++v2;
      }
      while (v25 != v2);
      uint64_t v25 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v25);
  }

  uint64_t v18 = [*(id *)(a1 + 32) getTapToRadarPunchOut:v24];
  id v19 = [*(id *)(a1 + 32) extensionContext];
  [v19 openURL:v18 completionHandler:0];

  [*(id *)(*(void *)(a1 + 32) + v20) removeAllObjects];
}

void __33__STSPicker__handleDebugGesture___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pickerView];
  id v3 = [v2 collectionView];
  id v4 = [v3 cellForItemAtIndexPath:*(void *)(a1 + 40)];

  [v4 setDebugBadge:0];
}

uint64_t __33__STSPicker__handleDebugGesture___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 1152);
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v7 = [*(id *)(a1 + 32) pickerView];
        objc_super v8 = [v7 collectionView];
        id v9 = [v8 cellForItemAtIndexPath:v6];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          void block[2] = __33__STSPicker__handleDebugGesture___block_invoke_4;
          block[3] = &unk_264A05958;
          block[4] = *(void *)(a1 + 32);
          void block[5] = v6;
          dispatch_async(MEMORY[0x263EF83A0], block);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }

  return [*(id *)(*(void *)(a1 + 32) + 1152) removeAllObjects];
}

void __33__STSPicker__handleDebugGesture___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pickerView];
  uint64_t v3 = [v2 collectionView];
  id v4 = [v3 cellForItemAtIndexPath:*(void *)(a1 + 40)];

  [v4 setDebugBadge:0];
}

- (id)getTapToRadarPunchOut:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [NSString stringWithFormat:@"\n\n############################\n\n#IMAGES DEBUG INFO (PLEASE DO NOT EDIT):\n"];
  currentQuery = (__CFString *)self->_currentQuery;
  if (!currentQuery) {
    currentQuery = @"ZKW";
  }
  id v7 = [NSString stringWithFormat:@"\nQUERY:\n%@\n", currentQuery];
  objc_super v8 = [v5 stringByAppendingString:v7];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        unint64_t v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v14 = NSString;
        long long v15 = [v13 objectForKey:@"thumbnail"];
        long long v16 = [v14 stringWithFormat:@"\nTHUMBNAIL:\n%@\n", v15];
        long long v17 = [v8 stringByAppendingString:v16];

        uint64_t v18 = NSString;
        uint64_t v19 = [v13 objectForKey:@"url"];
        uint64_t v20 = [v18 stringWithFormat:@"\nORIGINAL:\n%@\n", v19];
        char v21 = [v17 stringByAppendingString:v20];

        double v22 = [NSString stringWithFormat:@"\n############################\n"];
        objc_super v8 = [v21 stringByAppendingString:v22];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v10);
  }

  id v23 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v23 setScheme:@"tap-to-radar"];
  [v23 setHost:@"new"];
  id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"ComponentName" value:@"Parsec Image Search"];
  [v24 addObject:v25];

  v26 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"ComponentVersion" value:@"1.0"];
  [v24 addObject:v26];

  v27 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"ComponentID" value:@"680051"];
  [v24 addObject:v27];

  long long v28 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Classification" value:@"Other Bug"];
  [v24 addObject:v28];

  long long v29 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Reproducibility" value:@"I Didn't Try"];
  [v24 addObject:v29];

  long long v30 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Description" value:v8];
  [v24 addObject:v30];

  [v23 setQueryItems:v24];
  long long v31 = [v23 URL];

  return v31;
}

- (void)searchModelUpdatedPredictedSuggestions:(id)a3
{
  id v4 = [(STSPicker *)self view];
  v5 = [v4 headerView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(STSPicker *)self view];
    [v7 frame];
    -[STSPicker _updatePredictedSuggestionsForSize:](self, "_updatePredictedSuggestionsForSize:", v8, v9);

    id v10 = [(STSPicker *)self view];
    [v10 setNeedsLayout];
  }
}

- (void)searchModel:(id)a3 insertedResultsAtIndexPaths:(id)a4 removedResultsAtIndexPaths:(id)a5
{
  id v28 = a4;
  id v7 = a5;
  self->_isLoadingMoreResults = 0;
  double v8 = [(STSPicker *)self _loadMoreFooter];
  [v8 setLoading:0];

  if ([v28 count])
  {
    self->_lastInsertedIndexesCount = [v28 count];
    [(NSMutableSet *)self->_lastInsertedIndexesWaitingToLoad removeAllObjects];
    [(NSMutableSet *)self->_lastInsertedIndexesWaitingToLoad addObjectsFromArray:v28];
  }
  double v9 = [(STSPicker *)self view];
  id v10 = [v9 collectionView];
  [v10 bounds];
  BOOL IsEmpty = CGRectIsEmpty(v30);

  if (IsEmpty)
  {
    self->_needsReloadAfterLayout = 1;
  }
  else
  {
    if (![v7 count]) {
      goto LABEL_18;
    }
    id v12 = [(STSPicker *)self view];
    unint64_t v13 = [v12 collectionView];
    unint64_t v14 = [v13 numberOfItemsInSection:0];
    unint64_t v15 = [v7 count];

    if (v14 > v15)
    {
      long long v16 = [(STSPicker *)self view];
      long long v17 = [v16 collectionView];
      [v17 reloadData];
    }
    else
    {
LABEL_18:
      if ([v28 count])
      {
        uint64_t v18 = [(STSPicker *)self view];
        uint64_t v19 = [v18 collectionView];
        [v19 reloadData];

        [(STSPicker *)self sendVisibleResultsFeedback];
      }
    }
  }
  uint64_t v20 = [(STSSearchModel *)self->_searchModel sections];
  char v21 = [v20 firstObject];
  double v22 = [v21 results];
  if ([v22 count])
  {
    +[STSLoadMoreFooter defaultHeight];
    double v24 = v23;
  }
  else
  {
    double v24 = 0.0;
  }

  uint64_t v25 = [(STSPicker *)self view];
  v26 = [v25 collectionView];
  v27 = [v26 collectionViewLayout];
  [v27 setFooterHeight:v24];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  uint64_t v3 = [(STSSearchModel *)self->_searchModel sections];
  int64_t v4 = [v3 count];

  if (v4 <= 1) {
    return 1;
  }
  else {
    return v4;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t v4 = [(STSSearchModel *)self->_searchModel sections];
  v5 = [v4 firstObject];
  uint64_t v6 = [v5 results];
  int64_t v7 = [v6 count];

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(STSSearchModel *)self->_searchModel sections];
  unint64_t v9 = [v8 count];
  if (v9 <= [v7 section])
  {
    unint64_t v15 = [v6 dequeueReusableCellWithReuseIdentifier:@"STSImageCell" forIndexPath:v7];
    uint64_t v19 = objc_msgSend(MEMORY[0x263F825C8], "sts_defaultCellPlaceholderColor");
    [v15 setPlaceholderColor:v19];

    goto LABEL_40;
  }
  id v10 = [(STSSearchModel *)self->_searchModel sections];
  v57 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

  v56 = [v57 results];
  unint64_t v11 = [v56 count];
  if (v11 > [v7 item])
  {
    id v12 = [v57 results];
    unint64_t v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

    v53 = objc_msgSend(v13, "sts_badge");
    v55 = [v13 thumbnail];
    v54 = [v55 urlValue];
    v52 = objc_msgSend(v13, "sts_descriptionText");
    unint64_t v14 = [v13 resultType];
    LODWORD(v12) = [v14 isEqualToString:@"image_search"];

    if (v12)
    {
      unint64_t v15 = [v6 dequeueReusableCellWithReuseIdentifier:@"STSImageCell" forIndexPath:v7];
      long long v16 = +[STSImageCache sharedCache];
      id v51 = [v16 fetchCachedImageInfoForURL:v54];

      [v15 setCategory:0];
      if (STSIsInternalInstall())
      {
        [v15 setDebugBadge:0];
        if ([(NSMutableArray *)self->_debugItems containsObject:v7])
        {
          long long v17 = [MEMORY[0x263F827E8] imageNamed:@"feedback-selected-icon"];
          [v15 setDebugBadge:v17];
        }
      }
      if (v51)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v71 = v51;
          _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Cache Hit: imageInfo %@", buf, 0xCu);
        }
        uint64_t v18 = objc_msgSend(MEMORY[0x263F827E8], "agif_animatedImageWithImageInfo:", v51);
        [v15 setImage:v18];
        [(NSMutableSet *)self->_lastInsertedIndexesWaitingToLoad removeObject:v7];
      }
      else
      {
        char v69 = 0;
        long long v36 = +[STSImageCache sharedCache];
        long long v37 = [v36 fetchCachedStaticImageForURL:v54 hasMultipleFrames:&v69];

        [v15 setImage:v37];
        if (!v37 || v69)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v71 = v54;
            _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Cache Miss: fetching %@", buf, 0xCu);
          }
          [(STSPicker *)self _fetchImageWithURL:v54 priority:0 forCollectionView:v6 atIndexPath:v7];
        }
      }
      if (v52)
      {
        [v15 setAccessibilityTraits:*MEMORY[0x263F83288]];
        [v15 setIsAccessibilityElement:1];
        [v15 setAccessibilityValue:v52];
      }
      else
      {
        [v15 setAccessibilityValue:0];
        [v15 setAccessibilityTraits:*MEMORY[0x263F83270]];
      }
      v38 = [v13 secondaryTitle];

      if (v38)
      {
        uint64_t v39 = [v13 secondaryTitle];
        [v15 setCategory:v39];
      }
      if ([(NSIndexPath *)self->_activeDownloadIndexPath isEqual:v7])
      {
        [v15 setDownloadProgress:self->_activeDownloadProgress];
        [v15 setShowDownloadIndicator:0 animated:1.0];
      }
    }
    else
    {
      char v21 = [v13 resultType];
      int v22 = [v21 isEqualToString:@"web_video"];

      if (!v22)
      {
        unint64_t v15 = 0;
        goto LABEL_32;
      }
      unint64_t v15 = [v6 dequeueReusableCellWithReuseIdentifier:@"STSVideoCell" forIndexPath:v7];
      double v23 = [v13 title];
      double v24 = [v23 text];
      [v15 setTitle:v24];

      uint64_t v25 = objc_opt_new();
      v26 = [v13 descriptions];
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke;
      v67[3] = &unk_264A059A8;
      id v51 = v25;
      id v68 = v51;
      [v26 enumerateObjectsUsingBlock:v67];

      [v15 setCategory:0];
      v50 = [v51 componentsJoinedByString:@"\n"];
      [v15 setSubtitle:v50];
      v27 = objc_msgSend(v13, "sts_videoDuration");
      [v15 setDuration:v27];

      id v28 = objc_msgSend(v13, "sts_providerName");
      [v15 setProviderName:v28];

      [v15 setProviderIcon:0];
      long long v29 = [MEMORY[0x263F82B60] mainScreen];
      [v29 scale];
      double v31 = v30;
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_3;
      v64[3] = &unk_264A059F8;
      id v49 = v6;
      id v65 = v49;
      id v32 = v7;
      id v66 = v32;
      objc_msgSend(v13, "sts_providerIconWithScale:completion:", v64, v31);

      objc_initWeak((id *)buf, self);
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_5;
      v61[3] = &unk_264A05A20;
      objc_copyWeak(&v63, (id *)buf);
      id v33 = v32;
      id v62 = v33;
      [v15 setPlayButtonAction:v61];
      long long v34 = +[STSImageCache sharedCache];
      long long v35 = [v34 fetchCachedStaticImageForURL:v54];

      [v15 setImage:v35];
      if (!v35) {
        [(STSPicker *)self _fetchImageWithURL:v54 priority:0 forCollectionView:v49 atIndexPath:v33];
      }

      objc_destroyWeak(&v63);
      objc_destroyWeak((id *)buf);
    }
LABEL_32:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v40 = (void *)MEMORY[0x263F825C8],
          [v55 keyColor],
          v41 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v40, "sts_colorFromHexString:alpha:", v41, 1.0),
          v42 = objc_claimAutoreleasedReturnValue(),
          v41,
          !v42))
    {
      v42 = objc_msgSend(MEMORY[0x263F825C8], "sts_defaultCellPlaceholderColor");
    }
    [v15 setPlaceholderColor:v42];
    v43 = [v53 imageData];
    if (v43)
    {
      v44 = (void *)MEMORY[0x263F827E8];
      v45 = [MEMORY[0x263F82B60] mainScreen];
      [v45 scale];
      v46 = objc_msgSend(v44, "imageWithData:scale:", v43);

      [v15 setBadge:v46];
    }
    else
    {
      [v15 setBadge:0];
      v47 = objc_msgSend(v13, "sts_badge");
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_6;
      v58[3] = &unk_264A05A48;
      id v59 = v6;
      id v60 = v7;
      [v47 loadImageDataWithCompletionAndErrorHandler:v58];

      v46 = v59;
    }

    goto LABEL_39;
  }
  unint64_t v15 = [v6 dequeueReusableCellWithReuseIdentifier:@"STSImageCell" forIndexPath:v7];
  uint64_t v20 = objc_msgSend(MEMORY[0x263F825C8], "sts_defaultCellPlaceholderColor");
  [v15 setPlaceholderColor:v20];

LABEL_39:
LABEL_40:

  return v15;
}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 formattedTextPieces];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v4[3] = &unk_264A05980;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 text];
  [v2 addObject:v3];
}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  void block[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_4;
  block[3] = &unk_264A059D0;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cellForItemAtIndexPath:*(void *)(a1 + 40)];
  [v2 setProviderIcon:*(void *)(a1 + 48)];
}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _presentDetailViewControllerForIndexPath:*(void *)(a1 + 32)];
}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_6(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = (void *)MEMORY[0x263F827E8];
    id v4 = (void *)MEMORY[0x263F82B60];
    id v5 = a2;
    id v6 = [v4 mainScreen];
    [v6 scale];
    id v7 = objc_msgSend(v3, "imageWithData:scale:", v5);

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    void block[2] = __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_7;
    block[3] = &unk_264A059D0;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v12 = v7;
    id v8 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __51__STSPicker_collectionView_cellForItemAtIndexPath___block_invoke_7(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cellForItemAtIndexPath:*(void *)(a1 + 40)];
  [v2 setBadge:*(void *)(a1 + 48)];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([a4 isEqualToString:@"STSGridLayoutElementKindFooter"])
  {
    id v10 = [v8 dequeueReusableSupplementaryViewOfKind:@"STSGridLayoutElementKindFooter" withReuseIdentifier:@"STSGridLayoutElementKindFooter" forIndexPath:v9];
    [v10 setLoading:self->_isLoadingMoreResults];
    [v10 setDelegate:self];
    id v11 = +[STSImageCache sharedCache];
    id v12 = [v11 searchProviderImage];
    [v10 setSearchProviderImage:v12];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (int64_t)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(STSSearchModel *)self->_searchModel sections];
  unint64_t v8 = [v7 count];
  unint64_t v9 = [v6 section];

  if (v8 <= v9)
  {
    int64_t v19 = 1;
  }
  else
  {
    id v10 = [(STSSearchModel *)self->_searchModel sections];
    id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

    unint64_t v12 = [v6 item];
    unint64_t v13 = [v11 results];
    unint64_t v14 = [v13 count];

    if (v12 >= v14)
    {
      int64_t v19 = 1;
    }
    else
    {
      unint64_t v15 = [v11 results];
      long long v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

      long long v17 = [v16 resultType];
      int v18 = [v17 isEqualToString:@"web_video"];

      int64_t v19 = v18 ^ 1u;
    }
  }
  return v19;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (self->_debugMode)
  {
    [(NSMutableArray *)self->_debugItems addObject:v6];
    id v7 = [v18 cellForItemAtIndexPath:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_15;
    }
    unint64_t v9 = [v18 cellForItemAtIndexPath:v6];
    id v10 = [MEMORY[0x263F827E8] imageNamed:@"feedback-selected-icon"];
    [v9 setDebugBadge:v10];
    goto LABEL_13;
  }
  char v11 = [(NSIndexPath *)self->_activeDownloadIndexPath isEqual:v6];
  [(STSPicker *)self _cancelActiveDownload];
  unint64_t v9 = [(STSSearchModel *)self->_searchModel sections];
  unint64_t v12 = [v9 count];
  if (v12 > [v6 section])
  {
    id v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "section"));
    unint64_t v13 = [v10 results];
    unint64_t v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

    unint64_t v15 = [v14 secondaryTitle];

    if (v15)
    {
      long long v16 = [(STSPicker *)self selectionDelegate];
      [v16 browser:self didSelectCategoryResult:v14];
    }
    else
    {
      if (v6) {
        char v17 = v11;
      }
      else {
        char v17 = 1;
      }
      if ((v17 & 1) == 0) {
        [(STSPicker *)self _beginDownloadingResultAtIndexPath:v6];
      }
    }

LABEL_13:
  }

LABEL_15:
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self->_debugMode)
  {
    [(NSMutableArray *)self->_debugItems removeObject:v6];
    id v7 = [v10 cellForItemAtIndexPath:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      unint64_t v9 = [v10 cellForItemAtIndexPath:v6];
      [v9 setDebugBadge:0];
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v13 = a3;
  [(STSPicker *)self _cancelActiveDownload];
  id v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    id v6 = [(STSPicker *)self view];
    [v6 updateHeaderPositionOnScroll];
  }
  id v7 = [(STSPicker *)self selectionDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    unint64_t v9 = [(STSPicker *)self selectionDelegate];
    [v9 browserDidScroll:self];
  }
  [(STSPicker *)self _loadMoreResultsIfNecessary];
  [v13 contentOffset];
  if (v10 - self->_startScrollPosition.y > 50.0)
  {
    [(STSPicker *)self sendVisibleResultsFeedback];
    [v13 contentOffset];
    self->_startScrollPosition.x = v11;
    self->_startScrollPosition.y = v12;
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STSPicker *)self view];
  [v5 updateHeaderPositionOnDraggingBegan];

  self->_isScrolling = 1;
  self = (STSPicker *)((char *)self + 1120);
  [v4 contentOffset];
  id v7 = v6;
  uint64_t v9 = v8;

  self->super.super.super.isa = v7;
  *(void *)&self->super.super._responderFlags = v9;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(STSPicker *)self view];
  objc_msgSend(v7, "updateHeaderPositionOnDraggingEndedWithVelocity:", x, y);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = [(STSPicker *)self view];
  [v4 updateHeaderPositionOnDecelerationEnded];

  self->_isScrolling = 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v24 = v7;
  uint64_t v9 = [v24 imageInfo];
  if (v9)
  {
LABEL_2:

    goto LABEL_4;
  }
  double v10 = [v24 image];

  if (!v10)
  {
    uint64_t v9 = [(STSSearchModel *)self->_searchModel sections];
    unint64_t v11 = [v9 count];
    if (v11 > [v8 section])
    {
      CGFloat v12 = [(STSSearchModel *)self->_searchModel sections];
      id v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));

      unint64_t v14 = [v13 results];
      unint64_t v15 = [v14 count];
      if (v15 > [v8 item])
      {
        long long v16 = [v13 results];
        char v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v8, "item"));

        id v18 = [v17 thumbnail];
        int64_t v19 = [v18 urlValue];
        uint64_t v20 = +[STSImageCache sharedCache];
        char v21 = [v20 fetchCachedImageInfoForURL:v19];

        if (v21)
        {
          int v22 = objc_msgSend(MEMORY[0x263F827E8], "agif_animatedImageWithImageInfo:", v21);
        }
        else
        {
          double v23 = +[STSImageCache sharedCache];
          int v22 = [v23 fetchCachedStaticImageForURL:v19];
        }
        [v24 setImage:v22];
      }
    }
    goto LABEL_2;
  }
LABEL_4:
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v16 = a5;
  id v6 = [(STSSearchModel *)self->_searchModel sections];
  id v7 = [v6 firstObject];

  unint64_t v8 = [v16 row];
  uint64_t v9 = [v7 results];
  unint64_t v10 = [v9 count];

  if (v8 < v10)
  {
    unint64_t v11 = [v7 results];
    CGFloat v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v16, "row"));

    id v13 = [v12 thumbnail];
    unint64_t v14 = [v13 urlValue];
    unint64_t v15 = +[STSImageCache sharedCache];
    [v15 setPriority:-8 forQueuedDownloadWithURL:v14];
  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(STSPicker *)self view];
  unint64_t v10 = [v9 collectionView];
  unint64_t v11 = [v10 cellForItemAtIndexPath:self->_detailResultIndexPath];

  CGFloat v12 = [(STSPicker *)self view];
  id v13 = [v12 collectionView];
  unint64_t v14 = [v13 layoutAttributesForItemAtIndexPath:self->_detailResultIndexPath];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = [(STSPicker *)self view];
  id v24 = [(STSPicker *)self view];
  uint64_t v25 = [v24 collectionView];
  objc_msgSend(v23, "convertRect:fromView:", v25, v16, v18, v20, v22);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;

  id v34 = objc_alloc(MEMORY[0x263F82828]);
  long long v35 = objc_msgSend(v34, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v35 setClipsToBounds:1];
  [v35 setContentMode:2];
  long long v36 = [v11 image];
  [v35 setImage:v36];

  long long v37 = objc_alloc_init(STSDetailTransitionAnimator);
  detailTransitionAnimator = self->_detailTransitionAnimator;
  self->_detailTransitionAnimator = v37;

  [(STSDetailTransitionAnimator *)self->_detailTransitionAnimator setSnapshotView:v35];
  uint64_t v39 = self->_detailTransitionAnimator;
  [v11 imageInsets];
  -[STSDetailTransitionAnimator setSourceInsets:](v39, "setSourceInsets:");
  -[STSDetailTransitionAnimator setSourceFrame:](self->_detailTransitionAnimator, "setSourceFrame:", v27, v29, v31, v33);
  v40 = self->_detailTransitionAnimator;
  v41 = [v8 view];
  [v41 bounds];
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  v50 = [v8 traitCollection];

  objc_msgSend(v7, "contentFrameForBounds:traitCollection:", v50, v43, v45, v47, v49);
  -[STSDetailTransitionAnimator setPresentedFrame:](v40, "setPresentedFrame:");

  [(STSDetailTransitionAnimator *)self->_detailTransitionAnimator setPresenting:1];
  id v51 = self->_detailTransitionAnimator;

  return v51;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STSPicker *)self view];
  id v6 = [v5 collectionView];
  id v7 = [v6 layoutAttributesForItemAtIndexPath:self->_detailResultIndexPath];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = [(STSPicker *)self view];
  double v17 = [(STSPicker *)self view];
  double v18 = [v17 collectionView];
  objc_msgSend(v16, "convertRect:fromView:", v18, v9, v11, v13, v15);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  -[STSDetailTransitionAnimator setSourceFrame:](self->_detailTransitionAnimator, "setSourceFrame:", v20, v22, v24, v26);
  detailTransitionAnimator = self->_detailTransitionAnimator;
  double v28 = [v4 view];
  [v28 bounds];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  long long v37 = [v4 traitCollection];
  objc_msgSend(v4, "contentFrameForBounds:traitCollection:", v37, v30, v32, v34, v36);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;

  -[STSDetailTransitionAnimator setPresentedFrame:](detailTransitionAnimator, "setPresentedFrame:", v39, v41, v43, v45);
  [(STSDetailTransitionAnimator *)self->_detailTransitionAnimator setPresenting:0];
  double v46 = self->_detailTransitionAnimator;

  return v46;
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = [(STSPicker *)self selectionDelegate];
  int v9 = [v8 browserIsPresentedFullscreen:self];

  if (v9)
  {
    double v10 = [(STSPicker *)self view];
    double v11 = [v10 collectionView];
    double v12 = objc_msgSend(v11, "indexPathForItemAtPoint:", x, y);

    if (v12)
    {
      [(STSPicker *)self _cancelActiveDownload];
      double v13 = [(STSPicker *)self _detailViewControllerForIndexPath:v12];
      [v13 setModalTransitionStyle:2];
      [v13 setModalPresentationStyle:6];
      [v13 setIsFullscreen:0];
      double v14 = [(STSPicker *)self view];
      double v15 = [v14 collectionView];
      double v16 = [v15 layoutAttributesForItemAtIndexPath:v12];
      [v16 frame];
      objc_msgSend(v7, "setSourceRect:");

      objc_storeStrong((id *)&self->_detailResultIndexPath, v12);
      double v17 = [(STSSearchModel *)self->_searchModel sections];
      double v18 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v12, "section"));

      double v19 = [v18 results];
      objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v12, "item"));
      double v20 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();

      double v21 = +[STSFeedbackReporter sharedInstance];
      [v21 didPreviewResult:v20 peek:1];

      previewingSearchResult = self->_previewingSearchResult;
      self->_previewingSearchResult = v20;
    }
    else
    {
      double v13 = 0;
    }
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v5 = a4;
  [v5 setUseBackgroundBlur:1];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__STSPicker_previewingContext_commitViewController___block_invoke;
  v9[3] = &unk_264A053F0;
  id v6 = v5;
  id v10 = v6;
  [(STSPicker *)self presentViewController:v6 animated:0 completion:v9];
  if (self->_previewingSearchResult)
  {
    id v7 = +[STSFeedbackReporter sharedInstance];
    [v7 didPreviewResult:self->_previewingSearchResult peek:0];

    previewingSearchResult = self->_previewingSearchResult;
    self->_previewingSearchResult = 0;
  }
}

uint64_t __52__STSPicker_previewingContext_commitViewController___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setIsFullscreen:1];
  }
  return result;
}

- (void)detailViewControllerDidSelectProviderLink:(id)a3
{
  id v4 = [(STSSearchModel *)self->_searchModel sections];
  id v8 = [v4 firstObject];

  id v5 = [v8 results];
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", -[NSIndexPath row](self->_detailResultIndexPath, "row"));

  id v7 = [(STSPicker *)self selectionDelegate];
  [v7 browser:self didSelectProviderLink:v6];
}

- (void)detailViewControllerDidInsert:(id)a3
{
  id v4 = a3;
  uint64_t detailResultIndexPath = (uint64_t)self->_detailResultIndexPath;
  if (detailResultIndexPath)
  {
    id v6 = v4;
    uint64_t detailResultIndexPath = [(id)detailResultIndexPath isEqual:self->_activeDownloadIndexPath];
    id v4 = v6;
    if ((detailResultIndexPath & 1) == 0)
    {
      [(STSPicker *)self _cancelActiveDownload];
      uint64_t detailResultIndexPath = [(STSPicker *)self _beginDownloadingResultAtIndexPath:self->_detailResultIndexPath];
      id v4 = v6;
    }
  }

  MEMORY[0x270F9A758](detailResultIndexPath, v4);
}

- (void)detailViewControllerDidReportConcern:(id)a3 result:(id)a4 punchout:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int v9 = +[STSFeedbackReporter sharedInstance];
  [v9 didReportConcern:v7 punchout:v8];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__STSPicker_detailViewControllerDidReportConcern_result_punchout___block_invoke;
  v11[3] = &unk_264A05958;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

uint64_t __66__STSPicker_detailViewControllerDidReportConcern_result_punchout___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) removeResultAtIndexPath:*(void *)(*(void *)(a1 + 32) + 1040)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 976);

  return [v3 addSearchResultToReportConcernStore:v2];
}

- (void)headerViewDidSelectSearchButton:(id)a3
{
  id v4 = [(STSPicker *)self selectionDelegate];
  [v4 browserSearchBarButtonClicked:self];
}

- (void)headerDidSelectCancelButton:(id)a3
{
  id v4 = [(STSPicker *)self selectionDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(STSPicker *)self selectionDelegate];
    [v6 browserSearchBarCancelButtonClicked:self];
  }
}

- (void)headerViewDidDeleteText
{
  id v2 = [(STSPicker *)self selectionDelegate];
  [v2 browserDidDeleteQuery];
}

- (void)headerView:(id)a3 didSearchFor:(id)a4
{
  id v5 = a4;
  id v6 = [(STSPicker *)self selectionDelegate];
  [v6 browser:self didSearchFor:v5];
}

- (void)headerView:(id)a3 didRequestCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(STSPicker *)self selectionDelegate];
  [v6 browser:self requestSuggestionsFor:v5];
}

- (void)headerView:(id)a3 didSelectSuggestionButtonAtIndex:(unint64_t)a4
{
  id v6 = a3;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = v6;
    BOOL v7 = [(NSArray *)self->_visiblePredictions count] > a4;
    id v6 = v10;
    if (v7)
    {
      id v8 = [(NSArray *)self->_visiblePredictions objectAtIndexedSubscript:a4];
      int v9 = [(STSPicker *)self selectionDelegate];
      [v9 browserSuggestionButtonClicked:self suggestion:v8];

      id v6 = v10;
    }
  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__STSPicker_mailComposeController_didFinishWithResult_error___block_invoke;
  v9[3] = &unk_264A05A70;
  double v11 = self;
  int64_t v12 = a4;
  id v10 = v7;
  id v8 = v7;
  [(STSPicker *)self dismissViewControllerAnimated:1 completion:v9];
}

void __61__STSPicker_mailComposeController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 3)
  {
    id v2 = (void *)MEMORY[0x263F82418];
    id v3 = STSLocalizedString(@"COULD_NOT_SEND_FEEDBACK_ALERT_TITLE");
    id v4 = [*(id *)(a1 + 32) description];
    id v8 = [v2 alertControllerWithTitle:v3 message:v4 preferredStyle:1];

    id v5 = (void *)MEMORY[0x263F82400];
    id v6 = STSLocalizedString(@"OK");
    id v7 = [v5 actionWithTitle:v6 style:0 handler:0];

    [v8 addAction:v7];
    [*(id *)(a1 + 40) presentViewController:v8 animated:1 completion:0];
  }
}

- (void)loadMoreFooterDidTapLogo
{
  id v3 = [(STSPicker *)self selectionDelegate];
  [v3 browserDidTapLogo:self];
}

- (void)_fetchImageWithURL:(id)a3 priority:(int64_t)a4 forCollectionView:(id)a5 atIndexPath:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = +[STSImageCache sharedCache];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "fetching url %@", (uint8_t *)&buf, 0xCu);
  }
  objc_initWeak(&location, self);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  double v35 = __Block_byref_object_copy__1;
  double v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  double v14 = +[STSImageCache sharedCache];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __71__STSPicker__fetchImageWithURL_priority_forCollectionView_atIndexPath___block_invoke;
  v26[3] = &unk_264A05A98;
  id v27 = v10;
  objc_copyWeak(&v30, &location);
  p_long long buf = &buf;
  double v29 = v31;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __71__STSPicker__fetchImageWithURL_priority_forCollectionView_atIndexPath___block_invoke_143;
  v18[3] = &unk_264A05AE8;
  double v23 = v31;
  id v15 = v27;
  id v19 = v15;
  double v24 = &buf;
  objc_copyWeak(&v25, &location);
  id v16 = v12;
  id v20 = v16;
  id v17 = v11;
  id v21 = v17;
  double v22 = self;
  [v14 fetchImageWithURL:v15 priority:a4 isSource:0 begin:v26 progress:0 completion:v18];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v30);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

void __71__STSPicker__fetchImageWithURL_priority_forCollectionView_atIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v15 = 138412290;
    uint64_t v16 = v2;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Begin downloading image at URL: %@", (uint8_t *)&v15, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained) {
    id v5 = (void *)*((void *)WeakRetained + 122);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = [v6 currentQuery];
  id v8 = +[STSFeedbackReporter sharedInstance];
  if (v7) {
    int v9 = v7;
  }
  else {
    int v9 = &stru_26E2ACAA8;
  }
  uint64_t v10 = objc_msgSend(v8, "didStartNetworkRequest:query:queryId:", *(void *)(a1 + 32), v9, +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  double v13 = [MEMORY[0x263F08AB0] processInfo];
  [v13 systemUptime];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v14;
}

void __71__STSPicker__fetchImageWithURL_priority_forCollectionView_atIndexPath___block_invoke_143(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "fetchImageWithURL completion block called", buf, 2u);
  }
  uint64_t v16 = [MEMORY[0x263F08AB0] processInfo];
  [v16 systemUptime];
  double v18 = v17;
  double v19 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = [v14 objectForKeyedSubscript:@"STSImageDownloadOperationStatusCode"];
    double v22 = [NSNumber numberWithDouble:(v18 - v19) * 1000.0];
    *(_DWORD *)long long buf = 138413570;
    uint64_t v36 = v20;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v12;
    __int16 v41 = 2112;
    double v42 = v21;
    __int16 v43 = 2112;
    double v44 = v22;
    __int16 v45 = 2112;
    id v46 = v14;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "download completed for url: %@, image: %@, imageInfo: %@, status_code: %@, duration: %@, feedback: %@", buf, 0x3Eu);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    double v23 = +[STSFeedbackReporter sharedInstance];
    [v23 didEndNetworkRequest:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) infoDict:v14];
  }
  if (v11)
  {
    id v24 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F827E8], "agif_animatedImageWithImageInfo:", v12);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v25 = v24;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  void block[2] = __71__STSPicker__fetchImageWithURL_priority_forCollectionView_atIndexPath___block_invoke_145;
  block[3] = &unk_264A05AC0;
  id v30 = *(id *)(a1 + 40);
  id v31 = *(id *)(a1 + 48);
  id v32 = v25;
  uint64_t v33 = *(void *)(a1 + 56);
  id v34 = WeakRetained;
  id v27 = WeakRetained;
  id v28 = v25;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__STSPicker__fetchImageWithURL_priority_forCollectionView_atIndexPath___block_invoke_145(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "get cell at index %@", (uint8_t *)&v4, 0xCu);
  }
  id v3 = [*(id *)(a1 + 40) cellForItemAtIndexPath:*(void *)(a1 + 32)];
  [v3 setImage:*(void *)(a1 + 48) animated:1];
  [*(id *)(*(void *)(a1 + 56) + 1024) removeObject:*(void *)(a1 + 32)];
  [*(id *)(a1 + 64) _loadMoreResultsIfNecessary];
}

- (void)_loadMoreResultsIfNecessary
{
  if (!self->_isLoadingMoreResults)
  {
    id v23 = [(STSSearchModel *)self->_searchModel sections];
    if ([v23 count])
    {
      id v3 = [(STSSearchModel *)self->_searchModel sections];
      int v4 = [v3 objectAtIndexedSubscript:0];
      uint64_t v5 = [v4 results];
      uint64_t v6 = [v5 count];

      if (!v6) {
        return;
      }
      id v7 = [(STSPicker *)self view];
      id v23 = [v7 collectionView];

      [v23 contentOffset];
      double v9 = v8;
      [v23 bounds];
      double Height = CGRectGetHeight(v25);
      [v23 contentInset];
      double v12 = v11;
      [v23 contentSize];
      if (v13 > 0.0)
      {
        double v14 = v9 + Height - v12;
        [v23 contentSize];
        double v16 = v15;
        double v17 = [MEMORY[0x263F82B60] mainScreen];
        [v17 bounds];
        double v18 = v16 + CGRectGetHeight(v26) * -0.5;

        if (v14 > v18)
        {
          double v19 = [(STSPicker *)self _loadMoreFooter];
          [v19 setLoading:1];

          int64_t lastInsertedIndexesCount = self->_lastInsertedIndexesCount;
          uint64_t v21 = [(NSMutableSet *)self->_lastInsertedIndexesWaitingToLoad count];
          int64_t v22 = self->_lastInsertedIndexesCount;
          if (v22 < 10 || (double)(lastInsertedIndexesCount - v21) / (double)v22 > 0.5)
          {
            self->_isLoadingMoreResults = 1;
            [(STSSearchModel *)self->_searchModel fetchMoreResults];
          }
        }
      }
    }
  }
}

- (void)_updatePredictedSuggestionsForSize:(CGSize)a3
{
  if (self->_showSuggestions)
  {
    double width = a3.width;
    uint64_t v5 = [(STSSearchModel *)self->_searchModel predictedSuggestions];
    if (v5)
    {
      id v16 = v5;
      unint64_t v6 = [v5 count];
      if (v6 >= 2) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = v6;
      }
      if (v7)
      {
        double v8 = [v16 subarrayWithRange:0];
      }
      else
      {
        double v8 = (void *)MEMORY[0x263EFFA68];
      }
      double v9 = [(STSPicker *)self view];
      uint64_t v10 = [v9 headerView];

      if (width >= 480.0) {
        double v11 = v8;
      }
      else {
        double v11 = 0;
      }
      if (width >= 480.0) {
        double v12 = 0;
      }
      else {
        double v12 = v8;
      }
      [v10 setTopSuggestions:v11];
      [v10 setBottomSuggestions:v12];
      p_visiblePredictions = &self->_visiblePredictions;
      if (![(NSArray *)self->_visiblePredictions isEqualToArray:v8])
      {
        double v14 = +[STSFeedbackReporter sharedInstance];
        double v15 = [(STSSearchModel *)self->_searchModel conversationID];
        [v14 didShowProactiveSuggestions:v8 conversationId:v15];

        objc_storeStrong((id *)p_visiblePredictions, v8);
      }

      uint64_t v5 = v16;
    }
  }
}

- (id)_loadMoreFooter
{
  uint64_t v2 = [(STSPicker *)self view];
  id v3 = [v2 collectionView];
  int v4 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
  uint64_t v5 = [v3 supplementaryViewForElementKind:@"STSGridLayoutElementKindFooter" atIndexPath:v4];

  return v5;
}

- (void)_presentNoticeWithText:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_alloc_init(STSSearchNoticeView);
  [(STSSearchNoticeView *)v7 setText:v4];

  uint64_t v5 = objc_msgSend(MEMORY[0x263F825C8], "sts_searchErrorTextColor");
  [(STSSearchNoticeView *)v7 setTextColor:v5];

  [(STSSearchNoticeView *)v7 setContentCentered:1];
  unint64_t v6 = [(STSPicker *)self view];
  [v6 setOverlayView:v7];
}

- (void)_presentDetailViewControllerForIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(STSPicker *)self _cancelActiveDownload];
    uint64_t v5 = [(STSPicker *)self selectionDelegate];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __54__STSPicker__presentDetailViewControllerForIndexPath___block_invoke;
    v6[3] = &unk_264A05958;
    v6[4] = self;
    id v7 = v4;
    [v5 requestExpandedPresentationStyleForBrowser:self completion:v6];
  }
}

void __54__STSPicker__presentDetailViewControllerForIndexPath___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1040), *(id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) _detailViewControllerForIndexPath:*(void *)(a1 + 40)];
  [v2 setUseBackgroundBlur:1];
  objc_msgSend(v2, "setNumberOfReportedResults:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "numberOfReportedResults"));
  [v2 setModalTransitionStyle:2];
  [v2 setModalPresentationStyle:6];
  [*(id *)(a1 + 32) presentViewController:v2 animated:1 completion:0];
}

- (id)_detailViewControllerForIndexPath:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(STSSearchModel *)self->_searchModel sections];
  unint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

  double v49 = v6;
  id v7 = [v6 results];
  double v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));

  double v9 = [v8 thumbnail];
  uint64_t v10 = objc_msgSend(v8, "sts_providerHostPageURL");
  double v11 = [v9 urlValue];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = [v8 url];
    *(_DWORD *)long long buf = 138412546;
    v53 = v11;
    __int16 v54 = 2112;
    v55 = v12;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Generating detail view for result with thumbnail: %@, url: %@", buf, 0x16u);
  }
  double v13 = [v8 resultType];
  int v14 = [v13 isEqualToString:@"image_search"];

  if (v14)
  {
    double v15 = [[STSImageDetailViewController alloc] initWithNibName:0 bundle:0];
    [(STSResultDetailViewController *)v15 setQueryId:+[STSSearchModel clientQueryId]];
    id v16 = [(STSSearchModel *)self->_searchModel currentQuery];
    [(STSResultDetailViewController *)v15 setQueryString:v16];

    uint64_t v17 = objc_msgSend(v8, "sts_appProviderName");
LABEL_7:
    uint64_t v20 = (void *)v17;
    [(STSResultDetailViewController *)v15 setProviderName:v17];

    goto LABEL_9;
  }
  double v18 = [v8 resultType];
  int v19 = [v18 isEqualToString:@"web_video"];

  if (v19)
  {
    double v15 = [[STSVideoDetailViewController alloc] initWithNibName:0 bundle:0];
    [(STSResultDetailViewController *)v15 setQueryId:+[STSSearchModel clientQueryId]];
    -[STSResultDetailViewController setContentSize:](v15, "setContentSize:", 16.0, 9.0);
    uint64_t v17 = objc_msgSend(v8, "sts_providerName");
    goto LABEL_7;
  }
  double v15 = 0;
LABEL_9:
  [(STSResultDetailViewController *)v15 setNumberOfReportedResults:[(STSSearchModel *)self->_searchModel numberOfReportedResults]];
  objc_msgSend(v8, "sts_providerIconSize");
  -[STSResultDetailViewController setProviderIconSize:](v15, "setProviderIconSize:");
  uint64_t v21 = [MEMORY[0x263F82B60] mainScreen];
  [v21 scale];
  double v23 = v22;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __47__STSPicker__detailViewControllerForIndexPath___block_invoke;
  v50[3] = &unk_264A05B10;
  id v24 = v15;
  id v51 = v24;
  objc_msgSend(v8, "sts_providerIconWithScale:completion:", v50, v23);

  CGRect v25 = [(STSPicker *)self view];
  [v25 bounds];
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;

  v57.origin.double x = v27;
  v57.origin.double y = v29;
  v57.size.double width = v31;
  v57.size.double height = v33;
  double Width = CGRectGetWidth(v57);
  v58.origin.double x = v27;
  v58.origin.double y = v29;
  v58.size.double width = v31;
  v58.size.double height = v33;
  double Height = CGRectGetHeight(v58);
  if (Width < Height) {
    double Height = Width;
  }
  -[STSImageDetailViewController setPreferredContentSize:](v24, "setPreferredContentSize:", Height, Height);
  uint64_t v36 = [v8 url];
  [(STSImageDetailViewController *)v24 setContentURL:v36];

  [(STSResultDetailViewController *)v24 setProviderURL:v10];
  [(STSResultDetailViewController *)v24 setDelegate:self];
  [(STSResultDetailViewController *)v24 setSearchResult:v8];
  __int16 v37 = [(STSPicker *)self view];
  id v38 = [v37 collectionView];
  __int16 v39 = [v38 cellForItemAtIndexPath:v4];

  id v40 = [v39 image];
  __int16 v41 = [v40 images];
  unint64_t v42 = [v41 count];

  if (v42 < 2)
  {
    double v44 = +[STSImageCache sharedCache];
    __int16 v45 = [v44 fetchCachedImageInfoForURL:v11];

    if (v45)
    {
      __int16 v43 = objc_msgSend(MEMORY[0x263F827E8], "agif_animatedImageWithImageInfo:", v45);
    }
    else
    {
      id v46 = +[STSImageCache sharedCache];
      __int16 v43 = [v46 fetchCachedStaticImageForURL:v11];
    }
  }
  else
  {
    __int16 v43 = [v39 image];
  }
  [v43 size];
  -[STSResultDetailViewController setContentSize:](v24, "setContentSize:");
  [(STSResultDetailViewController *)v24 updateWithThumbnail:v43 orThumbnailInfo:0];
  uint64_t v47 = v24;

  return v47;
}

void __47__STSPicker__detailViewControllerForIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__STSPicker__detailViewControllerForIndexPath___block_invoke_2;
  v5[3] = &unk_264A05958;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __47__STSPicker__detailViewControllerForIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProviderIcon:*(void *)(a1 + 40)];
}

- (void)_beginDownloadingResultAtIndexPath:(id)a3
{
  id v5 = a3;
  id v6 = [(STSSearchModel *)self->_searchModel sections];
  id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  double v8 = [v7 results];
  double v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));

  uint64_t v10 = [v9 resultType];
  int v11 = [v10 isEqualToString:@"web_video"];

  if (v11)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    void block[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke;
    block[3] = &unk_264A05958;
    id v45 = v9;
    id v46 = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    double v12 = v45;
  }
  else
  {
    double v22 = v7;
    objc_storeStrong((id *)&self->_activeDownloadIndexPath, a3);
    self->_activeDownloadProgress = 0.0;
    double v13 = [(STSPicker *)self view];
    int v14 = [v13 collectionView];
    double v15 = [v14 cellForItemAtIndexPath:self->_activeDownloadIndexPath];

    uint64_t v21 = v15;
    [v15 setShowDownloadIndicator:1 animated:1.0];
    objc_initWeak(&location, self);
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__1;
    v41[4] = __Block_byref_object_dispose__1;
    id v42 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v40[3] = 0;
    id v16 = [v9 url];
    uint64_t v17 = +[STSImageCache sharedCache];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_3;
    v34[3] = &unk_264A05B60;
    id v18 = v16;
    id v35 = v18;
    objc_copyWeak(&v39, &location);
    uint64_t v36 = self;
    __int16 v37 = v41;
    id v38 = v40;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_156;
    v31[3] = &unk_264A05BB0;
    objc_copyWeak(&v33, &location);
    void v31[4] = self;
    id v19 = v5;
    id v32 = v19;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_3_159;
    v23[3] = &unk_264A05BD8;
    objc_copyWeak(&v30, &location);
    id v24 = v19;
    double v28 = v40;
    id v20 = v18;
    id v25 = v20;
    CGFloat v29 = v41;
    id v26 = v9;
    CGFloat v27 = self;
    [v17 fetchImageDataWithURL:v20 priority:8 isSource:1 begin:v34 progress:v31 completion:v23];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v39);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v41, 8);

    objc_destroyWeak(&location);
    double v12 = v21;
    id v7 = v22;
  }
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(STSPayload);
  id v3 = [*(id *)(a1 + 32) punchout];
  id v4 = [v3 urls];

  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  int v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_2;
  v6[3] = &unk_264A05B38;
  v6[4] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];
  [(STSPayload *)v2 setVideoURL:v8[5]];
  id v5 = [*(id *)(a1 + 40) selectionDelegate];
  [v5 browser:*(void *)(a1 + 40) didSelectResult:*(void *)(a1 + 32) withPayload:v2];

  _Block_object_dispose(&v7, 8);
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = [v9 scheme];
  int v8 = [v7 hasPrefix:@"http"];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v13 = 138412290;
    uint64_t v14 = v2;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Begin downloading image at URL: %@", (uint8_t *)&v13, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v4 = +[STSFeedbackReporter sharedInstance];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(*(void *)(a1 + 40) + 976) currentQuery];
    if (v6)
    {
      uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 976) currentQuery];
    }
    else
    {
      uint64_t v7 = &stru_26E2ACAA8;
    }
    uint64_t v8 = objc_msgSend(v4, "didStartNetworkRequest:query:queryId:", v5, v7, +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (v6) {
  }
    }
  int v11 = [MEMORY[0x263F08AB0] processInfo];
  [v11 systemUptime];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v12;
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_156(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_2_157;
    v8[3] = &unk_264A05B88;
    uint64_t v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    id v10 = WeakRetained;
    double v11 = (double)a2 / (double)a3;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_2_157(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 1048) isEqual:*(void *)(a1 + 40)])
  {
    *(void *)(*(void *)(a1 + 48) + 1056) = *(void *)(a1 + 56);
    uint64_t v2 = [*(id *)(a1 + 48) view];
    id v3 = [v2 collectionView];
    id v4 = [v3 cellForItemAtIndexPath:*(void *)(a1 + 40)];

    [v4 setDownloadProgress:*(double *)(a1 + 56)];
  }
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_3_159(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v15 = WeakRetained;
  if (WeakRetained && [WeakRetained[131] isEqual:*(void *)(a1 + 32)])
  {
    id v16 = [MEMORY[0x263F08AB0] processInfo];
    [v16 systemUptime];
    double v18 = v17;
    double v19 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v12 objectForKeyedSubscript:@"STSImageDownloadOperationStatusCode"];
      uint64_t v21 = *(void *)(a1 + 40);
      double v22 = [NSNumber numberWithDouble:(v18 - v19) * 1000.0];
      *(_DWORD *)long long buf = 138412802;
      v61 = v20;
      __int16 v62 = 2112;
      uint64_t v63 = v21;
      __int16 v64 = 2112;
      id v65 = v22;
      _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "source image downloaded status_code %@ %@ (duration %@)", buf, 0x20u);
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      double v23 = +[STSFeedbackReporter sharedInstance];
      [v23 didEndNetworkRequest:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) infoDict:v12];
    }
    id v45 = [v11 lowercaseString];
    id v24 = &off_22F40E000;
    if (v10 && !v13)
    {
      if (([v45 containsString:@"gif"] & 1) != 0
        || ([v45 containsString:@"jpeg"] & 1) != 0
        || ([v45 containsString:@"png"] & 1) != 0)
      {
        goto LABEL_18;
      }
      uint64_t v58 = *MEMORY[0x263F08320];
      id v25 = STSLocalizedString(@"ERROR_DESC_UNSUPPORTED_FILETYPE");
      id v59 = v25;
      id v26 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];

      id v13 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"STSErrorDomain" code:1 userInfo:v26];
      id v24 = &off_22F40E000;
    }
    if (v13)
    {
      CGFloat v27 = [v13 domain];
      if ([v27 isEqualToString:*MEMORY[0x263F08570]])
      {
        uint64_t v28 = [v13 code];

        BOOL v29 = v28 == -999;
        id v24 = &off_22F40E000;
        if (v29) {
          goto LABEL_22;
        }
      }
      else
      {
      }
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_3_181;
      v49[3] = &unk_264A05958;
      id v39 = (id *)v50;
      id v13 = v13;
      uint64_t v40 = *(void *)(a1 + 56);
      v50[0] = v13;
      v50[1] = v40;
      dispatch_async(MEMORY[0x263EF83A0], v49);
LABEL_21:

LABEL_22:
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = *((void *)v24 + 190);
      v46[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_4;
      v46[3] = &unk_264A05958;
      __int16 v41 = v15;
      uint64_t v42 = *(void *)(a1 + 56);
      uint64_t v47 = v41;
      uint64_t v48 = v42;
      dispatch_async(MEMORY[0x263EF83A0], v46);

      goto LABEL_23;
    }
LABEL_18:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    void block[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_174;
    block[3] = &unk_264A05958;
    id v44 = v11;
    id v30 = v15;
    uint64_t v56 = v30;
    id v57 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
    __int16 v43 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    CGFloat v31 = [v43 objectAtIndexedSubscript:0];
    id v32 = [NSString alloc];
    id v33 = [v31 stringByAppendingPathComponent:@"tmp.gif"];
    id v34 = (void *)[v32 initWithString:v33];

    id v35 = [MEMORY[0x263F08850] defaultManager];
    [v35 removeItemAtPath:v34 error:0];
    [v10 writeToFile:v34 atomically:1];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_2_179;
    v51[3] = &unk_264A059D0;
    id v52 = v34;
    uint64_t v36 = v30;
    id v11 = v44;
    v53 = v36;
    id v54 = *(id *)(a1 + 48);
    id v37 = v34;
    id v38 = (void *)MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], v51);

    id v24 = &off_22F40E000;
    id v39 = (id *)&v56;

    id v13 = 0;
    goto LABEL_21;
  }
LABEL_23:
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_174(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  id v3 = [v2 collectionView];
  id v4 = [v3 cellForItemAtIndexPath:*(void *)(a1 + 40)];

  [v4 setDownloadProgress:1.0];
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_2_179(uint64_t a1)
{
  id v4 = objc_alloc_init(STSPayload);
  uint64_t v2 = [NSURL fileURLWithPath:*(void *)(a1 + 32)];
  [(STSPayload *)v4 setImageURL:v2];

  id v3 = [*(id *)(a1 + 40) selectionDelegate];
  [v3 browser:*(void *)(a1 + 40) didSelectResult:*(void *)(a1 + 48) withPayload:v4];
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_3_181(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F82418];
  id v3 = STSLocalizedString(@"SHARE_IMAGE_FAILED_ALERT_TITLE");
  id v4 = [*(id *)(a1 + 32) localizedDescription];
  id v8 = [v2 alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  uint64_t v5 = (void *)MEMORY[0x263F82400];
  id v6 = STSLocalizedString(@"OK");
  uint64_t v7 = [v5 actionWithTitle:v6 style:0 handler:0];

  [v8 addAction:v7];
  [*(id *)(a1 + 40) presentViewController:v8 animated:1 completion:0];
}

void __48__STSPicker__beginDownloadingResultAtIndexPath___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  id v3 = [v2 collectionView];
  id v6 = [v3 cellForItemAtIndexPath:*(void *)(*(void *)(a1 + 40) + 1048)];

  [v6 setShowDownloadIndicator:1 animated:0.0];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 1048);
  *(void *)(v4 + 1048) = 0;

  *(void *)(*(void *)(a1 + 32) + 1056) = 0;
}

- (void)_cancelActiveDownload
{
  activeDownloadIndexPath = self->_activeDownloadIndexPath;
  if (activeDownloadIndexPath)
  {
    self->_activeDownloadIndexPath = 0;
    uint64_t v4 = activeDownloadIndexPath;

    self->_activeDownloadProgress = 0.0;
    uint64_t v5 = [(STSSearchModel *)self->_searchModel sections];
    objc_msgSend(v5, "objectAtIndexedSubscript:", -[NSIndexPath section](v4, "section"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = [v13 results];
    uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", -[NSIndexPath item](v4, "item"));

    id v8 = +[STSImageCache sharedCache];
    id v9 = [v7 url];
    [v8 cancelQueuedDownloadForURL:v9];

    id v10 = [(STSPicker *)self view];
    id v11 = [v10 collectionView];
    id v12 = [v11 cellForItemAtIndexPath:v4];

    [v12 setShowDownloadIndicator:1 animated:0.0];
  }
}

- (void)_reportFeedbackDisplayedResultsDidScroll:(BOOL)a3
{
  displayedResultsQueue = self->_displayedResultsQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__STSPicker__reportFeedbackDisplayedResultsDidScroll___block_invoke;
  v4[3] = &unk_264A05C00;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(displayedResultsQueue, v4);
}

uint64_t __54__STSPicker__reportFeedbackDisplayedResultsDidScroll___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 992) count];
  if (result)
  {
    id v3 = +[STSFeedbackReporter sharedInstance];
    uint64_t v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 992) copy];
    [v3 didShowResults:v4 scrolling:*(unsigned __int8 *)(a1 + 40)];

    BOOL v5 = *(void **)(*(void *)(a1 + 32) + 992);
    return [v5 removeAllObjects];
  }
  return result;
}

- (id)_noticeTextForSearchError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if ([v4 isEqualToString:@"STSErrorDomain"])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 2) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v6 = [v3 domain];
  if ([v6 isEqualToString:*MEMORY[0x263F08570]])
  {
    uint64_t v7 = [v3 code];

    if (v7 == -1009)
    {
LABEL_7:
      uint64_t v8 = [v3 localizedDescription];
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v8 = STSLocalizedString(@"ERROR_DESC_COULD_NOT_LOAD");
LABEL_10:
  id v9 = (void *)v8;

  return v9;
}

- (void)sendVisibleResultsFeedback
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = [(STSSearchModel *)self->_searchModel sections];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(STSPicker *)self pickerView];
    id v6 = [v5 collectionView];
    uint64_t v7 = [v6 indexPathsForVisibleItems];

    id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v14 = [(STSPicker *)self pickerView];
          uint64_t v15 = [v14 collectionView];
          id v16 = [v15 cellForItemAtIndexPath:v13];

          if (v16)
          {
            double v17 = [v16 layer];
            [v17 frame];
            double v19 = v18;

            id v20 = [(STSPicker *)self pickerView];
            uint64_t v21 = [v20 collectionView];

            [v21 contentOffset];
            double v23 = v22;
            [v21 frame];
            double v25 = v23 + v24;
            [v21 contentInset];
            if (v19 < v25 - v26 + -20.0)
            {
              CGFloat v27 = [(STSSearchModel *)self->_searchModel sections];
              uint64_t v28 = objc_msgSend(v27, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));

              BOOL v29 = [v28 results];
              id v30 = objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v13, "item"));

              if (([(NSMutableSet *)self->_visibleResultsSent containsObject:v30] & 1) == 0)
              {
                [(NSMutableSet *)self->_visibleResultsSent addObject:v30];
                [v33 addObject:v30];
              }
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v10);
    }

    if ([v33 count])
    {
      BOOL isScrolling = self->_isScrolling;
      displayedResultsQueue = self->_displayedResultsQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      void block[2] = __39__STSPicker_sendVisibleResultsFeedback__block_invoke;
      block[3] = &unk_264A05C00;
      id v35 = v33;
      BOOL v36 = isScrolling;
      dispatch_async(displayedResultsQueue, block);
    }
  }
}

void __39__STSPicker_sendVisibleResultsFeedback__block_invoke(uint64_t a1)
{
  id v2 = +[STSFeedbackReporter sharedInstance];
  [v2 didShowResults:*(void *)(a1 + 32) scrolling:*(unsigned __int8 *)(a1 + 40)];
}

- (STSPickerSelectionDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (STSPickerSelectionDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (NSString)headerCellReuseIdentifier
{
  return self->_headerCellReuseIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerCellReuseIdentifier, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_debugItems, 0);
  objc_storeStrong((id *)&self->_originalColor, 0);
  objc_storeStrong((id *)&self->_visibleResultsSent, 0);
  objc_storeStrong((id *)&self->_previewingSearchResult, 0);
  objc_storeStrong((id *)&self->_displayedResultsQueue, 0);
  objc_storeStrong((id *)&self->_detailTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_feedbackMailComposer, 0);
  objc_storeStrong((id *)&self->_previewingContext, 0);
  objc_storeStrong((id *)&self->_activeDownloadIndexPath, 0);
  objc_storeStrong((id *)&self->_detailResultIndexPath, 0);
  objc_storeStrong((id *)&self->_visiblePredictions, 0);
  objc_storeStrong((id *)&self->_lastInsertedIndexesWaitingToLoad, 0);
  objc_storeStrong((id *)&self->_queuedImageURLs, 0);
  objc_storeStrong((id *)&self->_displayedResults, 0);
  objc_storeStrong((id *)&self->_lastSearchId, 0);

  objc_storeStrong((id *)&self->_searchModel, 0);
}

- (void)_handleLongPress:(id *)a1 .cold.1(id *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = [*a1 sections];
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = [v3 count];
  _os_log_fault_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_FAULT, "processing feedback for STSPicker handleLongPress, somehow the selected section (%lu), is greater than the number of feedback sections (%lu)", (uint8_t *)&v4, 0x16u);
}

@end