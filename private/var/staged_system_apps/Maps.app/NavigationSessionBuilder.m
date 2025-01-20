@interface NavigationSessionBuilder
- (BOOL)isResumingMultipointRoute;
- (GEOMapServiceTraits)mapServiceTraits;
- (NSString)tracePlaybackPath;
- (NavigationDetailsOptions)navigationDetailsOptions;
- (NavigationSessionBuilder)initWithRouteCollection:(id)a3 navigationDetailsOptions:(NavigationDetailsOptions *)a4 mapServiceTraits:(id)a5 sessionInitiator:(unint64_t)a6 isResumingMultipointRoute:(BOOL)a7 tracePlaybackPath:(id)a8;
- (RouteCollection)routeCollection;
- (id)build;
- (unint64_t)mapsSessionInitiator;
- (void)setIsResumingMultipointRoute:(BOOL)a3;
- (void)setMapServiceTraits:(id)a3;
- (void)setMapsSessionInitiator:(unint64_t)a3;
- (void)setNavigationDetailsOptions:(NavigationDetailsOptions *)a3;
- (void)setRouteCollection:(id)a3;
- (void)setTracePlaybackPath:(id)a3;
@end

@implementation NavigationSessionBuilder

- (NavigationSessionBuilder)initWithRouteCollection:(id)a3 navigationDetailsOptions:(NavigationDetailsOptions *)a4 mapServiceTraits:(id)a5 sessionInitiator:(unint64_t)a6 isResumingMultipointRoute:(BOOL)a7 tracePlaybackPath:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)NavigationSessionBuilder;
  v18 = [(NavigationSessionBuilder *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_routeCollection, a3);
    long long v20 = *(_OWORD *)&a4->shouldSimulateLocations;
    long long v21 = *(_OWORD *)&a4->guidanceType;
    long long v22 = *(_OWORD *)&a4->isReconnecting;
    v19->_navigationDetailsOptions.navigationModeContext = a4->navigationModeContext;
    *(_OWORD *)&v19->_navigationDetailsOptions.guidanceType = v21;
    *(_OWORD *)&v19->_navigationDetailsOptions.isReconnecting = v22;
    *(_OWORD *)&v19->_navigationDetailsOptions.shouldSimulateLocations = v20;
    objc_storeStrong((id *)&v19->_mapServiceTraits, a5);
    v19->_mapsSessionInitiator = a6;
    v19->_isResumingMultipointRoute = a7;
    v23 = (NSString *)[v17 copy];
    tracePlaybackPath = v19->_tracePlaybackPath;
    v19->_tracePlaybackPath = v23;
  }
  return v19;
}

- (id)build
{
  tracePlaybackPath = self->_tracePlaybackPath;
  v4 = [StartNavigationDetailsBuilder alloc];
  if (tracePlaybackPath) {
    v5 = [(StartNavigationDetailsBuilder *)v4 initWithTracePlaybackPath:self->_tracePlaybackPath routeCollection:self->_routeCollection];
  }
  else {
    v5 = [(StartNavigationDetailsBuilder *)v4 initWithRouteCollection:self->_routeCollection];
  }
  v6 = v5;
  [(GEOMapServiceTraits *)self->_mapServiceTraits useOnlineToOfflineFailoverRequestModeIfAllowed];
  [(StartNavigationDetailsBuilder *)v6 setTraits:self->_mapServiceTraits];
  v7 = [(RouteCollection *)self->_routeCollection currentRoute];
  v8 = [v7 routeAttributes];
  unsigned int v9 = [v8 hasTimepoint];

  if (v9)
  {
    self->_navigationDetailsOptions.preferredNavigationType = 2;
    v10 = sub_10000AF10();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Changing navigation type to stepping as this is a planned trip", buf, 2u);
    }
  }
  long long v11 = *(_OWORD *)&self->_navigationDetailsOptions.guidanceType;
  v17[0] = *(_OWORD *)&self->_navigationDetailsOptions.shouldSimulateLocations;
  v17[1] = v11;
  v17[2] = *(_OWORD *)&self->_navigationDetailsOptions.isReconnecting;
  unint64_t navigationModeContext = self->_navigationDetailsOptions.navigationModeContext;
  [(StartNavigationDetailsBuilder *)v6 setOptions:v17];
  [(StartNavigationDetailsBuilder *)v6 setIsResumingMultipointRoute:self->_isResumingMultipointRoute];
  v12 = [NavigationSessionConfiguration alloc];
  v13 = [(StartNavigationDetailsBuilder *)v6 buildNavigationDetails];
  v14 = [(NavigationSessionConfiguration *)v12 initWithStartNavigationDetails:v13 routeCollection:self->_routeCollection traits:self->_mapServiceTraits isETAOnlyMode:self->_navigationDetailsOptions.isETAOnlyMode];

  id v15 = [[NavigationSession alloc] initWithInitiator:self->_mapsSessionInitiator configuration:v14];

  return v15;
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (void)setRouteCollection:(id)a3
{
}

- (NavigationDetailsOptions)navigationDetailsOptions
{
  long long v3 = *(_OWORD *)&self[1].preferredNavigationType;
  *(_OWORD *)&retstr->shouldSimulateLocations = *(_OWORD *)&self->navigationModeContext;
  *(_OWORD *)&retstr->guidanceType = v3;
  *(_OWORD *)&retstr->isReconnecting = *(_OWORD *)&self[1].navigationMode;
  retstr->unint64_t navigationModeContext = self[1].guidanceLevelOverride;
  return self;
}

- (void)setNavigationDetailsOptions:(NavigationDetailsOptions *)a3
{
  long long v3 = *(_OWORD *)&a3->shouldSimulateLocations;
  long long v4 = *(_OWORD *)&a3->guidanceType;
  long long v5 = *(_OWORD *)&a3->isReconnecting;
  self->_navigationDetailsOptions.unint64_t navigationModeContext = a3->navigationModeContext;
  *(_OWORD *)&self->_navigationDetailsOptions.guidanceType = v4;
  *(_OWORD *)&self->_navigationDetailsOptions.isReconnecting = v5;
  *(_OWORD *)&self->_navigationDetailsOptions.shouldSimulateLocations = v3;
}

- (GEOMapServiceTraits)mapServiceTraits
{
  return self->_mapServiceTraits;
}

- (void)setMapServiceTraits:(id)a3
{
}

- (unint64_t)mapsSessionInitiator
{
  return self->_mapsSessionInitiator;
}

- (void)setMapsSessionInitiator:(unint64_t)a3
{
  self->_mapsSessionInitiator = a3;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (NSString)tracePlaybackPath
{
  return self->_tracePlaybackPath;
}

- (void)setTracePlaybackPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracePlaybackPath, 0);
  objc_storeStrong((id *)&self->_mapServiceTraits, 0);

  objc_storeStrong((id *)&self->_routeCollection, 0);
}

@end