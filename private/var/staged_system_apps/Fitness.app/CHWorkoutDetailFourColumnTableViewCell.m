@interface CHWorkoutDetailFourColumnTableViewCell
+ (double)preferredHeightForWorkout:(id)a3 indexPath:(id)a4 numberOfRows:(int64_t)a5;
- (CHWorkoutDetailFourColumnTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailFourColumnTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation CHWorkoutDetailFourColumnTableViewCell

+ (double)preferredHeightForWorkout:(id)a3 indexPath:(id)a4 numberOfRows:(int64_t)a5
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 32.0;
}

- (CHWorkoutDetailFourColumnTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHWorkoutDetailFourColumnTableViewCell *)sub_10026B5E8(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailFourColumnTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10026BC2C();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnTableViewCell();
  id v2 = v3.receiver;
  [(CHWorkoutDetailFourColumnTableViewCell *)&v3 prepareForReuse];
  sub_10026B32C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnOneLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnTwoLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnThreeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnFourLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_separatorViewBottomAnchorStandard));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_separatorViewBottomAnchorLastRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_separatorViewTopAnchorStandard));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_separatorViewTopAnchorHeader));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_topAnchorStandardRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_topAnchorHeaderRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnOneWidthAnchorStandard));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnTwoWidthAnchorCustom));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnThreeWidthAnchorStandard));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnThreeWidthAnchorSwimSet));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnFourWidthAnchorStandard));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___CHWorkoutDetailFourColumnTableViewCell_columnFourWidthAnchorSwimSet);
}

@end