@interface NavCameraController
- (MKMapView)mapView;
- (MNTrafficIncidentAlert)trafficIncidentAlert;
- (NSArray)searchAlongTheRoutePoints;
- (NSArray)vehiclePositionPoints;
- (NSArray)vehiclePositions;
- (NavCameraController)init;
- (NavCameraController)initWithNavigationProvider:(id)a3;
- (NavCameraNavigationProviding)navigationProvider;
- (NavCameraNavigationProviding)overrideNavigationProvider;
- (int64_t)desiredDisplayRate;
- (unint64_t)_incidentTypeForAlert:(id)a3;
- (unint64_t)navCameraMode;
- (unint64_t)navigationCameraHeadingOverride;
- (unint64_t)navigationDestination;
- (void)_restoreStateFromNavigationProvider:(id)a3;
- (void)_updateCameraInfoStylesForRoute:(id)a3 routeCoordinate:(id)a4;
- (void)_updateForCurrentStepIndex;
- (void)_updateState;
- (void)_updateWithNewRoute:(id)a3;
- (void)filterVehiclePositionsForTripsNotInSet:(id)a3;
- (void)frameVehiclePositions:(id)a3;
- (void)navigationProvider:(id)a3 didChangeNavigationDestination:(unint64_t)a4;
- (void)navigationProvider:(id)a3 didChangeNavigationState:(int)a4;
- (void)navigationProvider:(id)a3 didChangeToNavigating:(BOOL)a4;
- (void)navigationProvider:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationProvider:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6;
- (void)navigationProvider:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationProvider:(id)a3 didUpdateRoute:(id)a4 traffic:(id)a5;
- (void)navigationProvider:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)pauseTracking;
- (void)resetMapViewNavigationState;
- (void)setDesiredDisplayRate:(int64_t)a3;
- (void)setIncidentsDisabled:(BOOL)a3;
- (void)setMapView:(id)a3;
- (void)setNavCameraMode:(unint64_t)a3;
- (void)setNavigationCameraHeadingOverride:(unint64_t)a3;
- (void)setNavigationDestination:(unint64_t)a3;
- (void)setNavigationProvider:(id)a3;
- (void)setOverrideNavigationProvider:(id)a3;
- (void)setSearchAlongTheRoutePoints:(id)a3;
- (void)setTrafficIncidentAlert:(id)a3;
- (void)setVehiclePositionPoints:(id)a3;
- (void)setVehiclePositions:(id)a3;
- (void)stopTracking;
- (void)transitionToTrackingInMapMode:(int64_t)a3 animated:(BOOL)a4 startLocation:(id)a5 startHandler:(id)a6;
@end

@implementation NavCameraController

- (NavCameraController)init
{
  v3 = objc_alloc_init(NavCameraNavigationServiceProvider);
  v4 = [(NavCameraController *)self initWithNavigationProvider:v3];

  return v4;
}

- (NavCameraController)initWithNavigationProvider:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NavCameraController;
  v6 = [(NavCameraController *)&v12 init];
  if (v6)
  {
    id v7 = objc_alloc_init((Class)VKNavContext);
    v8 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v7;

    *((void *)v6 + 19) = 0;
    v6[16] = 0;
    *((_DWORD *)v6 + 12) = 0;
    *(void *)(v6 + 20) = 0;
    v6[28] = 0;
    v9 = objc_alloc_init(NavCameraCaches);
    v10 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v9;

    *((void *)v6 + 5) = 0;
    *((void *)v6 + 7) = 0x7FF0000000000000;
    *((void *)v6 + 8) = 4;
    objc_storeStrong((id *)v6 + 14, a3);
    [*((id *)v6 + 14) setDelegate:v6];
  }

  return (NavCameraController *)v6;
}

- (void)setOverrideNavigationProvider:(id)a3
{
  id v5 = (NavCameraNavigationProviding *)a3;
  p_overrideNavigationProvider = &self->_overrideNavigationProvider;
  overrideNavigationProvider = self->_overrideNavigationProvider;
  if (overrideNavigationProvider != v5)
  {
    objc_super v12 = v5;
    if (overrideNavigationProvider)
    {
      [(NavCameraNavigationProviding *)overrideNavigationProvider setDelegate:0];
      v8 = *p_overrideNavigationProvider;
      *p_overrideNavigationProvider = 0;
    }
    objc_storeStrong((id *)&self->_overrideNavigationProvider, a3);
    p_navigationProvider = &self->_navigationProvider;
    [(NavCameraNavigationProviding *)self->_navigationProvider setDelegate:0];
    if (v12)
    {
      v10 = v12;
      originalNavigationProvider = *p_navigationProvider;
      *p_navigationProvider = v10;
    }
    else
    {
      objc_storeStrong((id *)&self->_navigationProvider, self->_originalNavigationProvider);
      originalNavigationProvider = self->_originalNavigationProvider;
      self->_originalNavigationProvider = 0;
    }

    [(NavCameraController *)self _restoreStateFromNavigationProvider:self->_navigationProvider];
    [(NavCameraNavigationProviding *)self->_navigationProvider setDelegate:self];
    id v5 = v12;
  }
}

