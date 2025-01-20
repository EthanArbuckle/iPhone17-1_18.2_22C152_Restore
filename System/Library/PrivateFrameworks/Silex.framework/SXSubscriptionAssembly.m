@interface SXSubscriptionAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXSubscriptionAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D62BAB8 factory:&__block_literal_global_91];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerProtocol:&unk_26D5F3E98 factory:&__block_literal_global_60_0];

  id v9 = [v3 publicContainer];

  id v8 = (id)[v9 registerProtocol:&unk_26D5B5E60 factory:&__block_literal_global_68];
}

SXSubscribeActionHandler *__41__SXSubscriptionAssembly_loadInRegistry___block_invoke()
{
  v0 = objc_alloc_init(SXSubscribeActionHandler);
  return v0;
}

SXSubscriptionStatusProvider *__41__SXSubscriptionAssembly_loadInRegistry___block_invoke_2()
{
  v0 = [[SXSubscriptionStatusProvider alloc] initWithBundleSubscriptionStatus:0 channelSubscriptionStatus:0];
  return v0;
}

SXSubscriptionActivationEligibilityDefaultProvider *__41__SXSubscriptionAssembly_loadInRegistry___block_invoke_3()
{
  v0 = objc_alloc_init(SXSubscriptionActivationEligibilityDefaultProvider);
  return v0;
}

@end