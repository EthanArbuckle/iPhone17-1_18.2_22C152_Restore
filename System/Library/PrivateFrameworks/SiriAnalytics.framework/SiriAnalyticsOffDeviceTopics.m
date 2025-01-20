@interface SiriAnalyticsOffDeviceTopics
+ (id)unordered;
@end

@implementation SiriAnalyticsOffDeviceTopics

+ (id)unordered
{
  return +[SiriAnalyticsOffDeviceTopicsShim unordered];
}

@end