@interface GEOAPHistoricalUploadDebugController
- (_TtC4Maps36GEOAPHistoricalUploadDebugController)initWithCoder:(id)a3;
- (_TtC4Maps36GEOAPHistoricalUploadDebugController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC4Maps36GEOAPHistoricalUploadDebugController)initWithStyle:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation GEOAPHistoricalUploadDebugController

- (_TtC4Maps36GEOAPHistoricalUploadDebugController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC4Maps36GEOAPHistoricalUploadDebugController_dataModel;
  type metadata accessor for GEOAPHistoricalUploadDataModel(0);
  v6 = (objc_class *)swift_allocObject();
  *((void *)v6 + 3) = 0;
  type metadata accessor for GEOAPHistoricalModelItem();
  sub_10034B50C();
  sub_10034E828((unint64_t *)&unk_1015DC850, v7, (void (*)(uint64_t))type metadata accessor for GEOAPHistoricalModelItem);
  id v8 = a3;
  NSDiffableDataSourceSnapshot.init()();
  *(void *)((char *)v6 + OBJC_IVAR____TtC4Maps30GEOAPHistoricalUploadDataModel_dataSource) = 0;
  *((void *)v6 + 2) = _swiftEmptyDictionarySingleton;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = v6;

  result = (_TtC4Maps36GEOAPHistoricalUploadDebugController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC4Maps36GEOAPHistoricalUploadDebugController)initWithStyle:(int64_t)a3
{
  uint64_t v5 = OBJC_IVAR____TtC4Maps36GEOAPHistoricalUploadDebugController_dataModel;
  type metadata accessor for GEOAPHistoricalUploadDataModel(0);
  v6 = (objc_class *)swift_allocObject();
  *((void *)v6 + 3) = 0;
  type metadata accessor for GEOAPHistoricalModelItem();
  sub_10034B50C();
  sub_10034E828((unint64_t *)&unk_1015DC850, v7, (void (*)(uint64_t))type metadata accessor for GEOAPHistoricalModelItem);
  id v8 = self;
  NSDiffableDataSourceSnapshot.init()();
  *(void *)((char *)v6 + OBJC_IVAR____TtC4Maps30GEOAPHistoricalUploadDataModel_dataSource) = 0;
  *((void *)v6 + 2) = _swiftEmptyDictionarySingleton;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = v6;

  v10.receiver = v8;
  v10.super_class = (Class)type metadata accessor for GEOAPHistoricalUploadDebugController();
  return [(GEOAPHistoricalUploadDebugController *)&v10 initWithStyle:a3];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10034E1B8();
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
  sub_10035682C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC4Maps36GEOAPHistoricalUploadDebugController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Maps36GEOAPHistoricalUploadDebugController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end