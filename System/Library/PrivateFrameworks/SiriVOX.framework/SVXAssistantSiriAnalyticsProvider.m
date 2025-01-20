@interface SVXAssistantSiriAnalyticsProvider
- (id)get;
@end

@implementation SVXAssistantSiriAnalyticsProvider

- (id)get
{
  return (id)[MEMORY[0x263F6C818] sharedAnalytics];
}

@end