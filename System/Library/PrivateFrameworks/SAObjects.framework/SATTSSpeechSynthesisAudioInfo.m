@interface SATTSSpeechSynthesisAudioInfo
+ (id)speechSynthesisAudioInfo;
- (NSArray)wordTimingInfoList;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setWordTimingInfoList:(id)a3;
@end

@implementation SATTSSpeechSynthesisAudioInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"SpeechSynthesisAudioInfo";
}

+ (id)speechSynthesisAudioInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)wordTimingInfoList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"wordTimingInfoList", v3);
}

- (void)setWordTimingInfoList:(id)a3
{
}

@end