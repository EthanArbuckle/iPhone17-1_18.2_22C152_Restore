@interface HKSPMutableAlarmConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsSnooze;
- (BOOL)isEnabled;
- (HKSPChangeSet)changeSet;
- (HKSPMutableAlarmConfiguration)init;
- (HKSPMutableAlarmConfiguration)initWithCoder:(id)a3;
- (HKSPMutableAlarmConfiguration)initWithTemplateAlarmConfiguration:(id)a3;
- (HKSPObject)originalObject;
- (NSNumber)soundVolume;
- (NSString)toneIdentifier;
- (NSString)vibrationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromObject:(id)a3;
- (id)mutableCopy;
- (unint64_t)breaksThroughSilentModeOptions;
- (void)encodeWithCoder:(id)a3;
- (void)freeze;
- (void)revert;
- (void)setAllowsSnooze:(BOOL)a3;
- (void)setBreaksThroughSilentMode:(BOOL)a3;
- (void)setBreaksThroughSilentModeOptions:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSoundVolume:(id)a3;
- (void)setToneIdentifier:(id)a3;
- (void)setVibrationIdentifier:(id)a3;
@end

@implementation HKSPMutableAlarmConfiguration

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPAlarmEnabled"];

  v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPAlarmEnabled"])
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
  v5 = [v4 objectForKeyedSubscript:@"HKSPAlarmEnabled"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPAlarmEnabled"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPAlarmEnabled"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setAllowsSnooze:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPAlarmAllowsSnooze"];

  char v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 BOOLValue];

  if (v8 != v3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPAlarmAllowsSnooze"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (BOOL)allowsSnooze
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPAlarmAllowsSnooze"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPAlarmAllowsSnooze"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPAlarmAllowsSnooze"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setBreaksThroughSilentModeOptions:(unint64_t)a3
{
  v5 = [(id)objc_opt_class() allProperties];
  v6 = HKSPPropertiesByIdentifier(v5);
  id v14 = [v6 objectForKeyedSubscript:@"HKSPAlarmSilentModeOptions"];

  char v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v14];
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (v8 != a3
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPAlarmSilentModeOptions"])
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
    v13 = [(HKSPChange *)v10 initWithProperty:v14 changedValue:v11 originalValue:v12];
    [(HKSPChangeSet *)changeSet addChange:v13];
  }
}

- (unint64_t)breaksThroughSilentModeOptions
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPAlarmSilentModeOptions"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPAlarmSilentModeOptions"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPAlarmSilentModeOptions"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (void)setToneIdentifier:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPAlarmToneIdentifier"];

  unint64_t v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPAlarmToneIdentifier"])
  {
    [v6 isRelationshipProperty];
    uint64_t v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (NSString)toneIdentifier
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPAlarmToneIdentifier"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPAlarmToneIdentifier"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPAlarmToneIdentifier"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSString *)v6;
}

- (void)setVibrationIdentifier:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPAlarmVibrationIdentifier"];

  unint64_t v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPAlarmVibrationIdentifier"])
  {
    [v6 isRelationshipProperty];
    uint64_t v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (NSString)vibrationIdentifier
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPAlarmVibrationIdentifier"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPAlarmVibrationIdentifier"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPAlarmVibrationIdentifier"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSString *)v6;
}

