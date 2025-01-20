@interface RouteStepsViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (ContainerHeaderView)modalHeaderView;
- (RoutePlanningDataCoordination)dataCoordinator;
- (RouteStepsViewController)initWithCoder:(id)a3;
- (RouteStepsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (RouteStepsViewControllerDelegate)delegate;
- (UIScrollView)scrollViewForDirectionsDetailsOfCurrentRoute;
- (id)_driveOrWalkDirectionsListViewController;
- (id)_transitDirectionsListViewController;
- (id)directionsListViewControllerForDirectionsType:(int)a3;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int64_t)observedRoutePlanningData;
- (void)_clearControllerIfNeeded:(id)a3;
- (void)_customInit;
- (void)_didTapDoneButton:(id)a3;
- (void)_observeHeaderFlagForController:(id)a3;
- (void)_setupChildViewControllerIfNeeded:(id)a3;
- (void)_setupConstraints;
- (void)_shareRoute:(id)a3 sourceView:(id)a4;
- (void)_updateHairlineVisibility:(BOOL)a3;
- (void)_updateVisibleViewsForDirectionsType:(int)a3;
- (void)dealloc;
- (void)didBecomeCurrent;
- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4;
- (void)directionsStepsListDidTapRAPButton:(id)a3;
- (void)directionsStepsListDidTapShareButton:(id)a3;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateOriginName:(id)a4 destinationName:(id)a5;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4;
- (void)setDataCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setModalHeaderView:(id)a3;
- (void)transitDirectionsStepsListDataSource:(id)a3 didSelectTrip:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 didTapClusteredVehiclesCell:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 didTapGetTicketsForSegments:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 didTapIncidentsCell:(id)a4 withAdvisory:(id)a5;
- (void)transitDirectionsStepsListDataSource:(id)a3 didTapRowForItem:(id)a4;
- (void)viewDidLoad;
- (void)willBecomeCurrent:(BOOL)a3;
- (void)willChangeContainerStyle:(unint64_t)a3;
@end

@implementation RouteStepsViewController

- (void)dealloc
{
  [(RouteStepsViewController *)self _observeHeaderFlagForController:0];
  v3.receiver = self;
  v3.super_class = (Class)RouteStepsViewController;
  [(RouteStepsViewController *)&v3 dealloc];
}

- (RouteStepsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RouteStepsViewController;
  v4 = [(RouteStepsViewController *)&v8 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(RouteStepsViewController *)v4 _customInit];
    v6 = v5;
  }

  return v5;
}

- (RouteStepsViewController)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RouteStepsViewController;
  objc_super v3 = [(RouteStepsViewController *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(RouteStepsViewController *)v3 _customInit];
    v5 = v4;
  }

  return v4;
}

- (void)_customInit
{
  objc_super v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setPresentedModally:1];

  id v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setTakesAvailableHeight:1];
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)RouteStepsViewController;
  [(ContaineeViewController *)&v15 viewDidLoad];
  objc_super v3 = [(RouteStepsViewController *)self view];
  [v3 setAccessibilityIdentifier:@"RouteStepsView"];

  id v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(RouteStepsViewController *)self setModalHeaderView:v4];

  v5 = [(RouteStepsViewController *)self modalHeaderView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(RouteStepsViewController *)self modalHeaderView];
  [v6 setDelegate:self];

  objc_super v7 = [(RouteStepsViewController *)self modalHeaderView];
  [v7 setHeaderSize:2];

  objc_super v8 = [(RouteStepsViewController *)self modalHeaderView];
  [v8 setHairLineAlpha:0.0];

  v9 = +[UIColor clearColor];
  v10 = [(RouteStepsViewController *)self modalHeaderView];
  [v10 setBackgroundColor:v9];

  v11 = [(ContaineeViewController *)self headerView];
  v12 = [(RouteStepsViewController *)self modalHeaderView];
  [v11 addSubview:v12];

  v13 = [(RouteStepsViewController *)self dataCoordinator];
  [v13 addObserver:self];

  v14 = [(RouteStepsViewController *)self dataCoordinator];
  [v14 setupDataForObserver:self];

  [(RouteStepsViewController *)self _setupConstraints];
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5 = [a3 buttonView];
  [(RouteStepsViewController *)self _didTapDoneButton:v5];
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)RouteStepsViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v11, "willChangeContainerStyle:");
  unsigned int v5 = (a3 > 7) | (0x5Cu >> a3);
  transitDirectionsListViewController = self->_transitDirectionsListViewController;
  if (transitDirectionsListViewController)
  {
    objc_super v7 = [(TransitDirectionsListViewController *)transitDirectionsListViewController dataSource];
    [v7 setAllowStepSelection:v5 & 1];

    if ((v5 & 1) == 0)
    {
      objc_super v8 = [(TransitDirectionsListViewController *)self->_transitDirectionsListViewController dataSource];
      v9 = [v8 listView];
      [v9 clearActiveTransitListItem];

      v10 = [(RouteStepsViewController *)self dataCoordinator];
      [v10 updateCurrentRouteDisplayedMapRect:MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height];
    }
  }
  [(RouteStepListViewController *)self->_driveOrWalkDirectionsListViewController setAllowsSelection:v5 & 1];
}

