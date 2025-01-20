@interface NavigationDisplay
- ($F9C4767691F2EDF2F3162F5FE7B1523A)cartographicConfigurationForTransportType:(SEL)a3;
- (BOOL)isTracking;
- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4;
- (BOOL)showsRoadLabel;
- (ChromeViewController)chromeViewController;
- (GEOComposedWaypoint)destinationWaypoint;
- (MKMapView)mapView;
- (MapsSuggestionsRouteGeniusEntry)routeGeniusEntry;
- (NavCameraController)cameraController;
- (NavigationDisplay)init;
- (NavigationDisplayDelegate)delegate;
- (UserLocationView)userLocationAnnotationView;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)mapViewCurrentRouteMatch:(id)a3;
- (int)transportType;
- (int64_t)sky;
- (void)_setTracking:(BOOL)a3;
- (void)_startObservingChromeIfNeeded;
- (void)_stopObservingChromeIfNeeded;
- (void)_updateCartographicConfiguration;
- (void)_updateDestinationBuildingId;
- (void)_updateMapViewAndCameraController;
- (void)_updateRoadDescription:(id)a3;
- (void)_updateSky;
- (void)_updateUserAnnotationViewForCurrentTransportTypeAnimated:(BOOL)a3;
- (void)clearAllAnnotations;
- (void)clearCache;
- (void)dealloc;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6;
- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4;
- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8;
- (void)mapView:(id)a3 didUpdateYaw:(double)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3;
- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3;
- (void)mapViewNavigationCameraHasStartedPanning:(id)a3;
- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3;
- (void)pauseCameraMotion;
- (void)setChromeViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationWaypoint:(id)a3;
- (void)setMapView:(id)a3;
- (void)setNavigationCameraMode:(unint64_t)a3;
- (void)setNavigationDestinationState:(unint64_t)a3;
- (void)setRouteGeniusEntry:(id)a3;
- (void)setShowsRoadLabel:(BOOL)a3;
- (void)setSky:(int64_t)a3;
- (void)setTransportType:(int)a3;
- (void)setTransportType:(int)a3 animated:(BOOL)a4;
- (void)setUserLocationAnnotationView:(id)a3;
- (void)startMotion:(BOOL)a3;
- (void)stopCameraMotion;
- (void)updateWithLocation:(id)a3;
- (void)updateWithRoute:(id)a3;
@end

@implementation NavigationDisplay

