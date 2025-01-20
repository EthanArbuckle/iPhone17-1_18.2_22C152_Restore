@interface RideBookingPlanningSession
- (GEOMapServiceTraits)traits;
- (GEOObserverHashTable)observers;
- (NSArray)waypointRequests;
- (NSString)destinationName;
- (NSString)originName;
- (PlatformController)platformController;
- (Result)resolvedWaypointsResult;
- (Result)rideOptionStateObserverResult;
- (RideBookingPlanningSession)initWithInitiator:(unint64_t)a3 waypointRequests:(id)a4 traits:(id)a5;
- (RideBookingRideOptionStateObserverProxy)rideOptionStateObserver;
- (RoutePlanningWaypointRequest)destinationRequest;
- (RoutePlanningWaypointRequest)originRequest;
- (WaypointController)waypointController;
- (WaypointSet)resolvedWaypoints;
- (int64_t)requestState;
- (unint64_t)sessionInitiator;
- (unint64_t)sessionState;
- (void)_handleReceivedWaypointSetResult;
- (void)addObserver:(id)a3;
- (void)cleanupStateReplay;
- (void)enumerateRequestsOrWaypointsUsingBlock:(id)a3;
- (void)prepareToReplayCurrentState;
- (void)refresh;
- (void)removeObserver:(id)a3;
- (void)replayCurrentState;
- (void)resume;
- (void)rideOptionStateDidChange:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setRideOptionStateObserverResult:(id)a3;
- (void)setSessionState:(unint64_t)a3;
- (void)setWaypointController:(id)a3;
- (void)suspend;
- (void)waypointController:(id)a3 didResolveWaypointSet:(id)a4;
@end

@implementation RideBookingPlanningSession

- (RideBookingPlanningSession)initWithInitiator:(unint64_t)a3 waypointRequests:(id)a4 traits:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)RideBookingPlanningSession;
  v11 = [(RideBookingPlanningSession *)&v28 init];
  v12 = v11;
  if (v11)
  {
    v11->_sessionInitiator = a3;
    objc_storeStrong((id *)&v11->_waypointRequests, a4);
    uint64_t v13 = [v9 objectAtIndexedSubscript:0];
    originRequest = v12->_originRequest;
    v12->_originRequest = (RoutePlanningWaypointRequest *)v13;

    uint64_t v15 = [v9 objectAtIndexedSubscript:1];
    destinationRequest = v12->_destinationRequest;
    v12->_destinationRequest = (RoutePlanningWaypointRequest *)v15;

    v17 = (GEOMapServiceTraits *)[v10 copy];
    traits = v12->_traits;
    v12->_traits = v17;

    v19 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___RideBookingPlanningSessionObserver queue:0];
    observers = v12->_observers;
    v12->_observers = v19;

    v21 = [(RoutePlanningWaypointRequest *)v12->_originRequest waypointRequest];
    v29[0] = v21;
    v22 = [(RoutePlanningWaypointRequest *)v12->_destinationRequest waypointRequest];
    v29[1] = v22;
    v23 = +[NSArray arrayWithObjects:v29 count:2];

    v24 = [[WaypointControllerConfiguration alloc] initWithRequests:v23 traits:v12->_traits];
    v25 = [[WaypointController alloc] initWithConfiguration:v24];
    waypointController = v12->_waypointController;
    v12->_waypointController = v25;

    [(WaypointController *)v12->_waypointController setDelegate:v12];
  }

  return v12;
}

- (NSString)originName
{
  v3 = [(RideBookingPlanningSession *)self originRequest];
  v4 = [(RideBookingPlanningSession *)self resolvedWaypoints];
  v5 = [v4 origin];
  v6 = [v3 nameWithResolvedWaypoint:v5 allowCurrentLocation:1];

  return (NSString *)v6;
}

- (NSString)destinationName
{
  v3 = [(RideBookingPlanningSession *)self destinationRequest];
  v4 = [(RideBookingPlanningSession *)self resolvedWaypoints];
  v5 = [v4 destination];
  v6 = [v3 nameWithResolvedWaypoint:v5 allowCurrentLocation:0];

  return (NSString *)v6;
}

