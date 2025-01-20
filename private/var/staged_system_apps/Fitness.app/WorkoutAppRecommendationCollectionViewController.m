@interface WorkoutAppRecommendationCollectionViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WorkoutAppRecommendationCollectionViewController

- (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006A1670();
}

- (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self+ OBJC_IVAR____TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController_appRecommendationDataProvider);

  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController_recentWorkoutAppRecommendations))[2] != 0;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController_recentWorkoutAppRecommendations))[2];
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
  v12 = (void *)sub_1006A19CC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  [a3 frame];
  double v11 = v10 * 0.25;
  double v12 = v10 * 0.25 + 28.0;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  double v13 = v11;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  double v11 = self;
  sub_1006A209C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end