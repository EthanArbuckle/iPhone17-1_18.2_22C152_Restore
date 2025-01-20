@interface RAPRouteFeedbackViewController
- (BOOL)_canTableViewSelectIndexPath:(id)a3;
- (BOOL)allowsScrolling;
- (BOOL)isMapItemTrailOrTrailHead:(id)a3;
- (BOOL)showsHairline;
- (GEOComposedRoute)route;
- (RAPRouteFeedbackViewController)initWithReport:(id)a3 recording:(id)a4 delegate:(id)a5;
- (UICollectionView)collectionView;
- (UIScrollView)scrollView;
- (UITableView)tableView;
- (double)_cellContentWidth;
- (double)desiredHeight;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_dismiss;
- (void)_reloadTableViewIfNeeded;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateTableHeightConstraint;
- (void)dataSourceDidUpdate:(id)a3;
- (void)macFooterViewLeftButtonTapped:(id)a3;
- (void)routeStepDetailViewControllerDidSubmitReport:(id)a3;
- (void)setAllowsScrolling:(BOOL)a3;
- (void)setRoute:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation RAPRouteFeedbackViewController

- (RAPRouteFeedbackViewController)initWithReport:(id)a3 recording:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)RAPRouteFeedbackViewController;
  v12 = [(RAPRouteFeedbackViewController *)&v25 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    objc_storeStrong((id *)&v13->_recording, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = [RAPRouteFeedbackDataSource alloc];
    recording = v13->_recording;
    v16 = [(RAPRouteFeedbackViewController *)v13 traitCollection];
    v17 = [(RAPRouteFeedbackDataSource *)v14 initWithRecording:recording traitCollection:v16 delegate:v13];
    dataSource = v13->_dataSource;
    v13->_dataSource = v17;

    objc_initWeak(&location, v13);
    v19 = +[VGVirtualGarageService sharedService];
    [v19 registerObserver:v13];

    v20 = +[VGVirtualGarageService sharedService];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100374F00;
    v22[3] = &unk_1012E65A8;
    objc_copyWeak(&v23, &location);
    [v20 virtualGarageGetGarageWithReply:v22];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)RAPRouteFeedbackViewController;
  [(RAPRouteFeedbackViewController *)&v6 viewDidLoad];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[RAP Web UI] Report an Issue" value:@"localized string not found" table:0];

  v5 = [(RAPRouteFeedbackViewController *)self navigationItem];
  [v5 setTitle:v4];

  [(RAPRouteFeedbackViewController *)self _setupViews];
  [(RAPRouteFeedbackViewController *)self _setupConstraints];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RAPRouteFeedbackViewController;
  [(RAPRouteFeedbackViewController *)&v9 viewDidAppear:a3];
  v4 = [(RAPRouteFeedbackViewController *)self navigationController];
  v5 = [v4 viewControllers];
  objc_super v6 = [v5 firstObject];

  if (v6 == self)
  {
    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelPressed:"];
    v8 = [(RAPRouteFeedbackViewController *)self navigationItem];
    [v8 setLeftBarButtonItem:v7];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RAPRouteFeedbackViewController;
  [(RAPRouteFeedbackViewController *)&v3 viewDidLayoutSubviews];
  [(RAPRouteFeedbackViewController *)self _updateTableHeightConstraint];
  [(RAPRouteFeedbackViewController *)self _reloadTableViewIfNeeded];
}

- (void)_reloadTableViewIfNeeded
{
  [(RAPRouteFeedbackViewController *)self _cellContentWidth];
  double v4 = v3;
  computedWidth = self->_computedWidth;
  if (!computedWidth || ([(NSNumber *)computedWidth cgFloatValue], vabdd_f64(v6, v4) > 2.22044605e-16))
  {
    id v7 = +[NSNumber numberWithDouble:v4];
    v8 = self->_computedWidth;
    self->_computedWidth = v7;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100375208;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RAPRouteFeedbackViewController;
  id v4 = a3;
  [(RAPRouteFeedbackViewController *)&v9 traitCollectionDidChange:v4];
  v5 = [(RAPRouteFeedbackViewController *)self traitCollection];
  [(RAPRouteFeedbackDataSource *)self->_dataSource setTraitCollection:v5];

  double v6 = [v4 preferredContentSizeCategory];

  id v7 = [(RAPRouteFeedbackViewController *)self traitCollection];
  v8 = [v7 preferredContentSizeCategory];

  if (v6 != v8) {
    [(RAPRouteFeedbackViewController *)self _updateTableHeightConstraint];
  }
}

- (void)_setupViews
{
  double v3 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  [(UIScrollView *)self->_scrollView setClipsToBounds:1];
  v5 = [(UIScrollView *)self->_scrollView layer];
  [v5 setAllowsGroupOpacity:0];

  [(UIScrollView *)self->_scrollView setScrollEnabled:[(RAPRouteFeedbackViewController *)self allowsScrolling]];
  double v6 = [(RAPRouteFeedbackViewController *)self view];
  [v6 addSubview:self->_scrollView];

  id v7 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v7;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView addSubview:self->_containerView];
  objc_super v9 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  containerLayoutGuide = self->_containerLayoutGuide;
  self->_containerLayoutGuide = v9;

  [(UIView *)self->_containerView addLayoutGuide:self->_containerLayoutGuide];
  id v11 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v11;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v13];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  v14 = [(RAPRouteFeedbackViewController *)self traitCollection];
  v15 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle3 weight:v14 compatibleWithTraitCollection:UIFontWeightBold];
  [(UILabel *)self->_titleLabel setFont:v15];

  v16 = [(RAPRouteFeedbackDataSource *)self->_dataSource endWaypointMapItem];
  v17 = [v16 name];
  v18 = v17;
  if (v17)
  {
    id v36 = v17;
  }
  else
  {
    v19 = +[NSBundle mainBundle];
    id v36 = [v19 localizedStringForKey:@"Destination [RAP]" value:@"localized string not found" table:0];
  }
  v20 = +[NSBundle mainBundle];
  v21 = [v20 localizedStringForKey:@"[RAP] route feedback title" value:@"localized string not found" table:0];

  v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v36);
  [(UILabel *)self->_titleLabel setText:v22];
  [(UIView *)self->_containerView addSubview:self->_titleLabel];
  id v23 = (UIView *)objc_alloc_init((Class)UIView);
  tableViewContainer = self->_tableViewContainer;
  self->_tableViewContainer = v23;

  [(UIView *)self->_tableViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containerView addSubview:self->_tableViewContainer];
  objc_super v25 = (UITableView *)[objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  tableView = self->_tableView;
  self->_tableView = v25;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setScrollEnabled:0];
  [(UITableView *)self->_tableView setSeparatorStyle:0];
  v27 = +[RAPRouteFeedbackDataSource _cellClassForItemType:0];
  v28 = self->_tableView;
  v29 = NSStringFromClass(v27);
  [(UITableView *)v28 registerClass:v27 forCellReuseIdentifier:v29];

  v30 = +[RAPRouteFeedbackDataSource _cellClassForItemType:1];
  v31 = self->_tableView;
  v32 = NSStringFromClass(v30);
  [(UITableView *)v31 registerClass:v30 forCellReuseIdentifier:v32];

  [(UIView *)self->_tableViewContainer addSubview:self->_tableView];
  v33 = [(UIView *)self->_tableViewContainer heightAnchor];
  v34 = [v33 constraintEqualToConstant:0.0];
  tableHeightConstraint = self->_tableHeightConstraint;
  self->_tableHeightConstraint = v34;
}

