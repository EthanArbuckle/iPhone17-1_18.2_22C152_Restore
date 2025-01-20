@interface StartNavigationDetailsBuilder
+ (NavigationDetailsOptions)defaultNavigationDetailsOptions;
- (BOOL)isResumingMultipointRoute;
- (GEOCountryConfiguration)countryConfiguration;
- (GEOMapServiceTraits)traits;
- (GEORouteAttributes)routeAttributes;
- (NSString)tracePlaybackPath;
- (NSString)traceRecordingNameOverride;
- (NavigationDetailsOptions)options;
- (RouteCollection)routeCollection;
- (StartNavigationDetailsBuilder)initWithRouteCollection:(id)a3;
- (StartNavigationDetailsBuilder)initWithTracePlaybackPath:(id)a3 routeCollection:(id)a4;
- (id)buildNavigationDetails;
- (void)setCountryConfiguration:(id)a3;
- (void)setIsResumingMultipointRoute:(BOOL)a3;
- (void)setOptions:(NavigationDetailsOptions *)a3;
- (void)setRouteAttributes:(id)a3;
- (void)setTraceRecordingNameOverride:(id)a3;
- (void)setTraits:(id)a3;
@end

@implementation StartNavigationDetailsBuilder

+ (NavigationDetailsOptions)defaultNavigationDetailsOptions
{
  *(void *)&retstr->isReconnecting = 0;
  *(_OWORD *)&retstr->shouldSimulateLocations = 0u;
  *(_OWORD *)&retstr->guidanceType = 0u;
  *(_OWORD *)&retstr->guidanceLevelOverride = xmmword_100F6F460;
  v4 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v5 = [v4 isAuthorizedForPreciseLocation];

  if ((v5 & 1) == 0) {
    *(_OWORD *)&retstr->preferredNavigationType = xmmword_100F6F470;
  }
  v6 = +[GEOPlatform sharedPlatform];
  unsigned int v7 = [v6 isInternalInstall];

  if (v7)
  {
    char BOOL = GEOConfigGetBOOL();
    result = (NavigationDetailsOptions *)GEOConfigGetBOOL();
    retstr->shouldSimulateLocations = BOOL & (result ^ 1);
  }
  return result;
}

- (StartNavigationDetailsBuilder)initWithRouteCollection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)StartNavigationDetailsBuilder;
  v6 = [(StartNavigationDetailsBuilder *)&v13 init];
  unsigned int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_routeCollection, a3);
    +[StartNavigationDetailsBuilder defaultNavigationDetailsOptions];
    *(_OWORD *)&v7->_options.shouldSimulateLocations = v9;
    *(_OWORD *)&v7->_options.guidanceType = v10;
    *(_OWORD *)&v7->_options.isReconnecting = v11;
    v7->_options.navigationModeContext = v12;
  }

  return v7;
}

- (StartNavigationDetailsBuilder)initWithTracePlaybackPath:(id)a3 routeCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)StartNavigationDetailsBuilder;
  long long v9 = [(StartNavigationDetailsBuilder *)&v12 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tracePlaybackPath, a3);
    v10->_options.preferredNavigationType = 0;
    v10->_options.guidanceType = 0;
    *(_WORD *)&v10->_options.isReconnecting = 0;
    v10->_options.navigationMode = 0;
    *(_OWORD *)&v10->_options.guidanceLevelOverride = xmmword_100F6F460;
    v10->_options.shouldSimulateLocations = 1;
    objc_storeStrong((id *)&v10->_routeCollection, a4);
  }

  return v10;
}

