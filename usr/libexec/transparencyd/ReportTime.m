@interface ReportTime
- (NSDate)lastReport;
- (_TtC13transparencyd10ReportTime)init;
- (double)timeBetweenReports;
- (void)setLastReport:(id)a3;
- (void)setTimeBetweenReports:(double)a3;
@end

@implementation ReportTime

- (NSDate)lastReport
{
  uint64_t v3 = sub_100080E08((uint64_t *)&unk_10031F9A0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC13transparencyd10ReportTime_lastReport;
  swift_beginAccess();
  sub_1000985E0((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSDate *)isa;
}

- (void)setLastReport:(id)a3
{
  uint64_t v5 = sub_100080E08((uint64_t *)&unk_10031F9A0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC13transparencyd10ReportTime_lastReport;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_1000C12FC((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (double)timeBetweenReports
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC13transparencyd10ReportTime_timeBetweenReports);
  swift_beginAccess();
  return *v2;
}

- (void)setTimeBetweenReports:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR____TtC13transparencyd10ReportTime_timeBetweenReports);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (_TtC13transparencyd10ReportTime)init
{
  result = (_TtC13transparencyd10ReportTime *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end