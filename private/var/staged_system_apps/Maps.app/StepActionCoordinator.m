@interface StepActionCoordinator
- (AppCoordinator)appCoordinator;
- (BOOL)canSelectVKLabelMarker:(id)a3;
- (BOOL)isAuthorizedForPreciseLocation;
- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5;
- (BOOL)pptTestCanUpdateTrayLayout;
- (BOOL)pptTestHasNextStep;
- (BOOL)pptTestIsTrayType:(int64_t)a3;
- (BOOL)pptTestMoveToBoardStep;
- (BOOL)pptTestSupportStepping;
- (GEOMapServiceTraits)newTraits;
- (MKLocationManager)locationManager;
- (NavTrayViewController)trayContaineeViewController;
- (PlaceCardViewController)placeCardViewController;
- (RouteStepListViewController)directionsStepsViewController;
- (StepActionCoordinator)initWithContainerViewController:(id)a3;
- (StepContainerViewController)containerViewController;
- (UIScrollView)pptTestScrollView;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int64_t)displayedViewMode;
- (int64_t)pptTestCurrentStepIndex;
- (unint64_t)originalLayoutForViewController:(id)a3;
- (void)_presentAdvisory:(id)a3;
- (void)_presentIncidents:(id)a3;
- (void)_presentPlaceCardViewControllerForMapItem:(id)a3 modally:(BOOL)a4;
- (void)_presentRouteDetailsVC;
- (void)_shareRoute:(id)a3 sourceView:(id)a4;
- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4;
- (void)deselectVKLabelMarker:(id)a3;
- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4;
- (void)directionsStepsListDidTapRAPButton:(id)a3;
- (void)directionsStepsListDidTapShareButton:(id)a3;
- (void)placeCardViewController:(id)a3 openURL:(id)a4;
- (void)placeCardViewController:(id)a3 showTransitIncidents:(id)a4;
- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4;
- (void)pptTestEndNavigation;
- (void)pptTestMoveToNextStep;
- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4;
- (void)pressedEndWithSender:(id)a3;
- (void)pressedShowDirectionsListWithSender:(id)a3;
- (void)pressedShowOverviewWithSender:(id)a3;
- (void)pressedZoomToManeuverWithSender:(id)a3;
- (void)selectVKLabelMarker:(id)a3;
- (void)setAppCoordinator:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setDirectionsStepsViewController:(id)a3;
- (void)setPlaceCardViewController:(id)a3;
- (void)showVLF;
- (void)viewController:(id)a3 presentIncidents:(id)a4;
- (void)viewController:(id)a3 showOverview:(BOOL)a4 zoomToMapRegion:(BOOL)a5;
- (void)viewControllerPresentTray:(id)a3;
@end

@implementation StepActionCoordinator

- (StepActionCoordinator)initWithContainerViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)StepActionCoordinator;
  v5 = [(StepActionCoordinator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_containerViewController, v4);
  }

  return v6;
}

- (void)setAppCoordinator:(id)a3
{
  id obj = a3;
  p_appCoordinator = &self->_appCoordinator;
  id WeakRetained = objc_loadWeakRetained((id *)p_appCoordinator);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_appCoordinator, obj);
    v6 = obj;
  }
}

- (BOOL)isAuthorizedForPreciseLocation
{
  v2 = [(StepActionCoordinator *)self locationManager];
  unsigned __int8 v3 = [v2 isLocationServicesApproved];
  char v4 = v3 & [v2 isAuthorizedForPreciseLocation];

  return v4;
}

- (MKLocationManager)locationManager
{
  locationManager = self->_locationManager;
  if (!locationManager)
  {
    char v4 = (MKLocationManager *)objc_alloc_init((Class)MKLocationManager);
    v5 = self->_locationManager;
    self->_locationManager = v4;

    locationManager = self->_locationManager;
  }

  return locationManager;
}

- (void)pressedEndWithSender:(id)a3
{
  id v3 = [(StepActionCoordinator *)self appCoordinator];
  [v3 endNavigationAndReturnToRoutePlanning:0];
}

- (void)viewControllerPresentTray:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  char v4 = [(StepActionCoordinator *)self trayContaineeViewController];
  [WeakRetained presentController:v4 animated:0];
}

- (void)viewController:(id)a3 presentIncidents:(id)a4
{
}

- (void)pressedShowDirectionsListWithSender:(id)a3
{
}

- (void)pressedShowOverviewWithSender:(id)a3
{
}

- (void)pressedZoomToManeuverWithSender:(id)a3
{
}

