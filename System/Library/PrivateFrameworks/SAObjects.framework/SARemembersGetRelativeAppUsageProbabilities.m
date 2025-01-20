@interface SARemembersGetRelativeAppUsageProbabilities
+ (id)getRelativeAppUsageProbabilities;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)bundleIDs;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)days;
- (void)setBundleIDs:(id)a3;
- (void)setDays:(int64_t)a3;
@end

@implementation SARemembersGetRelativeAppUsageProbabilities

- (id)groupIdentifier
{
  return @"com.apple.ace.remembers";
}

- (id)encodedClassName
{
  return @"GetRelativeAppUsageProbabilities";
}

+ (id)getRelativeAppUsageProbabilities
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)bundleIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"bundleIDs"];
}

- (void)setBundleIDs:(id)a3
{
}

- (int64_t)days
{
  return AceObjectIntegerForProperty(self, @"days");
}

- (void)setDays:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end