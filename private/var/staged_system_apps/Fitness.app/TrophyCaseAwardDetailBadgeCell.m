@interface TrophyCaseAwardDetailBadgeCell
- (_TtC10FitnessApp30TrophyCaseAwardDetailBadgeCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp30TrophyCaseAwardDetailBadgeCell)initWithFrame:(CGRect)a3;
@end

@implementation TrophyCaseAwardDetailBadgeCell

- (_TtC10FitnessApp30TrophyCaseAwardDetailBadgeCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp30TrophyCaseAwardDetailBadgeCell *)sub_1005BD808(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp30TrophyCaseAwardDetailBadgeCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005BECC0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30TrophyCaseAwardDetailBadgeCell_achievementTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30TrophyCaseAwardDetailBadgeCell_achievementDescriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30TrophyCaseAwardDetailBadgeCell_badgeViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30TrophyCaseAwardDetailBadgeCell_progressBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30TrophyCaseAwardDetailBadgeCell_badgeView));

  swift_bridgeObjectRelease();
}

@end