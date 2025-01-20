@interface _TVShelfViewController
+ (void)_contentForCell:(id)a3 shouldHide:(BOOL)a4;
- (BOOL)contentFlowsVertically;
- (BOOL)hideHeader;
- (BOOL)isCentered;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)expectedCellSizeForElement:(id)a3 atIndexPath:(id)a4;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (__TVShelfViewControllerDelegate)delegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)makeCollectionViewWithFrame:(CGRect)a3;
- (id)preferredFocusEnvironments;
- (int64_t)prominentSectionIndex;
- (unint64_t)preferredScrollPosition;
- (unint64_t)speedBumpEdges;
- (void)_delayedUpdatePreview;
- (void)_didSettleOnItemAtIndexPath:(id)a3;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)didMoveToParentViewController:(id)a3;
- (void)dispatchEvent:(id)a3 forItemAtIndexPath:(id)a4 completionBlock:(id)a5;
- (void)setCentered:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHideHeader:(BOOL)a3;
- (void)setProminentSectionIndex:(int64_t)a3;
- (void)setSpeedBumpEdges:(unint64_t)a3;
- (void)updateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)updateViewLayoutAnimated:(BOOL)a3 relayout:(BOOL)a4;
- (void)updateWithViewElement:(id)a3;
- (void)updateWithViewElement:(id)a3 cellMetrics:(TVCellMetrics *)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _TVShelfViewController

- (void)setDelegate:(id)a3
{
  v3 = self;
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  p_delegateFlags = &v3->_delegateFlags;
  v3->_delegateFlags.hasUpdateRelatedView = objc_opt_respondsToSelector() & 1;
  v3->_delegateFlags.hasDidSettleOnItemAtIndexPath = objc_opt_respondsToSelector() & 1;
  v3->_delegateFlags.hasDidPlayItemAtIndexPath = objc_opt_respondsToSelector() & 1;
  v3->_delegateFlags.hasDidSelectItemAtIndexPath = objc_opt_respondsToSelector() & 1;
  LOBYTE(v3) = objc_opt_respondsToSelector();

  p_delegateFlags->hasDidSnapToItemAtIndexPath = v3 & 1;
  BOOL v7 = p_delegateFlags->hasUpdateRelatedView || p_delegateFlags->hasDidSettleOnItemAtIndexPath;
  p_delegateFlags->hasFocusDependentMethods = v7;
}

- (void)didMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_TVShelfViewController;
  -[_TVShelfViewController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_);
  if (a3)
  {
    id v5 = [(_TVMLCollectionViewController *)self collectionView];
    v6 = [v5 collectionViewLayout];
    [v6 snapContent];
  }
  else
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedUpdatePreview object:0];
  }
}

- (void)updateWithViewElement:(id)a3 cellMetrics:(TVCellMetrics *)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = [v6 attributes];
  v8 = [v7 objectForKeyedSubscript:@"scrollPosition"];

  self->_autohighlightScrollPosition = 0;
  v9 = [v8 lowercaseString];
  char v10 = [v9 isEqualToString:@"left"];

  if (v10)
  {
    unint64_t v11 = 8;
LABEL_5:
    self->_autohighlightScrollPosition = v11;
    goto LABEL_6;
  }
  v12 = [v8 lowercaseString];
  int v13 = [v12 isEqualToString:@"right"];

  if (v13)
  {
    unint64_t v11 = 32;
    goto LABEL_5;
  }
