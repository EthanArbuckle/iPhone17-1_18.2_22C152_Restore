@interface RouteAnnotationContaineeViewController
- (BOOL)_canShowWhileLocked;
- (CGSize)calculatePreferredContentSize;
- (ContainerHeaderView)headerView;
- (GEOMiniCard)infoCard;
- (UITableView)tableView;
- (VKRouteAnnotation)routeAnnotation;
- (double)heightForLayout:(unint64_t)a3;
- (id)dismissHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateContent;
- (void)_updateContentInCell:(id)a3;
- (void)_updateImageInCell:(id)a3;
- (void)_updatePreferredContentSize;
- (void)applyAlphaToContent:(double)a3;
- (void)dealloc;
- (void)handleDismissAction:(id)a3;
- (void)headerViewTapped:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDismissHandler:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setRouteAnnotation:(id)a3;
- (void)setTableView:(id)a3;
- (void)updateTheme;
- (void)viewDidLoad;
@end

@implementation RouteAnnotationContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setRouteAnnotation:(id)a3
{
  v5 = (VKRouteAnnotation *)a3;
  if (self->_routeAnnotation != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_routeAnnotation, a3);
    [(RouteAnnotationContaineeViewController *)self _updateContent];
    v5 = v6;
  }
}

- (void)viewDidLoad
{
  v51.receiver = self;
  v51.super_class = (Class)RouteAnnotationContaineeViewController;
  [(ContaineeViewController *)&v51 viewDidLoad];
  v3 = [(RouteAnnotationContaineeViewController *)self view];
  v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(RouteAnnotationContaineeViewController *)self setHeaderView:v4];

  v5 = [(RouteAnnotationContaineeViewController *)self headerView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(RouteAnnotationContaineeViewController *)self headerView];
  [v6 setDelegate:self];

  v7 = [(RouteAnnotationContaineeViewController *)self headerView];
  v50 = v3;
  [v3 addSubview:v7];

  id v8 = objc_alloc((Class)UITableView);
  v9 = [(RouteAnnotationContaineeViewController *)self view];
  [v9 bounds];
  id v10 = [v8 initWithFrame:0 style:];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setDelegate:self];
  [v10 setDataSource:self];
  [v10 setAllowsSelection:0];
  [v10 setBackgroundView:0];
  v11 = +[UIColor clearColor];
  [v10 setBackgroundColor:v11];

  [v10 setSeparatorStyle:0];
  [v10 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];
  v12 = [(RouteAnnotationContaineeViewController *)self view];
  [v12 addSubview:v10];

  [(RouteAnnotationContaineeViewController *)self setTableView:v10];
  v49 = [(RouteAnnotationContaineeViewController *)self headerView];
  v47 = [v49 topAnchor];
  v48 = [(RouteAnnotationContaineeViewController *)self view];
  v46 = [v48 topAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v53[0] = v45;
  v44 = [(RouteAnnotationContaineeViewController *)self headerView];
  v42 = [v44 leadingAnchor];
  v43 = [(RouteAnnotationContaineeViewController *)self view];
  v41 = [v43 leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v53[1] = v40;
  v39 = [(RouteAnnotationContaineeViewController *)self headerView];
  v37 = [v39 trailingAnchor];
  v38 = [(RouteAnnotationContaineeViewController *)self view];
  v36 = [v38 trailingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v53[2] = v35;
  v33 = [v10 topAnchor];
  v34 = [(RouteAnnotationContaineeViewController *)self headerView];
  v32 = [v34 bottomAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v53[3] = v31;
  v29 = [v10 leadingAnchor];
  v30 = [(RouteAnnotationContaineeViewController *)self view];
  v28 = [v30 leadingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v53[4] = v27;
  v26 = [v10 bottomAnchor];
  v13 = [(RouteAnnotationContaineeViewController *)self view];
  v14 = [v13 bottomAnchor];
  v15 = [v26 constraintEqualToAnchor:v14];
  v53[5] = v15;
  v16 = [v10 trailingAnchor];
  v17 = [(RouteAnnotationContaineeViewController *)self view];
  v18 = [v17 trailingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v53[6] = v19;
  v20 = +[NSArray arrayWithObjects:v53 count:7];
  +[NSLayoutConstraint activateConstraints:v20];

  if (sub_1000BBB44(self) == 5)
  {
    v21 = [(RouteAnnotationContaineeViewController *)self headerView];
    v22 = [v21 heightAnchor];
    v23 = [v22 constraintEqualToConstant:0.0];
    v52 = v23;
    v24 = +[NSArray arrayWithObjects:&v52 count:1];
    +[NSLayoutConstraint activateConstraints:v24];

    self->_didStartObservingTableViewContentSize = 1;
    v25 = [(RouteAnnotationContaineeViewController *)self tableView];
    [v25 addObserver:self forKeyPath:@"contentSize" options:1 context:&unk_101610610];
  }
  [(RouteAnnotationContaineeViewController *)self _updateContent];
}

- (void)dealloc
{
  if (self->_didStartObservingTableViewContentSize)
  {
    self->_didStartObservingTableViewContentSize = 0;
    v3 = [(RouteAnnotationContaineeViewController *)self tableView];
    [v3 removeObserver:self forKeyPath:@"contentSize" context:&unk_101610610];
  }
  v4.receiver = self;
  v4.super_class = (Class)RouteAnnotationContaineeViewController;
  [(RouteAnnotationContaineeViewController *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &unk_101610610)
  {
    [(RouteAnnotationContaineeViewController *)self _updatePreferredContentSize];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)RouteAnnotationContaineeViewController;
    -[RouteAnnotationContaineeViewController observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_updateContent
{
  v5 = [(RouteAnnotationContaineeViewController *)self routeAnnotation];
  if (v5)
  {
    v2 = [(RouteAnnotationContaineeViewController *)self infoCard];
    v3 = [v2 title];
    uint64_t v6 = +[NSString _navigation_stringForServerFormattedString:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(RouteAnnotationContaineeViewController *)self headerView];
  [v7 setTitle:v6];

  if (v5)
  {
  }
  objc_super v8 = [(RouteAnnotationContaineeViewController *)self tableView];
  [v8 reloadData];

  [(RouteAnnotationContaineeViewController *)self _updatePreferredContentSize];
}

- (void)_updatePreferredContentSize
{
  if (sub_1000BBB44(self) == 5)
  {
    [(RouteAnnotationContaineeViewController *)self preferredContentSize];
    double v4 = v3;
    double v6 = v5;
    [(RouteAnnotationContaineeViewController *)self calculatePreferredContentSize];
    if (v4 != v8 || v6 != v7)
    {
      -[RouteAnnotationContaineeViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
  }
}

- (CGSize)calculatePreferredContentSize
{
  uint64_t v3 = 0x4071A00000000000;
  if ([(RouteAnnotationContaineeViewController *)self isViewLoaded])
  {
    uint64_t v3 = 0x4071A00000000000;
    if (sub_1000BBB44(self) == 5)
    {
      double v4 = [(RouteAnnotationContaineeViewController *)self view];
      [v4 layoutIfNeeded];

      double v5 = [(RouteAnnotationContaineeViewController *)self tableView];
      [v5 contentSize];
      uint64_t v3 = v6;
    }
  }
  double v7 = 282.0;
  double v8 = *(double *)&v3;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_updateContentInCell:(id)a3
{
  id v20 = a3;
  if (v20)
  {
    double v4 = [(RouteAnnotationContaineeViewController *)self routeAnnotation];

    if (v4)
    {
      [(RouteAnnotationContaineeViewController *)self _updateImageInCell:v20];
      double v5 = [(RouteAnnotationContaineeViewController *)self infoCard];
      uint64_t v6 = [v5 detail];
      double v7 = +[NSString _navigation_stringForServerFormattedString:v6];
      double v8 = [v20 detailsLabel];
      [v8 setText:v7];

      uint64_t v9 = [(RouteAnnotationContaineeViewController *)self infoCard];
      uint64_t v10 = [v9 metadata];
      v11 = +[NSString _navigation_stringForServerFormattedString:v10];
      v12 = [v20 metadataLabel];
      [v12 setText:v11];

      v13 = [v20 metadataLabel];
      v14 = [v13 text];
      BOOL v15 = [v14 length] == 0;
      v16 = [v20 metadataLabel];
      [v16 setHidden:v15];
    }
    else
    {
      v17 = [v20 iconImageView];
      [v17 setImage:0];

      v18 = [v20 detailsLabel];
      [v18 setText:0];

      v19 = [v20 metadataLabel];
      [v19 setText:0];

      v13 = [v20 metadataLabel];
      [v13 setHidden:1];
    }
  }
}

- (void)_updateImageInCell:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v15 = v4;
    double v5 = [(RouteAnnotationContaineeViewController *)self routeAnnotation];

    if (v5)
    {
      uint64_t v6 = [(RouteAnnotationContaineeViewController *)self routeAnnotation];
      double v7 = [v6 styleAttributes];
      double v8 = +[GEOFeatureStyleAttributes styleAttributesForRouteAnnotationWithAttributes:v7];

      uint64_t v9 = [(RouteAnnotationContaineeViewController *)self traitCollection];
      [v9 displayScale];
      double v11 = v10;
      v12 = [(RouteAnnotationContaineeViewController *)self traitCollection];
      v13 = +[MKIconManager imageForStyle:size:forScale:format:transparent:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:nightMode:", v8, 4, 0, 0, [v12 userInterfaceStyle] == (id)2, v11);

      v14 = [v15 iconImageView];
      [v14 setImage:v13];
    }
    else
    {
      double v8 = [v15 iconImageView];
      [v8 setImage:0];
    }

    id v4 = v15;
  }
}

- (void)updateTheme
{
  v4.receiver = self;
  v4.super_class = (Class)RouteAnnotationContaineeViewController;
  [(MapsThemeViewController *)&v4 updateTheme];
  uint64_t v3 = [(RouteAnnotationContaineeViewController *)self tableView];
  [v3 reloadData];
}

- (GEOMiniCard)infoCard
{
  v2 = [(RouteAnnotationContaineeViewController *)self routeAnnotation];
  uint64_t v3 = [v2 infoCard];

  return (GEOMiniCard *)v3;
}

- (void)applyAlphaToContent:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RouteAnnotationContaineeViewController;
  -[ContaineeViewController applyAlphaToContent:](&v6, "applyAlphaToContent:");
  double v5 = [(RouteAnnotationContaineeViewController *)self headerView];
  [v5 setHairLineAlpha:a3];
}

- (void)handleDismissAction:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RouteAnnotationContaineeViewController;
  [(ContaineeViewController *)&v6 handleDismissAction:a3];
  objc_super v4 = [(RouteAnnotationContaineeViewController *)self dismissHandler];

  if (v4)
  {
    double v5 = [(RouteAnnotationContaineeViewController *)self dismissHandler];
    v5[2]();
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 == 2)
  {
    sub_10002197C();
  }
  else
  {
    if (a3 == 1)
    {
      objc_super v4 = [(ContaineeViewController *)self cardPresentationController];
      [v4 bottomSafeOffset];
      double v6 = v5;
      double v7 = [(RouteAnnotationContaineeViewController *)self headerView];
      [v7 frame];
      double v8 = v6 + CGRectGetHeight(v13);
    }
    else
    {
      double v10 = [(ContaineeViewController *)self cardPresentationController];
      [v10 availableHeight];
      double v8 = v11;
    }
    return v8;
  }
  return result;
}

- (void)headerViewTapped:(id)a3
{
  id v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 wantsExpandLayout];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(RouteAnnotationContaineeViewController *)self routeAnnotation];
  int64_t v5 = v4 != 0;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  int64_t v5 = [a3 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:a4];
  [(RouteAnnotationContaineeViewController *)self _updateContentInCell:v5];

  return v5;
}

- (VKRouteAnnotation)routeAnnotation
{
  return self->_routeAnnotation;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (ContainerHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong(&self->_dismissHandler, 0);

  objc_storeStrong((id *)&self->_routeAnnotation, 0);
}

@end