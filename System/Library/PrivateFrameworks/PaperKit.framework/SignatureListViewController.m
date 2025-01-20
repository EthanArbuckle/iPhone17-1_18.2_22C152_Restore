@interface SignatureListViewController
- (BOOL)_canShowWhileLocked;
- (_TtC8PaperKit27SignatureListViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit27SignatureListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8PaperKit27SignatureListViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation SignatureListViewController

- (_TtC8PaperKit27SignatureListViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8PaperKit27SignatureListViewController *)SignatureListViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit27SignatureListViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit27SignatureListViewController_rowHeight) = (Class)0x4055800000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit27SignatureListViewController_maximumSelectRows) = (Class)3;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit27SignatureListViewController_maximumEditRows) = (Class)4;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit27SignatureListViewController_signatureRowHeight) = (Class)0x4055800000000000;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit27SignatureListViewController_showDescriptions) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8PaperKit27SignatureListViewController_completion);
  void *v4 = UnknownCanvasElementView.flags.modify;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8PaperKit27SignatureListViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  type metadata accessor for SignatureManager();
  id v6 = a3;
  uint64_t v7 = self;
  swift_initStaticObject();
  unint64_t v8 = SignatureManager.signatureItems.getter();
  if (v8 >> 62) {
    int64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  }
  else {
    int64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  swift_bridgeObjectRelease();
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  SignatureListViewController.tableView(_:cellForRowAt:)(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  specialized SignatureListViewController.tableView(_:willDisplay:forRowAt:)(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  int64_t v9 = objc_msgSend(a3, sel_isEditing);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = self;
  specialized SignatureListViewController.tableView(_:commit:forRowAt:)(v12, a4, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  SignatureListViewController.tableView(_:didSelectRowAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC8PaperKit27SignatureListViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC8PaperKit27SignatureListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end