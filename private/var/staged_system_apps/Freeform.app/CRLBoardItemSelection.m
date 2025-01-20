@interface CRLBoardItemSelection
- (BOOL)containsKindOfClass:(Class)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)boardItems;
- (NSString)description;
- (_TtC8Freeform21CRLBoardItemSelection)init;
- (_TtC8Freeform21CRLBoardItemSelection)initWithBoardItems:(id)a3;
- (id)infosOfClass:(Class)a3;
- (int64_t)hash;
- (int64_t)itemCount;
- (void)setBoardItems:(id)a3;
@end

@implementation CRLBoardItemSelection

- (NSSet)boardItems
{
  type metadata accessor for CRLBoardItem(0);
  sub_10056A4D0((unint64_t *)&qword_101676C20, 255, (void (*)(uint64_t))type metadata accessor for CRLBoardItem);
  swift_bridgeObjectRetain();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v2.super.isa;
}

- (void)setBoardItems:(id)a3
{
  type metadata accessor for CRLBoardItem(0);
  sub_10056A4D0((unint64_t *)&qword_101676C20, 255, (void (*)(uint64_t))type metadata accessor for CRLBoardItem);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLBoardItemSelection_boardItems) = (Class)static Set._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform21CRLBoardItemSelection)initWithBoardItems:(id)a3
{
  type metadata accessor for CRLBoardItem(0);
  sub_10056A4D0((unint64_t *)&qword_101676C20, 255, (void (*)(uint64_t))type metadata accessor for CRLBoardItem);
  uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC8Freeform21CRLBoardItemSelection *)sub_100568FF4(v3);
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
  char v6 = sub_100569260((uint64_t)v8);

  sub_10052E2B0((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  NSSet v2 = self;
  int64_t v3 = sub_1005693F8();

  return v3;
}

- (int64_t)itemCount
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLBoardItemSelection_boardItems);
  if ((v2 & 0xC000000000000001) == 0) {
    return *(void *)(v2 + 16);
  }
  int64_t v3 = self;
  swift_bridgeObjectRetain();
  int64_t v4 = __CocoaSet.count.getter();

  swift_bridgeObjectRelease();
  return v4;
}

- (id)infosOfClass:(Class)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  v5 = self;
  sub_100569850(ObjCClassMetadata);

  type metadata accessor for CRLBoardItem(0);
  sub_10056A4D0((unint64_t *)&qword_101676C20, 255, (void (*)(uint64_t))type metadata accessor for CRLBoardItem);
  v6.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (BOOL)containsKindOfClass:(Class)a3
{
  swift_getObjCClassMetadata();
  int64_t v4 = self;
  sub_100569B30();
  char v6 = v5;

  return v6 & 1;
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_100569ED0();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC8Freeform21CRLBoardItemSelection)init
{
  result = (_TtC8Freeform21CRLBoardItemSelection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end