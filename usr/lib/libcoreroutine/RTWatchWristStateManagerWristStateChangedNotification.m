@interface RTWatchWristStateManagerWristStateChangedNotification
- (RTWatchWristStateManagerWristStateChangedNotification)initWithWristState:(unint64_t)a3;
- (unint64_t)wristState;
@end

@implementation RTWatchWristStateManagerWristStateChangedNotification

- (RTWatchWristStateManagerWristStateChangedNotification)initWithWristState:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTWatchWristStateManagerWristStateChangedNotification;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_wristState = a3;
  }
  return result;
}

- (unint64_t)wristState
{
  return self->_wristState;
}

@end