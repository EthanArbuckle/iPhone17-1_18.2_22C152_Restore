@interface APProxyProtocolProperties
- (APNSURLSessionDemultiplexerManager)sessionDemultiplexerManager;
- (APProxySessionConfigurationProvider)proxySessionConfigurationProvider;
- (APProxyURLCredentialService)proxyURLCredentialService;
- (void)setProxySessionConfigurationProvider:(id)a3;
- (void)setProxyURLCredentialService:(id)a3;
- (void)setSessionDemultiplexerManager:(id)a3;
@end

@implementation APProxyProtocolProperties

- (APProxySessionConfigurationProvider)proxySessionConfigurationProvider
{
  return self->_proxySessionConfigurationProvider;
}

- (void)setProxySessionConfigurationProvider:(id)a3
{
}

- (APNSURLSessionDemultiplexerManager)sessionDemultiplexerManager
{
  return self->_sessionDemultiplexerManager;
}

- (void)setSessionDemultiplexerManager:(id)a3
{
}

- (APProxyURLCredentialService)proxyURLCredentialService
{
  return self->_proxyURLCredentialService;
}

- (void)setProxyURLCredentialService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyURLCredentialService, 0);
  objc_storeStrong((id *)&self->_sessionDemultiplexerManager, 0);

  objc_storeStrong((id *)&self->_proxySessionConfigurationProvider, 0);
}

@end