LABEL_6:
  v14 = [v6 sections];
  self->_prominentSectionIndex = [v14 indexOfObjectPassingTest:&__block_literal_global_15];

  v69.receiver = self;
  v69.super_class = (Class)_TVShelfViewController;
  long long v15 = *(_OWORD *)&a4->cellMargin.top;
  v68[6] = *(_OWORD *)&a4->cellInsetAlt.bottom;
  v68[7] = v15;
  v68[8] = *(_OWORD *)&a4->cellMargin.bottom;
  long long v16 = *(_OWORD *)&a4->cellInset.top;
  v68[2] = *(_OWORD *)&a4->cellPadding.bottom;
  v68[3] = v16;
  long long v17 = *(_OWORD *)&a4->cellInsetAlt.top;
  v68[4] = *(_OWORD *)&a4->cellInset.bottom;
  v68[5] = v17;
  long long v18 = *(_OWORD *)&a4->cellPadding.top;
  v68[0] = a4->cellSize;
  v68[1] = v18;
  [(_TVMLCollectionViewController *)&v69 updateWithViewElement:v6 cellMetrics:v68];
  if (self->_lastPreviewedIndexPath)
  {
    v19 = [v6 sections];
    unint64_t v20 = [v19 count];
    unint64_t v21 = [(NSIndexPath *)self->_lastPreviewedIndexPath section];

    if (v20 <= v21) {
      goto LABEL_9;
    }
    v22 = [v6 sections];
    v23 = objc_msgSend(v22, "objectAtIndex:", -[NSIndexPath section](self->_lastPreviewedIndexPath, "section"));

    uint64_t v24 = [v23 numberOfItems];
    NSInteger v25 = [(NSIndexPath *)self->_lastPreviewedIndexPath item];

    if (v24 <= v25)
    {
LABEL_9:
      lastPreviewedIndexPath = self->_lastPreviewedIndexPath;
      self->_lastPreviewedIndexPath = 0;
    }
  }
  v27 = [(_TVMLCollectionViewController *)self collectionElement];
  if ([v27 updateType] == 2)
  {
    v28 = [(_TVShelfViewController *)self view];
    v29 = [v28 window];

    if (!v29) {
      goto LABEL_23;
    }
    v61 = v8;
    id v62 = v6;
    v30 = [(_TVMLCollectionViewController *)self collectionView];
    v31 = objc_msgSend(v30, "indexPathsForVisibleSupplementaryElementsOfKind:");

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id obj = v31;
    uint64_t v32 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v65 != v34) {
            objc_enumerationMutation(obj);
          }
          v36 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          v37 = [(_TVMLCollectionViewController *)self collectionElement];
          v38 = [v37 sections];
          v39 = objc_msgSend(v38, "objectAtIndex:", objc_msgSend(v36, "section"));

          v40 = [v39 header];

          if (v40)
          {
            v41 = [(_TVMLCollectionViewController *)self collectionView];
            v42 = [v41 supplementaryViewForElementKind:@"TVShelfLayoutElementKindHeader" atIndexPath:v36];

            v43 = [v42 subviews];
            v44 = [v43 firstObject];

            v45 = +[TVInterfaceFactory sharedInterfaceFactory];
            [v39 header];
            v47 = v46 = self;
            v48 = [v45 _viewFromElement:v47 existingView:v44];

            self = v46;
            [v48 setNeedsLayout];
          }
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v33);
    }
    v27 = obj;

    v8 = v61;
    id v6 = v62;
  }

LABEL_23:
  if ([(_TVShelfViewController *)self isViewLoaded])
  {
    if (self->_configureForListTemplate)
    {
      v49 = self;
      int64_t listTemplateAlignment = self->_listTemplateAlignment;
      v51 = [(_TVShelfViewController *)v49 view];
      uint64_t v52 = [v51 semanticContentAttribute];
      int64_t v53 = listTemplateAlignment;
      self = v49;
      int64_t v54 = +[TVMLUtilities semanticAlignmentForAlignment:v53 semanticContentAttribute:v52];

      v55 = [(_TVMLCollectionViewController *)v49 collectionWrappingView];
      v56 = v55;
      if (v54 == 1) {
        uint64_t v57 = 8;
      }
      else {
        uint64_t v57 = 16;
      }
    }
    else
    {
      v55 = [(_TVMLCollectionViewController *)self collectionWrappingView];
      v56 = v55;
      uint64_t v57 = 0;
    }
    [v55 setCollectionGradientMask:v57];

    v58 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
    if (self->_delegateFlags.hasFocusDependentMethods)
    {
      pendingPreviewedIndexPath = self->_pendingPreviewedIndexPath;
      if (pendingPreviewedIndexPath != v58
        && ([(NSIndexPath *)pendingPreviewedIndexPath isEqual:v58] & 1) == 0)
      {
        [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedUpdatePreview object:0];
        v60 = self->_lastPreviewedIndexPath;
        self->_lastPreviewedIndexPath = 0;

        objc_storeStrong((id *)&self->_pendingPreviewedIndexPath, v58);
        if (self->_pendingPreviewedIndexPath) {
          [(_TVShelfViewController *)self _delayedUpdatePreview];
        }
      }
    }
  }
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)_TVShelfViewController;
  [(_TVMLCollectionViewController *)&v10 viewDidLoad];
  if (self->_configureForListTemplate)
  {
    int64_t listTemplateAlignment = self->_listTemplateAlignment;
    v4 = [(_TVShelfViewController *)self view];
    int64_t v5 = +[TVMLUtilities semanticAlignmentForAlignment:semanticContentAttribute:](TVMLUtilities, "semanticAlignmentForAlignment:semanticContentAttribute:", listTemplateAlignment, [v4 semanticContentAttribute]);

    id v6 = [(_TVMLCollectionViewController *)self collectionWrappingView];
    objc_super v7 = v6;
    if (v5 == 1) {
      uint64_t v8 = 8;
    }
    else {
      uint64_t v8 = 16;
    }
    [v6 setCollectionGradientMask:v8];
  }
  v9 = [(_TVShelfViewController *)self view];
  [v9 _setSpeedBumpEdges:self->_speedBumpEdges];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)_TVShelfViewController;
  [(_TVMLCollectionViewController *)&v7 viewDidLayoutSubviews];
  if (self->_delegateFlags.hasFocusDependentMethods && !self->_lastPreviewedIndexPath)
  {
    v3 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
    lastPreviewedIndexPath = self->_lastPreviewedIndexPath;
    self->_lastPreviewedIndexPath = v3;

    if (v3)
    {
      int64_t v5 = [(_TVMLCollectionViewController *)self lastFocusedIndexPath];
      id v6 = self->_lastPreviewedIndexPath;
      self->_lastPreviewedIndexPath = v5;

      [(_TVShelfViewController *)self _didSettleOnItemAtIndexPath:v5];
    }
  }
}

