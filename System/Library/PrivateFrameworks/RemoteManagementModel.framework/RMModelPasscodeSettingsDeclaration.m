@interface RMModelPasscodeSettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 requirePasscode:(id)a4 requireAlphanumericPasscode:(id)a5 requireComplexPasscode:(id)a6 minimumLength:(id)a7 minimumComplexCharacters:(id)a8 maximumFailedAttempts:(id)a9 failedAttemptsResetInMinutes:(id)a10 maximumGracePeriodInMinutes:(id)a11 maximumInactivityInMinutes:(id)a12 maximumPasscodeAgeInDays:(id)a13 passcodeReuseLimit:(id)a14 changeAtNextAuth:(id)a15 customRegex:(id)a16;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadChangeAtNextAuth;
- (NSNumber)payloadFailedAttemptsResetInMinutes;
- (NSNumber)payloadMaximumFailedAttempts;
- (NSNumber)payloadMaximumGracePeriodInMinutes;
- (NSNumber)payloadMaximumInactivityInMinutes;
- (NSNumber)payloadMaximumPasscodeAgeInDays;
- (NSNumber)payloadMinimumComplexCharacters;
- (NSNumber)payloadMinimumLength;
- (NSNumber)payloadPasscodeReuseLimit;
- (NSNumber)payloadRequireAlphanumericPasscode;
- (NSNumber)payloadRequireComplexPasscode;
- (NSNumber)payloadRequirePasscode;
- (RMModelPasscodeSettingsDeclaration_CustomRegex)payloadCustomRegex;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadChangeAtNextAuth:(id)a3;
- (void)setPayloadCustomRegex:(id)a3;
- (void)setPayloadFailedAttemptsResetInMinutes:(id)a3;
- (void)setPayloadMaximumFailedAttempts:(id)a3;
- (void)setPayloadMaximumGracePeriodInMinutes:(id)a3;
- (void)setPayloadMaximumInactivityInMinutes:(id)a3;
- (void)setPayloadMaximumPasscodeAgeInDays:(id)a3;
- (void)setPayloadMinimumComplexCharacters:(id)a3;
- (void)setPayloadMinimumLength:(id)a3;
- (void)setPayloadPasscodeReuseLimit:(id)a3;
- (void)setPayloadRequireAlphanumericPasscode:(id)a3;
- (void)setPayloadRequireComplexPasscode:(id)a3;
- (void)setPayloadRequirePasscode:(id)a3;
@end

@implementation RMModelPasscodeSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.passcode.settings";
}

