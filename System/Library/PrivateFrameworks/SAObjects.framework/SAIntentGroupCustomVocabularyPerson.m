@interface SAIntentGroupCustomVocabularyPerson
+ (id)customVocabularyPerson;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)nickname;
- (NSString)relationship;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNickname:(id)a3;
- (void)setRelationship:(id)a3;
@end

@implementation SAIntentGroupCustomVocabularyPerson

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"CustomVocabularyPerson";
}

+ (id)customVocabularyPerson
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)firstName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"firstName"];
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"lastName"];
}

- (void)setLastName:(id)a3
{
}

- (NSString)middleName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"middleName"];
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)nickname
{
  return (NSString *)[(AceObject *)self propertyForKey:@"nickname"];
}

- (void)setNickname:(id)a3
{
}

- (NSString)relationship
{
  return (NSString *)[(AceObject *)self propertyForKey:@"relationship"];
}

- (void)setRelationship:(id)a3
{
}

@end