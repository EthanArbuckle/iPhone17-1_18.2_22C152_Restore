@interface HKSPMutableSleepEventRecord
+ (BOOL)supportsSecureCoding;
- (HKSPChangeSet)changeSet;
- (HKSPMutableSleepEventRecord)init;
- (HKSPMutableSleepEventRecord)initWithCoder:(id)a3;
- (HKSPObject)originalObject;
- (NSDate)goodMorningDismissedDate;
- (NSDate)lastModifiedDate;
- (NSDate)sleepCoachingOnboardingFirstCompletedDate;
- (NSDate)sleepTrackingOnboardingFirstCompletedDate;
- (NSDate)sleepWindDownShortcutsOnboardingFirstCompletedDate;
- (NSDate)wakeUpAlarmDismissedDate;
- (NSDate)wakeUpAlarmSnoozedUntilDate;
- (NSDate)wakeUpConfirmedUntilDate;
- (NSDate)wakeUpEarlyNotificationConfirmedDate;
- (NSDate)wakeUpOverriddenDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromObject:(id)a3;
- (id)mutableCopy;
- (int64_t)sleepCoachingOnboardingCompletedVersion;
- (int64_t)sleepTrackingOnboardingCompletedVersion;
- (int64_t)sleepWindDownShortcutsOnboardingCompletedVersion;
- (void)encodeWithCoder:(id)a3;
- (void)freeze;
- (void)revert;
- (void)setGoodMorningDismissedDate:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setSleepCoachingOnboardingCompletedVersion:(int64_t)a3;
- (void)setSleepCoachingOnboardingFirstCompletedDate:(id)a3;
- (void)setSleepTrackingOnboardingCompletedVersion:(int64_t)a3;
- (void)setSleepTrackingOnboardingFirstCompletedDate:(id)a3;
- (void)setSleepWindDownShortcutsOnboardingCompletedVersion:(int64_t)a3;
- (void)setSleepWindDownShortcutsOnboardingFirstCompletedDate:(id)a3;
- (void)setWakeUpAlarmDismissedDate:(id)a3;
- (void)setWakeUpAlarmSnoozedUntilDate:(id)a3;
- (void)setWakeUpConfirmedUntilDate:(id)a3;
- (void)setWakeUpEarlyNotificationConfirmedDate:(id)a3;
- (void)setWakeUpOverriddenDate:(id)a3;
- (void)updateSleepCoachingOnboardingCompletedVersion:(int64_t)a3 completedDate:(id)a4;
- (void)updateSleepTrackingOnboardingCompletedVersion:(int64_t)a3 completedDate:(id)a4;
- (void)updateSleepWindDownShortcutsOnboardingCompletedVersion:(int64_t)a3 completedDate:(id)a4;
@end

@implementation HKSPMutableSleepEventRecord

