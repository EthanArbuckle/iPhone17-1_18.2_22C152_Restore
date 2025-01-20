@interface MacRoutePlanningOverviewViewController
- (BOOL)isRouteSearchSuggestionsTableViewHidden;
- (MacRoutePlanningOverviewViewController)initWithDataCoordinator:(id)a3;
- (MenuContaineeViewController)routeSearchSuggestionsContaineeViewController;
- (NSTimer)routeSearchSuggestionsToggleTimer;
- (RoutePlanningEVChargeOptionsView)chargingOptionsView;
- (RoutePlanningElevationPopoverViewController)elevationPopoverController;
- (RoutePlanningOptionsBar)optionsBar;
- (RoutePlanningTransitTimingControlsView)timingControlsView;
- (RoutePlanningWaypointEditorViewController)searchFieldsViewController;
- (RouteSearchViewController)routeSearchViewController;
- (RouteWaypointSuggestionsTableViewController)routeSearchSuggestionsTableViewController;
- (UIStackView)headerStackView;
- (double)_routePlanningAdvisoryFooterViewHeight;
- (double)heightForLayout:(unint64_t)a3;
- (id)_initialConstraints;
- (id)keyCommands;
- (void)_clearAlternateRouteManeuverArrows;
- (void)_forceChangeOrigin;
- (void)_prepareRouteSearchControllers;
- (void)_presentElevationGraphForRoute:(id)a3 fromView:(id)a4;
- (void)_refreshDesiredTransportType;
- (void)_refreshOptionsVisibility;
- (void)_refreshRouteSearchFields;
- (void)_refreshSelectedVehicleDisplay;
- (void)_refreshTimingDisplay;
- (void)_setupSubviews;
- (void)_showManeuverArrowsForStep:(id)a3;
- (void)_updateCurrentRouteDisplayedMapRect:(id)a3 forRoute:(id)a4;
- (void)arrowLeftPressed:(id)a3;
- (void)arrowRightPressed:(id)a3;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)directionsStepsList:(id)a3 didTapElevationInfoButton:(id)a4;
- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4;
- (void)directionsStepsListDidTapRAPButton:(id)a3;
- (void)macMenuPresentationControllerDidDismiss:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)pressedAssumeFullCharge;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateResolvedWaypointSet:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransportType:(int64_t)a4;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setChargingOptionsView:(id)a3;
- (void)setElevationPopoverController:(id)a3;
- (void)setHeaderStackView:(id)a3;
- (void)setOptionsBar:(id)a3;
- (void)setRouteSearchSuggestionsContaineeViewController:(id)a3;
- (void)setRouteSearchSuggestionsTableViewController:(id)a3;
- (void)setRouteSearchSuggestionsTableViewHidden:(BOOL)a3;
- (void)setRouteSearchSuggestionsToggleTimer:(id)a3;
- (void)setRouteSearchViewController:(id)a3;
- (void)setSearchFieldsViewController:(id)a3;
- (void)setTimingControlsView:(id)a3;
- (void)transitDirectionsStepsListDataSource:(id)a3 didSelectTrip:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 didTapClusteredVehiclesCell:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 didTapGetTicketsWithURL:(id)a4;
- (void)transitDirectionsStepsListDataSource:(id)a3 didTapIncidentsCell:(id)a4 withAdvisory:(id)a5;
- (void)transitDirectionsStepsListDataSource:(id)a3 didTapRowForItem:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willChangeLayout:(unint64_t)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation MacRoutePlanningOverviewViewController

- (MacRoutePlanningOverviewViewController)initWithDataCoordinator:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MacRoutePlanningOverviewViewController;
  v3 = [(RoutePlanningOverviewViewController *)&v8 initWithDataCoordinator:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(ContaineeViewController *)v3 cardPresentationController];
    [v5 setAllowResizeInFloatingStyle:1];

    v6 = [(ContaineeViewController *)v4 cardPresentationController];
    [v6 setDefaultContaineeLayout:1];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(RoutePlanningOverviewViewController *)self rootController];
  [v3 removeObserver:self forKeyPath:@"hasExpandedSteps"];

  v4.receiver = self;
  v4.super_class = (Class)MacRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v4 dealloc];
}

- (id)keyCommands
{
  v9.receiver = self;
  v9.super_class = (Class)MacRoutePlanningOverviewViewController;
  v3 = [(ContaineeViewController *)&v9 keyCommands];
  id v4 = [v3 mutableCopy];

  if (sub_1000BBB44(self) == 5)
  {
    v5 = +[UIKeyCommand keyCommandWithInput:UIKeyInputLeftArrow modifierFlags:0 action:"arrowLeftPressed:"];
    [v4 addObject:v5];

    v6 = +[UIKeyCommand keyCommandWithInput:UIKeyInputRightArrow modifierFlags:0 action:"arrowRightPressed:"];
    [v4 addObject:v6];
  }
  id v7 = [v4 copy];

  return v7;
}

- (void)arrowRightPressed:(id)a3
{
  id v4 = [(MacRoutePlanningOverviewViewController *)self traitCollection];
  id v5 = [v4 layoutDirection];

  v6 = [(RoutePlanningOverviewViewController *)self rootController];
  id v7 = v6;
  if (v5 == (id)1) {
    [v6 collapseCurrentlyFocusedRoute];
  }
  else {
    [v6 expandCurrentlyFocusedRoute];
  }
}

- (void)arrowLeftPressed:(id)a3
{
  id v4 = [(MacRoutePlanningOverviewViewController *)self traitCollection];
  id v5 = [v4 layoutDirection];

  v6 = [(RoutePlanningOverviewViewController *)self rootController];
  id v7 = v6;
  if (v5 == (id)1) {
    [v6 expandCurrentlyFocusedRoute];
  }
  else {
    [v6 collapseCurrentlyFocusedRoute];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v12 = a3;
  uint64_t v5 = [v12 nextFocusedItem];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsTableViewController];
    objc_super v8 = [v12 nextFocusedItem];
    if (+[UIFocusSystem environment:v7 containsEnvironment:v8])
    {
    }
    else
    {
      objc_super v9 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
      v10 = [v12 nextFocusedItem];
      unsigned __int8 v11 = +[UIFocusSystem environment:v9 containsEnvironment:v10];

      if ((v11 & 1) == 0) {
        [(MacRoutePlanningOverviewViewController *)self setRouteSearchSuggestionsTableViewHidden:1];
      }
    }
  }
}