- (void)setMapView:(id)a3
{
  id v5 = (MKMapView *)a3;
  mapView = self->_mapView;
  if (mapView != v5)
  {
    v20 = v5;
    if (!v5)
    {
      id v7 = [(MKMapView *)mapView _mapLayer];
      v8 = [v7 sceneConfiguration];
      [v8 setCurrentTransportationType:4];

      v9 = [(MKMapView *)self->_mapView _mapLayer];
      v10 = [v9 sceneConfiguration];
      [v10 setNavigationState:0];
    }
    objc_storeStrong((id *)&self->_mapView, a3);
    activeCameraInfos = self->_activeCameraInfos;
    self->_activeCameraInfos = 0;

    objc_super v12 = [(MKMapView *)self->_mapView _mapLayer];
    [v12 setNavContext:self->_navContext];

    v13 = [(MKMapView *)self->_mapView _mapLayer];
    [v13 setNavCameraMode:[self navCameraMode]];

    v14 = [(MKMapView *)self->_mapView _mapLayer];
    v15 = [v14 sceneConfiguration];
    [v15 setNavCameraMode:[self navCameraMode]];

    v16 = [(MKMapView *)self->_mapView _mapLayer];
    v17 = [v16 sceneConfiguration];
    [v17 setNavigationDestination:[self navigationDestination]];

    id v5 = v20;
    if (v20)
    {
      v18 = [(NavCameraController *)self navigationProvider];

      id v5 = v20;
      if (v18)
      {
        v19 = [(NavCameraController *)self navigationProvider];
        [(NavCameraController *)self _restoreStateFromNavigationProvider:v19];

        id v5 = v20;
      }
    }
  }
}

- (int64_t)desiredDisplayRate
{
  v2 = [(MKMapView *)self->_mapView _mapLayer];
  id v3 = [v2 navigationDisplayRate];

  return (int64_t)v3;
}

- (void)setDesiredDisplayRate:(int64_t)a3
{
  id v4 = [(MKMapView *)self->_mapView _mapLayer];
  [v4 setNavigationDisplayRate:a3];
}

- (void)transitionToTrackingInMapMode:(int64_t)a3 animated:(BOOL)a4 startLocation:(id)a5 startHandler:(id)a6
{
  BOOL v7 = a4;
  id v18 = a6;
  if (a5)
  {
    id v10 = a5;
    [v10 coordinate];
    [v10 coordinate];
    VKLocationCoordinate2DMake();
    double v12 = v11;
    double v14 = v13;
    [v10 course];
    double v16 = v15;
  }
  else
  {
    double v16 = 0.0;
    double v12 = -180.0;
    double v14 = -180.0;
  }
  v17 = [(MKMapView *)self->_mapView _mapLayer];
  [v17 transitionToTracking:v7 mapMode:a3 startLocation:v18 startCourse:v12 pounceCompletionHandler:v14 v16];
}

- (void)stopTracking
{
  id v2 = [(MKMapView *)self->_mapView _mapLayer];
  [v2 stopTracking];
}

- (void)pauseTracking
{
  id v2 = [(MKMapView *)self->_mapView _mapLayer];
  [v2 pauseTracking];
}

- (void)resetMapViewNavigationState
{
  id v3 = [(MKMapView *)self->_mapView _mapLayer];
  [v3 setNavContext:0];

  id v5 = [(MKMapView *)self->_mapView _mapLayer];
  id v4 = [v5 sceneConfiguration];
  [v4 resetState];
}

- (void)setIncidentsDisabled:(BOOL)a3
{
  self->_incidentsDisabled = a3;
}

- (void)setTrafficIncidentAlert:(id)a3
{
  id v11 = a3;
  id v5 = [(MNTrafficIncidentAlert *)self->_trafficIncidentAlert alertID];
  v6 = [v11 alertID];
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  if (v7 | v8)
  {
    v9 = (void *)v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_trafficIncidentAlert, a3);
      [(NavCameraController *)self _updateState];
    }
  }
}

- (void)setSearchAlongTheRoutePoints:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_searchAlongTheRoutePoints;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_searchAlongTheRoutePoints, a3);
      [(NavCameraController *)self _updateState];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (void)frameVehiclePositions:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_vehiclePositions;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_vehiclePositions, a3);
      id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend((id)v7, "count"));
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = (id)v7;
      id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          double v14 = 0;
          do
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v16 + 1) + 8 * (void)v14) coordinate:(void)v16];
            double v15 = +[NSValue valueWithMKCoordinate:](NSValue, "valueWithMKCoordinate:");
            [v9 addObject:v15];

            double v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }

      if (![(NSArray *)self->_vehiclePositionPoints isEqualToArray:v9])
      {
        objc_storeStrong((id *)&self->_vehiclePositionPoints, v9);
        [(NavCameraController *)self _updateState];
      }
    }
  }
}