- (NavigationDisplay)init
{
  v6.receiver = self;
  v6.super_class = (Class)NavigationDisplay;
  v2 = [(NavigationDisplay *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(NavCameraController);
    cameraController = v2->_cameraController;
    v2->_cameraController = v3;

    v2->_transportType = 4;
    v2->_showsRoadLabel = 1;
  }
  return v2;
}

- (void)dealloc
{
  [(NavigationDisplay *)self _stopObservingChromeIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)NavigationDisplay;
  [(NavigationDisplay *)&v3 dealloc];
}

- (void)_updateSky
{
  unint64_t sky = self->_sky;
  double v3 = 0.0;
  if (sky <= 2) {
    double v3 = dbl_100F6FF68[sky];
  }
  id v4 = [(MKMapView *)self->_mapView _mapLayer];
  [v4 setCanonicalSkyHeight:v3];
}

- (void)setSky:(int64_t)a3
{
  if (self->_sky != a3)
  {
    self->_unint64_t sky = a3;
    [(NavigationDisplay *)self _updateSky];
  }
}

- (void)setChromeViewController:(id)a3
{
  id v4 = a3;
  [(NavigationDisplay *)self _stopObservingChromeIfNeeded];
  objc_storeWeak((id *)&self->_chromeViewController, v4);
  [(NavigationDisplay *)self _startObservingChromeIfNeeded];
  id v5 = [v4 mapView];

  [(NavigationDisplay *)self setMapView:v5];
}

- (void)setMapView:(id)a3
{
  id v5 = (MKMapView *)a3;
  p_mapView = (id *)&self->_mapView;
  if (self->_mapView != v5)
  {
    v45 = v5;
    [(NavigationDisplay *)self clearAllAnnotations];
    mapView = self->_mapView;
    if (mapView)
    {
      BOOL zoomEnabled = self->_mapViewFlagsToRestore.zoomEnabled;
      int64_t userTrackingMode = self->_mapViewFlagsToRestore.userTrackingMode;
      LODWORD(v41) = self->_mapViewFlagsToRestore.shouldAnimatePositionWithRouteMatch;
      HIDWORD(v41) = self->_mapViewFlagsToRestore.showsUserLocation;
      BOOL scaleEnabled = self->_mapViewFlagsToRestore.scaleEnabled;
      BOOL rotateEnabled = self->_mapViewFlagsToRestore.rotateEnabled;
      BOOL panWithMomentum = self->_mapViewFlagsToRestore.panWithMomentum;
      BOOL locationPropagationEnabled = self->_mapViewFlagsToRestore.locationPropagationEnabled;
      BOOL compassEnabled = self->_mapViewFlagsToRestore.compassEnabled;
      BOOL canSelectPOIs = self->_mapViewFlagsToRestore.canSelectPOIs;
      v14 = mapView;
      [(MKMapView *)v14 _setCanSelectPOIs:canSelectPOIs];
      [(MKMapView *)v14 setCompassEnabled:compassEnabled];
      [(MKMapView *)v14 _setLocationPropagationEnabled:locationPropagationEnabled];
      [(MKMapView *)v14 _setPanWithMomentum:panWithMomentum];
      [(MKMapView *)v14 setRotateEnabled:rotateEnabled];
      [(MKMapView *)v14 setScaleEnabled:scaleEnabled];
      [(MKMapView *)v14 _setShouldAnimatePositionWithRouteMatch:v41 != 0];
      [(MKMapView *)v14 setShowsUserLocation:HIDWORD(v41) != 0];
      [(MKMapView *)v14 setUserTrackingMode:userTrackingMode];
      [(MKMapView *)v14 setZoomEnabled:zoomEnabled];
    }
    v15 = &self->_mapViewFlagsToRestore.zoomEnabled + 1;
    objc_storeStrong((id *)&self->_mapView, a3);
    id v16 = *p_mapView;
    if (*p_mapView)
    {
      id v17 = v16;
      unsigned __int8 v43 = [v17 _canSelectPOIs];
      HIDWORD(v41) = [v17 isCompassEnabled];
      LODWORD(v41) = [v17 _isLocationPropagationEnabled];
      unsigned __int8 v18 = [v17 _panWithMomentum];
      unsigned __int8 v19 = [v17 isRotateEnabled];
      unsigned __int8 v20 = [v17 isScaleEnabled];
      unsigned __int8 v21 = [v17 _shouldAnimatePositionWithRouteMatch];
      unsigned __int8 v22 = [v17 showsUserLocation];
      id v23 = [v17 userTrackingMode];
      unsigned __int8 v24 = [v17 isZoomEnabled];

      BOOL v26 = v41;
      char v25 = BYTE4(v41);
      LOBYTE(v16) = v43;
      v15 = &self->_mapViewFlagsToRestore.zoomEnabled + 1;
    }
    else
    {
      unsigned __int8 v24 = 0;
      id v23 = 0;
      unsigned __int8 v22 = 0;
      unsigned __int8 v21 = 0;
      unsigned __int8 v20 = 0;
      unsigned __int8 v19 = 0;
      unsigned __int8 v18 = 0;
      BOOL v26 = 0;
      char v25 = 0;
    }
    self->_mapViewFlagsToRestore.BOOL canSelectPOIs = (char)v16;
    self->_mapViewFlagsToRestore.BOOL compassEnabled = v25;
    self->_mapViewFlagsToRestore.BOOL locationPropagationEnabled = v26;
    self->_mapViewFlagsToRestore.BOOL panWithMomentum = v18;
    self->_mapViewFlagsToRestore.BOOL rotateEnabled = v19;
    self->_mapViewFlagsToRestore.BOOL scaleEnabled = v20;
    self->_mapViewFlagsToRestore.shouldAnimatePositionWithRouteMatch = v21;
    self->_mapViewFlagsToRestore.showsUserLocation = v22;
    self->_mapViewFlagsToRestore.int64_t userTrackingMode = (int64_t)v23;
    self->_mapViewFlagsToRestore.BOOL zoomEnabled = v24;
    *(_DWORD *)v15 = 0;
    *(_DWORD *)(v15 + 3) = 0;
    int transportType = self->_transportType;
    if (v45)
    {
      v28 = [(MKMapView *)v45 traitCollection];
      BOOL v29 = [v28 userInterfaceIdiom] != (id)3;
    }
    else
    {
      BOOL v29 = 1;
    }
    if (*p_mapView)
    {
      id v30 = *p_mapView;
      [v30 _setCanSelectPOIs:1];
      [v30 setCompassEnabled:0];
      [v30 _setLocationPropagationEnabled:0];
      [v30 _setPanWithMomentum:1];
      [v30 setRotateEnabled:1];
      [v30 setScaleEnabled:0];
      [v30 _setShouldAnimatePositionWithRouteMatch:transportType == 0];
      [v30 setShowsUserLocation:1];
      [v30 setUserTrackingMode:0];
      [v30 setZoomEnabled:v29];
    }
    [(NavigationDisplay *)self _updateSky];
    if (self->_transportType != 4) {
      [(NavigationDisplay *)self _updateCartographicConfiguration];
    }
    v31 = [[NavigationDebugAnnotationsProvider alloc] initWithMapView:self->_mapView];
    debugAnnotationsProvider = self->_debugAnnotationsProvider;
    self->_debugAnnotationsProvider = v31;

    [(NavigationDebugAnnotationsProvider *)self->_debugAnnotationsProvider setUserLocationMarkerMode:[(UserLocationView *)self->_userLocationAnnotationView mode]];
    [(NavigationDebugAnnotationsProvider *)self->_debugAnnotationsProvider updateWithRoute:self->_route];
    v33 = [(MKMapView *)self->_mapView selectedAnnotations];
    id v34 = [v33 count];

    if (v34)
    {
      id v35 = *p_mapView;
      v36 = [*p_mapView selectedAnnotations];
      v37 = [v36 firstObject];
      [v35 deselectAnnotation:v37 animated:1];
    }
    v38 = [*p_mapView _selectedLabelMarker];

    if (v38) {
      [*p_mapView _deselectLabelMarkerAnimated:1];
    }
    [(NavCameraController *)self->_cameraController setMapView:self->_mapView];
    v39 = [[MapViewResponder alloc] initWithMapView:self->_mapView];
    mapViewResponder = self->_mapViewResponder;
    self->_mapViewResponder = v39;

    [(MapViewResponder *)self->_mapViewResponder setTarget:self];
    id v5 = v45;
  }
}

- (void)setUserLocationAnnotationView:(id)a3
{
  id v5 = (UserLocationView *)a3;
  if (self->_userLocationAnnotationView != v5)
  {
    objc_storeStrong((id *)&self->_userLocationAnnotationView, a3);
    [(UserLocationView *)self->_userLocationAnnotationView setCanShowCallout:0];
    [(NavigationDebugAnnotationsProvider *)self->_debugAnnotationsProvider setUserLocationMarkerMode:[(UserLocationView *)v5 mode]];
    [(NavigationDisplay *)self _updateUserAnnotationViewForCurrentTransportTypeAnimated:1];
  }
}

- (void)updateWithLocation:(id)a3
{
  objc_storeStrong((id *)&self->_matchedLocation, a3);
  id v6 = a3;
  id v5 = [v6 roadName];
  [(NavigationDisplay *)self _updateRoadDescription:v5];

  [(NavigationDebugAnnotationsProvider *)self->_debugAnnotationsProvider updateWithLocation:v6];
}

- (void)updateWithRoute:(id)a3
{
  id v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    objc_storeStrong((id *)&self->_route, a3);
    [(NavigationDebugAnnotationsProvider *)self->_debugAnnotationsProvider updateWithRoute:v5];
    [(NavigationDisplay *)self _updateMapViewAndCameraController];
    [(NavigationDisplay *)self _updateDestinationBuildingId];
  }
}

