@interface PASettings
+ (id)sharedInstance;
- (BOOL)configurationCameFromEnrollment;
- (BOOL)configurationCameFromUser;
- (BOOL)personalMediaAutomationSkipHeadphoneRequirement;
- (BOOL)personalMediaDebugMode;
- (BOOL)personalMediaEnabled;
- (BOOL)personalMediaEnabledForRouteUID:(id)a3;
- (BOOL)personalSoundVisible;
- (BOOL)shouldStoreLocally;
- (BOOL)shouldUpdateAccessory;
- (BOOL)sslEnabledForAddress:(id)a3;
- (BOOL)transparencyBeamformingForAddress:(id)a3;
- (BOOL)transparencyCustomizedForAddress:(id)a3;
- (NSDictionary)accommodationTypesByRouteUID;
- (NSDictionary)audiogramConfigurationByRouteUID;
- (NSDictionary)personalMediaConfigurationByRouteUID;
- (NSDictionary)personalMediaEnabledByRouteUID;
- (NSDictionary)sslEnabled;
- (NSDictionary)transparencyAmplification;
- (NSDictionary)transparencyBalance;
- (NSDictionary)transparencyBeamforming;
- (NSDictionary)transparencyCustomized;
- (NSDictionary)transparencyNoiseSupressor;
- (NSDictionary)transparencyTone;
- (PAConfiguration)audiogramConfiguration;
- (PAConfiguration)personalMediaConfiguration;
- (double)transparencyAmplificationForAddress:(id)a3;
- (double)transparencyBalanceForAddress:(id)a3;
- (double)transparencyNoiseSupressorForAddress:(id)a3;
- (double)transparencyToneForAddress:(id)a3;
- (id)archivedDataFromConfiguration:(id)a3;
- (id)audiogramConfigurationForRouteUID:(id)a3;
- (id)configurationFromData:(id)a3;
- (id)keysToSync;
- (id)personalMediaConfigurationForRouteUID:(id)a3;
- (id)preferenceDomainForPreferenceKey:(id)a3;
- (id)preferenceKeyForSelector:(SEL)a3;
- (id)sanitizedRouteUID:(id)a3;
- (id)valueForRouteUID:(id)a3 fromCombinedValue:(id)a4;
- (unint64_t)accommodationTypesForRouteUID:(id)a3;
- (unint64_t)currentEnrollmentProgress;
- (unint64_t)personalAudioAccommodationTypes;
- (void)logMessage:(id)a3;
- (void)setAccommodationTypes:(unint64_t)a3 forRouteUID:(id)a4;
- (void)setAccommodationTypesByRouteUID:(id)a3;
- (void)setAudiogramConfiguration:(id)a3;
- (void)setAudiogramConfiguration:(id)a3 forRouteUID:(id)a4;
- (void)setAudiogramConfigurationByRouteUID:(id)a3;
- (void)setConfigurationCameFromEnrollment:(BOOL)a3;
- (void)setConfigurationCameFromUser:(BOOL)a3;
- (void)setCurrentEnrollmentProgress:(unint64_t)a3;
- (void)setPersonalAudioAccommodationTypes:(unint64_t)a3;
- (void)setPersonalMediaAutomationSkipHeadphoneRequirement:(BOOL)a3;
- (void)setPersonalMediaConfiguration:(id)a3;
- (void)setPersonalMediaConfiguration:(id)a3 forRouteUID:(id)a4;
- (void)setPersonalMediaConfigurationByRouteUID:(id)a3;
- (void)setPersonalMediaDebugMode:(BOOL)a3;
- (void)setPersonalMediaEnabled:(BOOL)a3;
- (void)setPersonalMediaEnabled:(BOOL)a3 forRouteUID:(id)a4;
- (void)setPersonalMediaEnabledByRouteUID:(id)a3;
- (void)setPersonalSoundVisible:(BOOL)a3;
- (void)setShouldUpdateAccessory:(BOOL)a3;
- (void)setSslEnabled:(BOOL)a3 forAddress:(id)a4;
- (void)setSslEnabled:(id)a3;
- (void)setTransparencyAmplification:(double)a3 forAddress:(id)a4;
- (void)setTransparencyAmplification:(id)a3;
- (void)setTransparencyBalance:(double)a3 forAddress:(id)a4;
- (void)setTransparencyBalance:(id)a3;
- (void)setTransparencyBeamforming:(BOOL)a3 forAddress:(id)a4;
- (void)setTransparencyBeamforming:(id)a3;
- (void)setTransparencyCustomized:(BOOL)a3 forAddress:(id)a4;
- (void)setTransparencyCustomized:(id)a3;
- (void)setTransparencyNoiseSupressor:(double)a3 forAddress:(id)a4;
- (void)setTransparencyNoiseSupressor:(id)a3;
- (void)setTransparencyTone:(double)a3 forAddress:(id)a4;
- (void)setTransparencyTone:(id)a3;
- (void)updateConfiguration:(id *)a3 forRouteID:(id)a4;
@end