- (void)willBecomeCurrent:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RouteStepsViewController;
  [(ContaineeViewController *)&v5 willBecomeCurrent:a3];
  transitDirectionsListViewController = self->_transitDirectionsListViewController;
  if (transitDirectionsListViewController) {
    [(TransitDirectionsListViewController *)transitDirectionsListViewController _willBecomeCurrent];
  }
}

- (void)didBecomeCurrent
{
  v5.receiver = self;
  v5.super_class = (Class)RouteStepsViewController;
  [(ContaineeViewController *)&v5 didBecomeCurrent];
  objc_super v3 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v4 = (unint64_t)[v3 containerStyle];
  [(RouteStepListViewController *)self->_driveOrWalkDirectionsListViewController setAllowsSelection:(v4 > 7) | (0x5Cu >> v4) & 1];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &unk_10160FBF8)
  {
    objc_super v7 = [a5 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    id v8 = [v7 BOOLValue];

    [(RouteStepsViewController *)self _updateHairlineVisibility:v8];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)RouteStepsViewController;
    -[RouteStepsViewController observeValueForKeyPath:ofObject:change:context:](&v9, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_observeHeaderFlagForController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observingHeaderOfController);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_observingHeaderOfController);
    [v5 removeObserver:self forKeyPath:@"showsHairline" context:&unk_10160FBF8];

    id v6 = objc_storeWeak((id *)&self->_observingHeaderOfController, obj);
    [obj addObserver:self forKeyPath:@"showsHairline" options:1 context:&unk_10160FBF8];
  }
}

- (void)_updateHairlineVisibility:(BOOL)a3
{
  if (a3) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = [(RouteStepsViewController *)self modalHeaderView];
  [v4 setHairLineAlpha:v3];
}