- (void)setRouteGeniusEntry:(id)a3
{
  objc_storeStrong((id *)&self->_routeGeniusEntry, a3);
  id v5 = a3;
  [(NavCameraDriveProvider *)self->_driveCameraProvider setRouteGeniusEntry:v5];
}

- (void)clearAllAnnotations
{
}

- ($F9C4767691F2EDF2F3162F5FE7B1523A)cartographicConfigurationForTransportType:(SEL)a3
{
  *(void *)&retstr->var6 = 0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  _MKCartographicConfigurationDefault();
  retstr->var4 = 0;
  v7 = [(NavigationDisplay *)self chromeViewController];
  unsigned int v8 = [v7 shouldUseModernMap];

  if (v8)
  {
    v10 = [(NavigationDisplay *)self chromeViewController];
    int64_t v11 = (int64_t)[v10 modernMapProjectionType];

    v12 = [(NavigationDisplay *)self chromeViewController];
    int64_t v13 = (int64_t)[v12 modernMapTerrainMode];

    int64_t v14 = v13;
    int64_t v15 = v11;
    int64_t v16 = v13;
  }
  else
  {
    int64_t v15 = 0;
    int64_t v16 = 0;
    int64_t v14 = 2;
    int64_t v13 = 1;
    int64_t v11 = 1;
  }
  switch(a4)
  {
    case 0:
      retstr->var3 = v13;
      goto LABEL_9;
    case 1:
      retstr->var2 = v15;
      retstr->var3 = v16;
      int64_t v17 = 4;
      goto LABEL_10;
    case 2:
      retstr->var2 = v11;
      retstr->var3 = v14;
      return result;
    case 3:
      retstr->var3 = v14;
LABEL_9:
      int64_t v17 = 3;
      retstr->var2 = v11;
LABEL_10:
      retstr->var1 = v17;
      break;
    default:
      return result;
  }
  return result;
}

