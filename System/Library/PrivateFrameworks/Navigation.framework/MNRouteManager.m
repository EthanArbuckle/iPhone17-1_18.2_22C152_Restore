@interface MNRouteManager
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (GEOCommonOptions)commonOptions;
- (GEOComposedRoute)currentRoute;
- (GEOComposedRoute)originalRoute;
- (GEOComposedWaypoint)originalDestination;
- (GEODirectionsRequest)directionsRequest;
- (GEODirectionsResponse)directionsResponse;
- (GEORouteAttributes)routeAttributes;
- (MNActiveRouteInfo)currentRouteInfo;
- (MNRouteManager)init;
- (MNRouteManager)initWithAuditToken:(id)a3;
- (NSArray)allRoutes;
- (NSArray)alternateRoutes;
- (NSArray)contingencyRouteSegments;
- (NSArray)previewRoutes;
- (NSString)requestingAppIdentifier;
- (unint64_t)selectedRouteIndex;
- (void)_clearPreloader;
- (void)_updatePreloaderForRoute:(id)a3;
- (void)clearCurrentRoute;
- (void)close;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)open;
- (void)setSelectedRouteIndex:(unint64_t)a3;
- (void)updateForLocation:(id)a3;
- (void)updateForReroute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6;
- (void)updateWithAlternateRoutes:(id)a3;
- (void)updateWithPreviewRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (void)updateWithStartNavigationDetails:(id)a3;
@end

@implementation MNRouteManager

- (MNRouteManager)init
{
  return [(MNRouteManager *)self initWithAuditToken:0];
}

- (MNRouteManager)initWithAuditToken:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNRouteManager;
  v6 = [(MNRouteManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_auditToken, a3);
    v8 = v7;
  }

  return v7;
}

- (GEOComposedRoute)currentRoute
{
  return [(MNActiveRouteInfo *)self->_currentRouteInfo route];
}

- (NSArray)allRoutes
{
  allRoutes = self->_allRoutes;
  if (allRoutes)
  {
    v3 = allRoutes;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:self->_currentRouteInfo];
    [(NSArray *)v5 addObjectsFromArray:self->_alternateRoutes];
    v6 = self->_allRoutes;
    self->_allRoutes = v5;
    v7 = v5;

    v3 = self->_allRoutes;
  }
  return v3;
}

- (void)dealloc
{
  [(MNRouteManager *)self close];
  v3.receiver = self;
  v3.super_class = (Class)MNRouteManager;
  [(MNRouteManager *)&v3 dealloc];
}

- (void)open
{
  objc_super v3 = +[MNLocationManager sharedLocationManager];
  [v3 addLocationListener:self];

  if (!self->_tileLoaderClientIdentifier)
  {
    GEOTileLoaderClientIdentifier();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
    self->_tileLoaderClientIdentifier = v4;

    v6 = [MEMORY[0x1E4F64AC8] modernLoader];
    [v6 openForClient:self->_tileLoaderClientIdentifier];

    id v7 = [MEMORY[0x1E4F64918] modernManager];
    [v7 openServerConnection];
  }
}

- (void)close
{
  if (self->_tileLoaderClientIdentifier)
  {
    objc_super v3 = [MEMORY[0x1E4F64AC8] modernLoader];
    [v3 closeForClient:self->_tileLoaderClientIdentifier];

    v4 = [MEMORY[0x1E4F64918] modernManager];
    [v4 closeServerConnection:1];

    tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
    self->_tileLoaderClientIdentifier = 0;
  }
  [(MNRouteManager *)self _clearPreloader];
  id v6 = +[MNLocationManager sharedLocationManager];
  [v6 removeLocationListener:self];
}

- (void)updateWithPreviewRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_previewRoutes, a3);
  self->_selectedRouteIndex = a4;
  if ([(NSArray *)self->_previewRoutes count] <= a4)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(NSArray *)self->_previewRoutes objectAtIndexedSubscript:self->_selectedRouteIndex];
  }
  [(MNRouteManager *)self _updatePreloaderForRoute:v7];
}

