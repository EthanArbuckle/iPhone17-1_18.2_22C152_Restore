@interface TitleValueTableViewController
- (_TtC7Journal29TitleValueTableViewController)initWithCoder:(id)a3;
- (_TtC7Journal29TitleValueTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Journal29TitleValueTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)refreshData;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidLoad;
@end

@implementation TitleValueTableViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10024882C();
}

- (void)refreshData
{
  uint64_t v3 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x78);
  v7 = self;
  v6();
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  type metadata accessor for MainActor();
  v9 = v7;
  uint64_t v10 = static MainActor.shared.getter();
  v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = &protocol witness table for MainActor;
  v11[4] = v9;
  sub_100328A60((uint64_t)v5, (uint64_t)&unk_100804FC0, (uint64_t)v11);

  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29TitleValueTableViewController_data))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_10024976C(a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  sub_1002497A4(a4);
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

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_100195454(v8);
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
  id v12 = sub_100249808();

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
  sub_100249AE0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC7Journal29TitleValueTableViewController)initWithStyle:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal29TitleValueTableViewController_data) = (Class)_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TitleValueTableViewController();
  return [(TitleValueTableViewController *)&v5 initWithStyle:a3];
}

- (_TtC7Journal29TitleValueTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal29TitleValueTableViewController_data) = (Class)_swiftEmptyArrayStorage;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal29TitleValueTableViewController_data) = (Class)_swiftEmptyArrayStorage;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TitleValueTableViewController();
  v9 = [(TitleValueTableViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC7Journal29TitleValueTableViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal29TitleValueTableViewController_data) = (Class)_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TitleValueTableViewController();
  return [(TitleValueTableViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end