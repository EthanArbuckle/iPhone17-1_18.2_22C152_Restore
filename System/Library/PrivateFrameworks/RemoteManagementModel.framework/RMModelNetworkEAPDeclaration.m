@interface RMModelNetworkEAPDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 EAPUUID:(id)a4;
+ (id)buildWithIdentifier:(id)a3 EAPUUID:(id)a4 acceptEAPTypes:(id)a5 useOneTimePassword:(id)a6 userPasswordAssetReference:(id)a7 privateAccessToken:(id)a8 EAPFAST:(id)a9 TLS:(id)a10 outerIdentity:(id)a11 ttlsInnerAuthentication:(id)a12 systemModeCredentialsSource:(id)a13 extensibleSSOProvider:(id)a14 EAPSIMAKA:(id)a15;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadAcceptEAPTypes;
- (NSNumber)payloadUseOneTimePassword;
- (NSString)payloadEAPUUID;
- (NSString)payloadExtensibleSSOProvider;
- (NSString)payloadOuterIdentity;
- (NSString)payloadSystemModeCredentialsSource;
- (NSString)payloadTTLSInnerAuthentication;
- (NSString)payloadUserPasswordAssetReference;
- (RMModelNetworkEAPDeclaration_EAPFAST)payloadEAPFAST;
- (RMModelNetworkEAPDeclaration_EAPSIMAKA)payloadEAPSIMAKA;
- (RMModelNetworkEAPDeclaration_PrivateAccessToken)payloadPrivateAccessToken;
- (RMModelNetworkEAPDeclaration_TLS)payloadTLS;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadAcceptEAPTypes:(id)a3;
- (void)setPayloadEAPFAST:(id)a3;
- (void)setPayloadEAPSIMAKA:(id)a3;
- (void)setPayloadEAPUUID:(id)a3;
- (void)setPayloadExtensibleSSOProvider:(id)a3;
- (void)setPayloadOuterIdentity:(id)a3;
- (void)setPayloadPrivateAccessToken:(id)a3;
- (void)setPayloadSystemModeCredentialsSource:(id)a3;
- (void)setPayloadTLS:(id)a3;
- (void)setPayloadTTLSInnerAuthentication:(id)a3;
- (void)setPayloadUseOneTimePassword:(id)a3;
- (void)setPayloadUserPasswordAssetReference:(id)a3;
@end

@implementation RMModelNetworkEAPDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.eap";
}

+ (NSSet)allowedPayloadKeys
{
  v6[12] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"EAPUUID";
  v6[1] = @"AcceptEAPTypes";
  v6[2] = @"UseOneTimePassword";
  v6[3] = @"UserPasswordAssetReference";
  v6[4] = @"PrivateAccessToken";
  v6[5] = @"EAPFAST";
  v6[6] = @"TLS";
  v6[7] = @"OuterIdentity";
  v6[8] = @"TTLSInnerAuthentication";
  v6[9] = @"SystemModeCredentialsSource";
  v6[10] = @"ExtensibleSSOProvider";
  v6[11] = @"EAPSIMAKA";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:12];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BE2D8];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_8 != -1) {
    dispatch_once(&assetReferences_onceToken_8, &__block_literal_global_13);
  }
  uint64_t v3 = assetReferences_assetPaths_8;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __47__RMModelNetworkEAPDeclaration_assetReferences__block_invoke()
{
  v5[3] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BE2F0 keyPath:@"$.payloadUserPasswordAssetReference"];
  v1 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BE308, @"$.payloadTLS.payloadIdentityAssetReference", v0 keyPath];
  v5[1] = v1;
  v2 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BE320 keyPath:@"$.payloadTLS.payloadAnchorCertificateAssetReferences.*"];
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  v4 = (void *)assetReferences_assetPaths_8;
  assetReferences_assetPaths_8 = v3;
}