- (void)setSoundVolume:(id)a3
{
  id v11 = a3;
  v4 = [(id)objc_opt_class() allProperties];
  v5 = HKSPPropertiesByIdentifier(v4);
  v6 = [v5 objectForKeyedSubscript:@"HKSPAlarmSoundVolume"];

  unint64_t v7 = [(HKSPObject *)self->_originalObject hksp_valueForProperty:v6];
  if (!NAEqualObjects()
    || [(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPAlarmSoundVolume"])
  {
    [v6 isRelationshipProperty];
    uint64_t v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)[[v8 alloc] initWithProperty:v6 changedValue:v11 originalValue:v7];
    [(HKSPChangeSet *)changeSet addChange:v10];
  }
}

- (NSNumber)soundVolume
{
  BOOL v3 = [(id)objc_opt_class() allProperties];
  v4 = HKSPPropertiesByIdentifier(v3);
  v5 = [v4 objectForKeyedSubscript:@"HKSPAlarmSoundVolume"];

  if ([(HKSPChangeSet *)self->_changeSet hasChangeForPropertyIdentifier:@"HKSPAlarmSoundVolume"])
  {
    [(HKSPChangeSet *)self->_changeSet changedValueForPropertyIdentifier:@"HKSPAlarmSoundVolume"];
  }
  else
  {
    [(HKSPObject *)self->_originalObject hksp_valueForProperty:v5];
  v6 = };

  return (NSNumber *)v6;
}

- (HKSPMutableAlarmConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)HKSPMutableAlarmConfiguration;
  v2 = [(HKSPAlarmConfiguration *)&v9 init];
  if (v2)
  {
    BOOL v3 = objc_alloc_init(HKSPAlarmConfiguration);
    originalObject = v2->_originalObject;
    v2->_originalObject = (HKSPObject *)v3;

    v5 = objc_alloc_init(HKSPChangeSet);
    changeSet = v2->_changeSet;
    v2->_changeSet = v5;

    unint64_t v7 = v2;
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
    [v13 handleFailureInMethod:a2 object:self file:@"HKSPAlarmConfiguration.m" lineNumber:194 description:@"object must be a subclass"];
  }
  v14.receiver = self;
  v14.super_class = (Class)HKSPMutableAlarmConfiguration;
  v6 = [(HKSPAlarmConfiguration *)&v14 init];
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

- (HKSPMutableAlarmConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPMutableAlarmConfiguration;
  id v5 = [(HKSPAlarmConfiguration *)&v12 init];
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

- (HKSPMutableAlarmConfiguration)initWithTemplateAlarmConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPMutableAlarmConfiguration *)self init];
  if (v5)
  {
    -[HKSPMutableAlarmConfiguration setEnabled:](v5, "setEnabled:", [v4 isEnabled]);
    -[HKSPMutableAlarmConfiguration setAllowsSnooze:](v5, "setAllowsSnooze:", [v4 allowsSnooze]);
    -[HKSPMutableAlarmConfiguration setBreaksThroughSilentModeOptions:](v5, "setBreaksThroughSilentModeOptions:", [v4 breaksThroughSilentModeOptions]);
    uint64_t v6 = [v4 toneIdentifier];
    [(HKSPMutableAlarmConfiguration *)v5 setToneIdentifier:v6];

    uint64_t v7 = [v4 vibrationIdentifier];
    [(HKSPMutableAlarmConfiguration *)v5 setVibrationIdentifier:v7];

    uint64_t v8 = [v4 soundVolume];
    [(HKSPMutableAlarmConfiguration *)v5 setSoundVolume:v8];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HKSPAlarmConfiguration alloc];
  return [(HKSPAlarmConfiguration *)v4 initFromObject:self];
}

- (id)mutableCopy
{
  BOOL v3 = objc_alloc_init((Class)objc_opt_class());
  id v4 = [(HKSPMutableAlarmConfiguration *)self originalObject];
  uint64_t v5 = [v4 copyWithZone:0];
  uint64_t v6 = (void *)v3[7];
  v3[7] = v5;

  uint64_t v7 = [(HKSPMutableAlarmConfiguration *)self changeSet];
  uint64_t v8 = [v7 deepCopy];
  objc_super v9 = (void *)v3[8];
  v3[8] = v8;

  return v3;
}

- (void)freeze
{
  BOOL v3 = [[HKSPAlarmConfiguration alloc] initFromObject:self];
  originalObject = self->_originalObject;
  self->_originalObject = v3;

  [(HKSPMutableAlarmConfiguration *)self revert];
}

- (void)revert
{
}

- (void)setBreaksThroughSilentMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v5 isAppleWatch]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }

  if (v3) {
    unint64_t v7 = [(HKSPMutableAlarmConfiguration *)self breaksThroughSilentModeOptions] | v6;
  }
  else {
    unint64_t v7 = [(HKSPMutableAlarmConfiguration *)self breaksThroughSilentModeOptions] & ~v6;
  }
  [(HKSPMutableAlarmConfiguration *)self setBreaksThroughSilentModeOptions:v7];
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