@interface SASUpdateAudioInfo(SiriCoreSessionObject)
- (uint64_t)siriCore_isRestartable;
@end

@implementation SASUpdateAudioInfo(SiriCoreSessionObject)

- (uint64_t)siriCore_isRestartable
{
  return 0;
}

@end