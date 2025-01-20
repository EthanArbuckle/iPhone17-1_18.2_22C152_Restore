@interface DebugOfflineViewController
- (_TtC7Weather26DebugOfflineViewController)initWithCoder:(id)a3;
- (_TtC7Weather26DebugOfflineViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Weather26DebugOfflineViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DebugOfflineViewController

- (_TtC7Weather26DebugOfflineViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100407154();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1004071E4();
}

- (_TtC7Weather26DebugOfflineViewController)initWithStyle:(int64_t)a3
{
}

- (_TtC7Weather26DebugOfflineViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_100407380();
}

- (void).cxx_destruct
{
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_100407654((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(void))sub_100407548);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_100407654((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(void))sub_1004075E8);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return sub_1004076B4();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_1004076EC((uint64_t)self, a4);
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
  v12 = (void *)sub_10040775C();

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
  sub_100407970(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end