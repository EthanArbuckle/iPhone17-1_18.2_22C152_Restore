@interface SASyncChunk(SiriCoreSessionObject)
- (uint64_t)siriCore_bufferingAllowedDuringActiveSession;
- (uint64_t)siriCore_isRetryable;
@end

@implementation SASyncChunk(SiriCoreSessionObject)

- (uint64_t)siriCore_isRetryable
{
  return 0;
}

- (uint64_t)siriCore_bufferingAllowedDuringActiveSession
{
  return 0;
}

@end