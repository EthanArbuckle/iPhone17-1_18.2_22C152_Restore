@interface OspreyRequest
+ (id)requestWithMethodName:(id)a3;
- (BOOL)allowsCellularAccess;
- (BOOL)enableDeviceAuthentication;
- (BOOL)forceHTTPv2;
- (BOOL)requireAbsintheAuthentication;
- (BOOL)useCompression;
- (NSData)data;
- (NSData)signedDeviceAuthenticationData;
- (NSDictionary)headers;
- (NSNumber)deviceAuthenticationVersion;
- (NSString)clientTraceId;
- (NSString)methodName;
- (NSString)userAgent;
- (OspreyRequest)initWithMethodName:(id)a3;
- (id)grpcRequestWithBaseURL:(id)a3;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setClientTraceId:(id)a3;
- (void)setData:(id)a3;
- (void)setDeviceAuthenticationVersion:(id)a3;
- (void)setEnableDeviceAuthentication:(BOOL)a3;
- (void)setForceHTTPv2:(BOOL)a3;
- (void)setHeaders:(id)a3;
- (void)setRequireAbsintheAuthentication:(BOOL)a3;
- (void)setSignedDeviceAuthenticationData:(id)a3;
- (void)setUseCompression:(BOOL)a3;
@end

@implementation OspreyRequest

- (OspreyRequest)initWithMethodName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OspreyRequest;
  v6 = [(OspreyRequest *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_forceHTTPv2 = 1;
    *(_WORD *)&v6->_enableDeviceAuthentication = 257;
    objc_storeStrong((id *)&v6->_methodName, a3);
    if (OspreyCreateGlobalUserAgentString_onceToken != -1) {
      dispatch_once(&OspreyCreateGlobalUserAgentString_onceToken, &__block_literal_global_2);
    }
    objc_storeStrong((id *)&v7->_userAgent, (id)OspreyCreateGlobalUserAgentString_globalUserAgent);
    v7->_allowsCellularAccess = 1;
    v8 = v7;
  }

  return v7;
}

+ (id)requestWithMethodName:(id)a3
{
  id v3 = a3;
  v4 = [[OspreyRequest alloc] initWithMethodName:v3];

  return v4;
}

- (id)grpcRequestWithBaseURL:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = [a3 URLByAppendingPathComponent:self->_methodName];
  id v5 = [MEMORY[0x1E4F28E88] requestWithURL:v4];
  [v5 setAllowsCellularAccess:self->_allowsCellularAccess];
  [v5 setHTTPMethod:@"POST"];
  [v5 setValue:@"application/grpc" forHTTPHeaderField:@"content-type"];
  [v5 setValue:@"60S" forHTTPHeaderField:@"grpc-timeout"];
  [v5 setValue:@"trailers" forHTTPHeaderField:@"te"];
  [v5 setValue:@"1" forHTTPHeaderField:@"siri-osprey"];
  [v5 setValue:self->_userAgent forHTTPHeaderField:@"user-agent"];
  if (self->_useCompression) {
    v6 = @"gzip,identity";
  }
  else {
    v6 = @"identity";
  }
  if (self->_useCompression) {
    v7 = @"gzip";
  }
  else {
    v7 = @"identity";
  }
  [v5 setValue:v6 forHTTPHeaderField:@"grpc-accept-encoding"];
  [v5 setValue:v6 forHTTPHeaderField:@"accept-encoding"];
  [v5 setValue:v7 forHTTPHeaderField:@"grpc-encoding"];
  if (self->_enableDeviceAuthentication)
  {
    signedDeviceAuthenticationData = self->_signedDeviceAuthenticationData;
    if (signedDeviceAuthenticationData)
    {
      v9 = [(NSData *)signedDeviceAuthenticationData base64EncodedStringWithOptions:0];
      [v5 setValue:v9 forHTTPHeaderField:@"siri-absinthe-token-bin"];
    }
  }
  else
  {
    [v5 setValue:@"true" forHTTPHeaderField:@"siri-absinthe-ignore"];
  }
  deviceAuthenticationVersion = self->_deviceAuthenticationVersion;
  if (deviceAuthenticationVersion)
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[NSNumber integerValue](deviceAuthenticationVersion, "integerValue"));
    [v5 setValue:v11 forHTTPHeaderField:@"siri-device-auth-version"];
  }
  if (self->_forceHTTPv2)
  {
    OspreyLoggingInit();
    v12 = OspreyLogContextRequest;
    if (os_log_type_enabled((os_log_t)OspreyLogContextRequest, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[OspreyRequest grpcRequestWithBaseURL:]";
      _os_log_impl(&dword_1BEDB4000, v12, OS_LOG_TYPE_INFO, "%s Force usage of HTTP/2 for request", buf, 0xCu);
    }
    [v5 _CFURLRequest];
    _CFURLRequestSetAllowedProtocolTypes();
  }
  clientTraceId = self->_clientTraceId;
  if (clientTraceId) {
    [v5 setValue:clientTraceId forHTTPHeaderField:@"siri-osprey-trace-id"];
  }
  headers = self->_headers;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __40__OspreyRequest_grpcRequestWithBaseURL___block_invoke;
  v22[3] = &unk_1E63CBC10;
  id v15 = v5;
  id v23 = v15;
  [(NSDictionary *)headers enumerateKeysAndObjectsUsingBlock:v22];
  OspreyLoggingInit();
  v16 = (void *)OspreyLogContextRequest;
  if (os_log_type_enabled((os_log_t)OspreyLogContextRequest, OS_LOG_TYPE_INFO))
  {
    methodName = self->_methodName;
    data = self->_data;
    v19 = v16;
    LODWORD(data) = [(NSData *)data length];
    v20 = [v15 allHTTPHeaderFields];
    *(_DWORD *)buf = 136315906;
    v25 = "-[OspreyRequest grpcRequestWithBaseURL:]";
    __int16 v26 = 2112;
    v27 = methodName;
    __int16 v28 = 1024;
    int v29 = (int)data;
    __int16 v30 = 2112;
    v31 = v20;
    _os_log_impl(&dword_1BEDB4000, v19, OS_LOG_TYPE_INFO, "%s Request method: %@ data_length: %d headers: %@", buf, 0x26u);
  }

  return v15;
}

