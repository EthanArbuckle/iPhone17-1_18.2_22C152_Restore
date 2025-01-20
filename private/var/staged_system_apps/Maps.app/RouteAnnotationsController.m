@interface RouteAnnotationsController
- ($C79183323B9A0D5602617FF3BE5395AC)mapRectForRouteRemainingAtLocation:(id)a3;
- (MKMapView)mapView;
- (NSMutableArray)annotationTextUpdaters;
- (NSMutableDictionary)transitVehicleAnnotationsByTripID;
- (RouteAnnotationsConfiguration)configuration;
- (RouteAnnotationsController)init;
- (RouteMarkerFormatterController)routeMarkerFormatterController;
- (RouteTrafficFeatureCalculator)routeTrafficFeatureCalculator;
- (RouteTrafficFeaturesUpdater)trafficFeaturesUpdater;
- (VKPolylineGroupOverlay)routesGroupOverlay;
- (id)_routeContextBuilder;
- (void)_clearStaleVehiclePositionAnnotations;
- (void)_continueUpdateTrafficWithInitialTrafficFeatures:(id)a3 sharedTrafficFeatures:(id)a4 routes:(id)a5 includeAlternateRoutes:(BOOL)a6;
- (void)_showRouteTrafficPreferenceChanged;
- (void)_updateAnnotationForVehiclePosition:(id)a3;
- (void)_updateFocusedOverlayInGroupOverlay;
- (void)_updateMapViewRouteContextForced:(BOOL)a3 withFinishedHandler:(id)a4;
- (void)_updateOverlaysInGroupOverlay;
- (void)_updateRouteMarkerForComposedRoute:(id)a3 inContext:(id)a4;
- (void)_updateRouteMarkersInContext:(id)a3;
- (void)_updateRouteOverlayForRouteIndex:(unint64_t)a3;
- (void)_updateSelectedOverlayInGroupOverlay;
- (void)_updateTrafficFeatures;
- (void)_updateTrafficWithInitialTrafficFeatures:(id)a3;
- (void)_updateTransitVehiclePositionAnnotations;
- (void)_updateWaypointCaptions;
- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)composedRoute:(id)a3 didUpdateTrafficIncidentsOnRoute:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)routeMarkerFormatterController:(id)a3 didUpdateMarkerInfoForRoutes:(id)a4;
- (void)setAnnotationTextUpdaters:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setMapView:(id)a3;
- (void)setRouteMarkerFormatterController:(id)a3;
- (void)setRouteTrafficFeatureCalculator:(id)a3;
- (void)setRoutesGroupOverlay:(id)a3;
- (void)setTrafficFeaturesUpdater:(id)a3;
- (void)setTransitVehicleAnnotationsByTripID:(id)a3;
- (void)updateConfigurationWithBlock:(id)a3;
- (void)updateMatchedLocation:(id)a3;
@end

@implementation RouteAnnotationsController

- (void)setMapView:(id)a3
{
  v20 = (MKMapView *)a3;
  location = (id *)&self->_mapView;
  if (self->_mapView != v20)
  {
    v4 = sub_1000CC6E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v36 = self;
      __int16 v37 = 2048;
      v38 = v20;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Setting map view: %p", buf, 0x16u);
    }

    routesGroupOverlay = self->_routesGroupOverlay;
    if (routesGroupOverlay)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id obj = [(VKPolylineGroupOverlay *)routesGroupOverlay polylines];
      id v24 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
      if (v24)
      {
        uint64_t v23 = *(void *)v32;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v32 != v23) {
              objc_enumerationMutation(obj);
            }
            v7 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            v8 = [v7 composedRoute];
            v9 = [v8 waypoints];

            id v10 = [v9 countByEnumeratingWithState:&v27 objects:v41 count:16];
            if (v10)
            {
              uint64_t v11 = *(void *)v28;
              do
              {
                for (j = 0; j != v10; j = (char *)j + 1)
                {
                  if (*(void *)v28 != v11) {
                    objc_enumerationMutation(v9);
                  }
                  v13 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
                  v14 = NSStringFromSelector("styleAttributes");
                  [v13 removeObserver:self forKeyPath:v14];
                }
                id v10 = [v9 countByEnumeratingWithState:&v27 objects:v41 count:16];
              }
              while (v10);
            }
          }
          id v24 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
        }
        while (v24);
      }

      v15 = sub_1000CC6E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = self->_routesGroupOverlay;
        mapView = self->_mapView;
        *(_DWORD *)buf = 134349568;
        v36 = self;
        __int16 v37 = 2048;
        v38 = v16;
        __int16 v39 = 2048;
        v40 = mapView;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Removing existing routes group overlay: %p from map view: %p", buf, 0x20u);
      }

      [(MKMapView *)self->_mapView _removePersistentVectorOverlay:self->_routesGroupOverlay];
      v18 = self->_routesGroupOverlay;
      self->_routesGroupOverlay = 0;
    }
    [*location _clearRouteContext];
    objc_storeStrong(location, a3);
    if (*location)
    {
      [(RouteAnnotationsController *)self _updateOverlaysInGroupOverlay];
      [(RouteAnnotationsController *)self _updateSelectedOverlayInGroupOverlay];
      objc_initWeak((id *)buf, self);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100108F8C;
      v25[3] = &unk_1012E6998;
      objc_copyWeak(&v26, (id *)buf);
      [(RouteAnnotationsController *)self _updateMapViewRouteContextForced:0 withFinishedHandler:v25];
      [(RouteAnnotationsController *)self _updateTrafficFeatures];
      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_updateMapViewRouteContextForced:(BOOL)a3 withFinishedHandler:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, void))a4;
  v7 = sub_1000CC6E4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v71 = self;
    __int16 v72 = 1024;
    LODWORD(v73) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Updating route context forced: %d", buf, 0x12u);
  }

  v8 = [(RouteAnnotationsController *)self routesGroupOverlay];
  v9 = [v8 polylines];
  id v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = sub_1000CC6E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [(RouteAnnotationsController *)self routesGroupOverlay];
      v13 = [v12 polylines];
      id v14 = [v13 count];
      *(_DWORD *)buf = 134349312;
      v71 = self;
      __int16 v72 = 2048;
      id v73 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] We currently have %lu polylines", buf, 0x16u);
    }
    v15 = [(RouteAnnotationsController *)self routesGroupOverlay];
    v16 = [v15 polylines];
    v17 = [v16 allObjects];
    v18 = sub_100099700(v17, &stru_101302A38);

    v19 = [(RouteAnnotationsController *)self configuration];
    v20 = [v19 selectedRoute];

    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10093B644;
    v68[3] = &unk_1012EAE80;
    id v21 = v20;
    id v69 = v21;
    if ([v18 indexOfObjectPassingTest:v68] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = sub_1000CC6E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v53 = [(RouteAnnotationsController *)self configuration];
        uint64_t v23 = [v53 selectedRoute];
        id v24 = [v23 uniqueRouteID];
        v25 = [v24 UUIDString];
        id v26 = sub_100099700(v18, &stru_101302A58);
        *(_DWORD *)buf = 134349570;
        v71 = self;
        __int16 v72 = 2112;
        id v73 = v25;
        __int16 v74 = 2112;
        id v75 = v26;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%{public}p] Currently selected route (%@) is not part of the polylines drawn on the map (%@)", buf, 0x20u);
      }
      if (v6) {
        v6[2](v6, 0);
      }
    }
    else
    {
      [(NSMutableArray *)self->_annotationTextUpdaters removeAllObjects];
      __int16 v37 = [(RouteAnnotationsController *)self configuration];
      v38 = [v37 routes];

      __int16 v39 = [(RouteAnnotationsController *)self configuration];
      id v40 = [v39 selectedRouteIndex];

      if (v4
        || [(MKMapView *)self->_mapView _shouldUpdateSelectedRouteFromRoutes:v38 selectedRouteIndex:v40])
      {
        v41 = sub_1000CC6E4();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = sub_100099700(v38, &stru_101302A78);
          *(_DWORD *)buf = 134349570;
          v71 = self;
          __int16 v72 = 2112;
          id v73 = v42;
          __int16 v74 = 2048;
          id v75 = v40;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[%{public}p] Initiating route context update for routes: %@ with selected index: %lu", buf, 0x20u);
        }
        v43 = [(RouteAnnotationsController *)self configuration];
        v44 = [v43 currentNavigationWaypoint];

        v45 = [(RouteAnnotationsController *)self configuration];
        unsigned __int8 v46 = [v45 proximityToCurrentNavigationWaypoint];

        objc_initWeak((id *)buf, self);
        routeContextQueue = self->_routeContextQueue;
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_10093B6F0;
        v61[3] = &unk_101302AA0;
        objc_copyWeak(v66, (id *)buf);
        id v62 = v38;
        id v63 = v44;
        unsigned __int8 v67 = v46;
        v66[1] = v40;
        v64 = self;
        v65 = v6;
        id v48 = v44;
        dispatch_async(routeContextQueue, v61);

        objc_destroyWeak(v66);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v51 = sub_1000CC6E4();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v52 = sub_100099700(v38, &stru_101302AC0);
          *(_DWORD *)buf = 134349570;
          v71 = self;
          __int16 v72 = 2112;
          id v73 = v52;
          __int16 v74 = 2048;
          id v75 = v40;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "[%{public}p] NOT initiating route context update for routes: %@ with selected index: %lu", buf, 0x20u);
        }
        if (v6) {
          v6[2](v6, 0);
        }
      }
    }
  }
  else
  {
    long long v27 = [(RouteAnnotationsController *)self configuration];
    long long v28 = [v27 anchorPoints];
    id v29 = [v28 count];

    if (v29)
    {
      long long v30 = [(RouteAnnotationsController *)self configuration];
      long long v31 = [v30 anchorPoints];

      long long v32 = sub_1000CC6E4();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        unsigned int v33 = [v31 count];
        *(_DWORD *)buf = 134349312;
        v71 = self;
        __int16 v72 = 1024;
        LODWORD(v73) = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}p] No polylines currently detected, but found %d anchor points", buf, 0x12u);
      }

      objc_initWeak((id *)buf, self);
      long long v34 = self->_routeContextQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10093BD5C;
      block[3] = &unk_1012E96B8;
      v35 = &v60;
      objc_copyWeak(&v60, (id *)buf);
      id v58 = v31;
      v59 = v6;
      id v36 = v31;
      dispatch_async(v34, block);
    }
    else
    {
      v49 = sub_1000CC6E4();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v71 = self;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "[%{public}p] No polylines currently detected", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v50 = self->_routeContextQueue;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10001EE6C;
      v54[3] = &unk_1012E9730;
      v35 = &v56;
      objc_copyWeak(&v56, (id *)buf);
      v54[4] = self;
      v55 = v6;
      dispatch_async(v50, v54);
    }
    objc_destroyWeak(v35);
    objc_destroyWeak((id *)buf);
  }
}

