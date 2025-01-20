@interface ActivityDateCache
- (HKDateCache)dateCache;
- (NSCalendar)calendar;
- (NSDate)currentDeviceDate;
- (NSDate)currentSelectedDate;
- (_TtC10FitnessApp17ActivityDateCache)init;
- (void)dateCacheDidUpdate:(id)a3 onNotification:(id)a4;
- (void)dealloc;
- (void)setCurrentDeviceDate:(id)a3;
- (void)setCurrentSelectedDate:(id)a3;
- (void)setWithCurrentDeviceDate:(id)a3 caller:(id)a4;
- (void)setWithCurrentSelectedDate:(id)a3 caller:(id)a4;
@end

@implementation ActivityDateCache

- (_TtC10FitnessApp17ActivityDateCache)init
{
  return (_TtC10FitnessApp17ActivityDateCache *)sub_100030570();
}

- (NSDate)currentDeviceDate
{
  return (NSDate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_currentDeviceDate));
}

- (void)setCurrentDeviceDate:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_currentDeviceDate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_currentDeviceDate) = (Class)a3;
  id v3 = a3;
}

- (NSDate)currentSelectedDate
{
  return (NSDate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_currentSelectedDate));
}

- (void)setCurrentSelectedDate:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_currentSelectedDate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_currentSelectedDate) = (Class)a3;
  id v3 = a3;
}

- (void)setWithCurrentDeviceDate:(id)a3 caller:(id)a4
{
}

- (void)setWithCurrentSelectedDate:(id)a3 caller:(id)a4
{
}

- (NSCalendar)calendar
{
  v2.super.isa = Calendar._bridgeToObjectiveC()().super.isa;

  return (NSCalendar *)v2.super.isa;
}

- (HKDateCache)dateCache
{
  return (HKDateCache *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_dateCache));
}

- (void)dealloc
{
  NSCalendar v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_dateCache);
  id v3 = self;
  [v2 removeObserver:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for ActivityDateCache();
  [(ActivityDateCache *)&v4 dealloc];
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_calendar;
  uint64_t v4 = type metadata accessor for Calendar();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp17ActivityDateCache_dateCache);
}

- (void)dateCacheDidUpdate:(id)a3 onNotification:(id)a4
{
  uint64_t v6 = type metadata accessor for Notification();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)Notification.name.getter();
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0) {
      goto LABEL_9;
    }
  }
  sub_1002974A4();
LABEL_9:

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end