@interface SKUIGiftThemePickerViewController
- (BOOL)_isIPadLarge;
- (SKUIGiftThemePickerViewController)initWithGift:(id)a3 configuration:(id)a4;
- (double)_cardHeight:(id)a3;
- (double)_cardWidth;
- (double)_collectionViewWidth:(id)a3;
- (double)_scrollInsetHorizontal:(id)a3;
- (id)_collectionView;
- (id)_flowLayout;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_backgroundTapAction:(id)a3;
- (void)_layoutCollectionViewWithTraits:(id)a3;
- (void)_nextAction:(id)a3;
- (void)_setItemImage:(id)a3 error:(id)a4;
- (void)_setSelectedThemeIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)giftConfigurationController:(id)a3 didLoadImageForTheme:(id)a4;
- (void)loadView;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUIGiftThemePickerViewController

- (SKUIGiftThemePickerViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftThemePickerViewController initWithGift:configuration:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIGiftThemePickerViewController;
  v8 = [(SKUIGiftStepViewController *)&v15 initWithGift:v6 configuration:v7];
  if (v8)
  {
    uint64_t v9 = [v7 themes];
    themes = v8->_themes;
    v8->_themes = (NSArray *)v9;

    [v7 addObserver:v8];
    v11 = [v7 clientContext];
    v12 = v11;
    if (v11) {
      [v11 localizedStringForKey:@"GIFTING_THEME_TITLE" inTable:@"Gifting"];
    }
    else {
    v13 = +[SKUIClientContext localizedStringForKey:@"GIFTING_THEME_TITLE" inBundles:0 inTable:@"Gifting"];
    }
    [(SKUIGiftThemePickerViewController *)v8 setTitle:v13];

    [(SKUIGiftThemePickerViewController *)v8 setEdgesForExtendedLayout:0];
  }

  return v8;
}

- (void)dealloc
{
  [(SKUIGiftThemeCollectionView *)self->_collectionView setDataSource:0];
  [(SKUIGiftThemeCollectionView *)self->_collectionView setDelegate:0];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer removeTarget:self action:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIGiftThemePickerViewController;
  [(SKUIGiftThemePickerViewController *)&v3 dealloc];
}

