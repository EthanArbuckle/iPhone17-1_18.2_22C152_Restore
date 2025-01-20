@interface RMModelSecurityIdentityDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 credentialAssetReference:(id)a4;
+ (id)buildWithIdentifier:(id)a3 credentialAssetReference:(id)a4 allowAllAppsAccess:(id)a5 keyIsExtractable:(id)a6;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadAllowAllAppsAccess;
- (NSNumber)payloadKeyIsExtractable;
- (NSString)payloadCredentialAssetReference;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadAllowAllAppsAccess:(id)a3;
- (void)setPayloadCredentialAssetReference:(id)a3;
- (void)setPayloadKeyIsExtractable:(id)a3;
@end

@implementation RMModelSecurityIdentityDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.security.identity";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"CredentialAssetReference";
  v6[1] = @"AllowAllAppsAccess";
  v6[2] = @"KeyIsExtractable";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BE9C8];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_12 != -1) {
    dispatch_once(&assetReferences_onceToken_12, &__block_literal_global_19);
  }
  uint64_t v3 = assetReferences_assetPaths_12;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __53__RMModelSecurityIdentityDeclaration_assetReferences__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BE9E0 keyPath:@"$.payloadCredentialAssetReference"];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  v2 = (void *)assetReferences_assetPaths_12;
  assetReferences_assetPaths_12 = v1;
}

+ (id)buildWithIdentifier:(id)a3 credentialAssetReference:(id)a4 allowAllAppsAccess:(id)a5 keyIsExtractable:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.security.identity"];
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
  [v13 setPayloadCredentialAssetReference:v12];

  if (v11) {
    id v16 = v11;
  }
  else {
    id v16 = (id)MEMORY[0x263EFFA80];
  }
  [v13 setPayloadAllowAllAppsAccess:v16];

  if (v10) {
    id v17 = v10;
  }
  else {
    id v17 = (id)MEMORY[0x263EFFA88];
  }
  [v13 setPayloadKeyIsExtractable:v17];

  [v13 updateServerToken];
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 credentialAssetReference:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.security.identity"];
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
  [v7 setPayloadCredentialAssetReference:v6];

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
  v28[0] = &unk_2708C2628;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE9F8];
  v27[0] = v21;
  v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEA10];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C2640;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEA28];
  v26[0] = v18;
  id v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEA40];
  v26[1] = v17;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C2658;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEA58];
  v25[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEA70];
  v25[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C2670;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEA88];
  v24[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEAA0];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C2688;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEAB8];
  v23[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEAD0];
  v23[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C26A0;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEAE8];
  v22[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEB00];
  v22[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v29[5] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelSecurityIdentityDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"CredentialAssetReference" forKeyPath:@"payloadCredentialAssetReference" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"AllowAllAppsAccess" forKeyPath:@"payloadAllowAllAppsAccess" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"KeyIsExtractable" forKeyPath:@"payloadKeyIsExtractable" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5];
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
  id v5 = [(RMModelSecurityIdentityDeclaration *)self payloadCredentialAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"CredentialAssetReference" value:v5 isRequired:1 defaultValue:0];

  id v6 = [(RMModelSecurityIdentityDeclaration *)self payloadAllowAllAppsAccess];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"AllowAllAppsAccess" value:v6 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v7 = [(RMModelSecurityIdentityDeclaration *)self payloadKeyIsExtractable];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"KeyIsExtractable" value:v7 isRequired:0 defaultValue:MEMORY[0x263EFFA88]];

  v8 = (void *)[v4 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelSecurityIdentityDeclaration;
  v4 = [(RMModelDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadCredentialAssetReference copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowAllAppsAccess copy];
  v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadKeyIsExtractable copy];
  id v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)payloadCredentialAssetReference
{
  return self->_payloadCredentialAssetReference;
}

- (void)setPayloadCredentialAssetReference:(id)a3
{
}

- (NSNumber)payloadAllowAllAppsAccess
{
  return self->_payloadAllowAllAppsAccess;
}

- (void)setPayloadAllowAllAppsAccess:(id)a3
{
}

- (NSNumber)payloadKeyIsExtractable
{
  return self->_payloadKeyIsExtractable;
}

- (void)setPayloadKeyIsExtractable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadKeyIsExtractable, 0);
  objc_storeStrong((id *)&self->_payloadAllowAllAppsAccess, 0);
  objc_storeStrong((id *)&self->_payloadCredentialAssetReference, 0);
}

@end