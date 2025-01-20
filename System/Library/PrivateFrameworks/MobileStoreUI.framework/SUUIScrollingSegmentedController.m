@interface SUUIScrollingSegmentedController
- (BOOL)_configureSegment:(id)a3 forViewController:(id)a4;
- (BOOL)scrollEnabled;
- (BOOL)wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing;
- (BOOL)wantsWhiteBackgroundBeyondRightEdgeWhenBouncing;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)viewControllers;
- (SUUIInteractiveSegmentedControl)_titlesSegmentedControl;
- (SUUIScrollingSegmentedController)initWithNibName:(id)a3 bundle:(id)a4;
- (SUUIScrollingSegmentedControllerDelegate)delegate;
- (SUUIScrollingSegmentedControllerNavigationBarTitleView)navigationBarTitleView;
- (UIEdgeInsets)_viewControllerContentScrollViewContentInset;
- (UIEdgeInsets)segmentedControlContentEdgeInsets;
- (UIScrollView)scrollingTabNestedPagingScrollView;
- (UIViewController)focusedViewController;
- (double)maximumContentWidth;
- (double)segmentedControlHeight;
- (id)_indexPathOfFocusedItemAllowingLayoutIfNeeded:(BOOL)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)contentScrollView;
- (id)scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)segmentedControlLayoutStyle;
- (unint64_t)focusedViewControllerIndex;
- (void)_reloadTitleSegments;
- (void)_scrollToTitlesSelectionProgress:(double)a3 animated:(BOOL)a4;
- (void)_setViewControllers:(id)a3 viewUpdatesHandler:(id)a4;
- (void)_titlesSegmentedControlValueChangeAction:(id)a3;
- (void)_updateScrollViewContentOffsetsToTargetContentOffsets;
- (void)_updateTitleValueObservation;
- (void)_updateTitlesSelectionProgress;
- (void)_updateViewBackgroundColor;
- (void)_viewControllerNeedsContentScrollViewUpdates:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)contentScrollViewDidChangeForScrollingSegmentedControllerItemContext:(id)a3;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)replaceViewControllerAtIndex:(unint64_t)a3 withViewController:(id)a4;
- (void)scrollViewDidChangeContentInset:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollingSegmentedControllerCollectionViewDidLayoutSubviews:(id)a3;
- (void)scrollingTabAppearanceStatusWasUpdated:(id)a3;
- (void)selectViewControllerAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumContentWidth:(double)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setSegmentedControlContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setSegmentedControlHeight:(double)a3;
- (void)setSegmentedControlLayoutStyle:(int64_t)a3;
- (void)setViewControllers:(id)a3;
- (void)setWantsWhiteBackgroundBeyondLeftEdgeWhenBouncing:(BOOL)a3;
- (void)setWantsWhiteBackgroundBeyondRightEdgeWhenBouncing:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SUUIScrollingSegmentedController

- (SUUIScrollingSegmentedController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIScrollingSegmentedController;
  result = [(SUUIScrollingSegmentedController *)&v5 initWithNibName:a3 bundle:a4];
  if (result)
  {
    result->_scrollingTabAppearanceStatus.progress = 1.0;
    *(void *)&result->_scrollingTabAppearanceStatus.isBouncingOffTheEdge = 0;
    result->_focusedViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_titleObservingViewControllers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeObserver:self forKeyPath:@"navigationItem.title" context:_SUUIScrollingSegmentTitleValueObservationContext];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(SUUIProxyScrollView *)self->_proxyScrollView setDelegate:0];
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView setDataSource:0];
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView setDelegate:0];
  [(SUUIInteractiveSegmentedControl *)self->_titlesSegmentedControl removeTarget:self action:sel__titlesSegmentedControlValueChangeAction_ forControlEvents:4096];
  v8.receiver = self;
  v8.super_class = (Class)SUUIScrollingSegmentedController;
  [(SUUIViewController *)&v8 dealloc];
}

