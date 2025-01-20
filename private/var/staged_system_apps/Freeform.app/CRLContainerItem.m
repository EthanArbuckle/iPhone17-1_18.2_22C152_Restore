@interface CRLContainerItem
- (BOOL)beforeInsertionAddNewItems:(id)a3 atIndex:(int64_t)a4 board:(id)a5 error:(id *)a6;
- (BOOL)beforeInsertionAddNewItems:(id)a3 board:(id)a4 error:(id *)a5;
- (BOOL)containsChild:(id)a3;
- (NSArray)childInfos;
- (NSArray)childItems;
- (NSArray)orderedItemUUIDs;
- (NSDictionary)items;
- (NSSet)unorderedItemUUIDs;
- (_TtC8Freeform16CRLContainerItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 geometry:(id)a5;
- (id)_duplicateEmptyWithNewParentContainerUUID:(id)a3 uuidRemapHelper:(id)a4 error:(id *)a5;
- (id)childEnumerator;
- (id)childEnumeratorForUserFlags:(unint64_t)a3;
- (id)getReferencedAssetIDsWithIncludeChildren:(BOOL)a3;
- (id)infoForSelectionPath:(id)a3;
- (unsigned)timeStamp;
- (void)_setParentItemReferenceWithItem:(id)a3 parent:(id)a4;
- (void)_setParentItemUUIDWithItem:(id)a3 parent:(id)a4;
- (void)clearChildItemsCache;
- (void)fixUpWithInsertedChild:(id)a3 expectTransactionContext:(BOOL)a4;
- (void)fixUpWithRemovedChild:(id)a3 expectTransactionContext:(BOOL)a4;
- (void)setItems:(id)a3;
- (void)setTimeStamp:(unsigned int)a3;
@end

@implementation CRLContainerItem

- (NSDictionary)items
{
  type metadata accessor for UUID();
  type metadata accessor for CRLBoardItem(0);
  sub_100853A60((unint64_t *)&qword_1016770E0, (void (*)(uint64_t))&type metadata accessor for UUID);
  swift_bridgeObjectRetain();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setItems:(id)a3
{
  type metadata accessor for UUID();
  type metadata accessor for CRLBoardItem(0);
  sub_100853A60((unint64_t *)&qword_1016770E0, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1008469D8(v4);
}

- (unsigned)timeStamp
{
  return *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLContainerItem_timeStamp);
}

- (void)setTimeStamp:(unsigned int)a3
{
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLContainerItem_timeStamp) = a3;
}

- (NSArray)childItems
{
  return (NSArray *)sub_10084DE5C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems, (void (*)(void))type metadata accessor for CRLBoardItem);
}

- (NSArray)orderedItemUUIDs
{
  return (NSArray *)sub_10084DE5C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItemUUIDs, (void (*)(void))&type metadata accessor for UUID);
}

- (NSSet)unorderedItemUUIDs
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedUnorderedItemUUIDs);
  v3 = self;
  if (!v2) {
    sub_100846AB0();
  }
  swift_bridgeObjectRetain();

  type metadata accessor for UUID();
  sub_100853A60((unint64_t *)&qword_1016770E0, (void (*)(uint64_t))&type metadata accessor for UUID);
  v4.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v4.super.isa;
}

- (void)clearChildItemsCache
{
  uint64_t v2 = self;
  sub_100846A54();
}

- (NSArray)childInfos
{
  uint64_t v3 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems;
  NSSet v4 = *(double **)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems);
  v5 = self;
  if (!v4)
  {
    sub_100846AB0();
    NSSet v4 = *(double **)((char *)&self->super.super.super.isa + v3);
  }
  if (v4) {
    v6 = v4;
  }
  else {
    v6 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  sub_10058FEA4((unint64_t)v6);

  swift_bridgeObjectRelease();
  sub_1005057FC(&qword_101673060);
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v7.super.isa;
}

- (id)infoForSelectionPath:(id)a3
{
  return 0;
}

- (void)fixUpWithInsertedChild:(id)a3 expectTransactionContext:(BOOL)a4
{
  v6 = a3;
  NSArray v7 = self;
  sub_1008488B0(v6, a4);
}

