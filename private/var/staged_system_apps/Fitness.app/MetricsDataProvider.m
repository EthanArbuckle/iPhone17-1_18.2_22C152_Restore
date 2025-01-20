@interface MetricsDataProvider
- (_TtC10FitnessApp19MetricsDataProvider)init;
@end

@implementation MetricsDataProvider

- (_TtC10FitnessApp19MetricsDataProvider)init
{
  result = (_TtC10FitnessApp19MetricsDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10006A4B8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp19MetricsDataProvider_metricFormattingHelper, (uint64_t (*)(void))type metadata accessor for MetricFormattingHelper);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp19MetricsDataProvider_workoutFormattingManager));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp19MetricsDataProvider_mindfulnessDataProvider));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp19MetricsDataProvider_delegate);

  swift_release();
}

@end