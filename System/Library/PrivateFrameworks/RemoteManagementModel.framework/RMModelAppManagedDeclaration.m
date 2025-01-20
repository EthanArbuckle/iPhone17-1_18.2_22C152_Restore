@interface RMModelAppManagedDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 appStoreID:(id)a4 bundleID:(id)a5 manifestURL:(id)a6 installBehavior:(id)a7 includeInBackup:(id)a8 attributes:(id)a9 appConfigAssetReference:(id)a10 passwordAppConfigs:(id)a11 identityAppConfigs:(id)a12 certificateAppConfigs:(id)a13;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadCertificateAppConfigs;
- (NSArray)payloadIdentityAppConfigs;
- (NSArray)payloadPasswordAppConfigs;
- (NSNumber)payloadIncludeInBackup;
- (NSString)payloadAppConfigAssetReference;
- (NSString)payloadAppStoreID;
- (NSString)payloadBundleID;
- (NSString)payloadManifestURL;
- (RMModelAppManagedDeclaration_Attributes)payloadAttributes;
- (RMModelAppManagedDeclaration_InstallBehavior)payloadInstallBehavior;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadAppConfigAssetReference:(id)a3;
- (void)setPayloadAppStoreID:(id)a3;
- (void)setPayloadAttributes:(id)a3;
- (void)setPayloadBundleID:(id)a3;
- (void)setPayloadCertificateAppConfigs:(id)a3;
- (void)setPayloadIdentityAppConfigs:(id)a3;
- (void)setPayloadIncludeInBackup:(id)a3;
- (void)setPayloadInstallBehavior:(id)a3;
- (void)setPayloadManifestURL:(id)a3;
- (void)setPayloadPasswordAppConfigs:(id)a3;
@end

@implementation RMModelAppManagedDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.app.managed";
}

+ (NSSet)allowedPayloadKeys
{
  v6[10] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AppStoreID";
  v6[1] = @"BundleID";
  v6[2] = @"ManifestURL";
  v6[3] = @"InstallBehavior";
  v6[4] = @"IncludeInBackup";
  v6[5] = @"Attributes";
  v6[6] = @"AppConfigAssetReference";
  v6[7] = @"PasswordAppConfigs";
  v6[8] = @"IdentityAppConfigs";
  v6[9] = @"CertificateAppConfigs";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:10];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BD0C0];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_6 != -1) {
    dispatch_once(&assetReferences_onceToken_6, &__block_literal_global_8);
  }
  uint64_t v3 = assetReferences_assetPaths_6;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __47__RMModelAppManagedDeclaration_assetReferences__block_invoke()
{
  v6[4] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BD0D8 keyPath:@"$.payloadAppConfigAssetReference"];
  v6[0] = v0;
  v1 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BD0F0 keyPath:@"$.payloadPasswordAppConfigs.*.payloadAssetReference"];
  v6[1] = v1;
  v2 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BD108 keyPath:@"$.payloadIdentityAppConfigs.*.payloadAssetReference"];
  v6[2] = v2;
  uint64_t v3 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BD120 keyPath:@"$.payloadCertificateAppConfigs.*.payloadAssetReference"];
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v5 = (void *)assetReferences_assetPaths_6;
  assetReferences_assetPaths_6 = v4;
}

