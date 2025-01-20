@interface W5FeatureAvailability
+ (BOOL)diagnosticsModeEnabled;
+ (BOOL)isInternalBuild;
+ (id)_featureAvailabilityDefaults;
@end

@implementation W5FeatureAvailability

+ (id)_featureAvailabilityDefaults
{
  v2 = (void *)qword_100103758;
  if (!qword_100103758)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    uint64_t v4 = [v3 persistentDomainForName:@"com.apple.wifivelocity.features"];
    v5 = (void *)qword_100103758;
    qword_100103758 = v4;

    v2 = (void *)qword_100103758;
  }

  return v2;
}

+ (BOOL)isInternalBuild
{
  return os_variant_has_internal_content();
}

+ (BOOL)diagnosticsModeEnabled
{
  unsigned __int8 v2 = +[W5FeatureAvailability isInternalBuild];
  v3 = +[W5FeatureAvailability _featureAvailabilityDefaults];
  uint64_t v4 = [v3 objectForKey:@"diagnostics-mode"];

  if (v4)
  {
    v5 = +[W5FeatureAvailability _featureAvailabilityDefaults];
    v6 = [v5 objectForKey:@"diagnostics-mode"];

    unsigned __int8 v2 = [v6 BOOLValue];
  }
  return v2;
}

@end