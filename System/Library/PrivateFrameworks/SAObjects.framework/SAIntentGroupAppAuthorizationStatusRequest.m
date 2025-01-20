@interface SAIntentGroupAppAuthorizationStatusRequest
+ (id)appAuthorizationStatusRequest;
- (BOOL)requiresResponse;
- (NSArray)appBundleIds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppBundleIds:(id)a3;
@end

@implementation SAIntentGroupAppAuthorizationStatusRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"AppAuthorizationStatusRequest";
}

+ (id)appAuthorizationStatusRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)appBundleIds
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"appBundleIds"];
}

- (void)setAppBundleIds:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end