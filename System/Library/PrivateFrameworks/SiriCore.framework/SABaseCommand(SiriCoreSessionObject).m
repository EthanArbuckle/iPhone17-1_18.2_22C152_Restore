@interface SABaseCommand(SiriCoreSessionObject)
- (id)siriCore_serializedAceDataError:()SiriCoreSessionObject;
- (uint64_t)siriCore_bufferingAllowedDuringActiveSession;
- (uint64_t)siriCore_isProvisional;
- (uint64_t)siriCore_isRetryable;
- (uint64_t)siriCore_requestId;
- (uint64_t)siriCore_supportedByLocalSession;
- (uint64_t)siriCore_supportedByRemoteLimitedSession;
@end

@implementation SABaseCommand(SiriCoreSessionObject)

- (uint64_t)siriCore_supportedByRemoteLimitedSession
{
  return 1;
}

- (uint64_t)siriCore_supportedByLocalSession
{
  return 1;
}

- (uint64_t)siriCore_requestId
{
  return 0;
}

- (uint64_t)siriCore_isProvisional
{
  return 0;
}

- (uint64_t)siriCore_isRetryable
{
  return 1;
}

- (uint64_t)siriCore_bufferingAllowedDuringActiveSession
{
  return 1;
}

- (id)siriCore_serializedAceDataError:()SiriCoreSessionObject
{
  return +[SiriCoreAceSerialization dataForObject:a1 error:a3];
}

@end