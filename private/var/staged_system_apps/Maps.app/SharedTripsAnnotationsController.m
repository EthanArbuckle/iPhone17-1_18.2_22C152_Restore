@interface SharedTripsAnnotationsController
- (BOOL)_shouldBeActive;
- (BOOL)automaticallyRecenters;
- (BOOL)isActive;
- (BOOL)shouldShowRoute;
- (BOOL)updateRouteAnnotationsConfiguration:(id)a3;
- (ChromeViewController)chromeViewController;
- (GEOSharedNavState)sharedTrip;
- (MKMapView)mapView;
- (MapCameraController)mapCameraController;
- (PersonalizedItemSource)itemSource;
- (SearchPinsManager)searchPinsManager;
- (SharedTripsAnnotationsController)init;
- (double)_userAnnotationViewImageSideLength;
- (id)_composedRouteToDisplay;
- (id)_waypointSearchResults;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)_attachToMapViewIfNeeded:(BOOL)a3;
- (void)_connectOrDisconnectFromMapView;
- (void)_detachFromMapView;
- (void)_showStartEndPinsAnimated:(BOOL)a3;
- (void)_updateModernMapTokenIfNeeded;
- (void)_updateRouteLines;
- (void)_updateSubscriptions;
- (void)dealloc;
- (void)poiShapeLoader:(id)a3 didLoadStartPOIShape:(id)a4 endPOIShapes:(id)a5;
- (void)recenterOnRouteAnimated:(BOOL)a3;
- (void)reload;
- (void)removeFromMapView;
- (void)setActive:(BOOL)a3;
- (void)setAutomaticallyRecenter:(BOOL)a3;
- (void)setChromeViewController:(id)a3;
- (void)setMapView:(id)a3 mapCameraController:(id)a4 searchPinsManager:(id)a5 animated:(BOOL)a6;
- (void)setSharedTrip:(id)a3;
- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4;
@end

@implementation SharedTripsAnnotationsController

- (SharedTripsAnnotationsController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SharedTripsAnnotationsController;
  v2 = [(SharedTripsAnnotationsController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SharedTripsItemSource);
    itemSource = v2->_itemSource;
    v2->_itemSource = v3;
  }
  return v2;
}

- (void)_attachToMapViewIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  if (WeakRetained)
  {
    sharedTrip = self->_sharedTrip;

    if (sharedTrip)
    {
      self->_attachedToMapView = 1;
      v7 = [(SharedTripsAnnotationsController *)self mapView];
      v8 = [v7 camera];
      id v9 = [v8 copy];

      [v9 setPitch:0.0];
      [v9 setHeading:0.0];
      v10 = [(SharedTripsAnnotationsController *)self mapView];
      [v10 setCamera:v9 animated:v3];

      v11 = [(SharedTripsAnnotationsController *)self mapView];
      [v11 setShowsTraffic:1];

      v12 = [(SharedTripsAnnotationsController *)self mapView];
      v13 = v12;
      if (v12)
      {
        [v12 _cartographicConfiguration];
      }
      else
      {
        uint64_t v29 = 0;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v26 = 0u;
      }
      long long v14 = v27;
      *(_OWORD *)&self->_oldMapConfiguration.style = v26;
      *(_OWORD *)&self->_oldMapConfiguration.projection = v14;
      *(_OWORD *)&self->_oldMapConfiguration.mapkitUsage = v28;
      *(void *)&self->_oldMapConfiguration.gridOnly = v29;

      uint64_t v29 = 0;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v26 = 0u;
      v15 = [(SharedTripsAnnotationsController *)self mapView];
      v16 = v15;
      if (v15)
      {
        [v15 _cartographicConfiguration];
      }
      else
      {
        uint64_t v29 = 0;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v26 = 0u;
      }

      long long v26 = xmmword_100F69570;
      *(void *)&long long v28 = 0;
      uint64_t v25 = v29;
      long long v22 = xmmword_100F69570;
      long long v23 = v27;
      long long v24 = v28;
      v17 = [(SharedTripsAnnotationsController *)self mapView];
      v20[0] = xmmword_100F69570;
      v20[1] = v23;
      v20[2] = v24;
      uint64_t v21 = v25;
      [v17 _setCartographicConfiguration:v20];

      v18 = [(SharedTripsAnnotationsController *)self searchPinsManager];
      [v18 addPOIShapeLoadingObserver:self];

      [(SharedTripsAnnotationsController *)self _updateRouteLines];
      [(SharedTripsAnnotationsController *)self _showStartEndPinsAnimated:v3];
      v19 = +[MSPSharedTripService sharedInstance];
      [v19 addReceivingObserver:self];
    }
  }
}