- (RouteAnnotationsController)init
{
  v19.receiver = self;
  v19.super_class = (Class)RouteAnnotationsController;
  v2 = [(RouteAnnotationsController *)&v19 init];
  if (v2)
  {
    v3 = sub_1000CC6E4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v21 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    BOOL v4 = objc_alloc_init(RouteAnnotationsConfiguration);
    configuration = v2->_configuration;
    v2->_configuration = v4;

    v6 = objc_alloc_init(RouteTrafficFeatureCalculator);
    routeTrafficFeatureCalculator = v2->_routeTrafficFeatureCalculator;
    v2->_routeTrafficFeatureCalculator = v6;

    v8 = objc_alloc_init(RouteTrafficFeaturesUpdater);
    trafficFeaturesUpdater = v2->_trafficFeaturesUpdater;
    v2->_trafficFeaturesUpdater = v8;

    id v10 = +[NSUserDefaults standardUserDefaults];
    [v10 addObserver:v2 forKeyPath:@"__internal__AlwaysShowRouteTraffic" options:0 context:off_1015EE1B8];

    uint64_t v11 = +[TrafficIncidentsSourceManager sharedInstance];
    [v11 addObserver:v2];

    v12 = +[TrafficIncidentsStorageManager sharedInstance];
    [v12 addObserver:v2];

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.Maps.RouteAnnotations.RouteContext", v13);
    routeContextQueue = v2->_routeContextQueue;
    v2->_routeContextQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = +[NSMutableArray array];
    annotationTextUpdaters = v2->_annotationTextUpdaters;
    v2->_annotationTextUpdaters = (NSMutableArray *)v16;
  }
  return v2;
}

- (void)setConfiguration:(id)a3
{
  BOOL v4 = (RouteAnnotationsConfiguration *)a3;
  if (self->_configuration == v4) {
    goto LABEL_82;
  }
  v5 = sub_1000CC6E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v95 = self;
    __int16 v96 = 2112;
    v97 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Updating configuration: %@", buf, 0x16u);
  }
  v79 = v4;

  v6 = self->_configuration;
  v7 = (RouteAnnotationsConfiguration *)[(RouteAnnotationsConfiguration *)v4 copy];
  configuration = self->_configuration;
  self->_configuration = v7;

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v9 = [(RouteAnnotationsConfiguration *)v6 routes];
  id v10 = [v9 countByEnumeratingWithState:&v88 objects:v93 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v89;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v89 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        [v13 unregisterObserver:self];
        [v13 _maps_removeTrafficIncidentsObserver:self];
      }
      id v10 = [v9 countByEnumeratingWithState:&v88 objects:v93 count:16];
    }
    while (v10);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  dispatch_queue_t v14 = [(RouteAnnotationsConfiguration *)self->_configuration routes];
  id v15 = [v14 countByEnumeratingWithState:&v84 objects:v92 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v85;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v85 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v84 + 1) + 8 * (void)j);
        if (![(RouteAnnotationsConfiguration *)self->_configuration alternateRoutesEnabled])
        {
          objc_super v19 = [(RouteAnnotationsConfiguration *)self->_configuration selectedRoute];
          BOOL v20 = v18 == v19;

          if (!v20) {
            continue;
          }
        }
        [v18 registerObserver:self];
        [v18 _maps_addTrafficIncidentsObserver:self];
      }
      id v15 = [v14 countByEnumeratingWithState:&v84 objects:v92 count:16];
    }
    while (v15);
  }

  id v21 = [(RouteAnnotationsConfiguration *)v6 routes];
  v22 = [(RouteAnnotationsConfiguration *)self->_configuration routes];
  BOOL v23 = v21 != v22;
  if (v21 == v22)
  {
    long long v27 = v21;
  }
  else
  {
    id v24 = [(RouteAnnotationsConfiguration *)v6 routes];
    v25 = [(RouteAnnotationsConfiguration *)self->_configuration routes];
    unsigned __int8 v26 = [v24 isEqualToArray:v25];

    if (v26)
    {
      BOOL v23 = 0;
      goto LABEL_27;
    }
    long long v27 = [(RouteAnnotationsConfiguration *)self->_configuration routes];
    id v21 = sub_100099700(v27, &stru_1013029D0);
    long long v28 = [(RouteAnnotationsController *)self routeMarkerFormatterController];
    [v28 setRoutes:v21];
  }
