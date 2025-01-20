@interface WiFiUsageAccessPointProfileConfiguration
+ (id)getConfigForKey:(id)a3;
+ (void)initialize;
+ (void)setConfig:(id)a3;
@end

@implementation WiFiUsageAccessPointProfileConfiguration

+ (void)initialize
{
  v2 = (void *)_apProfileConfig;
  _apProfileConfig = 0;
}

+ (void)setConfig:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToDictionary:_apProfileConfig] & 1) == 0)
  {
    objc_storeStrong((id *)&_apProfileConfig, a3);
    +[WiFiUsageAccessPointProfile updateConfig];
    NSLog(&cfstr_SUpdatedWifius.isa, "+[WiFiUsageAccessPointProfileConfiguration setConfig:]");
  }
}

+ (id)getConfigForKey:(id)a3
{
  id v3 = a3;
  if (_apProfileConfig)
  {
    id v4 = [(id)_apProfileConfig objectForKey:v3];
    if (!v4) {
      NSLog(&cfstr_SDoesNotContai.isa, "+[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]", @"AccessPointProfile", v3);
    }
  }
  else
  {
    NSLog(&cfstr_SFeatureHasnTB.isa, "+[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]", @"AccessPointProfile");
    id v4 = 0;
  }

  return v4;
}

@end