- (void)setMapView:(id)a3 mapCameraController:(id)a4 searchPinsManager:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  p_mapView = &self->_mapView;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  objc_storeWeak((id *)p_mapView, v13);
  objc_storeWeak((id *)&self->_mapCameraController, v12);

  objc_storeWeak((id *)&self->_searchPinsManager, v11);
  long long v14 = [v13 traitCollection];

  self->_idiom = (int64_t)[v14 userInterfaceIdiom];

  [(SharedTripsAnnotationsController *)self _attachToMapViewIfNeeded:v6];
}

- (void)setChromeViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_chromeViewController, obj);
    if (obj)
    {
      BOOL v6 = [obj mapView];
      v7 = [obj mapCameraController];
      v8 = [obj searchPinsManager];
      [(SharedTripsAnnotationsController *)self setMapView:v6 mapCameraController:v7 searchPinsManager:v8 animated:0];
    }
    else
    {
      [(SharedTripsAnnotationsController *)self removeFromMapView];
    }
    v5 = obj;
  }
}

- (PersonalizedItemSource)itemSource
{
  return (PersonalizedItemSource *)self->_itemSource;
}

- (void)dealloc
{
  [(SharedTripsAnnotationsController *)self removeFromMapView];
  v3.receiver = self;
  v3.super_class = (Class)SharedTripsAnnotationsController;
  [(SharedTripsAnnotationsController *)&v3 dealloc];
}

- (void)setSharedTrip:(id)a3
{
  v5 = (GEOSharedNavState *)a3;
  if (self->_sharedTrip != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_sharedTrip, a3);
    id subscriptionToken = self->_subscriptionToken;
    self->_id subscriptionToken = 0;

    self->_automaticallyRecenter = 1;
    [(SharedTripsAnnotationsController *)self _connectOrDisconnectFromMapView];
    [(SharedTripsAnnotationsController *)self _updateSubscriptions];
    [(SharedTripsAnnotationsController *)self reload];
    v5 = v7;
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(SharedTripsAnnotationsController *)self _updateSubscriptions];
  }
}

- (void)_detachFromMapView
{
  if (self->_attachedToMapView)
  {
    self->_attachedToMapView = 0;
    objc_super v3 = +[MSPSharedTripService sharedInstance];
    [v3 removeReceivingObserver:self];

    v4 = [(SharedTripsAnnotationsController *)self mapView];
    [v4 _setCartographicConfiguration:&v7];

    v5 = [(SharedTripsAnnotationsController *)self mapView];
    [v5 removeAnnotation:self->_userAnnotation];

    BOOL v6 = [(SharedTripsAnnotationsController *)self searchPinsManager];
    [v6 removePOIShapeLoadingObserver:self];
  }
}

- (void)removeFromMapView
{
  [(SharedTripsAnnotationsController *)self _detachFromMapView];
  objc_storeWeak((id *)&self->_mapView, 0);
  objc_storeWeak((id *)&self->_mapCameraController, 0);

  objc_storeWeak((id *)&self->_searchPinsManager, 0);
}

- (void)_connectOrDisconnectFromMapView
{
  sharedTrip = self->_sharedTrip;
  if (self->_attachedToMapView)
  {
    if (!sharedTrip) {
      [(SharedTripsAnnotationsController *)self _detachFromMapView];
    }
  }
  else if (sharedTrip)
  {
    [(SharedTripsAnnotationsController *)self _attachToMapViewIfNeeded:1];
  }
}

