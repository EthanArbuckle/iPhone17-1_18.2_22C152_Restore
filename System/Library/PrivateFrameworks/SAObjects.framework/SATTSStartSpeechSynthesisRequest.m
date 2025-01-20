@interface SATTSStartSpeechSynthesisRequest
+ (id)startSpeechSynthesisRequest;
- (BOOL)enableAudioInfo;
- (BOOL)requiresResponse;
- (BOOL)streaming;
- (NSDictionary)speakableContextInfo;
- (NSString)audioType;
- (NSString)gender;
- (NSString)languageCode;
- (NSString)quality;
- (NSString)text;
- (NSString)voiceName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAudioType:(id)a3;
- (void)setEnableAudioInfo:(BOOL)a3;
- (void)setGender:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setQuality:(id)a3;
- (void)setSpeakableContextInfo:(id)a3;
- (void)setStreaming:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setVoiceName:(id)a3;
@end

@implementation SATTSStartSpeechSynthesisRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"StartSpeechSynthesisRequest";
}

+ (id)startSpeechSynthesisRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)audioType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"audioType"];
}

- (void)setAudioType:(id)a3
{
}

- (BOOL)enableAudioInfo
{
  return AceObjectBoolForProperty(self, @"enableAudioInfo");
}

- (void)setEnableAudioInfo:(BOOL)a3
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

- (NSString)quality
{
  return (NSString *)[(AceObject *)self propertyForKey:@"quality"];
}

- (void)setQuality:(id)a3
{
}

- (NSDictionary)speakableContextInfo
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"speakableContextInfo"];
}

- (void)setSpeakableContextInfo:(id)a3
{
}

- (BOOL)streaming
{
  return AceObjectBoolForProperty(self, @"streaming");
}

- (void)setStreaming:(BOOL)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

- (NSString)voiceName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"voiceName"];
}

- (void)setVoiceName:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end