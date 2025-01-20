@interface CRLURLItemImporter
+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4;
+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4;
+ (BOOL)protected_canImportFromRemoteURL:(id)a3;
+ (NSArray)protected_supportedFileUTTypes;
+ (NSArray)protected_supportedRemoteURLSchemes;
- (BOOL)usesProgressDialog;
- (CRLProgress)progress;
- (NSError)error;
- (_TtC8Freeform12CRLBoardItem)boardItem;
- (_TtC8Freeform18CRLURLItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4;
- (_TtC8Freeform18CRLURLItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4;
- (unint64_t)embeddedDataLength;
- (unint64_t)uploadDataLength;
- (void)cancel;
- (void)importBoardItemWithCompletionHandler:(id)a3;
@end

@implementation CRLURLItemImporter

+ (NSArray)protected_supportedFileUTTypes
{
  sub_1005057FC(&qword_101675F70);
  type metadata accessor for UTType();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10117E810;
  static UTType.url.getter();
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
  char v9 = URL.isFileURL.getter();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return (v9 & 1) == 0;
}

+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4
{
  return 0;
}

+ (NSArray)protected_supportedRemoteURLSchemes
{
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

+ (BOOL)protected_canImportFromRemoteURL:(id)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = URL.scheme.getter();
  if (v10)
  {
    uint64_t v11 = v9;
    uint64_t v12 = v10;
    id v13 = [a1 protected_supportedRemoteURLSchemes];
    v14 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    char v15 = sub_100ED5CE8(v11, v12, v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v15 = 0;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v15 & 1;
}

- (CRLProgress)progress
{
  return (CRLProgress *)0;
}

- (BOOL)usesProgressDialog
{
  return 0;
}

- (void)importBoardItemWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10168AC20;
  v12[5] = v10;
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10169FAB0;
  v13[5] = v12;
  v14 = self;
  sub_100E6DE90((uint64_t)v8, (uint64_t)&unk_10169A060, (uint64_t)v13);
  swift_release();
}

- (void)cancel
{
  NSArray v2 = self;
  sub_1009E6EA4();
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return (_TtC8Freeform12CRLBoardItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                + OBJC_IVAR____TtC8Freeform18CRLURLItemImporter__boardItem));
}

- (NSError)error
{
  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform18CRLURLItemImporter__error))
  {
    swift_errorRetain();
    NSArray v2 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
  }
  else
  {
    NSArray v2 = 0;
  }

  return (NSError *)v2;
}

- (unint64_t)embeddedDataLength
{
  return 0;
}

- (unint64_t)uploadDataLength
{
  return 0;
}

- (_TtC8Freeform18CRLURLItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  uint64_t v5 = type metadata accessor for URL();
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC8Freeform18CRLURLItemImporter *)sub_1009E7290((uint64_t)v8, a4);
}

- (_TtC8Freeform18CRLURLItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4
{
  return (_TtC8Freeform18CRLURLItemImporter *)sub_1009E7444(a3, a4);
}

- (void).cxx_destruct
{
  swift_release();

  swift_errorRelease();
}

@end