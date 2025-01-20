@interface NavdRouteLoadingTaskFactory
- (BOOL)isResumingMultipointRoute;
- (GEOComposedGeometryRoutePersistentData)persistentData;
- (GEOCountryConfiguration)countryConfiguration;
- (GEOMapServiceTraits)traits;
- (GEOResumeRouteHandle)resumeRouteHandle;
- (NSSet)supportedTransportTypes;
- (NavdRouteLoadingTaskFactory)initWithTransportTypes:(id)a3 traits:(id)a4 isResumingMultipointRoute:(BOOL)a5 resumeRouteHandle:(id)a6 persistentData:(id)a7;
- (NavdRouteLoadingTaskFactory)initWithUserDefaults:(id)a3 existingTiming:(id)a4 traits:(id)a5 isResumingMultipointRoute:(BOOL)a6 resumeRouteHandle:(id)a7 persistentData:(id)a8;
- (RequestTransportTypeInformation)transportTypeInformation;
- (RouteRequestBuilderFactory)routeRequestBuilderFactory;
- (id)_configurationByModifyingTransportTypeInfoDictionary:(id)a3;
- (id)_timing:(id)a3 forTransportType:(int64_t)a4;
- (id)factoryByModifyingCyclePreferences:(id)a3 timing:(id)a4;
- (id)factoryByModifyingDrivePreferences:(id)a3 timing:(id)a4;
- (id)factoryByModifyingTransitPreferences:(id)a3 timing:(id)a4;
- (id)factoryByModifyingWalkPreferences:(id)a3 timing:(id)a4;
- (id)taskForRoutes:(id)a3;
- (id)taskForTransportType:(int64_t)a3 waypointSet:(id)a4;
- (unint64_t)initiator;
- (void)setCountryConfiguration:(id)a3;
- (void)setInitiator:(unint64_t)a3;
- (void)setIsResumingMultipointRoute:(BOOL)a3;
- (void)setPersistentData:(id)a3;
- (void)setResumeRouteHandle:(id)a3;
- (void)setRouteRequestBuilderFactory:(id)a3;
- (void)setTraits:(id)a3;
@end

@implementation NavdRouteLoadingTaskFactory

- (id)_timing:(id)a3 forTransportType:(int64_t)a4
{
  id v5 = a3;
  if (MapsFeature_IsEnabled_Maps357RoutePlanning()) {
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013AA2B8, &off_1013AA2D0, 0);
  }
  else {
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1013AA2B8, 0, v11);
  }
  v7 = +[NSNumber numberWithInteger:a4];
  if ([v6 containsObject:v7])
  {
    id v8 = v5;
  }
  else
  {
    id v8 = +[RoutePlanningTiming leaveNowTiming];
  }
  v9 = v8;

  return v9;
}

- (id)factoryByModifyingTransitPreferences:(id)a3 timing:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100AE98B4;
  v10[3] = &unk_101317138;
  id v11 = a3;
  v12 = self;
  id v13 = a4;
  id v6 = v13;
  id v7 = v11;
  id v8 = [(NavdRouteLoadingTaskFactory *)self _configurationByModifyingTransportTypeInfoDictionary:v10];

  return v8;
}

- (id)factoryByModifyingDrivePreferences:(id)a3 timing:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100AE9AC4;
  v10[3] = &unk_101317138;
  id v11 = a3;
  v12 = self;
  id v13 = a4;
  id v6 = v13;
  id v7 = v11;
  id v8 = [(NavdRouteLoadingTaskFactory *)self _configurationByModifyingTransportTypeInfoDictionary:v10];

  return v8;
}

- (id)factoryByModifyingWalkPreferences:(id)a3 timing:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100AE9CD4;
  v10[3] = &unk_101317138;
  id v11 = a3;
  v12 = self;
  id v13 = a4;
  id v6 = v13;
  id v7 = v11;
  id v8 = [(NavdRouteLoadingTaskFactory *)self _configurationByModifyingTransportTypeInfoDictionary:v10];

  return v8;
}

- (id)factoryByModifyingCyclePreferences:(id)a3 timing:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100AE9E58;
  v10[3] = &unk_101317138;
  id v11 = a3;
  v12 = self;
  id v13 = a4;
  id v6 = v13;
  id v7 = v11;
  id v8 = [(NavdRouteLoadingTaskFactory *)self _configurationByModifyingTransportTypeInfoDictionary:v10];

  return v8;
}