- (void)loadView
{
  v39 = objc_alloc_init(SKUIGiftThemeBackgroundView);
  objc_super v3 = [MEMORY[0x1E4FB1618] _systemBackgroundColor];
  [(SKUIGiftThemeBackgroundView *)v39 setBackgroundColor:v3];

  [(SKUIGiftThemeBackgroundView *)v39 setClipsToBounds:1];
  [(SKUIGiftThemePickerViewController *)self setView:v39];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  if (!tapGestureRecognizer)
  {
    v5 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
    id v6 = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v5;

    [(UITapGestureRecognizer *)self->_tapGestureRecognizer addTarget:self action:sel__backgroundTapAction_];
    tapGestureRecognizer = self->_tapGestureRecognizer;
  }
  [(SKUIGiftThemeBackgroundView *)v39 addGestureRecognizer:tapGestureRecognizer];
  id v7 = [(SKUIGiftThemePickerViewController *)self _collectionView];
  v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setBackgroundColor:v8];

  [(SKUIGiftThemeBackgroundView *)v39 addSubview:v7];
  [(SKUIGiftThemeBackgroundView *)v39 setScrollView:v7];
  if (!self->_pageControl)
  {
    uint64_t v9 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E4FB1A40]);
    pageControl = self->_pageControl;
    self->_pageControl = v9;

    [(UIPageControl *)self->_pageControl setAutoresizingMask:13];
    v11 = self->_pageControl;
    v12 = [(UIPageControl *)v11 tintColor];
    [(UIPageControl *)v11 setCurrentPageIndicatorTintColor:v12];

    [(UIPageControl *)self->_pageControl setNumberOfPages:[(NSArray *)self->_themes count]];
    v13 = self->_pageControl;
    v14 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
    [(UIPageControl *)v13 setPageIndicatorTintColor:v14];

    [(UIPageControl *)self->_pageControl sizeToFit];
  }
  [(SKUIGiftThemeBackgroundView *)v39 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  CGFloat v22 = v21;
  [(UIPageControl *)self->_pageControl frame];
  double v24 = v23;
  double v26 = v25;
  float v27 = (v20 - v23) * 0.5;
  double v28 = floorf(v27);
  v41.origin.x = v16;
  v41.origin.y = v18;
  v41.size.width = v20;
  v41.size.height = v22;
  double MaxY = CGRectGetMaxY(v41);
  v30 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v31 = [v30 userInterfaceIdiom];

  double v32 = 3.0;
  if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v32 = 25.0;
  }
  -[UIPageControl setFrame:](self->_pageControl, "setFrame:", v28, MaxY - v32 - v26, v24, v26);
  [(SKUIGiftThemeBackgroundView *)v39 addSubview:self->_pageControl];
  v33 = [(SKUIGiftStepViewController *)self giftConfiguration];
  v34 = [v33 clientContext];

  v35 = [(SKUIGiftThemePickerViewController *)self navigationItem];
  if (v34) {
    [v34 localizedStringForKey:@"GIFTING_BACK_BUTTON" inTable:@"Gifting"];
  }
  else {
  v36 = +[SKUIClientContext localizedStringForKey:@"GIFTING_BACK_BUTTON" inBundles:0 inTable:@"Gifting"];
  }
  [v35 setBackButtonTitle:v36];

  id v37 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
  [v37 setAction:sel__nextAction_];
  [v37 setTarget:self];
  if (v34) {
    [v34 localizedStringForKey:@"GIFTING_NEXT_BUTTON" inTable:@"Gifting"];
  }
  else {
  v38 = +[SKUIClientContext localizedStringForKey:@"GIFTING_NEXT_BUTTON" inBundles:0 inTable:@"Gifting"];
  }
  [v37 setTitle:v38];

  [v35 setRightBarButtonItem:v37];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SKUIGiftStepViewController *)self gift];
  id v6 = [v5 item];

  if (v6)
  {
    id v7 = [SKUIGiftItemView alloc];
    v8 = [(SKUIGiftStepViewController *)self giftConfiguration];
    uint64_t v9 = [v8 clientContext];
    v10 = [(SKUIGiftItemView *)v7 initWithStyle:1 item:v6 clientContext:v9];

    uint64_t v11 = [(SKUIGiftItemView *)v10 artworkContext];
    v12 = (void *)v11;
    if (self->_itemImage) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v11 == 0;
    }
    if (!v13)
    {
      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __52__SKUIGiftThemePickerViewController_viewWillAppear___block_invoke;
      v19[3] = &unk_1E6424128;
      objc_copyWeak(&v20, &location);
      [(SKUIGiftStepViewController *)self loadItemArtworkWithArtworkContext:v12 completionBlock:v19];
      v14 = [(SKUIGiftStepViewController *)self gift];
      double v15 = [v14 item];
      CGFloat v16 = [v12 placeholderImageForItem:v15];
      itemImage = self->_itemImage;
      self->_itemImage = v16;

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIGiftThemePickerViewController;
  [(SKUIGiftThemePickerViewController *)&v18 viewWillAppear:v3];
}

void __52__SKUIGiftThemePickerViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _setItemImage:v6 error:v5];
}

- (void)viewWillLayoutSubviews
{
  id v3 = [(SKUIGiftThemePickerViewController *)self traitCollection];
  [(SKUIGiftThemePickerViewController *)self _layoutCollectionViewWithTraits:v3];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  self->_animatingScrollView = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __95__SKUIGiftThemePickerViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E6422278;
  v4[4] = self;
  [a4 animateAlongsideTransition:0 completion:v4];
}

uint64_t __95__SKUIGiftThemePickerViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1008) = 0;
  return result;
}

- (void)giftConfigurationController:(id)a3 didLoadImageForTheme:(id)a4
{
  NSUInteger v5 = [(NSArray *)self->_themes indexOfObjectIdenticalTo:a4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    collectionView = self->_collectionView;
    id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v5 inSection:0];
    id v8 = [(SKUIGiftThemeCollectionView *)collectionView cellForItemAtIndexPath:v7];

    [v8 reloadThemeHeaderImage];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"0" forIndexPath:v6];
  id v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setBackgroundColor:v8];

  uint64_t v9 = [(SKUIGiftStepViewController *)self giftConfiguration];
  [v7 setGiftConfiguration:v9];

  v10 = [(SKUIGiftStepViewController *)self gift];
  [v7 setGift:v10];

  [v7 setItemImage:self->_itemImage];
  themes = self->_themes;
  uint64_t v12 = [v6 item];

  BOOL v13 = [(NSArray *)themes objectAtIndex:v12];
  [v7 setTheme:v13];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_themes count];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->_animatingScrollView = 0;
  [a3 contentOffset];
  double v5 = v4;
  [(SKUIGiftThemePickerViewController *)self _cardWidth];

  [(SKUIGiftThemePickerViewController *)self _setSelectedThemeIndex:(uint64_t)(v5 / v6) animated:1];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  self->_animatingScrollView = 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (!self->_animatingScrollView)
  {
    [a3 contentOffset];
    double v5 = v4;
    [(SKUIGiftThemePickerViewController *)self _cardWidth];
    *(float *)&double v6 = v6 * 0.5;
    double v7 = v5 + floorf(*(float *)&v6);
    if (v7 <= 0.00000011920929)
    {
      unint64_t v11 = 0;
    }
    else
    {
      [(SKUIGiftThemePickerViewController *)self _cardWidth];
      unint64_t v9 = (uint64_t)(v7 / v8);
      NSUInteger v10 = [(NSArray *)self->_themes count];
      if (v10 - 1 >= v9) {
        unint64_t v11 = v9;
      }
      else {
        unint64_t v11 = v10 - 1;
      }
    }
    [(SKUIGiftThemePickerViewController *)self _setSelectedThemeIndex:v11 animated:1];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_animatingScrollView = 0;
}

