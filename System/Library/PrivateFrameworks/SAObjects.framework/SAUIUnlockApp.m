@interface SAUIUnlockApp
- (BOOL)requiresResponse;
- (NSArray)failureCommands;
- (NSArray)successCommands;
- (NSString)appBundleId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppBundleId:(id)a3;
- (void)setFailureCommands:(id)a3;
- (void)setSuccessCommands:(id)a3;
@end

@implementation SAUIUnlockApp

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"UnlockApp";
}

- (NSString)appBundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appBundleId"];
}

- (void)setAppBundleId:(id)a3
{
}

- (NSArray)failureCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"failureCommands", &unk_1EFD73568);
}

- (void)setFailureCommands:(id)a3
{
}

- (NSArray)successCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"successCommands", &unk_1EFD73568);
}

- (void)setSuccessCommands:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end