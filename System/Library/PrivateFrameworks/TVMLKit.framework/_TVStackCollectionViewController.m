@interface _TVStackCollectionViewController
- (BOOL)_updateWithCollectionListElement:(id)a3 autoHighlightIndexPath:(id *)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (CGSize)_maxContentSize;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (IKViewElement)viewElement;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TVStackCollectionViewControllerDelegate)delegate;
- (double)_maxViewWidth;
- (id)_needsMoreTargetElement;
- (id)_viewControllerWithElement:(id)a3 existingController:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_adjustedContentOffsetForRowIndex:(int64_t)a3 targetContentOffset:(CGPoint *)a4;
- (void)_buildStackSections;
- (void)_configureBackgroundTintView;
- (void)_updateBackgroundTintView;
- (void)_updateBackgroundTintViewEffects;
- (void)_updateFirstItemRowIndexes;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadView;
- (void)preloadCellsInRect:(CGRect)a3;
- (void)resetLastFocusedIndexPath;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithViewElement:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation _TVStackCollectionViewController

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToStackCollectionViewControllerScrollViewDidScroll = objc_opt_respondsToSelector() & 1;
  }
}

- (void)updateWithViewElement:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_viewElement, a3);
  NSUInteger v6 = [(NSArray *)self->_stackRows count];
  v7 = [(_TVStackCollectionViewController *)self viewElement];
  id v32 = 0;
  BOOL v8 = [(_TVStackCollectionViewController *)self _updateWithCollectionListElement:v7 autoHighlightIndexPath:&v32];
  id v9 = v32;
  id v10 = v32;

  [(_TVStackCollectionViewController *)self _configureBackgroundTintView];
  if (![(_TVStackCollectionViewController *)self isViewLoaded])
  {
    v13 = (NSIndexPath *)v10;
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
    self->_lastFocusedIndexPath = v13;
LABEL_18:

    goto LABEL_19;
  }
  if (v10) {
    objc_storeStrong((id *)&self->_lastFocusedIndexPath, v9);
  }
  v11 = [(_TVStackCollectionViewController *)self collectionView];
  v12 = v11;
  if (v8)
  {
    [v11 reloadData];
  }
  else
  {
    v15 = [v11 collectionViewLayout];
    [v15 invalidateLayout];
  }
  if (v10)
  {
    v16 = [(_TVStackCollectionViewController *)self collectionView];
    char v17 = objc_msgSend(v16, "tv_isFocusOnNonOwnedCell");

    if ((v17 & 1) == 0) {
      [(_TVStackCollectionViewController *)self setNeedsFocusUpdate];
    }
    v18 = [(_TVStackCollectionViewController *)self collectionView];
    [v18 scrollToItemAtIndexPath:v10 atScrollPosition:2 animated:1];
  }
  v19 = self->_lastFocusedIndexPath;
  if (v19)
  {
    unint64_t v20 = [(NSIndexPath *)v19 section];
    if (v20 < [(NSArray *)self->_stackSections count])
    {
      v21 = [(_TVStackCollectionViewController *)self collectionView];
      [v21 contentOffset];
      double v30 = v22;
      double v31 = v23;

      v24 = [(NSArray *)self->_stackSections objectAtIndex:v20];
      -[_TVStackCollectionViewController _adjustedContentOffsetForRowIndex:targetContentOffset:](self, "_adjustedContentOffsetForRowIndex:targetContentOffset:", [v24 firstItemRowIndex], &v30);
      v25 = [(_TVStackCollectionViewController *)self collectionView];
      objc_msgSend(v25, "setContentOffset:", v30, v31);
    }
  }
  needsMoreContentEvaluator = self->_needsMoreContentEvaluator;
  v27 = [(_TVStackCollectionViewController *)self _needsMoreTargetElement];
  [(_TVNeedsMoreContentEvaluator *)needsMoreContentEvaluator setViewElement:v27];

  if ([(NSArray *)self->_stackRows count] != v6
    || ([(_TVStackCollectionViewController *)self viewElement],
        v28 = objc_claimAutoreleasedReturnValue(),
        unint64_t v29 = [v28 updateType],
        v28,
        v29 >= 3))
  {
    [(_TVNeedsMoreContentEvaluator *)self->_needsMoreContentEvaluator reset];
    lastFocusedIndexPath = [(_TVStackCollectionViewController *)self view];
    [lastFocusedIndexPath setNeedsLayout];
    goto LABEL_18;
  }
LABEL_19:
}

