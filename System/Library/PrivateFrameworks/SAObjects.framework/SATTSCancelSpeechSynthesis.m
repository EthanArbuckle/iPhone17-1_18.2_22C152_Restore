@interface SATTSCancelSpeechSynthesis
+ (id)cancelSpeechSynthesis;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SATTSCancelSpeechSynthesis

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"CancelSpeechSynthesis";
}

+ (id)cancelSpeechSynthesis
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end