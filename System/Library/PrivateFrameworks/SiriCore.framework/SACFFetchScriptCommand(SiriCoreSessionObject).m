@interface SACFFetchScriptCommand(SiriCoreSessionObject)
- (uint64_t)siriCore_bufferingAllowedDuringActiveSession;
- (uint64_t)siriCore_isRetryable;
- (uint64_t)siriCore_supportedByLocalSession;
@end

@implementation SACFFetchScriptCommand(SiriCoreSessionObject)

- (uint64_t)siriCore_supportedByLocalSession
{
  return 0;
}

- (uint64_t)siriCore_isRetryable
{
  return 0;
}

- (uint64_t)siriCore_bufferingAllowedDuringActiveSession
{
  return 0;
}

@end