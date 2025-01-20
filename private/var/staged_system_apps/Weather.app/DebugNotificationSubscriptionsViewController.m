@interface DebugNotificationSubscriptionsViewController
- (_TtC7Weather44DebugNotificationSubscriptionsViewController)initWithCoder:(id)a3;
- (_TtC7Weather44DebugNotificationSubscriptionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Weather44DebugNotificationSubscriptionsViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DebugNotificationSubscriptionsViewController

- (_TtC7Weather44DebugNotificationSubscriptionsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10055EF48();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10055EFD4();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_10055F108((uint64_t)v7, a4);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_10055F338((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_10055F1E4);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_10055F338((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_10055F250);
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
  id v12 = sub_10055F394(v10);

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
  sub_10055F624(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC7Weather44DebugNotificationSubscriptionsViewController)initWithStyle:(int64_t)a3
{
}

- (_TtC7Weather44DebugNotificationSubscriptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_10056113C();
}

- (void).cxx_destruct
{
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0((uint64_t)self + OBJC_IVAR____TtC7Weather44DebugNotificationSubscriptionsViewController_notificationsManager);
  swift_release();
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0((uint64_t)self+ OBJC_IVAR____TtC7Weather44DebugNotificationSubscriptionsViewController_notificationSubscriptionManager);
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Weather44DebugNotificationSubscriptionsViewController____lazy_storage___dateFormatter);
}

@end