@interface RTMotionActivityManagerNotificationMotionSettledStateChange
- (RTMotionActivityManagerNotificationMotionSettledStateChange)init;
- (RTMotionActivityManagerNotificationMotionSettledStateChange)initWithSettledState:(unint64_t)a3;
- (id)description;
- (unint64_t)settledState;
@end

@implementation RTMotionActivityManagerNotificationMotionSettledStateChange

- (RTMotionActivityManagerNotificationMotionSettledStateChange)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithSettledState_);
}

- (RTMotionActivityManagerNotificationMotionSettledStateChange)initWithSettledState:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTMotionActivityManagerNotificationMotionSettledStateChange;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_settledState = a3;
  }
  return result;
}

- (id)description
{
  uint64_t v2 = NSString;
  v3 = +[RTMotionActivityManager motionSettledStateToString:[(RTMotionActivityManagerNotificationMotionSettledStateChange *)self settledState]];
  v4 = [v2 stringWithFormat:@"settled state, %@", v3];

  return v4;
}

- (unint64_t)settledState
{
  return self->_settledState;
}

@end