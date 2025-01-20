@interface CRLDeviceUtility
+ (BOOL)isDeviceCapableForUpdate;
@end

@implementation CRLDeviceUtility

+ (BOOL)isDeviceCapableForUpdate
{
  return sub_100CEB290() & 1;
}

@end