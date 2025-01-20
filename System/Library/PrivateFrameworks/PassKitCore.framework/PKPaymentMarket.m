@interface PKPaymentMarket
- (id)closedLoopExpressCredentialTypes;
- (id)openLoopExpressCredentialTypes;
@end

@implementation PKPaymentMarket

- (id)openLoopExpressCredentialTypes
{
  v2 = [(PKPaymentMarket *)self expressCredentialTypes];
  v3 = [v2 objectsPassingTest:&stru_10074C628];

  return v3;
}

- (id)closedLoopExpressCredentialTypes
{
  v2 = [(PKPaymentMarket *)self expressCredentialTypes];
  v3 = [v2 objectsPassingTest:&stru_10074C648];

  return v3;
}

@end