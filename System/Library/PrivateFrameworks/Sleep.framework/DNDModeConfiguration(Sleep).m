@interface DNDModeConfiguration(Sleep)
- (id)hksp_configurationWithConfigurationState:()Sleep;
- (uint64_t)hksp_configurationState;
@end

@implementation DNDModeConfiguration(Sleep)

- (uint64_t)hksp_configurationState
{
  v1 = [a1 configuration];
  if ([v1 senderConfigurationType] == 2 && objc_msgSend(v1, "applicationConfigurationType") == 2)
  {
    uint64_t v2 = 1;
  }
  else if ([v1 senderConfigurationType] || objc_msgSend(v1, "applicationConfigurationType"))
  {
    if ([v1 senderConfigurationType] == 1 && objc_msgSend(v1, "applicationConfigurationType") == 1) {
      uint64_t v2 = 2;
    }
    else {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 3;
  }

  return v2;
}

- (id)hksp_configurationWithConfigurationState:()Sleep
{
  v4 = (void *)[a1 mutableCopy];
  v5 = [v4 configuration];
  v6 = (void *)[v5 mutableCopy];

  if ((unint64_t)(a3 - 1) <= 2)
  {
    uint64_t v7 = 3 - a3;
    [v6 setSenderConfigurationType:v7];
    [v6 setApplicationConfigurationType:v7];
  }
  [v4 setConfiguration:v6];
  v8 = (void *)[v4 copy];

  return v8;
}

@end