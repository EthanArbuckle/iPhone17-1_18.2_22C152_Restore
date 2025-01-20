@interface CRLCommandInsertBoardItems
- (NSDictionary)boardItemsByIndex;
- (NSString)actionString;
- (_TtC8Freeform16CRLContainerItem)container;
- (_TtC8Freeform26CRLCommandInsertBoardItems)init;
- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItem:(id)a4;
- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItem:(id)a4 index:(int64_t)a5;
- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItems:(id)a4;
- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItems:(id)a4 index:(int64_t)a5;
- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItemsByIndex:(id)a4;
- (void)setActionString:(id)a3;
@end

@implementation CRLCommandInsertBoardItems

- (_TtC8Freeform16CRLContainerItem)container
{
  return (_TtC8Freeform16CRLContainerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                    + OBJC_IVAR____TtC8Freeform26CRLCommandInsertBoardItems_container));
}

- (NSDictionary)boardItemsByIndex
{
  swift_bridgeObjectRetain();
  sub_1005057FC(&qword_10167ADC0);
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItemsByIndex:(id)a4
{
  sub_1005057FC(&qword_10167ADC0);
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = objc_allocWithZone((Class)type metadata accessor for CRLCommandInsertBoardItems());
  id v7 = a3;
  v8 = (_TtC8Freeform26CRLCommandInsertBoardItems *)sub_100A4BD64(v7, v5);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItem:(id)a4
{
  sub_1005057FC((uint64_t *)&unk_101683E00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10117E810;
  id v7 = a3;
  id v8 = a4;
  *(void *)(inited + 32) = NSNotFound.getter();
  sub_1005057FC((uint64_t *)&unk_101676C10);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_101177E70;
  *(void *)(v9 + 32) = v8;
  uint64_t v15 = v9;
  specialized Array._endMutation()();
  *(void *)(inited + 40) = v15;
  unint64_t v10 = sub_100A45CB0((void *)inited);
  swift_setDeallocating();
  id v11 = v8;
  sub_1005057FC(&qword_10169DFA0);
  swift_arrayDestroy();
  id v12 = objc_allocWithZone((Class)type metadata accessor for CRLCommandInsertBoardItems());
  v13 = (_TtC8Freeform26CRLCommandInsertBoardItems *)sub_100A4BD64(v7, v10);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItem:(id)a4 index:(int64_t)a5
{
  sub_1005057FC((uint64_t *)&unk_101683E00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10117E810;
  *(void *)(inited + 32) = a5;
  sub_1005057FC((uint64_t *)&unk_101676C10);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_101177E70;
  *(void *)(v9 + 32) = a4;
  uint64_t v16 = v9;
  specialized Array._endMutation()();
  *(void *)(inited + 40) = v16;
  unint64_t v10 = sub_100A45CB0((void *)inited);
  swift_setDeallocating();
  id v11 = a4;
  id v12 = a3;
  sub_1005057FC(&qword_10169DFA0);
  swift_arrayDestroy();
  id v13 = objc_allocWithZone((Class)type metadata accessor for CRLCommandInsertBoardItems());
  v14 = (_TtC8Freeform26CRLCommandInsertBoardItems *)sub_100A4BD64(v12, v10);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v14;
}

- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItems:(id)a4
{
  type metadata accessor for CRLBoardItem(0);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1005057FC((uint64_t *)&unk_101683E00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10117E810;
  id v7 = a3;
  *(void *)(inited + 32) = NSNotFound.getter();
  *(void *)(inited + 40) = v5;
  unint64_t v8 = sub_100A45CB0((void *)inited);
  swift_setDeallocating();
  sub_1005057FC(&qword_10169DFA0);
  swift_arrayDestroy();
  id v9 = objc_allocWithZone((Class)type metadata accessor for CRLCommandInsertBoardItems());
  unint64_t v10 = (_TtC8Freeform26CRLCommandInsertBoardItems *)sub_100A4BD64(v7, v8);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItems:(id)a4 index:(int64_t)a5
{
  type metadata accessor for CRLBoardItem(0);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1005057FC((uint64_t *)&unk_101683E00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10117E810;
  *(void *)(inited + 32) = a5;
  *(void *)(inited + 40) = v7;
  unint64_t v9 = sub_100A45CB0((void *)inited);
  swift_setDeallocating();
  id v10 = a3;
  sub_1005057FC(&qword_10169DFA0);
  swift_arrayDestroy();
  id v11 = objc_allocWithZone((Class)type metadata accessor for CRLCommandInsertBoardItems());
  id v12 = (_TtC8Freeform26CRLCommandInsertBoardItems *)sub_100A4BD64(v10, v9);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
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
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform26CRLCommandInsertBoardItems_actionString);
  *uint64_t v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform26CRLCommandInsertBoardItems)init
{
  result = (_TtC8Freeform26CRLCommandInsertBoardItems *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end