LABEL_27:
  id v29 = [(RouteAnnotationsConfiguration *)v6 selectedRouteIndex];
  unint64_t v30 = [(RouteAnnotationsConfiguration *)self->_configuration selectedRouteIndex];
  long long v31 = self->_configuration;
  if (v29 == (id)v30 && (v6 != 0) != (v31 == 0))
  {
    HIDWORD(v75) = 0;
    unsigned int v77 = v23;
  }
  else
  {
    id v32 = [(RouteAnnotationsConfiguration *)v31 selectedRouteIndex];
    unsigned int v33 = [(RouteAnnotationsController *)self routeMarkerFormatterController];
    [v33 setSelectedRouteIndex:v32];

    unsigned int v77 = v23 | ![(RouteAnnotationsConfiguration *)v6 alternateRoutesEnabled];
    BOOL v23 = 1;
    HIDWORD(v75) = 1;
  }
  id v34 = [(RouteAnnotationsConfiguration *)v6 focusedRouteIndex];
  int v35 = v34 != (id)[(RouteAnnotationsConfiguration *)self->_configuration focusedRouteIndex] || v23;
  int v78 = v35;
  unsigned int v36 = [(RouteAnnotationsConfiguration *)v6 alternateRoutesEnabled];
  int v37 = v78;
  int v76 = v23;
  if (v36 != [(RouteAnnotationsConfiguration *)self->_configuration alternateRoutesEnabled])
  {
    int v37 = 1;
    int v76 = 1;
    unsigned int v77 = 1;
  }
  unsigned int v38 = [(RouteAnnotationsConfiguration *)v6 selectsPolyline];
  if (v38 == [(RouteAnnotationsConfiguration *)self->_configuration selectsPolyline])
  {
    if ([(RouteAnnotationsConfiguration *)self->_configuration selectsPolyline])
    {
      __int16 v39 = [(RouteAnnotationsController *)self routesGroupOverlay];
      id v40 = [v39 selectedPolyline];
      LODWORD(v75) = v40 == 0;
    }
    else
    {
      LODWORD(v75) = 0;
    }
  }
  else
  {
    LODWORD(v75) = 1;
  }
  uint64_t v41 = [(RouteAnnotationsConfiguration *)v6 originalRouteID];
  uint64_t v42 = [(RouteAnnotationsConfiguration *)self->_configuration originalRouteID];
  if (v41 | v42) {
    unsigned int v74 = [(id)v41 isEqual:v42];
  }
  else {
    unsigned int v74 = 1;
  }

  unsigned int v73 = [(RouteAnnotationsConfiguration *)v6 routeTrafficFeaturesActive];
  unsigned int v72 = [(RouteAnnotationsConfiguration *)self->_configuration routeTrafficFeaturesActive];
  id v43 = [(RouteAnnotationsConfiguration *)v6 routeMarkerOptions];
  if (v43 == (id)[(RouteAnnotationsConfiguration *)self->_configuration routeMarkerOptions]) {
    char v44 = v37;
  }
  else {
    char v44 = 1;
  }
  id v45 = [(RouteAnnotationsConfiguration *)v6 style];
  if (v45 != (id)[(RouteAnnotationsConfiguration *)self->_configuration style])
  {
    unint64_t v46 = [(RouteAnnotationsConfiguration *)self->_configuration style];
    v47 = [(RouteAnnotationsController *)self routeMarkerFormatterController];
    [v47 setFormattingStyle:v46];

    char v44 = 1;
  }
  id v48 = [(RouteAnnotationsConfiguration *)v6 selectedRouteCustomText];
  v49 = [(RouteAnnotationsConfiguration *)self->_configuration selectedRouteCustomText];
  unint64_t v50 = v48;
  unint64_t v51 = v49;
  if (v50 | v51)
  {
    v52 = (void *)v51;
    unsigned __int8 v53 = [(id)v50 isEqual:v51];

    if ((v53 & 1) == 0)
    {
      v54 = [(RouteAnnotationsConfiguration *)self->_configuration selectedRouteCustomText];
      v55 = [(RouteAnnotationsController *)self routeMarkerFormatterController];
      [v55 setSelectedRouteCustomText:v54];

      char v44 = 1;
    }
  }
  uint64_t v56 = [(RouteAnnotationsConfiguration *)v6 transitVehiclePositions];
  uint64_t v57 = [(RouteAnnotationsConfiguration *)self->_configuration transitVehiclePositions];
  if (v56 | v57) {
    unsigned __int8 v58 = [(id)v56 isEqual:v57];
  }
  else {
    unsigned __int8 v58 = 1;
  }

  v59 = [(RouteAnnotationsConfiguration *)v6 anchorPoints];
  if ((unint64_t)[v59 count] > 1)
  {
    uint64_t v61 = 2;
  }
  else
  {
    id v60 = [(RouteAnnotationsConfiguration *)v6 anchorPoints];
    uint64_t v61 = (uint64_t)[v60 count];
  }
  id v62 = [(RouteAnnotationsConfiguration *)self->_configuration anchorPoints];
  if ((unint64_t)[v62 count] > 1)
  {
    uint64_t v64 = 2;
  }
  else
  {
    id v63 = [(RouteAnnotationsConfiguration *)self->_configuration anchorPoints];
    uint64_t v64 = (uint64_t)[v63 count];
  }
  if (v61 != v64)
  {
    v65 = [(RouteAnnotationsConfiguration *)v6 anchorPoints];
    v66 = [(RouteAnnotationsConfiguration *)self->_configuration anchorPoints];
    unsigned int v67 = [v65 isEqual:v66];

    v37 |= v67 ^ 1;
  }
  unsigned int v68 = [(RouteAnnotationsConfiguration *)v6 proximityToCurrentNavigationWaypoint];
  if (v68 == [(RouteAnnotationsConfiguration *)self->_configuration proximityToCurrentNavigationWaypoint])
  {
    uint64_t v69 = [(RouteAnnotationsConfiguration *)v6 currentNavigationWaypoint];
    uint64_t v70 = [(RouteAnnotationsConfiguration *)self->_configuration currentNavigationWaypoint];
    if (v69 | v70) {
      uint64_t v71 = [(id)v69 isEqual:v70] ^ 1;
    }
    else {
      uint64_t v71 = 0;
    }
  }
  else
  {
    uint64_t v71 = 1;
  }
  if (v74 ^ 1 | v77) {
    [(RouteAnnotationsController *)self _updateOverlaysInGroupOverlay];
  }
  if (v75) {
    [(RouteAnnotationsController *)self _updateSelectedOverlayInGroupOverlay];
  }
  if (v78) {
    [(RouteAnnotationsController *)self _updateFocusedOverlayInGroupOverlay];
  }
  if (v71 | v37)
  {
    objc_initWeak((id *)buf, self);
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_10093B378;
    v80[3] = &unk_1013029F8;
    objc_copyWeak(&v81, (id *)buf);
    char v82 = v44;
    BOOL v83 = v23;
    [(RouteAnnotationsController *)self _updateMapViewRouteContextForced:v71 withFinishedHandler:v80];
    objc_destroyWeak(&v81);
    objc_destroyWeak((id *)buf);
  }
  if (v76 | v73 ^ v72) {
    [(RouteAnnotationsController *)self _updateTrafficFeatures];
  }
  if ((v58 & 1) == 0) {
    [(RouteAnnotationsController *)self _updateTransitVehiclePositionAnnotations];
  }

  BOOL v4 = v79;
LABEL_82:
}

- (void)_updateTrafficWithInitialTrafficFeatures:(id)a3
{
  id v4 = a3;
  v5 = sub_1000CC6E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349571;
    BOOL v20 = self;
    __int16 v21 = 2048;
    id v22 = [v4 count];
    __int16 v23 = 2113;
    id v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Updating traffic features with %lu initial features: %{private}@", buf, 0x20u);
  }

  v6 = [(RouteAnnotationsController *)self configuration];
  id v7 = [v6 alternateRoutesEnabled];

  v8 = [(RouteAnnotationsController *)self configuration];
  v9 = [v8 routes];

  if (!v7) {
    goto LABEL_7;
  }
  id v10 = [(RouteAnnotationsController *)self routeTrafficFeatureCalculator];
  uint64_t v11 = [v10 cachedSharedTrafficFeaturesForRoutes:v9];

  if (v11)
  {
LABEL_8:
    [(RouteAnnotationsController *)self _continueUpdateTrafficWithInitialTrafficFeatures:v4 sharedTrafficFeatures:v11 routes:v9 includeAlternateRoutes:v7];

    goto LABEL_9;
  }
  if (!GEOConfigGetBOOL())
  {
LABEL_7:
    uint64_t v11 = 0;
    goto LABEL_8;
  }
  objc_initWeak((id *)buf, self);
  v12 = [(RouteAnnotationsController *)self routeTrafficFeatureCalculator];
  id v13 = &_dispatch_main_q;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002F988;
  v14[3] = &unk_101302B50;
  objc_copyWeak(&v17, (id *)buf);
  id v15 = v4;
  id v16 = v9;
  char v18 = (char)v7;
  [v12 getSharedTrafficFeaturesForRoutes:v16 completionQueue:&_dispatch_main_q completionHandler:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
LABEL_9:
}

- (RouteTrafficFeatureCalculator)routeTrafficFeatureCalculator
{
  return self->_routeTrafficFeatureCalculator;
}

