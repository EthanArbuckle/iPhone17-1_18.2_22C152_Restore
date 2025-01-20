@interface SATTSSpeechSynthesisCompleted
+ (id)speechSynthesisCompleted;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)totalPacketNumber;
- (void)setTotalPacketNumber:(int64_t)a3;
@end

@implementation SATTSSpeechSynthesisCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"SpeechSynthesisCompleted";
}

+ (id)speechSynthesisCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)totalPacketNumber
{
  return AceObjectIntegerForProperty(self, @"totalPacketNumber");
}

- (void)setTotalPacketNumber:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end