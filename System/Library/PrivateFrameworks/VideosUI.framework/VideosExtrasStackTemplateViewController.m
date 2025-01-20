@interface VideosExtrasStackTemplateViewController
- (BOOL)showsPlaceholder;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (VideosExtrasStackTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5;
- (id)_viewControllerForIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)contentScrollView;
- (id)sectionStyle;
- (id)templateElement;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_dynamicTypeDidChange;
- (void)_prepareLayout;
- (void)dealloc;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VideosExtrasStackTemplateViewController

- (BOOL)showsPlaceholder
{
  return 0;
}

- (VideosExtrasStackTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)VideosExtrasStackTemplateViewController;
  v5 = [(VideosExtrasTemplateViewController *)&v12 initWithDocument:a3 options:a4 context:a5];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    viewControllers = v5->_viewControllers;
    v5->_viewControllers = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sizes = v5->_sizes;
    v5->_sizes = v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v5 selector:sel__dynamicTypeDidChange name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasStackTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v4 dealloc];
}

- (void)_dynamicTypeDidChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(UICollectionView *)self->_collectionView visibleCells];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) viewController];
        v9 = [v8 collectionView];
        v10 = [v9 collectionViewLayout];

        [v10 invalidateLayout];
        [v10 prepareLayout];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout invalidateLayout];
}

- (void)viewDidLoad
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)VideosExtrasStackTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v35 viewDidLoad];
  v3 = [(VideosExtrasStackTemplateViewController *)self templateElement];
  uint64_t v4 = [v3 background];
  v36[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [(VideosExtrasTemplateViewController *)self configureBackgroundWithElements:v5];

  uint64_t v6 = [(VideosExtrasStackTemplateViewController *)self templateElement];
  uint64_t v7 = [v6 documentBanner];
  [(VideosExtrasElementViewController *)self _configureBannerWithElement:v7];

  v8 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E4FB15C0]);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v8;

  -[UICollectionViewFlowLayout setSectionInset:](self->_collectionViewLayout, "setSectionInset:", 10.0, 0.0, 10.0, 0.0);
  id v10 = objc_alloc(MEMORY[0x1E4FB1568]);
  long long v11 = (UICollectionView *)objc_msgSend(v10, "initWithFrame:collectionViewLayout:", self->_collectionViewLayout, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v11;

  [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"VideosExtrasStackCollectionCellIdentifier"];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"VideosExtrasStackCollectionHeaderIdentifier"];
  long long v13 = [(VideosExtrasStackTemplateViewController *)self view];
  [v13 addSubview:self->_collectionView];

  long long v14 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v14];

  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  v15 = self->_collectionView;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __54__VideosExtrasStackTemplateViewController_viewDidLoad__block_invoke;
  v34[3] = &unk_1E6DF9870;
  v34[4] = self;
  _MPUEnumerateItemsOfCollectionView(v15, 0, v34);
  uint64_t v16 = [VideosExtrasBannerController alloc];
  v17 = [(VideosExtrasStackTemplateViewController *)self templateElement];
  v18 = [v17 documentBanner];
  v19 = [(VideosExtrasBannerController *)v16 initWithBannerElement:v18];
  bannerViewController = self->_bannerViewController;
  self->_bannerViewController = v19;

  [(VideosExtrasBannerController *)self->_bannerViewController setVignetteType:4];
  v21 = self->_bannerViewController;
  v22 = [(VideosExtrasStackTemplateViewController *)self view];
  [(VideosExtrasBannerController *)v21 installBannerOnView:v22 anchoredToScrollView:self->_collectionView];

  v23 = (void *)MEMORY[0x1E4F28DC8];
  v24 = self->_collectionView;
  v25 = [(VideosExtrasStackTemplateViewController *)self view];
  v26 = objc_msgSend(v23, "constraintsByAttachingView:toView:alongEdges:insets:", v24, v25, 14, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  v27 = (void *)MEMORY[0x1E4F28DC8];
  v28 = self->_collectionView;
  v29 = [(VideosExtrasStackTemplateViewController *)self view];
  v30 = [v29 safeAreaLayoutGuide];
  v31 = [v27 constraintWithItem:v28 attribute:3 relatedBy:0 toItem:v30 attribute:3 multiplier:1.0 constant:0.0];

  v32 = [v26 arrayByAddingObject:v31];
  v33 = [(VideosExtrasStackTemplateViewController *)self view];
  [v33 addConstraints:v32];
}

void __54__VideosExtrasStackTemplateViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _viewControllerForIndexPath:a2];
  v2 = [v4 collectionView];
  v3 = [v2 collectionViewLayout];
  [v3 prepareLayout];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VideosExtrasStackTemplateViewController;
  [(VideosExtrasElementViewController *)&v14 viewWillAppear:a3];
  [(UICollectionView *)self->_collectionView reloadData];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(NSMutableDictionary *)self->_viewControllers allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) contentScrollView];
        if (objc_opt_respondsToSelector()) {
          [v9 reloadData];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)contentScrollView
{
  return self->_collectionView;
}

- (id)templateElement
{
  v2 = [(VideosExtrasTemplateViewController *)self document];
  v3 = [v2 templateElement];

  return v3;
}

- (id)sectionStyle
{
  switch([(VideosExtrasElementViewController *)self extrasSize])
  {
    case 1uLL:
      v2 = +[VideosExtrasGridElementViewController mediumStackGridStyle];
      break;
    case 2uLL:
      v2 = +[VideosExtrasGridElementViewController largeStackGridStyle];
      break;
    case 3uLL:
      v2 = +[VideosExtrasGridElementViewController extraLargeStackGridStyle];
      break;
    case 4uLL:
      v2 = +[VideosExtrasGridElementViewController wideStackGridStyle];
      break;
    default:
      v2 = +[VideosExtrasGridElementViewController smallStackGridStyle];
      break;
  }
  v3 = v2;
  id v4 = [v2 sectionHeaderStyle];

  return v4;
}

