@interface SAIntentGroupSiriKitParameterMetadata
+ (id)siriKitParameterMetadata;
- (BOOL)shouldResolve;
- (NSArray)confirmationStates;
- (NSString)parameterName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConfirmationStates:(id)a3;
- (void)setParameterName:(id)a3;
- (void)setShouldResolve:(BOOL)a3;
@end

@implementation SAIntentGroupSiriKitParameterMetadata

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"SiriKitParameterMetadata";
}

+ (id)siriKitParameterMetadata
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)confirmationStates
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"confirmationStates"];
}

- (void)setConfirmationStates:(id)a3
{
}

- (NSString)parameterName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"parameterName"];
}

- (void)setParameterName:(id)a3
{
}

- (BOOL)shouldResolve
{
  return AceObjectBoolForProperty(self, @"shouldResolve");
}

- (void)setShouldResolve:(BOOL)a3
{
}

@end