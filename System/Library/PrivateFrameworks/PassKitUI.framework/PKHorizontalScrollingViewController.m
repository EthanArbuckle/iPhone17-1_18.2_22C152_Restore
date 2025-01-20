@interface PKHorizontalScrollingViewController
- (BOOL)_canReloadViewControllers;
- (BOOL)shouldResetContentOffsetAfterScrolling;
- (NSIndexSet)visibleIndices;
- (NSMutableDictionary)indicesToViewControllerMapping;
- (NSMutableDictionary)nonVisibleIndicesToViewControllerMapping;
- (PKHorizontalScrollingViewController)init;
- (double)_endOfItemAtIndex:(unint64_t)a3;
- (double)_startOfItemAtIndex:(unint64_t)a3;
- (double)_transitionProgress;
- (double)_yPositionForNonPrimaryViewControllers;
- (double)footerViewContentHeight;
- (id)_dequeueNonVisibleViewControllerForIndex:(unint64_t)a3;
- (id)_dequeueViewControllerForIndex:(unint64_t)a3;
- (id)_recoverUnusedViewController;
- (id)_visibileIndicesAtContentOffset:(CGPoint)a3;
- (id)cachedDataAtIndex:(int64_t)a3;
- (id)emptyViewControllers;
- (id)footerView;
- (id)loadingDataObjectWithCurrentData:(id)a3 index:(int64_t)a4 swap:(BOOL)a5;
- (int64_t)numberOfItems;
- (int64_t)primaryIndex;
- (int64_t)startingIndex;
- (unint64_t)_indexAtContentOffset:(CGPoint)a3;
- (unint64_t)_primaryIndexAtOffset:(CGPoint)a3;
- (void)_layoutCollectionViews;
- (void)_loadDataForContentOffset:(CGPoint)a3;
- (void)_reloadDataForViewControllerAtIndex:(unint64_t)a3 swap:(BOOL)a4;
- (void)_reloadPendingViewControllers;
- (void)_retireViewControllerForIndex:(unint64_t)a3;
- (void)_scrollViewStoppedScrolling;
- (void)_switchPrimaryIndexToIndex:(unint64_t)a3;
- (void)_updateAlphaDuringTransition;
- (void)_updatePrimaryIndex:(int64_t)a3;
- (void)_updatePrimaryViewScrolling;
- (void)_updateScrollViewContentSize;
- (void)clearPendingDataCollectionViewUpdates;
- (void)enableScrollView:(BOOL)a3;
- (void)horizontalScrollingChildViewController:(id)a3 scrollViewDidScroll:(id)a4;
- (void)resetVisibleViewControllersWithNewPrimaryIndex:(int64_t)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)updateScrollViewContentOffsetWithNewPrimaryIndex:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKHorizontalScrollingViewController

- (PKHorizontalScrollingViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKHorizontalScrollingViewController;
  v2 = [(PKHorizontalScrollingViewController *)&v6 init];
  if (v2)
  {
    v2->_isLowEndDevice = PKIsLowEndDevice();
    v2->_primaryIndex = 0x7FFFFFFFFFFFFFFFLL;
    v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    scrollView = v2->_scrollView;
    v2->_scrollView = v3;

    v2->_lockUpdate._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)emptyViewControllers
{
  return 0;
}

- (int64_t)numberOfItems
{
  return 0;
}

- (int64_t)startingIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)footerView
{
  return 0;
}

- (double)footerViewContentHeight
{
  return 0.0;
}

- (id)cachedDataAtIndex:(int64_t)a3
{
  return 0;
}

- (id)loadingDataObjectWithCurrentData:(id)a3 index:(int64_t)a4 swap:(BOOL)a5
{
  return 0;
}

- (BOOL)shouldResetContentOffsetAfterScrolling
{
  return 1;
}

- (void)enableScrollView:(BOOL)a3
{
}

- (void)clearPendingDataCollectionViewUpdates
{
}

- (void)updateScrollViewContentOffsetWithNewPrimaryIndex:(int64_t)a3
{
  [(PKHorizontalScrollingViewController *)self _updatePrimaryIndex:a3];
  v4 = [(PKHorizontalScrollingViewController *)self viewIfLoaded];
  if (v4)
  {
    id v6 = v4;
    [(PKHorizontalScrollingViewController *)self _updateScrollViewContentSize];
    if ([(PKHorizontalScrollingViewController *)self numberOfItems] >= 1)
    {
      scrollView = self->_scrollView;
      [(PKHorizontalScrollingViewController *)self _startOfItemAtIndex:self->_primaryIndex];
      -[UIScrollView setContentOffset:](scrollView, "setContentOffset:");
    }
    [v6 setNeedsLayout];
    v4 = v6;
  }
}