- (void)_updateCartographicConfiguration
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  [(NavigationDisplay *)self cartographicConfigurationForTransportType:self->_transportType];
  id v3 = objc_alloc((Class)_MKCartographicMapConfiguration);
  v9[0] = v11;
  v9[1] = v12;
  v9[2] = v13;
  uint64_t v10 = v14;
  id v4 = [v3 initWithCartographicConfiguration:v9];
  id v5 = [(MKMapView *)self->_mapView preferredConfiguration];
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___MKMapConfigurationHiking]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  [v4 setShowsHiking:[v7 showsHiking]];
  id v8 = [v7 showsTopographicFeatures];

  [v4 setShowsTopographicFeatures:v8];
  [(MKMapView *)self->_mapView setPreferredConfiguration:v4];
}

- (void)setTransportType:(int)a3
{
}

- (void)setTransportType:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_int transportType = a3;
  [(NavigationDisplay *)self _updateCartographicConfiguration];
  switch(a3)
  {
    case 0:
    case 3:
      [(MKMapView *)self->_mapView setShowsTraffic:1];
      [(MKMapView *)self->_mapView _setShowHeadingIndicatorForStepping:0];
      [(MKMapView *)self->_mapView _setShouldAnimatePositionWithRouteMatch:1];
      id v7 = [(MKMapView *)self->_mapView _mapLayer];
      [v7 setDesiredMapMode:1];

      break;
    case 1:
      [(MKMapView *)self->_mapView setShowsTraffic:0];
      [(MKMapView *)self->_mapView setScaleEnabled:0];
      [(MKMapView *)self->_mapView _setShowHeadingIndicatorForStepping:1];
      [(MKMapView *)self->_mapView _setShouldAnimatePositionWithRouteMatch:0];
      [(MKMapView *)self->_mapView _setClearUserLocationOnLocationReset:0];
      goto LABEL_5;
    case 2:
      [(MKMapView *)self->_mapView setShowsTraffic:0];
      [(MKMapView *)self->_mapView _setShowHeadingIndicatorForStepping:1];
      [(MKMapView *)self->_mapView _setShouldAnimatePositionWithRouteMatch:0];
LABEL_5:
      id v8 = [(MKMapView *)self->_mapView _mapLayer];
      [v8 setDesiredMapMode:0];

      [(MKMapView *)self->_mapView setUserTrackingMode:0 animated:0];
      break;
    default:
      break;
  }

  [(NavigationDisplay *)self _updateUserAnnotationViewForCurrentTransportTypeAnimated:v4];
}

