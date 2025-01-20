@interface HKSPSleepEventRecord
+ (BOOL)supportsSecureCoding;
+ (void)_appendDateDescriptionIfRelevant:(id)a3 withName:(id)a4 toBuilder:(id)a5;
- (BOOL)_needsMigrationForCoder:(id)a3;
- (BOOL)isAnySleepCoachingOnboardingCompleted;
- (BOOL)isAnySleepTrackingOnboardingCompleted;
- (BOOL)isAnySleepWindDownShortcutsOnboardingCompleted;
- (BOOL)isConsolidatedSleepCoachingOnboardingCompleted;
- (BOOL)isConsolidatedSleepTrackingOnboardingCompleted;
- (BOOL)isCurrentSleepCoachingOnboardingCompleted;
- (BOOL)isCurrentSleepTrackingOnboardingCompleted;
- (BOOL)isCurrentSleepWindDownShortcutsOnboardingCompleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOnboardingModel:(id)a3;
- (BOOL)isEquivalentTo:(id)a3;
- (HKSPSleepEventRecord)init;
- (HKSPSleepEventRecord)initWithCoder:(id)a3;
- (HKSPSyncAnchor)syncAnchor;
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
- (NSString)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initFromObject:(id)a3;
- (id)mutableCopy;
- (id)objectWithSyncAnchor:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)sleepCoachingOnboardingCompletedVersion;
- (int64_t)sleepTrackingOnboardingCompletedVersion;
- (int64_t)sleepWindDownShortcutsOnboardingCompletedVersion;
- (unint64_t)version;
- (void)_migrateForCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPSleepEventRecord

- (unint64_t)version
{
  return self->_version;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSString)description
{
  return (NSString *)[(HKSPSleepEventRecord *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HKSPSleepEventRecord *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (BOOL)isEqualToOnboardingModel:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(HKSPSleepEventRecord *)self sleepCoachingOnboardingCompletedVersion];
  if (v5 == [v4 sleepCoachingOnboardingCompletedVersion]
    && (int64_t v6 = -[HKSPSleepEventRecord sleepTrackingOnboardingCompletedVersion](self, "sleepTrackingOnboardingCompletedVersion"), v6 == [v4 sleepTrackingOnboardingCompletedVersion]))
  {
    int64_t v7 = [(HKSPSleepEventRecord *)self sleepWindDownShortcutsOnboardingCompletedVersion];
    BOOL v8 = v7 == [v4 sleepWindDownShortcutsOnboardingCompletedVersion];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = objc_opt_class();
  int64_t v5 = [(HKSPSleepEventRecord *)self wakeUpAlarmSnoozedUntilDate];
  [v4 _appendDateDescriptionIfRelevant:v5 withName:@"wakeUpAlarmSnoozedUntilDate" toBuilder:v3];

  int64_t v6 = objc_opt_class();
  int64_t v7 = [(HKSPSleepEventRecord *)self wakeUpAlarmDismissedDate];
  [v6 _appendDateDescriptionIfRelevant:v7 withName:@"wakeUpAlarmDismissedDate" toBuilder:v3];

  BOOL v8 = objc_opt_class();
  v9 = [(HKSPSleepEventRecord *)self wakeUpOverriddenDate];
  [v8 _appendDateDescriptionIfRelevant:v9 withName:@"wakeUpOverriddenDate" toBuilder:v3];

  v10 = objc_opt_class();
  v11 = [(HKSPSleepEventRecord *)self wakeUpEarlyNotificationConfirmedDate];
  [v10 _appendDateDescriptionIfRelevant:v11 withName:@"wakeUpEarlyNotificationConfirmedDate" toBuilder:v3];

  v12 = objc_opt_class();
  v13 = [(HKSPSleepEventRecord *)self wakeUpConfirmedUntilDate];
  [v12 _appendDateDescriptionIfRelevant:v13 withName:@"wakeUpConfirmedUntilDate" toBuilder:v3];

  v14 = objc_opt_class();
  v15 = [(HKSPSleepEventRecord *)self goodMorningDismissedDate];
  [v14 _appendDateDescriptionIfRelevant:v15 withName:@"goodMorningDismissedDate" toBuilder:v3];

  id v16 = (id)objc_msgSend(v3, "appendInteger:withName:", -[HKSPSleepEventRecord sleepCoachingOnboardingCompletedVersion](self, "sleepCoachingOnboardingCompletedVersion"), @"sleepCoachingOnboardingCompletedVersion");
  v17 = objc_opt_class();
  v18 = [(HKSPSleepEventRecord *)self sleepCoachingOnboardingFirstCompletedDate];
  [v17 _appendDateDescriptionIfRelevant:v18 withName:@"sleepCoachingOnboardingFirstCompletedDate" toBuilder:v3];

  id v19 = (id)objc_msgSend(v3, "appendInteger:withName:", -[HKSPSleepEventRecord sleepTrackingOnboardingCompletedVersion](self, "sleepTrackingOnboardingCompletedVersion"), @"sleepTrackingOnboardingCompletedVersion");
  v20 = objc_opt_class();
  v21 = [(HKSPSleepEventRecord *)self sleepTrackingOnboardingFirstCompletedDate];
  [v20 _appendDateDescriptionIfRelevant:v21 withName:@"sleepTrackingOnboardingFirstCompletedDate" toBuilder:v3];

  id v22 = (id)objc_msgSend(v3, "appendInteger:withName:", -[HKSPSleepEventRecord sleepWindDownShortcutsOnboardingCompletedVersion](self, "sleepWindDownShortcutsOnboardingCompletedVersion"), @"sleepWindDownShortcutsOnboardingCompletedVersion");
  v23 = objc_opt_class();
  v24 = [(HKSPSleepEventRecord *)self sleepWindDownShortcutsOnboardingFirstCompletedDate];
  [v23 _appendDateDescriptionIfRelevant:v24 withName:@"sleepWindDownShortcutsOnboardingFirstCompletedDate" toBuilder:v3];

  return v3;
}

+ (void)_appendDateDescriptionIfRelevant:(id)a3 withName:(id)a4 toBuilder:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v12)
  {
    v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    if (([v12 isEqualToDate:v9] & 1) == 0)
    {
      v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
      char v11 = [v12 isEqualToDate:v10];

      if (v11) {
        goto LABEL_6;
      }
      v9 = [v12 hkspDescription];
      [v8 appendString:v9 withName:v7];
    }
  }
LABEL_6:
}

