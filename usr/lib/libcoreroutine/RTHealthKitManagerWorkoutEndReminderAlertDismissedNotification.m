@interface RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification
- (RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification)initWithAlertDimissedReason:(unint64_t)a3;
- (id)description;
- (unint64_t)reason;
- (void)setReason:(unint64_t)a3;
@end

@implementation RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification

- (RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification)initWithAlertDimissedReason:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_reason = a3;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = [(RTNotification *)self name];
  objc_super v5 = +[RTHealthKitManager stringFromRTWorkoutEndReminderAlertDismissedReason:self->_reason];
  v6 = [v3 stringWithFormat:@"name, %@, reason, %@,", v4, v5];

  return v6;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

@end