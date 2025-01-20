@interface AchievementCellContentView
- (_TtC10FitnessApp26AchievementCellContentView)initWithCoder:(id)a3;
- (_TtC10FitnessApp26AchievementCellContentView)initWithFrame:(CGRect)a3;
@end

@implementation AchievementCellContentView

- (_TtC10FitnessApp26AchievementCellContentView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp26AchievementCellContentView *)sub_100222F80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp26AchievementCellContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100224A84();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_achievementBadgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_detailLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_chevronImageView);
}

@end