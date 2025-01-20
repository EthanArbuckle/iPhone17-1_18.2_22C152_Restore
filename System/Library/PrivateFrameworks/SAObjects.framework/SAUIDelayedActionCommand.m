@interface SAUIDelayedActionCommand
+ (id)delayedActionCommand;
- (BOOL)requiresResponse;
- (NSArray)commands;
- (NSNumber)timerValue;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
- (void)setTimerValue:(id)a3;
@end

@implementation SAUIDelayedActionCommand

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"DelayedActionCommand";
}

+ (id)delayedActionCommand
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD73568);
}

- (void)setCommands:(id)a3
{
}

- (NSNumber)timerValue
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"timerValue"];
}

- (void)setTimerValue:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end