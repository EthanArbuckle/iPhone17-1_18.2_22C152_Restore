@interface RTWiFiManagerNotificationPowerStatusChanged
- (RTWiFiManagerNotificationPowerStatusChanged)initWithPowerStatus:(unint64_t)a3;
- (unint64_t)powerStatus;
@end

@implementation RTWiFiManagerNotificationPowerStatusChanged

- (RTWiFiManagerNotificationPowerStatusChanged)initWithPowerStatus:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTWiFiManagerNotificationPowerStatusChanged;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_powerStatus = a3;
  }
  return result;
}

- (unint64_t)powerStatus
{
  return self->_powerStatus;
}

@end