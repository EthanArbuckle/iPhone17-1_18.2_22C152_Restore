@interface SXSubscriptionButtonComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXSubscriptionButtonComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  v5 = [v4 registerClass:objc_opt_class() factory:&__block_literal_global_80];
  id v6 = (id)[v5 withConfiguration:&__block_literal_global_4_1];

  v7 = [v3 callback];
  v8 = TFCallbackScopeAny();
  [v7 whenResolvingProtocol:&unk_26D61EA90 scope:v8 callbackBlock:&__block_literal_global_56_0];

  v9 = [v3 privateContainer];
  id v10 = (id)[v9 registerClass:objc_opt_class() factory:&__block_literal_global_59_16];

  id v12 = [v3 publicContainer];

  id v11 = (id)[v12 registerProtocol:&unk_26D5E9578 factory:&__block_literal_global_66_0];
}

SXSubscriptionButtonComponentSizerFactory *__56__SXSubscriptionButtonComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXSubscriptionButtonComponentSizerFactory alloc];
  v4 = [v2 resolveClass:objc_opt_class()];
  v5 = [v2 resolveProtocol:&unk_26D5D8F58];

  id v6 = [(SXButtonComponentSizerFactory *)v3 initWithTextProvider:v4 textSourceFactory:v5];
  return v6;
}

void __56__SXSubscriptionButtonComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 resolveProtocol:&unk_26D61A1E0];
  [v4 setTextComponentLayoutHosting:v5];
}

void __56__SXSubscriptionButtonComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

SXSubscriptionButtonComponentTextProvider *__56__SXSubscriptionButtonComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXSubscriptionButtonComponentTextProvider alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5E9578];

  id v5 = [(SXSubscriptionButtonComponentTextProvider *)v3 initWithTextProvider:v4];
  return v5;
}

SXSubscriptionButtonTextProvider *__56__SXSubscriptionButtonComponentAssembly_loadInRegistry___block_invoke_5()
{
  v0 = [SXSubscriptionButtonTextProvider alloc];
  v1 = SXBundle();
  id v2 = [v1 localizedStringForKey:@"Subscribe" value:&stru_26D5311C0 table:0];
  id v3 = [(SXSubscriptionButtonTextProvider *)v0 initWithTitle:v2];

  return v3;
}

@end