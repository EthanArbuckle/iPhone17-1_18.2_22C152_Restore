@interface SAIntentGroupGetIntentDefinitionsIntentDefinitionQuery
+ (id)getIntentDefinitionsIntentDefinitionQuery;
- (NSString)entity;
- (NSString)verb;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEntity:(id)a3;
- (void)setVerb:(id)a3;
@end

@implementation SAIntentGroupGetIntentDefinitionsIntentDefinitionQuery

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"GetIntentDefinitionsIntentDefinitionQuery";
}

+ (id)getIntentDefinitionsIntentDefinitionQuery
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)entity
{
  return (NSString *)[(AceObject *)self propertyForKey:@"entity"];
}

- (void)setEntity:(id)a3
{
}

- (NSString)verb
{
  return (NSString *)[(AceObject *)self propertyForKey:@"verb"];
}

- (void)setVerb:(id)a3
{
}

@end