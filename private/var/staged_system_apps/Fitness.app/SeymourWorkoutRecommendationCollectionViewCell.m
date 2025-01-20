@interface SeymourWorkoutRecommendationCollectionViewCell
- (_TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation SeymourWorkoutRecommendationCollectionViewCell

- (_TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell *)sub_100621840(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100622FB8();
}

- (_TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006232F8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp46SeymourWorkoutRecommendationCollectionViewCell_subtitleLabel));
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end