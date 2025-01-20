@interface RouteStepListViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldShowDebugViewController;
- (BOOL)allowsSelection;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)debugViewControllerEnabled;
- (BOOL)displayRouteFromNavigationService;
- (BOOL)showsHairline;
- (Class)cellClassForItemType:(unint64_t)a3;
- (DirectionsElevationGraphHeaderView)graphHeaderView;
- (GEOComposedRoute)route;
- (NavigationDebugViewsController)debugViewController;
- (RouteStepListDataSource)dataSource;
- (RouteStepListDelegate)delegate;
- (RouteStepListViewController)initWithOptions:(unint64_t)a3 metrics:(id)a4;
- (UICollectionView)collectionView;
- (UIScrollView)scrollView;
- (UITableView)tableView;
- (UIView)headerView;
- (double)maximumHeaderHeight;
- (double)minimumHeaderHeight;
- (double)scrollViewOffsetStart;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_scrollToStepAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)_updateCollectionViewHeader;
- (void)_updateRouteFromNavigationService;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)customizeItem:(id)a3 forDataSource:(id)a4;
- (void)didTapReportAProblemButtonOnRoutePlanningFooterView:(id)a3;
- (void)didTapShareButtonOnRoutePlanningFooterView:(id)a3;
- (void)directionsElevationGraphHeaderViewWillRecalculateHeights:(id)a3;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)reloadDataSource:(id)a3;
- (void)reloadIndexPaths:(id)a3;
- (void)reloadStepIndices:(id)a3 forDataSource:(id)a4;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAllowsSelection:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDebugViewController:(id)a3;
- (void)setDebugViewControllerEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayRouteFromNavigationService:(BOOL)a3;
- (void)setGraphHeaderView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setRoute:(id)a3;
- (void)setScrollViewOffsetStart:(double)a3;
- (void)setShowsHairline:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation RouteStepListViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (RouteStepListViewController)initWithOptions:(unint64_t)a3 metrics:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RouteStepListViewController;
  v8 = [(RouteStepListViewController *)&v16 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    v8->_options = a3;
    objc_storeStrong((id *)&v8->_metrics, a4);
    objc_initWeak(&location, v9);
    v10 = +[VGVirtualGarageService sharedService];
    [v10 registerObserver:v9];

    v11 = +[VGVirtualGarageService sharedService];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100BBC01C;
    v13[3] = &unk_1012E65A8;
    objc_copyWeak(&v14, &location);
    [v11 virtualGarageGetGarageWithReply:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)RouteStepListViewController;
  [(RouteStepListViewController *)&v30 viewDidLoad];
  [(RouteStepListViewController *)self setAccessibilityIdentifier:@"RouteStepList"];
  v3 = [(RouteStepListViewController *)self collectionView];
  [v3 setAccessibilityIdentifier:@"RouteStepListCollectionView"];

  v4 = [(RouteStepListViewController *)self view];
  v5 = [(RouteStepListViewController *)self collectionView];
  [v4 addSubview:v5];

  v6 = [(RouteStepListViewController *)self collectionView];
  id v7 = [v6 topAnchor];
  v8 = [(RouteStepListViewController *)self view];
  v9 = [v8 topAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  collectionViewTopConstraint = self->_collectionViewTopConstraint;
  self->_collectionViewTopConstraint = v10;

  v12 = [(RouteStepListViewController *)self collectionView];
  v13 = [v12 bottomAnchor];
  id v14 = [(RouteStepListViewController *)self view];
  v15 = [v14 bottomAnchor];
  objc_super v16 = [v13 constraintEqualToAnchor:v15];
  collectionViewBottomConstraint = self->_collectionViewBottomConstraint;
  self->_collectionViewBottomConstraint = v16;

  v29 = [(RouteStepListViewController *)self collectionView];
  v27 = [v29 leadingAnchor];
  v28 = [(RouteStepListViewController *)self view];
  v18 = [v28 leadingAnchor];
  v19 = [v27 constraintEqualToAnchor:v18];
  v31[0] = v19;
  v20 = [(RouteStepListViewController *)self collectionView];
  v21 = [v20 trailingAnchor];
  v22 = [(RouteStepListViewController *)self view];
  v23 = [v22 trailingAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  v25 = self->_collectionViewTopConstraint;
  v31[1] = v24;
  v31[2] = v25;
  v31[3] = self->_collectionViewBottomConstraint;
  v26 = +[NSArray arrayWithObjects:v31 count:4];
  +[NSLayoutConstraint activateConstraints:v26];

  [(RouteStepListViewController *)self _updateCollectionViewHeader];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RouteStepListViewController;
  [(RouteStepListViewController *)&v4 viewWillAppear:a3];
  [(RouteStepListViewController *)self setDebugViewControllerEnabled:[(RouteStepListViewController *)self _shouldShowDebugViewController]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RouteStepListViewController;
  [(RouteStepListViewController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(RouteStepListViewController *)self dataSource];
  -[RouteStepListViewController _scrollToStepAtIndex:animated:](self, "_scrollToStepAtIndex:animated:", [v4 activeStepIndex], 0);
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)RouteStepListViewController;
  [(RouteStepListViewController *)&v14 viewDidLayoutSubviews];
  computedWidth = self->_computedWidth;
  if (!computedWidth
    || ([(NSNumber *)computedWidth cgFloatValue],
        double v5 = v4,
        [(RouteStepListViewController *)self view],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 frame],
        double v8 = vabdd_f64(v5, v7),
        v6,
        v8 > 2.22044605e-16))
  {
    v9 = [(RouteStepListViewController *)self view];
    [v9 frame];
    v11 = +[NSNumber numberWithDouble:v10];
    v12 = self->_computedWidth;
    self->_computedWidth = v11;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100BBC560;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RouteStepListViewController;
  [(RouteStepListViewController *)&v5 traitCollectionDidChange:a3];
  double v4 = [(RouteStepListViewController *)self traitCollection];
  [(RouteStepListDataSource *)self->_dataSource setTraitCollection:v4];
}

- (void)setRoute:(id)a3
{
  objc_super v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    if ((self->_options & 0x10) != 0
      && ([(RouteStepListViewController *)self route],
          v6 = objc_claimAutoreleasedReturnValue(),
          [v6 elevationProfile],
          double v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      double v8 = [(RouteStepListViewController *)self graphHeaderView];
      [v8 setRoute:v11];

      v9 = [(RouteStepListViewController *)self graphHeaderView];
      [(RouteStepListViewController *)self setHeaderView:v9];
    }
    else
    {
      [(RouteStepListViewController *)self setHeaderView:0];
    }
    double v10 = [(RouteStepListViewController *)self dataSource];
    [v10 setRoute:v11];

    objc_super v5 = v11;
  }
}

- (UICollectionView)collectionView
{
  collectionView = self->_collectionView;
  if (!collectionView)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc((Class)UICollectionViewCompositionalLayout);
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_100BBC9CC;
    v24 = &unk_1012EF3A8;
    objc_copyWeak(&v25, &location);
    id v5 = [v4 initWithSectionProvider:&v21];
    uint64_t v6 = objc_opt_class();
    double v7 = +[RouteStepListSectionBackgroundView decorationViewKind];
    [v5 registerClass:v6 forDecorationViewOfKind:v7];

    double v8 = [(UICollectionView *)objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v9 = self->_collectionView;
    self->_collectionView = v8;

    double v10 = [(RouteStepListViewController *)self cellClassForItemType:0];
    v11 = self->_collectionView;
    v12 = NSStringFromClass(v10);
    [(UICollectionView *)v11 registerClass:v10 forCellWithReuseIdentifier:v12];

    v13 = [(RouteStepListViewController *)self cellClassForItemType:1];
    objc_super v14 = self->_collectionView;
    v15 = NSStringFromClass(v13);
    [(UICollectionView *)v14 registerClass:v13 forCellWithReuseIdentifier:v15];

    objc_super v16 = [(RouteStepListViewController *)self cellClassForItemType:2];
    v17 = self->_collectionView;
    v18 = NSStringFromClass(v16);
    [(UICollectionView *)v17 registerClass:v16 forCellWithReuseIdentifier:v18];

    [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = +[UIColor clearColor];
    [(UICollectionView *)self->_collectionView setBackgroundColor:v19];

    [(UICollectionView *)self->_collectionView setDelegate:self];
    [(UICollectionView *)self->_collectionView setDataSource:self];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    collectionView = self->_collectionView;
  }

  return collectionView;
}

- (RouteStepListDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    id v4 = [RouteStepListDataSource alloc];
    id v5 = [(RouteStepListViewController *)self traitCollection];
    uint64_t v6 = [(RouteStepListDataSource *)v4 initWithTraitCollection:v5 options:self->_options metrics:self->_metrics context:2];
    double v7 = self->_dataSource;
    self->_dataSource = v6;

    [(RouteStepListDataSource *)self->_dataSource setDelegate:self];
    dataSource = self->_dataSource;
  }

  return dataSource;
}

- (NavigationDebugViewsController)debugViewController
{
  debugViewController = self->_debugViewController;
  if (!debugViewController)
  {
    id v4 = (NavigationDebugViewsController *)objc_opt_new();
    id v5 = self->_debugViewController;
    self->_debugViewController = v4;

    [(NavigationDebugViewsController *)self->_debugViewController setShowTraceControlsForStaleLocations:0];
    [(NavigationDebugViewsController *)self->_debugViewController setAutomaticallyHideTraceControls:0];
    [(NavigationDebugViewsController *)self->_debugViewController setUpCameraSnapshotPickerVCFromViewController:self];
    debugViewController = self->_debugViewController;
  }

  return debugViewController;
}

- (void)setDebugViewControllerEnabled:(BOOL)a3
{
  if (self->_debugViewControllerEnabled != a3)
  {
    self->_debugViewControllerEnabled = a3;
    if (a3)
    {
      id v4 = [(RouteStepListViewController *)self debugViewController];
      id v5 = [v4 debugControlsView];

      [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v6 = [(RouteStepListViewController *)self view];
      [v6 addSubview:v5];

      double v7 = [(RouteStepListViewController *)self view];
      double v8 = [v7 safeAreaLayoutGuide];

      v9 = [(RouteStepListViewController *)self collectionView];
      [v9 layoutMargins];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;

      [v5 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
      double v17 = v16;
      v34 = [v5 leadingAnchor];
      v33 = [v8 leadingAnchor];
      v32 = [v34 constraintEqualToAnchor:v33 constant:v11];
      v35[0] = v32;
      objc_super v30 = [v5 trailingAnchor];
      v31 = v8;
      v18 = [v8 trailingAnchor];
      v19 = [v30 constraintEqualToAnchor:v18 constant:-v15];
      v35[1] = v19;
      v20 = [v5 heightAnchor];
      v21 = [v20 constraintEqualToConstant:v17];
      v35[2] = v21;
      uint64_t v22 = [v5 bottomAnchor];
      v23 = [v8 bottomAnchor];
      v24 = [v22 constraintEqualToAnchor:v23 constant:-v13];
      v35[3] = v24;
      id v25 = +[NSArray arrayWithObjects:v35 count:4];
      +[NSLayoutConstraint activateConstraints:v25];

      v26 = [(RouteStepListViewController *)self debugViewController];
      [v26 didManuallyAddDebugViews];

      [(NSLayoutConstraint *)self->_collectionViewBottomConstraint setConstant:-v17];
    }
    else
    {
      debugViewController = self->_debugViewController;
      if (debugViewController)
      {
        v28 = [(NavigationDebugViewsController *)debugViewController debugControlsView];
        [v28 removeFromSuperview];

        [(NavigationDebugViewsController *)self->_debugViewController didManuallyRemoveDebugViews];
        collectionViewBottomConstraint = self->_collectionViewBottomConstraint;
        [(NSLayoutConstraint *)collectionViewBottomConstraint setConstant:0.0];
      }
    }
  }
}

- (void)setDisplayRouteFromNavigationService:(BOOL)a3
{
  if (self->_displayRouteFromNavigationService != a3)
  {
    BOOL v3 = a3;
    self->_displayRouteFromNavigationService = a3;
    -[DirectionsElevationGraphHeaderView setStyleForNavigation:](self->_graphHeaderView, "setStyleForNavigation:");
    id v5 = +[MNNavigationService sharedService];
    uint64_t v6 = v5;
    if (v3)
    {
      [v5 registerObserver:self];

      [(RouteStepListViewController *)self _updateRouteFromNavigationService];
      id v9 = +[MNNavigationService sharedService];
      id v7 = [v9 stepIndex];
      double v8 = [(RouteStepListViewController *)self dataSource];
      [v8 setActiveStepIndex:v7];
    }
    else
    {
      [v5 unregisterObserver:self];

      [(RouteStepListViewController *)self setRoute:0];
      id v9 = [(RouteStepListViewController *)self dataSource];
      [v9 setActiveStepIndex:0];
    }
  }
}

- (double)maximumHeaderHeight
{
  uint64_t v3 = [(RouteStepListViewController *)self headerView];
  if (!v3) {
    return 0.0;
  }
  id v4 = (void *)v3;
  id v5 = [(RouteStepListViewController *)self headerView];
  graphHeaderView = self->_graphHeaderView;

  if (v5 != graphHeaderView) {
    return 0.0;
  }
  double v8 = [(RouteStepListViewController *)self graphHeaderView];
  [v8 maximumHeight];
  double v10 = v9;

  return v10;
}

- (double)minimumHeaderHeight
{
  uint64_t v3 = [(RouteStepListViewController *)self headerView];
  if (!v3) {
    return 0.0;
  }
  id v4 = (void *)v3;
  id v5 = [(RouteStepListViewController *)self headerView];
  graphHeaderView = self->_graphHeaderView;

  if (v5 != graphHeaderView) {
    return 0.0;
  }
  double v8 = [(RouteStepListViewController *)self graphHeaderView];
  [v8 minimumHeight];
  double v10 = v9;

  return v10;
}

- (void)setHeaderView:(id)a3
{
  id v5 = (UIView *)a3;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    [(UIView *)headerView removeFromSuperview];
    [(NSLayoutConstraint *)self->_headerViewHeightConstraint setActive:0];
    headerViewHeightConstraint = self->_headerViewHeightConstraint;
    self->_headerViewHeightConstraint = 0;

    objc_storeStrong((id *)&self->_headerView, a3);
    if (v5)
    {
      [(RouteStepListViewController *)self maximumHeaderHeight];
      double v9 = v8;
      double v10 = [(RouteStepListViewController *)self view];
      [v10 addSubview:v5];

      double v11 = [(UIView *)v5 heightAnchor];
      double v12 = [v11 constraintEqualToConstant:v9];
      double v13 = self->_headerViewHeightConstraint;
      self->_headerViewHeightConstraint = v12;

      v26 = [(UIView *)v5 leadingAnchor];
      v27 = [(RouteStepListViewController *)self view];
      id v25 = [v27 leadingAnchor];
      v24 = [v26 constraintEqualToAnchor:v25];
      v28[0] = v24;
      v23 = [(UIView *)v5 trailingAnchor];
      double v14 = [(RouteStepListViewController *)self view];
      double v15 = [v14 trailingAnchor];
      double v16 = [v23 constraintEqualToAnchor:v15];
      v28[1] = v16;
      double v17 = [(UIView *)v5 topAnchor];
      v18 = [(RouteStepListViewController *)self view];
      v19 = [v18 topAnchor];
      v20 = [v17 constraintEqualToAnchor:v19];
      v21 = self->_headerViewHeightConstraint;
      v28[2] = v20;
      v28[3] = v21;
      uint64_t v22 = +[NSArray arrayWithObjects:v28 count:4];
      +[NSLayoutConstraint activateConstraints:v22];
    }
    [(RouteStepListViewController *)self _updateCollectionViewHeader];
  }
}

- (DirectionsElevationGraphHeaderView)graphHeaderView
{
  graphHeaderView = self->_graphHeaderView;
  if (!graphHeaderView)
  {
    id v4 = -[DirectionsElevationGraphHeaderView initWithFrame:]([DirectionsElevationGraphHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = self->_graphHeaderView;
    self->_graphHeaderView = v4;

    [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView setDelegate:self];
    [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView setStyleForNavigation:[(RouteStepListViewController *)self displayRouteFromNavigationService]];
    graphHeaderView = self->_graphHeaderView;
  }

  return graphHeaderView;
}

- (UIScrollView)scrollView
{
  collectionView = self->_collectionView;
  if (!collectionView) {
    collectionView = self->_tableView;
  }
  return (UIScrollView *)collectionView;
}

- (void)reloadDataSource:(id)a3
{
  id v4 = [(RouteStepListViewController *)self collectionView];
  [v4 reloadData];

  [(RouteStepListViewController *)self _scrollToStepAtIndex:0 animated:0];
}

- (void)reloadIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteStepListViewController *)self collectionView];
  [v5 reloadItemsAtIndexPaths:v4];
}

- (void)reloadStepIndices:(id)a3 forDataSource:(id)a4
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100BBD7B0;
  v8[3] = &unk_1012EB2B8;
  id v9 = (id)objc_opt_new();
  id v6 = v9;
  [v5 enumerateIndexesUsingBlock:v8];

  id v7 = [(RouteStepListViewController *)self collectionView];
  [v7 reloadItemsAtIndexPaths:v6];
}

- (Class)cellClassForItemType:(unint64_t)a3
{
  if (a3 <= 2)
  {
    objc_opt_class();
    self = (RouteStepListViewController *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)self;
}

- (void)customizeItem:(id)a3 forDataSource:(id)a4
{
  id v5 = a3;
  [v5 setShowsHairline:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setDelegate:self];
  }
}

- (void)didTapShareButtonOnRoutePlanningFooterView:(id)a3
{
  id v4 = [(RouteStepListViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(RouteStepListViewController *)self delegate];
    [v6 directionsStepsListDidTapShareButton:self];
  }
}

- (void)didTapReportAProblemButtonOnRoutePlanningFooterView:(id)a3
{
  id v4 = [(RouteStepListViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(RouteStepListViewController *)self delegate];
    [v6 directionsStepsListDidTapRAPButton:self];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(RouteStepListViewController *)self dataSource];
  char v5 = [v4 items];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(RouteStepListViewController *)self dataSource];
  id v9 = [v8 items];
  double v10 = [v9 objectAtIndexedSubscript:[v6 row]];

  double v11 = NSStringFromClass((Class)[v10 cellClass]);
  double v12 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v6];

  [v12 setItem:v10];
  [v12 setShouldUseTextToBottomConstraint:1];

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(RouteStepListViewController *)self dataSource];
  id v7 = [v6 items];
  id v8 = [v5 row];

  id v9 = [v7 objectAtIndexedSubscript:v8];

  if ([(RouteStepListViewController *)self allowsSelection])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v23 = a4;
  id v5 = [(RouteStepListViewController *)self dataSource];
  id v6 = [v5 items];
  id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v23, "row"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    if ([v23 row])
    {
      double v11 = (char *)[v23 row] + 1;
      double v12 = [(RouteStepListViewController *)self dataSource];
      double v13 = [v12 items];
      double v14 = (char *)[v13 count];

      if (v11 < v14)
      {
        uint64_t v15 = (uint64_t)[v23 row];
        if (v15 >= 1)
        {
          uint64_t v16 = v15;
          while (1)
          {
            double v17 = [(RouteStepListViewController *)self dataSource];
            v18 = [v17 items];
            id v9 = [v18 objectAtIndexedSubscript:v16];

            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }

            if (v16-- <= 1) {
              goto LABEL_14;
            }
          }
          if (v9)
          {
LABEL_16:
            double v10 = [(RouteStepListViewController *)self delegate];
            uint64_t v22 = [v9 step];
            [v10 directionsStepsList:self didTapRowForRouteStep:v22];

            goto LABEL_17;
          }
        }
      }
