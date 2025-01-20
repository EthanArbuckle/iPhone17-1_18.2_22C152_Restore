@interface SAUIAddDialogs
- (BOOL)requiresResponse;
- (NSArray)dialogs;
- (NSNumber)listenAfterSpeaking;
- (NSString)responseMode;
- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior;
- (SAUIRequestEndBehavior)requestEndBehavior;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDialogs:(id)a3;
- (void)setListenAfterSpeaking:(id)a3;
- (void)setListenAfterSpeakingBehavior:(id)a3;
- (void)setRequestEndBehavior:(id)a3;
- (void)setResponseMode:(id)a3;
@end

@implementation SAUIAddDialogs

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AddDialogs";
}

- (NSArray)dialogs
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"dialogs", v3);
}

- (void)setDialogs:(id)a3
{
}

- (NSNumber)listenAfterSpeaking
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"listenAfterSpeaking"];
}

- (void)setListenAfterSpeaking:(id)a3
{
}

- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior
{
  return (SAUIListenAfterSpeakingBehavior *)AceObjectAceObjectForProperty(self, @"listenAfterSpeakingBehavior");
}

- (void)setListenAfterSpeakingBehavior:(id)a3
{
}

- (SAUIRequestEndBehavior)requestEndBehavior
{
  return (SAUIRequestEndBehavior *)AceObjectAceObjectForProperty(self, @"requestEndBehavior");
}

- (void)setRequestEndBehavior:(id)a3
{
}

- (NSString)responseMode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"responseMode"];
}

- (void)setResponseMode:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end