- (void)_updateSubscriptions
{
  unsigned int v3 = [(SharedTripsAnnotationsController *)self _shouldBeActive];
  v4 = [(SharedTripsAnnotationsController *)self sharedTrip];
  id v9 = [v4 groupIdentifier];

  v5 = [(SharedTripsAnnotationsController *)self chromeViewController];
  BOOL v6 = [v5 _maps_uiScene];

  long long v7 = 0;
  id subscriptionToken = self->_subscriptionToken;
  if (v3 && v9 && v6)
  {
    if (subscriptionToken) {
      goto LABEL_7;
    }
    long long v7 = [[SharedTripSceneAwareSubscription alloc] initWithTripIdentifier:v9 scene:v6];
    id subscriptionToken = self->_subscriptionToken;
  }
  self->_id subscriptionToken = v7;

LABEL_7:
}

- (void)reload
{
  [(SharedTripsAnnotationsController *)self _updateRouteLines];

  [(SharedTripsAnnotationsController *)self _showStartEndPinsAnimated:1];
}

- (BOOL)shouldShowRoute
{
  return self->_idiom != 3;
}

- (void)recenterOnRouteAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SharedTripsAnnotationsController *)self sharedTrip];
  if (!v5) {
    goto LABEL_29;
  }
  double y = MKMapRectNull.origin.y;
  double width = MKMapRectNull.size.width;
  double height = MKMapRectNull.size.height;
  id v46 = v5;
  unsigned int v9 = [v5 hasClosed];
  v10 = v46;
  if (!v9 || (unsigned __int8 v11 = [v46 closed], v10 = v46, (v11 & 1) == 0))
  {
    long long v14 = [v10 composedRoute];
    if (v14 && [(SharedTripsAnnotationsController *)self shouldShowRoute])
    {
      v15 = [v14 boundingMapRegion];
      GEOMapRectForMapRegion();
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;

      v49.origin.double x = MKMapRectNull.origin.x;
      v49.origin.double y = y;
      v49.size.double width = width;
      v49.size.double height = height;
      v57.origin.double x = v17;
      v57.origin.double y = v19;
      v57.size.double width = v21;
      v57.size.double height = v23;
      MKMapRect v50 = MKMapRectUnion(v49, v57);
      double x = v50.origin.x;
      double v12 = v50.origin.y;
      double width = v50.size.width;
      double height = v50.size.height;
    }
    else
    {
      double v12 = y;
      double x = MKMapRectNull.origin.x;
    }
    long long v24 = [v46 etaInfo];
    uint64_t v25 = v24;
    if (v24
      && [v24 hasLatitude]
      && [v25 hasLongitude]
      && [(SharedTripsAnnotationsController *)self shouldShowRoute])
    {
      [v25 latitude];
      CLLocationDegrees v27 = v26;
      [v25 longitude];
      CLLocationCoordinate2DMake(v27, v28);
    }
    else
    {
      userAnnotation = self->_userAnnotation;
      if (!userAnnotation) {
        goto LABEL_18;
      }
      [(SharedTripUserAnnotation *)userAnnotation coordinate];
      if (!CLLocationCoordinate2DIsValid(v48)) {
        goto LABEL_18;
      }
      [(SharedTripUserAnnotation *)self->_userAnnotation coordinate];
    }
    MKMapRectMakeWithRadialDistance();
    v58.origin.double x = v30;
    v58.origin.double y = v31;
    v58.size.double width = v32;
    v58.size.double height = v33;
    v51.origin.double x = x;
    v51.origin.double y = v12;
    v51.size.double width = width;
    v51.size.double height = height;
    MKMapRect v52 = MKMapRectUnion(v51, v58);
    double x = v52.origin.x;
    double v12 = v52.origin.y;
    double width = v52.size.width;
    double height = v52.size.height;
LABEL_18:

    goto LABEL_19;
  }
  double v12 = y;
  double x = MKMapRectNull.origin.x;
