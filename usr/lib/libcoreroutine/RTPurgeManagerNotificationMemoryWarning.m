@interface RTPurgeManagerNotificationMemoryWarning
- (RTPurgeManagerNotificationMemoryWarning)initWithMemoryPressureState:(int64_t)a3;
- (int64_t)pressureState;
- (void)setPressureState:(int64_t)a3;
@end

@implementation RTPurgeManagerNotificationMemoryWarning

- (RTPurgeManagerNotificationMemoryWarning)initWithMemoryPressureState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTPurgeManagerNotificationMemoryWarning;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_pressureState = a3;
  }
  return result;
}

- (int64_t)pressureState
{
  return self->_pressureState;
}

- (void)setPressureState:(int64_t)a3
{
  self->_pressureState = a3;
}

@end