@interface CHWorkoutDetailGuidedRunMediaMomentsTableViewCell
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CHWorkoutDetailGuidedRunMediaMomentsTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailGuidedRunMediaMomentsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)onDidTapMediaMomentItem;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureWithWorkout:(id)a3 fitnessAppContext:(id)a4;
- (void)setOnDidTapMediaMomentItem:(id)a3;
@end

@implementation CHWorkoutDetailGuidedRunMediaMomentsTableViewCell

- (id)onDidTapMediaMomentItem
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem))
  {
    uint64_t v2 = *(void *)&self->mediaMomentArtworkCollectionView[OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem];
    v5[4] = *(Class *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100066A00;
    v5[3] = &unk_1008CB260;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setOnDidTapMediaMomentItem:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1002460B8;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self
                      + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10005E5F8(v8);
}

- (CHWorkoutDetailGuidedRunMediaMomentsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (CHWorkoutDetailGuidedRunMediaMomentsTableViewCell *)sub_1004B07E0(a3, (uint64_t)a4, v6);
}

- (void)configureWithWorkout:(id)a3 fitnessAppContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1004B0DD4(v6, v7);
}

- (CHWorkoutDetailGuidedRunMediaMomentsTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004B1A10();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_mediaMomentArtworkCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_workout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_fitnessAppContext));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_onDidTapMediaMomentItem);

  sub_10005E5F8(v3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___CHWorkoutDetailGuidedRunMediaMomentsTableViewCell_mediaMomentArtworkItems);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  uint64_t v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_1004B15BC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1004B1B34();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  double v9 = 164.0;
  double v10 = 164.0;
  result.height = v10;
  result.width = v9;
  return result;
}

@end