- (id)_configurationByModifyingTransportTypeInfoDictionary:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v5 = [(NavdRouteLoadingTaskFactory *)self transportTypeInformation];
  id v6 = [v5 transportTypeInfoProviders];
  id v7 = [v6 mutableCopy];

  if (v4) {
    v4[2](v4, v7);
  }
  id v8 = [[RequestTransportTypeInformation alloc] initWithDictionary:v7];
  v9 = [NavdRouteLoadingTaskFactory alloc];
  v10 = [(NavdRouteLoadingTaskFactory *)self traits];
  BOOL v11 = [(NavdRouteLoadingTaskFactory *)self isResumingMultipointRoute];
  v12 = [(NavdRouteLoadingTaskFactory *)self resumeRouteHandle];
  id v13 = [(NavdRouteLoadingTaskFactory *)self persistentData];
  v14 = [(NavdRouteLoadingTaskFactory *)v9 initWithTransportTypes:v8 traits:v10 isResumingMultipointRoute:v11 resumeRouteHandle:v12 persistentData:v13];

  return v14;
}

- (NavdRouteLoadingTaskFactory)initWithUserDefaults:(id)a3 existingTiming:(id)a4 traits:(id)a5 isResumingMultipointRoute:(BOOL)a6 resumeRouteHandle:(id)a7 persistentData:(id)a8
{
  BOOL v38 = a6;
  id v12 = a3;
  id v13 = a4;
  id v37 = a5;
  id v35 = a7;
  v33 = v13;
  id v34 = a8;
  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    id v14 = +[RoutePlanningTiming leaveNowTiming];
  }
  v15 = v14;
  v16 = [RequestTransportTypeInformation alloc];
  v39[0] = &off_1013AA2E8;
  v17 = [WalkingRequestInfoProvider alloc];
  v32 = [[WalkPreferences alloc] initWithDefaults:v12];
  v31 = [(WalkingRequestInfoProvider *)v17 initWithPreferences:v32 timing:v15];
  v40[0] = v31;
  v39[1] = &off_1013AA300;
  v18 = [CyclingRequestInfoProvider alloc];
  v19 = [[CyclePreferences alloc] initWithDefaults:v12];
  v20 = [(CyclingRequestInfoProvider *)v18 initWithPreferences:v19 timing:v15];
  v40[1] = v20;
  v39[2] = &off_1013AA2D0;
  v21 = [DrivingRequestInfoProvider alloc];
  v22 = [[DrivePreferences alloc] initWithDefaults:v12];
  v23 = [(DrivingRequestInfoProvider *)v21 initWithPreferences:v22 timing:v15];
  v40[2] = v23;
  v39[3] = &off_1013AA2B8;
  v24 = [TransitRequestInfoProvider alloc];
  v25 = [(WatchSyncedPreferences *)[TransitPreferences alloc] initWithDefaults:v12];
  v26 = [(TransitRequestInfoProvider *)v24 initWithPreferences:v25 timing:v15];
  v40[3] = v26;
  v27 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
  v28 = [(RequestTransportTypeInformation *)v16 initWithDictionary:v27];

  v29 = [(NavdRouteLoadingTaskFactory *)self initWithTransportTypes:v28 traits:v37 isResumingMultipointRoute:v38 resumeRouteHandle:v35 persistentData:v34];
  return v29;
}

- (NavdRouteLoadingTaskFactory)initWithTransportTypes:(id)a3 traits:(id)a4 isResumingMultipointRoute:(BOOL)a5 resumeRouteHandle:(id)a6 persistentData:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)NavdRouteLoadingTaskFactory;
  v17 = [(NavdRouteLoadingTaskFactory *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_transportTypeInformation, a3);
    objc_storeStrong((id *)&v18->_traits, a4);
    v18->_isResumingMultipointRoute = a5;
    objc_storeStrong((id *)&v18->_resumeRouteHandle, a6);
    objc_storeStrong((id *)&v18->_persistentData, a7);
  }

  return v18;
}

- (NSSet)supportedTransportTypes
{
  supportedTransportTypes = self->_supportedTransportTypes;
  if (!supportedTransportTypes)
  {
    v4 = [(NavdRouteLoadingTaskFactory *)self transportTypeInformation];
    id v5 = [v4 transportTypeInfoProviders];
    id v6 = [v5 allKeys];
    id v7 = +[NSSet setWithArray:v6];
    id v8 = self->_supportedTransportTypes;
    self->_supportedTransportTypes = v7;

    supportedTransportTypes = self->_supportedTransportTypes;
  }

  return supportedTransportTypes;
}

- (void)setCountryConfiguration:(id)a3
{
  id v5 = (GEOCountryConfiguration *)a3;
  if (self->_countryConfiguration != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_countryConfiguration, a3);
    [(RouteRequestBuilderFactory *)self->_routeRequestBuilderFactory setCountryConfiguration:self->_countryConfiguration];
    id v5 = v6;
  }
}

