@interface RMModelAccountGoogleDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 userIdentityAssetReference:(id)a4;
+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 userIdentityAssetReference:(id)a5;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadUserIdentityAssetReference;
- (NSString)payloadVisibleName;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadUserIdentityAssetReference:(id)a3;
- (void)setPayloadVisibleName:(id)a3;
@end

@implementation RMModelAccountGoogleDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.google";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"VisibleName";
  v6[1] = @"UserIdentityAssetReference";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BCB80];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_2 != -1) {
    dispatch_once(&assetReferences_onceToken_2, &__block_literal_global_2);
  }
  uint64_t v3 = assetReferences_assetPaths_2;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __50__RMModelAccountGoogleDeclaration_assetReferences__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCB98 keyPath:@"$.payloadUserIdentityAssetReference"];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  v2 = (void *)assetReferences_assetPaths_2;
  assetReferences_assetPaths_2 = v1;
}

+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 userIdentityAssetReference:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.account.google"];
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
  [v10 setPayloadVisibleName:v9];

  [v10 setPayloadUserIdentityAssetReference:v8];
  [v10 updateServerToken];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 userIdentityAssetReference:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.account.google"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    id v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadUserIdentityAssetReference:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v21[4] = *MEMORY[0x263EF8340];
  v20[0] = &unk_2708C1650;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCBB0];
  v19[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCBC8];
  v19[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v21[0] = v13;
  v20[1] = &unk_2708C1698;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCBE0];
  v18[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCBF8];
  v18[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v21[1] = v4;
  v20[2] = &unk_2708C1668;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCC10];
  v17[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCC28];
  v17[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v21[2] = v7;
  v20[3] = &unk_2708C16B0;
  id v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCC40];
  v16[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCC58];
  v16[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v21[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelAccountGoogleDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"VisibleName" forKeyPath:@"payloadVisibleName" isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"UserIdentityAssetReference" forKeyPath:@"payloadUserIdentityAssetReference" isRequired:1 defaultValue:0 error:a5];
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelAccountGoogleDeclaration *)self payloadVisibleName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"VisibleName" value:v5 isRequired:0 defaultValue:0];

  id v6 = [(RMModelAccountGoogleDeclaration *)self payloadUserIdentityAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"UserIdentityAssetReference" value:v6 isRequired:1 defaultValue:0];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelAccountGoogleDeclaration;
  v4 = [(RMModelDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadVisibleName copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadUserIdentityAssetReference copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  return v4;
}

- (NSString)payloadVisibleName
{
  return self->_payloadVisibleName;
}

- (void)setPayloadVisibleName:(id)a3
{
}

- (NSString)payloadUserIdentityAssetReference
{
  return self->_payloadUserIdentityAssetReference;
}

- (void)setPayloadUserIdentityAssetReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUserIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadVisibleName, 0);
}

@end