- (void)_updateSelectedOverlayInGroupOverlay
{
  v3 = [(RouteAnnotationsController *)self configuration];
  unsigned int v4 = [v3 selectsPolyline];

  if (v4)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = [(RouteAnnotationsController *)self routesGroupOverlay];
    v6 = [v5 polylines];

    id v7 = [v6 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v26;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v11 = [v10 composedRoute];
          v12 = [(RouteAnnotationsController *)self configuration];
          id v13 = [v12 selectedRoute];
          unsigned int v14 = [v11 isEqual:v13];

          if (v14)
          {
            id v7 = v10;
            goto LABEL_13;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v25 objects:v35 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v7 = 0;
  }
  id v15 = [(RouteAnnotationsController *)self routesGroupOverlay];
  id v16 = [v15 selectedPolyline];

  if (v7 != v16)
  {
    id v17 = sub_1000CC6E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      char v18 = [v7 composedRoute];
      objc_super v19 = [v18 uniqueRouteID];
      BOOL v20 = [v7 traffic];
      *(_DWORD *)buf = 134349570;
      unint64_t v30 = self;
      __int16 v31 = 2112;
      id v32 = v19;
      __int16 v33 = 2112;
      id v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Changing selected route overlay to %@ | %@", buf, 0x20u);
    }
    __int16 v21 = [(RouteAnnotationsController *)self routesGroupOverlay];
    [v21 setSelectedPolyline:v7];

    id v22 = [(RouteAnnotationsController *)self routesGroupOverlay];
    __int16 v23 = [v22 selectedPolyline];
    id v24 = [(MKMapView *)self->_mapView _mapLayer];
    [v24 setFocusedLabelsPolyline:v23];
  }
  [(RouteAnnotationsController *)self _updateTrafficFeatures];
}

- (VKPolylineGroupOverlay)routesGroupOverlay
{
  routesGroupOverlay = self->_routesGroupOverlay;
  if (!routesGroupOverlay)
  {
    unsigned int v4 = (VKPolylineGroupOverlay *)objc_alloc_init((Class)VKPolylineGroupOverlay);
    v5 = self->_routesGroupOverlay;
    self->_routesGroupOverlay = v4;

    v6 = +[NSUserDefaults standardUserDefaults];
    -[VKPolylineGroupOverlay setShowTraffic:](self->_routesGroupOverlay, "setShowTraffic:", [v6 BOOLForKey:@"__internal__AlwaysShowRouteTraffic"]);

    [(MKMapView *)self->_mapView _addPersistentVectorOverlay:self->_routesGroupOverlay];
    mapView = self->_mapView;
    uint64_t v8 = sub_1000CC6E4();
    v9 = v8;
    if (mapView)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v10 = self->_routesGroupOverlay;
        uint64_t v11 = self->_mapView;
        int v18 = 134349568;
        objc_super v19 = self;
        __int16 v20 = 2048;
        __int16 v21 = v10;
        __int16 v22 = 2048;
        __int16 v23 = v11;
        v12 = "[%{public}p] Created a new routes group overlay %p and map view: %p";
        id v13 = v9;
        os_log_type_t v14 = OS_LOG_TYPE_INFO;
        uint32_t v15 = 32;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v18, v15);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v16 = self->_routesGroupOverlay;
      int v18 = 134349312;
      objc_super v19 = self;
      __int16 v20 = 2048;
      __int16 v21 = v16;
      v12 = "[%{public}p] Created a new routes group overlay %p but we had no map; this overlay will not be rendered anywhere";
      id v13 = v9;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
      goto LABEL_7;
    }

    routesGroupOverlay = self->_routesGroupOverlay;
  }

  return routesGroupOverlay;
}

- (void)_continueUpdateTrafficWithInitialTrafficFeatures:(id)a3 sharedTrafficFeatures:(id)a4 routes:(id)a5 includeAlternateRoutes:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v48 = v10;
  id v49 = [objc_alloc((Class)NSMutableOrderedSet) initWithArray:v10];
  if (v11 && v6) {
    [v49 addObjectsFromArray:v11];
  }
  v47 = v11;
  id v13 = [(RouteAnnotationsController *)self configuration];
  v55 = [v13 selectedRoute];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v12;
  id v14 = [obj countByEnumeratingWithState:&v60 objects:v77 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v61;
    BOOL v51 = v6;
    uint64_t v50 = *(void *)v61;
    do
    {
      id v17 = 0;
      id v52 = v15;
      do
      {
        if (*(void *)v61 != v16) {
          objc_enumerationMutation(obj);
        }
        int v18 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v17);
        if (v6 || v18 == v55)
        {
          v54 = v17;
          objc_super v19 = objc_msgSend(v18, "_maps_trafficIncidentsOnRoute");
          id v20 = [v19 copy];

          id v21 = [v20 mutableCopy];
          __int16 v22 = +[TrafficIncidentsStorageManager sharedInstance];
          __int16 v23 = [v22 removedTrafficIncidentFeaturesIds];

          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v24 = v20;
          id v25 = [v24 countByEnumeratingWithState:&v56 objects:v76 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v57;
            do
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v57 != v27) {
                  objc_enumerationMutation(v24);
                }
                id v29 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                [v29 setIsOnSelectedRoute:v18 == v55];
                unint64_t v30 = [v29 uniqueString];
                unsigned int v31 = [v23 containsObject:v30];

                if (v31) {
                  [v21 removeObject:v29];
                }
              }
              id v26 = [v24 countByEnumeratingWithState:&v56 objects:v76 count:16];
            }
            while (v26);
          }

          if ([v21 count]) {
            [v49 addObjectsFromArray:v21];
          }

          LOBYTE(v6) = v51;
          uint64_t v16 = v50;
          id v15 = v52;
          id v17 = v54;
        }
        id v17 = (char *)v17 + 1;
      }
      while (v17 != v15);
      id v15 = [obj countByEnumeratingWithState:&v60 objects:v77 count:16];
    }
    while (v15);
  }

  id v32 = +[MNNavigationService sharedService];
  [v32 state];
  if (MNNavigationServiceStateIsNavigating())
  {
    __int16 v33 = +[TrafficIncidentLayoutManager sharedInstance];
    unsigned int v34 = [v33 isIncidentReportingEnabled];

    int v35 = v46;
    if (!v34) {
      goto LABEL_31;
    }
    unsigned int v36 = +[TrafficIncidentsSourceManager sharedInstance];
    id v32 = [v36 cachedVKTrafficIncidentFeatureItemsForSelectedRoute:v55];

    if ([v32 count]) {
      [v49 addObjectsFromArray:v32];
    }
  }
  else
  {
    int v35 = v46;
  }

LABEL_31:
  int v37 = sub_1000CC6E4();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    id v38 = [v49 count];
    __int16 v39 = [v35[4] _mapLayer];
    id v40 = [v35[4] window];
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = [v35[4] window];
    *(_DWORD *)buf = 134350339;
    v65 = v35;
    __int16 v66 = 2048;
    id v67 = v38;
    __int16 v68 = 2113;
    id v69 = v49;
    __int16 v70 = 2048;
    uint64_t v71 = v39;
    __int16 v72 = 2112;
    uint64_t v73 = v41;
    __int16 v74 = 2048;
    uint64_t v75 = v42;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%{public}p] Updating traffic features with %lu final features: %{private}@ on map view: %p with window: <%@: %p>", buf, 0x3Eu);
  }
  id v43 = [v35[4] _mapLayer];
  char v44 = [v49 array];
  id v45 = [v35 configuration];
  [v43 setExternalTrafficFeatures:v44 areRouteTrafficFeaturesActive:[v45 routeTrafficFeaturesActive]];
}

- (RouteAnnotationsConfiguration)configuration
{
  return self->_configuration;
}

- (void)_updateTrafficFeatures
{
  v3 = [(RouteAnnotationsController *)self configuration];
  unsigned int v4 = [v3 selectedRoute];

  v5 = sub_1000CC6E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = [v4 uniqueRouteID];
    *(_DWORD *)buf = 134349314;
    id v17 = self;
    __int16 v18 = 2114;
    objc_super v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Route: %{public}@, Updating traffic features for selected route", buf, 0x16u);
  }
  if (v4 && [v4 transportType] != 1)
  {
    v9 = [(RouteAnnotationsController *)self routeTrafficFeatureCalculator];
    uint64_t v8 = [v9 cachedTrafficFeaturesForRoute:v4];

    id v10 = sub_1000CC6E4();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v11)
      {
        *(_DWORD *)buf = 134349056;
        id v17 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Using cached traffic features", buf, 0xCu);
      }

      [(RouteAnnotationsController *)self _updateTrafficWithInitialTrafficFeatures:v8];
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 134349056;
        id v17 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Calculating traffic features", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      id v12 = [(RouteAnnotationsController *)self routeTrafficFeatureCalculator];
      id v13 = &_dispatch_main_q;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10093C494;
      v14[3] = &unk_101302B28;
      objc_copyWeak(&v15, (id *)buf);
      [v12 getTrafficFeaturesForRoute:v4 completionQueue:&_dispatch_main_q completionHandler:v14];

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
      uint64_t v8 = 0;
    }
  }
  else
  {
    id v7 = sub_1000CC6E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Composed route does not exist or is transit; removing traffic features",
        buf,
        0xCu);
    }

    uint64_t v8 = +[NSArray array];
    [(RouteAnnotationsController *)self _updateTrafficWithInitialTrafficFeatures:v8];
  }
}

