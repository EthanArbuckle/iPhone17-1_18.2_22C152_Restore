@interface SXWebsiteDataStoreFactory
- (SXProxyConfiguration)proxyConfiguration;
- (SXWebsiteDataStoreFactory)initWithProxyConfiguration:(id)a3;
- (id)createWebsiteDataStore;
@end

@implementation SXWebsiteDataStoreFactory

- (SXWebsiteDataStoreFactory)initWithProxyConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXWebsiteDataStoreFactory;
  v6 = [(SXWebsiteDataStoreFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proxyConfiguration, a3);
  }

  return v7;
}

- (id)createWebsiteDataStore
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F1FAC8]) initNonPersistentConfiguration];
  v4 = [(SXProxyConfiguration *)self->_proxyConfiguration proxyAutoConfigScript];
  if ([(SXProxyConfiguration *)self->_proxyConfiguration usePrivateRelay])
  {
    [v3 setSourceApplicationSecondaryIdentifier:@"com.apple.news.embedded-content"];
  }
  else if (v4)
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    [v5 setObject:v4 forKey:*MEMORY[0x263EFC710]];
    [v5 setObject:*MEMORY[0x263EFC718] forKey:*MEMORY[0x263EFC720]];
    [v5 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1BDE0]];
    [v3 setProxyConfiguration:v5];
    [v3 setRequiresSecureHTTPSProxyConnection:1];
    [v3 setPreventsSystemHTTPProxyAuthentication:1];
  }
  v6 = (void *)[objc_alloc(MEMORY[0x263F1FA68]) _initWithConfiguration:v3];
  [v6 _setResourceLoadStatisticsEnabled:1];

  return v6;
}

- (SXProxyConfiguration)proxyConfiguration
{
  return self->_proxyConfiguration;
}

- (void).cxx_destruct
{
}

@end