- (void)viewDidLoad
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)PKHorizontalScrollingViewController;
  [(PKHorizontalScrollingViewController *)&v49 viewDidLoad];
  v3 = [(PKHorizontalScrollingViewController *)self emptyViewControllers];
  uint64_t v4 = [v3 count];
  v5 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v4];
  indicesToViewControllerMapping = self->_indicesToViewControllerMapping;
  self->_indicesToViewControllerMapping = v5;

  v7 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v4];
  nonVisibleIndicesToViewControllerMapping = self->_nonVisibleIndicesToViewControllerMapping;
  self->_nonVisibleIndicesToViewControllerMapping = v7;

  v9 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v4];
  unusedViewControllers = self->_unusedViewControllers;
  self->_unusedViewControllers = v9;

  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  pendingDataCollectionViewUpdates = self->_pendingDataCollectionViewUpdates;
  self->_pendingDataCollectionViewUpdates = v11;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v13 = v3;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        [v18 setScrollingDelegate:self];
        [v18 setContentInsetAdjustmentBehavior:3];
        [(PKHorizontalScrollingViewController *)self footerViewContentHeight];
        objc_msgSend(v18, "setContentInset:", 0.0, 0.0, v19, 0.0);
        v20 = [(UIScrollView *)self->_scrollView panGestureRecognizer];
        [v18 setGestureRecognizerRequiredToFail:v20];

        v21 = [v18 view];
        [v21 setHidden:1];

        [(NSMutableSet *)self->_unusedViewControllers addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v15);
  }

  [(PKHorizontalScrollingViewController *)self _updatePrimaryIndex:[(PKHorizontalScrollingViewController *)self startingIndex]];
  v22 = [(PKHorizontalScrollingViewController *)self navigationItem];
  objc_msgSend(v22, "pkui_setupScrollEdgeChromelessAppearance");
  v40 = v22;
  objc_msgSend(v22, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  v23 = [(PKHorizontalScrollingViewController *)self view];
  [v23 addSubview:self->_scrollView];
  v24 = +[PKDashboardViewController backgroundColor];
  [v23 setBackgroundColor:v24];

  v25 = [(PKHorizontalScrollingViewController *)self footerView];

  if (v25)
  {
    v26 = [(PKHorizontalScrollingViewController *)self footerView];
    [v23 addSubview:v26];
  }
  v39 = v23;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v27 = self->_unusedViewControllers;
  uint64_t v28 = [(NSMutableSet *)v27 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        -[PKHorizontalScrollingViewController addChildViewController:](self, "addChildViewController:", v32, v39);
        scrollView = self->_scrollView;
        v34 = [v32 view];
        [(UIScrollView *)scrollView addSubview:v34];

        [v32 didMoveToParentViewController:self];
      }
      uint64_t v29 = [(NSMutableSet *)v27 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v29);
  }

  [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
  [(UIScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
  [(UIScrollView *)self->_scrollView setDelegate:self];
  v35 = v39;
  [v39 bounds];
  self->_currentSize.width = v36;
  self->_currentSize.height = v37;
  [(PKHorizontalScrollingViewController *)self _updateScrollViewContentSize];
  if ([(PKHorizontalScrollingViewController *)self numberOfItems] >= 1)
  {
    v38 = self->_scrollView;
    [(PKHorizontalScrollingViewController *)self _startOfItemAtIndex:self->_primaryIndex];
    -[UIScrollView setContentOffset:](v38, "setContentOffset:");
  }
  [(UIScrollView *)self->_scrollView contentOffset];
  -[PKHorizontalScrollingViewController _loadDataForContentOffset:](self, "_loadDataForContentOffset:");
}

- (void)viewWillLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)PKHorizontalScrollingViewController;
  [(PKHorizontalScrollingViewController *)&v22 viewWillLayoutSubviews];
  v3 = [(PKHorizontalScrollingViewController *)self _dequeueViewControllerForIndex:self->_primaryIndex];
  uint64_t v4 = [v3 collectionView];
  v5 = [(PKHorizontalScrollingViewController *)self navigationItem];
  id v6 = v5;
  if (v4) {
    objc_msgSend(v4, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v5);
  }
  else {
    [v5 _setManualScrollEdgeAppearanceProgress:0.0];
  }

  v7 = [(PKHorizontalScrollingViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  self->_currentSize.width = v12;
  self->_currentSize.height = v14;
  [(PKHorizontalScrollingViewController *)self footerViewContentHeight];
  double v17 = v16;
  [v7 safeAreaInsets];
  double v19 = v18;
  v20 = [(PKHorizontalScrollingViewController *)self footerView];

  if (v20)
  {
    v21 = [(PKHorizontalScrollingViewController *)self footerView];
    objc_msgSend(v21, "setFrame:", 0.0, v11 + v15 - (v17 + v19), v13, v17 + v19);
  }
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  if (!CGRectEqualToRect(v23, self->_previousBounds))
  {
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v9, v11, v13, v15);
    [(PKHorizontalScrollingViewController *)self _updateScrollViewContentSize];
  }
  [(PKHorizontalScrollingViewController *)self _layoutCollectionViews];
  self->_previousBounds.origin.x = v9;
  self->_previousBounds.origin.y = v11;
  self->_previousBounds.size.width = v13;
  self->_previousBounds.size.height = v15;
}

- (void)_layoutCollectionViews
{
  v3 = [(PKHorizontalScrollingViewController *)self viewIfLoaded];

  if (v3)
  {
    [(PKHorizontalScrollingViewController *)self _yPositionForNonPrimaryViewControllers];
    uint64_t v5 = v4;
    indicesToViewControllerMapping = self->_indicesToViewControllerMapping;
    v7 = [NSNumber numberWithInteger:self->_primaryIndex];
    double v8 = [(NSMutableDictionary *)indicesToViewControllerMapping objectForKey:v7];

    double v9 = [v8 collectionView];
    [v9 adjustedContentInset];
    uint64_t v11 = v10;
    nonVisibleIndicesToViewControllerMapping = self->_nonVisibleIndicesToViewControllerMapping;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__PKHorizontalScrollingViewController__layoutCollectionViews__block_invoke;
    v15[3] = &unk_1E59CB4D8;
    v15[4] = self;
    v15[5] = v5;
    v15[6] = v10;
    [(NSMutableDictionary *)nonVisibleIndicesToViewControllerMapping enumerateKeysAndObjectsUsingBlock:v15];
    visibleIndices = self->_visibleIndices;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__PKHorizontalScrollingViewController__layoutCollectionViews__block_invoke_2;
    v14[3] = &unk_1E59CB500;
    v14[4] = self;
    v14[5] = v5;
    v14[6] = v11;
    [(NSIndexSet *)visibleIndices enumerateIndexesUsingBlock:v14];
  }
}

void __61__PKHorizontalScrollingViewController__layoutCollectionViews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v20 = [v5 collectionView];
  unint64_t v7 = [v6 integerValue];

  double v8 = [v5 view];

  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 984))
  {
    [(id)v9 _startOfItemAtIndex:v7];
    double v11 = v10;
    double v12 = *(double *)(a1 + 40);
    double v13 = *(double *)(*(void *)(a1 + 32) + 1064);
    double v14 = *(double *)(*(void *)(a1 + 32) + 1072);
    [v20 contentSize];
    double v16 = fmax(v14, v15 + *(double *)(a1 + 48));
  }
  else
  {
    unint64_t v17 = *(void *)(v9 + 1096);
    if (v7 >= v17) {
      unint64_t v18 = v17 + 1;
    }
    else {
      unint64_t v18 = v17 - 1;
    }
    [(id)v9 _startOfItemAtIndex:v18];
    double v11 = v19;
    double v13 = *(double *)(*(void *)(a1 + 32) + 1064);
    double v16 = *(double *)(*(void *)(a1 + 32) + 1072);
    double v12 = 0.0;
  }
  objc_msgSend(v8, "setFrame:", v11, v12, v13, v16);
  objc_msgSend(v20, "setContentOffset:", 0.0, -*(double *)(a1 + 48));
}