@implementation PASettings

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return (id)*MEMORY[0x263F8B328];
}

- (BOOL)personalMediaEnabled
{
  return [(PASettings *)self personalMediaEnabledForRouteUID:@"PAConfigurationWildcard"];
}

- (unint64_t)personalAudioAccommodationTypes
{
  return [(PASettings *)self accommodationTypesForRouteUID:@"PAConfigurationWildcard"];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_Settings;
  return v2;
}

- (BOOL)personalMediaEnabledForRouteUID:(id)a3
{
  v4 = [(PASettings *)self sanitizedRouteUID:a3];
  if ([v4 length])
  {
    v5 = [(PASettings *)self personalMediaEnabledByRouteUID];
    v6 = [(PASettings *)self valueForRouteUID:v4 fromCombinedValue:v5];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      char v7 = [v6 BOOLValue];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSDictionary)personalMediaEnabledByRouteUID
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"personalMediaEnabledByRouteUID" withClass:v3 andDefaultValue:0];
}

- (unint64_t)accommodationTypesForRouteUID:(id)a3
{
  v4 = [(PASettings *)self sanitizedRouteUID:a3];
  if ([v4 length])
  {
    v5 = [(PASettings *)self accommodationTypesByRouteUID];
    v6 = [(PASettings *)self valueForRouteUID:v4 fromCombinedValue:v5];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      unint64_t v7 = [v6 unsignedIntegerValue];
    }
    else {
      unint64_t v7 = 6;
    }
  }
  else
  {
    unint64_t v7 = 6;
  }

  return v7;
}

- (id)sanitizedRouteUID:(id)a3
{
  uint64_t v3 = [a3 componentsSeparatedByString:@"-"];
  v4 = [v3 firstObject];

  return v4;
}

- (NSDictionary)accommodationTypesByRouteUID
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"accommodationTypesByRouteUID" withClass:v3 andDefaultValue:0];
}

- (id)valueForRouteUID:(id)a3 fromCombinedValue:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForKey:a3];
  if (!v6)
  {
    v6 = [v5 valueForKey:@"PAConfigurationWildcard"];
  }

  return v6;
}

uint64_t __28__PASettings_sharedInstance__block_invoke()
{
  sharedInstance_Settings = objc_alloc_init(PASettings);
  return MEMORY[0x270F9A758]();
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  if (preferenceKeyForSelector__onceToken != -1) {
    dispatch_once(&preferenceKeyForSelector__onceToken, &__block_literal_global_27);
  }
  id v5 = (void *)preferenceKeyForSelector__SelectorMap;
  v6 = NSStringFromSelector(a3);
  unint64_t v7 = [v5 objectForKey:v6];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PASettings;
    id v8 = [(HCSettings *)&v11 preferenceKeyForSelector:a3];
  }
  v9 = v8;

  return v9;
}

void __39__PASettings_preferenceKeyForSelector___block_invoke()
{
  id v0 = objc_alloc(NSDictionary);
  id v8 = NSStringFromSelector(sel_personalMediaEnabled);
  uint64_t v1 = *MEMORY[0x263F8B478];
  v2 = NSStringFromSelector(sel_personalMediaConfiguration);
  uint64_t v3 = NSStringFromSelector(sel_personalMediaDebugMode);
  v4 = NSStringFromSelector(sel_audiogramConfiguration);
  id v5 = NSStringFromSelector(sel_personalMediaAutomationSkipHeadphoneRequirement);
  uint64_t v6 = objc_msgSend(v0, "initWithObjectsAndKeys:", @"PersonalMediaEnabled", v8, v1, v2, @"PersonalMediaDebug", v3, @"PersonalMediaAudiogram", v4, @"PersonalMediaAutomationSkipHeadphoneRequirementPreference", v5, 0);
  unint64_t v7 = (void *)preferenceKeyForSelector__SelectorMap;
  preferenceKeyForSelector__SelectorMap = v6;
}

