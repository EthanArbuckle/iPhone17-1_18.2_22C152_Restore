@interface PKNotifiablePaymentMarket
- (BOOL)isDCINotifiable;
- (BOOL)isDCIRenotifiable;
- (BOOL)isExpressRenotifiable;
- (BOOL)isExpressUpgradeNotifiable;
- (PKNotifiablePaymentMarket)initWithPaymentMarket:(id)a3 eligibleNotifiableState:(unint64_t)a4;
- (PKPaymentMarket)market;
@end

@implementation PKNotifiablePaymentMarket

- (PKNotifiablePaymentMarket)initWithPaymentMarket:(id)a3 eligibleNotifiableState:(unint64_t)a4
{
  id v7 = a3;
  if (a4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKNotifiablePaymentMarket;
    v8 = [(PKNotifiablePaymentMarket *)&v10 init];
    self = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_market, a3);
      self->_notifiableTypes = a4;
    }
  }

  return self;
}

- (BOOL)isDCINotifiable
{
  return self->_notifiableTypes & 1;
}

- (BOOL)isExpressUpgradeNotifiable
{
  return (LOBYTE(self->_notifiableTypes) >> 1) & 1;
}

- (BOOL)isDCIRenotifiable
{
  return (LOBYTE(self->_notifiableTypes) >> 2) & 1;
}

- (BOOL)isExpressRenotifiable
{
  return (LOBYTE(self->_notifiableTypes) >> 3) & 1;
}

- (PKPaymentMarket)market
{
  return (PKPaymentMarket *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end