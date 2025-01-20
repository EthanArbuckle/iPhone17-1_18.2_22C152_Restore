@interface ICMachineDataOperation
- (ICStoreRequestContext)requestContext;
- (NSData)data;
- (id)completionHandler;
- (int64_t)protocolVersion;
- (void)setCompletionHandler:(id)a3;
- (void)setData:(id)a3;
- (void)setProtocolVersion:(int64_t)a3;
- (void)setRequestContext:(id)a3;
@end

@implementation ICMachineDataOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setRequestContext:(id)a3
{
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

@end