- (int64_t)sleepCoachingOnboardingCompletedVersion
{
  return self->_sleepCoachingOnboardingCompletedVersion;
}

- (int64_t)sleepWindDownShortcutsOnboardingCompletedVersion
{
  return self->_sleepWindDownShortcutsOnboardingCompletedVersion;
}

- (NSDate)wakeUpOverriddenDate
{
  return self->_wakeUpOverriddenDate;
}

- (NSDate)wakeUpEarlyNotificationConfirmedDate
{
  return self->_wakeUpEarlyNotificationConfirmedDate;
}

- (NSDate)wakeUpConfirmedUntilDate
{
  return self->_wakeUpConfirmedUntilDate;
}

- (NSDate)wakeUpAlarmSnoozedUntilDate
{
  return self->_wakeUpAlarmSnoozedUntilDate;
}

- (NSDate)wakeUpAlarmDismissedDate
{
  return self->_wakeUpAlarmDismissedDate;
}

- (NSDate)sleepWindDownShortcutsOnboardingFirstCompletedDate
{
  return self->_sleepWindDownShortcutsOnboardingFirstCompletedDate;
}

- (NSDate)sleepCoachingOnboardingFirstCompletedDate
{
  return self->_sleepCoachingOnboardingFirstCompletedDate;
}

- (NSDate)goodMorningDismissedDate
{
  return self->_goodMorningDismissedDate;
}

- (BOOL)isCurrentSleepTrackingOnboardingCompleted
{
  BOOL v3 = [(HKSPSleepEventRecord *)self isAnySleepTrackingOnboardingCompleted];
  if (v3) {
    LOBYTE(v3) = [(HKSPSleepEventRecord *)self sleepTrackingOnboardingCompletedVersion] > 1;
  }
  return v3;
}

