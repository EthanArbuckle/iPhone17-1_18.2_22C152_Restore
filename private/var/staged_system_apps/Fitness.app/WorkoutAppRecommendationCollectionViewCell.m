@interface WorkoutAppRecommendationCollectionViewCell
- (_TtC10FitnessApp42WorkoutAppRecommendationCollectionViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp42WorkoutAppRecommendationCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation WorkoutAppRecommendationCollectionViewCell

- (_TtC10FitnessApp42WorkoutAppRecommendationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp42WorkoutAppRecommendationCollectionViewCell *)sub_10042E4E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp42WorkoutAppRecommendationCollectionViewCell)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp42WorkoutAppRecommendationCollectionViewCell_iconImageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp42WorkoutAppRecommendationCollectionViewCell_titleLabel);
}

@end