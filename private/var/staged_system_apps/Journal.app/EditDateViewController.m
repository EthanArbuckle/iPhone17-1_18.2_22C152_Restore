@interface EditDateViewController
- (_TtC7Journal22EditDateViewController)initWithCoder:(id)a3;
- (_TtC7Journal22EditDateViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelTapped:(id)a3;
- (void)datePickerValueChanged:(id)a3;
- (void)doneTapped:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation EditDateViewController

- (_TtC7Journal22EditDateViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100064F20();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100063088();
}

- (_TtC7Journal22EditDateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal22EditDateViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal22EditDateViewController_preselectedDate, (uint64_t *)&unk_1007FC470);
  swift_release();
  swift_release();
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal22EditDateViewController_delegate);

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal22EditDateViewController_datePicker);
}

- (void)doneTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10006503C();
}

- (void)cancelTapped:(id)a3
{
  uint64_t v5 = sub_100010218(&qword_1007FABA8);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtC7Journal22EditDateViewController_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v11 = sub_100010218((uint64_t *)&unk_100804070);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
    id v12 = a3;
    v13 = self;
    sub_100062EC0((uint64_t)v7, ObjectType, v9);
    swift_unknownObjectRelease();
    sub_10001457C((uint64_t)v7, &qword_1007FABA8);
  }
}

- (void)datePickerValueChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000656BC();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_100065830(a4);
  uint64_t v9 = v8;
  swift_bridgeObjectRetain();

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

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  sub_1000658DC(a4);
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

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_100065948(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v10 = (char *)a3;
  uint64_t v11 = self;
  id v12 = (void *)sub_100064198(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1000659EC((unint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end