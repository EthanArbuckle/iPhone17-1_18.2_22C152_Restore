@interface CLFenceHandoffMessage
- (NSString)primaryKey;
- (id)payload;
- (int64_t)messageType;
- (void)dealloc;
- (void)setMessageType:(int64_t)a3;
- (void)setPayload:(id)a3;
- (void)setPrimaryKey:(id)a3;
@end

@implementation CLFenceHandoffMessage

- (void)dealloc
{
  self->_payload = 0;
  self->_primaryKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLFenceHandoffMessage;
  [(CLFenceHandoffMessage *)&v3 dealloc];
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (id)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSString)primaryKey
{
  return self->_primaryKey;
}

- (void)setPrimaryKey:(id)a3
{
}

@end