@interface CollectionViewDragDropController.DropDelegate
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (_TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate)init;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
@end

@implementation CollectionViewDragDropController.DropDelegate

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  return sub_1002D21D0((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession);
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1002D5ED0(a4);

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = sub_100063814((uint64_t *)&unk_10109B9F0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v14 = *(uint64_t (**)(id, char *))((char *)&self->super.isa
                                             + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate);
  if (v14)
  {
    id v15 = a3;
    swift_unknownObjectRetain();
    v16 = self;
    sub_10007B674((uint64_t)v14);
    id v17 = (id)v14(a4, v11);
    sub_10006ADFC((uint64_t)v14);

    swift_unknownObjectRelease();
  }
  else
  {
    id v17 = [objc_allocWithZone((Class)UICollectionViewDropProposal) initWithDropOperation:0];
  }
  sub_1000637B8((uint64_t)v11, (uint64_t *)&unk_10109B9F0);

  return v17;
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
}

- (_TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onPerformDrop);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd);
  v7 = (objc_class *)type metadata accessor for CollectionViewDragDropController.DropDelegate();
  *id v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return [(CollectionViewDragDropController.DropDelegate *)&v9 init];
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onPerformDrop));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC5Music32CollectionViewDragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd);

  sub_10006ADFC(v3);
}

@end