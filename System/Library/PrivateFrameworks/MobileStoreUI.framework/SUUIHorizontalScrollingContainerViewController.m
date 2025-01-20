@interface SUUIHorizontalScrollingContainerViewController
- (BOOL)initialScrollWasPerformed;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)viewControllers;
- (NSIndexPath)indexPathOfFocusedItem;
- (SUUIHorizontalScrollingContainerViewControllerDelegate)delegate;
- (UICollectionView)menuBarCollectionView;
- (UIEdgeInsets)viewControllerContentScrollViewContentInset;
- (id)_indexPathOfFocusedContentItemWithDistanceToFocusedPosition:(double *)a3 layoutAttributes:(id *)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)contentScrollView;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_applyNewContentInset:(UIEdgeInsets)a3 toViewController:(id)a4;
- (void)_applyNewContentInset:(UIEdgeInsets)a3 toViewControllers:(id)a4;
- (void)_scrollViewDidScroll:(id)a3;
- (void)_scrollViewWillBeginDecelerating:(id)a3;
- (void)_setViewControllers:(id)a3 collectionViewsUpdateHandler:(id)a4;
- (void)_synchronizeContentCollectionViewWithMenuBarCollectionView;
- (void)_synchronizeMenuBarCollectionViewWithContentCollectionView;
- (void)_updateScrollViewContentOffsetsToTargetContentOffsets;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)replaceViewControllerAtIndex:(unint64_t)a3 withViewController:(id)a4;
- (void)scrollToItemAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)scrollViewDidChangeContentInset:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMenuBarCollectionView:(id)a3;
- (void)setNeedsViewControllerContentScrollViewContentInsetUpdate;
- (void)setViewControllers:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SUUIHorizontalScrollingContainerViewController

- (void)dealloc
{
  [(SUUIProxyScrollView *)self->_proxyScrollView setDelegate:0];
  [(UICollectionView *)self->_contentCollectionView setDataSource:0];
  [(UICollectionView *)self->_contentCollectionView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIHorizontalScrollingContainerViewController;
  [(SUUIViewController *)&v3 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SUUIHorizontalScrollingContainerViewController;
  [(SUUIHorizontalScrollingContainerViewController *)&v22 viewDidLayoutSubviews];
  objc_super v3 = [(SUUIHorizontalScrollingContainerViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  proxyScrollView = self->_proxyScrollView;
  if (proxyScrollView)
  {
    v13 = [(SUUIProxyScrollView *)proxyScrollView superview];

    if (!v13) {
      [v3 addSubview:self->_proxyScrollView];
    }
  }
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  double Width = CGRectGetWidth(v23);
  if (Width >= 2.0) {
    double v15 = Width;
  }
  else {
    double v15 = 2.0;
  }
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v15;
  v24.size.height = v11;
  double Height = CGRectGetHeight(v24);
  if (Height >= 2.0) {
    double v17 = Height;
  }
  else {
    double v17 = 2.0;
  }
  -[UICollectionView setFrame:](self->_contentCollectionView, "setFrame:", v5, v7, v15, v17);
  if (self->_contentCollectionViewItemSize.width != v9 || self->_contentCollectionViewItemSize.height != v11)
  {
    self->_contentCollectionViewItemSize.width = v9;
    self->_contentCollectionViewItemSize.height = v11;
    v19 = [(UICollectionView *)self->_contentCollectionView collectionViewLayout];
    id v20 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);

    [v20 setInvalidateFlowLayoutDelegateMetrics:1];
    v21 = [(UICollectionView *)self->_contentCollectionView collectionViewLayout];
    [v21 invalidateLayoutWithContext:v20];
  }
}

- (void)viewDidLoad
{
  v27[1] = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)SUUIHorizontalScrollingContainerViewController;
  [(SUUIHorizontalScrollingContainerViewController *)&v25 viewDidLoad];
  objc_super v3 = [(SUUIHorizontalScrollingContainerViewController *)self view];
  double v4 = [MEMORY[0x263F825C8] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v13 = objc_alloc(MEMORY[0x263F82E00]);
  v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v14 setHidden:1];
  [v3 addSubview:v14];
  self->_contentCollectionViewItemSize.width = v10;
  self->_contentCollectionViewItemSize.height = v12;
  id v15 = objc_alloc_init(MEMORY[0x263F82570]);
  [v15 setScrollDirection:1];
  [v15 setMinimumLineSpacing:0.0];
  uint64_t v26 = *MEMORY[0x263F83500];
  v27[0] = &unk_2705D0C40;
  v16 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  [v15 _setRowAlignmentsOptions:v16];

  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  double Width = CGRectGetWidth(v28);
  if (Width >= 2.0) {
    double v18 = Width;
  }
  else {
    double v18 = 2.0;
  }
  v29.origin.x = v6;
  v29.origin.y = v8;
  v29.size.width = v18;
  v29.size.height = v12;
  double Height = CGRectGetHeight(v29);
  if (Height >= 2.0) {
    double v20 = Height;
  }
  else {
    double v20 = 2.0;
  }
  v21 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x263F82528]), "initWithFrame:collectionViewLayout:", v15, v6, v8, v18, v20);
  contentCollectionView = self->_contentCollectionView;
  self->_contentCollectionView = v21;

  CGRect v23 = self->_contentCollectionView;
  CGRect v24 = [MEMORY[0x263F825C8] clearColor];
  [(UICollectionView *)v23 setBackgroundColor:v24];

  [(UICollectionView *)self->_contentCollectionView setDataSource:self];
  [(UICollectionView *)self->_contentCollectionView setDelegate:self];
  [(UICollectionView *)self->_contentCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2704FB0D0];
  [(UICollectionView *)self->_contentCollectionView setScrollsToTop:0];
  [(UICollectionView *)self->_contentCollectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_contentCollectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_contentCollectionView setPrefetchingEnabled:0];
  [(UICollectionView *)self->_contentCollectionView setPagingEnabled:1];
  [v3 addSubview:self->_contentCollectionView];
}

