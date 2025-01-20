@interface CLLocationStreamingMessage
- (NSDictionary)idsOptions;
- (NSDictionary)payload;
- (NSString)messageType;
- (int)protocolVersion;
- (int64_t)priority;
- (void)dealloc;
- (void)setIdsOptions:(id)a3;
- (void)setMessageType:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProtocolVersion:(int)a3;
@end

@implementation CLLocationStreamingMessage

- (void)dealloc
{
  self->_messageType = 0;
  self->_payload = 0;

  self->_idsOptions = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLLocationStreamingMessage;
  [(CLLocationStreamingMessage *)&v3 dealloc];
}

- (NSString)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(id)a3
{
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSDictionary)idsOptions
{
  return self->_idsOptions;
}

- (void)setIdsOptions:(id)a3
{
}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int)a3
{
  self->_protocolVersion = a3;
}

@end