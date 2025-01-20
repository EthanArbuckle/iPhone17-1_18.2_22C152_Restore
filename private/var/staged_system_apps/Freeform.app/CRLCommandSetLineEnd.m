@interface CRLCommandSetLineEnd
- (CRLLineEnd)lineEnd;
- (NSUUID)id;
- (_TtC8Freeform20CRLCommandSetLineEnd)init;
- (_TtC8Freeform20CRLCommandSetLineEnd)initWithId:(id)a3 lineEnd:(id)a4 chirality:(int64_t)a5;
- (_TtC8Freeform20CRLCommandSetLineEnd)initWithShapeItem:(id)a3 lineEnd:(id)a4 chirality:(int64_t)a5;
- (int64_t)chirality;
@end

@implementation CRLCommandSetLineEnd

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (CRLLineEnd)lineEnd
{
  return (CRLLineEnd *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                               + OBJC_IVAR____TtC8Freeform20CRLCommandSetLineEnd_lineEnd));
}

- (int64_t)chirality
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLCommandSetLineEnd_chirality);
}

- (_TtC8Freeform20CRLCommandSetLineEnd)initWithId:(id)a3 lineEnd:(id)a4 chirality:(int64_t)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a4;
  v12 = (_TtC8Freeform20CRLCommandSetLineEnd *)sub_1005312B4((uint64_t)v10, a4, a5);

  return v12;
}

- (_TtC8Freeform20CRLCommandSetLineEnd)initWithShapeItem:(id)a3 lineEnd:(id)a4 chirality:(int64_t)a5
{
  int64_t v21 = a5;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(uint64_t))(**(void **)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                       + 256);
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = swift_retain();
  v13(v16);
  swift_release();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v18 = [(CRLCommandSetLineEnd *)self initWithId:isa lineEnd:v15 chirality:v21];

  return v18;
}

- (_TtC8Freeform20CRLCommandSetLineEnd)init
{
  result = (_TtC8Freeform20CRLCommandSetLineEnd *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandSetLineEnd_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLCommandSetLineEnd_lineEnd);
}

@end