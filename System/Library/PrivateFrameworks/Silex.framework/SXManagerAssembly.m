@interface SXManagerAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXManagerAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  v5 = [v4 registerProtocol:&unk_26D5F3920 factory:&__block_literal_global_77];
  id v6 = (id)[v5 withConfiguration:&__block_literal_global_55_17];

  v7 = [v3 publicContainer];
  id v8 = (id)[v7 registerProtocol:&unk_26D5C8BD8 factory:&__block_literal_global_62_1];

  v9 = [v3 privateContainer];
  id v10 = (id)[v9 registerClass:objc_opt_class() factory:&__block_literal_global_66];

  id v12 = [v3 privateContainer];

  id v11 = (id)[v12 registerClass:objc_opt_class() factory:&__block_literal_global_83];
}

SXInteractionContextManager *__36__SXManagerAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXInteractionContextManager alloc];
  v4 = [v2 resolveClass:objc_opt_class()];

  v5 = [(SXInteractionContextManager *)v3 initWithViewport:v4];
  return v5;
}

void __36__SXManagerAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 resolveClass:objc_opt_class()];
  [v4 addProvider:v6];

  id v7 = [v5 resolveClass:objc_opt_class()];

  [v4 addProvider:v7];
}

SXLinkHoverStylingManager *__36__SXManagerAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLinkHoverStylingManager alloc];
  id v4 = [v2 resolveClass:objc_opt_class()];

  id v5 = [(SXLinkHoverStylingManager *)v3 initWithTangierController:v4];
  return v5;
}

SXTextInteractionContextProvider *__36__SXManagerAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXTextInteractionContextProvider alloc];
  id v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveProtocol:&unk_26D5B2B70];

  id v6 = [(SXTextInteractionContextProvider *)v3 initWithTangierController:v4 actionManager:v5];
  return v6;
}

SXComponentInteractionContextProvider *__36__SXManagerAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXComponentInteractionContextProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D6015E8];
  id v5 = [v2 resolveProtocol:&unk_26D5B2B70];

  id v6 = [(SXComponentInteractionContextProvider *)v3 initWithComponentInteractionHandlerManager:v4 actionManager:v5];
  return v6;
}

@end