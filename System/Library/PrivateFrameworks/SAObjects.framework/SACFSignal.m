@interface SACFSignal
+ (id)signal;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)scriptIdentifiers;
- (NSString)domain;
- (NSString)flowScriptHint;
- (SACFAbstractClientCommand)signalPayload;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDomain:(id)a3;
- (void)setFlowScriptHint:(id)a3;
- (void)setScriptIdentifiers:(id)a3;
- (void)setSignalPayload:(id)a3;
@end

@implementation SACFSignal

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"Signal";
}

+ (id)signal
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)domain
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domain"];
}

- (void)setDomain:(id)a3
{
}

- (NSString)flowScriptHint
{
  return (NSString *)[(AceObject *)self propertyForKey:@"flowScriptHint"];
}

- (void)setFlowScriptHint:(id)a3
{
}

- (NSArray)scriptIdentifiers
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"scriptIdentifiers"];
}

- (void)setScriptIdentifiers:(id)a3
{
}

- (SACFAbstractClientCommand)signalPayload
{
  return (SACFAbstractClientCommand *)AceObjectAceObjectForProperty(self, @"signalPayload");
}

- (void)setSignalPayload:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end