- (void)_setupSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)MacRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v54 _setupSubviews];
  v3 = [(RoutePlanningOverviewViewController *)self rootController];
  [v3 setScrollViewDelegate:self];

  id v4 = [(RoutePlanningOverviewViewController *)self rootController];
  [v4 setStepsListDelegate:self];

  uint64_t v5 = [(RoutePlanningOverviewViewController *)self rootController];
  [v5 addObserver:self forKeyPath:@"hasExpandedSteps" options:1 context:&unk_10160F2E8];

  objc_initWeak(&location, self);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10061C13C;
  v51[3] = &unk_1012E6708;
  objc_copyWeak(&v52, &location);
  v6 = [(RoutePlanningOverviewViewController *)self rootController];
  [v6 setPostReloadHandler:v51];

  id v7 = [(MacRoutePlanningOverviewViewController *)self view];
  objc_super v8 = [(ContaineeViewController *)self contentView];
  [v7 bringSubviewToFront:v8];

  objc_super v9 = [RoutePlanningTransitTimingControlsView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v13 = -[RoutePlanningTransitTimingControlsView initWithFrame:](v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(MacRoutePlanningOverviewViewController *)self setTimingControlsView:v13];

  v14 = [(MacRoutePlanningOverviewViewController *)self timingControlsView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = -[RoutePlanningOptionsBar initWithFrame:]([RoutePlanningOptionsBar alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(MacRoutePlanningOverviewViewController *)self setOptionsBar:v15];

  v16 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = objc_opt_new();
  [(MacRoutePlanningOverviewViewController *)self setChargingOptionsView:v17];

  v18 = [(MacRoutePlanningOverviewViewController *)self chargingOptionsView];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"Charging Options Description [Catalyst, Route Planning]", @"localized string not found", 0 value table];
  v21 = [(MacRoutePlanningOverviewViewController *)self chargingOptionsView];
  v22 = [v21 descriptionLabel];
  [v22 setText:v20];

  v23 = [(MacRoutePlanningOverviewViewController *)self chargingOptionsView];
  v24 = [v23 checkbox];
  [v24 addTarget:self action:"pressedAssumeFullCharge" forControlEvents:0x2000];

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10061C1C4;
  v49[3] = &unk_1012F23F0;
  objc_copyWeak(&v50, &location);
  v25 = [(MacRoutePlanningOverviewViewController *)self timingControlsView];
  [v25 setChangeHandler:v49];

  objc_copyWeak(&v48, &location);
  v26 = [(MacRoutePlanningOverviewViewController *)self timingControlsView];
  [v26 setLayoutHandler:&v47];

  v27 = [[RoutePlanningWaypointEditorViewController alloc] initWithWaypointInfoProvider:self];
  [(MacRoutePlanningOverviewViewController *)self setSearchFieldsViewController:v27];

  if (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0 || (MapsFeature_IsEnabled_Maps420()) {
    uint64_t IsEnabled_Maps182 = 1;
  }
  else {
    uint64_t IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
  }
  v29 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  [v29 setMprEnabled:IsEnabled_Maps182];

  v30 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  [(MacRoutePlanningOverviewViewController *)self addChildViewController:v30];

  v31 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  v32 = [v31 view];

  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v33 = objc_alloc((Class)UIStackView);
  v55[0] = v32;
  v34 = [(MacRoutePlanningOverviewViewController *)self timingControlsView];
  v55[1] = v34;
  v35 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
  v55[2] = v35;
  v36 = +[NSArray arrayWithObjects:v55 count:3];
  id v37 = [v33 initWithArrangedSubviews:v36];

  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v37 setAlignment:0];
  [v37 setAxis:1];
  [v37 setDistribution:0];
  [v37 setCustomSpacing:v32 afterView:14.0];
  v38 = [(MacRoutePlanningOverviewViewController *)self timingControlsView];
  [v37 setCustomSpacing:v38 afterView:12.0];

  v39 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v39 setTitleView:v37];

  [(MacRoutePlanningOverviewViewController *)self setHeaderStackView:v37];
  v40 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  [v40 didMoveToParentViewController:self];

  [(MacRoutePlanningOverviewViewController *)self _prepareRouteSearchControllers];
  v41 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  v42 = [v41 _headerTapGesture];
  [v42 setCancelsTouchesInView:0];

  v43 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v43 setTitleViewInsets:5.0, 16.0, 0.0, 16.0];

  v44 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
  v45 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v45 setAccessoryView:v44];

  v46 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v46 setAccessoryViewInsets:0.0, 16.0, 16.0, 16.0];

  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);
}

