@interface StackDetailHeaderCell
- (_TtC10FitnessApp21StackDetailHeaderCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp21StackDetailHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)navigateToPlaylist;
@end

@implementation StackDetailHeaderCell

- (_TtC10FitnessApp21StackDetailHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp21StackDetailHeaderCell *)sub_10035F044(a3, (uint64_t)a4, v6);
}

- (void)navigateToPlaylist
{
  v2 = self;
  sub_10035FDF0();
}

- (_TtC10FitnessApp21StackDetailHeaderCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10036069C();
}

- (void).cxx_destruct
{
  sub_10036063C((uint64_t)self + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell_stackViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell____lazy_storage___imageViewWidthConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp21StackDetailHeaderCell____lazy_storage___imageViewHeightConstraint);
}

@end