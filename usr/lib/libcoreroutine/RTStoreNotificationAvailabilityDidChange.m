@interface RTStoreNotificationAvailabilityDidChange
- (RTStoreNotificationAvailabilityDidChange)initWithAvailability:(unint64_t)a3;
- (id)description;
- (unint64_t)availability;
@end

@implementation RTStoreNotificationAvailabilityDidChange

- (RTStoreNotificationAvailabilityDidChange)initWithAvailability:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTStoreNotificationAvailabilityDidChange;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_availability = a3;
  }
  return result;
}

- (id)description
{
  v2 = NSString;
  v3 = +[RTStore availabilityToString:self->_availability];
  v4 = [v2 stringWithFormat:@"available, %@", v3];

  return v4;
}

- (unint64_t)availability
{
  return self->_availability;
}

@end