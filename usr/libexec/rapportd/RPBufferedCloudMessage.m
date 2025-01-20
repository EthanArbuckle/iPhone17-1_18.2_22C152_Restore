@interface RPBufferedCloudMessage
- (NSDictionary)message;
- (RPCloudMessageContext)msgCtx;
- (unsigned)frameType;
- (void)setFrameType:(unsigned __int8)a3;
- (void)setMessage:(id)a3;
- (void)setMsgCtx:(id)a3;
@end

@implementation RPBufferedCloudMessage

- (unsigned)frameType
{
  return self->_frameType;
}

- (void)setFrameType:(unsigned __int8)a3
{
  self->_frameType = a3;
}

- (NSDictionary)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (RPCloudMessageContext)msgCtx
{
  return self->_msgCtx;
}

- (void)setMsgCtx:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgCtx, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end