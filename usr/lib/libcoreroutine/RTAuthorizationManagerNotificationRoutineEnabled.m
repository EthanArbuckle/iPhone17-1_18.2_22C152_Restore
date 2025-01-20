@interface RTAuthorizationManagerNotificationRoutineEnabled
- (BOOL)enabled;
- (RTAuthorizationManagerNotificationRoutineEnabled)initWithEnabled:(BOOL)a3;
@end

@implementation RTAuthorizationManagerNotificationRoutineEnabled

- (RTAuthorizationManagerNotificationRoutineEnabled)initWithEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTAuthorizationManagerNotificationRoutineEnabled;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_enabled = a3;
  }
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

@end