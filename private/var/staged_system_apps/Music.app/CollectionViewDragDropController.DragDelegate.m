@interface CollectionViewDragDropController.DragDelegate
- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4;
- (_TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate)init;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
@end

@implementation CollectionViewDragDropController.DragDelegate

- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  return 0;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  swift_unknownObjectRetain();
  v13 = self;
  if (([v12 isEditing] & 1) == 0)
  {
    v14 = *(void (**)(id, char *))((char *)&v13->super.isa
                                            + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider);
    if (v14)
    {
      swift_retain();
      v14(a4, v11);
      sub_10006ADFC((uint64_t)v14);
    }
  }

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_100057778(0, (unint64_t *)&qword_1010A2C40);
  v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v15.super.isa;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v9 = type metadata accessor for IndexPath();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  swift_unknownObjectRetain();
  v14 = self;
  if (([v13 isEditing] & 1) == 0)
  {
    NSArray v15 = *(void (**)(id, char *))((char *)&v14->super.isa
                                            + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider);
    if (v15)
    {
      swift_retain();
      v15(a4, v12);
      sub_10006ADFC((uint64_t)v15);
    }
  }

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_100057778(0, (unint64_t *)&qword_1010A2C40);
  v16.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v16.super.isa;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = sub_1002D5D70(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
}

- (_TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate)init
{
  return (_TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate *)sub_10007BD60((char *)self, (uint64_t)a2, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionWillBegin, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionDidEnd, (uint64_t (*)(void))type metadata accessor for CollectionViewDragDropController.DragDelegate);
}

- (void).cxx_destruct
{
}

@end