@interface VideosExtrasCarouselViewController
- (BOOL)_isPhone;
- (BOOL)isRevealingNavigationBarDuringTransition;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (VideosExtrasCarouselCollectionView)carouselCollectionView;
- (VideosExtrasCarouselCollectionViewLayout)carouselCollectionViewLayout;
- (VideosExtrasCarouselViewControllerDataSource)dataSource;
- (VideosExtrasCarouselViewControllerDelegate)delegate;
- (id)_findSnappingItemFromContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4;
- (id)carouselCollectionViewCellForItemAtIndex:(unint64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)_numberOfItems;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)indexOfVisibleItem;
- (void)_ensureScrollViewSnaps;
- (void)_loadCarouselCollectionViewInView:(id)a3 withContraintsAccumulator:(id)a4;
- (void)_snapTargetContentOffset:(CGPoint *)a3 toItemIndexPath:(id)a4 atItemOffset:(CGPoint)a5;
- (void)_updateOpacityOfTextInVisibleCells;
- (void)_updateWindowSizeForVisibleCells;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4;
- (void)performZoomingImageTransitionWithContext:(id)a3;
- (void)prepareZoomingImageTransitionWithContext:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCarouselCollectionView:(id)a3;
- (void)setCarouselCollectionViewLayout:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIndexOfVisibleItem:(unint64_t)a3;
- (void)setIndexOfVisibleItem:(unint64_t)a3 animated:(BOOL)a4;
- (void)setRevealingNavigationBarDuringTransition:(BOOL)a3;
- (void)subviewsDidChangeForCarouselCollectionView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VideosExtrasCarouselViewController

