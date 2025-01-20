@interface BalanceDataProvider
- (_TtC10FitnessApp19BalanceDataProvider)init;
- (_TtC10FitnessApp19BalanceDataProvider)initWithHealthStore:(id)a3 gregorianCalendar:(id)a4 historyDataProvider:(id)a5 activityDataProvider:(id)a6 isFaking:(BOOL)a7;
- (void)dealloc;
@end

@implementation BalanceDataProvider

- (_TtC10FitnessApp19BalanceDataProvider)initWithHealthStore:(id)a3 gregorianCalendar:(id)a4 historyDataProvider:(id)a5 activityDataProvider:(id)a6 isFaking:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v11 = type metadata accessor for Calendar();
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC10FitnessApp19BalanceDataProvider *)sub_1000573B0((void (*)(char *, uint64_t))a3, (uint64_t)v13, (void (*)(char *, uint64_t))a5, a6, v7);
}

- (void)dealloc
{
  v2 = self;
  sub_100220408();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp19BalanceDataProvider__dayRange;
  uint64_t v4 = type metadata accessor for GregorianDayRange();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v5 = (char *)self + OBJC_IVAR____TtC10FitnessApp19BalanceDataProvider___observationRegistrar;
  uint64_t v6 = type metadata accessor for ObservationRegistrar();
  BOOL v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (_TtC10FitnessApp19BalanceDataProvider)init
{
  result = (_TtC10FitnessApp19BalanceDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end