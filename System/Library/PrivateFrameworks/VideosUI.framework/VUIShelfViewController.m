@interface VUIShelfViewController
- (NSIndexPath)focusedIndexPath;
- (UICollectionView)collectionView;
- (UIView)headerView;
- (VUIShelfView)containerView;
- (VUIShelfViewController)initWithGridStyle:(int64_t)a3;
- (id)_findSnappingItemFromContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (int64_t)gridStyle;
- (void)_ensureScrollViewSnaps;
- (void)_snapTargetContentOffset:(CGPoint *)a3 toItemIndexPath:(id)a4 atItemOffset:(CGPoint)a5;
- (void)_updateCollectionViewLayout:(BOOL)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)setCollectionView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setFocusedIndexPath:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)updateContentOffsetWithTransitionCoordinator:(id)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VUIShelfViewController

- (VUIShelfViewController)initWithGridStyle:(int64_t)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VUIShelfViewController;
  v4 = [(VUIShelfViewController *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_gridStyle = a3;
    objc_initWeak(&location, v4);
    v13[0] = objc_opt_class();
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__VUIShelfViewController_initWithGridStyle___block_invoke;
    v9[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v10, &location);
    id v7 = (id)[(VUIShelfViewController *)v5 registerForTraitChanges:v6 withHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __44__VUIShelfViewController_initWithGridStyle___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[976] = 1;
    v3 = WeakRetained;
    v2 = [WeakRetained containerView];
    [v2 setNeedsLayout];

    WeakRetained = v3;
  }
}

- (void)setHeaderView:(id)a3
{
  v5 = (UIView *)a3;
  if (self->_headerView != v5)
  {
    objc_storeStrong((id *)&self->_headerView, a3);
    [(VUIShelfView *)self->_containerView setHeaderView:v5];
  }
}

- (void)loadView
{
  v3 = [VUIShelfView alloc];
  v4 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
  [v4 bounds];
  id v10 = -[VUIShelfView initWithFrame:](v3, "initWithFrame:");

  [(VUIShelfView *)v10 setAutoresizingMask:18];
  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  [(VUIShelfView *)v10 setBackgroundColor:v5];

  [(VUIShelfViewController *)self setView:v10];
  [(VUIShelfViewController *)self setContainerView:v10];
  [(VUIShelfView *)v10 setHeaderView:self->_headerView];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA9D00]);
  [v6 setMinimumLineSpacing:0.0];
  id v7 = [VUILegacyCollectionView alloc];
  v8 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v7, "initWithFrame:collectionViewLayout:", v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(VUILegacyCollectionView *)v8 setAutoresizingMask:18];
  v9 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  [(VUILegacyCollectionView *)v8 setBackgroundColor:v9];

  [(VUILegacyCollectionView *)v8 setShowsVerticalScrollIndicator:0];
  [(VUILegacyCollectionView *)v8 setShowsHorizontalScrollIndicator:0];
  [(VUILegacyCollectionView *)v8 setAlwaysBounceHorizontal:1];
  [(VUILegacyCollectionView *)v8 setDelegate:self];
  [(VUILegacyCollectionView *)v8 _setContentInsetAdjustmentBehavior:2];
  [(VUIShelfViewController *)self configureWithCollectionView:v8];
  [(VUIShelfViewController *)self setCollectionView:v8];
  [(VUIShelfView *)self->_containerView setCollectionView:v8];
  [(VUIShelfView *)self->_containerView addSubview:v8];
  [(VUIShelfViewController *)self _updateCollectionViewLayout:0];
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIShelfViewController;
  [(VUIShelfViewController *)&v4 didMoveToParentViewController:a3];
  [(VUIShelfViewController *)self _ensureScrollViewSnaps];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)VUIShelfViewController;
  id v7 = a4;
  -[VUIShelfViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[VUIShelfViewController updateContentOffsetWithTransitionCoordinator:](self, "updateContentOffsetWithTransitionCoordinator:", v7, v8.receiver, v8.super_class);
}

