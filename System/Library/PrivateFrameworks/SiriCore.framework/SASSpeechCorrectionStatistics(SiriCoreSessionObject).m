@interface SASSpeechCorrectionStatistics(SiriCoreSessionObject)
- (uint64_t)siriCore_supportedByLocalSession;
- (uint64_t)siriCore_supportedByRemoteLimitedSession;
@end

@implementation SASSpeechCorrectionStatistics(SiriCoreSessionObject)

- (uint64_t)siriCore_supportedByRemoteLimitedSession
{
  return 0;
}

- (uint64_t)siriCore_supportedByLocalSession
{
  return 0;
}

@end