- (id)_initialConstraints
{
  v22.receiver = self;
  v22.super_class = (Class)MacRoutePlanningOverviewViewController;
  id v21 = [(RoutePlanningOverviewViewController *)&v22 _initialConstraints];
  v20 = [(RoutePlanningOverviewViewController *)self collectionView];
  v18 = [v20 topAnchor];
  v19 = [(ContaineeViewController *)self contentView];
  v17 = [v19 topAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v23[0] = v16;
  v15 = [(RoutePlanningOverviewViewController *)self collectionView];
  v14 = [v15 leadingAnchor];
  v3 = [(ContaineeViewController *)self contentView];
  id v4 = [v3 leadingAnchor];
  uint64_t v5 = [v14 constraintEqualToAnchor:v4];
  v23[1] = v5;
  v6 = [(RoutePlanningOverviewViewController *)self collectionView];
  id v7 = [v6 trailingAnchor];
  objc_super v8 = [(ContaineeViewController *)self contentView];
  objc_super v9 = [v8 trailingAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v23[2] = v10;
  unsigned __int8 v11 = [(RoutePlanningOverviewViewController *)self collectionViewToBottomConstraint];
  v23[3] = v11;
  id v12 = +[NSArray arrayWithObjects:v23 count:4];
  [v21 addObjectsFromArray:v12];

  return v21;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MacRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v4 viewWillAppear:a3];
  [(MacRoutePlanningOverviewViewController *)self _refreshRouteSearchFields];
  [(MacRoutePlanningOverviewViewController *)self _refreshDesiredTransportType];
  [(MacRoutePlanningOverviewViewController *)self _refreshOptionsVisibility];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MacRoutePlanningOverviewViewController;
  [(ContaineeViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  [v4 endEditingFields];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MacRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v8 viewDidDisappear:a3];
  objc_super v4 = objc_opt_new();
  v9[0] = v4;
  objc_super v5 = objc_opt_new();
  v9[1] = v5;
  v6 = +[NSArray arrayWithObjects:v9 count:2];
  id v7 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  [v7 setItems:v6];
}

- (void)willMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MacRoutePlanningOverviewViewController;
  [(MacRoutePlanningOverviewViewController *)&v4 willMoveToParentViewController:a3];
  [(MacRoutePlanningOverviewViewController *)self setRouteSearchSuggestionsTableViewHidden:1];
}

- (void)pressedAssumeFullCharge
{
  id v5 = +[VGVirtualGarageService sharedService];
  v3 = [(MacRoutePlanningOverviewViewController *)self chargingOptionsView];
  objc_super v4 = [v3 checkbox];
  [v5 virtualGarageSetAssumesFullCharge:[v4 isOn]];
}

- (double)heightForLayout:(unint64_t)a3
{
  v6 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v7 = [v6 routeCollection];
  id v8 = [v7 count];

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      goto LABEL_2;
    case 2uLL:
      v16 = [(RoutePlanningOverviewViewController *)self rootController];
      unsigned __int8 v17 = [v16 hasExpandedSteps];

      double v3 = -1.0;
      if (v17) {
        return v3;
      }
      if (v8) {
        goto LABEL_20;
      }
      v18 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      if ([v18 requestState] == (id)1)
      {
      }
      else
      {
        objc_super v22 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
        id v23 = [v22 requestState];

        if (v23 != (id)3) {
          return v3;
        }
      }
LABEL_20:
      [(RoutePlanningOverviewViewController *)self _fittingHeightForMediumLayout];
      double v25 = v24;
      [(MacRoutePlanningOverviewViewController *)self _routePlanningAdvisoryFooterViewHeight];
      return v25 + v26;
    case 3uLL:
    case 4uLL:
      if (!v8) {
        return -1.0;
      }
      objc_super v9 = [(RoutePlanningOverviewViewController *)self rootController];
      double v3 = -1.0;
      if ([v9 hasExpandedSteps])
      {
        v14 = [(ContaineeViewController *)self cardPresentationController];
        [v14 availableHeight];
        double v3 = v15;
      }
LABEL_3:

      return v3;
    case 5uLL:
      v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v27 = 136315650;
        v28 = "-[MacRoutePlanningOverviewViewController heightForLayout:]";
        __int16 v29 = 2080;
        v30 = "RoutePlanningOverviewViewController.m";
        __int16 v31 = 1024;
        int v32 = 3251;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v27, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        v20 = sub_1005762E4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v21 = +[NSThread callStackSymbols];
          int v27 = 138412290;
          v28 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);
        }
      }
LABEL_2:
      objc_super v9 = [(ContaineeViewController *)self cardPresentationController];
      [v9 bottomSafeOffset];
      double v11 = v10;
      [(ContaineeViewController *)self headerHeight];
      double v3 = v11 + v12 + 10.0;
      goto LABEL_3;
    default:
      return v3;
  }
}

- (double)_routePlanningAdvisoryFooterViewHeight
{
  if (!MapsFeature_IsEnabled_FrenchClimateLaw()) {
    return 0.0;
  }
  double v3 = [(RoutePlanningOverviewViewController *)self rootController];
  [v3 estimatedRoutePlanningAdvisoryFooterViewHeight];
  double v5 = v4;

  return v5;
}

- (void)willChangeLayout:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MacRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v11 willChangeLayout:"willChangeLayout:"];
  double v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containeeLayout];

  if (v6 && (unint64_t)v6 < a3)
  {
    id v7 = +[MKMapService sharedService];
    uint64_t v8 = [(RoutePlanningOverviewViewController *)self currentUITargetForAnalytics];
    objc_super v9 = v7;
    uint64_t v10 = 2;
LABEL_7:
    [v9 captureUserAction:v10 onTarget:v8 eventValue:0];

    return;
  }
  if (a3 && (unint64_t)v6 > a3)
  {
    id v7 = +[MKMapService sharedService];
    uint64_t v8 = [(RoutePlanningOverviewViewController *)self currentUITargetForAnalytics];
    objc_super v9 = v7;
    uint64_t v10 = 1;
    goto LABEL_7;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &unk_10160F2E8)
  {
    id v7 = [(RoutePlanningOverviewViewController *)self rootController];
    unsigned int v8 = [v7 hasExpandedSteps];

    objc_super v9 = [(ContaineeViewController *)self cardPresentationController];
    id v11 = v9;
    if (v8) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 2;
    }
    [v9 wantsLayout:v10];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MacRoutePlanningOverviewViewController;
    -[MacRoutePlanningOverviewViewController observeValueForKeyPath:ofObject:change:context:](&v12, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4
{
  id v5 = a4;
  id v6 = [(ControlContaineeViewController *)self delegate];
  [v6 clearMapSelection];

  [(MacRoutePlanningOverviewViewController *)self _showManeuverArrowsForStep:v5];
  id v14 = [v5 composedRoute];
  double v7 = sub_1008C018C(v5);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[MacRoutePlanningOverviewViewController _updateCurrentRouteDisplayedMapRect:forRoute:](self, "_updateCurrentRouteDisplayedMapRect:forRoute:", v14, v7, v9, v11, v13);
}

- (void)_updateCurrentRouteDisplayedMapRect:(id)a3 forRoute:(id)a4
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v6 = a3.var0.var1;
  double v7 = a3.var0.var0;
  double v9 = (char *)a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10061D024;
  v23[3] = &unk_1012E9418;
  void v23[4] = self;
  *(double *)&v23[5] = v7;
  *(double *)&v23[6] = v6;
  *(double *)&v23[7] = var0;
  *(double *)&v23[8] = var1;
  double v10 = objc_retainBlock(v23);
  double v11 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  double v12 = [v11 routeCollection];
  double v13 = [v12 currentRoute];

  if (v13 == v9)
  {
    ((void (*)(void *))v10[2])(v10);
  }
  else
  {
    id v14 = sub_1005768D4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Tapped a route step for a non-current route; switching current route",
        buf,
        2u);
    }

    double v15 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    v16 = [v15 routeCollection];
    id v17 = [v16 indexOfRoute:v9];

    if (v17 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        double v25 = "-[MacRoutePlanningOverviewViewController _updateCurrentRouteDisplayedMapRect:forRoute:]";
        __int16 v26 = 2080;
        int v27 = "RoutePlanningOverviewViewController.m";
        __int16 v28 = 1024;
        int v29 = 3322;
        __int16 v30 = 2080;
        __int16 v31 = "index != NSNotFound";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        v20 = sub_1005762E4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v21 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          double v25 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      objc_super v22 = sub_1005768D4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        double v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Could not find index of non-current composedRoute in route collection: %p", buf, 0xCu);
      }
    }
    else
    {
      v18 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
      [v18 updateCurrentRoute:v9];

      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }
}