- (void)_prepareLayout
{
  v24.receiver = self;
  v24.super_class = (Class)VideosExtrasStackTemplateViewController;
  [(VideosExtrasElementViewController *)&v24 _prepareLayout];
  [(UICollectionView *)self->_collectionView contentInset];
  BOOL v3 = [(VideosExtrasElementViewController *)self isWide];
  id v4 = [(VideosExtrasStackTemplateViewController *)self navigationController];
  uint64_t v5 = [v4 view];
  [v5 safeAreaInsets];
  double v7 = v6;

  uint64_t v8 = [(VideosExtrasStackTemplateViewController *)self navigationController];
  uint64_t v9 = [v8 view];
  [(id)v9 safeAreaInsets];
  double v11 = v10;

  long long v12 = [(VideosExtrasStackTemplateViewController *)self parentViewController];
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if (v9)
  {
    long long v13 = [(VideosExtrasStackTemplateViewController *)self navigationController];
    objc_super v14 = [v13 mainTemplateViewController];
    v15 = [v14 view];
    [v15 bounds];
    double v17 = v16;

    double v18 = 60.0;
    if (v17 > 60.0)
    {
      v19 = [v14 menuBarView];
      [v19 bounds];
      double v21 = v20;

      double v18 = fmax(v21, 60.0);
    }
  }
  else
  {
    double v18 = 60.0;
  }
  double v22 = 112.0;
  if (v3) {
    double v22 = 260.0;
  }
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v22, v7, v18, v11);
  v23 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  [v23 invalidateLayout];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"VideosExtrasStackCollectionCellIdentifier" forIndexPath:v6];
  [v7 setParentViewController:self];
  uint64_t v8 = [(VideosExtrasStackTemplateViewController *)self _viewControllerForIndexPath:v6];

  [v7 setViewController:v8];
  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a3 dequeueReusableSupplementaryViewOfKind:a4 withReuseIdentifier:@"VideosExtrasStackCollectionHeaderIdentifier" forIndexPath:v8];
  uint64_t v10 = [v8 section];

  double v11 = [(VideosExtrasStackTemplateViewController *)self templateElement];
  long long v12 = [v11 collectionList];
  long long v13 = [v12 collections];
  objc_super v14 = [v13 objectAtIndex:v10];

  v15 = [v14 header];
  double v16 = [(VideosExtrasStackTemplateViewController *)self sectionStyle];
  [v9 configureForHeaderElement:v15 headerStyle:v16];

  return v9;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (collectionView_layout_referenceSizeForHeaderInSection__onceToken_0 != -1) {
    dispatch_once(&collectionView_layout_referenceSizeForHeaderInSection__onceToken_0, &__block_literal_global_123);
  }
  uint64_t v10 = [(VideosExtrasStackTemplateViewController *)self templateElement];
  double v11 = [v10 collectionList];
  long long v12 = [v11 collections];
  long long v13 = [v12 objectAtIndex:a5];

  objc_super v14 = [v13 header];
  if (v14)
  {
    v15 = (void *)collectionView_layout_referenceSizeForHeaderInSection____sizingView_0;
    double v16 = [(VideosExtrasStackTemplateViewController *)self sectionStyle];
    [v15 configureForHeaderElement:v14 headerStyle:v16];

    objc_msgSend((id)collectionView_layout_referenceSizeForHeaderInSection____sizingView_0, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v18 = *MEMORY[0x1E4F1DB30];
    double v20 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v21 = v18;
  double v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

void __97__VideosExtrasStackTemplateViewController_collectionView_layout_referenceSizeForHeaderInSection___block_invoke()
{
  v0 = objc_alloc_init(VideosExtrasCollectionReusableView);
  v1 = (void *)collectionView_layout_referenceSizeForHeaderInSection____sizingView_0;
  collectionView_layout_referenceSizeForHeaderInSection____sizingView_0 = (uint64_t)v0;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  BOOL v3 = [(VideosExtrasStackTemplateViewController *)self templateElement];
  id v4 = [v3 collectionList];
  uint64_t v5 = [v4 collections];
  int64_t v6 = [v5 count];

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 1;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  int64_t v6 = -[NSMutableDictionary objectForKey:](self->_sizes, "objectForKey:", a5, a4);
  double v7 = v6;
  if (v6)
  {
    [v6 CGSizeValue];
    double v9 = v8;
  }
  else
  {
    double v9 = 1.0;
  }
  [(UICollectionView *)self->_collectionView bounds];
  CGFloat Width = CGRectGetWidth(v14);

  double v11 = Width;
  double v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_viewControllerForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_viewControllers objectForKey:v4];
  if (!v5)
  {
    int64_t v6 = [(VideosExtrasStackTemplateViewController *)self templateElement];
    double v7 = [v6 collectionList];
    double v8 = [v7 collections];
    double v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v4, "section"));

    uint64_t v5 = objc_alloc_init(VideosExtrasGridElementViewController);
    uint64_t v10 = +[VideosExtrasGridElementViewController smallStackGridStyle];
    [(VideosExtrasGridElementViewController *)v5 setSmallStyle:v10];

    double v11 = +[VideosExtrasGridElementViewController mediumStackGridStyle];
    [(VideosExtrasGridElementViewController *)v5 setMediumStyle:v11];

    double v12 = +[VideosExtrasGridElementViewController largeStackGridStyle];
    [(VideosExtrasGridElementViewController *)v5 setLargeStyle:v12];

    long long v13 = +[VideosExtrasGridElementViewController extraLargeStackGridStyle];
    [(VideosExtrasGridElementViewController *)v5 setExtraLargeStyle:v13];

    CGRect v14 = +[VideosExtrasGridElementViewController wideStackGridStyle];
    [(VideosExtrasGridElementViewController *)v5 setWideStyle:v14];

    v15 = [(VideosExtrasGridElementViewController *)v5 view];
    double v16 = [(VideosExtrasStackTemplateViewController *)self view];
    [v16 frame];
    objc_msgSend(v15, "setBounds:", 0.0, 0.0);

    [(VideosExtrasGridElementViewController *)v5 setViewElement:v9];
    [(VideosExtrasGridElementViewController *)v5 setShelfStyle:1];
    double v17 = [(VideosExtrasGridElementViewController *)v5 collectionView];
    double v18 = [v17 collectionViewLayout];
    [v18 prepareLayout];

    [(VideosExtrasGridElementViewController *)v5 preferredContentSize];
    if (*MEMORY[0x1E4F1DB30] != v20 || *(double *)(MEMORY[0x1E4F1DB30] + 8) != v19)
    {
      sizes = self->_sizes;
      double v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
      [(NSMutableDictionary *)sizes setObject:v22 forKey:v4];
    }
    [(NSMutableDictionary *)self->_viewControllers setObject:v5 forKey:v4];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerViewController, 0);
  objc_storeStrong((id *)&self->_sizes, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end