- (id)keysToSync
{
  if (keysToSync_onceToken != -1) {
    dispatch_once(&keysToSync_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)keysToSync_KeysToSync;
  return v2;
}

void __24__PASettings_keysToSync__block_invoke()
{
  id v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F8B478];
  NSStringFromSelector(sel_personalAudioAccommodationTypes);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = NSStringFromSelector(sel_personalMediaConfigurationByRouteUID);
  uint64_t v3 = NSStringFromSelector(sel_accommodationTypesByRouteUID);
  uint64_t v4 = objc_msgSend(v0, "setWithObjects:", v1, v6, v2, v3, 0);
  id v5 = (void *)keysToSync_KeysToSync;
  keysToSync_KeysToSync = v4;
}

- (void)logMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  PAInitializeLogging();
  uint64_t v4 = [NSString stringWithFormat:@"%@", v3];

  id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[PASettings logMessage:]", 90, v4];
  id v6 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    id v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v7 UTF8String];
    _os_log_impl(&dword_20CD3E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)setPersonalMediaEnabledByRouteUID:(id)a3
{
}

- (NSDictionary)personalMediaConfigurationByRouteUID
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"personalMediaConfigurationByRouteUID" withClass:v3 andDefaultValue:0];
}

- (void)setPersonalMediaConfigurationByRouteUID:(id)a3
{
}

- (NSDictionary)audiogramConfigurationByRouteUID
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"audiogramConfigurationByRouteUID" withClass:v3 andDefaultValue:0];
}

- (void)setAudiogramConfigurationByRouteUID:(id)a3
{
}

- (void)setAccommodationTypesByRouteUID:(id)a3
{
}

- (unint64_t)currentEnrollmentProgress
{
  return [(HCSettings *)self integerValueForKey:@"currentEnrollmentProgress" withDefaultValue:0];
}

- (void)setCurrentEnrollmentProgress:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"currentEnrollmentProgress"];
}

- (BOOL)configurationCameFromEnrollment
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"configurationCameFromEnrollment" withDefaultValue:0];
}

- (void)setConfigurationCameFromEnrollment:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"configurationCameFromEnrollment"];
}

- (BOOL)configurationCameFromUser
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"configurationCameFromUser" withDefaultValue:0];
}

- (void)setConfigurationCameFromUser:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"configurationCameFromUser"];
}

- (BOOL)shouldUpdateAccessory
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"shouldUpdateAccessory" withDefaultValue:1];
}

- (void)setShouldUpdateAccessory:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"shouldUpdateAccessory"];
}

- (NSDictionary)transparencyCustomized
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"transparencyCustomized" withClass:v3 andDefaultValue:0];
}

- (void)setTransparencyCustomized:(id)a3
{
}

- (NSDictionary)transparencyAmplification
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"transparencyAmplification" withClass:v3 andDefaultValue:0];
}

- (void)setTransparencyAmplification:(id)a3
{
}

- (NSDictionary)transparencyBalance
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"transparencyBalance" withClass:v3 andDefaultValue:0];
}

- (void)setTransparencyBalance:(id)a3
{
}

- (NSDictionary)transparencyTone
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"transparencyTone" withClass:v3 andDefaultValue:0];
}

- (void)setTransparencyTone:(id)a3
{
}

- (NSDictionary)transparencyBeamforming
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"transparencyBeamforming" withClass:v3 andDefaultValue:0];
}

- (void)setTransparencyBeamforming:(id)a3
{
}

- (NSDictionary)transparencyNoiseSupressor
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"transparencyNoiseSupressor" withClass:v3 andDefaultValue:0];
}

- (void)setTransparencyNoiseSupressor:(id)a3
{
}

- (NSDictionary)sslEnabled
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)[(HCSettings *)self objectValueForKey:@"sslEnabled" withClass:v3 andDefaultValue:0];
}

- (void)setSslEnabled:(id)a3
{
}

- (void)setPersonalMediaEnabled:(BOOL)a3
{
}

- (void)setPersonalAudioAccommodationTypes:(unint64_t)a3
{
}

