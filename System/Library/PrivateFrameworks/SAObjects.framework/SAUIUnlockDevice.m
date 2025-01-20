@interface SAUIUnlockDevice
+ (id)unlockDevice;
- (BOOL)requiresResponse;
- (NSArray)cancellationCommands;
- (NSArray)failureCommands;
- (NSArray)successCommands;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCancellationCommands:(id)a3;
- (void)setFailureCommands:(id)a3;
- (void)setSuccessCommands:(id)a3;
@end

@implementation SAUIUnlockDevice

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"UnlockDevice";
}

+ (id)unlockDevice
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)cancellationCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"cancellationCommands", &unk_1EFD73568);
}

- (void)setCancellationCommands:(id)a3
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