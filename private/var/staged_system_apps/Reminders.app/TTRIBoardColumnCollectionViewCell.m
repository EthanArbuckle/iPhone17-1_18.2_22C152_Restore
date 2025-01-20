@interface TTRIBoardColumnCollectionViewCell
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC9Reminders33TTRIBoardColumnCollectionViewCell)initWithCoder:(id)a3;
- (_TtC9Reminders33TTRIBoardColumnCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3;
- (void)prepareForReuse;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
@end

@implementation TTRIBoardColumnCollectionViewCell

- (_TtC9Reminders33TTRIBoardColumnCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders33TTRIBoardColumnCollectionViewCell *)sub_10015EB28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders33TTRIBoardColumnCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC9Reminders33TTRIBoardColumnCollectionViewCell *)sub_10015F094(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10015F260();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_dataSource));
  swift_release();
  swift_release();
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_dragAndDropController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_scrollingController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_collectionView));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_columnDraggingHandler;

  sub_1000499D4((uint64_t)v3);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders33TTRIBoardColumnCollectionViewCell_collectionView);
  if (v3) {
    BOOL v4 = v3 == a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v6 = a3;
    v7 = self;
    sub_10003B754(&qword_10078EF00);
    sub_100037EA0(&qword_10078EF08, &qword_10078EF00);
    Subject<>.send()();
  }
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  type metadata accessor for IndexPath();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  sub_100161188((uint64_t)v6);

  swift_bridgeObjectRelease();
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_100167190();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  v26 = self;
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  v14 = (char *)&v25 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  v17 = (char *)&v25 - v16;
  __chkstk_darwin(v15);
  v19 = (char *)&v25 - v18;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v20 = a3;
  v21 = v26;
  sub_100161930((uint64_t)v17, (uint64_t)v14, (uint64_t)v11, (uint64_t)v19);

  v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v11, v7);
  v22(v14, v7);
  v22(v17, v7);
  v23.super.isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v22(v19, v7);

  return v23.super.isa;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_100161FB0(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_10016736C);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return sub_100161FB0(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_100167710);
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
}

- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v5 = a3;
    id v6 = self;
    sub_100446108();

    swift_unknownObjectRelease();
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return sub_100161FB0(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_100167870);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  type metadata accessor for IndexPath();
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  uint64_t v12 = (void *)sub_1001620C0((uint64_t)v10, v9, x, y);

  swift_bridgeObjectRelease();

  return v12;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v10 = *(void *)(Strong + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_presenter + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v12 = *(void *)(v10 + 8);
    uint64_t v13 = *(void (**)(id, id, uint64_t, uint64_t))(v12 + 744);
    id v14 = a3;
    id v15 = a4;
    swift_unknownObjectRetain();
    uint64_t v16 = self;
    v13(v15, a5, ObjectType, v12);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
}

@end