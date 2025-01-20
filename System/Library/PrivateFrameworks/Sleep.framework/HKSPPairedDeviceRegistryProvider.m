@interface HKSPPairedDeviceRegistryProvider
- (id)getActivePairedDevice;
@end

@implementation HKSPPairedDeviceRegistryProvider

- (id)getActivePairedDevice
{
  v2 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v3 = [v2 getActivePairedDevice];

  return v3;
}

@end