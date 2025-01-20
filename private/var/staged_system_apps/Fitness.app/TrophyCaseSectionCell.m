@interface TrophyCaseSectionCell
- (_TtC10FitnessApp21TrophyCaseSectionCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp21TrophyCaseSectionCell)initWithFrame:(CGRect)a3;
- (void)didTapBadgeImageView:(id)a3;
- (void)didTapShowAllButton:(id)a3;
- (void)prepareForReuse;
@end

@implementation TrophyCaseSectionCell

- (_TtC10FitnessApp21TrophyCaseSectionCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp21TrophyCaseSectionCell *)sub_1002E1AA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp21TrophyCaseSectionCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002E5720();
}

- (void)didTapBadgeImageView:(id)a3
{
}

- (void)didTapShowAllButton:(id)a3
{
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1002E52EC();
}

- (void).cxx_destruct
{
  sub_10005E5F8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_tapOnAchievement));
  sub_10005E5F8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_tapOnShowAllAchievements));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_roundedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_sectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_achievementTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_pillView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_badgeImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_badgeStackImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_achievementCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_showAllButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_sectionDescriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_badgeStackHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_badgeImageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_badgeImageViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_achievementTitleLabelTopMargin));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_badgeViewToSectionDescriptionMargin));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_achievementTitleLabelToStackViewConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_achievementTitleLabelToCountLabelConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_pillViewToStackViewConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp21TrophyCaseSectionCell_pillViewToCountLabelConstraint);
}

@end