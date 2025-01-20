@interface SAIntentGroupAceBargeInState
- (NSArray)bargeInModes;
- (NSNumber)durationSincePreviousTTSFinish;
- (NSNumber)durationSincePreviousTTSStart;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBargeInModes:(id)a3;
- (void)setDurationSincePreviousTTSFinish:(id)a3;
- (void)setDurationSincePreviousTTSStart:(id)a3;
@end

@implementation SAIntentGroupAceBargeInState

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"AceBargeInState";
}

- (NSArray)bargeInModes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"bargeInModes"];
}

- (void)setBargeInModes:(id)a3
{
}

- (NSNumber)durationSincePreviousTTSFinish
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"durationSincePreviousTTSFinish"];
}

- (void)setDurationSincePreviousTTSFinish:(id)a3
{
}

- (NSNumber)durationSincePreviousTTSStart
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"durationSincePreviousTTSStart"];
}

- (void)setDurationSincePreviousTTSStart:(id)a3
{
}

@end