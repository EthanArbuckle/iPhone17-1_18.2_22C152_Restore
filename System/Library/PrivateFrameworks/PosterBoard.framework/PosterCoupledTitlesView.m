@interface PosterCoupledTitlesView
- (_TtC11PosterBoard23PosterCoupledTitlesView)initWithCoder:(id)a3;
- (_TtC11PosterBoard23PosterCoupledTitlesView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PosterCoupledTitlesView

- (_TtC11PosterBoard23PosterCoupledTitlesView)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard23PosterCoupledTitlesView *)sub_1D32D23E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard23PosterCoupledTitlesView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard23PosterCoupledTitlesView_titleLabelSpacingFromTopEdge) = (Class)0x4042000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard23PosterCoupledTitlesView_footerLabelSpacingFromBottomEdge) = (Class)0x4024000000000000;
  id v4 = a3;

  result = (_TtC11PosterBoard23PosterCoupledTitlesView *)sub_1D3372A88();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1D32D2B80();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard23PosterCoupledTitlesView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard23PosterCoupledTitlesView_lockFooterLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard23PosterCoupledTitlesView_homeFooterLabel);
}

@end