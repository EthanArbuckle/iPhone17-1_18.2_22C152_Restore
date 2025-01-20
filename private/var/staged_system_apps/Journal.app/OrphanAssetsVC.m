@interface OrphanAssetsVC
- (_TtC7Journal14OrphanAssetsVC)initWithCoder:(id)a3;
- (_TtC7Journal14OrphanAssetsVC)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Journal14OrphanAssetsVC)initWithStyle:(int64_t)a3;
- (void)controller:(id)a3 didChangeContentWithSnapshot:(id)a4;
- (void)viewDidLoad;
@end

@implementation OrphanAssetsVC

- (void)viewDidLoad
{
  v2 = self;
  sub_1001858D8();
}

- (void)controller:(id)a3 didChangeContentWithSnapshot:(id)a4
{
  uint64_t v7 = sub_100010218(&qword_100800A38);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001B284(0, (unint64_t *)&qword_100800A40);
  sub_100187460();
  sub_1000D8780();
  static NSDiffableDataSourceSnapshot._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14OrphanAssetsVC_dataSource);
  if (v11)
  {
    id v12 = a3;
    id v13 = a4;
    v14 = self;
    id v15 = v11;
    dispatch thunk of UITableViewDiffableDataSource.apply(_:animatingDifferences:completion:)();

    sub_100186BD0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC7Journal14OrphanAssetsVC)initWithStyle:(int64_t)a3
{
  return (_TtC7Journal14OrphanAssetsVC *)sub_100186EDC(a3);
}

- (_TtC7Journal14OrphanAssetsVC)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7Journal14OrphanAssetsVC *)sub_100186FDC(v5, v7, a4);
}

- (_TtC7Journal14OrphanAssetsVC)initWithCoder:(id)a3
{
  return (_TtC7Journal14OrphanAssetsVC *)sub_100187164(a3);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal14OrphanAssetsVC____lazy_storage___fetchedResultsController);
}

@end