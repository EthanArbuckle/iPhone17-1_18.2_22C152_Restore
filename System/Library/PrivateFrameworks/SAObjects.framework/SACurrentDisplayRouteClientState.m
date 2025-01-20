@interface SACurrentDisplayRouteClientState
+ (id)currentDisplayRouteClientState;
+ (id)deliveryDeadline;
+ (id)persistencePolicy;
- (NSArray)activeDisplayRoutes;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActiveDisplayRoutes:(id)a3;
@end

@implementation SACurrentDisplayRouteClientState

+ (id)deliveryDeadline
{
  return @"BEFORE_FINISH_SPEECH";
}

+ (id)persistencePolicy
{
  return @"LIFE_OF_SESSION";
}

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"CurrentDisplayRouteClientState";
}

+ (id)currentDisplayRouteClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)activeDisplayRoutes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"activeDisplayRoutes"];
}

- (void)setActiveDisplayRoutes:(id)a3
{
}

@end