@interface SASStartSpeech(SiriCoreSessionObject)
- (uint64_t)siriCore_isRestartable;
@end

@implementation SASStartSpeech(SiriCoreSessionObject)

- (uint64_t)siriCore_isRestartable
{
  return 0;
}

@end