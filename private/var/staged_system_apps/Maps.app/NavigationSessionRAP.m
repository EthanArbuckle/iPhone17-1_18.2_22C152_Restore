@interface NavigationSessionRAP
- (BOOL)isShowingDirections;
- (GEOComposedRoute)activeComposedRoute;
- (NavigationSessionRAP)initWithNavigationSession:(id)a3 routePlanningSession:(id)a4;
- (RAPDisplayedDirectionsPlan)displayedDirectionsPlan;
- (RAPDisplayedRouteState)currentDirections;
@end

@implementation NavigationSessionRAP

- (NavigationSessionRAP)initWithNavigationSession:(id)a3 routePlanningSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NavigationSessionRAP;
  v9 = [(NavigationSessionRAP *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigationSession, a3);
    objc_storeStrong((id *)&v10->_routePlanningSession, a4);
  }

  return v10;
}

- (GEOComposedRoute)activeComposedRoute
{
  v2 = [(NavigationSession *)self->_navigationSession currentRouteCollection];
  v3 = [v2 currentRoute];

  return (GEOComposedRoute *)v3;
}

- (RAPDisplayedRouteState)currentDirections
{
  v3 = [(NavigationSessionRAP *)self activeComposedRoute];

  if (v3)
  {
    navigationSession = self->_navigationSession;
    if (!navigationSession) {
      navigationSession = self->_routePlanningSession;
    }
    v5 = (char *)[navigationSession currentTransportType];
    v6 = [RAPDisplayedRouteState alloc];
    id v7 = [(RoutePlanningSession *)self->_routePlanningSession originName];
    id v8 = [(RoutePlanningSession *)self->_routePlanningSession destinationName];
    if ((unint64_t)(v5 - 2) > 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = dword_100F6F5C0[(void)(v5 - 2)];
    }
    v11 = [(NavigationSessionRAP *)self activeComposedRoute];
    v10 = [(RAPDisplayedRouteState *)v6 initWithStartWaypointTitle:v7 endWaypointTitle:v8 transportType:v9 composedRoute:v11];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (RAPDisplayedDirectionsPlan)displayedDirectionsPlan
{
  unint64_t v3 = [(NavigationSession *)self->_navigationSession currentTransportType];
  BOOL v4 = v3 > 4 || ((1 << v3) & 0x19) == 0;
  if (v4
    && (([(NavigationSession *)self->_navigationSession currentRouteCollection],
         (v6 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([(RoutePlanningSession *)self->_routePlanningSession currentRouteCollection],
         (v6 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    id v7 = [(RoutePlanningSession *)self->_routePlanningSession reportAProblemRecorder];
    id v8 = [v7 copyCurrentPartialRecording];

    v5 = [[RAPDisplayedDirectionsPlan alloc] initWithRouteCollection:v6 recording:v8];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isShowingDirections
{
  return self->_navigationSession != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningSession, 0);

  objc_storeStrong((id *)&self->_navigationSession, 0);
}

@end