- (void)directionsStepsListDidTapRAPButton:(id)a3
{
  double v4 = [(MacRoutePlanningOverviewViewController *)self _maps_platformController];
  id v5 = [v4 currentSession];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 || !v5)
  {
    double v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315906;
      id v14 = "-[MacRoutePlanningOverviewViewController directionsStepsListDidTapRAPButton:]";
      __int16 v15 = 2080;
      v16 = "RoutePlanningOverviewViewController.m";
      __int16 v17 = 1024;
      int v18 = 3338;
      __int16 v19 = 2080;
      v20 = "routePlanningSession != nil";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v13, 0x26u);
    }

    if (sub_100BB36BC())
    {
      double v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        double v12 = +[NSThread callStackSymbols];
        int v13 = 138412290;
        id v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  double v7 = +[MKMapService sharedService];
  [v7 captureUserAction:5013 onTarget:[self currentUITargetForAnalytics] eventValue:0];

  double v8 = [(MacRoutePlanningOverviewViewController *)self _maps_mapsSceneDelegate];
  double v9 = [v8 rapPresenter];
  [v9 presentReportAProblemForRouteFromEntryPoint:[self currentUITargetForAnalytics]];
}

- (void)directionsStepsList:(id)a3 didTapElevationInfoButton:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_1000BBB44(self) != 5)
  {
    double v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315906;
      int v13 = "-[MacRoutePlanningOverviewViewController directionsStepsList:didTapElevationInfoButton:]";
      __int16 v14 = 2080;
      __int16 v15 = "RoutePlanningOverviewViewController.m";
      __int16 v16 = 1024;
      int v17 = 3354;
      __int16 v18 = 2080;
      __int16 v19 = "MapsIdiomIsMac(self)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100BB36BC())
    {
      double v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        double v11 = +[NSThread callStackSymbols];
        int v12 = 138412290;
        int v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  if (sub_1000BBB44(self) == 5)
  {
    double v8 = [v6 route];
    [(MacRoutePlanningOverviewViewController *)self _presentElevationGraphForRoute:v8 fromView:v7];
  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapRowForItem:(id)a4
{
  id v6 = a3;
  [a4 displayedMapRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [v6 route];

  -[MacRoutePlanningOverviewViewController _updateCurrentRouteDisplayedMapRect:forRoute:](self, "_updateCurrentRouteDisplayedMapRect:forRoute:", v15, v8, v10, v12, v14);
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapClusteredVehiclesCell:(id)a4
{
  id v25 = a4;
  id v5 = [v25 clusteredVehicleItem];
  id v6 = [v5 clusteredSegment];

  if (v6)
  {
    double v7 = +[UIAlertController clusteredVehiclesSelectionAlertControllerForClusteredSegment:v6 completion:0];
    double v8 = [(MacRoutePlanningOverviewViewController *)self view];
    double v9 = [v7 popoverPresentationController];
    [v9 setSourceView:v8];

    double v10 = [(MacRoutePlanningOverviewViewController *)self view];
    [v25 bounds];
    [v10 convertRect:v25 fromView:];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    __int16 v19 = [v7 popoverPresentationController];
    [v19 setSourceRect:v12, v14, v16, v18];

    v20 = [v7 popoverPresentationController];
    [v20 setPermittedArrowDirections:12];

    [(MacRoutePlanningOverviewViewController *)self presentViewController:v7 animated:1 completion:0];
    id v21 = +[MKMapService sharedService];
    objc_super v22 = [v25 clusteredVehicleItem];
    id v23 = [v22 clusteredSegment];
    double v24 = MapsAnalyticsEventValueForClusteredSegment(v23);
    [v21 captureUserAction:3037 onTarget:606 eventValue:v24];
  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapIncidentsCell:(id)a4 withAdvisory:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  double v9 = [(ControlContaineeViewController *)self delegate];
  [v9 setRoutePlanningAdvisory:v7];

  double v10 = [(ControlContaineeViewController *)self delegate];
  [v10 setRoutePlanningIncidentsSourceView:v8];

  id v11 = [(ControlContaineeViewController *)self delegate];
  [v11 presentRoutePlanningViewType:5];
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didSelectTrip:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MKMapService sharedService];
  double v9 = [v7 displayedItemIndexForAnalytics];

  [v8 captureUserAction:9040 onTarget:606 eventValue:0 transitStep:v9];
  id v11 = [(ControlContaineeViewController *)self delegate];
  double v10 = [v6 matchingRouteStep];

  [v11 presentScheduleForStep:v10];
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapGetTicketsWithURL:(id)a4
{
  id v4 = a4;
  id v5 = +[MKMapService sharedService];
  id v6 = [v4 absoluteString];
  [v5 captureUserAction:6050 onTarget:647 eventValue:v6];

  id v7 = +[UIApplication sharedApplication];
  [v7 openURL:v4 withCompletionHandler:&stru_1012F2410];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 count])
  {
    id v8 = [(ContaineeViewController *)self cardPresentationController];
    id v9 = [v8 containeeLayout];

    if (v9 != (id)1)
    {
      double v10 = [(ContaineeViewController *)self cardPresentationController];
      [v10 wantsLayout:1];
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)MacRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v15 routePlanningDataCoordinator:v6 didUpdateRouteCollection:v7];
  id v11 = [v7 count];

  if (v11)
  {
    double v12 = [(ContaineeViewController *)self cardPresentationController];
    id v13 = [v12 containeeLayout];

    if (v13 == (id)1)
    {
      double v14 = [(ContaineeViewController *)self cardPresentationController];
      [v14 wantsExpandLayout];
    }
  }
  [(MacRoutePlanningOverviewViewController *)self _clearAlternateRouteManeuverArrows];
  [(MacRoutePlanningOverviewViewController *)self _refreshRouteSearchFields];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateResolvedWaypointSet:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MacRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v5 routePlanningDataCoordinator:a3 didUpdateResolvedWaypointSet:a4];
  [(MacRoutePlanningOverviewViewController *)self _refreshRouteSearchFields];
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransportType:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MacRoutePlanningOverviewViewController;
  [(RoutePlanningOverviewViewController *)&v10 routePlanningDataCoordinator:a3 didUpdateTransportType:a4];
  objc_super v5 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsContaineeViewController];
  id v6 = [v5 macMenuPresentationController];
  unsigned int v7 = [v6 isPresented];

  if (v7)
  {
    id v8 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsContaineeViewController];
    id v9 = [v8 macMenuPresentationController];
    [v9 dismissAnimated:1 completion:0];
  }
}

- (void)_showManeuverArrowsForStep:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 composedRoute];
  id v6 = [v5 steps];
  id v7 = [v6 indexOfObject:v4];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    double v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315906;
      __int16 v19 = "-[MacRoutePlanningOverviewViewController _showManeuverArrowsForStep:]";
      __int16 v20 = 2080;
      id v21 = "RoutePlanningOverviewViewController.m";
      __int16 v22 = 1024;
      int v23 = 3447;
      __int16 v24 = 2080;
      id v25 = "stepIndex != NSNotFound";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v18, 0x26u);
    }

    if (sub_100BB36BC())
    {
      objc_super v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        double v16 = +[NSThread callStackSymbols];
        int v18 = 138412290;
        __int16 v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
      }
    }
    double v17 = sub_1005768D4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 134217984;
      __int16 v19 = (const char *)v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Could not find the index for step %p", (uint8_t *)&v18, 0xCu);
    }

    [v5 setManeuverDisplayEnabled:0];
    id v8 = v5;
    id v9 = 0;
  }
  else
  {
    [v5 setManeuverDisplayEnabled:1];
    id v8 = v5;
    id v9 = v7;
  }
  [v8 setCurrentDisplayStep:v9];
  objc_super v10 = [(ControlContaineeViewController *)self delegate];
  id v11 = [v10 routeAnnotationsController];
  double v12 = [v11 mapView];
  id v13 = [v12 _mapLayer];
  [v13 forceLayout];
}

