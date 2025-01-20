@interface SAAnswerDictionaryStructuredAnswer
+ (id)dictionaryStructuredAnswer;
- (NSArray)definitionGroups;
- (NSArray)syllables;
- (NSString)category;
- (NSString)phoneticPronunciation;
- (NSString)word;
- (NSURL)sound;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCategory:(id)a3;
- (void)setDefinitionGroups:(id)a3;
- (void)setPhoneticPronunciation:(id)a3;
- (void)setSound:(id)a3;
- (void)setSyllables:(id)a3;
- (void)setWord:(id)a3;
@end

@implementation SAAnswerDictionaryStructuredAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"DictionaryStructuredAnswer";
}

+ (id)dictionaryStructuredAnswer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)category
{
  return (NSString *)[(AceObject *)self propertyForKey:@"category"];
}

- (void)setCategory:(id)a3
{
}

- (NSArray)definitionGroups
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"definitionGroups", v3);
}

- (void)setDefinitionGroups:(id)a3
{
}

- (NSString)phoneticPronunciation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"phoneticPronunciation"];
}

- (void)setPhoneticPronunciation:(id)a3
{
}

- (NSURL)sound
{
  return (NSURL *)AceObjectURLForProperty(self, @"sound");
}

- (void)setSound:(id)a3
{
}

- (NSArray)syllables
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"syllables"];
}

- (void)setSyllables:(id)a3
{
}

- (NSString)word
{
  return (NSString *)[(AceObject *)self propertyForKey:@"word"];
}

- (void)setWord:(id)a3
{
}

@end