- (id)contentScrollView
{
  if (!self->_proxyScrollView
    && [(SUUIHorizontalScrollingContainerViewController *)self isViewLoaded])
  {
    objc_super v3 = [SUUIProxyScrollView alloc];
    double v4 = -[SUUIProxyScrollView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    proxyScrollView = self->_proxyScrollView;
    self->_proxyScrollView = v4;

    [(SUUIProxyScrollView *)self->_proxyScrollView setHidden:1];
    [(SUUIProxyScrollView *)self->_proxyScrollView setDelegate:self];
    [(SUUIProxyScrollView *)self->_proxyScrollView setScrollEnabled:0];
    [(SUUIProxyScrollView *)self->_proxyScrollView setScrollsToTop:0];
    double v6 = [(SUUIHorizontalScrollingContainerViewController *)self view];
    [v6 addSubview:self->_proxyScrollView];
  }
  double v7 = self->_proxyScrollView;
  return v7;
}

- (void)setClientContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIHorizontalScrollingContainerViewController;
  [(SUUIViewController *)&v15 setClientContext:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v5 = self->_viewControllers;
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
        CGFloat v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_2705E11B8, (void)v11)) {
          [v10 setClientContext:v4];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)scrollViewDidChangeContentInset:(id)a3
{
  if (self->_proxyScrollView == a3)
  {
    [a3 contentInset];
    BOOL v8 = self->_proxyScrollViewContentInsetAdjustment.left == v5
      && self->_proxyScrollViewContentInsetAdjustment.top == v4;
    BOOL v9 = v8 && self->_proxyScrollViewContentInsetAdjustment.right == v7;
    if (!v9 || self->_proxyScrollViewContentInsetAdjustment.bottom != v6)
    {
      self->_proxyScrollViewContentInsetAdjustment.top = v4;
      self->_proxyScrollViewContentInsetAdjustment.left = v5;
      self->_proxyScrollViewContentInsetAdjustment.bottom = v6;
      self->_proxyScrollViewContentInsetAdjustment.right = v7;
      [(SUUIHorizontalScrollingContainerViewController *)self viewControllerContentScrollViewContentInset];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      id v19 = [(SUUIHorizontalScrollingContainerViewController *)self viewControllers];
      -[SUUIHorizontalScrollingContainerViewController _applyNewContentInset:toViewControllers:](self, "_applyNewContentInset:toViewControllers:", v19, v12, v14, v16, v18);
    }
  }
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
    double v4 = [a3 dequeueReusableCellWithReuseIdentifier:0x2704FB0D0 forIndexPath:v7];
    viewControllers = self->_viewControllers;
    unint64_t v9 = [v7 item];

    CGFloat v10 = [(NSArray *)viewControllers objectAtIndex:v9 % [(NSArray *)self->_viewControllers count]];
    id v11 = (id)[v10 view];
    [(SUUIHorizontalScrollingContainerViewController *)self viewControllerContentScrollViewContentInset];
    -[SUUIHorizontalScrollingContainerViewController _applyNewContentInset:toViewController:](self, "_applyNewContentInset:toViewController:", v10);
    [v4 setViewController:v10];
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a5;
  if (self->_contentCollectionView == a3)
  {
    id v9 = v7;
    BOOL v8 = [(SUUIHorizontalScrollingContainerViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v8, "horizontalScrollingContainerViewController:willDisplayViewControllerAtIndex:", self, objc_msgSend(v9, "item") % -[NSArray count](self->_viewControllers, "count"));
    }

    id v7 = v9;
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a5;
  if (self->_contentCollectionView == a3)
  {
    id v9 = v7;
    BOOL v8 = [(SUUIHorizontalScrollingContainerViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v8, "horizontalScrollingContainerViewController:didEndDisplayingViewControllerAtIndex:", self, objc_msgSend(v9, "item") % -[NSArray count](self->_viewControllers, "count"));
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

- (NSIndexPath)indexPathOfFocusedItem
{
  return (NSIndexPath *)[(SUUIHorizontalScrollingContainerViewController *)self _indexPathOfFocusedContentItemWithDistanceToFocusedPosition:0 layoutAttributes:0];
}

- (void)setMenuBarCollectionView:(id)a3
{
  double v5 = (UICollectionView *)a3;
  p_menuBarCollectionView = &self->_menuBarCollectionView;
  menuBarCollectionView = self->_menuBarCollectionView;
  if (menuBarCollectionView != v5)
  {
    CGFloat v10 = v5;
    [(UICollectionView *)menuBarCollectionView _setContentOffsetRoundingEnabled:1];
    BOOL v8 = [(UICollectionView *)*p_menuBarCollectionView delegate];
    if ([v8 conformsToProtocol:&unk_27065D920]) {
      [v8 setScrollViewDelegateObserver:0];
    }
    objc_storeStrong((id *)&self->_menuBarCollectionView, a3);
    [(UICollectionView *)*p_menuBarCollectionView _setContentOffsetRoundingEnabled:0];
    id v9 = [(UICollectionView *)*p_menuBarCollectionView delegate];

    if ([v9 conformsToProtocol:&unk_27065D920]) {
      [v9 setScrollViewDelegateObserver:self];
    }

    double v5 = v10;
  }
  MEMORY[0x270F9A758](menuBarCollectionView, v5);
}

- (void)setViewControllers:(id)a3
{
  double v4 = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__SUUIHorizontalScrollingContainerViewController_setViewControllers___block_invoke;
  v6[3] = &unk_265400980;
  id v7 = v4;
  double v5 = v4;
  [(SUUIHorizontalScrollingContainerViewController *)v5 _setViewControllers:a3 collectionViewsUpdateHandler:v6];
}

uint64_t __69__SUUIHorizontalScrollingContainerViewController_setViewControllers___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1152) reloadData];
  [*(id *)(*(void *)(a1 + 32) + 1064) reloadData];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateScrollViewContentOffsetsToTargetContentOffsets];
}