- (void)filterVehiclePositionsForTripsNotInSet:(id)a3
{
  id v4 = a3;
  id v5 = [(NavCameraController *)self vehiclePositions];
  id v6 = [v5 mutableCopy];

  if ([v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v15 = self;
    unint64_t v7 = [(NavCameraController *)self vehiclePositions];
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 tripID]);
          unsigned __int8 v14 = [v4 containsObject:v13];

          if ((v14 & 1) == 0) {
            [v6 removeObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    self = v15;
  }
  [(NavCameraController *)self frameVehiclePositions:v6];
}

- (void)_updateState
{
  id v2 = self;
  [(VKNavContext *)self->_navContext clearPointsToFrame];
  [(VKNavContext *)v2->_navContext clearAdditionalRoutesToFrame];
  id v3 = [(NavCameraController *)v2 navigationProvider];
  id v4 = [v3 route];

  id v5 = [(NavCameraController *)v2 navigationProvider];
  id v6 = [v5 alternateRoutes];

  unint64_t v7 = [(NavCameraController *)v2 navigationProvider];
  id v8 = [v7 displayedStepIndex];

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [(NavCameraController *)v2 navigationProvider];
    id v8 = [v9 stepIndex];
  }
  uint64_t v10 = [(VKNavContext *)v2->_navContext route];

  if (v10 != v4) {
    [(VKNavContext *)v2->_navContext updateWithNewRoute:v4 currentStepIndex:v8];
  }
  id v11 = [(NavCameraController *)v2 trafficIncidentAlert];

  v114 = v4;
  if (v11)
  {
    id v12 = sub_1007B7030();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Will pass traffic incident to frame", buf, 2u);
    }

    uint64_t v13 = [(NavCameraController *)v2 trafficIncidentAlert];
    [v13 incidentCoordinate];
    uint64_t v14 = GEOPolylineCoordinateCompare();

    if (v14)
    {
      double v15 = [(NavCameraController *)v2 trafficIncidentAlert];
      [v4 pointAtRouteCoordinate:[v15 incidentCoordinate]];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;

      if (v19 >= -180.0 && v19 <= 180.0 && v17 >= -90.0 && v17 <= 90.0) {
        -[VKNavContext addPointToFrame:ofType:](v2->_navContext, "addPointToFrame:ofType:", 1, v17, v19, v21);
      }
    }
    v22 = [(NavCameraController *)v2 trafficIncidentAlert];
    v23 = [v22 alternateRouteToDisplay];

    if (v23)
    {
      v110 = v6;
      v24 = sub_1007B7030();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Will pass alternate route to frame with incident", buf, 2u);
      }

      id v25 = objc_alloc_init((Class)MNRouteDivergenceFinder);
      v26 = [v25 findFirstUniqueRangeBetweenRoute:v4 andRoute:v23];
      if ([v26 count] == (id)2)
      {
        v27 = [v26 objectAtIndexedSubscript:0];
        v28 = [v27 uniqueRanges];
        if ([v28 count])
        {
          v29 = [v26 objectAtIndexedSubscript:1];
          [v29 uniqueRanges];
          v31 = v30 = v2;
          id v32 = [v31 count];

          id v2 = v30;
          id v4 = v114;
          if (v32)
          {
            v33 = [v26 objectAtIndexedSubscript:0];
            v34 = [v33 uniqueRanges];
            id v35 = [v34 coordinateRangeAtIndex:0];
            uint64_t v37 = v36;

            v38 = [v26 objectAtIndexedSubscript:1];
            v39 = [v38 uniqueRanges];
            id v40 = [v39 coordinateRangeAtIndex:0];
            uint64_t v42 = v41;

            [(VKNavContext *)v30->_navContext addRouteToFrame:v23 divergenceCoord:v40 convergenceCoord:v42];
            id v43 = v35;
            id v4 = v114;
            uint64_t v44 = v37;
            id v2 = v30;
            [(VKNavContext *)v30->_navContext addRouteToFrame:v114 divergenceCoord:v43 convergenceCoord:v44];
          }
        }
        else
        {

          id v4 = v114;
        }
      }

      id v6 = v110;
    }
  }
  if (!v2->_incidentsDisabled)
  {
    v45 = [(NavCameraController *)v2 trafficIncidentAlert];
    id v46 = [(NavCameraController *)v2 _incidentTypeForAlert:v45];

    v47 = [(NavCameraController *)v2 mapView];
    v48 = [v47 _mapLayer];
    v49 = [v48 sceneConfiguration];
    [v49 setCurrentIncidentType:v46];
  }
  v50 = [(NavCameraController *)v2 trafficIncidentAlert];

  if (!v50)
  {
    v51 = [(NavCameraController *)v2 searchAlongTheRoutePoints];
    id v52 = [v51 count];

    if (v52)
    {
      v53 = sub_1007B7030();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        v54 = [(NavCameraController *)v2 searchAlongTheRoutePoints];
        id v55 = [v54 count];
        *(_DWORD *)buf = 134217984;
        id v134 = v55;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "Will pass %lu SAR points to frame", buf, 0xCu);
      }
      v56 = [(NavCameraController *)v2 mapView];
      v57 = [v56 _mapLayer];
      v58 = [v57 sceneConfiguration];
      [v58 setSearchAlongTheRoute:1];

      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      v59 = [(NavCameraController *)v2 searchAlongTheRoutePoints];
      id v60 = [v59 countByEnumeratingWithState:&v126 objects:v132 count:16];
      if (v60)
      {
        id v61 = v60;
        uint64_t v62 = *(void *)v127;
        do
        {
          for (i = 0; i != v61; i = (char *)i + 1)
          {
            if (*(void *)v127 != v62) {
              objc_enumerationMutation(v59);
            }
            v64 = *(void **)(*((void *)&v126 + 1) + 8 * i);
            [v64 MKCoordinateValue];
            double v66 = v65;
            [v64 MKCoordinateValue];
            [(VKNavContext *)v2->_navContext addPointToFrame:2 ofType:v66];
          }
          id v61 = [v59 countByEnumeratingWithState:&v126 objects:v132 count:16];
        }
        while (v61);
      }
    }
    else
    {
      v59 = [(NavCameraController *)v2 mapView];
      v67 = [v59 _mapLayer];
      v68 = [v67 sceneConfiguration];
      [v68 setSearchAlongTheRoute:0];
    }
    v69 = [(NavCameraController *)v2 vehiclePositionPoints];
    id v70 = [v69 count];

    if (v70)
    {
      v71 = sub_1007B7030();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        v72 = [(NavCameraController *)v2 vehiclePositionPoints];
        id v73 = [v72 count];
        *(_DWORD *)buf = 134217984;
        id v134 = v73;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "Will pass %lu vehicle position points to frame", buf, 0xCu);
      }
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      v74 = [(NavCameraController *)v2 vehiclePositionPoints];
      id v75 = [v74 countByEnumeratingWithState:&v122 objects:v131 count:16];
      if (v75)
      {
        id v76 = v75;
        uint64_t v77 = *(void *)v123;
        do
        {
          for (j = 0; j != v76; j = (char *)j + 1)
          {
            if (*(void *)v123 != v77) {
              objc_enumerationMutation(v74);
            }
            v79 = *(void **)(*((void *)&v122 + 1) + 8 * (void)j);
            [v79 MKCoordinateValue];
            double v81 = v80;
            [v79 MKCoordinateValue];
            [(VKNavContext *)v2->_navContext addPointToFrame:3 ofType:v81];
          }
          id v76 = [v74 countByEnumeratingWithState:&v122 objects:v131 count:16];
        }
        while (v76);
      }
    }
    if ([v6 count])
    {
      v112 = v2;
      v82 = sub_1007B7030();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        id v83 = [v6 count];
        *(_DWORD *)buf = 134217984;
        id v134 = v83;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "Will pass %lu alternate routes to frame", buf, 0xCu);
      }

      id v84 = objc_alloc_init((Class)MNRouteDivergenceFinder);
      v85 = *(void **)GEOPolylineCoordinateInvalid;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      v111 = v6;
      id obj = v6;
      id v86 = [obj countByEnumeratingWithState:&v118 objects:v130 count:16];
      id v116 = v85;
      if (v86)
      {
        id v87 = v86;
        uint64_t v88 = *(void *)v119;
        uint64_t v113 = *(void *)v119;
        do
        {
          v89 = 0;
          id v115 = v87;
          do
          {
            if (*(void *)v119 != v88) {
              objc_enumerationMutation(obj);
            }
            uint64_t v90 = *(void *)(*((void *)&v118 + 1) + 8 * (void)v89);
            v91 = [v84 findFirstUniqueRangeBetweenRoute:v4 andRoute:v90];
            if ([v91 count] == (id)2)
            {
              v92 = [v91 objectAtIndexedSubscript:0];
              v93 = [v92 uniqueRanges];
              if ([v93 count])
              {
                v94 = v85;
                id v95 = v84;
                v96 = [v91 objectAtIndexedSubscript:1];
                v97 = [v96 uniqueRanges];
                id v98 = [v97 count];

                if (v98)
                {
                  v99 = [v91 objectAtIndexedSubscript:1];
                  v100 = [v99 uniqueRanges];
                  id v101 = [v100 coordinateRangeAtIndex:0];
                  uint64_t v103 = v102;

                  [(VKNavContext *)v112->_navContext addRouteToFrame:v90 divergenceCoord:v101 convergenceCoord:v103];
                  v104 = [v91 objectAtIndexedSubscript:0];
                  v105 = [v104 uniqueRanges];
                  id v106 = [v105 coordinateRangeAtIndex:0];
                  v108 = v107;

                  id v109 = v116;
                  if ((GEOPolylineCoordinateIsInvalid() & 1) != 0 || GEOPolylineCoordinateIsABeforeB()) {
                    id v109 = v106;
                  }
                  id v116 = v109;
                  v85 = v94;
                  id v4 = v114;
                  id v84 = v95;
                  if ((GEOPolylineCoordinateIsInvalid() & 1) != 0 || GEOPolylineCoordinateIsABeforeB()) {
                    v85 = v108;
                  }
                }
                else
                {
                  id v4 = v114;
                  id v84 = v95;
                  v85 = v94;
                }
                uint64_t v88 = v113;
                id v87 = v115;
              }
              else
              {
              }
            }

            v89 = (char *)v89 + 1;
          }
          while (v87 != v89);
          id v87 = [obj countByEnumeratingWithState:&v118 objects:v130 count:16];
        }
        while (v87);
      }

      [(VKNavContext *)v112->_navContext addRouteToFrame:v4 divergenceCoord:v116 convergenceCoord:v85];
      id v6 = v111;
    }
  }
}

