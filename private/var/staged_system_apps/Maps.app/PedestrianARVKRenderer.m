@interface PedestrianARVKRenderer
- (BOOL)shouldGenerateFeatures;
- (BOOL)shouldShowFeatures;
- (GEOComposedRoute)route;
- (GuidanceObserver)guidanceObserver;
- (MNGuidanceARInfo)arrivalGuidanceInfo;
- (MNNavigationService)navigationService;
- (NSArray)continueEntries;
- (NSArray)continueGuidanceInfos;
- (NSArray)guidanceInfos;
- (NSArray)maneuverEntries;
- (NSArray)maneuverGuidanceInfos;
- (PedestrianARVKFeatureMapEntry)arrivalEntry;
- (PedestrianARVKMapViewMapDelegate)mapViewDelegate;
- (PedestrianARVKRenderer)initWithMapView:(id)a3 navigationService:(id)a4 mapViewDelegate:(id)a5 guidanceObserver:(id)a6;
- (VKMapView)mapView;
- (unint64_t)lastManeuverStepIndex;
- (void)clearAnchors;
- (void)dealloc;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)rebuildAnchors;
- (void)setArrivalEntry:(id)a3;
- (void)setContinueEntries:(id)a3;
- (void)setGuidanceInfos:(id)a3;
- (void)setGuidanceObserver:(id)a3;
- (void)setLastManeuverStepIndex:(unint64_t)a3;
- (void)setManeuverEntries:(id)a3;
- (void)setMapView:(id)a3;
- (void)setMapViewDelegate:(id)a3;
- (void)setNavigationService:(id)a3;
- (void)setRoute:(id)a3;
- (void)setShouldGenerateFeatures:(BOOL)a3;
- (void)setShouldShowFeatures:(BOOL)a3;
- (void)updateARSigns:(id)a3;
@end

@implementation PedestrianARVKRenderer

- (PedestrianARVKRenderer)initWithMapView:(id)a3 navigationService:(id)a4 mapViewDelegate:(id)a5 guidanceObserver:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v19 = sub_1005762E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[PedestrianARVKRenderer initWithMapView:navigationService:mapViewDelegate:guidanceObserver:]";
      __int16 v34 = 2080;
      v35 = "PedestrianARVKRenderer.m";
      __int16 v36 = 1024;
      int v37 = 96;
      __int16 v38 = 2080;
      v39 = "mapView != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v33 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v12)
  {
    v22 = sub_1005762E4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[PedestrianARVKRenderer initWithMapView:navigationService:mapViewDelegate:guidanceObserver:]";
      __int16 v34 = 2080;
      v35 = "PedestrianARVKRenderer.m";
      __int16 v36 = 1024;
      int v37 = 97;
      __int16 v38 = 2080;
      v39 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v33 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v13)
  {
    v25 = sub_1005762E4();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[PedestrianARVKRenderer initWithMapView:navigationService:mapViewDelegate:guidanceObserver:]";
      __int16 v34 = 2080;
      v35 = "PedestrianARVKRenderer.m";
      __int16 v36 = 1024;
      int v37 = 98;
      __int16 v38 = 2080;
      v39 = "mapViewDelegate != nil";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v26 = sub_1005762E4();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v33 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v14)
  {
    v28 = sub_1005762E4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[PedestrianARVKRenderer initWithMapView:navigationService:mapViewDelegate:guidanceObserver:]";
      __int16 v34 = 2080;
      v35 = "PedestrianARVKRenderer.m";
      __int16 v36 = 1024;
      int v37 = 99;
      __int16 v38 = 2080;
      v39 = "guidanceObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v29 = sub_1005762E4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v33 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)PedestrianARVKRenderer;
  v15 = [(PedestrianARVKRenderer *)&v31 init];
  if (v15)
  {
    v16 = sub_10092CF24();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v33 = (const char *)v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v15->_mapView, a3);
    objc_storeStrong((id *)&v15->_navigationService, a4);
    objc_storeWeak((id *)&v15->_mapViewDelegate, v13);
    objc_storeStrong((id *)&v15->_guidanceObserver, a6);
    v15->_lastManeuverStepIndex = -1;
    [(MNNavigationService *)v15->_navigationService registerObserver:v15];
    [(GuidanceObserver *)v15->_guidanceObserver addOutlet:v15 forOwner:0];
    [(GuidanceObserver *)v15->_guidanceObserver repeatAllUpdatesForOutlet:v15];
    v17 = +[NSUserDefaults standardUserDefaults];
    [v17 addObserver:v15 forKeyPath:@"PedestrianARInjectFakeStorefrontArrivalDataKey" options:1 context:0];
  }
  return v15;
}

