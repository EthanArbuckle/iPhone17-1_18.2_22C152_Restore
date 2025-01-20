@interface IMURLRequestService
- (NSURLRequest)mutableRequest;
- (NSURLSessionDelegate)urlSessionDelegate;
- (void)setMutableRequest:(id)a3;
- (void)setUrlSessionDelegate:(id)a3;
@end

@implementation IMURLRequestService

- (void)setUrlSessionDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(IMBaseStoreService *)self amsUrlSession];
  [v5 setDelegate:v4];
}

- (NSURLSessionDelegate)urlSessionDelegate
{
  v2 = [(IMBaseStoreService *)self amsUrlSession];
  v3 = [v2 session];
  id v4 = [v3 delegate];

  return (NSURLSessionDelegate *)v4;
}

- (NSURLRequest)mutableRequest
{
  return self->_mutableRequest;
}

- (void)setMutableRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end