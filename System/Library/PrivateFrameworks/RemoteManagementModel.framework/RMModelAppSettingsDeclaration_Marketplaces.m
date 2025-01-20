@interface RMModelAppSettingsDeclaration_Marketplaces
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithEnabled:(id)a3 allowedMarketplaceApps:(id)a4 deniedMarketplaceApps:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadAllowedMarketplaceApps;
- (NSArray)payloadDeniedMarketplaceApps;
- (NSNumber)payloadEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadAllowedMarketplaceApps:(id)a3;
- (void)setPayloadDeniedMarketplaceApps:(id)a3;
- (void)setPayloadEnabled:(id)a3;
@end

@implementation RMModelAppSettingsDeclaration_Marketplaces

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Enabled";
  v6[1] = @"AllowedMarketplaceApps";
  v6[2] = @"DeniedMarketplaceApps";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithEnabled:(id)a3 allowedMarketplaceApps:(id)a4 deniedMarketplaceApps:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = v10;
  if (v9) {
    id v12 = v9;
  }
  else {
    id v12 = (id)MEMORY[0x263EFFA88];
  }
  [v10 setPayloadEnabled:v12];

  [v11 setPayloadAllowedMarketplaceApps:v8];
  [v11 setPayloadDeniedMarketplaceApps:v7];

  return v11;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelAppSettingsDeclaration_Marketplaces allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"Enabled" forKeyPath:@"payloadEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"AllowedMarketplaceApps" forKeyPath:@"payloadAllowedMarketplaceApps" validator:&__block_literal_global_9 isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"DeniedMarketplaceApps" forKeyPath:@"payloadDeniedMarketplaceApps" validator:&__block_literal_global_136 isRequired:0 defaultValue:0 error:a5];
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelAppSettingsDeclaration_Marketplaces *)self payloadEnabled];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"Enabled" value:v5 isRequired:0 defaultValue:MEMORY[0x263EFFA88]];

  v6 = [(RMModelAppSettingsDeclaration_Marketplaces *)self payloadAllowedMarketplaceApps];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"AllowedMarketplaceApps" value:v6 itemSerializer:&__block_literal_global_139 isRequired:0 defaultValue:0];

  id v7 = [(RMModelAppSettingsDeclaration_Marketplaces *)self payloadDeniedMarketplaceApps];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"DeniedMarketplaceApps" value:v7 itemSerializer:&__block_literal_global_141 isRequired:0 defaultValue:0];

  id v8 = (void *)[v4 copy];
  return v8;
}

- (void)combineWithOther:(id)a3
{
  id v4 = a3;
  v5 = [(RMModelAppSettingsDeclaration_Marketplaces *)self payloadEnabled];
  v6 = [v4 payloadEnabled];
  id v7 = +[RMModelConfigurationBase combineFirst:v5 other:v6];
  [(RMModelAppSettingsDeclaration_Marketplaces *)self setPayloadEnabled:v7];

  id v8 = [(RMModelAppSettingsDeclaration_Marketplaces *)self payloadAllowedMarketplaceApps];
  id v9 = [v4 payloadAllowedMarketplaceApps];
  v10 = +[RMModelConfigurationBase combineSetIntersection:v8 other:v9];
  [(RMModelAppSettingsDeclaration_Marketplaces *)self setPayloadAllowedMarketplaceApps:v10];

  id v13 = [(RMModelAppSettingsDeclaration_Marketplaces *)self payloadDeniedMarketplaceApps];
  v11 = [v4 payloadDeniedMarketplaceApps];

  id v12 = +[RMModelConfigurationBase combineSetUnion:v13 other:v11];
  [(RMModelAppSettingsDeclaration_Marketplaces *)self setPayloadDeniedMarketplaceApps:v12];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelAppSettingsDeclaration_Marketplaces;
  id v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadEnabled copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadAllowedMarketplaceApps copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadDeniedMarketplaceApps copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSNumber)payloadEnabled
{
  return self->_payloadEnabled;
}

- (void)setPayloadEnabled:(id)a3
{
}

- (NSArray)payloadAllowedMarketplaceApps
{
  return self->_payloadAllowedMarketplaceApps;
}

- (void)setPayloadAllowedMarketplaceApps:(id)a3
{
}

- (NSArray)payloadDeniedMarketplaceApps
{
  return self->_payloadDeniedMarketplaceApps;
}

- (void)setPayloadDeniedMarketplaceApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDeniedMarketplaceApps, 0);
  objc_storeStrong((id *)&self->_payloadAllowedMarketplaceApps, 0);
  objc_storeStrong((id *)&self->_payloadEnabled, 0);
}

@end