- (void)dealloc
{
  v3 = sub_10092CF24();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocing", buf, 0xCu);
  }

  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObserver:self forKeyPath:@"PedestrianARInjectFakeStorefrontArrivalDataKey"];

  [(GuidanceObserver *)self->_guidanceObserver removeOutlet:self];
  [(MNNavigationService *)self->_navigationService unregisterObserver:self];
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARVKRenderer;
  [(PedestrianARVKRenderer *)&v5 dealloc];
}

- (void)setRoute:(id)a3
{
  objc_super v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    objc_storeStrong((id *)&self->_route, a3);
    v6 = sub_10092CF24();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 134349314;
      v10 = self;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Got a new route: %@", (uint8_t *)&v9, 0x16u);
    }

    id v7 = [objc_alloc((Class)VKRouteContext) initWithComposedRoute:v5 useType:1];
    v8 = [(PedestrianARVKRenderer *)self mapView];
    [v8 setRouteContext:v7];

    [(PedestrianARVKRenderer *)self clearAnchors];
    [(PedestrianARVKRenderer *)self setGuidanceInfos:0];
  }
}

- (void)setShouldGenerateFeatures:(BOOL)a3
{
  if (self->_shouldGenerateFeatures != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = sub_10092CF24();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = @"NO";
      if (v3) {
        v6 = @"YES";
      }
      id v7 = v6;
      int v8 = 134349314;
      int v9 = self;
      __int16 v10 = 2112;
      __int16 v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Setting shouldGenerateFeatures: %@", (uint8_t *)&v8, 0x16u);
    }
    self->_shouldGenerateFeatures = v3;
    if (v3) {
      [(PedestrianARVKRenderer *)self rebuildAnchors];
    }
    else {
      [(PedestrianARVKRenderer *)self clearAnchors];
    }
  }
}

- (void)setShouldShowFeatures:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(PedestrianARVKRenderer *)self mapView];
  unsigned int v6 = [v5 showsRoadLabels];

  if (v6 != v3)
  {
    id v7 = sub_10092CF24();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = @"NO";
      if (v3) {
        int v8 = @"YES";
      }
      int v9 = v8;
      int v11 = 134349314;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Setting shouldShowFeatures: %@", (uint8_t *)&v11, 0x16u);
    }
    __int16 v10 = [(PedestrianARVKRenderer *)self mapView];
    [v10 setShowsRoadLabels:v3];
  }
}

- (BOOL)shouldShowFeatures
{
  v2 = [(PedestrianARVKRenderer *)self mapView];
  unsigned __int8 v3 = [v2 showsRoadLabels];

  return v3;
}

- (void)rebuildAnchors
{
  unsigned __int8 v3 = [(PedestrianARVKRenderer *)self route];

  if (!v3)
  {
    id v12 = sub_10092CF24();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    int v24 = 134349056;
    v25 = self;
    v20 = "[%{public}p] Cannot rebuild anchors without a route";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v24, 0xCu);
    goto LABEL_24;
  }
  if (![(PedestrianARVKRenderer *)self shouldGenerateFeatures])
  {
    id v12 = sub_10092CF24();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    int v24 = 134349056;
    v25 = self;
    v20 = "[%{public}p] Cannot rebuild anchors while shouldGenerateFeatures is false";
    goto LABEL_23;
  }
  v4 = [(PedestrianARVKRenderer *)self guidanceInfos];
  id v5 = [v4 count];

  if (!v5)
  {
    id v12 = sub_10092CF24();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    int v24 = 134349056;
    v25 = self;
    v20 = "[%{public}p] Cannot rebuild anchors without first AR guidance info callback";
    goto LABEL_23;
  }
  unsigned int v6 = [(PedestrianARVKRenderer *)self route];
  id v7 = [v6 steps];
  id v8 = [v7 count];

  if (!v8)
  {
    v21 = sub_1005762E4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315906;
      v25 = (PedestrianARVKRenderer *)"-[PedestrianARVKRenderer rebuildAnchors]";
      __int16 v26 = 2080;
      v27 = "PedestrianARVKRenderer.m";
      __int16 v28 = 1024;
      int v29 = 200;
      __int16 v30 = 2080;
      objc_super v31 = "self.route.steps.count > 0";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v24, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = +[NSThread callStackSymbols];
        int v24 = 138412290;
        v25 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);
      }
    }
  }
  int v9 = [(PedestrianARVKRenderer *)self route];
  __int16 v10 = [v9 steps];
  id v11 = [v10 count];

  id v12 = sub_10092CF24();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (!v13) {
      goto LABEL_24;
    }
    int v24 = 134349056;
    v25 = self;
    v20 = "[%{public}p] Current route has no steps. Cannot rebuild anchors.";
    goto LABEL_23;
  }
  if (v13)
  {
    int v24 = 134349056;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Rebuilding anchors", (uint8_t *)&v24, 0xCu);
  }

  id v12 = [(PedestrianARVKRenderer *)self maneuverEntries];
  id v14 = [(PedestrianARVKRenderer *)self arrivalEntry];
  if (v14)
  {
    uint64_t v15 = [v12 arrayByAddingObject:v14];

    id v12 = v15;
  }
  v16 = [(PedestrianARVKRenderer *)self continueEntries];
  if ([v16 count])
  {
    uint64_t v17 = [v12 arrayByAddingObjectsFromArray:v16];

    id v12 = v17;
  }
  v18 = sub_10092CF24();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v24 = 134349314;
    v25 = self;
    __int16 v26 = 2112;
    v27 = (const char *)v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Rebuilt anchors: %@", (uint8_t *)&v24, 0x16u);
  }

  v19 = [(PedestrianARVKRenderer *)self mapViewDelegate];
  [v19 updateFeatureMapping:v12];

