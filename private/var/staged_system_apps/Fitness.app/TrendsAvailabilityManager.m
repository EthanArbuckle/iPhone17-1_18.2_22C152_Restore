@interface TrendsAvailabilityManager
+ (NSString)trendsAvailabilityDidChangeNotification;
- (_TtC10FitnessApp25TrendsAvailabilityManager)init;
- (_TtC10FitnessApp25TrendsAvailabilityManager)initWithDataProvider:(id)a3 healthStore:(id)a4;
- (int64_t)trendsAvailability;
- (void)activitySummaryDidChangeWithNote:(id)a3;
- (void)setTrendsAvailability:(int64_t)a3;
- (void)updateWithNote:(id)a3;
@end

@implementation TrendsAvailabilityManager

- (_TtC10FitnessApp25TrendsAvailabilityManager)initWithDataProvider:(id)a3 healthStore:(id)a4
{
  return (_TtC10FitnessApp25TrendsAvailabilityManager *)sub_10004A220(a3, a4);
}

- (void)activitySummaryDidChangeWithNote:(id)a3
{
  uint64_t v5 = sub_1000AFA94(&qword_100955F38);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Notification();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Notification();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_100026DBC((uint64_t)v7);

  sub_10008DB18((uint64_t)v7, &qword_100955F38);
}

- (int64_t)trendsAvailability
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10FitnessApp25TrendsAvailabilityManager_trendsAvailability);
}

+ (NSString)trendsAvailabilityDidChangeNotification
{
  if (qword_10094AEB8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100998540;

  return (NSString *)v2;
}

- (void)setTrendsAvailability:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp25TrendsAvailabilityManager_trendsAvailability) = (Class)a3;
}

- (void)updateWithNote:(id)a3
{
  uint64_t v5 = sub_1000AFA94(&qword_100955F38);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Notification();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Notification();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_100036394();

  sub_10008DB18((uint64_t)v7, &qword_100955F38);
}

- (_TtC10FitnessApp25TrendsAvailabilityManager)init
{
  result = (_TtC10FitnessApp25TrendsAvailabilityManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp25TrendsAvailabilityManager_healthStore);
}

@end