LABEL_14:
      v20 = [(RouteStepListViewController *)self dataSource];
      uint64_t v21 = [v20 lastStepManeuverItem];
    }
    else
    {
      v20 = [(RouteStepListViewController *)self dataSource];
      uint64_t v21 = [v20 firstStepManeuverItem];
    }
    id v9 = (void *)v21;

    if (!v9) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  id v8 = v7;
  id v9 = [(RouteStepListViewController *)self delegate];
  double v10 = [v8 step];

  [v9 directionsStepsList:self didTapRowForRouteStep:v10];
LABEL_17:

LABEL_18:
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v8 = a3;
  id v4 = [(RouteStepListViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(RouteStepListViewController *)self delegate];
    [v6 scrollViewWillBeginDragging:v8];
  }
  [v8 contentOffset];
  [(RouteStepListViewController *)self setScrollViewOffsetStart:v7];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  id v9 = [(RouteStepListViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(RouteStepListViewController *)self delegate];
    [v11 scrollViewWillEndDragging:v12 withVelocity:a5 targetContentOffset:x, y];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = a3;
  id v6 = [(RouteStepListViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(RouteStepListViewController *)self delegate];
    [v8 scrollViewDidEndDragging:v21 willDecelerate:v4];
  }
  [v21 contentOffset];
  double v10 = v9;
  [(RouteStepListViewController *)self scrollViewOffsetStart];
  if (v10 != v11)
  {
    [(RouteStepListViewController *)self scrollViewOffsetStart];
    if (v10 >= v12) {
      uint64_t v13 = 7;
    }
    else {
      uint64_t v13 = 8;
    }
    double v14 = [(RouteStepListViewController *)self route];
    unsigned int v15 = [v14 transportType];

    if (v15 - 1 > 5) {
      unint64_t v16 = 0;
    }
    else {
      unint64_t v16 = qword_100F737F8[v15 - 1] - 1;
    }
    unsigned int v17 = [(RouteStepListViewController *)self displayRouteFromNavigationService];
    if (v16 > 4)
    {
      uint64_t v19 = 0;
    }
    else
    {
      v18 = (unsigned int *)&unk_100F7383C;
      if (v17) {
        v18 = (unsigned int *)&unk_100F73828;
      }
      uint64_t v19 = v18[v16];
    }
    v20 = +[MKMapService sharedService];
    [v20 captureUserAction:v13 onTarget:v19 eventValue:0];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(RouteStepListViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(RouteStepListViewController *)self delegate];
    [v6 scrollViewDidScroll:v7];
  }
  [(RouteStepListViewController *)self _updateCollectionViewHeader];
}