- (id)preferredFocusEnvironments
{
  v7[1] = *MEMORY[0x263EF8340];
  v3 = [(_TVMLCollectionViewController *)self collectionView];
  if (v3)
  {
    v4 = [(_TVMLCollectionViewController *)self collectionView];
    v7[0] = v4;
    int64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    int64_t v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5 = a4;
  id v6 = [(_TVMLCollectionViewController *)self collectionView];
  objc_super v7 = [v6 collectionViewLayout];

  uint64_t v8 = [v7 indexPathForSnappedContent];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77___TVShelfViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_264BA7180;
  id v12 = v8;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  [v5 animateAlongsideTransition:v11 completion:0];
}

- (void)updateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_TVShelfViewController *)self view];
  uint64_t v9 = [v8 window];
  if (v9)
  {
    id v10 = (void *)v9;
    unint64_t v11 = [v6 nextFocusedIndexPath];

    if (v11)
    {
      id v12 = [v6 nextFocusedIndexPath];
      [(_TVMLCollectionViewController *)self setLastFocusedIndexPath:v12];

      if (self->_delegateFlags.hasFocusDependentMethods)
      {
        id v13 = [v6 nextFocusedIndexPath];
        v14 = (NSIndexPath *)[v13 copy];
        pendingPreviewedIndexPath = self->_pendingPreviewedIndexPath;
        self->_pendingPreviewedIndexPath = v14;

        [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedUpdatePreview object:0];
        long long v16 = [v6 previouslyFocusedIndexPath];
        if (v16)
        {
        }
        else if (!self->_lastPreviewedIndexPath)
        {
          [(_TVShelfViewController *)self _delayedUpdatePreview];
          goto LABEL_17;
        }
        long long v18 = [v6 previouslyFocusedIndexPath];
        if (v18)
        {
        }
        else
        {
          v19 = [v6 nextFocusedIndexPath];
          int v20 = [v19 isEqual:self->_lastPreviewedIndexPath];

          if (v20)
          {
            objc_initWeak(&location, self);
            unint64_t v21 = [v6 nextFocusedIndexPath];
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 3221225472;
            v24[2] = __72___TVShelfViewController_updateFocusInContext_withAnimationCoordinator___block_invoke;
            v24[3] = &unk_264BA71A8;
            objc_copyWeak(&v26, &location);
            id v25 = v6;
            [(_TVShelfViewController *)self dispatchEvent:@"highlight" forItemAtIndexPath:v21 completionBlock:v24];

            objc_destroyWeak(&v26);
            objc_destroyWeak(&location);
            goto LABEL_17;
          }
        }
        [v6 _focusVelocity];
        if (fabs(v22) >= 7500.0) {
          double v23 = 0.6;
        }
        else {
          double v23 = dbl_230C380E0[self->_lastPreviewDelay == 0.6];
        }
        self->_lastPreviewDelay = v23;
        -[_TVShelfViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedUpdatePreview, 0);
      }
      else
      {
        long long v17 = [v6 nextFocusedIndexPath];
        [(_TVShelfViewController *)self dispatchEvent:@"highlight" forItemAtIndexPath:v17 completionBlock:0];
      }
    }
  }
  else
  {
  }
