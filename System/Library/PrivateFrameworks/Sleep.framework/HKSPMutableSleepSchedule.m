@interface HKSPMutableSleepSchedule
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasChangeForDayOccurrenceKey:(id)a3 dayOccurrence:(id)a4;
- (BOOL)_hasChangeToScheduleEnabled;
- (BOOL)_shouldRemoveOverrideOccurrence:(id)a3;
- (BOOL)hasChangeAffectingScheduling;
- (BOOL)hasChangeToSleepDurationGoal;
- (BOOL)hasChangeToWindDownTime;
- (BOOL)hasOverrideOccurrenceRemoval;
- (BOOL)isEnabled;
- (HKSPChangeSet)changeSet;
- (HKSPMutableSleepSchedule)init;
- (HKSPMutableSleepSchedule)initWithCoder:(id)a3;
- (HKSPObject)originalObject;
- (HKSPSleepScheduleDayOccurrence)fridayOccurrence;
- (HKSPSleepScheduleDayOccurrence)mondayOccurrence;
- (HKSPSleepScheduleDayOccurrence)overrideDayOccurrence;
- (HKSPSleepScheduleDayOccurrence)saturdayOccurrence;
- (HKSPSleepScheduleDayOccurrence)sundayOccurrence;
- (HKSPSleepScheduleDayOccurrence)thursdayOccurrence;
- (HKSPSleepScheduleDayOccurrence)tuesdayOccurrence;
- (HKSPSleepScheduleDayOccurrence)wednesdayOccurrence;
- (NSDate)lastModifiedDate;
- (double)sleepDurationGoal;
- (double)windDownTime;
- (id)_updatedDayOccurrence:(id)a3 withDayOccurrence:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromObject:(id)a3;
- (id)lastOverrideOccurrenceWakeUpComponents;
- (id)mutableCopy;
- (void)_freezeSavedOccurrence:(id)a3;
- (void)_modifyDayOccurrencesForWeekdays:(unint64_t)a3 block:(id)a4;
- (void)_updateBackingOccurrencesForOccurrence:(id)a3;
- (void)_updateOverrideOccurrenceForOccurrence:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)freeze;
- (void)removeOccurrence:(id)a3;
- (void)revert;
- (void)saveOccurrence:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFridayOccurrence:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setMondayOccurrence:(id)a3;
- (void)setOverrideDayOccurrence:(id)a3;
- (void)setSaturdayOccurrence:(id)a3;
- (void)setSleepDurationGoal:(double)a3;
- (void)setSundayOccurrence:(id)a3;
- (void)setThursdayOccurrence:(id)a3;
- (void)setTuesdayOccurrence:(id)a3;
- (void)setWednesdayOccurrence:(id)a3;
- (void)setWindDownMinutes:(unint64_t)a3;
- (void)setWindDownTime:(double)a3;
@end

@implementation HKSPMutableSleepSchedule

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPScheduleEnabled"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPScheduleEnabled"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (BOOL)isEnabled
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPScheduleEnabled"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPScheduleEnabled"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPScheduleEnabled"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setWindDownTime:(double)a3
{
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v15 = [v6 objectForKeyedSubscript:@"HKSPWindDownTimeInterval"];

  char v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v15];
  [v7 doubleValue];
  double v9 = v8;

  if (v9 != a3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWindDownTimeInterval"])
  {
    changeSet = self->_changeSet;
    v11 = [HKSPChange alloc];
    v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
    id v14 = [(HKSPChange *)v11 initWithProperty:v15 changedValue:v12 originalValue:v13];
    [(HKSPChangeSet *)changeSet addChange:v14];
  }
}

