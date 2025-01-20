@interface SASVoiceSearchFinalResult
+ (id)voiceSearchFinalResult;
- (BOOL)requiresResponse;
- (NSArray)voiceSearchResults;
- (NSString)recognitionText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRecognitionText:(id)a3;
- (void)setVoiceSearchResults:(id)a3;
@end

@implementation SASVoiceSearchFinalResult

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"VoiceSearchFinalResult";
}

+ (id)voiceSearchFinalResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)recognitionText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"recognitionText"];
}

- (void)setRecognitionText:(id)a3
{
}

- (NSArray)voiceSearchResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"voiceSearchResults", v3);
}

- (void)setVoiceSearchResults:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end