- (void)replaceViewControllerAtIndex:(unint64_t)a3 withViewController:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[(NSArray *)self->_viewControllers mutableCopy];
  [v7 replaceObjectAtIndex:a3 withObject:v6];
  BOOL v8 = [(NSArray *)self->_viewControllers objectAtIndex:a3];
  id v9 = [v8 title];
  CGFloat v10 = [v6 title];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    NSUInteger v12 = [(NSArray *)self->_viewControllers count];
    double v13 = self;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __98__SUUIHorizontalScrollingContainerViewController_replaceViewControllerAtIndex_withViewController___block_invoke;
    v15[3] = &unk_265402F60;
    double v16 = v13;
    NSUInteger v18 = v12;
    unint64_t v19 = a3;
    id v17 = v6;
    double v14 = v13;
    [(SUUIHorizontalScrollingContainerViewController *)v14 _setViewControllers:v7 collectionViewsUpdateHandler:v15];
  }
  else
  {
    [(SUUIHorizontalScrollingContainerViewController *)self setViewControllers:v7];
  }
}

void __98__SUUIHorizontalScrollingContainerViewController_replaceViewControllerAtIndex_withViewController___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 1152) indexPathsForVisibleItems];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v7, "item", (void)v12) % *(void *)(a1 + 48) == *(void *)(a1 + 56))
        {
          uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 1064) cellForItemAtIndexPath:v7];
          if (v8)
          {
            id v9 = (void *)v8;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_12:

  id v10 = (id)[*(id *)(a1 + 40) view];
  int v11 = *(void **)(a1 + 32);
  [v11 viewControllerContentScrollViewContentInset];
  objc_msgSend(v11, "_applyNewContentInset:toViewController:", *(void *)(a1 + 40));
  [v9 setViewController:*(void *)(a1 + 40)];
}

