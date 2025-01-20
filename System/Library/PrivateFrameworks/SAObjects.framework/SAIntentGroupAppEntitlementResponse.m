@interface SAIntentGroupAppEntitlementResponse
+ (id)appEntitlementResponse;
- (BOOL)requiresResponse;
- (NSArray)appEntitlements;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppEntitlements:(id)a3;
@end

@implementation SAIntentGroupAppEntitlementResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"AppEntitlementResponse";
}

+ (id)appEntitlementResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)appEntitlements
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"appEntitlements"];
}

- (void)setAppEntitlements:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end