- (id)configurationFromData:(id)a3
{
  v11[4] = *(id *)MEMORY[0x263EF8340];
  id v3 = a3;
  v11[0] = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v3 error:v11];
  id v5 = v11[0];
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    id v6 = [v4 decodeObjectOfClasses:v9 forKey:*MEMORY[0x263F081D0]];
  }
  return v6;
}

- (id)archivedDataFromConfiguration:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    [v4 encodeObject:v3 forKey:*MEMORY[0x263F081D0]];
    [v4 finishEncoding];
    id v5 = [v4 encodedData];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (PAConfiguration)personalMediaConfiguration
{
  return (PAConfiguration *)[(PASettings *)self personalMediaConfigurationForRouteUID:@"PAConfigurationWildcard"];
}

- (void)setPersonalMediaConfiguration:(id)a3
{
  [(PASettings *)self setPersonalMediaConfiguration:a3 forRouteUID:@"PAConfigurationWildcard"];
  BOOL v4 = [(PASettings *)self personalMediaEnabled];
  [(PASettings *)self setPersonalMediaEnabled:v4];
}

- (PAConfiguration)audiogramConfiguration
{
  return (PAConfiguration *)[(PASettings *)self audiogramConfigurationForRouteUID:@"PAConfigurationWildcard"];
}

- (void)setAudiogramConfiguration:(id)a3
{
}

- (void)setPersonalMediaEnabled:(BOOL)a3 forRouteUID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = [(PASettings *)self sanitizedRouteUID:a4];
  if ([v6 length])
  {
    id v7 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v8 = [(PASettings *)self personalMediaEnabledByRouteUID];
    v9 = [v7 dictionaryWithDictionary:v8];

    uint64_t v10 = [NSNumber numberWithBool:v4];
    [v9 setValue:v10 forKey:v6];

    [(PASettings *)self setPersonalMediaEnabledByRouteUID:v9];
    PAInitializeLogging();
    uint64_t v11 = [NSString stringWithFormat:@"Updating enabled %@", v9];
    v12 = [NSString stringWithFormat:@"%s:%d %@", "-[PASettings setPersonalMediaEnabled:forRouteUID:]", 253, v11];
    v13 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v12;
      v15 = v13;
      *(_DWORD *)buf = 136446210;
      uint64_t v17 = [v14 UTF8String];
      _os_log_impl(&dword_20CD3E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (id)personalMediaConfigurationForRouteUID:(id)a3
{
  BOOL v4 = [(PASettings *)self sanitizedRouteUID:a3];
  if ([v4 length])
  {
    id v5 = [(PASettings *)self personalMediaConfigurationByRouteUID];
    id v6 = [(PASettings *)self valueForRouteUID:v4 fromCombinedValue:v5];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v7 = [(PASettings *)self configurationFromData:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setPersonalMediaConfiguration:(id)a3 forRouteUID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(PASettings *)self sanitizedRouteUID:a4];
  uint64_t v8 = [(PASettings *)self archivedDataFromConfiguration:v6];

  if ([v7 length] && objc_msgSend(v8, "length"))
  {
    v9 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v10 = [(PASettings *)self personalMediaConfigurationByRouteUID];
    uint64_t v11 = [v9 dictionaryWithDictionary:v10];

    [v11 setValue:v8 forKey:v7];
    [(PASettings *)self setPersonalMediaConfigurationByRouteUID:v11];
    PAInitializeLogging();
    v12 = [NSString stringWithFormat:@"Updating configs %@", v11];
    v13 = [NSString stringWithFormat:@"%s:%d %@", "-[PASettings setPersonalMediaConfiguration:forRouteUID:]", 284, v12];
    id v14 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v13;
      v16 = v14;
      *(_DWORD *)buf = 136446210;
      uint64_t v18 = [v15 UTF8String];
      _os_log_impl(&dword_20CD3E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (id)audiogramConfigurationForRouteUID:(id)a3
{
  BOOL v4 = [(PASettings *)self sanitizedRouteUID:a3];
  if ([v4 length])
  {
    id v5 = [(PASettings *)self audiogramConfigurationByRouteUID];
    id v6 = [(PASettings *)self valueForRouteUID:v4 fromCombinedValue:v5];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v7 = [(PASettings *)self configurationFromData:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setAudiogramConfiguration:(id)a3 forRouteUID:(id)a4
{
  id v6 = a3;
  id v11 = [(PASettings *)self sanitizedRouteUID:a4];
  id v7 = [(PASettings *)self archivedDataFromConfiguration:v6];

  if ([v11 length] && objc_msgSend(v7, "length"))
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF9A0];
    v9 = [(PASettings *)self audiogramConfigurationByRouteUID];
    uint64_t v10 = [v8 dictionaryWithDictionary:v9];

    [v10 setValue:v7 forKey:v11];
    [(PASettings *)self setAudiogramConfigurationByRouteUID:v10];
  }
}

- (void)setAccommodationTypes:(unint64_t)a3 forRouteUID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = [(PASettings *)self sanitizedRouteUID:a4];
  if ([v6 length])
  {
    id v7 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v8 = [(PASettings *)self accommodationTypesByRouteUID];
    v9 = [v7 dictionaryWithDictionary:v8];

    uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
    [v9 setValue:v10 forKey:v6];

    [(PASettings *)self setAccommodationTypesByRouteUID:v9];
    PAInitializeLogging();
    id v11 = [NSString stringWithFormat:@"Updating types %@", v9];
    v12 = [NSString stringWithFormat:@"%s:%d %@", "-[PASettings setAccommodationTypes:forRouteUID:]", 343, v11];
    v13 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v12;
      id v15 = v13;
      *(_DWORD *)buf = 136446210;
      uint64_t v17 = [v14 UTF8String];
      _os_log_impl(&dword_20CD3E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (BOOL)transparencyCustomizedForAddress:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(PASettings *)self transparencyCustomized];
    id v6 = [v5 valueForKey:v4];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      char v7 = [v6 BOOLValue];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setTransparencyCustomized:(BOOL)a3 forAddress:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if ([v10 length])
  {
    id v6 = (void *)MEMORY[0x263EFF9A0];
    char v7 = [(PASettings *)self transparencyCustomized];
    uint64_t v8 = [v6 dictionaryWithDictionary:v7];

    v9 = [NSNumber numberWithBool:v4];
    [v8 setValue:v9 forKey:v10];

    [(PASettings *)self setTransparencyCustomized:v8];
  }
}

- (double)transparencyAmplificationForAddress:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(PASettings *)self transparencyAmplification];
    id v6 = [v5 valueForKey:v4];
    double v7 = 0.5;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 doubleValue];
        double v7 = v8;
      }
    }
  }
  else
  {
    double v7 = 0.5;
  }

  return v7;
}

- (void)setTransparencyAmplification:(double)a3 forAddress:(id)a4
{
  id v10 = a4;
  if ([v10 length])
  {
    id v6 = (void *)MEMORY[0x263EFF9A0];
    double v7 = [(PASettings *)self transparencyAmplification];
    double v8 = [v6 dictionaryWithDictionary:v7];

    v9 = [NSNumber numberWithDouble:a3];
    [v8 setValue:v9 forKey:v10];

    [(PASettings *)self setTransparencyAmplification:v8];
  }
}

- (double)transparencyBalanceForAddress:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(PASettings *)self transparencyBalance];
    id v6 = [v5 valueForKey:v4];
    double v7 = 0.5;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 doubleValue];
        double v7 = v8;
      }
    }
  }
  else
  {
    double v7 = 0.5;
  }

  return v7;
}

