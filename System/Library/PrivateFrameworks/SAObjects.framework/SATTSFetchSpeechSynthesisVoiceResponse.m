@interface SATTSFetchSpeechSynthesisVoiceResponse
+ (id)fetchSpeechSynthesisVoiceResponse;
- (BOOL)requiresResponse;
- (NSArray)voiceKeyList;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setVoiceKeyList:(id)a3;
@end

@implementation SATTSFetchSpeechSynthesisVoiceResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"FetchSpeechSynthesisVoiceResponse";
}

+ (id)fetchSpeechSynthesisVoiceResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)voiceKeyList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"voiceKeyList", v3);
}

- (void)setVoiceKeyList:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end