@interface CRLBoardLibraryViewModelItemNode
- (BOOL)isEqual:(id)a3;
- (BOOL)isLeaf;
- (NSArray)children;
- (_TtC8Freeform32CRLBoardLibraryViewModelItemNode)init;
- (void)setChildren:(id)a3;
@end

@implementation CRLBoardLibraryViewModelItemNode

- (NSArray)children
{
  type metadata accessor for CRLBoardLibraryViewModelItemNode();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setChildren:(id)a3
{
  type metadata accessor for CRLBoardLibraryViewModelItemNode();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLBoardLibraryViewModelItemNode_children) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (BOOL)isLeaf
{
  NSArray v2 = self;
  char v3 = sub_1008E7FCC();

  return v3 & 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1008E8F04((uint64_t)v8);

  sub_10052E2B0((uint64_t)v8);
  return v6 & 1;
}

- (_TtC8Freeform32CRLBoardLibraryViewModelItemNode)init
{
  result = (_TtC8Freeform32CRLBoardLibraryViewModelItemNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1008EA730((uint64_t)self + OBJC_IVAR____TtC8Freeform32CRLBoardLibraryViewModelItemNode_item, type metadata accessor for CRLBoardLibraryViewModel.Item);

  swift_bridgeObjectRelease();
}

@end