- (void)viewDidLoad
{
  v37[1] = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)SUUIScrollingSegmentedController;
  [(SUUIScrollingSegmentedController *)&v35 viewDidLoad];
  v3 = [(SUUIScrollingSegmentedController *)self view];
  uint64_t v4 = [MEMORY[0x263F825C8] clearColor];
  [v3 setBackgroundColor:v4];

  self->_viewBackgroundIsWhite = 0;
  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v13 = objc_alloc(MEMORY[0x263F82E00]);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v34 = *MEMORY[0x263F001A8];
  double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
  v17 = objc_msgSend(v13, "initWithFrame:");
  [v17 setHidden:1];
  [v3 addSubview:v17];
  self->_contentCollectionViewItemSize.width = v10;
  self->_contentCollectionViewItemSize.height = v12;
  id v18 = objc_alloc_init(MEMORY[0x263F82570]);
  [v18 setScrollDirection:1];
  [v18 setMinimumLineSpacing:0.0];
  uint64_t v36 = *MEMORY[0x263F83500];
  v37[0] = &unk_2705D0AD8;
  v19 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
  [v18 _setRowAlignmentsOptions:v19];

  v38.origin.x = v6;
  v38.origin.y = v8;
  v38.size.width = v10;
  v38.size.height = v12;
  double Width = CGRectGetWidth(v38);
  if (Width >= 2.0) {
    double v21 = Width;
  }
  else {
    double v21 = 2.0;
  }
  v39.origin.x = v6;
  v39.origin.y = v8;
  v39.size.width = v21;
  v39.size.height = v12;
  double Height = CGRectGetHeight(v39);
  if (Height >= 2.0) {
    double v23 = Height;
  }
  else {
    double v23 = 2.0;
  }
  v24 = -[SUUIScrollingSegmentedControllerCollectionView initWithFrame:collectionViewLayout:]([SUUIScrollingSegmentedControllerCollectionView alloc], "initWithFrame:collectionViewLayout:", v18, v6, v8, v21, v23);
  contentCollectionView = self->_contentCollectionView;
  self->_contentCollectionView = v24;

  v26 = [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView panGestureRecognizer];
  [v26 _setHysteresis:15.0];

  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView setAllowsSelection:0];
  v27 = self->_contentCollectionView;
  v28 = [MEMORY[0x263F825C8] clearColor];
  [(SUUIScrollingSegmentedControllerCollectionView *)v27 setBackgroundColor:v28];

  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView setDataSource:self];
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView setDelegate:self];
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2704FB0D0];
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView setScrollsToTop:0];
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView setPreservesSuperviewLayoutMargins:1];
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView setShowsHorizontalScrollIndicator:0];
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView setShowsVerticalScrollIndicator:0];
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView setPagingEnabled:1];
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView setScrollEnabled:self->_scrollEnabled];
  [v3 addSubview:self->_contentCollectionView];
  [(SUUIScrollingSegmentedController *)self _updateViewBackgroundColor];
  v29 = -[SUUIInteractiveSegmentedControl initWithFrame:]([SUUIInteractiveSegmentedControl alloc], "initWithFrame:", v34, v14, v15, v16);
  titlesSegmentedControl = self->_titlesSegmentedControl;
  self->_titlesSegmentedControl = v29;

  [(SUUIInteractiveSegmentedControl *)self->_titlesSegmentedControl setDividerCreationBlock:&__block_literal_global_12];
  v31 = self->_titlesSegmentedControl;
  +[SUUIStandardInteractiveDividerView defaultWidth];
  -[SUUIInteractiveSegmentedControl setDividerWidth:](v31, "setDividerWidth:");
  [(SUUIInteractiveSegmentedControl *)self->_titlesSegmentedControl addTarget:self action:sel__titlesSegmentedControlValueChangeAction_ forControlEvents:4096];
  [(SUUIScrollingSegmentedController *)self _reloadTitleSegments];
  v32 = -[SUUIScrollingSegmentedControllerNavigationBarTitleView initWithFrame:]([SUUIScrollingSegmentedControllerNavigationBarTitleView alloc], "initWithFrame:", v34, v14, v15, v16);
  navigationBarTitleView = self->_navigationBarTitleView;
  self->_navigationBarTitleView = v32;

  [(SUUIScrollingSegmentedControllerNavigationBarTitleView *)self->_navigationBarTitleView setSegmentedControl:self->_titlesSegmentedControl];
}

SUUIStandardInteractiveDividerView *__47__SUUIScrollingSegmentedController_viewDidLoad__block_invoke(double a1, double a2, double a3, double a4)
{
  uint64_t v4 = -[SUUIStandardInteractiveDividerView initWithFrame:]([SUUIStandardInteractiveDividerView alloc], "initWithFrame:", a1, a2, a3, a4);
  return v4;
}

- (void)viewDidLayoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)SUUIScrollingSegmentedController;
  [(SUUIScrollingSegmentedController *)&v32 viewDidLayoutSubviews];
  v3 = [(SUUIScrollingSegmentedController *)self view];
  [v3 setPreservesSuperviewLayoutMargins:1];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  proxyScrollView = self->_proxyScrollView;
  if (proxyScrollView)
  {
    id v13 = [(SUUIProxyScrollView *)proxyScrollView superview];

    if (!v13) {
      [v3 addSubview:self->_proxyScrollView];
    }
  }
  double v15 = *MEMORY[0x263F00148];
  double v14 = *(double *)(MEMORY[0x263F00148] + 8);
  double width = self->_contentCollectionViewItemSize.width;
  if (width == v9 && self->_contentCollectionViewItemSize.height == v11)
  {
    BOOL v18 = 0;
  }
  else
  {
    BOOL v18 = width > 0.00000011920929;
    if (width > 0.00000011920929)
    {
      [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentOffset];
      double v14 = v19;
      UIRoundToViewScale();
      double v15 = v20;
    }
    self->_contentCollectionViewItemSize.double width = v9;
    self->_contentCollectionViewItemSize.height = v11;
    double v21 = [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView collectionViewLayout];
    id v22 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);

    [v22 setInvalidateFlowLayoutDelegateMetrics:1];
    double v23 = [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView collectionViewLayout];
    [v23 invalidateLayoutWithContext:v22];
  }
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.double width = v9;
  v33.size.height = v11;
  double v24 = CGRectGetWidth(v33);
  if (v24 >= 2.0) {
    double v25 = v24;
  }
  else {
    double v25 = 2.0;
  }
  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.double width = v25;
  v34.size.height = v11;
  double Height = CGRectGetHeight(v34);
  if (Height >= 2.0) {
    double v27 = Height;
  }
  else {
    double v27 = 2.0;
  }
  -[SUUIScrollingSegmentedControllerCollectionView setFrame:](self->_contentCollectionView, "setFrame:", v5, v7, v25, v27);
  if (v18)
  {
    v28 = (void *)SUUIMPUFoundationFramework();
    v29 = (uint64_t (*)(uint64_t, double, double))SUUIWeakLinkedSymbolForString("MPUFloatEqualToFloat", v28);
    uint64_t v30 = [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentOffset];
    if ((v29(v30, v15, v31) & 1) == 0) {
      -[SUUIScrollingSegmentedControllerCollectionView setContentOffset:](self->_contentCollectionView, "setContentOffset:", v15, v14);
    }
  }
  [(SUUIScrollingSegmentedController *)self _updateTitlesSelectionProgress];
  [(SUUIScrollingSegmentedControllerNavigationBarTitleView *)self->_navigationBarTitleView setNeedsLayout];
}

