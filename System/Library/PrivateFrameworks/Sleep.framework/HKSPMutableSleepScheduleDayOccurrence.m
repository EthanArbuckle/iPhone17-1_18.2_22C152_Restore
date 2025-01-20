@interface HKSPMutableSleepScheduleDayOccurrence
+ (BOOL)supportsSecureCoding;
- (BOOL)hasChangeAffectingScheduling;
- (HKSPAlarmConfiguration)alarmConfiguration;
- (HKSPChangeSet)changeSet;
- (HKSPMutableSleepScheduleDayOccurrence)init;
- (HKSPMutableSleepScheduleDayOccurrence)initWithCoder:(id)a3;
- (HKSPObject)originalObject;
- (NSDateComponents)bedtimeComponents;
- (NSDateComponents)wakeUpComponents;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generateSleepScheduleOccurrenceWithWeekdays:(unint64_t)a3;
- (id)initFromObject:(id)a3;
- (id)mutableCopy;
- (void)encodeWithCoder:(id)a3;
- (void)freeze;
- (void)revert;
- (void)setAlarmConfiguration:(id)a3;
- (void)setBedtimeComponents:(id)a3;
- (void)setWakeUpComponents:(id)a3;
@end

@implementation HKSPMutableSleepScheduleDayOccurrence

- (void)setBedtimeComponents:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  v7 = [v6 objectForKeyedSubscript:@"HKSPDayOccurrenceBedtimeComponents"];

  v8 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v7];
  uint64_t v9 = [v4 copy];
  v10 = (void *)v9;
  if (v9) {
    v11 = (void *)v9;
  }
  else {
    v11 = v4;
  }
  id v15 = v11;

  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPDayOccurrenceBedtimeComponents"])
  {
    [v7 isRelationshipProperty];
    v12 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v14 = (void *)[[v12 alloc] initWithProperty:v7 changedValue:v15 originalValue:v8];
    [(HKSPChangeSet *)changeSet addChange:v14];
  }
}

- (NSDateComponents)bedtimeComponents
{
  v3 = [(id)objc_opt_class() allProperties];
  id v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPDayOccurrenceBedtimeComponents"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPDayOccurrenceBedtimeComponents"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPDayOccurrenceBedtimeComponents"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDateComponents *)v6;
}

- (void)setWakeUpComponents:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  v7 = [v6 objectForKeyedSubscript:@"HKSPDayOccurrenceWakeUpComponents"];

  v8 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v7];
  uint64_t v9 = [v4 copy];
  v10 = (void *)v9;
  if (v9) {
    v11 = (void *)v9;
  }
  else {
    v11 = v4;
  }
  id v15 = v11;

  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPDayOccurrenceWakeUpComponents"])
  {
    [v7 isRelationshipProperty];
    v12 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v14 = (void *)[[v12 alloc] initWithProperty:v7 changedValue:v15 originalValue:v8];
    [(HKSPChangeSet *)changeSet addChange:v14];
  }
}

- (NSDateComponents)wakeUpComponents
{
  v3 = [(id)objc_opt_class() allProperties];
  id v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPDayOccurrenceWakeUpComponents"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPDayOccurrenceWakeUpComponents"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPDayOccurrenceWakeUpComponents"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDateComponents *)v6;
}

- (void)setAlarmConfiguration:(id)a3
{
  id v11 = a3;
  id v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPDayOccurrenceAlarm"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPDayOccurrenceAlarm"])
  {
    [v6 isRelationshipProperty];
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (HKSPAlarmConfiguration)alarmConfiguration
{
  v3 = [(id)objc_opt_class() allProperties];
  id v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPDayOccurrenceAlarm"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPDayOccurrenceAlarm"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPDayOccurrenceAlarm"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (HKSPAlarmConfiguration *)v6;
}

- (HKSPMutableSleepScheduleDayOccurrence)init
{
  v9.receiver = self;
  v9.super_class = (Class)HKSPMutableSleepScheduleDayOccurrence;
  v2 = [(HKSPSleepScheduleDayOccurrence *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(HKSPSleepScheduleDayOccurrence);
    originalObject = v2->_originalObject;
    v2->_originalObject = (HKSPObject *)v3;

    v5 = objc_alloc_init(HKSPChangeSet);
    changeSet = v2->_changeSet;
    v2->_changeSet = v5;

    v7 = v2;
  }

  return v2;
}

- (id)initFromObject:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"HKSPSleepScheduleDayOccurrence.m" lineNumber:251 description:@"object must be a subclass"];
  }
  v14.receiver = self;
  v14.super_class = (Class)HKSPMutableSleepScheduleDayOccurrence;
  v6 = [(HKSPSleepScheduleDayOccurrence *)&v14 init];
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

- (HKSPMutableSleepScheduleDayOccurrence)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPMutableSleepScheduleDayOccurrence;
  id v5 = [(HKSPSleepScheduleDayOccurrence *)&v12 init];
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

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HKSPSleepScheduleDayOccurrence alloc];
  return [(HKSPSleepScheduleDayOccurrence *)v4 initFromObject:self];
}

- (id)mutableCopy
{
  v3 = objc_alloc_init((Class)objc_opt_class());
  id v4 = [(HKSPMutableSleepScheduleDayOccurrence *)self originalObject];
  uint64_t v5 = [v4 copyWithZone:0];
  uint64_t v6 = (void *)v3[5];
  v3[5] = v5;

  uint64_t v7 = [(HKSPMutableSleepScheduleDayOccurrence *)self changeSet];
  uint64_t v8 = [v7 deepCopy];
  objc_super v9 = (void *)v3[6];
  v3[6] = v8;

  return v3;
}

- (void)freeze
{
  v3 = [[HKSPSleepScheduleDayOccurrence alloc] initFromObject:self];
  originalObject = self->_originalObject;
  self->_originalObject = v3;

  [(HKSPMutableSleepScheduleDayOccurrence *)self revert];
}

- (void)revert
{
}

- (id)generateSleepScheduleOccurrenceWithWeekdays:(unint64_t)a3
{
  uint64_t v5 = objc_alloc_init(HKSPMutableSleepScheduleOccurrence);
  [(HKSPMutableSleepScheduleOccurrence *)v5 setWeekdays:a3];
  uint64_t v6 = [(HKSPMutableSleepScheduleDayOccurrence *)self originalObject];
  [(HKSPMutableSleepScheduleOccurrence *)v5 setBackingOccurrence:v6];

  [(HKSPMutableSleepScheduleOccurrence *)v5 freeze];
  id v7 = [(HKSPMutableSleepScheduleDayOccurrence *)self mutableCopy];
  [(HKSPMutableSleepScheduleOccurrence *)v5 setBackingOccurrence:v7];

  return v5;
}

- (BOOL)hasChangeAffectingScheduling
{
  v3 = [(HKSPMutableSleepScheduleDayOccurrence *)self changeSet];
  if ([v3 hasChangeForPropertyIdentifier:@"HKSPDayOccurrenceBedtimeComponents"])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(HKSPMutableSleepScheduleDayOccurrence *)self changeSet];
    char v4 = [v5 hasChangeForPropertyIdentifier:@"HKSPDayOccurrenceWakeUpComponents"];
  }
  return v4;
}

- (HKSPObject)originalObject
{
  return self->_originalObject;
}

- (HKSPChangeSet)changeSet
{
  return self->_changeSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_originalObject, 0);
}

@end