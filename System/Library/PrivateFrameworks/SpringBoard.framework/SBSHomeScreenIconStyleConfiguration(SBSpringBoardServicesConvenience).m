@interface SBSHomeScreenIconStyleConfiguration(SBSpringBoardServicesConvenience)
- (id)sb_iconImageStyleConfiguration;
@end

@implementation SBSHomeScreenIconStyleConfiguration(SBSpringBoardServicesConvenience)

- (id)sb_iconImageStyleConfiguration
{
  switch([a1 configurationType])
  {
    case 0:
      uint64_t v2 = [MEMORY[0x1E4FA62A8] automaticStyleConfiguration];
      goto LABEL_6;
    case 1:
      uint64_t v2 = [MEMORY[0x1E4FA62A8] lightStyleConfiguration];
      goto LABEL_6;
    case 2:
      uint64_t v2 = [MEMORY[0x1E4FA62A8] darkStyleConfiguration];
LABEL_6:
      v3 = (void *)v2;
      break;
    case 3:
      v4 = (void *)MEMORY[0x1E4FA62A8];
      v5 = [a1 tintColor];
      v6 = [v5 UIColor];
      v3 = [v4 tintedStyleConfigurationWithTintColor:v6];

      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

@end