void __40__OspreyRequest_grpcRequestWithBaseURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) allHTTPHeaderFields];
  v8 = [v7 objectForKey:v5];

  if (v8)
  {
    OspreyLoggingInit();
    v9 = OspreyLogContextRequest;
    if (os_log_type_enabled((os_log_t)OspreyLogContextRequest, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315906;
      v11 = "-[OspreyRequest grpcRequestWithBaseURL:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_debug_impl(&dword_1BEDB4000, v9, OS_LOG_TYPE_DEBUG, "%s Overriding HTTP header: '%@' previous value: '%@' with: '%@'", (uint8_t *)&v10, 0x2Au);
    }
  }
  [*(id *)(a1 + 32) setValue:v6 forHTTPHeaderField:v5];
}

- (BOOL)requireAbsintheAuthentication
{
  return self->_enableDeviceAuthentication;
}

- (void)setRequireAbsintheAuthentication:(BOOL)a3
{
  self->_enableDeviceAuthentication = a3;
}

- (NSString)methodName
{
  return self->_methodName;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (BOOL)enableDeviceAuthentication
{
  return self->_enableDeviceAuthentication;
}

- (void)setEnableDeviceAuthentication:(BOOL)a3
{
  self->_enableDeviceAuthentication = a3;
}

- (NSData)signedDeviceAuthenticationData
{
  return self->_signedDeviceAuthenticationData;
}

- (void)setSignedDeviceAuthenticationData:(id)a3
{
}

- (NSNumber)deviceAuthenticationVersion
{
  return self->_deviceAuthenticationVersion;
}

- (void)setDeviceAuthenticationVersion:(id)a3
{
}

- (BOOL)useCompression
{
  return self->_useCompression;
}

- (void)setUseCompression:(BOOL)a3
{
  self->_useCompression = a3;
}

- (BOOL)forceHTTPv2
{
  return self->_forceHTTPv2;
}

- (void)setForceHTTPv2:(BOOL)a3
{
  self->_forceHTTPv2 = a3;
}

- (NSString)clientTraceId
{
  return self->_clientTraceId;
}

- (void)setClientTraceId:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_clientTraceId, 0);
  objc_storeStrong((id *)&self->_deviceAuthenticationVersion, 0);
  objc_storeStrong((id *)&self->_signedDeviceAuthenticationData, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_methodName, 0);
}

@end