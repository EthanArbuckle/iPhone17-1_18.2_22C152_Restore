@interface CRLRootContainerItem
- (BOOL)isInBoard;
- (BOOL)isSelectable;
- (CRLCanvasInfoGeometry)geometry;
- (Class)layoutClass;
- (_TtC8Freeform8CRLBoard)board;
- (_TtC8Freeform8CRLBoard)parentBoard;
- (void)setBoard:(id)a3;
- (void)setGeometry:(id)a3;
@end

@implementation CRLRootContainerItem

- (_TtC8Freeform8CRLBoard)board
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC8Freeform8CRLBoard *)Strong;
}

- (void)setBoard:(id)a3
{
}

- (BOOL)isInBoard
{
  return 1;
}

- (BOOL)isSelectable
{
  return 0;
}

- (Class)layoutClass
{
  v2 = self;
  sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"layoutClass", 11, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLContainerItem.swift", 87, 2, 803, (uint64_t)"Root container items should never asked to make a layout!", 57, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_100586FD4((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"Root container items should never asked to make a layout!");
  sub_1005871AC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"layoutClass", 11, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLContainerItem.swift", 87, 2, 803);
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v3, v4);
  Class result = (Class)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CRLCanvasInfoGeometry)geometry
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&self->super.super.super.super.isa
                                                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                         + 288);
  CKRecordID v3 = self;
  uint64_t v4 = swift_retain();
  v5 = (void *)v2(v4);

  swift_release();

  return (CRLCanvasInfoGeometry *)v5;
}

- (void)setGeometry:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"geometry", 8, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLContainerItem.swift", 87, 2, 810, (uint64_t)"Root container items should never asked to change their geometry!", 65, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_100586FD4((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"Root container items should never asked to change their geometry!");
  sub_1005871AC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"geometry", 8, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLContainerItem.swift", 87, 2, 810);
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v6, v7);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

- (_TtC8Freeform8CRLBoard)parentBoard
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC8Freeform8CRLBoard *)Strong;
}

- (void).cxx_destruct
{
}

@end