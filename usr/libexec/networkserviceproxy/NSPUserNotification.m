@interface NSPUserNotification
@end

@implementation NSPUserNotification

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_notificationSource, 0);

  objc_storeStrong(&self->_notification, 0);
}

@end