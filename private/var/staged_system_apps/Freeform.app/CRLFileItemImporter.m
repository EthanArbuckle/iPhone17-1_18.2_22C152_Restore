@interface CRLFileItemImporter
+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4;
+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4;
+ (NSArray)protected_supportedFileUTTypes;
- (CRLProgress)progress;
- (NSError)error;
- (_TtC8Freeform12CRLBoardItem)boardItem;
- (_TtC8Freeform19CRLFileItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4;
- (_TtC8Freeform19CRLFileItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4;
- (unint64_t)embeddedDataLength;
- (unint64_t)uploadDataLength;
- (void)cancel;
- (void)importBoardItemWithCompletionHandler:(id)a3;
@end

@implementation CRLFileItemImporter

+ (NSArray)protected_supportedFileUTTypes
{
  sub_1005057FC(&qword_101675F70);
  type metadata accessor for UTType();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10117E810;
  static UTType.item.getter();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  char v9 = sub_1008A7AB4((uint64_t)v8);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v9 & 1;
}

+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4
{
  uint64_t v5 = type metadata accessor for UTType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  char v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1005057FC((uint64_t *)&unk_101676160);
  __chkstk_darwin(v10 - 8, v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  swift_bridgeObjectRetain();
  UTType.init(_:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v13, 1, v5) == 1)
  {
    sub_100522F00((uint64_t)v13, (uint64_t *)&unk_101676160);

    swift_bridgeObjectRelease();
    char v15 = 1;
  }
  else
  {
    static UTType.url.getter();
    char v16 = UTType.conforms(to:)();
    v17 = *(void (**)(char *, uint64_t))(v6 + 8);
    v17(v9, v5);
    v17(v13, v5);

    swift_bridgeObjectRelease();
    char v15 = v16 ^ 1;
  }
  return v15 & 1;
}

- (CRLProgress)progress
{
  return (CRLProgress *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                + OBJC_IVAR____TtC8Freeform19CRLFileItemImporter__progress));
}

- (void)cancel
{
  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLFileItemImporter_importBoardItemTask))
  {
    NSArray v2 = self;
    swift_retain();
    sub_1005057FC(&qword_101672BD0);
    Task.cancel()();
    swift_release();
  }
  else
  {
    v3 = self;
  }
  [*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLFileItemImporter_fileCoordinator) cancel];
}

- (void)importBoardItemWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1016854B0;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10169FAB0;
  v13[5] = v12;
  id v14 = self;
  sub_100E6DE90((uint64_t)v8, (uint64_t)&unk_10169A060, (uint64_t)v13);
  swift_release();
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return (_TtC8Freeform12CRLBoardItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                + OBJC_IVAR____TtC8Freeform19CRLFileItemImporter__boardItem));
}

- (NSError)error
{
  int v2 = *((unsigned __int8 *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLFileItemImporter__error);
  if (v2 == 3)
  {
    v3 = 0;
  }
  else
  {
    sub_1008A8078();
    swift_allocError();
    *uint64_t v4 = v2;
    v3 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
  }

  return (NSError *)v3;
}

- (unint64_t)embeddedDataLength
{
  return 0;
}

- (unint64_t)uploadDataLength
{
  return 0;
}

- (_TtC8Freeform19CRLFileItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  uint64_t v5 = type metadata accessor for URL();
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC8Freeform19CRLFileItemImporter *)sub_1008A75E8((uint64_t)v8, a4);
}

- (_TtC8Freeform19CRLFileItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4
{
  return (_TtC8Freeform19CRLFileItemImporter *)sub_1008A77E0(a3, a4);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLFileItemImporter__boardItem);
}

@end