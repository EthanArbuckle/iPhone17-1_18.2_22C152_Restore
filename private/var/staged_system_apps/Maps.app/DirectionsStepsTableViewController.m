@interface DirectionsStepsTableViewController
+ (Class)dataSourceClass;
- (BOOL)_canShowWhileLocked;
- (BOOL)debugViewControllerEnabled;
- (BOOL)shouldShowDebugViewController;
- (BOOL)showsHairline;
- (DirectionsStepsListDataSource)dataSource;
- (DirectionsStepsTableViewController)init;
- (GEOComposedRoute)route;
- (NavigationDebugViewsController)debugViewsController;
- (RouteStepListDelegate)delegate;
- (UICollectionView)collectionView;
- (UIScrollViewDelegate)scrollViewDelegate;
- (UITableView)tableView;
- (id)routeStepForIndexPath:(id)a3;
- (int64_t)tableViewStyle;
- (unint64_t)options;
- (void)setDebugViewControllerEnabled:(BOOL)a3;
- (void)setDebugViewsController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setRoute:(id)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)setShowsHairline:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)updateTheme;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DirectionsStepsTableViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (Class)dataSourceClass
{
  return (Class)objc_opt_class();
}

- (DirectionsStepsTableViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)DirectionsStepsTableViewController;
  v2 = [(DirectionsStepsTableViewController *)&v6 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = (DirectionsStepsListDataSource *)objc_alloc_init((Class)[(id)objc_opt_class() dataSourceClass]);
    dataSource = v2->_dataSource;
    v2->_dataSource = v3;
  }
  return v2;
}

- (UITableView)tableView
{
  [(DirectionsStepsTableViewController *)self loadViewIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (int64_t)tableViewStyle
{
  return 0;
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)DirectionsStepsTableViewController;
  [(DirectionsStepsTableViewController *)&v33 viewDidLoad];
  v3 = [MapsThemeTableView alloc];
  v4 = [(DirectionsStepsTableViewController *)self view];
  [v4 bounds];
  v9 = -[MapsThemeTableView initWithFrame:style:](v3, "initWithFrame:style:", [(DirectionsStepsTableViewController *)self tableViewStyle], v5, v6, v7, v8);

  [(MapsThemeTableView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeTableView *)v9 setInsetsLayoutMarginsFromSafeArea:1];
  [(MapsThemeTableView *)v9 setInsetsContentViewsToSafeArea:1];
  v10 = +[UIColor separatorColor];
  [(MapsThemeTableView *)v9 setSeparatorColor:v10];

  v11 = [(DirectionsStepsTableViewController *)self view];
  [v11 addSubview:v9];

  [(DirectionsStepsTableViewController *)self setTableView:v9];
  v12 = [(DirectionsStepsTableViewController *)self dataSource];
  [v12 setTableView:v9];

  v13 = [(DirectionsStepsTableViewController *)self dataSource];
  v14 = [(DirectionsStepsTableViewController *)self tableView];
  [v14 setDelegate:v13];

  v15 = [(DirectionsStepsTableViewController *)self dataSource];
  v16 = [(DirectionsStepsTableViewController *)self tableView];
  [v16 setDataSource:v15];

  v17 = [(DirectionsStepsTableViewController *)self view];
  LODWORD(v18) = 1148846080;
  v19 = [(MapsThemeTableView *)v9 _maps_constraintsEqualToEdgesOfView:v17 priority:v18];

  v20 = [v19 topConstraint];
  tableTopEdgeConstraint = self->_tableTopEdgeConstraint;
  self->_tableTopEdgeConstraint = v20;

  v22 = [v19 allConstraints];
  +[NSLayoutConstraint activateConstraints:v22];

  v23 = [(DirectionsStepsTableViewController *)self dataSource];
  v24 = [(DirectionsStepsTableViewController *)self view];
  [v23 setCollapsingHeaderSuperview:v24 topAnchorConstraint:self->_tableTopEdgeConstraint];

  [(NSLayoutConstraint *)self->_tableTopEdgeConstraint constant];
  self->_showsHairline = v25 > 2.22044605e-16;
  v26 = [(DirectionsStepsTableViewController *)self dataSource];
  [v26 setScrollDirectionHandler:&stru_1013139B8];

  id v27 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v28 = [(DirectionsStepsTableViewController *)self tableView];
  [v28 setTableFooterView:v27];

  v29 = [(DirectionsStepsTableViewController *)self tableView];
  [v29 setBackgroundView:0];

  v30 = +[UIColor clearColor];
  v31 = [(DirectionsStepsTableViewController *)self tableView];
  [v31 setBackgroundColor:v30];

  v32 = [(DirectionsStepsTableViewController *)self tableView];
  [v32 setSeparatorInset:0.0, 16.0, 0.0, 16.0];

  [(DirectionsStepsTableViewController *)self setDebugViewControllerEnabled:[(DirectionsStepsTableViewController *)self shouldShowDebugViewController]];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)DirectionsStepsTableViewController;
  [(DirectionsStepsTableViewController *)&v4 viewDidLayoutSubviews];
  [(NSLayoutConstraint *)self->_tableTopEdgeConstraint constant];
  if (self->_showsHairline != v3 > 2.22044605e-16) {
    [(DirectionsStepsTableViewController *)self setShowsHairline:v3 > 2.22044605e-16];
  }
}

