@interface SiriAnalyticsOffDeviceTopicsShim
+ (NSString)unordered;
- (SiriAnalyticsOffDeviceTopicsShim)init;
@end

@implementation SiriAnalyticsOffDeviceTopicsShim

+ (NSString)unordered
{
  static OffDeviceTopicsShim.unordered.getter();
  v2 = (void *)sub_1A2C0D470();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (SiriAnalyticsOffDeviceTopicsShim)init
{
  return (SiriAnalyticsOffDeviceTopicsShim *)OffDeviceTopicsShim.init()();
}

@end