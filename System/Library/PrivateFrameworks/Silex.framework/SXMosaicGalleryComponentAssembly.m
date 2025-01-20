@interface SXMosaicGalleryComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXMosaicGalleryComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D5ED4C8 scope:v5 callbackBlock:&__block_literal_global_81];

  v6 = [v3 callback];
  v7 = TFCallbackScopeAny();
  [v6 whenResolvingProtocol:&unk_26D61EA90 scope:v7 callbackBlock:&__block_literal_global_55_19];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_59_17];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerClass:objc_opt_class() factory:&__block_literal_global_124_0];

  id v13 = [v3 privateContainer];

  id v12 = (id)[v13 registerProtocol:&unk_26D5C61A0 factory:&__block_literal_global_127];
}

void __51__SXMosaicGalleryComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __51__SXMosaicGalleryComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

SXMosaicGalleryComponentViewFactory *__51__SXMosaicGalleryComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v14 = [SXMosaicGalleryComponentViewFactory alloc];
  id v3 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveProtocol:&unk_26D620000];
  id v6 = [v2 resolveProtocol:&unk_26D5F3268];
  v7 = [v2 resolveProtocol:&unk_26D605340];
  v8 = [v2 resolveProtocol:&unk_26D6410F8];
  id v9 = [v2 resolveProtocol:&unk_26D5EB3F8];
  v10 = [v2 resolveProtocol:&unk_26D5C61A0];
  id v11 = [v2 resolveProtocol:&unk_26D5B5FC0];

  id v12 = [(SXMosaicGalleryComponentViewFactory *)v14 initWithDOMObjectProvider:v3 viewport:v4 presentationDelegateProvider:v5 componentStyleRendererFactory:v6 analyticsReportingProvider:v7 appStateMonitor:v8 mediaSharingPolicyProvider:v9 imageViewFactory:v10 canvasControllerFactory:v11];
  return v12;
}

SXMosaicGalleryComponentSizerFactory *__51__SXMosaicGalleryComponentAssembly_loadInRegistry___block_invoke_4()
{
  v0 = objc_alloc_init(SXMosaicGalleryComponentSizerFactory);
  return v0;
}

SXGalleryItemImageViewFactory *__51__SXMosaicGalleryComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXGalleryItemImageViewFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D601790];
  id v5 = [v2 resolveProtocol:&unk_26D6411D8];

  id v6 = [(SXGalleryItemImageViewFactory *)v3 initWithResourceDataSourceProvider:v4 reachabilityProvider:v5];
  return v6;
}

@end