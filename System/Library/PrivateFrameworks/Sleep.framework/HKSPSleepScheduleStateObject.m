@interface HKSPSleepScheduleStateObject
+ (BOOL)supportsSecureCoding;
- (HKSPSleepScheduleStateObject)initWithCoder:(id)a3;
- (HKSPSleepScheduleStateObject)initWithScheduleState:(unint64_t)a3 changeReason:(unint64_t)a4 syncAnchor:(id)a5;
- (HKSPSleepScheduleStateObject)objectWithSyncAnchor:(id)a3;
- (HKSPSyncAnchor)syncAnchor;
- (unint64_t)changeReason;
- (unint64_t)scheduleState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPSleepScheduleStateObject

- (HKSPSleepScheduleStateObject)initWithScheduleState:(unint64_t)a3 changeReason:(unint64_t)a4 syncAnchor:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKSPSleepScheduleStateObject;
  v9 = [(HKSPSleepScheduleStateObject *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_scheduleState = a3;
    v9->_changeReason = a4;
    uint64_t v11 = [v8 copyWithZone:0];
    syncAnchor = v10->_syncAnchor;
    v10->_syncAnchor = (HKSPSyncAnchor *)v11;

    v13 = v10;
  }

  return v10;
}

- (HKSPSleepScheduleStateObject)objectWithSyncAnchor:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithScheduleState:self->_scheduleState changeReason:self->_changeReason syncAnchor:self->_syncAnchor];
  return (HKSPSleepScheduleStateObject *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t scheduleState = self->_scheduleState;
  id v5 = a3;
  [v5 encodeInteger:scheduleState forKey:@"state"];
  [v5 encodeInteger:self->_changeReason forKey:@"changeReason"];
  [v5 encodeObject:self->_syncAnchor forKey:@"syncAnchor"];
}

- (HKSPSleepScheduleStateObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSPSleepScheduleStateObject;
  id v5 = [(HKSPSleepScheduleStateObject *)&v10 init];
  if (v5)
  {
    v5->_unint64_t scheduleState = [v4 decodeIntegerForKey:@"state"];
    v5->_changeReason = [v4 decodeIntegerForKey:@"changeReason"];
    uint64_t v6 = [v4 decodeObjectOfClass:HKSPSyncAnchorClass() forKey:@"syncAnchor"];
    syncAnchor = v5->_syncAnchor;
    v5->_syncAnchor = (HKSPSyncAnchor *)v6;

    id v8 = v5;
  }

  return v5;
}

- (HKSPSyncAnchor)syncAnchor
{
  return self->_syncAnchor;
}

- (unint64_t)scheduleState
{
  return self->_scheduleState;
}

- (unint64_t)changeReason
{
  return self->_changeReason;
}

- (void).cxx_destruct
{
}

@end