@interface NavigationDebugAnnotationsProvider
- (NavigationDebugAnnotationsProvider)initWithMapView:(id)a3;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (int64_t)userLocationMarkerMode;
- (void)_addArrivalRegionOverlay:(id)a3 fillColor:(id)a4 strokeColor:(id)a5 lineWidth:(double)a6;
- (void)_addDebugLocationAnnotationMatchedLocation:(id)a3;
- (void)_addLocationAnnotation:(id)a3 history:(id)a4;
- (void)_addStepOrManeuverOverlayForCoordinate:(id)a3 color:(id)a4;
- (void)_clearAllDebugAnnotations;
- (void)_clearDebugHistoryAnnotations;
- (void)_clearStepAndManeuverOverlays;
- (void)_updateArrivalOverlaysWithRoute:(id)a3;
- (void)_updateStepAndManeuverOverlaysWithRoute:(id)a3;
- (void)clearAllAnnotationsAndOverlays;
- (void)dealloc;
- (void)setUserLocationMarkerMode:(int64_t)a3;
- (void)updateWithLocation:(id)a3;
- (void)updateWithRoute:(id)a3;
@end

@implementation NavigationDebugAnnotationsProvider

- (NavigationDebugAnnotationsProvider)initWithMapView:(id)a3
{
  id v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NavigationDebugAnnotationsProvider;
  v6 = [(NavigationDebugAnnotationsProvider *)&v43 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapView, a3);
    v8 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
    userLocationHistory = v7->_userLocationHistory;
    v7->_userLocationHistory = v8;

    v10 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
    rawUserLocationHistory = v7->_rawUserLocationHistory;
    v7->_rawUserLocationHistory = v10;

    v12 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
    matchedUserLocationHistory = v7->_matchedUserLocationHistory;
    v7->_matchedUserLocationHistory = v12;

    objc_initWeak(&location, v7);
    v37 = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472;
    v39 = sub_100B04710;
    v40 = &unk_1012F2E00;
    objc_copyWeak(&v41, &location);
    v14 = objc_retainBlock(&v37);
    uint64_t v15 = +[NSMutableArray array];
    arrivalRegionChangedListeners = v7->_arrivalRegionChangedListeners;
    v7->_arrivalRegionChangedListeners = (NSMutableArray *)v15;

    v17 = v7->_arrivalRegionChangedListeners;
    id v18 = &_dispatch_main_q;
    v19 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v17 addObject:v19];

    v20 = v7->_arrivalRegionChangedListeners;
    v21 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v20 addObject:v21];

    v22 = v7->_arrivalRegionChangedListeners;
    v23 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v22 addObject:v23];

    v24 = v7->_arrivalRegionChangedListeners;
    v25 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v24 addObject:v25];

    v26 = v7->_arrivalRegionChangedListeners;
    v27 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v26 addObject:v27];

    v28 = v7->_arrivalRegionChangedListeners;
    v29 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v28 addObject:v29];

    v30 = v7->_arrivalRegionChangedListeners;
    v31 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v30 addObject:v31];

    v32 = v7->_arrivalRegionChangedListeners;
    v33 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v32 addObject:v33];

    v34 = v7->_arrivalRegionChangedListeners;
    v35 = _GEOConfigAddBlockListenerForKey();
    [(NSMutableArray *)v34 addObject:v35];

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_arrivalRegionChangedListeners;
  v4 = (char *)[(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        GEOConfigRemoveBlockListener();
        ++v7;
      }
      while (v5 != v7);
      id v5 = (char *)[(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  arrivalRegionChangedListeners = self->_arrivalRegionChangedListeners;
  self->_arrivalRegionChangedListeners = 0;

  v9.receiver = self;
  v9.super_class = (Class)NavigationDebugAnnotationsProvider;
  [(NavigationDebugAnnotationsProvider *)&v9 dealloc];
}

- (void)updateWithLocation:(id)a3
{
}

- (void)updateWithRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
  id v5 = a3;
  [(NavigationDebugAnnotationsProvider *)self _updateArrivalOverlaysWithRoute:v5];
  [(NavigationDebugAnnotationsProvider *)self _updateStepAndManeuverOverlaysWithRoute:v5];
}

- (void)clearAllAnnotationsAndOverlays
{
  [(NavigationDebugAnnotationsProvider *)self _clearAllDebugAnnotations];
  [(NavigationDebugAnnotationsProvider *)self _clearStepAndManeuverOverlays];
  mapView = self->_mapView;
  v4 = [(NSMapTable *)self->_renderersForOverlays keyEnumerator];
  id v5 = [v4 allObjects];
  [(MKMapView *)mapView removeOverlays:v5];

  renderersForOverlays = self->_renderersForOverlays;
  self->_renderersForOverlays = 0;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  uint64_t v6 = (MKMapView *)a3;
  id v7 = a4;
  if (self->_mapView != v6) {
    goto LABEL_2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    [v9 radius];
    if (v10 <= 0.0)
    {
      v8 = [(MKMapView *)v6 dequeueReusableAnnotationViewWithIdentifier:@"NavCircle"];
      if (!v8) {
        v8 = [[CircleAnnotationView alloc] initWithAnnotation:v9 reuseIdentifier:@"NavCircle"];
      }
    }
    else
    {
      v8 = [(MKMapView *)v6 dequeueReusableAnnotationViewWithIdentifier:@"NavDistanceCircle"];
      if (!v8) {
        v8 = [[DistanceCircleAnnotationView alloc] initWithAnnotation:v9 reuseIdentifier:@"NavDistanceCircle"];
      }
      [v9 radius];
      -[DistanceCircleAnnotationView setDistanceRadius:](v8, "setDistanceRadius:");
    }
    [v9 red];
    double v14 = v13;
    [v9 green];
    double v16 = v15;
    [v9 blue];
    double v18 = v17;
    [v9 alpha];
    [(CircleAnnotationView *)v8 setColorRed:v14 green:v16 blue:v18 alpha:v19];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_2:
      v8 = 0;
      goto LABEL_15;
    }
    id v11 = v7;
    long long v12 = [(MKMapView *)v6 dequeueReusableAnnotationViewWithIdentifier:@"NavDebugLocation"];
    if (v12)
    {
      v8 = v12;
      [(DistanceCircleAnnotationView *)v12 setDebugLocationAnnotation:v11];
    }
    else
    {
      v8 = [[DebugLocationAnnotationView alloc] initWithAnnotation:v11 debugLocationAnnotation:v11 reuseIdentifier:@"NavDebugLocation"];
    }
  }

LABEL_15:

  return v8;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a4;
  if (self->_mapView == a3)
  {
    v8 = [(NSMapTable *)self->_renderersForOverlays objectForKey:v6];
    if (!v8)
    {
      v8 = [(NSMapTable *)self->_stepAndManeuverOverlays objectForKey:v6];
    }
    id v7 = v8;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_addDebugLocationAnnotationMatchedLocation:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"NavigationShowRawGPSTrail"];

  if (v6)
  {
    if (!self->_locationShifter)
    {
      id v7 = (GEOLocationShifter *)objc_alloc_init((Class)GEOLocationShifter);
      locationShifter = self->_locationShifter;
      self->_locationShifter = v7;
    }
    id v9 = [v4 rawLocation];
    [v4 rawCoordinate];
    if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
    {
      id v10 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v4];
      id v11 = [v10 rawCoordinate];
      long long v40 = 0uLL;
      if ([(GEOLocationShifter *)self->_locationShifter shiftLatLng:v11 accuracy:&v40 shiftedCoordinate:0 shiftedAccuracy:0.0])
      {
        long long v38 = 0u;
        memset(v39, 0, 60);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v33 = 0u;
        if (v9) {
          [v9 clientLocation];
        }
        *(_OWORD *)((char *)v39 + 4) = v40;
        id v12 = objc_alloc((Class)CLLocation);
        v31[6] = v39[0];
        v31[7] = v39[1];
        v32[0] = v39[2];
        *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)((char *)&v39[2] + 12);
        v31[2] = v35;
        v31[3] = v36;
        v31[4] = v37;
        v31[5] = v38;
        v31[0] = v33;
        v31[1] = v34;
        id v13 = [v12 initWithClientLocation:v31];
      }
      else
      {

        id v13 = 0;
      }

      id v9 = v13;
    }
    if (v9)
    {
      double v14 = objc_alloc_init(DebugLocationAnnotation);
      [(DebugLocationAnnotation *)v14 setLocation:v9];
      -[DebugLocationAnnotation setLocationType:](v14, "setLocationType:", [v4 isProjected]);
      [(DebugLocationAnnotation *)v14 setNavType:self->_userLocationMarkerMode];
      double v15 = [v4 rawLocation];
      unsigned int v16 = [v15 _navigation_hasMatch];

      if (v16)
      {
        double v17 = objc_alloc_init(DebugLocationAnnotation);
        double v18 = [v4 rawLocation];
        [(DebugLocationAnnotation *)v17 setLocation:v18];

        [(DebugLocationAnnotation *)v17 setLocationType:3];
        [(DebugLocationAnnotation *)v17 setNavType:self->_userLocationMarkerMode];
      }
      else
      {
        double v17 = 0;
      }
      rawUserLocationHistory = self->_rawUserLocationHistory;
      if (!rawUserLocationHistory)
      {
        v20 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
        v21 = self->_rawUserLocationHistory;
        self->_rawUserLocationHistory = v20;

        rawUserLocationHistory = self->_rawUserLocationHistory;
      }
      [(NavigationDebugAnnotationsProvider *)self _addLocationAnnotation:v14 history:rawUserLocationHistory];
      userLocationHistory = self->_userLocationHistory;
      if (!userLocationHistory)
      {
        v23 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
        v24 = self->_userLocationHistory;
        self->_userLocationHistory = v23;

        userLocationHistory = self->_userLocationHistory;
      }
      [(NavigationDebugAnnotationsProvider *)self _addLocationAnnotation:v17 history:userLocationHistory];
    }
  }
  v25 = +[NSUserDefaults standardUserDefaults];
  unsigned int v26 = [v25 BOOLForKey:@"NavigationShowMatchedLocationTrail"];

  if (v26)
  {
    v27 = objc_alloc_init(DebugLocationAnnotation);
    [(DebugLocationAnnotation *)v27 setLocation:v4];
    [(DebugLocationAnnotation *)v27 setLocationType:2];
    [(DebugLocationAnnotation *)v27 setNavType:self->_userLocationMarkerMode];
    matchedUserLocationHistory = self->_matchedUserLocationHistory;
    if (!matchedUserLocationHistory)
    {
      v29 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
      v30 = self->_matchedUserLocationHistory;
      self->_matchedUserLocationHistory = v29;

      matchedUserLocationHistory = self->_matchedUserLocationHistory;
    }
    [(NavigationDebugAnnotationsProvider *)self _addLocationAnnotation:v27 history:matchedUserLocationHistory];
  }
}

