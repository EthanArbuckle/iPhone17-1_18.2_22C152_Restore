@interface VUIDebugViewController
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)requiresRelayout;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)additionalMetricsTitles;
- (UICollectionView)collectionView;
- (VUIDebugContainerView)containerView;
- (VUIDebugViewController)init;
- (VUIDebugViewDataSource)dataSource;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)preferredFocusEnvironments;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (void)_dismissViewController;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)dealloc;
- (void)loadView;
- (void)setAdditionalMetricsTitles:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setRequiresRelayout:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VUIDebugViewController

- (VUIDebugViewController)init
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VUIDebugViewController;
  v2 = [(VUIDebugViewController *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(VUIDebugViewDataSource);
    dataSource = v2->_dataSource;
    v2->_dataSource = v3;

    additionalMetricsTitles = v2->_additionalMetricsTitles;
    v2->_additionalMetricsTitles = (NSArray *)&unk_1F3F3E4E0;

    objc_initWeak(&location, v2);
    v13[0] = objc_opt_class();
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__VUIDebugViewController_init__block_invoke;
    v9[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v10, &location);
    id v7 = (id)[(VUIDebugViewController *)v2 registerForTraitChanges:v6 withHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__VUIDebugViewController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRequiresRelayout:1];
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)loadView
{
  v3 = [VUIDebugContainerView alloc];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = -[VUIDebugContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  v9 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
  [(VUIDebugContainerView *)v8 setBackgroundColor:v9];

  id v17 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v17 setScrollDirection:0];
  [v17 setMinimumLineSpacing:0.0];
  [v17 setMinimumInteritemSpacing:0.0];
  objc_msgSend(v17, "setSectionInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  id v10 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1568]), "initWithFrame:collectionViewLayout:", v17, v4, v5, v6, v7);
  v11 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)v10 setBackgroundColor:v11];

  objc_super v12 = [(UICollectionView *)v10 layer];
  [v12 setMasksToBounds:1];

  [(UICollectionView *)v10 setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)v10 setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)v10 setAlwaysBounceVertical:1];
  [(UICollectionView *)v10 setDelegate:self];
  [(UICollectionView *)v10 setDataSource:self];
  [(UICollectionView *)v10 setAutoresizingMask:18];
  [(UICollectionView *)v10 setOpaque:0];
  [(UICollectionView *)v10 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"VUIDebugViewDefaultsCellReuseIdentifier"];
  [(UICollectionView *)v10 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"VUIDebugViewNavigationCellReuseIdentifier"];
  [(UICollectionView *)v10 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"VUIDebugViewHeaderReuseIdentifier"];
  collectionView = self->_collectionView;
  self->_collectionView = v10;
  v14 = v10;

  [(VUIDebugContainerView *)v8 setCollectionView:v14];
  containerView = self->_containerView;
  self->_containerView = v8;
  v16 = v8;

  [(VUIDebugViewController *)self setView:self->_containerView];
  self->_requiresRelayout = 1;
}

- (void)viewDidLoad
{
  v3 = +[VUIMetricsController sharedInstance];
  [v3 setIsInDebugMode:1];

  v11.receiver = self;
  v11.super_class = (Class)VUIDebugViewController;
  [(VUIDebugViewController *)&v11 viewDidLoad];
  double v4 = [(VUIDebugViewController *)self navigationController];
  [v4 setNavigationBarHidden:0];

  double v5 = [(VUIDebugViewController *)self navigationController];
  double v6 = [v5 navigationBar];
  [v6 setPrefersLargeTitles:1];

  double v7 = [(VUIDebugViewController *)self navigationItem];
  [v7 setTitle:@"Debug"];

  v8 = [(VUIDebugViewController *)self navigationController];
  v9 = [v8 navigationBar];

  id v10 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  [v9 setTintColor:v10];
}

- (void)dealloc
{
  v3 = +[VUIMetricsController sharedInstance];
  [v3 setIsInDebugMode:0];

  v4.receiver = self;
  v4.super_class = (Class)VUIDebugViewController;
  [(VUIDebugViewController *)&v4 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)VUIDebugViewController;
  [(VUIDebugViewController *)&v4 viewDidLayoutSubviews];
  if (self->_requiresRelayout)
  {
    v3 = [(UICollectionView *)self->_collectionView collectionViewLayout];
    [v3 invalidateLayout];

    [(VUIDebugContainerView *)self->_containerView setNeedsLayout];
    self->_requiresRelayout = 0;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUIDebugViewController;
  id v7 = a4;
  -[VUIDebugViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__VUIDebugViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6DF4CD8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __77__VUIDebugViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isViewLoaded]
    && ([*(id *)(a1 + 32) view],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 window],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    objc_super v4 = [*(id *)(*(void *)(a1 + 32) + 992) collectionViewLayout];
    [v4 invalidateLayout];

    double v5 = *(void **)(*(void *)(a1 + 32) + 984);
    [v5 setNeedsLayout];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 976) = 1;
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 2)
    {
      id v7 = [(VUIDebugViewDataSource *)self->_dataSource defaultsDataSource];
      int64_t v10 = [v7 count];
    }
    else
    {
      if (a4 != 1)
      {
        int64_t v10 = 0;
        goto LABEL_9;
      }
      id v7 = [(VUIDebugViewDataSource *)self->_dataSource metricsDataSource];
      uint64_t v8 = [v7 count];
      objc_super v9 = [(VUIDebugViewController *)self additionalMetricsTitles];
      int64_t v10 = [v9 count] + v8;
    }
  }
  else
  {
    int64_t v10 = 1;
  }
