@interface NTPBTodayWidgetConfig(NTAdditions)
- (id)externalAnalyticsConfigurations;
- (void)setExternalAnalyticsConfigurations:()NTAdditions;
@end

@implementation NTPBTodayWidgetConfig(NTAdditions)

- (void)setExternalAnalyticsConfigurations:()NTAdditions
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [a1 setExternalAnalyticsConfigurationsData:v4];
}

- (id)externalAnalyticsConfigurations
{
  v1 = [a1 externalAnalyticsConfigurationsData];
  if (v1)
  {
    v2 = (void *)MEMORY[0x263F08928];
    v3 = (void *)MEMORY[0x263EFFA08];
    uint64_t v4 = objc_opt_class();
    id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
    v6 = objc_msgSend(v2, "nf_securelyUnarchiveObjectOfClasses:withData:", v5, v1);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end