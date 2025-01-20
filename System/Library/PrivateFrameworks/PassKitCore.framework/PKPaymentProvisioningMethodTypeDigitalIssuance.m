@interface PKPaymentProvisioningMethodTypeDigitalIssuance
- (PKPaymentProvisioningMethodTypeDigitalIssuance)init;
@end

@implementation PKPaymentProvisioningMethodTypeDigitalIssuance

- (PKPaymentProvisioningMethodTypeDigitalIssuance)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentProvisioningMethodTypeDigitalIssuance;
  return [(PKPaymentProvisioningMethod *)&v3 initWithType:2];
}

@end