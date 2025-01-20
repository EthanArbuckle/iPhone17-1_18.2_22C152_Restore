@interface SXIssueCoverComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXIssueCoverComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D5ED4C8 scope:v5 callbackBlock:&__block_literal_global_50];

  v6 = [v3 callback];
  v7 = TFCallbackScopeAny();
  [v6 whenResolvingProtocol:&unk_26D61EA90 scope:v7 callbackBlock:&__block_literal_global_55_8];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_59_6];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerClass:objc_opt_class() factory:&__block_literal_global_110];

  v12 = [v3 publicContainer];
  id v13 = (id)[v12 registerProtocol:&unk_26D620CD0 factory:&__block_literal_global_116];

  id v15 = [v3 publicContainer];

  id v14 = (id)[v15 registerProtocol:&unk_26D606B58 factory:&__block_literal_global_120_1];
}

void __48__SXIssueCoverComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __48__SXIssueCoverComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

SXIssueCoverComponentViewFactory *__48__SXIssueCoverComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXIssueCoverComponentViewFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveClass:objc_opt_class()];
  id v6 = [v2 resolveProtocol:&unk_26D620000];
  v7 = [v2 resolveProtocol:&unk_26D5F3268];
  v8 = [v2 resolveProtocol:&unk_26D620CD0];

  id v9 = [(SXIssueCoverComponentViewFactory *)v3 initWithDOMObjectProvider:v4 viewport:v5 presentationDelegateProvider:v6 componentStyleRendererFactory:v7 viewProvider:v8];
  return v9;
}

SXIssueCoverComponentSizerFactory *__48__SXIssueCoverComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXIssueCoverComponentSizerFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D606B58];

  id v5 = [(SXIssueCoverComponentSizerFactory *)v3 initWithLayoutAttributesFactory:v4];
  return v5;
}

SXIssueCoverViewProvider *__48__SXIssueCoverComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXIssueCoverViewProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D606B58];

  id v5 = [(SXIssueCoverViewProvider *)v3 initWithLayoutAttributesFactory:v4];
  return v5;
}

SXIssueCoverLayoutAttributesFactory *__48__SXIssueCoverComponentAssembly_loadInRegistry___block_invoke_6()
{
  v0 = objc_alloc_init(SXIssueCoverLayoutAttributesFactory);
  return v0;
}

@end