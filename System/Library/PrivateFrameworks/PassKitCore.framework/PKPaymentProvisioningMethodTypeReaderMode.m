@interface PKPaymentProvisioningMethodTypeReaderMode
- (PKPaymentProvisioningMethodTypeReaderMode)init;
@end

@implementation PKPaymentProvisioningMethodTypeReaderMode

- (PKPaymentProvisioningMethodTypeReaderMode)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentProvisioningMethodTypeReaderMode;
  return [(PKPaymentProvisioningMethod *)&v3 initWithType:1];
}

@end