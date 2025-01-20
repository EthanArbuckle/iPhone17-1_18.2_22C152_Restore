@interface SAMPGetRoutes
+ (id)getRoutes;
- (BOOL)requiresResponse;
- (double)routeTimeout;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRouteTimeout:(double)a3;
@end

@implementation SAMPGetRoutes

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"GetRoutes";
}

+ (id)getRoutes
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (double)routeTimeout
{
  return AceObjectDoubleForProperty(self, @"routeTimeout");
}

- (void)setRouteTimeout:(double)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end