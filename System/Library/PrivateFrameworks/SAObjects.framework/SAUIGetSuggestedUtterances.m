@interface SAUIGetSuggestedUtterances
+ (id)getSuggestedUtterances;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAUIGetSuggestedUtterances

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"GetSuggestedUtterances";
}

+ (id)getSuggestedUtterances
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end