@interface SAIntentGroupUnsupportedIntentResponse
+ (id)unsupportedIntentResponse;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAIntentGroupUnsupportedIntentResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"UnsupportedIntentResponse";
}

+ (id)unsupportedIntentResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end