- (double)windDownTime
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPWindDownTimeInterval"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWindDownTimeInterval"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPWindDownTimeInterval"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (void)setSleepDurationGoal:(double)a3
{
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v15 = [v6 objectForKeyedSubscript:@"HKSPSleepDurationGoal"];

  double v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v15];
  [v7 doubleValue];
  double v9 = v8;

  if (v9 != a3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepDurationGoal"])
  {
    changeSet = self->_changeSet;
    v11 = [HKSPChange alloc];
    v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
    id v14 = [(HKSPChange *)v11 initWithProperty:v15 changedValue:v12 originalValue:v13];
    [(HKSPChangeSet *)changeSet addChange:v14];
  }
}

- (double)sleepDurationGoal
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSleepDurationGoal"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepDurationGoal"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSleepDurationGoal"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (void)setLastModifiedDate:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPScheduleLastModifiedDate"];

  double v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPScheduleLastModifiedDate"])
  {
    [v6 isRelationshipProperty];
    double v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (NSDate)lastModifiedDate
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPScheduleLastModifiedDate"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPScheduleLastModifiedDate"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPScheduleLastModifiedDate"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDate *)v6;
}

- (void)setMondayOccurrence:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPMondayOccurrence"];

  double v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPMondayOccurrence"])
  {
    [v6 isRelationshipProperty];
    double v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (HKSPSleepScheduleDayOccurrence)mondayOccurrence
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPMondayOccurrence"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPMondayOccurrence"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPMondayOccurrence"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setTuesdayOccurrence:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPTuesdayOccurrence"];

  double v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPTuesdayOccurrence"])
  {
    [v6 isRelationshipProperty];
    double v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (HKSPSleepScheduleDayOccurrence)tuesdayOccurrence
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPTuesdayOccurrence"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPTuesdayOccurrence"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPTuesdayOccurrence"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setWednesdayOccurrence:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPWednesdayOccurrence"];

  double v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWednesdayOccurrence"])
  {
    [v6 isRelationshipProperty];
    double v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (HKSPSleepScheduleDayOccurrence)wednesdayOccurrence
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPWednesdayOccurrence"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWednesdayOccurrence"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPWednesdayOccurrence"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setThursdayOccurrence:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPThursdayOccurrence"];

  double v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPThursdayOccurrence"])
  {
    [v6 isRelationshipProperty];
    double v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (HKSPSleepScheduleDayOccurrence)thursdayOccurrence
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPThursdayOccurrence"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPThursdayOccurrence"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPThursdayOccurrence"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setFridayOccurrence:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPFridayOccurrence"];

  double v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPFridayOccurrence"])
  {
    [v6 isRelationshipProperty];
    double v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (HKSPSleepScheduleDayOccurrence)fridayOccurrence
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPFridayOccurrence"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPFridayOccurrence"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPFridayOccurrence"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setSaturdayOccurrence:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPSaturdayOccurrence"];

  double v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSaturdayOccurrence"])
  {
    [v6 isRelationshipProperty];
    double v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (HKSPSleepScheduleDayOccurrence)saturdayOccurrence
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSaturdayOccurrence"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSaturdayOccurrence"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSaturdayOccurrence"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setSundayOccurrence:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPSundayOccurrence"];

  double v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSundayOccurrence"])
  {
    [v6 isRelationshipProperty];
    double v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (HKSPSleepScheduleDayOccurrence)sundayOccurrence
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSundayOccurrence"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSundayOccurrence"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSundayOccurrence"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setOverrideDayOccurrence:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPOverrideOccurrence"];

  double v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPOverrideOccurrence"])
  {
    [v6 isRelationshipProperty];
    double v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (HKSPSleepScheduleDayOccurrence)overrideDayOccurrence
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPOverrideOccurrence"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPOverrideOccurrence"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPOverrideOccurrence"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (HKSPMutableSleepSchedule)init
{
  v9.receiver = self;
  v9.super_class = (Class)HKSPMutableSleepSchedule;
  v2 = [(HKSPSleepSchedule *)&v9 init];
  if (v2)
  {
    BOOL v3 = objc_alloc_init(HKSPSleepSchedule);
    originalObject = v2->_originalObject;
    v2->_originalObject = (HKSPObject *)v3;

    v5 = objc_alloc_init(HKSPChangeSet);
    changeSet = v2->_changeSet;
    v2->_changeSet = v5;

    double v7 = v2;
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
    [v13 handleFailureInMethod:a2 object:self file:@"HKSPSleepSchedule.m" lineNumber:627 description:@"object must be a subclass"];
  }
  v14.receiver = self;
  v14.super_class = (Class)HKSPMutableSleepSchedule;
  v6 = [(HKSPSleepSchedule *)&v14 init];
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

- (HKSPMutableSleepSchedule)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPMutableSleepSchedule;
  id v5 = [(HKSPSleepSchedule *)&v12 init];
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
  id v4 = [HKSPSleepSchedule alloc];
  return [(HKSPSleepSchedule *)v4 initFromObject:self];
}

- (id)mutableCopy
{
  BOOL v3 = objc_alloc_init((Class)objc_opt_class());
  id v4 = [(HKSPMutableSleepSchedule *)self originalObject];
  uint64_t v5 = [v4 copyWithZone:0];
  uint64_t v6 = (void *)v3[15];
  v3[15] = v5;

  uint64_t v7 = [(HKSPMutableSleepSchedule *)self changeSet];
  uint64_t v8 = [v7 deepCopy];
  objc_super v9 = (void *)v3[16];
  v3[16] = v8;

  return v3;
}

- (void)freeze
{
  BOOL v3 = [[HKSPSleepSchedule alloc] initFromObject:self];
  originalObject = self->_originalObject;
  self->_originalObject = v3;

  [(HKSPMutableSleepSchedule *)self revert];
}

- (void)revert
{
}

- (void)saveOccurrence:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isSingleDayOverride])
  {
    [(HKSPMutableSleepSchedule *)self _updateOverrideOccurrenceForOccurrence:v4];
  }
  else
  {
    [(HKSPMutableSleepSchedule *)self _updateBackingOccurrencesForOccurrence:v4];
    uint64_t v5 = [(HKSPSleepSchedule *)self overrideOccurrence];
    if (v5
      && [(HKSPMutableSleepSchedule *)self _shouldRemoveOverrideOccurrence:v5])
    {
      uint64_t v6 = HKSPLogForCategory(5uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v8 = 138543618;
        *(void *)&v8[4] = objc_opt_class();
        *(_WORD *)&v8[12] = 2114;
        *(void *)&v8[14] = v5;
        id v7 = *(id *)&v8[4];
        _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing override occurrence %{public}@", v8, 0x16u);
      }
      [(HKSPMutableSleepSchedule *)self removeOccurrence:v5];
    }
  }
  -[HKSPMutableSleepSchedule _freezeSavedOccurrence:](self, "_freezeSavedOccurrence:", v4, *(_OWORD *)v8, *(void *)&v8[16], v9);
}