- (id)buildNavigationDetails
{
  id v3 = objc_alloc_init((Class)MNStartNavigationDetails);
  [(StartNavigationDetailsBuilder *)self options];
  [v3 setGuidanceType:v58];
  v4 = [(StartNavigationDetailsBuilder *)self tracePlaybackPath];
  [v3 setTracePlaybackPath:v4];

  id v5 = [(StartNavigationDetailsBuilder *)self traceRecordingNameOverride];
  [v3 setTraceRecordingNameOverride:v5];

  [(StartNavigationDetailsBuilder *)self options];
  if (v57) {
    uint64_t Integer = GEOConfigGetInteger();
  }
  else {
    uint64_t Integer = 0;
  }
  [v3 setSimulationType:Integer];
  [(StartNavigationDetailsBuilder *)self options];
  [v3 setIsReconnecting:v56];
  id v7 = [v3 simulationType];
  if (GEOConfigGetBOOL())
  {
    [(StartNavigationDetailsBuilder *)self options];
    if (v55 == 2) {
      int BOOL = GEOConfigGetBOOL();
    }
    else {
      int BOOL = 1;
    }
  }
  else
  {
    int BOOL = 0;
  }
  long long v9 = [v3 tracePlaybackPath];
  if (v9)
  {
LABEL_23:

    goto LABEL_24;
  }
  if (v7 == (id)-1) {
    int v10 = 1;
  }
  else {
    int v10 = BOOL;
  }
  if (v10 == 1)
  {
    long long v11 = sub_1005768D4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (v7 == (id)-1) {
        objc_super v12 = @"YES";
      }
      else {
        objc_super v12 = @"NO";
      }
      objc_super v13 = v12;
      if (BOOL) {
        v14 = @"YES";
      }
      else {
        v14 = @"NO";
      }
      v15 = v14;
      *(_DWORD *)buf = 138543618;
      v60 = v13;
      __int16 v61 = 2114;
      v62 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "adding traceRecordingData: forceTraceRecordingForSimulation: %{public}@, shouldRecordTrace: %{public}@", buf, 0x16u);
    }
    v16 = [(StartNavigationDetailsBuilder *)self routeCollection];
    v17 = [v16 currentRoute];
    long long v9 = [v17 _maps_traceRecordingData];

    [v3 setTraceRecordingData:v9];
    goto LABEL_23;
  }
LABEL_24:
  v18 = [(StartNavigationDetailsBuilder *)self routeCollection];
  v19 = [v18 routes];
  [v3 setRoutes:v19];

  v20 = [(StartNavigationDetailsBuilder *)self routeCollection];
  [v3 setSelectedRouteIndex:[v20 currentRouteIndex]];

  v21 = +[MKLocationManager sharedLocationManager];
  v22 = [v21 lastLocation];

  if (v22)
  {
    id v23 = [objc_alloc((Class)MNLocation) initWithCLLocation:v22];
    [v3 setInitialUserLocation:v23];
  }
  else
  {
    [v3 setInitialUserLocation:0];
  }
  v24 = [(StartNavigationDetailsBuilder *)self routeAttributes];
  [v3 setRouteAttributes:v24];

  v25 = [(StartNavigationDetailsBuilder *)self routeCollection];
  v26 = [v25 currentRoute];
  v27 = [v26 routeInitializerData];
  v28 = [v27 directionsRequest];
  [v3 setDirectionsRequest:v28];

  v29 = [(StartNavigationDetailsBuilder *)self routeCollection];
  v30 = [v29 currentRoute];
  v31 = [v30 routeInitializerData];
  v32 = [v31 directionsResponse];
  [v3 setDirectionsResponse:v32];

  v33 = [(StartNavigationDetailsBuilder *)self traits];
  [v3 setTraits:v33];

  v34 = +[NSBundle mainBundle];
  v35 = [v34 bundleIdentifier];
  [v3 setRequestingAppIdentifier:v35];

  [(StartNavigationDetailsBuilder *)self options];
  id v36 = v54;
  if (!v54)
  {
    v37 = [(StartNavigationDetailsBuilder *)self routeCollection];
    v38 = [v37 currentRoute];
    [(StartNavigationDetailsBuilder *)self options];
    id v36 = [v38 suggestedNavigationModeForLocation:v22 context:v53];
  }
  uint64_t v39 = 4;
  if (v36 == (id)2) {
    uint64_t v39 = 2;
  }
  if (v36 == (id)1) {
    uint64_t v40 = 3;
  }
  else {
    uint64_t v40 = v39;
  }
  [(StartNavigationDetailsBuilder *)self options];
  if (v52)
  {
    [(StartNavigationDetailsBuilder *)self options];
    uint64_t v40 = v51;
    if (!v51)
    {
      v41 = [(StartNavigationDetailsBuilder *)self routeCollection];
      v42 = [v41 currentRoute];

      [v42 transportType];
      if (MNTransportTypeSupportsTurnByTurn())
      {
        if ([v42 isWalkingOnlyTransitRoute]) {
          uint64_t v40 = 2;
        }
        else {
          uint64_t v40 = 3;
        }
      }
      else
      {
        uint64_t v40 = 2;
      }
    }
  }
  [(StartNavigationDetailsBuilder *)self options];
  if (v50)
  {
    [(StartNavigationDetailsBuilder *)self options];
    if (v49 != 1)
    {
      [(StartNavigationDetailsBuilder *)self options];
      uint64_t v40 = v48;
      if (v48 == 3)
      {
        v43 = [(StartNavigationDetailsBuilder *)self routeCollection];
        v44 = [v43 currentRoute];
        [v44 transportType];
        int v45 = MNTransportTypeSupportsTurnByTurn();

        if (v45) {
          uint64_t v40 = 3;
        }
        else {
          uint64_t v40 = 2;
        }
      }
    }
  }
  [v3 setNavigationType:v40];
  [(StartNavigationDetailsBuilder *)self options];
  [v3 setGuidanceLevelOverride:v47];
  [v3 setIsResumingMultipointRoute:[self isResumingMultipointRoute]];

  return v3;
}

