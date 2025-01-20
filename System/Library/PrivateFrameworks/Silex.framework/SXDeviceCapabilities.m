@interface SXDeviceCapabilities
- (BOOL)hasCellularTelephonyCapabilities;
@end

@implementation SXDeviceCapabilities

- (BOOL)hasCellularTelephonyCapabilities
{
  return MGGetBoolAnswer();
}

@end