LABEL_19:
  v34 = [v46 destinationWaypointMapItem];
  if (v34)
  {
    id v35 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v34 isPlaceHolderPlace:0];
    [v35 _coordinate];
    MKMapRectMakeWithRadialDistance();
    v59.origin.double x = v36;
    v59.origin.double y = v37;
    v59.size.double width = v38;
    v59.size.double height = v39;
    v53.origin.double x = x;
    v53.origin.double y = v12;
    v53.size.double width = width;
    v53.size.double height = height;
    MKMapRect v54 = MKMapRectUnion(v53, v59);
    double x = v54.origin.x;
    double v12 = v54.origin.y;
    double width = v54.size.width;
    double height = v54.size.height;
  }
  BOOL v40 = v12 == y && x == MKMapRectNull.origin.x;
  if (!v40 && width != 0.0 && height != 0.0)
  {
    v55.origin.double x = x;
    v55.origin.double y = v12;
    v55.size.double width = width;
    v55.size.double height = height;
    MKMapRect v56 = MKMapRectInset(v55, width * -0.100000001, height * -0.100000001);
    double v41 = v56.origin.x;
    double v42 = v56.origin.y;
    double v43 = v56.size.width;
    double v44 = v56.size.height;
    v45 = [(SharedTripsAnnotationsController *)self mapCameraController];
    [v45 frameMapRect:v3 animated:0 completion:v41, v42, v43, v44];
  }
  v5 = v46;
LABEL_29:
}