- (unint64_t)_incidentTypeForAlert:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && (unint64_t v5 = (unint64_t)[v3 alertType], v5 <= 7)) {
    unint64_t v6 = qword_100F72160[v5];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)setNavCameraMode:(unint64_t)a3
{
  self->_navCameraMode = a3;
  unint64_t v5 = [(NavCameraController *)self mapView];
  unint64_t v6 = [v5 _mapLayer];
  [v6 setNavCameraMode:a3];

  id v9 = [(NavCameraController *)self mapView];
  unint64_t v7 = [v9 _mapLayer];
  id v8 = [v7 sceneConfiguration];
  [v8 setNavCameraMode:a3];
}

- (unint64_t)navigationCameraHeadingOverride
{
  return (unint64_t)[(VKNavContext *)self->_navContext navigationCameraHeadingOverride];
}

- (void)setNavigationCameraHeadingOverride:(unint64_t)a3
{
}

- (void)setNavigationDestination:(unint64_t)a3
{
  self->_navigationDestination = a3;
  id v6 = [(NavCameraController *)self mapView];
  id v4 = [v6 _mapLayer];
  unint64_t v5 = [v4 sceneConfiguration];
  [v5 setNavigationDestination:a3];
}

- (void)_restoreStateFromNavigationProvider:(id)a3
{
  id v4 = a3;
  -[NavCameraController navigationProvider:didChangeToNavigating:](self, "navigationProvider:didChangeToNavigating:", v4, [v4 isInNavigatingState]);
  -[NavCameraController navigationProvider:didChangeNavigationState:](self, "navigationProvider:didChangeNavigationState:", v4, [v4 navigationState]);
  -[NavCameraController navigationProvider:didChangeNavigationDestination:](self, "navigationProvider:didChangeNavigationDestination:", v4, [v4 navigationDestination]);
  unint64_t v5 = [v4 lastLocation];
  [(NavCameraController *)self navigationProvider:v4 didUpdateMatchedLocation:v5];

  id v6 = [v4 route];
  [(NavCameraController *)self _updateWithNewRoute:v6];

  -[NavCameraController navigationProvider:didUpdateStepIndex:segmentIndex:](self, "navigationProvider:didUpdateStepIndex:segmentIndex:", v4, [v4 stepIndex], 0);
  [v4 distanceUntilManeuver];
  double v8 = v7;
  [v4 timeUntilManeuver];
  -[NavCameraController navigationProvider:didUpdateDistanceUntilManeuver:timeUntilManeuver:forStepIndex:](self, "navigationProvider:didUpdateDistanceUntilManeuver:timeUntilManeuver:forStepIndex:", v4, [v4 stepIndex], v8, v9);
  id v11 = [v4 alternateRoutes];
  uint64_t v10 = [v4 alternateRouteTraffics];
  [(NavCameraController *)self navigationProvider:v4 didUpdateAlternateRoutes:v11 traffics:v10];
}

