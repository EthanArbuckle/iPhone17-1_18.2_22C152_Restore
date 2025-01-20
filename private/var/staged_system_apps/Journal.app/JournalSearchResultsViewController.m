@interface JournalSearchResultsViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC7Journal34JournalSearchResultsViewController)initWithCoder:(id)a3;
- (_TtC7Journal34JournalSearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)controller:(id)a3 didChangeContentWithSnapshot:(id)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)spotlightIndexUpdated:(id)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation JournalSearchResultsViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JournalSearchResultsViewController();
  id v2 = v5.receiver;
  [(JournalEntryCollectionViewController *)&v5 viewDidLoad];
  id v3 = [self defaultCenter];
  sub_10001B284(0, &qword_100809908);
  updated = (void *)static NSCoreDataCoreSpotlightDelegate.indexDidUpdateNotification.getter();
  [v3 addObserver:v2 selector:"spotlightIndexUpdated:" name:updated object:0];
}

- (void)viewIsAppearing:(BOOL)a3
{
  id v3 = self;
  sub_1004B8B58();
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  return 0;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for JournalSearchResultsViewController();
  id v4 = a3;
  objc_super v5 = (char *)v9.receiver;
  [(JournalEntryCollectionViewController *)&v9 scrollViewWillBeginDragging:v4];
  v6 = &v5[OBJC_IVAR____TtC7Journal34JournalSearchResultsViewController_searchResultsDelegate];
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v7 + 32))(ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC7Journal34JournalSearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC7Journal34JournalSearchResultsViewController *)sub_10036489C(v5, v7, a4);
}

- (_TtC7Journal34JournalSearchResultsViewController)initWithCoder:(id)a3
{
  return (_TtC7Journal34JournalSearchResultsViewController *)sub_1003649D0(a3);
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal34JournalSearchResultsViewController_searchResultsDelegate);
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal34JournalSearchResultsViewController____lazy_storage___indexingAlertView);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_100365B64(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100364D48(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)spotlightIndexUpdated:(id)a3
{
  uint64_t v4 = qword_1007F6D38;
  uint64_t v5 = (_TtC7Journal34JournalSearchResultsViewController *)a3;
  uint64_t v8 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = *(void **)(*(void *)(qword_10083D2F8 + 16) + OBJC_IVAR____TtC7Journal13CoreDataStack_spotlightDelegate);
  if (v6 && ![v6 isIndexingEnabled])
  {
    uint64_t v7 = (_TtC7Journal34JournalSearchResultsViewController *)sub_10035FFD8();
    [(JournalSearchResultsViewController *)v7 removeFromSuperview];

    uint64_t v5 = v8;
    uint64_t v8 = v7;
  }
}

- (void)controller:(id)a3 didChangeContentWithSnapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1004B8F64((uint64_t)v6, (uint64_t)v7);
}

@end