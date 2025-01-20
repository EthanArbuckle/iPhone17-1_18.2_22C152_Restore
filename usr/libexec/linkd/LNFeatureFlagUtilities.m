@interface LNFeatureFlagUtilities
+ (BOOL)featureEnabledWithDomain:(id)a3 feature:(id)a4;
+ (BOOL)featureEnabledWithDomainFeaturePair:(id)a3;
@end

@implementation LNFeatureFlagUtilities

+ (BOOL)featureEnabledWithDomainFeaturePair:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"/"];
  v4 = [v3 firstObject];
  uint64_t v5 = [v3 lastObject];
  v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = +[LNFeatureFlagUtilities featureEnabledWithDomain:v4 feature:v5];
  }

  return v8;
}

+ (BOOL)featureEnabledWithDomain:(id)a3 feature:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 UTF8String];
  id v8 = v6;
  id v9 = [v8 UTF8String];

  return __os_feature_enabled_impl(v7, v9);
}

@end