@interface RAPDisplayedRouteState
- (GEOComposedRoute)composedRoute;
- (NSString)endWaypointTitle;
- (NSString)startWaypointTitle;
- (RAPDisplayedRouteState)initWithStartWaypointTitle:(id)a3 endWaypointTitle:(id)a4 transportType:(int)a5 composedRoute:(id)a6;
- (int)transportType;
@end

@implementation RAPDisplayedRouteState

- (RAPDisplayedRouteState)initWithStartWaypointTitle:(id)a3 endWaypointTitle:(id)a4 transportType:(int)a5 composedRoute:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RAPDisplayedRouteState;
  v13 = [(RAPDisplayedRouteState *)&v19 init];
  if (v13)
  {
    v14 = (NSString *)[v10 copy];
    startWaypointTitle = v13->_startWaypointTitle;
    v13->_startWaypointTitle = v14;

    v16 = (NSString *)[v11 copy];
    endWaypointTitle = v13->_endWaypointTitle;
    v13->_endWaypointTitle = v16;

    v13->_transportType = a5;
    objc_storeStrong((id *)&v13->_composedRoute, a6);
  }

  return v13;
}

- (int)transportType
{
  return self->_transportType;
}

- (GEOComposedRoute)composedRoute
{
  return self->_composedRoute;
}

- (NSString)startWaypointTitle
{
  return self->_startWaypointTitle;
}

- (NSString)endWaypointTitle
{
  return self->_endWaypointTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endWaypointTitle, 0);
  objc_storeStrong((id *)&self->_startWaypointTitle, 0);

  objc_storeStrong((id *)&self->_composedRoute, 0);
}

@end