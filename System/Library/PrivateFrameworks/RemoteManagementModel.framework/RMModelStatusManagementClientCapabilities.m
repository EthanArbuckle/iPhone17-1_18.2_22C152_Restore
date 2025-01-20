@interface RMModelStatusManagementClientCapabilities
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithSupportedVersions:(id)a3 supportedFeatures:(id)a4 supportedPayloads:(id)a5;
+ (id)buildWithSupportedVersions:(id)a3 supportedFeatures:(id)a4 supportedPayloads:(id)a5;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)statusSupportedVersions;
- (RMModelAnyPayload)statusSupportedFeatures;
- (RMModelStatusManagementClientCapabilities_SupportedPayloads)statusSupportedPayloads;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusSupportedFeatures:(id)a3;
- (void)setStatusSupportedPayloads:(id)a3;
- (void)setStatusSupportedVersions:(id)a3;
@end

@implementation RMModelStatusManagementClientCapabilities

+ (NSSet)allowedStatusKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"supported-versions";
  v6[1] = @"supported-features";
  v6[2] = @"supported-payloads";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"management.client-capabilities";
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)buildWithSupportedVersions:(id)a3 supportedFeatures:(id)a4 supportedPayloads:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setStatusSupportedVersions:v9];

  [v10 setStatusSupportedFeatures:v8];
  [v10 setStatusSupportedPayloads:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithSupportedVersions:(id)a3 supportedFeatures:(id)a4 supportedPayloads:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setStatusSupportedVersions:v9];

  [v10 setStatusSupportedFeatures:v8];
  [v10 setStatusSupportedPayloads:v7];

  return v10;
}

+ (id)supportedOS
{
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = &unk_2708C33F0;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0288];
  v27[0] = v21;
  v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C02A0];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C3408;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C02B8];
  v26[0] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C02D0];
  v26[1] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C3438;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C02E8];
  v25[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0300];
  v25[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C3420;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0318];
  v24[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0330];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C3450;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0348];
  v23[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0360];
  v23[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C3468;
  id v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0378];
  v22[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0390];
  v22[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v29[5] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelStatusManagementClientCapabilities allowedStatusKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v8, @"supported-versions", @"statusSupportedVersions", &__block_literal_global_23, 1, 0, a5)&& (LOWORD(v16) = a4, -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, @"supported-features", @"statusSupportedFeatures", objc_opt_class(), 1, 0,
          v16,
          a5)))
  {
    LOWORD(v17) = a4;
    BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"supported-payloads" forKeyPath:@"statusSupportedPayloads" classType:objc_opt_class() isRequired:1 defaultValue:0 serializationType:v17 error:a5];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __95__RMModelStatusManagementClientCapabilities_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMModelStatusManagementClientCapabilities *)self statusSupportedVersions];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"supported-versions" value:v6 itemSerializer:&__block_literal_global_74 isRequired:1 defaultValue:0];

  id v7 = [(RMModelStatusManagementClientCapabilities *)self statusSupportedFeatures];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__RMModelStatusManagementClientCapabilities_serializePayloadWithType___block_invoke_2;
  v13[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v14 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"supported-features" value:v7 dictSerializer:v13 isRequired:1 defaultValue:0];

  id v8 = [(RMModelStatusManagementClientCapabilities *)self statusSupportedPayloads];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__RMModelStatusManagementClientCapabilities_serializePayloadWithType___block_invoke_3;
  v11[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v12 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"supported-payloads" value:v8 dictSerializer:v11 isRequired:1 defaultValue:0];

  id v9 = (void *)[v5 copy];
  return v9;
}

id __70__RMModelStatusManagementClientCapabilities_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __70__RMModelStatusManagementClientCapabilities_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __70__RMModelStatusManagementClientCapabilities_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelStatusManagementClientCapabilities;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_statusSupportedVersions copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(RMModelAnyPayload *)self->_statusSupportedFeatures copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(RMModelStatusManagementClientCapabilities_SupportedPayloads *)self->_statusSupportedPayloads copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSArray)statusSupportedVersions
{
  return self->_statusSupportedVersions;
}

- (void)setStatusSupportedVersions:(id)a3
{
}

- (RMModelAnyPayload)statusSupportedFeatures
{
  return self->_statusSupportedFeatures;
}

- (void)setStatusSupportedFeatures:(id)a3
{
}

- (RMModelStatusManagementClientCapabilities_SupportedPayloads)statusSupportedPayloads
{
  return self->_statusSupportedPayloads;
}

- (void)setStatusSupportedPayloads:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusSupportedPayloads, 0);
  objc_storeStrong((id *)&self->_statusSupportedFeatures, 0);
  objc_storeStrong((id *)&self->_statusSupportedVersions, 0);
}

uint64_t __106__RMModelStatusManagementClientCapabilities_SupportedPayloads_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __81__RMModelStatusManagementClientCapabilities_SupportedPayloads_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

id __81__RMModelStatusManagementClientCapabilities_SupportedPayloads_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __118__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __118__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_loadFromDictionary_serializationType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __118__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_loadFromDictionary_serializationType_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __118__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_loadFromDictionary_serializationType_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __93__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id __93__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id __93__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_serializeWithType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id __93__RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations_serializeWithType___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

@end