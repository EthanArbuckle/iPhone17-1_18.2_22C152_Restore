@interface DIPMobileKeyBag
+ (int64_t)deviceLockState;
@end

@implementation DIPMobileKeyBag

+ (int64_t)deviceLockState
{
  return (int)MKBGetDeviceLockState();
}

@end