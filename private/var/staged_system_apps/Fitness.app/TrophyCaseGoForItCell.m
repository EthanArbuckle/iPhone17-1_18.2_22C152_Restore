@interface TrophyCaseGoForItCell
- (_TtC10FitnessApp21TrophyCaseGoForItCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp21TrophyCaseGoForItCell)initWithFrame:(CGRect)a3;
- (void)didTapShowAllButton:(id)a3;
- (void)didTapTopAchievement:(id)a3;
@end

@implementation TrophyCaseGoForItCell

- (_TtC10FitnessApp21TrophyCaseGoForItCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp21TrophyCaseGoForItCell *)sub_10033B854(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp21TrophyCaseGoForItCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10033EF58();
}

- (void)didTapTopAchievement:(id)a3
{
}

- (void)didTapShowAllButton:(id)a3
{
}

- (void).cxx_destruct
{
  sub_10005E5F8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_tapOnAchievement));
  sub_10005E5F8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_tapOnShowAllAchievements));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_roundedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_sectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_achievementLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_badgeImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_badgeStackImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp21TrophyCaseGoForItCell_showAllButton);
}

@end