- (void)viewController:(id)a3 showOverview:(BOOL)a4 zoomToMapRegion:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  objc_super v8 = [(StepActionCoordinator *)self containerViewController];
  [v8 showOverview:v6 andZoomToMapRegion:v5];

  v9 = [(StepActionCoordinator *)self containerViewController];
  v10 = [v9 currentViewController];
  v11 = [(StepActionCoordinator *)self trayContaineeViewController];

  if (v10 == v11)
  {
    id v13 = [(StepActionCoordinator *)self trayContaineeViewController];
    v12 = [v13 cardPresentationController];
    [v12 wantsLayout:1];
  }
}

- (void)showVLF
{
  id v3 = [(StepActionCoordinator *)self containerViewController];
  char v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v17 = [(StepActionCoordinator *)self containerViewController];
    BOOL v6 = [v17 currentViewController];
    [v6 handleVLFPuckTapped];
  }
  else
  {
    objc_initWeak(&location, self);
    v7 = [(StepActionCoordinator *)self containerViewController];
    objc_super v8 = [(StepActionCoordinator *)self appCoordinator];
    v9 = [v8 baseActionCoordinator];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100647E20;
    v18[3] = &unk_1012E6998;
    objc_copyWeak(&v19, &location);
    unsigned __int8 v10 = [v7 showVLFCrowdsourcingPermissionCardWithContaineeDelegate:self delegate:v9 completion:v18];

    if ((v10 & 1) == 0)
    {
      v11 = [(StepActionCoordinator *)self containerViewController];
      v12 = [v11 chromeViewController];
      id v13 = [v12 userLocationView];

      if ([v13 isVLFBannerVisible]) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = [v13 isVLFPuckVisible];
      }
      v15 = [[VLFContaineeViewController alloc] initWithEntryPoint:v14];
      [(ContaineeViewController *)v15 setContaineeDelegate:self];
      v16 = [(StepActionCoordinator *)self containerViewController];
      [v16 presentController:v15];
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_4:
      unint64_t v4 = 3;
      goto LABEL_12;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [v3 cardPresentationController];
      unsigned __int8 v6 = [v5 presentedModally];

      if (v6)
      {
        unint64_t v4 = 5;
        goto LABEL_12;
      }
      v7 = +[UIDevice currentDevice];
      if ([v7 userInterfaceIdiom] == (id)1)
      {

        goto LABEL_4;
      }
      objc_super v8 = +[UIDevice currentDevice];
      id v9 = [v8 userInterfaceIdiom];

      if (v9 == (id)5) {
        goto LABEL_4;
      }
    }
    unint64_t v4 = 2;
    goto LABEL_12;
  }
  unint64_t v4 = 1;
LABEL_12:

  return v4;
}

- (void)selectVKLabelMarker:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)MKMapItem) _initWithLabelMarker:v4];

  [(StepActionCoordinator *)self _presentPlaceCardViewControllerForMapItem:v5 modally:0];
}

- (BOOL)canSelectVKLabelMarker:(id)a3
{
  id v3 = a3;
  if ([v3 isTransitLine])
  {
    char v4 = 0;
  }
  else
  {
    id v5 = [v3 waypointInfo];
    unsigned __int8 v6 = [v5 waypoint];

    objc_opt_class();
    char v4 = objc_opt_isKindOfClass() ^ 1;
  }
  return v4 & 1;
}

- (void)deselectVKLabelMarker:(id)a3
{
  char v4 = [(StepActionCoordinator *)self containerViewController];
  id v6 = [v4 currentViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(StepActionCoordinator *)self containerViewController];
    [v5 popLastViewControllerAnimated:1];
  }
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(StepActionCoordinator *)self containerViewController];
    objc_super v8 = [v7 chromeViewController];
    id v9 = [v8 mapView];
    [v9 _deselectLabelMarkerAnimated:1];
  }
  id v10 = [(StepActionCoordinator *)self containerViewController];
  [v10 popLastViewControllerAnimated:1];
}

- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4
{
  p_containerViewController = &self->_containerViewController;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  objc_super v8 = [(StepActionCoordinator *)self trayContaineeViewController];
  [WeakRetained presentController:v8];

  id v9 = objc_loadWeakRetained((id *)p_containerViewController);
  [v9 updateWithDisplayedStep:v6];
}

- (void)directionsStepsListDidTapShareButton:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  char v4 = [WeakRetained route];
  id v5 = [(StepActionCoordinator *)self directionsStepsViewController];
  id v6 = [v5 view];
  [(StepActionCoordinator *)self _shareRoute:v4 sourceView:v6];
}

- (void)directionsStepsListDidTapRAPButton:(id)a3
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v5 = [WeakRetained route];
  unsigned int v6 = [v5 transportType] - 1;
  if (v6 > 5) {
    uint64_t v7 = 608;
  }
  else {
    uint64_t v7 = dword_100F70170[v6];
  }

  objc_super v8 = +[MKMapService sharedService];
  [v8 captureUserAction:5013 onTarget:v7 eventValue:0];

  id v11 = objc_loadWeakRetained((id *)p_containerViewController);
  id v9 = [v11 _maps_mapsSceneDelegate];
  id v10 = [v9 rapPresenter];
  [v10 presentReportAProblemForRouteFromEntryPoint:v7];
}

