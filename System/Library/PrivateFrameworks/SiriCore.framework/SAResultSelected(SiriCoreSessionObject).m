@interface SAResultSelected(SiriCoreSessionObject)
- (uint64_t)siriCore_isProvisional;
- (uint64_t)siriCore_isRetryable;
@end

@implementation SAResultSelected(SiriCoreSessionObject)

- (uint64_t)siriCore_isProvisional
{
  return 1;
}

- (uint64_t)siriCore_isRetryable
{
  return 0;
}

@end