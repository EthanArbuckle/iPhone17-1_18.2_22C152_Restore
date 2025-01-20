@interface RMModelManagementServerCapabilitiesDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 version:(id)a4 supportedFeatures:(id)a5;
+ (id)buildWithIdentifier:(id)a3 version:(id)a4 supportedFeatures:(id)a5;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadVersion;
- (RMModelAnyPayload)payloadSupportedFeatures;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadSupportedFeatures:(id)a3;
- (void)setPayloadVersion:(id)a3;
@end

@implementation RMModelManagementServerCapabilitiesDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.management.server-capabilities";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Version";
  v6[1] = @"SupportedFeatures";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 version:(id)a4 supportedFeatures:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.management.server-capabilities"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadVersion:v9];

  [v10 setPayloadSupportedFeatures:v8];
  [v10 updateServerToken];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 version:(id)a4 supportedFeatures:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.management.server-capabilities"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadVersion:v9];

  [v10 setPayloadSupportedFeatures:v8];
  [v10 updateServerToken];

  return v10;
}

+ (id)supportedOS
{
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = &unk_2708C2040;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDF48];
  v27[0] = v21;
  v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDF60];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C2058;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDF78];
  v26[0] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDF90];
  v26[1] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C2070;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDFA8];
  v25[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDFC0];
  v25[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C2088;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDFD8];
  v24[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDFF0];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C20A0;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE008];
  v23[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE020];
  v23[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C20B8;
  id v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE038];
  v22[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE050];
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

  v12 = +[RMModelManagementServerCapabilitiesDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Version" forKeyPath:@"payloadVersion" isRequired:1 defaultValue:0 error:a5])
  {
    LOWORD(v16) = a4;
    BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"SupportedFeatures" forKeyPath:@"payloadSupportedFeatures" classType:objc_opt_class() isRequired:1 defaultValue:0 serializationType:v16 error:a5];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMModelManagementServerCapabilitiesDeclaration *)self payloadVersion];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Version" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMModelManagementServerCapabilitiesDeclaration *)self payloadSupportedFeatures];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__RMModelManagementServerCapabilitiesDeclaration_serializePayloadWithType___block_invoke;
  v10[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v11 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"SupportedFeatures" value:v7 dictSerializer:v10 isRequired:1 defaultValue:0];

  id v8 = (void *)[v5 copy];
  return v8;
}

uint64_t __75__RMModelManagementServerCapabilitiesDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelManagementServerCapabilitiesDeclaration;
  v4 = [(RMModelDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadVersion copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(RMModelAnyPayload *)self->_payloadSupportedFeatures copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  return v4;
}

- (NSString)payloadVersion
{
  return self->_payloadVersion;
}

- (void)setPayloadVersion:(id)a3
{
}

- (RMModelAnyPayload)payloadSupportedFeatures
{
  return self->_payloadSupportedFeatures;
}

- (void)setPayloadSupportedFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSupportedFeatures, 0);
  objc_storeStrong((id *)&self->_payloadVersion, 0);
}

@end