+ (NSSet)allowedPayloadKeys
{
  v6[13] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"RequirePasscode";
  v6[1] = @"RequireAlphanumericPasscode";
  v6[2] = @"RequireComplexPasscode";
  v6[3] = @"MinimumLength";
  v6[4] = @"MinimumComplexCharacters";
  v6[5] = @"MaximumFailedAttempts";
  v6[6] = @"FailedAttemptsResetInMinutes";
  v6[7] = @"MaximumGracePeriodInMinutes";
  v6[8] = @"MaximumInactivityInMinutes";
  v6[9] = @"MaximumPasscodeAgeInDays";
  v6[10] = @"PasscodeReuseLimit";
  v6[11] = @"ChangeAtNextAuth";
  v6[12] = @"CustomRegex";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:13];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  v2 = objc_opt_new();
  return v2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 requirePasscode:(id)a4 requireAlphanumericPasscode:(id)a5 requireComplexPasscode:(id)a6 minimumLength:(id)a7 minimumComplexCharacters:(id)a8 maximumFailedAttempts:(id)a9 failedAttemptsResetInMinutes:(id)a10 maximumGracePeriodInMinutes:(id)a11 maximumInactivityInMinutes:(id)a12 maximumPasscodeAgeInDays:(id)a13 passcodeReuseLimit:(id)a14 changeAtNextAuth:(id)a15 customRegex:(id)a16
{
  id v17 = a3;
  id v46 = a16;
  id v45 = a15;
  id v44 = a14;
  id v43 = a13;
  id v42 = a12;
  id v18 = a11;
  id v41 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  v25 = objc_opt_new();
  [v25 setDeclarationType:@"com.apple.configuration.passcode.settings"];
  if (v17)
  {
    [v25 setDeclarationIdentifier:v17];
  }
  else
  {
    v26 = [MEMORY[0x263F08C38] UUID];
    v27 = [v26 UUIDString];
    [v25 setDeclarationIdentifier:v27];

    id v17 = 0;
  }
  v28 = (void *)MEMORY[0x263EFFA80];
  if (v24) {
    id v29 = v24;
  }
  else {
    id v29 = (id)MEMORY[0x263EFFA80];
  }
  [v25 setPayloadRequirePasscode:v29];

  if (v23) {
    id v30 = v23;
  }
  else {
    id v30 = v28;
  }
  [v25 setPayloadRequireAlphanumericPasscode:v30];

  if (v22) {
    id v31 = v22;
  }
  else {
    id v31 = v28;
  }
  [v25 setPayloadRequireComplexPasscode:v31];

  if (v21) {
    v32 = v21;
  }
  else {
    v32 = &unk_2708C2340;
  }
  [v25 setPayloadMinimumLength:v32];

  if (v20) {
    v33 = v20;
  }
  else {
    v33 = &unk_2708C2340;
  }
  [v25 setPayloadMinimumComplexCharacters:v33];

  if (v19) {
    v34 = v19;
  }
  else {
    v34 = &unk_2708C2358;
  }
  [v25 setPayloadMaximumFailedAttempts:v34];

  [v25 setPayloadFailedAttemptsResetInMinutes:v41];
  [v25 setPayloadMaximumGracePeriodInMinutes:v18];

  [v25 setPayloadMaximumInactivityInMinutes:v42];
  [v25 setPayloadMaximumPasscodeAgeInDays:v43];

  [v25 setPayloadPasscodeReuseLimit:v44];
  if (v45) {
    id v35 = v45;
  }
  else {
    id v35 = v28;
  }
  [v25 setPayloadChangeAtNextAuth:v35];

  [v25 setPayloadCustomRegex:v46];
  [v25 updateServerToken];

  return v25;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.passcode.settings"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerToken];

  return v4;
}

