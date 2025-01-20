@interface RTAuthorizationManagerNotificationConsoleUserDidChange
- (BOOL)activeUser;
- (RTAuthorizationManagerNotificationConsoleUserDidChange)init;
- (RTAuthorizationManagerNotificationConsoleUserDidChange)initWithactiveUser:(BOOL)a3;
@end

@implementation RTAuthorizationManagerNotificationConsoleUserDidChange

- (RTAuthorizationManagerNotificationConsoleUserDidChange)init
{
  return [(RTAuthorizationManagerNotificationConsoleUserDidChange *)self initWithactiveUser:0];
}

- (RTAuthorizationManagerNotificationConsoleUserDidChange)initWithactiveUser:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTAuthorizationManagerNotificationConsoleUserDidChange;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_activeUser = a3;
  }
  return result;
}

- (BOOL)activeUser
{
  return self->_activeUser;
}

@end