- (void)navigationProvider:(id)a3 didChangeToNavigating:(BOOL)a4
{
  id v5 = [a3 route];
  [(NavCameraController *)self _updateWithNewRoute:v5];
}

- (void)navigationProvider:(id)a3 didChangeNavigationState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = [(NavCameraController *)self mapView];
  id v5 = [v7 _mapLayer];
  id v6 = [v5 sceneConfiguration];
  [v6 setNavigationState:v4];
}

- (void)navigationProvider:(id)a3 didChangeNavigationDestination:(unint64_t)a4
{
}

- (void)navigationProvider:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(NavCameraController *)self navigationProvider];
  id v9 = [v8 displayedStepIndex];

  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [(NavCameraController *)self navigationProvider];
    id v9 = [v10 stepIndex];
  }
  id v11 = [v6 route];
  unsigned int v81 = [v6 navigationState];
  id v12 = [v7 routeMatch];
  id v82 = [v12 routeCoordinate];

  unint64_t v83 = (unint64_t)v9;
  uint64_t v13 = [v11 stepAtIndex:v9];
  uint64_t v14 = [v7 routeMatch];

  if (v14)
  {
    double v15 = 0.0;
    if ([v7 state] != (id)1)
    {
      double v16 = [v7 routeMatch];
      [v16 distanceFromRoute];
      double v15 = v17;
    }
    double v18 = [v7 routeMatch];
    [v18 locationCoordinate];
    double v20 = v19;
    double v22 = v21;
    v23 = [v7 routeMatch];
    [v11 distanceBetweenLocation:[v23 routeCoordinate] + 1 toPointIndex:[v11 pointCount] - 1];
    double v25 = v15 + v24;

    [v11 distance];
    self->_double distanceAlongRoute = v26 - v25;
  }
  if (!v13
    || ([v7 routeMatch],
        v27 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "distanceBetweenRouteCoordinate:andRouteCoordinate:", objc_msgSend(v27, "routeCoordinate"), objc_msgSend(v13, "endRouteCoordinate")), double v29 = v28, v27, GEOConfigGetDouble(), v29 >= v30))
  {
    self->_currentLineType = [v7 roadLineType];
    self->_currentRampType = [v7 rampType];
  }
  id v84 = v13;
  v85 = v6;
  v31 = [v7 routeMatch];
  [(VKNavContext *)self->_navContext setRouteMatch:v31];

  id v32 = [v11 traffic];
  double distanceAlongRoute = self->_distanceAlongRoute;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v34 = [v32 routeTrafficColors];
  id v35 = [v34 countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v87;
    while (2)
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v87 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        [v39 offsetMeters];
        if (v40 > distanceAlongRoute && (unint64_t)[v39 color] < 3)
        {
          [v39 offsetMeters];
          double v41 = v42 - distanceAlongRoute;
          goto LABEL_21;
        }
      }
      id v36 = [v34 countByEnumeratingWithState:&v86 objects:v90 count:16];
      if (v36) {
        continue;
      }
      break;
    }
  }
  double v41 = INFINITY;
