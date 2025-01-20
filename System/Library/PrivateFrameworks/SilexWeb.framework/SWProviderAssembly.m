@interface SWProviderAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SWProviderAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D828808 factory:&__block_literal_global_3];

  v6 = [v3 privateContainer];
  id v7 = (id)[v6 registerProtocol:&unk_26D82AF10 factory:&__block_literal_global_56_0];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerProtocol:&unk_26D843848 factory:&__block_literal_global_75];

  v10 = [v3 privateContainer];
  id v11 = (id)[v10 registerProtocol:&unk_26D82A528 factory:&__block_literal_global_83_0];

  id v13 = [v3 publicContainer];

  id v12 = (id)[v13 registerProtocol:&unk_26D834C78 factory:&__block_literal_global_89_0];
}

SWActionProvider *__37__SWProviderAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWActionProvider alloc];
  v4 = [v2 resolveProtocol:&unk_26D843198];
  id v5 = [v2 resolveProtocol:&unk_26D82AF10];
  v6 = [v2 resolveProtocol:&unk_26D834F88];

  id v7 = [(SWActionProvider *)v3 initWithMessageHandlerManager:v4 actionFactory:v5 logger:v6];
  return v7;
}

SWActionFactory *__37__SWProviderAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWActionFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D829EB0];

  id v5 = [(SWActionFactory *)v3 initWithNavigationManager:v4];
  return v5;
}

SWInteractionProvider *__37__SWProviderAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWInteractionProvider alloc];
  v4 = [v2 resolveProtocol:&unk_26D843198];
  id v5 = [v2 resolveProtocol:&unk_26D828C08];
  v6 = [v2 resolveProtocol:&unk_26D82A528];
  id v7 = [v2 resolveProtocol:&unk_26D834F88];

  v8 = [(SWInteractionProvider *)v3 initWithMessageHandlerManager:v4 documentStateProvider:v5 interactionFactory:v6 logger:v7];
  return v8;
}

SWInteractionFactory *__37__SWProviderAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SWInteractionFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D829EB0];

  id v5 = [(SWInteractionFactory *)v3 initWithNavigationManager:v4];
  return v5;
}

SWLoadingPolicyProvider *__37__SWProviderAssembly_loadInRegistry___block_invoke_5()
{
  v0 = objc_alloc_init(SWLoadingPolicyProvider);
  return v0;
}

@end