- (void)dealloc
{
  v3 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
  [v3 setDataSource:0];
  [v3 setDelegate:0];
  [v3 setCarouselCollectionViewDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasCarouselViewController;
  [(VideosExtrasCarouselViewController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasCarouselViewController;
  [(VideosExtrasCarouselViewController *)&v7 viewWillAppear:a3];
  objc_super v4 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
  v5 = [v4 indexPathsForSelectedItems];
  if ([v5 count] == 1)
  {
    v6 = [v5 firstObject];
    [v4 deselectItemAtIndexPath:v6 animated:1];
  }
  [(VideosExtrasCarouselViewController *)self _ensureScrollViewSnaps];
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)VideosExtrasCarouselViewController;
  [(VideosExtrasCarouselViewController *)&v25 viewDidLoad];
  v3 = [(VideosExtrasCarouselViewController *)self view];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VideosExtrasCarouselViewController *)self _loadCarouselCollectionViewInView:v3 withContraintsAccumulator:v4];
  [v3 addConstraints:v4];
  if ([(VideosExtrasCarouselViewController *)self _isPhone])
  {
    v5 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
    [v5 layoutIfNeeded];
    v6 = [(VideosExtrasCarouselViewController *)self dataSource];
    uint64_t v7 = [v6 carouselSize];

    v8 = [(VideosExtrasCarouselViewController *)self navigationController];
    v9 = [v8 view];
    [v9 safeAreaInsets];
    double v11 = v10;
    v12 = [(VideosExtrasCarouselViewController *)self navigationController];
    v13 = [v12 view];
    [v13 safeAreaInsets];
    double v15 = v14;

    double v16 = v11 + v15;
    switch(v7)
    {
      case 0:
      case 1:
        if (v16 == 0.0) {
          double v17 = 30.0;
        }
        else {
          double v17 = v11 + v15;
        }
        *(double *)&uint64_t v18 = 52.0;
        goto LABEL_13;
      case 2:
        if (v16 == 0.0) {
          double v17 = 30.0;
        }
        else {
          double v17 = v11 + v15;
        }
        *(double *)&uint64_t v18 = 62.0;
LABEL_13:
        double v19 = *(double *)&v18;
        break;
      case 3:
        if (v16 == 0.0) {
          double v17 = 30.0;
        }
        else {
          double v17 = v11 + v15;
        }
        double v19 = 51.0;
        break;
      default:
        double v17 = *MEMORY[0x1E4F1DB30];
        double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        break;
    }
    objc_msgSend(v5, "bounds", v16);
    double v21 = v20;
    [v5 bounds];
    double v23 = v22;
    v24 = [(VideosExtrasCarouselViewController *)self carouselCollectionViewLayout];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v24, "setItemSize:", v21 - v17, v23 - v19);
    }
    if (objc_opt_respondsToSelector()) {
      [v24 setMinimumInteritemSpacing:0.0];
    }
    [v24 invalidateLayout];
  }
  else
  {
    [(VideosExtrasCarouselViewController *)self _updateOpacityOfTextInVisibleCells];
    [(VideosExtrasCarouselViewController *)self _updateWindowSizeForVisibleCells];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8 = a4;
  v9 = [a3 cellForItemAtIndexPath:a5];
  if (!v9 || ![(VideosExtrasCarouselViewController *)self _isPhone]) {
    goto LABEL_7;
  }
  double v10 = [v9 titleText];
  if ([v10 length]) {
    goto LABEL_6;
  }
  double v11 = [v9 subtitleText];
  if ([v11 length])
  {

LABEL_6:
    goto LABEL_7;
  }
  uint64_t v18 = [v9 descriptionText];
  uint64_t v19 = [v18 length];

  if (!v19)
  {
    [v9 thumbnailMaxSize];
    goto LABEL_8;
  }
LABEL_7:
  [v8 itemSize];
LABEL_8:
  double v14 = v12;
  double v15 = v13;

  double v16 = v14;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 item];
  v9 = [v7 window];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  if ([(VideosExtrasCarouselViewController *)self _isPhone])
  {
    double v14 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v16 = [v7 dequeueReusableCellWithReuseIdentifier:@"_VideosExtrasLockupCollectionViewCellReuseIdentifier" forIndexPath:v6];

    [v16 setItemIndex:v8];
    [v16 setZoomingImageTransitionIdentifier:@"VideosExtrasCarouselZoomingImageTransitionIdentifier"];
  }
  else
  {
    double v16 = [v7 dequeueReusableCellWithReuseIdentifier:@"_VideosExtrasCarouselCollectionViewCellReuseIdentifier" forIndexPath:v6];

    objc_msgSend(v16, "setWindowSize:", v11, v13);
    double v17 = [v16 titleLabel];
    [v17 setAlpha:0.0];

    uint64_t v18 = [v16 descriptionLabel];
    [v18 setAlpha:0.0];

    [v16 setItemIndex:v8];
    [v16 setZoomingImageTransitionIdentifier:@"VideosExtrasCarouselZoomingImageTransitionIdentifier"];
    uint64_t v19 = [(VideosExtrasCarouselViewController *)self carouselCollectionViewLayout];
    [v19 itemWidth];
    double v14 = v20;
    [v16 thumbnailImageContainerHeight];
    double v15 = v21;
  }
  double v22 = [(VideosExtrasCarouselViewController *)self dataSource];
  objc_msgSend(v22, "carouselViewController:configureCarouselCollectionViewCell:forItemAtIndex:withThumbnailImageContainerSize:", self, v16, v8, v14, v15);

  return v16;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v5 = [(VideosExtrasCarouselViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "carouselViewController:didHighlightItemAtIndex:", self, objc_msgSend(v6, "item"));
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VideosExtrasCarouselViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v7 item];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__VideosExtrasCarouselViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v10[3] = &unk_1E6DF4F18;
    id v11 = v6;
    id v12 = v7;
    [v8 carouselViewController:self didSelectItemAtIndex:v9 completionHandler:v10];
  }
}

