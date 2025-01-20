@interface RMModelAccountMailDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 incomingServer:(id)a4 outgoingServer:(id)a5;
+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 userIdentityAssetReference:(id)a5 incomingServer:(id)a6 outgoingServer:(id)a7 SMIME:(id)a8;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadUserIdentityAssetReference;
- (NSString)payloadVisibleName;
- (RMModelAccountMailDeclaration_IncomingServer)payloadIncomingServer;
- (RMModelAccountMailDeclaration_OutgoingServer)payloadOutgoingServer;
- (RMModelAccountMailDeclaration_SMIME)payloadSMIME;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadIncomingServer:(id)a3;
- (void)setPayloadOutgoingServer:(id)a3;
- (void)setPayloadSMIME:(id)a3;
- (void)setPayloadUserIdentityAssetReference:(id)a3;
- (void)setPayloadVisibleName:(id)a3;
@end

@implementation RMModelAccountMailDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.mail";
}

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"VisibleName";
  v6[1] = @"UserIdentityAssetReference";
  v6[2] = @"IncomingServer";
  v6[3] = @"OutgoingServer";
  v6[4] = @"SMIME";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BCD60];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_4 != -1) {
    dispatch_once(&assetReferences_onceToken_4, &__block_literal_global_4);
  }
  uint64_t v3 = assetReferences_assetPaths_4;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __48__RMModelAccountMailDeclaration_assetReferences__block_invoke()
{
  v7[5] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCD78 keyPath:@"$.payloadUserIdentityAssetReference"];
  v1 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCD90, @"$.payloadIncomingServer.payloadAuthenticationCredentialsAssetReference", v0 keyPath];
  v7[1] = v1;
  v2 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCDA8 keyPath:@"$.payloadOutgoingServer.payloadAuthenticationCredentialsAssetReference"];
  v7[2] = v2;
  uint64_t v3 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCDC0 keyPath:@"$.payloadSMIME.payloadSigning.payloadIdentityAssetReference"];
  v7[3] = v3;
  v4 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCDD8 keyPath:@"$.payloadSMIME.payloadEncryption.payloadIdentityAssetReference"];
  v7[4] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:5];
  v6 = (void *)assetReferences_assetPaths_4;
  assetReferences_assetPaths_4 = v5;
}

+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 userIdentityAssetReference:(id)a5 incomingServer:(id)a6 outgoingServer:(id)a7 SMIME:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = objc_opt_new();
  [v19 setDeclarationType:@"com.apple.configuration.account.mail"];
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

  [v19 setPayloadUserIdentityAssetReference:v17];
  [v19 setPayloadIncomingServer:v16];

  [v19 setPayloadOutgoingServer:v15];
  [v19 setPayloadSMIME:v14];

  [v19 updateServerToken];
  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 incomingServer:(id)a4 outgoingServer:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.account.mail"];
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
  [v10 setPayloadIncomingServer:v9];

  [v10 setPayloadOutgoingServer:v8];
  [v10 updateServerToken];

  return v10;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v21[4] = *MEMORY[0x263EF8340];
  v20[0] = &unk_2708C1740;
  id v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCDF0];
  v19[0] = v15;
  id v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCE08];
  v19[1] = v14;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v21[0] = v13;
  v20[1] = &unk_2708C1788;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCE20];
  v18[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCE38];
  v18[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v21[1] = v4;
  v20[2] = &unk_2708C1758;
  uint64_t v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCE50];
  v17[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCE68];
  v17[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v21[2] = v7;
  v20[3] = &unk_2708C17A0;
  id v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCE80];
  v16[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCE98];
  v16[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v21[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelAccountMailDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  id v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"VisibleName" forKeyPath:@"payloadVisibleName" isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"UserIdentityAssetReference" forKeyPath:@"payloadUserIdentityAssetReference" isRequired:0 defaultValue:0 error:a5])
    {
      LOWORD(v16) = a4;
      if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, @"IncomingServer", @"payloadIncomingServer", objc_opt_class(), 1, 0, v16, a5)&& (LOWORD(v17) = a4, -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, @"OutgoingServer", @"payloadOutgoingServer", objc_opt_class(), 1,
              0,
              v17,
              a5)))
      {
        LOWORD(v18) = a4;
        BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"SMIME" forKeyPath:@"payloadSMIME" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v18 error:a5];
      }
      else
      {
        BOOL v14 = 0;
      }
    }
  }

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  uint64_t v5 = objc_opt_new();
  v6 = [(RMModelAccountMailDeclaration *)self payloadVisibleName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"VisibleName" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelAccountMailDeclaration *)self payloadUserIdentityAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"UserIdentityAssetReference" value:v7 isRequired:0 defaultValue:0];

  id v8 = [(RMModelAccountMailDeclaration *)self payloadIncomingServer];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __58__RMModelAccountMailDeclaration_serializePayloadWithType___block_invoke;
  v17[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v18 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"IncomingServer" value:v8 dictSerializer:v17 isRequired:1 defaultValue:0];

  id v9 = [(RMModelAccountMailDeclaration *)self payloadOutgoingServer];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__RMModelAccountMailDeclaration_serializePayloadWithType___block_invoke_2;
  v15[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v16 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"OutgoingServer" value:v9 dictSerializer:v15 isRequired:1 defaultValue:0];

  v10 = [(RMModelAccountMailDeclaration *)self payloadSMIME];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__RMModelAccountMailDeclaration_serializePayloadWithType___block_invoke_3;
  v13[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v14 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"SMIME" value:v10 dictSerializer:v13 isRequired:0 defaultValue:0];

  v11 = (void *)[v5 copy];
  return v11;
}

uint64_t __58__RMModelAccountMailDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __58__RMModelAccountMailDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __58__RMModelAccountMailDeclaration_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)RMModelAccountMailDeclaration;
  v4 = [(RMModelDeclarationBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadVisibleName copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadUserIdentityAssetReference copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(RMModelAccountMailDeclaration_IncomingServer *)self->_payloadIncomingServer copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(RMModelAccountMailDeclaration_OutgoingServer *)self->_payloadOutgoingServer copy];
  v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(RMModelAccountMailDeclaration_SMIME *)self->_payloadSMIME copy];
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

- (NSString)payloadUserIdentityAssetReference
{
  return self->_payloadUserIdentityAssetReference;
}

- (void)setPayloadUserIdentityAssetReference:(id)a3
{
}

- (RMModelAccountMailDeclaration_IncomingServer)payloadIncomingServer
{
  return self->_payloadIncomingServer;
}

- (void)setPayloadIncomingServer:(id)a3
{
}

- (RMModelAccountMailDeclaration_OutgoingServer)payloadOutgoingServer
{
  return self->_payloadOutgoingServer;
}

- (void)setPayloadOutgoingServer:(id)a3
{
}

- (RMModelAccountMailDeclaration_SMIME)payloadSMIME
{
  return self->_payloadSMIME;
}

- (void)setPayloadSMIME:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSMIME, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingServer, 0);
  objc_storeStrong((id *)&self->_payloadIncomingServer, 0);
  objc_storeStrong((id *)&self->_payloadUserIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadVisibleName, 0);
}

uint64_t __57__RMModelAccountMailDeclaration_SMIME_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __57__RMModelAccountMailDeclaration_SMIME_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

@end