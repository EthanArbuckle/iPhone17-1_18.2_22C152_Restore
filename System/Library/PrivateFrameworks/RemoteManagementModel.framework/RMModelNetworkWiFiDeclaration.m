@interface RMModelNetworkWiFiDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 autoJoin:(id)a4 SSID:(id)a5 isHiddenNetwork:(id)a6 encryptionType:(id)a7 passwordAssetReference:(id)a8 certificateIdentityAssetReference:(id)a9 hotSpot:(id)a10 captiveBypass:(id)a11 qoSMarkingPolicy:(id)a12 setupModes:(id)a13 tlsCertificateRequired:(id)a14 proxy:(id)a15 disableAssociationMACRandomization:(id)a16 eapClientConfigurationUUID:(id)a17;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadSetupModes;
- (NSNumber)payloadAutoJoin;
- (NSNumber)payloadCaptiveBypass;
- (NSNumber)payloadDisableAssociationMACRandomization;
- (NSNumber)payloadIsHiddenNetwork;
- (NSNumber)payloadTLSCertificateRequired;
- (NSString)payloadCertificateIdentityAssetReference;
- (NSString)payloadEAPClientConfigurationUUID;
- (NSString)payloadEncryptionType;
- (NSString)payloadPasswordAssetReference;
- (NSString)payloadSSID;
- (RMModelNetworkWiFiDeclaration_HotSpot)payloadHotSpot;
- (RMModelNetworkWiFiDeclaration_Proxy)payloadProxy;
- (RMModelNetworkWiFiDeclaration_QoSMarkingPolicy)payloadQoSMarkingPolicy;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadAutoJoin:(id)a3;
- (void)setPayloadCaptiveBypass:(id)a3;
- (void)setPayloadCertificateIdentityAssetReference:(id)a3;
- (void)setPayloadDisableAssociationMACRandomization:(id)a3;
- (void)setPayloadEAPClientConfigurationUUID:(id)a3;
- (void)setPayloadEncryptionType:(id)a3;
- (void)setPayloadHotSpot:(id)a3;
- (void)setPayloadIsHiddenNetwork:(id)a3;
- (void)setPayloadPasswordAssetReference:(id)a3;
- (void)setPayloadProxy:(id)a3;
- (void)setPayloadQoSMarkingPolicy:(id)a3;
- (void)setPayloadSSID:(id)a3;
- (void)setPayloadSetupModes:(id)a3;
- (void)setPayloadTLSCertificateRequired:(id)a3;
@end

@implementation RMModelNetworkWiFiDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.wifi";
}

+ (NSSet)allowedPayloadKeys
{
  v6[14] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AutoJoin";
  v6[1] = @"SSID";
  v6[2] = @"IsHiddenNetwork";
  v6[3] = @"EncryptionType";
  v6[4] = @"PasswordAssetReference";
  v6[5] = @"CertificateIdentityAssetReference";
  v6[6] = @"HotSpot";
  v6[7] = @"CaptiveBypass";
  v6[8] = @"QoSMarkingPolicy";
  v6[9] = @"SetupModes";
  v6[10] = @"TLSCertificateRequired";
  v6[11] = @"Proxy";
  v6[12] = @"DisableAssociationMACRandomization";
  v6[13] = @"EAPClientConfigurationUUID";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:14];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BE4E8];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_9 != -1) {
    dispatch_once(&assetReferences_onceToken_9, &__block_literal_global_14);
  }
  uint64_t v3 = assetReferences_assetPaths_9;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __48__RMModelNetworkWiFiDeclaration_assetReferences__block_invoke()
{
  v5[3] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BE500 keyPath:@"$.payloadPasswordAssetReference"];
  v1 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BE518, @"$.payloadCertificateIdentityAssetReference", v0 keyPath];
  v5[1] = v1;
  v2 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BE530 keyPath:@"$.payloadProxy.payloadProxyAuthenticationCredentialsAssetReference"];
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  v4 = (void *)assetReferences_assetPaths_9;
  assetReferences_assetPaths_9 = v3;
}