- (void)scrollToItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v20 = [(UICollectionView *)self->_contentCollectionView layoutAttributesForItemAtIndexPath:a3];
  [(UICollectionView *)self->_contentCollectionView bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(UICollectionView *)self->_contentCollectionView contentOffset];
  double v15 = v14;
  [v20 frame];
  double MidX = CGRectGetMidX(v22);
  v23.origin.x = v7;
  v23.origin.y = v9;
  v23.size.double width = v11;
  v23.size.double height = v13;
  double v17 = MidX + CGRectGetWidth(v23) * -0.5;
  contentCollectionView = self->_contentCollectionView;
  unint64_t v19 = [(UICollectionView *)contentCollectionView collectionViewLayout];
  objc_msgSend(v19, "targetContentOffsetForProposedContentOffset:", v17, v15);
  -[UICollectionView setContentOffset:animated:](contentCollectionView, "setContentOffset:animated:", v4);
}

- (void)setNeedsViewControllerContentScrollViewContentInsetUpdate
{
  [(SUUIHorizontalScrollingContainerViewController *)self viewControllerContentScrollViewContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(SUUIHorizontalScrollingContainerViewController *)self viewControllers];
  -[SUUIHorizontalScrollingContainerViewController _applyNewContentInset:toViewControllers:](self, "_applyNewContentInset:toViewControllers:", v11, v4, v6, v8, v10);
}

- (UIEdgeInsets)viewControllerContentScrollViewContentInset
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

