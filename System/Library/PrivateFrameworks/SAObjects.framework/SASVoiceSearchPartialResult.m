@interface SASVoiceSearchPartialResult
+ (id)voiceSearchPartialResult;
- (BOOL)requiresResponse;
- (BOOL)stable;
- (NSArray)voiceSearchResults;
- (NSString)recognitionText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRecognitionText:(id)a3;
- (void)setStable:(BOOL)a3;
- (void)setVoiceSearchResults:(id)a3;
@end

@implementation SASVoiceSearchPartialResult

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"VoiceSearchPartialResult";
}

+ (id)voiceSearchPartialResult
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

- (BOOL)stable
{
  return AceObjectBoolForProperty(self, @"stable");
}

- (void)setStable:(BOOL)a3
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