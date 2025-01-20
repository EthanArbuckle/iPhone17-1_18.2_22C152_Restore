@interface SXVideoComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXVideoComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D5ED4C8 scope:v5 callbackBlock:&__block_literal_global_42];

  v6 = [v3 callback];
  v7 = TFCallbackScopeAny();
  [v6 whenResolvingProtocol:&unk_26D61EA90 scope:v7 callbackBlock:&__block_literal_global_55_7];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_59_5];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerProtocol:&unk_26D5C9770 factory:&__block_literal_global_140];

  v12 = [v3 publicContainer];
  id v13 = (id)[v12 registerClass:objc_opt_class() factory:&__block_literal_global_144];

  v14 = [v3 publicContainer];
  id v15 = (id)[v14 registerClass:objc_opt_class() factory:&__block_literal_global_147];

  v16 = [v3 publicContainer];
  id v17 = (id)[v16 registerProtocol:&unk_26D603428 factory:&__block_literal_global_149];

  id v19 = [v3 publicContainer];

  id v18 = (id)[v19 registerClass:objc_opt_class() factory:&__block_literal_global_152];
}

void __43__SXVideoComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __43__SXVideoComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

SXVideoComponentViewFactory *__43__SXVideoComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v15 = [SXVideoComponentViewFactory alloc];
  id v18 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v3 = [v2 resolveClass:objc_opt_class()];
  id v4 = [v2 resolveProtocol:&unk_26D620000];
  id v17 = [v2 resolveProtocol:&unk_26D5F3268];
  v14 = [v2 resolveProtocol:&unk_26D605340];
  id v13 = [v2 resolveProtocol:&unk_26D6410F8];
  v12 = [v2 resolveProtocol:&unk_26D5C9770];
  id v11 = [v2 resolveProtocol:&unk_26D601790];
  id v5 = [v2 resolveProtocol:&unk_26D6411D8];
  id v6 = [v2 resolveProtocol:&unk_26D6173C8];
  v7 = [v2 resolveClass:objc_opt_class()];
  v8 = [v2 resolveProtocol:&unk_26D5DEC78];
  id v9 = [v2 resolveProtocol:&unk_26D603428];

  v16 = [(SXVideoComponentViewFactory *)v15 initWithDOMObjectProvider:v18 viewport:v3 presentationDelegateProvider:v4 componentStyleRendererFactory:v17 analyticsReportingProvider:v14 appStateMonitor:v13 sceneStateMonitor:v12 resourceDataSourceProvider:v11 reachabilityProvider:v5 scrollObserverManager:v6 videoPlayerViewControllerManager:v7 bookmarkManager:v8 prerollAdFactory:v9];
  return v16;
}

SXDefaultSceneStateMonitor *__43__SXVideoComponentAssembly_loadInRegistry___block_invoke_4()
{
  v0 = objc_alloc_init(SXDefaultSceneStateMonitor);
  return v0;
}

SXVideoComponentSizerFactory *__43__SXVideoComponentAssembly_loadInRegistry___block_invoke_5()
{
  v0 = objc_alloc_init(SXVideoComponentSizerFactory);
  return v0;
}

SXVideoPlayerViewControllerManager *__43__SXVideoComponentAssembly_loadInRegistry___block_invoke_6()
{
  v0 = objc_alloc_init(SXVideoPlayerViewControllerManager);
  return v0;
}

id __43__SXVideoComponentAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

SXLegacyPrerollAdFactory *__43__SXVideoComponentAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLegacyPrerollAdFactory alloc];
  id v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveProtocol:&unk_26D6173C8];

  id v6 = [(SXLegacyPrerollAdFactory *)v3 initWithViewport:v4 scrollObserverManager:v5];
  return v6;
}

@end