+ (id)combineConfigurations:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "combineWithOther:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)supportedOS
{
  v21[4] = *MEMORY[0x263EF8340];
  v20[0] = &unk_2708C2370;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE6F8];
  v19[0] = v15;
  long long v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE710];
  v19[1] = v14;
  long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v21[0] = v13;
  v20[1] = &unk_2708C2388;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE728];
  v18[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE740];
  v18[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v21[1] = v4;
  v20[2] = &unk_2708C23D0;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE758];
  v17[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE770];
  v17[1] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v21[2] = v7;
  v20[3] = &unk_2708C23E8;
  uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE788];
  v16[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE7A0];
  v16[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v21[3] = v10;
  long long v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  long long v11 = [v9 setWithArray:v10];

  long long v12 = +[RMModelPasscodeSettingsDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  long long v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"RequirePasscode" forKeyPath:@"payloadRequirePasscode" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
  {
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"RequireAlphanumericPasscode" forKeyPath:@"payloadRequireAlphanumericPasscode" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"RequireComplexPasscode" forKeyPath:@"payloadRequireComplexPasscode" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
      {
        BOOL v14 = 0;
        if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"MinimumLength" forKeyPath:@"payloadMinimumLength" isRequired:0 defaultValue:&unk_2708C2340 error:a5])
        {
          BOOL v14 = 0;
          if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"MinimumComplexCharacters" forKeyPath:@"payloadMinimumComplexCharacters" isRequired:0 defaultValue:&unk_2708C2340 error:a5])
          {
            BOOL v14 = 0;
            if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"MaximumFailedAttempts" forKeyPath:@"payloadMaximumFailedAttempts" isRequired:0 defaultValue:&unk_2708C2358 error:a5])
            {
              BOOL v14 = 0;
              if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"FailedAttemptsResetInMinutes" forKeyPath:@"payloadFailedAttemptsResetInMinutes" isRequired:0 defaultValue:0 error:a5])
              {
                BOOL v14 = 0;
                if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"MaximumGracePeriodInMinutes" forKeyPath:@"payloadMaximumGracePeriodInMinutes" isRequired:0 defaultValue:0 error:a5])
                {
                  BOOL v14 = 0;
                  if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"MaximumInactivityInMinutes" forKeyPath:@"payloadMaximumInactivityInMinutes" isRequired:0 defaultValue:0 error:a5])
                  {
                    BOOL v14 = 0;
                    if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"MaximumPasscodeAgeInDays" forKeyPath:@"payloadMaximumPasscodeAgeInDays" isRequired:0 defaultValue:0 error:a5])
                    {
                      BOOL v14 = 0;
                      if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"PasscodeReuseLimit" forKeyPath:@"payloadPasscodeReuseLimit" isRequired:0 defaultValue:0 error:a5])
                      {
                        BOOL v14 = 0;
                        if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"ChangeAtNextAuth" forKeyPath:@"payloadChangeAtNextAuth" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
                        {
                          LOWORD(v16) = a4;
                          BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"CustomRegex" forKeyPath:@"payloadCustomRegex" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5];
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  uint64_t v6 = [(RMModelPasscodeSettingsDeclaration *)self payloadRequirePasscode];
  uint64_t v7 = MEMORY[0x263EFFA80];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"RequirePasscode" value:v6 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v8 = [(RMModelPasscodeSettingsDeclaration *)self payloadRequireAlphanumericPasscode];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"RequireAlphanumericPasscode" value:v8 isRequired:0 defaultValue:v7];

  v9 = [(RMModelPasscodeSettingsDeclaration *)self payloadRequireComplexPasscode];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"RequireComplexPasscode" value:v9 isRequired:0 defaultValue:v7];

  v10 = [(RMModelPasscodeSettingsDeclaration *)self payloadMinimumLength];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"MinimumLength" value:v10 isRequired:0 defaultValue:&unk_2708C2340];

  long long v11 = [(RMModelPasscodeSettingsDeclaration *)self payloadMinimumComplexCharacters];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"MinimumComplexCharacters" value:v11 isRequired:0 defaultValue:&unk_2708C2340];

  long long v12 = [(RMModelPasscodeSettingsDeclaration *)self payloadMaximumFailedAttempts];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"MaximumFailedAttempts" value:v12 isRequired:0 defaultValue:&unk_2708C2358];

  long long v13 = [(RMModelPasscodeSettingsDeclaration *)self payloadFailedAttemptsResetInMinutes];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"FailedAttemptsResetInMinutes" value:v13 isRequired:0 defaultValue:0];

  BOOL v14 = [(RMModelPasscodeSettingsDeclaration *)self payloadMaximumGracePeriodInMinutes];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"MaximumGracePeriodInMinutes" value:v14 isRequired:0 defaultValue:0];

  v15 = [(RMModelPasscodeSettingsDeclaration *)self payloadMaximumInactivityInMinutes];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"MaximumInactivityInMinutes" value:v15 isRequired:0 defaultValue:0];

  uint64_t v16 = [(RMModelPasscodeSettingsDeclaration *)self payloadMaximumPasscodeAgeInDays];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"MaximumPasscodeAgeInDays" value:v16 isRequired:0 defaultValue:0];

  id v17 = [(RMModelPasscodeSettingsDeclaration *)self payloadPasscodeReuseLimit];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"PasscodeReuseLimit" value:v17 isRequired:0 defaultValue:0];

  id v18 = [(RMModelPasscodeSettingsDeclaration *)self payloadChangeAtNextAuth];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"ChangeAtNextAuth" value:v18 isRequired:0 defaultValue:v7];

  id v19 = [(RMModelPasscodeSettingsDeclaration *)self payloadCustomRegex];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __63__RMModelPasscodeSettingsDeclaration_serializePayloadWithType___block_invoke;
  v22[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v23 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"CustomRegex" value:v19 dictSerializer:v22 isRequired:0 defaultValue:0];

  id v20 = (void *)[v5 copy];
  return v20;
}

