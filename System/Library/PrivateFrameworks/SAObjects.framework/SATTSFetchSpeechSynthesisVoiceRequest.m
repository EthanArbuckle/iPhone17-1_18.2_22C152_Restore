@interface SATTSFetchSpeechSynthesisVoiceRequest
+ (id)fetchSpeechSynthesisVoiceRequest;
- (BOOL)requiresResponse;
- (NSArray)clientVoiceKeyList;
- (NSString)gender;
- (NSString)languageCode;
- (SATTSSpeechSynthesisVoice)filteredVoiceKey;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientVoiceKeyList:(id)a3;
- (void)setFilteredVoiceKey:(id)a3;
- (void)setGender:(id)a3;
- (void)setLanguageCode:(id)a3;
@end

@implementation SATTSFetchSpeechSynthesisVoiceRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"FetchSpeechSynthesisVoiceRequest";
}

+ (id)fetchSpeechSynthesisVoiceRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)clientVoiceKeyList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"clientVoiceKeyList", v3);
}

- (void)setClientVoiceKeyList:(id)a3
{
}

- (SATTSSpeechSynthesisVoice)filteredVoiceKey
{
  return (SATTSSpeechSynthesisVoice *)AceObjectAceObjectForProperty(self, @"filteredVoiceKey");
}

- (void)setFilteredVoiceKey:(id)a3
{
}

- (NSString)gender
{
  return (NSString *)[(AceObject *)self propertyForKey:@"gender"];
}

- (void)setGender:(id)a3
{
}

- (NSString)languageCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"languageCode"];
}

- (void)setLanguageCode:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end