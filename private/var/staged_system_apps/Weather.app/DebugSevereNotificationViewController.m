@interface DebugSevereNotificationViewController
- (_TtC7Weather37DebugSevereNotificationViewController)initWithCoder:(id)a3;
- (_TtC7Weather37DebugSevereNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Weather37DebugSevereNotificationViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation DebugSevereNotificationViewController

- (_TtC7Weather37DebugSevereNotificationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10056A10C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10056A194();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_10056A2A4((uint64_t)self, a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  sub_10056A2E0((uint64_t)self, a4);
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
  id v12 = sub_10056A368();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC7Weather37DebugSevereNotificationViewController)initWithStyle:(int64_t)a3
{
}

- (_TtC7Weather37DebugSevereNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_10056AC6C();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC7Weather37DebugSevereNotificationViewController_notification;
  uint64_t v4 = type metadata accessor for SevereNotificationEntity();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100246AD8((uint64_t)self + OBJC_IVAR____TtC7Weather37DebugSevereNotificationViewController_content);
  id v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Weather37DebugSevereNotificationViewController____lazy_storage___dateFormatter);
}

@end