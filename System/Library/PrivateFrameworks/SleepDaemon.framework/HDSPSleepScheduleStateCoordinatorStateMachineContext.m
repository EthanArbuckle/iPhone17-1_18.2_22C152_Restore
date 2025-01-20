@interface HDSPSleepScheduleStateCoordinatorStateMachineContext
+ (id)contextForAlarmTurnedOffWhileFiring;
+ (id)contextWithReason:(unint64_t)a3;
- (BOOL)isForAlarmTurnedOffWhileFiring;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)reason;
@end

@implementation HDSPSleepScheduleStateCoordinatorStateMachineContext

+ (id)contextWithReason:(unint64_t)a3
{
  v4 = objc_alloc_init((Class)a1);
  v4[5] = a3;

  return v4;
}

+ (id)contextForAlarmTurnedOffWhileFiring
{
  id result = (id)[a1 contextWithReason:7];
  *((unsigned char *)result + 32) = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDSPSleepScheduleStateCoordinatorStateMachineContext;
  id result = [(HKSPStateMachineContext *)&v5 copyWithZone:a3];
  *((void *)result + 5) = self->_reason;
  *((unsigned char *)result + 32) = self->_isForAlarmTurnedOffWhileFiring;
  return result;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (BOOL)isForAlarmTurnedOffWhileFiring
{
  return self->_isForAlarmTurnedOffWhileFiring;
}

@end