@interface ChargingNetworksDataSource
- (NSSet)selectedNetworks;
- (NSString)searchString;
- (_TtC4Maps26ChargingNetworksDataSource)init;
- (_TtC4Maps26ChargingNetworksDataSource)initWithExcludedNetworks:(id)a3 context:(int64_t)a4 delegate:(id)a5;
- (id)indexPathForNetwork:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)availableNetworksDidChangeForProvider:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSelectedNetworks:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
@end

@implementation ChargingNetworksDataSource

- (NSString)searchString
{
  if (*(void *)&self->provider[OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_searchString])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setSearchString:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_searchString);
  uint64_t *v6 = v4;
  v6[1] = v5;
  v7 = self;
  swift_bridgeObjectRelease();
  sub_1001ECDFC();
}

- (NSSet)selectedNetworks
{
  swift_beginAccess();
  sub_100100830(0, (unint64_t *)&unk_1015D4B20);
  sub_1001EF808();
  swift_bridgeObjectRetain();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v2.super.isa;
}

- (void)setSelectedNetworks:(id)a3
{
  sub_100100830(0, (unint64_t *)&unk_1015D4B20);
  sub_1001EF808();
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_selectedNetworks);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC4Maps26ChargingNetworksDataSource)initWithExcludedNetworks:(id)a3 context:(int64_t)a4 delegate:(id)a5
{
  v7 = a3;
  if (a3)
  {
    sub_100100830(0, (unint64_t *)&unk_1015D4B20);
    sub_1001EF808();
    v7 = (void *)static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_unknownObjectRetain();

  return (_TtC4Maps26ChargingNetworksDataSource *)sub_1003312DC(v7, a4, a5, (char *)self);
}

- (id)indexPathForNetwork:(id)a3
{
  uint64_t v5 = sub_1000FF33C(&qword_1015D4B40);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  v9 = self;
  sub_1001ED658(v8, (uint64_t)v7);

  uint64_t v10 = type metadata accessor for IndexPath();
  uint64_t v11 = *(void *)(v10 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }

  return isa;
}

- (_TtC4Maps26ChargingNetworksDataSource)init
{
  result = (_TtC4Maps26ChargingNetworksDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps26ChargingNetworksDataSource_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1001EDB7C((uint64_t)v6, a4);
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

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  uint64_t v8 = (void *)sub_1001EDDAC((uint64_t)v6, a4);

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_1001EF740(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  v12 = (void *)sub_1001EE24C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
}

- (void)availableNetworksDidChangeForProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001EEBE4(v4);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001EF044(v4);
}

@end