- (void)setCountryConfiguration:(id)a3
{
  id v5 = (GEOCountryConfiguration *)a3;
  countryConfiguration = self->_countryConfiguration;
  p_countryConfiguration = &self->_countryConfiguration;
  if (countryConfiguration != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_countryConfiguration, a3);
    id v5 = v8;
  }
}

- (GEOCountryConfiguration)countryConfiguration
{
  countryConfiguration = self->_countryConfiguration;
  if (countryConfiguration)
  {
    id v3 = countryConfiguration;
  }
  else
  {
    id v3 = +[GEOCountryConfiguration sharedConfiguration];
  }

  return v3;
}

- (void)setRouteAttributes:(id)a3
{
  id v5 = a3;
  routeAttributes = self->_routeAttributes;
  p_routeAttributes = &self->_routeAttributes;
  id v8 = v5;
  if ((+[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", routeAttributes) & 1) == 0) {
    objc_storeStrong((id *)p_routeAttributes, a3);
  }
}

- (GEORouteAttributes)routeAttributes
{
  routeAttributes = self->_routeAttributes;
  if (routeAttributes)
  {
    id v3 = routeAttributes;
  }
  else
  {
    v4 = [(StartNavigationDetailsBuilder *)self routeCollection];
    id v5 = [v4 currentRoute];
    id v3 = [v5 routeAttributes];
  }

  return v3;
}

- (NavigationDetailsOptions)options
{
  long long v3 = *(_OWORD *)&self[1].navigationMode;
  *(_OWORD *)&retstr->shouldSimulateLocations = *(_OWORD *)&self[1].preferredNavigationType;
  *(_OWORD *)&retstr->guidanceType = v3;
  *(_OWORD *)&retstr->isReconnecting = *(_OWORD *)&self[1].guidanceLevelOverride;
  retstr->navigationModeContext = *(void *)&self[2].shouldSimulateLocations;
  return self;
}

- (void)setOptions:(NavigationDetailsOptions *)a3
{
  long long v3 = *(_OWORD *)&a3->shouldSimulateLocations;
  long long v4 = *(_OWORD *)&a3->guidanceType;
  long long v5 = *(_OWORD *)&a3->isReconnecting;
  self->_options.navigationModeContext = a3->navigationModeContext;
  *(_OWORD *)&self->_options.guidanceType = v4;
  *(_OWORD *)&self->_options.isReconnecting = v5;
  *(_OWORD *)&self->_options.shouldSimulateLocations = v3;
}

- (NSString)traceRecordingNameOverride
{
  return self->_traceRecordingNameOverride;
}

- (void)setTraceRecordingNameOverride:(id)a3
{
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (NSString)tracePlaybackPath
{
  return self->_tracePlaybackPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracePlaybackPath, 0);
  objc_storeStrong((id *)&self->_routeCollection, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_traceRecordingNameOverride, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);

  objc_storeStrong((id *)&self->_countryConfiguration, 0);
}

@end