- (void)_setupConstraints
{
  double v3 = [(RAPRouteFeedbackViewController *)self traitCollection];
  if ([v3 userInterfaceIdiom] == (id)5) {
    double v4 = 5.0;
  }
  else {
    double v4 = 8.0;
  }

  v90 = [(UIScrollView *)self->_scrollView topAnchor];
  v91 = [(RAPRouteFeedbackViewController *)self view];
  v89 = [v91 safeAreaLayoutGuide];
  v88 = [v89 topAnchor];
  v87 = [v90 constraintEqualToAnchor:v88];
  v94[0] = v87;
  v85 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v86 = [(RAPRouteFeedbackViewController *)self view];
  v84 = [v86 leadingAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v94[1] = v83;
  v81 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v82 = [(RAPRouteFeedbackViewController *)self view];
  v80 = [v82 trailingAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v94[2] = v79;
  v78 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v76 = [v78 widthAnchor];
  v77 = [(RAPRouteFeedbackViewController *)self view];
  v75 = [v77 widthAnchor];
  v74 = [v76 constraintEqualToAnchor:v75];
  v94[3] = v74;
  v73 = [(UIView *)self->_containerView topAnchor];
  v72 = [(UIScrollView *)self->_scrollView topAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v94[4] = v71;
  v70 = [(UIView *)self->_containerView leadingAnchor];
  v69 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v94[5] = v68;
  v67 = [(UIView *)self->_containerView trailingAnchor];
  v66 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v94[6] = v65;
  v64 = [(UIView *)self->_containerView bottomAnchor];
  v63 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v94[7] = v62;
  v61 = [(UILayoutGuide *)self->_containerLayoutGuide topAnchor];
  v60 = [(UIView *)self->_containerView topAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v94[8] = v59;
  v58 = [(UILayoutGuide *)self->_containerLayoutGuide leadingAnchor];
  v57 = [(UIView *)self->_containerView leadingAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v94[9] = v56;
  v55 = [(UILayoutGuide *)self->_containerLayoutGuide trailingAnchor];
  v54 = [(UIView *)self->_containerView trailingAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v94[10] = v53;
  v52 = [(UILayoutGuide *)self->_containerLayoutGuide bottomAnchor];
  v51 = [(UIView *)self->_containerView bottomAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v94[11] = v50;
  v49 = [(UILabel *)self->_titleLabel topAnchor];
  v48 = [(UILayoutGuide *)self->_containerLayoutGuide topAnchor];
  v47 = [v49 constraintEqualToAnchor:v48 constant:v4];
  v94[12] = v47;
  v46 = [(UILabel *)self->_titleLabel leadingAnchor];
  v45 = [(UILayoutGuide *)self->_containerLayoutGuide leadingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45 constant:16.0];
  v94[13] = v44;
  v43 = [(UILabel *)self->_titleLabel trailingAnchor];
  v42 = [(UILayoutGuide *)self->_containerLayoutGuide trailingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:-16.0];
  v94[14] = v41;
  v40 = [(UIView *)self->_tableViewContainer topAnchor];
  v39 = [(UILabel *)self->_titleLabel bottomAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v94[15] = v38;
  v37 = [(UIView *)self->_tableViewContainer leadingAnchor];
  id v36 = [(UILayoutGuide *)self->_containerLayoutGuide leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v94[16] = v35;
  v34 = [(UIView *)self->_tableViewContainer trailingAnchor];
  v33 = [(UILayoutGuide *)self->_containerLayoutGuide trailingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  tableHeightConstraint = self->_tableHeightConstraint;
  v94[17] = v32;
  v94[18] = tableHeightConstraint;
  v31 = [(UIView *)self->_tableViewContainer bottomAnchor];
  v30 = [(UILayoutGuide *)self->_containerLayoutGuide bottomAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v94[19] = v29;
  v28 = [(UITableView *)self->_tableView leadingAnchor];
  v27 = [(UIView *)self->_tableViewContainer leadingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v94[20] = v26;
  objc_super v25 = [(UITableView *)self->_tableView trailingAnchor];
  double v6 = [(UIView *)self->_tableViewContainer trailingAnchor];
  id v7 = [v25 constraintEqualToAnchor:v6];
  v94[21] = v7;
  v8 = [(UITableView *)self->_tableView topAnchor];
  objc_super v9 = [(UIView *)self->_tableViewContainer topAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  v94[22] = v10;
  id v11 = [(UITableView *)self->_tableView bottomAnchor];
  v12 = [(UIView *)self->_tableViewContainer bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v94[23] = v13;
  v14 = +[NSArray arrayWithObjects:v94 count:24];
  +[NSLayoutConstraint activateConstraints:v14];

  v15 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = v16;

  v18 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v19 = [(RAPRouteFeedbackViewController *)v15 view];
  v20 = v19;
  if (v17)
  {
    v21 = [v19 safeAreaLayoutGuide];
    v22 = [v21 bottomAnchor];
    id v23 = [v18 constraintEqualToAnchor:v22];
    v93 = v23;
    v24 = +[NSArray arrayWithObjects:&v93 count:1];
    +[NSLayoutConstraint activateConstraints:v24];
  }
  else
  {
    v21 = [v19 bottomAnchor];
    v22 = [v18 constraintEqualToAnchor:v21];
    v92 = v22;
    id v23 = +[NSArray arrayWithObjects:&v92 count:1];
    +[NSLayoutConstraint activateConstraints:v23];
    v24 = 0;
  }
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (double)desiredHeight
{
  [(UIScrollView *)self->_scrollView contentSize];
  return v2;
}

- (void)setAllowsScrolling:(BOOL)a3
{
  if (self->_allowsScrolling != a3)
  {
    self->_allowsScrolling = a3;
    -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:");
  }
}

- (double)_cellContentWidth
{
  double v3 = [(RAPRouteFeedbackViewController *)self tableView];
  double v4 = +[NSIndexPath indexPathForRow:0 inSection:0];
  v5 = [v3 cellForRowAtIndexPath:v4];

  if (v5)
  {
    double v6 = [v5 contentView];
    [v6 bounds];
  }
  else
  {
    double v6 = [(RAPRouteFeedbackViewController *)self view];
    [v6 frame];
  }
  double v8 = v7;

  return v8;
}

- (void)_updateTableHeightConstraint
{
  [(UITableView *)self->_tableView layoutIfNeeded];
  [(NSLayoutConstraint *)self->_tableHeightConstraint constant];
  double v4 = v3;
  [(UITableView *)self->_tableView contentSize];
  if (v4 != v5)
  {
    [(UITableView *)self->_tableView contentSize];
    [(NSLayoutConstraint *)self->_tableHeightConstraint setConstant:v6];
    double v7 = [(RAPRouteFeedbackViewController *)self view];
    [v7 setNeedsLayout];

    id v8 = [(RAPRouteFeedbackViewController *)self view];
    [v8 layoutIfNeeded];
  }
}

- (void)dataSourceDidUpdate:(id)a3
{
  id v4 = a3;
  [(UITableView *)self->_tableView reloadData];
  [(RAPRouteFeedbackViewController *)self _updateTableHeightConstraint];
  double v5 = sub_10057670C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "datasourceDidUpdate: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_dismiss
{
  double v3 = sub_10057670C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "will dismiss RAPRouteFeedbackViewController", v6, 2u);
  }

  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:10109 onTarget:68 eventValue:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained routeFeedbackViewControllerDidDismiss:self];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 1)
    {
      id v7 = [(RAPRouteFeedbackDataSource *)self->_dataSource allItems];
      int64_t v8 = (int64_t)[v7 count];
    }
    else
    {
      objc_super v9 = sub_10057670C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        dataSource = self->_dataSource;
        int v12 = 134218242;
        int64_t v13 = a4;
        __int16 v14 = 2112;
        v15 = dataSource;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "numberOfRowsInSection: called with invalid section: %lu, dataSource: %@", (uint8_t *)&v12, 0x16u);
      }

      int64_t v8 = 0;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v7 = +[NSBundle mainBundle];
    int64_t v8 = v7;
    CFStringRef v9 = @"[RAP] Nav step list - Route Steps";
    goto LABEL_5;
  }
  if (!a4)
  {
    id v7 = +[NSBundle mainBundle];
    int64_t v8 = v7;
    CFStringRef v9 = @"[RAP] Nav step list - Arrival";
LABEL_5:
    id v10 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];

    goto LABEL_9;
  }
  id v11 = sub_10057670C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    dataSource = self->_dataSource;
    int v14 = 134218242;
    int64_t v15 = a4;
    __int16 v16 = 2112;
    v17 = dataSource;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "titleForHeaderInSection: called with invalid section: %lu, dataSource: %@", (uint8_t *)&v14, 0x16u);
  }

  id v10 = 0;
LABEL_9:

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v5 = [(RAPRouteFeedbackDataSource *)self->_dataSource _stepItemForIndexPath:a4];
  computedWidth = self->_computedWidth;
  if (computedWidth)
  {
    [(NSNumber *)computedWidth cgFloatValue];
    double v8 = v7;
  }
  else
  {
    CFStringRef v9 = [(RAPRouteFeedbackViewController *)self view];
    [v9 frame];
    double v8 = v10;
  }
  objc_msgSend(objc_msgSend(v5, "cellClass"), "heightForItem:width:maximumHeight:", v5, v8, 1.79769313e308);
  double v12 = v11;

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if ((unint64_t)v8 > 1)
  {
    id v13 = v8;
    int v14 = sub_10057670C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      dataSource = self->_dataSource;
      int v20 = 134218242;
      v21 = v13;
      __int16 v22 = 2112;
      id v23 = dataSource;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "cellForRowAtIndexPath: called with invalid section: %lu, dataSource: %@", (uint8_t *)&v20, 0x16u);
    }

    __int16 v16 = objc_opt_new();
  }
  else
  {
    CFStringRef v9 = [(RAPRouteFeedbackDataSource *)self->_dataSource _stepItemForIndexPath:v7];
    double v10 = NSStringFromClass((Class)[v9 cellClass]);
    double v11 = [v6 dequeueReusableCellWithIdentifier:v10];

    if (v11)
    {
      [v11 setItem:v9];
      [v11 setAccessoryType:[self _canTableViewSelectIndexPath:v7]];
      id v12 = v11;
    }
    else
    {
      v17 = sub_10057670C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = self->_dataSource;
        int v20 = 138412546;
        v21 = v9;
        __int16 v22 = 2112;
        id v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "cellForRowAtIndexPath: called with invalid item: %@, dataSource: %@", (uint8_t *)&v20, 0x16u);
      }

      id v12 = (id)objc_opt_new();
    }
    __int16 v16 = v12;
  }

  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  stepDetailViewController = self->_stepDetailViewController;
  self->_stepDetailViewController = 0;

  id v8 = [(RAPRouteFeedbackDataSource *)self->_dataSource _stepItemForIndexPath:v6];

  CFStringRef v9 = [(RAPRouteFeedbackDataSource *)self->_dataSource _userPathForStepItem:v8];
  double v10 = [(RAPRouteFeedbackDataSource *)self->_dataSource _routeForStepItem:v8];
  id v11 = [v10 _maps_routeIndex];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    id v13 = [RAPRouteStepDetailViewController alloc];
    report = self->_report;
    int64_t v15 = [v12 step];

    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v16 = 0;
    }
    else {
      id v16 = v11;
    }
    v17 = [(RAPRouteStepDetailViewController *)v13 initWithReport:report step:v15 userPath:v9 routeIndex:v16 delegate:self];
    v18 = self->_stepDetailViewController;
    self->_stepDetailViewController = v17;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v8;
      int v20 = (char *)[v19 waypointType];
      if ((unint64_t)(v20 - 1) >= 2)
      {
        if (!v20)
        {
          v28 = sub_10057670C();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "tableView:didSelectRowAtIndexPath: tapped an origin waypoint, this is not supported", buf, 2u);
          }
        }
      }
      else
      {
        v21 = [v19 arrivalStep];

        if (v21)
        {
          __int16 v22 = [RAPRouteStepDetailViewController alloc];
          id v23 = self->_report;
          v24 = [v19 arrivalStep];
          if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
            id v25 = 0;
          }
          else {
            id v25 = v11;
          }
          v26 = [(RAPRouteStepDetailViewController *)v22 initWithReport:v23 step:v24 userPath:v9 routeIndex:v25 delegate:self];
          v27 = self->_stepDetailViewController;
          self->_stepDetailViewController = v26;
        }
      }
    }
  }
  if (self->_stepDetailViewController)
  {
    v29 = sub_10057670C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "tableView:didSelectRowAtIndexPath: will present a RAPRouteStepDetailViewController", v31, 2u);
    }

    v30 = [(RAPRouteFeedbackViewController *)self navigationController];
    [v30 pushViewController:self->_stepDetailViewController animated:1];
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(RAPRouteFeedbackViewController *)self _canTableViewSelectIndexPath:v5]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)_canTableViewSelectIndexPath:(id)a3
{
  id v4 = [(RAPRouteFeedbackDataSource *)self->_dataSource _stepItemForIndexPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  if ([v6 waypointType])
  {
    id v8 = [v7 waypoint];
    id v9 = [v8 mapItemIfLoaded];

    if (v9 && [(RAPRouteFeedbackViewController *)self isMapItemTrailOrTrailHead:v9])
    {
      char v10 = 0;
LABEL_21:

      goto LABEL_22;
    }

LABEL_10:
    id v11 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v9 = v12;

    if (v9)
    {
      id v13 = [v9 step];
      if ([v13 isArrivalStep])
      {
        int v14 = [(RAPRouteFeedbackDataSource *)self->_dataSource endWaypointMapItem];
        unsigned __int8 v15 = [(RAPRouteFeedbackViewController *)self isMapItemTrailOrTrailHead:v14];
      }
      else
      {
        unsigned __int8 v15 = 0;
      }
    }
    else
    {
      unsigned __int8 v15 = 0;
    }
    char v10 = v15 ^ 1;
    goto LABEL_21;
  }
  char v10 = 0;
LABEL_22:

  return v10;
}

- (void)routeStepDetailViewControllerDidSubmitReport:(id)a3
{
  id v4 = sub_10057670C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "routeStepDetailViewControllerDidSubmitReport: will dismiss RAP", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained routeFeedbackViewControllerDidDismiss:self];
}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
  id v4 = sub_10057670C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "macFooterViewLeftButtonTapped: will dismiss", v5, 2u);
  }

  [(RAPRouteFeedbackViewController *)self _dismiss];
}

- (void)virtualGarageDidUpdate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100377094;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (BOOL)isMapItemTrailOrTrailHead:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 _placeCategoryType] == 1
    || [v3 _placeCategoryType] == 2;

  return v4;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setRoute:(id)a3
{
}

- (BOOL)showsHairline
{
  return self->_showsHairline;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (BOOL)allowsScrolling
{
  return self->_allowsScrolling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_computedWidth, 0);
  objc_storeStrong((id *)&self->_stepDetailViewController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_recording, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_tableHeightConstraint, 0);
  objc_storeStrong((id *)&self->_directionsListViewController, 0);
  objc_storeStrong((id *)&self->_tableViewContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end