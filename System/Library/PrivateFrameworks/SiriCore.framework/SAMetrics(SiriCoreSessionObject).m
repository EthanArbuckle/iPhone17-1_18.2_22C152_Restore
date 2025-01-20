@interface SAMetrics(SiriCoreSessionObject)
- (uint64_t)siriCore_isRetryable;
- (uint64_t)siriCore_requestId;
- (uint64_t)siriCore_supportedByLocalSession;
@end

@implementation SAMetrics(SiriCoreSessionObject)

- (uint64_t)siriCore_supportedByLocalSession
{
  return 0;
}

- (uint64_t)siriCore_isRetryable
{
  return 0;
}

- (uint64_t)siriCore_requestId
{
  return 0;
}

@end