- (Result)resolvedWaypointsResult
{
  v2 = [(RideBookingPlanningSession *)self waypointController];
  v3 = [v2 resolvedWaypointSetResult];

  return (Result *)v3;
}

- (WaypointSet)resolvedWaypoints
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100103D3C;
  id v10 = sub_100104728;
  id v11 = 0;
  v2 = [(RideBookingPlanningSession *)self resolvedWaypointsResult];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1005ADE28;
  v5[3] = &unk_1012F0A88;
  v5[4] = &v6;
  [v2 withValue:v5 orError:&stru_1012F0AA8];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WaypointSet *)v3;
}

- (RideBookingRideOptionStateObserverProxy)rideOptionStateObserver
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100103D3C;
  id v10 = sub_100104728;
  id v11 = 0;
  v2 = [(RideBookingPlanningSession *)self rideOptionStateObserverResult];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1005ADF54;
  v5[3] = &unk_1012F0AD0;
  v5[4] = &v6;
  [v2 withValue:v5 orError:&stru_1012F0AF0];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (RideBookingRideOptionStateObserverProxy *)v3;
}

- (void)refresh
{
  if ([(RideBookingPlanningSession *)self sessionState])
  {
    id v3 = [(RideBookingPlanningSession *)self waypointController];
    [v3 stop];

    [(RideBookingPlanningSession *)self setRideOptionStateObserverResult:0];
    id v4 = [(RideBookingPlanningSession *)self waypointController];
    [v4 start];
  }
}

- (void)resume
{
  if (![(RideBookingPlanningSession *)self sessionState])
  {
    [(RideBookingPlanningSession *)self setSessionState:1];
    id v3 = [(RideBookingPlanningSession *)self observers];
    [v3 mapsSession:self didChangeState:[self sessionState]];

    id v4 = [(RideBookingPlanningSession *)self waypointController];
    [v4 start];
  }
}

- (void)suspend
{
  if ((id)[(RideBookingPlanningSession *)self sessionState] == (id)1)
  {
    id v3 = [(RideBookingPlanningSession *)self waypointController];
    [v3 stop];

    [(RideBookingPlanningSession *)self setRideOptionStateObserverResult:0];
    [(RideBookingPlanningSession *)self setSessionState:2];
    id v4 = [(RideBookingPlanningSession *)self observers];
    [v4 mapsSession:self didChangeState:[self sessionState]];
  }
}

- (void)prepareToReplayCurrentState
{
  id v2 = [(RideBookingPlanningSession *)self observers];
  [v2 snapshotCurrentObservers];
}

- (void)replayCurrentState
{
  id v3 = [(RideBookingPlanningSession *)self observers];
  [v3 removeSnapshottedObservers];

  id v4 = [(RideBookingPlanningSession *)self observers];
  [v4 mapsSession:self didChangeState:[self sessionState]];

  id v5 = [(RideBookingPlanningSession *)self observers];
  [v5 restoreOriginalObservers];
}

- (void)cleanupStateReplay
{
  id v2 = [(RideBookingPlanningSession *)self observers];
  [v2 clearSnapshottedObservers];
}

- (void)_handleReceivedWaypointSetResult
{
  id v3 = [(RideBookingPlanningSession *)self resolvedWaypointsResult];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005AE37C;
  v8[3] = &unk_1012F0B18;
  v8[4] = self;
  id v4 = [v3 flatMap:v8];
  [(RideBookingPlanningSession *)self setRideOptionStateObserverResult:v4];

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005AE4A8;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v6, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(RideBookingPlanningSession *)self observers];
  [v5 registerObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(RideBookingPlanningSession *)self observers];
  [v5 unregisterObserver:v4];
}

- (void)waypointController:(id)a3 didResolveWaypointSet:(id)a4
{
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  uint64_t v8 = sub_1005AE700;
  id v9 = &unk_1012E5D58;
  id v10 = self;
  id v11 = a4;
  id v5 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v6);
  [(RideBookingPlanningSession *)self _handleReceivedWaypointSetResult];
}

