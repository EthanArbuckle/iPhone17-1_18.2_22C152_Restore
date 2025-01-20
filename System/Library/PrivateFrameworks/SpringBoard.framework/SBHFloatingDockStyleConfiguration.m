@interface SBHFloatingDockStyleConfiguration
@end

@implementation SBHFloatingDockStyleConfiguration

void __86__SBHFloatingDockStyleConfiguration_SBAppAdditions__configurationWithEnvironmentMode___block_invoke()
{
  id v2 = [MEMORY[0x1E4FA6260] defaultConfiguration];
  uint64_t v0 = [v2 configurationWithWantsPlatterShadow:1];
  v1 = (void *)configurationWithEnvironmentMode__appConfiguration;
  configurationWithEnvironmentMode__appConfiguration = v0;
}

@end