uint64_t __78__VideosExtrasCarouselViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) deselectItemAtIndexPath:*(void *)(result + 40) animated:1];
  }
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)scrollViewDidScroll:(id)a3
{
  if (![(VideosExtrasCarouselViewController *)self _isPhone])
  {
    [(VideosExtrasCarouselViewController *)self _updateOpacityOfTextInVisibleCells];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  if ([(VideosExtrasCarouselViewController *)self _isPhone])
  {
    uint64_t v9 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
    [v9 _effectiveContentInset];
    double v11 = v10;

    double v12 = v11 + a5->x;
    double v13 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
    [v13 bounds];
    double v15 = v12;
    double MidY = CGRectGetMidY(v17);

    double v14 = -[VideosExtrasCarouselViewController _findSnappingItemFromContentOffset:withVelocity:](self, "_findSnappingItemFromContentOffset:withVelocity:", &v15, x, y);
    if (v14) {
      -[VideosExtrasCarouselViewController _snapTargetContentOffset:toItemIndexPath:atItemOffset:](self, "_snapTargetContentOffset:toItemIndexPath:atItemOffset:", a5, v14, v15, MidY);
    }
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasCarouselViewController;
  [(VideosExtrasCarouselViewController *)&v4 didMoveToParentViewController:a3];
  [(VideosExtrasCarouselViewController *)self _ensureScrollViewSnaps];
}

- (void)_ensureScrollViewSnaps
{
  if ([(VideosExtrasCarouselViewController *)self _isPhone])
  {
    v3 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
    [v3 _effectiveContentInset];
    double v5 = v4;

    id v6 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
    [v6 contentOffset];
    double v8 = v7;
    double v17 = v7;
    double v18 = v9;

    double v10 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
    [v10 bounds];
    double v15 = v5 + v8;
    double MidY = CGRectGetMidY(v19);

    double v11 = -[VideosExtrasCarouselViewController _findSnappingItemFromContentOffset:withVelocity:](self, "_findSnappingItemFromContentOffset:withVelocity:", &v15, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    if (v11)
    {
      -[VideosExtrasCarouselViewController _snapTargetContentOffset:toItemIndexPath:atItemOffset:](self, "_snapTargetContentOffset:toItemIndexPath:atItemOffset:", &v17, v11, v15, MidY);
      double v12 = v17;
      double v13 = v18;
      double v14 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
      objc_msgSend(v14, "setContentOffset:", v12, v13);
    }
  }
}

- (id)_findSnappingItemFromContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
  double x = a4.x;
  double v7 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
  [v7 contentSize];
  double v9 = v8;
  double v10 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
  [v10 frame];
  double v12 = v9 - v11;

  if (v12 > 0.0 && a3->x >= v12)
  {
    id v14 = 0;
    int v24 = 1;
  }
  else
  {
    double v13 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
    objc_msgSend(v13, "indexPathForItemAtPoint:", a3->x, a3->y);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      double v15 = [(VideosExtrasCarouselViewController *)self carouselCollectionViewLayout];
      [v15 minimumInteritemSpacing];
      double v17 = v16;

      double v18 = 10.0;
      if (v17 != 0.0) {
        double v18 = v17;
      }
      if (x <= 0.0) {
        double v18 = -v18;
      }
      a3->double x = a3->x + v18;
      CGRect v19 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
      objc_msgSend(v19, "indexPathForItemAtPoint:", a3->x, a3->y);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        double v20 = [(VideosExtrasCarouselViewController *)self carouselCollectionViewLayout];
        [v20 minimumLineSpacing];
        double v22 = v21;

        a3->double y = a3->y - v22;
        double v23 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
        objc_msgSend(v23, "indexPathForItemAtPoint:", a3->x, a3->y);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    int v24 = 0;
  }
  objc_super v25 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
  uint64_t v26 = [v25 numberOfSections];

  if (!v14)
  {
    uint64_t v27 = v26 - 1;
    if (v26 >= 1)
    {
      uint64_t v28 = 0;
      do
      {
        v29 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
        uint64_t v30 = [v29 numberOfItemsInSection:v28];

        if (v30 < 1)
        {
          v31 = 0;
          ++v28;
        }
        else
        {
          v31 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v28];
        }
      }
      while (v28 < v26 && !v31);
      do
      {
        v32 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
        uint64_t v33 = [v32 numberOfItemsInSection:v27];

        if (v33 < 1)
        {
          v34 = 0;
          if (--v27 < 0) {
            break;
          }
        }
        else
        {
          v34 = [MEMORY[0x1E4F28D58] indexPathForItem:v33 - 1 inSection:v27];
          if (v27 < 0) {
            break;
          }
        }
      }
      while (!v34);
      if (v24) {
        v35 = v34;
      }
      else {
        v35 = v31;
      }
      id v14 = v35;
    }
  }
  return v14;
}

- (void)_snapTargetContentOffset:(CGPoint *)a3 toItemIndexPath:(id)a4 atItemOffset:(CGPoint)a5
{
  double x = a5.x;
  id v35 = a4;
  double v8 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
  [v8 frame];
  double v10 = v9;

  double v11 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
  [v11 contentSize];
  double v13 = v12;

  id v14 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
  [v14 _effectiveContentInset];
  double v16 = v15;
  double v18 = v17;

  double v19 = v10 - v18 - v16;
  double v20 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
  double v21 = [v20 layoutAttributesForItemAtIndexPath:v35];

  [v21 frame];
  double v26 = v22;
  if (v22 < v13 - v19)
  {
    if (CGRectGetMidX(*(CGRect *)&v22) < x)
    {
      uint64_t v27 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
      uint64_t v28 = objc_msgSend(v27, "numberOfItemsInSection:", objc_msgSend(v35, "section")) - 1;
      uint64_t v29 = [v35 item];

      if (v28 > v29)
      {
        uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v35, "item") + 1, objc_msgSend(v35, "section"));

        v31 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
        v32 = [v31 layoutAttributesForItemAtIndexPath:v30];

        [v32 frame];
        double v26 = v33;
        double v21 = v32;
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

- (void)subviewsDidChangeForCarouselCollectionView:(id)a3
{
  if (![(VideosExtrasCarouselViewController *)self _isPhone])
  {
    [(VideosExtrasCarouselViewController *)self _updateOpacityOfTextInVisibleCells];
  }
}

- (void)prepareZoomingImageTransitionWithContext:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 appearState];
  uint64_t v5 = [v11 itemIndex];
  if (!v4)
  {
    [(VideosExtrasCarouselViewController *)self setIndexOfVisibleItem:v5];
    id v6 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
    [v6 layoutIfNeeded];

    [(VideosExtrasCarouselViewController *)self _updateOpacityOfTextInVisibleCells];
    double v7 = [(VideosExtrasCarouselViewController *)self view];
    [v7 setAlpha:0.0];

    double v8 = [(VideosExtrasCarouselViewController *)self navigationController];
    if ([v8 isNavigationBarHidden])
    {
      [(VideosExtrasCarouselViewController *)self setRevealingNavigationBarDuringTransition:1];
      [v8 setNavigationBarHidden:0 animated:1];
      double v9 = [v8 navigationBar];
      [v9 setAlpha:0.0];
    }
  }
  double v10 = [(VideosExtrasCarouselViewController *)self carouselCollectionViewCellForItemAtIndex:v5];
  [v10 prepareZoomingImageTransitionWithContext:v11];
}

- (void)performZoomingImageTransitionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 appearState];
  if (v5)
  {
    if (v5 != 1) {
      goto LABEL_8;
    }
    id v6 = [(VideosExtrasCarouselViewController *)self view];
    double v7 = v6;
    double v8 = 0.0;
  }
  else
  {
    if ([(VideosExtrasCarouselViewController *)self isRevealingNavigationBarDuringTransition])
    {
      double v9 = [(VideosExtrasCarouselViewController *)self navigationController];
      double v10 = [v9 navigationBar];
      [v10 setAlpha:1.0];
    }
    id v6 = [(VideosExtrasCarouselViewController *)self view];
    double v7 = v6;
    double v8 = 1.0;
  }
  [v6 setAlpha:v8];

