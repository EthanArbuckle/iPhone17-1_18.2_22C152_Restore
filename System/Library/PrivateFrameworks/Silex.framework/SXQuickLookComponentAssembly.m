@interface SXQuickLookComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXQuickLookComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D5ED4C8 scope:v5 callbackBlock:&__block_literal_global_52];

  v6 = [v3 callback];
  v7 = TFCallbackScopeAny();
  [v6 whenResolvingProtocol:&unk_26D61EA90 scope:v7 callbackBlock:&__block_literal_global_55_9];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_59_7];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerClass:objc_opt_class() factory:&__block_literal_global_125];

  id v13 = [v3 privateContainer];

  id v12 = (id)[v13 registerProtocol:&unk_26D5F51E0 factory:&__block_literal_global_128_1];
}

void __47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

SXQuickLookComponentViewFactory *__47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXQuickLookComponentViewFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveClass:objc_opt_class()];
  id v6 = [v2 resolveProtocol:&unk_26D620000];
  v7 = [v2 resolveProtocol:&unk_26D5F3268];
  v8 = [v2 resolveProtocol:&unk_26D5F51E0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke_4;
  v13[3] = &unk_264652F28;
  id v14 = v2;
  id v9 = v2;
  v10 = [v9 resolveProtocol:&unk_26D61E288 contextBlock:v13];
  id v11 = [(SXQuickLookComponentViewFactory *)v3 initWithDOMObjectProvider:v4 viewport:v5 presentationDelegateProvider:v6 componentStyleRendererFactory:v7 fileProvider:v8 quickLookModule:v10];

  return v11;
}

void __47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 resolveProtocol:&unk_26D5EFEA8];
  [v3 useObject:v4 forProtocol:&unk_26D5EFEA8];
}

SXQuickLookComponentSizerFactory *__47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke_5()
{
  v0 = objc_alloc_init(SXQuickLookComponentSizerFactory);
  return v0;
}

SXQuickLookComponentFileProvider *__47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveProtocol:&unk_26D620A88];
  id v4 = [v3 documentController];
  id v5 = [SXQuickLookComponentFileProvider alloc];
  id v6 = [v2 resolveProtocol:&unk_26D5C6E40];
  v7 = [v2 resolveProtocol:&unk_26D601790];

  v8 = [(SXQuickLookComponentFileProvider *)v5 initWithDOMObjectProvider:v6 resourceDataSourceProvider:v7 shareURLProvider:v4];
  return v8;
}

@end