- (void)_updateOverrideOccurrenceForOccurrence:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HKSPMutableSleepSchedule *)self _shouldRemoveOverrideOccurrence:v4])
  {
    uint64_t v5 = HKSPLogForCategory(5uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543618;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      id v21 = v4;
      id v6 = v19;
      _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing override occurrence %{public}@", (uint8_t *)&v18, 0x16u);
    }
    [(HKSPMutableSleepSchedule *)self removeOccurrence:v4];
  }
  else
  {
    id v7 = [v4 backingOccurrence];
    uint64_t v8 = (void *)[v7 mutableCopy];

    uint64_t v9 = [(HKSPMutableSleepSchedule *)self overrideDayOccurrence];

    if (v9)
    {
      v10 = [(HKSPMutableSleepSchedule *)self overrideDayOccurrence];
      id v11 = (void *)[v10 mutableCopy];

      objc_super v12 = [(HKSPMutableSleepSchedule *)self overrideDayOccurrence];
      v13 = HKSPGenerateChangeSetBetweenObjects(v12, v8);

      HKSPApplyChangesToObject(v11, v13);
      uint64_t v8 = v11;
    }
    objc_super v14 = HKSPLogForCategory(5uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_opt_class();
      id v16 = v15;
      v17 = [v8 changeSet];
      int v18 = 138543618;
      id v19 = v15;
      __int16 v20 = 2114;
      id v21 = v17;
      _os_log_impl(&dword_1A7E74000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] saved override occurrence changes %{public}@", (uint8_t *)&v18, 0x16u);
    }
    [(HKSPMutableSleepSchedule *)self setOverrideDayOccurrence:v8];
  }
}