- (id)contentScrollView
{
  if (!self->_proxyScrollView && [(SUUIScrollingSegmentedController *)self isViewLoaded])
  {
    v3 = [SUUIProxyScrollView alloc];
    double v4 = -[SUUIProxyScrollView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    proxyScrollView = self->_proxyScrollView;
    self->_proxyScrollView = v4;

    [(SUUIProxyScrollView *)self->_proxyScrollView setHidden:1];
    [(SUUIProxyScrollView *)self->_proxyScrollView setDelegate:self];
    [(SUUIProxyScrollView *)self->_proxyScrollView setScrollEnabled:0];
    [(SUUIProxyScrollView *)self->_proxyScrollView setScrollsToTop:0];
    double v6 = [(SUUIScrollingSegmentedController *)self view];
    [v6 addSubview:self->_proxyScrollView];
  }
  double v7 = self->_proxyScrollView;
  return v7;
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectForKey:@"_SUUIScrollingSegmentedControllerStateRestorationKeySelectedViewController"];
  if (v5)
  {
    double v6 = [(SUUIScrollingSegmentedController *)self viewControllers];
    if ([v6 count])
    {
      uint64_t v7 = [v6 indexOfObject:v5];
      if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
        [(SUUIScrollingSegmentedController *)self selectViewControllerAtIndex:v7 animated:0];
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)SUUIScrollingSegmentedController;
  [(SUUIScrollingSegmentedController *)&v8 decodeRestorableStateWithCoder:v4];
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SUUIScrollingSegmentedController *)self focusedViewControllerIndex];
  double v6 = [(SUUIScrollingSegmentedController *)self viewControllers];
  uint64_t v7 = v6;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && v5 < [v6 count])
  {
    objc_super v8 = [v7 objectAtIndex:v5];
    [v4 encodeObject:v8 forKey:@"_SUUIScrollingSegmentedControllerStateRestorationKeySelectedViewController"];
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUIScrollingSegmentedController;
  [(SUUIScrollingSegmentedController *)&v9 encodeRestorableStateWithCoder:v4];
}

- (void)setClientContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIScrollingSegmentedController;
  [(SUUIViewController *)&v15 setClientContext:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v5 = self->_viewControllers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_2705E11B8, (void)v11)) {
          [v10 setClientContext:v4];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)_SUUIScrollingSegmentTitleValueObservationContext == a6)
  {
    id v13 = v11;
    viewControllers = self->_viewControllers;
    if (viewControllers)
    {
      uint64_t v15 = [(NSArray *)viewControllers indexOfObject:v13];
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v16 = v15;
        uint64_t v17 = [(SUUIInteractiveSegmentedControl *)self->_titlesSegmentedControl segments];
        BOOL v18 = [v17 objectAtIndex:v16];

        if ([(SUUIScrollingSegmentedController *)self _configureSegment:v18 forViewController:v13]&& [(SUUIScrollingSegmentedController *)self isViewLoaded])
        {
          double v19 = [(SUUIScrollingSegmentedController *)self view];
          [v19 setNeedsLayout];
        }
      }
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SUUIScrollingSegmentedController;
    [(SUUIScrollingSegmentedController *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)scrollViewDidChangeContentInset:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = (SUUIProxyScrollView *)a3;
  unint64_t v5 = v4;
  if (self->_proxyScrollView == v4)
  {
    uint64_t v6 = [(SUUIProxyScrollView *)v4 window];

    if (v6)
    {
      [(SUUIProxyScrollView *)v5 contentInset];
      BOOL v11 = self->_proxyScrollViewContentInsetAdjustment.left == v8
         && self->_proxyScrollViewContentInsetAdjustment.top == v7;
      BOOL v12 = v11 && self->_proxyScrollViewContentInsetAdjustment.right == v10;
      if (!v12 || self->_proxyScrollViewContentInsetAdjustment.bottom != v9)
      {
        self->_proxyScrollViewContentInsetAdjustment.top = v7;
        self->_proxyScrollViewContentInsetAdjustment.left = v8;
        self->_proxyScrollViewContentInsetAdjustment.bottom = v9;
        self->_proxyScrollViewContentInsetAdjustment.right = v10;
        [(SUUIScrollingSegmentedController *)self _viewControllerContentScrollViewContentInset];
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        id v22 = [(SUUIScrollingSegmentedController *)self viewControllers];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v29 != v25) {
                objc_enumerationMutation(v22);
              }
              double v27 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * i)];
              objc_msgSend(v27, "applyNewContentInset:", v15, v17, v19, v21);
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v24);
        }
      }
    }
  }
}