- (void)_shareRoute:(id)a3 sourceView:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v9 = [(StepActionCoordinator *)self appCoordinator];
    objc_super v8 = +[ShareItem shareItemWithRoute:v7 includeRoutingApps:0];

    [v9 shareItem:v8 sourceView:v6 completion:0];
  }
}

- (GEOMapServiceTraits)newTraits
{
  v2 = [(StepActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  char v4 = [v3 currentTraits];

  return v4;
}

- (int64_t)displayedViewMode
{
  v2 = [(StepActionCoordinator *)self containerViewController];
  id v3 = [v2 chromeViewController];
  id v4 = [v3 displayedViewMode];

  return (int64_t)v4;
}

- (void)placeCardViewController:(id)a3 showTransitIncidents:(id)a4
{
}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  return 0;
}

- (NavTrayViewController)trayContaineeViewController
{
  trayContaineeViewController = self->_trayContaineeViewController;
  if (!trayContaineeViewController)
  {
    id v4 = [NavTrayViewController alloc];
    id v5 = [(StepActionCoordinator *)self appCoordinator];
    id v6 = [v5 platformController];
    id v7 = [(NavTrayViewController *)v4 initForSteppingWithDelegate:self platformController:v6];
    objc_super v8 = self->_trayContaineeViewController;
    self->_trayContaineeViewController = v7;

    id v9 = [(NavTrayViewController *)self->_trayContaineeViewController view];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    trayContaineeViewController = self->_trayContaineeViewController;
  }

  return trayContaineeViewController;
}

- (RouteStepListViewController)directionsStepsViewController
{
  directionsStepsViewController = self->_directionsStepsViewController;
  if (!directionsStepsViewController)
  {
    id v4 = [RouteStepListViewController alloc];
    id v5 = +[RouteStepListMetrics routePlanningMetrics];
    id v6 = [(RouteStepListViewController *)v4 initWithOptions:247 metrics:v5];
    id v7 = self->_directionsStepsViewController;
    self->_directionsStepsViewController = v6;

    [(RouteStepListViewController *)self->_directionsStepsViewController setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v9 = [WeakRetained route];
    [(RouteStepListViewController *)self->_directionsStepsViewController setRoute:v9];

    directionsStepsViewController = self->_directionsStepsViewController;
  }

  return directionsStepsViewController;
}

- (PlaceCardViewController)placeCardViewController
{
  placeCardViewController = self->_placeCardViewController;
  if (!placeCardViewController)
  {
    id v4 = [[PlaceCardViewController alloc] initWithVisualEffectDisabled:1];
    id v5 = self->_placeCardViewController;
    self->_placeCardViewController = v4;

    [(PlaceCardViewController *)self->_placeCardViewController setExcludedContent:14671];
    [(PlaceCardViewController *)self->_placeCardViewController setPlaceCardDelegate:self];
    [(InfoCardViewController *)self->_placeCardViewController setContaineeDelegate:self];
    placeCardViewController = self->_placeCardViewController;
  }

  return placeCardViewController;
}

- (void)_presentRouteDetailsVC
{
  id v12 = [(StepActionCoordinator *)self directionsStepsViewController];
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  id v5 = [WeakRetained route];
  id v6 = [v5 destination];
  id v7 = [v6 navDisplayName];

  if (!v7)
  {
    objc_super v8 = +[NSBundle mainBundle];
    id v7 = [v8 localizedStringForKey:@"Directions_stepping" value:@"localized string not found" table:0];
  }
  id v9 = [[ModalContaineeViewController alloc] initWithChildViewController:v12 visualEffectDisabled:1];
  id v10 = [(ModalContaineeViewController *)v9 headerView];
  [v10 setTitle:v7];

  id v11 = objc_loadWeakRetained((id *)p_containerViewController);
  [v11 presentController:v9];
}

- (void)_presentIncidents:(id)a3
{
  id v4 = a3;
  id v10 = [[MapsIncidentsViewController alloc] initWithTransitIncidents:v4];

  id v5 = [[ModalContaineeViewController alloc] initWithChildViewController:v10];
  id v6 = [(MapsIncidentsViewController *)v10 navigationItem];
  id v7 = [v6 title];
  objc_super v8 = [(ModalContaineeViewController *)v5 headerView];
  [v8 setTitle:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v5];
}

- (void)_presentAdvisory:(id)a3
{
  id v4 = a3;
  id v10 = objc_alloc_init(MapsIncidentsViewController);
  id v5 = [[ModalContaineeViewController alloc] initWithChildViewController:v10];
  id v6 = [(MapsIncidentsViewController *)v10 navigationItem];
  id v7 = [v6 title];
  objc_super v8 = [(ModalContaineeViewController *)v5 headerView];
  [v8 setTitle:v7];

  [(MapsIncidentsViewController *)v10 setAdvisory:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v5];
}

- (void)_presentPlaceCardViewControllerForMapItem:(id)a3 modally:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v17 = [[PlaceCardItem alloc] initWithMapItem:v6];

  id v7 = [(StepActionCoordinator *)self containerViewController];
  objc_super v8 = [v7 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_3;
  }
  id v10 = [(StepActionCoordinator *)self containerViewController];
  id v11 = [v10 currentViewController];

  id v12 = [v11 placeCardItem];
  unsigned __int8 v13 = [(PlaceCardItem *)v17 isEqual:v12];

  if ((v13 & 1) == 0)
  {
LABEL_3:
    uint64_t v14 = [(StepActionCoordinator *)self placeCardViewController];
    [v14 resetState];
    [v14 setPlaceCardItem:v17 withHistory:0];
    v15 = [v14 cardPresentationController];
    [v15 setPresentedModally:v4];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained presentController:v14];
  }
}

