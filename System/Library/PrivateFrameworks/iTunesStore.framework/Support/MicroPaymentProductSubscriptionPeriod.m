@interface MicroPaymentProductSubscriptionPeriod
- (unint64_t)numberOfUnits;
- (unint64_t)unit;
- (void)setNumberOfUnits:(unint64_t)a3;
- (void)setUnit:(unint64_t)a3;
@end

@implementation MicroPaymentProductSubscriptionPeriod

- (unint64_t)numberOfUnits
{
  return self->_numberOfUnits;
}

- (void)setNumberOfUnits:(unint64_t)a3
{
  self->_numberOfUnits = a3;
}

- (unint64_t)unit
{
  return self->_unit;
}

- (void)setUnit:(unint64_t)a3
{
  self->_unit = a3;
}

@end