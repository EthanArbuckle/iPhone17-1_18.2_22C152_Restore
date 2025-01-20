@interface TrophyCaseAwardDetailWorkoutCell
- (_TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell)initWithFrame:(CGRect)a3;
@end

@implementation TrophyCaseAwardDetailWorkoutCell

- (_TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell *)sub_10058AA54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell_workoutContentView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for WorkoutsListContentView());
  id v7 = a3;
  id v8 = [v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)v8;

  result = (_TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32TrophyCaseAwardDetailWorkoutCell_workoutContentView));
}

@end