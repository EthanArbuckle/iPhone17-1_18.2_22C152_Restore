@interface HKSPMutableSleepScheduleOccurrence
+ (BOOL)supportsSecureCoding;
- (HKSPAlarmConfiguration)alarmConfiguration;
- (HKSPChangeSet)changeSet;
- (HKSPMutableSleepScheduleOccurrence)init;
- (HKSPMutableSleepScheduleOccurrence)initWithCoder:(id)a3;
- (HKSPMutableSleepScheduleOccurrence)initWithTemplateOccurrence:(id)a3;
- (HKSPObject)originalObject;
- (HKSPSleepScheduleDayOccurrence)backingOccurrence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromObject:(id)a3;
- (id)mutableCopy;
- (unint64_t)weekdays;
- (void)applyHourAndMinuteFromBedtimeComponents:(id)a3 wakeUpComponents:(id)a4 gregorianCalendar:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)freeze;
- (void)revert;
- (void)setAlarmConfiguration:(id)a3;
- (void)setBackingOccurrence:(id)a3;
- (void)setBedtimeComponents:(id)a3;
- (void)setWakeUpComponents:(id)a3;
- (void)setWeekdays:(unint64_t)a3;
- (void)turnOffAlarm;
- (void)turnOffWeekdays:(unint64_t)a3;
- (void)turnOnAlarm;
- (void)turnOnWeekdays:(unint64_t)a3;
@end

@implementation HKSPMutableSleepScheduleOccurrence

- (void)setBackingOccurrence:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPOccurrenceBackingOccurrence"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPOccurrenceBackingOccurrence"])
  {
    [v6 isRelationshipProperty];
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (void)setWeekdays:(unint64_t)a3
{
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPOccurrenceWeekdays"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (v8 != a3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPOccurrenceWeekdays"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (HKSPMutableSleepScheduleOccurrence)init
{
  v9.receiver = self;
  v9.super_class = (Class)HKSPMutableSleepScheduleOccurrence;
  v2 = [(HKSPSleepScheduleOccurrence *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(HKSPSleepScheduleOccurrence);
    originalObject = v2->_originalObject;
    v2->_originalObject = (HKSPObject *)v3;

    v5 = objc_alloc_init(HKSPChangeSet);
    changeSet = v2->_changeSet;
    v2->_changeSet = v5;

    v7 = v2;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HKSPSleepScheduleOccurrence alloc];
  return [(HKSPSleepScheduleOccurrence *)v4 initFromObject:self];
}

- (unint64_t)weekdays
{
  v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPOccurrenceWeekdays"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPOccurrenceWeekdays"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPOccurrenceWeekdays"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (HKSPSleepScheduleDayOccurrence)backingOccurrence
{
  v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPOccurrenceBackingOccurrence"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPOccurrenceBackingOccurrence"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPOccurrenceBackingOccurrence"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_originalObject, 0);
}

- (id)initFromObject:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"HKSPSleepScheduleOccurrence.m" lineNumber:405 description:@"object must be a subclass"];
  }
  v14.receiver = self;
  v14.super_class = (Class)HKSPMutableSleepScheduleOccurrence;
  v6 = [(HKSPSleepScheduleOccurrence *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [v5 copyWithZone:0];
    originalObject = v6->_originalObject;
    v6->_originalObject = (HKSPObject *)v7;

    objc_super v9 = objc_alloc_init(HKSPChangeSet);
    changeSet = v6->_changeSet;
    v6->_changeSet = v9;

    id v11 = v6;
  }

  return v6;
}

- (HKSPMutableSleepScheduleOccurrence)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPMutableSleepScheduleOccurrence;
  id v5 = [(HKSPSleepScheduleOccurrence *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKSPOriginalObject"];
    originalObject = v5->_originalObject;
    v5->_originalObject = (HKSPObject *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKSPChangeSet"];
    changeSet = v5->_changeSet;
    v5->_changeSet = (HKSPChangeSet *)v8;

    v10 = v5;
  }

  return v5;
}

- (HKSPMutableSleepScheduleOccurrence)initWithTemplateOccurrence:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPMutableSleepScheduleOccurrence *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 bedtimeComponents];
    [(HKSPMutableSleepScheduleOccurrence *)v5 setBedtimeComponents:v6];

    uint64_t v7 = [v4 wakeUpComponents];
    [(HKSPMutableSleepScheduleOccurrence *)v5 setWakeUpComponents:v7];

    -[HKSPMutableSleepScheduleOccurrence setWeekdays:](v5, "setWeekdays:", [v4 weekdays]);
    uint64_t v8 = [HKSPMutableAlarmConfiguration alloc];
    objc_super v9 = [v4 alarmConfiguration];
    v10 = [(HKSPMutableAlarmConfiguration *)v8 initWithTemplateAlarmConfiguration:v9];
    [(HKSPMutableSleepScheduleOccurrence *)v5 setAlarmConfiguration:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  originalObject = self->_originalObject;
  id v5 = a3;
  [v5 encodeObject:originalObject forKey:@"HKSPOriginalObject"];
  [v5 encodeObject:self->_changeSet forKey:@"HKSPChangeSet"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopy
{
  v3 = objc_alloc_init((Class)objc_opt_class());
  id v4 = [(HKSPMutableSleepScheduleOccurrence *)self originalObject];
  uint64_t v5 = [v4 copyWithZone:0];
  uint64_t v6 = (void *)v3[4];
  v3[4] = v5;

  uint64_t v7 = [(HKSPMutableSleepScheduleOccurrence *)self changeSet];
  uint64_t v8 = [v7 deepCopy];
  objc_super v9 = (void *)v3[5];
  v3[5] = v8;

  return v3;
}

- (void)freeze
{
  v3 = [[HKSPSleepScheduleOccurrence alloc] initFromObject:self];
  originalObject = self->_originalObject;
  self->_originalObject = v3;

  [(HKSPMutableSleepScheduleOccurrence *)self revert];
}

- (void)revert
{
}

- (void)turnOnWeekdays:(unint64_t)a3
{
  unint64_t v4 = [(HKSPMutableSleepScheduleOccurrence *)self weekdays] | a3;
  [(HKSPMutableSleepScheduleOccurrence *)self setWeekdays:v4];
}

- (void)turnOffWeekdays:(unint64_t)a3
{
  unint64_t v4 = [(HKSPMutableSleepScheduleOccurrence *)self weekdays] & ~a3;
  [(HKSPMutableSleepScheduleOccurrence *)self setWeekdays:v4];
}

- (void)turnOnAlarm
{
  v3 = [(HKSPMutableSleepScheduleOccurrence *)self alarmConfiguration];
  id v4 = (id)[v3 mutableCopy];

  [v4 setEnabled:1];
  [(HKSPMutableSleepScheduleOccurrence *)self setAlarmConfiguration:v4];
}

- (void)turnOffAlarm
{
  v3 = [(HKSPMutableSleepScheduleOccurrence *)self alarmConfiguration];
  id v4 = (id)[v3 mutableCopy];

  [v4 setEnabled:0];
  [(HKSPMutableSleepScheduleOccurrence *)self setAlarmConfiguration:v4];
}

- (void)setWakeUpComponents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPMutableSleepScheduleOccurrence *)self backingOccurrence];
  id v6 = (id)[v5 mutableCopy];

  [v6 setWakeUpComponents:v4];
  [(HKSPMutableSleepScheduleOccurrence *)self setBackingOccurrence:v6];
}

- (void)setBedtimeComponents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPMutableSleepScheduleOccurrence *)self backingOccurrence];
  id v6 = (id)[v5 mutableCopy];

  [v6 setBedtimeComponents:v4];
  [(HKSPMutableSleepScheduleOccurrence *)self setBackingOccurrence:v6];
}

