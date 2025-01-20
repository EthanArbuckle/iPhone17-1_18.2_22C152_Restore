@interface GEOAPSessionSpecificHistoricalDebugController
- (_TtC4Maps45GEOAPSessionSpecificHistoricalDebugController)initWithCoder:(id)a3;
- (_TtC4Maps45GEOAPSessionSpecificHistoricalDebugController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC4Maps45GEOAPSessionSpecificHistoricalDebugController)initWithStyle:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation GEOAPSessionSpecificHistoricalDebugController

- (_TtC4Maps45GEOAPSessionSpecificHistoricalDebugController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10033B814();
}

- (_TtC4Maps45GEOAPSessionSpecificHistoricalDebugController)initWithStyle:(int64_t)a3
{
  return (_TtC4Maps45GEOAPSessionSpecificHistoricalDebugController *)sub_100337EC8(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100338080();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = [(GEOAPSessionSpecificHistoricalDebugController *)v11 tableView];
  if (v12)
  {
    v13 = v12;
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    [v13 deselectRowAtIndexPath:isa animated:1];

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC4Maps45GEOAPSessionSpecificHistoricalDebugController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Maps45GEOAPSessionSpecificHistoricalDebugController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end