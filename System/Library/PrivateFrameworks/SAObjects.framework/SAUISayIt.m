@interface SAUISayIt
+ (id)sayIt;
- (BOOL)canUseServerTTS;
- (BOOL)repeatable;
- (BOOL)requiresResponse;
- (NSArray)coordinationOptions;
- (NSNumber)listenAfterSpeaking;
- (NSString)audioDataUrl;
- (NSString)dialogIdentifier;
- (NSString)gender;
- (NSString)languageCode;
- (NSString)message;
- (NSString)voiceName;
- (SAAceSerializable)context;
- (SAUIAudioData)audioData;
- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAudioData:(id)a3;
- (void)setAudioDataUrl:(id)a3;
- (void)setCanUseServerTTS:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setCoordinationOptions:(id)a3;
- (void)setDialogIdentifier:(id)a3;
- (void)setGender:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setListenAfterSpeaking:(id)a3;
- (void)setListenAfterSpeakingBehavior:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRepeatable:(BOOL)a3;
- (void)setVoiceName:(id)a3;
@end

@implementation SAUISayIt

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"SayIt";
}

+ (id)sayIt
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIAudioData)audioData
{
  return (SAUIAudioData *)AceObjectAceObjectForProperty(self, @"audioData");
}

- (void)setAudioData:(id)a3
{
}

- (NSString)audioDataUrl
{
  return (NSString *)[(AceObject *)self propertyForKey:@"audioDataUrl"];
}

- (void)setAudioDataUrl:(id)a3
{
}

- (BOOL)canUseServerTTS
{
  return AceObjectBoolForProperty(self, @"canUseServerTTS");
}

- (void)setCanUseServerTTS:(BOOL)a3
{
}

- (SAAceSerializable)context
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, @"context");
}

- (void)setContext:(id)a3
{
}

- (NSArray)coordinationOptions
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"coordinationOptions"];
}

- (void)setCoordinationOptions:(id)a3
{
}

- (NSString)dialogIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dialogIdentifier"];
}

- (void)setDialogIdentifier:(id)a3
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

- (NSNumber)listenAfterSpeaking
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"listenAfterSpeaking"];
}

- (void)setListenAfterSpeaking:(id)a3
{
}

- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior
{
  return (SAUIListenAfterSpeakingBehavior *)AceObjectAceObjectForProperty(self, @"listenAfterSpeakingBehavior");
}

- (void)setListenAfterSpeakingBehavior:(id)a3
{
}

- (NSString)message
{
  return (NSString *)[(AceObject *)self propertyForKey:@"message"];
}

- (void)setMessage:(id)a3
{
}

- (BOOL)repeatable
{
  return AceObjectBoolForProperty(self, @"repeatable");
}

- (void)setRepeatable:(BOOL)a3
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
  return 0;
}

@end