- (void)loadView
{
  v3 = objc_alloc_init(_TVCollectionViewFlowLayout);
  [(UICollectionViewFlowLayout *)v3 setScrollDirection:0];
  [(UICollectionViewFlowLayout *)v3 setMinimumInteritemSpacing:0.0];
  [(UICollectionViewFlowLayout *)v3 setMinimumLineSpacing:0.0];
  v4 = [_TVStackCollectionView alloc];
  id v5 = -[_TVStackCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  NSUInteger v6 = v5;
  if (self->_configureForListTemplate) {
    [(_TVStackCollectionView *)v5 setClipsToBounds:0];
  }
  [(_TVStackCollectionView *)v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"TVStackViewCollectionCellIdentifier"];
  [(_TVStackCollectionView *)v6 setDelegate:self];
  [(_TVStackCollectionView *)v6 setDataSource:self];
  [(_TVStackCollectionView *)v6 setBackgroundColor:0];
  [(_TVStackCollectionView *)v6 setOpaque:0];
  [(_TVStackCollectionView *)v6 setAutoresizingMask:18];
  [(_TVStackCollectionView *)v6 setShowsVerticalScrollIndicator:0];
  [(_TVStackCollectionView *)v6 setShowsHorizontalScrollIndicator:0];
  [(_TVStackCollectionView *)v6 setAlwaysBounceVertical:1];
  [(_TVStackCollectionViewController *)self setCollectionView:v6];
  v7 = [_TVNeedsMoreContentEvaluator alloc];
  BOOL v8 = [(_TVStackCollectionViewController *)self collectionView];
  id v9 = [(_TVNeedsMoreContentEvaluator *)v7 initWithScrollView:v8 axis:2];
  needsMoreContentEvaluator = self->_needsMoreContentEvaluator;
  self->_needsMoreContentEvaluator = v9;

  v11 = self->_needsMoreContentEvaluator;
  v12 = [(_TVStackCollectionViewController *)self _needsMoreTargetElement];
  [(_TVNeedsMoreContentEvaluator *)v11 setViewElement:v12];

  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  if (lastFocusedIndexPath)
  {
    unint64_t v14 = [(NSIndexPath *)lastFocusedIndexPath section];
    if (v14 < [(NSArray *)self->_stackSections count])
    {
      v15 = [(_TVStackCollectionViewController *)self collectionView];
      [v15 contentOffset];
      double v20 = v16;
      double v21 = v17;

      v18 = [(NSArray *)self->_stackSections objectAtIndex:v14];
      -[_TVStackCollectionViewController _adjustedContentOffsetForRowIndex:targetContentOffset:](self, "_adjustedContentOffsetForRowIndex:targetContentOffset:", [v18 firstItemRowIndex], &v20);
      v19 = [(_TVStackCollectionViewController *)self collectionView];
      objc_msgSend(v19, "setContentOffset:", v20, v21);
    }
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_TVStackCollectionViewController;
  [(_TVStackCollectionViewController *)&v8 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  id v5 = [(_TVStackCollectionViewController *)self collectionView];
  NSUInteger v6 = [v5 indexPathForLastFocusedItem];
  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  self->_lastFocusedIndexPath = v6;
}

- (void)viewDidLayoutSubviews
{
  v57.receiver = self;
  v57.super_class = (Class)_TVStackCollectionViewController;
  [(_TVStackCollectionViewController *)&v57 viewDidLayoutSubviews];
  v3 = [(_TVStackCollectionViewController *)self view];
  [v3 bounds];
  uint64_t v5 = v4;

  NSUInteger v6 = [(_TVStackCollectionViewController *)self viewElement];
  v7 = [v6 style];
  objc_msgSend(v7, "tv_padding");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = [(_TVStackCollectionViewController *)self collectionView];
  [v16 contentInset];
  if (v11 == v20 && v9 == v17 && v15 == v19)
  {
    double v21 = v18;

    if (v13 == v21) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  double v22 = [(_TVStackCollectionViewController *)self collectionView];
  [v22 contentOffset];
  double v24 = v23;
  double v26 = v25;

  v27 = [(_TVStackCollectionViewController *)self collectionView];
  [v27 _effectiveContentInset];
  double v29 = v28;
  double v31 = v30;

  id v32 = [(_TVStackCollectionViewController *)self collectionView];
  objc_msgSend(v32, "setContentInset:", v9, v11, v13, v15);

  v33 = [(_TVStackCollectionViewController *)self collectionView];
  [v33 _effectiveContentInset];
  double v35 = v34;
  double v37 = v36;

  if (self->_configureForListTemplate)
  {
    long long v38 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    *(_OWORD *)location = *MEMORY[0x263F1D1C0];
    long long v56 = v38;
    long long v53 = *(_OWORD *)location;
    long long v54 = v38;
    long long v51 = *(_OWORD *)location;
    long long v52 = v38;
    v39 = [(_TVStackCollectionViewController *)self collectionView];
    +[_TVCollectionWrappingView gradientConfigForCollection:v39 gradientMask:1 gradientLengths:location gradientInset:&v53 gradientBoundsInset:&v51];

    v40 = [(_TVStackCollectionViewController *)self collectionView];
    objc_msgSend(v40, "_setGradientMaskLengths:", *(double *)location, *(double *)&location[1], v56);

    v41 = [(_TVStackCollectionViewController *)self collectionView];
    objc_msgSend(v41, "_setGradientMaskEdgeInsets:", v53, v54);

    v42 = [(_TVStackCollectionViewController *)self collectionView];
    objc_msgSend(v42, "_setGradientBoundsInsets:", v51, v52);
  }
  else
  {
    v42 = [(_TVStackCollectionViewController *)self collectionView];
    objc_msgSend(v42, "_setGradientMaskLengths:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  }

  v43 = [(_TVStackCollectionViewController *)self collectionView];
  [v43 contentSize];
  double v45 = v44;

  if (v26 <= -v29)
  {
    double v26 = -v35;
  }
  else if (v26 >= v31 + v45 - v48)
  {
    double v26 = v37 + v45 - v48;
  }
  v46 = [(_TVStackCollectionViewController *)self collectionView];
  objc_msgSend(v46, "setContentOffset:animated:", 0, v24, v26);

LABEL_15:
  objc_initWeak(location, self);
  v47 = (void *)MEMORY[0x263F158F8];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __57___TVStackCollectionViewController_viewDidLayoutSubviews__block_invoke;
  v49[3] = &unk_264BA6A38;
  objc_copyWeak(&v50, location);
  [v47 setCompletionBlock:v49];
  objc_destroyWeak(&v50);
  objc_destroyWeak(location);
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_TVStackCollectionViewController;
  id v4 = a3;
  [(_TVStackCollectionViewController *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(_TVStackCollectionViewController *)self traitCollection];
  NSUInteger v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    [(_TVStackCollectionViewController *)self _buildStackSections];
    double v8 = [(_TVStackCollectionViewController *)self collectionView];
    double v9 = [v8 collectionViewLayout];
    [v9 invalidateLayout];

    [(_TVStackCollectionViewController *)self _updateBackgroundTintView];
  }
}

- (void)preloadCellsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = self->_viewControllers;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "conformsToProtocol:", &unk_26E5C8FC8, (void)v13)) {
          objc_msgSend(v12, "preloadCellsInRect:", x, y, width, height);
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)resetLastFocusedIndexPath
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  self->_lastFocusedIndexPath = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_viewControllers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_26E5C8FC8, (void)v10)) {
          [v9 resetLastFocusedIndexPath];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)_needsMoreTargetElement
{
  v3 = [(_TVStackCollectionViewController *)self viewElement];
  uint64_t v4 = objc_msgSend(v3, "tv_elementType");
  uint64_t v5 = [(_TVStackCollectionViewController *)self viewElement];
  uint64_t v6 = v5;
  if (v4 == 10)
  {
    uint64_t v7 = [v5 parent];

    uint64_t v6 = (void *)v7;
  }

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return [(NSArray *)self->_viewControllers count];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(_TVStackCollectionViewController *)self collectionView];
  uint64_t v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"TVStackViewCollectionCellIdentifier" forIndexPath:v5];

  viewControllers = self->_viewControllers;
  uint64_t v9 = [v5 section];

  long long v10 = [(NSArray *)viewControllers objectAtIndex:v9];
  long long v11 = [v10 view];
  [v7 bounds];
  objc_msgSend(v11, "setFrame:");
  long long v12 = objc_msgSend(v10, "tv_associatedIKViewElement");
  long long v13 = [v12 attributes];
  long long v14 = [v13 objectForKeyedSubscript:@"markBackgroundSegment"];
  char v15 = [v14 BOOLValue];

  long long v16 = [MEMORY[0x263F1C550] clearColor];
  double v17 = [v12 style];
  uint64_t v18 = objc_msgSend(v17, "tv_backgroundColor");

  if (v18 && (v15 & 1) == 0)
  {
    double v19 = [v12 style];
    double v20 = objc_msgSend(v19, "tv_backgroundColor");
    uint64_t v21 = [v20 color];

    long long v16 = (void *)v21;
  }
  [v7 setBackgroundColor:v16];

  [v7 setViewController:v10];
  return v7;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  uint64_t v4 = [(_TVStackCollectionViewController *)self collectionView];
  if (objc_msgSend(v4, "tv_isFocusOnNonOwnedCell")) {
    lastFocusedIndexPath = 0;
  }
  else {
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
  }
  uint64_t v6 = lastFocusedIndexPath;

  return v6;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a4;
  uint64_t v7 = [v6 viewController];
  if (v7)
  {
    uint64_t v8 = [(_TVStackCollectionViewController *)self childViewControllers];
    char v9 = [v8 containsObject:v7];

    if ((v9 & 1) == 0)
    {
      [(_TVStackCollectionViewController *)self addChildViewController:v7];
      [(UIViewController *)v7 didMoveToParentViewController:self];
      if (v7 == self->_backdropTintViewController) {
        [(_TVStackCollectionViewController *)self _updateBackgroundTintView];
      }
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __86___TVStackCollectionViewController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
      v10[3] = &unk_264BA64A0;
      long long v11 = v7;
      id v12 = v6;
      dispatch_async(MEMORY[0x263EF83A0], v10);
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a4;
  id v6 = [v10 viewController];
  if (v6)
  {
    uint64_t v7 = [(_TVStackCollectionViewController *)self childViewControllers];
    if ([v7 containsObject:v6])
    {
      uint64_t v8 = [v6 view];
      int v9 = [v8 isDescendantOfView:v10];

      if (v9)
      {
        [v6 willMoveToParentViewController:0];
        [v6 removeFromParentViewController];
      }
    }
    else
    {
    }
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(_TVStackCollectionViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  stackSections = self->_stackSections;
  uint64_t v11 = [v6 section];

  id v12 = [(NSArray *)stackSections objectAtIndexedSubscript:v11];
  [v12 sectionHeight];
  double v14 = v13;

  double v15 = v9;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v5 = -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", a5, a4);
  [v5 sectionSpacing];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  [(_TVNeedsMoreContentEvaluator *)self->_needsMoreContentEvaluator evaluateForState:2];
  [(_TVStackCollectionViewController *)self _updateBackgroundTintViewEffects];
  if (self->_delegateFlags.respondsToStackCollectionViewControllerScrollViewDidScroll)
  {
    id v5 = [(_TVStackCollectionViewController *)self delegate];
    uint64_t v4 = [(_TVStackCollectionViewController *)self collectionView];
    [v5 stackCollectionViewController:self scrollViewDidScroll:v4];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v7 = [(_TVStackCollectionViewController *)self navigationController];
  v3 = [v7 topViewController];
  uint64_t v4 = [v3 navigationItem];
  id v5 = [v4 searchController];
  double v6 = [v5 searchBar];
  [v6 resignFirstResponder];
}

- (BOOL)_updateWithCollectionListElement:(id)a3 autoHighlightIndexPath:(id *)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(_TVStackCollectionViewController *)self _maxViewWidth];
  double v7 = v6;
  id v8 = objc_alloc(MEMORY[0x263EFF980]);
  double v9 = [v5 children];
  v55 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v61 = (void *)[(NSArray *)self->_viewControllers mutableCopy];
  location = (id *)&self->_lastFocusedIndexPath;
  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  if (lastFocusedIndexPath)
  {
    id v54 = [(NSArray *)self->_viewControllers objectAtIndex:[(NSIndexPath *)lastFocusedIndexPath section]];
  }
  else
  {
    id v54 = 0;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v52 = v5;
  id obj = [v5 children];
  v59 = self;
  uint64_t v62 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
  if (!v62)
  {
    long long v53 = 0;
    id v56 = 0;
    int v57 = 0;
    goto LABEL_39;
  }
  long long v53 = 0;
  id v56 = 0;
  int v57 = 0;
  uint64_t v60 = *(void *)v73;
  do
  {
    for (uint64_t i = 0; i != v62; ++i)
    {
      if (*(void *)v73 != v60) {
        objc_enumerationMutation(obj);
      }
      double v12 = *(void **)(*((void *)&v72 + 1) + 8 * i);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v13 = v61;
      id v14 = (id)[v13 countByEnumeratingWithState:&v68 objects:v77 count:16];
      if (v14)
      {
        uint64_t v63 = i;
        uint64_t v15 = *(void *)v69;
        while (2)
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v69 != v15) {
              objc_enumerationMutation(v13);
            }
            double v17 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
            uint64_t v18 = objc_msgSend(v17, "tv_associatedIKViewElement");
            double v19 = [[_TVShadowViewElementID alloc] initWithViewElement:v18];
            double v20 = [[_TVShadowViewElementID alloc] initWithViewElement:v12];
            if ([(_TVShadowViewElementID *)v19 isEqual:v20])
            {
              id v14 = v17;
              self = v59;
              uint64_t v21 = [(NSArray *)v59->_viewControllers indexOfObject:v14];

              goto LABEL_19;
            }
          }
          id v14 = (id)[v13 countByEnumeratingWithState:&v68 objects:v77 count:16];
          if (v14) {
            continue;
          }
          break;
        }
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        self = v59;
LABEL_19:
        uint64_t i = v63;
      }
      else
      {
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      }

      id v22 = [(_TVStackCollectionViewController *)self _viewControllerWithElement:v12 existingController:v14];
      double v23 = [v22 view];
      objc_msgSend(v23, "tv_sizeThatFits:", v7, 0.0);
      double v25 = v24;

      if (v25 == 0.0)
      {
        double v26 = v22;
        id v22 = 0;
LABEL_31:

        goto LABEL_32;
      }
      if (v22)
      {
        [v55 addObject:v22];
        BOOL v27 = v21 != [v55 count] - 1;
        double v28 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", 0, objc_msgSend(v55, "count") - 1);
        double v26 = v28;
        uint64_t v29 = i;
        if (v54 == v22)
        {
          id v30 = v28;

          long long v53 = v30;
        }
        v57 |= v27;
        double v31 = [v12 autoHighlightIdentifier];
        uint64_t v32 = [v31 length];

        if (v32)
        {
          id v33 = v56;
          if (!v56) {
            id v33 = v26;
          }
          id v56 = v33;
          [v12 resetProperty:2];
        }
        uint64_t i = v29;
        self = v59;
        goto LABEL_31;
      }
LABEL_32:
      if (v14 && v14 == v22) {
        [v13 removeObjectIdenticalTo:v14];
      }
    }
    uint64_t v62 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
  }
  while (v62);
LABEL_39:

  int v34 = v57;
  if ([v61 count])
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v35 = v61;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v65;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v65 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v64 + 1) + 8 * k);
          [v40 willMoveToParentViewController:0];
          v41 = [v40 view];
          [v41 removeFromSuperview];

          [v40 removeFromParentViewController];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v64 objects:v76 count:16];
      }
      while (v37);
    }

    int v34 = 1;
    self = v59;
  }
  v42 = (NSArray *)[v55 copy];
  viewControllers = self->_viewControllers;
  self->_viewControllers = v42;

  double v44 = [(_TVStackCollectionViewController *)self viewElement];
  double v45 = [v44 attributes];
  v46 = [v45 objectForKeyedSubscript:@"preloading"];

  if (v46)
  {
    v47 = v52;
    if ([v46 BOOLValue] & v34) {
      goto LABEL_50;
    }
  }
  else
  {
    v47 = v52;
    if (v34)
    {
LABEL_50:
      double v48 = [(_TVStackCollectionViewController *)self view];
      [v48 bounds];
      -[_TVStackCollectionViewController preloadCellsInRect:](self, "preloadCellsInRect:");
    }
  }
  objc_storeStrong(location, v53);
  [(_TVStackCollectionViewController *)self _buildStackSections];
  if (a4) {
    *a4 = v56;
  }

  return v34 & 1;
}

