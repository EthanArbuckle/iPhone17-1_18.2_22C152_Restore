@interface SAUIUnlockDeviceWithWatch
- (BOOL)requiresResponse;
- (NSArray)failureCommands;
- (NSArray)successCommands;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFailureCommands:(id)a3;
- (void)setSuccessCommands:(id)a3;
@end

@implementation SAUIUnlockDeviceWithWatch

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"UnlockDeviceWithWatch";
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