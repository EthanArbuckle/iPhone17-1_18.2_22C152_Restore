@interface CRLURLItem
- (BOOL)isPreviewable;
- (BOOL)isSelectable;
- (BOOL)isShareable;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem;
- (NSArray)stringContentForSearch;
- (NSString)previewTooltip;
- (NSURL)hyperlinkURL;
- (NSURL)url;
- (_TtC8Freeform10CRLURLItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 url:(id)a5 geometry:(id)a6;
- (_TtC8Freeform8CRLAsset)metadataPayload;
- (id)promisedDataForPublicType:(id)a3;
- (id)promisedStringForCopy;
- (void)setHyperlinkURL:(id)a3;
@end

@implementation CRLURLItem

- (NSURL)hyperlinkURL
{
  uint64_t v3 = type metadata accessor for CRLURLItemAtomicDataStruct(0);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v8 - 8, v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v12 = self;
  swift_retain();
  sub_1005057FC(&qword_101682E40);
  CRRegister.wrappedValue.getter();
  swift_endAccess();
  swift_release();
  v13 = &v7[*(int *)(v4 + 28)];
  uint64_t v14 = type metadata accessor for URL();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v11, v13, v14);
  sub_10094DD20((uint64_t)v7, type metadata accessor for CRLURLItemAtomicDataStruct);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);

  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14) != 1)
  {
    URL._bridgeToObjectiveC()(v16);
    v17 = v18;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v14);
  }

  return (NSURL *)v17;
}

- (void)setHyperlinkURL:(id)a3
{
  uint64_t v4 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v4 - 8, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_100522F00((uint64_t)v7, &qword_101672E90);
}

- (NSURL)url
{
  uint64_t v3 = type metadata accessor for CRLURLItemAtomicDataStruct(0);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v8 - 8, v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v12 = self;
  swift_retain();
  sub_1005057FC(&qword_101682E40);
  CRRegister.wrappedValue.getter();
  swift_endAccess();
  swift_release();
  v13 = &v7[*(int *)(v4 + 28)];
  uint64_t v14 = type metadata accessor for URL();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v11, v13, v14);
  sub_10094DD20((uint64_t)v7, type metadata accessor for CRLURLItemAtomicDataStruct);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);

  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14) != 1)
  {
    URL._bridgeToObjectiveC()(v16);
    v17 = v18;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v14);
  }

  return (NSURL *)v17;
}

- (_TtC8Freeform8CRLAsset)metadataPayload
{
  v2 = self;
  uint64_t v3 = sub_100949540();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem
{
  uint64_t v3 = type metadata accessor for UTType();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v9);
  v11 = (char *)&v23 - v10;
  sub_1005057FC((uint64_t *)&unk_101672610);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10117D8C0;
  v13 = self;
  static UTType.url.getter();
  uint64_t v14 = UTType.identifier.getter();
  uint64_t v16 = v15;
  v17 = *(void (**)(char *, uint64_t))(v4 + 8);
  v17(v11, v3);
  *(void *)(v12 + 32) = v14;
  *(void *)(v12 + 40) = v16;
  static UTType.utf8PlainText.getter();
  uint64_t v18 = UTType.identifier.getter();
  uint64_t v20 = v19;
  v17(v7, v3);
  *(void *)(v12 + 48) = v18;
  *(void *)(v12 + 56) = v20;

  v21.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v21.super.isa;
}

- (id)promisedDataForPublicType:(id)a3
{
  uint64_t v5 = type metadata accessor for UTType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  v11 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v12 = sub_100949D64();
  unint64_t v14 = v13;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  Class isa = 0;
  if (v14 >> 60 != 15)
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100514260(v12, v14);
  }

  return isa;
}

- (id)promisedStringForCopy
{
  v2 = self;
  sub_10094A1D4();
  uint64_t v4 = v3;

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

- (BOOL)isSelectable
{
  return 1;
}

- (BOOL)isPreviewable
{
  return 1;
}

- (NSString)previewTooltip
{
  uint64_t v3 = self;
  uint64_t v4 = self;
  id v5 = [v3 mainBundle];
  NSString v6 = String._bridgeToObjectiveC()();
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v5 localizedStringForKey:v6 value:v7 table:0];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (BOOL)isShareable
{
  return 1;
}

- (Class)layoutClass
{
  type metadata accessor for CRLURLLayout();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  type metadata accessor for CRLURLRep();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)editorClass
{
  type metadata accessor for CRLURLEditor();

  return (Class)swift_getObjCClassFromMetadata();
}

- (NSArray)stringContentForSearch
{
  v2 = self;
  sub_10094C2B8();

  v3.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void).cxx_destruct
{
}

- (_TtC8Freeform10CRLURLItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 url:(id)a5 geometry:(id)a6
{
  uint64_t v8 = type metadata accessor for URL();
  __chkstk_darwin(v8 - 8, v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for UUID();
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v16 = a3;
  id v17 = a6;
  return (_TtC8Freeform10CRLURLItem *)sub_10094C898((uint64_t)v16, (uint64_t)v15, (uint64_t)v11, a6);
}

@end