LABEL_17:
}

- (id)makeCollectionViewWithFrame:(CGRect)a3
{
  v3 = -[_TVMLShelfView initWithFrame:]([_TVMLShelfView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_TVMLShelfView *)v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"TVShelfLayoutElementKindHeader" withReuseIdentifier:@"ShelfViewSectionHeaderIdentifier"];
  [(_TVMLShelfView *)v3 setAlwaysBounceHorizontal:1];
  v4 = [(_TVMLShelfView *)v3 collectionViewLayout];
  [v4 setShouldSnapContent:1];

  return v3;
}

- (BOOL)contentFlowsVertically
{
  return 0;
}

- (unint64_t)preferredScrollPosition
{
  return self->_autohighlightScrollPosition;
}

- (CGSize)expectedCellSizeForElement:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_TVShelfViewController *)self prominentSectionIndex] == 0x7FFFFFFFFFFFFFFFLL
    || (int64_t v8 = [(_TVShelfViewController *)self prominentSectionIndex],
        v8 == [v7 section]))
  {
    v19.receiver = self;
    v19.super_class = (Class)_TVShelfViewController;
    [(_TVMLCollectionViewController *)&v19 expectedCellSizeForElement:v6 atIndexPath:v7];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    id v13 = [v6 objectForKeyedSubscript:@"TVFactoryKeyCellMetrics"];
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "tv_cellMetricsValue");
      double v12 = v18;
      double v10 = v17;
    }
    else
    {
      double v12 = 0.0;
      double v10 = 0.0;
    }
  }
  double v15 = v10;
  double v16 = v12;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)updateViewLayoutAnimated:(BOOL)a3 relayout:(BOOL)a4
{
  BOOL v5 = a3;
  if (a3)
  {
    id v7 = objc_alloc_init(_TVMLShelfViewLayout);
  }
  else
  {
    int64_t v8 = [(_TVMLCollectionViewController *)self collectionView];
    id v7 = [v8 collectionViewLayout];
  }
  double v9 = [(_TVMLCollectionViewController *)self collectionElement];
  double v10 = [v9 style];

  objc_msgSend(v10, "tv_interitemSpacing");
  double v12 = v11;
  id v13 = [v10 valueForStyle:@"tv-line-spacing"];
  if (v13)
  {
    objc_msgSend(v10, "tv_lineSpacing");
    double v15 = v14;
  }
  else
  {
    double v15 = NAN;
  }

  double v16 = [(_TVMLCollectionViewController *)self collectionElement];
  double v17 = [v16 attributes];
  double v18 = [v17 objectForKeyedSubscript:@"rowCount"];
  int v19 = [v18 intValue];

  if (v19)
  {
    uint64_t v20 = v19;
  }
  else
  {
    unint64_t v21 = [(_TVMLCollectionViewController *)self collectionElement];
    double v22 = [v21 style];
    uint64_t v20 = objc_msgSend(v22, "tv_rowCount");
  }
  double v23 = [(_TVMLCollectionViewController *)self collectionView];
  uint64_t v24 = [v23 visibleSupplementaryViewsOfKind:@"TVShelfLayoutElementKindHeader"];

  BOOL v27 = a4
     || ([(_TVShelfViewLayout *)v7 minimumInteritemSpacing], v25 != v12)
     || ([(_TVShelfViewLayout *)v7 minimumLineSpacing], v26 != v15)
     || [v24 count] != 0;
  [(_TVMLCollectionViewController *)self cellMetrics];
  [(_TVMLShelfViewLayout *)v7 setCellMetrics:&v39];
  if (v20 <= 1) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = v20;
  }
  [(_TVShelfViewLayout *)v7 setRowCount:v28];
  [(_TVShelfViewLayout *)v7 setProminentSectionIndex:[(_TVShelfViewController *)self prominentSectionIndex]];
  [(_TVShelfViewLayout *)v7 setMinimumInteritemSpacing:v12];
  [(_TVShelfViewLayout *)v7 setMinimumLineSpacing:v15];
  if (v5)
  {
    v29 = [(_TVMLCollectionViewController *)self collectionView];
    [(TVShelfViewLayoutInvalidationContext *)v29 setCollectionViewLayout:v7 animated:1];
  }
  else
  {
    if (!v27) {
      goto LABEL_22;
    }
    v29 = objc_alloc_init(TVShelfViewLayoutInvalidationContext);
    [(TVShelfViewLayoutInvalidationContext *)v29 setInvalidateLayout:1];
    [(_TVMLShelfViewLayout *)v7 invalidateLayoutWithContext:v29];
  }

