@interface RPRequestEntry
- (NSDictionary)options;
- (NSString)requestID;
- (OS_dispatch_source)timer;
- (id)responseHandler;
- (unint64_t)length;
- (unint64_t)sendTicks;
- (unsigned)xpcID;
- (void)setLength:(unint64_t)a3;
- (void)setOptions:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSendTicks:(unint64_t)a3;
- (void)setTimer:(id)a3;
- (void)setXpcID:(unsigned int)a3;
@end

@implementation RPRequestEntry

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (unint64_t)sendTicks
{
  return self->_sendTicks;
}

- (void)setSendTicks:(unint64_t)a3
{
  self->_sendTicks = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (unsigned)xpcID
{
  return self->_xpcID;
}

- (void)setXpcID:(unsigned int)a3
{
  self->_xpcID = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end