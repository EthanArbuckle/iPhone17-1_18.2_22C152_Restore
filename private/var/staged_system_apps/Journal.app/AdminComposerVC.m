@interface AdminComposerVC
- (_TtC7Journal15AdminComposerVC)initWithCoder:(id)a3;
- (_TtC7Journal15AdminComposerVC)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (uint64_t)tableView:canEditRowAtIndexPath:;
- (void)doRedo;
- (void)doSave;
- (void)doUndo;
- (void)save;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)textViewDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation AdminComposerVC

- (_TtC7Journal15AdminComposerVC)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10058B8C8();
}

- (void)doUndo
{
  v2 = self;
  sub_100589688();
}

- (void)doRedo
{
  v2 = self;
  sub_100589688();
}

- (void)doSave
{
  v2 = self;
  swift_retain();
  sub_100587CC0();

  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100589C2C();
}

- (void)save
{
  uint64_t v3 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_100328A60((uint64_t)v5, (uint64_t)&unk_100811EA8, (uint64_t)v9);

  swift_release();
}

- (_TtC7Journal15AdminComposerVC)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal15AdminComposerVC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal15AdminComposerVC_saveButton);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10058B9D8();
  uint64_t v8 = v7;

  if (v8)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6 = (unint64_t *)(*(char **)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Journal15AdminComposerVC_model)
                          + OBJC_IVAR____TtCC7Journal10Journaling14EntryViewModel_assetsAll);
  swift_beginAccess();
  unint64_t v7 = *v6;
  if (!(v7 >> 62)) {
    return *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v10 = a3;
  v11 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  NSString v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = sub_10058BAC8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
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
  sub_10058C7E0(a4);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (uint64_t)tableView:canEditRowAtIndexPath:
{
  uint64_t v0 = type metadata accessor for IndexPath();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 1;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  v33 = self;
  id v34 = a3;
  uint64_t v5 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = v7;
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  v31 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v31 - v12;
  __chkstk_darwin(v14);
  v16 = (char *)&v31 - v15;
  __chkstk_darwin(v17);
  v19 = (char *)&v31 - v18;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v7, 1, 1, v20);
  v21 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v21(v13, v19, v8);
  v21((char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v16, v8);
  type metadata accessor for MainActor();
  v22 = v33;
  id v34 = v34;
  uint64_t v23 = static MainActor.shared.getter();
  uint64_t v24 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v25 = (v24 + 40) & ~v24;
  uint64_t v26 = (v10 + v24 + v25) & ~v24;
  v27 = (char *)swift_allocObject();
  *((void *)v27 + 2) = v23;
  *((void *)v27 + 3) = &protocol witness table for MainActor;
  *((void *)v27 + 4) = v22;
  v28 = &v27[v25];
  v29 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v29(v28, v13, v8);
  v29(&v27[v26], v31, v8);
  sub_100328A60((uint64_t)v32, (uint64_t)&unk_100811E80, (uint64_t)v27);

  swift_release();
  v30 = *(void (**)(char *, uint64_t))(v9 + 8);
  v30(v16, v8);
  v30(v19, v8);
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10058AEEC(v4);
}

@end