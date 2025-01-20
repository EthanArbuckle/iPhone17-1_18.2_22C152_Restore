@interface SXEmbedVideoComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXEmbedVideoComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D5ED4C8 scope:v5 callbackBlock:&__block_literal_global_33];

  v6 = [v3 callback];
  v7 = TFCallbackScopeAny();
  [v6 whenResolvingProtocol:&unk_26D61EA90 scope:v7 callbackBlock:&__block_literal_global_55_6];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_59_4];

  id v11 = [v3 publicContainer];

  id v10 = (id)[v11 registerClass:objc_opt_class() factory:&__block_literal_global_128_0];
}

void __48__SXEmbedVideoComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __48__SXEmbedVideoComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

SXEmbedVideoComponentViewFactory *__48__SXEmbedVideoComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXEmbedVideoComponentViewFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveClass:objc_opt_class()];
  id v6 = [v2 resolveProtocol:&unk_26D620000];
  v7 = [v2 resolveProtocol:&unk_26D5F3268];
  v15 = [v2 resolveProtocol:&unk_26D605340];
  v14 = [v2 resolveProtocol:&unk_26D6410F8];
  v8 = [v2 resolveProtocol:&unk_26D5C9770];
  id v9 = [v2 resolveProtocol:&unk_26D5C53F0];
  id v10 = [v2 resolveClass:objc_opt_class()];
  id v11 = [v2 resolveProtocol:&unk_26D5E6430];

  v13 = [(SXEmbedVideoComponentViewFactory *)v3 initWithDOMObjectProvider:v4 viewport:v5 presentationDelegateProvider:v6 componentStyleRendererFactory:v7 analyticsReportingProvider:v15 appStateMonitor:v14 sceneStateMonitor:v8 actionHandler:v9 websiteDataStore:v10 proxyAuthenticationHandler:v11];
  return v13;
}

SXEmbedVideoComponentSizerFactory *__48__SXEmbedVideoComponentAssembly_loadInRegistry___block_invoke_4()
{
  v0 = objc_alloc_init(SXEmbedVideoComponentSizerFactory);
  return v0;
}

@end