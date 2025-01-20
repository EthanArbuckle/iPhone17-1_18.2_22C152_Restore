@interface SXEmbedComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXEmbedComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D5ED4C8 scope:v5 callbackBlock:&__block_literal_global_65];

  v6 = [v3 callback];
  v7 = TFCallbackScopeAny();
  [v6 whenResolvingProtocol:&unk_26D61EA90 scope:v7 callbackBlock:&__block_literal_global_55_14];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_59_11];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerClass:objc_opt_class() factory:&__block_literal_global_152_0];

  v12 = [v3 publicContainer];
  v13 = [v12 registerClass:objc_opt_class() factory:&__block_literal_global_155];
  id v14 = (id)[v13 inScope:2];

  v15 = [v3 privateContainer];
  id v16 = (id)[v15 registerProtocol:&unk_26D617678 factory:&__block_literal_global_160_0];

  v17 = [v3 publicContainer];
  v18 = [v17 registerClass:objc_opt_class() factory:&__block_literal_global_172];
  id v19 = (id)[v18 inScope:2];

  v20 = [v3 publicContainer];
  id v21 = (id)[v20 registerProtocol:&unk_26D5ED378 factory:&__block_literal_global_174];

  v22 = [v3 publicContainer];
  id v23 = (id)[v22 registerProtocol:&unk_26D5E6430 factory:&__block_literal_global_177];

  id v25 = [v3 privateContainer];

  id v24 = (id)[v25 registerProtocol:&unk_26D62B910 factory:&__block_literal_global_184_0];
}

void __43__SXEmbedComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

SXEmbedComponentViewFactory *__43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v15 = [SXEmbedComponentViewFactory alloc];
  v18 = [v2 resolveProtocol:&unk_26D5C6E40];
  v12 = [v2 resolveClass:objc_opt_class()];
  id v3 = [v2 resolveProtocol:&unk_26D620000];
  v17 = [v2 resolveProtocol:&unk_26D5F3268];
  id v14 = [v2 resolveProtocol:&unk_26D6411D8];
  v13 = [v2 resolveProtocol:&unk_26D641830];
  id v11 = [v2 resolveProtocol:&unk_26D5C53F0];
  v10 = [v2 resolveProtocol:&unk_26D620770];
  id v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveClass:objc_opt_class()];
  id v6 = [v2 resolveProtocol:&unk_26D5E6430];
  v7 = [v2 resolveProtocol:&unk_26D5C9770];
  v8 = [v2 resolveProtocol:&unk_26D605340];

  id v16 = [(SXEmbedComponentViewFactory *)v15 initWithDOMObjectProvider:v18 viewport:v12 presentationDelegateProvider:v3 componentStyleRendererFactory:v17 reachabilityProvider:v14 embedDataProvider:v13 actionHandler:v11 layoutInvalidator:v10 websiteDataStore:v4 relatedWebViewCache:v5 proxyAuthenticationHandler:v6 sceneStateMonitor:v7 analyticsReportingProvider:v8];
  return v16;
}

SXEmbedComponentSizerFactory *__43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXEmbedComponentSizerFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveProtocol:&unk_26D641830];

  id v6 = [(SXEmbedComponentSizerFactory *)v3 initWithDOMObjectProvider:v4 embedDataProvider:v5];
  return v6;
}

id __43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D617678];
  id v3 = [v2 createWebsiteDataStore];

  return v3;
}

SXWebsiteDataStoreFactory *__43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXWebsiteDataStoreFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5ED378];

  id v5 = [(SXWebsiteDataStoreFactory *)v3 initWithProxyConfiguration:v4];
  return v5;
}

SXRelatedWebViewCache *__43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_7()
{
  v0 = objc_alloc_init(SXRelatedWebViewCache);
  return v0;
}

id __43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_8()
{
  return +[SXProxyConfiguration direct];
}

SXProxyAuthenticationHandler *__43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXProxyAuthenticationHandler alloc];
  id v4 = [v2 resolveProtocol:&unk_26D62B910];
  id v5 = [v2 resolveProtocol:&unk_26D5ED378];

  id v6 = [(SXProxyAuthenticationHandler *)v3 initWithCredentialFactory:v4 proxyConfiguration:v5 retryCount:1];
  return v6;
}

SXProxyAuthenticationCredentialFactory *__43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXProxyAuthenticationCredentialFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D619630];

  id v5 = [(SXProxyAuthenticationCredentialFactory *)v3 initWithKeyProvider:v4];
  return v5;
}

@end