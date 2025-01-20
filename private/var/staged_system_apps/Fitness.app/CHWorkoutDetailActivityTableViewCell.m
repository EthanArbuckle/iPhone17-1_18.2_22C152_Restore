@interface CHWorkoutDetailActivityTableViewCell
+ (double)preferredHeightForWorkout:(id)a3 indexPath:(id)a4 numberOfRows:(int64_t)a5;
- (CHWorkoutDetailActivityTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailActivityTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CHWorkoutDetailNavigationDelegate)navigationDelegate;
- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 formattingManager:(id)a5 dataCalculator:(id)a6;
- (void)didTapWorkoutActivity;
- (void)prepareForReuse;
- (void)setNavigationDelegate:(id)a3;
@end

@implementation CHWorkoutDetailActivityTableViewCell

- (CHWorkoutDetailNavigationDelegate)navigationDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CHWorkoutDetailNavigationDelegate *)Strong;
}

- (void)setNavigationDelegate:(id)a3
{
}

+ (double)preferredHeightForWorkout:(id)a3 indexPath:(id)a4 numberOfRows:(int64_t)a5
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 74.0;
}

- (CHWorkoutDetailActivityTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHWorkoutDetailActivityTableViewCell *)sub_100703CB4(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailActivityTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100708D64();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1007042FC();
}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 formattingManager:(id)a5 dataCalculator:(id)a6
{
  uint64_t v10 = (void (*)(char *, void))a3;
  id v11 = a4;
  v12 = (void (*)(char *, void))a5;
  v13 = (char *)a6;
  v14 = self;
  sub_10070663C(v10, v11, v12, v13);
}

- (void)didTapWorkoutActivity
{
  v2 = self;
  sub_100707800();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_groupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_workoutImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_workoutIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_workoutTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_distanceLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_durationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_paceLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_effortImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_effortLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_dataCalculator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_workout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_workoutActivity));
  swift_release();
  sub_10008DB18((uint64_t)self + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_effort, &qword_10094F480);
  id v3 = (char *)self + OBJC_IVAR___CHWorkoutDetailActivityTableViewCell_navigationDelegate;

  sub_10019B9F8((uint64_t)v3);
}

@end