- (void)_updateOverlaysInGroupOverlay
{
  v3 = +[NSMutableSet set];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  unsigned int v4 = [(RouteAnnotationsController *)self configuration];
  v5 = [v4 routes];

  id v6 = [v5 countByEnumeratingWithState:&v121 objects:v136 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v122;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v122 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v121 + 1) + 8 * i);
        BOOL v11 = [(RouteAnnotationsController *)self configuration];
        if ([v11 alternateRoutesEnabled])
        {
          BOOL v12 = 1;
        }
        else
        {
          id v13 = [(RouteAnnotationsController *)self configuration];
          id v14 = [v13 selectedRoute];
          BOOL v12 = v10 == v14;
        }
        if (v12 && v10) {
          [v3 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v121 objects:v136 count:16];
    }
    while (v7);
  }

  id v15 = [(RouteAnnotationsController *)self routesGroupOverlay];
  uint64_t v16 = [v15 polylines];
  id v17 = [v16 allObjects];

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id obj = v17;
  id v18 = [obj countByEnumeratingWithState:&v117 objects:v135 count:16];
  v100 = v3;
  if (v18)
  {
    id v19 = v18;
    id v20 = *(id *)v118;
    id v93 = *(id *)v118;
    do
    {
      id v21 = 0;
      id v97 = v19;
      do
      {
        if (*(id *)v118 != v20) {
          objc_enumerationMutation(obj);
        }
        __int16 v22 = *(void **)(*((void *)&v117 + 1) + 8 * (void)v21);
        __int16 v23 = [v22 composedRoute];
        unsigned int v24 = [v3 containsObject:v23];

        if (v24)
        {
          id v25 = [v22 composedRoute];
          [v3 removeObject:v25];
        }
        else
        {
          id v26 = [(MKMapView *)self->_mapView _mapLayer];
          uint64_t v27 = [v26 focusedLabelsPolyline];

          if (v22 == v27)
          {
            long long v28 = [(MKMapView *)self->_mapView _mapLayer];
            [v28 setFocusedLabelsPolyline:0];
          }
          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          id v29 = [v22 composedRoute];
          unint64_t v30 = [v29 waypoints];

          id v31 = [v30 countByEnumeratingWithState:&v113 objects:v134 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v114;
            do
            {
              for (j = 0; j != v32; j = (char *)j + 1)
              {
                if (*(void *)v114 != v33) {
                  objc_enumerationMutation(v30);
                }
                int v35 = *(void **)(*((void *)&v113 + 1) + 8 * (void)j);
                unsigned int v36 = NSStringFromSelector("styleAttributes");
                [v35 removeObserver:self forKeyPath:v36];
              }
              id v32 = [v30 countByEnumeratingWithState:&v113 objects:v134 count:16];
            }
            while (v32);
          }

          int v37 = sub_1000CC6E4();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            id v38 = [v22 composedRoute];
            __int16 v39 = [v38 uniqueRouteID];
            *(_DWORD *)buf = 134349314;
            v127 = self;
            __int16 v128 = 2112;
            id v129 = v39;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%{public}p] Removing route overlay for %@", buf, 0x16u);
          }
          id v25 = [(RouteAnnotationsController *)self routesGroupOverlay];
          [v25 removePolyline:v22];
          id v19 = v97;
          v3 = v100;
          id v20 = v93;
        }

        id v21 = (char *)v21 + 1;
      }
      while (v21 != v19);
      id v19 = [obj countByEnumeratingWithState:&v117 objects:v135 count:16];
    }
    while (v19);
  }

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v40 = [(RouteAnnotationsController *)self configuration];
  uint64_t v41 = [v40 routes];

  id v94 = v41;
  id v42 = [v41 countByEnumeratingWithState:&v109 objects:v133 count:16];
  if (v42)
  {
    id v44 = v42;
    uint64_t v45 = *(void *)v110;
    *(void *)&long long v43 = 134349570;
    long long v90 = v43;
    uint64_t v91 = *(void *)v110;
    do
    {
      unint64_t v46 = 0;
      id v92 = v44;
      do
      {
        if (*(void *)v110 != v45) {
          objc_enumerationMutation(v94);
        }
        v47 = *(void **)(*((void *)&v109 + 1) + 8 * (void)v46);
        if (objc_msgSend(v3, "containsObject:", v47, v90))
        {
          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          id v98 = v47;
          id v48 = [v47 waypoints];
          id v49 = [v48 countByEnumeratingWithState:&v105 objects:v132 count:16];
          if (v49)
          {
            id v50 = v49;
            uint64_t v51 = *(void *)v106;
            do
            {
              for (k = 0; k != v50; k = (char *)k + 1)
              {
                if (*(void *)v106 != v51) {
                  objc_enumerationMutation(v48);
                }
                unsigned __int8 v53 = *(void **)(*((void *)&v105 + 1) + 8 * (void)k);
                v54 = NSStringFromSelector("styleAttributes");
                [v53 addObserver:self forKeyPath:v54 options:0 context:off_1015EE1B8];
              }
              id v50 = [v48 countByEnumeratingWithState:&v105 objects:v132 count:16];
            }
            while (v50);
          }

          id v55 = objc_alloc((Class)VKPolylineOverlay);
          long long v56 = [v47 traffic];
          id v57 = [v55 initWithComposedRoute:v98 traffic:v56];

          long long v58 = sub_1000CC6E4();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            long long v59 = [v98 uniqueRouteID];
            long long v60 = [v98 traffic];
            *(_DWORD *)buf = v90;
            v127 = self;
            __int16 v128 = 2112;
            id v129 = v59;
            __int16 v130 = 2112;
            v131 = v60;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "[%{public}p] Adding route overlay for %@ | %@", buf, 0x20u);
          }
          long long v61 = [(RouteAnnotationsController *)self routesGroupOverlay];
          [v61 addPolyline:v57];

          v3 = v100;
          uint64_t v45 = v91;
          id v44 = v92;
        }
        unint64_t v46 = (char *)v46 + 1;
      }
      while (v46 != v44);
      id v44 = [v94 countByEnumeratingWithState:&v109 objects:v133 count:16];
    }
    while (v44);
  }

  long long v62 = [(RouteAnnotationsController *)self configuration];
  long long v63 = [v62 originalRouteID];

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  uint64_t v64 = [(RouteAnnotationsController *)self routesGroupOverlay];
  v65 = [v64 polylines];

  id v99 = v65;
  id v66 = [v65 countByEnumeratingWithState:&v101 objects:v125 count:16];
  id v95 = v63;
  if (v66)
  {
    id v67 = v66;
    uint64_t v68 = *(void *)v102;
    do
    {
      for (m = 0; m != v67; m = (char *)m + 1)
      {
        if (*(void *)v102 != v68) {
          objc_enumerationMutation(v99);
        }
        __int16 v70 = *(void **)(*((void *)&v101 + 1) + 8 * (void)m);
        uint64_t v71 = [v70 composedRoute];
        __int16 v72 = [v71 uniqueRouteID];
        id v73 = [v63 isEqual:v72];

        if (v73)
        {
          __int16 v74 = [(RouteAnnotationsController *)self configuration];
          id v75 = [v74 originalRouteDivergenceCoordinate];

          int v76 = [OriginalRouteDivergencePosition alloc];
          unsigned int v77 = [v70 composedRoute];
          int v78 = [(OriginalRouteDivergencePosition *)v76 initWithRouteCoordinate:v75 route:v77];

          v79 = [(MKMapView *)self->_mapView _mapLayer];
          [v79 setSkippedRouteLineSplitAnnotation:v78];

          if (([v70 skipped] & 1) == 0)
          {
            v80 = sub_1000CC6E4();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
            {
              id v81 = [(RouteAnnotationsController *)self configuration];
              [v81 originalRouteDivergenceCoordinate];
              char v82 = GEOPolylineCoordinateAsFullString();
              *(_DWORD *)buf = 134349570;
              v127 = self;
              __int16 v128 = 2112;
              id v129 = v95;
              __int16 v130 = 2112;
              v131 = v82;
              _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "[%{public}p] Marking route %@ as original route | divergence coordinate: [%@]", buf, 0x20u);

              long long v63 = v95;
            }
          }
        }
        [v70 setSkipped:v73];
      }
      id v67 = [v99 countByEnumeratingWithState:&v101 objects:v125 count:16];
    }
    while (v67);
  }

  BOOL v83 = [(RouteAnnotationsController *)self configuration];
  if ([v83 selectsPolyline])
  {
    long long v84 = [(RouteAnnotationsController *)self routesGroupOverlay];
    long long v85 = [v84 selectedPolyline];
    long long v86 = [v85 composedRoute];
    long long v87 = [(RouteAnnotationsController *)self configuration];
    long long v88 = [v87 selectedRoute];

    long long v89 = v100;
    if (v86 != v88) {
      [(RouteAnnotationsController *)self _updateSelectedOverlayInGroupOverlay];
    }
  }
  else
  {

    long long v89 = v100;
  }
}

