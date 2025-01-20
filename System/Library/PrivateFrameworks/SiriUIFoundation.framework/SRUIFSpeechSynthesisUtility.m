@interface SRUIFSpeechSynthesisUtility
+ (BOOL)isSpeechSynthesisErrorUserCancelled:(id)a3;
@end

@implementation SRUIFSpeechSynthesisUtility

+ (BOOL)isSpeechSynthesisErrorUserCancelled:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 code];
  v5 = [v3 domain];

  BOOL v6 = v4 == 1 && ([v5 isEqualToString:@"TTSError"] & 1) != 0;
  return v6;
}

@end