LABEL_21:

  self->_distanceToCurrentTrafficSection = v41;
  id v43 = [v11 traffic];
  double v44 = self->_distanceAlongRoute;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v45 = [v43 routeTrafficColors];
  id v46 = [v45 countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v87;
    unint64_t v49 = 4;
LABEL_23:
    uint64_t v50 = 0;
    while (1)
    {
      if (*(void *)v87 != v48) {
        objc_enumerationMutation(v45);
      }
      v51 = *(void **)(*((void *)&v86 + 1) + 8 * v50);
      [v51 offsetMeters];
      if (v52 > v44) {
        break;
      }
      unint64_t v49 = (unint64_t)[v51 color];
      if (v47 == (id)++v50)
      {
        id v47 = [v45 countByEnumeratingWithState:&v86 objects:v90 count:16];
        if (v47) {
          goto LABEL_23;
        }
        goto LABEL_29;
      }
    }
  }
  else
  {
LABEL_29:
    unint64_t v49 = 4;
  }

  self->_currentTrafficColor = v49;
  self->_laneCount = [v11 laneCountAtRouteCoordinate:v82];
  v53 = [(NavCameraController *)self mapView];
  v54 = [v53 _mapLayer];
  id v55 = [v54 sceneConfiguration];

  [v55 setLineType:self->_currentLineType];
  [v55 setRampType:self->_currentRampType];
  [v7 speed];
  [v55 setVehicleSpeed:v56 * 3600.0 / 1000.0];
  [v55 setDistanceToCurrentTrafficSection:self->_distanceToCurrentTrafficSection];
  [v55 setTrafficColor:self->_currentTrafficColor];
  [v55 setLaneCount:self->_laneCount];
  LODWORD(v53) = [v7 speedLimitIsMPH];
  id v57 = [v7 speedLimit];
  double v58 = (double)(unint64_t)v57;
  if (v53) {
    double v58 = (double)(unint64_t)v57 * 1.609344;
  }
  [v55 setRoadSpeed:v58];
  v59 = [(NavCameraController *)self overrideNavigationProvider];

  if (v59)
  {
    id v60 = [v7 roadName];
    if ([v60 length])
    {
      id v61 = [v7 roadName];
    }
    else
    {
      id v61 = 0;
    }

    uint64_t v62 = [(NavCameraController *)self mapView];
    v63 = [v62 _mapLayer];
    [v63 setCurrentLocationText:v61];
  }
  [(NavCameraController *)self _updateCameraInfoStylesForRoute:v11 routeCoordinate:v82];
  if (!self->_hasMatchedTiles)
  {
    if (v83 >= (unint64_t)[v11 stepsCount]) {
      goto LABEL_52;
    }
    v64 = [v11 roadFeatureAtPointIndex:[v84 maneuverStartRouteCoordinate]];
    if (v64)
    {
      self->_hasMatchedTiles = 1;
      [(NavCameraCaches *)self->_navCameraCaches recalculateGroupedManeuversCaches];
    }
  }
  if (v81 == 1)
  {
    self->_isProcedingToRoute = 1;
    [v7 coordinate];
    GEOLocationCoordinate2DFromCLLocationCoordinate2D();
    double v65 = [v11 stepAtIndex:0];
    double v66 = v65;
    if (!v65) {
      goto LABEL_51;
    }
    [v11 pointAtRouteCoordinate:[v65 startRouteCoordinate]];
    GEOCalculateDistance();
    double v68 = v67;
    v69 = [(NavCameraController *)self mapView];
    id v70 = [v69 _mapLayer];
    v71 = [v70 sceneConfiguration];
    [v71 setCurrentStepLength:v68];

    v72 = [v66 getNextStep];

    if (!v72) {
      goto LABEL_51;
    }
    id v73 = [(NavCameraController *)self mapView];
    v74 = [v73 _mapLayer];
    id v75 = [v74 sceneConfiguration];
    id v76 = [v66 getNextStep];
    [v76 distance];
    [v75 setNextStepLength:];

LABEL_50:
LABEL_51:

    goto LABEL_52;
  }
  if (self->_isProcedingToRoute)
  {
    self->_isProcedingToRoute = 0;
    if (v83 < (unint64_t)[v11 stepsCount])
    {
      uint64_t v77 = [(NavCameraController *)self mapView];
      v78 = [v77 _mapLayer];
      v79 = [v78 sceneConfiguration];
      [v84 distance];
      [v79 setCurrentStepLength:];

      double v80 = [v84 getNextStep];

      if (v80)
      {
        double v66 = [(NavCameraController *)self mapView];
        id v73 = [v66 _mapLayer];
        v74 = [v73 sceneConfiguration];
        id v75 = [v84 getNextStep];
        [v75 distance];
        [v74 setNextStepLength:];
        goto LABEL_50;
      }
    }
  }
LABEL_52:
}

- (void)navigationProvider:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
}

- (void)navigationProvider:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
}

- (void)navigationProvider:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  [a3 route:a4, a5];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [(NavCameraController *)self mapView];
  uint64_t v10 = [v9 _mapLayer];
  id v11 = [v10 sceneConfiguration];
  [v11 setDistanceToCurrentManeuver:a4];

  [v17 remainingDistanceAlongRouteFromStepIndex:a6 currentStepRemainingDistance:a4];
  double v13 = v12;
  uint64_t v14 = [(NavCameraController *)self mapView];
  double v15 = [v14 _mapLayer];
  double v16 = [v15 sceneConfiguration];
  [v16 setDistanceToDestination:v13];
}

- (void)navigationProvider:(id)a3 didUpdateRoute:(id)a4 traffic:(id)a5
{
}

- (void)_updateWithNewRoute:(id)a3
{
  uint64_t v4 = +[NavCameraCaches cachesWithRoute:a3 context:self->_navContext];
  navCameraCaches = self->_navCameraCaches;
  self->_navCameraCaches = v4;

  [(NavCameraController *)self _updateState];
}

