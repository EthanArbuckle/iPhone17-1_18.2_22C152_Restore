@interface RMModelUserNameAndPasswordCredentialDeclaration
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithUserName:(id)a3;
+ (id)buildWithUserName:(id)a3 password:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadPassword;
- (NSString)payloadUserName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadPassword:(id)a3;
- (void)setPayloadUserName:(id)a3;
@end

@implementation RMModelUserNameAndPasswordCredentialDeclaration

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"UserName";
  v6[1] = @"Password";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithUserName:(id)a3 password:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadUserName:v6];

  [v7 setPayloadPassword:v5];
  return v7;
}

+ (id)buildRequiredOnlyWithUserName:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadUserName:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelUserNameAndPasswordCredentialDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"UserName" forKeyPath:@"payloadUserName" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Password" forKeyPath:@"payloadPassword" isRequired:0 defaultValue:0 error:a5];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelUserNameAndPasswordCredentialDeclaration *)self payloadUserName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"UserName" value:v5 isRequired:1 defaultValue:0];

  id v6 = [(RMModelUserNameAndPasswordCredentialDeclaration *)self payloadPassword];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Password" value:v6 isRequired:0 defaultValue:0];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelUserNameAndPasswordCredentialDeclaration;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadUserName copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadPassword copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadUserName
{
  return self->_payloadUserName;
}

- (void)setPayloadUserName:(id)a3
{
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadUserName, 0);
}

@end