- (void)_updateUserAnnotationViewForCurrentTransportTypeAnimated:(BOOL)a3
{
  uint64_t transportType = self->_transportType;
  if (transportType <= 3) {
    [(UserLocationView *)self->_userLocationAnnotationView setMode:qword_100F6FF80[transportType] animated:a3];
  }
}

- (void)clearCache
{
  id v2 = [(MKMapView *)self->_mapView _mapLayer];
  [v2 clearScene];
}

- (void)setShowsRoadLabel:(BOOL)a3
{
  if (self->_showsRoadLabel != a3)
  {
    self->_showsRoadLabel = a3;
    id v4 = [(MNLocation *)self->_matchedLocation roadName];
    [(NavigationDisplay *)self _updateRoadDescription:v4];
  }
}

- (void)_updateRoadDescription:(id)a3
{
  id v4 = a3;
  if (!self->_showsRoadLabel)
  {

    id v4 = 0;
  }
  id v6 = v4;
  if (![v4 length])
  {

    id v6 = 0;
  }
  id v5 = [(MKMapView *)self->_mapView _mapLayer];
  [v5 setCurrentLocationText:v6];
}

- (void)_setTracking:(BOOL)a3
{
  if (self->_tracking != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_100576084();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL tracking = self->_tracking;
      id v7 = [(NavigationDisplay *)self mapView];
      v8[0] = 67109634;
      v8[1] = tracking;
      __int16 v9 = 1024;
      BOOL v10 = v3;
      __int16 v11 = 2114;
      long long v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Changing _tracking from %d to %d on %{public}@", (uint8_t *)v8, 0x18u);
    }
    self->_BOOL tracking = v3;
  }
}

- (void)setNavigationCameraMode:(unint64_t)a3
{
  self->_navigationCameraMode = a3;
  [(NavigationDisplay *)self _updateMapViewAndCameraController];
}

- (void)_updateMapViewAndCameraController
{
  unint64_t navigationCameraMode = self->_navigationCameraMode;
  if (navigationCameraMode - 1 >= 2)
  {
    if (navigationCameraMode == 3)
    {
      driveCameraProvider = self->_driveCameraProvider;
      if (!driveCameraProvider)
      {
        __int16 v11 = objc_alloc_init(NavCameraDriveProvider);
        long long v12 = self->_driveCameraProvider;
        self->_driveCameraProvider = v11;

        long long v13 = [(NavigationDisplay *)self routeGeniusEntry];
        [(NavCameraDriveProvider *)self->_driveCameraProvider setRouteGeniusEntry:v13];

        driveCameraProvider = self->_driveCameraProvider;
      }
      int64_t v15 = driveCameraProvider;
      uint64_t v14 = 2;
    }
    else
    {
      int64_t v15 = 0;
      uint64_t v14 = 0;
    }
  }
  else
  {
    id v4 = +[MNNavigationService sharedService];
    id v5 = [v4 nextWaypoint];
    id v6 = [v4 route];
    id v7 = [v6 waypoints];
    id v8 = [v7 lastObject];

    if (GEOConfigGetBOOL()) {
      BOOL v9 = v5 == v8;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (self->_navigationCameraMode == 2) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 1;
      }
    }
    else
    {
      uint64_t v14 = 3;
    }

    int64_t v15 = 0;
  }
  [(MKMapView *)self->_mapView _clearGesturesAndAnimations];
  [(NavCameraController *)self->_cameraController setNavCameraMode:v14];
  [(NavCameraController *)self->_cameraController setOverrideNavigationProvider:v15];
}

- (void)_updateDestinationBuildingId
{
  BOOL v3 = [(GEOComposedRoute *)self->_route destination];
  id v4 = [v3 geoMapItem];
  id v9 = [v4 _enhancedPlacement];

  id v5 = [v9 buildingIds];

  id v6 = [(MKMapView *)self->_mapView _mapLayer];
  if (v5)
  {
    id v7 = [v9 buildingIds];
    id v8 = +[NSSet setWithArray:v7];
    [v6 setSelectedBuildingFeatureIds:v8];
  }
  else
  {
    id v7 = +[NSSet set];
    [v6 setSelectedBuildingFeatureIds:v7];
  }
}