- (id)_composedRouteToDisplay
{
  BOOL v3 = [(SharedTripsAnnotationsController *)self sharedTrip];
  if ([v3 hasClosed]) {
    unsigned int v4 = [v3 closed] ^ 1;
  }
  else {
    unsigned int v4 = 1;
  }
  v5 = 0;
  if (v3 && v4)
  {
    if ([(SharedTripsAnnotationsController *)self shouldShowRoute]
      && ([v3 composedRoute], BOOL v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
    {
      v5 = [v3 composedRoute];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)_updateRouteLines
{
  [(SharedTripsAnnotationsController *)self _updateModernMapTokenIfNeeded];
  id v5 = [(SharedTripsAnnotationsController *)self _composedRouteToDisplay];
  if (v5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 4095;
  }
  [(RouteStartEndItemSource *)self->_itemSource setVisibilityMask:v3];
  unsigned int v4 = [(SharedTripsAnnotationsController *)self chromeViewController];
  [v4 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(SharedTripsAnnotationsController *)self _composedRouteToDisplay];
  [v4 setStyle:0];
  if (v5)
  {
    unsigned int v9 = v5;
    BOOL v6 = +[NSArray arrayWithObjects:&v9 count:1];
    [v4 setRoutes:v6];

    uint64_t v7 = 0;
  }
  else
  {
    [v4 setRoutes:&__NSArray0__struct];
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [v4 setRouteTrafficFeaturesActive:1];
  [v4 setSelectedRouteIndex:v7];

  return 1;
}

- (id)_waypointSearchResults
{
  v2 = [(SharedTripsAnnotationsController *)self sharedTrip];
  uint64_t v3 = v2;
  if (v2 && ![v2 waypointInfosCount])
  {
    v8 = sub_1005762E4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v13 = "-[SharedTripsAnnotationsController _waypointSearchResults]";
      __int16 v14 = 2080;
      v15 = "SharedTripsAnnotationsController.m";
      __int16 v16 = 1024;
      int v17 = 288;
      __int16 v18 = 2080;
      double v19 = "!trip || trip.waypointInfosCount > 0";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      unsigned int v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if ([v3 hasCurrentWaypointIndex]) {
    uint64_t v4 = [v3 currentWaypointIndex];
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = [v3 waypointInfos];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100AF9C2C;
  v11[3] = &unk_101317438;
  v11[4] = v4;
  BOOL v6 = sub_100099700(v5, v11);

  return v6;
}

- (void)_showStartEndPinsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v18 = [(SharedTripsAnnotationsController *)self sharedTrip];
  itemSource = self->_itemSource;
  BOOL v6 = [(SharedTripsAnnotationsController *)self _waypointSearchResults];
  [(RouteStartEndItemSource *)itemSource setStartLocation:0 endLocations:v6];

  if ([(SharedTripsAnnotationsController *)self shouldShowRoute])
  {
    uint64_t v7 = [v18 lastLocation];
    if ((![v18 hasClosed] || objc_msgSend(v18, "closed") != 1)
      && v7
      && [v7 hasCoordinate])
    {
      userAnnotation = self->_userAnnotation;
      if (!userAnnotation)
      {
        unsigned int v9 = objc_alloc_init(SharedTripUserAnnotation);
        v10 = self->_userAnnotation;
        self->_userAnnotation = v9;

        unsigned __int8 v11 = [(SharedTripsAnnotationsController *)self mapView];
        [v11 addAnnotation:self->_userAnnotation];

        userAnnotation = self->_userAnnotation;
      }
      [(SharedTripUserAnnotation *)userAnnotation setState:v18];
      double v12 = [v7 coordinate];
      [v12 lat];
      CLLocationDegrees v14 = v13;
      [v12 lng];
      CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v14, v15);
      -[SharedTripUserAnnotation setCoordinate:](self->_userAnnotation, "setCoordinate:", v16.latitude, v16.longitude);
    }
    else
    {
      if (!self->_userAnnotation)
      {
LABEL_12:

        goto LABEL_13;
      }
      int v17 = [(SharedTripsAnnotationsController *)self mapView];
      [v17 removeAnnotation:self->_userAnnotation];

      double v12 = self->_userAnnotation;
      self->_userAnnotation = 0;
    }

    goto LABEL_12;
  }
LABEL_13:
  if ([(SharedTripsAnnotationsController *)self automaticallyRecenters]) {
    [(SharedTripsAnnotationsController *)self recenterOnRouteAnimated:v3];
  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    userAnnotationView = self->_userAnnotationView;
    if (userAnnotationView)
    {
      [(SharedTripContactAnnotationView *)userAnnotationView setAnnotation:v5];
    }
    else
    {
      v8 = [SharedTripContactAnnotationView alloc];
      [(SharedTripsAnnotationsController *)self _userAnnotationViewImageSideLength];
      unsigned int v9 = -[SharedTripContactAnnotationView initWithAnnotation:reuseIdentifier:imageSideLength:](v8, "initWithAnnotation:reuseIdentifier:imageSideLength:", v5, @"UserAnnotation");
      v10 = self->_userAnnotationView;
      self->_userAnnotationView = v9;

      [(SharedTripContactAnnotationView *)self->_userAnnotationView setTranslatesAutoresizingMaskIntoConstraints:0];
      unsigned __int8 v11 = [(SharedTripContactAnnotationView *)self->_userAnnotationView widthAnchor];
      [(SharedTripsAnnotationsController *)self _userAnnotationViewImageSideLength];
      double v12 = [v11 constraintEqualToConstant:];
      v17[0] = v12;
      double v13 = [(SharedTripContactAnnotationView *)self->_userAnnotationView heightAnchor];
      [(SharedTripsAnnotationsController *)self _userAnnotationViewImageSideLength];
      CLLocationDegrees v14 = [v13 constraintEqualToConstant:];
      v17[1] = v14;
      CLLocationDegrees v15 = +[NSArray arrayWithObjects:v17 count:2];
      +[NSLayoutConstraint activateConstraints:v15];
    }
    uint64_t v7 = self->_userAnnotationView;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (double)_userAnnotationViewImageSideLength
{
  double result = 40.0;
  if (self->_idiom == 3) {
    return 34.0;
  }
  return result;
}

- (void)poiShapeLoader:(id)a3 didLoadStartPOIShape:(id)a4 endPOIShapes:(id)a5
{
  if ([(SharedTripsAnnotationsController *)self automaticallyRecenters])
  {
    [(SharedTripsAnnotationsController *)self recenterOnRouteAnimated:1];
  }
}

- (BOOL)_shouldBeActive
{
  if (!self->_attachedToMapView) {
    return 0;
  }
  v2 = [(SharedTripsAnnotationsController *)self sharedTrip];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_updateModernMapTokenIfNeeded
{
  BOOL v3 = [(SharedTripsAnnotationsController *)self chromeViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    BOOL v6 = [(SharedTripsAnnotationsController *)self sharedTrip];
    uint64_t v7 = [v6 routeInfo];
    if (v7)
    {
      v8 = (void *)v7;
      unsigned int v9 = [(SharedTripsAnnotationsController *)self sharedTrip];
      v10 = [v9 routeInfo];
      id v11 = [v10 routingPathLegsCount];

      if (!v11)
      {
        if (!self->_modernMapToken)
        {
          double v12 = sub_100576A9C();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Acquiring map type suppression token to display trip from older client", buf, 2u);
          }

          double v13 = [v5 acquireModernMapTokenForReason:2];
          id modernMapToken = self->_modernMapToken;
          self->_id modernMapToken = v13;
LABEL_16:

          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else
    {
    }
  }
  if (self->_modernMapToken)
  {
    CLLocationDegrees v15 = sub_100576A9C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CLLocationCoordinate2D v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Releasing map type suppression token", v16, 2u);
    }

    id modernMapToken = self->_modernMapToken;
    self->_id modernMapToken = 0;
    goto LABEL_16;
  }
LABEL_17:
}

- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4
{
  id v11 = a4;
  id v5 = [(SharedTripsAnnotationsController *)self sharedTrip];
  BOOL v6 = [v5 groupIdentifier];
  uint64_t v7 = [v11 groupIdentifier];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    unsigned int v9 = (GEOSharedNavState *)[v11 copy];
    sharedTrip = self->_sharedTrip;
    self->_sharedTrip = v9;

    [(SharedTripsAnnotationsController *)self _updateRouteLines];
    [(SharedTripsAnnotationsController *)self _showStartEndPinsAnimated:1];
  }
}

- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4
{
  id v10 = a4;
  BOOL v6 = [(SharedTripsAnnotationsController *)self sharedTrip];
  uint64_t v7 = [v6 groupIdentifier];
  unsigned int v8 = [v10 groupIdentifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_storeStrong((id *)&self->_sharedTrip, a4);
    [(SharedTripsAnnotationsController *)self _showStartEndPinsAnimated:1];
  }
}

- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4
{
  id v10 = a4;
  BOOL v6 = [(SharedTripsAnnotationsController *)self sharedTrip];
  uint64_t v7 = [v6 groupIdentifier];
  unsigned int v8 = [v10 groupIdentifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_storeStrong((id *)&self->_sharedTrip, a4);
    [(SharedTripsAnnotationsController *)self _showStartEndPinsAnimated:1];
  }
}

- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(SharedTripsAnnotationsController *)self sharedTrip];
  uint64_t v7 = [v6 groupIdentifier];
  unsigned int v8 = [v5 groupIdentifier];

  LODWORD(v5) = [v7 isEqualToString:v8];
  if (v5)
  {
    [(SharedTripsAnnotationsController *)self setSharedTrip:0];
  }
}

- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4
{
  id v10 = a4;
  BOOL v6 = [(SharedTripsAnnotationsController *)self sharedTrip];
  uint64_t v7 = [v6 groupIdentifier];
  unsigned int v8 = [v10 groupIdentifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_storeStrong((id *)&self->_sharedTrip, a4);
    [(SharedTripsAnnotationsController *)self _updateRouteLines];
    [(SharedTripsAnnotationsController *)self _showStartEndPinsAnimated:1];
  }
}

- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4
{
  id v10 = a4;
  BOOL v6 = [(SharedTripsAnnotationsController *)self sharedTrip];
  uint64_t v7 = [v6 groupIdentifier];
  unsigned int v8 = [v10 groupIdentifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_storeStrong((id *)&self->_sharedTrip, a4);
    [(SharedTripsAnnotationsController *)self _updateRouteLines];
    [(SharedTripsAnnotationsController *)self _showStartEndPinsAnimated:1];
  }
}

- (GEOSharedNavState)sharedTrip
{
  return self->_sharedTrip;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)automaticallyRecenters
{
  return self->_automaticallyRecenter;
}

- (void)setAutomaticallyRecenter:(BOOL)a3
{
  self->_automaticallyRecenter = a3;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (MapCameraController)mapCameraController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapCameraController);

  return (MapCameraController *)WeakRetained;
}

- (SearchPinsManager)searchPinsManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchPinsManager);

  return (SearchPinsManager *)WeakRetained;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_destroyWeak((id *)&self->_searchPinsManager);
  objc_destroyWeak((id *)&self->_mapCameraController);
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_sharedTrip, 0);
  objc_storeStrong(&self->_modernMapToken, 0);
  objc_storeStrong(&self->_subscriptionToken, 0);
  objc_storeStrong((id *)&self->_itemSource, 0);
  objc_storeStrong((id *)&self->_userAnnotationView, 0);

  objc_storeStrong((id *)&self->_userAnnotation, 0);
}

@end