- (void)setLastModifiedDate:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPEventRecordLastModifiedDate"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPEventRecordLastModifiedDate"])
  {
    [v6 isRelationshipProperty];
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (NSDate)lastModifiedDate
{
  v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPEventRecordLastModifiedDate"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPEventRecordLastModifiedDate"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPEventRecordLastModifiedDate"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDate *)v6;
}

- (void)setWakeUpEarlyNotificationConfirmedDate:(id)a3
{
  id v12 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPWakeUpEarlyNotificationConfirmedDate"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  uint64_t v8 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v13 = (id)v8;
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWakeUpEarlyNotificationConfirmedDate"])
  {
    [v6 isRelationshipProperty];
    v9 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    id v11 = (void *)[[v9 alloc] initWithProperty:v6 changedValue:v13 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v11];
  }
}

- (NSDate)wakeUpEarlyNotificationConfirmedDate
{
  v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPWakeUpEarlyNotificationConfirmedDate"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWakeUpEarlyNotificationConfirmedDate"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPWakeUpEarlyNotificationConfirmedDate"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDate *)v6;
}

- (void)setWakeUpConfirmedUntilDate:(id)a3
{
  id v12 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPWakeUpConfirmedUntilDate"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  uint64_t v8 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v13 = (id)v8;
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWakeUpConfirmedUntilDate"])
  {
    [v6 isRelationshipProperty];
    v9 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    id v11 = (void *)[[v9 alloc] initWithProperty:v6 changedValue:v13 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v11];
  }
}

- (NSDate)wakeUpConfirmedUntilDate
{
  v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPWakeUpConfirmedUntilDate"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWakeUpConfirmedUntilDate"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPWakeUpConfirmedUntilDate"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDate *)v6;
}

- (void)setWakeUpAlarmDismissedDate:(id)a3
{
  id v12 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPWakeUpAlarmDismissedDate"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  uint64_t v8 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v13 = (id)v8;
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWakeUpAlarmDismissedDate"])
  {
    [v6 isRelationshipProperty];
    v9 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    id v11 = (void *)[[v9 alloc] initWithProperty:v6 changedValue:v13 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v11];
  }
}

- (NSDate)wakeUpAlarmDismissedDate
{
  v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPWakeUpAlarmDismissedDate"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWakeUpAlarmDismissedDate"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPWakeUpAlarmDismissedDate"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDate *)v6;
}

- (void)setWakeUpOverriddenDate:(id)a3
{
  id v12 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPWakeUpOverriddenDate"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  uint64_t v8 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v13 = (id)v8;
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWakeUpOverriddenDate"])
  {
    [v6 isRelationshipProperty];
    v9 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    id v11 = (void *)[[v9 alloc] initWithProperty:v6 changedValue:v13 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v11];
  }
}

- (NSDate)wakeUpOverriddenDate
{
  v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPWakeUpOverriddenDate"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWakeUpOverriddenDate"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPWakeUpOverriddenDate"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDate *)v6;
}

- (void)setWakeUpAlarmSnoozedUntilDate:(id)a3
{
  id v12 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPWakeUpAlarmSnoozedUntilDate"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  uint64_t v8 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v13 = (id)v8;
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWakeUpAlarmSnoozedUntilDate"])
  {
    [v6 isRelationshipProperty];
    v9 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    id v11 = (void *)[[v9 alloc] initWithProperty:v6 changedValue:v13 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v11];
  }
}

- (NSDate)wakeUpAlarmSnoozedUntilDate
{
  v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPWakeUpAlarmSnoozedUntilDate"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWakeUpAlarmSnoozedUntilDate"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPWakeUpAlarmSnoozedUntilDate"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDate *)v6;
}

- (void)setGoodMorningDismissedDate:(id)a3
{
  id v12 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPGoodMorningDismissedDate"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  uint64_t v8 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v13 = (id)v8;
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPGoodMorningDismissedDate"])
  {
    [v6 isRelationshipProperty];
    v9 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    id v11 = (void *)[[v9 alloc] initWithProperty:v6 changedValue:v13 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v11];
  }
}

- (NSDate)goodMorningDismissedDate
{
  v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPGoodMorningDismissedDate"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPGoodMorningDismissedDate"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPGoodMorningDismissedDate"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDate *)v6;
}

- (void)setSleepCoachingOnboardingCompletedVersion:(int64_t)a3
{
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPSleepCoachingOnboardingCompletedVersion"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 integerValue];

  if (v8 != a3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepCoachingOnboardingCompletedVersion"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    id v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
    id v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (int64_t)sleepCoachingOnboardingCompletedVersion
{
  v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSleepCoachingOnboardingCompletedVersion"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepCoachingOnboardingCompletedVersion"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSleepCoachingOnboardingCompletedVersion"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (void)setSleepCoachingOnboardingFirstCompletedDate:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  int64_t v7 = [v6 objectForKeyedSubscript:@"HKSPSleepCoachingOnboardingFirstCompletedDate"];

  uint64_t v8 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v7];
  uint64_t v9 = [v4 copy];
  v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = v4;
  }
  id v15 = v11;

  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepCoachingOnboardingFirstCompletedDate"])
  {
    [v7 isRelationshipProperty];
    id v12 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    id v14 = (void *)[[v12 alloc] initWithProperty:v7 changedValue:v15 originalValue:v8];
    [(HKSPChangeSet *)changeSet addChange:v14];
  }
}

- (NSDate)sleepCoachingOnboardingFirstCompletedDate
{
  v3 = [(id)objc_opt_class() allProperties];
  id v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSleepCoachingOnboardingFirstCompletedDate"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepCoachingOnboardingFirstCompletedDate"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSleepCoachingOnboardingFirstCompletedDate"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDate *)v6;
}

- (void)setSleepTrackingOnboardingCompletedVersion:(int64_t)a3
{
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPSleepTrackingOnboardingCompletedVersion"];

  int64_t v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 integerValue];

  if (v8 != a3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepTrackingOnboardingCompletedVersion"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    id v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
    id v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (int64_t)sleepTrackingOnboardingCompletedVersion
{
  v3 = [(id)objc_opt_class() allProperties];
  id v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSleepTrackingOnboardingCompletedVersion"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepTrackingOnboardingCompletedVersion"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSleepTrackingOnboardingCompletedVersion"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (void)setSleepTrackingOnboardingFirstCompletedDate:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  int64_t v7 = [v6 objectForKeyedSubscript:@"HKSPSleepTrackingOnboardingFirstCompletedDate"];

  uint64_t v8 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v7];
  uint64_t v9 = [v4 copy];
  v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = v4;
  }
  id v15 = v11;

  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepTrackingOnboardingFirstCompletedDate"])
  {
    [v7 isRelationshipProperty];
    id v12 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    id v14 = (void *)[[v12 alloc] initWithProperty:v7 changedValue:v15 originalValue:v8];
    [(HKSPChangeSet *)changeSet addChange:v14];
  }
}

