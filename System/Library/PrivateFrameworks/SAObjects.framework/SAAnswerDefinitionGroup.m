@interface SAAnswerDefinitionGroup
+ (id)definitionGroup;
- (NSArray)definitionEntries;
- (NSArray)synonyms;
- (NSString)origin;
- (NSString)partOfSpeech;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDefinitionEntries:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setPartOfSpeech:(id)a3;
- (void)setSynonyms:(id)a3;
@end

@implementation SAAnswerDefinitionGroup

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"DefinitionGroup";
}

+ (id)definitionGroup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)definitionEntries
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"definitionEntries", v3);
}

- (void)setDefinitionEntries:(id)a3
{
}

- (NSString)origin
{
  return (NSString *)[(AceObject *)self propertyForKey:@"origin"];
}

- (void)setOrigin:(id)a3
{
}

- (NSString)partOfSpeech
{
  return (NSString *)[(AceObject *)self propertyForKey:@"partOfSpeech"];
}

- (void)setPartOfSpeech:(id)a3
{
}

- (NSArray)synonyms
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"synonyms"];
}

- (void)setSynonyms:(id)a3
{
}

@end