- (void)setNavigationDestinationState:(unint64_t)a3
{
  if (a3 != 2) {
    a3 = a3 == 1;
  }
  [(NavCameraController *)self->_cameraController setNavigationDestination:a3];
}

- (void)startMotion:(BOOL)a3
{
  BOOL v3 = a3;
  [(NavigationDisplay *)self _setTracking:1];
  int transportType = self->_transportType;
  if ((transportType - 1) < 2)
  {
    uint64_t v7 = 0;
  }
  else
  {
    if (transportType) {
      BOOL v6 = transportType == 3;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      [(NavigationDisplay *)self _updateCartographicConfiguration];
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = -1;
    }
  }
  id v8 = [(MKMapView *)self->_mapView _mapLayer];
  [v8 setDesiredMapMode:v7];

  id v9 = self->_matchedLocation;
  if (!v9)
  {
    if (![(MKMapView *)self->_mapView hasUserLocation]) {
      goto LABEL_12;
    }
    id v10 = objc_alloc((Class)MNLocation);
    __int16 v11 = [(MKMapView *)self->_mapView userLocation];
    long long v12 = [v11 location];
    id v9 = (MNLocation *)[v10 initWithRawLocation:v12];

    if (!v9)
    {
LABEL_12:
      long long v13 = +[MNNavigationService sharedService];
      uint64_t v14 = [v13 originalOrigin];

      if (v14)
      {
        id v15 = objc_alloc((Class)CLLocation);
        int64_t v16 = [v14 latLng];
        [v16 lat];
        double v18 = v17;
        unsigned __int8 v19 = [v14 latLng];
        [v19 lng];
        id v21 = [v15 initWithLatitude:v18 longitude:v20];

        id v9 = (MNLocation *)[objc_alloc((Class)MNLocation) initWithRawLocation:v21];
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  cameraController = self->_cameraController;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1005ED24C;
  v23[3] = &unk_1012E7D28;
  v23[4] = self;
  [(NavCameraController *)cameraController transitionToTrackingInMapMode:v7 animated:v3 startLocation:v9 startHandler:v23];
}

- (void)stopCameraMotion
{
  [(NavigationDisplay *)self _setTracking:0];
  cameraController = self->_cameraController;

  [(NavCameraController *)cameraController stopTracking];
}

- (void)pauseCameraMotion
{
  [(NavigationDisplay *)self _setTracking:0];
  cameraController = self->_cameraController;

  [(NavCameraController *)cameraController pauseTracking];
}

- (void)_startObservingChromeIfNeeded
{
  [(NavigationDisplay *)self _stopObservingChromeIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      self->_observingChrome = 1;
      id v8 = +[NSNotificationCenter defaultCenter];
      id v7 = objc_loadWeakRetained((id *)&self->_chromeViewController);
      [v8 addObserver:self selector:"_shouldUseModernMapDidUpdate:" name:@"ChromeViewControllerDidUpdateShouldUseModernMap" object:v7];
    }
  }
}

- (void)_stopObservingChromeIfNeeded
{
  p_chromeViewController = &self->_chromeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  if (WeakRetained)
  {
    BOOL observingChrome = self->_observingChrome;

    if (observingChrome)
    {
      char v6 = +[NSNotificationCenter defaultCenter];
      id v7 = objc_loadWeakRetained((id *)p_chromeViewController);
      [v6 removeObserver:self name:@"ChromeViewControllerDidUpdateShouldUseModernMap" object:v7];

      self->_BOOL observingChrome = 0;
    }
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  return [(NavigationDebugAnnotationsProvider *)self->_debugAnnotationsProvider mapView:a3 rendererForOverlay:a4];
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  return [(NavigationDebugAnnotationsProvider *)self->_debugAnnotationsProvider mapView:a3 viewForAnnotation:a4];
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 navigationDisplay:self didChangeUserTrackingMode:a4];
  }
}

- (void)mapView:(id)a3 didUpdateYaw:(double)a4
{
  id v10 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 mapView:v10 didUpdateYaw:a4];
  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained didTapMapView:v7 atPoint:CGPointMake(x, y)];
}

