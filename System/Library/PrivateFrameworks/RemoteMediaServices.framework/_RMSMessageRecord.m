@interface _RMSMessageRecord
- (id)responseBlock;
- (unsigned)messageType;
- (void)setMessageType:(unsigned __int16)a3;
- (void)setResponseBlock:(id)a3;
@end

@implementation _RMSMessageRecord

- (unsigned)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unsigned __int16)a3
{
  self->_messageType = a3;
}

- (id)responseBlock
{
  return self->_responseBlock;
}

- (void)setResponseBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end