- (void)scrollingSegmentedControllerCollectionViewDidLayoutSubviews:(id)a3
{
  if (self->_contentCollectionView == a3)
  {
    [(SUUIScrollingSegmentedController *)self _updateTitlesSelectionProgress];
    id v4 = [(SUUIScrollingSegmentedController *)self _indexPathOfFocusedItemAllowingLayoutIfNeeded:0];
    unint64_t v5 = v4;
    if (v4)
    {
      double v7 = v4;
      id v4 = (void *)[v4 item];
      unint64_t v5 = v7;
      if ((void *)self->_focusedViewControllerIndex != v4)
      {
        self->_focusedViewControllerIndex = (unint64_t)v4;
        if (v4 != (void *)0x7FFFFFFFFFFFFFFFLL)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if (objc_opt_respondsToSelector()) {
            [WeakRetained scrollingSegmentedController:self didFocusViewControllerAtIndex:self->_focusedViewControllerIndex];
          }

          unint64_t v5 = v7;
        }
      }
    }
    else if (self->_focusedViewControllerIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_focusedViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    MEMORY[0x270F9A758](v4, v5);
  }
}

- (void)contentScrollViewDidChangeForScrollingSegmentedControllerItemContext:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    unint64_t v5 = [v8 viewController];
    viewControllers = self->_viewControllers;
    if (viewControllers)
    {
      uint64_t v7 = [(NSArray *)viewControllers indexOfObject:v5];
      if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
        [WeakRetained scrollingSegmentedController:self contentScrollViewDidChangeForViewControllerAtIndex:v7];
      }
    }
  }
}

- (void)scrollingTabAppearanceStatusWasUpdated:(id)a3
{
  self->_scrollingTabAppearanceStatus = ($D35E09B864CB17FEE2308AEA3FA0107F)a3;
  if ([(SUUIScrollingSegmentedController *)self isViewLoaded])
  {
    [(SUUIScrollingSegmentedController *)self _updateTitlesSelectionProgress];
  }
}

- (UIScrollView)scrollingTabNestedPagingScrollView
{
  id v3 = (id)[(SUUIScrollingSegmentedController *)self view];
  contentCollectionView = self->_contentCollectionView;
  return (UIScrollView *)contentCollectionView;
}

- (id)scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3
{
  return [(NSArray *)self->_viewControllers objectAtIndex:a3];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (self->_contentCollectionView == a3) {
    return [(NSArray *)self->_viewControllers count];
  }
  else {
    return 0;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  if (self->_contentCollectionView == a3)
  {
    id v7 = a4;
    id v4 = [a3 dequeueReusableCellWithReuseIdentifier:0x2704FB0D0 forIndexPath:v7];
    viewControllers = self->_viewControllers;
    uint64_t v9 = [v7 item];

    double v10 = [(NSArray *)viewControllers objectAtIndex:v9];
    id v11 = (id)[v10 view];
    BOOL v12 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:v10];
    [(SUUIScrollingSegmentedController *)self _viewControllerContentScrollViewContentInset];
    objc_msgSend(v12, "applyNewContentInset:");
    [v12 updateAppliedContentInsetsAdjustment];
    [v4 setViewController:v10];
    [v4 setMaximumContentWidth:self->_maximumContentWidth];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a5;
  if (self->_contentCollectionView == a3)
  {
    id v9 = v7;
    id v8 = [(SUUIScrollingSegmentedController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v8, "scrollingSegmentedController:didEndDisplayingViewControllerAtIndex:", self, objc_msgSend(v9, "item") % -[NSArray count](self->_viewControllers, "count"));
    }

    id v7 = v9;
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a5;
  if (self->_contentCollectionView == a3)
  {
    id v9 = v7;
    id v8 = [(SUUIScrollingSegmentedController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v8, "scrollingSegmentedController:willDisplayViewControllerAtIndex:", self, objc_msgSend(v9, "item") % -[NSArray count](self->_viewControllers, "count"));
    }

    id v7 = v9;
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  if (self->_contentCollectionView == a3) {
    p_contentCollectionViewItemSize = &self->_contentCollectionViewItemSize;
  }
  else {
    p_contentCollectionViewItemSize = (CGSize *)MEMORY[0x263F001B0];
  }
  double width = p_contentCollectionViewItemSize->width;
  double height = p_contentCollectionViewItemSize->height;
  if (p_contentCollectionViewItemSize->width < 2.0) {
    double width = 2.0;
  }
  if (height < 2.0) {
    double height = 2.0;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_contentCollectionView == a3)
  {
    [(SUUIScrollingSegmentedController *)self _updateTitlesSelectionProgress];
    [(SUUIScrollingSegmentedController *)self _updateViewBackgroundColor];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_contentCollectionView == a3)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_delegate);
      [v7 scrollingSegmentedControllerDidEndDecelerating:self];
    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (self->_contentCollectionView == a3)
  {
    BOOL v4 = a4;
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 scrollingSegmentedControllerDidEndDragging:self willDecelerate:v4];
    }
  }
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  if (self->_contentCollectionView == a3)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_delegate);
      [v7 scrollingSegmentedControllerWillBeginDecelerating:self];
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (self->_contentCollectionView == a3)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_delegate);
      [v7 scrollingSegmentedControllerWillBeginDragging:self];
    }
  }
}

- (UIViewController)focusedViewController
{
  return (UIViewController *)[(NSArray *)self->_viewControllers objectAtIndex:self->_focusedViewControllerIndex];
}

- (void)setMaximumContentWidth:(double)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (vabdd_f64(self->_maximumContentWidth, a3) > 0.00000011920929)
  {
    self->_maximumContentdouble Width = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v4 = [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView visibleCells];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v9 setMaximumContentWidth:self->_maximumContentWidth];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setScrollEnabled:(BOOL)a3
{
  if (self->_scrollEnabled != a3)
  {
    self->_scrollEnabled = a3;
    -[SUUIScrollingSegmentedControllerCollectionView setScrollEnabled:](self->_contentCollectionView, "setScrollEnabled:");
  }
}

