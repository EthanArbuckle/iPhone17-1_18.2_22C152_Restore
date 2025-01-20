@interface PluginSchedulerTimestamp
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (_TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp)init;
- (_TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PluginSchedulerTimestamp

+ (BOOL)supportsSecureCoding
{
  return byte_1EA699188;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA699188 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D2F69518(v4);
}

- (_TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp)initWithCoder:(id)a3
{
  return (_TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp *)sub_1D2F69674(a3);
}

- (NSString)debugDescription
{
  v2 = self;
  sub_1D2F6989C();

  v3 = (void *)_sSS28SiriPrivateLearningAnalyticsE10toNSObjectSo0F0CyF_0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp)init
{
  result = (_TtC28SiriPrivateLearningAnalytics24PluginSchedulerTimestamp *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end