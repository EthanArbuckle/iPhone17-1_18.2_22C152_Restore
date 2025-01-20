@interface SXProxyConfiguration
+ (id)direct;
- (BOOL)usePrivateRelay;
- (NSString)proxyAutoConfigScript;
- (NSString)proxyHost;
- (SXProxyConfiguration)initWithHost:(id)a3;
- (SXProxyConfiguration)initWithProxyAutoConfigScript:(id)a3;
@end

@implementation SXProxyConfiguration

+ (id)direct
{
  v2 = (void *)[objc_alloc((Class)a1) initWithProxyAutoConfigScript:@"function FindProxyForURL(url, host){return 'DIRECT';}"];
  return v2;
}

- (SXProxyConfiguration)initWithProxyAutoConfigScript:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXProxyConfiguration;
  v5 = [(SXProxyConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    proxyAutoConfigScript = v5->_proxyAutoConfigScript;
    v5->_proxyAutoConfigScript = (NSString *)v6;
  }
  return v5;
}

- (SXProxyConfiguration)initWithHost:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXProxyConfiguration;
  uint64_t v6 = [(SXProxyConfiguration *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxyHost, a3);
    objc_msgSend(NSString, "stringWithFormat:", @"function FindProxyForURL(url, host){return 'PROXY %@';}",
    uint64_t v8 = v5);
    proxyAutoConfigScript = v7->_proxyAutoConfigScript;
    v7->_proxyAutoConfigScript = (NSString *)v8;
  }
  return v7;
}

- (NSString)proxyHost
{
  return self->_proxyHost;
}

- (NSString)proxyAutoConfigScript
{
  return self->_proxyAutoConfigScript;
}

- (BOOL)usePrivateRelay
{
  return self->usePrivateRelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyAutoConfigScript, 0);
  objc_storeStrong((id *)&self->_proxyHost, 0);
}

@end