LABEL_24:
}

- (void)clearAnchors
{
  unsigned __int8 v3 = sub_10092CF24();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 134349056;
    int v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Clearing anchors", (uint8_t *)&v8, 0xCu);
  }

  maneuverEntries = self->_maneuverEntries;
  self->_maneuverEntries = 0;

  arrivalEntry = self->_arrivalEntry;
  self->_arrivalEntry = 0;

  continueEntries = self->_continueEntries;
  self->_continueEntries = 0;

  id v7 = [(PedestrianARVKRenderer *)self mapViewDelegate];
  [v7 updateFeatureMapping:0];
}

- (NSArray)maneuverEntries
{
  v2 = self;
  maneuverEntries = self->_maneuverEntries;
  if (!maneuverEntries)
  {
    v4 = [(PedestrianARVKRenderer *)v2 maneuverGuidanceInfos];
    id v5 = sub_10092CF24();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349314;
      v52 = v2;
      __int16 v53 = 2112;
      v54 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Generating maneuver entries from guidance infos: %@", buf, 0x16u);
    }

    v45 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v4;
    id v6 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v44 = *(void *)v47;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v47 != v44) {
            objc_enumerationMutation(obj);
          }
          int v9 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          __int16 v10 = v2;
          id v11 = [(PedestrianARVKRenderer *)v2 route];
          id v12 = [v11 stepAtIndex:[v9 stepIndex]];

          id v13 = objc_alloc((Class)VKARWalkingManeuverFeature);
          [v9 locationCoordinate];
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;
          id v20 = [v12 endRouteCoordinate];
          [v9 heading];
          double v22 = v21;
          v23 = [v9 arrowLabel];
          id v24 = [v13 initWithDisplayLocation:v20 routeCoordinate:v23 maneuverHeading:v15 displayText:v17, v19, v22];

          v25 = sub_10092CF24();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            __int16 v26 = (objc_class *)objc_opt_class();
            v27 = NSStringFromClass(v26);
            [v9 locationCoordinate];
            uint64_t v29 = v28;
            [v9 locationCoordinate];
            uint64_t v31 = v30;
            [v9 locationCoordinate];
            uint64_t v33 = v32;
            [v9 heading];
            uint64_t v35 = v34;
            __int16 v36 = [v9 arrowLabel];
            int v37 = +[NSString stringWithFormat:@"<%@ %p, location: {%f, %f, %f}, heading: %f, text: %@>", v27, v24, v29, v31, v33, v35, v36];
            *(_DWORD *)buf = 134349314;
            v52 = v10;
            __int16 v53 = 2112;
            v54 = v37;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "[%{public}p] Generated maneuver feature: %@", buf, 0x16u);
          }
          __int16 v38 = [[PedestrianARVKFeatureMapEntry alloc] initWithFeature:v24 guidanceInfo:v9];
          [v45 addObject:v38];

          v2 = v10;
        }
        id v7 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v7);
    }

    v39 = sub_10092CF24();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v52 = v2;
      __int16 v53 = 2112;
      v54 = v45;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[%{public}p] Generated maneuver entries: %@", buf, 0x16u);
    }

    v40 = (NSArray *)[v45 copy];
    v41 = v2->_maneuverEntries;
    v2->_maneuverEntries = v40;

    maneuverEntries = v2->_maneuverEntries;
  }

  return maneuverEntries;
}

