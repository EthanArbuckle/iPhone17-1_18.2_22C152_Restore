@interface SAAppCustomVocabulary
+ (id)appCustomVocabulary;
- (NSString)intentSlotValue;
- (NSString)vocabularyIdentifier;
- (SAIntentGroupCustomVocabularyEntity)vocabularyEntity;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIntentSlotValue:(id)a3;
- (void)setVocabularyEntity:(id)a3;
- (void)setVocabularyIdentifier:(id)a3;
@end

@implementation SAAppCustomVocabulary

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AppCustomVocabulary";
}

+ (id)appCustomVocabulary
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)intentSlotValue
{
  return (NSString *)[(AceObject *)self propertyForKey:@"intentSlotValue"];
}

- (void)setIntentSlotValue:(id)a3
{
}

- (SAIntentGroupCustomVocabularyEntity)vocabularyEntity
{
  return (SAIntentGroupCustomVocabularyEntity *)AceObjectAceObjectForProperty(self, @"vocabularyEntity");
}

- (void)setVocabularyEntity:(id)a3
{
}

- (NSString)vocabularyIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"vocabularyIdentifier"];
}

- (void)setVocabularyIdentifier:(id)a3
{
}

@end