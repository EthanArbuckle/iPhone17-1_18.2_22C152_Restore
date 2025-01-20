@interface RTStarkManagerNotificationTrustedConnectionEstablished
- (BOOL)trustedConnectionEstablished;
- (RTStarkManagerNotificationTrustedConnectionEstablished)initWithTrustedConnectionEstablished:(BOOL)a3;
- (void)setTrustedConnectionEstablished:(BOOL)a3;
@end

@implementation RTStarkManagerNotificationTrustedConnectionEstablished

- (RTStarkManagerNotificationTrustedConnectionEstablished)initWithTrustedConnectionEstablished:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTStarkManagerNotificationTrustedConnectionEstablished;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_trustedConnectionEstablished = a3;
  }
  return result;
}

- (BOOL)trustedConnectionEstablished
{
  return self->_trustedConnectionEstablished;
}

- (void)setTrustedConnectionEstablished:(BOOL)a3
{
  self->_trustedConnectionEstablished = a3;
}

@end