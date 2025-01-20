@interface RMModelScreenSharingConnectionDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 connectionUUID:(id)a4 displayName:(id)a5 hostName:(id)a6 displayConfiguration:(id)a7;
+ (id)buildWithIdentifier:(id)a3 connectionUUID:(id)a4 displayName:(id)a5 hostName:(id)a6 port:(id)a7 displayConfiguration:(id)a8 authenticationCredentialsAssetReference:(id)a9;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadPort;
- (NSString)payloadAuthenticationCredentialsAssetReference;
- (NSString)payloadConnectionUUID;
- (NSString)payloadDisplayName;
- (NSString)payloadHostName;
- (RMModelScreenSharingConnectionDeclaration_DisplayConfiguration)payloadDisplayConfiguration;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3;
- (void)setPayloadConnectionUUID:(id)a3;
- (void)setPayloadDisplayConfiguration:(id)a3;
- (void)setPayloadDisplayName:(id)a3;
- (void)setPayloadHostName:(id)a3;
- (void)setPayloadPort:(id)a3;
@end

@implementation RMModelScreenSharingConnectionDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.screensharing.connection";
}

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ConnectionUUID";
  v6[1] = @"DisplayName";
  v6[2] = @"HostName";
  v6[3] = @"Port";
  v6[4] = @"DisplayConfiguration";
  v6[5] = @"AuthenticationCredentialsAssetReference";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BE7B8];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_10 != -1) {
    dispatch_once(&assetReferences_onceToken_10, &__block_literal_global_16);
  }
  uint64_t v3 = assetReferences_assetPaths_10;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __60__RMModelScreenSharingConnectionDeclaration_assetReferences__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BE7D0 keyPath:@"$.payloadAuthenticationCredentialsAssetReference"];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  v2 = (void *)assetReferences_assetPaths_10;
  assetReferences_assetPaths_10 = v1;
}

+ (id)buildWithIdentifier:(id)a3 connectionUUID:(id)a4 displayName:(id)a5 hostName:(id)a6 port:(id)a7 displayConfiguration:(id)a8 authenticationCredentialsAssetReference:(id)a9
{
  id v14 = a3;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = objc_opt_new();
  [v21 setDeclarationType:@"com.apple.configuration.screensharing.connection"];
  if (v14)
  {
    [v21 setDeclarationIdentifier:v14];
  }
  else
  {
    v22 = [MEMORY[0x263F08C38] UUID];
    v23 = [v22 UUIDString];
    [v21 setDeclarationIdentifier:v23];
  }
  [v21 setPayloadConnectionUUID:v20];

  [v21 setPayloadDisplayName:v19];
  [v21 setPayloadHostName:v18];

  [v21 setPayloadPort:v17];
  [v21 setPayloadDisplayConfiguration:v16];

  [v21 setPayloadAuthenticationCredentialsAssetReference:v15];
  [v21 updateServerToken];

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 connectionUUID:(id)a4 displayName:(id)a5 hostName:(id)a6 displayConfiguration:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.screensharing.connection"];
  if (v11)
  {
    [v16 setDeclarationIdentifier:v11];
  }
  else
  {
    id v17 = [MEMORY[0x263F08C38] UUID];
    id v18 = [v17 UUIDString];
    [v16 setDeclarationIdentifier:v18];
  }
  [v16 setPayloadConnectionUUID:v15];

  [v16 setPayloadDisplayName:v14];
  [v16 setPayloadHostName:v13];

  [v16 setPayloadDisplayConfiguration:v12];
  [v16 updateServerToken];

  return v16;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v9[1] = *MEMORY[0x263EF8340];
  v8 = &unk_2708C2478;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE7E8];
  v7[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE800];
  v7[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v9[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v5;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  id v11 = [v9 setWithArray:v10];

  id v12 = +[RMModelScreenSharingConnectionDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  id v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if (!-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"ConnectionUUID", @"payloadConnectionUUID", 1, 0, a5)|| !-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"DisplayName", @"payloadDisplayName", 1, 0, a5)|| !-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
          "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
          v8,
          @"HostName",
          @"payloadHostName",
          1,
          0,
          a5))
  {
    goto LABEL_7;
  }
  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"Port" forKeyPath:@"payloadPort" isRequired:0 defaultValue:0 error:a5])
  {
    LOWORD(v16) = a4;
    if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"DisplayConfiguration" forKeyPath:@"payloadDisplayConfiguration" classType:objc_opt_class() isRequired:1 defaultValue:0 serializationType:v16 error:a5])
    {
      BOOL v14 = [(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"AuthenticationCredentialsAssetReference" forKeyPath:@"payloadAuthenticationCredentialsAssetReference" isRequired:0 defaultValue:0 error:a5];
      goto LABEL_8;
    }
LABEL_7:
    BOOL v14 = 0;
  }
LABEL_8:

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMModelScreenSharingConnectionDeclaration *)self payloadConnectionUUID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"ConnectionUUID" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMModelScreenSharingConnectionDeclaration *)self payloadDisplayName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"DisplayName" value:v7 isRequired:1 defaultValue:0];

  id v8 = [(RMModelScreenSharingConnectionDeclaration *)self payloadHostName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"HostName" value:v8 isRequired:1 defaultValue:0];

  v9 = [(RMModelScreenSharingConnectionDeclaration *)self payloadPort];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"Port" value:v9 isRequired:0 defaultValue:0];

  v10 = [(RMModelScreenSharingConnectionDeclaration *)self payloadDisplayConfiguration];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__RMModelScreenSharingConnectionDeclaration_serializePayloadWithType___block_invoke;
  v14[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v15 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"DisplayConfiguration" value:v10 dictSerializer:v14 isRequired:1 defaultValue:0];

  id v11 = [(RMModelScreenSharingConnectionDeclaration *)self payloadAuthenticationCredentialsAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"AuthenticationCredentialsAssetReference" value:v11 isRequired:0 defaultValue:0];

  id v12 = (void *)[v5 copy];
  return v12;
}

uint64_t __70__RMModelScreenSharingConnectionDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)RMModelScreenSharingConnectionDeclaration;
  v4 = [(RMModelDeclarationBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadConnectionUUID copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadDisplayName copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_payloadHostName copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadPort copy];
  id v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(RMModelScreenSharingConnectionDeclaration_DisplayConfiguration *)self->_payloadDisplayConfiguration copy];
  BOOL v14 = (void *)v4[10];
  v4[10] = v13;

  uint64_t v15 = [(NSString *)self->_payloadAuthenticationCredentialsAssetReference copy];
  uint64_t v16 = (void *)v4[11];
  v4[11] = v15;

  return v4;
}

- (NSString)payloadConnectionUUID
{
  return self->_payloadConnectionUUID;
}

- (void)setPayloadConnectionUUID:(id)a3
{
}

- (NSString)payloadDisplayName
{
  return self->_payloadDisplayName;
}

- (void)setPayloadDisplayName:(id)a3
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

- (RMModelScreenSharingConnectionDeclaration_DisplayConfiguration)payloadDisplayConfiguration
{
  return self->_payloadDisplayConfiguration;
}

- (void)setPayloadDisplayConfiguration:(id)a3
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
  objc_storeStrong((id *)&self->_payloadDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadHostName, 0);
  objc_storeStrong((id *)&self->_payloadDisplayName, 0);
  objc_storeStrong((id *)&self->_payloadConnectionUUID, 0);
}

@end