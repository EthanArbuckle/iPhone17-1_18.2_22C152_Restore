@interface StolenDeviceProtectionWrapper
+ (BOOL)isRatchetEnabled;
+ (BOOL)isRatchetFeatureAvailable;
@end

@implementation StolenDeviceProtectionWrapper

+ (BOOL)isRatchetFeatureAvailable
{
  id PSUIDeviceTakeOverControllerClass = getPSUIDeviceTakeOverControllerClass();
  return [PSUIDeviceTakeOverControllerClass isRatchetFeatureAvailable];
}

+ (BOOL)isRatchetEnabled
{
  id v2 = objc_alloc_init((Class)getPSUIDeviceTakeOverControllerClass());
  char v3 = [v2 isRatchetEnabled];

  return v3;
}

@end