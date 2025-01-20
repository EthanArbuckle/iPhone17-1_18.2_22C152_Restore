@interface SBHIconImageStyleConfiguration(SBSpringBoardServicesConvenience)
- (id)sb_homeScreenIconStyleConfiguration;
@end

@implementation SBHIconImageStyleConfiguration(SBSpringBoardServicesConvenience)

- (id)sb_homeScreenIconStyleConfiguration
{
  uint64_t v2 = [a1 configurationType];
  if (v2 == 4)
  {
    v4 = (void *)MEMORY[0x1E4FA6AB8];
    v5 = [a1 tintColor];
    v6 = [v5 BSColor];
    v7 = [v4 tintedStyleConfigurationWithTintColor:v6];
  }
  else
  {
    if (v2 == 3)
    {
      uint64_t v3 = [MEMORY[0x1E4FA6AB8] darkStyleConfiguration];
    }
    else
    {
      if (v2) {
        [MEMORY[0x1E4FA6AB8] lightStyleConfiguration];
      }
      else {
      uint64_t v3 = [MEMORY[0x1E4FA6AB8] automaticStyleConfiguration];
      }
    }
    v7 = (void *)v3;
  }
  return v7;
}

@end