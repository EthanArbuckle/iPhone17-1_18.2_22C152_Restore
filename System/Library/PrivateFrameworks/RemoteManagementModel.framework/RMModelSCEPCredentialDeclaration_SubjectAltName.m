@interface RMModelSCEPCredentialDeclaration_SubjectAltName
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithRfc822Name:(id)a3 dnsName:(id)a4 uniformResourceIdentifier:(id)a5 ntPrincipalName:(id)a6;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadDNSName;
- (NSString)payloadNtPrincipalName;
- (NSString)payloadRfc822Name;
- (NSString)payloadUniformResourceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadDNSName:(id)a3;
- (void)setPayloadNtPrincipalName:(id)a3;
- (void)setPayloadRfc822Name:(id)a3;
- (void)setPayloadUniformResourceIdentifier:(id)a3;
@end

@implementation RMModelSCEPCredentialDeclaration_SubjectAltName

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"rfc822Name";
  v6[1] = @"dNSName";
  v6[2] = @"uniformResourceIdentifier";
  v6[3] = @"ntPrincipalName";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithRfc822Name:(id)a3 dnsName:(id)a4 uniformResourceIdentifier:(id)a5 ntPrincipalName:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadRfc822Name:v12];

  [v13 setPayloadDNSName:v11];
  [v13 setPayloadUniformResourceIdentifier:v10];

  [v13 setPayloadNtPrincipalName:v9];
  return v13;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelSCEPCredentialDeclaration_SubjectAltName allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"rfc822Name" forKeyPath:@"payloadRfc822Name" isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"dNSName" forKeyPath:@"payloadDNSName" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"uniformResourceIdentifier" forKeyPath:@"payloadUniformResourceIdentifier" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"ntPrincipalName" forKeyPath:@"payloadNtPrincipalName" isRequired:0 defaultValue:0 error:a5];
      }
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelSCEPCredentialDeclaration_SubjectAltName *)self payloadRfc822Name];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"rfc822Name" value:v5 isRequired:0 defaultValue:0];

  v6 = [(RMModelSCEPCredentialDeclaration_SubjectAltName *)self payloadDNSName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"dNSName" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelSCEPCredentialDeclaration_SubjectAltName *)self payloadUniformResourceIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"uniformResourceIdentifier" value:v7 isRequired:0 defaultValue:0];

  v8 = [(RMModelSCEPCredentialDeclaration_SubjectAltName *)self payloadNtPrincipalName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ntPrincipalName" value:v8 isRequired:0 defaultValue:0];

  id v9 = (void *)[v4 copy];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelSCEPCredentialDeclaration_SubjectAltName;
  v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadRfc822Name copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadDNSName copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadUniformResourceIdentifier copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadNtPrincipalName copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadRfc822Name
{
  return self->_payloadRfc822Name;
}

- (void)setPayloadRfc822Name:(id)a3
{
}

- (NSString)payloadDNSName
{
  return self->_payloadDNSName;
}

- (void)setPayloadDNSName:(id)a3
{
}

- (NSString)payloadUniformResourceIdentifier
{
  return self->_payloadUniformResourceIdentifier;
}

- (void)setPayloadUniformResourceIdentifier:(id)a3
{
}

- (NSString)payloadNtPrincipalName
{
  return self->_payloadNtPrincipalName;
}

- (void)setPayloadNtPrincipalName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNtPrincipalName, 0);
  objc_storeStrong((id *)&self->_payloadUniformResourceIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadDNSName, 0);
  objc_storeStrong((id *)&self->_payloadRfc822Name, 0);
}

@end