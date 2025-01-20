@interface SAStartBackgroundActionRequest(SiriCoreSessionObject)
- (uint64_t)siriCore_supportedByLocalSession;
@end

@implementation SAStartBackgroundActionRequest(SiriCoreSessionObject)

- (uint64_t)siriCore_supportedByLocalSession
{
  return 0;
}

@end