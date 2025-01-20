@interface SAIntentGroupAppAuthorizationStatusResponse
+ (id)appAuthorizationStatusResponse;
- (BOOL)requiresResponse;
- (NSDictionary)appAuthorizationStatusMap;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppAuthorizationStatusMap:(id)a3;
@end

@implementation SAIntentGroupAppAuthorizationStatusResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"AppAuthorizationStatusResponse";
}

+ (id)appAuthorizationStatusResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)appAuthorizationStatusMap
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"appAuthorizationStatusMap"];
}

- (void)setAppAuthorizationStatusMap:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end