+ (id)buildWithIdentifier:(id)a3 EAPUUID:(id)a4 acceptEAPTypes:(id)a5 useOneTimePassword:(id)a6 userPasswordAssetReference:(id)a7 privateAccessToken:(id)a8 EAPFAST:(id)a9 TLS:(id)a10 outerIdentity:(id)a11 ttlsInnerAuthentication:(id)a12 systemModeCredentialsSource:(id)a13 extensibleSSOProvider:(id)a14 EAPSIMAKA:(id)a15
{
  id v43 = a3;
  id v42 = a15;
  id v41 = a14;
  id v40 = a13;
  v17 = (__CFString *)a12;
  id v39 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  v25 = v43;
  v26 = objc_opt_new();
  [v26 setDeclarationType:@"com.apple.configuration.network.eap"];
  if (v43)
  {
    [v26 setDeclarationIdentifier:v43];
  }
  else
  {
    v27 = [MEMORY[0x263F08C38] UUID];
    [v27 UUIDString];
    id v38 = v20;
    v28 = v17;
    id v29 = v19;
    v31 = id v30 = v18;
    [v26 setDeclarationIdentifier:v31];

    id v18 = v30;
    id v19 = v29;
    v17 = v28;
    id v20 = v38;

    v25 = 0;
  }
  objc_msgSend(v26, "setPayloadEAPUUID:", v24, a6);

  [v26 setPayloadAcceptEAPTypes:v23];
  if (v22) {
    id v32 = v22;
  }
  else {
    id v32 = (id)MEMORY[0x263EFFA80];
  }
  [v26 setPayloadUseOneTimePassword:v32];

  [v26 setPayloadUserPasswordAssetReference:v21];
  [v26 setPayloadPrivateAccessToken:v20];

  [v26 setPayloadEAPFAST:v19];
  [v26 setPayloadTLS:v18];

  [v26 setPayloadOuterIdentity:v39];
  if (v17) {
    v33 = v17;
  }
  else {
    v33 = @"MSCHAPv2";
  }
  [v26 setPayloadTTLSInnerAuthentication:v33];

  [v26 setPayloadSystemModeCredentialsSource:v40];
  [v26 setPayloadExtensibleSSOProvider:v41];

  [v26 setPayloadEAPSIMAKA:v42];
  [v26 updateServerToken];

  return v26;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 EAPUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.network.eap"];
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
  [v7 setPayloadEAPUUID:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v35[6] = *MEMORY[0x263EF8340];
  v34[0] = &unk_2708C21F0;
  v27 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE338];
  v33[0] = v27;
  v26 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE350];
  v33[1] = v26;
  v25 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE368];
  v33[2] = v25;
  id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:3];
  v35[0] = v24;
  v34[1] = &unk_2708C2208;
  id v23 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE380];
  v32[0] = v23;
  id v22 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE398];
  v32[1] = v22;
  id v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE3B0];
  v32[2] = v21;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
  v35[1] = v20;
  v34[2] = &unk_2708C2220;
  id v19 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE3C8];
  v31[0] = v19;
  id v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE3E0];
  v31[1] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE3F8];
  v31[2] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
  v35[2] = v16;
  v34[3] = &unk_2708C2238;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE410];
  v30[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE428];
  v30[1] = v14;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE440];
  v30[2] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
  v35[3] = v3;
  v34[4] = &unk_2708C2250;
  v4 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE458];
  v29[0] = v4;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE470];
  v29[1] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE488];
  v29[2] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
  v35[4] = v7;
  v34[5] = &unk_2708C2268;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE4A0];
  v28[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE4B8];
  v28[1] = v9;
  v10 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE4D0];
  v28[2] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  v35[5] = v11;
  id v13 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:6];

  return v13;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelNetworkEAPDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  id v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"EAPUUID" forKeyPath:@"payloadEAPUUID" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"AcceptEAPTypes" forKeyPath:@"payloadAcceptEAPTypes" validator:&__block_literal_global_174 isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"UseOneTimePassword" forKeyPath:@"payloadUseOneTimePassword" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
      {
        BOOL v14 = 0;
        if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"UserPasswordAssetReference" forKeyPath:@"payloadUserPasswordAssetReference" isRequired:0 defaultValue:0 error:a5])
        {
          LOWORD(v16) = a4;
          BOOL v14 = 0;
          if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"PrivateAccessToken" forKeyPath:@"payloadPrivateAccessToken" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5])
          {
            LOWORD(v17) = a4;
            BOOL v14 = 0;
            if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"EAPFAST" forKeyPath:@"payloadEAPFAST" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v17 error:a5])
            {
              LOWORD(v18) = a4;
              BOOL v14 = 0;
              if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"TLS" forKeyPath:@"payloadTLS" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v18 error:a5])
              {
                BOOL v14 = 0;
                if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"OuterIdentity" forKeyPath:@"payloadOuterIdentity" isRequired:0 defaultValue:0 error:a5])
                {
                  BOOL v14 = 0;
                  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"TTLSInnerAuthentication" forKeyPath:@"payloadTTLSInnerAuthentication" isRequired:0 defaultValue:@"MSCHAPv2" error:a5])
                  {
                    BOOL v14 = 0;
                    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"SystemModeCredentialsSource" forKeyPath:@"payloadSystemModeCredentialsSource" isRequired:0 defaultValue:0 error:a5])
                    {
                      BOOL v14 = 0;
                      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"ExtensibleSSOProvider" forKeyPath:@"payloadExtensibleSSOProvider" isRequired:0 defaultValue:0 error:a5])
                      {
                        LOWORD(v19) = a4;
                        BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"EAPSIMAKA" forKeyPath:@"payloadEAPSIMAKA" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v19 error:a5];
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __82__RMModelNetworkEAPDeclaration_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  id v6 = [(RMModelNetworkEAPDeclaration *)self payloadEAPUUID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"EAPUUID" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMModelNetworkEAPDeclaration *)self payloadAcceptEAPTypes];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"AcceptEAPTypes" value:v7 itemSerializer:&__block_literal_global_213 isRequired:0 defaultValue:0];

  id v8 = [(RMModelNetworkEAPDeclaration *)self payloadUseOneTimePassword];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"UseOneTimePassword" value:v8 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  v9 = [(RMModelNetworkEAPDeclaration *)self payloadUserPasswordAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"UserPasswordAssetReference" value:v9 isRequired:0 defaultValue:0];

  v10 = [(RMModelNetworkEAPDeclaration *)self payloadPrivateAccessToken];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_2;
  v26[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v27 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"PrivateAccessToken" value:v10 dictSerializer:v26 isRequired:0 defaultValue:0];

  v11 = [(RMModelNetworkEAPDeclaration *)self payloadEAPFAST];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_3;
  v24[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v25 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"EAPFAST" value:v11 dictSerializer:v24 isRequired:0 defaultValue:0];

  v12 = [(RMModelNetworkEAPDeclaration *)self payloadTLS];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_4;
  v22[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v23 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"TLS" value:v12 dictSerializer:v22 isRequired:0 defaultValue:0];

  id v13 = [(RMModelNetworkEAPDeclaration *)self payloadOuterIdentity];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"OuterIdentity" value:v13 isRequired:0 defaultValue:0];

  BOOL v14 = [(RMModelNetworkEAPDeclaration *)self payloadTTLSInnerAuthentication];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"TTLSInnerAuthentication" value:v14 isRequired:0 defaultValue:@"MSCHAPv2"];

  v15 = [(RMModelNetworkEAPDeclaration *)self payloadSystemModeCredentialsSource];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"SystemModeCredentialsSource" value:v15 isRequired:0 defaultValue:0];

  uint64_t v16 = [(RMModelNetworkEAPDeclaration *)self payloadExtensibleSSOProvider];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"ExtensibleSSOProvider" value:v16 isRequired:0 defaultValue:0];

  uint64_t v17 = [(RMModelNetworkEAPDeclaration *)self payloadEAPSIMAKA];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_5;
  v20[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v21 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"EAPSIMAKA" value:v17 dictSerializer:v20 isRequired:0 defaultValue:0];

  uint64_t v18 = (void *)[v5 copy];
  return v18;
}