- (BOOL)containsChild:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItemUUIDs;
  v10 = *(double **)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItemUUIDs);
  v11 = self;
  v13 = v11;
  if (!v10)
  {
    v11 = (_TtC8Freeform16CRLContainerItem *)sub_100846AB0();
    v10 = *(double **)((char *)&self->super.super.super.isa + v9);
  }
  if (v10) {
    v14 = v10;
  }
  else {
    v14 = _swiftEmptyArrayStorage;
  }
  __chkstk_darwin(v11, v12);
  *(void *)&v17[-16] = v8;
  swift_bridgeObjectRetain();
  BOOL v15 = sub_10102212C((uint64_t (*)(char *))sub_1008538B8, (uint64_t)&v17[-32], (uint64_t)v14);

  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  return v15;
}

- (void)fixUpWithRemovedChild:(id)a3 expectTransactionContext:(BOOL)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = self;
  sub_100849694((uint64_t)v10, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (BOOL)beforeInsertionAddNewItems:(id)a3 board:(id)a4 error:(id *)a5
{
  type metadata accessor for CRLBoardItem(0);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a4;
  uint64_t v9 = self;
  sub_100853108(v7);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)beforeInsertionAddNewItems:(id)a3 atIndex:(int64_t)a4 board:(id)a5 error:(id *)a6
{
  type metadata accessor for CRLBoardItem(0);
  unint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a5;
  v11 = self;
  sub_100853510(v9, a4);
  swift_bridgeObjectRelease();

  return 1;
}

- (id)_duplicateEmptyWithNewParentContainerUUID:(id)a3 uuidRemapHelper:(id)a4 error:(id *)a5
{
  uint64_t v8 = sub_1005057FC((uint64_t *)&unk_101674520);
  __chkstk_darwin(v8 - 8, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a4;
  BOOL v15 = self;
  v16 = (void *)sub_10084D444((uint64_t)v11, (uint64_t)v14);
  sub_100522F00((uint64_t)v11, (uint64_t *)&unk_101674520);

  return v16;
}

- (id)getReferencedAssetIDsWithIncludeChildren:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10084663C(a3);

  type metadata accessor for UUID();
  sub_100853A60((unint64_t *)&qword_1016770E0, (void (*)(uint64_t))&type metadata accessor for UUID);
  v5.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (id)childEnumerator
{
  uint64_t v3 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems;
  uint64_t v4 = *(double **)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems);
  NSSet v5 = self;
  if (!v4)
  {
    sub_100846AB0();
    uint64_t v4 = *(double **)((char *)&self->super.super.super.isa + v3);
  }
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  sub_1005902FC((unint64_t)v6);
  swift_bridgeObjectRelease();
  id v7 = objc_allocWithZone((Class)NSArray);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithArray:isa];

  id v10 = [v9 objectEnumerator];

  return v10;
}

- (id)childEnumeratorForUserFlags:(unint64_t)a3
{
  uint64_t v4 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems;
  NSSet v5 = *(double **)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems);
  uint64_t v6 = self;
  if (!v5)
  {
    sub_100846AB0();
    NSSet v5 = *(double **)((char *)&self->super.super.super.isa + v4);
  }
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  sub_1005902FC((unint64_t)v7);
  swift_bridgeObjectRelease();
  id v8 = objc_allocWithZone((Class)NSArray);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [v8 initWithArray:isa];

  id v11 = [v10 objectEnumerator];

  return v11;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform16CRLContainerItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 geometry:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  __chkstk_darwin(v7 - 8, v8);
  id v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a5;
  return (_TtC8Freeform16CRLContainerItem *)sub_10084F318((uint64_t)v11, (uint64_t)v10, a5);
}

- (void)_setParentItemReferenceWithItem:(id)a3 parent:(id)a4
{
}

- (void)_setParentItemUUIDWithItem:(id)a3 parent:(id)a4
{
  uint64_t v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100895678(v6, (uint64_t)v7);
}

@end