@interface HKSPSleepModeObject
+ (BOOL)supportsSecureCoding;
- (HKSPSleepModeObject)initWithCoder:(id)a3;
- (HKSPSleepModeObject)initWithSleepMode:(int64_t)a3 changeReason:(unint64_t)a4 syncAnchor:(id)a5;
- (HKSPSleepModeObject)objectWithSyncAnchor:(id)a3;
- (HKSPSyncAnchor)syncAnchor;
- (int64_t)sleepMode;
- (unint64_t)changeReason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPSleepModeObject

- (HKSPSleepModeObject)initWithSleepMode:(int64_t)a3 changeReason:(unint64_t)a4 syncAnchor:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKSPSleepModeObject;
  v9 = [(HKSPSleepModeObject *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_sleepMode = a3;
    v9->_changeReason = a4;
    uint64_t v11 = [v8 copyWithZone:0];
    syncAnchor = v10->_syncAnchor;
    v10->_syncAnchor = (HKSPSyncAnchor *)v11;

    v13 = v10;
  }

  return v10;
}

- (HKSPSleepModeObject)objectWithSyncAnchor:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSleepMode:self->_sleepMode changeReason:self->_changeReason syncAnchor:self->_syncAnchor];
  return (HKSPSleepModeObject *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sleepMode = self->_sleepMode;
  id v5 = a3;
  [v5 encodeInteger:sleepMode forKey:@"sleepMode"];
  [v5 encodeInteger:self->_changeReason forKey:@"changeReason"];
  [v5 encodeObject:self->_syncAnchor forKey:@"syncAnchor"];
}

- (HKSPSleepModeObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSPSleepModeObject;
  id v5 = [(HKSPSleepModeObject *)&v10 init];
  if (v5)
  {
    v5->_int64_t sleepMode = [v4 decodeIntegerForKey:@"sleepMode"];
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

- (int64_t)sleepMode
{
  return self->_sleepMode;
}

- (unint64_t)changeReason
{
  return self->_changeReason;
}

- (void).cxx_destruct
{
}

@end