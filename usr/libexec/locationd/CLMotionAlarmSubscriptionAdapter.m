@interface CLMotionAlarmSubscriptionAdapter
- (BOOL)valid;
- (CLMotionAlarmSubscriptionAdapter)initWithMotionAlarmSubscription:(void *)a3;
- (void)fireAlarm:(id)a3 error:(int)a4;
- (void)motionAlarmSubscription;
- (void)setMotionAlarmSubscription:(void *)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLMotionAlarmSubscriptionAdapter

- (CLMotionAlarmSubscriptionAdapter)initWithMotionAlarmSubscription:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMotionAlarmSubscriptionAdapter;
  result = [(CLMotionAlarmSubscriptionAdapter *)&v5 init];
  if (result) {
    result->_motionAlarmSubscription = a3;
  }
  return result;
}

- (void)fireAlarm:(id)a3 error:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = [(CLMotionAlarmSubscriptionAdapter *)self motionAlarmSubscription];

  sub_100924A18((uint64_t)v6, (uint64_t)a3, v4);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)motionAlarmSubscription
{
  return self->_motionAlarmSubscription;
}

- (void)setMotionAlarmSubscription:(void *)a3
{
  self->_motionAlarmSubscription = a3;
}

@end