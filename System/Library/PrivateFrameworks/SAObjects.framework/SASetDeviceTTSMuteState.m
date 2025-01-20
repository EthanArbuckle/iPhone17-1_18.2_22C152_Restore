@interface SASetDeviceTTSMuteState
+ (id)setDeviceTTSMuteState;
- (BOOL)requiresResponse;
- (BOOL)textToSpeechIsMuted;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTextToSpeechIsMuted:(BOOL)a3;
@end

@implementation SASetDeviceTTSMuteState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetDeviceTTSMuteState";
}

+ (id)setDeviceTTSMuteState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)textToSpeechIsMuted
{
  return AceObjectBoolForProperty(self, @"textToSpeechIsMuted");
}

- (void)setTextToSpeechIsMuted:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end