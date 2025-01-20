@interface SXOfferUpsellScenarioProvider
- (SXOfferUpsellScenarioProvider)init;
- (SXOfferUpsellScenarioProvider)initWithOfferUpsellScenario:(int64_t)a3;
- (int64_t)offerUpsellScenario;
@end

@implementation SXOfferUpsellScenarioProvider

- (SXOfferUpsellScenarioProvider)init
{
  return [(SXOfferUpsellScenarioProvider *)self initWithOfferUpsellScenario:0];
}

- (SXOfferUpsellScenarioProvider)initWithOfferUpsellScenario:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXOfferUpsellScenarioProvider;
  result = [(SXOfferUpsellScenarioProvider *)&v5 init];
  if (result) {
    result->_offerUpsellScenario = a3;
  }
  return result;
}

- (int64_t)offerUpsellScenario
{
  return self->_offerUpsellScenario;
}

@end