- (void)setViewControllers:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__SUUIScrollingSegmentedController_setViewControllers___block_invoke;
  v5[3] = &unk_265400980;
  v5[4] = self;
  BOOL v4 = self;
  [(SUUIScrollingSegmentedController *)v4 _setViewControllers:a3 viewUpdatesHandler:v5];
}

void __55__SUUIScrollingSegmentedController_setViewControllers___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadTitleSegments];
  [*(id *)(*(void *)(a1 + 32) + 1064) reloadData];
  [*(id *)(a1 + 32) _updateScrollViewContentOffsetsToTargetContentOffsets];
  if ([*(id *)(a1 + 32) isViewLoaded])
  {
    v2 = [*(id *)(a1 + 32) view];
    [v2 setNeedsLayout];

    id v3 = [*(id *)(a1 + 32) navigationBarTitleView];
    [v3 setNeedsLayout];
  }
}

- (UIEdgeInsets)segmentedControlContentEdgeInsets
{
  v2 = [(SUUIScrollingSegmentedController *)self navigationBarTitleView];
  [v2 layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setSegmentedControlContentEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(SUUIScrollingSegmentedController *)self navigationBarTitleView];
  objc_msgSend(v7, "setLayoutMargins:", top, left, bottom, right);
}

- (double)segmentedControlHeight
{
  v2 = [(SUUIScrollingSegmentedController *)self navigationBarTitleView];
  [v2 segmentedControlMinimumHeight];
  double v4 = v3;

  return v4;
}

- (void)setSegmentedControlHeight:(double)a3
{
  id v4 = [(SUUIScrollingSegmentedController *)self navigationBarTitleView];
  [v4 setSegmentedControlMinimumHeight:a3];
}

- (int64_t)segmentedControlLayoutStyle
{
  v2 = [(SUUIScrollingSegmentedController *)self navigationBarTitleView];
  int64_t v3 = [v2 layoutStyle];

  return v3;
}

- (void)setSegmentedControlLayoutStyle:(int64_t)a3
{
  id v4 = [(SUUIScrollingSegmentedController *)self navigationBarTitleView];
  [v4 setLayoutStyle:a3];
}

- (void)setWantsWhiteBackgroundBeyondLeftEdgeWhenBouncing:(BOOL)a3
{
  if (self->_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing != a3)
  {
    self->_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing = a3;
    [(SUUIScrollingSegmentedController *)self _updateViewBackgroundColor];
  }
}

- (void)setWantsWhiteBackgroundBeyondRightEdgeWhenBouncing:(BOOL)a3
{
  if (self->_wantsWhiteBackgroundBeyondRightEdgeWhenBouncing != a3)
  {
    self->_wantsWhiteBackgroundBeyondRightEdgeWhenBouncing = a3;
    [(SUUIScrollingSegmentedController *)self _updateViewBackgroundColor];
  }
}

- (void)replaceViewControllerAtIndex:(unint64_t)a3 withViewController:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[(NSArray *)self->_viewControllers mutableCopy];
  [v7 replaceObjectAtIndex:a3 withObject:v6];
  double v8 = [(NSArray *)self->_viewControllers objectAtIndex:a3];
  double v9 = [v8 title];
  double v10 = [v6 title];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    NSUInteger v12 = [(NSArray *)self->_viewControllers count];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __84__SUUIScrollingSegmentedController_replaceViewControllerAtIndex_withViewController___block_invoke;
    v14[3] = &unk_265402F60;
    v14[4] = self;
    NSUInteger v16 = v12;
    unint64_t v17 = a3;
    id v15 = v6;
    double v13 = self;
    [(SUUIScrollingSegmentedController *)v13 _setViewControllers:v7 viewUpdatesHandler:v14];
  }
  else
  {
    [(SUUIScrollingSegmentedController *)self setViewControllers:v7];
  }
}

void __84__SUUIScrollingSegmentedController_replaceViewControllerAtIndex_withViewController___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 1064);
  [v2 indexPathsForVisibleItems];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v8, "item", (void)v13) % *(void *)(a1 + 48) == *(void *)(a1 + 56))
        {
          uint64_t v9 = [v2 cellForItemAtIndexPath:v8];
          if (v9)
          {
            double v10 = (void *)v9;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  double v10 = 0;
LABEL_12:

  id v11 = (id)[*(id *)(a1 + 40) view];
  NSUInteger v12 = [*(id *)(*(void *)(a1 + 32) + 1160) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _viewControllerContentScrollViewContentInset];
  objc_msgSend(v12, "applyNewContentInset:");
  [v10 setViewController:*(void *)(a1 + 40)];
}

- (void)selectViewControllerAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = a4;
    if ([(NSArray *)self->_viewControllers count] > a3)
    {
      if (([(SUUIScrollingSegmentedController *)self isViewLoaded] & 1) == 0)
      {
        id v7 = [(SUUIScrollingSegmentedController *)self view];
        [v7 layoutIfNeeded];
      }
      [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView layoutIfNeeded];
      contentCollectionView = self->_contentCollectionView;
      uint64_t v9 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
      id v25 = [(SUUIScrollingSegmentedControllerCollectionView *)contentCollectionView layoutAttributesForItemAtIndexPath:v9];

      [v25 frame];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentOffset];
      double v19 = v18;
      [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentInset];
      double v21 = v20;
      double v23 = v22;
      double v24 = v19 + v20;
      v27.origin.x = v11;
      v27.origin.y = v13;
      v27.size.double width = v15;
      v27.size.double height = v17;
      -[SUUIScrollingSegmentedControllerCollectionView setContentOffset:animated:](self->_contentCollectionView, "setContentOffset:animated:", v4, CGRectGetMinX(v27) - v23, v24 - v21);
    }
  }
}

