@interface RMModelIdentityCredentialDeclaration
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithPassword:(id)a3 identity:(id)a4;
+ (id)buildWithPassword:(id)a3 identity:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSData)payloadIdentity;
- (NSString)payloadPassword;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadIdentity:(id)a3;
- (void)setPayloadPassword:(id)a3;
@end

@implementation RMModelIdentityCredentialDeclaration

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Password";
  v6[1] = @"Identity";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithPassword:(id)a3 identity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadPassword:v6];

  [v7 setPayloadIdentity:v5];
  return v7;
}

+ (id)buildRequiredOnlyWithPassword:(id)a3 identity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadPassword:v6];

  [v7 setPayloadIdentity:v5];
  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelIdentityCredentialDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Password" forKeyPath:@"payloadPassword" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v14 = [(RMModelPayloadBase *)self loadDataFromDictionary:v8 usingKey:@"Identity" forKeyPath:@"payloadIdentity" isRequired:1 defaultValue:0 serializationType:v6 error:a5];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [(RMModelIdentityCredentialDeclaration *)self payloadPassword];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Password" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMModelIdentityCredentialDeclaration *)self payloadIdentity];
  [(RMModelPayloadBase *)self serializeDataIntoDictionary:v5 usingKey:@"Identity" value:v7 isRequired:1 defaultValue:0 serializationType:v3];

  id v8 = (void *)[v5 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelIdentityCredentialDeclaration;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadPassword copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSData *)self->_payloadIdentity copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
}

- (NSData)payloadIdentity
{
  return self->_payloadIdentity;
}

- (void)setPayloadIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadIdentity, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
}

@end