- (void)_backgroundTapAction:(id)a3
{
  id v20 = a3;
  if ([v20 state] == 3)
  {
    [(SKUIGiftThemeCollectionView *)self->_collectionView frame];
    double v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    int64_t selectedThemeIndex = self->_selectedThemeIndex;
    BOOL v13 = [(SKUIGiftThemePickerViewController *)self view];
    [v20 locationInView:v13];
    double v15 = v14;

    if (v15 >= v5)
    {
      v22.origin.x = v5;
      v22.origin.y = v7;
      v22.size.width = v9;
      v22.size.height = v11;
      if (v15 > CGRectGetMaxX(v22) && selectedThemeIndex < [(NSArray *)self->_themes count] - 1) {
        ++selectedThemeIndex;
      }
    }
    else
    {
      selectedThemeIndex -= selectedThemeIndex > 0;
    }
    if (selectedThemeIndex != self->_selectedThemeIndex)
    {
      [(SKUIGiftThemeCollectionView *)self->_collectionView contentOffset];
      double v17 = v16;
      [(SKUIGiftThemePickerViewController *)self _cardWidth];
      double v19 = v18 * (double)selectedThemeIndex;
      [(SKUIGiftThemePickerViewController *)self _setSelectedThemeIndex:selectedThemeIndex animated:1];
      self->_animatingScrollView = 1;
      -[SKUIGiftThemeCollectionView setContentOffset:animated:](self->_collectionView, "setContentOffset:animated:", 1, v19, v17);
    }
  }
}

- (void)_nextAction:(id)a3
{
  id v10 = [(SKUIGiftStepViewController *)self gift];
  double v4 = [(NSArray *)self->_themes objectAtIndex:self->_selectedThemeIndex];
  [v10 setTheme:v4];
  double v5 = [SKUIGiftConfirmViewController alloc];
  double v6 = [(SKUIGiftStepViewController *)self giftConfiguration];
  CGFloat v7 = [(SKUIGiftConfirmViewController *)v5 initWithGift:v10 configuration:v6];

  double v8 = [(SKUIGiftStepViewController *)self operationQueue];
  [(SKUIGiftStepViewController *)v7 setOperationQueue:v8];

  CGFloat v9 = [(SKUIGiftThemePickerViewController *)self navigationController];
  [v9 pushViewController:v7 animated:1];
}

- (double)_cardHeight:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if ([(SKUIGiftThemePickerViewController *)self _isIPadLarge]) {
      double v7 = 684.0;
    }
    else {
      double v7 = 440.0;
    }
  }
  else if ([v4 userInterfaceIdiom] || objc_msgSend(v4, "verticalSizeClass") != 1)
  {
    double v8 = [(SKUIGiftThemePickerViewController *)self view];
    [v8 bounds];
    double v7 = v9 + -63.0;
  }
  else
  {
    double v7 = 284.0;
  }

  return v7;
}

- (double)_cardWidth
{
  BOOL v2 = [(SKUIGiftThemePickerViewController *)self _isIPadLarge];
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  float v5 = 5.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    float v5 = 25.0;
  }
  float v6 = (float)(v5 * 2.0) + 397.0;
  float v7 = (float)(v5 * 2.0) + 262.0;
  if (v2) {
    return v6;
  }
  return v7;
}

