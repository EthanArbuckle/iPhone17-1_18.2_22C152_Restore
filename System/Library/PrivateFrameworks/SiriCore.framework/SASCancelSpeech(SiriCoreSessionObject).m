@interface SASCancelSpeech(SiriCoreSessionObject)
- (uint64_t)siriCore_isRestartable;
- (uint64_t)siriCore_supportedByRemoteLimitedSession;
@end

@implementation SASCancelSpeech(SiriCoreSessionObject)

- (uint64_t)siriCore_supportedByRemoteLimitedSession
{
  return 0;
}

- (uint64_t)siriCore_isRestartable
{
  return 0;
}

@end