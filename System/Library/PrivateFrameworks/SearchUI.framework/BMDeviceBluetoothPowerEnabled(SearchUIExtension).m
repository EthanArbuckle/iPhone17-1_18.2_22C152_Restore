@interface BMDeviceBluetoothPowerEnabled(SearchUIExtension)
- (void)getEnabledStatusWithCompletion:()SearchUIExtension;
@end

@implementation BMDeviceBluetoothPowerEnabled(SearchUIExtension)

- (void)getEnabledStatusWithCompletion:()SearchUIExtension
{
  id v5 = a3;
  ((void (**)(id, uint64_t))a3)[2](v5, [a1 starting]);
}

@end