- (BOOL)isAnySleepTrackingOnboardingCompleted
{
  return [(HKSPSleepEventRecord *)self sleepTrackingOnboardingCompletedVersion] != 0;
}

- (int64_t)sleepTrackingOnboardingCompletedVersion
{
  return self->_sleepTrackingOnboardingCompletedVersion;
}

- (NSDate)sleepTrackingOnboardingFirstCompletedDate
{
  return self->_sleepTrackingOnboardingFirstCompletedDate;
}

- (BOOL)isCurrentSleepWindDownShortcutsOnboardingCompleted
{
  BOOL v3 = [(HKSPSleepEventRecord *)self isAnySleepWindDownShortcutsOnboardingCompleted];
  if (v3) {
    LOBYTE(v3) = [(HKSPSleepEventRecord *)self sleepWindDownShortcutsOnboardingCompletedVersion] > 1;
  }
  return v3;
}

- (BOOL)isAnySleepWindDownShortcutsOnboardingCompleted
{
  return [(HKSPSleepEventRecord *)self sleepWindDownShortcutsOnboardingCompletedVersion] != 0;
}

- (BOOL)isCurrentSleepCoachingOnboardingCompleted
{
  BOOL v3 = [(HKSPSleepEventRecord *)self isAnySleepCoachingOnboardingCompleted];
  if (v3) {
    LOBYTE(v3) = [(HKSPSleepEventRecord *)self sleepCoachingOnboardingCompletedVersion] > 1;
  }
  return v3;
}

- (BOOL)isAnySleepCoachingOnboardingCompleted
{
  return [(HKSPSleepEventRecord *)self sleepCoachingOnboardingCompletedVersion] != 0;
}

- (BOOL)isEqual:(id)a3
{
  return HKSPObjectsAreEqual(self, a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  HKSPEncodeObjectWithCoder(self, v4);
  if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) == 0) {
    [v4 encodeObject:self->_syncAnchor forKey:@"HKSPEventRecordSyncAnchor"];
  }
}

- (HKSPSleepEventRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSPSleepEventRecord;
  int64_t v5 = [(HKSPSleepEventRecord *)&v11 init];
  int64_t v6 = v5;
  if (v5)
  {
    HKSPDecodeObjectWithCoder(v5, v4);
    if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) == 0)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:HKSPSyncAnchorClass() forKey:@"HKSPEventRecordSyncAnchor"];
      syncAnchor = v6->_syncAnchor;
      v6->_syncAnchor = (HKSPSyncAnchor *)v7;
    }
    if ([(HKSPSleepEventRecord *)v6 _needsMigrationForCoder:v4]) {
      [(HKSPSleepEventRecord *)v6 _migrateForCoder:v4];
    }
    v9 = v6;
  }

  return v6;
}

- (BOOL)_needsMigrationForCoder:(id)a3
{
  id v3 = a3;
  BOOL v4 = (objc_msgSend(v3, "hksp_serializationOptions") & 1) != 0
    && [v3 decodeIntegerForKey:@"HKSPEventRecordVersion"] == 0;

  return v4;
}

