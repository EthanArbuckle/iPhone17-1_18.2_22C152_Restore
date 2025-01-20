@interface AddToYourRingCollectionViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC10FitnessApp37AddToYourRingCollectionViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp37AddToYourRingCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC10FitnessApp37AddToYourRingCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)viewDidLoad;
@end

@implementation AddToYourRingCollectionViewController

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return sub_100497FB8(a4);
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
  id v12 = sub_10049693C(v10);

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
  id v16 = sub_1004983B8(v14, v11, v13);

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
  sub_100498554((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  unint64_t v12 = IndexPath.section.getter();
  if (v12 > 3)
  {
    __break(1u);
  }
  else
  {
    int v13 = *((unsigned __int8 *)&off_1008B6A58 + v12 + 32);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    LOBYTE(v12) = v13 != 0;
  }
  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  unint64_t v12 = IndexPath.section.getter();
  if (v12 > 3)
  {
    __break(1u);
  }
  else
  {
    int v13 = *((unsigned __int8 *)&off_1008B6A80 + v12 + 32);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    LOBYTE(v12) = v13 != 0;
  }
  return v12;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (_TtC10FitnessApp37AddToYourRingCollectionViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v2 = self;
  sub_1006D567C();
}

- (void).cxx_destruct
{
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_appRecommendationDataProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_fitnessAppContext));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self+ OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_seymourWorkoutRecommendationDataProvider);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_walkSuggestionDataProvider);
  swift_release();
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_artworkImageLoader);
  swift_release();
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_networkEvaluator);
  swift_unknownObjectRelease();
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_delegate);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_walkSuggestionCell));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006D5864();
}

- (_TtC10FitnessApp37AddToYourRingCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC10FitnessApp37AddToYourRingCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp37AddToYourRingCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp37AddToYourRingCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)applicationsDidInstall:(id)a3
{
  id v3 = self;
  sub_1006DAA04((uint64_t)"[AddToYourRingSuggestion] applicationsDidInstall, refreshing appRecommendation data provider", 92, (uint64_t)&unk_1008D7470, (uint64_t)&unk_1009698B0);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v3 = self;
  sub_1006DAA04((uint64_t)"[AddToYourRingSuggestion] applicationsDidUninstall, refreshing appRecommendation data provider", 94, (uint64_t)&unk_1008D7420, (uint64_t)&unk_100969898);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1006DAA04((uint64_t)"[AddToYourRingSuggestion] appProtectionSubjectsChanged, refreshing appRecommendation data provider", 98, (uint64_t)&unk_1008D7380, (uint64_t)&unk_100969870);
  swift_unknownObjectRelease();
}

@end