- (void)dealloc
{
  v3 = sub_1000CC6E4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    unsigned int v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  unsigned int v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObserver:self forKeyPath:@"__internal__AlwaysShowRouteTraffic"];

  v5 = +[TrafficIncidentsSourceManager sharedInstance];
  [v5 removeObserver:self];

  id v6 = +[TrafficIncidentsStorageManager sharedInstance];
  [v6 removeObserver:self];

  id v7 = [(VKPolylineGroupOverlay *)self->_routesGroupOverlay polylines];
  uint64_t v8 = [v7 allObjects];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v8;
  id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        BOOL v11 = [v10 composedRoute];
        BOOL v12 = [v11 waypoints];

        id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v24;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
              id v18 = NSStringFromSelector("styleAttributes");
              [v17 removeObserver:self forKeyPath:v18];
            }
            id v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v14);
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }

  v22.receiver = self;
  v22.super_class = (Class)RouteAnnotationsController;
  [(RouteAnnotationsController *)&v22 dealloc];
}

- (id)_routeContextBuilder
{
  routeContextBuilder = self->_routeContextBuilder;
  if (!routeContextBuilder)
  {
    unsigned int v4 = (MKRouteContextBuilder *)objc_alloc_init((Class)MKRouteContextBuilder);
    v5 = self->_routeContextBuilder;
    self->_routeContextBuilder = v4;

    routeContextBuilder = self->_routeContextBuilder;
  }

  return routeContextBuilder;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1015EE1B8 == a6)
  {
    if ([v10 isEqualToString:@"__internal__AlwaysShowRouteTraffic"])
    {
      [(RouteAnnotationsController *)self _showRouteTrafficPreferenceChanged];
    }
    else
    {
      id v13 = NSStringFromSelector("styleAttributes");
      unsigned int v14 = [v10 isEqualToString:v13];

      if (v14)
      {
        objc_initWeak(&location, self);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10093B1AC;
        v16[3] = &unk_1012E6998;
        objc_copyWeak(&v17, &location);
        [(RouteAnnotationsController *)self _updateMapViewRouteContextForced:1 withFinishedHandler:v16];
        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      else
      {
        -[RouteAnnotationsController observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6, self, RouteAnnotationsController);
      }
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)RouteAnnotationsController;
    -[RouteAnnotationsController observeValueForKeyPath:ofObject:change:context:](&v19, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6, v15.receiver, v15.super_class);
  }
}

- (void)_showRouteTrafficPreferenceChanged
{
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v5 BOOLForKey:@"__internal__AlwaysShowRouteTraffic"];
  unsigned int v4 = [(RouteAnnotationsController *)self routesGroupOverlay];
  [v4 setShowTraffic:v3];
}

- (void)updateConfigurationWithBlock:(id)a3
{
  if (a3)
  {
    unsigned int v4 = (void (**)(id, id))a3;
    id v5 = [(RouteAnnotationsController *)self configuration];
    id v6 = [v5 mutableCopy];

    v4[2](v4, v6);
    [(RouteAnnotationsController *)self setConfiguration:v6];
  }
}

- (void)_updateFocusedOverlayInGroupOverlay
{
  id v3 = [(RouteAnnotationsController *)self configuration];
  unsigned int v4 = [v3 focusedRoute];

  if (v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [(RouteAnnotationsController *)self routesGroupOverlay];
    id v6 = [v5 polylines];

    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v11 = [v10 composedRoute];
          id v12 = [(RouteAnnotationsController *)self configuration];
          id v13 = [v12 focusedRoute];
          unsigned int v14 = [v11 isEqual:v13];

          if (v14)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    objc_super v15 = [(RouteAnnotationsController *)self routesGroupOverlay];
    id v16 = [v15 focusedPolyline];

    if (v7 != v16)
    {
      id v17 = [(RouteAnnotationsController *)self routesGroupOverlay];
      [v17 setFocusedPolyline:v7];
    }
    [(RouteAnnotationsController *)self _updateTrafficFeatures];
  }
  else
  {
    id v18 = [(RouteAnnotationsController *)self routesGroupOverlay];
    [v18 setFocusedPolyline:0];
  }
}

- (void)_updateRouteMarkersInContext:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(RouteAnnotationsController *)self configuration];
  id v6 = [v5 routes];

  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(RouteAnnotationsController *)self _updateRouteMarkerForComposedRoute:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) inContext:v4];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_updateRouteMarkerForComposedRoute:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = (MKMapView *)a4;
  if (!v7) {
    id v7 = self->_mapView;
  }
  id v8 = [(RouteAnnotationsController *)self configuration];
  unsigned __int8 v9 = [v8 routeMarkerOptions];

  id v10 = [(RouteAnnotationsController *)self configuration];
  unint64_t v11 = ((unint64_t)[v10 routeMarkerOptions] >> 1) & 1;

  long long v12 = [(RouteAnnotationsController *)self configuration];
  id v13 = [v12 selectedRoute];

  int v14 = (v13 == v6) & v9;
  if (v13 == v6) {
    int v15 = 0;
  }
  else {
    int v15 = v11;
  }
  int v16 = v14 | v15;
  if ((v14 | v15) == 1)
  {
    id v17 = [(RouteAnnotationsController *)self routeMarkerFormatterController];
    id v18 = [v17 markerInfoForRoute:v6];
  }
  else
  {
    id v18 = 0;
  }
  long long v19 = sub_1000CC6E4();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    long long v20 = [v6 uniqueRouteID];
    long long v21 = @"NO";
    if (v13 == v6) {
      long long v21 = @"YES";
    }
    long long v22 = v21;
    int v41 = 134349826;
    id v42 = self;
    __int16 v43 = 2114;
    id v44 = v20;
    __int16 v45 = 2114;
    unint64_t v46 = v22;
    __int16 v47 = 2114;
    id v48 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] Route: %{public}@ (isSelected: %{public}@), Setting route info: %{public}@", (uint8_t *)&v41, 0x2Au);
  }
  long long v23 = [v18 routeDescription];
  id v24 = [v18 etaType];
  id v25 = [v18 tollCurrency];
  long long v26 = [v18 styleAttributes];
  [(MKMapView *)v7 _setRouteContextAnnotationText:v23 etaType:v24 tollCurrency:v25 advisoryStyleAttributes:v26 forRoute:v6];

  -[MKMapView _setAlternateRouteContextAnnotationETAComparison:forRoute:](v7, "_setAlternateRouteContextAnnotationETAComparison:forRoute:", [v18 etaComparison], v6);
  if (v16)
  {
    long long v27 = [v6 legs];
    if ((unint64_t)[v27 count] < 2)
    {
      long long v29 = 0;
    }
    else
    {
      long long v28 = [(RouteAnnotationsController *)self routeMarkerFormatterController];
      long long v29 = [v28 markerInfosForLegsInRoute:v6];
    }
  }
  else
  {
    long long v29 = 0;
  }
  long long v30 = sub_100099700(v29, &stru_101302B00);
  id v31 = sub_1000CC6E4();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    id v32 = [v6 uniqueRouteID];
    uint64_t v33 = @"NO";
    if (v13 == v6) {
      uint64_t v33 = @"YES";
    }
    unsigned int v34 = v33;
    int v41 = 134349826;
    id v42 = self;
    __int16 v43 = 2114;
    id v44 = v32;
    __int16 v45 = 2114;
    unint64_t v46 = v34;
    __int16 v47 = 2114;
    id v48 = v29;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[%{public}p] Route: %{public}@ (isSelected: %{public}@), Setting leg infos: %{public}@", (uint8_t *)&v41, 0x2Au);
  }
  if ([v30 count]) {
    int v35 = v30;
  }
  else {
    int v35 = 0;
  }
  [(MKMapView *)v7 _setRouteContextAnnotationTexts:v35 forLegsInRoute:v6];
  unsigned int v36 = [(RouteAnnotationsController *)self configuration];
  int v37 = [v36 focusedRoute];
  if (v37)
  {
    id v38 = [(RouteAnnotationsController *)self configuration];
    id v39 = [v38 focusedRoute];
    BOOL v40 = v39 == v6;
  }
  else
  {
    BOOL v40 = 0;
  }

  [(MKMapView *)v7 _setRouteContextAnnotationFocus:v40 forRoute:v6];
}