- (void)updateContentOffsetWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(VUIShelfViewController *)self collectionView];
  [v5 contentInset];
  double v7 = v6;

  objc_super v8 = [(VUIShelfViewController *)self collectionView];
  [v8 contentOffset];
  double v10 = v9;
  uint64_t v12 = v11;

  v13 = [(VUIShelfViewController *)self collectionView];
  [v13 bounds];
  *(double *)&long long v22 = v7 + v10;
  *((void *)&v22 + 1) = CGRectGetMidY(v23);

  v14 = -[VUIShelfViewController _findSnappingItemFromContentOffset:withVelocity:](self, "_findSnappingItemFromContentOffset:withVelocity:", &v22, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  v15 = [(VUIShelfViewController *)self view];
  [v15 setNeedsLayout];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__VUIShelfViewController_updateContentOffsetWithTransitionCoordinator___block_invoke;
  v17[3] = &unk_1E6DFABE0;
  v17[4] = self;
  id v18 = v14;
  double v19 = v10;
  uint64_t v20 = v12;
  long long v21 = v22;
  id v16 = v14;
  [v4 animateAlongsideTransition:v17 completion:0];
}

void __71__VUIShelfViewController_updateContentOffsetWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCollectionViewLayout:1];
  if (*(void *)(a1 + 40))
  {
    long long v6 = *(_OWORD *)(a1 + 48);
    v2 = [*(id *)(a1 + 32) collectionView];
    v3 = [v2 cellForItemAtIndexPath:*(void *)(a1 + 40)];

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_snapTargetContentOffset:toItemIndexPath:atItemOffset:", &v6, *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
      long long v4 = v6;
      v5 = [*(id *)(a1 + 32) collectionView];
      [v5 setContentOffset:v4];
    }
  }
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)VUIShelfViewController;
  [(VUIShelfViewController *)&v8 viewWillLayoutSubviews];
  if (self->_shouldUpdateBeforeLayout)
  {
    self->_shouldUpdateBeforeLayout = 0;
    [(VUIShelfViewController *)self _updateCollectionViewLayout:1];
  }
  containerView = self->_containerView;
  long long v4 = [(VUIShelfViewController *)self view];
  [v4 bounds];
  -[VUIShelfView setFrame:](containerView, "setFrame:");

  collectionView = self->_collectionView;
  long long v6 = (void *)MEMORY[0x1E4FB1F48];
  double v7 = [(VUIShelfViewController *)self view];
  [v7 bounds];
  objc_msgSend(v6, "vui_paddingForWindowWidth:", CGRectGetWidth(v9));
  -[UICollectionView setContentInset:](collectionView, "setContentInset:");
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_focusedIndexPath && objc_msgSend(v4, "vui_isIndexPathValid:")) {
    long long v6 = self->_focusedIndexPath;
  }
  else {
    long long v6 = 0;
  }

  return v6;
}

- (void)_ensureScrollViewSnaps
{
  v3 = [(VUIShelfViewController *)self collectionView];
  [v3 contentInset];
  double v5 = v4;

  long long v6 = [(VUIShelfViewController *)self collectionView];
  [v6 contentOffset];
  double v8 = v7;
  double v17 = v7;
  double v18 = v9;

  double v10 = [(VUIShelfViewController *)self collectionView];
  [v10 bounds];
  double v15 = v5 + v8;
  double MidY = CGRectGetMidY(v19);

  uint64_t v11 = -[VUIShelfViewController _findSnappingItemFromContentOffset:withVelocity:](self, "_findSnappingItemFromContentOffset:withVelocity:", &v15, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  if (v11)
  {
    -[VUIShelfViewController _snapTargetContentOffset:toItemIndexPath:atItemOffset:](self, "_snapTargetContentOffset:toItemIndexPath:atItemOffset:", &v17, v11, v15, MidY);
    double v12 = v17;
    double v13 = v18;
    v14 = [(VUIShelfViewController *)self collectionView];
    objc_msgSend(v14, "setContentOffset:", v12, v13);
  }
}

- (id)_findSnappingItemFromContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
  double x = a4.x;
  double v7 = [(VUIShelfViewController *)self collectionView];
  [v7 contentSize];
  double v9 = v8;
  double v10 = [(VUIShelfViewController *)self collectionView];
  [v10 frame];
  double v12 = v9 - v11;

  if (v12 > 0.0 && a3->x >= v12)
  {
    id v14 = 0;
    int v26 = 1;
  }
  else
  {
    double v13 = [(VUIShelfViewController *)self collectionView];
    objc_msgSend(v13, "indexPathForItemAtPoint:", a3->x, a3->y);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      double v15 = [(VUIShelfViewController *)self collectionView];
      id v16 = [v15 collectionViewLayout];
      [v16 minimumInteritemSpacing];
      double v18 = v17;

      double v19 = -v18;
      if (x > 0.0) {
        double v19 = v18;
      }
      a3->double x = v19 + a3->x;
      uint64_t v20 = [(VUIShelfViewController *)self collectionView];
      objc_msgSend(v20, "indexPathForItemAtPoint:", a3->x, a3->y);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        long long v21 = [(VUIShelfViewController *)self collectionView];
        long long v22 = [v21 collectionViewLayout];
        [v22 minimumLineSpacing];
        double v24 = v23;

        a3->y = a3->y - v24;
        v25 = [(VUIShelfViewController *)self collectionView];
        objc_msgSend(v25, "indexPathForItemAtPoint:", a3->x, a3->y);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    int v26 = 0;
  }
  v27 = [(VUIShelfViewController *)self collectionView];
  uint64_t v28 = [v27 numberOfSections];

  if (!v14)
  {
    uint64_t v29 = v28 - 1;
    if (v28 >= 1)
    {
      uint64_t v30 = 0;
      do
      {
        v31 = [(VUIShelfViewController *)self collectionView];
        uint64_t v32 = [v31 numberOfItemsInSection:v30];

        if (v32 < 1)
        {
          v33 = 0;
          ++v30;
        }
        else
        {
          v33 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v30];
        }
      }
      while (v30 < v28 && !v33);
      do
      {
        v34 = [(VUIShelfViewController *)self collectionView];
        uint64_t v35 = [v34 numberOfItemsInSection:v29];

        if (v35 < 1)
        {
          v36 = 0;
          if (--v29 < 0) {
            break;
          }
        }
        else
        {
          v36 = [MEMORY[0x1E4F28D58] indexPathForItem:v35 - 1 inSection:v29];
          if (v29 < 0) {
            break;
          }
        }
      }
      while (!v36);
      if (v26) {
        v37 = v36;
      }
      else {
        v37 = v33;
      }
      id v14 = v37;
    }
  }
  return v14;
}