- (void)_freezeSavedOccurrence:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 freeze];
  }
}

- (BOOL)_shouldRemoveOverrideOccurrence:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepSchedule *)self overridenOccurrenceForOverrideOccurrence:v4];
  char v6 = [v5 isEquivalentToOverrideOccurrence:v4];

  return v6;
}

- (void)_updateBackingOccurrencesForOccurrence:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 backingOccurrence];
  char v6 = [v4 changeSet];
  if (([v6 hasChangeForPropertyIdentifier:@"HKSPOccurrenceWeekdays"] & 1) == 0)
  {

LABEL_6:
    uint64_t v11 = -1;
    goto LABEL_7;
  }
  id v7 = [v4 changeSet];
  uint64_t v8 = [v7 originalValueForPropertyIdentifier:@"HKSPOccurrenceWeekdays"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (v9 == 0xFFFFFFFFLL || v9 == [v4 weekdays]) {
    goto LABEL_6;
  }
  -[HKSPMutableSleepSchedule _modifyDayOccurrencesForWeekdays:block:](self, "_modifyDayOccurrencesForWeekdays:block:", v9 & ~[v4 weekdays], &__block_literal_global_545);
  uint64_t v10 = [v4 weekdays] & ~v9;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__HKSPMutableSleepSchedule__updateBackingOccurrencesForOccurrence___block_invoke_2;
  v16[3] = &unk_1E5D32C28;
  v16[4] = self;
  id v17 = v5;
  [(HKSPMutableSleepSchedule *)self _modifyDayOccurrencesForWeekdays:v10 block:v16];

  uint64_t v11 = ~v10;
LABEL_7:
  uint64_t v12 = [v4 weekdays] & v11;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__HKSPMutableSleepSchedule__updateBackingOccurrencesForOccurrence___block_invoke_3;
  v14[3] = &unk_1E5D32C28;
  v14[4] = self;
  id v15 = v5;
  id v13 = v5;
  [(HKSPMutableSleepSchedule *)self _modifyDayOccurrencesForWeekdays:v12 block:v14];
}

uint64_t __67__HKSPMutableSleepSchedule__updateBackingOccurrencesForOccurrence___block_invoke()
{
  return 0;
}

uint64_t __67__HKSPMutableSleepSchedule__updateBackingOccurrencesForOccurrence___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updatedDayOccurrence:a2 withDayOccurrence:*(void *)(a1 + 40)];
}

uint64_t __67__HKSPMutableSleepSchedule__updateBackingOccurrencesForOccurrence___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updatedDayOccurrence:a2 withDayOccurrence:*(void *)(a1 + 40)];
}

- (id)_updatedDayOccurrence:(id)a3 withDayOccurrence:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = (void *)[v5 mutableCopy];
    uint64_t v9 = HKSPGenerateChangeSetBetweenObjects(v5, v7);

    HKSPApplyChangesToObject(v8, v9);
    id v7 = v9;
  }
  else
  {
    uint64_t v8 = (void *)[v6 mutableCopy];
  }

  return v8;
}

- (void)removeOccurrence:(id)a3
{
  id v5 = a3;
  if ([v5 weekdays] != 0xFFFFFFFFLL)
  {
    id v4 = [v5 wakeUpComponents];

    if (v4)
    {
      if ([v5 isSingleDayOverride]) {
        [(HKSPMutableSleepSchedule *)self setOverrideDayOccurrence:0];
      }
      else {
        -[HKSPMutableSleepSchedule _modifyDayOccurrencesForWeekdays:block:](self, "_modifyDayOccurrencesForWeekdays:block:", [v5 weekdays], &__block_literal_global_547);
      }
    }
  }
}

