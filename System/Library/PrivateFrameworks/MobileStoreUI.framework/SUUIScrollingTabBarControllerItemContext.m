@interface SUUIScrollingTabBarControllerItemContext
- (BOOL)viewControllerIsNavigationController;
- (SUUIScrollingTabBarControllerItemContext)init;
- (SUUIScrollingTabBarControllerItemContext)initWithViewController:(id)a3;
- (SUUIScrollingTabBarControllerItemContextDelegate)delegate;
- (SUUIViewControllerContainerCollectionViewCell)collectionViewCell;
- (UIScrollView)nestedPagingScrollView;
- (UIViewController)viewController;
- (double)nestedPagingScrollViewContentWidth;
- (id)_appearanceStatusObserver;
- (id)_nestedPagedScrollingConformingViewControllerForcingViewLoading:(BOOL)a3;
- (id)viewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3;
- (unint64_t)lastSelectedPageIndex;
- (void)_applyNewContentInset:(UIEdgeInsets)a3 withOldContentInset:(UIEdgeInsets)a4 toContentScrollView:(id)a5;
- (void)_notifyDelegateOfUpdatedContentWidthInObservedNestedPagingScrollView;
- (void)_prepareViewControllerForDisplayWithViewFrame:(CGRect)a3 updateContentOffset:(BOOL)a4 contentOffset:(CGPoint)a5;
- (void)_prepareViewControllerForTearDown;
- (void)_updateAppliedContentInsetsAdjustment;
- (void)applyNewContentInsetDescriptor:(id *)a3;
- (void)dealloc;
- (void)notifyOfUpdatedAppearanceStatus:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)observedNavigationStackDidChange:(id)a3;
- (void)prepareViewControllerForDisplayWithSize:(CGSize)a3;
- (void)setCollectionViewCell:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastSelectedPageIndex:(unint64_t)a3;
- (void)updateForPossibleNestedPagingScrollViewChange;
- (void)updateNestedPagingScrollViewContentOffset:(CGPoint)a3;
@end

@implementation SUUIScrollingTabBarControllerItemContext

- (SUUIScrollingTabBarControllerItemContext)init
{
  return [(SUUIScrollingTabBarControllerItemContext *)self initWithViewController:0];
}

- (SUUIScrollingTabBarControllerItemContext)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIScrollingTabBarControllerItemContext;
  v6 = [(SUUIScrollingTabBarControllerItemContext *)&v9 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_viewController, a3);
      v7->_viewControllerIsNavigationController = -1;
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  [(SUUIScrollingTabBarControllerItemContext *)self prepareViewControllerForTearDown];
  v3.receiver = self;
  v3.super_class = (Class)SUUIScrollingTabBarControllerItemContext;
  [(SUUIScrollingTabBarControllerItemContext *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)_SUUIScrollingTabNestedPagingScrollViewContentOffsetObservingContext == a6)
  {
    if (!self->_adjustingNestedPagingScrollViewContentOffset)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained scrollingTabBarControllerItemContextRequestsContentOffsetUpdate:self];
      }
    }
  }
  else if ((void *)_SUUIScrollingTabNestedPagingScrollViewContentSizeObservingContext == a6)
  {
    [(SUUIScrollingTabBarControllerItemContext *)self _notifyDelegateOfUpdatedContentWidthInObservedNestedPagingScrollView];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SUUIScrollingTabBarControllerItemContext;
    [(SUUIScrollingTabBarControllerItemContext *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)observedNavigationStackDidChange:(id)a3
{
  id v7 = a3;
  v4 = [(SUUIScrollingTabBarControllerItemContext *)self _nestedPagedScrollingConformingViewControllerForcingViewLoading:1];
  id v5 = [v4 scrollingTabNestedPagingScrollView];
  if (v5 != self->_observedNestedPagingScrollView) {
    [(SUUIScrollingTabBarControllerItemContext *)self updateForPossibleNestedPagingScrollViewChange];
  }
  [(SUUIScrollingTabBarControllerItemContext *)self _updateAppliedContentInsetsAdjustment];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained scrollingTabBarControllerItemContext:self observedNavigationStackDidChange:v7];
  }
}

