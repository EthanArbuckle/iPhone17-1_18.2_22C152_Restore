@interface RMModelWatchEnrollmentDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 enrollmentProfileURL:(id)a4;
+ (id)buildWithIdentifier:(id)a3 enrollmentProfileURL:(id)a4 anchorCertificateAssetReferences:(id)a5;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadAnchorCertificateAssetReferences;
- (NSString)payloadEnrollmentProfileURL;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadAnchorCertificateAssetReferences:(id)a3;
- (void)setPayloadEnrollmentProfileURL:(id)a3;
@end

@implementation RMModelWatchEnrollmentDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.watch.enrollment";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"EnrollmentProfileURL";
  v6[1] = @"AnchorCertificateAssetReferences";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708C1488];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_16 != -1) {
    dispatch_once(&assetReferences_onceToken_16, &__block_literal_global_28);
  }
  uint64_t v3 = assetReferences_assetPaths_16;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __52__RMModelWatchEnrollmentDeclaration_assetReferences__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708C14A0 keyPath:@"$.payloadAnchorCertificateAssetReferences.*"];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  v2 = (void *)assetReferences_assetPaths_16;
  assetReferences_assetPaths_16 = v1;
}

+ (id)buildWithIdentifier:(id)a3 enrollmentProfileURL:(id)a4 anchorCertificateAssetReferences:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.watch.enrollment"];
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
  [v10 setPayloadEnrollmentProfileURL:v9];

  [v10 setPayloadAnchorCertificateAssetReferences:v8];
  [v10 updateServerToken];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 enrollmentProfileURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.watch.enrollment"];
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
  [v7 setPayloadEnrollmentProfileURL:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = &unk_2708C3E10;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C14B8];
  v7[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C14D0];
  v7[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v9[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v5;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelWatchEnrollmentDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"EnrollmentProfileURL" forKeyPath:@"payloadEnrollmentProfileURL" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"AnchorCertificateAssetReferences" forKeyPath:@"payloadAnchorCertificateAssetReferences" validator:&__block_literal_global_43 isRequired:0 defaultValue:0 error:a5];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __87__RMModelWatchEnrollmentDeclaration_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelWatchEnrollmentDeclaration *)self payloadEnrollmentProfileURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"EnrollmentProfileURL" value:v5 isRequired:1 defaultValue:0];

  id v6 = [(RMModelWatchEnrollmentDeclaration *)self payloadAnchorCertificateAssetReferences];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"AnchorCertificateAssetReferences" value:v6 itemSerializer:&__block_literal_global_48 isRequired:0 defaultValue:0];

  id v7 = (void *)[v4 copy];
  return v7;
}

id __62__RMModelWatchEnrollmentDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelWatchEnrollmentDeclaration;
  v4 = [(RMModelDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadEnrollmentProfileURL copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadAnchorCertificateAssetReferences copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  return v4;
}

- (NSString)payloadEnrollmentProfileURL
{
  return self->_payloadEnrollmentProfileURL;
}

- (void)setPayloadEnrollmentProfileURL:(id)a3
{
}

- (NSArray)payloadAnchorCertificateAssetReferences
{
  return self->_payloadAnchorCertificateAssetReferences;
}

- (void)setPayloadAnchorCertificateAssetReferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAnchorCertificateAssetReferences, 0);
  objc_storeStrong((id *)&self->_payloadEnrollmentProfileURL, 0);
}

@end