- (void)_updateForCurrentStepIndex
{
  id v3 = [(NavCameraController *)self navigationProvider];
  id v4 = [v3 displayedStepIndex];

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [(NavCameraController *)self navigationProvider];
    id v4 = [v5 stepIndex];
  }
  id v6 = [(NavCameraController *)self navigationProvider];
  id v76 = [v6 route];

  BOOL v7 = v4 >= [v76 stepsCount];
  double v8 = v76;
  if (!v7)
  {
    id v9 = [v76 stepAtIndex:v4];
    uint64_t v10 = [(NavCameraController *)self mapView];
    id v11 = [v10 _mapLayer];
    double v12 = [v11 sceneConfiguration];
    double v13 = [v9 getNextStep];
    [v13 distance];
    [v12 setNextStepLength:];

    uint64_t v14 = [(NavCameraController *)self mapView];
    double v15 = [v14 _mapLayer];
    double v16 = [v15 sceneConfiguration];
    [v9 distance];
    [v16 setCurrentStepLength:];

    id v17 = [(NavCameraController *)self mapView];
    double v18 = [v17 _mapLayer];
    double v19 = [v18 sceneConfiguration];
    double v20 = [v9 geoStep];
    [v19 setCurrentManeuverJunctionsCount:[v20 junctionElementsCount]];

    double v21 = [(NavCameraController *)self mapView];
    double v22 = [v21 _mapLayer];
    v23 = [v22 sceneConfiguration];
    [v23 setCurrentTransportationType:[v9 transportType]];

    double v24 = [v9 geoStep];
    id v25 = [v24 maneuverType];

    double v26 = [v76 roadFeatureAtPointIndex:[v9 startRouteCoordinate]];
    v27 = v26;
    if (v26)
    {
      double v28 = [v26 feature];
      double v29 = [v28 attributes];
      self->_currentLineType = [v29 lineType];

      double v30 = [v27 feature];
      v31 = [v30 attributes];
      self->_currentRampType = [v31 rampType];

      id v32 = [(NavCameraController *)self mapView];
      v33 = [v32 _mapLayer];
      v34 = [v33 sceneConfiguration];
      [v34 setLineType:self->_currentLineType];

      id v35 = [(NavCameraController *)self mapView];
      id v36 = [v35 _mapLayer];
      uint64_t v37 = [v36 sceneConfiguration];
      [v37 setRampType:self->_currentRampType];

      v38 = [(NavCameraController *)self mapView];
      v39 = [v38 _mapLayer];
      double v40 = [v39 sceneConfiguration];
      [v40 setDistanceToCurrentTrafficSection:self->_distanceToCurrentTrafficSection];

      double v41 = [(NavCameraController *)self mapView];
      double v42 = [v41 _mapLayer];
      id v43 = [v42 sceneConfiguration];
      [v43 setTrafficColor:self->_currentTrafficColor];

      double v44 = [(NavCameraController *)self mapView];
      v45 = [v44 _mapLayer];
      id v46 = [v45 sceneConfiguration];
      [v46 setLaneCount:self->_laneCount];
    }
    id v47 = [v9 transitStep];
    if ([v47 hasManeuverType]) {
      id v48 = [v47 maneuverType];
    }
    else {
      id v48 = 0;
    }
    unint64_t v49 = [(NavCameraController *)self mapView];
    uint64_t v50 = [v49 _mapLayer];
    v51 = [v50 sceneConfiguration];
    [v51 setCurrentManeuverType:v25];

    double v52 = [(NavCameraController *)self mapView];
    v53 = [v52 _mapLayer];
    v54 = [v53 sceneConfiguration];
    [v54 setCurrentTransitManeuverType:v48];

    uint64_t v55 = [(NavCameraCaches *)self->_navCameraCaches stepsWithRampCache];
    if (v55)
    {
      double v56 = (void *)v55;
      id v57 = [(NavCameraCaches *)self->_navCameraCaches stepsWithRampCache];
      id v58 = [v57 count];

      if (v4 < v58)
      {
        v59 = [(NavCameraCaches *)self->_navCameraCaches stepsWithRampCache];
        id v60 = [v59 objectAtIndexedSubscript:v4];
        if (((unint64_t)[v60 integerValue] & 0x8000000000000000) != 0)
        {
          id v63 = 0;
        }
        else
        {
          id v61 = [(NavCameraCaches *)self->_navCameraCaches stepsWithRampCache];
          uint64_t v62 = [v61 objectAtIndexedSubscript:v4];
          id v63 = [v62 integerValue];
        }
        v64 = [(NavCameraController *)self mapView];
        double v65 = [v64 _mapLayer];
        double v66 = [v65 sceneConfiguration];
        [v66 setNextManeuverRampType:v63];
      }
    }
    [(VKNavContext *)self->_navContext setCurrentStepIndex:v4];
    double v67 = [(NavCameraCaches *)self->_navCameraCaches groupedManeuverCounts];
    id v68 = [v67 count];

    if (v4 < v68)
    {
      v69 = [(NavCameraCaches *)self->_navCameraCaches groupedManeuverCounts];
      id v70 = [v69 objectAtIndexedSubscript:v4];
      id v71 = [v70 unsignedIntegerValue];

      if ((unint64_t)v71 >= 5) {
        uint64_t v72 = 5;
      }
      else {
        uint64_t v72 = (uint64_t)v71;
      }
      id v73 = [(NavCameraController *)self mapView];
      v74 = [v73 _mapLayer];
      id v75 = [v74 sceneConfiguration];
      [v75 setCurrentGroupedManeuverCount:v72];
    }
    double v8 = v76;
  }
}

