@interface SASSpeechPacket(SiriCoreSessionObject)
- (uint64_t)siriCore_supportedByRemoteLimitedSession;
@end

@implementation SASSpeechPacket(SiriCoreSessionObject)

- (uint64_t)siriCore_supportedByRemoteLimitedSession
{
  return 0;
}

@end