- (void)_scrollToStepAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(RouteStepListViewController *)self dataSource];
  id v8 = [v7 itemIndexForStepIndex:a3];

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v9 = 0;
  }
  else {
    id v9 = v8;
  }
  id v11 = +[NSIndexPath indexPathForRow:v9 inSection:0];
  double v10 = [(RouteStepListViewController *)self collectionView];
  [v10 scrollToItemAtIndexPath:v11 atScrollPosition:1 animated:v4];
}

- (void)_updateCollectionViewHeader
{
  [(RouteStepListViewController *)self minimumHeaderHeight];
  double v4 = v3;
  [(RouteStepListViewController *)self maximumHeaderHeight];
  double v6 = v5;
  id v7 = [(RouteStepListViewController *)self collectionView];
  [v7 contentOffset];
  double v9 = v8;
  double v10 = [(RouteStepListViewController *)self collectionView];
  [v10 adjustedContentInset];
  double v12 = v9 + v11;

  double v13 = v6 - fmax(v12, 0.0);
  [(NSLayoutConstraint *)self->_collectionViewTopConstraint setConstant:v4];
  if (v13 > v4 != [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView isBottomHairlineHidden])[(DirectionsElevationGraphHeaderView *)self->_graphHeaderView setBottomHairlineHidden:v13 > v4]; {
  if (v13 <= v4)
  }
    double v13 = v4;
  if (self->_headerView) {
    double v14 = 10.0;
  }
  else {
    double v14 = 0.0;
  }
  [(UICollectionView *)self->_collectionView contentInset];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = [(RouteStepListViewController *)self collectionView];
  [v21 setContentInset:v6 - v4 + v14, v16, v18, v20];

  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  id v25 = [(RouteStepListViewController *)self collectionView];
  [v25 setScrollIndicatorInsets:UIEdgeInsetsZero.top, left, bottom, right];

  [(NSLayoutConstraint *)self->_headerViewHeightConstraint setConstant:v13];
  headerViewHeightConstraint = self->_headerViewHeightConstraint;

  [(NSLayoutConstraint *)headerViewHeightConstraint setActive:1];
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v7 = [(RouteStepListViewController *)self dataSource];
  [v7 setActiveStepIndex:a4];

  [(RouteStepListViewController *)self _scrollToStepAtIndex:a4 animated:1];

  [(RouteStepListViewController *)self _updateCollectionViewHeader];
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateChangedToNavigating())
  {
    [(RouteStepListViewController *)self _updateRouteFromNavigationService];
  }
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v17 = a3;
  id v8 = a5;
  double v9 = [v17 route];
  [v9 distance];
  double v11 = v10;
  [v8 distanceRemainingToEndOfLeg];
  if (v11 - v12 < 0.0)
  {
    [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView setNavigationProgress:0.0];
  }
  else
  {
    double v13 = [v17 route];
    [v13 distance];
    double v15 = v14;
    [v8 distanceRemainingToEndOfLeg];
    [(DirectionsElevationGraphHeaderView *)self->_graphHeaderView setNavigationProgress:v15 - v16];
  }
}