- (void)_updateCameraInfoStylesForRoute:(id)a3 routeCoordinate:(id)a4
{
  id v5 = a3;
  id v6 = +[NSHashTable hashTableWithOptions:512];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  BOOL v7 = [v5 cameraInfos];
  id v8 = [v7 countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v81;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v81 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        [v12 routeCoordinateRange];
        if (GEOPolylineCoordinateInRange()) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v80 objects:v89 count:16];
    }
    while (v9);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  double v13 = [v5 mutableData];
  uint64_t v14 = [v13 updateableCameraInfos];

  id v15 = [v14 countByEnumeratingWithState:&v76 objects:v88 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v77;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v77 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = *(void **)(*((void *)&v76 + 1) + 8 * (void)j);
        [v19 routeCoordinateRange];
        if (GEOPolylineCoordinateInRange()) {
          [v6 addObject:v19];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v76 objects:v88 count:16];
    }
    while (v16);
  }
  double v56 = v5;

  double v20 = [(NavCameraController *)self mapView];
  double v21 = [v20 _mapLayer];
  double v22 = [v21 sceneConfiguration];

  activeCameraInfos = self->_activeCameraInfos;
  p_activeCameraInfos = &self->_activeCameraInfos;
  id v25 = [(NSHashTable *)activeCameraInfos copy];
  [v25 minusHashTable:v6];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v25;
  id v26 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v73;
    do
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v73 != v28) {
          objc_enumerationMutation(obj);
        }
        double v30 = *(void **)(*((void *)&v72 + 1) + 8 * (void)k);
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        v31 = [v30 styleAttributes];
        id v32 = [v31 attributes];

        id v33 = [v32 countByEnumeratingWithState:&v68 objects:v86 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v69;
          do
          {
            for (m = 0; m != v34; m = (char *)m + 1)
            {
              if (*(void *)v69 != v35) {
                objc_enumerationMutation(v32);
              }
              [v22 removeStyleAttributeKey:[m key]];
            }
            id v34 = [v32 countByEnumeratingWithState:&v68 objects:v86 count:16];
          }
          while (v34);
        }
      }
      id v27 = [obj countByEnumeratingWithState:&v72 objects:v87 count:16];
    }
    while (v27);
  }

  v54 = v6;
  id v37 = [v6 copy];
  location = (id *)p_activeCameraInfos;
  [v37 minusHashTable:*p_activeCameraInfos];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v57 = v37;
  id v38 = [v57 countByEnumeratingWithState:&v64 objects:v85 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v59 = *(void *)v65;
    do
    {
      for (n = 0; n != v39; n = (char *)n + 1)
      {
        if (*(void *)v65 != v59) {
          objc_enumerationMutation(v57);
        }
        double v41 = *(void **)(*((void *)&v64 + 1) + 8 * (void)n);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        double v42 = [v41 styleAttributes];
        id v43 = [v42 attributes];

        id v44 = [v43 countByEnumeratingWithState:&v60 objects:v84 count:16];
        if (v44)
        {
          id v45 = v44;
          uint64_t v46 = *(void *)v61;
          do
          {
            for (ii = 0; ii != v45; ii = (char *)ii + 1)
            {
              if (*(void *)v61 != v46) {
                objc_enumerationMutation(v43);
              }
              id v48 = *(void **)(*((void *)&v60 + 1) + 8 * (void)ii);
              id v49 = [v48 key];
              id v50 = [v48 value];
              id v51 = [v41 routeCoordinateRange];
              [v22 applyStyleAttributeKeyValue:v49 withValue:v50 withCoordinateRange:v51, v52];
            }
            id v45 = [v43 countByEnumeratingWithState:&v60 objects:v84 count:16];
          }
          while (v45);
        }
      }
      id v39 = [v57 countByEnumeratingWithState:&v64 objects:v85 count:16];
    }
    while (v39);
  }

  if ([v54 count]) {
    v53 = v54;
  }
  else {
    v53 = 0;
  }
  objc_storeStrong(location, v53);
}

- (NavCameraNavigationProviding)overrideNavigationProvider
{
  return self->_overrideNavigationProvider;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (NavCameraNavigationProviding)navigationProvider
{
  return self->_navigationProvider;
}

- (void)setNavigationProvider:(id)a3
{
}

- (MNTrafficIncidentAlert)trafficIncidentAlert
{
  return self->_trafficIncidentAlert;
}

- (NSArray)searchAlongTheRoutePoints
{
  return self->_searchAlongTheRoutePoints;
}

- (NSArray)vehiclePositions
{
  return self->_vehiclePositions;
}

- (void)setVehiclePositions:(id)a3
{
}

- (NSArray)vehiclePositionPoints
{
  return self->_vehiclePositionPoints;
}

- (void)setVehiclePositionPoints:(id)a3
{
}

- (unint64_t)navCameraMode
{
  return self->_navCameraMode;
}

- (unint64_t)navigationDestination
{
  return self->_navigationDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehiclePositionPoints, 0);
  objc_storeStrong((id *)&self->_vehiclePositions, 0);
  objc_storeStrong((id *)&self->_searchAlongTheRoutePoints, 0);
  objc_storeStrong((id *)&self->_trafficIncidentAlert, 0);
  objc_storeStrong((id *)&self->_navigationProvider, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_overrideNavigationProvider, 0);
  objc_storeStrong((id *)&self->_originalNavigationProvider, 0);
  objc_storeStrong((id *)&self->_activeCameraInfos, 0);
  objc_storeStrong((id *)&self->_navCameraCaches, 0);

  objc_storeStrong((id *)&self->_navContext, 0);
}

@end