- (void)updateWithStartNavigationDetails:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 selectedRouteIndex];
  id v6 = [v4 routes];
  unint64_t v7 = [v6 count];

  if (v5 >= v7)
  {
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v43 = [NSString stringWithFormat:@"Invalid selected route index"];
      v44 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v52 = "-[MNRouteManager updateWithStartNavigationDetails:]";
        *(_WORD *)&v52[8] = 2080;
        v53 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNRouteManager.m";
        __int16 v54 = 1024;
        int v55 = 146;
        __int16 v56 = 2080;
        v57 = "selectedRouteIndex != NSNotFound";
        __int16 v58 = 2112;
        v59 = v43;
        _os_log_impl(&dword_1B542B000, v44, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }

      v45 = MNGetMNNavigationSessionLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v45, OS_LOG_TYPE_ERROR, "MNStartNavigationDetails selectedRouteIndex not set", buf, 2u);
      }
    }
    id v8 = [v4 routes];
    unint64_t v9 = [v8 count];

    if (v5 >= v9)
    {
      v46 = NSString;
      uint64_t v47 = [v4 selectedRouteIndex];
      v48 = [v4 routes];
      v49 = objc_msgSend(v46, "stringWithFormat:", @"Selected route index is outside valid range of routes. Index: %d. Routes count: %d\n", v47, objc_msgSend(v48, "count"));

      v50 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v52 = "-[MNRouteManager updateWithStartNavigationDetails:]";
        *(_WORD *)&v52[8] = 2080;
        v53 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNRouteManager.m";
        __int16 v54 = 1024;
        int v55 = 151;
        __int16 v56 = 2080;
        v57 = "selectedRouteIndex < details.routes.count";
        __int16 v58 = 2112;
        v59 = v49;
        _os_log_impl(&dword_1B542B000, v50, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }
    }
    objc_super v10 = [v4 routes];
    unint64_t v11 = [v10 count];

    if (v5 >= v11)
    {
      v12 = MNGetMNNavigationSessionLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = [v4 routes];
        int v14 = [v13 count];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v52 = v5;
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)&v52[6] = v14;
        _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "MNStartNavigationDetails selectedRouteIndex is %d. Only (%d) routes were passed in", buf, 0xEu);
      }
    }
    unint64_t v5 = 0;
  }
  v15 = [v4 routeAttributes];
  routeAttributes = self->_routeAttributes;
  self->_routeAttributes = v15;

  v17 = MNGetMNRouteAttributesLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = self->_routeAttributes;
    *(_DWORD *)buf = 138543362;
    *(void *)v52 = v18;
    _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_DEFAULT, "_routeAttributes = %{public}@", buf, 0xCu);
  }

  v19 = [v4 directionsRequest];
  v20 = [v19 commonOptions];
  commonOptions = self->_commonOptions;
  self->_commonOptions = v20;

  v22 = [v4 directionsRequest];
  directionsRequest = self->_directionsRequest;
  self->_directionsRequest = v22;

  v24 = [v4 directionsResponse];
  directionsResponse = self->_directionsResponse;
  self->_directionsResponse = v24;

  v26 = [v4 requestingAppIdentifier];
  requestingAppIdentifier = self->_requestingAppIdentifier;
  self->_requestingAppIdentifier = v26;

  self->_selectedRouteIndex = [v4 selectedRouteIndex];
  v28 = [v4 routes];
  v29 = [v28 objectAtIndexedSubscript:v5];

  v30 = [[MNActiveRouteInfo alloc] initWithRoute:v29];
  objc_storeStrong((id *)&self->_currentRouteInfo, v30);
  v31 = [v29 destination];
  originalDestination = self->_originalDestination;
  self->_originalDestination = v31;

  if ([v4 navigationType] == 3 && !objc_msgSend(v29, "transportType"))
  {
    v33 = [v4 routes];
    uint64_t v34 = [v33 count];

    if (v34)
    {
      unint64_t v35 = 0;
      v36 = 0;
      do
      {
        if (v35 != [v4 selectedRouteIndex])
        {
          if (!v36)
          {
            v36 = [MEMORY[0x1E4F1CA48] array];
          }
          v37 = [v4 routes];
          v38 = [v37 objectAtIndexedSubscript:v35];

          if ([v38 usesZilch])
          {
            v39 = [v38 routeAttributes];
            [v39 setIncludeRoutingPathLeg:0];
          }
          v40 = [[MNActiveRouteInfo alloc] initWithRoute:v38];
          [v36 addObject:v40];
        }
        ++v35;
        v41 = [v4 routes];
        unint64_t v42 = [v41 count];
      }
      while (v35 < v42);
    }
    else
    {
      v36 = 0;
    }
    [(MNRouteManager *)self updateWithAlternateRoutes:v36];
  }
  [(MNRouteManager *)self _updatePreloaderForRoute:v30];
}

