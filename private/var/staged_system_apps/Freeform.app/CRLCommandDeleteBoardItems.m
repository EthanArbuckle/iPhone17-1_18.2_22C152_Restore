@interface CRLCommandDeleteBoardItems
- (BOOL)canDeleteNewlyCreatedItems;
- (NSSet)boardItems;
- (NSString)actionString;
- (_TtC8Freeform26CRLCommandDeleteBoardItems)init;
- (_TtC8Freeform26CRLCommandDeleteBoardItems)initWithBoardItemToDelete:(id)a3;
- (_TtC8Freeform26CRLCommandDeleteBoardItems)initWithBoardItemsToDelete:(id)a3;
- (_TtC8Freeform26CRLCommandDeleteBoardItems)initWithBoardItemsToDelete:(id)a3 canDeleteNewlyCreatedItems:(BOOL)a4;
@end

@implementation CRLCommandDeleteBoardItems

- (NSSet)boardItems
{
  type metadata accessor for CRLBoardItem(0);
  sub_10060A334();
  swift_bridgeObjectRetain();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v2.super.isa;
}

- (BOOL)canDeleteNewlyCreatedItems
{
  return *((unsigned char *)&self->super.super.isa
         + OBJC_IVAR____TtC8Freeform26CRLCommandDeleteBoardItems_canDeleteNewlyCreatedItems);
}

- (_TtC8Freeform26CRLCommandDeleteBoardItems)initWithBoardItemsToDelete:(id)a3
{
  type metadata accessor for CRLBoardItem(0);
  sub_10060A334();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v5 = [(CRLCommandDeleteBoardItems *)self initWithBoardItemsToDelete:isa canDeleteNewlyCreatedItems:0];

  return v5;
}

- (_TtC8Freeform26CRLCommandDeleteBoardItems)initWithBoardItemsToDelete:(id)a3 canDeleteNewlyCreatedItems:(BOOL)a4
{
  type metadata accessor for CRLBoardItem(0);
  sub_10060A334();
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC8Freeform26CRLCommandDeleteBoardItems *)sub_1008E4F48(v5, a4);
}

- (_TtC8Freeform26CRLCommandDeleteBoardItems)initWithBoardItemToDelete:(id)a3
{
  sub_1005057FC((uint64_t *)&unk_101676C10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_101177E70;
  *(void *)(inited + 32) = a3;
  unint64_t v13 = inited;
  specialized Array._endMutation()();
  if (v13 >> 62)
  {
    id v8 = a3;
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v9) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  uint64_t v6 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v7 = a3;
  if (v6) {
LABEL_3:
  }
    sub_100508DCC(v13);
LABEL_5:
  swift_bridgeObjectRelease();
  type metadata accessor for CRLBoardItem(0);
  sub_10060A334();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v11 = [(CRLCommandDeleteBoardItems *)self initWithBoardItemsToDelete:isa];

  return v11;
}

- (NSString)actionString
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC8Freeform26CRLCommandDeleteBoardItems)init
{
  result = (_TtC8Freeform26CRLCommandDeleteBoardItems *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end