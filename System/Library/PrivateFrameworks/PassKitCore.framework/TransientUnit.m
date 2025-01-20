@interface TransientUnit
- (NSDecimalNumber)value;
- (NSString)currency;
- (NSString)identifier;
- (NSString)label;
- (id)commutePlanUnit;
- (int64_t)planType;
- (void)setCurrency:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPlanType:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation TransientUnit

- (id)commutePlanUnit
{
  int64_t planType = self->_planType;
  id v4 = objc_alloc((Class)PKTransactionCommutePlanUnit);
  identifier = self->_identifier;
  if (planType == 1) {
    id v6 = [v4 initWithCountPlanIdentifier:identifier currencyCode:self->_currency value:self->_value label:self->_label];
  }
  else {
    id v6 = [v4 initWithTimedPlanIdentifier:identifier label:self->_label];
  }
  return v6;
}

- (NSDecimalNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  self->_value = (NSDecimalNumber *)a3;
}

- (int64_t)planType
{
  return self->_planType;
}

- (void)setPlanType:(int64_t)a3
{
  self->_int64_t planType = a3;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_currency, 0);
}

@end