- (PedestrianARVKFeatureMapEntry)arrivalEntry
{
  arrivalEntry = self->_arrivalEntry;
  if (arrivalEntry)
  {
LABEL_25:
    uint64_t v29 = arrivalEntry;
    goto LABEL_26;
  }
  v4 = sub_10092CF24();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v58 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Generating arrival entry", buf, 0xCu);
  }

  uint64_t v5 = [(PedestrianARVKRenderer *)self arrivalGuidanceInfo];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(PedestrianARVKRenderer *)self route];
    int v8 = [v7 steps];
    int v9 = [v8 lastObject];

    [v9 endGeoCoordinate];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [(PedestrianARVKRenderer *)self route];
    double v17 = [v16 legs];
    double v18 = [v17 lastObject];

    double v19 = [v18 destinationDisplayInfo];
    id v20 = [v19 arInfo];

    double v21 = [(PedestrianARVKRenderer *)self route];
    double v22 = [v21 destination];
    v23 = [v22 geoMapItem];
    id v24 = [v23 _styleAttributes];
    v25 = v24;
    if (v24)
    {
      id v26 = v24;
    }
    else
    {
      id v26 = +[GEOFeatureStyleAttributes markerStyleAttributes];
    }
    uint64_t v30 = v26;

    uint64_t v31 = [v20 storefrontFaceGeometrys];
    id v32 = [v31 count];

    if (v32)
    {
      uint64_t v33 = sub_10092CF24();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v58 = self;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%{public}p] Generating arrival anchor with real look-around storefront data", buf, 0xCu);
      }

      id v34 = [objc_alloc((Class)VKARWalkingArrivalFeature) initWithARInfo:v20 undulationProvider:&stru_101302460 iconStyleAttributes:v30];
    }
    else
    {
      uint64_t v35 = +[NSUserDefaults standardUserDefaults];
      unsigned int v36 = [v35 BOOLForKey:@"PedestrianARInjectFakeStorefrontArrivalDataKey"];

      int v37 = sub_10092CF24();
      BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
      if (v36)
      {
        if (v38)
        {
          *(_DWORD *)buf = 134349056;
          v58 = self;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%{public}p] Generating arrival anchor with fake look-around storefront data", buf, 0xCu);
        }

        double v39 = sin(v11 * 0.0174532925);
        double v40 = 6378137.0 / sqrt(v39 * -0.00669437999 * v39 + 1.0);
        double v41 = v39 * (v15 * 0.0174532925 + v40);
        __double2 v42 = __sincos_stret(v13 * 0.0174532925);
        v43 = objc_opt_new();
        [v43 setX:v42.__cosval * v41];
        [v43 setY:v42.__sinval * v41];
        [v43 setZ:v39 * (v15 * 0.0174532925 + v40 * 0.99330562)];
        uint64_t v44 = objc_opt_new();
        [v44 setPosition:v43];
        v45 = objc_opt_new();

        [v45 addStorefrontFaceGeometry:v44];
        id v34 = [objc_alloc((Class)VKARWalkingArrivalFeature) initWithARInfo:v45 undulationProvider:&stru_101302480 iconStyleAttributes:v30];

        id v20 = v45;
      }
      else
      {
        if (v38)
        {
          *(_DWORD *)buf = 134349056;
          v58 = self;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%{public}p] Generating arrival anchor without look-around storefront data", buf, 0xCu);
        }

        long long v46 = [(PedestrianARVKRenderer *)self route];
        long long v47 = [v46 steps];
        long long v48 = [v47 lastObject];

        id v49 = objc_alloc((Class)VKARWalkingArrivalFeature);
        [v48 endGeoCoordinate];
        id v34 = [v49 initWithPosition:v30];
      }
    }
    v50 = sub_10092CF24();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v51);
      __int16 v53 = +[NSString stringWithFormat:@"<%@ %p, location: {%f, %f, %f}, arInfo: %@, styleAttributes: %@>", v52, v34, *(void *)&v11, *(void *)&v13, *(void *)&v15, v20, v30];
      *(_DWORD *)buf = 134349314;
      v58 = self;
      __int16 v59 = 2112;
      v60 = v53;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "[%{public}p] Generated arrival feature: %@", buf, 0x16u);
    }
    v54 = [[PedestrianARVKFeatureMapEntry alloc] initWithFeature:v34 guidanceInfo:v6];
    v55 = self->_arrivalEntry;
    self->_arrivalEntry = v54;

    arrivalEntry = self->_arrivalEntry;
    goto LABEL_25;
  }
  v27 = sub_10092CF24();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = [(PedestrianARVKRenderer *)self guidanceInfos];
    *(_DWORD *)buf = 134349314;
    v58 = self;
    __int16 v59 = 2112;
    v60 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}p] There is no arrival guidance info; cannot generate arrival entry: %@",
      buf,
      0x16u);
  }
  uint64_t v29 = 0;
LABEL_26:

  return v29;
}