void __61__PKHorizontalScrollingViewController__layoutCollectionViews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 1112);
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v16 = [v4 objectForKey:v5];

  id v6 = [v16 collectionView];
  unint64_t v7 = [v16 view];
  double v8 = *(void **)(a1 + 32);
  uint64_t v9 = v8[137];
  [v8 _startOfItemAtIndex:a2];
  double v11 = v10;
  if (v9 == a2)
  {
    objc_msgSend(v7, "setFrame:", v10, 0.0, *(double *)(*(void *)(a1 + 32) + 1064), *(double *)(*(void *)(a1 + 32) + 1072));
  }
  else
  {
    double v12 = *(double *)(a1 + 40);
    double v13 = *(double *)(*(void *)(a1 + 32) + 1064);
    double v14 = *(double *)(*(void *)(a1 + 32) + 1072);
    [v6 contentSize];
    objc_msgSend(v7, "setFrame:", v11, v12, v13, fmax(v14, v15 + *(double *)(a1 + 48)));
    objc_msgSend(v6, "setContentOffset:", 0.0, -*(double *)(a1 + 48));
  }
}

- (void)_updateScrollViewContentSize
{
  v3 = [(PKHorizontalScrollingViewController *)self viewIfLoaded];
  if (v3)
  {
    id v10 = v3;
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    uint64_t v8 = [(PKHorizontalScrollingViewController *)self numberOfItems];
    double v9 = v5 * (double)v8;
    if (v8 > 1) {
      double v9 = v9 + (double)(v8 - 1) * -24.0;
    }
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v9, v7);
    v3 = v10;
  }
}

- (void)_scrollViewStoppedScrolling
{
  v3 = [(PKHorizontalScrollingViewController *)self view];
  [v3 setNeedsLayout];

  [(PKHorizontalScrollingViewController *)self _updatePrimaryViewScrolling];
  scrollTimer = self->_scrollTimer;
  if (scrollTimer) {
    dispatch_source_cancel(scrollTimer);
  }
  if ([(PKHorizontalScrollingViewController *)self shouldResetContentOffsetAfterScrolling])
  {
    double v5 = [(PKHorizontalScrollingViewController *)self view];
    [v5 safeAreaInsets];
    double v7 = v6;

    if (self->_childViewControllerVerticalOffset != -v7)
    {
      self->_childViewControllerVerticalOffset = -v7;
      uint64_t v8 = [(PKHorizontalScrollingViewController *)self _dequeueViewControllerForIndex:self->_primaryIndex];
      double v9 = [v8 collectionView];
      objc_msgSend(v9, "setContentOffset:animated:", 1, 0.0, self->_childViewControllerVerticalOffset);
    }
  }

  [(PKHorizontalScrollingViewController *)self _reloadPendingViewControllers];
}

