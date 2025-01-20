@interface CRLCommandSetPathSource
- (_TtC8Freeform23CRLCommandSetPathSource)init;
- (_TtC8Freeform23CRLCommandSetPathSource)initWithId:(id)a3 pathSource:(id)a4;
- (_TtC8Freeform23CRLCommandSetPathSource)initWithShapeItem:(id)a3 pathSource:(id)a4;
@end

@implementation CRLCommandSetPathSource

- (_TtC8Freeform23CRLCommandSetPathSource)initWithId:(id)a3 pathSource:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a4;
  v10 = (_TtC8Freeform23CRLCommandSetPathSource *)sub_100B89368((uint64_t)v8, v9);

  return v10;
}

- (_TtC8Freeform23CRLCommandSetPathSource)initWithShapeItem:(id)a3 pathSource:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void (**)(uint64_t))(**(void **)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                       + 256);
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = swift_retain();
  v12(v15);
  swift_release();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v17 = [(CRLCommandSetPathSource *)self initWithId:isa pathSource:v14];

  return v17;
}

- (_TtC8Freeform23CRLCommandSetPathSource)init
{
  result = (_TtC8Freeform23CRLCommandSetPathSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform23CRLCommandSetPathSource_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform23CRLCommandSetPathSource_pathSource);
}

@end