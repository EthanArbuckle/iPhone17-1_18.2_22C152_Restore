@interface RMModelAccountLDAPDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 hostName:(id)a4;
+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 hostName:(id)a5 port:(id)a6 authenticationCredentialsAssetReference:(id)a7 searchSettings:(id)a8;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadSearchSettings;
- (NSNumber)payloadPort;
- (NSString)payloadAuthenticationCredentialsAssetReference;
- (NSString)payloadHostName;
- (NSString)payloadVisibleName;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3;
- (void)setPayloadHostName:(id)a3;
- (void)setPayloadPort:(id)a3;
- (void)setPayloadSearchSettings:(id)a3;
- (void)setPayloadVisibleName:(id)a3;
@end

@implementation RMModelAccountLDAPDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.ldap";
}

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"VisibleName";
  v6[1] = @"HostName";
  v6[2] = @"Port";
  v6[3] = @"AuthenticationCredentialsAssetReference";
  v6[4] = @"SearchSettings";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BCC70];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_3 != -1) {
    dispatch_once(&assetReferences_onceToken_3, &__block_literal_global_3);
  }
  uint64_t v3 = assetReferences_assetPaths_3;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __48__RMModelAccountLDAPDeclaration_assetReferences__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCC88 keyPath:@"$.payloadAuthenticationCredentialsAssetReference"];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  v2 = (void *)assetReferences_assetPaths_3;
  assetReferences_assetPaths_3 = v1;
}

+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 hostName:(id)a5 port:(id)a6 authenticationCredentialsAssetReference:(id)a7 searchSettings:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = objc_opt_new();
  [v19 setDeclarationType:@"com.apple.configuration.account.ldap"];
  if (v13)
  {
    [v19 setDeclarationIdentifier:v13];
  }
  else
  {
    v20 = [MEMORY[0x263F08C38] UUID];
    v21 = [v20 UUIDString];
    [v19 setDeclarationIdentifier:v21];
  }
  [v19 setPayloadVisibleName:v18];

  [v19 setPayloadHostName:v17];
  [v19 setPayloadPort:v16];

  [v19 setPayloadAuthenticationCredentialsAssetReference:v15];
  [v19 setPayloadSearchSettings:v14];

  [v19 updateServerToken];
  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 hostName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.account.ldap"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadHostName:v6];

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
  v20[0] = &unk_2708C16C8;
  id v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCCA0];
  v19[0] = v15;
  id v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCCB8];
  v19[1] = v14;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v21[0] = v13;
  v20[1] = &unk_2708C1710;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCCD0];
  v18[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCCE8];
  v18[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v21[1] = v4;
  v20[2] = &unk_2708C16E0;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCD00];
  v17[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCD18];
  v17[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v21[2] = v7;
  v20[3] = &unk_2708C1728;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCD30];
  v16[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCD48];
  v16[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v21[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelAccountLDAPDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  id v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"VisibleName" forKeyPath:@"payloadVisibleName" isRequired:0 defaultValue:0 error:a5])
  {
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"HostName" forKeyPath:@"payloadHostName" isRequired:1 defaultValue:0 error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"Port" forKeyPath:@"payloadPort" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v14 = 0;
        if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"AuthenticationCredentialsAssetReference" forKeyPath:@"payloadAuthenticationCredentialsAssetReference" isRequired:0 defaultValue:0 error:a5])
        {
          LOWORD(v16) = a4;
          BOOL v14 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"SearchSettings" forKeyPath:@"payloadSearchSettings" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 serializationType:v16 error:a5];
        }
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  id v6 = [(RMModelAccountLDAPDeclaration *)self payloadVisibleName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"VisibleName" value:v6 isRequired:0 defaultValue:0];

  v7 = [(RMModelAccountLDAPDeclaration *)self payloadHostName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"HostName" value:v7 isRequired:1 defaultValue:0];

  id v8 = [(RMModelAccountLDAPDeclaration *)self payloadPort];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"Port" value:v8 isRequired:0 defaultValue:0];

  v9 = [(RMModelAccountLDAPDeclaration *)self payloadAuthenticationCredentialsAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"AuthenticationCredentialsAssetReference" value:v9 isRequired:0 defaultValue:0];

  v10 = [(RMModelAccountLDAPDeclaration *)self payloadSearchSettings];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__RMModelAccountLDAPDeclaration_serializePayloadWithType___block_invoke;
  v13[3] = &__block_descriptor_34_e72___NSDictionary_16__0__RMModelAccountLDAPDeclaration_SearchSettingsItem_8l;
  signed __int16 v14 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"SearchSettings" value:v10 itemSerializer:v13 isRequired:0 defaultValue:0];

  v11 = (void *)[v5 copy];
  return v11;
}

uint64_t __58__RMModelAccountLDAPDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)RMModelAccountLDAPDeclaration;
  v4 = [(RMModelDeclarationBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadVisibleName copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadHostName copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadPort copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSString *)self->_payloadAuthenticationCredentialsAssetReference copy];
  v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(NSArray *)self->_payloadSearchSettings copy];
  signed __int16 v14 = (void *)v4[10];
  v4[10] = v13;

  return v4;
}

- (NSString)payloadVisibleName
{
  return self->_payloadVisibleName;
}

- (void)setPayloadVisibleName:(id)a3
{
}

- (NSString)payloadHostName
{
  return self->_payloadHostName;
}

- (void)setPayloadHostName:(id)a3
{
}

- (NSNumber)payloadPort
{
  return self->_payloadPort;
}

- (void)setPayloadPort:(id)a3
{
}

- (NSString)payloadAuthenticationCredentialsAssetReference
{
  return self->_payloadAuthenticationCredentialsAssetReference;
}

- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3
{
}

- (NSArray)payloadSearchSettings
{
  return self->_payloadSearchSettings;
}

- (void)setPayloadSearchSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSearchSettings, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadHostName, 0);
  objc_storeStrong((id *)&self->_payloadVisibleName, 0);
}

@end