- (void)resetVisibleViewControllersWithNewPrimaryIndex:(int64_t)a3
{
  indicesToViewControllerMapping = self->_indicesToViewControllerMapping;
  double v6 = [NSNumber numberWithInteger:self->_primaryIndex];
  double v7 = [(NSMutableDictionary *)indicesToViewControllerMapping objectForKey:v6];

  uint64_t v8 = self->_indicesToViewControllerMapping;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __86__PKHorizontalScrollingViewController_resetVisibleViewControllersWithNewPrimaryIndex___block_invoke;
  v29[3] = &unk_1E59CB528;
  id v9 = v7;
  id v30 = v9;
  v31 = self;
  [(NSMutableDictionary *)v8 enumerateKeysAndObjectsUsingBlock:v29];
  [(NSMutableDictionary *)self->_indicesToViewControllerMapping removeAllObjects];
  nonVisibleIndicesToViewControllerMapping = self->_nonVisibleIndicesToViewControllerMapping;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __86__PKHorizontalScrollingViewController_resetVisibleViewControllersWithNewPrimaryIndex___block_invoke_2;
  v28[3] = &unk_1E59CB550;
  v28[4] = self;
  [(NSMutableDictionary *)nonVisibleIndicesToViewControllerMapping enumerateKeysAndObjectsUsingBlock:v28];
  [(NSMutableDictionary *)self->_nonVisibleIndicesToViewControllerMapping removeAllObjects];
  [(PKHorizontalScrollingViewController *)self _updatePrimaryIndex:a3];
  double v11 = self->_indicesToViewControllerMapping;
  double v12 = [NSNumber numberWithInteger:self->_primaryIndex];
  [(NSMutableDictionary *)v11 setObject:v9 forKey:v12];

  scrollView = self->_scrollView;
  double v14 = [v9 view];
  [(UIScrollView *)scrollView bringSubviewToFront:v14];

  double v15 = [MEMORY[0x1E4F28D60] indexSetWithIndex:self->_primaryIndex];
  visibleIndices = self->_visibleIndices;
  self->_visibleIndices = v15;

  [(PKHorizontalScrollingViewController *)self _updateScrollViewContentSize];
  [(UIScrollView *)self->_scrollView setScrollEnabled:1];
  unint64_t v17 = self->_scrollView;
  [(PKHorizontalScrollingViewController *)self _startOfItemAtIndex:self->_primaryIndex];
  -[UIScrollView setContentOffset:](v17, "setContentOffset:");
  unint64_t v18 = [(PKHorizontalScrollingViewController *)self view];
  [v18 setNeedsLayout];

  if ([(PKHorizontalScrollingViewController *)self numberOfItems] <= 1)
  {
    [(UIScrollView *)self->_scrollView contentOffset];
    -[PKHorizontalScrollingViewController _loadDataForContentOffset:](self, "_loadDataForContentOffset:");
  }
  [(PKHorizontalScrollingViewController *)self _reloadDataForViewControllerAtIndex:self->_primaryIndex swap:1];
  double v19 = [(PKHorizontalScrollingViewController *)self footerView];

  if (v19)
  {
    id v20 = [(PKHorizontalScrollingViewController *)self footerView];
    v21 = [v9 footer];
    [v20 setCurrentFooter:v21];

    objc_super v22 = [(PKHorizontalScrollingViewController *)self footerView];
    [v22 setNextFooter:0];

    CGRect v23 = [(PKHorizontalScrollingViewController *)self footerView];
    [v23 setTransitionProgress:0.0];
  }
  v24 = [(PKHorizontalScrollingViewController *)self view];
  [v24 safeAreaInsets];
  double v26 = v25;

  if (v26 != self->_childViewControllerVerticalOffset)
  {
    v27 = [v9 collectionView];
    objc_msgSend(v27, "setContentOffset:animated:", 1, 0.0, -v26);
  }
}

void __86__PKHorizontalScrollingViewController_resetVisibleViewControllersWithNewPrimaryIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void **)(a1 + 32) != a3)
  {
    v3 = *(void **)(*(void *)(a1 + 40) + 1008);
    id v5 = a3;
    [v3 addObject:v5];
    double v4 = [v5 view];
    [v4 setHidden:1];

    [v5 setVisible:0];
  }
}

void __86__PKHorizontalScrollingViewController_resetVisibleViewControllersWithNewPrimaryIndex___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 1008);
  id v5 = a3;
  [v3 addObject:v5];
  double v4 = [v5 view];
  [v4 setHidden:1];

  [v5 setVisible:0];
}

- (void)_reloadPendingViewControllers
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = self->_pendingDataCollectionViewUpdates;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v9 = -[NSMutableDictionary objectForKey:](self->_indicesToViewControllerMapping, "objectForKey:", v8, (void)v21);
        if (!v9)
        {
          id v9 = [(NSMutableDictionary *)self->_nonVisibleIndicesToViewControllerMapping objectForKey:v8];
          if (!v9) {
            continue;
          }
        }
        id v10 = [(NSMutableDictionary *)self->_pendingDataCollectionViewUpdates objectForKey:v8];
        [v9 setData:v10 swap:0];
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_pendingDataCollectionViewUpdates removeAllObjects];
  int64_t primaryIndex = self->_primaryIndex;
  int64_t v12 = primaryIndex - 2;
  if (primaryIndex >= 2)
  {
    double v13 = [(PKHorizontalScrollingViewController *)self cachedDataAtIndex:primaryIndex - 2];
    if (v13 && [(PKHorizontalScrollingViewController *)self _canReloadViewControllers])
    {
      double v14 = [(PKHorizontalScrollingViewController *)self _dequeueNonVisibleViewControllerForIndex:v12];
      [v14 setData:v13 swap:0];
    }
  }
  int64_t v15 = [(PKHorizontalScrollingViewController *)self numberOfItems];
  int64_t v16 = self->_primaryIndex;
  int64_t v17 = v16 + 2;
  if (v15 > v16 + 2)
  {
    unint64_t v18 = [(PKHorizontalScrollingViewController *)self cachedDataAtIndex:v16 + 2];
    if (v18 && [(PKHorizontalScrollingViewController *)self _canReloadViewControllers])
    {
      double v19 = [(PKHorizontalScrollingViewController *)self _dequeueNonVisibleViewControllerForIndex:v17];
      [v19 setData:v18 swap:0];
    }
  }
  id v20 = [(PKHorizontalScrollingViewController *)self view];
  [v20 setNeedsLayout];

  [(PKHorizontalScrollingViewController *)self prefetchDataIfNecessary];
}

