@interface RTUserSessionMonitorNotificationConsoleUserDidChange
- (BOOL)activeUser;
- (RTUserSessionMonitorNotificationConsoleUserDidChange)init;
- (RTUserSessionMonitorNotificationConsoleUserDidChange)initWithactiveUser:(BOOL)a3;
@end

@implementation RTUserSessionMonitorNotificationConsoleUserDidChange

- (RTUserSessionMonitorNotificationConsoleUserDidChange)init
{
  return [(RTUserSessionMonitorNotificationConsoleUserDidChange *)self initWithactiveUser:0];
}

- (RTUserSessionMonitorNotificationConsoleUserDidChange)initWithactiveUser:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTUserSessionMonitorNotificationConsoleUserDidChange;
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