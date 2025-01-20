@interface RMModelSecurityPasskeyAttestationDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 attestationIdentityAssetReference:(id)a4 relyingParties:(id)a5;
+ (id)buildWithIdentifier:(id)a3 attestationIdentityAssetReference:(id)a4 attestationIdentityKeyIsExtractable:(id)a5 relyingParties:(id)a6;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadRelyingParties;
- (NSNumber)payloadAttestationIdentityKeyIsExtractable;
- (NSString)payloadAttestationIdentityAssetReference;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadAttestationIdentityAssetReference:(id)a3;
- (void)setPayloadAttestationIdentityKeyIsExtractable:(id)a3;
- (void)setPayloadRelyingParties:(id)a3;
@end

@implementation RMModelSecurityPasskeyAttestationDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.security.passkey.attestation";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AttestationIdentityAssetReference";
  v6[1] = @"AttestationIdentityKeyIsExtractable";
  v6[2] = @"RelyingParties";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BEB18];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_13 != -1) {
    dispatch_once(&assetReferences_onceToken_13, &__block_literal_global_20);
  }
  uint64_t v3 = assetReferences_assetPaths_13;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __63__RMModelSecurityPasskeyAttestationDeclaration_assetReferences__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BEB30 keyPath:@"$.payloadAttestationIdentityAssetReference"];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  v2 = (void *)assetReferences_assetPaths_13;
  assetReferences_assetPaths_13 = v1;
}

+ (id)buildWithIdentifier:(id)a3 attestationIdentityAssetReference:(id)a4 attestationIdentityKeyIsExtractable:(id)a5 relyingParties:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.security.passkey.attestation"];
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
  [v13 setPayloadAttestationIdentityAssetReference:v12];

  if (v11) {
    id v16 = v11;
  }
  else {
    id v16 = (id)MEMORY[0x263EFFA88];
  }
  [v13 setPayloadAttestationIdentityKeyIsExtractable:v16];

  [v13 setPayloadRelyingParties:v10];
  [v13 updateServerToken];

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 attestationIdentityAssetReference:(id)a4 relyingParties:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.security.passkey.attestation"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    id v11 = [MEMORY[0x263F08C38] UUID];
    id v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadAttestationIdentityAssetReference:v9];

  [v10 setPayloadRelyingParties:v8];
  [v10 updateServerToken];

  return v10;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = &unk_2708C26B8;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEB48];
  v11[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEB60];
  v11[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  v12[1] = &unk_2708C26E8;
  v13[0] = v4;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEB78];
  v10[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEB90];
  v10[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  v13[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v8;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelSecurityPasskeyAttestationDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"AttestationIdentityAssetReference" forKeyPath:@"payloadAttestationIdentityAssetReference" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"AttestationIdentityKeyIsExtractable" forKeyPath:@"payloadAttestationIdentityKeyIsExtractable" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"RelyingParties" forKeyPath:@"payloadRelyingParties" validator:&__block_literal_global_63 isRequired:1 defaultValue:0 error:a5];
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __98__RMModelSecurityPasskeyAttestationDeclaration_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelSecurityPasskeyAttestationDeclaration *)self payloadAttestationIdentityAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"AttestationIdentityAssetReference" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelSecurityPasskeyAttestationDeclaration *)self payloadAttestationIdentityKeyIsExtractable];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"AttestationIdentityKeyIsExtractable" value:v6 isRequired:0 defaultValue:MEMORY[0x263EFFA88]];

  id v7 = [(RMModelSecurityPasskeyAttestationDeclaration *)self payloadRelyingParties];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"RelyingParties" value:v7 itemSerializer:&__block_literal_global_68 isRequired:1 defaultValue:0];

  id v8 = (void *)[v4 copy];
  return v8;
}

id __73__RMModelSecurityPasskeyAttestationDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelSecurityPasskeyAttestationDeclaration;
  v4 = [(RMModelDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadAttestationIdentityAssetReference copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAttestationIdentityKeyIsExtractable copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadRelyingParties copy];
  id v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)payloadAttestationIdentityAssetReference
{
  return self->_payloadAttestationIdentityAssetReference;
}

- (void)setPayloadAttestationIdentityAssetReference:(id)a3
{
}

- (NSNumber)payloadAttestationIdentityKeyIsExtractable
{
  return self->_payloadAttestationIdentityKeyIsExtractable;
}

- (void)setPayloadAttestationIdentityKeyIsExtractable:(id)a3
{
}

- (NSArray)payloadRelyingParties
{
  return self->_payloadRelyingParties;
}

- (void)setPayloadRelyingParties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadRelyingParties, 0);
  objc_storeStrong((id *)&self->_payloadAttestationIdentityKeyIsExtractable, 0);
  objc_storeStrong((id *)&self->_payloadAttestationIdentityAssetReference, 0);
}

@end