@interface RMModelAccountExchangeDeclaration_OAuth
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithEnabled:(id)a3;
+ (id)buildWithEnabled:(id)a3 signInURL:(id)a4 tokenRequestURL:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadEnabled;
- (NSString)payloadSignInURL;
- (NSString)payloadTokenRequestURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadEnabled:(id)a3;
- (void)setPayloadSignInURL:(id)a3;
- (void)setPayloadTokenRequestURL:(id)a3;
@end

@implementation RMModelAccountExchangeDeclaration_OAuth

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Enabled";
  v6[1] = @"SignInURL";
  v6[2] = @"TokenRequestURL";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithEnabled:(id)a3 signInURL:(id)a4 tokenRequestURL:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadEnabled:v9];

  [v10 setPayloadSignInURL:v8];
  [v10 setPayloadTokenRequestURL:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithEnabled:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadEnabled:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelAccountExchangeDeclaration_OAuth allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"Enabled" forKeyPath:@"payloadEnabled" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"SignInURL" forKeyPath:@"payloadSignInURL" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"TokenRequestURL" forKeyPath:@"payloadTokenRequestURL" isRequired:0 defaultValue:0 error:a5];
    }
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
  v5 = [(RMModelAccountExchangeDeclaration_OAuth *)self payloadEnabled];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"Enabled" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelAccountExchangeDeclaration_OAuth *)self payloadSignInURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"SignInURL" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelAccountExchangeDeclaration_OAuth *)self payloadTokenRequestURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"TokenRequestURL" value:v7 isRequired:0 defaultValue:0];

  id v8 = (void *)[v4 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelAccountExchangeDeclaration_OAuth;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadEnabled copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadSignInURL copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadTokenRequestURL copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSNumber)payloadEnabled
{
  return self->_payloadEnabled;
}

- (void)setPayloadEnabled:(id)a3
{
}

- (NSString)payloadSignInURL
{
  return self->_payloadSignInURL;
}

- (void)setPayloadSignInURL:(id)a3
{
}

- (NSString)payloadTokenRequestURL
{
  return self->_payloadTokenRequestURL;
}

- (void)setPayloadTokenRequestURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTokenRequestURL, 0);
  objc_storeStrong((id *)&self->_payloadSignInURL, 0);
  objc_storeStrong((id *)&self->_payloadEnabled, 0);
}

@end