- (void)_titlesSegmentedControlValueChangeAction:(id)a3
{
  if (self->_titlesSegmentedControl == a3)
  {
    [a3 selectionProgress];
    -[SUUIScrollingSegmentedController _scrollToTitlesSelectionProgress:animated:](self, "_scrollToTitlesSelectionProgress:animated:", 0);
  }
}

- (BOOL)_configureSegment:(id)a3 forViewController:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 navigationItem];
  uint64_t v7 = [v6 title];

  if (v7) {
    double v8 = (__CFString *)v7;
  }
  else {
    double v8 = &stru_2704F8130;
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v8];
  double v10 = [v5 attributedTitle];
  CGFloat v11 = v10;
  if (v10 == v9 || ([v10 isEqualToAttributedString:v9] & 1) != 0)
  {
    BOOL v12 = 0;
  }
  else
  {
    [v5 setAttributedTitle:v9];
    BOOL v12 = 1;
  }

  return v12;
}

- (id)_indexPathOfFocusedItemAllowingLayoutIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView bounds];
  UIRectGetCenter();
  double v6 = v5;
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentOffset];
  double v8 = v7;
  uint64_t v9 = self->_contentCollectionView;
  [(SUUIScrollingSegmentedControllerCollectionView *)v9 contentOffset];
  double v11 = v10;
  if (v3) {
    [(SUUIScrollingSegmentedControllerCollectionView *)v9 layoutIfNeeded];
  }
  [(SUUIScrollingSegmentedControllerCollectionView *)v9 visibleCells];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    double v14 = 0;
    CGFloat v15 = 0;
    uint64_t v16 = *(void *)v28;
    double v17 = v6 - v8 + v11;
    double v18 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(obj);
        }
        double v20 = [(SUUIScrollingSegmentedControllerCollectionView *)v9 indexPathForCell:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        if (v20)
        {
          double v21 = [(SUUIScrollingSegmentedControllerCollectionView *)v9 layoutAttributesForItemAtIndexPath:v20];
          [v21 frame];
          double v22 = v17 - CGRectGetMidX(v34);
          if (!v14 || fabs(v22) < fabs(v18))
          {
            id v23 = v20;

            id v24 = v21;
            double v14 = v23;
            CGFloat v15 = v24;
            double v18 = v22;
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
  }
  else
  {
    double v14 = 0;
    CGFloat v15 = 0;
  }

  return v14;
}

- (void)_reloadTitleSegments
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SUUIInteractiveSegmentedControl *)self->_titlesSegmentedControl segments];
  BOOL v4 = (void *)[v3 mutableCopy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = self->_viewControllers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    double v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v4 firstObject];
        if (v12)
        {
          uint64_t v13 = (SUUIStandardInteractiveSegment *)v12;
          [v4 removeObjectAtIndex:0];
        }
        else
        {
          uint64_t v13 = objc_alloc_init(SUUIStandardInteractiveSegment);
        }
        [(SUUIScrollingSegmentedController *)self _configureSegment:v13 forViewController:v11];
        if (!v8) {
          double v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_viewControllers, "count"));
        }
        [v8 addObject:v13];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    double v8 = 0;
  }

  [(SUUIInteractiveSegmentedControl *)self->_titlesSegmentedControl setSegments:v8];
  [(SUUIScrollingSegmentedController *)self _updateTitlesSelectionProgress];
  double v14 = [(SUUIScrollingSegmentedController *)self navigationBarTitleView];
  [v14 sizeToFit];
}

- (void)_scrollToTitlesSelectionProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentSize];
  double v7 = v6;
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView bounds];
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  CGFloat rect = v29.origin.x;
  double rect_8 = v7;
  double v11 = v7 - CGRectGetWidth(v29);
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentInset];
  double v13 = v12;
  double v15 = v14;
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentOffset];
  double rect_16 = v16;
  long long v17 = [(SUUIInteractiveSegmentedControl *)self->_titlesSegmentedControl segments];
  double v18 = 1.0 / (double)(unint64_t)[v17 count];

  double v19 = 0.0;
  if (1.0 - v18 > 0.00000011920929) {
    double v19 = (a3 + v18 * -0.5) / (1.0 - v18);
  }
  double v20 = v11 * v19 - v15;
  double v21 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v22 = [v21 userInterfaceLayoutDirection];

  if (v22 == 1)
  {
    v30.origin.x = rect;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double v20 = rect_8 - v20 - CGRectGetWidth(v30);
  }
  contentCollectionView = self->_contentCollectionView;
  -[SUUIScrollingSegmentedControllerCollectionView setContentOffset:animated:](contentCollectionView, "setContentOffset:animated:", v4, v20, v13 + rect_16 - v13);
}

