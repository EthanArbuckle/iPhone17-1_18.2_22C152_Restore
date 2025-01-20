@interface VUILibraryStackViewController
- (UICollectionView)stackCollectionView;
- (VUILibraryStackView)stackView;
- (VUILibraryStackViewController)init;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (void)_invalidateLayouts;
- (void)_updateNavigationBarPadding;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureWithCollectionView:(id)a3;
- (void)scrollToTop;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VUILibraryStackViewController

- (VUILibraryStackViewController)init
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VUILibraryStackViewController;
  v2 = [(VUILibraryStackViewController *)&v9 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    v10[2] = objc_opt_class();
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__VUILibraryStackViewController_init__block_invoke;
    v6[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v7, &location);
    id v4 = (id)[(VUILibraryStackViewController *)v2 registerForTraitChanges:v3 withHandler:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __37__VUILibraryStackViewController_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 984) = 1;
    objc_super v9 = [v5 traitCollection];
    uint64_t v10 = [v9 vuiPreferredContentSizeCategory];
    uint64_t v11 = [v6 vuiPreferredContentSizeCategory];

    if (v10 != v11)
    {
      if ([v8 vuiIsViewLoaded])
      {
        v12 = [v8 vuiView];
        v13 = [v12 window];

        if (v13)
        {
          v14 = VUIDefaultLogObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_INFO, "VUILibraryStackViewController:: size category changed, update traits to relayout the collection view", v15, 2u);
          }

          [v8 updateTraitsIfNeeded];
        }
      }
    }
  }
}

- (void)scrollToTop
{
  id v2 = [(VUILibraryStackViewController *)self stackCollectionView];
  [v2 _scrollToTopIfPossible:1];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)VUILibraryStackViewController;
  [(VUILibraryStackViewController *)&v15 viewDidLoad];
  self->_lastAppearWidth = 0.0;
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  if ([MEMORY[0x1E4FB3CA0] isUniquelyiPadEnabled]) {
    [v3 setSectionInsetReference:1];
  }
  id v4 = [VUILegacyCollectionView alloc];
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  objc_super v9 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  stackCollectionView = self->_stackCollectionView;
  self->_stackCollectionView = v9;

  uint64_t v11 = self->_stackCollectionView;
  v12 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)v11 setBackgroundColor:v12];

  [(UICollectionView *)self->_stackCollectionView setAutoresizingMask:18];
  [(UICollectionView *)self->_stackCollectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_stackCollectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_stackCollectionView setAlwaysBounceVertical:1];
  [(UICollectionView *)self->_stackCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"VUILibraryCollectionCellReuseIdentifier"];
  [(UICollectionView *)self->_stackCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"VUILibraryMenuCellReuseIdentifier"];
  [(UICollectionView *)self->_stackCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"VUILibraryBannerCellReuseIdentifier"];
  [(UICollectionView *)self->_stackCollectionView setDelegate:self];
  v13 = -[VUILibraryStackView initWithFrame:]([VUILibraryStackView alloc], "initWithFrame:", v5, v6, v7, v8);
  stackView = self->_stackView;
  self->_stackView = v13;

  [(VUILibraryStackView *)self->_stackView setCollectionView:self->_stackCollectionView];
  [(VUILibraryStackViewController *)self configureWithCollectionView:self->_stackCollectionView];
  self->_requiresRelayout = 1;
}