- (UIScrollView)nestedPagingScrollView
{
  return self->_observedNestedPagingScrollView;
}

- (double)nestedPagingScrollViewContentWidth
{
  observedNestedPagingScrollView = self->_observedNestedPagingScrollView;
  if (!observedNestedPagingScrollView) {
    return 0.0;
  }
  [(UIScrollView *)observedNestedPagingScrollView contentSize];
  self->_lastSeenContentWidth = result;
  return result;
}

- (BOOL)viewControllerIsNavigationController
{
  int viewControllerIsNavigationController = self->_viewControllerIsNavigationController;
  if (viewControllerIsNavigationController < 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int viewControllerIsNavigationController = isKindOfClass & 1;
    self->_int viewControllerIsNavigationController = isKindOfClass & 1;
  }
  return viewControllerIsNavigationController != 0;
}

- (void)applyNewContentInsetDescriptor:(id *)a3
{
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_desiredContentInsetAdjustmentDescriptor.contentInset.top, *(float64x2_t *)&a3->var0.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_desiredContentInsetAdjustmentDescriptor.contentInset.bottom, *(float64x2_t *)&a3->var0.bottom))), 0xFuLL))) & 1) == 0|| vabdd_f64(self->_desiredContentInsetAdjustmentDescriptor.bottomInsetValueAddedForScrollingTabBar, a3->var1) > 0.00000011920929)
  {
    long long v3 = *(_OWORD *)&a3->var0.top;
    long long v4 = *(_OWORD *)&a3->var0.bottom;
    self->_desiredContentInsetAdjustmentDescriptor.bottomInsetValueAddedForScrollingTabBar = a3->var1;
    *(_OWORD *)&self->_desiredContentInsetAdjustmentDescriptor.contentInset.top = v3;
    *(_OWORD *)&self->_desiredContentInsetAdjustmentDescriptor.contentInset.bottom = v4;
    [(SUUIScrollingTabBarControllerItemContext *)self _updateAppliedContentInsetsAdjustment];
  }
}

- (void)notifyOfUpdatedAppearanceStatus:(id)a3
{
  uint64_t v3 = *(void *)&a3.var1;
  double var0 = a3.var0;
  if (vabdd_f64(self->_lastSentAppearanceStatus.progress, a3.var0) > 0.00000011920929
    || a3.var1 != self->_lastSentAppearanceStatus.isBouncingOffTheEdge)
  {
    v6 = [(SUUIScrollingTabBarControllerItemContext *)self _appearanceStatusObserver];
    if (v6)
    {
      id v7 = v6;
      objc_msgSend(v6, "scrollingTabAppearanceStatusWasUpdated:", *(void *)&var0, v3);
      v6 = v7;
      self->_lastSentAppearanceStatus.progress = var0;
      *(void *)&self->_lastSentAppearanceStatus.isBouncingOffTheEdge = v3;
    }
  }
}

- (void)prepareViewControllerForDisplayWithSize:(CGSize)a3
{
}

- (void)updateForPossibleNestedPagingScrollViewChange
{
  observedNestedPagingScrollView = self->_observedNestedPagingScrollView;
  if (observedNestedPagingScrollView) {
    [(UIScrollView *)self->_observedNestedPagingScrollView contentOffset];
  }
  [(SUUIScrollingTabBarControllerItemContext *)self _prepareViewControllerForTearDown];
  id v4 = [(UIViewController *)self->_viewController view];
  [v4 frame];
  -[SUUIScrollingTabBarControllerItemContext _prepareViewControllerForDisplayWithViewFrame:updateContentOffset:contentOffset:](self, "_prepareViewControllerForDisplayWithViewFrame:updateContentOffset:contentOffset:", observedNestedPagingScrollView != 0);
}

- (void)updateNestedPagingScrollViewContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->_adjustingNestedPagingScrollViewContentOffset)
  {
    id v7 = [(SUUIScrollingTabBarControllerItemContext *)self nestedPagingScrollView];
    objc_msgSend(v7, "setContentOffset:", x, y);
  }
  else
  {
    self->_adjustingNestedPagingScrollViewContentOffset = 1;
    v6 = [(SUUIScrollingTabBarControllerItemContext *)self nestedPagingScrollView];
    objc_msgSend(v6, "setContentOffset:", x, y);

    self->_adjustingNestedPagingScrollViewContentOffset = 0;
  }
}

