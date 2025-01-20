@interface RecentWorkoutAppRecommendationTableViewCell
- (_TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation RecentWorkoutAppRecommendationTableViewCell

- (_TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell *)sub_10033096C(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell_workoutAppRecommendationCollectionViewController) = 0;
  id v4 = a3;

  result = (_TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43RecentWorkoutAppRecommendationTableViewCell_workoutAppRecommendationCollectionViewController));
}

@end