uint64_t __63__RMModelPasscodeSettingsDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (void)combineWithOther:(id)a3
{
  id v4 = a3;
  id v5 = [(RMModelPasscodeSettingsDeclaration *)self payloadRequirePasscode];
  uint64_t v6 = [v4 payloadRequirePasscode];
  uint64_t v7 = +[RMModelConfigurationBase combineBooleanOr:v5 other:v6];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadRequirePasscode:v7];

  id v8 = [(RMModelPasscodeSettingsDeclaration *)self payloadRequireAlphanumericPasscode];
  v9 = [v4 payloadRequireAlphanumericPasscode];
  v10 = +[RMModelConfigurationBase combineBooleanOr:v8 other:v9];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadRequireAlphanumericPasscode:v10];

  long long v11 = [(RMModelPasscodeSettingsDeclaration *)self payloadRequireComplexPasscode];
  long long v12 = [v4 payloadRequireComplexPasscode];
  long long v13 = +[RMModelConfigurationBase combineBooleanOr:v11 other:v12];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadRequireComplexPasscode:v13];

  BOOL v14 = [(RMModelPasscodeSettingsDeclaration *)self payloadMinimumLength];
  v15 = [v4 payloadMinimumLength];
  uint64_t v16 = +[RMModelConfigurationBase combineNumberMax:v14 other:v15];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadMinimumLength:v16];

  id v17 = [(RMModelPasscodeSettingsDeclaration *)self payloadMinimumComplexCharacters];
  id v18 = [v4 payloadMinimumComplexCharacters];
  id v19 = +[RMModelConfigurationBase combineNumberMax:v17 other:v18];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadMinimumComplexCharacters:v19];

  id v20 = [(RMModelPasscodeSettingsDeclaration *)self payloadMaximumFailedAttempts];
  id v21 = [v4 payloadMaximumFailedAttempts];
  id v22 = +[RMModelConfigurationBase combineNumberMin:v20 other:v21];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadMaximumFailedAttempts:v22];

  signed __int16 v23 = [(RMModelPasscodeSettingsDeclaration *)self payloadFailedAttemptsResetInMinutes];
  id v24 = [v4 payloadFailedAttemptsResetInMinutes];
  v25 = +[RMModelConfigurationBase combineNumberMin:v23 other:v24];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadFailedAttemptsResetInMinutes:v25];

  v26 = [(RMModelPasscodeSettingsDeclaration *)self payloadMaximumGracePeriodInMinutes];
  v27 = [v4 payloadMaximumGracePeriodInMinutes];
  v28 = +[RMModelConfigurationBase combineNumberMin:v26 other:v27];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadMaximumGracePeriodInMinutes:v28];

  id v29 = [(RMModelPasscodeSettingsDeclaration *)self payloadMaximumInactivityInMinutes];
  id v30 = [v4 payloadMaximumInactivityInMinutes];
  id v31 = +[RMModelConfigurationBase combineNumberMin:v29 other:v30];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadMaximumInactivityInMinutes:v31];

  v32 = [(RMModelPasscodeSettingsDeclaration *)self payloadMaximumPasscodeAgeInDays];
  v33 = [v4 payloadMaximumPasscodeAgeInDays];
  v34 = +[RMModelConfigurationBase combineNumberMin:v32 other:v33];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadMaximumPasscodeAgeInDays:v34];

  id v35 = [(RMModelPasscodeSettingsDeclaration *)self payloadPasscodeReuseLimit];
  v36 = [v4 payloadPasscodeReuseLimit];
  v37 = +[RMModelConfigurationBase combineNumberMin:v35 other:v36];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadPasscodeReuseLimit:v37];

  v38 = [(RMModelPasscodeSettingsDeclaration *)self payloadChangeAtNextAuth];
  v39 = [v4 payloadChangeAtNextAuth];
  v40 = +[RMModelConfigurationBase combineBooleanOr:v38 other:v39];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadChangeAtNextAuth:v40];

  id v43 = [(RMModelPasscodeSettingsDeclaration *)self payloadCustomRegex];
  id v41 = [v4 payloadCustomRegex];

  id v42 = +[RMModelConfigurationBase combineDictionary:v43 other:v41];
  [(RMModelPasscodeSettingsDeclaration *)self setPayloadCustomRegex:v42];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v32.receiver = self;
  v32.super_class = (Class)RMModelPasscodeSettingsDeclaration;
  id v4 = [(RMModelDeclarationBase *)&v32 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadRequirePasscode copy];
  uint64_t v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadRequireAlphanumericPasscode copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadRequireComplexPasscode copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadMinimumLength copy];
  long long v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadMinimumComplexCharacters copy];
  BOOL v14 = (void *)v4[10];
  v4[10] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadMaximumFailedAttempts copy];
  uint64_t v16 = (void *)v4[11];
  v4[11] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadFailedAttemptsResetInMinutes copy];
  id v18 = (void *)v4[12];
  v4[12] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadMaximumGracePeriodInMinutes copy];
  id v20 = (void *)v4[13];
  v4[13] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadMaximumInactivityInMinutes copy];
  id v22 = (void *)v4[14];
  v4[14] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadMaximumPasscodeAgeInDays copy];
  id v24 = (void *)v4[15];
  v4[15] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadPasscodeReuseLimit copy];
  v26 = (void *)v4[16];
  v4[16] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadChangeAtNextAuth copy];
  v28 = (void *)v4[17];
  v4[17] = v27;

  uint64_t v29 = [(RMModelPasscodeSettingsDeclaration_CustomRegex *)self->_payloadCustomRegex copy];
  id v30 = (void *)v4[18];
  v4[18] = v29;

  return v4;
}

