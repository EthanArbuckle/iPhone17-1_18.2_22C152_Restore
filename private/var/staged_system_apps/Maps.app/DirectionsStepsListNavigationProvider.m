@interface DirectionsStepsListNavigationProvider
- (BOOL)isNavigating;
- (DirectionsStepsListNavigationDelegate)delegate;
- (DirectionsStepsListNavigationProvider)initWithDelegate:(id)a3;
- (GEOComposedRoute)route;
- (MNLocation)matchedLocation;
- (double)_progressAlongRouteWithDistanceInfo:(id)a3;
- (double)elapsedDistance;
- (unint64_t)activeStepIndex;
- (unint64_t)displayedStepIndex;
- (void)_startObservingNavigation;
- (void)_stopObservingNavigation;
- (void)dealloc;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didReceiveRealtimeUpdates:(id)a4;
- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)navigationService:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setDisplayedStepIndex:(unint64_t)a3;
@end

@implementation DirectionsStepsListNavigationProvider

- (void)dealloc
{
  [(DirectionsStepsListNavigationProvider *)self _stopObservingNavigation];
  v3.receiver = self;
  v3.super_class = (Class)DirectionsStepsListNavigationProvider;
  [(DirectionsStepsListNavigationProvider *)&v3 dealloc];
}

- (DirectionsStepsListNavigationProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DirectionsStepsListNavigationProvider;
  v5 = [(DirectionsStepsListNavigationProvider *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(DirectionsStepsListNavigationProvider *)v5 setDelegate:v4];
    [(DirectionsStepsListNavigationProvider *)v6 _startObservingNavigation];
  }

  return v6;
}

- (void)_startObservingNavigation
{
  if (!self->_navigationService)
  {
    objc_super v3 = +[MNNavigationService sharedService];
    navigationService = self->_navigationService;
    self->_navigationService = v3;

    v5 = self->_navigationService;
    [(MNNavigationService *)v5 registerObserver:self];
  }
}

- (void)_stopObservingNavigation
{
  navigationService = self->_navigationService;
  if (navigationService)
  {
    [(MNNavigationService *)navigationService unregisterObserver:self];
    id v4 = self->_navigationService;
    self->_navigationService = 0;
  }
}

- (GEOComposedRoute)route
{
  return (GEOComposedRoute *)[(MNNavigationService *)self->_navigationService route];
}

- (BOOL)isNavigating
{
  return [(MNNavigationService *)self->_navigationService isInNavigatingState];
}

- (unint64_t)activeStepIndex
{
  return (unint64_t)[(MNNavigationService *)self->_navigationService stepIndex];
}

- (double)elapsedDistance
{
  objc_super v3 = [(MNNavigationService *)self->_navigationService remainingDistanceInfo];
  [(DirectionsStepsListNavigationProvider *)self _progressAlongRouteWithDistanceInfo:v3];
  double v5 = v4;

  return v5;
}

- (unint64_t)displayedStepIndex
{
  return (unint64_t)[(MNNavigationService *)self->_navigationService displayedStepIndex];
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v6 = a3;
  id v9 = [(DirectionsStepsListNavigationProvider *)self delegate];
  uint64_t IsNavigating = MNNavigationServiceStateIsNavigating();
  objc_super v8 = [v6 route];

  [v9 navigationProvider:self didChangeToNavigating:IsNavigating withRoute:v8];
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = sub_10057767C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Auto-advance step index is NSNotFound, meaning no matched step. Ignore it and maintain what we have.", buf, 2u);
    }
  }
  else
  {
    id v8 = [(DirectionsStepsListNavigationProvider *)self delegate];
    [v8 navigationProvider:self didUpdateActiveStepIndex:a4];
  }
}

- (void)navigationService:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v7 = [(DirectionsStepsListNavigationProvider *)self delegate];
  [v7 navigationProvider:self didUpdateDisplayedStepIndex:a4];
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5 = a4;
  id v6 = [(DirectionsStepsListNavigationProvider *)self delegate];
  [v6 navigationProvider:self didUpdateMatchedLocation:v5];
}

- (void)navigationService:(id)a3 didReceiveRealtimeUpdates:(id)a4
{
  id v5 = a4;
  id v6 = [a3 route];
  id v7 = [v6 uniqueRouteID];

  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v5 count]];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [v14 routeID];
          unsigned int v16 = [v7 isEqual:v15];

          if (v16)
          {
            id v17 = v14;
            v18 = [v17 transitUpdate];

            if (v18)
            {
              v19 = [v17 transitUpdate];
              [v8 addObject:v19];
            }
          }
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  v20 = [(DirectionsStepsListNavigationProvider *)self delegate];
  id v21 = [v8 copy];
  [v20 navigationProvider:self didReceiveRealtimeUpdates:v21];
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v10 = a5;
  id v7 = [(DirectionsStepsListNavigationProvider *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(DirectionsStepsListNavigationProvider *)self delegate];
    [(DirectionsStepsListNavigationProvider *)self _progressAlongRouteWithDistanceInfo:v10];
    [v9 navigationProvider:didUpdateElapsedDistanceAlongRoute:self];
  }
}

- (double)_progressAlongRouteWithDistanceInfo:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  navigationService = self->_navigationService;
  id v4 = a3;
  id v5 = [(MNNavigationService *)navigationService route];
  [v5 distance];
  double v7 = v6;
  [v4 distanceRemainingToEndOfLeg];
  double v9 = v8;

  double v10 = v7 - v9;
  double result = 0.0;
  if (v10 >= 0.0) {
    return v10;
  }
  return result;
}

- (MNLocation)matchedLocation
{
  return self->_matchedLocation;
}

- (DirectionsStepsListNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DirectionsStepsListNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_matchedLocation, 0);

  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end