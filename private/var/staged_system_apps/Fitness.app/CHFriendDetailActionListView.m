@interface CHFriendDetailActionListView
- (CHFriendDetailActionListView)initWithCoder:(id)a3;
- (CHFriendDetailActionListView)initWithFrame:(CGRect)a3;
- (CHFriendDetailActionListViewDelegate)delegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)actionCount;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)configureWithActionTypes:(id)a3 labelTexts:(id)a4 footerText:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation CHFriendDetailActionListView

- (CHFriendDetailActionListViewDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CHFriendDetailActionListViewDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)actionCount
{
  return (*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR___CHFriendDetailActionListView_actionTypes))[2];
}

- (CHFriendDetailActionListView)initWithFrame:(CGRect)a3
{
  return (CHFriendDetailActionListView *)sub_1004C5068(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)configureWithActionTypes:(id)a3 labelTexts:(id)a4 footerText:(id)a5
{
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a5;
  v10 = self;
  sub_1004C5614(v7, v8, v9);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (CHFriendDetailActionListView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004C621C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10019B9F8((uint64_t)self + OBJC_IVAR___CHFriendDetailActionListView_delegate);
  id v3 = (char *)self + OBJC_IVAR___CHFriendDetailActionListView_cellRegistration;
  uint64_t v4 = sub_1000AFA94(&qword_10095ED68);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___CHFriendDetailActionListView____lazy_storage___footerRegistration;

  sub_1004C6A38((uint64_t)v5);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR___CHFriendDetailActionListView_actionTypes))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1004C5B78();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_1000AFA94(&qword_10095ECD8);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for IndexPath();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v15 = a3;
  v16 = self;
  sub_1004C4CB0((uint64_t)v10);
  sub_10007E2D8(0, &qword_10095ED48);
  v17 = (void *)UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);

  return v17;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1004C6714();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
}

@end