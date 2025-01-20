@interface SARemembersGetRelativeAppUsageProbabilitiesResponse
+ (id)getRelativeAppUsageProbabilitiesResponse;
- (BOOL)requiresResponse;
- (NSDictionary)bundleIDPercentages;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBundleIDPercentages:(id)a3;
@end

@implementation SARemembersGetRelativeAppUsageProbabilitiesResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.remembers";
}

- (id)encodedClassName
{
  return @"GetRelativeAppUsageProbabilitiesResponse";
}

+ (id)getRelativeAppUsageProbabilitiesResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)bundleIDPercentages
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"bundleIDPercentages"];
}

- (void)setBundleIDPercentages:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end