uint64_t __45__HKSPMutableSleepSchedule_removeOccurrence___block_invoke()
{
  return 0;
}

- (void)_modifyDayOccurrencesForWeekdays:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 != 0xFFFFFFFF)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__HKSPMutableSleepSchedule__modifyDayOccurrencesForWeekdays_block___block_invoke;
    v8[3] = &unk_1E5D32C50;
    v8[4] = self;
    id v9 = v6;
    HKSPWeekdaysEnumerateDays(a3, v8, 0);
  }
}

void __67__HKSPMutableSleepSchedule__modifyDayOccurrencesForWeekdays_block___block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 1:
      uint64_t v4 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) sundayOccurrence];
      id v5 = (*(void (**)(uint64_t))(v4 + 16))(v4);
      [*(id *)(a1 + 32) setSundayOccurrence:v5];
      goto LABEL_9;
    case 2:
      uint64_t v6 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) mondayOccurrence];
      id v5 = (*(void (**)(uint64_t))(v6 + 16))(v6);
      [*(id *)(a1 + 32) setMondayOccurrence:v5];
      goto LABEL_9;
    case 3:
      uint64_t v7 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) tuesdayOccurrence];
      id v5 = (*(void (**)(uint64_t))(v7 + 16))(v7);
      [*(id *)(a1 + 32) setTuesdayOccurrence:v5];
      goto LABEL_9;
    case 4:
      uint64_t v8 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) wednesdayOccurrence];
      id v5 = (*(void (**)(uint64_t))(v8 + 16))(v8);
      [*(id *)(a1 + 32) setWednesdayOccurrence:v5];
      goto LABEL_9;
    case 5:
      uint64_t v9 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) thursdayOccurrence];
      id v5 = (*(void (**)(uint64_t))(v9 + 16))(v9);
      [*(id *)(a1 + 32) setThursdayOccurrence:v5];
      goto LABEL_9;
    case 6:
      uint64_t v10 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) fridayOccurrence];
      id v5 = (*(void (**)(uint64_t))(v10 + 16))(v10);
      [*(id *)(a1 + 32) setFridayOccurrence:v5];
      goto LABEL_9;
    case 7:
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [*(id *)(a1 + 32) saturdayOccurrence];
      id v5 = (*(void (**)(uint64_t))(v11 + 16))(v11);
      [*(id *)(a1 + 32) setSaturdayOccurrence:v5];
LABEL_9:

      break;
    default:
      return;
  }
}

- (void)setWindDownMinutes:(unint64_t)a3
{
}

- (BOOL)hasChangeToSleepDurationGoal
{
  uint64_t v2 = [(HKSPMutableSleepSchedule *)self changeSet];
  char v3 = [v2 hasChangeForPropertyIdentifier:@"HKSPSleepDurationGoal"];

  return v3;
}

- (BOOL)hasChangeToWindDownTime
{
  uint64_t v2 = [(HKSPMutableSleepSchedule *)self changeSet];
  char v3 = [v2 hasChangeForPropertyIdentifier:@"HKSPWindDownTimeInterval"];

  return v3;
}

- (BOOL)_hasChangeToScheduleEnabled
{
  uint64_t v2 = [(HKSPMutableSleepSchedule *)self changeSet];
  char v3 = [v2 hasChangeForPropertyIdentifier:@"HKSPScheduleEnabled"];

  return v3;
}

