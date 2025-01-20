@interface SAIntentGroupParse
+ (id)parse;
- (NSArray)nlv3ParseWithAlternatives;
- (NSString)jsonIntent;
- (NSString)jsonIntentTypeName;
- (NSString)type;
- (SAIntentGroupDirectInvocation)directInvocation;
- (SAIntentGroupProtobufMessage)nlv3Parse;
- (SAIntentGroupProtobufMessage)pegasusResults;
- (SAIntentGroupProtobufMessage)siriKitIntent;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDirectInvocation:(id)a3;
- (void)setJsonIntent:(id)a3;
- (void)setJsonIntentTypeName:(id)a3;
- (void)setNlv3Parse:(id)a3;
- (void)setNlv3ParseWithAlternatives:(id)a3;
- (void)setPegasusResults:(id)a3;
- (void)setSiriKitIntent:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SAIntentGroupParse

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"Parse";
}

+ (id)parse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAIntentGroupDirectInvocation)directInvocation
{
  return (SAIntentGroupDirectInvocation *)AceObjectAceObjectForProperty(self, @"directInvocation");
}

- (void)setDirectInvocation:(id)a3
{
}

- (NSString)jsonIntent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonIntent"];
}

- (void)setJsonIntent:(id)a3
{
}

- (NSString)jsonIntentTypeName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonIntentTypeName"];
}

- (void)setJsonIntentTypeName:(id)a3
{
}

- (SAIntentGroupProtobufMessage)nlv3Parse
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"nlv3Parse");
}

- (void)setNlv3Parse:(id)a3
{
}

- (NSArray)nlv3ParseWithAlternatives
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"nlv3ParseWithAlternatives", v3);
}

- (void)setNlv3ParseWithAlternatives:(id)a3
{
}

- (SAIntentGroupProtobufMessage)pegasusResults
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"pegasusResults");
}

- (void)setPegasusResults:(id)a3
{
}

- (SAIntentGroupProtobufMessage)siriKitIntent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"siriKitIntent");
}

- (void)setSiriKitIntent:(id)a3
{
}

- (NSString)type
{
  return (NSString *)[(AceObject *)self propertyForKey:@"type"];
}

- (void)setType:(id)a3
{
}

@end