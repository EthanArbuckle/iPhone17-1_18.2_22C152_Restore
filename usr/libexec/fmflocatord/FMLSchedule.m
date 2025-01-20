@interface FMLSchedule
- (BOOL)isCurrentAt:(id)a3;
- (NSString)description;
- (NSTimeZone)timeZone;
- (_TtC11fmflocatord11FMLSchedule)init;
- (_TtC11fmflocatord11FMLSchedule)initWithDictionary:(id)a3;
- (id)dictionary;
- (id)nextStartOrEndDateFrom:(id)a3;
- (unint64_t)daysOfWeek;
- (unint64_t)endHour;
- (unint64_t)endMin;
- (unint64_t)spanDays;
- (unint64_t)startHour;
- (unint64_t)startMin;
@end

@implementation FMLSchedule

- (unint64_t)startHour
{
  return sub_1000335EC(self, (uint64_t)a2, (void (*)(uint64_t))&Fence.Schedule.start.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.hour.getter);
}

- (unint64_t)startMin
{
  return sub_1000335EC(self, (uint64_t)a2, (void (*)(uint64_t))&Fence.Schedule.start.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.minute.getter);
}

- (unint64_t)daysOfWeek
{
  uint64_t v3 = type metadata accessor for Fence.DaysOfWeek();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Fence.Schedule();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = self;
  Fence.Schedule.Matcher.schedule.getter();
  Fence.Schedule.daysOfWeek.getter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  unsigned __int8 v12 = Fence.DaysOfWeek.rawValue.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v12;
}

- (unint64_t)endHour
{
  return sub_1000335EC(self, (uint64_t)a2, (void (*)(uint64_t))&Fence.Schedule.end.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.hour.getter);
}

- (unint64_t)endMin
{
  return sub_1000335EC(self, (uint64_t)a2, (void (*)(uint64_t))&Fence.Schedule.end.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.minute.getter);
}

- (unint64_t)spanDays
{
  return 0;
}

- (NSTimeZone)timeZone
{
  uint64_t v3 = type metadata accessor for Fence.Schedule();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TimeZone();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = self;
  Fence.Schedule.Matcher.schedule.getter();
  Fence.Schedule.timeZone.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v12.super.isa = TimeZone._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return (NSTimeZone *)v12.super.isa;
}

- (BOOL)isCurrentAt:(id)a3
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  char v9 = Fence.Schedule.Matcher.doesMatchSchedule(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9 & 1;
}

- (id)nextStartOrEndDateFrom:(id)a3
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10002C6C8(&qword_10006D390);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = self;
  Fence.Schedule.Matcher.nextStartOrEndDate(from:)();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);

  NSTimeZone v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v7, v4);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    v12(v10, v4);
  }

  return isa;
}

- (NSString)description
{
  uint64_t v3 = type metadata accessor for Fence.Schedule();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  Fence.Schedule.Matcher.schedule.getter();
  Fence.Schedule.description.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (_TtC11fmflocatord11FMLSchedule)init
{
  result = (_TtC11fmflocatord11FMLSchedule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11fmflocatord11FMLSchedule_matcher;
  uint64_t v3 = type metadata accessor for Fence.Schedule.Matcher();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

- (id)dictionary
{
  v2 = self;
  sub_100034604();

  v3.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (_TtC11fmflocatord11FMLSchedule)initWithDictionary:(id)a3
{
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC11fmflocatord11FMLSchedule *)sub_100034EC4(v3);
}

@end