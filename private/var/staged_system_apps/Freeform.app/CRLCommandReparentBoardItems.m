@interface CRLCommandReparentBoardItems
- (NSArray)boardItems;
- (_TtC8Freeform16CRLContainerItem)destinationContainer;
- (_TtC8Freeform28CRLCommandReparentBoardItems)init;
- (_TtC8Freeform28CRLCommandReparentBoardItems)initWithDestinationContainer:(id)a3 boardItem:(id)a4;
- (_TtC8Freeform28CRLCommandReparentBoardItems)initWithDestinationContainer:(id)a3 boardItem:(id)a4 index:(int64_t)a5;
- (_TtC8Freeform28CRLCommandReparentBoardItems)initWithDestinationContainer:(id)a3 boardItems:(id)a4;
- (_TtC8Freeform28CRLCommandReparentBoardItems)initWithDestinationContainer:(id)a3 boardItems:(id)a4 index:(int64_t)a5;
@end

@implementation CRLCommandReparentBoardItems

- (_TtC8Freeform16CRLContainerItem)destinationContainer
{
  return (_TtC8Freeform16CRLContainerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                    + OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_destinationContainer));
}

- (NSArray)boardItems
{
  type metadata accessor for CRLBoardItem(0);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (_TtC8Freeform28CRLCommandReparentBoardItems)initWithDestinationContainer:(id)a3 boardItems:(id)a4
{
  type metadata accessor for CRLBoardItem(0);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = (objc_class *)type metadata accessor for CRLCommandReparentBoardItems();
  v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_boardItems] = v5;
  *(void *)&v7[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_destinationContainer] = a3;
  v8 = &v7[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_index];
  *(void *)v8 = 0;
  v8[8] = 1;
  v12.receiver = v7;
  v12.super_class = v6;
  id v9 = a3;
  v10 = [(CRLCommand *)&v12 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

- (_TtC8Freeform28CRLCommandReparentBoardItems)initWithDestinationContainer:(id)a3 boardItems:(id)a4 index:(int64_t)a5
{
  type metadata accessor for CRLBoardItem(0);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = (objc_class *)type metadata accessor for CRLCommandReparentBoardItems();
  id v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_boardItems] = v7;
  *(void *)&v9[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_destinationContainer] = a3;
  v10 = &v9[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_index];
  *(void *)v10 = a5;
  v10[8] = 0;
  v14.receiver = v9;
  v14.super_class = v8;
  id v11 = a3;
  objc_super v12 = [(CRLCommand *)&v14 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

- (_TtC8Freeform28CRLCommandReparentBoardItems)initWithDestinationContainer:(id)a3 boardItem:(id)a4
{
  sub_1005057FC((uint64_t *)&unk_101676C10);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_101177E70;
  *(void *)(v6 + 32) = a4;
  uint64_t v15 = v6;
  specialized Array._endMutation()();
  uint64_t v7 = (objc_class *)type metadata accessor for CRLCommandReparentBoardItems();
  v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_boardItems] = v15;
  *(void *)&v8[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_destinationContainer] = a3;
  id v9 = &v8[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_index];
  *(void *)id v9 = 0;
  v9[8] = 1;
  v14.receiver = v8;
  v14.super_class = v7;
  id v10 = a3;
  id v11 = a4;
  objc_super v12 = [(CRLCommand *)&v14 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

- (_TtC8Freeform28CRLCommandReparentBoardItems)initWithDestinationContainer:(id)a3 boardItem:(id)a4 index:(int64_t)a5
{
  sub_1005057FC((uint64_t *)&unk_101676C10);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_101177E70;
  *(void *)(v8 + 32) = a4;
  uint64_t v17 = v8;
  specialized Array._endMutation()();
  id v9 = (objc_class *)type metadata accessor for CRLCommandReparentBoardItems();
  id v10 = (char *)objc_allocWithZone(v9);
  *(void *)&v10[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_boardItems] = v17;
  *(void *)&v10[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_destinationContainer] = a3;
  id v11 = &v10[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_index];
  *(void *)id v11 = a5;
  v11[8] = 0;
  v16.receiver = v10;
  v16.super_class = v9;
  id v12 = a3;
  id v13 = a4;
  objc_super v14 = [(CRLCommand *)&v16 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v14;
}

- (_TtC8Freeform28CRLCommandReparentBoardItems)init
{
  result = (_TtC8Freeform28CRLCommandReparentBoardItems *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_destinationContainer));

  swift_bridgeObjectRelease();
}

@end