- (void)rideOptionStateDidChange:(id)a3
{
  id v4 = a3;
  if ([v4 noRideOptionsAvailable]
    && [v4 noAppStoreSuggestionsAvailable])
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"Directions Not Available" value:@"localized string not found" table:0];

    uint64_t v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"No ride booking apps for your location are available from the App Store. [Ridesharing Route Planning]" value:@"localized string not found" table:0];

    v13[0] = NSLocalizedDescriptionKey;
    v13[1] = NSLocalizedFailureReasonErrorKey;
    v14[0] = v6;
    v14[1] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v10 = +[NSError errorWithDomain:@"com.Maps.RideBooking" code:0 userInfo:v9];
    id v11 = +[Result resultWithError:v10];
    [(RideBookingPlanningSession *)self setRideOptionStateObserverResult:v11];
  }
  v12 = [(RideBookingPlanningSession *)self observers];
  [v12 RideBookingPlanningSession:self rideOptionStateDidChange:v4];
}

- (unint64_t)sessionInitiator
{
  return self->_sessionInitiator;
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (RoutePlanningWaypointRequest)originRequest
{
  return self->_originRequest;
}

- (RoutePlanningWaypointRequest)destinationRequest
{
  return self->_destinationRequest;
}

- (NSArray)waypointRequests
{
  return self->_waypointRequests;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (Result)rideOptionStateObserverResult
{
  return self->_rideOptionStateObserverResult;
}

- (void)setRideOptionStateObserverResult:(id)a3
{
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(unint64_t)a3
{
  self->_sessionState = a3;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (WaypointController)waypointController
{
  return self->_waypointController;
}

- (void)setWaypointController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_rideOptionStateObserverResult, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_waypointRequests, 0);
  objc_storeStrong((id *)&self->_destinationRequest, 0);
  objc_storeStrong((id *)&self->_originRequest, 0);

  objc_destroyWeak((id *)&self->_platformController);
}

- (int64_t)requestState
{
  id v3 = +[GEONetworkObserver sharedNetworkObserver];
  unsigned int v4 = [v3 isNetworkReachable];

  if (!v4) {
    return 3;
  }
  id v5 = [(RideBookingPlanningSession *)self rideOptionStateObserverResult];
  id v6 = v5;
  if (v5)
  {
    if ([v5 isSuccess]) {
      int64_t v7 = 2;
    }
    else {
      int64_t v7 = 3;
    }
  }
  else
  {
    uint64_t v8 = [(RideBookingPlanningSession *)self resolvedWaypointsResult];
    if (v8)
    {
      id v9 = [(RideBookingPlanningSession *)self resolvedWaypointsResult];
      if ([v9 isSuccess]) {
        int64_t v7 = 1;
      }
      else {
        int64_t v7 = 3;
      }
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  return v7;
}

- (void)enumerateRequestsOrWaypointsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(RideBookingPlanningSession *)self resolvedWaypoints];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 count];
    uint64_t v8 = [(RideBookingPlanningSession *)self waypointRequests];
    id v9 = [v8 count];

    if (v7 != v9)
    {
      id v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v20 = "-[RideBookingPlanningSession(WaypointsOrRequests) enumerateRequestsOrWaypointsUsingBlock:]";
        __int16 v21 = 2080;
        v22 = "RideBookingPlanningSession+WaypointsOrRequests.m";
        __int16 v23 = 1024;
        int v24 = 21;
        __int16 v25 = 2080;
        v26 = "!resolvedWaypoints || resolvedWaypoints.count == self.waypointRequests.count";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        id v11 = sub_1005762E4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v20 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  uint64_t v13 = [(RideBookingPlanningSession *)self waypointRequests];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100D038A4;
  v16[3] = &unk_101321C20;
  id v17 = v6;
  id v18 = v4;
  id v14 = v4;
  id v15 = v6;
  [v13 enumerateObjectsUsingBlock:v16];
}

@end