- (int64_t)observedRoutePlanningData
{
  return 72;
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateOriginName:(id)a4 destinationName:(id)a5
{
  id v8 = +[NSBundle mainBundle];
  id v6 = [v8 localizedStringForKey:@"[Route Steps] Details" value:@"localized string not found" table:0];
  objc_super v7 = [(RouteStepsViewController *)self modalHeaderView];
  [v7 setTitle:v6];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v5 = [a4 currentRoute:a3];
  id v8 = v5;
  if (v5)
  {
    id v6 = -[RouteStepsViewController directionsListViewControllerForDirectionsType:](self, "directionsListViewControllerForDirectionsType:", [v5 transportType]);
    [v6 setRoute:v8];
    objc_super v7 = [v6 tableView];
    [v7 reloadData];

    [(RouteStepsViewController *)self _setupChildViewControllerIfNeeded:v6];
    -[RouteStepsViewController _updateVisibleViewsForDirectionsType:](self, "_updateVisibleViewsForDirectionsType:", [v8 transportType]);
    -[RouteStepsViewController _updateHairlineVisibility:](self, "_updateHairlineVisibility:", [v6 showsHairline]);
  }
  else
  {
    [(RouteStepsViewController *)self _clearControllerIfNeeded:self->_driveOrWalkDirectionsListViewController];
    [(RouteStepsViewController *)self _clearControllerIfNeeded:self->_transitDirectionsListViewController];
  }
}

- (void)_didTapDoneButton:(id)a3
{
  id v4 = a3;
  id v5 = +[MKMapService sharedService];
  [v5 captureUserAction:4 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  id v6 = [(RouteStepsViewController *)self dataCoordinator];
  [v6 updateCurrentRouteDisplayedMapRect:MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height];

  id v7 = [(ContaineeViewController *)self containeeDelegate];
  [v7 containeeViewControllerGoToPreviousState:self withSender:v4];
}

- (void)directionsStepsListDidTapShareButton:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v6 = 1;
  if (isKindOfClass) {
    uint64_t v6 = 0;
  }
  id v7 = objc_retain(*(id *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR___RouteStepsViewController__transitDirectionsListViewController[v6]));
  id v8 = [v7 route];

  if (!v8)
  {
    objc_super v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315906;
      v19 = "-[RouteStepsViewController directionsStepsListDidTapShareButton:]";
      __int16 v20 = 2080;
      v21 = "RouteStepsViewController.m";
      __int16 v22 = 1024;
      int v23 = 236;
      __int16 v24 = 2080;
      v25 = "viewController.route != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v18, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = +[NSThread callStackSymbols];
        int v18 = 138412290;
        v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  objc_super v9 = [v7 route];
  v10 = [v7 view];
  [(RouteStepsViewController *)self _shareRoute:v9 sourceView:v10];

  objc_super v11 = +[MKMapService sharedService];
  v12 = [v7 route];
  unsigned int v13 = [v12 transportType] - 1;
  if (v13 > 5) {
    uint64_t v14 = 604;
  }
  else {
    uint64_t v14 = dword_100F726CC[v13];
  }
  [v11 captureUserAction:6013 onTarget:v14 eventValue:0];
}

- (void)directionsStepsListDidTapRAPButton:(id)a3
{
  id v4 = [(RouteStepsViewController *)self _maps_platformController];
  id v5 = [v4 currentSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    unsigned int v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315906;
      v17 = "-[RouteStepsViewController directionsStepsListDidTapRAPButton:]";
      __int16 v18 = 2080;
      v19 = "RouteStepsViewController.m";
      __int16 v20 = 1024;
      int v21 = 248;
      __int16 v22 = 2080;
      int v23 = "routePlanningSession != nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_super v15 = +[NSThread callStackSymbols];
        int v16 = 138412290;
        v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  unint64_t v8 = (unint64_t)[v7 currentTransportType];
  if (v8 > 5) {
    uint64_t v9 = 608;
  }
  else {
    uint64_t v9 = dword_100F726E4[v8];
  }
  v10 = +[MKMapService sharedService];
  [v10 captureUserAction:5013 onTarget:v9 eventValue:0];

  objc_super v11 = [(RouteStepsViewController *)self _maps_mapsSceneDelegate];
  v12 = [v11 rapPresenter];
  [v12 presentReportAProblemForRouteFromEntryPoint:v9];
}

- (void)_shareRoute:(id)a3 sourceView:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v9 = [(RouteStepsViewController *)self delegate];
    unint64_t v8 = +[ShareItem shareItemWithRoute:v7 includeRoutingApps:1];

    [v9 routeStepsViewController:self wantsToShareItem:v8 fromView:v6];
  }
}

- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4
{
  double v5 = sub_1008C018C(a4);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(RouteStepsViewController *)self dataCoordinator];
  [v12 updateCurrentRouteDisplayedMapRect:v5, v7, v9, v11];
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didSelectTrip:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = +[MKMapService sharedService];
  uint64_t v9 = [(RouteStepsViewController *)self currentUITargetForAnalytics];
  double v10 = [v7 displayedItemIndexForAnalytics];

  [v8 captureUserAction:9040 onTarget:v9 eventValue:0 transitStep:v10];
  id v12 = [(RouteStepsViewController *)self delegate];
  double v11 = [v6 matchingRouteStep];

  [v12 routeStepsViewController:self wantsToDisplayScheduleForTransitStep:v11];
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapRowForItem:(id)a4
{
  id v14 = a4;
  id v6 = [a3 listView];
  id v7 = v6;
  if (v6)
  {
    if ([v6 isActiveTransitDirectionsListItem:v14])
    {
      [v7 clearActiveTransitListItem];
      double v8 = [(RouteStepsViewController *)self dataCoordinator];
      uint64_t v9 = v8;
      double x = MKMapRectNull.origin.x;
      double y = MKMapRectNull.origin.y;
      double width = MKMapRectNull.size.width;
      double height = MKMapRectNull.size.height;
      goto LABEL_6;
    }
    [v7 setActiveTransitDirectionsListItem:v14];
  }
  uint64_t v9 = [(RouteStepsViewController *)self dataCoordinator];
  [v14 displayedMapRect];
  double v8 = v9;
LABEL_6:
  [v8 updateCurrentRouteDisplayedMapRect:x, y, width, height];
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapClusteredVehiclesCell:(id)a4
{
  id v25 = a4;
  double v5 = [v25 clusteredVehicleItem];
  id v6 = [v5 clusteredSegment];

  if (v6)
  {
    id v7 = +[UIAlertController clusteredVehiclesSelectionAlertControllerForClusteredSegment:v6 completion:0];
    double v8 = [(RouteStepsViewController *)self view];
    uint64_t v9 = [v7 popoverPresentationController];
    [v9 setSourceView:v8];

    double v10 = [(RouteStepsViewController *)self view];
    [v25 bounds];
    [v10 convertRect:v25 fromView:];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = [v7 popoverPresentationController];
    [v19 setSourceRect:v12, v14, v16, v18];

    __int16 v20 = [v7 popoverPresentationController];
    [v20 setPermittedArrowDirections:12];

    [(RouteStepsViewController *)self presentViewController:v7 animated:1 completion:0];
    int v21 = +[MKMapService sharedService];
    __int16 v22 = [v25 clusteredVehicleItem];
    int v23 = [v22 clusteredSegment];
    __int16 v24 = MapsAnalyticsEventValueForClusteredSegment(v23);
    [v21 captureUserAction:3037 onTarget:606 eventValue:v24];
  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapIncidentsCell:(id)a4 withAdvisory:(id)a5
{
  id v6 = a5;
  id v7 = [(RouteStepsViewController *)self delegate];
  [v7 routeStepsViewController:self wantsToDisplayAdvisory:v6];
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapGetTicketsForSegments:(id)a4
{
  double v5 = self->_transitDirectionsListViewController;
  id v19 = +[UIAlertController _maps_alertControllerForTicketedSegments:a4];
  id v6 = [(TransitDirectionsListViewController *)v5 view];
  id v7 = [v19 popoverPresentationController];
  [v7 setSourceView:v6];

  double v8 = [(TransitDirectionsListViewController *)v5 view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [v19 popoverPresentationController];
  [v17 setSourceRect:v10, v12, v14, v16];

  double v18 = [v19 popoverPresentationController];
  [v18 setPermittedArrowDirections:12];

  [(TransitDirectionsListViewController *)v5 presentViewController:v19 animated:1 completion:0];
}

- (id)directionsListViewControllerForDirectionsType:(int)a3
{
  if (a3 == 1) {
    [(RouteStepsViewController *)self _transitDirectionsListViewController];
  }
  else {
  double v3 = [(RouteStepsViewController *)self _driveOrWalkDirectionsListViewController];
  }

  return v3;
}

- (UIScrollView)scrollViewForDirectionsDetailsOfCurrentRoute
{
  double v3 = [(RouteStepsViewController *)self dataCoordinator];
  id v4 = [v3 routeCollection];
  double v5 = [v4 currentRoute];

  if (v5)
  {
    id v6 = -[RouteStepsViewController directionsListViewControllerForDirectionsType:](self, "directionsListViewControllerForDirectionsType:", [v5 transportType]);
    id v7 = [v6 scrollView];
  }
  else
  {
    id v7 = 0;
  }

  return (UIScrollView *)v7;
}

- (id)_driveOrWalkDirectionsListViewController
{
  driveOrWalkDirectionsListViewController = self->_driveOrWalkDirectionsListViewController;
  if (!driveOrWalkDirectionsListViewController)
  {
    id v4 = [RouteStepListViewController alloc];
    double v5 = +[RouteStepListMetrics routePlanningMetrics];
    id v6 = [(RouteStepListViewController *)v4 initWithOptions:247 metrics:v5];
    id v7 = self->_driveOrWalkDirectionsListViewController;
    self->_driveOrWalkDirectionsListViewController = v6;

    double v8 = [(ContaineeViewController *)self cardPresentationController];
    unint64_t v9 = (unint64_t)[v8 containerStyle];
    [(RouteStepListViewController *)self->_driveOrWalkDirectionsListViewController setAllowsSelection:(v9 > 7) | (0x5Cu >> v9) & 1];

    [(RouteStepListViewController *)self->_driveOrWalkDirectionsListViewController setDelegate:self];
    driveOrWalkDirectionsListViewController = self->_driveOrWalkDirectionsListViewController;
  }

  return driveOrWalkDirectionsListViewController;
}

- (id)_transitDirectionsListViewController
{
  transitDirectionsListViewController = self->_transitDirectionsListViewController;
  if (!transitDirectionsListViewController)
  {
    id v4 = objc_alloc_init(TransitDirectionsListViewController);
    double v5 = self->_transitDirectionsListViewController;
    self->_transitDirectionsListViewController = v4;

    id v6 = [(TransitDirectionsListViewController *)self->_transitDirectionsListViewController dataSource];
    [v6 setDelegate:self];

    [(TransitDirectionsListViewController *)self->_transitDirectionsListViewController setScrollViewDelegate:self];
    id v7 = [(ContaineeViewController *)self cardPresentationController];
    unint64_t v8 = (unint64_t)[v7 containerStyle];
    unsigned int v9 = (v8 > 7) | (0x5Cu >> v8);
    double v10 = [(TransitDirectionsListViewController *)self->_transitDirectionsListViewController dataSource];
    [v10 setAllowStepSelection:v9 & 1];

    double v11 = [(TransitDirectionsListViewController *)self->_transitDirectionsListViewController dataSource];
    [v11 setOptions:8];

    transitDirectionsListViewController = self->_transitDirectionsListViewController;
  }

  return transitDirectionsListViewController;
}

- (void)_updateVisibleViewsForDirectionsType:(int)a3
{
  BOOL v4 = a3 == 1;
  uint64_t v5 = OBJC_IVAR___RouteStepsViewController__transitDirectionsListViewController[a3 != 1];
  id v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + v5) view];
  [v6 setHidden:0];

  [(RouteStepsViewController *)self _observeHeaderFlagForController:*(Class *)((char *)&self->super.super.super.super.super.isa + v5)];
  uint64_t v7 = OBJC_IVAR___RouteStepsViewController__transitDirectionsListViewController[v4];
  unint64_t v8 = [*(id *)((char *)&self->super.super.super.super.super.isa + v7) view];
  [v8 setHidden:1];

  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v7);

  [(RouteStepsViewController *)self _clearControllerIfNeeded:v9];
}

- (void)_clearControllerIfNeeded:(id)a3
{
  id v6 = a3;
  double v3 = [v6 route];

  if (v3)
  {
    [v6 setRoute:0];
    BOOL v4 = [v6 collectionView];
    [v4 reloadData];

    uint64_t v5 = [v6 tableView];
    [v5 reloadData];
  }
}

- (void)_setupChildViewControllerIfNeeded:(id)a3
{
  id v23 = a3;
  if ([(RouteStepsViewController *)self isViewLoaded])
  {
    BOOL v4 = [v23 parentViewController];

    if (v4 != self)
    {
      [(RouteStepsViewController *)self addChildViewController:v23];
      uint64_t v5 = [v23 view];
      [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v6 = [(ContaineeViewController *)self contentView];
      [v6 bounds];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v15 = [v23 view];
      [v15 setFrame:v8, v10, v12, v14];

      double v16 = [(ContaineeViewController *)self contentView];
      double v17 = [v23 view];
      [v16 addSubview:v17];

      double v18 = [v23 view];
      id v19 = [(ContaineeViewController *)self contentView];
      LODWORD(v20) = 1148846080;
      int v21 = [v18 _maps_constraintsEqualToEdgesOfView:v19 priority:v20];
      __int16 v22 = [v21 allConstraints];
      +[NSLayoutConstraint activateConstraints:v22];

      [v23 didMoveToParentViewController:self];
    }
  }
}

- (void)_setupConstraints
{
  id v7 = [(RouteStepsViewController *)self modalHeaderView];
  double v3 = [(ContaineeViewController *)self headerView];
  LODWORD(v4) = 1148846080;
  uint64_t v5 = [v7 _maps_constraintsEqualToEdgesOfView:v3 priority:v4];
  id v6 = [v5 allConstraints];
  +[NSLayoutConstraint activateConstraints:v6];
}

- (int)currentUITargetForAnalytics
{
  v2 = [(RouteStepsViewController *)self dataCoordinator];
  double v3 = (char *)[v2 transportType];
  if ((unint64_t)(v3 - 1) > 4) {
    int v4 = 0;
  }
  else {
    int v4 = dword_100F726FC[(void)(v3 - 1)];
  }

  return v4;
}

- (int)currentMapViewTargetForAnalytics
{
  return 504;
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);

  return (RoutePlanningDataCoordination *)WeakRetained;
}

- (void)setDataCoordinator:(id)a3
{
}

- (RouteStepsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteStepsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ContainerHeaderView)modalHeaderView
{
  return self->_modalHeaderView;
}

- (void)setModalHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_storeStrong((id *)&self->_transitDirectionsListViewController, 0);
  objc_storeStrong((id *)&self->_driveOrWalkDirectionsListViewController, 0);

  objc_destroyWeak((id *)&self->_observingHeaderOfController);
}

@end