- (HKSPSleepEventRecord)init
{
  v21.receiver = self;
  v21.super_class = (Class)HKSPSleepEventRecord;
  v2 = [(HKSPSleepEventRecord *)&v21 init];
  id v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    wakeUpEarlyNotificationConfirmedDate = v3->_wakeUpEarlyNotificationConfirmedDate;
    v3->_wakeUpEarlyNotificationConfirmedDate = (NSDate *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantPast];
    wakeUpConfirmedUntilDate = v3->_wakeUpConfirmedUntilDate;
    v3->_wakeUpConfirmedUntilDate = (NSDate *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    wakeUpAlarmDismissedDate = v3->_wakeUpAlarmDismissedDate;
    v3->_wakeUpAlarmDismissedDate = (NSDate *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    wakeUpOverriddenDate = v3->_wakeUpOverriddenDate;
    v3->_wakeUpOverriddenDate = (NSDate *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1C9C8] distantPast];
    wakeUpAlarmSnoozedUntilDate = v3->_wakeUpAlarmSnoozedUntilDate;
    v3->_wakeUpAlarmSnoozedUntilDate = (NSDate *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1C9C8] distantPast];
    goodMorningDismissedDate = v3->_goodMorningDismissedDate;
    v3->_goodMorningDismissedDate = (NSDate *)v14;

    sleepCoachingOnboardingFirstCompletedDate = v3->_sleepCoachingOnboardingFirstCompletedDate;
    v3->_sleepCoachingOnboardingCompletedVersion = 0;
    v3->_sleepCoachingOnboardingFirstCompletedDate = 0;

    sleepTrackingOnboardingFirstCompletedDate = v3->_sleepTrackingOnboardingFirstCompletedDate;
    v3->_sleepTrackingOnboardingCompletedVersion = 0;
    v3->_sleepTrackingOnboardingFirstCompletedDate = 0;

    sleepWindDownShortcutsOnboardingFirstCompletedDate = v3->_sleepWindDownShortcutsOnboardingFirstCompletedDate;
    v3->_sleepWindDownShortcutsOnboardingCompletedVersion = 0;
    v3->_sleepWindDownShortcutsOnboardingFirstCompletedDate = 0;

    id v19 = v3;
  }

  return v3;
}

- (id)initFromObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(HKSPSleepEventRecord *)self init];
    HKSPCopyFromObject(v5, v6);
    uint64_t v7 = [v5 syncAnchor];

    uint64_t v8 = [v7 copyWithZone:0];
    syncAnchor = v6->_syncAnchor;
    v6->_syncAnchor = (HKSPSyncAnchor *)v8;

    self = v6;
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)objectWithSyncAnchor:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initFromObject:self];
  uint64_t v6 = [v4 copyWithZone:0];

  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (void)_migrateForCoder:(id)a3
{
  self->_version = 1;
}

- (id)mutableCopy
{
  id v3 = [HKSPMutableSleepEventRecord alloc];
  return [(HKSPMutableSleepEventRecord *)v3 initFromObject:self];
}

- (BOOL)isEquivalentTo:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_381);
}

- (id)succinctDescription
{
  v2 = [(HKSPSleepEventRecord *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (BOOL)isConsolidatedSleepCoachingOnboardingCompleted
{
  BOOL v3 = [(HKSPSleepEventRecord *)self isAnySleepCoachingOnboardingCompleted];
  if (v3) {
    LOBYTE(v3) = [(HKSPSleepEventRecord *)self sleepCoachingOnboardingCompletedVersion] > 2;
  }
  return v3;
}

- (BOOL)isConsolidatedSleepTrackingOnboardingCompleted
{
  BOOL v3 = [(HKSPSleepEventRecord *)self isAnySleepTrackingOnboardingCompleted];
  if (v3) {
    LOBYTE(v3) = [(HKSPSleepEventRecord *)self sleepTrackingOnboardingCompletedVersion] > 2;
  }
  return v3;
}

- (HKSPSyncAnchor)syncAnchor
{
  return self->_syncAnchor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepWindDownShortcutsOnboardingFirstCompletedDate, 0);
  objc_storeStrong((id *)&self->_sleepTrackingOnboardingFirstCompletedDate, 0);
  objc_storeStrong((id *)&self->_sleepCoachingOnboardingFirstCompletedDate, 0);
  objc_storeStrong((id *)&self->_goodMorningDismissedDate, 0);
  objc_storeStrong((id *)&self->_wakeUpAlarmSnoozedUntilDate, 0);
  objc_storeStrong((id *)&self->_wakeUpConfirmedUntilDate, 0);
  objc_storeStrong((id *)&self->_wakeUpOverriddenDate, 0);
  objc_storeStrong((id *)&self->_wakeUpAlarmDismissedDate, 0);
  objc_storeStrong((id *)&self->_wakeUpEarlyNotificationConfirmedDate, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
}

@end