- (void)_clearAlternateRouteManeuverArrows
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v3 routeCollection];
  objc_super v5 = [v4 alternateRoutes];

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v10 setManeuverDisplayEnabled:0];
        [v10 setCurrentDisplayStep:0];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v11 = [(ControlContaineeViewController *)self delegate];
  double v12 = [v11 routeAnnotationsController];
  id v13 = [v12 mapView];
  double v14 = [v13 _mapLayer];
  [v14 forceLayout];
}

- (void)_forceChangeOrigin
{
  id v2 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  [v2 selectFromField];
}

- (void)_refreshDesiredTransportType
{
  double v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v3 desiredTransportType];

  if (v4)
  {
    objc_super v5 = [(RoutePlanningOverviewViewController *)self transportTypePicker];
    id v6 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    [v5 setSelectedType:[v6 desiredTransportType]];

    [(MacRoutePlanningOverviewViewController *)self _refreshTimingDisplay];
  }
}

- (void)_refreshRouteSearchFields
{
  double v3 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];

  if (!v3)
  {
    __int16 v20 = sub_1005762E4();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = +[NSString stringWithFormat:@"Route search fields should have been setup in viewDidLoad"];
      int v24 = 136316162;
      id v25 = "-[MacRoutePlanningOverviewViewController _refreshRouteSearchFields]";
      __int16 v26 = 2080;
      int v27 = "RoutePlanningOverviewViewController.m";
      __int16 v28 = 1024;
      int v29 = 3485;
      __int16 v30 = 2080;
      __int16 v31 = "self.searchFieldsViewController != nil";
      __int16 v32 = 2112;
      id v33 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v24, 0x30u);
    }
    if (sub_100BB36BC())
    {
      __int16 v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = +[NSThread callStackSymbols];
        int v24 = 138412290;
        id v25 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);
      }
    }
  }
  id v4 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  uint64_t v5 = 0;
  switch((unint64_t)[v4 desiredTransportType])
  {
    case 0uLL:
      if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0 && (MapsFeature_IsEnabled_Maps420() & 1) == 0) {
        goto LABEL_6;
      }
      uint64_t v5 = 1;
      break;
    case 1uLL:
      uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
      goto LABEL_9;
    case 2uLL:
LABEL_6:
      uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps182();
      goto LABEL_9;
    case 5uLL:
      uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps420();
LABEL_9:
      uint64_t v5 = IsEnabled_DrivingMultiWaypointRoutes;
      break;
    default:
      break;
  }
  id v7 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  [v7 setMprEnabled:v5];

  uint64_t v8 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v9 = [v8 directionItemForCurrentSession];

  objc_super v10 = [v9 items];
  id v11 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  [v11 setItems:v10];

  double v12 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  id v13 = [v12 items];
  id v14 = [v13 count];
  long long v15 = [v9 items];
  id v16 = [v15 count];

  long long v17 = [v9 items];
  long long v18 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  [v18 setItems:v17];

  if (v14 != v16)
  {
    __int16 v19 = [(ContaineeViewController *)self cardPresentationController];
    [v19 updateHeightForCurrentLayout];
  }
}

- (void)_refreshOptionsVisibility
{
  double v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  uint64_t v4 = 0;
  switch((unint64_t)[v3 desiredTransportType])
  {
    case 0uLL:
      if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0 && (MapsFeature_IsEnabled_Maps420() & 1) == 0) {
        goto LABEL_5;
      }
      uint64_t v4 = 1;
      break;
    case 1uLL:
      uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
      goto LABEL_8;
    case 2uLL:
LABEL_5:
      uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps182();
      goto LABEL_8;
    case 5uLL:
      uint64_t IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_Maps420();
LABEL_8:
      uint64_t v4 = IsEnabled_DrivingMultiWaypointRoutes;
      break;
    default:
      break;
  }
  id v6 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  [v6 setMprEnabled:v4];

  id v7 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  unint64_t v8 = (unint64_t)[v7 desiredTransportType];

  if (v8 <= 5 && ((1 << v8) & 0x2E) != 0)
  {
    objc_initWeak(&location, self);
    id v9 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
    objc_super v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"Options [Catalyst, Route Planning]", @"localized string not found", 0 value table];
    int v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    int v29 = sub_10061E648;
    __int16 v30 = &unk_1012E6708;
    objc_copyWeak(&v31, &location);
    [v9 setButtonTitle:v11 actionHandler:&v27];

    double v12 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
    [v12 setHidden:0];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  else
  {
    id v13 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
    [v13 setButtonTitle:0 actionHandler:0];

    id v14 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
    [v14 setHidden:1];
  }
  long long v15 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
  [v15 titleViewInsets];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  int v24 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
  if ([v24 isHidden]) {
    double v25 = 10.0;
  }
  else {
    double v25 = 0.0;
  }

  if (vabdd_f64(v25, v21) > 2.22044605e-16)
  {
    __int16 v26 = [(RoutePlanningOverviewViewController *)self containerHeaderView];
    [v26 setTitleViewInsets:v17, v19, v25, v23];
  }
}