- (id)viewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3
{
  id v4 = [(SUUIScrollingTabBarControllerItemContext *)self _nestedPagedScrollingConformingViewControllerForcingViewLoading:0];
  id v5 = [v4 scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:a3];

  return v5;
}

- (id)_appearanceStatusObserver
{
  BOOL v3 = [(SUUIScrollingTabBarControllerItemContext *)self viewControllerIsNavigationController];
  viewController = self->_viewController;
  if (v3)
  {
    id v5 = viewController;
    v6 = [(UIViewController *)v5 viewControllers];
    id v7 = [v6 firstObject];

    LODWORD(v6) = [v7 conformsToProtocol:&unk_2705E1768];
    if (v6) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else if ([(UIViewController *)viewController conformsToProtocol:&unk_2705E1768])
  {
    v8 = self->_viewController;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_applyNewContentInset:(UIEdgeInsets)a3 withOldContentInset:(UIEdgeInsets)a4 toContentScrollView:(id)a5
{
  if (a4.left != a3.left || a4.top != a3.top || a4.right != a3.right || a4.bottom != a3.bottom)
  {
    double right = a4.right;
    double bottom = a4.bottom;
    double left = a4.left;
    double top = a4.top;
    double v13 = a3.right;
    double v14 = a3.bottom;
    double v15 = a3.left;
    double v16 = a3.top;
    id v37 = a5;
    [v37 contentInset];
    double v27 = v17;
    double v28 = v18;
    double v29 = v19;
    double v30 = v20;
    [v37 scrollIndicatorInsets];
    double v31 = v21;
    double v32 = v22;
    double v33 = v23;
    double v34 = v24;
    [v37 contentOffset];
    double v35 = v26;
    double v36 = v25;
    objc_msgSend(v37, "setContentInset:", v16 + v27 - top, v15 + v28 - left, v14 + v29 - bottom, v13 + v30 - right);
    objc_msgSend(v37, "setScrollIndicatorInsets:", v16 + v31 - top, v15 + v32 - left, v14 + v33 - bottom, v13 + v34 - right);
    objc_msgSend(v37, "setContentOffset:", v36, top + v35 - v16);
  }
}

- (id)_nestedPagedScrollingConformingViewControllerForcingViewLoading:(BOOL)a3
{
  BOOL v3 = a3;
  viewController = self->_viewController;
  if (a3)
  {
    id v6 = [(UIViewController *)viewController view];
  }
  else if (![(UIViewController *)viewController isViewLoaded])
  {
LABEL_9:
    double v13 = 0;
    goto LABEL_15;
  }
  BOOL v7 = [(SUUIScrollingTabBarControllerItemContext *)self viewControllerIsNavigationController];
  v8 = self->_viewController;
  if (!v7)
  {
    if ([(UIViewController *)v8 conformsToProtocol:&unk_2705E1830])
    {
      double v13 = self->_viewController;
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  objc_super v9 = v8;
  id v10 = [(UIViewController *)v9 viewControllers];
  id v11 = [v10 firstObject];

  if (v3)
  {
    id v12 = (id)[v11 view];
  }
  else if (![v11 isViewLoaded])
  {
LABEL_13:
    double v13 = 0;
    goto LABEL_14;
  }
  if (![v11 conformsToProtocol:&unk_2705E1830]) {
    goto LABEL_13;
  }
  double v13 = v11;
LABEL_14:

LABEL_15:
  if (!+[SUUIScrollingTabBarController areScrollingTabsAllowed])
  {

    double v13 = 0;
  }
  return v13;
}

- (void)_notifyDelegateOfUpdatedContentWidthInObservedNestedPagingScrollView
{
  [(UIScrollView *)self->_observedNestedPagingScrollView contentSize];
  if (vabdd_f64(v3, self->_lastSeenContentWidth) > 0.00000011920929)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained scrollingTabBarControllerItemContextRequestsContentSizeUpdate:self];
    }
  }
}

- (void)_prepareViewControllerForDisplayWithViewFrame:(CGRect)a3 updateContentOffset:(BOOL)a4 contentOffset:(CGPoint)a5
{
  if (!self->_readyForDisplay)
  {
    double y = a5.y;
    double x = a5.x;
    BOOL v7 = a4;
    double height = a3.size.height;
    double width = a3.size.width;
    double v10 = a3.origin.y;
    double v11 = a3.origin.x;
    double v13 = [(SUUIScrollingTabBarControllerItemContext *)self _nestedPagedScrollingConformingViewControllerForcingViewLoading:1];
    id v19 = v13;
    if (v13)
    {
      double v14 = [v13 scrollingTabNestedPagingScrollView];
      BOOL v15 = v14 != 0;
      if (v14)
      {
        double v16 = [(UIViewController *)self->_viewController view];
        unint64_t v17 = [v16 autoresizingMask];
        self->_originalAutoresizingMask = v17;
        [v16 setAutoresizingMask:v17 & 0xFFFFFFFFFFFFFFFDLL];
        objc_msgSend(v16, "setFrame:", v11, v10, width, height);
        if (v7) {
          objc_msgSend(v14, "setContentOffset:", x, y);
        }
        [v16 layoutIfNeeded];
        if (self->_lastSeenContentWidth < 0.00000011920929)
        {
          v21.origin.double x = v11;
          v21.origin.double y = v10;
          v21.size.double width = width;
          v21.size.double height = height;
          self->_lastSeenContentWidth = CGRectGetWidth(v21);
        }
        [v14 setPagingEnabled:0];
        double v18 = [v14 panGestureRecognizer];
        [v18 _setCanPanHorizontally:0];

        [v14 addObserver:self forKeyPath:@"contentOffset" options:0 context:_SUUIScrollingTabNestedPagingScrollViewContentOffsetObservingContext];
        [v14 addObserver:self forKeyPath:@"contentSize" options:0 context:_SUUIScrollingTabNestedPagingScrollViewContentSizeObservingContext];
        objc_storeStrong((id *)&self->_observedNestedPagingScrollView, v14);
      }
    }
    else
    {
      BOOL v15 = 0;
    }
    if ([(UIViewController *)self->_viewController conformsToProtocol:&unk_270634910])[(UIViewController *)self->_viewController setNavigationStackObserver:self]; {
    self->_readyForDispladouble y = 1;
    }
    if (v15) {
      [(SUUIScrollingTabBarControllerItemContext *)self _notifyDelegateOfUpdatedContentWidthInObservedNestedPagingScrollView];
    }
  }
}

- (void)_prepareViewControllerForTearDown
{
  if (self->_readyForDisplay)
  {
    id v6 = self->_observedNestedPagingScrollView;
    if (v6)
    {
      [(UIScrollView *)v6 removeObserver:self forKeyPath:@"contentSize" context:_SUUIScrollingTabNestedPagingScrollViewContentSizeObservingContext];
      [(UIScrollView *)v6 removeObserver:self forKeyPath:@"contentOffset" context:_SUUIScrollingTabNestedPagingScrollViewContentOffsetObservingContext];
      double v3 = [(UIScrollView *)v6 panGestureRecognizer];
      [v3 _setCanPanHorizontally:1];

      [(UIScrollView *)v6 setPagingEnabled:1];
      id v4 = [(UIViewController *)self->_viewController view];
      [v4 setAutoresizingMask:self->_originalAutoresizingMask];

      observedNestedPagingScrollView = self->_observedNestedPagingScrollView;
      self->_observedNestedPagingScrollView = 0;
      self->_originalAutoresizingMask = 0;
    }
    if ([(UIViewController *)self->_viewController conformsToProtocol:&unk_270634910])[(UIViewController *)self->_viewController setNavigationStackObserver:0]; {
    self->_readyForDispladouble y = 0;
    }
  }
}

- (void)_updateAppliedContentInsetsAdjustment
{
  BOOL v3 = [(SUUIScrollingTabBarControllerItemContext *)self viewControllerIsNavigationController];
  viewController = self->_viewController;
  if (v3)
  {
    uint64_t v5 = viewController;
    id v6 = [(UIViewController *)v5 viewControllers];
    BOOL v7 = [v6 firstObject];

    id obja = [v7 contentScrollView];

    uint64_t v8 = (uint64_t)obja;
  }
  else
  {
    uint64_t v8 = [(UIViewController *)viewController contentScrollView];
  }
  insetAdjustedContentScrollView = self->_insetAdjustedContentScrollView;
  id obj = (id)v8;
  if (insetAdjustedContentScrollView != (UIScrollView *)v8)
  {
    double v10 = (_OWORD *)MEMORY[0x263F834E8];
    if (insetAdjustedContentScrollView) {
      -[SUUIScrollingTabBarControllerItemContext _applyNewContentInset:withOldContentInset:toContentScrollView:](self, "_applyNewContentInset:withOldContentInset:toContentScrollView:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24), self->_appliedContentInsetsAdjustment.top, self->_appliedContentInsetsAdjustment.left, self->_appliedContentInsetsAdjustment.bottom, self->_appliedContentInsetsAdjustment.right);
    }
    long long v11 = v10[1];
    *(_OWORD *)&self->_appliedContentInsetsAdjustment.CGFloat top = *v10;
    *(_OWORD *)&self->_appliedContentInsetsAdjustment.double bottom = v11;
    objc_storeStrong((id *)&self->_insetAdjustedContentScrollView, obj);
  }
  int v12 = [(UIViewController *)self->_viewController conformsToProtocol:&unk_2706347F0];
  int v13 = v12;
  if (self->_insetAdjustedContentScrollView)
  {
    CGFloat top = self->_desiredContentInsetAdjustmentDescriptor.contentInset.top;
    CGFloat left = self->_desiredContentInsetAdjustmentDescriptor.contentInset.left;
    double bottom = self->_desiredContentInsetAdjustmentDescriptor.contentInset.bottom;
    CGFloat right = self->_desiredContentInsetAdjustmentDescriptor.contentInset.right;
    if (v12) {
      double bottom = bottom - self->_desiredContentInsetAdjustmentDescriptor.bottomInsetValueAddedForScrollingTabBar;
    }
    -[SUUIScrollingTabBarControllerItemContext _applyNewContentInset:withOldContentInset:toContentScrollView:](self, "_applyNewContentInset:withOldContentInset:toContentScrollView:", self->_desiredContentInsetAdjustmentDescriptor.contentInset.top, self->_desiredContentInsetAdjustmentDescriptor.contentInset.left, bottom, self->_desiredContentInsetAdjustmentDescriptor.contentInset.right, self->_appliedContentInsetsAdjustment.top, self->_appliedContentInsetsAdjustment.left, self->_appliedContentInsetsAdjustment.bottom, self->_appliedContentInsetsAdjustment.right);
    self->_appliedContentInsetsAdjustment.CGFloat top = top;
    self->_appliedContentInsetsAdjustment.CGFloat left = left;
    self->_appliedContentInsetsAdjustment.double bottom = bottom;
    self->_appliedContentInsetsAdjustment.CGFloat right = right;
  }
  double v18 = obj;
  if (v13)
  {
    [(UIViewController *)self->_viewController scrollingTabBarBottomInsetAdjustmentDidChange];
    double v18 = obj;
  }
}

- (SUUIViewControllerContainerCollectionViewCell)collectionViewCell
{
  return self->_collectionViewCell;
}

- (void)setCollectionViewCell:(id)a3
{
}

- (SUUIScrollingTabBarControllerItemContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIScrollingTabBarControllerItemContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)lastSelectedPageIndex
{
  return self->_lastSelectedPageIndex;
}

- (void)setLastSelectedPageIndex:(unint64_t)a3
{
  self->_lastSelectedPageIndedouble x = a3;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionViewCell, 0);
  objc_storeStrong((id *)&self->_observedNestedPagingScrollView, 0);
  objc_storeStrong((id *)&self->_insetAdjustedContentScrollView, 0);
}

@end