- (void)setTransparencyBalance:(double)a3 forAddress:(id)a4
{
  id v10 = a4;
  if ([v10 length])
  {
    id v6 = (void *)MEMORY[0x263EFF9A0];
    double v7 = [(PASettings *)self transparencyBalance];
    double v8 = [v6 dictionaryWithDictionary:v7];

    v9 = [NSNumber numberWithDouble:a3];
    [v8 setValue:v9 forKey:v10];

    [(PASettings *)self setTransparencyBalance:v8];
  }
}

- (double)transparencyToneForAddress:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(PASettings *)self transparencyTone];
    id v6 = [v5 valueForKey:v4];
    double v7 = 0.5;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 doubleValue];
        double v7 = v8;
      }
    }
  }
  else
  {
    double v7 = 0.5;
  }

  return v7;
}

- (void)setTransparencyTone:(double)a3 forAddress:(id)a4
{
  id v10 = a4;
  if ([v10 length])
  {
    id v6 = (void *)MEMORY[0x263EFF9A0];
    double v7 = [(PASettings *)self transparencyTone];
    double v8 = [v6 dictionaryWithDictionary:v7];

    v9 = [NSNumber numberWithDouble:a3];
    [v8 setValue:v9 forKey:v10];

    [(PASettings *)self setTransparencyTone:v8];
  }
}

