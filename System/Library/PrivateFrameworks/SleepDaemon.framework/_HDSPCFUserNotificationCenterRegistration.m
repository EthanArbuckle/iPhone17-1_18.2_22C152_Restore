@interface _HDSPCFUserNotificationCenterRegistration
- (HDSPCFUserNotification)notification;
- (HDSPCFUserNotificationCenter)notificationCenter;
- (void)setNotification:(id)a3;
- (void)setNotificationCenter:(id)a3;
@end

@implementation _HDSPCFUserNotificationCenterRegistration

- (HDSPCFUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (HDSPCFUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);

  objc_storeStrong((id *)&self->_notification, 0);
}

@end