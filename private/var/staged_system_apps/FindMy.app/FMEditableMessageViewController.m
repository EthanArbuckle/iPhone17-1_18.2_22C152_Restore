@interface FMEditableMessageViewController
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC6FindMy31FMEditableMessageViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6FindMy31FMEditableMessageViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)textViewDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMEditableMessageViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMEditableMessageViewController();
  v2 = v5.receiver;
  id v3 = [(FMEditableMessageViewController *)&v5 viewDidLoad];
  uint64_t v4 = (*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x188))(v3);
  (*(void (**)(uint64_t))((swift_isaMask & *v2) + 0x190))(v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMEditableMessageViewController();
  id v4 = v5.receiver;
  [(FMEditableMessageViewController *)&v5 viewWillAppear:v3];
  sub_10026FE54();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMEditableMessageViewController();
  id v4 = v6.receiver;
  [(FMEditableMessageViewController *)&v6 viewWillDisappear:v3];
  id v5 = sub_10026F334();
  [v5 resignFirstResponder];

  sub_100270100();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
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
  id v12 = sub_10026F0E8(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = sub_100270F18();

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = qword_1006AE250;
  id v11 = a3;
  id v12 = self;
  if (v10 != -1) {
    swift_once();
  }
  double v13 = *(double *)&qword_1006D2188;
  double v14 = *(double *)&qword_1006D2190;
  id v15 = [self preferredFontForTextStyle:qword_1006D2180];
  [v15 lineHeight];
  double v17 = v16;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v14 + v14 + v13 * v17;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10026F28C(v4);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  id v11 = a3;
  id v12 = self;
  LOBYTE(length) = sub_10026F488(v8, v10, v13, length, 0);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (_TtC6FindMy31FMEditableMessageViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC6FindMy31FMEditableMessageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC6FindMy31FMEditableMessageViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC6FindMy31FMEditableMessageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  BOOL v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy31FMEditableMessageViewController_rightBarButtonItem];
}

@end