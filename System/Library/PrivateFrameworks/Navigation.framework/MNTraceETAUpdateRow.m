@interface MNTraceETAUpdateRow
- (GEOETATrafficUpdateRequest)request;
- (GEOETATrafficUpdateResponse)response;
- (NSError)error;
- (double)requestTimestamp;
- (double)responseTimestamp;
- (void)setError:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestTimestamp:(double)a3;
- (void)setResponse:(id)a3;
- (void)setResponseTimestamp:(double)a3;
@end

@implementation MNTraceETAUpdateRow

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end