+ (id)buildWithIdentifier:(id)a3 autoJoin:(id)a4 SSID:(id)a5 isHiddenNetwork:(id)a6 encryptionType:(id)a7 passwordAssetReference:(id)a8 certificateIdentityAssetReference:(id)a9 hotSpot:(id)a10 captiveBypass:(id)a11 qoSMarkingPolicy:(id)a12 setupModes:(id)a13 tlsCertificateRequired:(id)a14 proxy:(id)a15 disableAssociationMACRandomization:(id)a16 eapClientConfigurationUUID:(id)a17
{
  id v17 = a3;
  id v47 = a17;
  id v46 = a16;
  id v45 = a15;
  id v44 = a14;
  id v43 = a13;
  id v42 = a12;
  id v18 = a11;
  id v41 = a10;
  id v19 = a9;
  id v20 = a8;
  v21 = (__CFString *)a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  v25 = objc_opt_new();
  [v25 setDeclarationType:@"com.apple.configuration.network.wifi"];
  if (v17)
  {
    [v25 setDeclarationIdentifier:v17];
  }
  else
  {
    v26 = [MEMORY[0x263F08C38] UUID];
    v27 = [v26 UUIDString];
    [v25 setDeclarationIdentifier:v27];

    id v17 = 0;
  }
  if (v24) {
    id v28 = v24;
  }
  else {
    id v28 = (id)MEMORY[0x263EFFA88];
  }
  objc_msgSend(v25, "setPayloadAutoJoin:", v28, a8);

  [v25 setPayloadSSID:v23];
  v29 = (void *)MEMORY[0x263EFFA80];
  if (v22) {
    id v30 = v22;
  }
  else {
    id v30 = (id)MEMORY[0x263EFFA80];
  }
  [v25 setPayloadIsHiddenNetwork:v30];

  if (v21) {
    v31 = v21;
  }
  else {
    v31 = @"Any";
  }
  [v25 setPayloadEncryptionType:v31];

  [v25 setPayloadPasswordAssetReference:v20];
  [v25 setPayloadCertificateIdentityAssetReference:v19];

  [v25 setPayloadHotSpot:v41];
  if (v18) {
    id v32 = v18;
  }
  else {
    id v32 = v29;
  }
  [v25 setPayloadCaptiveBypass:v32];

  [v25 setPayloadQoSMarkingPolicy:v42];
  [v25 setPayloadSetupModes:v43];

  if (v44) {
    id v33 = v44;
  }
  else {
    id v33 = v29;
  }
  [v25 setPayloadTLSCertificateRequired:v33];

  [v25 setPayloadProxy:v45];
  if (v46) {
    id v34 = v46;
  }
  else {
    id v34 = v29;
  }
  [v25 setPayloadDisableAssociationMACRandomization:v34];

  [v25 setPayloadEAPClientConfigurationUUID:v47];
  [v25 updateServerToken];

  return v25;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.network.wifi"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerToken];

  return v4;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v35[6] = *MEMORY[0x263EF8340];
  v34[0] = &unk_2708C22B0;
  v27 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE548];
  v33[0] = v27;
  v26 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE560];
  v33[1] = v26;
  v25 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE578];
  v33[2] = v25;
  id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:3];
  v35[0] = v24;
  v34[1] = &unk_2708C22C8;
  id v23 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE590];
  v32[0] = v23;
  id v22 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE5A8];
  v32[1] = v22;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE5C0];
  v32[2] = v21;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
  v35[1] = v20;
  v34[2] = &unk_2708C22E0;
  id v19 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE5D8];
  v31[0] = v19;
  id v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE5F0];
  v31[1] = v18;
  id v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE608];
  v31[2] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
  v35[2] = v16;
  v34[3] = &unk_2708C22F8;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE620];
  v30[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE638];
  v30[1] = v14;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE650];
  v30[2] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
  v35[3] = v3;
  v34[4] = &unk_2708C2310;
  v4 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE668];
  v29[0] = v4;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE680];
  v29[1] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE698];
  v29[2] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
  v35[4] = v7;
  v34[5] = &unk_2708C2328;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE6B0];
  v28[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE6C8];
  v28[1] = v9;
  v10 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BE6E0];
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

  v12 = +[RMModelNetworkWiFiDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  id v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"AutoJoin" forKeyPath:@"payloadAutoJoin" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
  {
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"SSID" forKeyPath:@"payloadSSID" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"IsHiddenNetwork" forKeyPath:@"payloadIsHiddenNetwork" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
      {
        BOOL v14 = 0;
        if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"EncryptionType" forKeyPath:@"payloadEncryptionType" isRequired:0 defaultValue:@"Any" error:a5])
        {
          BOOL v14 = 0;
          if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"PasswordAssetReference" forKeyPath:@"payloadPasswordAssetReference" isRequired:0 defaultValue:0 error:a5])
          {
            BOOL v14 = 0;
            if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"CertificateIdentityAssetReference" forKeyPath:@"payloadCertificateIdentityAssetReference" isRequired:0 defaultValue:0 error:a5])
            {
              LOWORD(v16) = a4;
              BOOL v14 = 0;
              if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"HotSpot" forKeyPath:@"payloadHotSpot" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5])
              {
                BOOL v14 = 0;
                if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"CaptiveBypass" forKeyPath:@"payloadCaptiveBypass" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
                {
                  LOWORD(v17) = a4;
                  BOOL v14 = 0;
                  if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"QoSMarkingPolicy" forKeyPath:@"payloadQoSMarkingPolicy" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v17 error:a5])
                  {
                    BOOL v14 = 0;
                    if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"SetupModes" forKeyPath:@"payloadSetupModes" validator:&__block_literal_global_194 isRequired:0 defaultValue:0 error:a5])
                    {
                      BOOL v14 = 0;
                      if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"TLSCertificateRequired" forKeyPath:@"payloadTLSCertificateRequired" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
                      {
                        LOWORD(v18) = a4;
                        BOOL v14 = 0;
                        if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Proxy" forKeyPath:@"payloadProxy" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v18 error:a5])
                        {
                          BOOL v14 = 0;
                          if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"DisableAssociationMACRandomization" forKeyPath:@"payloadDisableAssociationMACRandomization" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
                          {
                            BOOL v14 = [(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"EAPClientConfigurationUUID" forKeyPath:@"payloadEAPClientConfigurationUUID" isRequired:0 defaultValue:0 error:a5];
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
    }
  }

  return v14;
}

uint64_t __83__RMModelNetworkWiFiDeclaration_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMModelNetworkWiFiDeclaration *)self payloadAutoJoin];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"AutoJoin" value:v6 isRequired:0 defaultValue:MEMORY[0x263EFFA88]];

  v7 = [(RMModelNetworkWiFiDeclaration *)self payloadSSID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"SSID" value:v7 isRequired:0 defaultValue:0];

  id v8 = [(RMModelNetworkWiFiDeclaration *)self payloadIsHiddenNetwork];
  uint64_t v9 = MEMORY[0x263EFFA80];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"IsHiddenNetwork" value:v8 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  v10 = [(RMModelNetworkWiFiDeclaration *)self payloadEncryptionType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"EncryptionType" value:v10 isRequired:0 defaultValue:@"Any"];

  v11 = [(RMModelNetworkWiFiDeclaration *)self payloadPasswordAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"PasswordAssetReference" value:v11 isRequired:0 defaultValue:0];

  v12 = [(RMModelNetworkWiFiDeclaration *)self payloadCertificateIdentityAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"CertificateIdentityAssetReference" value:v12 isRequired:0 defaultValue:0];

  id v13 = [(RMModelNetworkWiFiDeclaration *)self payloadHotSpot];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke;
  v27[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v28 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"HotSpot" value:v13 dictSerializer:v27 isRequired:0 defaultValue:0];

  BOOL v14 = [(RMModelNetworkWiFiDeclaration *)self payloadCaptiveBypass];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"CaptiveBypass" value:v14 isRequired:0 defaultValue:v9];

  v15 = [(RMModelNetworkWiFiDeclaration *)self payloadQoSMarkingPolicy];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke_2;
  v25[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v26 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"QoSMarkingPolicy" value:v15 dictSerializer:v25 isRequired:0 defaultValue:0];

  uint64_t v16 = [(RMModelNetworkWiFiDeclaration *)self payloadSetupModes];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"SetupModes" value:v16 itemSerializer:&__block_literal_global_213_0 isRequired:0 defaultValue:0];

  uint64_t v17 = [(RMModelNetworkWiFiDeclaration *)self payloadTLSCertificateRequired];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"TLSCertificateRequired" value:v17 isRequired:0 defaultValue:v9];

  uint64_t v18 = [(RMModelNetworkWiFiDeclaration *)self payloadProxy];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke_4;
  v23[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v24 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Proxy" value:v18 dictSerializer:v23 isRequired:0 defaultValue:0];

  id v19 = [(RMModelNetworkWiFiDeclaration *)self payloadDisableAssociationMACRandomization];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"DisableAssociationMACRandomization" value:v19 isRequired:0 defaultValue:v9];

  id v20 = [(RMModelNetworkWiFiDeclaration *)self payloadEAPClientConfigurationUUID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"EAPClientConfigurationUUID" value:v20 isRequired:0 defaultValue:0];

  v21 = (void *)[v5 copy];
  return v21;
}

