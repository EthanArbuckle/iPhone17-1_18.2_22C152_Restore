@interface TTRIGroupMembershipViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (NSUndoManager)undoManager;
- (_TtC9Reminders33TTRIGroupMembershipViewController)initWithCoder:(id)a3;
- (_TtC9Reminders33TTRIGroupMembershipViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9Reminders33TTRIGroupMembershipViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TTRIGroupMembershipViewController

- (_TtC9Reminders33TTRIGroupMembershipViewController)initWithCoder:(id)a3
{
  return (_TtC9Reminders33TTRIGroupMembershipViewController *)sub_10006C57C(a3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC9Reminders33TTRIGroupMembershipViewController_localUndoManager));
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v2 = v7.receiver;
  [(TTRIGroupMembershipViewController *)&v7 viewDidLoad];
  id v3 = [v2 tableView];
  if (v3)
  {
    v4 = v3;
    UITableView.fixUpBackgroundColorLoadedFromNibIfNeeded_workaroundRdar108920406()();

    id v5 = [v2 tableView];
    if (v5)
    {
      v6 = v5;
      [v5 setEditing:1 animated:0];

      sub_10006C6A8();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TTRIGroupMembershipViewController *)&v5 viewDidAppear:v3];
  [v4 becomeFirstResponder];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = self;
  int64_t v8 = sub_10006F7A4(a4);

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  int64_t v6 = sub_10006F870();

  return v6;
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
  id v12 = sub_10006D2D0(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = self;
  sub_10006CB3C((uint64_t)v10, &v14);
  if (v15) {
    sub_1004F5E04(&v14);
  }
  else {
    sub_1004F5A4C(&v14);
  }
  long long v18 = v14;
  sub_10006F680((uint64_t)&v18);
  sub_10006F6AC((uint64_t)&v16, (uint64_t)v17);
  sub_1000496E4(v17);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_10006CB3C((uint64_t)v9, &v15);
  long long v19 = v15;
  sub_10006F680((uint64_t)&v19);
  sub_10006F6AC((uint64_t)&v17, (uint64_t)v18);
  sub_1000496E4(v18);

  if (v16) {
    int64_t v12 = 1;
  }
  else {
    int64_t v12 = 2;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_10006F918(a4);
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

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  v12._object = (void *)0x80000001006A4F60;
  v13._countAndFlagsBits = 0x65766F6D6552;
  v13._object = (void *)0xE600000000000000;
  v12._countAndFlagsBits = 0xD00000000000002CLL;
  TTRLocalizedString(_:comment:)(v13, v12);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v14;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_10006FB2C();
  LOBYTE(self) = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  Swift::String v13 = (char *)&v17 - v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  long long v15 = self;
  sub_10006FD48((uint64_t)v13);

  uint64_t v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v11, v7);
  v16(v13, v7);
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v27 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v28 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for IndexPath();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  Swift::String v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v27 - v15;
  __chkstk_darwin(v14);
  long long v18 = (char *)&v27 - v17;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v19 = a3;
  v20 = self;
  uint64_t v21 = IndexPath.section.getter();
  sub_10006CA20(v21, (uint64_t)v29);
  sub_10006F708((uint64_t)v29, (uint64_t)v30);
  v22 = v13;
  if (v31 && (v22 = v16, v31 != 1))
  {
    if (qword_1007851B8 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_100018BF8(v7, (uint64_t)qword_100787798);
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v28, v26, v7);
    sub_10003D820((uint64_t)_swiftEmptyArrayStorage);
    sub_10003D820((uint64_t)_swiftEmptyArrayStorage);
    sub_1003AA010((uint64_t)"Unexpected item", 15, 2);
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v18, v22, v9);

    v23 = *(void (**)(char *, uint64_t))(v10 + 8);
    v23(v13, v9);
    v23(v16, v9);
    v24.super.isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v23(v18, v9);
    return v24.super.isa;
  }
  return result;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  self;
  uint64_t v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = (_TtC9Reminders33TTRIGroupMembershipViewController *)a3;
    uint64_t v11 = (_TtC9Reminders33TTRIGroupMembershipViewController *)a4;
    uint64_t v14 = self;
    uint64_t v12 = (_TtC9Reminders33TTRIGroupMembershipViewController *)[v9 textLabel];
    if (v12)
    {
      Swift::String v13 = v12;
      sub_1000368FC(0, &qword_100787808);
      TTRIFontCustomizable.replaceFontWithRounded()();

      uint64_t v10 = v11;
      uint64_t v11 = v14;
      uint64_t v14 = v13;
    }
  }
}

- (_TtC9Reminders33TTRIGroupMembershipViewController)initWithStyle:(int64_t)a3
{
  id result = (_TtC9Reminders33TTRIGroupMembershipViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9Reminders33TTRIGroupMembershipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  id result = (_TtC9Reminders33TTRIGroupMembershipViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRIGroupMembershipViewController_localUndoManager));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9Reminders33TTRIGroupMembershipViewController_viewModel);

  sub_10006F55C(v3);
}

@end