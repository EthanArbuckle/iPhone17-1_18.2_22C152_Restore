@interface RMModelSoftwareUpdateSettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 notifications:(id)a4 deferrals:(id)a5 recommendedCadence:(id)a6 automaticActions:(id)a7 rapidSecurityResponse:(id)a8 allowStandardUserOSUpdates:(id)a9 beta:(id)a10;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadAllowStandardUserOSUpdates;
- (NSNumber)payloadNotifications;
- (NSString)payloadRecommendedCadence;
- (RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions)payloadAutomaticActions;
- (RMModelSoftwareUpdateSettingsDeclaration_Beta)payloadBeta;
- (RMModelSoftwareUpdateSettingsDeclaration_Deferrals)payloadDeferrals;
- (RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse)payloadRapidSecurityResponse;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadAllowStandardUserOSUpdates:(id)a3;
- (void)setPayloadAutomaticActions:(id)a3;
- (void)setPayloadBeta:(id)a3;
- (void)setPayloadDeferrals:(id)a3;
- (void)setPayloadNotifications:(id)a3;
- (void)setPayloadRapidSecurityResponse:(id)a3;
- (void)setPayloadRecommendedCadence:(id)a3;
@end

@implementation RMModelSoftwareUpdateSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.softwareupdate.settings";
}

+ (NSSet)allowedPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Notifications";
  v6[1] = @"Deferrals";
  v6[2] = @"RecommendedCadence";
  v6[3] = @"AutomaticActions";
  v6[4] = @"RapidSecurityResponse";
  v6[5] = @"AllowStandardUserOSUpdates";
  v6[6] = @"Beta";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
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

+ (id)buildWithIdentifier:(id)a3 notifications:(id)a4 deferrals:(id)a5 recommendedCadence:(id)a6 automaticActions:(id)a7 rapidSecurityResponse:(id)a8 allowStandardUserOSUpdates:(id)a9 beta:(id)a10
{
  id v15 = a3;
  id v29 = a10;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  v22 = objc_opt_new();
  [v22 setDeclarationType:@"com.apple.configuration.softwareupdate.settings"];
  if (v15)
  {
    [v22 setDeclarationIdentifier:v15];
  }
  else
  {
    v23 = [MEMORY[0x263F08C38] UUID];
    v24 = [v23 UUIDString];
    [v22 setDeclarationIdentifier:v24];
  }
  v25 = (void *)MEMORY[0x263EFFA88];
  if (v21) {
    id v26 = v21;
  }
  else {
    id v26 = (id)MEMORY[0x263EFFA88];
  }
  [v22 setPayloadNotifications:v26];

  [v22 setPayloadDeferrals:v20];
  [v22 setPayloadRecommendedCadence:v19];

  [v22 setPayloadAutomaticActions:v18];
  [v22 setPayloadRapidSecurityResponse:v17];

  if (v16) {
    id v27 = v16;
  }
  else {
    id v27 = v25;
  }
  [v22 setPayloadAllowStandardUserOSUpdates:v27];

  [v22 setPayloadBeta:v29];
  [v22 updateServerToken];

  return v22;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.softwareupdate.settings"];
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
  v17[3] = *MEMORY[0x263EF8340];
  v16[0] = &unk_2708C27F0;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BED10];
  v15[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BED28];
  v15[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v17[0] = v4;
  v16[1] = &unk_2708C2808;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BED40];
  v14[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BED58];
  v14[1] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v17[1] = v7;
  v16[2] = &unk_2708C2838;
  uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BED70];
  v13[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BED88];
  v13[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v17[2] = v10;
  long long v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  long long v11 = [v9 setWithArray:v10];

  long long v12 = +[RMModelSoftwareUpdateSettingsDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  long long v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"Notifications" forKeyPath:@"payloadNotifications" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
  {
    LOWORD(v16) = a4;
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Deferrals" forKeyPath:@"payloadDeferrals" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"RecommendedCadence" forKeyPath:@"payloadRecommendedCadence" isRequired:0 defaultValue:0 error:a5])
      {
        LOWORD(v17) = a4;
        BOOL v14 = 0;
        if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"AutomaticActions" forKeyPath:@"payloadAutomaticActions" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v17 error:a5])
        {
          LOWORD(v18) = a4;
          BOOL v14 = 0;
          if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"RapidSecurityResponse" forKeyPath:@"payloadRapidSecurityResponse" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v18 error:a5])
          {
            BOOL v14 = 0;
            if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"AllowStandardUserOSUpdates" forKeyPath:@"payloadAllowStandardUserOSUpdates" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
            {
              LOWORD(v19) = a4;
              BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Beta" forKeyPath:@"payloadBeta" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v19 error:a5];
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
  uint64_t v6 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadNotifications];
  uint64_t v7 = MEMORY[0x263EFFA88];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"Notifications" value:v6 isRequired:0 defaultValue:MEMORY[0x263EFFA88]];

  id v8 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadDeferrals];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke;
  v22[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v23 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Deferrals" value:v8 dictSerializer:v22 isRequired:0 defaultValue:0];

  v9 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadRecommendedCadence];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"RecommendedCadence" value:v9 isRequired:0 defaultValue:0];

  v10 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadAutomaticActions];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke_2;
  v20[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v21 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"AutomaticActions" value:v10 dictSerializer:v20 isRequired:0 defaultValue:0];

  long long v11 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadRapidSecurityResponse];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke_3;
  v18[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v19 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"RapidSecurityResponse" value:v11 dictSerializer:v18 isRequired:0 defaultValue:0];

  long long v12 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadAllowStandardUserOSUpdates];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"AllowStandardUserOSUpdates" value:v12 isRequired:0 defaultValue:v7];

  long long v13 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadBeta];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke_4;
  void v16[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v17 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Beta" value:v13 dictSerializer:v16 isRequired:0 defaultValue:0];

  BOOL v14 = (void *)[v5 copy];
  return v14;
}

