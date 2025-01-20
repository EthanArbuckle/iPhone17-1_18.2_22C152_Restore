@interface SALocalSearchCarRouteOptions
+ (id)carRouteOptions;
- (BOOL)avoidHighways;
- (BOOL)avoidTolls;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAvoidHighways:(BOOL)a3;
- (void)setAvoidTolls:(BOOL)a3;
@end

@implementation SALocalSearchCarRouteOptions

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"CarRouteOptions";
}

+ (id)carRouteOptions
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)avoidHighways
{
  return AceObjectBoolForProperty(self, @"avoidHighways");
}

- (void)setAvoidHighways:(BOOL)a3
{
}

- (BOOL)avoidTolls
{
  return AceObjectBoolForProperty(self, @"avoidTolls");
}

- (void)setAvoidTolls:(BOOL)a3
{
}

@end