- (NSArray)continueEntries
{
  v2 = self;
  continueEntries = self->_continueEntries;
  if (!continueEntries)
  {
    v4 = [(PedestrianARVKRenderer *)v2 continueGuidanceInfos];
    uint64_t v5 = sub_10092CF24();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349314;
      BOOL v38 = v2;
      __int16 v39 = 2112;
      double v40 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Generating continue entries with continue infos: %@", buf, 0x16u);
    }

    uint64_t v31 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v4;
    id v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v30 = *(void *)v33;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v33 != v30) {
            objc_enumerationMutation(obj);
          }
          int v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v10 = objc_alloc((Class)VKARWalkingContinueFeature);
          double v11 = v2;
          double v12 = [(PedestrianARVKRenderer *)v2 route];
          id v13 = [v9 locationCoordinateRange];
          uint64_t v15 = v14;
          double v16 = [v9 arrowLabel];
          id v17 = objc_msgSend(v10, "initWithRoute:range:displayText:continuePriority:", v12, v13, v15, v16, objc_msgSend(v9, "priority"));

          double v18 = sub_10092CF24();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            double v19 = (objc_class *)objc_opt_class();
            id v20 = NSStringFromClass(v19);
            [v9 locationCoordinateRange];
            double v21 = GEOPolylineCoordinateRangeAsString();
            double v22 = [v9 arrowLabel];
            v23 = +[NSString stringWithFormat:@"<%@ %p, range: %@, text: %@>", v20, v17, v21, v22];
            *(_DWORD *)buf = 134349314;
            BOOL v38 = v11;
            __int16 v39 = 2112;
            double v40 = v23;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Generated continue feature: %@", buf, 0x16u);
          }
          id v24 = [[PedestrianARVKFeatureMapEntry alloc] initWithFeature:v17 guidanceInfo:v9];
          [v31 addObject:v24];

          v2 = v11;
        }
        id v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v7);
    }

    v25 = sub_10092CF24();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      BOOL v38 = v2;
      __int16 v39 = 2112;
      double v40 = v31;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}p] Generated continue entries: %@", buf, 0x16u);
    }

    id v26 = (NSArray *)[v31 copy];
    v27 = v2->_continueEntries;
    v2->_continueEntries = v26;

    continueEntries = v2->_continueEntries;
  }

  return continueEntries;
}

- (MNGuidanceARInfo)arrivalGuidanceInfo
{
  v2 = [(PedestrianARVKRenderer *)self guidanceInfos];
  unsigned __int8 v3 = sub_1000990A8(v2, &stru_1013024A0);

  return (MNGuidanceARInfo *)v3;
}

- (NSArray)maneuverGuidanceInfos
{
  v2 = [(PedestrianARVKRenderer *)self guidanceInfos];
  unsigned __int8 v3 = sub_1000AC254(v2, &stru_1013024C0);

  return (NSArray *)v3;
}

- (NSArray)continueGuidanceInfos
{
  v2 = [(PedestrianARVKRenderer *)self guidanceInfos];
  unsigned __int8 v3 = sub_1000AC254(v2, &stru_1013024E0);

  return (NSArray *)v3;
}