- (void)configureWithCollectionView:(id)a3
{
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VUILibraryStackViewController;
  [(VUILibraryStackViewController *)&v9 viewDidAppear:a3];
  id v4 = [(VUILibraryStackViewController *)self view];
  [v4 bounds];
  double v6 = v5;

  if (self->_lastAppearWidth != v6) {
    [(VUILibraryStackViewController *)self _invalidateLayouts];
  }
  self->_lastAppearWidth = v6;
  [(VUILibraryStackViewController *)self _updateNavigationBarPadding];
  double v7 = [(VUILibraryStackViewController *)self navigationController];
  double v8 = [v7 navigationBar];
  [v8 sizeToFit];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)VUILibraryStackViewController;
  [(VUILibraryStackViewController *)&v4 viewDidLayoutSubviews];
  [(VUILibraryStackViewController *)self _updateNavigationBarPadding];
  if (self->_requiresRelayout)
  {
    id v3 = [(UICollectionView *)self->_stackCollectionView collectionViewLayout];
    [v3 invalidateLayout];

    [(VUILibraryStackView *)self->_stackView setNeedsLayout];
    self->_requiresRelayout = 0;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VUILibraryStackViewController;
  [(VUILibraryStackViewController *)&v14 viewDidDisappear:a3];
  if ([(VUILibraryStackViewController *)self isMovingFromParentViewController])
  {
    objc_super v4 = [(VUILibraryStackViewController *)self childViewControllers];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
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
          objc_super v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          [v9 willMoveToParentViewController:0];
          [v9 removeFromParentViewController];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_focusedIndexPath && objc_msgSend(v4, "vui_isIndexPathValid:")) {
    uint64_t v6 = self->_focusedIndexPath;
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v11 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = v11;
  if (isKindOfClass)
  {
    double v8 = [v11 viewController];
    if (v8)
    {
      objc_super v9 = [(VUILibraryStackViewController *)self childViewControllers];
      char v10 = [v9 containsObject:v8];

      if ((v10 & 1) == 0)
      {
        [(VUILibraryStackViewController *)self addChildViewController:v8];
        [v8 didMoveToParentViewController:self];
      }
    }

    uint64_t v7 = v11;
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v12 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = v12;
  if (isKindOfClass)
  {
    double v8 = [v12 viewController];
    if (v8)
    {
      objc_super v9 = [(VUILibraryStackViewController *)self childViewControllers];
      if ([v9 containsObject:v8])
      {
        char v10 = [v8 view];
        int v11 = [v10 isDescendantOfView:v12];

        if (v11)
        {
          [v8 willMoveToParentViewController:0];
          [v8 removeFromParentViewController];
        }
      }
      else
      {
      }
    }

    uint64_t v7 = v12;
  }
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUILibraryStackViewController;
  id v7 = a4;
  -[VUILibraryStackViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__VUILibraryStackViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6DF4CD8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __84__VUILibraryStackViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isViewLoaded]
    && ([*(id *)(a1 + 32) view],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 window],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 1008) collectionViewLayout];
    [v4 invalidateLayout];

    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 1000);
    [v5 setNeedsLayout];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 984) = 1;
  }
}

- (void)_invalidateLayouts
{
  id v3 = [(UICollectionView *)self->_stackCollectionView collectionViewLayout];
  [v3 invalidateLayout];

  stackView = self->_stackView;
  [(VUILibraryStackView *)stackView setNeedsLayout];
}

- (void)_updateNavigationBarPadding
{
  id v3 = [(VUILibraryStackViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;

  if ([MEMORY[0x1E4FB3CA0] isUniquelyiPadEnabled])
  {
    char v12 = [(VUILibraryStackViewController *)self vuiIsRTL];
    long long v13 = [(VUILibraryStackViewController *)self view];
    [v13 safeAreaInsets];
    double v15 = v14;
    double v17 = v16;

    if (v12) {
      double v9 = v9 - v17;
    }
    else {
      double v9 = v9 - v15;
    }
  }
  v40.origin.x = v5;
  v40.origin.y = v7;
  v40.size.double width = v9;
  v40.size.double height = v11;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:", CGRectGetWidth(v40));
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [(VUILibraryStackViewController *)self navigationController];
  v27 = [v26 navigationBar];
  [v27 layoutMargins];
  if (v21 == v31 && v19 == v28 && v25 == v30)
  {
    double v34 = v29;

    if (v23 == v34) {
      return;
    }
  }
  else
  {
  }
  v35 = [(VUILibraryStackViewController *)self navigationController];
  v36 = [v35 navigationBar];
  objc_msgSend(v36, "setLayoutMargins:", v19, v21, v23, v25);

  id v38 = [(VUILibraryStackViewController *)self navigationController];
  v37 = [v38 navigationBar];
  [v37 setNeedsLayout];
}

- (VUILibraryStackView)stackView
{
  return self->_stackView;
}

- (UICollectionView)stackCollectionView
{
  return self->_stackCollectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackCollectionView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
}

@end