- (void)_updatePrimaryViewScrolling
{
  id v8 = [(PKHorizontalScrollingViewController *)self _dequeueViewControllerForIndex:self->_primaryIndex];
  v3 = [v8 collectionView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;
  [v3 setScrollEnabled:!self->_isScrolling];
  objc_msgSend(v3, "setContentOffset:", v5, v7);
}

- (void)_updateAlphaDuringTransition
{
  [(UIScrollView *)self->_scrollView contentOffset];
  double v4 = v3;
  [(PKHorizontalScrollingViewController *)self _startOfItemAtIndex:self->_primaryIndex];
  double v6 = v5;
  [(PKHorizontalScrollingViewController *)self _transitionProgress];
  double v8 = v7;
  visibleIndices = self->_visibleIndices;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__PKHorizontalScrollingViewController__updateAlphaDuringTransition__block_invoke;
  v18[3] = &unk_1E59CB500;
  v18[4] = self;
  *(double *)&v18[5] = 1.0 - v7;
  *(double *)&v18[6] = v7;
  [(NSIndexSet *)visibleIndices enumerateIndexesUsingBlock:v18];
  id v10 = [(PKHorizontalScrollingViewController *)self footerView];

  if (v10)
  {
    if (v4 >= v6)
    {
      if (v4 <= v6) {
        goto LABEL_8;
      }
      int64_t v13 = [(PKHorizontalScrollingViewController *)self numberOfItems];
      int64_t v11 = self->_primaryIndex + 1;
      if (v13 <= v11) {
        goto LABEL_8;
      }
    }
    else
    {
      int64_t primaryIndex = self->_primaryIndex;
      int64_t v11 = primaryIndex - 1;
      if (primaryIndex < 1) {
        goto LABEL_8;
      }
    }
    double v14 = [(PKHorizontalScrollingViewController *)self _dequeueViewControllerForIndex:v11];
    int64_t v15 = [v14 footer];

    int64_t v16 = [(PKHorizontalScrollingViewController *)self footerView];
    [v16 setNextFooter:v15];

LABEL_8:
    int64_t v17 = [(PKHorizontalScrollingViewController *)self footerView];
    [v17 setTransitionProgress:v8];
  }
}

void __67__PKHorizontalScrollingViewController__updateAlphaDuringTransition__block_invoke(uint64_t a1, uint64_t a2)
{
  id v9 = [*(id *)(a1 + 32) _dequeueViewControllerForIndex:a2];
  double v4 = *(void **)(a1 + 32);
  if (v4[137] == a2)
  {
    double v5 = [v4 footerView];

    if (v5)
    {
      double v6 = [*(id *)(a1 + 32) footerView];
      double v7 = [v9 footer];
      [v6 setCurrentFooter:v7];
    }
    double v8 = (double *)(a1 + 40);
  }
  else
  {
    double v8 = (double *)(a1 + 48);
  }
  [v9 setAlphaTransition:*v8];
}

- (void)_loadDataForContentOffset:(CGPoint)a3
{
  double v4 = -[PKHorizontalScrollingViewController _visibileIndicesAtContentOffset:](self, "_visibileIndicesAtContentOffset:", a3.x, a3.y);
  if (!self->_visibleIndices)
  {
    visibleIndices = 0;
    goto LABEL_5;
  }
  if ((PKEqualObjects() & 1) == 0)
  {
    visibleIndices = self->_visibleIndices;
LABEL_5:
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke;
    v13[3] = &unk_1E59CB578;
    id v6 = v4;
    id v14 = v6;
    double v7 = [(NSIndexSet *)visibleIndices indexesPassingTest:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke_2;
    v12[3] = &unk_1E59CB5A0;
    v12[4] = self;
    [v7 enumerateIndexesUsingBlock:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke_3;
    v11[3] = &unk_1E59CB578;
    v11[4] = self;
    double v8 = [v6 indexesPassingTest:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke_4;
    v10[3] = &unk_1E59CB5A0;
    v10[4] = self;
    [v8 enumerateIndexesUsingBlock:v10];
    objc_storeStrong((id *)&self->_visibleIndices, v4);
    id v9 = [(PKHorizontalScrollingViewController *)self view];
    [v9 setNeedsLayout];
  }
  [(PKHorizontalScrollingViewController *)self _updateAlphaDuringTransition];
}

uint64_t __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsIndex:a2] ^ 1;
}

void *__65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[137] != a2) {
    return (void *)[result _retireViewControllerForIndex:a2];
  }
  return result;
}

uint64_t __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 1104) containsIndex:a2] ^ 1;
}

uint64_t __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reloadDataForViewControllerAtIndex:a2 swap:0];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;
  [(PKHorizontalScrollingViewController *)self _startOfItemAtIndex:self->_primaryIndex];
  double v10 = v9;
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke;
  aBlock[3] = &unk_1E59CB5C8;
  objc_copyWeak(&v34, location);
  int64_t v11 = _Block_copy(aBlock);
  if (self->_hasPrefetchedLeft || v6 > v10)
  {
    if (!self->_hasPrefetchedRight && v6 >= v10)
    {
      self->_hasPrefetchedRight = 1;
      for (uint64_t i = 2; i != 5; ++i)
      {
        int64_t v15 = i + self->_primaryIndex;
        if (v15 >= [(PKHorizontalScrollingViewController *)self numberOfItems]) {
          break;
        }
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_4;
        v27[3] = &unk_1E59CB5F0;
        id v28 = v11;
        int64_t v29 = v15;
        [(PKHorizontalScrollingViewController *)self fetchDataAtIndex:v15 completion:v27];
      }
    }
  }
  else
  {
    uint64_t v16 = 0;
    self->_hasPrefetchedLeft = 1;
    do
    {
      uint64_t v17 = v16 + self->_primaryIndex;
      uint64_t v18 = v17 - 2;
      if (v17 < 2) {
        break;
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_3;
      v30[3] = &unk_1E59CB5F0;
      id v31 = v11;
      uint64_t v32 = v18;
      [(PKHorizontalScrollingViewController *)self fetchDataAtIndex:v18 completion:v30];

      --v16;
    }
    while (v16 != -3);
  }
  -[PKHorizontalScrollingViewController _loadDataForContentOffset:](self, "_loadDataForContentOffset:", v6, v8);
  scrollTimer = self->_scrollTimer;
  if (scrollTimer) {
    dispatch_source_cancel(scrollTimer);
  }
  id v20 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  long long v21 = self->_scrollTimer;
  self->_scrollTimer = v20;

  long long v22 = self->_scrollTimer;
  dispatch_time_t v23 = dispatch_time(0, 300000000);
  dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  long long v24 = self->_scrollTimer;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_5;
  v25[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v26, location);
  dispatch_source_set_event_handler(v24, v25);
  dispatch_resume((dispatch_object_t)self->_scrollTimer);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v34);
  objc_destroyWeak(location);
}