+ (id)buildWithIdentifier:(id)a3 appStoreID:(id)a4 bundleID:(id)a5 manifestURL:(id)a6 installBehavior:(id)a7 includeInBackup:(id)a8 attributes:(id)a9 appConfigAssetReference:(id)a10 passwordAppConfigs:(id)a11 identityAppConfigs:(id)a12 certificateAppConfigs:(id)a13
{
  id v30 = a3;
  id v34 = a13;
  id v33 = a12;
  id v32 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  v24 = v30;
  v25 = objc_opt_new();
  [v25 setDeclarationType:@"com.apple.configuration.app.managed"];
  if (v30)
  {
    [v25 setDeclarationIdentifier:v30];
  }
  else
  {
    v26 = [MEMORY[0x263F08C38] UUID];
    v27 = [v26 UUIDString];
    [v25 setDeclarationIdentifier:v27];

    v24 = 0;
  }
  [v25 setPayloadAppStoreID:v23];

  [v25 setPayloadBundleID:v22];
  [v25 setPayloadManifestURL:v21];

  [v25 setPayloadInstallBehavior:v20];
  if (v19) {
    id v28 = v19;
  }
  else {
    id v28 = (id)MEMORY[0x263EFFA88];
  }
  [v25 setPayloadIncludeInBackup:v28];

  [v25 setPayloadAttributes:v18];
  [v25 setPayloadAppConfigAssetReference:v17];

  [v25 setPayloadPasswordAppConfigs:v32];
  [v25 setPayloadIdentityAppConfigs:v33];

  [v25 setPayloadCertificateAppConfigs:v34];
  [v25 updateServerToken];

  return v25;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.app.managed"];
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
  v18[3] = *MEMORY[0x263EF8340];
  v17[0] = &unk_2708C18C0;
  v13 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD138];
  v16[0] = v13;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD150];
  v16[1] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD168];
  v16[2] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  v18[0] = v4;
  v17[1] = &unk_2708C18D8;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD180];
  v15[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD198];
  v15[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v18[1] = v7;
  v17[2] = &unk_2708C1908;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD1B0];
  v14[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD1C8];
  v14[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v18[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelAppManagedDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"AppStoreID" forKeyPath:@"payloadAppStoreID" isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"BundleID" forKeyPath:@"payloadBundleID" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"ManifestURL" forKeyPath:@"payloadManifestURL" isRequired:0 defaultValue:0 error:a5])
      {
        LOWORD(v16) = a4;
        BOOL v14 = 0;
        if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"InstallBehavior" forKeyPath:@"payloadInstallBehavior" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5])
        {
          BOOL v14 = 0;
          if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"IncludeInBackup" forKeyPath:@"payloadIncludeInBackup" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
          {
            LOWORD(v17) = a4;
            BOOL v14 = 0;
            if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Attributes" forKeyPath:@"payloadAttributes" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v17 error:a5])
            {
              BOOL v14 = 0;
              if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"AppConfigAssetReference" forKeyPath:@"payloadAppConfigAssetReference" isRequired:0 defaultValue:0 error:a5])
              {
                LOWORD(v18) = a4;
                BOOL v14 = 0;
                if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"PasswordAppConfigs" forKeyPath:@"payloadPasswordAppConfigs" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 serializationType:v18 error:a5])
                {
                  LOWORD(v19) = a4;
                  BOOL v14 = 0;
                  if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"IdentityAppConfigs" forKeyPath:@"payloadIdentityAppConfigs" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 serializationType:v19 error:a5])
                  {
                    LOWORD(v20) = a4;
                    BOOL v14 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"CertificateAppConfigs" forKeyPath:@"payloadCertificateAppConfigs" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 serializationType:v20 error:a5];
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

- (id)serializePayloadWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMModelAppManagedDeclaration *)self payloadAppStoreID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"AppStoreID" value:v6 isRequired:0 defaultValue:0];

  v7 = [(RMModelAppManagedDeclaration *)self payloadBundleID];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"BundleID" value:v7 isRequired:0 defaultValue:0];

  id v8 = [(RMModelAppManagedDeclaration *)self payloadManifestURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"ManifestURL" value:v8 isRequired:0 defaultValue:0];

  v9 = [(RMModelAppManagedDeclaration *)self payloadInstallBehavior];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke;
  v26[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v27 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"InstallBehavior" value:v9 dictSerializer:v26 isRequired:0 defaultValue:0];

  v10 = [(RMModelAppManagedDeclaration *)self payloadIncludeInBackup];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"IncludeInBackup" value:v10 isRequired:0 defaultValue:MEMORY[0x263EFFA88]];

  v11 = [(RMModelAppManagedDeclaration *)self payloadAttributes];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_2;
  v24[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v25 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Attributes" value:v11 dictSerializer:v24 isRequired:0 defaultValue:0];

  v12 = [(RMModelAppManagedDeclaration *)self payloadAppConfigAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"AppConfigAssetReference" value:v12 isRequired:0 defaultValue:0];

  v13 = [(RMModelAppManagedDeclaration *)self payloadPasswordAppConfigs];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_3;
  v22[3] = &__block_descriptor_34_e72___NSDictionary_16__0__RMModelAppManagedDeclaration_AppCredentialConfig_8l;
  signed __int16 v23 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"PasswordAppConfigs" value:v13 itemSerializer:v22 isRequired:0 defaultValue:0];

  BOOL v14 = [(RMModelAppManagedDeclaration *)self payloadIdentityAppConfigs];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_4;
  v20[3] = &__block_descriptor_34_e72___NSDictionary_16__0__RMModelAppManagedDeclaration_AppCredentialConfig_8l;
  signed __int16 v21 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"IdentityAppConfigs" value:v14 itemSerializer:v20 isRequired:0 defaultValue:0];

  v15 = [(RMModelAppManagedDeclaration *)self payloadCertificateAppConfigs];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_5;
  v18[3] = &__block_descriptor_34_e72___NSDictionary_16__0__RMModelAppManagedDeclaration_AppCredentialConfig_8l;
  signed __int16 v19 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"CertificateAppConfigs" value:v15 itemSerializer:v18 isRequired:0 defaultValue:0];

  uint64_t v16 = (void *)[v5 copy];
  return v16;
}

