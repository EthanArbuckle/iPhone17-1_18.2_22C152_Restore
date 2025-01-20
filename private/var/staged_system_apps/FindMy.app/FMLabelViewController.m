@interface FMLabelViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (_TtC6FindMy21FMLabelViewController)initWithCoder:(id)a3;
- (_TtC6FindMy21FMLabelViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)completeEditingTableViewCellTextActionWithSender:(id)a3;
- (void)performCancelActionWithSender:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleEditingActionWithSender:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMLabelViewController

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result = 0.0;
  if (!a4) {
    return *(double *)&self->mediator[OBJC_IVAR____TtC6FindMy21FMLabelViewController_style];
  }
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_100295990(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1002915BC(v10, v9);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v8 = IndexPath.section.getter() == 1;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  v13 = self;
  sub_100295A28(a4, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10005D034(&qword_1006AF770);
  __chkstk_darwin(v10 - 8);
  id v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  uint64_t v14 = self;
  sub_1002941D0((uint64_t)v9, (uint64_t)v12);

  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1)
  {
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v15(v12, v6);
  }

  return isa;
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
  sub_10029523C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  int64_t v12 = sub_100296008();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (_TtC6FindMy21FMLabelViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003E1A5C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003DAB68();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1003DB230(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  sub_1003DB7C8((id)v3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1003DBB74(a3);
}

- (void)toggleEditingActionWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003E1FCC();
}

- (void)completeEditingTableViewCellTextActionWithSender:(id)a3
{
  uint64_t v3 = OBJC_IVAR____TtC6FindMy21FMLabelViewController_editingTableViewCellText;
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy21FMLabelViewController_editingTableViewCellText);
  if (v4)
  {
    id v6 = a3;
    uint64_t v7 = self;
    uint64_t v8 = v4;
    sub_1003DE778(v8);
    id v9 = *(Class *)((char *)&self->super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.isa + v3) = 0;
  }
}

- (void)performCancelActionWithSender:(id)a3
{
  v8[4] = State.rawValue.getter;
  v8[5] = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_10003C410;
  v8[3] = &unk_1006392C0;
  id v5 = _Block_copy(v8);
  id v6 = a3;
  uint64_t v7 = self;
  [(FMLabelViewController *)v7 dismissViewControllerAnimated:1 completion:v5];
  _Block_release(v5);
}

- (_TtC6FindMy21FMLabelViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (_TtC6FindMy21FMLabelViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy21FMLabelViewController_location, (uint64_t *)&unk_1006AF710);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMLabelViewController_editingTableViewCellText));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMLabelViewController_rightBarButtonItem));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end