@interface SALocalSearchNavigationPromptRerouteSuggestion
+ (id)navigationPromptRerouteSuggestion;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SALocalSearchNavigationPromptRerouteSuggestion

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"NavigationPromptRerouteSuggestion";
}

+ (id)navigationPromptRerouteSuggestion
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end