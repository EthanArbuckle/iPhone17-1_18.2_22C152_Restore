@interface SALocalSearchGetNavigationStatus
+ (id)getNavigationStatus;
- (BOOL)requiresResponse;
- (NSNumber)getRoute;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGetRoute:(id)a3;
@end

@implementation SALocalSearchGetNavigationStatus

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"GetNavigationStatus";
}

+ (id)getNavigationStatus
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)getRoute
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"getRoute"];
}

- (void)setGetRoute:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end