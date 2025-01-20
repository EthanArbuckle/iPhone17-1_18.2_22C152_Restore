@interface FCEmbedProxyConfiguration
- (BOOL)usePrivateRelay;
- (FCEmbedProxyConfiguration)initWithDictionary:(id)a3;
- (NSString)proxyAutoConfig;
- (NSString)proxyHost;
@end

@implementation FCEmbedProxyConfiguration

- (FCEmbedProxyConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCEmbedProxyConfiguration;
  v5 = [(FCEmbedProxyConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationStringValue(v4, @"proxyHost", 0);
    proxyHost = v5->_proxyHost;
    v5->_proxyHost = (NSString *)v6;

    uint64_t v8 = FCAppConfigurationStringValue(v4, @"proxyAutoConfig", 0);
    proxyAutoConfig = v5->_proxyAutoConfig;
    v5->_proxyAutoConfig = (NSString *)v8;

    v5->_usePrivateRelay = +[FCFeatureEnablementChecker enabledForCurrentLevel:FCAppConfigurationIntegerValue(v4, @"usePrivateRelay", 0)];
  }

  return v5;
}

- (NSString)proxyHost
{
  return self->_proxyHost;
}

- (NSString)proxyAutoConfig
{
  return self->_proxyAutoConfig;
}

- (BOOL)usePrivateRelay
{
  return self->_usePrivateRelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyAutoConfig, 0);
  objc_storeStrong((id *)&self->_proxyHost, 0);
}

@end