- (void)_refreshTimingDisplay
{
  if (MapsFeature_IsEnabled_Maps357RoutePlanning()) {
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A7E40, &off_1013A7E10, 0);
  }
  else {
  double v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A7E40, 0, v20);
  }
  uint64_t v4 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  uint64_t v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 transportType]);
  if ([v3 containsObject:v5])
  {

LABEL_10:
    objc_super v10 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v11 = [v10 timing];

    double v12 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
    id v13 = [v12 routeCollection];
    id v14 = [v13 currentRoute];

    if (v14) {
      uint64_t v15 = (uint64_t)[v14 shouldShowSchedule];
    }
    else {
      uint64_t v15 = 1;
    }
    double v16 = [(MacRoutePlanningOverviewViewController *)self timingControlsView];
    [v16 setHidden:0];

    goto LABEL_15;
  }
  if (MapsFeature_IsEnabled_Maps357RoutePlanning()) {
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A7E40, &off_1013A7E10, 0);
  }
  else {
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013A7E40, 0, v21);
  }
  id v7 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  unint64_t v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 desiredTransportType]);
  unsigned int v9 = [v6 containsObject:v8];

  if (v9) {
    goto LABEL_10;
  }
  id v14 = [(MacRoutePlanningOverviewViewController *)self timingControlsView];
  uint64_t v15 = 1;
  [v14 setHidden:1];
  id v11 = 0;
LABEL_15:

  double v17 = [(MacRoutePlanningOverviewViewController *)self timingControlsView];
  [v17 setSelectedTiming:v11];

  double v18 = [(MacRoutePlanningOverviewViewController *)self timingControlsView];
  [v18 setShowSchedulingButtons:v15];

  double v19 = sub_1005768D4();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    double v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Updating timing to: %@", buf, 0xCu);
  }
}

- (void)_refreshSelectedVehicleDisplay
{
  double v3 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  id v4 = [v3 desiredTransportType];

  if (v4 == (id)1)
  {
    if ((MapsFeature_IsEnabled_EVRouting() & 1) != 0 || MapsFeature_IsEnabled_Alberta())
    {
      uint64_t v5 = [(VGVirtualGarage *)self->super._virtualGarage vehicles];
      BOOL v6 = [v5 count] != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
    int v19 = IsEVRoutingSupported();
    int IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta();
    double v16 = [(VGVirtualGarage *)self->super._virtualGarage selectedVehicle];
    uint64_t v21 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
    [v21 setSummaryText:0];

    double v22 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
    [v22 setVehicle:v16];

    unsigned int v23 = [v16 isPureElectricVehicle];
    int v24 = [(MacRoutePlanningOverviewViewController *)self chargingOptionsView];
    double v25 = v24;
    if (v23 && v6 && v19 | IsEnabled_Alberta)
    {
      if (!v24) {
        goto LABEL_19;
      }
      __int16 v26 = [(MacRoutePlanningOverviewViewController *)self headerStackView];
      int v27 = [v26 arrangedSubviews];
      uint64_t v28 = [(MacRoutePlanningOverviewViewController *)self chargingOptionsView];
      unsigned __int8 v29 = [v27 containsObject:v28];

      if (v29) {
        goto LABEL_19;
      }
      double v25 = [(MacRoutePlanningOverviewViewController *)self headerStackView];
      __int16 v30 = [(MacRoutePlanningOverviewViewController *)self chargingOptionsView];
      [v25 addArrangedSubview:v30];
    }
    else
    {
      [v24 removeFromSuperview];
    }

LABEL_19:
    double v17 = sub_1005768D4();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
LABEL_22:

      goto LABEL_27;
    }
    double v18 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
    id v31 = [v18 vehicle];
    int v36 = 138412290;
    id v37 = v31;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Updating summary to vehicle: %@", (uint8_t *)&v36, 0xCu);

LABEL_21:
    goto LABEL_22;
  }
  id v7 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  if ([v7 desiredTransportType] != (id)5) {
    goto LABEL_24;
  }
  unint64_t v8 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  unsigned int v9 = [v8 cyclePreferences];
  if (([v9 ebike] & 1) == 0)
  {

LABEL_24:
LABEL_25:
    __int16 v32 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
    [v32 setVehicle:0];

    id v33 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
    [v33 setSummaryText:0];

    v34 = [(MacRoutePlanningOverviewViewController *)self chargingOptionsView];
    [v34 removeFromSuperview];

    double v16 = sub_1005768D4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v36) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Removing summary", (uint8_t *)&v36, 2u);
    }
    goto LABEL_27;
  }
  int v10 = sub_10050B708();

  if (!v10) {
    goto LABEL_25;
  }
  id v11 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
  [v11 setVehicle:0];

  double v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"e-bike [RoutePlanning, Catalyst]", @"localized string not found", 0 value table];
  id v14 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
  [v14 setSummaryText:v13];

  uint64_t v15 = [(MacRoutePlanningOverviewViewController *)self chargingOptionsView];
  [v15 removeFromSuperview];

  double v16 = sub_1005768D4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    double v17 = [(MacRoutePlanningOverviewViewController *)self optionsBar];
    double v18 = [v17 summaryText];
    int v36 = 138412290;
    id v37 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Updating summary to: %@", (uint8_t *)&v36, 0xCu);
    goto LABEL_21;
  }
LABEL_27:

  v35 = [(ContaineeViewController *)self cardPresentationController];
  [v35 updateHeightForCurrentLayout];
}

