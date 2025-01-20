@interface FMItemsListDataSource
- (_TtC6FindMy21FMItemsListDataSource)init;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)handleSecondaryTabAction;
- (void)handleTabAction;
- (void)handleTertiaryTabAction;
@end

@implementation FMItemsListDataSource

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy21FMItemsListDataSource_cellsViewModel))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_10044B6A8(a4);
  int64_t v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_10043E6B4(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_10044B7F0(a4);
  uint64_t v9 = v8;

  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

- (void)handleTabAction
{
  v2 = self;
  sub_100443914();
}

- (void)handleSecondaryTabAction
{
  v2 = self;
  sub_100443AB8();
}

- (void)handleTertiaryTabAction
{
  v2 = self;
  sub_100443B08();
}

- (_TtC6FindMy21FMItemsListDataSource)init
{
  result = (_TtC6FindMy21FMItemsListDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy21FMItemsListDataSource_delegate);
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();

  swift_bridgeObjectRelease();
}

@end