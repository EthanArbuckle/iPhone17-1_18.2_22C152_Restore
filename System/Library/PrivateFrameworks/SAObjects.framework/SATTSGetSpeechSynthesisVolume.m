@interface SATTSGetSpeechSynthesisVolume
+ (id)getSpeechSynthesisVolume;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SATTSGetSpeechSynthesisVolume

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"GetSpeechSynthesisVolume";
}

+ (id)getSpeechSynthesisVolume
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end