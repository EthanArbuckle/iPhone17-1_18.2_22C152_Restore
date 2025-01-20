@interface PrintEntriesViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (_TtC7Journal26PrintEntriesViewController)initWithCoder:(id)a3;
- (_TtC7Journal26PrintEntriesViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC7Journal26PrintEntriesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation PrintEntriesViewController

- (void)loadView
{
  v2 = self;
  sub_1002C0CB4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1002C0E44();
}

- (_TtC7Journal26PrintEntriesViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  v4 = (_TtC7Journal26PrintEntriesViewController *)sub_1002C8004((uint64_t)v3);

  return v4;
}

- (_TtC7Journal26PrintEntriesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7Journal26PrintEntriesViewController *)sub_1002C5428(v5, v7, a4);
}

- (_TtC7Journal26PrintEntriesViewController)initWithCoder:(id)a3
{
  return (_TtC7Journal26PrintEntriesViewController *)sub_1002C59B4(a3);
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC7Journal26PrintEntriesViewController_minimumDate;
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC7Journal26PrintEntriesViewController_maximumDate, v4);
  v5((char *)self + OBJC_IVAR____TtC7Journal26PrintEntriesViewController_startDate, v4);
  v5((char *)self + OBJC_IVAR____TtC7Journal26PrintEntriesViewController_endDate, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26PrintEntriesViewController____lazy_storage___printBarButtonItem));
  uint64_t v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal26PrintEntriesViewController____lazy_storage___dataSource);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_1002BEFF8();
  dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();

  LODWORD(v12) = v15[15];
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  return (v12 >> 7) ^ 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1002C6240(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end