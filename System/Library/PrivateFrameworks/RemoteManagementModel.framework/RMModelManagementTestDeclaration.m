@interface RMModelManagementTestDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 echo:(id)a4;
+ (id)buildWithIdentifier:(id)a3 echo:(id)a4 echoDataAssetReference:(id)a5 returnStatus:(id)a6;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadEcho;
- (NSString)payloadEchoDataAssetReference;
- (NSString)payloadReturnStatus;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadEcho:(id)a3;
- (void)setPayloadEchoDataAssetReference:(id)a3;
- (void)setPayloadReturnStatus:(id)a3;
@end

@implementation RMModelManagementTestDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.management.test";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Echo";
  v6[1] = @"EchoDataAssetReference";
  v6[2] = @"ReturnStatus";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BE188];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_7 != -1) {
    dispatch_once(&assetReferences_onceToken_7, &__block_literal_global_12);
  }
  uint64_t v3 = assetReferences_assetPaths_7;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __51__RMModelManagementTestDeclaration_assetReferences__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BE1A0 keyPath:@"$.payloadEchoDataAssetReference"];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  v2 = (void *)assetReferences_assetPaths_7;
  assetReferences_assetPaths_7 = v1;
}

+ (id)buildWithIdentifier:(id)a3 echo:(id)a4 echoDataAssetReference:(id)a5 returnStatus:(id)a6
{
  id v9 = a3;
  v10 = (__CFString *)a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.management.test"];
  if (v9)
  {
    [v13 setDeclarationIdentifier:v9];
  }
  else
  {
    v14 = [MEMORY[0x263F08C38] UUID];
    v15 = [v14 UUIDString];
    [v13 setDeclarationIdentifier:v15];
  }
  [v13 setPayloadEcho:v12];

  [v13 setPayloadEchoDataAssetReference:v11];
  if (v10) {
    v16 = v10;
  }
  else {
    v16 = @"Installed";
  }
  [v13 setPayloadReturnStatus:v16];

  [v13 updateServerToken];
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 echo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.management.test"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadEcho:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = &unk_2708C2160;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE1B8];
  v27[0] = v21;
  v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE1D0];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C2178;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE1E8];
  v26[0] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE200];
  v26[1] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C2190;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE218];
  v25[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE230];
  v25[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C21A8;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE248];
  v24[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE260];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C21C0;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE278];
  v23[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE290];
  v23[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C21D8;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE2A8];
  v22[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE2C0];
  v22[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v29[5] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelManagementTestDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Echo" forKeyPath:@"payloadEcho" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"EchoDataAssetReference" forKeyPath:@"payloadEchoDataAssetReference" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"ReturnStatus" forKeyPath:@"payloadReturnStatus" isRequired:0 defaultValue:@"Installed" error:a5];
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelManagementTestDeclaration *)self payloadEcho];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Echo" value:v5 isRequired:1 defaultValue:0];

  id v6 = [(RMModelManagementTestDeclaration *)self payloadEchoDataAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"EchoDataAssetReference" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelManagementTestDeclaration *)self payloadReturnStatus];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ReturnStatus" value:v7 isRequired:0 defaultValue:@"Installed"];

  v8 = (void *)[v4 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelManagementTestDeclaration;
  v4 = [(RMModelDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadEcho copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadEchoDataAssetReference copy];
  v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_payloadReturnStatus copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)payloadEcho
{
  return self->_payloadEcho;
}

- (void)setPayloadEcho:(id)a3
{
}

- (NSString)payloadEchoDataAssetReference
{
  return self->_payloadEchoDataAssetReference;
}

- (void)setPayloadEchoDataAssetReference:(id)a3
{
}

- (NSString)payloadReturnStatus
{
  return self->_payloadReturnStatus;
}

- (void)setPayloadReturnStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadReturnStatus, 0);
  objc_storeStrong((id *)&self->_payloadEchoDataAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadEcho, 0);
}

@end