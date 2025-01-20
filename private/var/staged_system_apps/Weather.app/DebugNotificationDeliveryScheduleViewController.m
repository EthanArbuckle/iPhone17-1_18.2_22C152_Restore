@interface DebugNotificationDeliveryScheduleViewController
- (_TtC7Weather47DebugNotificationDeliveryScheduleViewController)initWithCoder:(id)a3;
- (_TtC7Weather47DebugNotificationDeliveryScheduleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Weather47DebugNotificationDeliveryScheduleViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation DebugNotificationDeliveryScheduleViewController

- (_TtC7Weather47DebugNotificationDeliveryScheduleViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1008FC790();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1008FC810();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_1008FC920((uint64_t)self, a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  sub_1008FC95C((uint64_t)self, a4);
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
  id v12 = sub_1008FCA24();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC7Weather47DebugNotificationDeliveryScheduleViewController)initWithStyle:(int64_t)a3
{
}

- (_TtC7Weather47DebugNotificationDeliveryScheduleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_1008FD7D4();
}

- (void).cxx_destruct
{
  type metadata accessor for DeliveryScheduleEntity();
  sub_100179DC0();
  sub_100162F0C();
  v3();
  type metadata accessor for PrecipitationNotification();
  sub_100179DC0();
  sub_100162F0C();
  v4();
  id v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Weather47DebugNotificationDeliveryScheduleViewController____lazy_storage___dateFormatter);
}

@end