- (id)_viewControllerWithElement:(id)a3 existingController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = +[TVInterfaceFactory sharedInterfaceFactory];
  id v8 = [v7 _viewControllerFromElement:v5 existingController:v6];

  if (!v8)
  {
    double v9 = +[TVInterfaceFactory sharedInterfaceFactory];
    double v10 = [v6 view];
    double v11 = [v9 _viewFromElement:v5 existingView:v10];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        double v12 = (_TVStackSupplementalViewController *)v6;
      }
      else {
        double v12 = objc_alloc_init(_TVStackSupplementalViewController);
      }
      id v8 = v12;
      [(_TVStackSupplementalViewController *)v12 setView:v11];
      objc_msgSend(v8, "tv_setAssociatedIKViewElement:", v5);
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (void)_adjustedContentOffsetForRowIndex:(int64_t)a3 targetContentOffset:(CGPoint *)a4
{
  double v7 = -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:");
  if ([v7 isHosted])
  {
    double y = a4->y;
    double v9 = [(_TVStackCollectionViewController *)self collectionView];
    [v9 contentOffset];
    if (y == v10)
    {
      char v11 = [v7 isBounded];

      if ((v11 & 1) == 0) {
        goto LABEL_51;
      }
    }
    else
    {
    }
    double v12 = [(_TVStackCollectionViewController *)self collectionView];
    char v13 = objc_msgSend(v12, "tv_isFocusOnNonOwnedCell");

    if ((v13 & 1) == 0)
    {
      id v14 = [(_TVStackCollectionViewController *)self collectionView];
      [v14 bounds];
      double v16 = v15;
      CGFloat x = a4->x;
      double v18 = a4->y;
      [v14 _effectiveContentInset];
      double v20 = v19;
      double v22 = v21;
      [v14 contentSize];
      double v24 = v23;
      int64_t v25 = a3 - 1;
      if (a3 < 1)
      {
        double v27 = 0.0;
      }
      else
      {
        uint64_t v26 = 0;
        double v27 = 0.0;
        do
        {
          double v28 = [(NSArray *)self->_stackRows objectAtIndexedSubscript:v26];
          uint64_t v29 = v28;
          if (v28)
          {
            [v28 rowMetrics];
            double v30 = *((double *)&v71 + 1);
          }
          else
          {
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            double v30 = 0.0;
            long long v71 = 0u;
          }
          double v27 = v27 + v30;

          ++v26;
        }
        while (a3 != v26);
      }
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __90___TVStackCollectionViewController__adjustedContentOffsetForRowIndex_targetContentOffset___block_invoke;
      v70[3] = &unk_264BA6C88;
      v70[4] = self;
      double v31 = (unsigned int (**)(void, void, void, void))MEMORY[0x230FC9DC0](v70);
      long long v67 = 0uLL;
      if (v7)
      {
        [v7 rowMetrics];
        uint64_t v32 = *((void *)&v62 + 1);
      }
      else
      {
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v62 = 0u;
        uint64_t v32 = 0;
      }
      *(void *)&long long v68 = v32;
      *((void *)&v68 + 1) = a3;
      uint64_t v69 = 1;
      if (!((unsigned int (**)(void, long long *, uint64_t, uint64_t))v31)[2](v31, &v67, 1, 1)
        || !((unsigned int (**)(void, long long *, void, uint64_t))v31)[2](v31, &v67, 0, 1))
      {
        goto LABEL_50;
      }
      if (v7)
      {
        [v7 rowMetrics];
      }
      else
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v57 = 0u;
      }
      double v50 = v22 + v24;
      double v33 = floor((v16 - *(double *)&v68) * 0.5);
      v49 = v14;
      if (v33 > 45.0)
      {
        int v34 = 0;
        int v35 = v27 + *((double *)&v57 + 1) * 0.5 - v18 < v16 * 0.5;
        while (1)
        {
          uint64_t v56 = v69;
          long long v54 = v67;
          long long v55 = v68;
          if (((unsigned int (**)(void, long long *, void, void))v31)[2](v31, &v54, (v35 ^ 1) & 1, 0)
            && (double v36 = floor((v16 - *(double *)&v55) * 0.5), v36 >= 45.0))
          {
            long long v67 = v54;
            long long v68 = v55;
            uint64_t v69 = v56;
            double v33 = v36;
          }
          else
          {
            BOOL v37 = v33 <= *(double *)&v67;
            if (v33 > *((double *)&v67 + 1)) {
              BOOL v37 = 0;
            }
            if ((v37 | v34)) {
              break;
            }
            int v34 = 1;
            v35 ^= 1u;
            double v36 = v33;
          }
          if (v36 <= 45.0) {
            goto LABEL_35;
          }
        }
      }
      double v36 = v33;
LABEL_35:
      double v38 = -v20;
      double v39 = v50 - v16;
      int64_t v40 = *((void *)&v68 + 1);
      if (v25 <= *((uint64_t *)&v68 + 1))
      {
        id v14 = v49;
      }
      else
      {
        id v14 = v49;
        do
        {
          v41 = -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", v25, v49);
          v42 = v41;
          if (v41)
          {
            [v41 rowMetrics];
            double v43 = *((double *)&v53 + 1);
          }
          else
          {
            double v43 = 0.0;
            long long v53 = 0u;
          }
          double v27 = v27 - v43;

          --v25;
        }
        while (v25 > v40);
      }
      double v44 = fmax(v38, v39);
      double v45 = *(double *)&v67;
      v46 = -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", v40, v49);
      v47 = v46;
      if (v45 > 0.0)
      {
        if (v46)
        {
          [v46 rowMetrics];
          double v48 = v52;
          goto LABEL_49;
        }
      }
      else if (v46)
      {
        [v46 rowMetrics];
        double v48 = v51;
LABEL_49:

        double v18 = fmin(fmax(v38, v27 - v48 - v36), v44);
LABEL_50:
        a4->CGFloat x = x;
        a4->double y = v18;

        goto LABEL_51;
      }
      double v48 = 0.0;
      goto LABEL_49;
    }
  }