- (void)setGuidanceInfos:(id)a3
{
  id v5 = a3;
  id v6 = sub_10092CF24();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    guidanceInfos = self->_guidanceInfos;
    *(_DWORD *)buf = 134349570;
    v108 = self;
    __int16 v109 = 2112;
    v110 = guidanceInfos;
    __int16 v111 = 2112;
    id v112 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updating guidance info; old: %@, new: %@",
      buf,
      0x20u);
  }

  objc_storeStrong((id *)&self->_guidanceInfos, a3);
  int v8 = [(PedestrianARVKRenderer *)self continueGuidanceInfos];
  int v9 = [v8 sortedArrayUsingComparator:&stru_101302500];

  id v10 = sub_100099700(self->_continueEntries, &stru_101302520);
  double v11 = [v10 sortedArrayUsingComparator:&stru_101302540];

  unint64_t v12 = v9;
  unint64_t v13 = v11;
  if (v12 | v13
    && (unsigned __int8 v14 = [(id)v12 isEqual:v13],
        (id)v13,
        (id)v12,
        (v14 & 1) == 0))
  {
    uint64_t v15 = sub_10092CF24();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      sub_100099700((void *)v13, &stru_101302580);
      double v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
      id v20 = sub_100099700((void *)v12, &stru_1013025A0);
      *(_DWORD *)buf = 134349570;
      v108 = self;
      __int16 v109 = 2112;
      v110 = v19;
      __int16 v111 = 2112;
      id v112 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Continue entries are different: existing: %@, new: %@", buf, 0x20u);
    }
    int v16 = 0;
  }
  else
  {
    uint64_t v15 = sub_10092CF24();
    int v16 = 1;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      sub_100099700((void *)v13, &stru_1013025C0);
      id v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      double v18 = sub_100099700((void *)v12, &stru_1013025E0);
      *(_DWORD *)buf = 134349570;
      v108 = self;
      __int16 v109 = 2112;
      v110 = v17;
      __int16 v111 = 2112;
      id v112 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Continue entries are both nil or equal: existing: %@, new: %@", buf, 0x20u);
    }
  }

  double v21 = [(PedestrianARVKRenderer *)self arrivalGuidanceInfo];
  double v22 = [(PedestrianARVKFeatureMapEntry *)self->_arrivalEntry guidanceInfo];
  unint64_t v23 = v21;
  unint64_t v24 = v22;
  v25 = (void *)v23;
  id v26 = (void *)v24;
  v88 = (void *)v24;
  id v89 = v5;
  if (v23 | v24
    && (unsigned __int8 v27 = [(id)v23 isEqual:v24],
        v26,
        (id)v23,
        (v27 & 1) == 0))
  {
    uint64_t v31 = sub_10092CF24();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      long long v32 = [v26 mapsShortDescription];
      long long v33 = [(id)v23 mapsShortDescription];
      *(_DWORD *)buf = 134349570;
      v108 = self;
      __int16 v109 = 2112;
      v110 = v32;
      __int16 v111 = 2112;
      id v112 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[%{public}p] Arrival entries: existing: %@, new: %@", buf, 0x20u);

      id v26 = v88;
    }

    if (v23) {
      BOOL v34 = v26 == 0;
    }
    else {
      BOOL v34 = 1;
    }
    int v35 = v34;
    int v90 = v35;
  }
  else
  {
    uint64_t v28 = sub_10092CF24();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = [v26 mapsShortDescription];
      uint64_t v30 = [(id)v23 mapsShortDescription];
      *(_DWORD *)buf = 134349570;
      v108 = self;
      __int16 v109 = 2112;
      v110 = v29;
      __int16 v111 = 2112;
      id v112 = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%{public}p] Arrival entries are both nil or equal: existing: %@, new: %@", buf, 0x20u);
    }
    int v90 = 0;
  }
  unsigned int v36 = [(PedestrianARVKRenderer *)self maneuverGuidanceInfos];
  int v37 = [v36 sortedArrayUsingComparator:&stru_101302600];

  BOOL v38 = sub_100099700(self->_maneuverEntries, &stru_101302620);
  __int16 v39 = [v38 sortedArrayUsingComparator:&stru_101302640];

  unint64_t v40 = v37;
  unint64_t v41 = v39;
  v94 = self;
  if (v40 | v41
    && (unsigned __int8 v42 = [(id)v40 isEqual:v41],
        (id)v41,
        (id)v40,
        (v42 & 1) == 0))
  {
    v43 = sub_10092CF24();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      sub_100099700((void *)v41, &stru_101302660);
      long long v47 = (NSArray *)objc_claimAutoreleasedReturnValue();
      long long v48 = sub_100099700((void *)v40, &stru_101302680);
      *(_DWORD *)buf = 134349570;
      v108 = v94;
      __int16 v109 = 2112;
      v110 = v47;
      __int16 v111 = 2112;
      id v112 = v48;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "[%{public}p] Maneuver entries are different: existing: %@, new: %@", buf, 0x20u);

      self = v94;
    }
    char v44 = 0;
  }
  else
  {
    v43 = sub_10092CF24();
    char v44 = 1;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      sub_100099700((void *)v41, &stru_1013026A0);
      v45 = (NSArray *)objc_claimAutoreleasedReturnValue();
      long long v46 = sub_100099700((void *)v40, &stru_1013026C0);
      *(_DWORD *)buf = 134349570;
      v108 = v94;
      __int16 v109 = 2112;
      v110 = v45;
      __int16 v111 = 2112;
      id v112 = v46;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "[%{public}p] Maneuver entries are both nil or equal: existing: %@, new: %@", buf, 0x20u);

      self = v94;
      char v44 = 1;
    }
  }

  continueEntries = self->_continueEntries;
  if (v16)
  {
    if (!continueEntries) {
      goto LABEL_47;
    }
    char obj = v44;
    v50 = sub_10092CF24();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v108 = self;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "[%{public}p] Updating continue entries mapping", buf, 0xCu);
    }

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    continueEntries = self->_continueEntries;
    id v51 = [(NSArray *)continueEntries countByEnumeratingWithState:&v101 objects:v106 count:16];
    if (v51)
    {
      id v52 = v51;
      unint64_t v86 = v41;
      id v79 = (id)v40;
      id v80 = (id)v23;
      int v81 = v16;
      unint64_t v83 = v13;
      uint64_t v53 = *(void *)v102;
      do
      {
        v54 = continueEntries;
        for (i = 0; i != v52; i = (char *)i + 1)
        {
          if (*(void *)v102 != v53) {
            objc_enumerationMutation(v54);
          }
          v56 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          v57 = [v56 feature:v79, v80];
          v58 = [(PedestrianARVKRenderer *)v94 continueGuidanceInfos];
          v100[0] = _NSConcreteStackBlock;
          v100[1] = 3221225472;
          v100[2] = sub_10092F75C;
          v100[3] = &unk_1012F0150;
          v100[4] = v56;
          __int16 v59 = sub_1000990A8(v58, v100);

          v60 = [(PedestrianARVKRenderer *)v94 mapViewDelegate];
          [v60 updateGuidanceInfo:v59 forFeature:v57];
        }
        continueEntries = v54;
        id v52 = [(NSArray *)v54 countByEnumeratingWithState:&v101 objects:v106 count:16];
      }
      while (v52);
      self = v94;
      unint64_t v13 = v83;
      int v16 = v81;
      unint64_t v40 = (unint64_t)v79;
      v25 = v80;
      unint64_t v41 = v86;
    }
    else
    {
      self = v94;
    }
    char v44 = obj;
  }
  else
  {
    self->_continueEntries = 0;
  }