- (id)mapViewCurrentRouteMatch:(id)a3
{
  if ([(MNLocation *)self->_matchedLocation state] == (id)1)
  {
    id v4 = [(MNLocation *)self->_matchedLocation routeMatch];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  id v12 = a3;
  if ((unint64_t)a4 <= 1)
  {
    if (a4)
    {
      if (a5 == 1)
      {
        uint64_t v13 = 1043;
        switch(a6)
        {
          case 0:
          case 3:
            break;
          case 2:
            uint64_t v13 = 1045;
            goto LABEL_7;
          case 4:
            uint64_t v13 = 1047;
            goto LABEL_7;
          case 5:
            uint64_t v13 = 1049;
            goto LABEL_7;
          case 6:
          case 7:
            uint64_t v13 = 1002;
            goto LABEL_7;
          default:
            goto LABEL_7;
        }
      }
      else
      {
        uint64_t v13 = 1044;
        switch(a6)
        {
          case 0:
          case 2:
            break;
          case 3:
            uint64_t v13 = 1046;
            goto LABEL_7;
          case 4:
            uint64_t v13 = 1048;
            goto LABEL_7;
          case 5:
            uint64_t v13 = 1050;
            goto LABEL_7;
          case 6:
          case 7:
            uint64_t v13 = 1003;
            goto LABEL_7;
          default:
            goto LABEL_7;
        }
      }
    }
    else
    {
      uint64_t v13 = 1001;
LABEL_7:
      id v22 = v12;
      uint64_t v14 = +[MKMapService sharedService];
      id v15 = [v22 mapRegion];
      [v22 _zoomLevel];
      double v17 = v16;
      double v18 = [(NavigationDisplay *)self mapView];
      id v19 = [v18 mapType];
      uint64_t v20 = 1;
      switch((unint64_t)v19)
      {
        case 0uLL:
          break;
        case 1uLL:
        case 3uLL:
          uint64_t v20 = 2;
          break;
        case 2uLL:
        case 4uLL:
          uint64_t v20 = 3;
          break;
        default:
          if (v19 == (id)104) {
            unsigned int v21 = 4;
          }
          else {
            unsigned int v21 = 0;
          }
          if (v19 == (id)102) {
            uint64_t v20 = 1;
          }
          else {
            uint64_t v20 = v21;
          }
          break;
      }
      [v14 captureUserAction:v13 onTarget:505 eventValue:0 mapRegion:v15 zoomLevel:v20 mapType:v17];

      id v12 = v22;
    }
  }
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v12 = [v11 mapView:v6 shouldSelectLabelMarker:v7];
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 mapView:v11 didSelectLabelMarker:v6];
  }
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 mapView:v11 didDeselectLabelMarker:v6];
  }
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
  id v9 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 performSelector:a2 withObject:v9];
  }
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
  id v9 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 performSelector:a2 withObject:v9];
  }
}

- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3
{
  id v9 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 performSelector:a2 withObject:v9];
  }
}

- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3
{
  id v9 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 performSelector:a2 withObject:v9];
  }
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 performSelector:a2 withObject:v12 withObject:v7];
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 mapView:v10 regionDidChangeAnimated:v4];
  }
}

- (NavigationDisplayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavigationDisplayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (UserLocationView)userLocationAnnotationView
{
  return self->_userLocationAnnotationView;
}

- (int64_t)sky
{
  return self->_sky;
}

- (NavCameraController)cameraController
{
  return self->_cameraController;
}

- (GEOComposedWaypoint)destinationWaypoint
{
  return self->_destinationWaypoint;
}

- (void)setDestinationWaypoint:(id)a3
{
}

- (MapsSuggestionsRouteGeniusEntry)routeGeniusEntry
{
  return self->_routeGeniusEntry;
}

- (int)transportType
{
  return self->_transportType;
}

- (BOOL)isTracking
{
  return self->_tracking;
}

- (BOOL)showsRoadLabel
{
  return self->_showsRoadLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeGeniusEntry, 0);
  objc_storeStrong((id *)&self->_destinationWaypoint, 0);
  objc_storeStrong((id *)&self->_cameraController, 0);
  objc_storeStrong((id *)&self->_userLocationAnnotationView, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_driveCameraProvider, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_matchedLocation, 0);
  objc_storeStrong((id *)&self->_mapViewResponder, 0);

  objc_storeStrong((id *)&self->_debugAnnotationsProvider, 0);
}

@end