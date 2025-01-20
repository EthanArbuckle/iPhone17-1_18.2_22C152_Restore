@interface SAAppsAppSearchResponse
+ (id)appSearchResponse;
- (BOOL)requiresResponse;
- (NSArray)foundApps;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFoundApps:(id)a3;
@end

@implementation SAAppsAppSearchResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.apps";
}

- (id)encodedClassName
{
  return @"AppSearchResponse";
}

+ (id)appSearchResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)foundApps
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"foundApps", v3);
}

- (void)setFoundApps:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end