- (BOOL)transparencyBeamformingForAddress:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(PASettings *)self transparencyBeamforming];
    id v6 = [v5 valueForKey:v4];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      char v7 = [v6 BOOLValue];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setTransparencyBeamforming:(BOOL)a3 forAddress:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if ([v10 length])
  {
    id v6 = (void *)MEMORY[0x263EFF9A0];
    char v7 = [(PASettings *)self transparencyBeamforming];
    double v8 = [v6 dictionaryWithDictionary:v7];

    v9 = [NSNumber numberWithBool:v4];
    [v8 setValue:v9 forKey:v10];

    [(PASettings *)self setTransparencyBeamforming:v8];
  }
}

- (double)transparencyNoiseSupressorForAddress:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(PASettings *)self transparencyNoiseSupressor];
    id v6 = [v5 valueForKey:v4];
    double v7 = 0.0;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 doubleValue];
        double v7 = v8;
      }
    }
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (void)setTransparencyNoiseSupressor:(double)a3 forAddress:(id)a4
{
  id v10 = a4;
  if ([v10 length])
  {
    id v6 = (void *)MEMORY[0x263EFF9A0];
    double v7 = [(PASettings *)self transparencyNoiseSupressor];
    double v8 = [v6 dictionaryWithDictionary:v7];

    v9 = [NSNumber numberWithDouble:a3];
    [v8 setValue:v9 forKey:v10];

    [(PASettings *)self setTransparencyNoiseSupressor:v8];
  }
}

- (BOOL)sslEnabledForAddress:(id)a3
{
  id v3 = (void *)MEMORY[0x263F2B998];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  id v6 = [v5 deviceFromAddressString:v4];

  LOBYTE(v5) = [v6 getSSLMode] == 1;
  return (char)v5;
}

- (void)setSslEnabled:(BOOL)a3 forAddress:(id)a4
{
  BOOL v4 = a3;
  id v13 = a4;
  if ([v13 length])
  {
    id v6 = (void *)MEMORY[0x263EFF9A0];
    double v7 = [(PASettings *)self sslEnabled];
    double v8 = [v6 dictionaryWithDictionary:v7];

    v9 = [NSNumber numberWithBool:v4];
    [v8 setValue:v9 forKey:v13];

    [(PASettings *)self setSslEnabled:v8];
    id v10 = [MEMORY[0x263F2B998] sharedInstance];
    id v11 = [v10 deviceFromAddressString:v13];

    if (v4) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }
    [v11 setSSLMode:v12];
  }
}

- (BOOL)personalSoundVisible
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"personalSoundVisible" withDefaultValue:1];
}

- (void)setPersonalSoundVisible:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"personalSoundVisible"];
}

- (BOOL)personalMediaDebugMode
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"PersonalMediaDebug" withDefaultValue:0];
}

- (void)setPersonalMediaDebugMode:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"PersonalMediaDebug"];
}

- (BOOL)personalMediaAutomationSkipHeadphoneRequirement
{
  return [(HCSettings *)self BOOLValueForPreferenceKey:@"PersonalMediaAutomationSkipHeadphoneRequirementPreference" withDefaultValue:0];
}

- (void)setPersonalMediaAutomationSkipHeadphoneRequirement:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(HCSettings *)self setValue:v4 forPreferenceKey:@"PersonalMediaAutomationSkipHeadphoneRequirementPreference"];
}

