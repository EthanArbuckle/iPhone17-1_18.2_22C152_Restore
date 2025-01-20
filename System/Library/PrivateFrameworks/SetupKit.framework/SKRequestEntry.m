@interface SKRequestEntry
- (NSDictionary)options;
- (NSString)requestID;
- (OS_dispatch_source)timer;
- (id)responseHandler;
- (unint64_t)sendTicks;
- (void)setOptions:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSendTicks:(unint64_t)a3;
- (void)setTimer:(id)a3;
@end

@implementation SKRequestEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setSendTicks:(unint64_t)a3
{
  self->_sendTicks = a3;
}

- (unint64_t)sendTicks
{
  return self->_sendTicks;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

@end