LABEL_51:
}

- (double)_maxViewWidth
{
  v2 = [(_TVStackCollectionViewController *)self viewElement];
  v3 = [v2 appDocument];
  objc_msgSend(v3, "tv_adjustedWindowSize");
  double v5 = v4;

  return v5;
}

- (void)_buildStackSections
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  [(_TVStackCollectionViewController *)self _maxViewWidth];
  uint64_t v4 = v3;
  double v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_viewControllers, "count"));
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", (2 * -[NSArray count](self->_viewControllers, "count")) | 1);
  double v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_viewControllers, "count"));
  viewControllers = self->_viewControllers;
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __55___TVStackCollectionViewController__buildStackSections__block_invoke;
  v62[3] = &unk_264BA6CB0;
  uint64_t v66 = v4;
  id v9 = v7;
  id v63 = v9;
  uint64_t v67 = 1;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v72 = 0;
  id v10 = v6;
  id v64 = v10;
  id v11 = v5;
  id v65 = v11;
  [(NSArray *)viewControllers enumerateObjectsUsingBlock:v62];
  double v12 = objc_alloc_init(_TVStackRow);
  memset((char *)v61 + 8, 0, 72);
  *(void *)&v61[0] = 1;
  [(_TVStackRow *)v12 setRowMetrics:v61];
  v46 = v12;
  [v10 addObject:v12];
  v47 = v9;
  char v13 = +[TVMLUtilities rowSpacingMetricsForRowMetrics:v9];
  id v14 = self->_viewControllers;
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __55___TVStackCollectionViewController__buildStackSections__block_invoke_2;
  v56[3] = &unk_264BA6CD8;
  id v15 = v11;
  id v57 = v15;
  id v16 = v10;
  id v58 = v16;
  long long v59 = self;
  id v45 = v13;
  id v60 = v45;
  [(NSArray *)v14 enumerateObjectsUsingBlock:v56];
  double v48 = self;
  double v44 = [(_TVStackCollectionViewController *)self collectionView];
  [v44 bounds];
  double v18 = v17;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v19 = v15;
  uint64_t v51 = [v19 countByEnumeratingWithState:&v52 objects:v73 count:16];
  if (v51)
  {
    uint64_t v20 = *(void *)v53;
    uint64_t v49 = *(void *)v53;
    id v50 = v19;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v53 != v20) {
          objc_enumerationMutation(v19);
        }
        double v22 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v23 = [v22 firstRowIndex];
        uint64_t v24 = [v22 rowCount];
        if (v24 >= 2)
        {
          uint64_t v25 = v24;
          uint64_t v26 = [v16 objectAtIndexedSubscript:v23];
          int v27 = [v26 isBounded];

          if (v27)
          {
            [v22 sectionHeight];
            double v29 = v28;
            uint64_t v30 = v23 - 1;
            uint64_t v31 = -1;
            do
            {
              uint64_t v32 = v31;
              if (v31 >= 0) {
                uint64_t v33 = v25 - 1;
              }
              else {
                uint64_t v33 = 0;
              }
              unint64_t v34 = v33 + v30;
              do
              {
                if ((v34 & 0x8000000000000000) != 0 || v34 >= [v16 count]) {
                  break;
                }
                memset(v61, 0, sizeof(v61));
                int v35 = [v16 objectAtIndexedSubscript:v34];
                double v36 = v35;
                if (v35) {
                  [v35 rowMetrics];
                }
                else {
                  memset(v61, 0, sizeof(v61));
                }

                BOOL v37 = (char *)&v61[1] + 8;
                if (v32 >= 0) {
                  BOOL v37 = (char *)&v61[1];
                }
                v34 += v32;
                double v38 = *(void *)&v61[0] == 1 ? (double *)((char *)v61 + 8) : (double *)v37;
                double v29 = v29 + *v38;
              }
              while (*(void *)&v61[0] == 1);
              uint64_t v31 = v32 + 2;
              v30 += 2;
            }
            while (v32 < 0);
            uint64_t v20 = v49;
            id v19 = v50;
            if ((v18 - v29) * 0.5 < 45.0)
            {
              do
              {
                double v39 = [v16 objectAtIndexedSubscript:v23];
                [v39 setBounded:0];

                ++v23;
                --v25;
              }
              while (v25);
            }
          }
        }
      }
      uint64_t v51 = [v19 countByEnumeratingWithState:&v52 objects:v73 count:16];
    }
    while (v51);
  }

  uint64_t v40 = [v19 copy];
  stackSections = v48->_stackSections;
  v48->_stackSections = (NSArray *)v40;

  uint64_t v42 = [v16 copy];
  stackRows = v48->_stackRows;
  v48->_stackRows = (NSArray *)v42;
}

