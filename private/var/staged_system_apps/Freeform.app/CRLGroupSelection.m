@interface CRLGroupSelection
- (BOOL)hasSelectedItemsInNonGroupContainer;
- (BOOL)isCrossContainerSelection;
- (BOOL)isEqual:(id)a3;
- (NSArray)containerGroups;
- (NSString)description;
- (_TtC8Freeform17CRLGroupSelection)initWithBoardItems:(id)a3;
- (_TtC8Freeform17CRLGroupSelection)initWithContainerGroups:(id)a3 hasSelectedItemsInNonGroupContainer:(BOOL)a4;
- (_TtC8Freeform17CRLGroupSelection)initWithGroupItem:(id)a3;
@end

@implementation CRLGroupSelection

- (BOOL)hasSelectedItemsInNonGroupContainer
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC8Freeform17CRLGroupSelection_hasSelectedItemsInNonGroupContainer);
}

- (_TtC8Freeform17CRLGroupSelection)initWithGroupItem:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform17CRLGroupSelection_hasSelectedItemsInNonGroupContainer) = 0;
  sub_1005057FC((uint64_t *)&unk_101676C10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_101177E70;
  *(void *)(inited + 32) = a3;
  unint64_t v13 = inited;
  specialized Array._endMutation()();
  if (v13 >> 62)
  {
    id v9 = a3;
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    v8 = &_swiftEmptySetSingleton;
    goto LABEL_6;
  }
  uint64_t v5 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v6 = a3;
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  sub_100508DCC(v13);
  v8 = v7;
LABEL_6:
  swift_bridgeObjectRelease();
  v11 = (_TtC8Freeform17CRLGroupSelection *)sub_100568FF4((uint64_t)v8);

  return v11;
}

- (_TtC8Freeform17CRLGroupSelection)initWithContainerGroups:(id)a3 hasSelectedItemsInNonGroupContainer:(BOOL)a4
{
  type metadata accessor for CRLGroupItem();
  sub_10092B098(&qword_101688628, 255, (void (*)(uint64_t))type metadata accessor for CRLGroupItem);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform17CRLGroupSelection_hasSelectedItemsInNonGroupContainer) = a4;
  uint64_t v7 = sub_101035E90(v6);
  swift_bridgeObjectRelease();
  return (_TtC8Freeform17CRLGroupSelection *)sub_100568FF4(v7);
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
    uint64_t v5 = self;
  }
  unsigned __int8 v6 = sub_10092A828((uint64_t)v8);

  sub_10052E2B0((uint64_t)v8);
  return v6 & 1;
}

- (NSArray)containerGroups
{
  v2 = self;
  sub_10092AACC();

  type metadata accessor for CRLGroupItem();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (BOOL)isCrossContainerSelection
{
  v2 = self;
  NSArray v3 = sub_10092AACC();
  if ((unint64_t)v3 >> 62) {
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
  }
  else {
    uint64_t v4 = *(void *)(((unint64_t)v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v4 <= 1) {
    char v5 = *((unsigned char *)&v2->super.super.super.isa
  }
         + OBJC_IVAR____TtC8Freeform17CRLGroupSelection_hasSelectedItemsInNonGroupContainer);
  else {
    char v5 = 1;
  }

  return v5;
}

- (NSString)description
{
  v2 = self;
  sub_10092AE28();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC8Freeform17CRLGroupSelection)initWithBoardItems:(id)a3
{
  result = (_TtC8Freeform17CRLGroupSelection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end