- (void)_updateTransitVehiclePositionAnnotations
{
  id v3 = [(RouteAnnotationsController *)self configuration];
  id v4 = [v3 transitVehiclePositions];

  if ([v4 count])
  {
    id v5 = [(RouteAnnotationsController *)self transitVehicleAnnotationsByTripID];

    if (!v5)
    {
      id v6 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
      [(RouteAnnotationsController *)self setTransitVehicleAnnotationsByTripID:v6];
    }
  }
  [(RouteAnnotationsController *)self _clearStaleVehiclePositionAnnotations];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10093C760;
  v8[3] = &unk_1012E5D58;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  +[UIView animateWithDuration:v8 animations:0.3];
}

- (void)_updateWaypointCaptions
{
}

- (void)_updateRouteOverlayForRouteIndex:(unint64_t)a3
{
  id v5 = [(RouteAnnotationsController *)self configuration];
  id v6 = [v5 routes];
  id v7 = [v6 count];

  if ((unint64_t)v7 > a3)
  {
    id v8 = [(RouteAnnotationsController *)self configuration];
    id v9 = [v8 routes];
    id v10 = [v9 objectAtIndexedSubscript:a3];

    unint64_t v11 = sub_1000CC6E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = [v10 uniqueRouteID];
      id v13 = [(RouteAnnotationsController *)self configuration];
      id v14 = [v13 selectedRouteIndex];
      int v15 = @"NO";
      if (v14 == (id)a3) {
        int v15 = @"YES";
      }
      int v16 = v15;
      *(_DWORD *)buf = 134350082;
      __int16 v70 = self;
      __int16 v71 = 2114;
      __int16 v72 = v12;
      __int16 v73 = 2114;
      __int16 v74 = v16;
      __int16 v75 = 2080;
      int v76 = "-[RouteAnnotationsController _updateRouteOverlayForRouteIndex:]";
      __int16 v77 = 2048;
      unint64_t v78 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Route: %{public}@ (isSelected: %{public}@), %s %lu", buf, 0x34u);
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v17 = [(RouteAnnotationsController *)self routesGroupOverlay];
    id v18 = [v17 polylines];

    id v19 = [v18 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v63;
LABEL_8:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v63 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v62 + 1) + 8 * v22);
        id v24 = [v23 composedRoute];
        unsigned __int8 v25 = [v24 isEqual:v10];

        if (v25) {
          break;
        }
        if (v20 == (id)++v22)
        {
          id v20 = [v18 countByEnumeratingWithState:&v62 objects:v68 count:16];
          if (v20) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
      id v27 = v23;

      if (!v27) {
        goto LABEL_36;
      }
      id v52 = (id)a3;
      id v53 = v27;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v28 = [v27 composedRoute];
      long long v29 = [v28 waypoints];

      id v30 = [v29 countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v59;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v59 != v32) {
              objc_enumerationMutation(v29);
            }
            unsigned int v34 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            int v35 = NSStringFromSelector("styleAttributes");
            [v34 removeObserver:self forKeyPath:v35];
          }
          id v31 = [v29 countByEnumeratingWithState:&v58 objects:v67 count:16];
        }
        while (v31);
      }

      unsigned int v36 = [(RouteAnnotationsController *)self routesGroupOverlay];
      [v36 removePolyline:v53];

      [(MKMapView *)self->_mapView _clearRouteContext];
      int v37 = [(MKMapView *)self->_mapView _mapLayer];
      [v37 forceLayout];

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v38 = [v10 waypoints];
      id v39 = [v38 countByEnumeratingWithState:&v54 objects:v66 count:16];
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v55;
        do
        {
          for (j = 0; j != v40; j = (char *)j + 1)
          {
            if (*(void *)v55 != v41) {
              objc_enumerationMutation(v38);
            }
            __int16 v43 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
            id v44 = NSStringFromSelector("styleAttributes");
            [v43 addObserver:self forKeyPath:v44 options:0 context:off_1015EE1B8];
          }
          id v40 = [v38 countByEnumeratingWithState:&v54 objects:v66 count:16];
        }
        while (v40);
      }

      id v45 = objc_alloc((Class)VKPolylineOverlay);
      unint64_t v46 = [v10 traffic];
      id v47 = [v45 initWithComposedRoute:v10 traffic:v46];

      id v48 = [(RouteAnnotationsController *)self routesGroupOverlay];
      [v48 addPolyline:v47];

      id v49 = [(RouteAnnotationsController *)self configuration];
      if ([v49 selectedRouteIndex] == v52)
      {
        id v50 = [(RouteAnnotationsController *)self configuration];
        unsigned int v51 = [v50 selectsPolyline];

        long long v26 = v53;
        if (v51) {
          [(RouteAnnotationsController *)self _updateSelectedOverlayInGroupOverlay];
        }
      }
      else
      {

        long long v26 = v53;
      }
      [(RouteAnnotationsController *)self _updateMapViewRouteContextForced:0 withFinishedHandler:0];
      [(RouteAnnotationsController *)self _updateTrafficFeatures];
    }
    else
    {
LABEL_14:
      long long v26 = v18;
    }

LABEL_36:
  }
}

- (void)_updateAnnotationForVehiclePosition:(id)a3
{
  id v9 = a3;
  id v4 = [(RouteAnnotationsController *)self transitVehicleAnnotationsByTripID];
  id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 tripID]);
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    [(TransitVehiclePositionAnnotation *)v6 updateVehiclePosition:v9];
  }
  else
  {
    id v6 = [[TransitVehiclePositionAnnotation alloc] initWithVehiclePosition:v9];
    id v7 = [(RouteAnnotationsController *)self transitVehicleAnnotationsByTripID];
    id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 tripID]);
    [v7 setObject:v6 forKeyedSubscript:v8];

    [(MKMapView *)self->_mapView addAnnotation:v6];
  }
}

