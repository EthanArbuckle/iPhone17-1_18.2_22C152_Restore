@interface DebugNotificationFetchSchedulesViewController
- (_TtC7Weather45DebugNotificationFetchSchedulesViewController)initWithCoder:(id)a3;
- (_TtC7Weather45DebugNotificationFetchSchedulesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Weather45DebugNotificationFetchSchedulesViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation DebugNotificationFetchSchedulesViewController

- (_TtC7Weather45DebugNotificationFetchSchedulesViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100B51974();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100B519F4();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_100B51B18();
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
  v12 = (void *)sub_100B51B50(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC7Weather45DebugNotificationFetchSchedulesViewController)initWithStyle:(int64_t)a3
{
}

- (_TtC7Weather45DebugNotificationFetchSchedulesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_100B52394();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Weather45DebugNotificationFetchSchedulesViewController____lazy_storage___dateFormatter);
}

@end