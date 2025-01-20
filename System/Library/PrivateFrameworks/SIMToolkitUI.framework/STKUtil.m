@interface STKUtil
+ (BOOL)isDeviceLocked;
@end

@implementation STKUtil

+ (BOOL)isDeviceLocked
{
  unsigned int v2 = MKBGetDeviceLockState();
  return (v2 < 8) & (0xF6u >> v2);
}

@end