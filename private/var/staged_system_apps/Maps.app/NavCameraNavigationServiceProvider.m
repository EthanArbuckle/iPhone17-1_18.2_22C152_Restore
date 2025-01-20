@interface NavCameraNavigationServiceProvider
- (BOOL)isInNavigatingState;
- (GEOComposedRoute)route;
- (MNLocation)lastLocation;
- (NSArray)alternateRoutes;
- (NSDictionary)alternateRouteTraffics;
- (NavCameraNavigationDelegate)delegate;
- (NavCameraNavigationServiceProvider)init;
- (double)distanceUntilManeuver;
- (double)timeUntilManeuver;
- (int)navigationState;
- (unint64_t)displayedStepIndex;
- (unint64_t)navigationDestination;
- (unint64_t)stepIndex;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateAlternateRoutes:(id)a4 traffics:(id)a5;
- (void)navigationService:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)setDelegate:(id)a3;
@end

@implementation NavCameraNavigationServiceProvider

- (NavCameraNavigationServiceProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)NavCameraNavigationServiceProvider;
  v2 = [(NavCameraNavigationServiceProvider *)&v5 init];
  if (v2)
  {
    v3 = +[MNNavigationService sharedService];
    [v3 registerObserver:v2];
  }
  return v2;
}

- (BOOL)isInNavigatingState
{
  v2 = +[MNNavigationService sharedService];
  unsigned __int8 v3 = [v2 isInNavigatingState];

  return v3;
}

- (GEOComposedRoute)route
{
  v2 = +[MNNavigationService sharedService];
  unsigned __int8 v3 = [v2 route];

  return (GEOComposedRoute *)v3;
}

- (unint64_t)stepIndex
{
  v2 = +[MNNavigationService sharedService];
  id v3 = [v2 stepIndex];

  return (unint64_t)v3;
}

- (unint64_t)displayedStepIndex
{
  v2 = +[MNNavigationService sharedService];
  id v3 = [v2 displayedStepIndex];

  return (unint64_t)v3;
}

- (int)navigationState
{
  v2 = +[MNNavigationService sharedService];
  int v3 = [v2 navigationState];

  return v3;
}

- (unint64_t)navigationDestination
{
  return 1;
}

- (MNLocation)lastLocation
{
  v2 = +[MNNavigationService sharedService];
  int v3 = [v2 lastLocation];

  return (MNLocation *)v3;
}

- (double)distanceUntilManeuver
{
  v2 = +[MNNavigationService sharedService];
  [v2 distanceUntilManeuver];
  double v4 = v3;

  return v4;
}

- (double)timeUntilManeuver
{
  v2 = +[MNNavigationService sharedService];
  [v2 timeUntilManeuver];
  double v4 = v3;

  return v4;
}

- (NSArray)alternateRoutes
{
  v2 = +[MNNavigationService sharedService];
  double v3 = [v2 alternateRoutes];

  return (NSArray *)v3;
}

- (NSDictionary)alternateRouteTraffics
{
  v2 = [(NavCameraNavigationServiceProvider *)self alternateRoutes];
  double v3 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v2 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 traffic:v14];
        v11 = [v9 uniqueRouteID];
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = [v3 copy];

  return (NSDictionary *)v12;
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v6 = [(NavCameraNavigationServiceProvider *)self delegate];
  [v6 navigationProvider:self didChangeToNavigating:MNNavigationServiceStateChangedToNavigating()];
}

- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(NavCameraNavigationServiceProvider *)self delegate];
  [v6 navigationProvider:self didChangeNavigationState:v4];
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5 = a4;
  id v6 = [(NavCameraNavigationServiceProvider *)self delegate];
  [v6 navigationProvider:self didUpdateMatchedLocation:v5];
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v8 = [(NavCameraNavigationServiceProvider *)self delegate];
  [v8 navigationProvider:self didUpdateStepIndex:a4 segmentIndex:a5];
}

- (void)navigationService:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v8 = [(NavCameraNavigationServiceProvider *)self delegate];
  [v8 navigationProvider:self didUpdateStepIndex:a4 segmentIndex:a5];
}

- (void)navigationService:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  id v10 = [(NavCameraNavigationServiceProvider *)self delegate];
  [v10 navigationProvider:self didUpdateDistanceUntilManeuver:a6 timeUntilManeuver:a4 forStepIndex:a5];
}

- (void)navigationService:(id)a3 didUpdateAlternateRoutes:(id)a4 traffics:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(NavCameraNavigationServiceProvider *)self delegate];
  [v9 navigationProvider:self didUpdateAlternateRoutes:v8 traffics:v7];
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6 = a4;
  id v8 = [(NavCameraNavigationServiceProvider *)self delegate];
  id v7 = [v6 traffic];
  [v8 navigationProvider:self didUpdateRoute:v6 traffic:v7];
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [(NavCameraNavigationServiceProvider *)self delegate];
  [v10 navigationProvider:self didUpdateRoute:v9 traffic:v8];
}

- (NavCameraNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavCameraNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end