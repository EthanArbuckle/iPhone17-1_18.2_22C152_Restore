@interface SiriAnalyticsLargeMessageUploadProcessingResult
- (BOOL)determinationMade;
- (BOOL)suppressed;
- (SiriAnalyticsLargeMessageUploadProcessingResult)init;
@end

@implementation SiriAnalyticsLargeMessageUploadProcessingResult

- (BOOL)determinationMade
{
  return LargeMessageUploadProcessingResult.determinationMade.getter() & 1;
}

- (BOOL)suppressed
{
  return LargeMessageUploadProcessingResult.suppressed.getter() & 1;
}

- (SiriAnalyticsLargeMessageUploadProcessingResult)init
{
}

@end