@interface SALocalSearchNavigationPromptManeuverCompleted
+ (id)navigationPromptManeuverCompleted;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SALocalSearchNavigationPromptManeuverCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"NavigationPromptManeuverCompleted";
}

+ (id)navigationPromptManeuverCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end