- (void)_prepareRouteSearchControllers
{
  double v3 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];

  if (!v3)
  {
    v40 = sub_1005762E4();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = +[NSString stringWithFormat:@"Route search fields should have been setup in viewDidLoad"];
      *(_DWORD *)id location = 136316162;
      *(void *)&location[4] = "-[MacRoutePlanningOverviewViewController _prepareRouteSearchControllers]";
      __int16 v50 = 2080;
      v51 = "RoutePlanningOverviewViewController.m";
      __int16 v52 = 1024;
      int v53 = 3590;
      __int16 v54 = 2080;
      v55 = "self.searchFieldsViewController != nil";
      __int16 v56 = 2112;
      v57 = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", location, 0x30u);
    }
    if (sub_100BB36BC())
    {
      v42 = sub_1005762E4();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = +[NSThread callStackSymbols];
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v43;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
      }
    }
  }
  id v4 = objc_alloc_init(RouteWaypointSuggestionsTableViewController);
  [(MacRoutePlanningOverviewViewController *)self setRouteSearchSuggestionsTableViewController:v4];

  uint64_t v5 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsTableViewController];
  [v5 setRestoresFocusAfterTransition:0];

  BOOL v6 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsTableViewController];
  id v7 = [v6 tableView];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  unint64_t v8 = +[UIColor clearColor];
  [v7 setBackgroundColor:v8];

  [v7 setSeparatorStyle:0];
  [v7 setRemembersLastFocusedIndexPath:0];
  LODWORD(v9) = 1132068864;
  [v7 setContentCompressionResistancePriority:1 forAxis:v9];
  LODWORD(v10) = 1144750080;
  [v7 setContentHuggingPriority:1 forAxis:v10];
  id v11 = [RouteSearchViewController alloc];
  double v12 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  id v13 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsTableViewController];
  id v14 = [(ControlContaineeViewController *)self delegate];
  uint64_t v15 = [(RoutePlanningOverviewViewController *)self dataCoordinator];
  double v16 = [(RouteSearchViewController *)v11 initWithWaypointEditor:v12 suggestionsTableView:v13 delegate:v14 dataCoordinator:v15];
  [(MacRoutePlanningOverviewViewController *)self setRouteSearchViewController:v16];

  objc_initWeak((id *)location, self);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10061F3C8;
  v46[3] = &unk_1012E6998;
  objc_copyWeak(&v47, (id *)location);
  double v17 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsTableViewController];
  [v17 setTableViewDidReloadHandler:v46];

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10061F418;
  v44[3] = &unk_1012E6708;
  objc_copyWeak(&v45, (id *)location);
  double v18 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  [v18 setIntrinsicContentSizeInvalidationHandler:v44];

  int v19 = [MenuContaineeViewController alloc];
  uint64_t v20 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsTableViewController];
  uint64_t v21 = [(MenuContaineeViewController *)v19 initWithContentViewController:v20];
  [(MacRoutePlanningOverviewViewController *)self setRouteSearchSuggestionsContaineeViewController:v21];

  double v22 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsTableViewController];
  unsigned int v23 = [v22 tableView];
  int v24 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsContaineeViewController];
  [v24 setTrackedScrollview:v23];

  double v25 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  __int16 v26 = [v25 layoutGuideForCurrentlyEditingField];
  int v27 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsContaineeViewController];
  uint64_t v28 = [v27 macMenuPresentationController];
  [v28 setAnchorLayoutGuide:v26];

  unsigned __int8 v29 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  __int16 v30 = [v29 layoutGuideForCurrentlyEditingField];
  id v31 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsContaineeViewController];
  __int16 v32 = [v31 macMenuPresentationController];
  [v32 setWidthLayoutGuide:v30];

  id v33 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
  v34 = [v33 view];
  id v48 = v34;
  v35 = +[NSArray arrayWithObjects:&v48 count:1];
  int v36 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsContaineeViewController];
  id v37 = [v36 macMenuPresentationController];
  [v37 setPassThroughViews:v35];

  v38 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsContaineeViewController];
  v39 = [v38 macMenuPresentationController];
  [v39 addObserver:self];

  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak((id *)location);
}

- (BOOL)isRouteSearchSuggestionsTableViewHidden
{
  double v3 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsTableViewController];
  if ([v3 isViewLoaded])
  {
    id v4 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsTableViewController];
    uint64_t v5 = [v4 view];
    BOOL v6 = [v5 window];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)setRouteSearchSuggestionsTableViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsContaineeViewController];

  if (!v5)
  {
    double v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = +[NSString stringWithFormat:@"Route search suggestions containee should have been setup in viewDidLoad"];
      int v22 = 136316162;
      unsigned int v23 = "-[MacRoutePlanningOverviewViewController setRouteSearchSuggestionsTableViewHidden:]";
      __int16 v24 = 2080;
      double v25 = "RoutePlanningOverviewViewController.m";
      __int16 v26 = 1024;
      int v27 = 3637;
      __int16 v28 = 2080;
      unsigned __int8 v29 = "self.routeSearchSuggestionsContaineeViewController != nil";
      __int16 v30 = 2112;
      id v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v22, 0x30u);
    }
    if (sub_100BB36BC())
    {
      uint64_t v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = +[NSThread callStackSymbols];
        int v22 = 138412290;
        unsigned int v23 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);
      }
    }
  }
  if (v3)
  {
    if ([(MacRoutePlanningOverviewViewController *)self isRouteSearchSuggestionsTableViewHidden])
    {
      return;
    }
    unsigned int v6 = 1;
  }
  else
  {
    BOOL v7 = +[NSUserDefaults standardUserDefaults];
    unsigned int v6 = [v7 BOOLForKey:@"__internal_DisableMacRoutingAutocomplete"];

    if (v6 == [(MacRoutePlanningOverviewViewController *)self isRouteSearchSuggestionsTableViewHidden])return; {
  }
    }
  unint64_t v8 = [(MacRoutePlanningOverviewViewController *)self view];
  double v9 = [v8 window];

  if (v9)
  {
    double v10 = [(MacRoutePlanningOverviewViewController *)self searchFieldsViewController];
    id v11 = [v10 focusGroupIdentifierForCurrentlyEditingField];
    double v12 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsTableViewController];
    id v13 = [v12 tableView];
    [v13 setFocusGroupIdentifier:v11];

    id v14 = [(ControlContaineeViewController *)self delegate];
    uint64_t v15 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsContaineeViewController];
    if (v6) {
      [v14 viewController:v15 dismissMenuControllerAnimated:1];
    }
    else {
      -[NSObject viewController:presentMenuController:animated:fromChrome:completion:](v14, "viewController:presentMenuController:animated:fromChrome:completion:", self, v15, 1, -[ContainerViewController delaysFirstCardPresentation]_0() ^ 1, &stru_1012F2430);
    }