- (void)updateConfiguration:(id *)a3 forRouteID:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([v6 length])
  {
    [(PASettings *)self setShouldUpdateAccessory:0];
    uint64_t v7 = +[PAConfiguration configurationWithLeftMediaLoss:a3->var4 rightMediaLoss:a3->var5 leftSpeechLoss:a3->var2 andRightSpeechLoss:a3->var3];
    v62 = [(PASettings *)self personalMediaConfigurationByRouteUID];
    uint64_t v8 = -[PASettings valueForRouteUID:fromCombinedValue:](self, "valueForRouteUID:fromCombinedValue:", v6);
    v66 = (void *)v8;
    if (v8 && (uint64_t v9 = v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = [(PASettings *)self configurationFromData:v9];
    }
    else
    {
      id v10 = 0;
    }
    char v11 = [v10 isEqual:v7];
    PAInitializeLogging();
    uint64_t v12 = (os_log_t *)MEMORY[0x263F472C8];
    v67 = (void *)v7;
    v65 = v10;
    if (v11)
    {
      id v13 = [NSString stringWithFormat:@"Skipping update. Configuration didn't change %@ = %@", v6, v10];
      id v14 = [NSString stringWithFormat:@"%s:%d %@", "-[PASettings updateConfiguration:forRouteID:]", 563, v13];
      os_log_t v15 = *v12;
      v16 = v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v14;
        uint64_t v18 = v15;
        *(_DWORD *)buf = 136446210;
        uint64_t v69 = [v17 UTF8String];
        _os_log_impl(&dword_20CD3E000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v19 = [NSString stringWithFormat:@"Updating config for %@ = %@", v6, v7];
      v20 = [NSString stringWithFormat:@"%s:%d %@", "-[PASettings updateConfiguration:forRouteID:]", 558, v19];
      os_log_t v21 = *v12;
      v16 = v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = v20;
        v23 = v21;
        *(_DWORD *)buf = 136446210;
        uint64_t v69 = [v22 UTF8String];
        _os_log_impl(&dword_20CD3E000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      [(PASettings *)self setPersonalMediaConfiguration:v7 forRouteUID:v6];
    }
    PAInitializeLogging();
    v24 = NSString;
    v25 = [NSNumber numberWithBool:a3->var0];
    v26 = [v24 stringWithFormat:@"Speech enabled %@", v25];

    v27 = [NSString stringWithFormat:@"%s:%d %@", "-[PASettings updateConfiguration:forRouteID:]", 567, v26];
    os_log_t v28 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = v27;
      v30 = v28;
      uint64_t v31 = [v29 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v69 = v31;
      _os_log_impl(&dword_20CD3E000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    PAInitializeLogging();
    v32 = NSString;
    v33 = [NSNumber numberWithBool:a3->var1];
    v34 = [v32 stringWithFormat:@"Media enabled %@", v33];

    v35 = [NSString stringWithFormat:@"%s:%d %@", "-[PASettings updateConfiguration:forRouteID:]", 568, v34];
    os_log_t v36 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = v35;
      v38 = v36;
      uint64_t v39 = [v37 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v69 = v39;
      _os_log_impl(&dword_20CD3E000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (a3->var1) {
      uint64_t v40 = (2 * a3->var0) | 4;
    }
    else {
      uint64_t v40 = 2 * a3->var0;
    }
    uint64_t v41 = [(PASettings *)self accommodationTypesByRouteUID];

    v63 = (void *)v41;
    v42 = [(PASettings *)self valueForRouteUID:v6 fromCombinedValue:v41];
    v64 = self;
    if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v43 = v6;
      v44 = v16;
      uint64_t v45 = [v42 unsignedIntegerValue];
    }
    else
    {
      id v43 = v6;
      v44 = v16;
      uint64_t v45 = 0;
    }
    PAInitializeLogging();
    v46 = NSString;
    v47 = [NSNumber numberWithUnsignedInteger:v40];
    v48 = [NSNumber numberWithUnsignedInteger:v45];
    v49 = [v46 stringWithFormat:@"Setting types %d = %@ - %@", v45 != v40, v47, v48];

    v50 = [NSString stringWithFormat:@"%s:%d %@", "-[PASettings updateConfiguration:forRouteID:]", 587, v49];
    os_log_t v51 = *v44;
    if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEFAULT))
    {
      id v52 = v50;
      v53 = v51;
      uint64_t v54 = [v52 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v69 = v54;
      _os_log_impl(&dword_20CD3E000, v53, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v6 = v43;
    if (v45 == v40)
    {
      PAInitializeLogging();
      v56 = [NSString stringWithFormat:@"Skipping update. Types didn't change"];
      v57 = [NSString stringWithFormat:@"%s:%d %@", "-[PASettings updateConfiguration:forRouteID:]", 594, v56];
      os_log_t v58 = *v44;
      v55 = v64;
      if (os_log_type_enabled(*v44, OS_LOG_TYPE_DEFAULT))
      {
        id v59 = v57;
        v60 = v58;
        uint64_t v61 = [v59 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v69 = v61;
        _os_log_impl(&dword_20CD3E000, v60, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    else
    {
      v55 = v64;
      [(PASettings *)v64 setAccommodationTypes:v40 forRouteUID:v6];
    }
    [(PASettings *)v55 setShouldUpdateAccessory:1];
  }
}

@end