id __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __57__RMModelNetworkEAPDeclaration_serializePayloadWithType___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v30.receiver = self;
  v30.super_class = (Class)RMModelNetworkEAPDeclaration;
  v4 = [(RMModelDeclarationBase *)&v30 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadEAPUUID copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadAcceptEAPTypes copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadUseOneTimePassword copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSString *)self->_payloadUserPasswordAssetReference copy];
  v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(RMModelNetworkEAPDeclaration_PrivateAccessToken *)self->_payloadPrivateAccessToken copy];
  BOOL v14 = (void *)v4[10];
  v4[10] = v13;

  uint64_t v15 = [(RMModelNetworkEAPDeclaration_EAPFAST *)self->_payloadEAPFAST copy];
  uint64_t v16 = (void *)v4[11];
  v4[11] = v15;

  uint64_t v17 = [(RMModelNetworkEAPDeclaration_TLS *)self->_payloadTLS copy];
  uint64_t v18 = (void *)v4[12];
  v4[12] = v17;

  uint64_t v19 = [(NSString *)self->_payloadOuterIdentity copy];
  id v20 = (void *)v4[13];
  v4[13] = v19;

  uint64_t v21 = [(NSString *)self->_payloadTTLSInnerAuthentication copy];
  id v22 = (void *)v4[14];
  v4[14] = v21;

  uint64_t v23 = [(NSString *)self->_payloadSystemModeCredentialsSource copy];
  id v24 = (void *)v4[15];
  v4[15] = v23;

  uint64_t v25 = [(NSString *)self->_payloadExtensibleSSOProvider copy];
  v26 = (void *)v4[16];
  v4[16] = v25;

  uint64_t v27 = [(RMModelNetworkEAPDeclaration_EAPSIMAKA *)self->_payloadEAPSIMAKA copy];
  v28 = (void *)v4[17];
  v4[17] = v27;

  return v4;
}