- (NSDate)sleepTrackingOnboardingFirstCompletedDate
{
  v3 = [(id)objc_opt_class() allProperties];
  id v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSleepTrackingOnboardingFirstCompletedDate"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepTrackingOnboardingFirstCompletedDate"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSleepTrackingOnboardingFirstCompletedDate"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDate *)v6;
}

- (void)setSleepWindDownShortcutsOnboardingCompletedVersion:(int64_t)a3
{
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPSleepWindDownShortcutsOnboardingCompletedVersion"];

  int64_t v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 integerValue];

  if (v8 != a3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepWindDownShortcutsOnboardingCompletedVersion"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    id v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
    id v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (int64_t)sleepWindDownShortcutsOnboardingCompletedVersion
{
  v3 = [(id)objc_opt_class() allProperties];
  id v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSleepWindDownShortcutsOnboardingCompletedVersion"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepWindDownShortcutsOnboardingCompletedVersion"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSleepWindDownShortcutsOnboardingCompletedVersion"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (void)setSleepWindDownShortcutsOnboardingFirstCompletedDate:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  int64_t v7 = [v6 objectForKeyedSubscript:@"HKSPSleepWindDownShortcutsOnboardingFirstCompletedDate"];

  uint64_t v8 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v7];
  uint64_t v9 = [v4 copy];
  v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = v4;
  }
  id v15 = v11;

  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepWindDownShortcutsOnboardingFirstCompletedDate"])
  {
    [v7 isRelationshipProperty];
    id v12 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    id v14 = (void *)[[v12 alloc] initWithProperty:v7 changedValue:v15 originalValue:v8];
    [(HKSPChangeSet *)changeSet addChange:v14];
  }
}

- (NSDate)sleepWindDownShortcutsOnboardingFirstCompletedDate
{
  v3 = [(id)objc_opt_class() allProperties];
  id v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSleepWindDownShortcutsOnboardingFirstCompletedDate"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepWindDownShortcutsOnboardingFirstCompletedDate"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSleepWindDownShortcutsOnboardingFirstCompletedDate"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDate *)v6;
}

- (HKSPMutableSleepEventRecord)init
{
  v9.receiver = self;
  v9.super_class = (Class)HKSPMutableSleepEventRecord;
  v2 = [(HKSPSleepEventRecord *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(HKSPSleepEventRecord);
    originalObject = v2->_originalObject;
    v2->_originalObject = (HKSPObject *)v3;

    v5 = objc_alloc_init(HKSPChangeSet);
    changeSet = v2->_changeSet;
    v2->_changeSet = v5;

    int64_t v7 = v2;
  }

  return v2;
}

- (id)initFromObject:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"HKSPSleepEventRecord.m" lineNumber:264 description:@"object must be a subclass"];
  }
  v14.receiver = self;
  v14.super_class = (Class)HKSPMutableSleepEventRecord;
  v6 = [(HKSPSleepEventRecord *)&v14 init];
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

- (HKSPMutableSleepEventRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPMutableSleepEventRecord;
  id v5 = [(HKSPSleepEventRecord *)&v12 init];
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
  id v4 = [HKSPSleepEventRecord alloc];
  return [(HKSPSleepEventRecord *)v4 initFromObject:self];
}