uint64_t __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

id __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __58__RMModelNetworkWiFiDeclaration_serializePayloadWithType___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)RMModelNetworkWiFiDeclaration;
  v4 = [(RMModelDeclarationBase *)&v34 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAutoJoin copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadSSID copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadIsHiddenNetwork copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSString *)self->_payloadEncryptionType copy];
  v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(NSString *)self->_payloadPasswordAssetReference copy];
  BOOL v14 = (void *)v4[10];
  v4[10] = v13;

  uint64_t v15 = [(NSString *)self->_payloadCertificateIdentityAssetReference copy];
  uint64_t v16 = (void *)v4[11];
  v4[11] = v15;

  uint64_t v17 = [(RMModelNetworkWiFiDeclaration_HotSpot *)self->_payloadHotSpot copy];
  uint64_t v18 = (void *)v4[12];
  v4[12] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadCaptiveBypass copy];
  id v20 = (void *)v4[13];
  v4[13] = v19;

  uint64_t v21 = [(RMModelNetworkWiFiDeclaration_QoSMarkingPolicy *)self->_payloadQoSMarkingPolicy copy];
  id v22 = (void *)v4[14];
  v4[14] = v21;

  uint64_t v23 = [(NSArray *)self->_payloadSetupModes copy];
  signed __int16 v24 = (void *)v4[15];
  v4[15] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadTLSCertificateRequired copy];
  signed __int16 v26 = (void *)v4[16];
  v4[16] = v25;

  uint64_t v27 = [(RMModelNetworkWiFiDeclaration_Proxy *)self->_payloadProxy copy];
  signed __int16 v28 = (void *)v4[17];
  v4[17] = v27;

  uint64_t v29 = [(NSNumber *)self->_payloadDisableAssociationMACRandomization copy];
  id v30 = (void *)v4[18];
  v4[18] = v29;

  uint64_t v31 = [(NSString *)self->_payloadEAPClientConfigurationUUID copy];
  id v32 = (void *)v4[19];
  v4[19] = v31;

  return v4;
}

