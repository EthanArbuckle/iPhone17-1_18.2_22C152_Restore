@interface CRLCommandReorderContainerChildren
- (NSArray)children;
- (NSIndexSet)indices;
- (NSString)actionString;
- (_TtC8Freeform16CRLContainerItem)container;
- (_TtC8Freeform34CRLCommandReorderContainerChildren)init;
- (_TtC8Freeform34CRLCommandReorderContainerChildren)initWithParentContainer:(id)a3 childrenToMove:(id)a4 targetIndices:(id)a5;
- (void)setActionString:(id)a3;
@end

@implementation CRLCommandReorderContainerChildren

- (_TtC8Freeform16CRLContainerItem)container
{
  return (_TtC8Freeform16CRLContainerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                    + OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_container));
}

- (NSArray)children
{
  type metadata accessor for CRLBoardItem(0);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (NSIndexSet)indices
{
  IndexSet._bridgeToObjectiveC()((NSIndexSet *)OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_indices);

  return (NSIndexSet *)v2;
}

- (_TtC8Freeform34CRLCommandReorderContainerChildren)initWithParentContainer:(id)a3 childrenToMove:(id)a4 targetIndices:(id)a5
{
  uint64_t v6 = type metadata accessor for IndexSet();
  __chkstk_darwin(v6 - 8, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CRLBoardItem(0);
  unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = (_TtC8Freeform34CRLCommandReorderContainerChildren *)sub_1006CB3E8(v11, v10, (uint64_t)v9);

  return v12;
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
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_actionString);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform34CRLCommandReorderContainerChildren)init
{
  result = (_TtC8Freeform34CRLCommandReorderContainerChildren *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_container));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_indices;
  uint64_t v4 = type metadata accessor for IndexSet();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end