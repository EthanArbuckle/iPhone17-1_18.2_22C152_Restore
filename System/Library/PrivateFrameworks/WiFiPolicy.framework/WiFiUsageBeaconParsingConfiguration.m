@interface WiFiUsageBeaconParsingConfiguration
+ (id)getConfigForKey:(id)a3;
+ (void)initialize;
+ (void)setConfig:(id)a3;
@end

@implementation WiFiUsageBeaconParsingConfiguration

+ (void)initialize
{
  v2 = (void *)_beaconParsing;
  _beaconParsing = 0;
}

+ (void)setConfig:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToDictionary:_beaconParsing] & 1) == 0)
  {
    objc_storeStrong((id *)&_beaconParsing, a3);
    +[WiFiUsageParsedBeacon updateConfig];
    NSLog(&cfstr_SUpdatedWifius_0.isa, "+[WiFiUsageBeaconParsingConfiguration setConfig:]");
  }
}

+ (id)getConfigForKey:(id)a3
{
  id v3 = a3;
  if (_beaconParsing)
  {
    id v4 = [(id)_beaconParsing objectForKey:v3];
    if (!v4) {
      NSLog(&cfstr_SDoesNotContai.isa, "+[WiFiUsageBeaconParsingConfiguration getConfigForKey:]", @"BeaconParsing", v3);
    }
  }
  else
  {
    NSLog(&cfstr_SFeatureHasnTB.isa, "+[WiFiUsageBeaconParsingConfiguration getConfigForKey:]", @"BeaconParsing");
    id v4 = 0;
  }

  return v4;
}

@end