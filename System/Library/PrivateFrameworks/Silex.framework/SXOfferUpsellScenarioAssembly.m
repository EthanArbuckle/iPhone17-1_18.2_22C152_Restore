@interface SXOfferUpsellScenarioAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXOfferUpsellScenarioAssembly

- (void)loadInRegistry:(id)a3
{
  id v4 = [a3 publicContainer];
  id v3 = (id)[v4 registerProtocol:&unk_26D5B2E10 factory:&__block_literal_global_35];
}

SXOfferUpsellScenarioProvider *__48__SXOfferUpsellScenarioAssembly_loadInRegistry___block_invoke()
{
  v0 = [[SXOfferUpsellScenarioProvider alloc] initWithOfferUpsellScenario:0];
  return v0;
}

@end