- (void)_applyNewContentInset:(UIEdgeInsets)a3 toViewController:(id)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    v50 = v9;
    id v11 = [(NSMapTable *)self->_viewControllerToExistingContentInsetAdjustment objectForKey:v9];
    [v11 UIEdgeInsetsValue];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    id v10 = v50;
    BOOL v20 = left == v15 && top == v13;
    BOOL v21 = v20 && right == v19;
    if (!v21 || bottom != v17)
    {
      CGRect v23 = [v50 contentScrollView];
      if (v23)
      {
        viewControllerToExistingContentInsetAdjustment = self->_viewControllerToExistingContentInsetAdjustment;
        if (!viewControllerToExistingContentInsetAdjustment)
        {
          objc_super v25 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:1];
          uint64_t v26 = self->_viewControllerToExistingContentInsetAdjustment;
          self->_viewControllerToExistingContentInsetAdjustment = v25;

          viewControllerToExistingContentInsetAdjustment = self->_viewControllerToExistingContentInsetAdjustment;
        }
        v27 = objc_msgSend(MEMORY[0x263F08D40], "valueWithUIEdgeInsets:", top, left, bottom, right);
        [(NSMapTable *)viewControllerToExistingContentInsetAdjustment setObject:v27 forKey:v50];

        [v23 contentOffset];
        double v48 = v29;
        double v49 = v28;
        [v23 contentInset];
        double v40 = v30;
        double v41 = v31;
        double v42 = v32;
        double v43 = v33;
        [v23 scrollIndicatorInsets];
        double v44 = v34;
        double v45 = v35;
        double v46 = v36;
        double v47 = v37;
        objc_msgSend(v23, "setContentInset:", top + v40 - v13, left + v41 - v15, bottom + v42 - v17, right + v43 - v19);
        objc_msgSend(v23, "setScrollIndicatorInsets:", top + v44 - v13, left + v45 - v15, bottom + v46 - v17, right + v47 - v19);
        objc_msgSend(v23, "setContentOffset:", v49, v13 + v48 - top);
      }
      v38 = self->_viewControllerToExistingContentInsetAdjustment;
      if (v38 && ![(NSMapTable *)v38 count])
      {
        v39 = self->_viewControllerToExistingContentInsetAdjustment;
        self->_viewControllerToExistingContentInsetAdjustment = 0;
      }
      id v10 = v50;
    }
  }
  MEMORY[0x270F9A758](v9, v10);
}

