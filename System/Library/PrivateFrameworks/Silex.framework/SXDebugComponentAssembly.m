@interface SXDebugComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXDebugComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D5ED4C8 scope:v5 callbackBlock:&__block_literal_global_101];

  v6 = [v3 callback];
  v7 = TFCallbackScopeAny();
  [v6 whenResolvingProtocol:&unk_26D61EA90 scope:v7 callbackBlock:&__block_literal_global_55_23];

  v8 = [v3 callback];
  v9 = TFCallbackScopeAny();
  [v8 whenResolvingProtocol:&unk_26D5F0428 scope:v9 callbackBlock:&__block_literal_global_68_0];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerClass:objc_opt_class() factory:&__block_literal_global_72_0];

  v12 = [v3 publicContainer];
  id v13 = (id)[v12 registerClass:objc_opt_class() factory:&__block_literal_global_118_2];

  id v15 = [v3 publicContainer];

  id v14 = (id)[v15 registerClass:objc_opt_class() factory:&__block_literal_global_121_0];
}

void __43__SXDebugComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __43__SXDebugComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __43__SXDebugComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addInserter:v6];
}

SXDebugComponentViewFactory *__43__SXDebugComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDebugComponentViewFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveClass:objc_opt_class()];
  id v6 = [v2 resolveProtocol:&unk_26D620000];
  v7 = [v2 resolveProtocol:&unk_26D5F3268];
  v8 = [v2 resolveProtocol:&unk_26D620770];

  v9 = [(SXDebugComponentViewFactory *)v3 initWithDOMObjectProvider:v4 viewport:v5 presentationDelegateProvider:v6 componentStyleRendererFactory:v7 invalidator:v8];
  return v9;
}

SXDebugComponentSizerFactory *__43__SXDebugComponentAssembly_loadInRegistry___block_invoke_5()
{
  v0 = objc_alloc_init(SXDebugComponentSizerFactory);
  return v0;
}

SXDebugComponentInserter *__43__SXDebugComponentAssembly_loadInRegistry___block_invoke_6()
{
  v0 = objc_alloc_init(SXDebugComponentInserter);
  return v0;
}

@end