- (void)_updateRouteFromNavigationService
{
  id v5 = +[MNNavigationService sharedService];
  [v5 state];
  if (MNNavigationServiceStateIsNavigating()
    && ([v5 route], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v4 = (void *)v3;
    [(RouteStepListViewController *)self setRoute:v3];
  }
  else
  {
    [(RouteStepListViewController *)self setRoute:0];
  }
}

- (void)virtualGarageDidUpdate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100BBE6EC;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)directionsElevationGraphHeaderViewWillRecalculateHeights:(id)a3
{
}

- (BOOL)_shouldShowDebugViewController
{
  v2 = +[NSUserDefaults standardUserDefaults];
  if ([v2 BOOLForKey:@"PlaybackControls"])
  {
    id v3 = +[CarDisplayController sharedInstance];
    if ([v3 isCarAppSceneHostingNavigation])
    {
      double v4 = +[MNNavigationService sharedService];
      unsigned __int8 v5 = [v4 isNavigatingFromTrace];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)showsHairline
{
  return self->_showsHairline;
}

- (void)setShowsHairline:(BOOL)a3
{
  self->_showsHairline = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (BOOL)displayRouteFromNavigationService
{
  return self->_displayRouteFromNavigationService;
}

- (BOOL)allowsSelection
{
  return self->_allowsSelection;
}

- (void)setAllowsSelection:(BOOL)a3
{
  self->_allowsSelection = a3;
}

- (RouteStepListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteStepListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDebugViewController:(id)a3
{
}

- (BOOL)debugViewControllerEnabled
{
  return self->_debugViewControllerEnabled;
}

- (void)setDataSource:(id)a3
{
}

- (double)scrollViewOffsetStart
{
  return self->_scrollViewOffsetStart;
}

- (void)setScrollViewOffsetStart:(double)a3
{
  self->_scrollViewOffsetStart = a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setGraphHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphHeaderView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_debugViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_computedWidth, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_collectionViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewTopConstraint, 0);

  objc_storeStrong((id *)&self->_headerViewHeightConstraint, 0);
}

@end