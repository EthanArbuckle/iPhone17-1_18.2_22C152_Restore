@interface GEOAPCurrentUploadDebugController
- (_TtC4Maps33GEOAPCurrentUploadDebugController)initWithCoder:(id)a3;
- (_TtC4Maps33GEOAPCurrentUploadDebugController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC4Maps33GEOAPCurrentUploadDebugController)initWithStyle:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation GEOAPCurrentUploadDebugController

- (_TtC4Maps33GEOAPCurrentUploadDebugController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001C0D28();
}

- (_TtC4Maps33GEOAPCurrentUploadDebugController)initWithStyle:(int64_t)a3
{
  uint64_t v5 = OBJC_IVAR____TtC4Maps33GEOAPCurrentUploadDebugController_dataModel;
  type metadata accessor for GEOAPCurrentUploadDataModel();
  v6 = (objc_class *)swift_allocObject();
  *((void *)v6 + 3) = 0;
  sub_1001BF40C();
  sub_1001BF460();
  v7 = self;
  NSDiffableDataSourceSnapshot.init()();
  *(void *)((char *)v6 + OBJC_IVAR____TtC4Maps27GEOAPCurrentUploadDataModel_dataSource) = 0;
  *((void *)v6 + 2) = _swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = v6;

  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for GEOAPCurrentUploadDebugController();
  return [(GEOAPCurrentUploadDebugController *)&v9 initWithStyle:a3];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001C03F0();
}

- (_TtC4Maps33GEOAPCurrentUploadDebugController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Maps33GEOAPCurrentUploadDebugController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end