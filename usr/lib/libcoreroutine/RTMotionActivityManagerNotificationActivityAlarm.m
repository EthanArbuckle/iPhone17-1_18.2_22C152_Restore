@interface RTMotionActivityManagerNotificationActivityAlarm
- (RTMotionActivityManagerNotificationActivityAlarm)init;
- (RTMotionActivityManagerNotificationActivityAlarm)initWithActivityAlarmTrigger:(int64_t)a3;
- (id)description;
- (int64_t)trigger;
@end

@implementation RTMotionActivityManagerNotificationActivityAlarm

- (RTMotionActivityManagerNotificationActivityAlarm)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithActivityAlarmTrigger_);
}

- (RTMotionActivityManagerNotificationActivityAlarm)initWithActivityAlarmTrigger:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTMotionActivityManagerNotificationActivityAlarm;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_trigger = a3;
  }
  return result;
}

- (id)description
{
  uint64_t v2 = NSString;
  v3 = +[RTMotionActivityManager activityAlarmTriggerToString:[(RTMotionActivityManagerNotificationActivityAlarm *)self trigger]];
  v4 = [v2 stringWithFormat:@"activity alarm trigger, %@", v3];

  return v4;
}

- (int64_t)trigger
{
  return self->_trigger;
}

@end