- (NSNumber)payloadAutoJoin
{
  return self->_payloadAutoJoin;
}

- (void)setPayloadAutoJoin:(id)a3
{
}

- (NSString)payloadSSID
{
  return self->_payloadSSID;
}

- (void)setPayloadSSID:(id)a3
{
}

- (NSNumber)payloadIsHiddenNetwork
{
  return self->_payloadIsHiddenNetwork;
}

- (void)setPayloadIsHiddenNetwork:(id)a3
{
}

- (NSString)payloadEncryptionType
{
  return self->_payloadEncryptionType;
}

- (void)setPayloadEncryptionType:(id)a3
{
}

- (NSString)payloadPasswordAssetReference
{
  return self->_payloadPasswordAssetReference;
}

- (void)setPayloadPasswordAssetReference:(id)a3
{
}

- (NSString)payloadCertificateIdentityAssetReference
{
  return self->_payloadCertificateIdentityAssetReference;
}

- (void)setPayloadCertificateIdentityAssetReference:(id)a3
{
}

- (RMModelNetworkWiFiDeclaration_HotSpot)payloadHotSpot
{
  return self->_payloadHotSpot;
}

- (void)setPayloadHotSpot:(id)a3
{
}

- (NSNumber)payloadCaptiveBypass
{
  return self->_payloadCaptiveBypass;
}

