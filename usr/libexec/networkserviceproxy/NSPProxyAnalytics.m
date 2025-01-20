@interface NSPProxyAnalytics
- (id)analyticsDict;
- (id)eventName;
- (void)sendAnalytics;
@end

@implementation NSPProxyAnalytics

- (id)eventName
{
  return @"com.apple.nsp";
}

- (id)analyticsDict
{
  return 0;
}

- (void)sendAnalytics
{
  v2 = [(NSPProxyAnalytics *)self eventName];
  AnalyticsSendEventLazy();
}

@end