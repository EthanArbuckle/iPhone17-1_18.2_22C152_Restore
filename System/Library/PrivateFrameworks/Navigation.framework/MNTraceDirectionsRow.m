@interface MNTraceDirectionsRow
- (GEODirectionsRequest)request;
- (GEODirectionsResponse)response;
- (NSArray)routes;
- (NSArray)waypoints;
- (NSError)error;
- (double)requestTimestamp;
- (double)responseTimestamp;
- (unint64_t)selectedRouteIndex;
- (void)setError:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestTimestamp:(double)a3;
- (void)setResponse:(id)a3;
- (void)setResponseTimestamp:(double)a3;
- (void)setSelectedRouteIndex:(unint64_t)a3;
- (void)setWaypoints:(id)a3;
@end

@implementation MNTraceDirectionsRow

- (NSArray)routes
{
  v2 = self;
  MNTraceDirectionsRow.routes.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    sub_1B5438B88(0, &qword_1E9D54DB8);
    v5 = (void *)sub_1B5531F50();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (double)requestTimestamp
{
  return self->_requestTimestamp;
}

- (void)setRequestTimestamp:(double)a3
{
  self->_requestTimestamp = a3;
}

- (double)responseTimestamp
{
  return self->_responseTimestamp;
}

- (void)setResponseTimestamp:(double)a3
{
  self->_responseTimestamp = a3;
}

- (GEODirectionsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (GEODirectionsResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void)setSelectedRouteIndex:(unint64_t)a3
{
  self->_selectedRouteIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end