@interface RMModelManagementOrganizationInformationDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 name:(id)a4;
+ (id)buildWithIdentifier:(id)a3 name:(id)a4 email:(id)a5 URL:(id)a6 proof:(id)a7;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadEmail;
- (NSString)payloadName;
- (NSString)payloadURL;
- (RMModelManagementOrganizationInformationDeclaration_Proof)payloadProof;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadEmail:(id)a3;
- (void)setPayloadName:(id)a3;
- (void)setPayloadProof:(id)a3;
- (void)setPayloadURL:(id)a3;
@end

@implementation RMModelManagementOrganizationInformationDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.management.organization-info";
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Name";
  v6[1] = @"Email";
  v6[2] = @"URL";
  v6[3] = @"Proof";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 name:(id)a4 email:(id)a5 URL:(id)a6 proof:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.management.organization-info"];
  if (v11)
  {
    [v16 setDeclarationIdentifier:v11];
  }
  else
  {
    v17 = [MEMORY[0x263F08C38] UUID];
    v18 = [v17 UUIDString];
    [v16 setDeclarationIdentifier:v18];
  }
  [v16 setPayloadName:v15];

  [v16 setPayloadEmail:v14];
  [v16 setPayloadURL:v13];

  [v16 setPayloadProof:v12];
  [v16 updateServerToken];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 name:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.management.organization-info"];
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
  [v7 setPayloadName:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)supportedOS
{
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = &unk_2708C1F20;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDD08];
  v27[0] = v21;
  v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDD20];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C1F38;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDD38];
  v26[0] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDD50];
  v26[1] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C1F50;
  id v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDD68];
  v25[0] = v15;
  id v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDD80];
  v25[1] = v14;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C1F68;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDD98];
  v24[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDDB0];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C1F80;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDDC8];
  v23[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDDE0];
  v23[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C1F98;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDDF8];
  v22[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDE10];
  v22[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v29[5] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  id v11 = [v9 setWithArray:v10];

  id v12 = +[RMModelManagementOrganizationInformationDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  id v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Name" forKeyPath:@"payloadName" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Email" forKeyPath:@"payloadEmail" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"URL" forKeyPath:@"payloadURL" isRequired:0 defaultValue:0 error:a5])
      {
        LOWORD(v16) = a4;
        BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Proof" forKeyPath:@"payloadProof" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5];
      }
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
  id v6 = [(RMModelManagementOrganizationInformationDeclaration *)self payloadName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Name" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMModelManagementOrganizationInformationDeclaration *)self payloadEmail];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Email" value:v7 isRequired:0 defaultValue:0];

  id v8 = [(RMModelManagementOrganizationInformationDeclaration *)self payloadURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"URL" value:v8 isRequired:0 defaultValue:0];

  v9 = [(RMModelManagementOrganizationInformationDeclaration *)self payloadProof];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__RMModelManagementOrganizationInformationDeclaration_serializePayloadWithType___block_invoke;
  v12[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v13 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Proof" value:v9 dictSerializer:v12 isRequired:0 defaultValue:0];

  v10 = (void *)[v5 copy];
  return v10;
}

uint64_t __80__RMModelManagementOrganizationInformationDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelManagementOrganizationInformationDeclaration;
  v4 = [(RMModelDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadName copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadEmail copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_payloadURL copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(RMModelManagementOrganizationInformationDeclaration_Proof *)self->_payloadProof copy];
  id v12 = (void *)v4[9];
  v4[9] = v11;

  return v4;
}

- (NSString)payloadName
{
  return self->_payloadName;
}

- (void)setPayloadName:(id)a3
{
}

- (NSString)payloadEmail
{
  return self->_payloadEmail;
}

- (void)setPayloadEmail:(id)a3
{
}

- (NSString)payloadURL
{
  return self->_payloadURL;
}

- (void)setPayloadURL:(id)a3
{
}

- (RMModelManagementOrganizationInformationDeclaration_Proof)payloadProof
{
  return self->_payloadProof;
}

- (void)setPayloadProof:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadProof, 0);
  objc_storeStrong((id *)&self->_payloadURL, 0);
  objc_storeStrong((id *)&self->_payloadEmail, 0);
  objc_storeStrong((id *)&self->_payloadName, 0);
}

@end