LABEL_47:
  arrivalEntry = self->_arrivalEntry;
  if (v90)
  {
    self->_arrivalEntry = 0;
  }
  else
  {
    if (!arrivalEntry) {
      goto LABEL_54;
    }
    char obja = v44;
    unint64_t v87 = v41;
    v62 = v25;
    int v63 = v16;
    v64 = sub_10092CF24();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v108 = self;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "[%{public}p] Updating arrival entry mapping", buf, 0xCu);
    }

    arrivalEntry = [(PedestrianARVKRenderer *)self mapViewDelegate];
    v65 = [(PedestrianARVKRenderer *)self arrivalGuidanceInfo];
    v66 = [(PedestrianARVKFeatureMapEntry *)self->_arrivalEntry feature];
    [arrivalEntry updateGuidanceInfo:v65 forFeature:v66];

    int v16 = v63;
    v25 = v62;
    unint64_t v41 = v87;
    char v44 = obja;
  }

LABEL_54:
  maneuverEntries = self->_maneuverEntries;
  if ((v44 & 1) == 0)
  {
    self->_maneuverEntries = 0;

    v68 = v89;
LABEL_69:
    [(PedestrianARVKRenderer *)self rebuildAnchors];
    goto LABEL_70;
  }
  v68 = v89;
  if (maneuverEntries)
  {
    unint64_t v85 = v12;
    id v79 = (id)v40;
    id v80 = v25;
    int v82 = v16;
    unint64_t v84 = v13;
    v69 = sub_10092CF24();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v108 = self;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "[%{public}p] Updating maneuver entries mapping", buf, 0xCu);
    }

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    objb = self->_maneuverEntries;
    id v70 = [(NSArray *)objb countByEnumeratingWithState:&v96 objects:v105 count:16];
    if (v70)
    {
      id v71 = v70;
      uint64_t v72 = *(void *)v97;
      do
      {
        for (j = 0; j != v71; j = (char *)j + 1)
        {
          if (*(void *)v97 != v72) {
            objc_enumerationMutation(objb);
          }
          v74 = *(void **)(*((void *)&v96 + 1) + 8 * (void)j);
          v75 = [v74 feature:v79, v80];
          v76 = [(PedestrianARVKRenderer *)v94 maneuverGuidanceInfos];
          v95[0] = _NSConcreteStackBlock;
          v95[1] = 3221225472;
          v95[2] = sub_10092F7AC;
          v95[3] = &unk_1012F0150;
          v95[4] = v74;
          v77 = sub_1000990A8(v76, v95);

          v78 = [(PedestrianARVKRenderer *)v94 mapViewDelegate];
          [v78 updateGuidanceInfo:v77 forFeature:v75];
        }
        id v71 = [(NSArray *)objb countByEnumeratingWithState:&v96 objects:v105 count:16];
      }
      while (v71);
    }

    v68 = v89;
    self = v94;
    unint64_t v13 = v84;
    unint64_t v12 = v85;
    int v16 = v82;
    unint64_t v40 = (unint64_t)v79;
    v25 = v80;
  }
  if ((v90 | v16 ^ 1) == 1) {
    goto LABEL_69;
  }