- (BOOL)hasChangeAffectingScheduling
{
  if ([(HKSPMutableSleepSchedule *)self hasChangeToWindDownTime]
    || [(HKSPMutableSleepSchedule *)self _hasChangeToScheduleEnabled])
  {
    return 1;
  }
  uint64_t v4 = [(HKSPMutableSleepSchedule *)self mondayOccurrence];
  if ([(HKSPMutableSleepSchedule *)self _hasChangeForDayOccurrenceKey:@"HKSPMondayOccurrence" dayOccurrence:v4])
  {
    BOOL v3 = 1;
  }
  else
  {
    id v5 = [(HKSPMutableSleepSchedule *)self tuesdayOccurrence];
    if ([(HKSPMutableSleepSchedule *)self _hasChangeForDayOccurrenceKey:@"HKSPTuesdayOccurrence" dayOccurrence:v5])
    {
      BOOL v3 = 1;
    }
    else
    {
      uint64_t v6 = [(HKSPMutableSleepSchedule *)self wednesdayOccurrence];
      if ([(HKSPMutableSleepSchedule *)self _hasChangeForDayOccurrenceKey:@"HKSPWednesdayOccurrence" dayOccurrence:v6])
      {
        BOOL v3 = 1;
      }
      else
      {
        uint64_t v7 = [(HKSPMutableSleepSchedule *)self thursdayOccurrence];
        if ([(HKSPMutableSleepSchedule *)self _hasChangeForDayOccurrenceKey:@"HKSPThursdayOccurrence" dayOccurrence:v7])
        {
          BOOL v3 = 1;
        }
        else
        {
          uint64_t v8 = [(HKSPMutableSleepSchedule *)self fridayOccurrence];
          if ([(HKSPMutableSleepSchedule *)self _hasChangeForDayOccurrenceKey:@"HKSPFridayOccurrence" dayOccurrence:v8])
          {
            BOOL v3 = 1;
          }
          else
          {
            uint64_t v9 = [(HKSPMutableSleepSchedule *)self saturdayOccurrence];
            if ([(HKSPMutableSleepSchedule *)self _hasChangeForDayOccurrenceKey:@"HKSPSaturdayOccurrence" dayOccurrence:v9])
            {
              BOOL v3 = 1;
            }
            else
            {
              uint64_t v10 = [(HKSPMutableSleepSchedule *)self sundayOccurrence];
              if ([(HKSPMutableSleepSchedule *)self _hasChangeForDayOccurrenceKey:@"HKSPSundayOccurrence" dayOccurrence:v10])
              {
                BOOL v3 = 1;
              }
              else
              {
                uint64_t v11 = [(HKSPMutableSleepSchedule *)self overrideDayOccurrence];
                BOOL v3 = [(HKSPMutableSleepSchedule *)self _hasChangeForDayOccurrenceKey:@"HKSPOverrideOccurrence" dayOccurrence:v11];
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)_hasChangeForDayOccurrenceKey:(id)a3 dayOccurrence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HKSPMutableSleepSchedule *)self changeSet];
  int v9 = [v8 hasChangeForPropertyIdentifier:v6];

  if (v9)
  {
    if (v7
      && ([(HKSPMutableSleepSchedule *)self changeSet],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          [v10 originalValueForPropertyIdentifier:v6],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      char v12 = [v7 hasChangeAffectingScheduling];
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)hasOverrideOccurrenceRemoval
{
  BOOL v3 = [(HKSPMutableSleepSchedule *)self overrideDayOccurrence];
  if (v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(HKSPMutableSleepSchedule *)self _hasChangeForDayOccurrenceKey:@"HKSPOverrideOccurrence" dayOccurrence:0];
  }

  return v4;
}

- (id)lastOverrideOccurrenceWakeUpComponents
{
  if ([(HKSPMutableSleepSchedule *)self hasOverrideOccurrenceRemoval])
  {
    BOOL v3 = [(HKSPMutableSleepSchedule *)self changeSet];
    BOOL v4 = [v3 originalValueForPropertyIdentifier:@"HKSPOverrideOccurrence"];
  }
  else
  {
    BOOL v4 = [(HKSPSleepSchedule *)self overrideOccurrence];
  }
  id v5 = [v4 wakeUpComponents];

  return v5;
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