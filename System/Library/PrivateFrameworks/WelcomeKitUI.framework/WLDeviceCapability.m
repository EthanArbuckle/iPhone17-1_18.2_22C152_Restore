@interface WLDeviceCapability
+ (BOOL)hasActionButton;
+ (BOOL)hasDynamicIsland;
+ (BOOL)hasHomeButton;
@end

@implementation WLDeviceCapability

+ (BOOL)hasActionButton
{
  return MEMORY[0x270F95FB8](@"RingerButtonCapability", a2);
}

+ (BOOL)hasHomeButton
{
  return MGGetSInt32Answer() < 2;
}

+ (BOOL)hasDynamicIsland
{
  return MEMORY[0x270F95FB8](@"DeviceSupportsDynamicIsland", a2);
}

@end