@interface HKSPSleepSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)_needsMigrationForCoder:(id)a3;
- (BOOL)bedtimeReminders;
- (BOOL)chargingReminders;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFeatureSettingsModel:(id)a3;
- (BOOL)isEquivalentTo:(id)a3;
- (BOOL)scheduledSleepMode;
- (BOOL)shareAcrossDevices;
- (BOOL)sleepTracking;
- (BOOL)sleepTrackingFeatureEnabled;
- (BOOL)springBoardGreetingDisabled;
- (BOOL)springBoardSuggestedPageCreated;
- (BOOL)timeInBedTracking;
- (BOOL)wakeUpResults;
- (BOOL)watchSleepFeaturesEnabled;
- (HKSPSleepSettings)init;
- (HKSPSleepSettings)initWithCoder:(id)a3;
- (HKSPSyncAnchor)syncAnchor;
- (NSDate)lastModifiedDate;
- (NSString)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initFromObject:(id)a3;
- (id)mutableCopy;
- (id)objectWithSyncAnchor:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)sleepModeOptions;
- (unint64_t)version;
- (void)_migrateForCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPSleepSettings

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HKSPSleepSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings watchSleepFeaturesEnabled](self, "watchSleepFeaturesEnabled"), @"watchSleepFeaturesEnabled");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings scheduledSleepMode](self, "scheduledSleepMode"), @"scheduledSleepMode");
  v6 = NSStringFromHKSPSleepModeOptions([(HKSPSleepSettings *)self sleepModeOptions]);
  id v7 = (id)[v3 appendObject:v6 withName:@"sleepModeOptions"];

  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings sleepTracking](self, "sleepTracking"), @"sleepTracking");
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings wakeUpResults](self, "wakeUpResults"), @"wakeUpResults");
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings timeInBedTracking](self, "timeInBedTracking"), @"timeInBedTracking");
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings bedtimeReminders](self, "bedtimeReminders"), @"bedtimeReminders");
  id v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings chargingReminders](self, "chargingReminders"), @"chargingReminders");
  id v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings shareAcrossDevices](self, "shareAcrossDevices"), @"shareAcrossDevices");
  return v3;
}

- (BOOL)watchSleepFeaturesEnabled
{
  return self->_watchSleepFeaturesEnabled;
}

- (BOOL)wakeUpResults
{
  return self->_wakeUpResults;
}

- (BOOL)timeInBedTracking
{
  return self->_timeInBedTracking;
}

- (unint64_t)sleepModeOptions
{
  return self->_sleepModeOptions;
}

- (BOOL)shareAcrossDevices
{
  return self->_shareAcrossDevices;
}

- (BOOL)scheduledSleepMode
{
  return self->_scheduledSleepMode;
}

- (BOOL)chargingReminders
{
  return self->_chargingReminders;
}

- (BOOL)bedtimeReminders
{
  return self->_bedtimeReminders;
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)springBoardSuggestedPageCreated
{
  return self->_springBoardSuggestedPageCreated;
}

- (BOOL)springBoardGreetingDisabled
{
  return self->_springBoardGreetingDisabled;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)sleepTrackingFeatureEnabled
{
  BOOL v3 = [(HKSPSleepSettings *)self sleepTracking];
  if (v3)
  {
    LOBYTE(v3) = [(HKSPSleepSettings *)self watchSleepFeaturesEnabled];
  }
  return v3;
}

- (BOOL)sleepTracking
{
  return self->_sleepTracking;
}

- (BOOL)isEqualToFeatureSettingsModel:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(HKSPSleepSettings *)self sleepTrackingFeatureEnabled];
  char v5 = [v4 sleepTrackingFeatureEnabled];

  return self ^ v5 ^ 1;
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
    [v4 encodeObject:self->_syncAnchor forKey:@"HKSPSettingsSyncAnchor"];
  }
}