- (void)_applyNewContentInset:(UIEdgeInsets)a3 toViewControllers:(id)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[SUUIHorizontalScrollingContainerViewController _applyNewContentInset:toViewController:](self, "_applyNewContentInset:toViewController:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), top, left, bottom, right);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (id)_indexPathOfFocusedContentItemWithDistanceToFocusedPosition:(double *)a3 layoutAttributes:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [(UICollectionView *)self->_contentCollectionView layoutIfNeeded];
  [(UICollectionView *)self->_contentCollectionView bounds];
  UIRectGetCenter();
  double v6 = v5;
  [(UICollectionView *)self->_contentCollectionView visibleCells];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v25;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v14 = [(UICollectionView *)self->_contentCollectionView indexPathForCell:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        if (v14)
        {
          long long v15 = [(UICollectionView *)self->_contentCollectionView layoutAttributesForItemAtIndexPath:v14];
          [v15 frame];
          double v16 = CGRectGetMidX(v31) - v6;
          if (!v9 || fabs(v16) < fabs(v12))
          {
            id v17 = v14;

            id v18 = v15;
            uint64_t v19 = v10;
            id v10 = v18;

            id v9 = v17;
            double v12 = v16;
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
    id v10 = 0;
    double v12 = 0.0;
  }
  if (a3) {
    *a3 = v12;
  }
  if (a4) {
    *a4 = v10;
  }

  return v9;
}

- (void)_scrollViewDidScroll:(id)a3
{
  double v4 = (UICollectionView *)a3;
  if ((UICollectionView *)self->_proxyScrollView != v4 && !self->_isHandlingScrollViewDidScroll)
  {
    self->_isHandlingScrollViewDidScroll = 1;
    if (self->_menuBarCollectionView == v4)
    {
      double v5 = v4;
      [(SUUIHorizontalScrollingContainerViewController *)self _synchronizeContentCollectionViewWithMenuBarCollectionView];
    }
    else
    {
      if (self->_contentCollectionView != v4)
      {
LABEL_8:
        self->_isHandlingScrollViewDidScroll = 0;
        goto LABEL_9;
      }
      double v5 = v4;
      [(SUUIHorizontalScrollingContainerViewController *)self _synchronizeMenuBarCollectionViewWithContentCollectionView];
    }
    double v4 = v5;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_scrollViewWillBeginDecelerating:(id)a3
{
  double v4 = (UICollectionView *)a3;
  contentCollectionView = self->_contentCollectionView;
  if (self->_menuBarCollectionView == v4)
  {
    uint64_t v7 = v4;
  }
  else
  {
    if (contentCollectionView != v4) {
      goto LABEL_7;
    }
    uint64_t v7 = v4;
    contentCollectionView = self->_menuBarCollectionView;
  }
  double v6 = contentCollectionView;
  double v4 = v7;
  if (v6)
  {
    [(UICollectionView *)v6 contentOffset];
    -[UICollectionView setContentOffset:animated:](v6, "setContentOffset:animated:", 0);

    double v4 = v7;
  }
LABEL_7:
}

- (void)_setViewControllers:(id)a3 collectionViewsUpdateHandler:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  double v6 = (NSArray *)a3;
  uint64_t v7 = (void (**)(void))a4;
  viewControllers = self->_viewControllers;
  if (viewControllers != v6 && ![(NSArray *)viewControllers isEqualToArray:v6])
  {
    double v48 = v7;
    id v9 = (void *)[(NSArray *)self->_viewControllers copy];
    double v47 = v6;
    id v10 = (NSArray *)[(NSArray *)v6 copy];
    uint64_t v11 = self->_viewControllers;
    self->_viewControllers = v10;

    double v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v63 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          if (![(NSArray *)self->_viewControllers containsObject:v18])
          {
            [v12 addObject:v18];
            uint64_t v19 = [v18 parentViewController];

            if (v19 == self) {
              [v18 willMoveToParentViewController:0];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v15);
    }

    if ([v12 count]) {
      -[SUUIHorizontalScrollingContainerViewController _applyNewContentInset:toViewControllers:](self, "_applyNewContentInset:toViewControllers:", v12, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    }
    BOOL v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_viewControllers, "count"));
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    BOOL v21 = self->_viewControllers;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v58 objects:v68 count:16];
    CGRect v23 = &selRef_reloadMediaLibrary_;
    if (v22)
    {
      uint64_t v24 = v22;
      uint64_t v25 = *(void *)v59;
      do
      {
        uint64_t v26 = 0;
        uint64_t v49 = v24;
        do
        {
          if (*(void *)v59 != v25) {
            objc_enumerationMutation(v21);
          }
          long long v27 = *(void **)(*((void *)&v58 + 1) + 8 * v26);
          if (([v13 containsObject:v27] & 1) == 0)
          {
            [v20 addObject:v27];
            if ([v27 conformsToProtocol:v23[373]])
            {
              [(SUUIViewController *)self clientContext];
              uint64_t v28 = v25;
              uint64_t v29 = self;
              double v30 = v21;
              id v31 = v13;
              double v32 = v20;
              double v33 = v23;
              v35 = double v34 = v12;
              [v27 setClientContext:v35];

              double v12 = v34;
              CGRect v23 = v33;
              BOOL v20 = v32;
              id v13 = v31;
              BOOL v21 = v30;
              self = v29;
              uint64_t v25 = v28;
              uint64_t v24 = v49;
            }
            [(SUUIHorizontalScrollingContainerViewController *)self addChildViewController:v27];
          }
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [(NSArray *)v21 countByEnumeratingWithState:&v58 objects:v68 count:16];
      }
      while (v24);
    }

    v48[2]();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v36 = v20;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v55 != v39) {
            objc_enumerationMutation(v36);
          }
          [*(id *)(*((void *)&v54 + 1) + 8 * j) didMoveToParentViewController:self];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v54 objects:v67 count:16];
      }
      while (v38);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v41 = v12;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v50 objects:v66 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v51;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v51 != v44) {
            objc_enumerationMutation(v41);
          }
          double v46 = *(void **)(*((void *)&v50 + 1) + 8 * k);
          [v46 removeFromParentViewController];
          if ([v46 conformsToProtocol:v23[373]]) {
            [v46 setClientContext:0];
          }
          [(NSMapTable *)self->_viewControllerToExistingContentInsetAdjustment removeObjectForKey:v46];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v50 objects:v66 count:16];
      }
      while (v43);
    }

    double v6 = v47;
    uint64_t v7 = v48;
  }
}

