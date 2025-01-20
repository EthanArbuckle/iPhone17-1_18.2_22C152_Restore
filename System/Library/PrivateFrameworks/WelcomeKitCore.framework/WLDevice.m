@interface WLDevice
+ (id)deviceName;
@end

@implementation WLDevice

+ (id)deviceName
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

@end