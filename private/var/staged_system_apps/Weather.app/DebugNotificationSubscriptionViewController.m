@interface DebugNotificationSubscriptionViewController
- (_TtC7Weather43DebugNotificationSubscriptionViewController)initWithCoder:(id)a3;
- (_TtC7Weather43DebugNotificationSubscriptionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Weather43DebugNotificationSubscriptionViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DebugNotificationSubscriptionViewController

- (_TtC7Weather43DebugNotificationSubscriptionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100695D4C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100695E08();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_100696054((uint64_t)v7, a4);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  sub_1006961E4((uint64_t)self, a4);
  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_1006962B0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100696494();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC7Weather43DebugNotificationSubscriptionViewController)initWithStyle:(int64_t)a3
{
}

- (_TtC7Weather43DebugNotificationSubscriptionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_100697D7C();
}

- (void).cxx_destruct
{
  swift_release();
  type metadata accessor for SubscriptionEntity();
  sub_100162E4C();
  sub_100162F0C();
  v3();
  sub_100178110((uint64_t)self+ OBJC_IVAR____TtC7Weather43DebugNotificationSubscriptionViewController____lazy_storage___fetchSchedule, &qword_100E897A0);
  sub_100178110((uint64_t)self+ OBJC_IVAR____TtC7Weather43DebugNotificationSubscriptionViewController____lazy_storage___deliverySchedule, &qword_100E89798);
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Weather43DebugNotificationSubscriptionViewController____lazy_storage___dateFormatter);
}

@end