- (HKSPSleepSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSPSleepSettings;
  char v5 = [(HKSPSleepSettings *)&v11 init];
  v6 = v5;
  if (v5)
  {
    HKSPDecodeObjectWithCoder(v5, v4);
    if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) == 0)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:HKSPSyncAnchorClass() forKey:@"HKSPSettingsSyncAnchor"];
      syncAnchor = v6->_syncAnchor;
      v6->_syncAnchor = (HKSPSyncAnchor *)v7;
    }
    if ([(HKSPSleepSettings *)v6 _needsMigrationForCoder:v4]) {
      [(HKSPSleepSettings *)v6 _migrateForCoder:v4];
    }
    id v9 = v6;
  }

  return v6;
}

- (BOOL)_needsMigrationForCoder:(id)a3
{
  id v3 = a3;
  BOOL v4 = (objc_msgSend(v3, "hksp_serializationOptions") & 1) != 0
    && (unint64_t)[v3 decodeIntegerForKey:@"HKSPSettingsVersion"] < 0xB;

  return v4;
}

- (NSString)description
{
  return (NSString *)[(HKSPSleepSettings *)self descriptionWithMultilinePrefix:0];
}

- (HKSPSleepSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKSPSleepSettings;
  v2 = [(HKSPSleepSettings *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_version = 11;
    v2->_watchSleepFeaturesEnabled = 1;
    v2->_sleepModeOptions = 1792;
    v2->_bedtimeReminders = 1;
    v2->_shareAcrossDevices = 1;
    BOOL v4 = v2;
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
    objc_super v6 = [(HKSPSleepSettings *)self init];
    HKSPCopyFromObject(v5, v6);
    uint64_t v7 = [v5 syncAnchor];

    uint64_t v8 = [v7 copyWithZone:0];
    syncAnchor = v6->_syncAnchor;
    v6->_syncAnchor = (HKSPSyncAnchor *)v8;

    self = v6;
    id v10 = self;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)objectWithSyncAnchor:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initFromObject:self];
  uint64_t v6 = [v4 copyWithZone:0];

  uint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  return v5;
}

- (void)_migrateForCoder:(id)a3
{
  id v4 = a3;
  unint64_t version = self->_version;
  if (version <= 1)
  {
    uint64_t v6 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "Migrating charging reminders", buf, 2u);
    }

    self->_chargingReminders = self->_sleepModeOptions & 1;
    unint64_t version = self->_version;
  }
  if (version <= 3)
  {
    uint64_t v7 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "Migrating bedtime reminders", v17, 2u);
    }

    self->_bedtimeReminders = 1;
    unint64_t version = self->_version;
  }
  if (version <= 4)
  {
    uint64_t v8 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "Migrating use watch for sleep", v16, 2u);
    }

    self->_watchSleepFeaturesEnabled = 1;
    unint64_t version = self->_version;
  }
  if (version <= 8)
  {
    id v9 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEFAULT, "Migrating Legacy Settings", v15, 2u);
    }

    self->_sleepModeOptions |= 0x700uLL;
    unint64_t version = self->_version;
  }
  if (version <= 9)
  {
    id v10 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "Migrating Sleep Lock Screen", v14, 2u);
    }

    unint64_t sleepModeOptions = self->_sleepModeOptions;
    if ((sleepModeOptions & 0x40) != 0) {
      self->_unint64_t sleepModeOptions = sleepModeOptions | 0x4000;
    }
    unint64_t version = self->_version;
  }
  if (version <= 0xA)
  {
    id v12 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_1A7E74000, v12, OS_LOG_TYPE_DEFAULT, "Migrating share across devices", v13, 2u);
    }

    self->_shareAcrossDevices = 1;
  }
  self->_unint64_t version = 11;
}

- (id)mutableCopy
{
  id v3 = [HKSPMutableSleepSettings alloc];
  return [(HKSPMutableSleepSettings *)v3 initFromObject:self];
}

- (BOOL)isEquivalentTo:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_381);
}

- (id)succinctDescription
{
  v2 = [(HKSPSleepSettings *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (HKSPSyncAnchor)syncAnchor
{
  return self->_syncAnchor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
}

@end