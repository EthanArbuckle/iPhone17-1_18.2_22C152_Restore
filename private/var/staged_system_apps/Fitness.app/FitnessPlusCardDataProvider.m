@interface FitnessPlusCardDataProvider
- (_TtC10FitnessApp27FitnessPlusCardDataProvider)init;
@end

@implementation FitnessPlusCardDataProvider

- (_TtC10FitnessApp27FitnessPlusCardDataProvider)init
{
  result = (_TtC10FitnessApp27FitnessPlusCardDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_catalogClient);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_contentAvailabilityClient);
  swift_unknownObjectRelease();
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_networkEvaluator);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_recommendationClient);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider_subscriptionClient);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider__state;
  uint64_t v4 = sub_1000AFA94(&qword_10095CBB0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC10FitnessApp27FitnessPlusCardDataProvider__pendingUpdates;
  uint64_t v6 = sub_1000AFA94(&qword_1009687D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
}

@end