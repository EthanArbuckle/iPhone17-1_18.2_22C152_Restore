@interface SXScalableImageComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXScalableImageComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D5ED4C8 scope:v5 callbackBlock:&__block_literal_global_88];

  v6 = [v3 callback];
  v7 = TFCallbackScopeAny();
  [v6 whenResolvingProtocol:&unk_26D61EA90 scope:v7 callbackBlock:&__block_literal_global_55_21];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_59_19];

  id v11 = [v3 publicContainer];

  id v10 = (id)[v11 registerClass:objc_opt_class() factory:&__block_literal_global_129];
}

void __51__SXScalableImageComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __51__SXScalableImageComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

SXScalableImageComponentViewFactory *__51__SXScalableImageComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v14 = [SXScalableImageComponentViewFactory alloc];
  id v3 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveProtocol:&unk_26D620000];
  id v6 = [v2 resolveProtocol:&unk_26D5F3268];
  v7 = [v2 resolveProtocol:&unk_26D605340];
  v8 = [v2 resolveProtocol:&unk_26D6410F8];
  id v9 = [v2 resolveProtocol:&unk_26D5EC1E8];
  id v10 = [v2 resolveProtocol:&unk_26D5B5FC0];
  id v11 = [v2 resolveProtocol:&unk_26D5EB3F8];

  v12 = [(SXScalableImageComponentViewFactory *)v14 initWithDOMObjectProvider:v3 viewport:v4 presentationDelegateProvider:v5 componentStyleRendererFactory:v6 analyticsReportingProvider:v7 appStateMonitor:v8 imageViewFactory:v9 canvasControllerFactory:v10 mediaSharingPolicyProvider:v11];
  return v12;
}

SXScalableImageComponentSizerFactory *__51__SXScalableImageComponentAssembly_loadInRegistry___block_invoke_4()
{
  v0 = objc_alloc_init(SXScalableImageComponentSizerFactory);
  return v0;
}

@end