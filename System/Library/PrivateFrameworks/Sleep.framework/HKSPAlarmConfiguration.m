@interface HKSPAlarmConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_needsMigrationForCoder:(id)a3;
- (BOOL)allowsSnooze;
- (BOOL)breaksThroughSilentMode;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentTo:(id)a3;
- (HKSPAlarmConfiguration)init;
- (HKSPAlarmConfiguration)initWithCoder:(id)a3;
- (NSNumber)soundVolume;
- (NSString)description;
- (NSString)toneIdentifier;
- (NSString)vibrationIdentifier;
- (id)initFromObject:(id)a3;
- (id)mutableCopy;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)breaksThroughSilentModeOptions;
- (unint64_t)playOptions;
- (unint64_t)version;
- (void)_migrateForCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPAlarmConfiguration

- (HKSPAlarmConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKSPAlarmConfiguration;
  v2 = [(HKSPAlarmConfiguration *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_enabled = 257;
    *(_OWORD *)&v2->_version = xmmword_1A7ED5560;
    uint64_t v4 = [NSNumber numberWithFloat:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0))];
    soundVolume = v3->_soundVolume;
    v3->_soundVolume = (NSNumber *)v4;

    v6 = v3;
  }

  return v3;
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (NSNumber)soundVolume
{
  return self->_soundVolume;
}

- (unint64_t)breaksThroughSilentModeOptions
{
  return self->_breaksThroughSilentModeOptions;
}

- (BOOL)allowsSnooze
{
  return self->_allowsSnooze;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundVolume, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
}

- (HKSPAlarmConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSPAlarmConfiguration;
  v5 = [(HKSPAlarmConfiguration *)&v9 init];
  v6 = v5;
  if (v5)
  {
    HKSPDecodeObjectWithCoder(v5, v4);
    if ([(HKSPAlarmConfiguration *)v6 _needsMigrationForCoder:v4]) {
      [(HKSPAlarmConfiguration *)v6 _migrateForCoder:v4];
    }
    v7 = v6;
  }

  return v6;
}

- (BOOL)_needsMigrationForCoder:(id)a3
{
  id v3 = a3;
  BOOL v4 = (objc_msgSend(v3, "hksp_serializationOptions") & 1) != 0
    && (unint64_t)[v3 decodeIntegerForKey:@"HKSPAlarmVersion"] < 3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initFromObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(HKSPAlarmConfiguration *)self init];
    HKSPCopyFromObject(v5, v6);

    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_migrateForCoder:(id)a3
{
  if (self->_version <= 3)
  {
    id v4 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_DEFAULT, "Migrating silent mode", v5, 2u);
    }

    self->_breaksThroughSilentModeOptions = 2;
  }
  self->_version = 3;
}

- (id)mutableCopy
{
  id v3 = [HKSPMutableAlarmConfiguration alloc];
  return [(HKSPMutableAlarmConfiguration *)v3 initFromObject:self];
}

- (BOOL)isEqual:(id)a3
{
  return HKSPObjectsAreEqual(self, a3);
}

- (BOOL)isEquivalentTo:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_381);
}

- (NSString)description
{
  return (NSString *)[(HKSPAlarmConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)breaksThroughSilentMode
{
  id v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v3 isAppleWatch]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }

  return ([(HKSPAlarmConfiguration *)self breaksThroughSilentModeOptions] & v4) != 0;
}

- (id)succinctDescription
{
  v2 = [(HKSPAlarmConfiguration *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPAlarmConfiguration isEnabled](self, "isEnabled"), @"enabled");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPAlarmConfiguration allowsSnooze](self, "allowsSnooze"), @"allowsSnooze");
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPAlarmConfiguration breaksThroughSilentMode](self, "breaksThroughSilentMode"), @"breaksThroughSilentMode");
  v7 = [(HKSPAlarmConfiguration *)self toneIdentifier];
  id v8 = (id)[v3 appendObject:v7 withName:@"toneIdentifier"];

  objc_super v9 = [(HKSPAlarmConfiguration *)self vibrationIdentifier];
  id v10 = (id)[v3 appendObject:v9 withName:@"vibrationIdentifier"];

  v11 = [(HKSPAlarmConfiguration *)self soundVolume];
  id v12 = (id)[v3 appendObject:v11 withName:@"soundVolume"];

  return v3;
}

- (unint64_t)playOptions
{
  return 3;
}

@end