- (void)_synchronizeContentCollectionViewWithMenuBarCollectionView
{
  double v3 = [(UICollectionView *)self->_menuBarCollectionView collectionViewLayout];
  if ([v3 conformsToProtocol:&unk_270602450])
  {
    double v10 = 0.0;
    double v4 = [v3 menuBarFocusedItemIndexPathWithTransitionProgress:&v10];
    double v5 = [(UICollectionView *)self->_contentCollectionView layoutAttributesForItemAtIndexPath:v4];
    [v5 frame];
    double Width = CGRectGetWidth(v11);
    [(UICollectionView *)self->_contentCollectionView contentOffset];
    double v8 = v7;
    [v5 frame];
    CGFloat v9 = CGRectGetMidX(v12) - v10 * Width;
    [(UICollectionView *)self->_contentCollectionView bounds];
    -[UICollectionView setContentOffset:](self->_contentCollectionView, "setContentOffset:", v9 + CGRectGetWidth(v13) * -0.5, v8);
  }
}

- (void)_synchronizeMenuBarCollectionViewWithContentCollectionView
{
  id v10 = 0;
  double v11 = 0.0;
  double v3 = [(SUUIHorizontalScrollingContainerViewController *)self _indexPathOfFocusedContentItemWithDistanceToFocusedPosition:&v11 layoutAttributes:&v10];
  id v4 = v10;
  double v5 = v4;
  if (v3 && v4)
  {
    [v4 frame];
    double Width = CGRectGetWidth(v12);
    double v7 = v11;
    double v8 = [(UICollectionView *)self->_menuBarCollectionView collectionViewLayout];
    if ([v8 conformsToProtocol:&unk_270602450])
    {
      double v9 = v7 / Width;
      if (v7 / Width < -1.0) {
        double v9 = -1.0;
      }
      objc_msgSend(v8, "setMenuBarFocusedItemIndexPath:withTransitionProgress:", v3, fmin(v9, 1.0));
    }
  }
}

- (void)_updateScrollViewContentOffsetsToTargetContentOffsets
{
  [(UICollectionView *)self->_menuBarCollectionView contentOffset];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(UICollectionView *)self->_menuBarCollectionView collectionViewLayout];
  objc_msgSend(v7, "targetContentOffsetForProposedContentOffset:", v4, v6);
  double v9 = v8;
  double v11 = v10;

  if (v4 != v9 || v6 != v11) {
    -[UICollectionView setContentOffset:](self->_menuBarCollectionView, "setContentOffset:", v9, v11);
  }
  [(UICollectionView *)self->_contentCollectionView contentOffset];
  double v14 = v13;
  double v16 = v15;
  id v17 = [(UICollectionView *)self->_contentCollectionView collectionViewLayout];
  objc_msgSend(v17, "targetContentOffsetForProposedContentOffset:", v14, v16);
  double v19 = v18;
  double v21 = v20;

  if (v14 != v19 || v16 != v21)
  {
    contentCollectionView = self->_contentCollectionView;
    -[UICollectionView setContentOffset:](contentCollectionView, "setContentOffset:", v19, v21);
  }
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (SUUIHorizontalScrollingContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIHorizontalScrollingContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionView)menuBarCollectionView
{
  return self->_menuBarCollectionView;
}

- (BOOL)initialScrollWasPerformed
{
  return self->_initialScrollWasPerformed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuBarCollectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_viewControllerToExistingContentInsetAdjustment, 0);
  objc_storeStrong((id *)&self->_proxyScrollView, 0);
  objc_storeStrong((id *)&self->_contentCollectionView, 0);
}

@end