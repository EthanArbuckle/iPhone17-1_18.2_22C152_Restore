@interface MNSessionUpdateResponseInfo
- (GEOETATrafficUpdateRequest)request;
- (GEOETATrafficUpdateResponse)response;
- (NSArray)waypoints;
- (NSError)error;
- (double)responseTime;
- (void)setError:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResponseTime:(double)a3;
- (void)setWaypoints:(id)a3;
@end

@implementation MNSessionUpdateResponseInfo

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
}

- (GEOETATrafficUpdateRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (GEOETATrafficUpdateResponse)response
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

- (double)responseTime
{
  return self->_responseTime;
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
}

@end