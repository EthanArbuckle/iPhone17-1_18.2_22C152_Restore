@interface PurchasesCollectionViewDataSource
- (_TtC8AppStore33PurchasesCollectionViewDataSource)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
@end

@implementation PurchasesCollectionViewDataSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = PurchasesContentPresenter.sectionCount.getter();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  swift_unknownObjectRetain();
  int64_t v8 = sub_10073287C(a4);

  swift_unknownObjectRelease();
  return v8;
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
  id v12 = sub_1002CA5F4((uint64_t)v9, v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC8AppStore33PurchasesCollectionViewDataSource)init
{
  result = (_TtC8AppStore33PurchasesCollectionViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();

  swift_release();
}

@end