@interface LockJournalOnboardingViewController
- (_TtC7Journal35LockJournalOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC7Journal35LockJournalOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)notNowButtonTapped;
- (void)turnOnButtonTapped;
@end

@implementation LockJournalOnboardingViewController

- (void)turnOnButtonTapped
{
  v2 = self;
  sub_1003E0930();
}

- (void)notNowButtonTapped
{
  v3 = self;
  v9 = self;
  id v4 = [v3 standardUserDefaults];
  NSString v5 = String._bridgeToObjectiveC()();
  [v4 setBool:1 forKey:v5];

  v6 = (_TtC7Journal35LockJournalOnboardingViewController *)[(LockJournalOnboardingViewController *)v9 presentingViewController];
  if (v6)
  {
    v7 = v6;
    [(LockJournalOnboardingViewController *)v6 dismissViewControllerAnimated:1 completion:0];

    v8 = v7;
  }
  else
  {
    v8 = v9;
  }
}

- (_TtC7Journal35LockJournalOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC7Journal35LockJournalOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7Journal35LockJournalOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC7Journal35LockJournalOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
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
  id v12 = sub_1003E1488(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

@end