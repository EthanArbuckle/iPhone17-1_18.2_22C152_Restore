@interface UIDevice(VK)
+ (BOOL)vk_isLargeiPad;
+ (BOOL)vk_isPlusiPhone;
+ (BOOL)vk_isiPad;
+ (BOOL)vk_isiPhone;
+ (uint64_t)vk_isCatalyst;
+ (uint64_t)vk_isSmalliPhone;
@end

@implementation UIDevice(VK)

+ (BOOL)vk_isiPad
{
  v0 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 1;

  return v1;
}

+ (uint64_t)vk_isSmalliPhone
{
  unsigned int v0 = MGGetSInt32Answer();
  return (v0 < 6) & (0x26u >> v0);
}

+ (BOOL)vk_isiPhone
{
  unsigned int v0 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 0;

  return v1;
}

+ (BOOL)vk_isPlusiPhone
{
  return MGGetSInt32Answer() == 9;
}

+ (BOOL)vk_isLargeiPad
{
  return MGGetSInt32Answer() == 11;
}

+ (uint64_t)vk_isCatalyst
{
  return 0;
}

@end