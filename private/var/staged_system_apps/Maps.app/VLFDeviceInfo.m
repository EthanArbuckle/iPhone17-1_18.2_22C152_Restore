@interface VLFDeviceInfo
+ (BOOL)isIslandDevice;
+ (BOOL)isNotchDevice;
@end

@implementation VLFDeviceInfo

+ (BOOL)isNotchDevice
{
  if (qword_101610278 != -1) {
    dispatch_once(&qword_101610278, &stru_1013129C0);
  }
  return byte_101610270;
}

+ (BOOL)isIslandDevice
{
  if (qword_101610280 != -1) {
    dispatch_once(&qword_101610280, &stru_1013129E0);
  }
  return byte_101610271;
}

@end