- (void)placeCardViewController:(id)a3 openURL:(id)a4
{
  id v4 = a4;
  id v5 = +[MKSystemController sharedInstance];
  [v5 openURL:v4 completionHandler:0];
}

- (int)currentUITargetForAnalytics
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v3 = [WeakRetained route];
  unsigned int v4 = [v3 transportType] - 1;
  if (v4 > 5) {
    int v5 = 608;
  }
  else {
    int v5 = dword_100F70188[v4];
  }

  return v5;
}

- (int)currentMapViewTargetForAnalytics
{
  return 505;
}

- (void)pptTestEndNavigation
{
}

- (BOOL)pptTestCanUpdateTrayLayout
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  if ([WeakRetained containeeLayout] == (id)5)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)p_containerViewController);
    BOOL v4 = [v5 containeeLayout] != (id)4;
  }
  return v4;
}

- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 < 3) {
    unint64_t v6 = a3 + 1;
  }
  else {
    unint64_t v6 = 0;
  }
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v9 = [WeakRetained containeeLayout];

  if (v9 == (id)v6)
  {
    v15[0] = @"ContainerLayout";
    id v10 = +[NSNumber numberWithUnsignedInteger:v6];
    v15[1] = @"ContainerContainee";
    v16[0] = v10;
    id v11 = objc_loadWeakRetained((id *)p_containerViewController);
    id v12 = [v11 currentViewController];
    v16[1] = v12;
    unsigned __int8 v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    +[PPTNotificationCenter postNotificationIfNeededWithName:@"PPTTestTrayLayoutDidUpdateNotification" object:self userInfo:v13];
  }
  else
  {
    id v14 = objc_loadWeakRetained((id *)p_containerViewController);
    [v14 setLayoutIfSupported:v6 animated:v4];
  }
}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  return a3 == 0;
}

- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 3)
  {
    BOOL v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained popLastViewControllerAnimated:v5];
  }
}

- (UIScrollView)pptTestScrollView
{
  return 0;
}

- (BOOL)pptTestSupportStepping
{
  return 1;
}

- (int64_t)pptTestCurrentStepIndex
{
  v2 = [(StepActionCoordinator *)self containerViewController];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestGuidanceStepProtocol]) {
    id v3 = [v2 pptTestCurrentStepIndex];
  }
  else {
    id v3 = 0;
  }

  return (int64_t)v3;
}

- (BOOL)pptTestHasNextStep
{
  v2 = [(StepActionCoordinator *)self containerViewController];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestGuidanceStepProtocol]) {
    unsigned __int8 v3 = [v2 pptTestHasNextStep];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void)pptTestMoveToNextStep
{
  id v2 = [(StepActionCoordinator *)self containerViewController];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestGuidanceStepProtocol]) {
    [v2 pptTestMoveToNextStep];
  }
}

- (BOOL)pptTestMoveToBoardStep
{
  id v2 = [(StepActionCoordinator *)self containerViewController];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___PPTTestGuidanceStepProtocol]) {
    unsigned __int8 v3 = [v2 pptTestMoveToBoardStep];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (AppCoordinator)appCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);

  return (AppCoordinator *)WeakRetained;
}

- (StepContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (StepContainerViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (void)setDirectionsStepsViewController:(id)a3
{
}

- (void)setPlaceCardViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCardViewController, 0);
  objc_storeStrong((id *)&self->_directionsStepsViewController, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_trayContaineeViewController, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_destroyWeak((id *)&self->_appCoordinator);
}

@end