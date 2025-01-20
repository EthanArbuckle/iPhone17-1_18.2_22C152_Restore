@interface DelegateRelay
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (_TtC7JournalP33_983DA0FAA101D0BE16C06EFC3D547C6313DelegateRelay)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)completerDidFail:(id)a3 error:(id)a4;
- (void)completerDidUpdateResults:(id)a3;
- (void)completerWillUpdateResults:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
@end

@implementation DelegateRelay

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v6 = (void *)Strong;
    id v7 = a3;
    v8 = self;
    sub_100022510(v7);
  }
  return 1;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v9 = (id)Strong;
    id v7 = a3;
    v8 = self;
    sub_100022614(v7);
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = (id)Strong;
    id v6 = a3;
    id v7 = self;
    sub_1000227FC(v6);
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = (id)Strong;
    id v6 = a3;
    id v7 = self;
    [v6 resignFirstResponder];
  }
}

- (void)completerWillUpdateResults:(id)a3
{
}

- (void)completerDidUpdateResults:(id)a3
{
}

- (void)completerDidFail:(id)a3 error:(id)a4
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v11 = (id)Strong;
    id v8 = a3;
    id v9 = a4;
    v10 = self;
    sub_100023384();
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  int64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {

    return 1;
  }
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 0;
  }
  int64_t v5 = *(void *)(*(void *)&Strong[OBJC_IVAR____TtC7Journal27LocationPickerSearchManager_results] + 16);

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v11 = (void *)Strong;
    id v12 = a3;
    v13 = self;
    id v14 = (id)sub_100023584(v12);
  }
  else
  {
    id v14 = [objc_allocWithZone((Class)UICollectionViewCell) init];
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v11 = (void *)Strong;
    id v12 = a3;
    v13 = self;
    sub_100023844((uint64_t)v9);
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC7JournalP33_983DA0FAA101D0BE16C06EFC3D547C6313DelegateRelay)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DelegateRelay();
  return [(DelegateRelay *)&v4 init];
}

- (void).cxx_destruct
{
}

@end