- (void)_setViewControllers:(id)a3 viewUpdatesHandler:(id)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  double v6 = (NSArray *)a3;
  double v7 = (void (**)(void))a4;
  viewControllers = self->_viewControllers;
  if (viewControllers != v6 && ![(NSArray *)viewControllers isEqualToArray:v6])
  {
    v57 = v7;
    uint64_t v9 = (void *)[(NSArray *)self->_viewControllers copy];
    v56 = v6;
    double v10 = (NSArray *)[(NSArray *)v6 copy];
    double v11 = self->_viewControllers;
    self->_viewControllers = v10;

    v58 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v72 objects:v79 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v73;
      double v16 = *MEMORY[0x263F834E8];
      double v17 = *(double *)(MEMORY[0x263F834E8] + 8);
      double v18 = *(double *)(MEMORY[0x263F834E8] + 16);
      double v19 = *(double *)(MEMORY[0x263F834E8] + 24);
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v73 != v15) {
            objc_enumerationMutation(v12);
          }
          double v21 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          if (![(NSArray *)self->_viewControllers containsObject:v21])
          {
            uint64_t v22 = [v21 parentViewController];

            if (v22 == self)
            {
              [v58 addObject:v21];
              [v21 willMoveToParentViewController:0];
            }
            id v23 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:v21];
            objc_msgSend(v23, "applyNewContentInset:", v16, v17, v18, v19);
            if ([v21 isViewLoaded])
            {
              id v24 = [v21 view];
              [v24 removeFromSuperview];
            }
            [(NSMapTable *)self->_viewControllerToItemContext removeObjectForKey:v21];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v72 objects:v79 count:16];
      }
      while (v14);
    }

    id v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_viewControllers, "count"));
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v26 = self->_viewControllers;
    uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v68 objects:v78 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v69;
      p_cache = SUUIAccountButtonsSection.cache;
      id v59 = v12;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v69 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v32 = *(void **)(*((void *)&v68 + 1) + 8 * j);
          if (([v12 containsObject:v32] & 1) == 0)
          {
            [v25 addObject:v32];
            if ([v32 conformsToProtocol:&unk_2705E11B8])
            {
              uint64_t v33 = [(SUUIViewController *)self clientContext];
              [v32 setClientContext:v33];
            }
            [(SUUIScrollingSegmentedController *)self addChildViewController:v32];
            CGRect v34 = (void *)[objc_alloc((Class)(p_cache + 298)) initWithViewController:v32];
            [v34 setDelegate:self];
            viewControllerToItemContext = self->_viewControllerToItemContext;
            if (!viewControllerToItemContext)
            {
              uint64_t v36 = v28;
              uint64_t v37 = v29;
              CGRect v38 = v26;
              CGRect v39 = v25;
              id v40 = objc_alloc(MEMORY[0x263F08968]);
              NSUInteger v41 = [(NSArray *)self->_viewControllers count];
              v42 = v40;
              id v25 = v39;
              v26 = v38;
              uint64_t v29 = v37;
              uint64_t v28 = v36;
              p_cache = (void **)(SUUIAccountButtonsSection + 16);
              v43 = (NSMapTable *)[v42 initWithKeyOptions:0 valueOptions:0 capacity:v41];
              v44 = self->_viewControllerToItemContext;
              self->_viewControllerToItemContext = v43;

              viewControllerToItemContext = self->_viewControllerToItemContext;
            }
            [(NSMapTable *)viewControllerToItemContext setObject:v34 forKey:v32];

            id v12 = v59;
          }
        }
        uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v68 objects:v78 count:16];
      }
      while (v28);
    }

    if (v57) {
      v57[2]();
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v45 = v25;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v65;
      do
      {
        for (uint64_t k = 0; k != v47; ++k)
        {
          if (*(void *)v65 != v48) {
            objc_enumerationMutation(v45);
          }
          [*(id *)(*((void *)&v64 + 1) + 8 * k) didMoveToParentViewController:self];
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v64 objects:v77 count:16];
      }
      while (v47);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v50 = v58;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v60 objects:v76 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v61;
      do
      {
        for (uint64_t m = 0; m != v52; ++m)
        {
          if (*(void *)v61 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = *(void **)(*((void *)&v60 + 1) + 8 * m);
          [v55 removeFromParentViewController];
          if ([v55 conformsToProtocol:&unk_2705E11B8]) {
            [v55 setClientContext:0];
          }
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v60 objects:v76 count:16];
      }
      while (v52);
    }

    [(SUUIScrollingSegmentedController *)self _updateTitleValueObservation];
    double v6 = v56;
    double v7 = v57;
  }
}

- (void)_updateScrollViewContentOffsetsToTargetContentOffsets
{
  if ([(SUUIScrollingSegmentedController *)self isViewLoaded])
  {
    BOOL v3 = [(SUUIScrollingSegmentedController *)self view];
    [v3 bounds];
    double Width = CGRectGetWidth(v12);

    [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentSize];
    double v6 = v5;
    [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView bounds];
    double MidX = CGRectGetMidX(v13);
    if (MidX < 1.0) {
      double MidX = 1.0;
    }
    if (MidX >= v6) {
      double MidX = v6;
    }
    double v8 = round((MidX + -1.0) / Width);
    [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentOffset];
    if (v9 != Width * v8)
    {
      contentCollectionView = self->_contentCollectionView;
      -[SUUIScrollingSegmentedControllerCollectionView setContentOffset:](contentCollectionView, "setContentOffset:");
    }
  }
}