- (void)_updateFirstItemRowIndexes
{
  [(_TVStackCollectionViewController *)self _maxViewWidth];
  viewControllers = self->_viewControllers;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62___TVStackCollectionViewController__updateFirstItemRowIndexes__block_invoke;
  v5[3] = &unk_264BA6D00;
  v5[5] = v4;
  v5[4] = self;
  [(NSArray *)viewControllers enumerateObjectsUsingBlock:v5];
}

- (void)_configureBackgroundTintView
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  p_backdropTintViewController = &self->_backdropTintViewController;
  backdropTintViewController = self->_backdropTintViewController;
  self->_backdropTintViewController = 0;

  if ([(NSArray *)self->_viewControllers count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v5 = self->_viewControllers;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      location = (id *)p_backdropTintViewController;
      uint64_t v8 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "tv_associatedIKViewElement", location);
          double v12 = [v11 attributes];
          char v13 = [v12 objectForKeyedSubscript:@"markBackgroundSegment"];
          int v14 = [v13 BOOLValue];

          if (v14)
          {
            p_backdropTintViewController = (UIViewController **)location;
            objc_storeStrong(location, v10);
            goto LABEL_13;
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v7) {
          continue;
        }
        break;
      }
      id v11 = 0;
      p_backdropTintViewController = (UIViewController **)location;
    }
    else
    {
      id v11 = 0;
    }