void __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id v6 = WeakRetained;
      [WeakRetained[127] setObject:v4 forKey:*(void *)(a1 + 40)];
      int v5 = [v6 _canReloadViewControllers];
      double v3 = v6;
      if (v5)
      {
        [v6 _reloadPendingViewControllers];
        double v3 = v6;
      }
    }
  }
}

void __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v2 numberWithInteger:v4];
  (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v6);
}

void __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v2 numberWithInteger:v4];
  (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v6);
}

void __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_5(uint64_t a1)
{
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    dispatch_source_cancel(WeakRetained[136]);
    dispatch_source_t v2 = v3[136];
    v3[136] = 0;

    [(dispatch_source_t *)v3 _reloadPendingViewControllers];
    WeakRetained = v3;
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_isScrolling = 1;
  self->_isDragging = 1;
  [(PKHorizontalScrollingViewController *)self _updatePrimaryViewScrolling];
  id v4 = [(PKHorizontalScrollingViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  self->_isDragging = 0;
  [(UIScrollView *)self->_scrollView contentOffset];
  unint64_t v9 = [(PKHorizontalScrollingViewController *)self _indexAtContentOffset:v8 + self->_currentSize.width * 0.5];
  unint64_t v10 = v9;
  if (v9 == self->_primaryIndex)
  {
    unint64_t v11 = v9;
    if (x <= 0.0
      || (unint64_t v10 = v9 + 1, v9 + 1 >= [(PKHorizontalScrollingViewController *)self numberOfItems]))
    {
      BOOL v13 = x < 0.0 && v11 != 0;
      unint64_t v10 = v11 - v13;
    }
  }
  [(PKHorizontalScrollingViewController *)self _startOfItemAtIndex:v10];
  a5->double x = v14;
  a5->y = 0.0;

  [(PKHorizontalScrollingViewController *)self _switchPrimaryIndexToIndex:v10];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4 && self->_isScrolling)
  {
    self->_isScrolling = 0;
    [(PKHorizontalScrollingViewController *)self _scrollViewStoppedScrolling];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_isScrolling)
  {
    self->_isScrolling = 0;
    [(PKHorizontalScrollingViewController *)self _scrollViewStoppedScrolling];
  }
}

- (id)_dequeueViewControllerForIndex:(unint64_t)a3
{
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v6 = [(NSMutableDictionary *)self->_indicesToViewControllerMapping objectForKey:v5];
  if (v6) {
    goto LABEL_4;
  }
  id v6 = [(NSMutableDictionary *)self->_nonVisibleIndicesToViewControllerMapping objectForKey:v5];
  [(NSMutableDictionary *)self->_nonVisibleIndicesToViewControllerMapping removeObjectForKey:v5];
  if (v6
    || ([(PKHorizontalScrollingViewController *)self _recoverUnusedViewController],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [(PKHorizontalScrollingViewController *)self view],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 setNeedsLayout],
        v7,
        v6))
  {
LABEL_4:
    [(NSMutableDictionary *)self->_indicesToViewControllerMapping setObject:v6 forKey:v5];
    int64_t primaryIndex = self->_primaryIndex;
    if (primaryIndex == a3)
    {
      scrollView = self->_scrollView;
      unint64_t v10 = [v6 view];
      [(UIScrollView *)scrollView bringSubviewToFront:v10];
    }
    [v6 setVisible:1];
    unint64_t v11 = [v6 collectionView];
    [v11 setScrollEnabled:primaryIndex == a3];
  }

  return v6;
}

- (id)_dequeueNonVisibleViewControllerForIndex:(unint64_t)a3
{
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v6 = [(NSMutableDictionary *)self->_indicesToViewControllerMapping objectForKey:v5];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(NSMutableDictionary *)self->_nonVisibleIndicesToViewControllerMapping objectForKey:v5];
    if (v7
      || ([(PKHorizontalScrollingViewController *)self _recoverUnusedViewController],
          (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [(NSMutableDictionary *)self->_nonVisibleIndicesToViewControllerMapping setObject:v7 forKey:v5];
      [v7 setVisible:0];
      [(PKHorizontalScrollingViewController *)self didDequeueViewController:v7];
      double v8 = [v7 collectionView];
      [v8 setScrollEnabled:self->_primaryIndex == a3];
    }
    unint64_t v9 = [(PKHorizontalScrollingViewController *)self view];
    [v9 setNeedsLayout];
  }

  return v7;
}

