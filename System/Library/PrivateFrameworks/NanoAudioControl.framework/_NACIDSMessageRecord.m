@interface _NACIDSMessageRecord
- (NSString)queueOne;
- (PBCodable)message;
- (double)timeout;
- (int64_t)type;
- (void)setMessage:(id)a3;
- (void)setQueueOne:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _NACIDSMessageRecord

- (PBCodable)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)queueOne
{
  return self->_queueOne;
}

- (void)setQueueOne:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueOne, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end