- (void)_addLocationAnnotation:(id)a3 history:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 count] == (id)3)
  {
    id v7 = [v6 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MKMapView *)self->_mapView removeAnnotation:v7];
    }
    [v6 removeObjectAtIndex:0];
  }
  if (v9)
  {
    [v6 addObject:v9];
  }
  else
  {
    v8 = +[NSNull null];
    [v6 addObject:v8];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MKMapView *)self->_mapView addAnnotation:v9];
  }
}

- (void)_clearAllDebugAnnotations
{
}

- (void)_clearDebugHistoryAnnotations
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v3 = self->_userLocationHistory;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(MKMapView *)self->_mapView removeAnnotation:v8];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_userLocationHistory removeAllObjects];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = self->_rawUserLocationHistory;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(MKMapView *)self->_mapView removeAnnotation:v14];
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_rawUserLocationHistory removeAllObjects];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v15 = self->_matchedUserLocationHistory;
  id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      double v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v19);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:", v20, (void)v21);
        }
        double v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v17);
  }

  [(NSMutableArray *)self->_matchedUserLocationHistory removeAllObjects];
}

- (void)_updateStepAndManeuverOverlaysWithRoute:(id)a3
{
  id v4 = a3;
  [(NavigationDebugAnnotationsProvider *)self _clearStepAndManeuverOverlays];
  if (self->_mapView)
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    unsigned int v6 = [v5 BOOLForKey:@"NavigationDrawManeuverPoints"];

    if (v6)
    {
      if (!self->_stepAndManeuverOverlays)
      {
        id v7 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:512];
        stepAndManeuverOverlays = self->_stepAndManeuverOverlays;
        self->_stepAndManeuverOverlays = v7;
      }
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = [v4 steps];
      id v9 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v9)
      {
        id v10 = v9;
        id v11 = 0;
        uint64_t v38 = *(void *)v40;
        do
        {
          uint64_t v12 = 0;
          id v13 = v11;
          do
          {
            if (*(void *)v40 != v38) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v12);
            if (v13) {
              [v13 endRouteCoordinate];
            }
            id v15 = [v14 startRouteCoordinate];
            if ((GEOPolylineCoordinateEqual() & 1) == 0)
            {
              [v4 pointAtRouteCoordinate:v15];
              double v17 = v16;
              double v19 = v18;
              double v21 = v20;
              long long v22 = +[UIColor blueColor];
              -[NavigationDebugAnnotationsProvider _addStepOrManeuverOverlayForCoordinate:color:](self, "_addStepOrManeuverOverlayForCoordinate:color:", v22, v17, v19, v21);
            }
            [v4 pointAtRouteCoordinate:[v14 maneuverStartRouteCoordinate]];
            double v24 = v23;
            double v26 = v25;
            double v28 = v27;
            long long v29 = +[UIColor greenColor];
            -[NavigationDebugAnnotationsProvider _addStepOrManeuverOverlayForCoordinate:color:](self, "_addStepOrManeuverOverlayForCoordinate:color:", v29, v24, v26, v28);

            [v4 pointAtRouteCoordinate:[v14 endRouteCoordinate]];
            double v31 = v30;
            double v33 = v32;
            double v35 = v34;
            long long v36 = +[UIColor redColor];
            -[NavigationDebugAnnotationsProvider _addStepOrManeuverOverlayForCoordinate:color:](self, "_addStepOrManeuverOverlayForCoordinate:color:", v36, v31, v33, v35);

            id v11 = v14;
            uint64_t v12 = (char *)v12 + 1;
            id v13 = v11;
          }
          while (v10 != v12);
          id v10 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)_addStepOrManeuverOverlayForCoordinate:(id)a3 color:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v7 = a4;
  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(var0, var1);
  +[MKCircle circleWithCenterCoordinate:radius:](MKCircle, "circleWithCenterCoordinate:radius:", v8.latitude, v8.longitude, 2.0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [objc_alloc((Class)MKCircleRenderer) initWithCircle:v10];
  [v9 setFillColor:v7];

  [(NSMapTable *)self->_stepAndManeuverOverlays setObject:v9 forKey:v10];
  [(MKMapView *)self->_mapView addOverlay:v10];
}

