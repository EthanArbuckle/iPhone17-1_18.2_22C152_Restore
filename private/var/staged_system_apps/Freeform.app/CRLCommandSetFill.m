@interface CRLCommandSetFill
- (CRLFill)fill;
- (NSString)actionString;
- (NSUUID)id;
- (_TtC8Freeform17CRLCommandSetFill)init;
- (_TtC8Freeform17CRLCommandSetFill)initWithId:(id)a3 fill:(id)a4;
- (_TtC8Freeform17CRLCommandSetFill)initWithShapeItem:(id)a3 fill:(id)a4;
- (void)setActionString:(id)a3;
@end

@implementation CRLCommandSetFill

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (CRLFill)fill
{
  return (CRLFill *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                            + OBJC_IVAR____TtC8Freeform17CRLCommandSetFill_fill));
}

- (_TtC8Freeform17CRLCommandSetFill)initWithId:(id)a3 fill:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a4;
  v10 = (_TtC8Freeform17CRLCommandSetFill *)sub_100FD507C((uint64_t)v8, a4);

  return v10;
}

- (_TtC8Freeform17CRLCommandSetFill)initWithShapeItem:(id)a3 fill:(id)a4
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
  v17 = [(CRLCommandSetFill *)self initWithId:isa fill:v14];

  return v17;
}

- (NSString)actionString
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setActionString:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform17CRLCommandSetFill_actionString);
  *uint64_t v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform17CRLCommandSetFill)init
{
  result = (_TtC8Freeform17CRLCommandSetFill *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform17CRLCommandSetFill_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end