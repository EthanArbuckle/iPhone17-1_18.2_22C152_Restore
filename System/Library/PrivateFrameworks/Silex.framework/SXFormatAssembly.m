@interface SXFormatAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXFormatAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D5D90C8 factory:&__block_literal_global_24];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerProtocol:&unk_26D5DFA10 factory:&__block_literal_global_55_3];

  id v9 = [v3 privateContainer];

  id v8 = (id)[v9 registerProtocol:&unk_26D5B7C58 factory:&__block_literal_global_114];
}

SXFormatModule *__35__SXFormatAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SXFormatModule alloc] initWithResolver:v2];

  return v3;
}

SXFormatInteractor *__35__SXFormatAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v14 = [SXFormatInteractor alloc];
  id v3 = [v2 resolveProtocol:&unk_26D607698];
  v4 = [v2 resolveProtocol:&unk_26D5B7C58];
  id v5 = [v2 resolveProtocol:&unk_26D5EB460];
  v6 = [v2 resolveProtocol:&unk_26D5F3E98];
  id v7 = [v2 resolveProtocol:&unk_26D5C5AD8];
  id v8 = [v2 resolveProtocol:&unk_26D600690];
  id v9 = [v2 resolveProtocol:&unk_26D5B2E10];
  v10 = [v2 resolveProtocol:&unk_26D5B5E60];
  v11 = [v2 resolveProtocol:&unk_26D6412E0];

  v12 = [(SXFormatInteractor *)v14 initWithLayoutCoordinator:v3 layoutOptionsFactory:v4 presentationAttributesProvider:v5 subscriptionStatusProvider:v6 debugLayoutOptionsProvider:v7 newsletterSubscriptionStatusProvider:v8 offerUpsellScenarioProvider:v9 subscriptionActivationEligibilityProvider:v10 renderingConfigurationProvider:v11];
  return v12;
}

SXLayoutOptionsFactory *__35__SXFormatAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLayoutOptionsFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5D9A38];
  id v5 = [v2 resolveProtocol:&unk_26D5F1270];

  v6 = [(SXLayoutOptionsFactory *)v3 initWithColumnCalculator:v4 documentProvider:v5];
  return v6;
}

@end