@interface SATTSSpeechSynthesisStreamingBegin
+ (id)speechSynthesisStreamingBegin;
- (BOOL)requiresResponse;
- (NSString)text;
- (SATTSSpeechSynthesisResource)speechSynthesisResource;
- (SATTSSpeechSynthesisVoice)speechSynthesisVoice;
- (SAUIAudioDescription)decoderStreamDescription;
- (SAUIAudioDescription)playerStreamDescription;
- (float)streamingPlaybackBufferSize;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDecoderStreamDescription:(id)a3;
- (void)setPlayerStreamDescription:(id)a3;
- (void)setSpeechSynthesisResource:(id)a3;
- (void)setSpeechSynthesisVoice:(id)a3;
- (void)setStreamingPlaybackBufferSize:(float)a3;
- (void)setText:(id)a3;
@end

@implementation SATTSSpeechSynthesisStreamingBegin

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"SpeechSynthesisStreamingBegin";
}

+ (id)speechSynthesisStreamingBegin
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIAudioDescription)decoderStreamDescription
{
  return (SAUIAudioDescription *)AceObjectAceObjectForProperty(self, @"decoderStreamDescription");
}

- (void)setDecoderStreamDescription:(id)a3
{
}

- (SAUIAudioDescription)playerStreamDescription
{
  return (SAUIAudioDescription *)AceObjectAceObjectForProperty(self, @"playerStreamDescription");
}

- (void)setPlayerStreamDescription:(id)a3
{
}

- (SATTSSpeechSynthesisResource)speechSynthesisResource
{
  return (SATTSSpeechSynthesisResource *)AceObjectAceObjectForProperty(self, @"speechSynthesisResource");
}

- (void)setSpeechSynthesisResource:(id)a3
{
}

- (SATTSSpeechSynthesisVoice)speechSynthesisVoice
{
  return (SATTSSpeechSynthesisVoice *)AceObjectAceObjectForProperty(self, @"speechSynthesisVoice");
}

- (void)setSpeechSynthesisVoice:(id)a3
{
}

- (float)streamingPlaybackBufferSize
{
  return AceObjectFloatForProperty(self, @"streamingPlaybackBufferSize");
}

- (void)setStreamingPlaybackBufferSize:(float)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end