- (id)_recoverUnusedViewController
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableSet *)self->_unusedViewControllers anyObject];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 view];
    [v5 setHidden:0];

    [(NSMutableSet *)self->_unusedViewControllers removeObject:v4];
    id v6 = v4;
  }
  else
  {
    id v7 = [(NSMutableDictionary *)self->_nonVisibleIndicesToViewControllerMapping allKeys];
    double v8 = [v7 firstObject];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v25 = 1120;
    obuint64_t j = self->_nonVisibleIndicesToViewControllerMapping;
    uint64_t v9 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unint64_t v11 = 0;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          CGFloat v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "integerValue", v25);
          int64_t primaryIndex = self->_primaryIndex;
          uint64_t v17 = [v14 integerValue];
          int64_t v18 = self->_primaryIndex;
          int64_t v19 = v18 - v17;
          uint64_t v20 = v17 - v18;
          if (v15 >= primaryIndex) {
            unint64_t v21 = v20;
          }
          else {
            unint64_t v21 = v19;
          }
          if (v21 > v11)
          {
            id v22 = v14;

            double v8 = v22;
            unint64_t v11 = v21;
          }
        }
        uint64_t v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v10);
    }

    if (v8)
    {
      dispatch_time_t v23 = [*(id *)((char *)&self->super.super.super.isa + v25) objectForKey:v8];
      [*(id *)((char *)&self->super.super.super.isa + v25) removeObjectForKey:v8];
    }
    else
    {
      dispatch_time_t v23 = 0;
    }
    id v6 = v23;
  }

  return v6;
}

- (void)_retireViewControllerForIndex:(unint64_t)a3
{
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  id v4 = -[NSMutableDictionary objectForKey:](self->_indicesToViewControllerMapping, "objectForKey:");
  id v5 = v4;
  if (v4)
  {
    [v4 setVisible:0];
    [(NSMutableDictionary *)self->_indicesToViewControllerMapping removeObjectForKey:v7];
    id v6 = [(NSMutableDictionary *)self->_nonVisibleIndicesToViewControllerMapping objectForKey:v7];
    if (v6)
    {
      [(NSMutableDictionary *)self->_nonVisibleIndicesToViewControllerMapping removeObjectForKey:v7];
      [(NSMutableSet *)self->_unusedViewControllers addObject:v6];
    }
    [(NSMutableDictionary *)self->_nonVisibleIndicesToViewControllerMapping setObject:v5 forKey:v7];
  }
}

- (id)_visibileIndicesAtContentOffset:(CGPoint)a3
{
  double x = a3.x;
  double width = self->_currentSize.width;
  unint64_t v6 = [(PKHorizontalScrollingViewController *)self numberOfItems];
  if (v6)
  {
    unint64_t v7 = v6;
    float v8 = x / (width + -24.0);
    unint64_t v9 = vcvtms_u32_f32(v8);
    if (v6 <= v9) {
      unint64_t v10 = v6 - 1;
    }
    else {
      unint64_t v10 = v9;
    }
    unint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:v10];
    if (v10)
    {
      [(PKHorizontalScrollingViewController *)self _endOfItemAtIndex:v10 - 1];
      if (v12 > x) {
        [v11 addIndex:v10 - 1];
      }
    }
    unint64_t v13 = v10 + 1;
    if (v13 < v7)
    {
      do
      {
        [(PKHorizontalScrollingViewController *)self _startOfItemAtIndex:v13];
        if (v14 <= x) {
          break;
        }
        [(PKHorizontalScrollingViewController *)self _startOfItemAtIndex:v13];
        if (v15 >= x + self->_currentSize.width) {
          break;
        }
        [v11 addIndex:v13++];
      }
      while (v7 != v13);
    }
    if (self->_primaryIndex != 0x7FFFFFFFFFFFFFFFLL && (objc_msgSend(v11, "containsIndex:") & 1) == 0) {
      [v11 addIndex:self->_primaryIndex];
    }
    id v16 = (id)[v11 copy];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  }

  return v16;
}

- (unint64_t)_indexAtContentOffset:(CGPoint)a3
{
  float v3 = a3.x / (self->_currentSize.width + -24.0);
  return vcvtms_u32_f32(v3);
}

- (double)_startOfItemAtIndex:(unint64_t)a3
{
  return (self->_currentSize.width + -24.0) * (double)a3;
}

- (double)_endOfItemAtIndex:(unint64_t)a3
{
  [(PKHorizontalScrollingViewController *)self _startOfItemAtIndex:a3];
  return v4 + self->_currentSize.width;
}

- (unint64_t)_primaryIndexAtOffset:(CGPoint)a3
{
  return -[PKHorizontalScrollingViewController _indexAtContentOffset:](self, "_indexAtContentOffset:", a3.x + self->_currentSize.width * 0.5, a3.y);
}

- (double)_transitionProgress
{
  [(PKHorizontalScrollingViewController *)self _startOfItemAtIndex:self->_primaryIndex];
  double v4 = v3;
  [(UIScrollView *)self->_scrollView contentOffset];
  return fmax(fmin(vabdd_f64(v4, v5) / (self->_currentSize.width + -24.0), 1.0), 0.0);
}

- (double)_yPositionForNonPrimaryViewControllers
{
  dispatch_source_t v2 = [(PKHorizontalScrollingViewController *)self _dequeueViewControllerForIndex:self->_primaryIndex];
  double v3 = [v2 collectionView];
  [v3 adjustedContentInset];
  double v5 = -v4;
  [v3 contentOffset];
  double v7 = v5 - v6;

  return v7;
}

- (void)_switchPrimaryIndexToIndex:(unint64_t)a3
{
  if (self->_primaryIndex != a3)
  {
    self->_hasPrefetchedLeft = 0;
    self->_hasPrefetchedRight = 0;
    indicesToViewControllerMapping = self->_indicesToViewControllerMapping;
    double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v18 = [(NSMutableDictionary *)indicesToViewControllerMapping objectForKey:v6];

    [(PKHorizontalScrollingViewController *)self _updatePrimaryIndex:a3];
    double v7 = self->_indicesToViewControllerMapping;
    float v8 = [NSNumber numberWithInteger:self->_primaryIndex];
    unint64_t v9 = [(NSMutableDictionary *)v7 objectForKey:v8];

    scrollView = self->_scrollView;
    unint64_t v11 = [v9 view];
    [(UIScrollView *)scrollView bringSubviewToFront:v11];

    double v12 = [v9 collectionView];
    objc_msgSend(v12, "setContentOffset:", 0.0, self->_childViewControllerVerticalOffset);

    unint64_t v13 = [(PKHorizontalScrollingViewController *)self footerView];

    if (v13)
    {
      double v14 = [(PKHorizontalScrollingViewController *)self footerView];
      double v15 = [v9 footer];
      [v14 setCurrentFooter:v15];

      id v16 = [(PKHorizontalScrollingViewController *)self footerView];
      uint64_t v17 = [v18 footer];
      [v16 setNextFooter:v17];
    }
  }
}

