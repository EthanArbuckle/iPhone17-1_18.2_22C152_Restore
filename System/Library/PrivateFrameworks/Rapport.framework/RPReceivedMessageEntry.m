@interface RPReceivedMessageEntry
- (NSDictionary)event;
- (NSDictionary)options;
- (NSDictionary)request;
- (NSNumber)sessionID;
- (NSString)eventID;
- (NSString)requestID;
- (id)responseHandler;
- (void)setEvent:(id)a3;
- (void)setEventID:(id)a3;
- (void)setOptions:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation RPReceivedMessageEntry

- (NSString)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
}

- (NSDictionary)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
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

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
}

@end