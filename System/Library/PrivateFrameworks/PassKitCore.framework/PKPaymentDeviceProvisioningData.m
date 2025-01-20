@interface PKPaymentDeviceProvisioningData
+ (BOOL)supportsSecureCoding;
@end

@implementation PKPaymentDeviceProvisioningData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end