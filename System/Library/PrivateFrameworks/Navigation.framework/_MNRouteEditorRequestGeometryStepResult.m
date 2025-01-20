@interface _MNRouteEditorRequestGeometryStepResult
- (GEOComposedRoute)route;
- (GEODirectionsError)directionsError;
- (GEODirectionsRequest)directionsRequest;
- (NSError)error;
- (void)setDirectionsError:(id)a3;
- (void)setDirectionsRequest:(id)a3;
- (void)setError:(id)a3;
- (void)setRoute:(id)a3;
@end

@implementation _MNRouteEditorRequestGeometryStepResult

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (void)setDirectionsRequest:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
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
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end