- (void)updateForReroute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = (MNActiveRouteInfo *)a3;
  id v12 = a5;
  id v13 = a6;
  if (self->_currentRouteInfo == v11)
  {
    v17 = [NSString stringWithFormat:@"Rerouting to already active route"];
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      v20 = "-[MNRouteManager updateForReroute:rerouteReason:request:response:]";
      __int16 v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNRouteManager.m";
      __int16 v23 = 1024;
      int v24 = 203;
      __int16 v25 = 2080;
      v26 = "_currentRouteInfo != routeInfo";
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v19, 0x30u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_directionsRequest, a5);
    objc_storeStrong((id *)&self->_directionsResponse, a6);
    uint64_t v14 = [(NSMutableArray *)self->_alternateRoutes indexOfObject:v11];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)self->_alternateRoutes removeObjectAtIndex:v14];
      allRoutes = self->_allRoutes;
      self->_allRoutes = 0;
    }
    v16 = [(MNActiveRouteInfo *)v11 route];
    objc_storeStrong((id *)&self->_currentRouteInfo, a3);
    if (a4 - 8 <= 0xFFFFFFFFFFFFFFFDLL) {
      objc_storeStrong((id *)&self->_originalRoute, v16);
    }
    [(MNRouteManager *)self _updatePreloaderForRoute:v11];
  }
}

- (void)updateForLocation:(id)a3
{
  preloader = self->_preloader;
  id v4 = [a3 routeMatch];
  [(GEORoutePreloader *)preloader updateWithRouteMatch:v4];
}

- (void)updateWithAlternateRoutes:(id)a3
{
  id v4 = (NSMutableArray *)[a3 mutableCopy];
  alternateRoutes = self->_alternateRoutes;
  self->_alternateRoutes = v4;

  allRoutes = self->_allRoutes;
  self->_allRoutes = 0;
}

- (void)clearCurrentRoute
{
  self->_currentRouteInfo = 0;
  MEMORY[0x1F41817F8]();
}

- (void)_clearPreloader
{
  [(GEORoutePreloader *)self->_preloader stop];
  [(GEORoutePreloader *)self->_preloader tearDown];
  preloader = self->_preloader;
  self->_preloader = 0;
}

- (void)_updatePreloaderForRoute:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MNRouteManager *)self _clearPreloader];
  unint64_t v5 = [v4 route];

  char v6 = [v5 isOfflineRoute];
  if (v5)
  {
    if ((v6 & 1) == 0)
    {
      unint64_t v7 = [v5 origin];
      int v8 = [v7 isCurrentLocation];

      if (v8)
      {
        if ([v5 transportType] == 1)
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F64B08]);
          [v9 addTileSetStyle:53 betweenZoom:13 andZoom:15];
          [v9 addTileSetStyle:37 betweenZoom:13 andZoom:15];
          v15[0] = v9;
          objc_super v10 = (id *)v15;
        }
        else
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F64748]);
          [v9 addTileSetStyle:53 betweenZoom:13 andZoom:15];
          id v14 = v9;
          objc_super v10 = &v14;
        }
        unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

        id v12 = (GEORoutePreloader *)[objc_alloc(MEMORY[0x1E4F649E8]) initWithRoute:v5 strategies:v11 auditToken:self->_auditToken];
        preloader = self->_preloader;
        self->_preloader = v12;
      }
    }
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v6 = [a3 lastLocation];
  preloader = self->_preloader;
  unint64_t v5 = [v6 routeMatch];
  [(GEORoutePreloader *)preloader updateWithRouteMatch:v5];
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (MNActiveRouteInfo)currentRouteInfo
{
  return self->_currentRouteInfo;
}

- (NSArray)alternateRoutes
{
  return &self->_alternateRoutes->super;
}

- (NSArray)contingencyRouteSegments
{
  return self->_contingencyRouteSegments;
}

- (NSArray)previewRoutes
{
  return self->_previewRoutes;
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void)setSelectedRouteIndex:(unint64_t)a3
{
  self->_selectedRouteIndex = a3;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (GEOCommonOptions)commonOptions
{
  return self->_commonOptions;
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (GEOComposedWaypoint)originalDestination
{
  return self->_originalDestination;
}

- (GEOComposedRoute)originalRoute
{
  return self->_originalRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRoute, 0);
  objc_storeStrong((id *)&self->_contingencyRouteSegments, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_tileLoaderClientIdentifier, 0);
  objc_storeStrong((id *)&self->_preloader, 0);
  objc_storeStrong((id *)&self->_originalRouteInfo, 0);
  objc_storeStrong((id *)&self->_originalDestination, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_previewRoutes, 0);
  objc_storeStrong((id *)&self->_allRoutes, 0);
  objc_storeStrong((id *)&self->_alternateRoutes, 0);
  objc_storeStrong((id *)&self->_currentRouteInfo, 0);
}

@end