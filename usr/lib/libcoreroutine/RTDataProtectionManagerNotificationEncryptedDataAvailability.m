@interface RTDataProtectionManagerNotificationEncryptedDataAvailability
- (RTDataProtectionManagerNotificationEncryptedDataAvailability)initWithEncryptedDataAvailability:(int64_t)a3;
- (int64_t)availability;
@end

@implementation RTDataProtectionManagerNotificationEncryptedDataAvailability

- (RTDataProtectionManagerNotificationEncryptedDataAvailability)initWithEncryptedDataAvailability:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTDataProtectionManagerNotificationEncryptedDataAvailability;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_availability = a3;
  }
  return result;
}

- (int64_t)availability
{
  return self->_availability;
}

@end