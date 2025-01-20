@interface FamilyPurchasesViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FamilyPurchasesViewController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(FamilyPurchasesViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FamilyPurchasesViewController();
  id v4 = v7.receiver;
  [(StoreCollectionViewController *)&v7 viewWillAppear:v3];
  id v5 = [v4 collectionView];
  if (v5)
  {
    id v6 = v5;
    [v5 selectItemAtIndexPath:0 animated:1 scrollPosition:0];

    id v4 = v6;
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100270CAC();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  int64_t v7 = dispatch thunk of FamilyPurchasesPresenter.numberOfRows(in:)();

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  int64_t v6 = dispatch thunk of FamilyPurchasesPresenter.numberOfSections.getter();

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_100270FBC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  v15 = self;
  id v16 = sub_100272C7C(v14, v11, v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
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
  dispatch thunk of FamilyPurchasesPresenter.didSelectItem(at:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  sub_100272DB8(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = type metadata accessor for IndexPath();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v16 = a3;
  id v17 = a4;
  uint64_t v18 = self;
  sub_1002734DC(v17, v13, v15);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_100273898(v12);
  double v16 = v15;
  double v18 = v17;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v8 = type metadata accessor for FamilyPurchasesSection();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  dispatch thunk of FamilyPurchasesPresenter.familyPurchasesSection(for:)();
  if ((*(unsigned int (**)(char *, uint64_t))(v9 + 88))(v11, v8) == enum case for FamilyPurchasesSection.loggedInUser(_:))
  {
    if (qword_10097E718 != -1) {
      swift_once();
    }
    CGFloat top = *(double *)&qword_10098B860;
    CGFloat right = 0.0;
    CGFloat bottom = 27.5;
    CGFloat left = 0.0;
  }
  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  double v19 = top;
  double v20 = left;
  double v21 = bottom;
  double v22 = right;
  result.CGFloat right = v22;
  result.CGFloat bottom = v21;
  result.CGFloat left = v20;
  result.CGFloat top = v19;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_100273C50();
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void).cxx_destruct
{
}

@end