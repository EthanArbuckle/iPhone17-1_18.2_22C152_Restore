@interface HKSPMutableSleepSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)bedtimeReminders;
- (BOOL)chargingReminders;
- (BOOL)scheduledSleepMode;
- (BOOL)shareAcrossDevices;
- (BOOL)sleepTracking;
- (BOOL)springBoardGreetingDisabled;
- (BOOL)springBoardSuggestedPageCreated;
- (BOOL)timeInBedTracking;
- (BOOL)wakeUpResults;
- (BOOL)watchSleepFeaturesEnabled;
- (HKSPChangeSet)changeSet;
- (HKSPMutableSleepSettings)init;
- (HKSPMutableSleepSettings)initWithCoder:(id)a3;
- (HKSPObject)originalObject;
- (NSDate)lastModifiedDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromObject:(id)a3;
- (id)mutableCopy;
- (unint64_t)sleepModeOptions;
- (void)encodeWithCoder:(id)a3;
- (void)freeze;
- (void)revert;
- (void)setBedtimeReminders:(BOOL)a3;
- (void)setChargingReminders:(BOOL)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setScheduledSleepMode:(BOOL)a3;
- (void)setShareAcrossDevices:(BOOL)a3;
- (void)setSleepModeOptions:(unint64_t)a3;
- (void)setSleepTracking:(BOOL)a3;
- (void)setSpringBoardGreetingDisabled:(BOOL)a3;
- (void)setSpringBoardSuggestedPageCreated:(BOOL)a3;
- (void)setTimeInBedTracking:(BOOL)a3;
- (void)setWakeUpResults:(BOOL)a3;
- (void)setWatchSleepFeaturesEnabled:(BOOL)a3;
@end

@implementation HKSPMutableSleepSettings

- (void)setLastModifiedDate:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPSettingsLastModifiedDate"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSettingsLastModifiedDate"])
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
  v5 = [v4 objectForKeyedSubscript:@"HKSPSettingsLastModifiedDate"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSettingsLastModifiedDate"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSettingsLastModifiedDate"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSDate *)v6;
}

- (void)setWatchSleepFeaturesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPWatchSleepFeaturesEnabled"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWatchSleepFeaturesEnabled"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (BOOL)watchSleepFeaturesEnabled
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPWatchSleepFeaturesEnabled"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWatchSleepFeaturesEnabled"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPWatchSleepFeaturesEnabled"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setScheduledSleepMode:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPScheduledSleepMode"];

  char v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPScheduledSleepMode"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (BOOL)scheduledSleepMode
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPScheduledSleepMode"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPScheduledSleepMode"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPScheduledSleepMode"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setSleepModeOptions:(unint64_t)a3
{
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPSleepModeOptions"];

  char v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (v8 != a3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepModeOptions"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (unint64_t)sleepModeOptions
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSleepModeOptions"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepModeOptions"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSleepModeOptions"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (void)setSleepTracking:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPSleepTracking"];

  unint64_t v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepTracking"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (BOOL)sleepTracking
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSleepTracking"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSleepTracking"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSleepTracking"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setWakeUpResults:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPWakeUpResults"];

  char v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWakeUpResults"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (BOOL)wakeUpResults
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPWakeUpResults"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPWakeUpResults"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPWakeUpResults"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setTimeInBedTracking:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPTimeInBedTracking"];

  char v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPTimeInBedTracking"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (BOOL)timeInBedTracking
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPTimeInBedTracking"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPTimeInBedTracking"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPTimeInBedTracking"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setBedtimeReminders:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPBedtimeReminders"];

  char v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPBedtimeReminders"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (BOOL)bedtimeReminders
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPBedtimeReminders"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPBedtimeReminders"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPBedtimeReminders"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setChargingReminders:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPChargingReminders"];

  char v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPChargingReminders"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (BOOL)chargingReminders
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPChargingReminders"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPChargingReminders"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPChargingReminders"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setShareAcrossDevices:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPShareAcrossDevices"];

  char v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPShareAcrossDevices"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (BOOL)shareAcrossDevices
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPShareAcrossDevices"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPShareAcrossDevices"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPShareAcrossDevices"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setSpringBoardGreetingDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPSpringBoardGreetingDisabled"];

  char v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSpringBoardGreetingDisabled"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (BOOL)springBoardGreetingDisabled
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSpringBoardGreetingDisabled"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSpringBoardGreetingDisabled"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSpringBoardGreetingDisabled"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setSpringBoardSuggestedPageCreated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPSpringBoardSuggestedPageCreated"];

  char v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSpringBoardSuggestedPageCreated"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    id v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (BOOL)springBoardSuggestedPageCreated
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPSpringBoardSuggestedPageCreated"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPSpringBoardSuggestedPageCreated"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPSpringBoardSuggestedPageCreated"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (HKSPMutableSleepSettings)init
{
  v9.receiver = self;
  v9.super_class = (Class)HKSPMutableSleepSettings;
  v2 = [(HKSPSleepSettings *)&v9 init];
  if (v2)
  {
    BOOL v3 = objc_alloc_init(HKSPSleepSettings);
    originalObject = v2->_originalObject;
    v2->_originalObject = (HKSPObject *)v3;

    v5 = objc_alloc_init(HKSPChangeSet);
    changeSet = v2->_changeSet;
    v2->_changeSet = v5;

    char v7 = v2;
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
    [v13 handleFailureInMethod:a2 object:self file:@"HKSPSleepSettings.m" lineNumber:245 description:@"object must be a subclass"];
  }
  v14.receiver = self;
  v14.super_class = (Class)HKSPMutableSleepSettings;
  v6 = [(HKSPSleepSettings *)&v14 init];
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

- (HKSPMutableSleepSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPMutableSleepSettings;
  id v5 = [(HKSPSleepSettings *)&v12 init];
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
  id v4 = [HKSPSleepSettings alloc];
  return [(HKSPSleepSettings *)v4 initFromObject:self];
}

- (id)mutableCopy
{
  BOOL v3 = objc_alloc_init((Class)objc_opt_class());
  id v4 = [(HKSPMutableSleepSettings *)self originalObject];
  uint64_t v5 = [v4 copyWithZone:0];
  uint64_t v6 = (void *)v3[7];
  v3[7] = v5;

  uint64_t v7 = [(HKSPMutableSleepSettings *)self changeSet];
  uint64_t v8 = [v7 deepCopy];
  objc_super v9 = (void *)v3[8];
  v3[8] = v8;

  return v3;
}

- (void)freeze
{
  BOOL v3 = [[HKSPSleepSettings alloc] initFromObject:self];
  originalObject = self->_originalObject;
  self->_originalObject = v3;

  [(HKSPMutableSleepSettings *)self revert];
}

- (void)revert
{
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