@interface PRXFeatureListViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSArray)features;
- (NSMutableArray)mutableFeatures;
- (PRXFeatureListViewController)initWithContentView:(id)a3;
- (PRXFeatureListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIImage)featureImage;
- (UITableView)tableView;
- (id)addFeature:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateHeaderView;
- (void)setFeatureImage:(id)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
@end

@implementation PRXFeatureListViewController

- (PRXFeatureListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = [PRXScrollableContentView alloc];
  id v6 = objc_alloc_init(MEMORY[0x263F1CA40]);
  v7 = [(PRXScrollableContentView *)v5 initWithCardStyle:0 scrollView:v6];
  v8 = [(PRXFeatureListViewController *)self initWithContentView:v7];

  return v8;
}

- (PRXFeatureListViewController)initWithContentView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PRXFeatureListViewController;
  v3 = [(PRXCardContentViewController *)&v8 initWithContentView:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    mutableFeatures = v3->_mutableFeatures;
    v3->_mutableFeatures = (NSMutableArray *)v4;

    id v6 = v3;
  }

  return v3;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PRXFeatureListViewController;
  [(PRXCardContentViewController *)&v16 viewDidLoad];
  v3 = [(PRXCardContentViewController *)self contentView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v3 scrollView],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) == 0))
  {
    v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = *MEMORY[0x263EFF4A0];
    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = [v11 stringWithFormat:@"%@ requires a PRXScrollableContentView with a UITableView", v13];
    id v15 = [v9 exceptionWithName:v10 reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
  id v6 = [v3 scrollView];
  tableView = self->_tableView;
  self->_tableView = v6;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 1.0, 21.0);
  [(UITableView *)self->_tableView setTableFooterView:v8];

  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"PRXFeatureCell"];
  [(PRXFeatureListViewController *)self _updateHeaderView];
}

- (void)viewLayoutMarginsDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)PRXFeatureListViewController;
  [(PRXFeatureListViewController *)&v10 viewLayoutMarginsDidChange];
  v3 = [(PRXCardContentViewController *)self contentView];
  [v3 directionalLayoutMargins];
  double v5 = v4 + 10.0;
  id v6 = [(PRXCardContentViewController *)self contentView];
  [v6 directionalLayoutMargins];
  double v8 = v7 + 10.0;
  v9 = [(PRXFeatureListViewController *)self tableView];
  objc_msgSend(v9, "setDirectionalLayoutMargins:", 0.0, v5, 0.0, v8);
}

- (void)_updateHeaderView
{
  if ([(PRXFeatureListViewController *)self isViewLoaded])
  {
    if (self->_featureImage)
    {
      id v8 = (id)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:self->_featureImage];
      id v3 = objc_alloc(MEMORY[0x263F1CB60]);
      [v8 bounds];
      double Width = CGRectGetWidth(v10);
      [v8 bounds];
      double v5 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v11) + 20.0);
      [v8 setAutoresizingMask:5];
      [v5 bounds];
      double MidX = CGRectGetMidX(v12);
      [v8 bounds];
      objc_msgSend(v8, "setCenter:", MidX, CGRectGetMidY(v13));
      [v5 addSubview:v8];
      double v7 = [(PRXFeatureListViewController *)self tableView];
      [v7 setTableHeaderView:v5];
    }
    else
    {
      id v8 = [(PRXFeatureListViewController *)self tableView];
      [v8 setTableHeaderView:0];
    }
  }
}

- (void)setFeatureImage:(id)a3
{
  double v5 = (UIImage *)a3;
  p_featureImage = &self->_featureImage;
  if (self->_featureImage != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_featureImage, a3);
    p_featureImage = (UIImage **)[(PRXFeatureListViewController *)self _updateHeaderView];
    double v5 = v7;
  }
  MEMORY[0x270F9A758](p_featureImage, v5);
}

- (NSArray)features
{
  v2 = [(PRXFeatureListViewController *)self mutableFeatures];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (id)addFeature:(id)a3
{
  id v4 = a3;
  double v5 = [(PRXFeatureListViewController *)self mutableFeatures];
  [v5 addObject:v4];

  id v6 = [(PRXFeatureListViewController *)self tableView];
  char v7 = [v6 hasUncommittedUpdates];

  if ((v7 & 1) == 0)
  {
    id v8 = [(PRXFeatureListViewController *)self tableView];
    [v8 reloadData];
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PRXFeatureListViewController *)self mutableFeatures];
  uint64_t v9 = [v6 row];

  CGRect v10 = [v8 objectAtIndexedSubscript:v9];

  CGRect v11 = [v7 dequeueReusableCellWithIdentifier:@"PRXFeatureCell"];
  CGRect v12 = [v10 title];
  [v11 setTitle:v12];

  CGRect v13 = [v10 detailText];
  [v11 setSubtitle:v13];

  v14 = [v10 imageView];
  [v11 setFeatureImageView:v14];

  uint64_t v15 = [v7 separatorStyle];
  [v11 setHidingSeparator:v15 == 0];
  [v10 imageViewSize];
  if (v16 > 0.0)
  {
    [v10 imageViewSize];
    objc_msgSend(v11, "setFeatureImageSize:");
  }
  v17 = [v10 handler];

  if (v17)
  {
    v18 = [v11 switchControl];
    v19 = v18;
    if (v18) {
      id v20 = v18;
    }
    else {
      id v20 = objc_alloc_init(MEMORY[0x263F1CA10]);
    }
    v21 = v20;

    [v11 setSwitchControl:v21];
    [v10 setSwitchControl:v21];
    uint64_t v22 = [v10 isOn];
    v23 = [v11 switchControl];
    [v23 setOn:v22];
  }
  else
  {
    [v11 setSwitchControl:0];
  }

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(PRXFeatureListViewController *)self mutableFeatures];
  int64_t v5 = [v4 count];

  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UIImage)featureImage
{
  return self->_featureImage;
}

- (NSMutableArray)mutableFeatures
{
  return self->_mutableFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableFeatures, 0);
  objc_storeStrong((id *)&self->_featureImage, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end