- (void)viewLayoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)DirectionsStepsTableViewController;
  [(DirectionsStepsTableViewController *)&v4 viewLayoutMarginsDidChange];
  double v3 = [(DirectionsStepsTableViewController *)self dataSource];
  [v3 invalidateLayoutAndReloadData];
}

- (GEOComposedRoute)route
{
  v2 = [(DirectionsStepsTableViewController *)self dataSource];
  double v3 = [v2 route];

  return (GEOComposedRoute *)v3;
}

- (void)setRoute:(id)a3
{
  id v4 = a3;
  id v5 = [(DirectionsStepsTableViewController *)self dataSource];
  [v5 setRoute:v4];
}

- (unint64_t)options
{
  v2 = [(DirectionsStepsTableViewController *)self dataSource];
  id v3 = [v2 options];

  return (unint64_t)v3;
}

- (void)setOptions:(unint64_t)a3
{
  id v4 = [(DirectionsStepsTableViewController *)self dataSource];
  [v4 setOptions:a3];
}

- (RouteStepListDelegate)delegate
{
  v2 = [(DirectionsStepsTableViewController *)self dataSource];
  id v3 = [v2 delegate];

  return (RouteStepListDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(DirectionsStepsTableViewController *)self dataSource];
  [v5 setDelegate:v4];
}

- (id)routeStepForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(DirectionsStepsTableViewController *)self dataSource];
  double v6 = [v5 routeStepForIndexPath:v4];

  return v6;
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  v2 = [(DirectionsStepsTableViewController *)self dataSource];
  id v3 = [v2 scrollViewDelegate];

  return (UIScrollViewDelegate *)v3;
}

- (void)setScrollViewDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(DirectionsStepsTableViewController *)self dataSource];
  [v5 setScrollViewDelegate:v4];
}

- (NavigationDebugViewsController)debugViewsController
{
  debugViewsController = self->_debugViewsController;
  if (!debugViewsController)
  {
    id v4 = [[NavigationDebugViewsController alloc] initWithDelegate:0];
    id v5 = self->_debugViewsController;
    self->_debugViewsController = v4;

    [(NavigationDebugViewsController *)self->_debugViewsController setShowTraceControlsForStaleLocations:0];
    [(NavigationDebugViewsController *)self->_debugViewsController setAutomaticallyHideTraceControls:0];
    [(NavigationDebugViewsController *)self->_debugViewsController setUpCameraSnapshotPickerVCFromViewController:self];
    double v6 = +[CarDisplayController sharedInstance];
    unsigned int v7 = [v6 isCurrentlyConnectedToCarAppScene];

    debugViewsController = self->_debugViewsController;
    if (v7)
    {
      double v8 = +[CarDisplayController sharedInstance];
      v9 = [v8 chromeViewController];
      v10 = [v9 mapView];
      [(NavigationDebugViewsController *)debugViewsController setMapView:v10];

      debugViewsController = self->_debugViewsController;
    }
  }

  return debugViewsController;
}

