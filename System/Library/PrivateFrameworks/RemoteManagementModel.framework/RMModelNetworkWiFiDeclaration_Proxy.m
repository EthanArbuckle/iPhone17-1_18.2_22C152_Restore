@interface RMModelNetworkWiFiDeclaration_Proxy
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithType:(id)a3 server:(id)a4 serverPort:(id)a5 proxyAuthenticationCredentialsAssetReference:(id)a6 PACURL:(id)a7 pacFallbackAllowed:(id)a8;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadPACFallbackAllowed;
- (NSNumber)payloadServerPort;
- (NSString)payloadPACURL;
- (NSString)payloadProxyAuthenticationCredentialsAssetReference;
- (NSString)payloadServer;
- (NSString)payloadType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadPACFallbackAllowed:(id)a3;
- (void)setPayloadPACURL:(id)a3;
- (void)setPayloadProxyAuthenticationCredentialsAssetReference:(id)a3;
- (void)setPayloadServer:(id)a3;
- (void)setPayloadServerPort:(id)a3;
- (void)setPayloadType:(id)a3;
@end

@implementation RMModelNetworkWiFiDeclaration_Proxy

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Type";
  v6[1] = @"Server";
  v6[2] = @"ServerPort";
  v6[3] = @"ProxyAuthenticationCredentialsAssetReference";
  v6[4] = @"PACURL";
  v6[5] = @"PACFallbackAllowed";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithType:(id)a3 server:(id)a4 serverPort:(id)a5 proxyAuthenticationCredentialsAssetReference:(id)a6 PACURL:(id)a7 pacFallbackAllowed:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = (__CFString *)a3;
  v19 = objc_opt_new();
  v20 = v19;
  if (v18) {
    v21 = v18;
  }
  else {
    v21 = @"None";
  }
  [v19 setPayloadType:v21];

  [v20 setPayloadServer:v17];
  [v20 setPayloadServerPort:v16];

  [v20 setPayloadProxyAuthenticationCredentialsAssetReference:v15];
  [v20 setPayloadPACURL:v14];

  if (v13) {
    id v22 = v13;
  }
  else {
    id v22 = (id)MEMORY[0x263EFFA80];
  }
  [v20 setPayloadPACFallbackAllowed:v22];

  return v20;
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
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelNetworkWiFiDeclaration_Proxy allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Type" forKeyPath:@"payloadType" isRequired:0 defaultValue:@"None" error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Server" forKeyPath:@"payloadServer" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"ServerPort" forKeyPath:@"payloadServerPort" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v13 = 0;
        if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"ProxyAuthenticationCredentialsAssetReference" forKeyPath:@"payloadProxyAuthenticationCredentialsAssetReference" isRequired:0 defaultValue:0 error:a5])
        {
          BOOL v13 = 0;
          if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"PACURL" forKeyPath:@"payloadPACURL" isRequired:0 defaultValue:0 error:a5])
          {
            BOOL v13 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"PACFallbackAllowed" forKeyPath:@"payloadPACFallbackAllowed" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5];
          }
        }
      }
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelNetworkWiFiDeclaration_Proxy *)self payloadType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Type" value:v5 isRequired:0 defaultValue:@"None"];

  v6 = [(RMModelNetworkWiFiDeclaration_Proxy *)self payloadServer];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Server" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelNetworkWiFiDeclaration_Proxy *)self payloadServerPort];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"ServerPort" value:v7 isRequired:0 defaultValue:0];

  v8 = [(RMModelNetworkWiFiDeclaration_Proxy *)self payloadProxyAuthenticationCredentialsAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ProxyAuthenticationCredentialsAssetReference" value:v8 isRequired:0 defaultValue:0];

  v9 = [(RMModelNetworkWiFiDeclaration_Proxy *)self payloadPACURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"PACURL" value:v9 isRequired:0 defaultValue:0];

  v10 = [(RMModelNetworkWiFiDeclaration_Proxy *)self payloadPACFallbackAllowed];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"PACFallbackAllowed" value:v10 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  v11 = (void *)[v4 copy];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)RMModelNetworkWiFiDeclaration_Proxy;
  v4 = [(RMModelPayloadBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadType copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadServer copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadServerPort copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadProxyAuthenticationCredentialsAssetReference copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_payloadPACURL copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadPACFallbackAllowed copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  return v4;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
}

- (NSString)payloadServer
{
  return self->_payloadServer;
}

- (void)setPayloadServer:(id)a3
{
}

- (NSNumber)payloadServerPort
{
  return self->_payloadServerPort;
}

- (void)setPayloadServerPort:(id)a3
{
}

- (NSString)payloadProxyAuthenticationCredentialsAssetReference
{
  return self->_payloadProxyAuthenticationCredentialsAssetReference;
}

- (void)setPayloadProxyAuthenticationCredentialsAssetReference:(id)a3
{
}

- (NSString)payloadPACURL
{
  return self->_payloadPACURL;
}

- (void)setPayloadPACURL:(id)a3
{
}

- (NSNumber)payloadPACFallbackAllowed
{
  return self->_payloadPACFallbackAllowed;
}

- (void)setPayloadPACFallbackAllowed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPACFallbackAllowed, 0);
  objc_storeStrong((id *)&self->_payloadPACURL, 0);
  objc_storeStrong((id *)&self->_payloadProxyAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadServerPort, 0);
  objc_storeStrong((id *)&self->_payloadServer, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
}

@end