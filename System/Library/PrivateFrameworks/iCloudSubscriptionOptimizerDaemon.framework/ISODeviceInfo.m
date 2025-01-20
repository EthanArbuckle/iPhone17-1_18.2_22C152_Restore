@interface ISODeviceInfo
+ (BOOL)isInternalBuild;
@end

@implementation ISODeviceInfo

+ (BOOL)isInternalBuild
{
  return MEMORY[0x270EDAB40]("com.apple.icloudsubscriptionoptimizerd", a2);
}

@end