- (BOOL)shouldShowDebugViewController
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"PlaybackControls"];

  id v5 = +[CarDisplayController sharedInstance];
  if (v5)
  {
    double v6 = +[CarDisplayController sharedInstance];
    if ([v6 isCurrentlyConnectedToCarAppScene])
    {
      unsigned int v7 = +[CarDisplayController sharedInstance];
      unsigned __int8 v8 = [v7 isCarAppSceneHostingNavigation];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  v9 = [(DirectionsStepsTableViewController *)self dataSource];
  if ([v9 enableNavigationUpdates])
  {
    v10 = +[MNNavigationService sharedService];
    unsigned __int8 v11 = [v10 isNavigatingFromTrace];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v4 & v8 & v11;
}

- (void)setDebugViewControllerEnabled:(BOOL)a3
{
  if (self->_debugViewControllerEnabled != a3)
  {
    self->_debugViewControllerEnabled = a3;
    if (a3)
    {
      unsigned __int8 v4 = [(DirectionsStepsTableViewController *)self debugViewsController];
      id v5 = [v4 debugControlsView];

      [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v6 = [(DirectionsStepsTableViewController *)self view];
      [v6 addSubview:v5];

      v45 = [v5 leadingAnchor];
      v47 = [(DirectionsStepsTableViewController *)self view];
      v46 = [v47 safeAreaLayoutGuide];
      v44 = [v46 leadingAnchor];
      v43 = [v45 constraintEqualToAnchor:v44 constant:8.0];
      id v48 = v5;
      v50[0] = v43;
      v41 = [v5 trailingAnchor];
      v42 = [(DirectionsStepsTableViewController *)self view];
      unsigned int v7 = [v42 safeAreaLayoutGuide];
      unsigned __int8 v8 = [v7 trailingAnchor];
      v9 = [v41 constraintEqualToAnchor:v8 constant:-8.0];
      v50[1] = v9;
      v10 = [v5 bottomAnchor];
      unsigned __int8 v11 = [(DirectionsStepsTableViewController *)self view];
      v12 = [v11 safeAreaLayoutGuide];
      v13 = [v12 bottomAnchor];
      v14 = [v10 constraintEqualToAnchor:v13 constant:-8.0];
      v50[2] = v14;
      v15 = +[NSArray arrayWithObjects:v50 count:3];
      +[NSLayoutConstraint activateConstraints:v15];

      v16 = [(DirectionsStepsTableViewController *)self debugViewsController];
      [v16 didManuallyAddDebugViews];

      v17 = [(DirectionsStepsTableViewController *)self tableView];
      [v17 bounds];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      double v23 = v22;
      CGFloat v25 = v24;

      v26 = [(DirectionsStepsTableViewController *)self debugViewsController];
      [v26 debugViewHeight];
      double v28 = v27;

      v52.origin.x = v19;
      v52.origin.y = v21;
      v52.size.width = v23;
      v52.size.height = v25;
      double Height = CGRectGetHeight(v52);
      v53.origin.x = v19;
      v53.origin.y = v21;
      v53.size.width = v23;
      v53.size.height = v28;
      CGFloat v30 = Height - CGRectGetHeight(v53);
      [v48 setFrame:0.0, v30, v23, v28];
      double left = UIEdgeInsetsZero.left;
      double right = UIEdgeInsetsZero.right;
      v54.origin.x = 0.0;
      v54.origin.y = v30;
      v54.size.width = v23;
      v54.size.height = v28;
      double v33 = CGRectGetHeight(v54);
      v34 = [(DirectionsStepsTableViewController *)self tableView];
      [v34 setContentInset:UIEdgeInsetsZero.top, left, v33, right];
    }
    else if (self->_debugViewsController)
    {
      v35 = [(DirectionsStepsTableViewController *)self debugViewsController];
      v36 = [v35 debugControlsView];
      [v36 removeFromSuperview];

      v37 = [(DirectionsStepsTableViewController *)self debugViewsController];
      [v37 didManuallyRemoveDebugViews];

      double v38 = UIEdgeInsetsZero.left;
      double bottom = UIEdgeInsetsZero.bottom;
      double v40 = UIEdgeInsetsZero.right;
      id v49 = [(DirectionsStepsTableViewController *)self tableView];
      [v49 setContentInset:UIEdgeInsetsZero.top, v38, bottom, v40];
    }
  }
}

- (void)updateTheme
{
  v4.receiver = self;
  v4.super_class = (Class)DirectionsStepsTableViewController;
  [(MapsThemeViewController *)&v4 updateTheme];
  id v3 = [(DirectionsStepsTableViewController *)self tableView];
  [v3 reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(DirectionsStepsTableViewController *)self dataSource];
  [v5 suspendAutoscrollingToStep];

  double v6 = [(DirectionsStepsTableViewController *)self dataSource];
  [v6 reloadData];

  unsigned int v7 = [(DirectionsStepsTableViewController *)self dataSource];
  [v7 resumeAutoscrollingToStep];

  v8.receiver = self;
  v8.super_class = (Class)DirectionsStepsTableViewController;
  [(DirectionsStepsTableViewController *)&v8 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DirectionsStepsTableViewController;
  [(DirectionsStepsTableViewController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(DirectionsStepsTableViewController *)self dataSource];
  [v4 scrollToCurrentStep];
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (DirectionsStepsListDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setTableView:(id)a3
{
}

- (void)setDebugViewsController:(id)a3
{
}

- (BOOL)debugViewControllerEnabled
{
  return self->_debugViewControllerEnabled;
}

- (BOOL)showsHairline
{
  return self->_showsHairline;
}

- (void)setShowsHairline:(BOOL)a3
{
  self->_showsHairline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugViewsController, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_tableTopEdgeConstraint, 0);

  objc_storeStrong((id *)&self->_doneButtonItem, 0);
}

@end