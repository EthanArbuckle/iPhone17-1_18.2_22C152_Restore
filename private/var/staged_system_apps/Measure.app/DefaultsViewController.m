@interface DefaultsViewController
- (_TtC7Measure22DefaultsViewController)initWithCoder:(id)a3;
- (_TtC7Measure22DefaultsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Measure22DefaultsViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation DefaultsViewController

- (_TtC7Measure22DefaultsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure22DefaultsViewController_cancellables) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtC7Measure22DefaultsViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100108E3C();
}

- (_TtC7Measure22DefaultsViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC7Measure22DefaultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7Measure22DefaultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Measure22DefaultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure22DefaultsViewController_groups))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC7Measure22DefaultsViewController_groups);
    if (*(void *)(v4 + 16) > (unint64_t)a4) {
      return *(void *)(*(void *)(v4 + 24 * a4 + 48) + 16);
    }
  }
  __break(1u);
  return self;
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
  v12 = (void *)sub_100109268(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)((char *)self + OBJC_IVAR____TtC7Measure22DefaultsViewController_groups);
  if (*(void *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return self;
  }
  if (*(void *)(v4 + 24 * a4 + 40))
  {
    swift_bridgeObjectRetain();
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure22DefaultsViewController_groups);
  id v11 = a3;
  v12 = self;
  unint64_t v13 = IndexPath.section.getter();
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v13 >= *(void *)(v10 + 16))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v15 = *(void *)(v10 + 24 * v13 + 48);
  swift_bridgeObjectRetain();
  unint64_t v16 = IndexPath.row.getter();
  if ((v16 & 0x8000000000000000) != 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v16 >= *(void *)(v15 + 16))
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t v17 = v15 + 48 * v16;
  uint64_t v18 = *(void *)(v17 + 64);
  int v19 = *(unsigned __int8 *)(v17 + 72);

  swift_bridgeObjectRelease();
  double v20 = 216.0;
  if (!v18) {
    double v20 = 54.0;
  }
  if (v19) {
    double v21 = v20;
  }
  else {
    double v21 = 54.0;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v21;
}

@end