- (id)_collectionView
{
  collectionView = self->_collectionView;
  if (!collectionView)
  {
    uint64_t v4 = [SKUIGiftThemeCollectionView alloc];
    float v5 = [(SKUIGiftThemePickerViewController *)self _flowLayout];
    float v6 = -[SKUIGiftThemeCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    float v7 = self->_collectionView;
    self->_collectionView = v6;

    [(SKUIGiftThemeCollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"0"];
    [(SKUIGiftThemeCollectionView *)self->_collectionView setAlwaysBounceHorizontal:1];
    [(SKUIGiftThemeCollectionView *)self->_collectionView setClipsToBounds:0];
    [(SKUIGiftThemeCollectionView *)self->_collectionView setDataSource:self];
    [(SKUIGiftThemeCollectionView *)self->_collectionView setDelegate:self];
    [(SKUIGiftThemeCollectionView *)self->_collectionView setPagingEnabled:1];
    [(SKUIGiftThemeCollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
    collectionView = self->_collectionView;
  }

  return collectionView;
}

- (double)_collectionViewWidth:(id)a3
{
  id v4 = a3;
  float v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if ([(SKUIGiftThemePickerViewController *)self _isIPadLarge]) {
      double v7 = 784.0;
    }
    else {
      double v7 = 540.0;
    }
  }
  else if ([v4 userInterfaceIdiom] || objc_msgSend(v4, "verticalSizeClass") != 1)
  {
    double v8 = [(SKUIGiftThemePickerViewController *)self view];
    [v8 bounds];
    double v7 = v9;
  }
  else
  {
    double v7 = 414.0;
  }

  return v7;
}

- (id)_flowLayout
{
  flowLayout = self->_flowLayout;
  if (!flowLayout)
  {
    id v4 = objc_alloc_init(SKUIGiftThemePickerFlowLayout);
    float v5 = self->_flowLayout;
    self->_flowLayout = v4;

    [(UICollectionViewFlowLayout *)self->_flowLayout setMinimumInteritemSpacing:0.0];
    [(UICollectionViewFlowLayout *)self->_flowLayout setMinimumLineSpacing:0.0];
    [(UICollectionViewFlowLayout *)self->_flowLayout setScrollDirection:1];
    flowLayout = self->_flowLayout;
  }

  return flowLayout;
}

- (BOOL)_isIPadLarge
{
  BOOL v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }
  id v4 = [MEMORY[0x1E4FB1F48] keyWindow];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v14.origin.x = v6;
  v14.origin.y = v8;
  v14.size.width = v10;
  v14.size.height = v12;
  if (CGRectGetWidth(v14) < 1024.0) {
    return 0;
  }
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  return CGRectGetHeight(v15) >= 1024.0;
}

- (void)_layoutCollectionViewWithTraits:(id)a3
{
  id v4 = a3;
  [(SKUIGiftThemePickerViewController *)self _scrollInsetHorizontal:v4];
  double v6 = v5;
  [(SKUIGiftThemePickerViewController *)self _cardHeight:v4];
  double v8 = v7;
  double v9 = [(SKUIGiftThemePickerViewController *)self _flowLayout];
  [(SKUIGiftThemePickerViewController *)self _cardWidth];
  objc_msgSend(v9, "setItemSize:");

  CGFloat v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v12 = 52.0;
  }
  else {
    double v12 = 22.0;
  }
  [(SKUIGiftThemePickerViewController *)self _collectionViewWidth:v4];
  double v14 = v13;

  CGRect v15 = [(SKUIGiftThemePickerViewController *)self _collectionView];
  objc_msgSend(v15, "setFrame:", v6, v12, v14 + v6 * -2.0, v8);

  id v16 = [(SKUIGiftThemePickerViewController *)self _collectionView];
  objc_msgSend(v16, "setVisibleBoundsInsets:", 0.0, -v6, 0.0, -v6);
}

- (double)_scrollInsetHorizontal:(id)a3
{
  [(SKUIGiftThemePickerViewController *)self _collectionViewWidth:a3];
  double v5 = v4;
  [(SKUIGiftThemePickerViewController *)self _cardWidth];
  return (v5 - v6) * 0.5;
}

- (void)_setItemImage:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    double v7 = [(SKUIGiftThemeCollectionView *)self->_collectionView visibleCells];
    p_itemImage = &self->_itemImage;
    objc_storeStrong((id *)p_itemImage, a3);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v7;
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
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "setItemImage:", *p_itemImage, (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)_setSelectedThemeIndex:(int64_t)a3 animated:(BOOL)a4
{
  self->_int64_t selectedThemeIndex = a3;
  -[SKUIGiftThemePickerFlowLayout setCurrentPage:](self->_flowLayout, "setCurrentPage:");
  pageControl = self->_pageControl;

  [(UIPageControl *)pageControl setCurrentPage:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themes, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_itemImage, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_flowLayout, 0);
}

- (void)initWithGift:configuration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftThemePickerViewController initWithGift:configuration:]";
}

@end