LABEL_22:
  v30 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  objc_msgSend(v30, "setCentered:", -[_TVShelfViewController isCentered](self, "isCentered"));

  v31 = [(_TVMLCollectionViewController *)self collectionElement];
  uint64_t v32 = [v31 appDocument];
  uint64_t v33 = [v32 templateElement];

  uint64_t v34 = [v33 style];
  v35 = objc_msgSend(v34, "tv_searchStyle");
  char v36 = [v35 isEqualToString:@"partial"];

  v37 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  double v38 = 1.0;
  if ((v36 & 1) == 0) {
    +[_TVShelfViewLayout defaultHeaderSelectionMargin];
  }
  [v37 setHeaderSelectionMargin:v38];
}

- (void)dispatchEvent:(id)a3 forItemAtIndexPath:(id)a4 completionBlock:(id)a5
{
  int64_t v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  if (@"select" == v8 && self->_delegateFlags.hasDidSelectItemAtIndexPath)
  {
    double v11 = [(_TVShelfViewController *)self delegate];
    [v11 shelfViewController:self didSelectItemAtIndexPath:v9];
    goto LABEL_7;
  }
  if (@"play" == v8 && self->_delegateFlags.hasDidPlayItemAtIndexPath)
  {
    double v11 = [(_TVShelfViewController *)self delegate];
    [v11 shelfViewController:self didPlayItemAtIndexPath:v9];
LABEL_7:
  }
  v12.receiver = self;
  v12.super_class = (Class)_TVShelfViewController;
  [(_TVMLCollectionViewController *)&v12 dispatchEvent:v8 forItemAtIndexPath:v9 completionBlock:v10];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_TVShelfViewController;
  v4 = [(_TVMLCollectionViewController *)&v6 collectionView:a3 cellForItemAtIndexPath:a4];
  [(id)objc_opt_class() _contentForCell:v4 shouldHide:1];
  return v4;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(_TVMLCollectionViewController *)self collectionElement];
  double v11 = [v10 sections];
  objc_super v12 = [v11 objectAtIndex:a5];

  id v13 = [v12 header];

  if (v13)
  {
    double v14 = [v12 header];
    double v15 = [v14 style];
    objc_msgSend(v15, "tv_width");
    double v17 = v16;

    double v18 = [v14 style];
    objc_msgSend(v18, "tv_height");
    double v20 = v19;

    if (v20 <= 0.0 || v17 <= 0.0)
    {
      unint64_t v21 = +[TVInterfaceFactory sharedInterfaceFactory];
      double v22 = [v12 header];
      double v23 = [v21 _viewFromElement:v22 existingView:0];

      uint64_t v35 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v28 = 0u;
      if (v9) {
        objc_msgSend(v9, "cellMetrics", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
      }
      objc_msgSend(v8, "bounds", v28, v29, v30, v31, v32, v33, v34, v35);
      objc_msgSend(v23, "sizeThatFits:", CGRectGetWidth(v37) - (0.0 + 0.0), 0.0);
      double v17 = v24;
      double v20 = v25;
    }
  }
  else
  {
    double v17 = *MEMORY[0x263F001B0];
    double v20 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v26 = v17;
  double v27 = v20;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)setHideHeader:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  [v4 setHeaderHidden:v3];
}

- (BOOL)hideHeader
{
  v2 = [(_TVMLCollectionViewController *)self collectionWrappingView];
  char v3 = [v2 isHeaderHidden];

  return v3;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(_TVMLCollectionViewController *)self collectionElement];
  id v8 = [v7 sections];
  id v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));

  id v10 = objc_msgSend(v9, "prototypeForItemAtIndex:", objc_msgSend(v6, "row"));
  [(_TVShelfViewController *)self expectedCellSizeForElement:v10 atIndexPath:v6];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = [(_TVMLCollectionViewController *)self collectionElement];
  id v7 = [v6 sections];
  id v8 = [v7 objectAtIndex:a5];

  id v9 = [v8 style];
  objc_msgSend(v9, "tv_margin");
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_TVShelfViewController;
  id v8 = a4;
  [(_TVMLCollectionViewController *)&v9 collectionView:a3 willDisplayCell:v8 forItemAtIndexPath:a5];
  objc_msgSend(v8, "_setSpeedBumpEdges:", self->_speedBumpEdges, v9.receiver, v9.super_class);
  [(id)objc_opt_class() _contentForCell:v8 shouldHide:0];
}