LABEL_8:
  -[VideosExtrasCarouselViewController carouselCollectionViewCellForItemAtIndex:](self, "carouselCollectionViewCellForItemAtIndex:", [v4 itemIndex]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 performZoomingImageTransitionWithContext:v4];
}

- (void)finalizeZoomingImageTransitionWithContext:(id)a3 transitionFinished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[VideosExtrasCarouselViewController carouselCollectionViewCellForItemAtIndex:](self, "carouselCollectionViewCellForItemAtIndex:", [v6 itemIndex]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 finalizeZoomingImageTransitionWithContext:v6 transitionFinished:v4];
  uint64_t v7 = [v6 appearState];

  if (v7 == 1)
  {
    double v8 = [(VideosExtrasCarouselViewController *)self view];
    [v8 setAlpha:1.0];
  }
  [(VideosExtrasCarouselViewController *)self setRevealingNavigationBarDuringTransition:0];
}

- (unint64_t)indexOfVisibleItem
{
  v2 = [(VideosExtrasCarouselViewController *)self carouselCollectionViewLayout];
  unint64_t v3 = [v2 indexOfVisibleItem];

  return v3;
}

- (void)setIndexOfVisibleItem:(unint64_t)a3
{
}

- (void)setIndexOfVisibleItem:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
  [v7 layoutIfNeeded];

  id v8 = [(VideosExtrasCarouselViewController *)self carouselCollectionViewLayout];
  [v8 setIndexOfVisibleItem:a3 animated:v4];
}

