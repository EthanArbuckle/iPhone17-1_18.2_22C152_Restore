@interface SASyncGetAnchors(SiriCoreSessionObject)
- (uint64_t)siriCore_bufferingAllowedDuringActiveSession;
- (uint64_t)siriCore_isRetryable;
@end

@implementation SASyncGetAnchors(SiriCoreSessionObject)

- (uint64_t)siriCore_isRetryable
{
  return 0;
}

- (uint64_t)siriCore_bufferingAllowedDuringActiveSession
{
  return 0;
}

@end