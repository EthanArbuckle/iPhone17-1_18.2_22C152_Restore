@interface SASMultilingualSpeechRecognized
+ (id)multilingualSpeechRecognized;
- (BOOL)multilingualDisabled;
- (BOOL)requiresResponse;
- (NSDictionary)speechRecognizedByLanguage;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMultilingualDisabled:(BOOL)a3;
- (void)setSpeechRecognizedByLanguage:(id)a3;
@end

@implementation SASMultilingualSpeechRecognized

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"MultilingualSpeechRecognized";
}

+ (id)multilingualSpeechRecognized
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)multilingualDisabled
{
  return AceObjectBoolForProperty(self, @"multilingualDisabled");
}

- (void)setMultilingualDisabled:(BOOL)a3
{
}

- (NSDictionary)speechRecognizedByLanguage
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"speechRecognizedByLanguage", v3);
}

- (void)setSpeechRecognizedByLanguage:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end