- (NSNumber)payloadRequirePasscode
{
  return self->_payloadRequirePasscode;
}

- (void)setPayloadRequirePasscode:(id)a3
{
}

- (NSNumber)payloadRequireAlphanumericPasscode
{
  return self->_payloadRequireAlphanumericPasscode;
}

- (void)setPayloadRequireAlphanumericPasscode:(id)a3
{
}

- (NSNumber)payloadRequireComplexPasscode
{
  return self->_payloadRequireComplexPasscode;
}

- (void)setPayloadRequireComplexPasscode:(id)a3
{
}

- (NSNumber)payloadMinimumLength
{
  return self->_payloadMinimumLength;
}

- (void)setPayloadMinimumLength:(id)a3
{
}

- (NSNumber)payloadMinimumComplexCharacters
{
  return self->_payloadMinimumComplexCharacters;
}

- (void)setPayloadMinimumComplexCharacters:(id)a3
{
}

- (NSNumber)payloadMaximumFailedAttempts
{
  return self->_payloadMaximumFailedAttempts;
}

- (void)setPayloadMaximumFailedAttempts:(id)a3
{
}

- (NSNumber)payloadFailedAttemptsResetInMinutes
{
  return self->_payloadFailedAttemptsResetInMinutes;
}

- (void)setPayloadFailedAttemptsResetInMinutes:(id)a3
{
}

- (NSNumber)payloadMaximumGracePeriodInMinutes
{
  return self->_payloadMaximumGracePeriodInMinutes;
}

- (void)setPayloadMaximumGracePeriodInMinutes:(id)a3
{
}

- (NSNumber)payloadMaximumInactivityInMinutes
{
  return self->_payloadMaximumInactivityInMinutes;
}

- (void)setPayloadMaximumInactivityInMinutes:(id)a3
{
}

- (NSNumber)payloadMaximumPasscodeAgeInDays
{
  return self->_payloadMaximumPasscodeAgeInDays;
}

- (void)setPayloadMaximumPasscodeAgeInDays:(id)a3
{
}

- (NSNumber)payloadPasscodeReuseLimit
{
  return self->_payloadPasscodeReuseLimit;
}

- (void)setPayloadPasscodeReuseLimit:(id)a3
{
}

- (NSNumber)payloadChangeAtNextAuth
{
  return self->_payloadChangeAtNextAuth;
}

- (void)setPayloadChangeAtNextAuth:(id)a3
{
}

- (RMModelPasscodeSettingsDeclaration_CustomRegex)payloadCustomRegex
{
  return self->_payloadCustomRegex;
}

- (void)setPayloadCustomRegex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCustomRegex, 0);
  objc_storeStrong((id *)&self->_payloadChangeAtNextAuth, 0);
  objc_storeStrong((id *)&self->_payloadPasscodeReuseLimit, 0);
  objc_storeStrong((id *)&self->_payloadMaximumPasscodeAgeInDays, 0);
  objc_storeStrong((id *)&self->_payloadMaximumInactivityInMinutes, 0);
  objc_storeStrong((id *)&self->_payloadMaximumGracePeriodInMinutes, 0);
  objc_storeStrong((id *)&self->_payloadFailedAttemptsResetInMinutes, 0);
  objc_storeStrong((id *)&self->_payloadMaximumFailedAttempts, 0);
  objc_storeStrong((id *)&self->_payloadMinimumComplexCharacters, 0);
  objc_storeStrong((id *)&self->_payloadMinimumLength, 0);
  objc_storeStrong((id *)&self->_payloadRequireComplexPasscode, 0);
  objc_storeStrong((id *)&self->_payloadRequireAlphanumericPasscode, 0);
  objc_storeStrong((id *)&self->_payloadRequirePasscode, 0);
}

uint64_t __68__RMModelPasscodeSettingsDeclaration_CustomRegex_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

@end