- (void)setPayloadCaptiveBypass:(id)a3
{
}

- (RMModelNetworkWiFiDeclaration_QoSMarkingPolicy)payloadQoSMarkingPolicy
{
  return self->_payloadQoSMarkingPolicy;
}

- (void)setPayloadQoSMarkingPolicy:(id)a3
{
}

- (NSArray)payloadSetupModes
{
  return self->_payloadSetupModes;
}

- (void)setPayloadSetupModes:(id)a3
{
}

- (NSNumber)payloadTLSCertificateRequired
{
  return self->_payloadTLSCertificateRequired;
}

- (void)setPayloadTLSCertificateRequired:(id)a3
{
}

- (RMModelNetworkWiFiDeclaration_Proxy)payloadProxy
{
  return self->_payloadProxy;
}

- (void)setPayloadProxy:(id)a3
{
}

- (NSNumber)payloadDisableAssociationMACRandomization
{
  return self->_payloadDisableAssociationMACRandomization;
}

- (void)setPayloadDisableAssociationMACRandomization:(id)a3
{
}

- (NSString)payloadEAPClientConfigurationUUID
{
  return self->_payloadEAPClientConfigurationUUID;
}

- (void)setPayloadEAPClientConfigurationUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEAPClientConfigurationUUID, 0);
  objc_storeStrong((id *)&self->_payloadDisableAssociationMACRandomization, 0);
  objc_storeStrong((id *)&self->_payloadProxy, 0);
  objc_storeStrong((id *)&self->_payloadTLSCertificateRequired, 0);
  objc_storeStrong((id *)&self->_payloadSetupModes, 0);
  objc_storeStrong((id *)&self->_payloadQoSMarkingPolicy, 0);
  objc_storeStrong((id *)&self->_payloadCaptiveBypass, 0);
  objc_storeStrong((id *)&self->_payloadHotSpot, 0);
  objc_storeStrong((id *)&self->_payloadCertificateIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadPasswordAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadEncryptionType, 0);
  objc_storeStrong((id *)&self->_payloadIsHiddenNetwork, 0);
  objc_storeStrong((id *)&self->_payloadSSID, 0);
  objc_storeStrong((id *)&self->_payloadAutoJoin, 0);
}

uint64_t __84__RMModelNetworkWiFiDeclaration_HotSpot_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __84__RMModelNetworkWiFiDeclaration_HotSpot_loadFromDictionary_serializationType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __84__RMModelNetworkWiFiDeclaration_HotSpot_loadFromDictionary_serializationType_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __59__RMModelNetworkWiFiDeclaration_HotSpot_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id __59__RMModelNetworkWiFiDeclaration_HotSpot_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id __59__RMModelNetworkWiFiDeclaration_HotSpot_serializeWithType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __93__RMModelNetworkWiFiDeclaration_QoSMarkingPolicy_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __68__RMModelNetworkWiFiDeclaration_QoSMarkingPolicy_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

@end