- (void)_snapTargetContentOffset:(CGPoint *)a3 toItemIndexPath:(id)a4 atItemOffset:(CGPoint)a5
{
  double x = a5.x;
  id v35 = a4;
  double v8 = [(VUIShelfViewController *)self collectionView];
  [v8 frame];
  double v10 = v9;

  double v11 = [(VUIShelfViewController *)self collectionView];
  [v11 contentSize];
  double v13 = v12;

  id v14 = [(VUIShelfViewController *)self collectionView];
  [v14 contentInset];
  double v16 = v15;
  double v18 = v17;

  double v19 = v10 - v18 - v16;
  uint64_t v20 = [(VUIShelfViewController *)self collectionView];
  long long v21 = [v20 layoutAttributesForItemAtIndexPath:v35];

  [v21 frame];
  double v26 = v22;
  if (v22 < v13 - v19)
  {
    if (CGRectGetMidX(*(CGRect *)&v22) < x)
    {
      v27 = [(VUIShelfViewController *)self collectionView];
      uint64_t v28 = objc_msgSend(v27, "numberOfItemsInSection:", objc_msgSend(v35, "section")) - 1;
      uint64_t v29 = [v35 item];

      if (v28 > v29)
      {
        uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v35, "item") + 1, objc_msgSend(v35, "section"));

        v31 = [(VUIShelfViewController *)self collectionView];
        uint64_t v32 = [v31 layoutAttributesForItemAtIndexPath:v30];

        [v32 frame];
        double v26 = v33;
        long long v21 = v32;
        id v35 = (id)v30;
      }
    }
    goto LABEL_6;
  }
  if (v13 < v19)
  {
LABEL_6:
    double v34 = v26 - v16;
    goto LABEL_8;
  }
  double v34 = v13 - v10 + v18;
LABEL_8:
  a3->double x = v34;
}

- (void)_updateCollectionViewLayout:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(VUIShelfViewController *)self collectionView];
  id v7 = [v5 collectionViewLayout];

  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_collectionInteritemSpace:gridType:", self->_gridStyle, 0);
  objc_msgSend(v7, "setMinimumInteritemSpacing:");
  if (objc_opt_respondsToSelector()) {
    [(VUIShelfViewController *)self updateShelfLayout:v7];
  }
  if (v3)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FA9CB8]);
    [v6 setInvalidateLayout:1];
    [v7 invalidateLayoutWithContext:v6];
  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UIView)headerView
{
  return self->_headerView;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (VUIShelfView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (NSIndexPath)focusedIndexPath
{
  return self->_focusedIndexPath;
}

- (void)setFocusedIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end