@interface SAStartLocalRequest
+ (id)startLocalRequest;
- (BOOL)requiresResponse;
- (NSArray)clientBoundCommands;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientBoundCommands:(id)a3;
@end

@implementation SAStartLocalRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StartLocalRequest";
}

+ (id)startLocalRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)clientBoundCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"clientBoundCommands", &unk_1EFD73568);
}

- (void)setClientBoundCommands:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end