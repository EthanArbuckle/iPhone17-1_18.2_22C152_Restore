@interface SASetHandoffPayload
+ (id)setHandoffPayload;
- (BOOL)requiresResponse;
- (SAHandoffPayload)handoffPayload;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHandoffPayload:(id)a3;
@end

@implementation SASetHandoffPayload

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetHandoffPayload";
}

+ (id)setHandoffPayload
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAHandoffPayload)handoffPayload
{
  return (SAHandoffPayload *)AceObjectAceObjectForProperty(self, @"handoffPayload");
}

- (void)setHandoffPayload:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end