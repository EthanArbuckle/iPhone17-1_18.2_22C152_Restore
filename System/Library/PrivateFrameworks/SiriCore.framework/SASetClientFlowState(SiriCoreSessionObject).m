@interface SASetClientFlowState(SiriCoreSessionObject)
- (uint64_t)siriCore_supportedByLocalSession;
@end

@implementation SASetClientFlowState(SiriCoreSessionObject)

- (uint64_t)siriCore_supportedByLocalSession
{
  return 0;
}

@end