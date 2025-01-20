@interface SAIntentGroupAppVocabularySearchResponse
+ (id)appVocabularySearchResponse;
- (BOOL)requiresResponse;
- (NSArray)vocabularyStrings;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setVocabularyStrings:(id)a3;
@end

@implementation SAIntentGroupAppVocabularySearchResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"AppVocabularySearchResponse";
}

+ (id)appVocabularySearchResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)vocabularyStrings
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"vocabularyStrings"];
}

- (void)setVocabularyStrings:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end