@interface RMModelAccountMailDeclaration_OutgoingServer
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithHostName:(id)a3 authenticationMethod:(id)a4;
+ (id)buildWithHostName:(id)a3 port:(id)a4 authenticationMethod:(id)a5 authenticationCredentialsAssetReference:(id)a6;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadPort;
- (NSString)payloadAuthenticationCredentialsAssetReference;
- (NSString)payloadAuthenticationMethod;
- (NSString)payloadHostName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3;
- (void)setPayloadAuthenticationMethod:(id)a3;
- (void)setPayloadHostName:(id)a3;
- (void)setPayloadPort:(id)a3;
@end

@implementation RMModelAccountMailDeclaration_OutgoingServer

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"HostName";
  v6[1] = @"Port";
  v6[2] = @"AuthenticationMethod";
  v6[3] = @"AuthenticationCredentialsAssetReference";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithHostName:(id)a3 port:(id)a4 authenticationMethod:(id)a5 authenticationCredentialsAssetReference:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadHostName:v12];

  [v13 setPayloadPort:v11];
  [v13 setPayloadAuthenticationMethod:v10];

  [v13 setPayloadAuthenticationCredentialsAssetReference:v9];
  return v13;
}

+ (id)buildRequiredOnlyWithHostName:(id)a3 authenticationMethod:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadHostName:v6];

  [v7 setPayloadAuthenticationMethod:v5];
  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelAccountMailDeclaration_OutgoingServer allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if (![(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"HostName" forKeyPath:@"payloadHostName" isRequired:1 defaultValue:0 error:a5])goto LABEL_5; {
  BOOL v13 = 0;
  }
  if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"Port" forKeyPath:@"payloadPort" isRequired:0 defaultValue:0 error:a5])
  {
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"AuthenticationMethod" forKeyPath:@"payloadAuthenticationMethod" isRequired:1 defaultValue:0 error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"AuthenticationCredentialsAssetReference" forKeyPath:@"payloadAuthenticationCredentialsAssetReference" isRequired:0 defaultValue:0 error:a5];
      goto LABEL_6;
    }
LABEL_5:
    BOOL v13 = 0;
  }
LABEL_6:

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelAccountMailDeclaration_OutgoingServer *)self payloadHostName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"HostName" value:v5 isRequired:1 defaultValue:0];

  id v6 = [(RMModelAccountMailDeclaration_OutgoingServer *)self payloadPort];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"Port" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelAccountMailDeclaration_OutgoingServer *)self payloadAuthenticationMethod];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"AuthenticationMethod" value:v7 isRequired:1 defaultValue:0];

  v8 = [(RMModelAccountMailDeclaration_OutgoingServer *)self payloadAuthenticationCredentialsAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"AuthenticationCredentialsAssetReference" value:v8 isRequired:0 defaultValue:0];

  id v9 = (void *)[v4 copy];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelAccountMailDeclaration_OutgoingServer;
  v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadHostName copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadPort copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadAuthenticationMethod copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadAuthenticationCredentialsAssetReference copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadHostName
{
  return self->_payloadHostName;
}

- (void)setPayloadHostName:(id)a3
{
}

- (NSNumber)payloadPort
{
  return self->_payloadPort;
}

- (void)setPayloadPort:(id)a3
{
}

- (NSString)payloadAuthenticationMethod
{
  return self->_payloadAuthenticationMethod;
}

- (void)setPayloadAuthenticationMethod:(id)a3
{
}

- (NSString)payloadAuthenticationCredentialsAssetReference
{
  return self->_payloadAuthenticationCredentialsAssetReference;
}

- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationMethod, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadHostName, 0);
}

@end