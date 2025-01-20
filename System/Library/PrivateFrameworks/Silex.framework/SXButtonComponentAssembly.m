@interface SXButtonComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXButtonComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerClass:objc_opt_class() factory:&__block_literal_global_17];

  v6 = [v3 publicContainer];
  v7 = [v6 registerClass:objc_opt_class() factory:&__block_literal_global_104];
  id v8 = (id)[v7 withConfiguration:&__block_literal_global_109_0];

  v9 = [v3 callback];
  v10 = TFCallbackScopeAny();
  [v9 whenResolvingProtocol:&unk_26D5ED4C8 scope:v10 callbackBlock:&__block_literal_global_120_0];

  v11 = [v3 callback];
  v12 = TFCallbackScopeAny();
  [v11 whenResolvingProtocol:&unk_26D61EA90 scope:v12 callbackBlock:&__block_literal_global_128];

  id v14 = [v3 privateContainer];

  id v13 = (id)[v14 registerClass:objc_opt_class() factory:&__block_literal_global_131];
}

SXButtonComponentViewFactory *__44__SXButtonComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXButtonComponentViewFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveClass:objc_opt_class()];
  v6 = [v2 resolveProtocol:&unk_26D620000];
  v7 = [v2 resolveProtocol:&unk_26D5F3268];
  id v8 = [v2 resolveProtocol:&unk_26D5E1468];
  v9 = [v2 resolveProtocol:&unk_26D6015E8];

  v10 = [(SXButtonComponentViewFactory *)v3 initWithDOMObjectProvider:v4 viewport:v5 presentationDelegateProvider:v6 componentStyleRendererFactory:v7 interactionHandlerFactory:v8 interactionHandlerManager:v9];
  return v10;
}

SXButtonComponentSizerFactory *__44__SXButtonComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXButtonComponentSizerFactory alloc];
  v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveProtocol:&unk_26D5D8F58];

  v6 = [(SXButtonComponentSizerFactory *)v3 initWithTextProvider:v4 textSourceFactory:v5];
  return v6;
}

void __44__SXButtonComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 resolveProtocol:&unk_26D61A1E0];
  [v4 setTextComponentLayoutHosting:v5];
}

void __44__SXButtonComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __44__SXButtonComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

SXButtonComponentTextProvider *__44__SXButtonComponentAssembly_loadInRegistry___block_invoke_6()
{
  v0 = objc_alloc_init(SXButtonComponentTextProvider);
  return v0;
}

@end