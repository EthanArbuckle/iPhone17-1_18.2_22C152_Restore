@interface SXArticleLinkComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXArticleLinkComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D5ED4C8 scope:v5 callbackBlock:&__block_literal_global_87];

  v6 = [v3 callback];
  v7 = TFCallbackScopeAny();
  [v6 whenResolvingProtocol:&unk_26D61EA90 scope:v7 callbackBlock:&__block_literal_global_55_20];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_59_18];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerClass:objc_opt_class() factory:&__block_literal_global_119_0];

  id v13 = [v3 publicContainer];

  id v12 = (id)[v13 registerProtocol:&unk_26D617250 factory:&__block_literal_global_121];
}

void __49__SXArticleLinkComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __49__SXArticleLinkComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

SXArticleLinkComponentViewFactory *__49__SXArticleLinkComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v14 = [SXArticleLinkComponentViewFactory alloc];
  id v3 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveProtocol:&unk_26D620000];
  id v6 = [v2 resolveProtocol:&unk_26D5F3268];
  v7 = [v2 resolveProtocol:&unk_26D5EB3F8];
  v8 = [v2 resolveProtocol:&unk_26D6015E8];
  id v9 = [v2 resolveProtocol:&unk_26D5E1468];
  v10 = [v2 resolveProtocol:&unk_26D5EF308];
  id v11 = [v2 resolveProtocol:&unk_26D617250];

  id v12 = [(SXArticleLinkComponentViewFactory *)v14 initWithDOMObjectProvider:v3 viewport:v4 presentationDelegateProvider:v5 componentStyleRendererFactory:v6 mediaSharingPolicyProvider:v7 interactionHandlerManager:v8 interactionHandlerFactory:v9 URLActionFactory:v10 articleURLFactory:v11];
  return v12;
}

SXArticleLinkComponentSizerFactory *__49__SXArticleLinkComponentAssembly_loadInRegistry___block_invoke_4()
{
  v0 = objc_alloc_init(SXArticleLinkComponentSizerFactory);
  return v0;
}

SXArticleURLFactory *__49__SXArticleLinkComponentAssembly_loadInRegistry___block_invoke_5()
{
  v0 = objc_alloc_init(SXArticleURLFactory);
  return v0;
}

@end