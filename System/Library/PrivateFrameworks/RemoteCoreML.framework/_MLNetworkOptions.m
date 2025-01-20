@interface _MLNetworkOptions
- (BOOL)useAWDL;
- (BOOL)useBonjour;
- (BOOL)useTLS;
- (BOOL)useUDP;
- (NSMutableDictionary)networkOptions;
- (_MLNetworkOptions)initWithOptions:(id)a3;
- (const)localAddr;
- (const)localPort;
- (const)networkNameIdentifier;
- (const)port;
- (const)psk;
- (int64_t)receiveTimeout;
- (int64_t)receiveTimeoutValue;
- (unint64_t)family;
@end

@implementation _MLNetworkOptions

- (_MLNetworkOptions)initWithOptions:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_MLNetworkOptions;
  v5 = [(_MLNetworkOptions *)&v22 init];
  v6 = v5;
  if (v5)
  {
    v5->_receiveTimeout = 20;
    v24[0] = kMLNetworkNameIdentifierKey[0];
    v24[1] = kMLNetworkPortNumberKey[0];
    v25[0] = &stru_26EB9F448;
    v25[1] = @"8080";
    v7 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    uint64_t v8 = [v7 mutableCopy];
    networkOptions = v6->_networkOptions;
    v6->_networkOptions = (NSMutableDictionary *)v8;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v18);
          [(NSMutableDictionary *)v6->_networkOptions setObject:v16 forKeyedSubscript:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }
  }
  return v6;
}

- (BOOL)useAWDL
{
  v2 = [(_MLNetworkOptions *)self networkOptions];
  v3 = [v2 objectForKeyedSubscript:kMLNetworkUseAWDLKey[0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)useBonjour
{
  v2 = [(_MLNetworkOptions *)self networkOptions];
  v3 = [v2 objectForKeyedSubscript:kMLNetworkUseBonjourKey[0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)useUDP
{
  v2 = [(_MLNetworkOptions *)self networkOptions];
  v3 = [v2 objectForKeyedSubscript:kMLNetworkUseUDPKey[0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)useTLS
{
  v2 = [(_MLNetworkOptions *)self networkOptions];
  v3 = [v2 objectForKeyedSubscript:kMLNetworkUseTLSKey[0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)family
{
  v2 = [(_MLNetworkOptions *)self networkOptions];
  v3 = [v2 objectForKeyedSubscript:kMLNetworkFamilyKey[0]];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (const)psk
{
  v2 = [(_MLNetworkOptions *)self networkOptions];
  id v3 = [v2 objectForKeyedSubscript:kMLNetworkPskKey[0]];
  unint64_t v4 = (const char *)[v3 UTF8String];

  return v4;
}

- (const)localAddr
{
  v2 = [(_MLNetworkOptions *)self networkOptions];
  id v3 = [v2 objectForKeyedSubscript:kMLNetworkLocalAddrKey[0]];
  unint64_t v4 = (const char *)[v3 UTF8String];

  return v4;
}

- (const)localPort
{
  v2 = [(_MLNetworkOptions *)self networkOptions];
  id v3 = [v2 objectForKeyedSubscript:kMLNetworkLocalPortKey];
  unint64_t v4 = (const char *)[v3 UTF8String];

  return v4;
}

- (const)networkNameIdentifier
{
  id v3 = [(_MLNetworkOptions *)self networkOptions];
  unint64_t v4 = [v3 objectForKeyedSubscript:kMLNetworkNameIdentifierKey[0]];
  char v5 = [v4 isEqualToString:&stru_26EB9F448];

  if (v5) {
    return 0;
  }
  v7 = [(_MLNetworkOptions *)self networkOptions];
  id v8 = [v7 objectForKeyedSubscript:kMLNetworkNameIdentifierKey[0]];
  v9 = (const char *)[v8 UTF8String];

  return v9;
}

- (const)port
{
  v2 = [(_MLNetworkOptions *)self networkOptions];
  id v3 = [v2 objectForKeyedSubscript:kMLNetworkPortNumberKey[0]];
  unint64_t v4 = (const char *)[v3 UTF8String];

  return v4;
}

- (int64_t)receiveTimeoutValue
{
  return 1000000000 * [(_MLNetworkOptions *)self receiveTimeout];
}

- (NSMutableDictionary)networkOptions
{
  return self->_networkOptions;
}

- (int64_t)receiveTimeout
{
  return self->_receiveTimeout;
}

- (void).cxx_destruct
{
}

@end