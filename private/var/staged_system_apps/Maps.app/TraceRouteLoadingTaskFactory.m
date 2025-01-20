@interface TraceRouteLoadingTaskFactory
- (BOOL)isResumingMultipointRoute;
- (GEOComposedGeometryRoutePersistentData)persistentData;
- (GEOCountryConfiguration)countryConfiguration;
- (GEOMapServiceTraits)traits;
- (GEOResumeRouteHandle)resumeRouteHandle;
- (MNNavigationServiceDirectionsRequestTicket)ticket;
- (NSArray)waypointRequests;
- (NSSet)supportedTransportTypes;
- (NSString)tracePath;
- (TraceRouteLoadingTask)traceLoadingTask;
- (TraceRouteLoadingTaskFactory)initWithTracePath:(id)a3 outError:(id *)a4;
- (TraceRouteRequestBuilderFactory)routeRequestBuilderFactory;
- (id)taskForRoutes:(id)a3;
- (id)taskForTransportType:(int64_t)a3 waypointSet:(id)a4;
- (int64_t)traceTransportType;
- (unint64_t)initiator;
- (void)setCountryConfiguration:(id)a3;
- (void)setInitiator:(unint64_t)a3;
- (void)setIsResumingMultipointRoute:(BOOL)a3;
- (void)setPersistentData:(id)a3;
- (void)setResumeRouteHandle:(id)a3;
- (void)setRouteRequestBuilderFactory:(id)a3;
- (void)setTicket:(id)a3;
- (void)setTraceLoadingTask:(id)a3;
- (void)setTraits:(id)a3;
- (void)setWaypointRequests:(id)a3;
@end

@implementation TraceRouteLoadingTaskFactory

- (TraceRouteLoadingTaskFactory)initWithTracePath:(id)a3 outError:(id *)a4
{
  id v7 = a3;
  v39.receiver = self;
  v39.super_class = (Class)TraceRouteLoadingTaskFactory;
  v8 = [(TraceRouteLoadingTaskFactory *)&v39 init];
  v9 = v8;
  if (!v8)
  {
LABEL_17:
    v19 = v9;
    goto LABEL_18;
  }
  objc_storeStrong((id *)&v8->_tracePath, a3);
  v10 = objc_opt_new();
  tracePath = v9->_tracePath;
  id v38 = 0;
  v12 = [v10 loadTraceWithPath:tracePath options:8 outError:&v38];
  id v13 = v38;
  if (!v13)
  {
    unsigned int v20 = [v12 mainTransportType] - 1;
    id v33 = v7;
    if (v20 > 5) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = qword_100F720F8[v20];
    }
    v9->_traceTransportType = v21;
    v22 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v23 = [v12 directions];
    v24 = [v23 firstObject];
    v25 = [v24 waypoints];

    id v26 = [v25 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        v29 = 0;
        do
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [[TraceWaypointRequest alloc] initWithWaypoint:*(void *)(*((void *)&v34 + 1) + 8 * (void)v29)];
          [(NSArray *)v22 addObject:v30];

          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v27 = [v25 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v27);
    }

    waypointRequests = v9->_waypointRequests;
    v9->_waypointRequests = v22;

    id v7 = v33;
    goto LABEL_17;
  }
  v14 = v13;
  v9->_traceTransportType = 0;
  v15 = objc_opt_new();
  v40[0] = v15;
  v16 = objc_opt_new();
  v40[1] = v16;
  uint64_t v17 = +[NSArray arrayWithObjects:v40 count:2];
  v18 = v9->_waypointRequests;
  v9->_waypointRequests = (NSArray *)v17;

  if (a4) {
    *a4 = v14;
  }

  v19 = 0;
LABEL_18:

  return v19;
}

- (NSSet)supportedTransportTypes
{
  v2 = +[NSNumber numberWithInteger:self->_traceTransportType];
  v3 = +[NSSet setWithObject:v2];

  return (NSSet *)v3;
}

- (TraceRouteLoadingTask)traceLoadingTask
{
  traceLoadingTask = self->_traceLoadingTask;
  if (!traceLoadingTask)
  {
    v4 = [(TraceRouteLoadingTaskFactory *)self tracePath];
    v5 = [[TraceRouteLoadingTask alloc] initWithTracePath:v4];
    v6 = self->_traceLoadingTask;
    self->_traceLoadingTask = v5;

    traceLoadingTask = self->_traceLoadingTask;
  }

  return traceLoadingTask;
}

- (void)setCountryConfiguration:(id)a3
{
  v5 = (GEOCountryConfiguration *)a3;
  countryConfiguration = self->_countryConfiguration;
  p_countryConfiguration = &self->_countryConfiguration;
  if (countryConfiguration != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_countryConfiguration, a3);
    v5 = v8;
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
  v6 = [(TraceRouteLoadingTaskFactory *)self supportedTransportTypes];
  id v7 = +[NSNumber numberWithInteger:a3];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    v9 = [(TraceRouteLoadingTaskFactory *)self traceLoadingTask];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)taskForRoutes:(id)a3
{
  id v3 = a3;
  v4 = [[RouteUpdatingNavigationServiceTask alloc] initWithRoutes:v3];

  return v4;
}

- (int64_t)traceTransportType
{
  return self->_traceTransportType;
}

- (unint64_t)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(unint64_t)a3
{
  self->_initiator = a3;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (void)setResumeRouteHandle:(id)a3
{
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (void)setPersistentData:(id)a3
{
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (NSArray)waypointRequests
{
  return self->_waypointRequests;
}

- (void)setWaypointRequests:(id)a3
{
}

- (TraceRouteRequestBuilderFactory)routeRequestBuilderFactory
{
  return self->_routeRequestBuilderFactory;
}

- (void)setRouteRequestBuilderFactory:(id)a3
{
}

- (void)setTraceLoadingTask:(id)a3
{
}

- (MNNavigationServiceDirectionsRequestTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_traceLoadingTask, 0);
  objc_storeStrong((id *)&self->_routeRequestBuilderFactory, 0);
  objc_storeStrong((id *)&self->_waypointRequests, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_countryConfiguration, 0);
  objc_storeStrong((id *)&self->_persistentData, 0);
  objc_storeStrong((id *)&self->_traits, 0);

  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
}

@end