- (void)setTraits:(id)a3
{
  id v5 = (GEOMapServiceTraits *)a3;
  if (self->_traits != v5)
  {
    objc_storeStrong((id *)&self->_traits, a3);
    [(RouteRequestBuilderFactory *)self->_routeRequestBuilderFactory setTraits:v5];
  }
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  if (self->_isResumingMultipointRoute != a3)
  {
    self->_isResumingMultipointRoute = a3;
    [(RouteRequestBuilderFactory *)self->_routeRequestBuilderFactory setIsResumingMultipointRoute:"setIsResumingMultipointRoute:"];
  }
}

- (void)setResumeRouteHandle:(id)a3
{
  id v5 = (GEOResumeRouteHandle *)a3;
  if (self->_resumeRouteHandle != v5)
  {
    objc_storeStrong((id *)&self->_resumeRouteHandle, a3);
    [(RouteRequestBuilderFactory *)self->_routeRequestBuilderFactory setResumeRouteHandle:v5];
  }
}

- (void)setPersistentData:(id)a3
{
  id v5 = (GEOComposedGeometryRoutePersistentData *)a3;
  if (self->_persistentData != v5)
  {
    objc_storeStrong((id *)&self->_persistentData, a3);
    [(RouteRequestBuilderFactory *)self->_routeRequestBuilderFactory setPersistentData:v5];
  }
}

- (GEOCountryConfiguration)countryConfiguration
{
  countryConfiguration = self->_countryConfiguration;
  if (countryConfiguration)
  {
    v3 = countryConfiguration;
  }
  else
  {
    v3 = +[GEOCountryConfiguration sharedConfiguration];
  }

  return v3;
}

- (id)taskForTransportType:(int64_t)a3 waypointSet:(id)a4
{
  id v6 = a4;
  id v7 = [(NavdRouteLoadingTaskFactory *)self transportTypeInformation];
  id v8 = [v7 requestInfoProviderForTransportType:a3];

  [v8 updateWithRefinedWaypoints:v6];
  if (v8)
  {
    routeRequestBuilderFactory = self->_routeRequestBuilderFactory;
    if (routeRequestBuilderFactory)
    {
      [(RouteRequestBuilderFactory *)routeRequestBuilderFactory setTransportTypeRequestInfoProvider:v8];
      [(RouteRequestBuilderFactory *)self->_routeRequestBuilderFactory setWaypointSet:v6];
    }
    else
    {
      BOOL v11 = [[RouteRequestBuilderFactory alloc] initWithTransportTypeRequestInfoProvider:v8 waypointSet:v6];
      id v12 = self->_routeRequestBuilderFactory;
      self->_routeRequestBuilderFactory = v11;

      if (self->_countryConfiguration) {
        -[RouteRequestBuilderFactory setCountryConfiguration:](self->_routeRequestBuilderFactory, "setCountryConfiguration:");
      }
    }
    [(RouteRequestBuilderFactory *)self->_routeRequestBuilderFactory setInitiator:self->_initiator];
    id v13 = [(NavdRouteLoadingTaskFactory *)self traits];
    [(RouteRequestBuilderFactory *)self->_routeRequestBuilderFactory setTraits:v13];

    [(RouteRequestBuilderFactory *)self->_routeRequestBuilderFactory setIsResumingMultipointRoute:[(NavdRouteLoadingTaskFactory *)self isResumingMultipointRoute]];
    id v14 = [(NavdRouteLoadingTaskFactory *)self resumeRouteHandle];
    [(RouteRequestBuilderFactory *)self->_routeRequestBuilderFactory setResumeRouteHandle:v14];

    id v15 = [(NavdRouteLoadingTaskFactory *)self persistentData];
    [(RouteRequestBuilderFactory *)self->_routeRequestBuilderFactory setPersistentData:v15];

    id v16 = [(RouteRequestBuilderFactory *)self->_routeRequestBuilderFactory makeRouteRequestBuilder];
    v17 = [RouteLoadingNavigationServiceTask alloc];
    v18 = +[MNNavigationService sharedService];
    v10 = [(RouteLoadingNavigationServiceTask *)v17 initWithNavigationService:v18 routeRequestDetailsBuilder:v16];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)taskForRoutes:(id)a3
{
  id v3 = a3;
  v4 = [[RouteUpdatingNavigationServiceTask alloc] initWithRoutes:v3];

  return v4;
}

- (unint64_t)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(unint64_t)a3
{
  self->_initiator = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (RequestTransportTypeInformation)transportTypeInformation
{
  return self->_transportTypeInformation;
}

- (RouteRequestBuilderFactory)routeRequestBuilderFactory
{
  return self->_routeRequestBuilderFactory;
}

- (void)setRouteRequestBuilderFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeRequestBuilderFactory, 0);
  objc_storeStrong((id *)&self->_transportTypeInformation, 0);
  objc_storeStrong((id *)&self->_persistentData, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_countryConfiguration, 0);

  objc_storeStrong((id *)&self->_supportedTransportTypes, 0);
}

@end