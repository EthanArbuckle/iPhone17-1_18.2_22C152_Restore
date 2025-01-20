@interface _MNRouteEditorConvertToNavigableRouteStepResult
- (GEOAddressObject)address;
- (GEOComposedRoute)finalizedRoute;
- (GEODirectionsError)directionsError;
- (NSArray)waypoints;
- (NSError)stepError;
- (void)setAddress:(id)a3;
- (void)setDirectionsError:(id)a3;
- (void)setFinalizedRoute:(id)a3;
- (void)setStepError:(id)a3;
- (void)setWaypoints:(id)a3;
@end

@implementation _MNRouteEditorConvertToNavigableRouteStepResult

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
}

- (GEOAddressObject)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (GEOComposedRoute)finalizedRoute
{
  return self->_finalizedRoute;
}

- (void)setFinalizedRoute:(id)a3
{
}

- (NSError)stepError
{
  return self->_stepError;
}

- (void)setStepError:(id)a3
{
}

- (GEODirectionsError)directionsError
{
  return self->_directionsError;
}

- (void)setDirectionsError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsError, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_finalizedRoute, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
}

@end