- (void)_clearStaleVehiclePositionAnnotations
{
  id v3 = [(RouteAnnotationsController *)self transitVehicleAnnotationsByTripID];
  id v4 = [v3 allKeys];
  id v5 = [v4 mutableCopy];

  id v6 = [(RouteAnnotationsController *)self configuration];
  id v7 = [v6 transitVehiclePositions];
  id v8 = sub_100099700(v7, &stru_101302B90);

  [v5 removeObjectsInArray:v8];
  if ([v5 count])
  {
    id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v5 count]];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v14);
          int v16 = [(RouteAnnotationsController *)self transitVehicleAnnotationsByTripID];
          id v17 = [v16 objectForKeyedSubscript:v15];

          if (v17) {
            [v9 addObject:v17];
          }

          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    id v18 = [(RouteAnnotationsController *)self transitVehicleAnnotationsByTripID];
    [v18 removeObjectsForKeys:v10];

    [(MKMapView *)self->_mapView removeAnnotations:v9];
  }
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectForRouteRemainingAtLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteAnnotationsController *)self configuration];
  id v6 = [v5 selectedRoute];

  id v7 = [v4 routeMatch];
  id v8 = v7;
  if (v7 && ([v7 route], id v9 = objc_claimAutoreleasedReturnValue(), v9, v9 == v6))
  {
    long long v28 = (char *)[v8 stepIndex];
    uint64_t v29 = [v8 routeCoordinate];
    id v30 = [v6 steps];
    id v31 = [v30 objectAtIndexedSubscript:v28];
    [v6 _maps_boundingRectForStep:v31 fromPoint:v29];
    double x = v32;
    double y = v33;
    double width = v34;
    double height = v35;

    while (1)
    {
      ++v28;
      unsigned int v36 = [v6 steps];
      int v37 = (char *)[v36 count];

      if (v28 >= v37) {
        break;
      }
      id v38 = [v6 steps];
      id v39 = [v38 objectAtIndexedSubscript:v28];
      [v6 _maps_boundingRectForStep:v39];
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;

      v51.origin.double x = x;
      v51.origin.double y = y;
      v51.size.double width = width;
      v51.size.double height = height;
      v54.origin.double x = v41;
      v54.origin.double y = v43;
      v54.size.double width = v45;
      v54.size.double height = v47;
      MKMapRect v52 = MKMapRectUnion(v51, v54);
      double x = v52.origin.x;
      double y = v52.origin.y;
      double width = v52.size.width;
      double height = v52.size.height;
    }
  }
  else
  {
    [v6 _maps_boundingMapRect];
    double x = v10;
    double y = v12;
    double width = v14;
    double height = v16;
  }
  if (v4)
  {
    [v4 coordinate];
    MKMapPoint v18 = MKMapPointForCoordinate(v48);
    double v19 = v18.x;
    double v20 = v18.y;
    BOOL v21 = y == MKMapRectNull.origin.y && x == MKMapRectNull.origin.x;
    if (v21 || width == 0.0 || height == 0.0)
    {
      MKCoordinateForMapPoint(v18);
      MKMapRectMakeWithRadialDistance();
    }
    else
    {
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      v49.origin.double x = x;
      v49.origin.double y = y;
      v49.size.double width = width;
      v49.size.double height = height;
      MKMapRect v50 = MKMapRectUnion(v49, *(MKMapRect *)&v19);
    }
    double x = v50.origin.x;
    double y = v50.origin.y;
    double width = v50.size.width;
    double height = v50.size.height;
  }

  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.var1.var1 = v27;
  result.var1.var0 = v26;
  result.var0.var1 = v25;
  result.var0.var0 = v24;
  return result;
}

- (void)updateMatchedLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteAnnotationsController *)self configuration];
  id v6 = [v5 selectedRoute];

  if (v6)
  {
    if ([v4 state] == (id)1)
    {
      id v7 = [v4 routeMatch];
      id v8 = [v7 route];

      if (v8 == v6)
      {
        id v9 = [(MKMapView *)self->_mapView _mapLayer];
        double v10 = [v4 routeMatch];
        objc_msgSend(v9, "setRouteUserOffset:", objc_msgSend(v10, "routeCoordinate"));

        if ([v6 transportType] != 1)
        {
          id v11 = [(RouteAnnotationsController *)self routeTrafficFeatureCalculator];
          double v12 = [v11 cachedTrafficFeaturesForRoute:v6];

          if (v12)
          {
            uint64_t v13 = [(RouteAnnotationsController *)self trafficFeaturesUpdater];
            [v13 updateTrafficFeatures:v12 onRoute:v6 forLocation:v4];
          }
          else
          {
            objc_initWeak(&location, self);
            double v14 = [(RouteAnnotationsController *)self routeTrafficFeatureCalculator];
            id v15 = &_dispatch_main_q;
            v16[0] = _NSConcreteStackBlock;
            v16[1] = 3221225472;
            v16[2] = sub_10093D5B0;
            v16[3] = &unk_101302BB8;
            id v17 = v6;
            objc_copyWeak(&v19, &location);
            id v18 = v4;
            [v14 getTrafficFeaturesForRoute:v17 completionQueue:&_dispatch_main_q completionHandler:v16];

            objc_destroyWeak(&v19);
            objc_destroyWeak(&location);
          }
        }
      }
    }
  }
}

- (RouteMarkerFormatterController)routeMarkerFormatterController
{
  routeMarkerFormatterController = self->_routeMarkerFormatterController;
  if (!routeMarkerFormatterController)
  {
    id v4 = [[RouteMarkerFormatterController alloc] initWithDelegate:self];
    id v5 = self->_routeMarkerFormatterController;
    self->_routeMarkerFormatterController = v4;

    routeMarkerFormatterController = self->_routeMarkerFormatterController;
  }

  return routeMarkerFormatterController;
}

- (void)routeMarkerFormatterController:(id)a3 didUpdateMarkerInfoForRoutes:(id)a4
{
  id v5 = a4;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(RouteAnnotationsController *)self _updateRouteMarkerForComposedRoute:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) inContext:0];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v7 = [a3 uniqueRouteID];
  uint64_t v8 = [(RouteAnnotationsController *)self configuration];
  id v9 = [v8 routes];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10093D8BC;
  v12[3] = &unk_1012EAE80;
  id v10 = v7;
  id v13 = v10;
  id v11 = [v9 indexOfObjectPassingTest:v12];

  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [(RouteAnnotationsController *)self _updateRouteOverlayForRouteIndex:v11];
  }
}

- (void)composedRoute:(id)a3 didUpdateTrafficIncidentsOnRoute:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  val = self;
  id v7 = [(RouteAnnotationsController *)self routeTrafficFeatureCalculator];
  [v7 clearCachedTrafficFeaturesForRoute:v6];

  uint64_t v8 = [(RouteAnnotationsController *)self routeTrafficFeatureCalculator];
  id v9 = [(RouteAnnotationsController *)self configuration];
  id v10 = [v9 routes];
  [v8 clearCachedSharedTrafficFeaturesForRoutes:v10];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = [(RouteAnnotationsController *)self routesGroupOverlay];
  long long v12 = [v11 polylines];

  id v13 = [v12 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v34;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v12);
        }
        double v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v17 = [v16 composedRoute];
        id v18 = [v17 uniqueRouteID];
        id v19 = [v6 uniqueRouteID];
        unsigned int v20 = [v18 isEqual:v19];

        if (v20)
        {
          id v13 = v16;
          goto LABEL_11;
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  BOOL v21 = sub_1000CC6E4();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = [v6 uniqueRouteID];
    uint64_t v23 = [v6 traffic];
    *(_DWORD *)buf = 134349570;
    id v38 = val;
    __int16 v39 = 2112;
    double v40 = v22;
    __int16 v41 = 2112;
    double v42 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] Updating traffic for %@ | %@", buf, 0x20u);
  }
  double v24 = [v6 traffic];
  [v13 updateTraffic:v24];

  objc_initWeak((id *)buf, val);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10093DCA0;
  v30[3] = &unk_1012E5D30;
  objc_copyWeak(&v32, (id *)buf);
  id v25 = v6;
  id v31 = v25;
  [(RouteAnnotationsController *)val _updateMapViewRouteContextForced:1 withFinishedHandler:v30];
  double v26 = [v25 _maps_trafficIncidentsOnRoute];
  BOOL v27 = [v26 count] == 0;

  if (!v27) {
    [(RouteAnnotationsController *)val _updateTrafficFeatures];
  }

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setRouteTrafficFeatureCalculator:(id)a3
{
}

- (RouteTrafficFeaturesUpdater)trafficFeaturesUpdater
{
  return self->_trafficFeaturesUpdater;
}

- (void)setTrafficFeaturesUpdater:(id)a3
{
}

- (void)setRoutesGroupOverlay:(id)a3
{
}

- (void)setRouteMarkerFormatterController:(id)a3
{
}

- (NSMutableDictionary)transitVehicleAnnotationsByTripID
{
  return self->_transitVehicleAnnotationsByTripID;
}

- (void)setTransitVehicleAnnotationsByTripID:(id)a3
{
}

- (NSMutableArray)annotationTextUpdaters
{
  return self->_annotationTextUpdaters;
}

- (void)setAnnotationTextUpdaters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationTextUpdaters, 0);
  objc_storeStrong((id *)&self->_transitVehicleAnnotationsByTripID, 0);
  objc_storeStrong((id *)&self->_routeMarkerFormatterController, 0);
  objc_storeStrong((id *)&self->_routesGroupOverlay, 0);
  objc_storeStrong((id *)&self->_trafficFeaturesUpdater, 0);
  objc_storeStrong((id *)&self->_routeTrafficFeatureCalculator, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_routeContextBuilder, 0);

  objc_storeStrong((id *)&self->_routeContextQueue, 0);
}

@end