@interface SearchHintsCollectionViewDataSource
- (_TtC8AppStore35SearchHintsCollectionViewDataSource)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
@end

@implementation SearchHintsCollectionViewDataSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = dispatch thunk of SearchHintsPresenter.resultCount.getter();

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for SearchHintCollectionViewCell();
  id v10 = a3;
  v11 = self;
  static UICollectionReusableView.defaultReuseIdentifier.getter();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  id v14 = [v10 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:isa];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v14;
}

- (_TtC8AppStore35SearchHintsCollectionViewDataSource)init
{
  result = (_TtC8AppStore35SearchHintsCollectionViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end