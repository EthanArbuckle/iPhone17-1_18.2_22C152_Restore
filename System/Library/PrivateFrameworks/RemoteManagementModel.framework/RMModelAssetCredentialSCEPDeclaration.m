@interface RMModelAssetCredentialSCEPDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 reference:(id)a4;
+ (id)buildWithIdentifier:(id)a3 reference:(id)a4 authentication:(id)a5 accessible:(id)a6;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadAccessible;
- (RMModelAssetBaseAuthentication)payloadAuthentication;
- (RMModelAssetBaseReference)payloadReference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadAccessible:(id)a3;
- (void)setPayloadAuthentication:(id)a3;
- (void)setPayloadReference:(id)a3;
@end

@implementation RMModelAssetCredentialSCEPDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.asset.credential.scep";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Reference";
  v6[1] = @"Authentication";
  v6[2] = @"Accessible";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 reference:(id)a4 authentication:(id)a5 accessible:(id)a6
{
  id v9 = a3;
  v10 = (__CFString *)a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.asset.credential.scep"];
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
  [v13 setPayloadReference:v12];

  [v13 setPayloadAuthentication:v11];
  if (v10) {
    v16 = v10;
  }
  else {
    v16 = @"Default";
  }
  [v13 setPayloadAccessible:v16];

  [v13 updateServerToken];
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 reference:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.asset.credential.scep"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadReference:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)supportedOS
{
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = &unk_2708C1B90;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD660];
  v27[0] = v21;
  v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD678];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C1BA8;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD690];
  v26[0] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD6A8];
  v26[1] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C1BC0;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD6C0];
  v25[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD6D8];
  v25[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C1BD8;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD6F0];
  v24[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD708];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C1BF0;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD720];
  v23[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD738];
  v23[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C1C08;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD750];
  v22[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BD768];
  v22[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v29[5] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  id v11 = [v9 setWithArray:v10];

  id v12 = +[RMModelAssetCredentialSCEPDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  LOWORD(v16) = a4;
  if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Reference" forKeyPath:@"payloadReference" classType:objc_opt_class() isRequired:1 defaultValue:0 serializationType:v16 error:a5])
  {
    LOWORD(v17) = a4;
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Authentication" forKeyPath:@"payloadAuthentication" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v17 error:a5])
    {
      BOOL v14 = [(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Accessible" forKeyPath:@"payloadAccessible" isRequired:0 defaultValue:@"Default" error:a5];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  id v6 = [(RMModelAssetCredentialSCEPDeclaration *)self payloadReference];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__RMModelAssetCredentialSCEPDeclaration_serializePayloadWithType___block_invoke;
  v13[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v14 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Reference" value:v6 dictSerializer:v13 isRequired:1 defaultValue:0];

  v7 = [(RMModelAssetCredentialSCEPDeclaration *)self payloadAuthentication];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__RMModelAssetCredentialSCEPDeclaration_serializePayloadWithType___block_invoke_2;
  v11[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v12 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Authentication" value:v7 dictSerializer:v11 isRequired:0 defaultValue:0];

  id v8 = [(RMModelAssetCredentialSCEPDeclaration *)self payloadAccessible];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Accessible" value:v8 isRequired:0 defaultValue:@"Default"];

  id v9 = (void *)[v5 copy];
  return v9;
}

uint64_t __66__RMModelAssetCredentialSCEPDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __66__RMModelAssetCredentialSCEPDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelAssetCredentialSCEPDeclaration;
  v4 = [(RMModelDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(RMModelAssetBaseReference *)self->_payloadReference copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(RMModelAssetBaseAuthentication *)self->_payloadAuthentication copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_payloadAccessible copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (RMModelAssetBaseReference)payloadReference
{
  return self->_payloadReference;
}

- (void)setPayloadReference:(id)a3
{
}

- (RMModelAssetBaseAuthentication)payloadAuthentication
{
  return self->_payloadAuthentication;
}

- (void)setPayloadAuthentication:(id)a3
{
}

- (NSString)payloadAccessible
{
  return self->_payloadAccessible;
}

- (void)setPayloadAccessible:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAccessible, 0);
  objc_storeStrong((id *)&self->_payloadAuthentication, 0);
  objc_storeStrong((id *)&self->_payloadReference, 0);
}

@end