- (NSString)payloadEAPUUID
{
  return self->_payloadEAPUUID;
}

- (void)setPayloadEAPUUID:(id)a3
{
}

- (NSArray)payloadAcceptEAPTypes
{
  return self->_payloadAcceptEAPTypes;
}

- (void)setPayloadAcceptEAPTypes:(id)a3
{
}

- (NSNumber)payloadUseOneTimePassword
{
  return self->_payloadUseOneTimePassword;
}

- (void)setPayloadUseOneTimePassword:(id)a3
{
}

- (NSString)payloadUserPasswordAssetReference
{
  return self->_payloadUserPasswordAssetReference;
}

- (void)setPayloadUserPasswordAssetReference:(id)a3
{
}

- (RMModelNetworkEAPDeclaration_PrivateAccessToken)payloadPrivateAccessToken
{
  return self->_payloadPrivateAccessToken;
}

- (void)setPayloadPrivateAccessToken:(id)a3
{
}

- (RMModelNetworkEAPDeclaration_EAPFAST)payloadEAPFAST
{
  return self->_payloadEAPFAST;
}

- (void)setPayloadEAPFAST:(id)a3
{
}

- (RMModelNetworkEAPDeclaration_TLS)payloadTLS
{
  return self->_payloadTLS;
}

- (void)setPayloadTLS:(id)a3
{
}

- (NSString)payloadOuterIdentity
{
  return self->_payloadOuterIdentity;
}

- (void)setPayloadOuterIdentity:(id)a3
{
}

- (NSString)payloadTTLSInnerAuthentication
{
  return self->_payloadTTLSInnerAuthentication;
}

- (void)setPayloadTTLSInnerAuthentication:(id)a3
{
}

- (NSString)payloadSystemModeCredentialsSource
{
  return self->_payloadSystemModeCredentialsSource;
}

- (void)setPayloadSystemModeCredentialsSource:(id)a3
{
}

- (NSString)payloadExtensibleSSOProvider
{
  return self->_payloadExtensibleSSOProvider;
}

- (void)setPayloadExtensibleSSOProvider:(id)a3
{
}

- (RMModelNetworkEAPDeclaration_EAPSIMAKA)payloadEAPSIMAKA
{
  return self->_payloadEAPSIMAKA;
}

- (void)setPayloadEAPSIMAKA:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEAPSIMAKA, 0);
  objc_storeStrong((id *)&self->_payloadExtensibleSSOProvider, 0);
  objc_storeStrong((id *)&self->_payloadSystemModeCredentialsSource, 0);
  objc_storeStrong((id *)&self->_payloadTTLSInnerAuthentication, 0);
  objc_storeStrong((id *)&self->_payloadOuterIdentity, 0);
  objc_storeStrong((id *)&self->_payloadTLS, 0);
  objc_storeStrong((id *)&self->_payloadEAPFAST, 0);
  objc_storeStrong((id *)&self->_payloadPrivateAccessToken, 0);
  objc_storeStrong((id *)&self->_payloadUserPasswordAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadUseOneTimePassword, 0);
  objc_storeStrong((id *)&self->_payloadAcceptEAPTypes, 0);
  objc_storeStrong((id *)&self->_payloadEAPUUID, 0);
}

uint64_t __79__RMModelNetworkEAPDeclaration_TLS_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __79__RMModelNetworkEAPDeclaration_TLS_loadFromDictionary_serializationType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __54__RMModelNetworkEAPDeclaration_TLS_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id __54__RMModelNetworkEAPDeclaration_TLS_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __60__RMModelNetworkEAPDeclaration_EAPSIMAKA_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

@end