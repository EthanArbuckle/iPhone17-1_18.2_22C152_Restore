@interface SATTSSpeechSynthesisStreamingChunk
+ (id)speechSynthesisStreamingChunk;
- (BOOL)requiresResponse;
- (NSData)audioData;
- (SATTSSpeechSynthesisAudioInfo)audioInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)index;
- (void)setAudioData:(id)a3;
- (void)setAudioInfo:(id)a3;
- (void)setIndex:(int64_t)a3;
@end

@implementation SATTSSpeechSynthesisStreamingChunk

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"SpeechSynthesisStreamingChunk";
}

+ (id)speechSynthesisStreamingChunk
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)audioData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"audioData"];
}

- (void)setAudioData:(id)a3
{
}

- (SATTSSpeechSynthesisAudioInfo)audioInfo
{
  return (SATTSSpeechSynthesisAudioInfo *)AceObjectAceObjectForProperty(self, @"audioInfo");
}

- (void)setAudioInfo:(id)a3
{
}

- (int64_t)index
{
  return AceObjectIntegerForProperty(self, @"index");
}

- (void)setIndex:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end