LABEL_13:

    if (*p_backdropTintViewController)
    {
      if (self->_backdropTintView)
      {
        [(_TVStackCollectionViewController *)self _updateBackgroundTintView];
      }
      else
      {
        id v15 = objc_alloc(MEMORY[0x263F1CB60]);
        id v16 = (UIView *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        backdropTintView = self->_backdropTintView;
        self->_backdropTintView = v16;

        [(UIView *)self->_backdropTintView setAutoresizingMask:50];
        [(UIView *)self->_backdropTintView setUserInteractionEnabled:0];
        double v18 = [(_TVStackCollectionViewController *)self collectionView];
        [v18 insertSubview:self->_backdropTintView atIndex:0];
      }
      id v19 = self->_backdropTintView;
      uint64_t v20 = [v11 style];
      double v21 = objc_msgSend(v20, "tv_backgroundColor");
      double v22 = [v21 color];

      if (!v22)
      {
        double v22 = [MEMORY[0x263F1C550] colorWithRed:0.937254902 green:0.937254902 blue:0.956862745 alpha:1.0];
      }
      [(UIView *)v19 setBackgroundColor:v22];
    }
    else
    {
      [(_TVStackCollectionViewController *)self _updateBackgroundTintView];
    }
  }
}

- (void)_updateBackgroundTintView
{
  if (self->_backdropTintViewController)
  {
    NSUInteger v3 = -[NSArray indexOfObject:](self->_viewControllers, "indexOfObject:");
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(UIView *)self->_backdropTintView removeFromSuperview];
      backdropTintViewController = self->_backdropTintViewController;
      self->_backdropTintViewController = 0;

      backdropTintView = self->_backdropTintView;
      self->_backdropTintView = 0;
    }
    else
    {
      double v17 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v3];
      uint64_t v6 = [(_TVStackCollectionViewController *)self collectionView];
      [v6 frame];
      double v8 = v7;
      double v10 = v9;

      id v11 = [(_TVStackCollectionViewController *)self collectionView];
      double v12 = [v11 layoutAttributesForItemAtIndexPath:v17];

      [v12 frame];
      double v14 = v13;
      [(_TVStackCollectionViewController *)self _maxContentSize];
      -[UIView setFrame:](self->_backdropTintView, "setFrame:", v8, v14, v10, fmax(v15 - v14, 0.0));
      id v16 = [(_TVStackCollectionViewController *)self collectionView];
      [v16 sendSubviewToBack:self->_backdropTintView];

      [(_TVStackCollectionViewController *)self _updateBackgroundTintViewEffects];
      backdropTintView = v17;
    }
  }
  else
  {
    [(UIView *)self->_backdropTintView removeFromSuperview];
    backdropTintView = self->_backdropTintView;
    self->_backdropTintView = 0;
  }
}