LABEL_70:
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  int v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      unint64_t v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v26 = 136316418;
        unsigned __int8 v27 = (PedestrianARVKRenderer *)"-[PedestrianARVKRenderer navigationService:didUpdateMatchedLocation:]";
        __int16 v28 = 2080;
        uint64_t v29 = "PedestrianARVKRenderer.m";
        __int16 v30 = 1024;
        *(_DWORD *)uint64_t v31 = 481;
        *(_WORD *)&v31[4] = 2080;
        *(void *)&v31[6] = "dispatch_get_main_queue()";
        *(_WORD *)&v31[14] = 2080;
        *(void *)&v31[16] = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v32 = 2080;
        long long v33 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v26,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        unint64_t v24 = sub_1005762E4();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = +[NSThread callStackSymbols];
          int v26 = 138412290;
          unsigned __int8 v27 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);
        }
      }
    }
  }
  double v11 = [v7 routeMatch];

  unint64_t v12 = sub_10092CF24();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      [v7 coordinate];
      uint64_t v15 = v14;
      [v7 coordinate];
      uint64_t v17 = v16;
      [v7 altitude];
      int v26 = 134349825;
      unsigned __int8 v27 = self;
      __int16 v28 = 2049;
      uint64_t v29 = v15;
      __int16 v30 = 2049;
      *(void *)uint64_t v31 = v17;
      *(_WORD *)&v31[8] = 2049;
      *(void *)&v31[10] = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Got location update: %{private}0.6f, %{private}0.6f, %{private}0.6f", (uint8_t *)&v26, 0x2Au);
    }

    double v19 = [(PedestrianARVKRenderer *)self mapView];
    id v20 = [v7 routeMatch];
    [v19 setRouteUserOffset:[v20 routeCoordinate]];

    unint64_t v12 = [(PedestrianARVKRenderer *)self mapView];
    double v21 = [v12 userLocationAnimator];
    double v22 = [v7 routeMatch];
    [v21 updateLocation:v7 routeMatch:v22];
  }
  else if (v13)
  {
    int v26 = 134349056;
    unsigned __int8 v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Location update had no route match; ignoring",
      (uint8_t *)&v26,
      0xCu);
  }
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v7 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  int v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      uint64_t v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316418;
        double v19 = (PedestrianARVKRenderer *)"-[PedestrianARVKRenderer navigationService:didUpdateStepIndex:segmentIndex:]";
        __int16 v20 = 2080;
        double v21 = "PedestrianARVKRenderer.m";
        __int16 v22 = 1024;
        *(_DWORD *)unint64_t v23 = 496;
        *(_WORD *)&v23[4] = 2080;
        *(void *)&v23[6] = "dispatch_get_main_queue()";
        __int16 v24 = 2080;
        v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v26 = 2080;
        unsigned __int8 v27 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v18,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        uint64_t v16 = sub_1005762E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = +[NSThread callStackSymbols];
          int v18 = 138412290;
          double v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }
  if ([(PedestrianARVKRenderer *)self lastManeuverStepIndex] != a4)
  {
    double v11 = sub_10092CF24();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      unint64_t v12 = [(PedestrianARVKRenderer *)self lastManeuverStepIndex];
      int v18 = 134349568;
      double v19 = self;
      __int16 v20 = 2048;
      double v21 = (const char *)v12;
      __int16 v22 = 2048;
      *(void *)unint64_t v23 = a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Maneuver step index changed; previous: %lu, current: %lu",
        (uint8_t *)&v18,
        0x20u);
    }

    [(PedestrianARVKRenderer *)self setLastManeuverStepIndex:a4];
    maneuverEntries = self->_maneuverEntries;
    self->_maneuverEntries = 0;

    continueEntries = self->_continueEntries;
    self->_continueEntries = 0;

    [(PedestrianARVKRenderer *)self rebuildAnchors];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[NSUserDefaults standardUserDefaults];
  if (v13 != v11)
  {

LABEL_9:
    v20.receiver = self;
    v20.super_class = (Class)PedestrianARVKRenderer;
    [(PedestrianARVKRenderer *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_10;
  }
  unsigned int v14 = [v10 isEqualToString:@"PedestrianARInjectFakeStorefrontArrivalDataKey"];

  if (!v14) {
    goto LABEL_9;
  }
  uint64_t v15 = sub_10092CF24();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    uint64_t v17 = @"YES";
    if (!v16) {
      uint64_t v17 = @"NO";
    }
    int v18 = v17;
    *(_DWORD *)buf = 134349314;
    __int16 v22 = self;
    __int16 v23 = 2112;
    __int16 v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Debug force show arrival key was toggled: %@", buf, 0x16u);
  }
  arrivalEntry = self->_arrivalEntry;
  self->_arrivalEntry = 0;

  [(PedestrianARVKRenderer *)self rebuildAnchors];
LABEL_10:
}

- (void)updateARSigns:(id)a3
{
  id v4 = a3;
  id v5 = sub_10092CF24();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134349314;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Got updated AR guidance infos: %@", (uint8_t *)&v6, 0x16u);
  }

  [(PedestrianARVKRenderer *)self setGuidanceInfos:v4];
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)shouldGenerateFeatures
{
  return self->_shouldGenerateFeatures;
}

- (VKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
}

- (PedestrianARVKMapViewMapDelegate)mapViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewDelegate);

  return (PedestrianARVKMapViewMapDelegate *)WeakRetained;
}

- (void)setMapViewDelegate:(id)a3
{
}

- (GuidanceObserver)guidanceObserver
{
  return self->_guidanceObserver;
}

- (void)setGuidanceObserver:(id)a3
{
}

- (void)setArrivalEntry:(id)a3
{
}

- (void)setManeuverEntries:(id)a3
{
}

- (void)setContinueEntries:(id)a3
{
}

- (unint64_t)lastManeuverStepIndex
{
  return self->_lastManeuverStepIndex;
}

- (void)setLastManeuverStepIndex:(unint64_t)a3
{
  self->_lastManeuverStepIndex = a3;
}

- (NSArray)guidanceInfos
{
  return self->_guidanceInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceInfos, 0);
  objc_storeStrong((id *)&self->_continueEntries, 0);
  objc_storeStrong((id *)&self->_maneuverEntries, 0);
  objc_storeStrong((id *)&self->_arrivalEntry, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_destroyWeak((id *)&self->_mapViewDelegate);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_mapView, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end