@interface SBSHomeScreenIconStyleConfiguration(SBHUtilities)
- (id)sbh_iconImageStyleConfiguration;
@end

@implementation SBSHomeScreenIconStyleConfiguration(SBHUtilities)

- (id)sbh_iconImageStyleConfiguration
{
  switch([a1 configurationType])
  {
    case 0:
      uint64_t v2 = +[SBHIconImageStyleConfiguration automaticStyleConfiguration];
      goto LABEL_6;
    case 1:
      uint64_t v2 = +[SBHIconImageStyleConfiguration lightStyleConfiguration];
      goto LABEL_6;
    case 2:
      uint64_t v2 = +[SBHIconImageStyleConfiguration darkStyleConfiguration];
LABEL_6:
      v3 = (void *)v2;
      break;
    case 3:
      v4 = [a1 tintColor];
      v5 = [v4 UIColor];
      v3 = +[SBHIconImageStyleConfiguration tintedStyleConfigurationWithTintColor:v5];

      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

@end