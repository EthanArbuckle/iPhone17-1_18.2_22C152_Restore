@interface AddToYourRingSectionHeaderView
- (_TtC10FitnessApp30AddToYourRingSectionHeaderView)initWithCoder:(id)a3;
- (_TtC10FitnessApp30AddToYourRingSectionHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation AddToYourRingSectionHeaderView

- (_TtC10FitnessApp30AddToYourRingSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp30AddToYourRingSectionHeaderView *)sub_100214A04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp30AddToYourRingSectionHeaderView)initWithCoder:(id)a3
{
  return (_TtC10FitnessApp30AddToYourRingSectionHeaderView *)sub_100214B28(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30AddToYourRingSectionHeaderView_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp30AddToYourRingSectionHeaderView____lazy_storage___titleLabelHeightConstraint);
}

@end