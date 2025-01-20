@interface W5FeatureAvailability
+ (BOOL)diagnosticsModeEnabled;
+ (BOOL)isInternalBuild;
+ (id)_featureAvailabilityDefaults;
@end

@implementation W5FeatureAvailability

+ (id)_featureAvailabilityDefaults
{
  v2 = (void *)_featureAvailabilityDefaults;
  if (!_featureAvailabilityDefaults)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v4 = [v3 persistentDomainForName:@"com.apple.wifivelocity.features"];
    v5 = (void *)_featureAvailabilityDefaults;
    _featureAvailabilityDefaults = v4;

    v2 = (void *)_featureAvailabilityDefaults;
  }
  return v2;
}

+ (BOOL)isInternalBuild
{
  return MEMORY[0x270EDAB30]("com.apple.wifivelocity", a2);
}

+ (BOOL)diagnosticsModeEnabled
{
  char v2 = +[W5FeatureAvailability isInternalBuild];
  v3 = +[W5FeatureAvailability _featureAvailabilityDefaults];
  uint64_t v4 = [v3 objectForKey:@"diagnostics-mode"];

  if (v4)
  {
    v5 = +[W5FeatureAvailability _featureAvailabilityDefaults];
    v6 = [v5 objectForKey:@"diagnostics-mode"];

    char v2 = [v6 BOOLValue];
  }
  return v2;
}

@end