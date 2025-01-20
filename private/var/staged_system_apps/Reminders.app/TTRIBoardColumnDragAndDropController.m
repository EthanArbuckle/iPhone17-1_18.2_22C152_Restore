@interface TTRIBoardColumnDragAndDropController
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (_TtC9Reminders36TTRIBoardColumnDragAndDropController)init;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
@end

@implementation TTRIBoardColumnDragAndDropController

- (_TtC9Reminders36TTRIBoardColumnDragAndDropController)init
{
  result = (_TtC9Reminders36TTRIBoardColumnDragAndDropController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_coordinator);
  sub_1003B216C((uint64_t)self + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_columnID, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.ItemID);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_dataSource));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9Reminders36TTRIBoardColumnDragAndDropController_collectionView);
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v12 = Strong;
    id v13 = a3;
    swift_unknownObjectRetain();
    v14 = self;
    sub_1003B1068((uint64_t)v14, (uint64_t)v10, v12);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_100055B3C();
  v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v15.super.isa;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    id v9 = a3;
    swift_unknownObjectRetain();
    v10 = self;
    sub_1003B1184(a4, v8);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v9 = type metadata accessor for IndexPath();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v14 = Strong;
    id v15 = a3;
    swift_unknownObjectRetain();
    v16 = self;
    sub_1003B168C((uint64_t)v16, a4, (uint64_t)v12, v14);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_100055B3C();
  v17.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v17.super.isa;
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v7 = a3;
    swift_unknownObjectRetain();
    uint64_t v8 = self;
    sub_1004F69F0(a4);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    id v9 = a3;
    swift_unknownObjectRetain();
    uint64_t v10 = self;
    char v11 = sub_1003B1848(a4, v8);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = sub_10003B754(&qword_10078E8F0);
  __chkstk_darwin(v9 - 8);
  char v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for IndexPath();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for IndexPath();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v15 = Strong;
    id v16 = a3;
    swift_unknownObjectRetain();
    NSArray v17 = self;
    id v18 = sub_1003AF868((uint64_t)v17, (uint64_t)a4, (uint64_t)v11, v15);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    id v18 = [objc_allocWithZone((Class)UICollectionViewDropProposal) initWithDropOperation:0];
  }
  sub_10003B6F8((uint64_t)v11, &qword_10078E8F0);

  return v18;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    id v9 = a3;
    swift_unknownObjectRetain();
    uint64_t v10 = self;
    sub_1003B05BC(a4, (uint64_t)v10, 0x6120646574697865, 0xEB00000000616572, 0, v8);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    id v9 = a3;
    swift_unknownObjectRetain();
    uint64_t v10 = self;
    sub_1004F6C6C(a4);
    sub_1003B05BC(a4, (uint64_t)v10, 0xD000000000000016, 0x80000001006B8780, 1, v8);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

@end