- (id)mutableCopy
{
  v3 = objc_alloc_init((Class)objc_opt_class());
  id v4 = [(HKSPMutableSleepEventRecord *)self originalObject];
  uint64_t v5 = [v4 copyWithZone:0];
  uint64_t v6 = (void *)v3[16];
  v3[16] = v5;

  uint64_t v7 = [(HKSPMutableSleepEventRecord *)self changeSet];
  uint64_t v8 = [v7 deepCopy];
  objc_super v9 = (void *)v3[17];
  v3[17] = v8;

  return v3;
}

- (void)freeze
{
  v3 = [[HKSPSleepEventRecord alloc] initFromObject:self];
  originalObject = self->_originalObject;
  self->_originalObject = v3;

  [(HKSPMutableSleepEventRecord *)self revert];
}

- (void)revert
{
}

- (void)updateSleepCoachingOnboardingCompletedVersion:(int64_t)a3 completedDate:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    [(HKSPMutableSleepEventRecord *)self setSleepCoachingOnboardingCompletedVersion:0];
    [(HKSPMutableSleepEventRecord *)self setSleepCoachingOnboardingFirstCompletedDate:0];
    goto LABEL_10;
  }
  if ([(HKSPMutableSleepEventRecord *)self sleepCoachingOnboardingCompletedVersion])
  {
    uint64_t v6 = [(HKSPMutableSleepEventRecord *)self sleepCoachingOnboardingFirstCompletedDate];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
    [(HKSPMutableSleepEventRecord *)self setSleepCoachingOnboardingCompletedVersion:a3];
  }
  [(HKSPMutableSleepEventRecord *)self setSleepCoachingOnboardingFirstCompletedDate:v7];
LABEL_8:
  if ([(HKSPMutableSleepEventRecord *)self sleepCoachingOnboardingCompletedVersion] < a3)[(HKSPMutableSleepEventRecord *)self setSleepCoachingOnboardingCompletedVersion:a3]; {
LABEL_10:
  }
}

- (void)updateSleepTrackingOnboardingCompletedVersion:(int64_t)a3 completedDate:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    [(HKSPMutableSleepEventRecord *)self setSleepTrackingOnboardingCompletedVersion:0];
    [(HKSPMutableSleepEventRecord *)self setSleepTrackingOnboardingFirstCompletedDate:0];
    goto LABEL_10;
  }
  if ([(HKSPMutableSleepEventRecord *)self sleepTrackingOnboardingCompletedVersion])
  {
    uint64_t v6 = [(HKSPMutableSleepEventRecord *)self sleepTrackingOnboardingFirstCompletedDate];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
    [(HKSPMutableSleepEventRecord *)self setSleepTrackingOnboardingCompletedVersion:a3];
  }
  [(HKSPMutableSleepEventRecord *)self setSleepTrackingOnboardingFirstCompletedDate:v7];
LABEL_8:
  if ([(HKSPMutableSleepEventRecord *)self sleepTrackingOnboardingCompletedVersion] < a3)[(HKSPMutableSleepEventRecord *)self setSleepTrackingOnboardingCompletedVersion:a3]; {
LABEL_10:
  }
}

- (void)updateSleepWindDownShortcutsOnboardingCompletedVersion:(int64_t)a3 completedDate:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    [(HKSPMutableSleepEventRecord *)self setSleepWindDownShortcutsOnboardingCompletedVersion:0];
    [(HKSPMutableSleepEventRecord *)self setSleepWindDownShortcutsOnboardingFirstCompletedDate:0];
    goto LABEL_10;
  }
  if ([(HKSPMutableSleepEventRecord *)self sleepWindDownShortcutsOnboardingCompletedVersion])
  {
    uint64_t v6 = [(HKSPMutableSleepEventRecord *)self sleepWindDownShortcutsOnboardingFirstCompletedDate];

    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
    [(HKSPMutableSleepEventRecord *)self setSleepWindDownShortcutsOnboardingCompletedVersion:a3];
  }
  [(HKSPMutableSleepEventRecord *)self setSleepWindDownShortcutsOnboardingFirstCompletedDate:v7];
LABEL_8:
  if ([(HKSPMutableSleepEventRecord *)self sleepWindDownShortcutsOnboardingCompletedVersion] < a3)[(HKSPMutableSleepEventRecord *)self setSleepWindDownShortcutsOnboardingCompletedVersion:a3]; {
LABEL_10:
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_originalObject, 0);
}

@end