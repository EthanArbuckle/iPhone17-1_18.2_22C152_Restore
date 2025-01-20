@interface SAStartUIRequest
+ (id)startUIRequest;
- (BOOL)requiresResponse;
- (SAStartLocalRequest)startLocalRequest;
- (SAStartRequest)startRequest;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStartLocalRequest:(id)a3;
- (void)setStartRequest:(id)a3;
@end

@implementation SAStartUIRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StartUIRequest";
}

+ (id)startUIRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAStartRequest)startRequest
{
  return (SAStartRequest *)AceObjectAceObjectForProperty(self, @"startRequest");
}

- (void)setStartRequest:(id)a3
{
}

- (SAStartLocalRequest)startLocalRequest
{
  return (SAStartLocalRequest *)AceObjectAceObjectForProperty(self, @"startLocalRequest");
}

- (void)setStartLocalRequest:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end