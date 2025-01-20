@interface SAWebSiteSearchStarted
+ (id)siteSearchStarted;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAWebSiteSearchStarted

- (id)groupIdentifier
{
  return @"com.apple.ace.websearch";
}

- (id)encodedClassName
{
  return @"SiteSearchStarted";
}

+ (id)siteSearchStarted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end