@interface SASMultilingualDictationLanguageSelected
+ (id)multilingualDictationLanguageSelected;
- (BOOL)requiresResponse;
- (NSDictionary)confidenceScoresByLanguage;
- (NSString)languageDetected;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConfidenceScoresByLanguage:(id)a3;
- (void)setLanguageDetected:(id)a3;
@end

@implementation SASMultilingualDictationLanguageSelected

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"MultilingualDictationLanguageSelected";
}

+ (id)multilingualDictationLanguageSelected
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)confidenceScoresByLanguage
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"confidenceScoresByLanguage"];
}

- (void)setConfidenceScoresByLanguage:(id)a3
{
}

- (NSString)languageDetected
{
  return (NSString *)[(AceObject *)self propertyForKey:@"languageDetected"];
}

- (void)setLanguageDetected:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end