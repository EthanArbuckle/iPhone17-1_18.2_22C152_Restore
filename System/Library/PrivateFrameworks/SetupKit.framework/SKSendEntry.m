@interface SKSendEntry
- (NSData)eventData;
- (NSDictionary)options;
- (NSDictionary)request;
- (NSNumber)xidObj;
- (NSString)eventID;
- (NSString)requestID;
- (OS_dispatch_source)timer;
- (id)completion;
- (id)responseHandler;
- (unint64_t)queueTicks;
- (unsigned)xid;
- (void)setCompletion:(id)a3;
- (void)setEventData:(id)a3;
- (void)setEventID:(id)a3;
- (void)setOptions:(id)a3;
- (void)setQueueTicks:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setTimer:(id)a3;
- (void)setXid:(unsigned int)a3;
- (void)setXidObj:(id)a3;
@end

@implementation SKSendEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xidObj, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
  objc_storeStrong((id *)&self->_eventData, 0);

  objc_storeStrong(&self->_completion, 0);
}

- (void)setXidObj:(id)a3
{
}

- (NSNumber)xidObj
{
  return self->_xidObj;
}

- (void)setXid:(unsigned int)a3
{
  self->_xid = a3;
}

- (unsigned)xid
{
  return self->_xid;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setRequest:(id)a3
{
}

- (NSDictionary)request
{
  return self->_request;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setQueueTicks:(unint64_t)a3
{
  self->_queueTicks = a3;
}

- (unint64_t)queueTicks
{
  return self->_queueTicks;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setEventID:(id)a3
{
}

- (NSString)eventID
{
  return self->_eventID;
}

- (void)setEventData:(id)a3
{
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

@end