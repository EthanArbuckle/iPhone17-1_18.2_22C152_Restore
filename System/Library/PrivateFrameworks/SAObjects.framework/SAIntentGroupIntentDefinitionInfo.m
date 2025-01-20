@interface SAIntentGroupIntentDefinitionInfo
+ (id)intentDefinitionInfo;
- (NSData)intentDefinition;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIntentDefinition:(id)a3;
@end

@implementation SAIntentGroupIntentDefinitionInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"IntentDefinitionInfo";
}

+ (id)intentDefinitionInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)intentDefinition
{
  return (NSData *)[(AceObject *)self propertyForKey:@"intentDefinition"];
}

- (void)setIntentDefinition:(id)a3
{
}

@end