- (id)carouselCollectionViewCellForItemAtIndex:(unint64_t)a3
{
  BOOL v4 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  uint64_t v5 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
  id v6 = [v5 cellForItemAtIndexPath:v4];

  return v6;
}

- (void)_loadCarouselCollectionViewInView:(id)a3 withContraintsAccumulator:(id)a4
{
  id v38 = a3;
  id v6 = a4;
  double v7 = *MEMORY[0x1E4FB2848];
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if ([(VideosExtrasCarouselViewController *)self _isPhone])
  {
    id v11 = objc_alloc_init(VideosExtrasCarouselCollectionViewFlowLayout);
    [(UICollectionViewFlowLayout *)v11 setScrollDirection:1];
    double v12 = [(VideosExtrasCarouselViewController *)self navigationController];
    double v13 = [v12 view];
    [v13 safeAreaInsets];
    double v15 = v14;

    double v16 = [(VideosExtrasCarouselViewController *)self navigationController];
    double v17 = [v16 view];
    [v17 safeAreaInsets];
    double v19 = v18;

    if (v15 == 0.0) {
      double v20 = 15.0;
    }
    else {
      double v20 = v15;
    }
    if (v19 == 0.0) {
      double v21 = 15.0;
    }
    else {
      double v21 = v19;
    }
  }
  else
  {
    id v11 = objc_alloc_init(VideosExtrasCarouselCollectionViewLayout);
    double v21 = v10;
    double v20 = v8;
  }
  [(VideosExtrasCarouselViewController *)self setCarouselCollectionViewLayout:v11];
  double v22 = [VideosExtrasCarouselCollectionView alloc];
  double v23 = -[VideosExtrasCarouselCollectionView initWithFrame:collectionViewLayout:](v22, "initWithFrame:collectionViewLayout:", v11, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  -[VideosExtrasCarouselCollectionView setContentInset:](v23, "setContentInset:", v7, v20, v9, v21);
  [(VideosExtrasCarouselCollectionView *)v23 setShowsHorizontalScrollIndicator:0];
  int v24 = [MEMORY[0x1E4FB1618] clearColor];
  [(VideosExtrasCarouselCollectionView *)v23 setBackgroundColor:v24];

  [(VideosExtrasCarouselCollectionView *)v23 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"_VideosExtrasCarouselCollectionViewCellReuseIdentifier"];
  [(VideosExtrasCarouselCollectionView *)v23 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"_VideosExtrasLockupCollectionViewCellReuseIdentifier"];
  [(VideosExtrasCarouselCollectionView *)v23 setDataSource:self];
  [(VideosExtrasCarouselCollectionView *)v23 setDelegate:self];
  [(VideosExtrasCarouselCollectionView *)v23 setCarouselCollectionViewDelegate:self];
  [(VideosExtrasCarouselCollectionView *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VideosExtrasCarouselCollectionView *)v23 _setContentInsetAdjustmentBehavior:2];
  [v38 addSubview:v23];
  double v25 = 0.0;
  double v26 = [MEMORY[0x1E4F28DC8] constraintWithItem:v23 attribute:3 relatedBy:0 toItem:v38 attribute:3 multiplier:1.0 constant:0.0];
  [v6 addObject:v26];

  uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v23, v38, 10, v7, v8, v9, v10);
  [v6 addObjectsFromArray:v27];

  uint64_t v28 = [(VideosExtrasCarouselViewController *)self navigationController];
  char v29 = objc_opt_respondsToSelector();

  if (v29)
  {
    uint64_t v30 = [(VideosExtrasCarouselViewController *)self navigationController];
    v31 = [v30 mainTemplateViewController];
    v32 = [v31 menuBarView];
    [v32 bounds];
    double v25 = v33;

    double v34 = (void *)MEMORY[0x1E4F28DC8];
    if (v25 > 0.0)
    {
      int v35 = 0;
      v36 = v38;
      goto LABEL_14;
    }
  }
  else
  {
    double v34 = (void *)MEMORY[0x1E4F28DC8];
  }
  v31 = [(VideosExtrasCarouselViewController *)self view];
  v36 = [v31 safeAreaLayoutGuide];
  int v35 = 1;
LABEL_14:
  v37 = [v34 constraintWithItem:v23 attribute:4 relatedBy:0 toItem:v36 attribute:4 multiplier:1.0 constant:-v25];
  [v6 addObject:v37];

  if (v35)
  {
  }
  [(VideosExtrasCarouselViewController *)self setCarouselCollectionView:v23];
}