- (void)_updatePrimaryIndex:(int64_t)a3
{
  if (self->_primaryIndex != a3)
  {
    self->_int64_t primaryIndex = a3;
    -[PKHorizontalScrollingViewController didMoveToPrimaryIndex:](self, "didMoveToPrimaryIndex:");
  }
}

- (void)_reloadDataForViewControllerAtIndex:(unint64_t)a3 swap:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = -[PKHorizontalScrollingViewController _dequeueViewControllerForIndex:](self, "_dequeueViewControllerForIndex:");
  if (v7)
  {
    float v8 = [(PKHorizontalScrollingViewController *)self cachedDataAtIndex:a3];
    if (v8 && !self->_isLowEndDevice)
    {
      [v7 setData:v8 swap:v4];
      unint64_t v11 = [(PKHorizontalScrollingViewController *)self footerView];
      if (v11)
      {
        int64_t primaryIndex = self->_primaryIndex;

        if (primaryIndex == a3)
        {
          unint64_t v13 = [(PKHorizontalScrollingViewController *)self footerView];
          double v14 = [v7 footer];
          [v13 setCurrentFooter:v14];
        }
      }
    }
    else
    {
      unint64_t v9 = [v7 data];
      unint64_t v10 = [(PKHorizontalScrollingViewController *)self loadingDataObjectWithCurrentData:v9 index:a3 swap:v4];

      if (v10) {
        [v7 setData:v10 swap:0];
      }
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __80__PKHorizontalScrollingViewController__reloadDataForViewControllerAtIndex_swap___block_invoke;
      v15[3] = &unk_1E59CB618;
      objc_copyWeak(v16, &location);
      v16[1] = (id)a3;
      v15[4] = self;
      BOOL v17 = v4;
      [(PKHorizontalScrollingViewController *)self fetchDataAtIndex:a3 completion:v15];
      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
    }
  }
}

void __80__PKHorizontalScrollingViewController__reloadDataForViewControllerAtIndex_swap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKHorizontalScrollingViewController__reloadDataForViewControllerAtIndex_swap___block_invoke_2;
  block[3] = &unk_1E59CAED0;
  objc_copyWeak(v8, (id *)(a1 + 40));
  v8[1] = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 56);
  void block[4] = v4;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v8);
}

void __80__PKHorizontalScrollingViewController__reloadDataForViewControllerAtIndex_swap___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v6 = WeakRetained;
    id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    uint64_t v4 = [v6[139] objectForKey:v3];
    if (!v4)
    {
      uint64_t v4 = [v6[140] objectForKey:v3];
      if (!v4) {
        goto LABEL_12;
      }
    }
    if (*(unsigned char *)(a1 + 64))
    {
      BOOL v5 = 1;
    }
    else if (*(void *)(a1 + 56) == *(void *)(*(void *)(a1 + 32) + 1096))
    {
      BOOL v5 = 0;
    }
    else
    {
      if (![v6 _canReloadViewControllers])
      {
        [v6[127] setObject:*(void *)(a1 + 40) forKey:v3];
        goto LABEL_11;
      }
      BOOL v5 = *(unsigned char *)(a1 + 64) != 0;
    }
    [v4 setData:*(void *)(a1 + 40) swap:v5];
LABEL_11:

LABEL_12:
    WeakRetained = v6;
  }
}

- (BOOL)_canReloadViewControllers
{
  if (!self->_isScrolling) {
    return 1;
  }
  if (self->_isLowEndDevice) {
    return 0;
  }
  return self->_isDragging;
}

- (void)horizontalScrollingChildViewController:(id)a3 scrollViewDidScroll:(id)a4
{
  id v14 = a4;
  indicesToViewControllerMapping = self->_indicesToViewControllerMapping;
  id v7 = NSNumber;
  int64_t primaryIndex = self->_primaryIndex;
  id v9 = a3;
  unint64_t v10 = [v7 numberWithInteger:primaryIndex];
  id v11 = [(NSMutableDictionary *)indicesToViewControllerMapping objectForKey:v10];

  if (v11 == v9)
  {
    [v14 contentOffset];
    self->_childViewControllerVerticalOffset = v12;
    unint64_t v13 = [(PKHorizontalScrollingViewController *)self view];
    [v13 setNeedsLayout];
  }
}

- (int64_t)primaryIndex
{
  return self->_primaryIndex;
}

- (NSIndexSet)visibleIndices
{
  return self->_visibleIndices;
}

- (NSMutableDictionary)indicesToViewControllerMapping
{
  return self->_indicesToViewControllerMapping;
}

- (NSMutableDictionary)nonVisibleIndicesToViewControllerMapping
{
  return self->_nonVisibleIndicesToViewControllerMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonVisibleIndicesToViewControllerMapping, 0);
  objc_storeStrong((id *)&self->_indicesToViewControllerMapping, 0);
  objc_storeStrong((id *)&self->_visibleIndices, 0);
  objc_storeStrong((id *)&self->_scrollTimer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_pendingDataCollectionViewUpdates, 0);
  objc_storeStrong((id *)&self->_unusedViewControllers, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end