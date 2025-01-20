@interface RMModelAccountCalDAVDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 hostName:(id)a4;
+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 hostName:(id)a5 port:(id)a6 path:(id)a7 authenticationCredentialsAssetReference:(id)a8;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadPort;
- (NSString)payloadAuthenticationCredentialsAssetReference;
- (NSString)payloadHostName;
- (NSString)payloadPath;
- (NSString)payloadVisibleName;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3;
- (void)setPayloadHostName:(id)a3;
- (void)setPayloadPath:(id)a3;
- (void)setPayloadPort:(id)a3;
- (void)setPayloadVisibleName:(id)a3;
@end

@implementation RMModelAccountCalDAVDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.caldav";
}

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"VisibleName";
  v6[1] = @"HostName";
  v6[2] = @"Port";
  v6[3] = @"Path";
  v6[4] = @"AuthenticationCredentialsAssetReference";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BC850];
}

- (id)assetReferences
{
  if (assetReferences_onceToken != -1) {
    dispatch_once(&assetReferences_onceToken, &__block_literal_global);
  }
  uint64_t v3 = assetReferences_assetPaths;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __50__RMModelAccountCalDAVDeclaration_assetReferences__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BC868 keyPath:@"$.payloadAuthenticationCredentialsAssetReference"];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  v2 = (void *)assetReferences_assetPaths;
  assetReferences_assetPaths = v1;
}

+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 hostName:(id)a5 port:(id)a6 path:(id)a7 authenticationCredentialsAssetReference:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = objc_opt_new();
  [v19 setDeclarationType:@"com.apple.configuration.account.caldav"];
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

  [v19 setPayloadPath:v15];
  [v19 setPayloadAuthenticationCredentialsAssetReference:v14];

  [v19 updateServerToken];
  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 hostName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.account.caldav"];
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
  v20[0] = &unk_2708C14E8;
  id v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BC880];
  v19[0] = v15;
  id v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BC898];
  v19[1] = v14;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v21[0] = v13;
  v20[1] = &unk_2708C1530;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BC8B0];
  v18[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BC8C8];
  v18[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v21[1] = v4;
  v20[2] = &unk_2708C1500;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BC8E0];
  v17[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BC8F8];
  v17[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v21[2] = v7;
  v20[3] = &unk_2708C1548;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BC910];
  v16[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BC928];
  v16[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v21[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelAccountCalDAVDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"VisibleName" forKeyPath:@"payloadVisibleName" isRequired:0 defaultValue:0 error:a5])
  {
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"HostName" forKeyPath:@"payloadHostName" isRequired:1 defaultValue:0 error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"Port" forKeyPath:@"payloadPort" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v13 = 0;
        if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Path" forKeyPath:@"payloadPath" isRequired:0 defaultValue:0 error:a5])
        {
          BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"AuthenticationCredentialsAssetReference" forKeyPath:@"payloadAuthenticationCredentialsAssetReference" isRequired:0 defaultValue:0 error:a5];
        }
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelAccountCalDAVDeclaration *)self payloadVisibleName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"VisibleName" value:v5 isRequired:0 defaultValue:0];

  id v6 = [(RMModelAccountCalDAVDeclaration *)self payloadHostName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"HostName" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMModelAccountCalDAVDeclaration *)self payloadPort];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"Port" value:v7 isRequired:0 defaultValue:0];

  v8 = [(RMModelAccountCalDAVDeclaration *)self payloadPath];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Path" value:v8 isRequired:0 defaultValue:0];

  v9 = [(RMModelAccountCalDAVDeclaration *)self payloadAuthenticationCredentialsAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"AuthenticationCredentialsAssetReference" value:v9 isRequired:0 defaultValue:0];

  v10 = (void *)[v4 copy];
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)RMModelAccountCalDAVDeclaration;
  v4 = [(RMModelDeclarationBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadVisibleName copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadHostName copy];
  v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadPort copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSString *)self->_payloadPath copy];
  v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(NSString *)self->_payloadAuthenticationCredentialsAssetReference copy];
  id v14 = (void *)v4[10];
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

- (NSString)payloadPath
{
  return self->_payloadPath;
}

- (void)setPayloadPath:(id)a3
{
}

- (NSString)payloadAuthenticationCredentialsAssetReference
{
  return self->_payloadAuthenticationCredentialsAssetReference;
}

- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadPath, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadHostName, 0);
  objc_storeStrong((id *)&self->_payloadVisibleName, 0);
}

@end