uint64_t __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __69__RMModelSoftwareUpdateSettingsDeclaration_serializePayloadWithType___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (void)combineWithOther:(id)a3
{
  v27[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadNotifications];
  uint64_t v6 = [v4 payloadNotifications];
  uint64_t v7 = +[RMModelConfigurationBase combineBooleanAnd:v5 other:v6];
  [(RMModelSoftwareUpdateSettingsDeclaration *)self setPayloadNotifications:v7];

  id v8 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadDeferrals];
  v9 = [v4 payloadDeferrals];
  v10 = +[RMModelConfigurationBase combineDictionary:v8 other:v9];
  [(RMModelSoftwareUpdateSettingsDeclaration *)self setPayloadDeferrals:v10];

  long long v11 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadRecommendedCadence];
  long long v12 = [v4 payloadRecommendedCadence];
  v27[0] = @"All";
  v27[1] = @"Oldest";
  v27[2] = @"Newest";
  long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
  BOOL v14 = +[RMModelConfigurationBase combineEnumLast:v11 other:v12 enums:v13];
  [(RMModelSoftwareUpdateSettingsDeclaration *)self setPayloadRecommendedCadence:v14];

  id v15 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadAutomaticActions];
  uint64_t v16 = [v4 payloadAutomaticActions];
  signed __int16 v17 = +[RMModelConfigurationBase combineDictionary:v15 other:v16];
  [(RMModelSoftwareUpdateSettingsDeclaration *)self setPayloadAutomaticActions:v17];

  uint64_t v18 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadRapidSecurityResponse];
  signed __int16 v19 = [v4 payloadRapidSecurityResponse];
  id v20 = +[RMModelConfigurationBase combineDictionary:v18 other:v19];
  [(RMModelSoftwareUpdateSettingsDeclaration *)self setPayloadRapidSecurityResponse:v20];

  signed __int16 v21 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadAllowStandardUserOSUpdates];
  v22 = [v4 payloadAllowStandardUserOSUpdates];
  signed __int16 v23 = +[RMModelConfigurationBase combineBooleanAnd:v21 other:v22];
  [(RMModelSoftwareUpdateSettingsDeclaration *)self setPayloadAllowStandardUserOSUpdates:v23];

  v24 = [(RMModelSoftwareUpdateSettingsDeclaration *)self payloadBeta];
  v25 = [v4 payloadBeta];

  id v26 = +[RMModelConfigurationBase combineDictionary:v24 other:v25];
  [(RMModelSoftwareUpdateSettingsDeclaration *)self setPayloadBeta:v26];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)RMModelSoftwareUpdateSettingsDeclaration;
  id v4 = [(RMModelDeclarationBase *)&v20 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadNotifications copy];
  uint64_t v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self->_payloadDeferrals copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_payloadRecommendedCadence copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions *)self->_payloadAutomaticActions copy];
  long long v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse *)self->_payloadRapidSecurityResponse copy];
  BOOL v14 = (void *)v4[10];
  v4[10] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadAllowStandardUserOSUpdates copy];
  uint64_t v16 = (void *)v4[11];
  v4[11] = v15;

  uint64_t v17 = [(RMModelSoftwareUpdateSettingsDeclaration_Beta *)self->_payloadBeta copy];
  uint64_t v18 = (void *)v4[12];
  v4[12] = v17;

  return v4;
}

- (NSNumber)payloadNotifications
{
  return self->_payloadNotifications;
}

- (void)setPayloadNotifications:(id)a3
{
}

- (RMModelSoftwareUpdateSettingsDeclaration_Deferrals)payloadDeferrals
{
  return self->_payloadDeferrals;
}

- (void)setPayloadDeferrals:(id)a3
{
}

- (NSString)payloadRecommendedCadence
{
  return self->_payloadRecommendedCadence;
}

- (void)setPayloadRecommendedCadence:(id)a3
{
}

- (RMModelSoftwareUpdateSettingsDeclaration_AutomaticActions)payloadAutomaticActions
{
  return self->_payloadAutomaticActions;
}

- (void)setPayloadAutomaticActions:(id)a3
{
}

- (RMModelSoftwareUpdateSettingsDeclaration_RapidSecurityResponse)payloadRapidSecurityResponse
{
  return self->_payloadRapidSecurityResponse;
}

- (void)setPayloadRapidSecurityResponse:(id)a3
{
}

- (NSNumber)payloadAllowStandardUserOSUpdates
{
  return self->_payloadAllowStandardUserOSUpdates;
}

- (void)setPayloadAllowStandardUserOSUpdates:(id)a3
{
}

- (RMModelSoftwareUpdateSettingsDeclaration_Beta)payloadBeta
{
  return self->_payloadBeta;
}

- (void)setPayloadBeta:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadBeta, 0);
  objc_storeStrong((id *)&self->_payloadAllowStandardUserOSUpdates, 0);
  objc_storeStrong((id *)&self->_payloadRapidSecurityResponse, 0);
  objc_storeStrong((id *)&self->_payloadAutomaticActions, 0);
  objc_storeStrong((id *)&self->_payloadRecommendedCadence, 0);
  objc_storeStrong((id *)&self->_payloadDeferrals, 0);
  objc_storeStrong((id *)&self->_payloadNotifications, 0);
}

uint64_t __67__RMModelSoftwareUpdateSettingsDeclaration_Beta_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __67__RMModelSoftwareUpdateSettingsDeclaration_Beta_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

@end