- (HKSPAlarmConfiguration)alarmConfiguration
{
  v2 = [(HKSPMutableSleepScheduleOccurrence *)self backingOccurrence];
  v3 = [v2 alarmConfiguration];
  id v4 = (void *)[v3 mutableCopy];

  return (HKSPAlarmConfiguration *)v4;
}

- (void)setAlarmConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPMutableSleepScheduleOccurrence *)self backingOccurrence];
  id v6 = (id)[v5 mutableCopy];

  [v6 setAlarmConfiguration:v4];
  [(HKSPMutableSleepScheduleOccurrence *)self setBackingOccurrence:v6];
}

- (void)applyHourAndMinuteFromBedtimeComponents:(id)a3 wakeUpComponents:(id)a4 gregorianCalendar:(id)a5
{
  id v23 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v23)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HKSPSleepScheduleOccurrence.m", 506, @"Invalid parameter not satisfying: %@", @"bedtimeComponents != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_14:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKSPSleepScheduleOccurrence.m", 507, @"Invalid parameter not satisfying: %@", @"wakeUpComponents != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_14;
  }
LABEL_3:
  if ([(HKSPSleepScheduleOccurrence *)self isSingleDayOverride]
    && ([(HKSPSleepScheduleOccurrence *)self wakeUpComponents],
        (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && (objc_super v12 = (void *)v11,
        [(HKSPSleepScheduleOccurrence *)self bedtimeComponents],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    objc_super v14 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
    v15 = (void *)[v14 copy];

    objc_msgSend(v15, "setHour:", objc_msgSend(v9, "hour"));
    objc_msgSend(v15, "setMinute:", objc_msgSend(v9, "minute"));
    v16 = [v10 dateFromComponents:v15];
    if (v16)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      objc_msgSend(v17, "setHour:", objc_msgSend(v23, "hour"));
      objc_msgSend(v17, "setMinute:", objc_msgSend(v23, "minute"));
      v18 = objc_msgSend(v10, "hksp_previousDateBeforeDate:matchingComponents:", v16, v17);
      v19 = [v10 components:124 fromDate:v16];
      [(HKSPMutableSleepScheduleOccurrence *)self setWakeUpComponents:v19];

      v20 = [v10 components:124 fromDate:v18];
      [(HKSPMutableSleepScheduleOccurrence *)self setBedtimeComponents:v20];
    }
  }
  else
  {
    [(HKSPMutableSleepScheduleOccurrence *)self setBedtimeComponents:v23];
    [(HKSPMutableSleepScheduleOccurrence *)self setWakeUpComponents:v9];
  }
}

- (HKSPObject)originalObject
{
  return self->_originalObject;
}

- (HKSPChangeSet)changeSet
{
  return self->_changeSet;
}

@end