LABEL_16:
    return;
  }
  double v16 = sub_1005762E4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v22 = 136315650;
    unsigned int v23 = "-[MacRoutePlanningOverviewViewController setRouteSearchSuggestionsTableViewHidden:]";
    __int16 v24 = 2080;
    double v25 = "RoutePlanningOverviewViewController.m";
    __int16 v26 = 1024;
    int v27 = 3648;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v22, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    id v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      double v17 = +[NSThread callStackSymbols];
      int v22 = 138412290;
      unsigned int v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_16;
  }
}

- (void)_presentElevationGraphForRoute:(id)a3 fromView:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  elevationPopoverController = self->_elevationPopoverController;
  if (v15)
  {
    if (!elevationPopoverController)
    {
      unint64_t v8 = objc_alloc_init(RoutePlanningElevationPopoverViewController);
      double v9 = self->_elevationPopoverController;
      self->_elevationPopoverController = v8;

      [(RoutePlanningElevationPopoverViewController *)self->_elevationPopoverController setModalPresentationStyle:7];
      double v10 = [(RoutePlanningElevationPopoverViewController *)self->_elevationPopoverController popoverPresentationController];
      [v10 setPermittedArrowDirections:12];

      id v11 = [(RoutePlanningElevationPopoverViewController *)self->_elevationPopoverController popoverPresentationController];
      [v11 setDelegate:self];

      [(RoutePlanningElevationPopoverViewController *)self->_elevationPopoverController setDefinesPresentationContext:1];
      elevationPopoverController = self->_elevationPopoverController;
    }
  }
  else if (elevationPopoverController)
  {
    [(RoutePlanningElevationPopoverViewController *)elevationPopoverController dismissViewControllerAnimated:1 completion:0];
    double v12 = self->_elevationPopoverController;
    self->_elevationPopoverController = 0;

    goto LABEL_8;
  }
  id v13 = [(RoutePlanningElevationPopoverViewController *)elevationPopoverController popoverPresentationController];
  [v13 setSourceView:v6];

  [(RoutePlanningElevationPopoverViewController *)self->_elevationPopoverController setRoute:v15];
  id v14 = [(RoutePlanningElevationPopoverViewController *)self->_elevationPopoverController presentingViewController];

  if (!v14) {
    [(MacRoutePlanningOverviewViewController *)self presentViewController:self->_elevationPopoverController animated:1 completion:0];
  }
LABEL_8:
}

- (void)presentationControllerWillDismiss:(id)a3
{
  elevationPopoverController = self->_elevationPopoverController;
  id v5 = a3;
  id v6 = [(RoutePlanningElevationPopoverViewController *)elevationPopoverController popoverPresentationController];

  if (v6 == v5)
  {
    BOOL v7 = self->_elevationPopoverController;
    self->_elevationPopoverController = 0;
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  id v8 = +[MKMapService sharedService];
  if (y <= 0.0) {
    uint64_t v7 = 7;
  }
  else {
    uint64_t v7 = 8;
  }
  [v8 captureUserAction:v7 onTarget:[self currentUITargetForAnalytics] eventValue:0];
}

- (void)macMenuPresentationControllerDidDismiss:(id)a3
{
  id v3 = [(MacRoutePlanningOverviewViewController *)self routeSearchSuggestionsTableViewController];
  [v3 reset];
}

- (RouteSearchViewController)routeSearchViewController
{
  return self->_routeSearchViewController;
}

- (void)setRouteSearchViewController:(id)a3
{
}

- (RoutePlanningWaypointEditorViewController)searchFieldsViewController
{
  return self->_searchFieldsViewController;
}

- (void)setSearchFieldsViewController:(id)a3
{
}

- (RoutePlanningTransitTimingControlsView)timingControlsView
{
  return self->_timingControlsView;
}

- (void)setTimingControlsView:(id)a3
{
}

- (RoutePlanningOptionsBar)optionsBar
{
  return self->_optionsBar;
}

- (void)setOptionsBar:(id)a3
{
}

- (RoutePlanningEVChargeOptionsView)chargingOptionsView
{
  return self->_chargingOptionsView;
}

- (void)setChargingOptionsView:(id)a3
{
}

- (UIStackView)headerStackView
{
  return self->_headerStackView;
}

- (void)setHeaderStackView:(id)a3
{
}

- (RouteWaypointSuggestionsTableViewController)routeSearchSuggestionsTableViewController
{
  return self->_routeSearchSuggestionsTableViewController;
}

- (void)setRouteSearchSuggestionsTableViewController:(id)a3
{
}

- (NSTimer)routeSearchSuggestionsToggleTimer
{
  return self->_routeSearchSuggestionsToggleTimer;
}

- (void)setRouteSearchSuggestionsToggleTimer:(id)a3
{
}

- (MenuContaineeViewController)routeSearchSuggestionsContaineeViewController
{
  return self->_routeSearchSuggestionsContaineeViewController;
}

- (void)setRouteSearchSuggestionsContaineeViewController:(id)a3
{
}

- (RoutePlanningElevationPopoverViewController)elevationPopoverController
{
  return self->_elevationPopoverController;
}

- (void)setElevationPopoverController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevationPopoverController, 0);
  objc_storeStrong((id *)&self->_routeSearchSuggestionsContaineeViewController, 0);
  objc_storeStrong((id *)&self->_routeSearchSuggestionsToggleTimer, 0);
  objc_storeStrong((id *)&self->_routeSearchSuggestionsTableViewController, 0);
  objc_storeStrong((id *)&self->_headerStackView, 0);
  objc_storeStrong((id *)&self->_chargingOptionsView, 0);
  objc_storeStrong((id *)&self->_optionsBar, 0);
  objc_storeStrong((id *)&self->_timingControlsView, 0);
  objc_storeStrong((id *)&self->_searchFieldsViewController, 0);

  objc_storeStrong((id *)&self->_routeSearchViewController, 0);
}

@end