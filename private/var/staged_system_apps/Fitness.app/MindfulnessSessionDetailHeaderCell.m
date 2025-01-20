@interface MindfulnessSessionDetailHeaderCell
- (_TtC10FitnessApp34MindfulnessSessionDetailHeaderCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp34MindfulnessSessionDetailHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)navigateToCatalogItem;
@end

@implementation MindfulnessSessionDetailHeaderCell

- (_TtC10FitnessApp34MindfulnessSessionDetailHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp34MindfulnessSessionDetailHeaderCell *)sub_1006AA594(a3, (uint64_t)a4, v6);
}

- (void)navigateToCatalogItem
{
  v2 = self;
  sub_1006ABA28();
}

- (_TtC10FitnessApp34MindfulnessSessionDetailHeaderCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006AEF70();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell_mindfulnessSessionViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell____lazy_storage___imageViewWidthConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp34MindfulnessSessionDetailHeaderCell____lazy_storage___imageViewHeightConstraint);
}

@end