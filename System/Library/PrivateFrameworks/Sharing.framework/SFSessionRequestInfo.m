@interface SFSessionRequestInfo
- (NSDictionary)options;
- (NSDictionary)request;
- (NSString)requestID;
- (id)responseHandler;
- (void)setOptions:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation SFSessionRequestInfo

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_requestID, 0);
}

@end