@interface SBHFloatingDockStyleConfiguration(SBAppAdditions)
+ (id)configurationWithEnvironmentMode:()SBAppAdditions;
@end

@implementation SBHFloatingDockStyleConfiguration(SBAppAdditions)

+ (id)configurationWithEnvironmentMode:()SBAppAdditions
{
  if (a3 == 3)
  {
    if (configurationWithEnvironmentMode__onceToken != -1) {
      dispatch_once(&configurationWithEnvironmentMode__onceToken, &__block_literal_global_277);
    }
    id v3 = (id)configurationWithEnvironmentMode__appConfiguration;
  }
  else
  {
    id v3 = [MEMORY[0x1E4FA6260] defaultConfiguration];
  }
  return v3;
}

@end