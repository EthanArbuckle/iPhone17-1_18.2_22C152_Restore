@interface DebugNotificationDeliverySchedulesViewController
- (_TtC7Weather48DebugNotificationDeliverySchedulesViewController)initWithCoder:(id)a3;
- (_TtC7Weather48DebugNotificationDeliverySchedulesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Weather48DebugNotificationDeliverySchedulesViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DebugNotificationDeliverySchedulesViewController

- (_TtC7Weather48DebugNotificationDeliverySchedulesViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1008CFF58();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1008CFFD8();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_1008D00F4();
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
  v12 = (void *)sub_1008D012C(v10);

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
  sub_1008D07F4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC7Weather48DebugNotificationDeliverySchedulesViewController)initWithStyle:(int64_t)a3
{
}

- (_TtC7Weather48DebugNotificationDeliverySchedulesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_1008D0A60();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Weather48DebugNotificationDeliverySchedulesViewController____lazy_storage___dateFormatter);
}

@end