LABEL_9:

  return v10;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [a3 bounds];
  double Width = CGRectGetWidth(v8);
  double v6 = 60.0;
  result.double height = v6;
  result.double width = Width;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 section])
  {
    id v11 = [v6 dequeueReusableCellWithReuseIdentifier:@"VUIDebugViewNavigationCellReuseIdentifier" forIndexPath:v7];
    [v11 configureWithTitle:@"UI Widgets"];
    goto LABEL_12;
  }
  if ([v7 section] == 1)
  {
    CGRect v8 = [(VUIDebugViewDataSource *)self->_dataSource metricsDataSource];
    uint64_t v9 = [v8 count];

    if ([v7 row] >= v9)
    {
      uint64_t v14 = [v7 row] % v9;
      id v11 = [v6 dequeueReusableCellWithReuseIdentifier:@"VUIDebugViewNavigationCellReuseIdentifier" forIndexPath:v7];
      v15 = [(VUIDebugViewController *)self additionalMetricsTitles];
      v13 = [v15 objectAtIndexedSubscript:v14];

      [v11 configureWithTitle:v13];
      goto LABEL_10;
    }
    int64_t v10 = [(VUIDebugViewDataSource *)self->_dataSource metricsDataSource];
LABEL_8:
    objc_super v12 = v10;
    v13 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

    id v11 = [v6 dequeueReusableCellWithReuseIdentifier:@"VUIDebugViewDefaultsCellReuseIdentifier" forIndexPath:v7];
    [v11 configureCellWithDefaults:v13];
LABEL_10:

    goto LABEL_12;
  }
  if ([v7 section] == 2)
  {
    int64_t v10 = [(VUIDebugViewDataSource *)self->_dataSource defaultsDataSource];
    goto LABEL_8;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4FB1570]);
LABEL_12:

  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [a3 dequeueReusableSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"VUIDebugViewHeaderReuseIdentifier" forIndexPath:v6];
  if ([v6 section])
  {
    if ([v6 section] == 1)
    {
      CGRect v8 = @"Metrics";
    }
    else
    {
      if ([v6 section] != 2) {
        goto LABEL_8;
      }
      CGRect v8 = @"Application Defaults";
    }
  }
  else
  {
    CGRect v8 = @"UI";
  }
  [v7 configureHeaderViewWithTitle:v8];
LABEL_8:

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  if ([v6 section])
  {
    if ([v6 section] == 1)
    {
      uint64_t v7 = [v6 row];
      CGRect v8 = [(VUIDebugViewDataSource *)self->_dataSource metricsDataSource];
      uint64_t v9 = [v8 count];

      if (v7 == v9)
      {
        int64_t v10 = +[VUIMetricsController sharedInstance];
        id v11 = [v10 getRecentEventsForDebuggerUI];

        objc_super v12 = [VUIDebugMetricsEventControllerGenerator alloc];
        v13 = [v11 allObjects];
        uint64_t v14 = [(VUIDebugMetricsEventControllerGenerator *)v12 initWithMetrics:v13];

        v15 = [(VUIDebugMetricsEventControllerGenerator *)v14 viewController];
      }
      else
      {
        v23 = [VUIMetricsRenderSessionListViewController alloc];
        id v11 = +[VUIMetricsDiskManager sharedInstance];
        v15 = [(VUIMetricsRenderSessionListViewController *)v23 initWithStorageDataSource:v11];
      }

      v24 = [(VUIDebugViewController *)self navigationController];
      [v24 pushViewController:v15 animated:1];
    }
    else if ([v6 section] == 2)
    {
      [v25 deselectItemAtIndexPath:v6 animated:0];
    }
  }
  else
  {
    v16 = +[VUITVAppLauncher sharedInstance];
    id v17 = [v16 appController];

    v18 = [[VUIDocumentDataSource alloc] initWithDocumentRef:@"UIMain"];
    v19 = +[VUIInterfaceFactory sharedInstance];
    v20 = [v17 appContext];
    v21 = [v19 viewControllerWithDocumentDataSource:v18 appContext:v20];

    v22 = [(VUIDebugViewController *)self navigationController];
    [v22 pushViewController:v21 animated:1];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  if ((unint64_t)a5 > 2)
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    [a3 bounds];
    double Width = CGRectGetWidth(v8);
    double v6 = 56.0;
  }
  result.double height = v6;
  result.double width = Width;
  return result;
}

- (id)preferredFocusEnvironments
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(VUIDebugViewController *)self collectionView];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v15 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 nextFocusedIndexPath];
  CGRect v8 = [v6 previouslyFocusedIndexPath];

  uint64_t v9 = [v15 cellForItemAtIndexPath:v7];
  int64_t v10 = [v9 contentView];
  id v11 = [MEMORY[0x1E4FB1618] lightGrayColor];
  [v10 setBackgroundColor:v11];

  if (v8)
  {
    objc_super v12 = [v15 cellForItemAtIndexPath:v8];
  }
  else
  {
    objc_super v12 = 0;
  }
  v13 = [v12 contentView];
  uint64_t v14 = [MEMORY[0x1E4FB1618] whiteColor];
  [v13 setBackgroundColor:v14];
}

- (void)_dismissViewController
{
}

- (VUIDebugContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (BOOL)requiresRelayout
{
  return self->_requiresRelayout;
}

- (void)setRequiresRelayout:(BOOL)a3
{
  self->_requiresRelayout = a3;
}

- (VUIDebugViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSArray)additionalMetricsTitles
{
  return self->_additionalMetricsTitles;
}

- (void)setAdditionalMetricsTitles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalMetricsTitles, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end