uint64_t __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __57__RMModelAppManagedDeclaration_serializePayloadWithType___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)RMModelAppManagedDeclaration;
  uint64_t v4 = [(RMModelDeclarationBase *)&v26 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadAppStoreID copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadBundleID copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_payloadManifestURL copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(RMModelAppManagedDeclaration_InstallBehavior *)self->_payloadInstallBehavior copy];
  v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadIncludeInBackup copy];
  BOOL v14 = (void *)v4[10];
  v4[10] = v13;

  uint64_t v15 = [(RMModelAppManagedDeclaration_Attributes *)self->_payloadAttributes copy];
  uint64_t v16 = (void *)v4[11];
  v4[11] = v15;

  uint64_t v17 = [(NSString *)self->_payloadAppConfigAssetReference copy];
  uint64_t v18 = (void *)v4[12];
  v4[12] = v17;

  uint64_t v19 = [(NSArray *)self->_payloadPasswordAppConfigs copy];
  uint64_t v20 = (void *)v4[13];
  v4[13] = v19;

  uint64_t v21 = [(NSArray *)self->_payloadIdentityAppConfigs copy];
  id v22 = (void *)v4[14];
  v4[14] = v21;

  uint64_t v23 = [(NSArray *)self->_payloadCertificateAppConfigs copy];
  v24 = (void *)v4[15];
  v4[15] = v23;

  return v4;
}

- (NSString)payloadAppStoreID
{
  return self->_payloadAppStoreID;
}

- (void)setPayloadAppStoreID:(id)a3
{
}

- (NSString)payloadBundleID
{
  return self->_payloadBundleID;
}

- (void)setPayloadBundleID:(id)a3
{
}

- (NSString)payloadManifestURL
{
  return self->_payloadManifestURL;
}

- (void)setPayloadManifestURL:(id)a3
{
}

- (RMModelAppManagedDeclaration_InstallBehavior)payloadInstallBehavior
{
  return self->_payloadInstallBehavior;
}

- (void)setPayloadInstallBehavior:(id)a3
{
}

- (NSNumber)payloadIncludeInBackup
{
  return self->_payloadIncludeInBackup;
}

- (void)setPayloadIncludeInBackup:(id)a3
{
}

- (RMModelAppManagedDeclaration_Attributes)payloadAttributes
{
  return self->_payloadAttributes;
}

- (void)setPayloadAttributes:(id)a3
{
}

- (NSString)payloadAppConfigAssetReference
{
  return self->_payloadAppConfigAssetReference;
}

- (void)setPayloadAppConfigAssetReference:(id)a3
{
}

- (NSArray)payloadPasswordAppConfigs
{
  return self->_payloadPasswordAppConfigs;
}

- (void)setPayloadPasswordAppConfigs:(id)a3
{
}

- (NSArray)payloadIdentityAppConfigs
{
  return self->_payloadIdentityAppConfigs;
}

- (void)setPayloadIdentityAppConfigs:(id)a3
{
}

- (NSArray)payloadCertificateAppConfigs
{
  return self->_payloadCertificateAppConfigs;
}

- (void)setPayloadCertificateAppConfigs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCertificateAppConfigs, 0);
  objc_storeStrong((id *)&self->_payloadIdentityAppConfigs, 0);
  objc_storeStrong((id *)&self->_payloadPasswordAppConfigs, 0);
  objc_storeStrong((id *)&self->_payloadAppConfigAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadAttributes, 0);
  objc_storeStrong((id *)&self->_payloadIncludeInBackup, 0);
  objc_storeStrong((id *)&self->_payloadInstallBehavior, 0);
  objc_storeStrong((id *)&self->_payloadManifestURL, 0);
  objc_storeStrong((id *)&self->_payloadBundleID, 0);
  objc_storeStrong((id *)&self->_payloadAppStoreID, 0);
}

uint64_t __66__RMModelAppManagedDeclaration_InstallBehavior_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __86__RMModelAppManagedDeclaration_Attributes_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __61__RMModelAppManagedDeclaration_Attributes_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

@end