@interface RMModelSoftwareUpdateSettingsDeclaration_BetaProgram
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithDescription:(id)a3 token:(id)a4;
+ (id)buildWithDescription:(id)a3 token:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadDescription;
- (NSString)payloadToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadDescription:(id)a3;
- (void)setPayloadToken:(id)a3;
@end

@implementation RMModelSoftwareUpdateSettingsDeclaration_BetaProgram

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Description";
  v6[1] = @"Token";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDescription:(id)a3 token:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadDescription:v6];

  [v7 setPayloadToken:v5];
  return v7;
}

+ (id)buildRequiredOnlyWithDescription:(id)a3 token:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadDescription:v6];

  [v7 setPayloadToken:v5];
  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelSoftwareUpdateSettingsDeclaration_BetaProgram allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Description" forKeyPath:@"payloadDescription" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Token" forKeyPath:@"payloadToken" isRequired:1 defaultValue:0 error:a5];
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
  id v5 = [(RMModelSoftwareUpdateSettingsDeclaration_BetaProgram *)self payloadDescription];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Description" value:v5 isRequired:1 defaultValue:0];

  id v6 = [(RMModelSoftwareUpdateSettingsDeclaration_BetaProgram *)self payloadToken];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Token" value:v6 isRequired:1 defaultValue:0];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelSoftwareUpdateSettingsDeclaration_BetaProgram;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadDescription copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadToken copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
}

- (NSString)payloadToken
{
  return self->_payloadToken;
}

- (void)setPayloadToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadToken, 0);
  objc_storeStrong((id *)&self->_payloadDescription, 0);
}

@end