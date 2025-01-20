@interface RMModelAccountMailDeclaration_IncomingServer
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithServerType:(id)a3 hostName:(id)a4 authenticationMethod:(id)a5;
+ (id)buildWithServerType:(id)a3 hostName:(id)a4 port:(id)a5 authenticationMethod:(id)a6 authenticationCredentialsAssetReference:(id)a7 imapPathPrefix:(id)a8;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadPort;
- (NSString)payloadAuthenticationCredentialsAssetReference;
- (NSString)payloadAuthenticationMethod;
- (NSString)payloadHostName;
- (NSString)payloadIMAPPathPrefix;
- (NSString)payloadServerType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3;
- (void)setPayloadAuthenticationMethod:(id)a3;
- (void)setPayloadHostName:(id)a3;
- (void)setPayloadIMAPPathPrefix:(id)a3;
- (void)setPayloadPort:(id)a3;
- (void)setPayloadServerType:(id)a3;
@end

@implementation RMModelAccountMailDeclaration_IncomingServer

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ServerType";
  v6[1] = @"HostName";
  v6[2] = @"Port";
  v6[3] = @"AuthenticationMethod";
  v6[4] = @"AuthenticationCredentialsAssetReference";
  v6[5] = @"IMAPPathPrefix";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithServerType:(id)a3 hostName:(id)a4 port:(id)a5 authenticationMethod:(id)a6 authenticationCredentialsAssetReference:(id)a7 imapPathPrefix:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_opt_new();
  [v19 setPayloadServerType:v18];

  [v19 setPayloadHostName:v17];
  [v19 setPayloadPort:v16];

  [v19 setPayloadAuthenticationMethod:v15];
  [v19 setPayloadAuthenticationCredentialsAssetReference:v14];

  [v19 setPayloadIMAPPathPrefix:v13];
  return v19;
}

+ (id)buildRequiredOnlyWithServerType:(id)a3 hostName:(id)a4 authenticationMethod:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadServerType:v9];

  [v10 setPayloadHostName:v8];
  [v10 setPayloadAuthenticationMethod:v7];

  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelAccountMailDeclaration_IncomingServer allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if (![(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"ServerType" forKeyPath:@"payloadServerType" isRequired:1 defaultValue:0 error:a5]|| ![(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"HostName" forKeyPath:@"payloadHostName" isRequired:1 defaultValue:0 error:a5])
  {
    goto LABEL_7;
  }
  BOOL v13 = 0;
  if (![(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"Port" forKeyPath:@"payloadPort" isRequired:0 defaultValue:0 error:a5])goto LABEL_8; {
  if (![(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"AuthenticationMethod" forKeyPath:@"payloadAuthenticationMethod" isRequired:1 defaultValue:0 error:a5])
  }
  {
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }
  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"AuthenticationCredentialsAssetReference" forKeyPath:@"payloadAuthenticationCredentialsAssetReference" isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"IMAPPathPrefix" forKeyPath:@"payloadIMAPPathPrefix" isRequired:0 defaultValue:0 error:a5];
  }
LABEL_8:

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelAccountMailDeclaration_IncomingServer *)self payloadServerType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ServerType" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelAccountMailDeclaration_IncomingServer *)self payloadHostName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"HostName" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMModelAccountMailDeclaration_IncomingServer *)self payloadPort];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"Port" value:v7 isRequired:0 defaultValue:0];

  id v8 = [(RMModelAccountMailDeclaration_IncomingServer *)self payloadAuthenticationMethod];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"AuthenticationMethod" value:v8 isRequired:1 defaultValue:0];

  id v9 = [(RMModelAccountMailDeclaration_IncomingServer *)self payloadAuthenticationCredentialsAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"AuthenticationCredentialsAssetReference" value:v9 isRequired:0 defaultValue:0];

  v10 = [(RMModelAccountMailDeclaration_IncomingServer *)self payloadIMAPPathPrefix];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"IMAPPathPrefix" value:v10 isRequired:0 defaultValue:0];

  v11 = (void *)[v4 copy];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)RMModelAccountMailDeclaration_IncomingServer;
  v4 = [(RMModelPayloadBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadServerType copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadHostName copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadPort copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadAuthenticationMethod copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_payloadAuthenticationCredentialsAssetReference copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_payloadIMAPPathPrefix copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  return v4;
}

- (NSString)payloadServerType
{
  return self->_payloadServerType;
}

- (void)setPayloadServerType:(id)a3
{
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

- (NSString)payloadIMAPPathPrefix
{
  return self->_payloadIMAPPathPrefix;
}

- (void)setPayloadIMAPPathPrefix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadIMAPPathPrefix, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationMethod, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadHostName, 0);
  objc_storeStrong((id *)&self->_payloadServerType, 0);
}

@end