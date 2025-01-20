@interface CRLUSDItemImporter
+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4;
+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4;
+ (NSArray)protected_supportedFileUTTypes;
- (CRLProgress)progress;
- (NSError)error;
- (_TtC8Freeform12CRLBoardItem)boardItem;
- (_TtC8Freeform18CRLUSDItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4;
- (_TtC8Freeform18CRLUSDItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4;
- (unint64_t)embeddedDataLength;
- (unint64_t)uploadDataLength;
- (void)cancel;
- (void)importBoardItemWithCompletionHandler:(id)a3;
@end

@implementation CRLUSDItemImporter

+ (NSArray)protected_supportedFileUTTypes
{
  id v2 = [self supported3DFileUTTypes];
  type metadata accessor for UTType();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  char v9 = sub_100A25AC4((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v9 & 1;
}

+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4
{
  return sub_1002094C4(0x2000000000000uLL);
}

- (CRLProgress)progress
{
  return (CRLProgress *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                + OBJC_IVAR____TtC8Freeform18CRLUSDItemImporter__progress));
}

- (void)cancel
{
  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform18CRLUSDItemImporter_importBoardItemTask))
  {
    id v2 = self;
    swift_retain();
    sub_1005057FC(&qword_101672BD0);
    Task.cancel()();

    swift_release();
  }
}

- (void)importBoardItemWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10168C698;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10169FAB0;
  v13[5] = v12;
  v14 = self;
  sub_100E6DE90((uint64_t)v8, (uint64_t)&unk_10169A060, (uint64_t)v13);
  swift_release();
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return (_TtC8Freeform12CRLBoardItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                + OBJC_IVAR____TtC8Freeform18CRLUSDItemImporter__boardItem));
}

- (NSError)error
{
  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform18CRLUSDItemImporter__error))
  {
    swift_errorRetain();
    id v2 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
  }
  else
  {
    id v2 = 0;
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

- (_TtC8Freeform18CRLUSDItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  uint64_t v5 = type metadata accessor for URL();
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC8Freeform18CRLUSDItemImporter *)sub_100A256A4((uint64_t)v8, a4);
}

- (_TtC8Freeform18CRLUSDItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4
{
  return (_TtC8Freeform18CRLUSDItemImporter *)sub_100A258A0(a3, a4);
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();

  swift_errorRelease();
}

@end