- (void)setSpeedBumpEdges:(unint64_t)a3
{
  self->_speedBumpEdges = a3;
  if ([(_TVShelfViewController *)self isViewLoaded])
  {
    id v4 = [(_TVShelfViewController *)self view];
    [v4 _setSpeedBumpEdges:self->_speedBumpEdges];

    BOOL v5 = [(_TVMLCollectionViewController *)self collectionView];
    id v6 = [v5 visibleCells];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __44___TVShelfViewController_setSpeedBumpEdges___block_invoke;
    v7[3] = &unk_264BA71D0;
    v7[4] = self;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [(_TVMLCollectionViewController *)self collectionElement];
  double v12 = [v11 sections];
  double v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v8, "section"));

  double v14 = [v10 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"ShelfViewSectionHeaderIdentifier" forIndexPath:v8];

  double v15 = [v14 subviews];
  double v16 = [v15 firstObject];

  double v17 = [v14 subviews];
  [v17 makeObjectsPerformSelector:sel_removeFromSuperview];

  double v18 = [v13 header];

  if (v18)
  {
    objc_msgSend(v16, "tv_setAssociatedIKViewElement:", 0);
    double v19 = +[TVInterfaceFactory sharedInterfaceFactory];
    double v20 = [v13 header];
    double v21 = [v19 _viewFromElement:v20 existingView:v16];

    [v14 addSubview:v21];
    [v14 bounds];
    objc_msgSend(v21, "setFrame:");
  }
  return v14;
}

- (void)_delayedUpdatePreview
{
  char v3 = [(_TVShelfViewController *)self view];
  id v4 = [v3 window];

  if (v4)
  {
    pendingPreviewedIndexPath = self->_pendingPreviewedIndexPath;
    id v6 = pendingPreviewedIndexPath;
    id v7 = self->_pendingPreviewedIndexPath;
    self->_pendingPreviewedIndexPath = 0;

    self->_lastPreviewDelay = 0.0;
    if (([(NSIndexPath *)self->_lastPreviewedIndexPath isEqual:v6] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastPreviewedIndexPath, pendingPreviewedIndexPath);
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __47___TVShelfViewController__delayedUpdatePreview__block_invoke;
      v8[3] = &unk_264BA71A8;
      objc_copyWeak(&v10, &location);
      id v9 = v6;
      [(_TVShelfViewController *)self dispatchEvent:@"highlight" forItemAtIndexPath:v9 completionBlock:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_didSettleOnItemAtIndexPath:(id)a3
{
  id v6 = a3;
  if (self->_delegateFlags.hasDidSettleOnItemAtIndexPath)
  {
    id v4 = [(_TVShelfViewController *)self delegate];
    [v4 shelfViewController:self didSettleOnItemAtIndexPath:v6];
  }
  if (self->_delegateFlags.hasUpdateRelatedView)
  {
    BOOL v5 = [(_TVShelfViewController *)self delegate];
    [v5 shelfViewController:self updateRelatedView:0];
  }
}

+ (void)_contentForCell:(id)a3 shouldHide:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v5 = [v7 contentView];
    id v6 = v5;
    if (v4) {
      [v5 removeFromSuperview];
    }
    else {
      [v7 addSubview:v5];
    }
  }
}

- (void)updateWithViewElement:(id)a3
{
  id v4 = a3;
  +[_TVLockupFactory cellMetricsForCollectionElement:v4];
  [(_TVShelfViewController *)self updateWithViewElement:v4 cellMetrics:&v5];
}

- (__TVShelfViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (__TVShelfViewControllerDelegate *)WeakRetained;
}

- (unint64_t)speedBumpEdges
{
  return self->_speedBumpEdges;
}

- (BOOL)isCentered
{
  return self->_centered;
}

- (void)setCentered:(BOOL)a3
{
  self->_centered = a3;
}

- (int64_t)prominentSectionIndex
{
  return self->_prominentSectionIndex;
}

- (void)setProminentSectionIndex:(int64_t)a3
{
  self->_prominentSectionIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastPreviewedIndexPath, 0);
  objc_storeStrong((id *)&self->_pendingPreviewedIndexPath, 0);
}

@end