- (void)_updateTitlesSelectionProgress
{
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentSize];
  double v4 = v3;
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView bounds];
  double v5 = v4 - CGRectGetWidth(v19);
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentInset];
  double v7 = v6;
  [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentOffset];
  double v9 = (v7 + v8) / v5;
  double v10 = [(SUUIInteractiveSegmentedControl *)self->_titlesSegmentedControl segments];
  double v11 = 1.0 / (double)(unint64_t)[v10 count];

  double v12 = v11 * 0.5 + (1.0 - v11) * v9;
  if (v12 < v11 * 0.5) {
    double v12 = v11 * 0.5;
  }
  if (v12 >= 1.0 - v11 * 0.5) {
    double v13 = 1.0 - v11 * 0.5;
  }
  else {
    double v13 = v12;
  }
  uint64_t v14 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v15 = [v14 userInterfaceLayoutDirection];

  double v16 = 1.0 - v13;
  if (v15 != 1) {
    double v16 = v13;
  }
  titlesSegmentedControl = self->_titlesSegmentedControl;
  [(SUUIInteractiveSegmentedControl *)titlesSegmentedControl setSelectionProgress:v16];
}

- (void)_updateTitleValueObservation
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  double v3 = [(SUUIScrollingSegmentedController *)self viewControllers];
  double v4 = (void *)[(NSMutableArray *)self->_titleObservingViewControllers mutableCopy];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v4 removeObject:v9];
        if (([(NSMutableArray *)self->_titleObservingViewControllers containsObject:v9] & 1) == 0)
        {
          titleObservingViewControllers = self->_titleObservingViewControllers;
          if (!titleObservingViewControllers)
          {
            double v11 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(obj, "count"));
            double v12 = self->_titleObservingViewControllers;
            self->_titleObservingViewControllers = v11;

            titleObservingViewControllers = self->_titleObservingViewControllers;
          }
          [(NSMutableArray *)titleObservingViewControllers addObject:v9];
          [v9 addObserver:self forKeyPath:@"navigationItem.title" options:0 context:_SUUIScrollingSegmentTitleValueObservationContext];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * j) removeObserver:self forKeyPath:@"navigationItem.title" context:_SUUIScrollingSegmentTitleValueObservationContext];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  [(NSMutableArray *)self->_titleObservingViewControllers removeObjectsInArray:v13];
  if (![(NSMutableArray *)self->_titleObservingViewControllers count])
  {
    double v18 = self->_titleObservingViewControllers;
    self->_titleObservingViewControllers = 0;
  }
}

- (void)_updateViewBackgroundColor
{
  if (![(SUUIScrollingSegmentedController *)self isViewLoaded]) {
    return;
  }
  p_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing = &self->_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing;
  if (self->_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing
    || (BOOL wantsWhiteBackgroundBeyondRightEdgeWhenBouncing = self->_wantsWhiteBackgroundBeyondRightEdgeWhenBouncing))
  {
    [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentOffset];
    double v6 = v5;
    if (v5 > -0.00000011920929)
    {
      [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView contentSize];
      double v8 = v7;
      [(SUUIScrollingSegmentedControllerCollectionView *)self->_contentCollectionView bounds];
      if (v6 < v8 - CGRectGetWidth(v12) + 0.00000011920929)
      {
        BOOL wantsWhiteBackgroundBeyondRightEdgeWhenBouncing = 0;
        goto LABEL_9;
      }
      p_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing = &self->_wantsWhiteBackgroundBeyondRightEdgeWhenBouncing;
    }
    BOOL wantsWhiteBackgroundBeyondRightEdgeWhenBouncing = *p_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing;
  }
LABEL_9:
  if (self->_viewBackgroundIsWhite != wantsWhiteBackgroundBeyondRightEdgeWhenBouncing)
  {
    self->_viewBackgroundIsWhite = wantsWhiteBackgroundBeyondRightEdgeWhenBouncing;
    if (wantsWhiteBackgroundBeyondRightEdgeWhenBouncing) {
      [MEMORY[0x263F825C8] whiteColor];
    }
    else {
    id v10 = [MEMORY[0x263F825C8] clearColor];
    }
    double v9 = [(SUUIScrollingSegmentedController *)self view];
    [v9 setBackgroundColor:v10];
  }
}

- (UIEdgeInsets)_viewControllerContentScrollViewContentInset
{
  double top = self->_proxyScrollViewContentInsetAdjustment.top;
  double left = self->_proxyScrollViewContentInsetAdjustment.left;
  double bottom = self->_proxyScrollViewContentInsetAdjustment.bottom;
  double right = self->_proxyScrollViewContentInsetAdjustment.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_viewControllerNeedsContentScrollViewUpdates:(id)a3
{
  id v3 = [(NSMapTable *)self->_viewControllerToItemContext objectForKey:a3];
  [v3 updateAppliedContentInsetsAdjustment];
}

- (SUUIScrollingSegmentedControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIScrollingSegmentedControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (unint64_t)focusedViewControllerIndex
{
  return self->_focusedViewControllerIndex;
}

- (SUUIScrollingSegmentedControllerNavigationBarTitleView)navigationBarTitleView
{
  return self->_navigationBarTitleView;
}

- (BOOL)wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing
{
  return self->_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing;
}

- (BOOL)wantsWhiteBackgroundBeyondRightEdgeWhenBouncing
{
  return self->_wantsWhiteBackgroundBeyondRightEdgeWhenBouncing;
}

- (SUUIInteractiveSegmentedControl)_titlesSegmentedControl
{
  return self->_titlesSegmentedControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewControllerToItemContext, 0);
  objc_storeStrong((id *)&self->_titlesSegmentedControl, 0);
  objc_storeStrong((id *)&self->_titleObservingViewControllers, 0);
  objc_storeStrong((id *)&self->_proxyScrollView, 0);
  objc_storeStrong((id *)&self->_navigationBarTitleView, 0);
  objc_storeStrong((id *)&self->_contentCollectionView, 0);
}

@end