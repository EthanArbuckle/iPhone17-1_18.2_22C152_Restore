@interface DMDLockUtilities
+ (void)lockDevice;
@end

@implementation DMDLockUtilities

+ (void)lockDevice
{
  uint64_t v2 = SBSSpringBoardServerPort();

  _SBLockDevice(v2, 1);
}

@end