@interface SXTangierAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXTangierAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerClass:objc_opt_class() factory:&__block_literal_global_98];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerClass:objc_opt_class() factory:&__block_literal_global_5];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerProtocol:&unk_26D61A1E0 factory:&__block_literal_global_139_0];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerClass:objc_opt_class() factory:&__block_literal_global_142];

  v12 = [v3 publicContainer];
  id v13 = (id)[v12 registerProtocol:&unk_26D5B4A60 factory:&__block_literal_global_148_0];

  id v15 = [v3 publicContainer];

  id v14 = (id)[v15 registerProtocol:&unk_26D5D8F58 factory:&__block_literal_global_164_0];
}

SXScrollView *__36__SXTangierAssembly_loadInRegistry___block_invoke()
{
  v0 = objc_alloc_init(SXScrollView);
  return v0;
}

SXTangierController *__36__SXTangierAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v14 = [SXTangierController alloc];
  id v3 = [v2 resolveClass:objc_opt_class()];
  v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveProtocol:&unk_26D5C53F0];
  v6 = [v2 resolveClass:objc_opt_class()];
  id v7 = [v2 resolveProtocol:&unk_26D62F5A8];
  v8 = [v2 resolveProtocol:&unk_26D606800];
  id v9 = [v2 resolveProtocol:&unk_26D5C6E40];
  v10 = [v2 resolveProtocol:&unk_26D5F5A48];
  id v11 = [v2 resolveProtocol:&unk_26D5B5B28];

  v12 = [(SXTangierController *)v14 initWithViewport:v3 scrollView:v4 componentActionHandler:v5 dragItemProvider:v6 componentController:v7 componentInteractionManager:v8 DOMObjectProvider:v9 adIgnorableViewFactory:v10 config:v11];
  return v12;
}

id __36__SXTangierAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

SXTangierDragItemProvider *__36__SXTangierAssembly_loadInRegistry___block_invoke_4()
{
  v0 = objc_alloc_init(SXTangierDragItemProvider);
  return v0;
}

SXSmartFieldFactory *__36__SXTangierAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXSmartFieldFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D610D30];
  id v5 = [v2 resolveProtocol:&unk_26D5C3410];

  v6 = [(SXSmartFieldFactory *)v3 initWithActionProvider:v4 actionSerializer:v5];
  return v6;
}

SXTextSourceFactory *__36__SXTangierAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXTextSourceFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5B4A60];
  id v5 = [v2 resolveProtocol:&unk_26D5DEB98];
  v6 = [v2 resolveProtocol:&unk_26D604490];

  id v7 = [(SXTextSourceFactory *)v3 initWithSmartFieldFactory:v4 documentLanguageProvider:v5 fontAttributesConstructor:v6];
  return v7;
}

@end