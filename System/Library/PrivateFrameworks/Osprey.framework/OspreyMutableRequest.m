@interface OspreyMutableRequest
- (BOOL)allowsCellularAccess;
- (BOOL)enableDeviceAuthentication;
- (BOOL)forceHTTPv2;
- (BOOL)isCompressionEnabled;
- (BOOL)requireAbsintheAuthentication;
- (NSString)clientTraceIdentifier;
- (NSString)methodName;
- (OspreyMutableRequest)initWithMethodName:(id)a3;
- (id)buildInternalRequest;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setClientTraceIdentifier:(id)a3;
- (void)setCompressionEnabled:(BOOL)a3;
- (void)setEnableDeviceAuthentication:(BOOL)a3;
- (void)setForceHTTPv2:(BOOL)a3;
- (void)setRequireAbsintheAuthentication:(BOOL)a3;
- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4;
@end

@implementation OspreyMutableRequest

- (OspreyMutableRequest)initWithMethodName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OspreyMutableRequest;
  v5 = [(OspreyMutableRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    methodName = v5->_methodName;
    v5->_methodName = (NSString *)v6;

    *(_DWORD *)&v5->_enableDeviceAuthentication = 16843009;
  }

  return v5;
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  additionalHeaders = self->_additionalHeaders;
  if (!additionalHeaders)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_super v9 = self->_additionalHeaders;
    self->_additionalHeaders = v8;

    additionalHeaders = self->_additionalHeaders;
  }
  [(NSMutableDictionary *)additionalHeaders setObject:v10 forKey:v6];
}

- (id)buildInternalRequest
{
  v3 = [OspreyRequest alloc];
  id v4 = [(OspreyMutableRequest *)self methodName];
  v5 = [(OspreyRequest *)v3 initWithMethodName:v4];

  if (self->_clientTraceIdentifier)
  {
    -[OspreyRequest setClientTraceId:](v5, "setClientTraceId:");
  }
  else
  {
    id v6 = [MEMORY[0x1E4F29128] UUID];
    v7 = [v6 UUIDString];
    [(OspreyRequest *)v5 setClientTraceId:v7];
  }
  [(OspreyRequest *)v5 setEnableDeviceAuthentication:self->_enableDeviceAuthentication];
  [(OspreyRequest *)v5 setAllowsCellularAccess:self->_allowsCellularAccess];
  [(OspreyRequest *)v5 setUseCompression:[(OspreyMutableRequest *)self isCompressionEnabled]];
  [(OspreyRequest *)v5 setForceHTTPv2:[(OspreyMutableRequest *)self forceHTTPv2]];
  if (self->_additionalHeaders) {
    -[OspreyRequest setHeaders:](v5, "setHeaders:");
  }

  return v5;
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

- (NSString)clientTraceIdentifier
{
  return self->_clientTraceIdentifier;
}

- (void)setClientTraceIdentifier:(id)a3
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

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (BOOL)isCompressionEnabled
{
  return self->_compressionEnabled;
}

- (void)setCompressionEnabled:(BOOL)a3
{
  self->_compressionEnabled = a3;
}

- (BOOL)forceHTTPv2
{
  return self->_forceHTTPv2;
}

- (void)setForceHTTPv2:(BOOL)a3
{
  self->_forceHTTPv2 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTraceIdentifier, 0);
  objc_storeStrong((id *)&self->_methodName, 0);

  objc_storeStrong((id *)&self->_additionalHeaders, 0);
}

@end