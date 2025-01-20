@interface PKPaymentPreferenceShippingMethod
- (BOOL)supportsDeletion;
- (NSString)currency;
- (void)setCurrency:(id)a3;
@end

@implementation PKPaymentPreferenceShippingMethod

- (BOOL)supportsDeletion
{
  return 0;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (void).cxx_destruct
{
}

@end