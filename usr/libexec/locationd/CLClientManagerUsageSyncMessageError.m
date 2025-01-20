@interface CLClientManagerUsageSyncMessageError
- (BOOL)recoverable;
- (CLClientManagerUsageSyncMessage)message;
- (NSError)error;
- (void)dealloc;
- (void)setError:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRecoverable:(BOOL)a3;
@end

@implementation CLClientManagerUsageSyncMessageError

- (void)dealloc
{
  self->_message = 0;
  self->_error = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLClientManagerUsageSyncMessageError;
  [(CLClientManagerUsageSyncMessageError *)&v3 dealloc];
}

- (CLClientManagerUsageSyncMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)recoverable
{
  return self->_recoverable;
}

- (void)setRecoverable:(BOOL)a3
{
  self->_recoverable = a3;
}

@end