- (int64_t)_numberOfItems
{
  unint64_t v3 = [(VideosExtrasCarouselViewController *)self dataSource];
  int64_t v4 = [v3 numberOfItemsInCarouselViewController:self];

  return v4;
}

- (void)_updateOpacityOfTextInVisibleCells
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (![(VideosExtrasCarouselViewController *)self _isPhone])
  {
    unint64_t v3 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
    int64_t v4 = [v3 superview];
    [v3 center];
    double v6 = v5;
    double v7 = [(VideosExtrasCarouselViewController *)self carouselCollectionViewLayout];
    [v7 itemWidth];
    double v9 = v8;

    double v10 = [v3 visibleCells];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          [v15 bounds];
          objc_msgSend(v15, "convertRect:toView:", v4);
          double v16 = vabdd_f64(CGRectGetMidX(v28), v6);
          double v17 = 1.0;
          if (v16 >= v9 * 0.5)
          {
            double v17 = 0.0;
            if (v16 <= v9)
            {
              MPULayoutLinearRelationMake();
              MPULayoutLinearRelationEvaluate();
              double v17 = v18;
            }
          }
          double v19 = [v15 titleLabel];
          [v19 setAlpha:v17];

          double v20 = [v15 subtitleLabel];
          [v20 setAlpha:v17];

          double v21 = [v15 descriptionLabel];
          [v21 setAlpha:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
  }
}

- (void)_updateWindowSizeForVisibleCells
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(VideosExtrasCarouselViewController *)self carouselCollectionView];
  unint64_t v3 = [v2 window];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = [v2 visibleCells];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "setWindowSize:", v5, v7);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)_isPhone
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (VideosExtrasCarouselViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (VideosExtrasCarouselViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (VideosExtrasCarouselViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VideosExtrasCarouselViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VideosExtrasCarouselCollectionView)carouselCollectionView
{
  return self->_carouselCollectionView;
}

- (void)setCarouselCollectionView:(id)a3
{
}

- (VideosExtrasCarouselCollectionViewLayout)carouselCollectionViewLayout
{
  return self->_carouselCollectionViewLayout;
}

- (void)setCarouselCollectionViewLayout:(id)a3
{
}

- (BOOL)isRevealingNavigationBarDuringTransition
{
  return self->_revealingNavigationBarDuringTransition;
}

- (void)setRevealingNavigationBarDuringTransition:(BOOL)a3
{
  self->_revealingNavigationBarDuringTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carouselCollectionViewLayout, 0);
  objc_storeStrong((id *)&self->_carouselCollectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end