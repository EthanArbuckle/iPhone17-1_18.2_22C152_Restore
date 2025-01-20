@interface FTDeviceDataSource
- (BOOL)isBootLockEnabled;
@end

@implementation FTDeviceDataSource

- (BOOL)isBootLockEnabled
{
  return MKBDeviceUnlockedSinceBoot() != 1;
}

@end