- (void)_clearStepAndManeuverOverlays
{
  mapView = self->_mapView;
  id v4 = [(NSMapTable *)self->_stepAndManeuverOverlays keyEnumerator];
  id v5 = [v4 allObjects];
  [(MKMapView *)mapView removeOverlays:v5];

  stepAndManeuverOverlays = self->_stepAndManeuverOverlays;
  self->_stepAndManeuverOverlays = 0;
}

- (void)_updateArrivalOverlaysWithRoute:(id)a3
{
  id v4 = a3;
  mapView = self->_mapView;
  if (mapView)
  {
    [(NSMapTable *)self->_renderersForOverlays keyEnumerator];
    unsigned int v6 = v48 = v4;
    id v7 = [v6 allObjects];
    [(MKMapView *)mapView removeOverlays:v7];

    id v4 = v48;
    renderersForOverlays = self->_renderersForOverlays;
    self->_renderersForOverlays = 0;

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = [v48 legs];
    id v51 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v51)
    {
      uint64_t v50 = *(void *)v63;
      do
      {
        for (i = 0; i != v51; i = (char *)i + 1)
        {
          if (*(void *)v63 != v50) {
            objc_enumerationMutation(obj);
          }
          id v10 = [*(id *)(*((void *)&v62 + 1) + 8 * i) arrivalParameters];
          if (v10)
          {
            if (!self->_renderersForOverlays)
            {
              id v11 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:512];
              uint64_t v12 = self->_renderersForOverlays;
              self->_renderersForOverlays = v11;
            }
            v53 = i;
            if (GEOConfigGetBOOL()
              && [v4 pointCount]
              && [v10 endOfRouteDistanceThreshold])
            {
              [v4 pointAtRouteCoordinate:[v4 routeCoordinateAtDistance:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 routeCoordinateAtDistance:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRouteCoordinate:[v4 pointCount] - 1 beforeRoute
              id v13 = +[MKCircle circleWithCenterCoordinate:radius:](MKCircle, "circleWithCenterCoordinate:radius:");
              id v14 = [objc_alloc((Class)MKCircleRenderer) initWithCircle:v13];
              id v15 = +[UIColor greenColor];
              double v16 = [v15 colorWithAlphaComponent:0.8];
              [v14 setFillColor:v16];

              [(NSMapTable *)self->_renderersForOverlays setObject:v14 forKey:v13];
              [(MKMapView *)self->_mapView addOverlay:v13 level:0];
            }
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            v52 = v10;
            double v17 = [v10 arrivalMapRegions];
            id v18 = [v17 countByEnumeratingWithState:&v58 objects:v67 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v59;
              do
              {
                for (j = 0; j != v19; j = (char *)j + 1)
                {
                  if (*(void *)v59 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  long long v22 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
                  switch([v22 arrivalRegionAction])
                  {
                    case 2u:
                    case 3u:
                      if (GEOConfigGetBOOL())
                      {
                        double v32 = +[UIColor greenColor];
                        double v27 = [v32 colorWithAlphaComponent:0.2];

                        uint64_t v31 = +[UIColor redColor];
                        goto LABEL_28;
                      }
                      break;
                    case 4u:
                      if (GEOConfigGetBOOL())
                      {
                        double v26 = +[UIColor orangeColor];
                        double v27 = [v26 colorWithAlphaComponent:0.2];

                        double v28 = +[UIColor blackColor];
                        double v29 = 0.0;
                        goto LABEL_32;
                      }
                      break;
                    case 5u:
                      if (GEOConfigGetBOOL())
                      {
                        double v30 = +[UIColor cyanColor];
                        double v27 = [v30 colorWithAlphaComponent:0.2];

                        uint64_t v31 = +[UIColor grayColor];
LABEL_28:
                        double v28 = (void *)v31;
                        double v29 = 2.0;
                        goto LABEL_32;
                      }
                      break;
                    case 6u:
                      if (GEOConfigGetBOOL())
                      {
                        double v23 = +[UIColor yellowColor];
                        double v24 = v23;
                        double v25 = 0.15;
                        goto LABEL_31;
                      }
                      break;
                    case 7u:
                    case 8u:
                      if (GEOConfigGetBOOL())
                      {
                        double v23 = +[UIColor magentaColor];
                        double v24 = v23;
                        double v25 = 0.3;
LABEL_31:
                        double v27 = [v23 colorWithAlphaComponent:v25];

                        double v28 = +[UIColor greenColor];
                        double v29 = 3.0;
LABEL_32:
                        double v33 = [v22 arrivalRegion];
                        [(NavigationDebugAnnotationsProvider *)self _addArrivalRegionOverlay:v33 fillColor:v27 strokeColor:v28 lineWidth:v29];
                      }
                      break;
                    default:
                      continue;
                  }
                }
                id v19 = [v17 countByEnumeratingWithState:&v58 objects:v67 count:16];
              }
              while (v19);
            }

            id v10 = v52;
            i = v53;
            if (GEOConfigGetBOOL())
            {
              long long v56 = 0u;
              long long v57 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              double v34 = [v52 arrivalPoints];
              id v35 = [v34 countByEnumeratingWithState:&v54 objects:v66 count:16];
              if (v35)
              {
                id v36 = v35;
                uint64_t v37 = *(void *)v55;
                do
                {
                  for (k = 0; k != v36; k = (char *)k + 1)
                  {
                    if (*(void *)v55 != v37) {
                      objc_enumerationMutation(v34);
                    }
                    long long v39 = *(void **)(*((void *)&v54 + 1) + 8 * (void)k);
                    long long v40 = [v39 point];
                    [v40 coordinate];

                    CLLocationCoordinate2DFromGEOLocationCoordinate2D();
                    objc_super v43 = +[MKCircle circleWithCenterCoordinate:radius:](MKCircle, "circleWithCenterCoordinate:radius:", v41, v42, (double)[v39 radius]);
                    id v44 = [objc_alloc((Class)MKCircleRenderer) initWithCircle:v43];
                    v45 = +[UIColor greenColor];
                    v46 = [v45 colorWithAlphaComponent:0.3];
                    [v44 setFillColor:v46];

                    v47 = +[UIColor redColor];
                    [v44 setStrokeColor:v47];

                    [v44 setLineWidth:2.0];
                    [(NSMapTable *)self->_renderersForOverlays setObject:v44 forKey:v43];
                    [(MKMapView *)self->_mapView addOverlay:v43 level:0];
                  }
                  id v36 = [v34 countByEnumeratingWithState:&v54 objects:v66 count:16];
                }
                while (v36);
              }

              id v4 = v48;
              id v10 = v52;
              i = v53;
            }
          }
        }
        id v51 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v51);
    }
  }
}

- (void)_addArrivalRegionOverlay:(id)a3 fillColor:(id)a4 strokeColor:(id)a5 lineWidth:(double)a6
{
  id v21 = a4;
  id v10 = a5;
  id v11 = [a3 coordinates];
  uint64_t v12 = malloc_type_malloc(16 * (void)[v11 count], 0x1000040451B5BE8uLL);
  if ([v11 count])
  {
    unint64_t v13 = 0;
    id v14 = v12 + 1;
    do
    {
      id v15 = [v11 objectAtIndexedSubscript:v13];
      [v15 lat];
      uint64_t v17 = v16;
      [v15 lng];
      *(v14 - 1) = v17;
      *id v14 = v18;

      ++v13;
      v14 += 2;
    }
    while (v13 < (unint64_t)[v11 count]);
  }
  id v19 = +[MKPolygon polygonWithCoordinates:count:](MKPolygon, "polygonWithCoordinates:count:", v12, [v11 count]);
  free(v12);
  id v20 = [objc_alloc((Class)MKPolygonRenderer) initWithPolygon:v19];
  [v20 setFillColor:v21];
  [v20 setStrokeColor:v10];
  [v20 setLineWidth:a6];
  [(NSMapTable *)self->_renderersForOverlays setObject:v20 forKey:v19];
  [(MKMapView *)self->_mapView addOverlay:v19 level:0];
}

- (int64_t)userLocationMarkerMode
{
  return self->_userLocationMarkerMode;
}

- (void)setUserLocationMarkerMode:(int64_t)a3
{
  self->_userLocationMarkerMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalRegionChangedListeners, 0);
  objc_storeStrong((id *)&self->_matchedUserLocationHistory, 0);
  objc_storeStrong((id *)&self->_rawUserLocationHistory, 0);
  objc_storeStrong((id *)&self->_userLocationHistory, 0);
  objc_storeStrong((id *)&self->_stepAndManeuverOverlays, 0);
  objc_storeStrong((id *)&self->_renderersForOverlays, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end