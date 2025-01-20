@interface SALocalSearchNavigationPromptManeuver
+ (id)navigationPromptManeuver;
- (BOOL)requiresResponse;
- (NSNumber)maneuverIndex;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setManeuverIndex:(id)a3;
@end

@implementation SALocalSearchNavigationPromptManeuver

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"NavigationPromptManeuver";
}

+ (id)navigationPromptManeuver
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)maneuverIndex
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"maneuverIndex"];
}

- (void)setManeuverIndex:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end