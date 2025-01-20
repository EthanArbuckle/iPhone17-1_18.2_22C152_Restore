@interface SATTSSpeechSynthesisPartialResponse
+ (id)speechSynthesisPartialResponse;
- (BOOL)requiresResponse;
- (SATTSSpeechSynthesisAudioInfo)aceAudioInfo;
- (SAUIAudioData)aceAudioData;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)currentPacketNumber;
- (void)setAceAudioData:(id)a3;
- (void)setAceAudioInfo:(id)a3;
- (void)setCurrentPacketNumber:(int64_t)a3;
@end

@implementation SATTSSpeechSynthesisPartialResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"SpeechSynthesisPartialResponse";
}

+ (id)speechSynthesisPartialResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIAudioData)aceAudioData
{
  return (SAUIAudioData *)AceObjectAceObjectForProperty(self, @"aceAudioData");
}

- (void)setAceAudioData:(id)a3
{
}

- (SATTSSpeechSynthesisAudioInfo)aceAudioInfo
{
  return (SATTSSpeechSynthesisAudioInfo *)AceObjectAceObjectForProperty(self, @"aceAudioInfo");
}

- (void)setAceAudioInfo:(id)a3
{
}

- (int64_t)currentPacketNumber
{
  return AceObjectIntegerForProperty(self, @"currentPacketNumber");
}

- (void)setCurrentPacketNumber:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end