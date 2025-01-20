@interface CRLPreinsertionAssetWrapper
- (CGDataProvider)newCGDataProvider;
- (CGImage)newCGImage;
- (CGImageSource)newCGImageSource;
- (NSString)filename;
- (UTType)type;
- (_TtC8Freeform27CRLPreinsertionAssetWrapper)init;
- (_TtC8Freeform27CRLPreinsertionAssetWrapper)initWithAlreadyInsertedAsset:(id)a3 owner:(id)a4;
- (_TtC8Freeform27CRLPreinsertionAssetWrapper)initWithData:(id)a3 filename:(id)a4 owner:(id)a5 error:(id *)a6;
- (_TtC8Freeform27CRLPreinsertionAssetWrapper)initWithUrl:(id)a3 filename:(id)a4 owner:(id)a5;
- (_TtC8Freeform27CRLPreinsertionAssetWrapper)initWithUrl:(id)a3 owner:(id)a4;
- (id)synchronouslyCreateAsset;
- (id)synchronouslyCreateReadonlyAsset;
- (void)createAssetWithCompletionHandler:(id)a3;
@end

@implementation CRLPreinsertionAssetWrapper

- (_TtC8Freeform27CRLPreinsertionAssetWrapper)initWithUrl:(id)a3 filename:(id)a4 owner:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  __chkstk_darwin(v8 - 8, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  v14 = (_TtC8Freeform27CRLPreinsertionAssetWrapper *)sub_100B516A8((uint64_t)v11, (uint64_t)a4, v13, (uint64_t)a5, (char *)self);
  swift_unknownObjectRelease();
  return v14;
}

- (_TtC8Freeform27CRLPreinsertionAssetWrapper)initWithUrl:(id)a3 owner:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  URL._bridgeToObjectiveC()(v11);
  uint64_t v13 = v12;
  v14 = [(CRLPreinsertionAssetWrapper *)self initWithUrl:v12 filename:0 owner:a4];
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v14;
}

- (_TtC8Freeform27CRLPreinsertionAssetWrapper)initWithData:(id)a3 filename:(id)a4 owner:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  return (_TtC8Freeform27CRLPreinsertionAssetWrapper *)sub_100B4DED8(v10, v12, v13, v15, (uint64_t)a5);
}

- (_TtC8Freeform27CRLPreinsertionAssetWrapper)initWithAlreadyInsertedAsset:(id)a3 owner:(id)a4
{
  v5 = (char *)a3;
  swift_unknownObjectRetain();
  uint64_t v6 = (_TtC8Freeform27CRLPreinsertionAssetWrapper *)sub_100B51C3C(v5, (uint64_t)a4);

  swift_unknownObjectRelease();
  return v6;
}

- (void)createAssetWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  unint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_101693810;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10169FAB0;
  v13[5] = v12;
  unint64_t v14 = self;
  sub_100E6DE90((uint64_t)v8, (uint64_t)&unk_10169A060, (uint64_t)v13);
  swift_release();
}

- (id)synchronouslyCreateAsset
{
  v2 = self;
  id v3 = sub_100B50194();

  return v3;
}

- (id)synchronouslyCreateReadonlyAsset
{
  uint64_t v3 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLPreinsertionAssetWrapper__alreadyInsertedAsset);
  if (v7)
  {
    id v8 = self;
    id v9 = v7;
  }
  else
  {
    sub_100522E9C((uint64_t)self + OBJC_IVAR____TtC8Freeform27CRLPreinsertionAssetWrapper__url, (uint64_t)v6, &qword_101672E90);
    uint64_t v10 = type metadata accessor for URL();
    uint64_t v11 = *(void *)(v10 - 8);
    id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10);
    if (result == 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v13 = self;
    id v9 = sub_100AE7258((uint64_t)v6);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
    uint64_t v7 = 0;
  }
  id v14 = v7;

  return v9;
}

- (UTType)type
{
  uint64_t v3 = sub_1005057FC((uint64_t *)&unk_101676160);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  swift_bridgeObjectRetain();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v9 = [v8 crl_pathUTI];

  if (v9)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    UTType.init(_:)();
  }
  else
  {
    uint64_t v10 = type metadata accessor for UTType();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  }

  uint64_t v11 = type metadata accessor for UTType();
  uint64_t v12 = *(void *)(v11 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    Class isa = UTType._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }

  return (UTType *)isa;
}

- (CGDataProvider)newCGDataProvider
{
  v2 = self;
  uint64_t v3 = sub_100B50D4C();

  return v3;
}

- (CGImageSource)newCGImageSource
{
  v2 = self;
  uint64_t v3 = sub_100B50F88();

  return v3;
}

- (CGImage)newCGImage
{
  v2 = self;
  uint64_t v3 = sub_100B511E0();

  return v3;
}

- (NSString)filename
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC8Freeform27CRLPreinsertionAssetWrapper)init
{
  id result = (_TtC8Freeform27CRLPreinsertionAssetWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform27CRLPreinsertionAssetWrapper__url, &qword_101672E90);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLPreinsertionAssetWrapper__alreadyInsertedAsset));
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform27CRLPreinsertionAssetWrapper__tempDir);
}

@end