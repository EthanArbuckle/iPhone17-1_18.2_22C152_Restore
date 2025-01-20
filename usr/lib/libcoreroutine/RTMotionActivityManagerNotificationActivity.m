@interface RTMotionActivityManagerNotificationActivity
- (RTMotionActivity)activity;
- (RTMotionActivityManagerNotificationActivity)initWithActivity:(id)a3;
@end

@implementation RTMotionActivityManagerNotificationActivity

- (RTMotionActivityManagerNotificationActivity)initWithActivity:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTMotionActivityManagerNotificationActivity;
  v5 = [(RTNotification *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    activity = v5->_activity;
    v5->_activity = (RTMotionActivity *)v6;
  }
  return v5;
}

- (RTMotionActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
}

@end