- (void)_updateBackgroundTintViewEffects
{
  backdropTintView = self->_backdropTintView;
  if (backdropTintView)
  {
    [(UIView *)backdropTintView frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    [(_TVStackCollectionViewController *)self _maxContentSize];
    double v11 = v10;
    [(UIView *)self->_backdropTintView frame];
    double v13 = fmax(v11 - v12, 0.0);
    if (v13 > 0.0)
    {
      double v14 = [(_TVStackCollectionViewController *)self collectionView];
      [v14 contentSize];
      double v16 = v15;
      double v17 = [(_TVStackCollectionViewController *)self collectionView];
      [v17 bounds];
      double v19 = v16 - v18;
      uint64_t v20 = [(_TVStackCollectionViewController *)self collectionView];
      [v20 contentInset];
      double v22 = v19 - v21;

      uint64_t v23 = [(_TVStackCollectionViewController *)self collectionView];
      [v23 contentOffset];
      double v25 = v24;

      if (v25 > v22)
      {
        long long v26 = [(_TVStackCollectionViewController *)self collectionView];
        [v26 contentOffset];
        double v13 = v13 + v27 - v22;
      }
    }
    double v28 = self->_backdropTintView;
    -[UIView setFrame:](v28, "setFrame:", v5, v7, v9, v13);
  }
}

- (CGSize)_maxContentSize
{
  NSUInteger v3 = [(_TVStackCollectionViewController *)self collectionView];
  [v3 contentSize];
  double v5 = v4;

  double v6 = [(_TVStackCollectionViewController *)self view];
  [v6 bounds];
  double v8 = v7;

  if (v5 < v8) {
    double v5 = v8;
  }
  double v9 = [(_TVStackCollectionViewController *)self collectionView];
  [v9 contentSize];
  double v11 = v10;

  double v12 = [(_TVStackCollectionViewController *)self view];
  [v12 bounds];
  double v14 = v13;

  if (v11 >= v14) {
    double v15 = v11;
  }
  else {
    double v15 = v14;
  }
  double v16 = v5;
  result.double height = v15;
  result.double width = v16;
  return result;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (_TVStackCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_TVStackCollectionViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_backdropTintView, 0);
  objc_storeStrong((id *)&self->_backdropTintViewController, 0);
  objc_storeStrong((id *)&self->_needsMoreContentEvaluator, 0);
  objc_storeStrong((id *)&self->_lastFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_stackRows, 0);
  objc_storeStrong((id *)&self->_stackSections, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
}

@end