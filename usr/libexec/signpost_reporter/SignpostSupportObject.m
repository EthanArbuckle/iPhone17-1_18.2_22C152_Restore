@interface SignpostSupportObject
- (BOOL)canGenerateCoreAnalyticsPayload;
- (id)coreAnalyticsPayload;
@end

@implementation SignpostSupportObject

- (id)coreAnalyticsPayload
{
  return 0;
}

- (BOOL)canGenerateCoreAnalyticsPayload
{
  return 0;
}

@end