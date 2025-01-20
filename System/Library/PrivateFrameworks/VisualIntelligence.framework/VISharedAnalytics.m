@interface VISharedAnalytics
@end

@implementation VISharedAnalytics

void ___VISharedAnalytics_block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F5CBE0]) initWithId:@"com.apple.mediaanalysisd" userAgent:@"VisualIntelligence/1"];
  id v4 = [MEMORY[0x1E4F5CBD8] sharedPARSessionWithConfiguration:v0];
  v1 = [[VIAFeedbackSubmitter alloc] initWithPARSession:v4];
  v2 = [[VIAnalytics alloc] initWithFeedbackSubmitter:v1];
  v3 = (void *)_VISharedAnalytics_analytics;
  _VISharedAnalytics_analytics = (uint64_t)v2;
}

@end